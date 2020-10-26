Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3079F2991B8
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Oct 2020 17:02:36 +0100 (CET)
Received: from localhost ([::1]:33240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kX4x9-0001Zz-5d
	for lists+qemu-devel@lfdr.de; Mon, 26 Oct 2020 12:02:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kX4tk-0007yj-LV
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 11:59:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kX4th-0005Kq-Ct
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 11:59:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603727940;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=VP/pTg1ry8GVH2wvNg1/MLXi+5kpgB3hlJb/8jMX8/A=;
 b=fGT6qr9JadYqiy+crBNbVa28Fbj+HuwR3+LyS4MxA40lfRwunR/zSMXiN2IC8niiqD7CZ4
 1AXhr9v3ZkBCSR2iKH8ARuBEQuaJJxEuK3fNOeThwoOKcTLnzwEyHj17vJ0XgQsLp0SmZN
 I0SLLU/G00msBGlec8UI2gqnwiyOgMM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-582-8oXUmMcQMLGj1Az7eyqmqA-1; Mon, 26 Oct 2020 11:58:56 -0400
X-MC-Unique: 8oXUmMcQMLGj1Az7eyqmqA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 54E5AA0BDC;
 Mon, 26 Oct 2020 15:58:55 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 112B262A14;
 Mon, 26 Oct 2020 15:58:55 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] makefile: handle -n / -k / -q correctly
Date: Mon, 26 Oct 2020 11:58:54 -0400
Message-Id: <20201026155854.3074290-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/25 21:03:19
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use $(findstring) instead of $(filter) to detect -n/-k
as different versions of MAKE fill in $(MAKEFLAGS) differently.
Do not bother running ninja at all if -nq is passed.

Tested-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 4d1fa8bb3d..e7c1000f5c 100644
--- a/Makefile
+++ b/Makefile
@@ -146,9 +146,12 @@ endif
 # 4. Rules to bridge to other makefiles
 
 ifneq ($(NINJA),)
-NINJAFLAGS = $(if $V,-v,) \
+MAKE.n = $(findstring n,$(firstword $(MAKEFLAGS)))
+MAKE.k = $(findstring k,$(firstword $(MAKEFLAGS)))
+MAKE.q = $(findstring q,$(firstword $(MAKEFLAGS)))
+MAKE.nq = $(if $(word 2, $(MAKE.n) $(MAKE.q)),nq)
+NINJAFLAGS = $(if $V,-v) $(if $(MAKE.n), -n) $(if $(MAKE.k), -k0) \
         $(filter-out -j, $(lastword -j1 $(filter -l% -j%, $(MAKEFLAGS)))) \
-        $(subst -k, -k0, $(filter -n -k,$(MAKEFLAGS)))
 
 ninja-cmd-goals = $(or $(MAKECMDGOALS), all)
 ninja-cmd-goals += $(foreach t, $(.tests), $(.test.deps.$t))
@@ -165,7 +168,8 @@ $(ninja-targets): run-ninja
 # --output-sync line.
 run-ninja: config-host.mak
 ifneq ($(filter $(ninja-targets), $(ninja-cmd-goals)),)
-	+@$(NINJA) $(NINJAFLAGS) $(sort $(filter $(ninja-targets), $(ninja-cmd-goals))) | cat
+	+$(quiet-@)$(if $(MAKE.nq),@:, $(NINJA) \
+	   $(NINJAFLAGS) $(sort $(filter $(ninja-targets), $(ninja-cmd-goals))) | cat)
 endif
 endif
 
-- 
2.26.2


