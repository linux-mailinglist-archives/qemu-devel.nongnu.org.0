Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9053D55EC
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 10:55:00 +0200 (CEST)
Received: from localhost ([::1]:59890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7wO3-0002qM-5z
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 04:54:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m7wMg-0001HJ-Tw
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 04:53:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m7wMY-0007FS-SO
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 04:53:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627289603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q6FUDQQ9xK3KK6L6MTUkl3BH3l9IJBdU9X4OvhZCfqE=;
 b=JImu/9dAE4rifjDLKVruFRe9A8i1HLfiLx4ZGsjbEti086i4ExhQ8aRq5Hg8rqpnZFbwFs
 a24aNUtHDsbH6GVmG7iohrtLjMMh1eL/kRp/TAA1Vw/wRFTemLzAvI0oYr3oBqNIS/eKSw
 PfsyKW0z+sPUON5wsd9z+VGMm81do/E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592--gyLSU0xP2SJICAGTXK0OA-1; Mon, 26 Jul 2021 04:53:21 -0400
X-MC-Unique: -gyLSU0xP2SJICAGTXK0OA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 68C75CC621;
 Mon, 26 Jul 2021 08:53:20 +0000 (UTC)
Received: from localhost (ovpn-113-151.ams2.redhat.com [10.36.113.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DFC4F19D9B;
 Mon, 26 Jul 2021 08:53:12 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL for-6.1 1/1] block/nvme: Fix VFIO_MAP_DMA failed: No space left
 on device
Date: Mon, 26 Jul 2021 09:53:06 +0100
Message-Id: <20210726085306.729309-2-stefanha@redhat.com>
In-Reply-To: <20210726085306.729309-1-stefanha@redhat.com>
References: <20210726085306.729309-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.719, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org,
 =?UTF-8?q?Michal=20Pr=C3=ADvozn=C3=ADk?= <mprivozn@redhat.com>,
 qemu-stable@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEByZWRoYXQuY29tPgoKV2hlbiB0
aGUgTlZNZSBibG9jayBkcml2ZXIgd2FzIGludHJvZHVjZWQgKHNlZSBjb21taXQgYmRkNmE5MGE5
ZTUsCkphbnVhcnkgMjAxOCksIExpbnV4IFZGSU9fSU9NTVVfTUFQX0RNQSBpb2N0bCB3YXMgb25s
eSByZXR1cm5pbmcKLUVOT01FTSBpbiBjYXNlIG9mIGVycm9yLiBUaGUgZHJpdmVyIHdhcyBjb3Jy
ZWN0bHkgaGFuZGxpbmcgdGhlCmVycm9yIHBhdGggdG8gcmVjeWNsZSBpdHMgdm9sYXRpbGUgSU9W
QSBtYXBwaW5ncy4KClRvIGZpeCBDVkUtMjAxOS0zODgyLCBMaW51eCBjb21taXQgNDkyODU1OTM5
YmRiICgidmZpby90eXBlMTogTGltaXQKRE1BIG1hcHBpbmdzIHBlciBjb250YWluZXIiLCBBcHJp
bCAyMDE5KSBhZGRlZCB0aGUgLUVOT1NQQyBlcnJvciB0bwpzaWduYWwgdGhlIHVzZXIgZXhoYXVz
dGVkIHRoZSBETUEgbWFwcGluZ3MgYXZhaWxhYmxlIGZvciBhIGNvbnRhaW5lci4KClRoZSBibG9j
ayBkcml2ZXIgc3RhcnRlZCB0byBtaXMtYmVoYXZlOgoKICBxZW11LXN5c3RlbS14ODZfNjQ6IFZG
SU9fTUFQX0RNQSBmYWlsZWQ6IE5vIHNwYWNlIGxlZnQgb24gZGV2aWNlCiAgKHFlbXUpCiAgKHFl
bXUpIGluZm8gc3RhdHVzCiAgVk0gc3RhdHVzOiBwYXVzZWQgKGlvLWVycm9yKQogIChxZW11KSBj
CiAgVkZJT19NQVBfRE1BIGZhaWxlZDogTm8gc3BhY2UgbGVmdCBvbiBkZXZpY2UKICAocWVtdSkg
YwogIFZGSU9fTUFQX0RNQSBmYWlsZWQ6IE5vIHNwYWNlIGxlZnQgb24gZGV2aWNlCgooVGhlIFZN
IGlzIG5vdCByZXN1bWFibGUgZnJvbSBoZXJlLCBoZW5jZSBzdHVjay4pCgpGaXggYnkgaGFuZGxp
bmcgdGhlIG5ldyAtRU5PU1BDIGVycm9yICh3aGVuIERNQSBtYXBwaW5ncyBhcmUKZXhoYXVzdGVk
KSB3aXRob3V0IGFueSBkaXN0aW5jdGlvbiB0byB0aGUgY3VycmVudCAtRU5PTUVNIGVycm9yLApz
byB3ZSBkb24ndCBjaGFuZ2UgdGhlIGJlaGF2aW9yIG9uIG9sZCBrZXJuZWxzIHdoZXJlIHRoZSBD
VkUtMjAxOS0zODgyCmZpeCBpcyBub3QgcHJlc2VudC4KCkFuIGVhc3kgd2F5IHRvIHJlcHJvZHVj
ZSB0aGlzIGJ1ZyBpcyB0byByZXN0cmljdCB0aGUgRE1BIG1hcHBpbmcKbGltaXQgKDY1NTM1IGJ5
IGRlZmF1bHQpIHdoZW4gbG9hZGluZyB0aGUgVkZJTyBJT01NVSBtb2R1bGU6CgogICMgbW9kcHJv
YmUgdmZpb19pb21tdV90eXBlMSBkbWFfZW50cnlfbGltaXQ9NjY2CgpDYzogcWVtdS1zdGFibGVA
bm9uZ251Lm9yZwpDYzogRmFtIFpoZW5nIDxmYW1AZXVwaG9uLm5ldD4KQ2M6IE1heGltIExldml0
c2t5IDxtbGV2aXRza0ByZWRoYXQuY29tPgpDYzogQWxleCBXaWxsaWFtc29uIDxhbGV4LndpbGxp
YW1zb25AcmVkaGF0LmNvbT4KUmVwb3J0ZWQtYnk6IE1pY2hhbCBQcsOtdm96bsOtayA8bXByaXZv
em5AcmVkaGF0LmNvbT4KU2lnbmVkLW9mZi1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBo
aWxtZEByZWRoYXQuY29tPgpNZXNzYWdlLWlkOiAyMDIxMDcyMzE5NTg0My4xMDMyODI1LTEtcGhp
bG1kQHJlZGhhdC5jb20KRml4ZXM6IGJkZDZhOTBhOWU1ICgiYmxvY2s6IEFkZCBWRklPIGJhc2Vk
IE5WTWUgZHJpdmVyIikKQnVnbGluazogaHR0cHM6Ly9idWdzLmxhdW5jaHBhZC5uZXQvcWVtdS8r
YnVnLzE4NjMzMzMKUmVzb2x2ZXM6IGh0dHBzOi8vZ2l0bGFiLmNvbS9xZW11LXByb2plY3QvcWVt
dS8tL2lzc3Vlcy82NQpTaWduZWQtb2ZmLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhp
bG1kQHJlZGhhdC5jb20+ClNpZ25lZC1vZmYtYnk6IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFA
cmVkaGF0LmNvbT4KLS0tCiBibG9jay9udm1lLmMgfCAyMiArKysrKysrKysrKysrKysrKysrKysr
CiAxIGZpbGUgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2Jsb2NrL252
bWUuYyBiL2Jsb2NrL252bWUuYwppbmRleCAyYjU0MjFlN2FhLi5lOGRiYmMyMzE3IDEwMDY0NAot
LS0gYS9ibG9jay9udm1lLmMKKysrIGIvYmxvY2svbnZtZS5jCkBAIC0xMDMwLDcgKzEwMzAsMjkg
QEAgdHJ5X21hcDoKICAgICAgICAgciA9IHFlbXVfdmZpb19kbWFfbWFwKHMtPnZmaW8sCiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBxaW92LT5pb3ZbaV0uaW92X2Jhc2UsCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBsZW4sIHRydWUsICZpb3ZhKTsKKyAgICAgICAgaWYgKHIg
PT0gLUVOT1NQQykgeworICAgICAgICAgICAgLyoKKyAgICAgICAgICAgICAqIEluIGFkZGl0aW9u
IHRvIHRoZSAtRU5PTUVNIGVycm9yLCB0aGUgVkZJT19JT01NVV9NQVBfRE1BCisgICAgICAgICAg
ICAgKiBpb2N0bCByZXR1cm5zIC1FTk9TUEMgdG8gc2lnbmFsIHRoZSB1c2VyIGV4aGF1c3RlZCB0
aGUgRE1BCisgICAgICAgICAgICAgKiBtYXBwaW5ncyBhdmFpbGFibGUgZm9yIGEgY29udGFpbmVy
IHNpbmNlIExpbnV4IGtlcm5lbCBjb21taXQKKyAgICAgICAgICAgICAqIDQ5Mjg1NTkzOWJkYiAo
InZmaW8vdHlwZTE6IExpbWl0IERNQSBtYXBwaW5ncyBwZXIgY29udGFpbmVyIiwKKyAgICAgICAg
ICAgICAqIEFwcmlsIDIwMTksIHNlZSBDVkUtMjAxOS0zODgyKS4KKyAgICAgICAgICAgICAqCisg
ICAgICAgICAgICAgKiBUaGlzIGJsb2NrIGRyaXZlciBhbHJlYWR5IGhhbmRsZXMgdGhpcyBlcnJv
ciBwYXRoIGJ5IGNoZWNraW5nCisgICAgICAgICAgICAgKiBmb3IgdGhlIC1FTk9NRU0gZXJyb3Is
IHNvIHdlIGRpcmVjdGx5IHJlcGxhY2UgLUVOT1NQQyBieQorICAgICAgICAgICAgICogLUVOT01F
TS4gQmVzaWRlLCAtRU5PU1BDIGhhcyBhIHNwZWNpZmljIG1lYW5pbmcgZm9yIGJsb2NrZGV2Cisg
ICAgICAgICAgICAgKiBjb3JvdXRpbmVzOiBpdCB0cmlnZ2VycyBCTE9DS0RFVl9PTl9FUlJPUl9F
Tk9TUEMgYW5kCisgICAgICAgICAgICAgKiBCTE9DS19FUlJPUl9BQ1RJT05fU1RPUCB3aGljaCBz
dG9wcyB0aGUgVk0sIGFza2luZyB0aGUgb3BlcmF0b3IKKyAgICAgICAgICAgICAqIHRvIGFkZCBt
b3JlIHN0b3JhZ2UgdG8gdGhlIGJsb2NrZGV2LiBOb3Qgc29tZXRoaW5nIHdlIGNhbiBkbworICAg
ICAgICAgICAgICogZWFzaWx5IHdpdGggYW4gSU9NTVUgOikKKyAgICAgICAgICAgICAqLworICAg
ICAgICAgICAgciA9IC1FTk9NRU07CisgICAgICAgIH0KICAgICAgICAgaWYgKHIgPT0gLUVOT01F
TSAmJiByZXRyeSkgeworICAgICAgICAgICAgLyoKKyAgICAgICAgICAgICAqIFdlIGV4aGF1c3Rl
ZCB0aGUgRE1BIG1hcHBpbmdzIGF2YWlsYWJsZSBmb3Igb3VyIGNvbnRhaW5lcjoKKyAgICAgICAg
ICAgICAqIHJlY3ljbGUgdGhlIHZvbGF0aWxlIElPVkEgbWFwcGluZ3MuCisgICAgICAgICAgICAg
Ki8KICAgICAgICAgICAgIHJldHJ5ID0gZmFsc2U7CiAgICAgICAgICAgICB0cmFjZV9udm1lX2Rt
YV9mbHVzaF9xdWV1ZV93YWl0KHMpOwogICAgICAgICAgICAgaWYgKHMtPmRtYV9tYXBfY291bnQp
IHsKLS0gCjIuMzEuMQoK


