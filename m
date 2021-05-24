Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CFD38E71D
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 15:07:16 +0200 (CEST)
Received: from localhost ([::1]:43922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llAId-0002fs-C2
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 09:07:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1llADv-0002WB-3D
 for qemu-devel@nongnu.org; Mon, 24 May 2021 09:02:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1llADp-0007fl-OE
 for qemu-devel@nongnu.org; Mon, 24 May 2021 09:02:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621861335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wYPMPPOffy3HWUKMw+T9hJJylIZYAqFjgkC+UJGihBk=;
 b=WlDb/mhyf7xEGDkx7l/e1mvkbMsQifZGl6AgtCFwPQvBMv9XZInmJCJAiFc0dvsWsBuyr0
 vM8YERsmNV7HQI7nCRGqz4gPRkVEZkMSNiJYgOiBLkYlo1Osb6/FMoOumvd4jwMnu4F5GY
 FRTtU93ljkX6Jv5HzPXU+hBJV7cczEI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-GjR_c1IGOfmfNkMirNwrng-1; Mon, 24 May 2021 09:02:13 -0400
X-MC-Unique: GjR_c1IGOfmfNkMirNwrng-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 45190107AD2F;
 Mon, 24 May 2021 13:02:12 +0000 (UTC)
Received: from localhost (ovpn-113-244.ams2.redhat.com [10.36.113.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DBF4D5D9F0;
 Mon, 24 May 2021 13:02:11 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 3/8] coroutine-sleep: use a stack-allocated timer
Date: Mon, 24 May 2021 14:01:45 +0100
Message-Id: <20210524130150.50998-4-stefanha@redhat.com>
In-Reply-To: <20210524130150.50998-1-stefanha@redhat.com>
References: <20210524130150.50998-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: Kevin Wolf <kwolf@redhat.com>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org,
 John G Johnson <john.g.johnson@oracle.com>, John Snow <jsnow@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogUGFvbG8gQm9uemluaSA8cGJvbnppbmlAcmVkaGF0LmNvbT4KClRoZSBsaWZldGltZSBv
ZiB0aGUgdGltZXIgaXMgd2VsbC1rbm93biAoaXQgY2Fubm90IG91dGxpdmUKcWVtdV9jb19zbGVl
cF9uc193YWtlYWJsZSwgYmVjYXVzZSBpdCdzIGRlbGV0ZWQgYnkgdGhlIHRpbWUgdGhlCmNvcm91
dGluZSByZXN1bWVzKSwgc28gaXQgaXMgbm90IG5lY2Vzc2FyeSB0byBwbGFjZSBpdCBvbiB0aGUg
aGVhcC4KClJldmlld2VkLWJ5OiBWbGFkaW1pciBTZW1lbnRzb3YtT2dpZXZza2l5IDx2c2VtZW50
c292QHZpcnR1b3p6by5jb20+ClNpZ25lZC1vZmYtYnk6IFBhb2xvIEJvbnppbmkgPHBib256aW5p
QHJlZGhhdC5jb20+Ck1lc3NhZ2UtaWQ6IDIwMjEwNTE3MTAwNTQ4LjI4ODA2LTItcGJvbnppbmlA
cmVkaGF0LmNvbQpTaWduZWQtb2ZmLWJ5OiBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJlZGhh
dC5jb20+Ci0tLQogdXRpbC9xZW11LWNvcm91dGluZS1zbGVlcC5jIHwgOSArKysrLS0tLS0KIDEg
ZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvdXRpbC9xZW11LWNvcm91dGluZS1zbGVlcC5jIGIvdXRpbC9xZW11LWNvcm91dGluZS1zbGVl
cC5jCmluZGV4IDhjNGRhYzRmZDcuLmVlYzZlODFmM2YgMTAwNjQ0Ci0tLSBhL3V0aWwvcWVtdS1j
b3JvdXRpbmUtc2xlZXAuYworKysgYi91dGlsL3FlbXUtY29yb3V0aW5lLXNsZWVwLmMKQEAgLTIx
LDcgKzIxLDcgQEAgc3RhdGljIGNvbnN0IGNoYXIgKnFlbXVfY29fc2xlZXBfbnNfX3NjaGVkdWxl
ZCA9ICJxZW11X2NvX3NsZWVwX25zIjsKIAogc3RydWN0IFFlbXVDb1NsZWVwU3RhdGUgewogICAg
IENvcm91dGluZSAqY287Ci0gICAgUUVNVVRpbWVyICp0czsKKyAgICBRRU1VVGltZXIgdHM7CiAg
ICAgUWVtdUNvU2xlZXBTdGF0ZSAqKnVzZXJfc3RhdGVfcG9pbnRlcjsKIH07CiAKQEAgLTM1LDcg
KzM1LDcgQEAgdm9pZCBxZW11X2NvX3NsZWVwX3dha2UoUWVtdUNvU2xlZXBTdGF0ZSAqc2xlZXBf
c3RhdGUpCiAgICAgaWYgKHNsZWVwX3N0YXRlLT51c2VyX3N0YXRlX3BvaW50ZXIpIHsKICAgICAg
ICAgKnNsZWVwX3N0YXRlLT51c2VyX3N0YXRlX3BvaW50ZXIgPSBOVUxMOwogICAgIH0KLSAgICB0
aW1lcl9kZWwoc2xlZXBfc3RhdGUtPnRzKTsKKyAgICB0aW1lcl9kZWwoJnNsZWVwX3N0YXRlLT50
cyk7CiAgICAgYWlvX2NvX3dha2Uoc2xlZXBfc3RhdGUtPmNvKTsKIH0KIApAQCAtNTAsNyArNTAs
NiBAQCB2b2lkIGNvcm91dGluZV9mbiBxZW11X2NvX3NsZWVwX25zX3dha2VhYmxlKFFFTVVDbG9j
a1R5cGUgdHlwZSwgaW50NjRfdCBucywKICAgICBBaW9Db250ZXh0ICpjdHggPSBxZW11X2dldF9j
dXJyZW50X2Fpb19jb250ZXh0KCk7CiAgICAgUWVtdUNvU2xlZXBTdGF0ZSBzdGF0ZSA9IHsKICAg
ICAgICAgLmNvID0gcWVtdV9jb3JvdXRpbmVfc2VsZigpLAotICAgICAgICAudHMgPSBhaW9fdGlt
ZXJfbmV3KGN0eCwgdHlwZSwgU0NBTEVfTlMsIGNvX3NsZWVwX2NiLCAmc3RhdGUpLAogICAgICAg
ICAudXNlcl9zdGF0ZV9wb2ludGVyID0gc2xlZXBfc3RhdGUsCiAgICAgfTsKIApAQCAtNjMsMTAg
KzYyLDExIEBAIHZvaWQgY29yb3V0aW5lX2ZuIHFlbXVfY29fc2xlZXBfbnNfd2FrZWFibGUoUUVN
VUNsb2NrVHlwZSB0eXBlLCBpbnQ2NF90IG5zLAogICAgICAgICBhYm9ydCgpOwogICAgIH0KIAor
ICAgIGFpb190aW1lcl9pbml0KGN0eCwgJnN0YXRlLnRzLCB0eXBlLCBTQ0FMRV9OUywgY29fc2xl
ZXBfY2IsICZzdGF0ZSk7CiAgICAgaWYgKHNsZWVwX3N0YXRlKSB7CiAgICAgICAgICpzbGVlcF9z
dGF0ZSA9ICZzdGF0ZTsKICAgICB9Ci0gICAgdGltZXJfbW9kKHN0YXRlLnRzLCBxZW11X2Nsb2Nr
X2dldF9ucyh0eXBlKSArIG5zKTsKKyAgICB0aW1lcl9tb2QoJnN0YXRlLnRzLCBxZW11X2Nsb2Nr
X2dldF9ucyh0eXBlKSArIG5zKTsKICAgICBxZW11X2Nvcm91dGluZV95aWVsZCgpOwogICAgIGlm
IChzbGVlcF9zdGF0ZSkgewogICAgICAgICAvKgpAQCAtNzUsNSArNzUsNCBAQCB2b2lkIGNvcm91
dGluZV9mbiBxZW11X2NvX3NsZWVwX25zX3dha2VhYmxlKFFFTVVDbG9ja1R5cGUgdHlwZSwgaW50
NjRfdCBucywKICAgICAgICAgICovCiAgICAgICAgIGFzc2VydCgqc2xlZXBfc3RhdGUgPT0gTlVM
TCk7CiAgICAgfQotICAgIHRpbWVyX2ZyZWUoc3RhdGUudHMpOwogfQotLSAKMi4zMS4xCgo=


