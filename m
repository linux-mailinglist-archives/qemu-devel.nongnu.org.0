Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB34638E719
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 15:05:32 +0200 (CEST)
Received: from localhost ([::1]:37364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llAGx-0006ZZ-LA
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 09:05:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1llADw-0002cP-Qa
 for qemu-devel@nongnu.org; Mon, 24 May 2021 09:02:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1llADt-0007iT-Ay
 for qemu-devel@nongnu.org; Mon, 24 May 2021 09:02:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621861340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wueI4YIUFKoP/IMc9SYoE+f7CgGDrWwlSxzrNW4O1Mo=;
 b=HWQ2BrTOEMdJfLfK74vXz/fjZhBx5+waqTFPkSDwrVnpvXTaxLNz2U6O5ihXdy5LnH9xXk
 /WQfU0G7n6y1f+JViEPtjLCx+HnFdXloKbeMMpLAUmGxZR/wwtH3j2S5G+TsNM7rpGHPmr
 Xx5Ad+7evg0QQWWTRAJFhV2OKBjNczA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-515-uj8ma0Q6O2iHFQp_wCxPwA-1; Mon, 24 May 2021 09:02:18 -0400
X-MC-Unique: uj8ma0Q6O2iHFQp_wCxPwA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 231BC1966323;
 Mon, 24 May 2021 13:02:17 +0000 (UTC)
Received: from localhost (ovpn-113-244.ams2.redhat.com [10.36.113.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 63FAF5D71D;
 Mon, 24 May 2021 13:02:13 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 4/8] coroutine-sleep: disallow NULL QemuCoSleepState** argument
Date: Mon, 24 May 2021 14:01:46 +0100
Message-Id: <20210524130150.50998-5-stefanha@redhat.com>
In-Reply-To: <20210524130150.50998-1-stefanha@redhat.com>
References: <20210524130150.50998-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org,
 John G Johnson <john.g.johnson@oracle.com>, John Snow <jsnow@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogUGFvbG8gQm9uemluaSA8cGJvbnppbmlAcmVkaGF0LmNvbT4KClNpbXBsaWZ5IHRoZSBj
b2RlIGJ5IHJlbW92aW5nIGNvbmRpdGlvbmFscy4gIHFlbXVfY29fc2xlZXBfbnMKY2FuIHNpbXBs
eSBwb2ludCB0aGUgYXJndW1lbnQgdG8gYW4gb24tc3RhY2sgdGVtcG9yYXJ5LgoKUmV2aWV3ZWQt
Ynk6IFZsYWRpbWlyIFNlbWVudHNvdi1PZ2lldnNraXkgPHZzZW1lbnRzb3ZAdmlydHVvenpvLmNv
bT4KU2lnbmVkLW9mZi1ieTogUGFvbG8gQm9uemluaSA8cGJvbnppbmlAcmVkaGF0LmNvbT4KTWVz
c2FnZS1pZDogMjAyMTA1MTcxMDA1NDguMjg4MDYtMy1wYm9uemluaUByZWRoYXQuY29tClNpZ25l
ZC1vZmYtYnk6IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4KLS0tCiBpbmNs
dWRlL3FlbXUvY29yb3V0aW5lLmggICAgfCAgNSArKystLQogdXRpbC9xZW11LWNvcm91dGluZS1z
bGVlcC5jIHwgMTggKysrKystLS0tLS0tLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0
aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9xZW11L2Nvcm91
dGluZS5oIGIvaW5jbHVkZS9xZW11L2Nvcm91dGluZS5oCmluZGV4IGNlNWI5YzY4NTEuLmM1ZDc3
NDI5ODkgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvcWVtdS9jb3JvdXRpbmUuaAorKysgYi9pbmNsdWRl
L3FlbXUvY29yb3V0aW5lLmgKQEAgLTI5NSw3ICsyOTUsNyBAQCB0eXBlZGVmIHN0cnVjdCBRZW11
Q29TbGVlcFN0YXRlIFFlbXVDb1NsZWVwU3RhdGU7CiAKIC8qKgogICogWWllbGQgdGhlIGNvcm91
dGluZSBmb3IgYSBnaXZlbiBkdXJhdGlvbi4gRHVyaW5nIHRoaXMgeWllbGQsIEBzbGVlcF9zdGF0
ZQotICogKGlmIG5vdCBOVUxMKSBpcyBzZXQgdG8gYW4gb3BhcXVlIHBvaW50ZXIsIHdoaWNoIG1h
eSBiZSB1c2VkIGZvcgorICogaXMgc2V0IHRvIGFuIG9wYXF1ZSBwb2ludGVyLCB3aGljaCBtYXkg
YmUgdXNlZCBmb3IKICAqIHFlbXVfY29fc2xlZXBfd2FrZSgpLiBCZSBjYXJlZnVsLCB0aGUgcG9p
bnRlciBpcyBzZXQgYmFjayB0byB6ZXJvIHdoZW4gdGhlCiAgKiB0aW1lciBmaXJlcy4gRG9uJ3Qg
c2F2ZSB0aGUgb2J0YWluZWQgdmFsdWUgdG8gb3RoZXIgdmFyaWFibGVzIGFuZCBkb24ndCBjYWxs
CiAgKiBxZW11X2NvX3NsZWVwX3dha2UgZnJvbSBhbm90aGVyIGFpbyBjb250ZXh0LgpAQCAtMzA0
LDcgKzMwNCw4IEBAIHZvaWQgY29yb3V0aW5lX2ZuIHFlbXVfY29fc2xlZXBfbnNfd2FrZWFibGUo
UUVNVUNsb2NrVHlwZSB0eXBlLCBpbnQ2NF90IG5zLAogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBRZW11Q29TbGVlcFN0YXRlICoqc2xlZXBfc3RhdGUpOwogc3Rh
dGljIGlubGluZSB2b2lkIGNvcm91dGluZV9mbiBxZW11X2NvX3NsZWVwX25zKFFFTVVDbG9ja1R5
cGUgdHlwZSwgaW50NjRfdCBucykKIHsKLSAgICBxZW11X2NvX3NsZWVwX25zX3dha2VhYmxlKHR5
cGUsIG5zLCBOVUxMKTsKKyAgICBRZW11Q29TbGVlcFN0YXRlICp1bnVzZWQgPSBOVUxMOworICAg
IHFlbXVfY29fc2xlZXBfbnNfd2FrZWFibGUodHlwZSwgbnMsICZ1bnVzZWQpOwogfQogCiAvKioK
ZGlmZiAtLWdpdCBhL3V0aWwvcWVtdS1jb3JvdXRpbmUtc2xlZXAuYyBiL3V0aWwvcWVtdS1jb3Jv
dXRpbmUtc2xlZXAuYwppbmRleCBlZWM2ZTgxZjNmLi4zZjZmNjM3ZTgxIDEwMDY0NAotLS0gYS91
dGlsL3FlbXUtY29yb3V0aW5lLXNsZWVwLmMKKysrIGIvdXRpbC9xZW11LWNvcm91dGluZS1zbGVl
cC5jCkBAIC0zMiw5ICszMiw3IEBAIHZvaWQgcWVtdV9jb19zbGVlcF93YWtlKFFlbXVDb1NsZWVw
U3RhdGUgKnNsZWVwX3N0YXRlKQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHFlbXVfY29fc2xlZXBfbnNfX3NjaGVkdWxlZCwgTlVMTCk7CiAKICAgICBhc3NlcnQo
c2NoZWR1bGVkID09IHFlbXVfY29fc2xlZXBfbnNfX3NjaGVkdWxlZCk7Ci0gICAgaWYgKHNsZWVw
X3N0YXRlLT51c2VyX3N0YXRlX3BvaW50ZXIpIHsKLSAgICAgICAgKnNsZWVwX3N0YXRlLT51c2Vy
X3N0YXRlX3BvaW50ZXIgPSBOVUxMOwotICAgIH0KKyAgICAqc2xlZXBfc3RhdGUtPnVzZXJfc3Rh
dGVfcG9pbnRlciA9IE5VTEw7CiAgICAgdGltZXJfZGVsKCZzbGVlcF9zdGF0ZS0+dHMpOwogICAg
IGFpb19jb193YWtlKHNsZWVwX3N0YXRlLT5jbyk7CiB9CkBAIC02MywxNiArNjEsMTAgQEAgdm9p
ZCBjb3JvdXRpbmVfZm4gcWVtdV9jb19zbGVlcF9uc193YWtlYWJsZShRRU1VQ2xvY2tUeXBlIHR5
cGUsIGludDY0X3QgbnMsCiAgICAgfQogCiAgICAgYWlvX3RpbWVyX2luaXQoY3R4LCAmc3RhdGUu
dHMsIHR5cGUsIFNDQUxFX05TLCBjb19zbGVlcF9jYiwgJnN0YXRlKTsKLSAgICBpZiAoc2xlZXBf
c3RhdGUpIHsKLSAgICAgICAgKnNsZWVwX3N0YXRlID0gJnN0YXRlOwotICAgIH0KKyAgICAqc2xl
ZXBfc3RhdGUgPSAmc3RhdGU7CiAgICAgdGltZXJfbW9kKCZzdGF0ZS50cywgcWVtdV9jbG9ja19n
ZXRfbnModHlwZSkgKyBucyk7CiAgICAgcWVtdV9jb3JvdXRpbmVfeWllbGQoKTsKLSAgICBpZiAo
c2xlZXBfc3RhdGUpIHsKLSAgICAgICAgLyoKLSAgICAgICAgICogTm90ZSB0aGF0ICpzbGVlcF9z
dGF0ZSBpcyBjbGVhcmVkIGR1cmluZyBxZW11X2NvX3NsZWVwX3dha2UKLSAgICAgICAgICogYmVm
b3JlIHJlc3VtaW5nIHRoaXMgY29yb3V0aW5lLgotICAgICAgICAgKi8KLSAgICAgICAgYXNzZXJ0
KCpzbGVlcF9zdGF0ZSA9PSBOVUxMKTsKLSAgICB9CisKKyAgICAvKiBxZW11X2NvX3NsZWVwX3dh
a2UgY2xlYXJzICpzbGVlcF9zdGF0ZSBiZWZvcmUgcmVzdW1pbmcgdGhpcyBjb3JvdXRpbmUuICAq
LworICAgIGFzc2VydCgqc2xlZXBfc3RhdGUgPT0gTlVMTCk7CiB9Ci0tIAoyLjMxLjEKCg==


