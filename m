Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EEC020B502
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jun 2020 17:43:11 +0200 (CEST)
Received: from localhost ([::1]:51942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1joqVS-0001ra-DI
	for lists+qemu-devel@lfdr.de; Fri, 26 Jun 2020 11:43:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joq4k-0003VD-2L
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 11:15:34 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:34922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joq4e-0006jm-Jy
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 11:15:33 -0400
Received: by mail-wm1-x334.google.com with SMTP id l2so8228554wmf.0
 for <qemu-devel@nongnu.org>; Fri, 26 Jun 2020 08:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=qjNpozwxLU54hGICp5UL23YT8kOgap7ValAV5L7E2UI=;
 b=OdA0V/Q5A5fgbn6FqOUHbyzUCKjagZedK2PUNQ+W6geVc7T0cbrBTutO4j5HsamAb7
 vxsgCvbkseAgNN2dNGfviOScur6ZRf2Atxa05oXYC0WhrYS00e5ZP4/PHMj5p2/NhLhA
 LJ1e5eyxy7Hx/tfaIWE9tblncOTfHN6x2IIN3sOwd1PVhGbLN3GTifIeo8MK2bS864jQ
 D5wmYpteARrnmcCPLWIYq57MxnjSHQ+t6fLpKCrS1kqeexYJ3rlXaOAPWagGmomuISYX
 ceuC5JudsMbWVf9lhLwinIaErMjUMzZHHk/EYR6j8ym9eGY4I4hcxDOsKKGBzgOkLBY5
 cUmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qjNpozwxLU54hGICp5UL23YT8kOgap7ValAV5L7E2UI=;
 b=TvnCd3B4TaUHOcpQyamTUHV9gjNvs1HGRuDFm/yXIZ/AMpb9x+X5hVCeJbDo2O2hs6
 jn/YfGETduoCX/n9VWnc0KAqe1KtKUNiOZ3QH1OZQmrbDFkikUHocM3hD4Y7ZyfdGpBF
 hyBcYpJ2LkbgqPJSEfZtpZ8BogAz4ZSUoI0j6BbQiJrLDMFYWMdB/yFOMk/XMP/olAl+
 hf77jGEapasJyg6fvhb5IMrDGl0DM7NoOgJApex6JSWzFzRfIbHJgKYb/sNBHPK+xBkd
 JL2qAAa7136wtA1FyGPMNLtTc/h4bIpjhFoMPkiCM9onSjEeAhhlO9hsI2ET55wmQ4mO
 MyuQ==
X-Gm-Message-State: AOAM531DVMcBWJMSOk1kXMq4dCX7JdvH8W+mjcTpHd5rD2Sax8Nxaeib
 fsLNADFd1KZe7dTCbfS4QPNmCMsm+hZ66Q==
X-Google-Smtp-Source: ABdhPJyTuyvmnqyvH0ORwvfxkHg7lkgFNnNBT6mq4hPE2Rz67XpPmPD8LKjsZCKjWfLTWkX8uiRweQ==
X-Received: by 2002:a1c:2d54:: with SMTP id t81mr4251605wmt.154.1593184525941; 
 Fri, 26 Jun 2020 08:15:25 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w13sm37838852wrr.67.2020.06.26.08.15.23
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2020 08:15:25 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 49/57] target/arm: Add mte helpers for sve scatter/gather
 memory ops
Date: Fri, 26 Jun 2020 16:14:16 +0100
Message-Id: <20200626151424.30117-50-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200626151424.30117-1-peter.maydell@linaro.org>
References: <20200626151424.30117-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Because the elements are non-sequential, we cannot eliminate many
tests straight away like we can for sequential operations.  But
we often have the PTE details handy, so we can test for Tagged.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20200626033144.790098-38-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-sve.h    | 285 ++++++++++++++++
 target/arm/sve_helper.c    | 185 +++++++++--
 target/arm/translate-sve.c | 650 +++++++++++++++++++++++++------------
 3 files changed, 872 insertions(+), 248 deletions(-)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index f48752eb421..63c4a087caa 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -1617,6 +1617,115 @@ DEF_HELPER_FLAGS_6(sve_ldsds_le_zd, TCG_CALL_NO_WG,
 DEF_HELPER_FLAGS_6(sve_ldsds_be_zd, TCG_CALL_NO_WG,
                    void, env, ptr, ptr, ptr, tl, i32)
 
+DEF_HELPER_FLAGS_6(sve_ldbsu_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldhsu_le_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldhsu_be_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldss_le_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldss_be_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldbss_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldhss_le_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldhss_be_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_6(sve_ldbsu_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldhsu_le_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldhsu_be_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldss_le_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldss_be_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldbss_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldhss_le_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldhss_be_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_6(sve_ldbdu_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldhdu_le_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldhdu_be_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldsdu_le_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldsdu_be_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_lddd_le_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_lddd_be_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldbds_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldhds_le_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldhds_be_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldsds_le_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldsds_be_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_6(sve_ldbdu_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldhdu_le_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldhdu_be_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldsdu_le_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldsdu_be_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_lddd_le_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_lddd_be_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldbds_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldhds_le_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldhds_be_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldsds_le_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldsds_be_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_6(sve_ldbdu_zd_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldhdu_le_zd_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldhdu_be_zd_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldsdu_le_zd_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldsdu_be_zd_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_lddd_le_zd_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_lddd_be_zd_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldbds_zd_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldhds_le_zd_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldhds_be_zd_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldsds_le_zd_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldsds_be_zd_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+
 DEF_HELPER_FLAGS_6(sve_ldffbsu_zsu, TCG_CALL_NO_WG,
                    void, env, ptr, ptr, ptr, tl, i32)
 DEF_HELPER_FLAGS_6(sve_ldffhsu_le_zsu, TCG_CALL_NO_WG,
@@ -1726,6 +1835,115 @@ DEF_HELPER_FLAGS_6(sve_ldffsds_le_zd, TCG_CALL_NO_WG,
 DEF_HELPER_FLAGS_6(sve_ldffsds_be_zd, TCG_CALL_NO_WG,
                    void, env, ptr, ptr, ptr, tl, i32)
 
+DEF_HELPER_FLAGS_6(sve_ldffbsu_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffhsu_le_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffhsu_be_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffss_le_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffss_be_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffbss_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffhss_le_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffhss_be_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_6(sve_ldffbsu_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffhsu_le_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffhsu_be_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffss_le_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffss_be_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffbss_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffhss_le_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffhss_be_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_6(sve_ldffbdu_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffhdu_le_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffhdu_be_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffsdu_le_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffsdu_be_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffdd_le_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffdd_be_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffbds_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffhds_le_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffhds_be_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffsds_le_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffsds_be_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_6(sve_ldffbdu_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffhdu_le_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffhdu_be_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffsdu_le_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffsdu_be_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffdd_le_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffdd_be_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffbds_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffhds_le_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffhds_be_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffsds_le_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffsds_be_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_6(sve_ldffbdu_zd_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffhdu_le_zd_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffhdu_be_zd_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffsdu_le_zd_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffsdu_be_zd_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffdd_le_zd_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffdd_be_zd_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffbds_zd_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffhds_le_zd_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffhds_be_zd_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffsds_le_zd_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffsds_be_zd_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+
 DEF_HELPER_FLAGS_6(sve_stbs_zsu, TCG_CALL_NO_WG,
                    void, env, ptr, ptr, ptr, tl, i32)
 DEF_HELPER_FLAGS_6(sve_sths_le_zsu, TCG_CALL_NO_WG,
@@ -1793,4 +2011,71 @@ DEF_HELPER_FLAGS_6(sve_stdd_le_zd, TCG_CALL_NO_WG,
 DEF_HELPER_FLAGS_6(sve_stdd_be_zd, TCG_CALL_NO_WG,
                    void, env, ptr, ptr, ptr, tl, i32)
 
+DEF_HELPER_FLAGS_6(sve_stbs_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_sths_le_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_sths_be_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_stss_le_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_stss_be_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_6(sve_stbs_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_sths_le_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_sths_be_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_stss_le_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_stss_be_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_6(sve_stbd_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_sthd_le_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_sthd_be_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_stsd_le_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_stsd_be_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_stdd_le_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_stdd_be_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_6(sve_stbd_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_sthd_le_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_sthd_be_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_stsd_le_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_stsd_be_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_stdd_le_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_stdd_be_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_6(sve_stbd_zd_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_sthd_le_zd_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_sthd_be_zd_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_stsd_le_zd_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_stsd_be_zd_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_stdd_le_zd_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_stdd_be_zd_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+
 DEF_HELPER_FLAGS_4(sve2_pmull_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 7aca4ad3840..ad974c2cc57 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -5354,7 +5354,8 @@ static target_ulong off_zd_d(void *reg, intptr_t reg_ofs)
 static inline QEMU_ALWAYS_INLINE
 void sve_ld1_z(CPUARMState *env, void *vd, uint64_t *vg, void *vm,
                target_ulong base, uint32_t desc, uintptr_t retaddr,
-               int esize, int msize, zreg_off_fn *off_fn,
+               uint32_t mtedesc, int esize, int msize,
+               zreg_off_fn *off_fn,
                sve_ldst1_host_fn *host_fn,
                sve_ldst1_tlb_fn *tlb_fn)
 {
@@ -5382,7 +5383,9 @@ void sve_ld1_z(CPUARMState *env, void *vd, uint64_t *vg, void *vm,
                         cpu_check_watchpoint(env_cpu(env), addr, msize,
                                              info.attrs, BP_MEM_READ, retaddr);
                     }
-                    /* TODO: MTE check */
+                    if (mtedesc && arm_tlb_mte_tagged(&info.attrs)) {
+                        mte_check1(env, mtedesc, addr, retaddr);
+                    }
                     host_fn(&scratch, reg_off, info.host);
                 } else {
                     /* Element crosses the page boundary. */
@@ -5393,7 +5396,9 @@ void sve_ld1_z(CPUARMState *env, void *vd, uint64_t *vg, void *vm,
                                              msize, info.attrs,
                                              BP_MEM_READ, retaddr);
                     }
-                    /* TODO: MTE check */
+                    if (mtedesc && arm_tlb_mte_tagged(&info.attrs)) {
+                        mte_check1(env, mtedesc, addr, retaddr);
+                    }
                     tlb_fn(env, &scratch, reg_off, addr, retaddr);
                 }
             }
@@ -5406,20 +5411,53 @@ void sve_ld1_z(CPUARMState *env, void *vd, uint64_t *vg, void *vm,
     memcpy(vd, &scratch, reg_max);
 }
 
+static inline QEMU_ALWAYS_INLINE
+void sve_ld1_z_mte(CPUARMState *env, void *vd, uint64_t *vg, void *vm,
+                   target_ulong base, uint32_t desc, uintptr_t retaddr,
+                   int esize, int msize, zreg_off_fn *off_fn,
+                   sve_ldst1_host_fn *host_fn,
+                   sve_ldst1_tlb_fn *tlb_fn)
+{
+    uint32_t mtedesc = desc >> (SIMD_DATA_SHIFT + SVE_MTEDESC_SHIFT);
+    /* Remove mtedesc from the normal sve descriptor. */
+    desc = extract32(desc, 0, SIMD_DATA_SHIFT + SVE_MTEDESC_SHIFT);
+
+    /*
+     * ??? TODO: For the 32-bit offset extractions, base + ofs cannot
+     * offset base entirely over the address space hole to change the
+     * pointer tag, or change the bit55 selector.  So we could here
+     * examine TBI + TCMA like we do for sve_ldN_r_mte().
+     */
+    sve_ld1_z(env, vd, vg, vm, base, desc, retaddr, mtedesc,
+              esize, msize, off_fn, host_fn, tlb_fn);
+}
+
 #define DO_LD1_ZPZ_S(MEM, OFS, MSZ) \
 void HELPER(sve_ld##MEM##_##OFS)(CPUARMState *env, void *vd, void *vg,       \
                                  void *vm, target_ulong base, uint32_t desc) \
 {                                                                            \
-    sve_ld1_z(env, vd, vg, vm, base, desc, GETPC(), 4, 1 << MSZ,             \
+    sve_ld1_z(env, vd, vg, vm, base, desc, GETPC(), 0, 4, 1 << MSZ,          \
               off_##OFS##_s, sve_ld1##MEM##_host, sve_ld1##MEM##_tlb);       \
+}                                                                            \
+void HELPER(sve_ld##MEM##_##OFS##_mte)(CPUARMState *env, void *vd, void *vg, \
+     void *vm, target_ulong base, uint32_t desc)                             \
+{                                                                            \
+    sve_ld1_z_mte(env, vd, vg, vm, base, desc, GETPC(), 4, 1 << MSZ,         \
+                  off_##OFS##_s, sve_ld1##MEM##_host, sve_ld1##MEM##_tlb);   \
 }
 
 #define DO_LD1_ZPZ_D(MEM, OFS, MSZ) \
 void HELPER(sve_ld##MEM##_##OFS)(CPUARMState *env, void *vd, void *vg,       \
                                  void *vm, target_ulong base, uint32_t desc) \
 {                                                                            \
-    sve_ld1_z(env, vd, vg, vm, base, desc, GETPC(), 8, 1 << MSZ,             \
+    sve_ld1_z(env, vd, vg, vm, base, desc, GETPC(), 0, 8, 1 << MSZ,          \
               off_##OFS##_d, sve_ld1##MEM##_host, sve_ld1##MEM##_tlb);       \
+}                                                                            \
+void HELPER(sve_ld##MEM##_##OFS##_mte)(CPUARMState *env, void *vd, void *vg, \
+    void *vm, target_ulong base, uint32_t desc)                              \
+{                                                                            \
+    sve_ld1_z_mte(env, vd, vg, vm, base, desc, GETPC(), 8, 1 << MSZ,         \
+                  off_##OFS##_d, sve_ld1##MEM##_host, sve_ld1##MEM##_tlb);   \
 }
 
 DO_LD1_ZPZ_S(bsu, zsu, MO_8)
@@ -5498,7 +5536,8 @@ DO_LD1_ZPZ_D(dd_be, zd, MO_64)
 static inline QEMU_ALWAYS_INLINE
 void sve_ldff1_z(CPUARMState *env, void *vd, uint64_t *vg, void *vm,
                  target_ulong base, uint32_t desc, uintptr_t retaddr,
-                 const int esz, const int msz, zreg_off_fn *off_fn,
+                 uint32_t mtedesc, const int esz, const int msz,
+                 zreg_off_fn *off_fn,
                  sve_ldst1_host_fn *host_fn,
                  sve_ldst1_tlb_fn *tlb_fn)
 {
@@ -5523,6 +5562,9 @@ void sve_ldff1_z(CPUARMState *env, void *vd, uint64_t *vg, void *vm,
      * Probe the first element, allowing faults.
      */
     addr = base + (off_fn(vm, reg_off) << scale);
+    if (mtedesc) {
+        mte_check1(env, mtedesc, addr, retaddr);
+    }
     tlb_fn(env, vd, reg_off, addr, retaddr);
 
     /* After any fault, zero the other elements. */
@@ -5555,7 +5597,11 @@ void sve_ldff1_z(CPUARMState *env, void *vd, uint64_t *vg, void *vm,
                      (env_cpu(env), addr, msize) & BP_MEM_READ)) {
                     goto fault;
                 }
-                /* TODO: MTE check. */
+                if (mtedesc &&
+                    arm_tlb_mte_tagged(&info.attrs) &&
+                    !mte_probe1(env, mtedesc, addr)) {
+                    goto fault;
+                }
 
                 host_fn(vd, reg_off, info.host);
             }
@@ -5568,20 +5614,58 @@ void sve_ldff1_z(CPUARMState *env, void *vd, uint64_t *vg, void *vm,
     record_fault(env, reg_off, reg_max);
 }
 
-#define DO_LDFF1_ZPZ_S(MEM, OFS, MSZ) \
-void HELPER(sve_ldff##MEM##_##OFS)(CPUARMState *env, void *vd, void *vg,       \
-                                   void *vm, target_ulong base, uint32_t desc) \
-{                                                                              \
-    sve_ldff1_z(env, vd, vg, vm, base, desc, GETPC(), MO_32, MSZ,              \
-                off_##OFS##_s, sve_ld1##MEM##_host, sve_ld1##MEM##_tlb);       \
+static inline QEMU_ALWAYS_INLINE
+void sve_ldff1_z_mte(CPUARMState *env, void *vd, uint64_t *vg, void *vm,
+                     target_ulong base, uint32_t desc, uintptr_t retaddr,
+                     const int esz, const int msz,
+                     zreg_off_fn *off_fn,
+                     sve_ldst1_host_fn *host_fn,
+                     sve_ldst1_tlb_fn *tlb_fn)
+{
+    uint32_t mtedesc = desc >> (SIMD_DATA_SHIFT + SVE_MTEDESC_SHIFT);
+    /* Remove mtedesc from the normal sve descriptor. */
+    desc = extract32(desc, 0, SIMD_DATA_SHIFT + SVE_MTEDESC_SHIFT);
+
+    /*
+     * ??? TODO: For the 32-bit offset extractions, base + ofs cannot
+     * offset base entirely over the address space hole to change the
+     * pointer tag, or change the bit55 selector.  So we could here
+     * examine TBI + TCMA like we do for sve_ldN_r_mte().
+     */
+    sve_ldff1_z(env, vd, vg, vm, base, desc, retaddr, mtedesc,
+                esz, msz, off_fn, host_fn, tlb_fn);
 }
 
-#define DO_LDFF1_ZPZ_D(MEM, OFS, MSZ) \
-void HELPER(sve_ldff##MEM##_##OFS)(CPUARMState *env, void *vd, void *vg,       \
-                                   void *vm, target_ulong base, uint32_t desc) \
-{                                                                              \
-    sve_ldff1_z(env, vd, vg, vm, base, desc, GETPC(), MO_64, MSZ,              \
-                off_##OFS##_d, sve_ld1##MEM##_host, sve_ld1##MEM##_tlb);       \
+#define DO_LDFF1_ZPZ_S(MEM, OFS, MSZ)                                   \
+void HELPER(sve_ldff##MEM##_##OFS)                                      \
+    (CPUARMState *env, void *vd, void *vg,                              \
+     void *vm, target_ulong base, uint32_t desc)                        \
+{                                                                       \
+    sve_ldff1_z(env, vd, vg, vm, base, desc, GETPC(), 0, MO_32, MSZ,    \
+                off_##OFS##_s, sve_ld1##MEM##_host, sve_ld1##MEM##_tlb); \
+}                                                                       \
+void HELPER(sve_ldff##MEM##_##OFS##_mte)                                \
+    (CPUARMState *env, void *vd, void *vg,                              \
+     void *vm, target_ulong base, uint32_t desc)                        \
+{                                                                       \
+    sve_ldff1_z_mte(env, vd, vg, vm, base, desc, GETPC(), MO_32, MSZ,   \
+                    off_##OFS##_s, sve_ld1##MEM##_host, sve_ld1##MEM##_tlb); \
+}
+
+#define DO_LDFF1_ZPZ_D(MEM, OFS, MSZ)                                   \
+void HELPER(sve_ldff##MEM##_##OFS)                                      \
+    (CPUARMState *env, void *vd, void *vg,                              \
+     void *vm, target_ulong base, uint32_t desc)                        \
+{                                                                       \
+    sve_ldff1_z(env, vd, vg, vm, base, desc, GETPC(), 0, MO_64, MSZ,    \
+                off_##OFS##_d, sve_ld1##MEM##_host, sve_ld1##MEM##_tlb); \
+}                                                                       \
+void HELPER(sve_ldff##MEM##_##OFS##_mte)                                \
+    (CPUARMState *env, void *vd, void *vg,                              \
+     void *vm, target_ulong base, uint32_t desc)                        \
+{                                                                       \
+    sve_ldff1_z_mte(env, vd, vg, vm, base, desc, GETPC(), MO_64, MSZ,   \
+                    off_##OFS##_d, sve_ld1##MEM##_host, sve_ld1##MEM##_tlb); \
 }
 
 DO_LDFF1_ZPZ_S(bsu, zsu, MO_8)
@@ -5653,7 +5737,8 @@ DO_LDFF1_ZPZ_D(dd_be, zd, MO_64)
 static inline QEMU_ALWAYS_INLINE
 void sve_st1_z(CPUARMState *env, void *vd, uint64_t *vg, void *vm,
                target_ulong base, uint32_t desc, uintptr_t retaddr,
-               int esize, int msize, zreg_off_fn *off_fn,
+               uint32_t mtedesc, int esize, int msize,
+               zreg_off_fn *off_fn,
                sve_ldst1_host_fn *host_fn,
                sve_ldst1_tlb_fn *tlb_fn)
 {
@@ -5697,7 +5782,10 @@ void sve_st1_z(CPUARMState *env, void *vd, uint64_t *vg, void *vm,
                     cpu_check_watchpoint(env_cpu(env), addr, msize,
                                          info.attrs, BP_MEM_WRITE, retaddr);
                 }
-                /* TODO: MTE check. */
+
+                if (mtedesc && arm_tlb_mte_tagged(&info.attrs)) {
+                    mte_check1(env, mtedesc, addr, retaddr);
+                }
             }
             i += 1;
             reg_off += esize;
@@ -5727,20 +5815,53 @@ void sve_st1_z(CPUARMState *env, void *vd, uint64_t *vg, void *vm,
     } while (reg_off < reg_max);
 }
 
-#define DO_ST1_ZPZ_S(MEM, OFS, MSZ) \
-void HELPER(sve_st##MEM##_##OFS)(CPUARMState *env, void *vd, void *vg,       \
-                                 void *vm, target_ulong base, uint32_t desc) \
-{                                                                            \
-    sve_st1_z(env, vd, vg, vm, base, desc, GETPC(), 4, 1 << MSZ,             \
-              off_##OFS##_s, sve_st1##MEM##_host, sve_st1##MEM##_tlb);       \
+static inline QEMU_ALWAYS_INLINE
+void sve_st1_z_mte(CPUARMState *env, void *vd, uint64_t *vg, void *vm,
+                   target_ulong base, uint32_t desc, uintptr_t retaddr,
+                   int esize, int msize, zreg_off_fn *off_fn,
+                   sve_ldst1_host_fn *host_fn,
+                   sve_ldst1_tlb_fn *tlb_fn)
+{
+    uint32_t mtedesc = desc >> (SIMD_DATA_SHIFT + SVE_MTEDESC_SHIFT);
+    /* Remove mtedesc from the normal sve descriptor. */
+    desc = extract32(desc, 0, SIMD_DATA_SHIFT + SVE_MTEDESC_SHIFT);
+
+    /*
+     * ??? TODO: For the 32-bit offset extractions, base + ofs cannot
+     * offset base entirely over the address space hole to change the
+     * pointer tag, or change the bit55 selector.  So we could here
+     * examine TBI + TCMA like we do for sve_ldN_r_mte().
+     */
+    sve_st1_z(env, vd, vg, vm, base, desc, retaddr, mtedesc,
+              esize, msize, off_fn, host_fn, tlb_fn);
 }
 
-#define DO_ST1_ZPZ_D(MEM, OFS, MSZ) \
-void HELPER(sve_st##MEM##_##OFS)(CPUARMState *env, void *vd, void *vg,       \
+#define DO_ST1_ZPZ_S(MEM, OFS, MSZ)                                     \
+void HELPER(sve_st##MEM##_##OFS)(CPUARMState *env, void *vd, void *vg,  \
                                  void *vm, target_ulong base, uint32_t desc) \
-{                                                                            \
-    sve_st1_z(env, vd, vg, vm, base, desc, GETPC(), 8, 1 << MSZ,             \
-              off_##OFS##_d, sve_st1##MEM##_host, sve_st1##MEM##_tlb);       \
+{                                                                       \
+    sve_st1_z(env, vd, vg, vm, base, desc, GETPC(), 0, 4, 1 << MSZ,     \
+              off_##OFS##_s, sve_st1##MEM##_host, sve_st1##MEM##_tlb);  \
+}                                                                       \
+void HELPER(sve_st##MEM##_##OFS##_mte)(CPUARMState *env, void *vd, void *vg, \
+    void *vm, target_ulong base, uint32_t desc)                         \
+{                                                                       \
+    sve_st1_z_mte(env, vd, vg, vm, base, desc, GETPC(), 4, 1 << MSZ,    \
+                  off_##OFS##_s, sve_st1##MEM##_host, sve_st1##MEM##_tlb); \
+}
+
+#define DO_ST1_ZPZ_D(MEM, OFS, MSZ)                                     \
+void HELPER(sve_st##MEM##_##OFS)(CPUARMState *env, void *vd, void *vg,  \
+                                 void *vm, target_ulong base, uint32_t desc) \
+{                                                                       \
+    sve_st1_z(env, vd, vg, vm, base, desc, GETPC(), 0, 8, 1 << MSZ,     \
+              off_##OFS##_d, sve_st1##MEM##_host, sve_st1##MEM##_tlb);  \
+}                                                                       \
+void HELPER(sve_st##MEM##_##OFS##_mte)(CPUARMState *env, void *vd, void *vg, \
+    void *vm, target_ulong base, uint32_t desc)                         \
+{                                                                       \
+    sve_st1_z_mte(env, vd, vg, vm, base, desc, GETPC(), 8, 1 << MSZ,    \
+                  off_##OFS##_d, sve_st1##MEM##_host, sve_st1##MEM##_tlb); \
 }
 
 DO_ST1_ZPZ_S(bs, zsu, MO_8)
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 04eda9a1264..f318ca265f2 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -5261,7 +5261,7 @@ static bool trans_ST_zpri(DisasContext *s, arg_rpri_store *a)
  */
 
 static void do_mem_zpz(DisasContext *s, int zt, int pg, int zm,
-                       int scale, TCGv_i64 scalar, int msz,
+                       int scale, TCGv_i64 scalar, int msz, bool is_write,
                        gen_helper_gvec_mem_scatter *fn)
 {
     unsigned vsz = vec_full_reg_size(s);
@@ -5269,8 +5269,16 @@ static void do_mem_zpz(DisasContext *s, int zt, int pg, int zm,
     TCGv_ptr t_pg = tcg_temp_new_ptr();
     TCGv_ptr t_zt = tcg_temp_new_ptr();
     TCGv_i32 t_desc;
-    int desc;
+    int desc = 0;
 
+    if (s->mte_active[0]) {
+        desc = FIELD_DP32(desc, MTEDESC, MIDX, get_mem_index(s));
+        desc = FIELD_DP32(desc, MTEDESC, TBI, s->tbid);
+        desc = FIELD_DP32(desc, MTEDESC, TCMA, s->tcma);
+        desc = FIELD_DP32(desc, MTEDESC, WRITE, is_write);
+        desc = FIELD_DP32(desc, MTEDESC, ESIZE, 1 << msz);
+        desc <<= SVE_MTEDESC_SHIFT;
+    }
     desc = simd_desc(vsz, vsz, scale);
     t_desc = tcg_const_i32(desc);
 
@@ -5285,176 +5293,339 @@ static void do_mem_zpz(DisasContext *s, int zt, int pg, int zm,
     tcg_temp_free_i32(t_desc);
 }
 
-/* Indexed by [be][ff][xs][u][msz].  */
-static gen_helper_gvec_mem_scatter * const gather_load_fn32[2][2][2][2][3] = {
-    /* Little-endian */
-    { { { { gen_helper_sve_ldbss_zsu,
-            gen_helper_sve_ldhss_le_zsu,
-            NULL, },
-          { gen_helper_sve_ldbsu_zsu,
-            gen_helper_sve_ldhsu_le_zsu,
-            gen_helper_sve_ldss_le_zsu, } },
-        { { gen_helper_sve_ldbss_zss,
-            gen_helper_sve_ldhss_le_zss,
-            NULL, },
-          { gen_helper_sve_ldbsu_zss,
-            gen_helper_sve_ldhsu_le_zss,
-            gen_helper_sve_ldss_le_zss, } } },
+/* Indexed by [mte][be][ff][xs][u][msz].  */
+static gen_helper_gvec_mem_scatter * const
+gather_load_fn32[2][2][2][2][2][3] = {
+    { /* MTE Inactive */
+        { /* Little-endian */
+            { { { gen_helper_sve_ldbss_zsu,
+                  gen_helper_sve_ldhss_le_zsu,
+                  NULL, },
+                { gen_helper_sve_ldbsu_zsu,
+                  gen_helper_sve_ldhsu_le_zsu,
+                  gen_helper_sve_ldss_le_zsu, } },
+              { { gen_helper_sve_ldbss_zss,
+                  gen_helper_sve_ldhss_le_zss,
+                  NULL, },
+                { gen_helper_sve_ldbsu_zss,
+                  gen_helper_sve_ldhsu_le_zss,
+                  gen_helper_sve_ldss_le_zss, } } },
 
-      /* First-fault */
-      { { { gen_helper_sve_ldffbss_zsu,
-            gen_helper_sve_ldffhss_le_zsu,
-            NULL, },
-          { gen_helper_sve_ldffbsu_zsu,
-            gen_helper_sve_ldffhsu_le_zsu,
-            gen_helper_sve_ldffss_le_zsu, } },
-        { { gen_helper_sve_ldffbss_zss,
-            gen_helper_sve_ldffhss_le_zss,
-            NULL, },
-          { gen_helper_sve_ldffbsu_zss,
-            gen_helper_sve_ldffhsu_le_zss,
-            gen_helper_sve_ldffss_le_zss, } } } },
+            /* First-fault */
+            { { { gen_helper_sve_ldffbss_zsu,
+                  gen_helper_sve_ldffhss_le_zsu,
+                  NULL, },
+                { gen_helper_sve_ldffbsu_zsu,
+                  gen_helper_sve_ldffhsu_le_zsu,
+                  gen_helper_sve_ldffss_le_zsu, } },
+              { { gen_helper_sve_ldffbss_zss,
+                  gen_helper_sve_ldffhss_le_zss,
+                  NULL, },
+                { gen_helper_sve_ldffbsu_zss,
+                  gen_helper_sve_ldffhsu_le_zss,
+                  gen_helper_sve_ldffss_le_zss, } } } },
 
-    /* Big-endian */
-    { { { { gen_helper_sve_ldbss_zsu,
-            gen_helper_sve_ldhss_be_zsu,
-            NULL, },
-          { gen_helper_sve_ldbsu_zsu,
-            gen_helper_sve_ldhsu_be_zsu,
-            gen_helper_sve_ldss_be_zsu, } },
-        { { gen_helper_sve_ldbss_zss,
-            gen_helper_sve_ldhss_be_zss,
-            NULL, },
-          { gen_helper_sve_ldbsu_zss,
-            gen_helper_sve_ldhsu_be_zss,
-            gen_helper_sve_ldss_be_zss, } } },
+        { /* Big-endian */
+            { { { gen_helper_sve_ldbss_zsu,
+                  gen_helper_sve_ldhss_be_zsu,
+                  NULL, },
+                { gen_helper_sve_ldbsu_zsu,
+                  gen_helper_sve_ldhsu_be_zsu,
+                  gen_helper_sve_ldss_be_zsu, } },
+              { { gen_helper_sve_ldbss_zss,
+                  gen_helper_sve_ldhss_be_zss,
+                  NULL, },
+                { gen_helper_sve_ldbsu_zss,
+                  gen_helper_sve_ldhsu_be_zss,
+                  gen_helper_sve_ldss_be_zss, } } },
 
-      /* First-fault */
-      { { { gen_helper_sve_ldffbss_zsu,
-            gen_helper_sve_ldffhss_be_zsu,
-            NULL, },
-          { gen_helper_sve_ldffbsu_zsu,
-            gen_helper_sve_ldffhsu_be_zsu,
-            gen_helper_sve_ldffss_be_zsu, } },
-        { { gen_helper_sve_ldffbss_zss,
-            gen_helper_sve_ldffhss_be_zss,
-            NULL, },
-          { gen_helper_sve_ldffbsu_zss,
-            gen_helper_sve_ldffhsu_be_zss,
-            gen_helper_sve_ldffss_be_zss, } } } },
+            /* First-fault */
+            { { { gen_helper_sve_ldffbss_zsu,
+                  gen_helper_sve_ldffhss_be_zsu,
+                  NULL, },
+                { gen_helper_sve_ldffbsu_zsu,
+                  gen_helper_sve_ldffhsu_be_zsu,
+                  gen_helper_sve_ldffss_be_zsu, } },
+              { { gen_helper_sve_ldffbss_zss,
+                  gen_helper_sve_ldffhss_be_zss,
+                  NULL, },
+                { gen_helper_sve_ldffbsu_zss,
+                  gen_helper_sve_ldffhsu_be_zss,
+                  gen_helper_sve_ldffss_be_zss, } } } } },
+    { /* MTE Active */
+        { /* Little-endian */
+            { { { gen_helper_sve_ldbss_zsu_mte,
+                  gen_helper_sve_ldhss_le_zsu_mte,
+                  NULL, },
+                { gen_helper_sve_ldbsu_zsu_mte,
+                  gen_helper_sve_ldhsu_le_zsu_mte,
+                  gen_helper_sve_ldss_le_zsu_mte, } },
+              { { gen_helper_sve_ldbss_zss_mte,
+                  gen_helper_sve_ldhss_le_zss_mte,
+                  NULL, },
+                { gen_helper_sve_ldbsu_zss_mte,
+                  gen_helper_sve_ldhsu_le_zss_mte,
+                  gen_helper_sve_ldss_le_zss_mte, } } },
+
+            /* First-fault */
+            { { { gen_helper_sve_ldffbss_zsu_mte,
+                  gen_helper_sve_ldffhss_le_zsu_mte,
+                  NULL, },
+                { gen_helper_sve_ldffbsu_zsu_mte,
+                  gen_helper_sve_ldffhsu_le_zsu_mte,
+                  gen_helper_sve_ldffss_le_zsu_mte, } },
+              { { gen_helper_sve_ldffbss_zss_mte,
+                  gen_helper_sve_ldffhss_le_zss_mte,
+                  NULL, },
+                { gen_helper_sve_ldffbsu_zss_mte,
+                  gen_helper_sve_ldffhsu_le_zss_mte,
+                  gen_helper_sve_ldffss_le_zss_mte, } } } },
+
+        { /* Big-endian */
+            { { { gen_helper_sve_ldbss_zsu_mte,
+                  gen_helper_sve_ldhss_be_zsu_mte,
+                  NULL, },
+                { gen_helper_sve_ldbsu_zsu_mte,
+                  gen_helper_sve_ldhsu_be_zsu_mte,
+                  gen_helper_sve_ldss_be_zsu_mte, } },
+              { { gen_helper_sve_ldbss_zss_mte,
+                  gen_helper_sve_ldhss_be_zss_mte,
+                  NULL, },
+                { gen_helper_sve_ldbsu_zss_mte,
+                  gen_helper_sve_ldhsu_be_zss_mte,
+                  gen_helper_sve_ldss_be_zss_mte, } } },
+
+            /* First-fault */
+            { { { gen_helper_sve_ldffbss_zsu_mte,
+                  gen_helper_sve_ldffhss_be_zsu_mte,
+                  NULL, },
+                { gen_helper_sve_ldffbsu_zsu_mte,
+                  gen_helper_sve_ldffhsu_be_zsu_mte,
+                  gen_helper_sve_ldffss_be_zsu_mte, } },
+              { { gen_helper_sve_ldffbss_zss_mte,
+                  gen_helper_sve_ldffhss_be_zss_mte,
+                  NULL, },
+                { gen_helper_sve_ldffbsu_zss_mte,
+                  gen_helper_sve_ldffhsu_be_zss_mte,
+                  gen_helper_sve_ldffss_be_zss_mte, } } } } },
 };
 
 /* Note that we overload xs=2 to indicate 64-bit offset.  */
-static gen_helper_gvec_mem_scatter * const gather_load_fn64[2][2][3][2][4] = {
-    /* Little-endian */
-    { { { { gen_helper_sve_ldbds_zsu,
-            gen_helper_sve_ldhds_le_zsu,
-            gen_helper_sve_ldsds_le_zsu,
-            NULL, },
-          { gen_helper_sve_ldbdu_zsu,
-            gen_helper_sve_ldhdu_le_zsu,
-            gen_helper_sve_ldsdu_le_zsu,
-            gen_helper_sve_lddd_le_zsu, } },
-        { { gen_helper_sve_ldbds_zss,
-            gen_helper_sve_ldhds_le_zss,
-            gen_helper_sve_ldsds_le_zss,
-            NULL, },
-          { gen_helper_sve_ldbdu_zss,
-            gen_helper_sve_ldhdu_le_zss,
-            gen_helper_sve_ldsdu_le_zss,
-            gen_helper_sve_lddd_le_zss, } },
-        { { gen_helper_sve_ldbds_zd,
-            gen_helper_sve_ldhds_le_zd,
-            gen_helper_sve_ldsds_le_zd,
-            NULL, },
-          { gen_helper_sve_ldbdu_zd,
-            gen_helper_sve_ldhdu_le_zd,
-            gen_helper_sve_ldsdu_le_zd,
-            gen_helper_sve_lddd_le_zd, } } },
+static gen_helper_gvec_mem_scatter * const
+gather_load_fn64[2][2][2][3][2][4] = {
+    { /* MTE Inactive */
+        { /* Little-endian */
+            { { { gen_helper_sve_ldbds_zsu,
+                  gen_helper_sve_ldhds_le_zsu,
+                  gen_helper_sve_ldsds_le_zsu,
+                  NULL, },
+                { gen_helper_sve_ldbdu_zsu,
+                  gen_helper_sve_ldhdu_le_zsu,
+                  gen_helper_sve_ldsdu_le_zsu,
+                  gen_helper_sve_lddd_le_zsu, } },
+              { { gen_helper_sve_ldbds_zss,
+                  gen_helper_sve_ldhds_le_zss,
+                  gen_helper_sve_ldsds_le_zss,
+                  NULL, },
+                { gen_helper_sve_ldbdu_zss,
+                  gen_helper_sve_ldhdu_le_zss,
+                  gen_helper_sve_ldsdu_le_zss,
+                  gen_helper_sve_lddd_le_zss, } },
+              { { gen_helper_sve_ldbds_zd,
+                  gen_helper_sve_ldhds_le_zd,
+                  gen_helper_sve_ldsds_le_zd,
+                  NULL, },
+                { gen_helper_sve_ldbdu_zd,
+                  gen_helper_sve_ldhdu_le_zd,
+                  gen_helper_sve_ldsdu_le_zd,
+                  gen_helper_sve_lddd_le_zd, } } },
 
-      /* First-fault */
-      { { { gen_helper_sve_ldffbds_zsu,
-            gen_helper_sve_ldffhds_le_zsu,
-            gen_helper_sve_ldffsds_le_zsu,
-            NULL, },
-          { gen_helper_sve_ldffbdu_zsu,
-            gen_helper_sve_ldffhdu_le_zsu,
-            gen_helper_sve_ldffsdu_le_zsu,
-            gen_helper_sve_ldffdd_le_zsu, } },
-        { { gen_helper_sve_ldffbds_zss,
-            gen_helper_sve_ldffhds_le_zss,
-            gen_helper_sve_ldffsds_le_zss,
-            NULL, },
-          { gen_helper_sve_ldffbdu_zss,
-            gen_helper_sve_ldffhdu_le_zss,
-            gen_helper_sve_ldffsdu_le_zss,
-            gen_helper_sve_ldffdd_le_zss, } },
-        { { gen_helper_sve_ldffbds_zd,
-            gen_helper_sve_ldffhds_le_zd,
-            gen_helper_sve_ldffsds_le_zd,
-            NULL, },
-          { gen_helper_sve_ldffbdu_zd,
-            gen_helper_sve_ldffhdu_le_zd,
-            gen_helper_sve_ldffsdu_le_zd,
-            gen_helper_sve_ldffdd_le_zd, } } } },
+            /* First-fault */
+            { { { gen_helper_sve_ldffbds_zsu,
+                  gen_helper_sve_ldffhds_le_zsu,
+                  gen_helper_sve_ldffsds_le_zsu,
+                  NULL, },
+                { gen_helper_sve_ldffbdu_zsu,
+                  gen_helper_sve_ldffhdu_le_zsu,
+                  gen_helper_sve_ldffsdu_le_zsu,
+                  gen_helper_sve_ldffdd_le_zsu, } },
+              { { gen_helper_sve_ldffbds_zss,
+                  gen_helper_sve_ldffhds_le_zss,
+                  gen_helper_sve_ldffsds_le_zss,
+                  NULL, },
+                { gen_helper_sve_ldffbdu_zss,
+                  gen_helper_sve_ldffhdu_le_zss,
+                  gen_helper_sve_ldffsdu_le_zss,
+                  gen_helper_sve_ldffdd_le_zss, } },
+              { { gen_helper_sve_ldffbds_zd,
+                  gen_helper_sve_ldffhds_le_zd,
+                  gen_helper_sve_ldffsds_le_zd,
+                  NULL, },
+                { gen_helper_sve_ldffbdu_zd,
+                  gen_helper_sve_ldffhdu_le_zd,
+                  gen_helper_sve_ldffsdu_le_zd,
+                  gen_helper_sve_ldffdd_le_zd, } } } },
+        { /* Big-endian */
+            { { { gen_helper_sve_ldbds_zsu,
+                  gen_helper_sve_ldhds_be_zsu,
+                  gen_helper_sve_ldsds_be_zsu,
+                  NULL, },
+                { gen_helper_sve_ldbdu_zsu,
+                  gen_helper_sve_ldhdu_be_zsu,
+                  gen_helper_sve_ldsdu_be_zsu,
+                  gen_helper_sve_lddd_be_zsu, } },
+              { { gen_helper_sve_ldbds_zss,
+                  gen_helper_sve_ldhds_be_zss,
+                  gen_helper_sve_ldsds_be_zss,
+                  NULL, },
+                { gen_helper_sve_ldbdu_zss,
+                  gen_helper_sve_ldhdu_be_zss,
+                  gen_helper_sve_ldsdu_be_zss,
+                  gen_helper_sve_lddd_be_zss, } },
+              { { gen_helper_sve_ldbds_zd,
+                  gen_helper_sve_ldhds_be_zd,
+                  gen_helper_sve_ldsds_be_zd,
+                  NULL, },
+                { gen_helper_sve_ldbdu_zd,
+                  gen_helper_sve_ldhdu_be_zd,
+                  gen_helper_sve_ldsdu_be_zd,
+                  gen_helper_sve_lddd_be_zd, } } },
 
-    /* Big-endian */
-    { { { { gen_helper_sve_ldbds_zsu,
-            gen_helper_sve_ldhds_be_zsu,
-            gen_helper_sve_ldsds_be_zsu,
-            NULL, },
-          { gen_helper_sve_ldbdu_zsu,
-            gen_helper_sve_ldhdu_be_zsu,
-            gen_helper_sve_ldsdu_be_zsu,
-            gen_helper_sve_lddd_be_zsu, } },
-        { { gen_helper_sve_ldbds_zss,
-            gen_helper_sve_ldhds_be_zss,
-            gen_helper_sve_ldsds_be_zss,
-            NULL, },
-          { gen_helper_sve_ldbdu_zss,
-            gen_helper_sve_ldhdu_be_zss,
-            gen_helper_sve_ldsdu_be_zss,
-            gen_helper_sve_lddd_be_zss, } },
-        { { gen_helper_sve_ldbds_zd,
-            gen_helper_sve_ldhds_be_zd,
-            gen_helper_sve_ldsds_be_zd,
-            NULL, },
-          { gen_helper_sve_ldbdu_zd,
-            gen_helper_sve_ldhdu_be_zd,
-            gen_helper_sve_ldsdu_be_zd,
-            gen_helper_sve_lddd_be_zd, } } },
+            /* First-fault */
+            { { { gen_helper_sve_ldffbds_zsu,
+                  gen_helper_sve_ldffhds_be_zsu,
+                  gen_helper_sve_ldffsds_be_zsu,
+                  NULL, },
+                { gen_helper_sve_ldffbdu_zsu,
+                  gen_helper_sve_ldffhdu_be_zsu,
+                  gen_helper_sve_ldffsdu_be_zsu,
+                  gen_helper_sve_ldffdd_be_zsu, } },
+              { { gen_helper_sve_ldffbds_zss,
+                  gen_helper_sve_ldffhds_be_zss,
+                  gen_helper_sve_ldffsds_be_zss,
+                  NULL, },
+                { gen_helper_sve_ldffbdu_zss,
+                  gen_helper_sve_ldffhdu_be_zss,
+                  gen_helper_sve_ldffsdu_be_zss,
+                  gen_helper_sve_ldffdd_be_zss, } },
+              { { gen_helper_sve_ldffbds_zd,
+                  gen_helper_sve_ldffhds_be_zd,
+                  gen_helper_sve_ldffsds_be_zd,
+                  NULL, },
+                { gen_helper_sve_ldffbdu_zd,
+                  gen_helper_sve_ldffhdu_be_zd,
+                  gen_helper_sve_ldffsdu_be_zd,
+                  gen_helper_sve_ldffdd_be_zd, } } } } },
+    { /* MTE Active */
+        { /* Little-endian */
+            { { { gen_helper_sve_ldbds_zsu_mte,
+                  gen_helper_sve_ldhds_le_zsu_mte,
+                  gen_helper_sve_ldsds_le_zsu_mte,
+                  NULL, },
+                { gen_helper_sve_ldbdu_zsu_mte,
+                  gen_helper_sve_ldhdu_le_zsu_mte,
+                  gen_helper_sve_ldsdu_le_zsu_mte,
+                  gen_helper_sve_lddd_le_zsu_mte, } },
+              { { gen_helper_sve_ldbds_zss_mte,
+                  gen_helper_sve_ldhds_le_zss_mte,
+                  gen_helper_sve_ldsds_le_zss_mte,
+                  NULL, },
+                { gen_helper_sve_ldbdu_zss_mte,
+                  gen_helper_sve_ldhdu_le_zss_mte,
+                  gen_helper_sve_ldsdu_le_zss_mte,
+                  gen_helper_sve_lddd_le_zss_mte, } },
+              { { gen_helper_sve_ldbds_zd_mte,
+                  gen_helper_sve_ldhds_le_zd_mte,
+                  gen_helper_sve_ldsds_le_zd_mte,
+                  NULL, },
+                { gen_helper_sve_ldbdu_zd_mte,
+                  gen_helper_sve_ldhdu_le_zd_mte,
+                  gen_helper_sve_ldsdu_le_zd_mte,
+                  gen_helper_sve_lddd_le_zd_mte, } } },
 
-      /* First-fault */
-      { { { gen_helper_sve_ldffbds_zsu,
-            gen_helper_sve_ldffhds_be_zsu,
-            gen_helper_sve_ldffsds_be_zsu,
-            NULL, },
-          { gen_helper_sve_ldffbdu_zsu,
-            gen_helper_sve_ldffhdu_be_zsu,
-            gen_helper_sve_ldffsdu_be_zsu,
-            gen_helper_sve_ldffdd_be_zsu, } },
-        { { gen_helper_sve_ldffbds_zss,
-            gen_helper_sve_ldffhds_be_zss,
-            gen_helper_sve_ldffsds_be_zss,
-            NULL, },
-          { gen_helper_sve_ldffbdu_zss,
-            gen_helper_sve_ldffhdu_be_zss,
-            gen_helper_sve_ldffsdu_be_zss,
-            gen_helper_sve_ldffdd_be_zss, } },
-        { { gen_helper_sve_ldffbds_zd,
-            gen_helper_sve_ldffhds_be_zd,
-            gen_helper_sve_ldffsds_be_zd,
-            NULL, },
-          { gen_helper_sve_ldffbdu_zd,
-            gen_helper_sve_ldffhdu_be_zd,
-            gen_helper_sve_ldffsdu_be_zd,
-            gen_helper_sve_ldffdd_be_zd, } } } },
+            /* First-fault */
+            { { { gen_helper_sve_ldffbds_zsu_mte,
+                  gen_helper_sve_ldffhds_le_zsu_mte,
+                  gen_helper_sve_ldffsds_le_zsu_mte,
+                  NULL, },
+                { gen_helper_sve_ldffbdu_zsu_mte,
+                  gen_helper_sve_ldffhdu_le_zsu_mte,
+                  gen_helper_sve_ldffsdu_le_zsu_mte,
+                  gen_helper_sve_ldffdd_le_zsu_mte, } },
+              { { gen_helper_sve_ldffbds_zss_mte,
+                  gen_helper_sve_ldffhds_le_zss_mte,
+                  gen_helper_sve_ldffsds_le_zss_mte,
+                  NULL, },
+                { gen_helper_sve_ldffbdu_zss_mte,
+                  gen_helper_sve_ldffhdu_le_zss_mte,
+                  gen_helper_sve_ldffsdu_le_zss_mte,
+                  gen_helper_sve_ldffdd_le_zss_mte, } },
+              { { gen_helper_sve_ldffbds_zd_mte,
+                  gen_helper_sve_ldffhds_le_zd_mte,
+                  gen_helper_sve_ldffsds_le_zd_mte,
+                  NULL, },
+                { gen_helper_sve_ldffbdu_zd_mte,
+                  gen_helper_sve_ldffhdu_le_zd_mte,
+                  gen_helper_sve_ldffsdu_le_zd_mte,
+                  gen_helper_sve_ldffdd_le_zd_mte, } } } },
+        { /* Big-endian */
+            { { { gen_helper_sve_ldbds_zsu_mte,
+                  gen_helper_sve_ldhds_be_zsu_mte,
+                  gen_helper_sve_ldsds_be_zsu_mte,
+                  NULL, },
+                { gen_helper_sve_ldbdu_zsu_mte,
+                  gen_helper_sve_ldhdu_be_zsu_mte,
+                  gen_helper_sve_ldsdu_be_zsu_mte,
+                  gen_helper_sve_lddd_be_zsu_mte, } },
+              { { gen_helper_sve_ldbds_zss_mte,
+                  gen_helper_sve_ldhds_be_zss_mte,
+                  gen_helper_sve_ldsds_be_zss_mte,
+                  NULL, },
+                { gen_helper_sve_ldbdu_zss_mte,
+                  gen_helper_sve_ldhdu_be_zss_mte,
+                  gen_helper_sve_ldsdu_be_zss_mte,
+                  gen_helper_sve_lddd_be_zss_mte, } },
+              { { gen_helper_sve_ldbds_zd_mte,
+                  gen_helper_sve_ldhds_be_zd_mte,
+                  gen_helper_sve_ldsds_be_zd_mte,
+                  NULL, },
+                { gen_helper_sve_ldbdu_zd_mte,
+                  gen_helper_sve_ldhdu_be_zd_mte,
+                  gen_helper_sve_ldsdu_be_zd_mte,
+                  gen_helper_sve_lddd_be_zd_mte, } } },
+
+            /* First-fault */
+            { { { gen_helper_sve_ldffbds_zsu_mte,
+                  gen_helper_sve_ldffhds_be_zsu_mte,
+                  gen_helper_sve_ldffsds_be_zsu_mte,
+                  NULL, },
+                { gen_helper_sve_ldffbdu_zsu_mte,
+                  gen_helper_sve_ldffhdu_be_zsu_mte,
+                  gen_helper_sve_ldffsdu_be_zsu_mte,
+                  gen_helper_sve_ldffdd_be_zsu_mte, } },
+              { { gen_helper_sve_ldffbds_zss_mte,
+                  gen_helper_sve_ldffhds_be_zss_mte,
+                  gen_helper_sve_ldffsds_be_zss_mte,
+                  NULL, },
+                { gen_helper_sve_ldffbdu_zss_mte,
+                  gen_helper_sve_ldffhdu_be_zss_mte,
+                  gen_helper_sve_ldffsdu_be_zss_mte,
+                  gen_helper_sve_ldffdd_be_zss_mte, } },
+              { { gen_helper_sve_ldffbds_zd_mte,
+                  gen_helper_sve_ldffhds_be_zd_mte,
+                  gen_helper_sve_ldffsds_be_zd_mte,
+                  NULL, },
+                { gen_helper_sve_ldffbdu_zd_mte,
+                  gen_helper_sve_ldffhdu_be_zd_mte,
+                  gen_helper_sve_ldffsdu_be_zd_mte,
+                  gen_helper_sve_ldffdd_be_zd_mte, } } } } },
 };
 
 static bool trans_LD1_zprz(DisasContext *s, arg_LD1_zprz *a)
 {
     gen_helper_gvec_mem_scatter *fn = NULL;
-    int be = s->be_data == MO_BE;
+    bool be = s->be_data == MO_BE;
+    bool mte = s->mte_active[0];
 
     if (!sve_access_check(s)) {
         return true;
@@ -5462,23 +5633,24 @@ static bool trans_LD1_zprz(DisasContext *s, arg_LD1_zprz *a)
 
     switch (a->esz) {
     case MO_32:
-        fn = gather_load_fn32[be][a->ff][a->xs][a->u][a->msz];
+        fn = gather_load_fn32[mte][be][a->ff][a->xs][a->u][a->msz];
         break;
     case MO_64:
-        fn = gather_load_fn64[be][a->ff][a->xs][a->u][a->msz];
+        fn = gather_load_fn64[mte][be][a->ff][a->xs][a->u][a->msz];
         break;
     }
     assert(fn != NULL);
 
     do_mem_zpz(s, a->rd, a->pg, a->rm, a->scale * a->msz,
-               cpu_reg_sp(s, a->rn), a->msz, fn);
+               cpu_reg_sp(s, a->rn), a->msz, false, fn);
     return true;
 }
 
 static bool trans_LD1_zpiz(DisasContext *s, arg_LD1_zpiz *a)
 {
     gen_helper_gvec_mem_scatter *fn = NULL;
-    int be = s->be_data == MO_BE;
+    bool be = s->be_data == MO_BE;
+    bool mte = s->mte_active[0];
     TCGv_i64 imm;
 
     if (a->esz < a->msz || (a->esz == a->msz && !a->u)) {
@@ -5490,10 +5662,10 @@ static bool trans_LD1_zpiz(DisasContext *s, arg_LD1_zpiz *a)
 
     switch (a->esz) {
     case MO_32:
-        fn = gather_load_fn32[be][a->ff][0][a->u][a->msz];
+        fn = gather_load_fn32[mte][be][a->ff][0][a->u][a->msz];
         break;
     case MO_64:
-        fn = gather_load_fn64[be][a->ff][2][a->u][a->msz];
+        fn = gather_load_fn64[mte][be][a->ff][2][a->u][a->msz];
         break;
     }
     assert(fn != NULL);
@@ -5502,63 +5674,108 @@ static bool trans_LD1_zpiz(DisasContext *s, arg_LD1_zpiz *a)
      * by loading the immediate into the scalar parameter.
      */
     imm = tcg_const_i64(a->imm << a->msz);
-    do_mem_zpz(s, a->rd, a->pg, a->rn, 0, imm, a->msz, fn);
+    do_mem_zpz(s, a->rd, a->pg, a->rn, 0, imm, a->msz, false, fn);
     tcg_temp_free_i64(imm);
     return true;
 }
 
-/* Indexed by [be][xs][msz].  */
-static gen_helper_gvec_mem_scatter * const scatter_store_fn32[2][2][3] = {
-    /* Little-endian */
-    { { gen_helper_sve_stbs_zsu,
-        gen_helper_sve_sths_le_zsu,
-        gen_helper_sve_stss_le_zsu, },
-      { gen_helper_sve_stbs_zss,
-        gen_helper_sve_sths_le_zss,
-        gen_helper_sve_stss_le_zss, } },
-    /* Big-endian */
-    { { gen_helper_sve_stbs_zsu,
-        gen_helper_sve_sths_be_zsu,
-        gen_helper_sve_stss_be_zsu, },
-      { gen_helper_sve_stbs_zss,
-        gen_helper_sve_sths_be_zss,
-        gen_helper_sve_stss_be_zss, } },
+/* Indexed by [mte][be][xs][msz].  */
+static gen_helper_gvec_mem_scatter * const scatter_store_fn32[2][2][2][3] = {
+    { /* MTE Inactive */
+        { /* Little-endian */
+            { gen_helper_sve_stbs_zsu,
+              gen_helper_sve_sths_le_zsu,
+              gen_helper_sve_stss_le_zsu, },
+            { gen_helper_sve_stbs_zss,
+              gen_helper_sve_sths_le_zss,
+              gen_helper_sve_stss_le_zss, } },
+        { /* Big-endian */
+            { gen_helper_sve_stbs_zsu,
+              gen_helper_sve_sths_be_zsu,
+              gen_helper_sve_stss_be_zsu, },
+            { gen_helper_sve_stbs_zss,
+              gen_helper_sve_sths_be_zss,
+              gen_helper_sve_stss_be_zss, } } },
+    { /* MTE Active */
+        { /* Little-endian */
+            { gen_helper_sve_stbs_zsu_mte,
+              gen_helper_sve_sths_le_zsu_mte,
+              gen_helper_sve_stss_le_zsu_mte, },
+            { gen_helper_sve_stbs_zss_mte,
+              gen_helper_sve_sths_le_zss_mte,
+              gen_helper_sve_stss_le_zss_mte, } },
+        { /* Big-endian */
+            { gen_helper_sve_stbs_zsu_mte,
+              gen_helper_sve_sths_be_zsu_mte,
+              gen_helper_sve_stss_be_zsu_mte, },
+            { gen_helper_sve_stbs_zss_mte,
+              gen_helper_sve_sths_be_zss_mte,
+              gen_helper_sve_stss_be_zss_mte, } } },
 };
 
 /* Note that we overload xs=2 to indicate 64-bit offset.  */
-static gen_helper_gvec_mem_scatter * const scatter_store_fn64[2][3][4] = {
-    /* Little-endian */
-    { { gen_helper_sve_stbd_zsu,
-        gen_helper_sve_sthd_le_zsu,
-        gen_helper_sve_stsd_le_zsu,
-        gen_helper_sve_stdd_le_zsu, },
-      { gen_helper_sve_stbd_zss,
-        gen_helper_sve_sthd_le_zss,
-        gen_helper_sve_stsd_le_zss,
-        gen_helper_sve_stdd_le_zss, },
-      { gen_helper_sve_stbd_zd,
-        gen_helper_sve_sthd_le_zd,
-        gen_helper_sve_stsd_le_zd,
-        gen_helper_sve_stdd_le_zd, } },
-    /* Big-endian */
-    { { gen_helper_sve_stbd_zsu,
-        gen_helper_sve_sthd_be_zsu,
-        gen_helper_sve_stsd_be_zsu,
-        gen_helper_sve_stdd_be_zsu, },
-      { gen_helper_sve_stbd_zss,
-        gen_helper_sve_sthd_be_zss,
-        gen_helper_sve_stsd_be_zss,
-        gen_helper_sve_stdd_be_zss, },
-      { gen_helper_sve_stbd_zd,
-        gen_helper_sve_sthd_be_zd,
-        gen_helper_sve_stsd_be_zd,
-        gen_helper_sve_stdd_be_zd, } },
+static gen_helper_gvec_mem_scatter * const scatter_store_fn64[2][2][3][4] = {
+    { /* MTE Inactive */
+         { /* Little-endian */
+             { gen_helper_sve_stbd_zsu,
+               gen_helper_sve_sthd_le_zsu,
+               gen_helper_sve_stsd_le_zsu,
+               gen_helper_sve_stdd_le_zsu, },
+             { gen_helper_sve_stbd_zss,
+               gen_helper_sve_sthd_le_zss,
+               gen_helper_sve_stsd_le_zss,
+               gen_helper_sve_stdd_le_zss, },
+             { gen_helper_sve_stbd_zd,
+               gen_helper_sve_sthd_le_zd,
+               gen_helper_sve_stsd_le_zd,
+               gen_helper_sve_stdd_le_zd, } },
+         { /* Big-endian */
+             { gen_helper_sve_stbd_zsu,
+               gen_helper_sve_sthd_be_zsu,
+               gen_helper_sve_stsd_be_zsu,
+               gen_helper_sve_stdd_be_zsu, },
+             { gen_helper_sve_stbd_zss,
+               gen_helper_sve_sthd_be_zss,
+               gen_helper_sve_stsd_be_zss,
+               gen_helper_sve_stdd_be_zss, },
+             { gen_helper_sve_stbd_zd,
+               gen_helper_sve_sthd_be_zd,
+               gen_helper_sve_stsd_be_zd,
+               gen_helper_sve_stdd_be_zd, } } },
+    { /* MTE Inactive */
+         { /* Little-endian */
+             { gen_helper_sve_stbd_zsu_mte,
+               gen_helper_sve_sthd_le_zsu_mte,
+               gen_helper_sve_stsd_le_zsu_mte,
+               gen_helper_sve_stdd_le_zsu_mte, },
+             { gen_helper_sve_stbd_zss_mte,
+               gen_helper_sve_sthd_le_zss_mte,
+               gen_helper_sve_stsd_le_zss_mte,
+               gen_helper_sve_stdd_le_zss_mte, },
+             { gen_helper_sve_stbd_zd_mte,
+               gen_helper_sve_sthd_le_zd_mte,
+               gen_helper_sve_stsd_le_zd_mte,
+               gen_helper_sve_stdd_le_zd_mte, } },
+         { /* Big-endian */
+             { gen_helper_sve_stbd_zsu_mte,
+               gen_helper_sve_sthd_be_zsu_mte,
+               gen_helper_sve_stsd_be_zsu_mte,
+               gen_helper_sve_stdd_be_zsu_mte, },
+             { gen_helper_sve_stbd_zss_mte,
+               gen_helper_sve_sthd_be_zss_mte,
+               gen_helper_sve_stsd_be_zss_mte,
+               gen_helper_sve_stdd_be_zss_mte, },
+             { gen_helper_sve_stbd_zd_mte,
+               gen_helper_sve_sthd_be_zd_mte,
+               gen_helper_sve_stsd_be_zd_mte,
+               gen_helper_sve_stdd_be_zd_mte, } } },
 };
 
 static bool trans_ST1_zprz(DisasContext *s, arg_ST1_zprz *a)
 {
     gen_helper_gvec_mem_scatter *fn;
-    int be = s->be_data == MO_BE;
+    bool be = s->be_data == MO_BE;
+    bool mte = s->mte_active[0];
 
     if (a->esz < a->msz || (a->msz == 0 && a->scale)) {
         return false;
@@ -5568,23 +5785,24 @@ static bool trans_ST1_zprz(DisasContext *s, arg_ST1_zprz *a)
     }
     switch (a->esz) {
     case MO_32:
-        fn = scatter_store_fn32[be][a->xs][a->msz];
+        fn = scatter_store_fn32[mte][be][a->xs][a->msz];
         break;
     case MO_64:
-        fn = scatter_store_fn64[be][a->xs][a->msz];
+        fn = scatter_store_fn64[mte][be][a->xs][a->msz];
         break;
     default:
         g_assert_not_reached();
     }
     do_mem_zpz(s, a->rd, a->pg, a->rm, a->scale * a->msz,
-               cpu_reg_sp(s, a->rn), a->msz, fn);
+               cpu_reg_sp(s, a->rn), a->msz, true, fn);
     return true;
 }
 
 static bool trans_ST1_zpiz(DisasContext *s, arg_ST1_zpiz *a)
 {
     gen_helper_gvec_mem_scatter *fn = NULL;
-    int be = s->be_data == MO_BE;
+    bool be = s->be_data == MO_BE;
+    bool mte = s->mte_active[0];
     TCGv_i64 imm;
 
     if (a->esz < a->msz) {
@@ -5596,10 +5814,10 @@ static bool trans_ST1_zpiz(DisasContext *s, arg_ST1_zpiz *a)
 
     switch (a->esz) {
     case MO_32:
-        fn = scatter_store_fn32[be][0][a->msz];
+        fn = scatter_store_fn32[mte][be][0][a->msz];
         break;
     case MO_64:
-        fn = scatter_store_fn64[be][2][a->msz];
+        fn = scatter_store_fn64[mte][be][2][a->msz];
         break;
     }
     assert(fn != NULL);
@@ -5608,7 +5826,7 @@ static bool trans_ST1_zpiz(DisasContext *s, arg_ST1_zpiz *a)
      * by loading the immediate into the scalar parameter.
      */
     imm = tcg_const_i64(a->imm << a->msz);
-    do_mem_zpz(s, a->rd, a->pg, a->rn, 0, imm, a->msz, fn);
+    do_mem_zpz(s, a->rd, a->pg, a->rn, 0, imm, a->msz, true, fn);
     tcg_temp_free_i64(imm);
     return true;
 }
-- 
2.20.1


