Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61CA82D798C
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 16:39:05 +0100 (CET)
Received: from localhost ([::1]:47922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knkVc-00029b-Bo
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 10:39:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1knkI7-0004rO-VO
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 10:25:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1knkHz-00065I-8S
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 10:25:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607700295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eSXVuy2gjjuoz3TvNpAYLxx4gHiT38HfLArFEh3HKF4=;
 b=WpmlBXS5zPA2taJGX6orKA07qJ2ouhpXk88WvPdSu7OhxmMnVGx/5qUmJJPQvJqstnV8to
 Vw80xlRYeJS+EvUE88zOJy3owuz7Ez7RhL4B8RF2Z/ocapSaKN9T+/ch/us3N+hKvsjU39
 42oajkWLhCKsMJso3tJislBPcnx72ww=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-582-ob5OXXoVP7KlYr1H6FnEUQ-1; Fri, 11 Dec 2020 10:24:52 -0500
X-MC-Unique: ob5OXXoVP7KlYr1H6FnEUQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BE3D2802B46;
 Fri, 11 Dec 2020 15:24:51 +0000 (UTC)
Received: from thuth.com (ovpn-113-76.ams2.redhat.com [10.36.113.76])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4851710016FE;
 Fri, 11 Dec 2020 15:24:50 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PATCH 11/12] tests/fp: Do not emit implicit-fallthrough warnings in
 the softfloat tests
Date: Fri, 11 Dec 2020 16:24:25 +0100
Message-Id: <20201211152426.350966-12-thuth@redhat.com>
In-Reply-To: <20201211152426.350966-1-thuth@redhat.com>
References: <20201211152426.350966-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Chen Qun <kuhn.chenqun@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The softfloat tests are external repositories, so we do not care
about implicit fallthrough warnings in this code.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/fp/meson.build | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/fp/meson.build b/tests/fp/meson.build
index 3d4fb00f9d..8d739c4d59 100644
--- a/tests/fp/meson.build
+++ b/tests/fp/meson.build
@@ -27,6 +27,7 @@ tfdir = 'berkeley-testfloat-3/source'
 sfinc = include_directories(sfdir / 'include', sfspedir)
 
 tfcflags = [
+  '-Wno-implicit-fallthrough',
   '-Wno-strict-prototypes',
   '-Wno-unknown-pragmas',
   '-Wno-uninitialized',
@@ -209,6 +210,7 @@ libtestfloat = static_library(
 )
 
 sfcflags = [
+  '-Wno-implicit-fallthrough',
   '-Wno-missing-prototypes',
   '-Wno-redundant-decls',
   '-Wno-return-type',
-- 
2.27.0


