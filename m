Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8352AF13B
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 13:50:33 +0100 (CET)
Received: from localhost ([::1]:55742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcpa4-0006HM-Nk
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 07:50:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kcpUU-0007fS-IM
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 07:44:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kcpUS-0001GL-N8
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 07:44:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605098683;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kopQcfkwfJuwz+QnLgcxCfXpbvTQhWMr93pGIZMkzHg=;
 b=gvHg3JUV4eiNN3N0kThQNaLchBtKRrzAeBlXfUCME8pSP9Ht7LwSWUrrBOh63qtSE93ZvK
 KntI9Zzrui6fxs8x+sme8ca1Ms0lp3ej+AbEUXpmETkuFiG7d9G4quGTh0G6yGuBmMYkAB
 7Jt4DzxnYYC9CzoNnhAZwlq8WterLfE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-9rVaQJpFOsChJa0z8b60UA-1; Wed, 11 Nov 2020 07:44:42 -0500
X-MC-Unique: 9rVaQJpFOsChJa0z8b60UA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2713264160;
 Wed, 11 Nov 2020 12:44:41 +0000 (UTC)
Received: from localhost (ovpn-112-222.ams2.redhat.com [10.36.112.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B0B5F27BBB;
 Wed, 11 Nov 2020 12:44:34 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-5.2 07/10] vhost-user-blk-test: fix races by using fd
 passing
Date: Wed, 11 Nov 2020 12:43:28 +0000
Message-Id: <20201111124331.1393747-8-stefanha@redhat.com>
In-Reply-To: <20201111124331.1393747-1-stefanha@redhat.com>
References: <20201111124331.1393747-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:42:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Coiby Xu <Coiby.Xu@gmail.com>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGFzcyB0aGUgUU1QIGFuZCB2aG9zdC11c2VyLWJsayBzZXJ2ZXIgc29ja2V0cyBhcyBmaWxlIGRl
c2NyaXB0b3JzLiBUaGF0CndheSB0aGUgc29ja2V0cyBhcmUgYWxyZWFkeSBvcGVuIGFuZCBpbiBh
IGxpc3RlbiBzdGF0ZSB3aGVuIHRoZSBRRU1VCnByb2Nlc3MgaXMgbGF1bmNoZWQuCgpUaGlzIHNv
bHZlcyB0aGUgcmFjZSB3aXRoIHFlbXUtc3RvcmFnZS1kYWVtb24gc3RhcnR1cCB3aGVyZSB0aGUg
VU5JWApkb21haW4gc29ja2V0cyBtYXkgbm90IGJlIHJlYWR5IHlldCB3aGVuIFFFTVUgYXR0ZW1w
dHMgdG8gY29ubmVjdC4gSXQKYWxzbyBzYXZlcyB1cyBzbGVlcGluZyBmb3IgMSBzZWNvbmQgaWYg
dGhlIHFlbXUtc3RvcmFnZS1kYWVtb24gUU1QCnNvY2tldCBpcyBub3QgcmVhZHkgeWV0LgoKU2ln
bmVkLW9mZi1ieTogU3RlZmFuIEhham5vY3ppIDxzdGVmYW5oYUByZWRoYXQuY29tPgotLS0KIHRl
c3RzL3F0ZXN0L3Zob3N0LXVzZXItYmxrLXRlc3QuYyB8IDQyICsrKysrKysrKysrKysrKysrKyst
LS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspLCAxNiBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS90ZXN0cy9xdGVzdC92aG9zdC11c2VyLWJsay10ZXN0LmMgYi90
ZXN0cy9xdGVzdC92aG9zdC11c2VyLWJsay10ZXN0LmMKaW5kZXggYzVmZjYxMGQ3YS4uZTUyMzQw
Y2ZmYiAxMDA2NDQKLS0tIGEvdGVzdHMvcXRlc3Qvdmhvc3QtdXNlci1ibGstdGVzdC5jCisrKyBi
L3Rlc3RzL3F0ZXN0L3Zob3N0LXVzZXItYmxrLXRlc3QuYwpAQCAtNjgzLDggKzY4MywyMiBAQCBz
dGF0aWMgY2hhciAqZHJpdmVfY3JlYXRlKHZvaWQpCiAgICAgcmV0dXJuIHRfcGF0aDsKIH0KIAot
c3RhdGljIGNoYXIgc29ja19wYXRoX3RlbXBhdGVbXSA9ICIvdG1wL3F0ZXN0LnZob3N0X3VzZXJf
YmxrLlhYWFhYWCI7Ci1zdGF0aWMgY2hhciBxbXBfc29ja19wYXRoX3RlbXBhdGVbXSA9ICIvdG1w
L3F0ZXN0LnZob3N0X3VzZXJfYmxrLnFtcC5YWFhYWFgiOworc3RhdGljIGNoYXIgKmNyZWF0ZV9s
aXN0ZW5fc29ja2V0KGludCAqZmQpCit7CisgICAgaW50IHRtcF9mZDsKKyAgICBjaGFyICpwYXRo
OworCisgICAgLyogTm8gcmFjZSBiZWNhdXNlIG91ciBwaWQgbWFrZXMgdGhlIHBhdGggdW5pcXVl
ICovCisgICAgcGF0aCA9IGdfc3RyZHVwX3ByaW50ZigiL3RtcC9xdGVzdC0lZC1zb2NrLlhYWFhY
WCIsIGdldHBpZCgpKTsKKyAgICB0bXBfZmQgPSBta3N0ZW1wKHBhdGgpOworICAgIGdfYXNzZXJ0
X2NtcGludCh0bXBfZmQsID49LCAwKTsKKyAgICBjbG9zZSh0bXBfZmQpOworICAgIHVubGluayhw
YXRoKTsKKworICAgICpmZCA9IHF0ZXN0X3NvY2tldF9zZXJ2ZXIocGF0aCk7CisgICAgZ190ZXN0
X3F1ZXVlX2Rlc3Ryb3koZGVzdHJveV9maWxlLCBwYXRoKTsKKyAgICByZXR1cm4gcGF0aDsKK30K
IAogc3RhdGljIHZvaWQgcXVpdF9zdG9yYWdlX2RhZW1vbih2b2lkICpxbXBfdGVzdF9zdGF0ZSkK
IHsKQEAgLTcwOSwzNyArNzIzLDMzIEBAIHN0YXRpYyB2b2lkIHN0YXJ0X3Zob3N0X3VzZXJfYmxr
KEdTdHJpbmcgKmNtZF9saW5lLCBpbnQgdnVzX2luc3RhbmNlcywKICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGludCBudW1fcXVldWVzKQogewogICAgIGNvbnN0IGNoYXIgKnZob3N0
X3VzZXJfYmxrX2JpbiA9IHF0ZXN0X3FlbXVfc3RvcmFnZV9kYWVtb25fYmluYXJ5KCk7Ci0gICAg
aW50IGZkLCBxbXBfZmQsIGk7CisgICAgaW50IHFtcF9mZCwgaTsKICAgICBRVGVzdFN0YXRlICpx
bXBfdGVzdF9zdGF0ZTsKICAgICBnY2hhciAqaW1nX3BhdGg7Ci0gICAgY2hhciAqc29ja19wYXRo
ID0gTlVMTDsKLSAgICBjaGFyICpxbXBfc29ja19wYXRoID0gZ19zdHJkdXAocW1wX3NvY2tfcGF0
aF90ZW1wYXRlKTsKKyAgICBjaGFyICpxbXBfc29ja19wYXRoOwogICAgIEdTdHJpbmcgKnN0b3Jh
Z2VfZGFlbW9uX2NvbW1hbmQgPSBnX3N0cmluZ19uZXcoTlVMTCk7CiAKLSAgICBxbXBfZmQgPSBt
a3N0ZW1wKHFtcF9zb2NrX3BhdGgpOwotICAgIGdfYXNzZXJ0X2NtcGludChxbXBfZmQsID49LCAw
KTsKLSAgICBnX3Rlc3RfcXVldWVfZGVzdHJveShkZXN0cm95X2ZpbGUsIHFtcF9zb2NrX3BhdGgp
OworICAgIHFtcF9zb2NrX3BhdGggPSBjcmVhdGVfbGlzdGVuX3NvY2tldCgmcW1wX2ZkKTsKIAog
ICAgIGdfc3RyaW5nX2FwcGVuZF9wcmludGYoc3RvcmFnZV9kYWVtb25fY29tbWFuZCwKICAgICAg
ICAgICAgICJleGVjICVzICIKLSAgICAgICAgICAgICItLWNoYXJkZXYgc29ja2V0LGlkPXFtcCxw
YXRoPSVzLHNlcnZlcixub3dhaXQgLS1tb25pdG9yIGNoYXJkZXY9cW1wICIsCi0gICAgICAgICAg
ICB2aG9zdF91c2VyX2Jsa19iaW4sIHFtcF9zb2NrX3BhdGgpOworICAgICAgICAgICAgIi0tY2hh
cmRldiBzb2NrZXQsaWQ9cW1wLGZkPSVkLHNlcnZlcixub3dhaXQgLS1tb25pdG9yIGNoYXJkZXY9
cW1wICIsCisgICAgICAgICAgICB2aG9zdF91c2VyX2Jsa19iaW4sIHFtcF9mZCk7CiAKICAgICBn
X3N0cmluZ19hcHBlbmRfcHJpbnRmKGNtZF9saW5lLAogICAgICAgICAgICAgIiAtb2JqZWN0IG1l
bW9yeS1iYWNrZW5kLW1lbWZkLGlkPW1lbSxzaXplPTI1Nk0sc2hhcmU9b24gLU0gbWVtb3J5LWJh
Y2tlbmQ9bWVtICIpOwogCiAgICAgZm9yIChpID0gMDsgaSA8IHZ1c19pbnN0YW5jZXM7IGkrKykg
ewotICAgICAgICBzb2NrX3BhdGggPSBnX3N0cmR1cChzb2NrX3BhdGhfdGVtcGF0ZSk7Ci0gICAg
ICAgIGZkID0gbWtzdGVtcChzb2NrX3BhdGgpOwotICAgICAgICBnX2Fzc2VydF9jbXBpbnQoZmQs
ID49LCAwKTsKLSAgICAgICAgZ190ZXN0X3F1ZXVlX2Rlc3Ryb3koZHJpdmVfZmlsZSwgc29ja19w
YXRoKTsKKyAgICAgICAgaW50IGZkOworICAgICAgICBjaGFyICpzb2NrX3BhdGggPSBjcmVhdGVf
bGlzdGVuX3NvY2tldCgmZmQpOworCiAgICAgICAgIC8qIGNyZWF0ZSBpbWFnZSBmaWxlICovCiAg
ICAgICAgIGltZ19wYXRoID0gZHJpdmVfY3JlYXRlKCk7CiAgICAgICAgIGdfc3RyaW5nX2FwcGVu
ZF9wcmludGYoc3RvcmFnZV9kYWVtb25fY29tbWFuZCwKICAgICAgICAgICAgICItLWJsb2NrZGV2
IGRyaXZlcj1maWxlLG5vZGUtbmFtZT1kaXNrJWQsZmlsZW5hbWU9JXMgIgotICAgICAgICAgICAg
Ii0tZXhwb3J0IHR5cGU9dmhvc3QtdXNlci1ibGssaWQ9ZGlzayVkLGFkZHIudHlwZT11bml4LGFk
ZHIucGF0aD0lcywiCisgICAgICAgICAgICAiLS1leHBvcnQgdHlwZT12aG9zdC11c2VyLWJsayxp
ZD1kaXNrJWQsYWRkci50eXBlPWZkLGFkZHIuc3RyPSVkLCIKICAgICAgICAgICAgICJub2RlLW5h
bWU9ZGlzayVpLHdyaXRhYmxlPW9uLG51bS1xdWV1ZXM9JWQgIiwKLSAgICAgICAgICAgIGksIGlt
Z19wYXRoLCBpLCBzb2NrX3BhdGgsIGksIG51bV9xdWV1ZXMpOworICAgICAgICAgICAgaSwgaW1n
X3BhdGgsIGksIGZkLCBpLCBudW1fcXVldWVzKTsKIAogICAgICAgICBnX3N0cmluZ19hcHBlbmRf
cHJpbnRmKGNtZF9saW5lLCAiLWNoYXJkZXYgc29ja2V0LGlkPWNoYXIlZCxwYXRoPSVzICIsCiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaSArIDEsIHNvY2tfcGF0aCk7Ci0tIAoyLjI4
LjAKCg==


