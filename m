Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC78C2A67B3
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Nov 2020 16:31:50 +0100 (CET)
Received: from localhost ([::1]:43474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kaKlJ-0004eK-J3
	for lists+qemu-devel@lfdr.de; Wed, 04 Nov 2020 10:31:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kaKaT-0007ck-Ua
 for qemu-devel@nongnu.org; Wed, 04 Nov 2020 10:20:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kaKaP-00089r-Tf
 for qemu-devel@nongnu.org; Wed, 04 Nov 2020 10:20:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604503232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vjhB44v9kOs3ahxuUHYm/yBWG7LK4WTgoOjlXqldY2o=;
 b=B1Mkqyw1qoFA467onNUsq3Rq2lM+6DyMOocP7Ge12hYc2Q9r1JWjiscq9FC/Unw6pKD5tZ
 F9Rh9M19vbGWOrgC2RpcRPQzzQfLLGMe21GHLuSvs8tcgsEg/ihkc7Maak6M8rvx7eGNBM
 rRojcc2z/GfymOy3fm8gX8g3DplVGIY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37-pznsf-JWPkSG9oDzHdOomw-1; Wed, 04 Nov 2020 10:20:28 -0500
X-MC-Unique: pznsf-JWPkSG9oDzHdOomw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F02E8049F4;
 Wed,  4 Nov 2020 15:20:26 +0000 (UTC)
Received: from localhost (ovpn-115-145.ams2.redhat.com [10.36.115.145])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0B61460BFA;
 Wed,  4 Nov 2020 15:20:19 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 15/33] block/nvme: Use definitions instead of magic values in
 add_io_queue()
Date: Wed,  4 Nov 2020 15:18:10 +0000
Message-Id: <20201104151828.405824-16-stefanha@redhat.com>
In-Reply-To: <20201104151828.405824-1-stefanha@redhat.com>
References: <20201104151828.405824-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/03 00:03:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 Eric Auger <eric.auger@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Coiby Xu <Coiby.Xu@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEByZWRoYXQuY29tPgoKUmVwbGFj
ZSBtYWdpYyB2YWx1ZXMgYnkgZGVmaW5pdGlvbnMsIGFuZCBzaW1wbGlmaXkgc2luY2UgdGhlCm51
bWJlciBvZiBxdWV1ZXMgd2lsbCBuZXZlciByZWFjaCA2NEsuCgpSZXZpZXdlZC1ieTogRXJpYyBB
dWdlciA8ZXJpYy5hdWdlckByZWRoYXQuY29tPgpSZXZpZXdlZC1ieTogU3RlZmFuIEhham5vY3pp
IDxzdGVmYW5oYUByZWRoYXQuY29tPgpUZXN0ZWQtYnk6IEVyaWMgQXVnZXIgPGVyaWMuYXVnZXJA
cmVkaGF0LmNvbT4KU2lnbmVkLW9mZi1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxt
ZEByZWRoYXQuY29tPgpNZXNzYWdlLWlkOiAyMDIwMTAyOTA5MzMwNi4xMDYzODc5LTE0LXBoaWxt
ZEByZWRoYXQuY29tClNpZ25lZC1vZmYtYnk6IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVk
aGF0LmNvbT4KVGVzdGVkLWJ5OiBFcmljIEF1Z2VyIDxlcmljLmF1Z2VyQHJlZGhhdC5jb20+Ci0t
LQogYmxvY2svbnZtZS5jIHwgOSArKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlv
bnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYmxvY2svbnZtZS5jIGIvYmxvY2sv
bnZtZS5jCmluZGV4IDZlYWJhNGU3MDMuLjcyODViZDJlMjcgMTAwNjQ0Ci0tLSBhL2Jsb2NrL252
bWUuYworKysgYi9ibG9jay9udm1lLmMKQEAgLTY1Miw2ICs2NTIsNyBAQCBzdGF0aWMgYm9vbCBu
dm1lX2FkZF9pb19xdWV1ZShCbG9ja0RyaXZlclN0YXRlICpicywgRXJyb3IgKiplcnJwKQogICAg
IE52bWVDbWQgY21kOwogICAgIHVuc2lnbmVkIHF1ZXVlX3NpemUgPSBOVk1FX1FVRVVFX1NJWkU7
CiAKKyAgICBhc3NlcnQobiA8PSBVSU5UMTZfTUFYKTsKICAgICBxID0gbnZtZV9jcmVhdGVfcXVl
dWVfcGFpcihzLCBiZHJ2X2dldF9haW9fY29udGV4dChicyksCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgbiwgcXVldWVfc2l6ZSwgZXJycCk7CiAgICAgaWYgKCFxKSB7CkBAIC02NjAs
OCArNjYxLDggQEAgc3RhdGljIGJvb2wgbnZtZV9hZGRfaW9fcXVldWUoQmxvY2tEcml2ZXJTdGF0
ZSAqYnMsIEVycm9yICoqZXJycCkKICAgICBjbWQgPSAoTnZtZUNtZCkgewogICAgICAgICAub3Bj
b2RlID0gTlZNRV9BRE1fQ01EX0NSRUFURV9DUSwKICAgICAgICAgLmRwdHIucHJwMSA9IGNwdV90
b19sZTY0KHEtPmNxLmlvdmEpLAotICAgICAgICAuY2R3MTAgPSBjcHVfdG9fbGUzMigoKHF1ZXVl
X3NpemUgLSAxKSA8PCAxNikgfCAobiAmIDB4RkZGRikpLAotICAgICAgICAuY2R3MTEgPSBjcHVf
dG9fbGUzMigweDMpLAorICAgICAgICAuY2R3MTAgPSBjcHVfdG9fbGUzMigoKHF1ZXVlX3NpemUg
LSAxKSA8PCAxNikgfCBuKSwKKyAgICAgICAgLmNkdzExID0gY3B1X3RvX2xlMzIoTlZNRV9DUV9J
RU4gfCBOVk1FX0NRX1BDKSwKICAgICB9OwogICAgIGlmIChudm1lX2NtZF9zeW5jKGJzLCBzLT5x
dWV1ZXNbSU5ERVhfQURNSU5dLCAmY21kKSkgewogICAgICAgICBlcnJvcl9zZXRnKGVycnAsICJG
YWlsZWQgdG8gY3JlYXRlIENRIGlvIHF1ZXVlIFsldV0iLCBuKTsKQEAgLTY3MCw4ICs2NzEsOCBA
QCBzdGF0aWMgYm9vbCBudm1lX2FkZF9pb19xdWV1ZShCbG9ja0RyaXZlclN0YXRlICpicywgRXJy
b3IgKiplcnJwKQogICAgIGNtZCA9IChOdm1lQ21kKSB7CiAgICAgICAgIC5vcGNvZGUgPSBOVk1F
X0FETV9DTURfQ1JFQVRFX1NRLAogICAgICAgICAuZHB0ci5wcnAxID0gY3B1X3RvX2xlNjQocS0+
c3EuaW92YSksCi0gICAgICAgIC5jZHcxMCA9IGNwdV90b19sZTMyKCgocXVldWVfc2l6ZSAtIDEp
IDw8IDE2KSB8IChuICYgMHhGRkZGKSksCi0gICAgICAgIC5jZHcxMSA9IGNwdV90b19sZTMyKDB4
MSB8IChuIDw8IDE2KSksCisgICAgICAgIC5jZHcxMCA9IGNwdV90b19sZTMyKCgocXVldWVfc2l6
ZSAtIDEpIDw8IDE2KSB8IG4pLAorICAgICAgICAuY2R3MTEgPSBjcHVfdG9fbGUzMihOVk1FX1NR
X1BDIHwgKG4gPDwgMTYpKSwKICAgICB9OwogICAgIGlmIChudm1lX2NtZF9zeW5jKGJzLCBzLT5x
dWV1ZXNbSU5ERVhfQURNSU5dLCAmY21kKSkgewogICAgICAgICBlcnJvcl9zZXRnKGVycnAsICJG
YWlsZWQgdG8gY3JlYXRlIFNRIGlvIHF1ZXVlIFsldV0iLCBuKTsKLS0gCjIuMjguMAoK


