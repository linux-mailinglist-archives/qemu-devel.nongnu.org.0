Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A62F6B2E88
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 21:22:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paMaM-00059f-8Z; Thu, 09 Mar 2023 15:09:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMaH-0004ly-RH
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:09:53 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMaG-0001WG-6i
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:09:53 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 6-20020a17090a190600b00237c5b6ecd7so7382316pjg.4
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 12:09:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678392591;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9ldzdR2EfTmKQwO2Sl/PN1z7zGGl5r/t6qa5lRBzrCg=;
 b=uL58tE4W/DY/GzLrDFsGcnfu0yULJLunAbPd1EZzjtoTOfyNiL12Nbi35xA6p1wI78
 mkaywutKn/Noj5rbpwb18gh8ebAnO+wL38ell1uYTQoK0RDg4Yr5b5ECYNtkzZn8sjqT
 2iARMFkguYDIZ/dz5cdFPUZTmaVlAna0aTk3dBffZMIbq9TXIO/T0zH+8C7QkdbqhDjd
 V6WE8Y65MoNth1QDQy4639LmBVp0/QkD90A3RItmHSvZMWi7h+QQwjRwJ3uccixhmiHM
 wGdCtK6b2nCs6b+haHJRMshNgWwtnpTpJA3G+iyd0PqwyHQ4tSlIExC6TmZk3W7EoAej
 wD8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392591;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9ldzdR2EfTmKQwO2Sl/PN1z7zGGl5r/t6qa5lRBzrCg=;
 b=breT2WQ5wjX623/JhnP2d/beCkLUN8KygWKie2SkZa19XWAADTR2aMR4aBLRIUAdvA
 lfn7iP6SJ3XBCVlswNQgCbJoMEWZhPXfO4mBZUS5rAkyuxYNddQEppOmaF0I9FaArb7E
 n5xdXJ5m3l/CGdbq/HBCzbWJi6y44AxdJ1lDS27O5cG9yAn8ZJI1F60YLsWdWpnHPunx
 W2kZzakbRSQ4Nn+C0er65eAcuY267nE7ypqmUZGwA8FdkPTVQM3SpU1VirqPmh1Y7q2P
 pTNy7SIEajpUuB8Yi3WhaLaW3vv8QTyXcxW0kY6QLIp1qfq/jVlbvpQEGStq4bX0sppF
 rhPQ==
X-Gm-Message-State: AO0yUKWa5fJhGRA3hMIsI/ZRQ2VIswHd4DhwqVQlf5+EAk2M6hKKuwvx
 JKrFoWI4OGZ2wS1WtXkrq7l7kKbF7G43Z3tQncE=
X-Google-Smtp-Source: AK7set/eoVumUr5+5eIya0ZncuwDUQ5AJRPMKmzD00LByaO/T3S50DG66Rltt5TEznDEcKNzKNossg==
X-Received: by 2002:a17:902:ef91:b0:19a:debb:58f7 with SMTP id
 iz17-20020a170902ef9100b0019adebb58f7mr18253651plb.13.1678392591465; 
 Thu, 09 Mar 2023 12:09:51 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a170902aa4200b001991e4e0bdcsm43797plr.233.2023.03.09.12.09.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 12:09:51 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL v2 67/91] tcg: Replace tcg_const_i64 in tcg-op.c
Date: Thu,  9 Mar 2023 12:05:26 -0800
Message-Id: <20230309200550.3878088-68-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309200550.3878088-1-richard.henderson@linaro.org>
References: <20230309200550.3878088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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

These three instances got missed in previous conversion.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg-op.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index 1a039a292c..ddab20a6a6 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -1563,9 +1563,7 @@ void tcg_gen_muli_i64(TCGv_i64 ret, TCGv_i64 arg1, int64_t arg2)
     } else if (is_power_of_2(arg2)) {
         tcg_gen_shli_i64(ret, arg1, ctz64(arg2));
     } else {
-        TCGv_i64 t0 = tcg_const_i64(arg2);
-        tcg_gen_mul_i64(ret, arg1, t0);
-        tcg_temp_free_i64(t0);
+        tcg_gen_mul_i64(ret, arg1, tcg_constant_i64(arg2));
     }
 }
 
@@ -1962,9 +1960,7 @@ void tcg_gen_clzi_i64(TCGv_i64 ret, TCGv_i64 arg1, uint64_t arg2)
         tcg_gen_movi_i32(TCGV_HIGH(ret), 0);
         tcg_temp_free_i32(t);
     } else {
-        TCGv_i64 t0 = tcg_const_i64(arg2);
-        tcg_gen_clz_i64(ret, arg1, t0);
-        tcg_temp_free_i64(t0);
+        tcg_gen_clz_i64(ret, arg1, tcg_constant_i64(arg2));
     }
 }
 
@@ -2016,9 +2012,7 @@ void tcg_gen_ctzi_i64(TCGv_i64 ret, TCGv_i64 arg1, uint64_t arg2)
         tcg_gen_ctpop_i64(ret, t);
         tcg_temp_free_i64(t);
     } else {
-        TCGv_i64 t0 = tcg_const_i64(arg2);
-        tcg_gen_ctz_i64(ret, arg1, t0);
-        tcg_temp_free_i64(t0);
+        tcg_gen_ctz_i64(ret, arg1, tcg_constant_i64(arg2));
     }
 }
 
-- 
2.34.1


