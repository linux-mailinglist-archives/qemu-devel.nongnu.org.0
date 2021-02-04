Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8945D30F071
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 11:23:56 +0100 (CET)
Received: from localhost ([::1]:48824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7bnn-00063j-Jz
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 05:23:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l7bRr-0004St-FO
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 05:01:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l7bRn-00014Y-KI
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 05:01:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612432857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IkDsxoMIKFKnoL+RVEgzaXhmPGbYJsnkH7Qco2HyrV4=;
 b=CmYfnKTdyCwocDDnuDKIdEwQ1FwX/K0azV+BFWNtjpNehNRs3QYyLHezKOqDp11jxDPi3X
 /tGeRAHUm9hwOzlTC1/WtFvfUcuNEk5OMtLlwkaHz+Lw1Uxf9fszLKLS25FxoiVCGRFi/v
 2DbOTBt/9Ty8o7LjGxRAzRswiERiXCU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-517-7DzKHZ1wMUOan7PW4ezdtA-1; Thu, 04 Feb 2021 05:00:55 -0500
X-MC-Unique: 7DzKHZ1wMUOan7PW4ezdtA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 08D4F107ACC7;
 Thu,  4 Feb 2021 10:00:54 +0000 (UTC)
Received: from localhost (ovpn-115-89.ams2.redhat.com [10.36.115.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E70D65B697;
 Thu,  4 Feb 2021 10:00:44 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 13/27] io: add qio_channel_writev_full_all helper
Date: Thu,  4 Feb 2021 09:58:20 +0000
Message-Id: <20210204095834.345749-14-stefanha@redhat.com>
In-Reply-To: <20210204095834.345749-1-stefanha@redhat.com>
References: <20210204095834.345749-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 John G Johnson <john.g.johnson@oracle.com>, "Denis V. Lunev" <den@openvz.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Jagannathan Raman <jag.raman@oracle.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogRWxlbmEgVWZpbXRzZXZhIDxlbGVuYS51ZmltdHNldmFAb3JhY2xlLmNvbT4KCkFkZHMg
cWlvX2NoYW5uZWxfd3JpdGV2X2Z1bGxfYWxsKCkgdG8gdHJhbnNtaXQgYm90aCBkYXRhIGFuZCBG
RHMuClJlZmFjdG9ycyBleGlzdGluZyBjb2RlIHRvIHVzZSB0aGlzIGhlbHBlci4KClNpZ25lZC1v
ZmYtYnk6IEVsZW5hIFVmaW10c2V2YSA8ZWxlbmEudWZpbXRzZXZhQG9yYWNsZS5jb20+ClNpZ25l
ZC1vZmYtYnk6IEpvaG4gRyBKb2huc29uIDxqb2huLmcuam9obnNvbkBvcmFjbGUuY29tPgpTaWdu
ZWQtb2ZmLWJ5OiBKYWdhbm5hdGhhbiBSYW1hbiA8amFnLnJhbWFuQG9yYWNsZS5jb20+ClJldmll
d2VkLWJ5OiBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJlZGhhdC5jb20+CkFja2VkLWJ5OiBE
YW5pZWwgUC4gQmVycmFuZ8OpIDxiZXJyYW5nZUByZWRoYXQuY29tPgpNZXNzYWdlLWlkOiA0ODBm
YmYxZmU0MTUyNDk1ZDYwNTk2YzliNjY1MTI0NTQ5YjQyNmE1LjE2MTE5MzgzMTkuZ2l0LmphZy5y
YW1hbkBvcmFjbGUuY29tClNpZ25lZC1vZmYtYnk6IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFA
cmVkaGF0LmNvbT4KLS0tCiBpbmNsdWRlL2lvL2NoYW5uZWwuaCB8IDI1ICsrKysrKysrKysrKysr
KysrKysrKysrKysKIGlvL2NoYW5uZWwuYyAgICAgICAgIHwgMTUgKysrKysrKysrKysrKystCiAy
IGZpbGVzIGNoYW5nZWQsIDM5IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS9pbmNsdWRlL2lvL2NoYW5uZWwuaCBiL2luY2x1ZGUvaW8vY2hhbm5lbC5oCmluZGV4IGFi
OWVhNzc5NTkuLjE5ZTc2ZmMzMmYgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvaW8vY2hhbm5lbC5oCisr
KyBiL2luY2x1ZGUvaW8vY2hhbm5lbC5oCkBAIC03NzcsNCArNzc3LDI5IEBAIHZvaWQgcWlvX2No
YW5uZWxfc2V0X2Fpb19mZF9oYW5kbGVyKFFJT0NoYW5uZWwgKmlvYywKICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIElPSGFuZGxlciAqaW9fd3JpdGUsCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB2b2lkICpvcGFxdWUpOwogCisvKioKKyAqIHFpb19jaGFu
bmVsX3dyaXRldl9mdWxsX2FsbDoKKyAqIEBpb2M6IHRoZSBjaGFubmVsIG9iamVjdAorICogQGlv
djogdGhlIGFycmF5IG9mIG1lbW9yeSByZWdpb25zIHRvIHdyaXRlIGRhdGEgZnJvbQorICogQG5p
b3Y6IHRoZSBsZW5ndGggb2YgdGhlIEBpb3YgYXJyYXkKKyAqIEBmZHM6IGFuIGFycmF5IG9mIGZp
bGUgaGFuZGxlcyB0byBzZW5kCisgKiBAbmZkczogbnVtYmVyIG9mIGZpbGUgaGFuZGxlcyBpbiBA
ZmRzCisgKiBAZXJycDogcG9pbnRlciB0byBhIE5VTEwtaW5pdGlhbGl6ZWQgZXJyb3Igb2JqZWN0
CisgKgorICoKKyAqIEJlaGF2ZXMgbGlrZSBxaW9fY2hhbm5lbF93cml0ZXZfZnVsbCBidXQgd2ls
bCBhdHRlbXB0CisgKiB0byBzZW5kIGFsbCBkYXRhIHBhc3NlZCAoZmlsZSBoYW5kbGVzIGFuZCBt
ZW1vcnkgcmVnaW9ucykuCisgKiBUaGUgZnVuY3Rpb24gd2lsbCB3YWl0IGZvciBhbGwgcmVxdWVz
dGVkIGRhdGEKKyAqIHRvIGJlIHdyaXR0ZW4sIHlpZWxkaW5nIGZyb20gdGhlIGN1cnJlbnQgY29y
b3V0aW5lCisgKiBpZiByZXF1aXJlZC4KKyAqCisgKiBSZXR1cm5zOiAwIGlmIGFsbCBieXRlcyB3
ZXJlIHdyaXR0ZW4sIG9yIC0xIG9uIGVycm9yCisgKi8KKworaW50IHFpb19jaGFubmVsX3dyaXRl
dl9mdWxsX2FsbChRSU9DaGFubmVsICppb2MsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGNvbnN0IHN0cnVjdCBpb3ZlYyAqaW92LAorICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBzaXplX3QgbmlvdiwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW50ICpm
ZHMsIHNpemVfdCBuZmRzLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBFcnJvciAq
KmVycnApOworCiAjZW5kaWYgLyogUUlPX0NIQU5ORUxfSCAqLwpkaWZmIC0tZ2l0IGEvaW8vY2hh
bm5lbC5jIGIvaW8vY2hhbm5lbC5jCmluZGV4IDkzZDQ0OWRlZTIuLjBkNGI4YjUxNjAgMTAwNjQ0
Ci0tLSBhL2lvL2NoYW5uZWwuYworKysgYi9pby9jaGFubmVsLmMKQEAgLTE1Niw2ICsxNTYsMTUg
QEAgaW50IHFpb19jaGFubmVsX3dyaXRldl9hbGwoUUlPQ2hhbm5lbCAqaW9jLAogICAgICAgICAg
ICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IGlvdmVjICppb3YsCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBzaXplX3QgbmlvdiwKICAgICAgICAgICAgICAgICAgICAgICAgICAgIEVy
cm9yICoqZXJycCkKK3sKKyAgICByZXR1cm4gcWlvX2NoYW5uZWxfd3JpdGV2X2Z1bGxfYWxsKGlv
YywgaW92LCBuaW92LCBOVUxMLCAwLCBlcnJwKTsKK30KKworaW50IHFpb19jaGFubmVsX3dyaXRl
dl9mdWxsX2FsbChRSU9DaGFubmVsICppb2MsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGNvbnN0IHN0cnVjdCBpb3ZlYyAqaW92LAorICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBzaXplX3QgbmlvdiwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW50ICpm
ZHMsIHNpemVfdCBuZmRzLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBFcnJvciAq
KmVycnApCiB7CiAgICAgaW50IHJldCA9IC0xOwogICAgIHN0cnVjdCBpb3ZlYyAqbG9jYWxfaW92
ID0gZ19uZXcoc3RydWN0IGlvdmVjLCBuaW92KTsKQEAgLTE2OCw3ICsxNzcsOCBAQCBpbnQgcWlv
X2NoYW5uZWxfd3JpdGV2X2FsbChRSU9DaGFubmVsICppb2MsCiAKICAgICB3aGlsZSAobmxvY2Fs
X2lvdiA+IDApIHsKICAgICAgICAgc3NpemVfdCBsZW47Ci0gICAgICAgIGxlbiA9IHFpb19jaGFu
bmVsX3dyaXRldihpb2MsIGxvY2FsX2lvdiwgbmxvY2FsX2lvdiwgZXJycCk7CisgICAgICAgIGxl
biA9IHFpb19jaGFubmVsX3dyaXRldl9mdWxsKGlvYywgbG9jYWxfaW92LCBubG9jYWxfaW92LCBm
ZHMsIG5mZHMsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGVycnApOwog
ICAgICAgICBpZiAobGVuID09IFFJT19DSEFOTkVMX0VSUl9CTE9DSykgewogICAgICAgICAgICAg
aWYgKHFlbXVfaW5fY29yb3V0aW5lKCkpIHsKICAgICAgICAgICAgICAgICBxaW9fY2hhbm5lbF95
aWVsZChpb2MsIEdfSU9fT1VUKTsKQEAgLTE4Miw2ICsxOTIsOSBAQCBpbnQgcWlvX2NoYW5uZWxf
d3JpdGV2X2FsbChRSU9DaGFubmVsICppb2MsCiAgICAgICAgIH0KIAogICAgICAgICBpb3ZfZGlz
Y2FyZF9mcm9udCgmbG9jYWxfaW92LCAmbmxvY2FsX2lvdiwgbGVuKTsKKworICAgICAgICBmZHMg
PSBOVUxMOworICAgICAgICBuZmRzID0gMDsKICAgICB9CiAKICAgICByZXQgPSAwOwotLSAKMi4y
OS4yCgo=


