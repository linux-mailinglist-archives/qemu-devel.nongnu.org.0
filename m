Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F9F310CB6
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 15:50:17 +0100 (CET)
Received: from localhost ([::1]:38008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l82R6-0000Bl-2o
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 09:50:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l82LW-0002jc-Tl; Fri, 05 Feb 2021 09:44:30 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:40455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l82LV-0002VU-Hx; Fri, 05 Feb 2021 09:44:30 -0500
Received: by mail-ed1-x52c.google.com with SMTP id s3so9057508edi.7;
 Fri, 05 Feb 2021 06:44:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n4AsHtVAI1SCDx8GcpPjZC1lYBQeAHaYRSZgH2aSe7Y=;
 b=uosYDztWZMrtk/y00Iyq/Hxlks93zFumpoGxWBYAzBEM6/WkyftCLoxUXRCue3eHJa
 a1pOFbjZMZ0M5bd2kLjDmy1i6nBkMNY8EimwUxS39SgwWeI06MCC0hNILDu32Y8D/Lcl
 md+ZrfxIvEJDHY98mm8vfpL2brtQihDM5ZKzAP6Cnl6NUtUPQF2tmDWClCtJjoAoHZIr
 jRF4UM8kLXY9WhfB04eLFUdOtlOzJuAd6s4YmgNm7f52R0GGjcYWun48+ooY+f13RU5X
 S8ZgMfdh/rvLe8uj8NFgB/OGE9n9gPRQY/7JlapUd9VUxbzWvoGk5QEgUC4TDXzUTpwl
 CZOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=n4AsHtVAI1SCDx8GcpPjZC1lYBQeAHaYRSZgH2aSe7Y=;
 b=mWz3iKgtoHc1Qg6TW45enaG/FyXcFA/p2afhzF9kiI+CriLQEPlbTYzo5lFiqJqY5d
 GEun3azsecmUlvSvB7lxHsgVaSGku1xId6wa3eJn3tpt8IvmR5CRUoZwkaXRwIKU+QDm
 SPbAw1f51khI8RbrCa9p8Dz831lOkc32lSDVQPp+FMtBM/75rsQU1OXv5hxHvn5QK0P9
 zSJ5IPQj7vjbHbcjtg3ZJIQ69CAMQerVJ8yfEwuPGGdPJgFAKQuetZuwb/ApqPNIm5XQ
 hCVKB6HSH4GrKSN4HysyYfsHx857w6Pp1KU86Ps190TSzEU011eXtDvZwfGRmgm39ZvE
 78mQ==
X-Gm-Message-State: AOAM5320yj+AQ2x14AX6+6Sm2tqAmWKfVhSnbCbhvZtdh3yK5/bJwHVI
 GirerJP+FcUpldbuXeyYUmVzWoJ4Bmw=
X-Google-Smtp-Source: ABdhPJxoQi9GuNc9ks/ouu8D6jbKy+jXEPi5W1k1nhQXMRf1J8wwToZsbPH47j0Dozf7isAIglZI+Q==
X-Received: by 2002:aa7:dbd4:: with SMTP id v20mr3969931edt.330.1612536267480; 
 Fri, 05 Feb 2021 06:44:27 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id a15sm4069257edy.86.2021.02.05.06.44.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 06:44:26 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 7/9] hw/arm/virt: Do not include 64-bit CPUs in 32-bit build
Date: Fri,  5 Feb 2021 15:43:43 +0100
Message-Id: <20210205144345.2068758-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210205144345.2068758-1-f4bug@amsat.org>
References: <20210205144345.2068758-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52c.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Similarly to commit 210f47840dd, remove 64-bit CPUs (which have
never been available on 32-bit build, see commit d14d42f19bf),
to fix:

  $ make check-qtest-arm
  ...
  Running test qtest-arm/device-introspect-test
  missing object type 'cortex-a53-arm-cpu'
  Broken pipe
  ../tests/qtest/libqtest.c:181: kill_qemu() detected QEMU death from signal 6 (Aborted) (core dumped)
  ERROR qtest-arm/device-introspect-test - too few tests run (expected 6, got 5)

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/virt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 6ffe091804f..f5e4a6ec914 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -199,9 +199,11 @@ static const int a15irqmap[] = {
 static const char *valid_cpus[] = {
     ARM_CPU_TYPE_NAME("cortex-a7"),
     ARM_CPU_TYPE_NAME("cortex-a15"),
+#ifdef TARGET_AARCH64
     ARM_CPU_TYPE_NAME("cortex-a53"),
     ARM_CPU_TYPE_NAME("cortex-a57"),
     ARM_CPU_TYPE_NAME("cortex-a72"),
+#endif /* TARGET_AARCH64 */
     ARM_CPU_TYPE_NAME("host"),
     ARM_CPU_TYPE_NAME("max"),
 };
-- 
2.26.2


