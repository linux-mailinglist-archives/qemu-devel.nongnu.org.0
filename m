Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 870084A8D1A
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 21:19:13 +0100 (CET)
Received: from localhost ([::1]:35092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFiZU-0001fF-LH
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 15:19:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFhg4-0003JN-Ao
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 14:21:58 -0500
Received: from [2607:f8b0:4864:20::532] (port=33678
 helo=mail-pg1-x532.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFhfk-0002k0-KU
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 14:21:39 -0500
Received: by mail-pg1-x532.google.com with SMTP id 77so256053pgc.0
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 11:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ipZZmmEYAV0Faklno+YLR1/AxWA537FIQ9fu6VgkBm0=;
 b=h1oo6mdfNdxBcnxp8s0U7AZWf8DlTU1gCYU6+p5recskShI9IRf8u7b6JiRBYUzvPq
 KWRaZKqZgaTEyHC7rwGXOpsU8vXNUb0H1z9b34GnYvRhBzOeuYcfOUqFD5rG16T9Exlb
 eXeD2iDdcrbqzXht1nIFLdaMcTfMgwVk4J+8EFXzqx4wElBikJgC8yPc/sZzycHfgBoK
 n+i9jkynBEqb1QVktroDYwhEFb0hB5AF7IBHkg+cmJ+mpmX5YXJEIhsYt8gDaVLd9tZ0
 RErJZGeVxpiul64Up6eFq8+ajMtDB6ZwiOFDpcTg7FWmjIBICD9HrEhI+KRIcszQH61j
 mSKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ipZZmmEYAV0Faklno+YLR1/AxWA537FIQ9fu6VgkBm0=;
 b=RYpjsPNZ8vuRTdRSbqjWAUKRVYg+HELcSg9z5owlKnYVjrLd1WKISQQ+JLPXfCQhS/
 GO2EXWSdUsfiVSn6+B53OVnZPFCVWP4V6kY80sRsGvuhtgt8yKe9UQzOm/GWUzDqmwVo
 /Ty8by57l103hO4P4JJWgpIBPNKjCLw5C/21KSD3GnS+l6OtrwxaDdDmqROkaalt5mjX
 nr02XN1fnzdk+3+evDgBvS8Jnmbkosa/yZYGnYc+JfRJ5bztqmtaShc/CCJ4YrUZ5Q1m
 L9DqORTvz6DB6fdFCqPoiiXQFQJDrgQ9Hk4HyYKFYn1aEJ+8Acwdewzmfpzggel1qVfG
 9Wng==
X-Gm-Message-State: AOAM533+jSAehChp9ZTN1SJ4JhlnTVOnm3FcoSjJl8+VKJ5B0E5N/Jxg
 gncCY+EB6vF0sLSbId9928g4htPLwsw=
X-Google-Smtp-Source: ABdhPJzGfqDzehZP/xyncgAMkOzBM3jzFli/zXCGdKGMOzu2zbhNG0mhur/NVJIVr4/BaCyf4ROTeA==
X-Received: by 2002:a63:5226:: with SMTP id g38mr29466845pgb.620.1643916067435; 
 Thu, 03 Feb 2022 11:21:07 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id e14sm30140830pfv.219.2022.02.03.11.21.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 03 Feb 2022 11:21:07 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 21/21] softmmu: Build target-agnostic objects once
Date: Thu,  3 Feb 2022 20:18:14 +0100
Message-Id: <20220203191814.45023-22-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203191814.45023-1-f4bug@amsat.org>
References: <20220203191814.45023-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::532
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x532.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

Various softmmu objects aren't target specific. Move them
to the generic softmmu source set.

For our 31 softmmu targets, this is in total 330 objects
less to build!

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 softmmu/meson.build | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/softmmu/meson.build b/softmmu/meson.build
index d8e03018ab..d2badf203b 100644
--- a/softmmu/meson.build
+++ b/softmmu/meson.build
@@ -1,20 +1,9 @@
 specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: [files(
   'arch_init.c',
-  'balloon.c',
-  'cpus.c',
-  'cpu-throttle.c',
-  'datadir.c',
-  'globals.c',
-  'physmem.c',
   'ioport.c',
-  'rtc.c',
-  'runstate.c',
   'memory.c',
-  'memory_mapping.c',
+  'physmem.c',
   'qtest.c',
-  'vl.c',
-  'cpu-timers.c',
-  'runstate-action.c',
 )])
 
 specific_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TCG'], if_true: [files(
@@ -22,9 +11,20 @@ specific_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TCG'], if_true: [files(
 )])
 
 softmmu_ss.add(files(
+  'balloon.c',
   'bootdevice.c',
+  'cpus.c',
+  'cpu-throttle.c',
+  'cpu-timers.c',
+  'datadir.c',
   'dma-helpers.c',
+  'globals.c',
+  'memory_mapping.c',
   'qdev-monitor.c',
+  'rtc.c',
+  'runstate-action.c',
+  'runstate.c',
+  'vl.c',
 ), sdl, libpmem, libdaxctl)
 
 softmmu_ss.add(when: 'CONFIG_TPM', if_true: files('tpm.c'))
-- 
2.34.1


