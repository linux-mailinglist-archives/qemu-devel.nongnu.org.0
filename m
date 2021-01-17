Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A632F940A
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 17:52:51 +0100 (CET)
Received: from localhost ([::1]:59566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1BII-0000Pu-6f
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 11:52:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1BE0-0003p0-GP
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 11:48:24 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:38847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1BDz-0001ov-0A
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 11:48:24 -0500
Received: by mail-wr1-x42e.google.com with SMTP id a9so10749025wrt.5
 for <qemu-devel@nongnu.org>; Sun, 17 Jan 2021 08:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xDfrjU7kI1sr1RDYArfADvyCVAF59u47MTJHcFAtFYw=;
 b=imypN1rpJz8e9ZiUVoWa5BvlKtQwgK3bobVSemLSV2fQI/G/nxGfkN3Dh/t3Jhbr3n
 8bZBILuu60QBQ7xAoA8kQmQS5RAx5aIEtbXRw9XzgcDJsrmK0MuFeO76eEn2uPQ7g0/1
 Pt6braFeW9twcm2rR7yOffloNtuZIfkOofdLP7Sm0JSS/BLaH25O2WbzPFN3YVbHI7xz
 BT8WHnhK3WGIA1OWM1AcunLhtiNjZ0u4DFbyreiYEi2Y3Mg6wvbI+0Q9In0HdFQPVNcJ
 9cazlGS4KC6nXg3tHGgFe93hipJ8SVErgraOPNiCzHEEVJXgxOZIj7q8m/GdV4skKI/k
 IXLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=xDfrjU7kI1sr1RDYArfADvyCVAF59u47MTJHcFAtFYw=;
 b=o8d7ld9FOIPVaMCFJ7YJaQIwicpA6CaAfR2HlKFmHH+7phfz00a2OAvkPoRd73O49Y
 Sfg6n1J6/QyFs6tm3P0M3270++0oQ56LMEu8rsnDC5HVOxn/nblmbWNeihqSc91dKiUC
 EH+lX2H1M2yt03vQcmtzdqXrvALsy9lXf6QKNmn1iwU4X4HVXUxeZvJIjn6Io8F82DHs
 8cD5YD5oe61nxX7V2IEsjaAVmKpdrZYEj8Y0ZkjeJMC5iaXu01SlECrV5dFJwFGuonnL
 MYMUW3WIn37tpEYvhkXEU/xrBAFWnKmrmgUiIAE1SY6JceiHF0AqL9H+lvq7/pHyjnCi
 j+pg==
X-Gm-Message-State: AOAM532u/HKRJi5yXP09Km+8Wc6IfEWWO8z5UkSC4kKDcfPlhb52ej6d
 s3/SZpbkOgBaPoDB5ImXCQRtRA1BNQs=
X-Google-Smtp-Source: ABdhPJydWQhkpkd8PD68Pwm/KDlDLBr8mI9TKOIEAKbpff8AfzxUeVQ/T4xf4p5ziObbNqPqkRJE/w==
X-Received: by 2002:a5d:6443:: with SMTP id d3mr21803331wrw.422.1610902101470; 
 Sun, 17 Jan 2021 08:48:21 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id z8sm6534364wmi.44.2021.01.17.08.48.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jan 2021 08:48:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/6] accel/tcg: Make cpu_gen_init() static
Date: Sun, 17 Jan 2021 17:48:08 +0100
Message-Id: <20210117164813.4101761-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210117164813.4101761-1-f4bug@amsat.org>
References: <20210117164813.4101761-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Riku Voipio <riku.voipio@iki.fi>,
 Eduardo Habkost <ehabkost@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

cpu_gen_init() is TCG specific, only used in tcg/translate-all.c.
No need to export it to other accelerators, declare it statically.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
We could also inline the 1-line call..
---
 include/exec/exec-all.h   | 2 --
 accel/tcg/translate-all.c | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 2e5b4bba48f..516013e735a 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -47,8 +47,6 @@ void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb, int max_insns);
 void restore_state_to_opc(CPUArchState *env, TranslationBlock *tb,
                           target_ulong *data);
 
-void cpu_gen_init(void);
-
 /**
  * cpu_restore_state:
  * @cpu: the vCPU state is to be restore to
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index e9de6ff9dd7..ca7ef6aa177 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -243,7 +243,7 @@ static void page_table_config_init(void)
     assert(v_l2_levels >= 0);
 }
 
-void cpu_gen_init(void)
+static void cpu_gen_init(void)
 {
     tcg_context_init(&tcg_init_ctx);
 }
-- 
2.26.2


