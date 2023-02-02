Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2133687290
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 01:53:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNNqA-0006O7-9E; Wed, 01 Feb 2023 19:52:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pNNq7-0006Ig-En
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 19:52:35 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pNNq2-0000RV-CN
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 19:52:35 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 c10-20020a17090a1d0a00b0022e63a94799so4056274pjd.2
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 16:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RdzwGHvCCpIE8PYLpMnsIE7Dp6ielJFRJs6AnQClDEk=;
 b=RR3MtTnBkWvPMgTo8VIzSjsbqJRy/ANHq5ju2gmCxPxDrTy81/Wh9G1ku3hJdNZl7Q
 OMKFVO5N7OpIyHrGnLV5ABfcFYBWCTTlVxYrJSVxVrugfyNBpoLjmyjFYZU3HOlil3Rt
 Jz1A7lViCZNjJXQ06EBSRRwlnAdfxew1dW4uQFcEWiowVSfeddCYUUNfawDTeQtmk41y
 1vQ2zsH1WWGFXSEspjwDwqpMQ8AswFKpw0miUYvOaHZcE4nk26T5PrJaUHBvZN2jJ/wg
 1KPO3+o217SVd/8U7DTcG+Su3ECRIdsgKGNuiC/PkAppvzcdQoaPJ54KvbHVgckiYM+C
 4GHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RdzwGHvCCpIE8PYLpMnsIE7Dp6ielJFRJs6AnQClDEk=;
 b=l616l+Zt6JhP3dzM/ccphTbMK20B8Zmd1E4WPa4xoyG88NZQ2Ao4A3Qz037z2VD9uI
 nV/6PGwAe506ISqb106BYdAlF6iKKNk2Wf9vq75T2Kbam4wfFzDmcCF6VdK3CxKc//9+
 LXGMYwr5DXXdUWcvAEHWHARMrSWvLYdk/v/xAPyHcaMRi/K4XG5zRUn3r/NjPjMPdrOa
 ssUoUYJSOxLWDWK5KeGG4byAoE+Qbs/WqXbmhxjFzdNpoziWGrOH9rNKOxIOXb/4NJW2
 QeWhqB6bdB0PFbY8hn70KOINdzClayAMouoVAu5Km7qmK0yEapDW8Rc/ue75JMDPte8i
 4O7A==
X-Gm-Message-State: AO0yUKUWBSSwvCsLodC3ur3OpovuF5c/FTeQQRYMNxwJ4Uveu14+4z6+
 UHWnH/38KKToIG0oHRfF6MnCEwQEaUyKX0Fn
X-Google-Smtp-Source: AK7set/Ker1Op2mWzUGfxNDTosZA1WsXzVN/XSThIZFvZR4AKbNmHgZLuPaFms4/C7r6rcA6jpg5bA==
X-Received: by 2002:a17:903:1111:b0:196:6ec4:52db with SMTP id
 n17-20020a170903111100b001966ec452dbmr5623283plh.51.1675299149049; 
 Wed, 01 Feb 2023 16:52:29 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 z3-20020a1709028f8300b00192cf87ed25sm12391334plo.35.2023.02.01.16.52.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 16:52:28 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: mark.cave-ayland@ilande.co.uk,
	laurent@vivier.eu,
	iii@linux.ibm.com
Subject: [PATCH 12/14] linux-user/sparc: Handle unimplemented flush trap
Date: Wed,  1 Feb 2023 14:52:02 -1000
Message-Id: <20230202005204.2055899-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230202005204.2055899-1-richard.henderson@linaro.org>
References: <20230202005204.2055899-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

For sparc64, TT_UNIMP_FLUSH == TT_ILL_INSN, so this is
already handled.  For sparc32, the kernel uses SKIP_TRAP.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/sparc/cpu_loop.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/linux-user/sparc/cpu_loop.c b/linux-user/sparc/cpu_loop.c
index 8985d10ba1..7ba543983a 100644
--- a/linux-user/sparc/cpu_loop.c
+++ b/linux-user/sparc/cpu_loop.c
@@ -319,6 +319,9 @@ void cpu_loop (CPUSPARCState *env)
         case TT_NCP_INSN:
             force_sig_fault(TARGET_SIGILL, TARGET_ILL_COPROC, env->pc);
             break;
+        case TT_UNIMP_FLUSH:
+            next_instruction(env);
+            break;
 #endif
         case EXCP_ATOMIC:
             cpu_exec_step_atomic(cs);
-- 
2.34.1


