Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4578F295DF3
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Oct 2020 14:04:16 +0200 (CEST)
Received: from localhost ([::1]:39316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVZKJ-00053I-Bn
	for lists+qemu-devel@lfdr.de; Thu, 22 Oct 2020 08:04:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kVYnE-0006gm-IE
 for qemu-devel@nongnu.org; Thu, 22 Oct 2020 07:30:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57214)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kVYn4-0005DW-K3
 for qemu-devel@nongnu.org; Thu, 22 Oct 2020 07:30:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603366190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qFGmSQHsWrrOfWOH+/peX5MRwaUCO4cXU4Gw5k/UjVE=;
 b=F+IY6cHFo5VL7WnBuTuYSKwglTSH1XkxWk93jrJ4kOOVVjT4xgpZGH4wGjkisDJU5Zeou6
 dQRoVW9AKOKkvyDvECCCBvXt72/+kchZI1Z/XHsNCV8R4jJlzIxhKNrRVBp2belL895Eyz
 GLRMV519xN1m80teiFUgjsIy+QFk+K0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-rCPiPFv-OFiyoenwopvM2A-1; Thu, 22 Oct 2020 07:29:46 -0400
X-MC-Unique: rCPiPFv-OFiyoenwopvM2A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0367F804B62;
 Thu, 22 Oct 2020 11:29:45 +0000 (UTC)
Received: from localhost (ovpn-114-229.ams2.redhat.com [10.36.114.229])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D16536EF69;
 Thu, 22 Oct 2020 11:29:41 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL v2 25/28] block/io: bdrv_common_block_status_above: support
 include_base
Date: Thu, 22 Oct 2020 12:27:23 +0100
Message-Id: <20201022112726.736757-26-stefanha@redhat.com>
In-Reply-To: <20201022112726.736757-1-stefanha@redhat.com>
References: <20201022112726.736757-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/22 06:53:39
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Coiby Xu <Coiby.Xu@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Alberto Garcia <berto@igalia.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogVmxhZGltaXIgU2VtZW50c292LU9naWV2c2tpeSA8dnNlbWVudHNvdkB2aXJ0dW96em8u
Y29tPgoKSW4gb3JkZXIgdG8gcmV1c2UgYmRydl9jb21tb25fYmxvY2tfc3RhdHVzX2Fib3ZlIGlu
CmJkcnZfaXNfYWxsb2NhdGVkX2Fib3ZlLCBsZXQncyBzdXBwb3J0IGluY2x1ZGVfYmFzZSBwYXJh
bWV0ZXIuCgpTaWduZWQtb2ZmLWJ5OiBWbGFkaW1pciBTZW1lbnRzb3YtT2dpZXZza2l5IDx2c2Vt
ZW50c292QHZpcnR1b3p6by5jb20+ClJldmlld2VkLWJ5OiBBbGJlcnRvIEdhcmNpYSA8YmVydG9A
aWdhbGlhLmNvbT4KUmV2aWV3ZWQtYnk6IEVyaWMgQmxha2UgPGVibGFrZUByZWRoYXQuY29tPgpN
ZXNzYWdlLWlkOiAyMDIwMDkyNDE5NDAwMy4yMjA4MC0zLXZzZW1lbnRzb3ZAdmlydHVvenpvLmNv
bQpTaWduZWQtb2ZmLWJ5OiBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJlZGhhdC5jb20+Ci0t
LQogYmxvY2svY29yb3V0aW5lcy5oIHwgIDIgKysKIGJsb2NrL2lvLmMgICAgICAgICB8IDIxICsr
KysrKysrKysrKysrLS0tLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCA3
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Jsb2NrL2Nvcm91dGluZXMuaCBiL2Jsb2NrL2Nv
cm91dGluZXMuaAppbmRleCBmNjkxNzlmNWVmLi4xY2IzMTI4Yjk0IDEwMDY0NAotLS0gYS9ibG9j
ay9jb3JvdXRpbmVzLmgKKysrIGIvYmxvY2svY29yb3V0aW5lcy5oCkBAIC00MSw2ICs0MSw3IEBA
IGJkcnZfcHdyaXRldihCZHJ2Q2hpbGQgKmNoaWxkLCBpbnQ2NF90IG9mZnNldCwgdW5zaWduZWQg
aW50IGJ5dGVzLAogaW50IGNvcm91dGluZV9mbgogYmRydl9jb19jb21tb25fYmxvY2tfc3RhdHVz
X2Fib3ZlKEJsb2NrRHJpdmVyU3RhdGUgKmJzLAogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIEJsb2NrRHJpdmVyU3RhdGUgKmJhc2UsCisgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgYm9vbCBpbmNsdWRlX2Jhc2UsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgYm9vbCB3YW50X3plcm8sCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
aW50NjRfdCBvZmZzZXQsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW50NjRf
dCBieXRlcywKQEAgLTUwLDYgKzUxLDcgQEAgYmRydl9jb19jb21tb25fYmxvY2tfc3RhdHVzX2Fi
b3ZlKEJsb2NrRHJpdmVyU3RhdGUgKmJzLAogaW50IGdlbmVyYXRlZF9jb193cmFwcGVyCiBiZHJ2
X2NvbW1vbl9ibG9ja19zdGF0dXNfYWJvdmUoQmxvY2tEcml2ZXJTdGF0ZSAqYnMsCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgQmxvY2tEcml2ZXJTdGF0ZSAqYmFzZSwKKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBib29sIGluY2x1ZGVfYmFzZSwKICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBib29sIHdhbnRfemVybywKICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBpbnQ2NF90IG9mZnNldCwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBp
bnQ2NF90IGJ5dGVzLApkaWZmIC0tZ2l0IGEvYmxvY2svaW8uYyBiL2Jsb2NrL2lvLmMKaW5kZXgg
YTcxOGQ1MGNhMi4uODZmNzZkMDRiZiAxMDA2NDQKLS0tIGEvYmxvY2svaW8uYworKysgYi9ibG9j
ay9pby5jCkBAIC0yMzQzLDYgKzIzNDMsNyBAQCBlYXJseV9vdXQ6CiBpbnQgY29yb3V0aW5lX2Zu
CiBiZHJ2X2NvX2NvbW1vbl9ibG9ja19zdGF0dXNfYWJvdmUoQmxvY2tEcml2ZXJTdGF0ZSAqYnMs
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQmxvY2tEcml2ZXJTdGF0ZSAqYmFz
ZSwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBib29sIGluY2x1ZGVfYmFzZSwK
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBib29sIHdhbnRfemVybywKICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQ2NF90IG9mZnNldCwKICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBpbnQ2NF90IGJ5dGVzLApAQCAtMjM1NCwxMCArMjM1NSwx
MSBAQCBiZHJ2X2NvX2NvbW1vbl9ibG9ja19zdGF0dXNfYWJvdmUoQmxvY2tEcml2ZXJTdGF0ZSAq
YnMsCiAgICAgQmxvY2tEcml2ZXJTdGF0ZSAqcDsKICAgICBpbnQ2NF90IGVvZiA9IDA7CiAKLSAg
ICBhc3NlcnQoYnMgIT0gYmFzZSk7CisgICAgYXNzZXJ0KGluY2x1ZGVfYmFzZSB8fCBicyAhPSBi
YXNlKTsKKyAgICBhc3NlcnQoIWluY2x1ZGVfYmFzZSB8fCBiYXNlKTsgLyogQ2FuJ3QgaW5jbHVk
ZSBOVUxMIGJhc2UgKi8KIAogICAgIHJldCA9IGJkcnZfY29fYmxvY2tfc3RhdHVzKGJzLCB3YW50
X3plcm8sIG9mZnNldCwgYnl0ZXMsIHBudW0sIG1hcCwgZmlsZSk7Ci0gICAgaWYgKHJldCA8IDAg
fHwgKnBudW0gPT0gMCB8fCByZXQgJiBCRFJWX0JMT0NLX0FMTE9DQVRFRCkgeworICAgIGlmIChy
ZXQgPCAwIHx8ICpwbnVtID09IDAgfHwgcmV0ICYgQkRSVl9CTE9DS19BTExPQ0FURUQgfHwgYnMg
PT0gYmFzZSkgewogICAgICAgICByZXR1cm4gcmV0OwogICAgIH0KIApAQCAtMjM2OCw3ICsyMzcw
LDcgQEAgYmRydl9jb19jb21tb25fYmxvY2tfc3RhdHVzX2Fib3ZlKEJsb2NrRHJpdmVyU3RhdGUg
KmJzLAogICAgIGFzc2VydCgqcG51bSA8PSBieXRlcyk7CiAgICAgYnl0ZXMgPSAqcG51bTsKIAot
ICAgIGZvciAocCA9IGJkcnZfZmlsdGVyX29yX2Nvd19icyhicyk7IHAgIT0gYmFzZTsKKyAgICBm
b3IgKHAgPSBiZHJ2X2ZpbHRlcl9vcl9jb3dfYnMoYnMpOyBpbmNsdWRlX2Jhc2UgfHwgcCAhPSBi
YXNlOwogICAgICAgICAgcCA9IGJkcnZfZmlsdGVyX29yX2Nvd19icyhwKSkKICAgICB7CiAgICAg
ICAgIHJldCA9IGJkcnZfY29fYmxvY2tfc3RhdHVzKHAsIHdhbnRfemVybywgb2Zmc2V0LCBieXRl
cywgcG51bSwgbWFwLApAQCAtMjQwNiw2ICsyNDA4LDExIEBAIGJkcnZfY29fY29tbW9uX2Jsb2Nr
X3N0YXR1c19hYm92ZShCbG9ja0RyaXZlclN0YXRlICpicywKICAgICAgICAgICAgIGJyZWFrOwog
ICAgICAgICB9CiAKKyAgICAgICAgaWYgKHAgPT0gYmFzZSkgeworICAgICAgICAgICAgYXNzZXJ0
KGluY2x1ZGVfYmFzZSk7CisgICAgICAgICAgICBicmVhazsKKyAgICAgICAgfQorCiAgICAgICAg
IC8qCiAgICAgICAgICAqIE9LLCBbb2Zmc2V0LCBvZmZzZXQgKyAqcG51bSkgcmVnaW9uIGlzIHVu
YWxsb2NhdGVkIG9uIHRoaXMgbGF5ZXIsCiAgICAgICAgICAqIGxldCdzIGNvbnRpbnVlIHRoZSBk
aXZpbmcuCkBAIC0yNDI1LDcgKzI0MzIsNyBAQCBpbnQgYmRydl9ibG9ja19zdGF0dXNfYWJvdmUo
QmxvY2tEcml2ZXJTdGF0ZSAqYnMsIEJsb2NrRHJpdmVyU3RhdGUgKmJhc2UsCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgaW50NjRfdCBvZmZzZXQsIGludDY0X3QgYnl0ZXMsIGludDY0X3Qg
KnBudW0sCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW50NjRfdCAqbWFwLCBCbG9ja0Ry
aXZlclN0YXRlICoqZmlsZSkKIHsKLSAgICByZXR1cm4gYmRydl9jb21tb25fYmxvY2tfc3RhdHVz
X2Fib3ZlKGJzLCBiYXNlLCB0cnVlLCBvZmZzZXQsIGJ5dGVzLAorICAgIHJldHVybiBiZHJ2X2Nv
bW1vbl9ibG9ja19zdGF0dXNfYWJvdmUoYnMsIGJhc2UsIGZhbHNlLCB0cnVlLCBvZmZzZXQsIGJ5
dGVzLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcG51bSwgbWFw
LCBmaWxlKTsKIH0KIApAQCAtMjQ0Miw5ICsyNDQ5LDkgQEAgaW50IGNvcm91dGluZV9mbiBiZHJ2
X2lzX2FsbG9jYXRlZChCbG9ja0RyaXZlclN0YXRlICpicywgaW50NjRfdCBvZmZzZXQsCiAgICAg
aW50IHJldDsKICAgICBpbnQ2NF90IGR1bW15OwogCi0gICAgcmV0ID0gYmRydl9jb21tb25fYmxv
Y2tfc3RhdHVzX2Fib3ZlKGJzLCBiZHJ2X2ZpbHRlcl9vcl9jb3dfYnMoYnMpLCBmYWxzZSwKLSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgb2Zmc2V0LCBieXRlcywgcG51
bSA/IHBudW0gOiAmZHVtbXksCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIE5VTEwsIE5VTEwpOworICAgIHJldCA9IGJkcnZfY29tbW9uX2Jsb2NrX3N0YXR1c19hYm92
ZShicywgYnMsIHRydWUsIGZhbHNlLCBvZmZzZXQsCisgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGJ5dGVzLCBwbnVtID8gcG51bSA6ICZkdW1teSwgTlVMTCwKKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTlVMTCk7CiAgICAgaWYgKHJldCA8
IDApIHsKICAgICAgICAgcmV0dXJuIHJldDsKICAgICB9Ci0tIAoyLjI2LjIKCg==


