Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 908572D9087
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 21:30:00 +0100 (CET)
Received: from localhost ([::1]:53212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koY0F-00008w-Kd
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 15:29:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koXrz-000306-7U
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 15:21:27 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:34459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koXrx-0005dE-R1
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 15:21:27 -0500
Received: by mail-wr1-x444.google.com with SMTP id q18so6867687wrn.1
 for <qemu-devel@nongnu.org>; Sun, 13 Dec 2020 12:21:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=34Gjpun7TNPsoaQVN38Yv8sG5iP6wLHtCCAjvvFP5UI=;
 b=BU3fUzi8DAzwsnOmXIJ76k8U4DrKlFD4XgiVs2SUI68jQ+iKUDSlr9JBsXwLewlN8J
 MDR35+6wJWQKp8NZ9NCwBBFSRnMsqAnE4kblbrdxgeuWNBEgv/KEOS0YdV54clSlunOG
 pmTEXF9/gqvpn1SUxQw/jGe9BhmRL4Ta/pxCNPx0KXBSGzNjJlwbTDdqT/R+1ppD9VNL
 wkVNTJ8ynCM0zNSOgU0iy4PdzHWWKAuBZ/3AdppawIr0PPXO7UCVzzV8EwKG0NrYen3X
 SCTqipVjLZOjlA5KRD6wCyMiGZh4cUAUpU9+md9tmT8RKZJHvo9KXxw561Vqvhqj9hvy
 VlYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=34Gjpun7TNPsoaQVN38Yv8sG5iP6wLHtCCAjvvFP5UI=;
 b=Fj2scJzuJ2Atuj6AwN+fVC/NQ+dk4Q2eHp51R+DLTHcr/dqK/B9I6EsPjM0lS+BdYD
 ErTLgYlKm53qvZocpuz1Ha89oEKIvdrDTwCOZVb08/y++rTyXCOS2I7ioT705ipFiVsc
 41b8qdV6wNxMC2P+u81RU73TumayzqqqnPs98E011zPW6dqH8lldKH0QAcRQ00BhAtfW
 FE1B75W2ZWNhcqIcNGvKiW3+XhPqIwlSyWsenu0dSLIUkqjoJK1JeAGQUB+Cu63l0cyH
 uLqrI61f5YU9qXJddOkTNhJS3Zv/6noPoSpVgtUr97DQ9xREq6bilBSE7o3R5C7x+ZvM
 F1RA==
X-Gm-Message-State: AOAM530QdJkl6kqtIaWmOijtAcpAtXo0cXh7UyOioL3WuuZsNobVsM9I
 0ff+Tr9KfntLHEFAkCuL0h6cPoMCnIQ=
X-Google-Smtp-Source: ABdhPJxgeDq4WOxjOJQN0+vNyfwIGM036dcbEAa5GUj9cBrFjsN9I9AoZgNvo12QV4gNO6aX/iXePw==
X-Received: by 2002:a5d:6682:: with SMTP id l2mr25344695wru.213.1607890883667; 
 Sun, 13 Dec 2020 12:21:23 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id m11sm12338992wmi.16.2020.12.13.12.21.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Dec 2020 12:21:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/26] hw/mips/malta: Do not initialize MT registers if MT ASE
 absent
Date: Sun, 13 Dec 2020 21:19:39 +0100
Message-Id: <20201213201946.236123-20-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201213201946.236123-1-f4bug@amsat.org>
References: <20201213201946.236123-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x444.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Do not initialize MT-related config register if the MT ASE
is not present.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201204222622.2743175-5-f4bug@amsat.org>
---
 hw/mips/malta.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index 4651a1055c9..f06cb90a44a 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -1135,8 +1135,10 @@ static void malta_mips_config(MIPSCPU *cpu)
     CPUMIPSState *env = &cpu->env;
     CPUState *cs = CPU(cpu);
 
-    env->mvp->CP0_MVPConf0 |= ((smp_cpus - 1) << CP0MVPC0_PVPE) |
+    if (ase_mt_available(env)) {
+        env->mvp->CP0_MVPConf0 |= ((smp_cpus - 1) << CP0MVPC0_PVPE) |
                          ((smp_cpus * cs->nr_threads - 1) << CP0MVPC0_PTC);
+    }
 }
 
 static void main_cpu_reset(void *opaque)
-- 
2.26.2


