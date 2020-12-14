Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 918652D9F67
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 19:43:39 +0100 (CET)
Received: from localhost ([::1]:51932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kosos-0002Fo-Ki
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 13:43:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koskY-0000MO-KZ
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 13:39:12 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:45659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koskU-0007VW-5v
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 13:39:07 -0500
Received: by mail-wr1-x432.google.com with SMTP id d26so4231783wrb.12
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 10:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3jTmKcmmqBWLYbQ1cWD989jXI7AUr/FtqoKPQ00ZpaA=;
 b=DmvDAgVDk3rT6vilBmhNkckxULBIzzOM7iPzs+1pqtzygklCVwU2Nf/bxGPV3xiUth
 716+qran5MG77Z410nif++Lkg66Vu6HV4Xq4NSFh7RIJHdIPP2KN2AqGn8x373KuVU60
 IJu7NyQ7ckS3ymP9XbkN4e8aLmRUY9BJsX8J4PgRvbgvyu2B4olGlZjUeJOzhyndGU6c
 DgUeUkq1XIPAsOSlTvBNoTfr6yOlYBV2dVHq4+3SlwRwM6waQWSKpiX6/gk9EewantFS
 jSuVyYsL0wEy2640e0xlUkGzQ5tVXWR8Gi2/+WLarpBdiW5+zpahNBBf/kp2uPwLmarH
 cdrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=3jTmKcmmqBWLYbQ1cWD989jXI7AUr/FtqoKPQ00ZpaA=;
 b=CmMyh9IFV6kUegfiS5PsCr6eW9OI/vj14e4ojtrQ43aJl/ys3I79z18RBzqEycIMOI
 7ZCHx0lqUNeCFZhBc6t+nspH/ucQfygRzMKd5Csr60g+4uNNoJxw7+qPL969tPOQ47ft
 5pQad9tHxM8EP4RzaBT0sezS5fllsVhgQxjtyZT/836uyDJuI4FVHCCn3sePwWnMcEZg
 SOTOHb6o6gmM2uYaqZBi/nXOfYSDqBoC7u9C0jzKhh0vozgsOdQynLoYZ4gMZ4c5T4T/
 o06sRMYX6RWK0oKmj+lZ8NHqUlpFmwGNWyqM5EIgBrBw5ecy7HYIBZPQYS59ckpDx9z0
 1dWw==
X-Gm-Message-State: AOAM531mg89YfJ9WZctSQsnq4iRiWZOHzWMCMLW9pKCkwpltf8IjicMW
 ki2uEfLBAN05rUSHkpvqfv1Umu2E+GE=
X-Google-Smtp-Source: ABdhPJylZEZ27Ecah1UpEhdOM3kNCewD+xZzhYtp7CCr76vb0A0zPGaLnGaH25igd87RXx73ckqSKw==
X-Received: by 2002:adf:dc8d:: with SMTP id r13mr30567261wrj.325.1607971143337; 
 Mon, 14 Dec 2020 10:39:03 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id 94sm33793630wrq.22.2020.12.14.10.39.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 10:39:02 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 16/16] target/mips: Only build TCG code when CONFIG_TCG is
 set
Date: Mon, 14 Dec 2020 19:37:39 +0100
Message-Id: <20201214183739.500368-17-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201214183739.500368-1-f4bug@amsat.org>
References: <20201214183739.500368-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201206233949.3783184-20-f4bug@amsat.org>
---
 target/mips/meson.build | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/target/mips/meson.build b/target/mips/meson.build
index 5a49951c6d7..596eb1aeeb3 100644
--- a/target/mips/meson.build
+++ b/target/mips/meson.build
@@ -1,9 +1,11 @@
 mips_ss = ss.source_set()
 mips_ss.add(files(
   'cpu.c',
+  'gdbstub.c',
+))
+mips_ss.add(when: 'CONFIG_TCG', if_true: files(
   'dsp_helper.c',
   'fpu_helper.c',
-  'gdbstub.c',
   'lmmi_helper.c',
   'msa_helper.c',
   'op_helper.c',
@@ -15,11 +17,13 @@
 mips_softmmu_ss = ss.source_set()
 mips_softmmu_ss.add(files(
   'addr.c',
-  'cp0_helper.c',
   'cp0_timer.c',
   'machine.c',
   'mips-semi.c',
 ))
+mips_softmmu_ss.add(when: 'CONFIG_TCG', if_true: files(
+  'cp0_helper.c',
+))
 
 target_arch += {'mips': mips_ss}
 target_softmmu_arch += {'mips': mips_softmmu_ss}
-- 
2.26.2


