Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2D051C53B
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 18:38:17 +0200 (CEST)
Received: from localhost ([::1]:60384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmeUa-0006oB-9z
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 12:38:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nmeBU-00028B-IC; Thu, 05 May 2022 12:18:36 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:38745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nmeBS-0005lK-TA; Thu, 05 May 2022 12:18:32 -0400
Received: by mail-ej1-x630.google.com with SMTP id n10so9706199ejk.5;
 Thu, 05 May 2022 09:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OBni9ZUFXG91vLe7sySYRIw20wTNmuqnX6QYDs/955Q=;
 b=AL6fSrg7LWp41pQYcA4jxZ+w0VV1CzJ96ZnfRVilV7ip+dqb9ssmIop5qp42/9GWmf
 3FZxGcmkRPmnE7PpdZ8ZdaT0aUzI67C/C6M/RXSAVsVInBt1bKuA/eH50BsyILWzvH/D
 Xudf5e3aZ9xZsAIyb/JznyKRybr7hGGj1ufyfiXZzo6T1I+ebLsJTjfKhtXjJkZnvddG
 jem3Gm2lfS+pxR7yLZ66XMVe2ciye0zZkc9AWV6KSA2UEnTDWMIBMeUK/FBPu76+EBXG
 czbNvG/WgZY9dGQLbu0YplknWUiTrQQ3w93/+6VmD5tJVk1DsRsEOAXjc+Q5GH6zMoRy
 KBwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OBni9ZUFXG91vLe7sySYRIw20wTNmuqnX6QYDs/955Q=;
 b=bRhesFmRiGkm1gS7c+arCjZ1eSLb6GKCm0lAYujr3TG7fWsJ3Oixpx3WD2tSvWX86f
 N6Qh8HTK3M3KPdzLz0W4Ctd80WgbHLj+BWgrmjd5/fAPkv31Xfnnhp+HHXqa59bfVr1e
 XxOSrm08QLEl52d6k9vKh2SY0IBIratqPeGKpcvzNnFL4niMhPAXGDUFWcU2OPSLtfXk
 v0sCChlgktplOi5fMD+JXTa3ESXPhnV1UWT5UauvVVWO4IqvkhZmnCnMOYGolHewjKF7
 sk2lIKlAhF2tX3nkzf8YSYwmiSHKpJsIwEac/WuSvvbx5tYOJDig+O2lGlkF/tWsDGWj
 MNBQ==
X-Gm-Message-State: AOAM5318EvK+KYW1bxmkv29gr6pN/sOrNmDYBYVBALF1uX8O0wIfkheO
 vBDDrEwCYLOSlaXFb3+YZQybv60agqg=
X-Google-Smtp-Source: ABdhPJwY3a67m4Y7aGnUVSu0KbS6HmCPdKgi42AOmxmGO/Wpe7xWiALDfATwgGUPPTxKXE7HFTnkfA==
X-Received: by 2002:a17:906:9b96:b0:6f5:cdd:9bf2 with SMTP id
 dd22-20020a1709069b9600b006f50cdd9bf2mr1124868ejc.364.1651767509081; 
 Thu, 05 May 2022 09:18:29 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-078-054-123-159.78.54.pool.telefonica.de. [78.54.123.159])
 by smtp.gmail.com with ESMTPSA id
 i6-20020a17090685c600b006f3ef214dcfsm868542ejy.53.2022.05.05.09.18.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 09:18:28 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 10/11] accel/tcg: Inline dump_opcount_info() and remove it
Date: Thu,  5 May 2022 18:18:04 +0200
Message-Id: <20220505161805.11116-11-shentey@gmail.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220505161805.11116-1-shentey@gmail.com>
References: <20220505161805.11116-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

dump_opcount_info() is a one-line wrapper around tcg_dump_op_count()
which is also exported. So use the latter directly.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 accel/tcg/cpu-exec.c      | 2 +-
 accel/tcg/translate-all.c | 5 -----
 include/exec/cpu-all.h    | 1 -
 3 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 7cbf9996b7..a565a3f8ec 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -1091,7 +1091,7 @@ HumanReadableText *qmp_x_query_opcount(Error **errp)
         return NULL;
     }
 
-    dump_opcount_info(buf);
+    tcg_dump_op_count(buf);
 
     return human_readable_text_from_str(buf);
 }
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 291034cb09..8fd23a9d05 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -2124,11 +2124,6 @@ void dump_exec_info(GString *buf)
     tcg_dump_info(buf);
 }
 
-void dump_opcount_info(GString *buf)
-{
-    tcg_dump_op_count(buf);
-}
-
 #else /* CONFIG_USER_ONLY */
 
 void cpu_interrupt(CPUState *cpu, int mask)
diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 9a716be80d..f5bda2c3ca 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -421,7 +421,6 @@ static inline bool tlb_hit(target_ulong tlb_addr, target_ulong addr)
 #ifdef CONFIG_TCG
 /* accel/tcg/translate-all.c */
 void dump_exec_info(GString *buf);
-void dump_opcount_info(GString *buf);
 #endif /* CONFIG_TCG */
 
 #endif /* !CONFIG_USER_ONLY */
-- 
2.36.0


