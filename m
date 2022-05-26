Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D951A5355D5
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 23:50:47 +0200 (CEST)
Received: from localhost ([::1]:58506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuLNW-00086N-Jf
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 17:50:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nuLC6-0001Md-MY; Thu, 26 May 2022 17:38:58 -0400
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d]:37350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nuLC4-00086h-4x; Thu, 26 May 2022 17:38:58 -0400
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-f2c8c0d5bdso3762032fac.4; 
 Thu, 26 May 2022 14:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4ft0Fa8XBzPbz7+gPyhu1eqhDDIkHmDYvX80YvQHYfA=;
 b=NpX+kYZ0EadO7UKJK7LboLnu6XFRXZEjbdZdF5+AG0V8eCaiNmiGK17IodPXbmqD9E
 onOsGk/Yr5lbSYYOSYqsBHl9Z3HFbiufrJPLIh8Qf34b9+LJciPsjviF4Ai/Of/eILVn
 anr0Q0vlw3nl6LejEUDRU64LTISK+wvJKItyHDzOytPbwCP40GFSY9ztW8qNA08OiXfm
 wmP0rxPPdVIlBj0DorZZsRylWB9LA+hWPloVHHpfl5W5TAeAqCPpmBJZ6xiCstFU1JBm
 3nr8eE+AIWrpoEufNWS1zJhrCold1iTcvgEtC5zZ3jIS3sCIto2OhlPs1pIHBMAPy8yZ
 oY0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4ft0Fa8XBzPbz7+gPyhu1eqhDDIkHmDYvX80YvQHYfA=;
 b=BlnaolVy3qeBOc3mLagNeFVGtecMqITOBIH3j3ra2y3J8FjAUxrPtdWReWm4XitX1I
 DW29E8USPrTXVm1Vo1MM7wbrzTJFNSLiKVH3k5t0QAAOZbbEHTGmUCH/U+zwALF922Gd
 sCoc0yqlNnALvIa9dbrHJwyVt6iPCFC5+p1zhy0rdiGsVLri44XCjtKxFDxFFhAeOelb
 To8Jp8LDluo64F3p2C3N5MxI49uC0FvEvXLMdqRZr5AG7ZyY1mIn45uJaHFlCzzmEYXB
 eJmokEgS36rxDDxcNmr+J3KAKfGQ3vI1nJMeklaQon00So+qg+ZoavjPgkbwkRc6CKsA
 hRSg==
X-Gm-Message-State: AOAM531GDuPR+OGJCRRLRhN3BEMr1eOQbavNUshjWtBlm3S+8w5allvP
 ZvyK8lM6yp2Z1j0vATbRmJbyWd7RNLI=
X-Google-Smtp-Source: ABdhPJw2Xv1SXngK78gYl+YyRJ9X6qA0MfCZpXZU6tH2rkWxJug2xxCT13eeUPahdiph7SXNGkHUeQ==
X-Received: by 2002:a05:6870:c88a:b0:f2:8d92:318a with SMTP id
 er10-20020a056870c88a00b000f28d92318amr2395227oab.281.1653601129944; 
 Thu, 26 May 2022 14:38:49 -0700 (PDT)
Received: from balboa.COMFAST (189-46-169-45.dsl.telesp.net.br.
 [189.46.169.45]) by smtp.gmail.com with ESMTPSA id
 l43-20020a0568302b2b00b00606ad72bdcbsm1066999otv.38.2022.05.26.14.38.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 May 2022 14:38:48 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 Leandro Lupori <leandro.lupori@eldorado.org.br>,
 Fabiano Rosas <farosas@linux.ibm.com>
Subject: [PULL 06/34] target/ppc: Fix tlbie
Date: Thu, 26 May 2022 18:37:47 -0300
Message-Id: <20220526213815.92701-7-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220526213815.92701-1-danielhb413@gmail.com>
References: <20220526213815.92701-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

From: Leandro Lupori <leandro.lupori@eldorado.org.br>

Commit 74c4912f097bab98 changed check_tlb_flush() to use
tlb_flush_all_cpus_synced() instead of calling tlb_flush() on each
CPU. However, as side effect of this, a CPU executing a ptesync
after a tlbie will have its TLB flushed only after exiting its
current Translation Block (TB).

This causes memory accesses to invalid pages to succeed, if they
happen to be on the same TB as the ptesync.

To fix this, use tlb_flush_all_cpus() instead, that immediately
flushes the TLB of the CPU executing the ptesync instruction.

Fixes: 74c4912f097bab98 ("target/ppc: Fix synchronization of mttcg with broadcast TLB flushes")
Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Message-Id: <20220503163904.22575-1-leandro.lupori@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/helper_regs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
index 6159a15b7b..12235ea2e9 100644
--- a/target/ppc/helper_regs.c
+++ b/target/ppc/helper_regs.c
@@ -292,7 +292,7 @@ void check_tlb_flush(CPUPPCState *env, bool global)
     if (global && (env->tlb_need_flush & TLB_NEED_GLOBAL_FLUSH)) {
         env->tlb_need_flush &= ~TLB_NEED_GLOBAL_FLUSH;
         env->tlb_need_flush &= ~TLB_NEED_LOCAL_FLUSH;
-        tlb_flush_all_cpus_synced(cs);
+        tlb_flush_all_cpus(cs);
         return;
     }
 
-- 
2.36.1


