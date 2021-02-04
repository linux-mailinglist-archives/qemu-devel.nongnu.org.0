Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 491C330F6D2
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 16:54:02 +0100 (CET)
Received: from localhost ([::1]:38818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7gxF-0007z4-8b
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 10:54:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l7gpU-0000CO-HP
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 10:46:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l7gpS-00058j-5D
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 10:46:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612453557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IkDsxoMIKFKnoL+RVEgzaXhmPGbYJsnkH7Qco2HyrV4=;
 b=eWOXt8yEUiYa/kBM3Bk6XF3lE76Ajg1S+MCk9N2nPx/c2KGUtqDBKf7m5MsVJvjmcsQWf5
 RLdvRbRfetOj6Jl9Mk76v9Bm9XkT/P9oVTERm8+/lY3p9fjFVhLK7Kw3GIY6v9u7EalOZO
 NSkC1r9HaDArXwiSRrNDphXz8mCpjUo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-2WtuKgr9M2qBsMLEhSQAxQ-1; Thu, 04 Feb 2021 10:45:53 -0500
X-MC-Unique: 2WtuKgr9M2qBsMLEhSQAxQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BCBA0801961;
 Thu,  4 Feb 2021 15:45:51 +0000 (UTC)
Received: from localhost (ovpn-115-89.ams2.redhat.com [10.36.115.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0FFE6197FA;
 Thu,  4 Feb 2021 15:45:39 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL v2 13/27] io: add qio_channel_writev_full_all helper
Date: Thu,  4 Feb 2021 15:43:13 +0000
Message-Id: <20210204154327.386529-14-stefanha@redhat.com>
In-Reply-To: <20210204154327.386529-1-stefanha@redhat.com>
References: <20210204154327.386529-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>, Thomas Huth <thuth@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
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


