Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A970D35996A
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 11:39:12 +0200 (CEST)
Received: from localhost ([::1]:49906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUnbb-0001kC-ND
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 05:39:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUnZ7-0007vl-GS
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 05:36:38 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:40891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUnZ3-0002ap-RI
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 05:36:36 -0400
Received: by mail-ej1-x62d.google.com with SMTP id n2so7616835ejy.7
 for <qemu-devel@nongnu.org>; Fri, 09 Apr 2021 02:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2jzT10IDw8GqcAMkVi0ePEkWHtJHIafM5a4hvb/idiU=;
 b=nbBdZhNU6QpWAf6JVUEAfVtUjh9YH1O45GPqVE3u4nWq3u41YDlCTmSn2KDQ82JBfE
 dD0AHFzUugEJYgHCMZWrSFLhotwkl8zmC4XOMFKH3V/TCLA8b1fpM7OwaKtx9XyBZXN+
 CTBsWK/ce+qfvyf4H/VldUMEHbnPklvrab0roJr3A5MwN37VaBveJAJK+tyLsxPM5B0q
 lkd3AgF4RoPr7b4mwPvWprIU+kuEZeha/IuNXAJORH5KRS4LbC2mTmPTMC/xmFSdmNcF
 arIBQREzOuaoGLifQsaY/DbzD0agouvpndYZLTRQGQPNrZRgKjqcOvrMJKgUy9nBAwoc
 Bi3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2jzT10IDw8GqcAMkVi0ePEkWHtJHIafM5a4hvb/idiU=;
 b=kvCKcwG8lc2YNklY7aAVFtZ3afyTwQaXajLBtxWTFDBQPFfkAfEIKi7L3VW494rPoU
 68/4A9FSLzihXC42++QvJci4mwGhryf3zmsSZ6jROvpGRKmyxPDxK1SKJw4bg8MSgHhD
 aKJ4v2QCBVBHCtVf344glGCApsr91iz9xZ/9LGLdm9yLF9KiuWC5wFvSAgWn+UFAJgrB
 JexVGjhO4jxKFJOHZCxgJ9D3rXUcJzLGQGPImBnH+plO+QMJKMSV8L3OhgieOmmiFuuE
 pds+e4wsP2xISM5yFXSQQ0Ahdwydb7C+LQkWJ2aB6xlF4G1fw6uLZ+jnAF5LaiX6Om0J
 P4QA==
X-Gm-Message-State: AOAM531YSLHCeiEkrFDeOqe5rMjcfkrjy9LQGpP0Jbqenx2CJ3telP6e
 uUeJJGMLN5HIJzPellIrZT0YESoezKey0Q==
X-Google-Smtp-Source: ABdhPJx457xqYwWe+eGM7e1lKVWCyUhiblYH+B6eeFgD8FjlJqli76ufM3QPp6xxv8MCNXE2ADXubA==
X-Received: by 2002:a17:906:fcb2:: with SMTP id
 qw18mr14803984ejb.434.1617960991097; 
 Fri, 09 Apr 2021 02:36:31 -0700 (PDT)
Received: from x1w.redhat.com (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id r17sm1122048edx.1.2021.04.09.02.36.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Apr 2021 02:36:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH-for-6.1 v2 1/6] target/mips/cpu: Use clock_has_source()
 instead of clock_get()
Date: Fri,  9 Apr 2021 11:36:18 +0200
Message-Id: <20210409093623.2402750-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210409093623.2402750-1-f4bug@amsat.org>
References: <20210409093623.2402750-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62d.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Luc Michel <luc@lmichel.fr>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Hao Wu <wuhaotsh@google.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

clock_get() returns the clock period. With an unconnected clock
we get 0. This is not what we want here. Use the API properly
by using the clock_has_source() function instead.

Fixes: a0713e85bfa ("target/mips/cpu: Allow the CPU to use dynamic frequencies")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index dce1e166bde..aa0b00256e6 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -612,7 +612,7 @@ static void mips_cpu_realizefn(DeviceState *dev, Error **errp)
     MIPSCPUClass *mcc = MIPS_CPU_GET_CLASS(dev);
     Error *local_err = NULL;
 
-    if (!clock_get(cpu->clock)) {
+    if (!clock_has_source(cpu->clock)) {
 #ifndef CONFIG_USER_ONLY
         if (!qtest_enabled()) {
             g_autofree char *cpu_freq_str = freq_to_str(CPU_FREQ_HZ_DEFAULT);
-- 
2.26.3


