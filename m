Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6B02972D6
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Oct 2020 17:49:10 +0200 (CEST)
Received: from localhost ([::1]:48104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVzJV-00067n-8Y
	for lists+qemu-devel@lfdr.de; Fri, 23 Oct 2020 11:49:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kVyun-0006bm-8o
 for qemu-devel@nongnu.org; Fri, 23 Oct 2020 11:23:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24391)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kVyul-0000qw-GR
 for qemu-devel@nongnu.org; Fri, 23 Oct 2020 11:23:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603466614;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oTHycSRmLA65HL97g9avNjqsTxBZTSW/qVBAreWcHcU=;
 b=Rjd2zgGzK0tWBxXuBHtewyH2Pv4y8nAnDjAp4uwAWT2uhbAfqmVAgJftGDMlpGNhzyU9lS
 nVW8ZE0nhiZsu8cut40z50qHIvk0awBGBt56HQcyoe7PXm31L+k6cBn/QVMEmaaJTzBjC2
 VfDxkU3E/o0YNRea84CL90Nk40z6QUY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-_JWxZGgWPhK6CCVsUvVL-w-1; Fri, 23 Oct 2020 11:23:30 -0400
X-MC-Unique: _JWxZGgWPhK6CCVsUvVL-w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2BDF15F9F6;
 Fri, 23 Oct 2020 15:23:29 +0000 (UTC)
Received: from localhost (ovpn-114-178.ams2.redhat.com [10.36.114.178])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 661C46EF6B;
 Fri, 23 Oct 2020 15:22:55 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL v3 13/28] util/vhost-user-server: fix memory leak in
 vu_message_read()
Date: Fri, 23 Oct 2020 16:21:32 +0100
Message-Id: <20201023152147.1016281-14-stefanha@redhat.com>
In-Reply-To: <20201023152147.1016281-1-stefanha@redhat.com>
References: <20201023152147.1016281-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/23 01:44:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Coiby Xu <Coiby.Xu@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ZmRzW10gaXMgbGVha2VkIHdoZW4gcWlvX2NoYW5uZWxfcmVhZHZfZnVsbCgpIGZhaWxzLgoKVXNl
IHZtc2ctPmZkc1tdIGluc3RlYWQgb2Yga2VlcGluZyBhIGxvY2FsIGZkc1tdIGFycmF5LiBUaGVu
IHdlIGNhbgpyZXVzZSBnb3RvIGZhaWwgdG8gY2xlYW4gdXAgZmRzLiB2bXNnLT5mZF9udW0gbXVz
dCBiZSB6ZXJvZWQgYmVmb3JlIHRoZQpsb29wIHRvIG1ha2UgdGhpcyBzYWZlLgoKU2lnbmVkLW9m
Zi1ieTogU3RlZmFuIEhham5vY3ppIDxzdGVmYW5oYUByZWRoYXQuY29tPgpNZXNzYWdlLWlkOiAy
MDIwMDkyNDE1MTU0OS45MTM3MzctOC1zdGVmYW5oYUByZWRoYXQuY29tClNpZ25lZC1vZmYtYnk6
IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4KLS0tCiB1dGlsL3Zob3N0LXVz
ZXItc2VydmVyLmMgfCA1MCArKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0t
CiAxIGZpbGUgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgMjcgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvdXRpbC92aG9zdC11c2VyLXNlcnZlci5jIGIvdXRpbC92aG9zdC11c2VyLXNlcnZl
ci5jCmluZGV4IDczYTE2NjdiNTQuLmE3YjdhOTg5N2YgMTAwNjQ0Ci0tLSBhL3V0aWwvdmhvc3Qt
dXNlci1zZXJ2ZXIuYworKysgYi91dGlsL3Zob3N0LXVzZXItc2VydmVyLmMKQEAgLTEwMCwyMSAr
MTAwLDExIEBAIHZ1X21lc3NhZ2VfcmVhZChWdURldiAqdnVfZGV2LCBpbnQgY29ubl9mZCwgVmhv
c3RVc2VyTXNnICp2bXNnKQogICAgIH07CiAgICAgaW50IHJjLCByZWFkX2J5dGVzID0gMDsKICAg
ICBFcnJvciAqbG9jYWxfZXJyID0gTlVMTDsKLSAgICAvKgotICAgICAqIFN0b3JlIGZkcy9uZmRz
IHJldHVybmVkIGZyb20gcWlvX2NoYW5uZWxfcmVhZHZfZnVsbCBpbnRvCi0gICAgICogdGVtcG9y
YXJ5IHZhcmlhYmxlcy4KLSAgICAgKgotICAgICAqIFZob3N0VXNlck1zZyBpcyBhIHBhY2tlZCBz
dHJ1Y3R1cmUsIGdjYyB3aWxsIGNvbXBsYWluIGFib3V0IHBhc3NpbmcKLSAgICAgKiBwb2ludGVy
IHRvIGEgcGFja2VkIHN0cnVjdHVyZSBtZW1iZXIgaWYgd2UgcGFzcyAmVmhvc3RVc2VyTXNnLmZk
X251bQotICAgICAqIGFuZCAmVmhvc3RVc2VyTXNnLmZkcyBkaXJlY3RseSB3aGVuIGNhbGxpbmcg
cWlvX2NoYW5uZWxfcmVhZHZfZnVsbCwKLSAgICAgKiB0aHVzIHR3byB0ZW1wb3JhcnkgdmFyaWFi
bGVzIG5mZHMgYW5kIGZkcyBhcmUgdXNlZCBoZXJlLgotICAgICAqLwotICAgIHNpemVfdCBuZmRz
ID0gMCwgbmZkc190ID0gMDsKICAgICBjb25zdCBzaXplX3QgbWF4X2ZkcyA9IEdfTl9FTEVNRU5U
Uyh2bXNnLT5mZHMpOwotICAgIGludCAqZmRzX3QgPSBOVUxMOwogICAgIFZ1U2VydmVyICpzZXJ2
ZXIgPSBjb250YWluZXJfb2YodnVfZGV2LCBWdVNlcnZlciwgdnVfZGV2KTsKICAgICBRSU9DaGFu
bmVsICppb2MgPSBzZXJ2ZXItPmlvYzsKIAorICAgIHZtc2ctPmZkX251bSA9IDA7CiAgICAgaWYg
KCFpb2MpIHsKICAgICAgICAgZXJyb3JfcmVwb3J0X2Vycihsb2NhbF9lcnIpOwogICAgICAgICBn
b3RvIGZhaWw7CkBAIC0xMjIsNDEgKzExMiw0NyBAQCB2dV9tZXNzYWdlX3JlYWQoVnVEZXYgKnZ1
X2RldiwgaW50IGNvbm5fZmQsIFZob3N0VXNlck1zZyAqdm1zZykKIAogICAgIGFzc2VydChxZW11
X2luX2Nvcm91dGluZSgpKTsKICAgICBkbyB7CisgICAgICAgIHNpemVfdCBuZmRzID0gMDsKKyAg
ICAgICAgaW50ICpmZHMgPSBOVUxMOworCiAgICAgICAgIC8qCiAgICAgICAgICAqIHFpb19jaGFu
bmVsX3JlYWR2X2Z1bGwgbWF5IGhhdmUgc2hvcnQgcmVhZHMsIGtlZXBpbmcgY2FsbGluZyBpdAog
ICAgICAgICAgKiB1bnRpbCBnZXR0aW5nIFZIT1NUX1VTRVJfSERSX1NJWkUgb3IgMCBieXRlcyBp
biB0b3RhbAogICAgICAgICAgKi8KLSAgICAgICAgcmMgPSBxaW9fY2hhbm5lbF9yZWFkdl9mdWxs
KGlvYywgJmlvdiwgMSwgJmZkc190LCAmbmZkc190LCAmbG9jYWxfZXJyKTsKKyAgICAgICAgcmMg
PSBxaW9fY2hhbm5lbF9yZWFkdl9mdWxsKGlvYywgJmlvdiwgMSwgJmZkcywgJm5mZHMsICZsb2Nh
bF9lcnIpOwogICAgICAgICBpZiAocmMgPCAwKSB7CiAgICAgICAgICAgICBpZiAocmMgPT0gUUlP
X0NIQU5ORUxfRVJSX0JMT0NLKSB7CisgICAgICAgICAgICAgICAgYXNzZXJ0KGxvY2FsX2VyciA9
PSBOVUxMKTsKICAgICAgICAgICAgICAgICBxaW9fY2hhbm5lbF95aWVsZChpb2MsIEdfSU9fSU4p
OwogICAgICAgICAgICAgICAgIGNvbnRpbnVlOwogICAgICAgICAgICAgfSBlbHNlIHsKICAgICAg
ICAgICAgICAgICBlcnJvcl9yZXBvcnRfZXJyKGxvY2FsX2Vycik7Ci0gICAgICAgICAgICAgICAg
cmV0dXJuIGZhbHNlOworICAgICAgICAgICAgICAgIGdvdG8gZmFpbDsKICAgICAgICAgICAgIH0K
ICAgICAgICAgfQotICAgICAgICByZWFkX2J5dGVzICs9IHJjOwotICAgICAgICBpZiAobmZkc190
ID4gMCkgewotICAgICAgICAgICAgaWYgKG5mZHMgKyBuZmRzX3QgPiBtYXhfZmRzKSB7CisKKyAg
ICAgICAgaWYgKG5mZHMgPiAwKSB7CisgICAgICAgICAgICBpZiAodm1zZy0+ZmRfbnVtICsgbmZk
cyA+IG1heF9mZHMpIHsKICAgICAgICAgICAgICAgICBlcnJvcl9yZXBvcnQoIkEgbWF4aW11bSBv
ZiAlenUgZmRzIGFyZSBhbGxvd2VkLCAiCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJo
b3dldmVyIGdvdCAlenUgZmRzIG5vdyIsCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgIG1h
eF9mZHMsIG5mZHMgKyBuZmRzX3QpOworICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtYXhf
ZmRzLCB2bXNnLT5mZF9udW0gKyBuZmRzKTsKKyAgICAgICAgICAgICAgICBnX2ZyZWUoZmRzKTsK
ICAgICAgICAgICAgICAgICBnb3RvIGZhaWw7CiAgICAgICAgICAgICB9Ci0gICAgICAgICAgICBt
ZW1jcHkodm1zZy0+ZmRzICsgbmZkcywgZmRzX3QsCi0gICAgICAgICAgICAgICAgICAgbmZkc190
ICpzaXplb2Yodm1zZy0+ZmRzWzBdKSk7Ci0gICAgICAgICAgICBuZmRzICs9IG5mZHNfdDsKLSAg
ICAgICAgICAgIGdfZnJlZShmZHNfdCk7CisgICAgICAgICAgICBtZW1jcHkodm1zZy0+ZmRzICsg
dm1zZy0+ZmRfbnVtLCBmZHMsIG5mZHMgKiBzaXplb2Yodm1zZy0+ZmRzWzBdKSk7CisgICAgICAg
ICAgICB2bXNnLT5mZF9udW0gKz0gbmZkczsKKyAgICAgICAgICAgIGdfZnJlZShmZHMpOwogICAg
ICAgICB9Ci0gICAgICAgIGlmIChyZWFkX2J5dGVzID09IFZIT1NUX1VTRVJfSERSX1NJWkUgfHwg
cmMgPT0gMCkgewotICAgICAgICAgICAgYnJlYWs7CisKKyAgICAgICAgaWYgKHJjID09IDApIHsg
Lyogc29ja2V0IGNsb3NlZCAqLworICAgICAgICAgICAgZ290byBmYWlsOwogICAgICAgICB9Ci0g
ICAgICAgIGlvdi5pb3ZfYmFzZSA9IChjaGFyICopdm1zZyArIHJlYWRfYnl0ZXM7Ci0gICAgICAg
IGlvdi5pb3ZfbGVuID0gVkhPU1RfVVNFUl9IRFJfU0laRSAtIHJlYWRfYnl0ZXM7Ci0gICAgfSB3
aGlsZSAodHJ1ZSk7CiAKLSAgICB2bXNnLT5mZF9udW0gPSBuZmRzOworICAgICAgICBpb3YuaW92
X2Jhc2UgKz0gcmM7CisgICAgICAgIGlvdi5pb3ZfbGVuIC09IHJjOworICAgICAgICByZWFkX2J5
dGVzICs9IHJjOworICAgIH0gd2hpbGUgKHJlYWRfYnl0ZXMgIT0gVkhPU1RfVVNFUl9IRFJfU0la
RSk7CisKICAgICAvKiBxaW9fY2hhbm5lbF9yZWFkdl9mdWxsIHdpbGwgbWFrZSBzb2NrZXQgZmRz
IGJsb2NraW5nLCB1bmJsb2NrIHRoZW0gKi8KICAgICB2bXNnX3VuYmxvY2tfZmRzKHZtc2cpOwog
ICAgIGlmICh2bXNnLT5zaXplID4gc2l6ZW9mKHZtc2ctPnBheWxvYWQpKSB7Ci0tIAoyLjI2LjIK
Cg==


