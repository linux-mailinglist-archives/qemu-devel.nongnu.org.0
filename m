Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4E53DE562
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 06:32:14 +0200 (CEST)
Received: from localhost ([::1]:59454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAm69-0000Uk-GQ
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 00:32:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAlq3-0003uS-KR
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:15:38 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:40608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAlq1-0002by-5I
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:15:35 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 u9-20020a17090a1f09b029017554809f35so2058660pja.5
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 21:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H1qCrHNTcG/Zo5m0d6oERD6Fn3Mj2mhv0CknmIpwgl8=;
 b=JZFIJxVVFIG7VeWN51EBMAddy5jYCYX5pqRV3CMNVHD61Ys5iApC+krV+pxHxCo4M6
 zA//P7nZX8DhBvjKzv4xsw4HcmC1cQYtxy1A85Ne/5D3507GI7fjJoYBKM8R+eh/+qaz
 ZDCa9i1Qz3mDz0G8MHqs7naKAQHJRjRnvIjek45KxChPtV2BJK1O93Mi6s95cDsJum9R
 3kvE6pA2AzwZSUGLWEBlndxdHGVgUOuxLwawFIM/3VTrBeKFiSHafPMQNf+zMR1Amm8S
 0p0eRAqUBro9X5KBDD4Re6asNFCo3ilif0AQp7a4pV6hI0ous6RpEmk+mJNC3fdspoNM
 NXpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H1qCrHNTcG/Zo5m0d6oERD6Fn3Mj2mhv0CknmIpwgl8=;
 b=kr6RoBClIh2kjwg739/SSCdTf+0o+3E15jJcJ5P6XFJdZBZMEQYSyz+XalS5L4J2++
 CETDkTjSmgjOxF28mIUiKgOPdaWMjtX3Twppa2wnI4ocnQqr7Q6jyCOSF/chtehD1eTL
 LLHGakRjEFpg+LIO6y+QQDt4QXLiyzKAR8I5M4IJ/oWk9U8XYhyAE5rIxk/MvFo7qfbh
 ET2KnLrFs+Ttt5k5guesm3nOshda4zaf4IktA4Gd9xHvUaoajq0HN78Cma6pplQdGWaK
 IQixgz4akhA9PnkuwKxDJwi+w0JBarvak+7IDTEwpovM9si0uvDendDTeSqoqUd4E3bi
 Xj5g==
X-Gm-Message-State: AOAM531xKsYsZR6QMVEWb8WMW9iO7iumd9vel0igDnt8JegVNMV0ndgL
 ol40JRSwW7gIpJEwdbDxf+Xw/zGeVxZG0Q==
X-Google-Smtp-Source: ABdhPJws6J1BMOtKxXQG8qqszx6vk8Dn8qKqaPEk2Suzo6H648xME6wfRXubJIl+Q1eN0v8xjFQhOg==
X-Received: by 2002:a17:902:bd49:b029:12c:7775:cdea with SMTP id
 b9-20020a170902bd49b029012c7775cdeamr16905909plx.68.1627964132019; 
 Mon, 02 Aug 2021 21:15:32 -0700 (PDT)
Received: from localhost.localdomain (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id c23sm13718532pfn.140.2021.08.02.21.15.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 21:15:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 39/55] target/sparc: Use cpu_*_mmu instead of helper_*_mmu
Date: Mon,  2 Aug 2021 18:14:27 -1000
Message-Id: <20210803041443.55452-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210803041443.55452-1-richard.henderson@linaro.org>
References: <20210803041443.55452-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The helper_*_mmu functions were the only thing available
when this code was written.  This could have been adjusted
when we added cpu_*_mmuidx_ra, but now we can most easily
use the newest set of interfaces.

Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sparc/ldst_helper.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/sparc/ldst_helper.c b/target/sparc/ldst_helper.c
index 299fc386ea..a3e1cf9b6e 100644
--- a/target/sparc/ldst_helper.c
+++ b/target/sparc/ldst_helper.c
@@ -1328,27 +1328,27 @@ uint64_t helper_ld_asi(CPUSPARCState *env, target_ulong addr,
             oi = make_memop_idx(memop, idx);
             switch (size) {
             case 1:
-                ret = helper_ret_ldub_mmu(env, addr, oi, GETPC());
+                ret = cpu_ldb_mmu(env, addr, oi, GETPC());
                 break;
             case 2:
                 if (asi & 8) {
-                    ret = helper_le_lduw_mmu(env, addr, oi, GETPC());
+                    ret = cpu_ldw_le_mmu(env, addr, oi, GETPC());
                 } else {
-                    ret = helper_be_lduw_mmu(env, addr, oi, GETPC());
+                    ret = cpu_ldw_be_mmu(env, addr, oi, GETPC());
                 }
                 break;
             case 4:
                 if (asi & 8) {
-                    ret = helper_le_ldul_mmu(env, addr, oi, GETPC());
+                    ret = cpu_ldl_le_mmu(env, addr, oi, GETPC());
                 } else {
-                    ret = helper_be_ldul_mmu(env, addr, oi, GETPC());
+                    ret = cpu_ldl_be_mmu(env, addr, oi, GETPC());
                 }
                 break;
             case 8:
                 if (asi & 8) {
-                    ret = helper_le_ldq_mmu(env, addr, oi, GETPC());
+                    ret = cpu_ldq_le_mmu(env, addr, oi, GETPC());
                 } else {
-                    ret = helper_be_ldq_mmu(env, addr, oi, GETPC());
+                    ret = cpu_ldq_be_mmu(env, addr, oi, GETPC());
                 }
                 break;
             default:
-- 
2.25.1


