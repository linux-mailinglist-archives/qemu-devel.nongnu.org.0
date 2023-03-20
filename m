Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 954726C0E66
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 11:12:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peCTd-0003nN-M9; Mon, 20 Mar 2023 06:10:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1peCTT-0003kx-9i
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 06:10:44 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1peCTP-0000CT-OG
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 06:10:41 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 o40-20020a05600c512800b003eddedc47aeso1706028wms.3
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 03:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679307038;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LUMw8RA1BNOCtad0CWVcs2eZdBZ6IcdOa6VvbiYXoBQ=;
 b=cWh0kIiq7/X1M52vBzGqfQwvnc/3V/91/jXSLKShOjVzIerO7SzbtSqFpVXpu2SVoL
 v5pbE4qEK9ithzYge01DZI0S/5DYbcdoQ14v8eTjj7sA4uB8dBARfbsleYZnrOOHlAXQ
 bJHzy6UrfHjfBBWzlqlB8H5epdAASKLZj93BZFNCjgAGSdHgtH/+pGDMqoQT8mU73v2w
 lo2IBy2Fef3WESNIO96NPQ8nsFEeSuuUfIruhHlmYgh5myoMpEVcpebvgPjH6C5/gUSD
 aGM6Y714CUiTOOXIdI/JKMA9WPKk6yHVpcy5QJJRsbhlvNuB3l0BSUwfc4bSjiKjhOy5
 cz/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679307038;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LUMw8RA1BNOCtad0CWVcs2eZdBZ6IcdOa6VvbiYXoBQ=;
 b=RNlNbx+glxDZbAukkU+FiVp86kgdeOysDBNdrSi/N041npUqU7UXtCOG52kJ9Yf6CK
 ZdfiSOosrhNCDLc4+J3zG2mLiFEVUSOkqcy1UbY0ql4XMNJlVlDAjLHNicxR1yzaVY6A
 kVG69uEIxLvZRq0xm2JJm5ELxUldgn4O7k3OiAkreSbhDh8yOYVH/4Qbu2roT+leTN8T
 ypv01resh3MSvAtIu1NpU9m9J1m5wLBhrN4m85xh95qUSBzEIT8g6OPwfVM8CnBE2iEo
 xzeeR0spSZofNT5cgDUCFW5Edoj+7vJ/3Ek89688EIKEaWGJbUVrLdsvXhACN9ilL2CY
 LK8Q==
X-Gm-Message-State: AO0yUKWVOJZoOmvjRKbKEk4imCnFLdHoowCncmMNN7WE5pWSWqpebPLt
 OrOtAyhbpZShk8rFrcC7S012Vg==
X-Google-Smtp-Source: AK7set+fjyTIh/zZNlwLj2zDOO9qRCgwB00abXgeRrUMJk6lzh8638aSlDvDACNhA+4ICcrp3T2VOg==
X-Received: by 2002:a05:600c:3b8e:b0:3ed:290b:dc68 with SMTP id
 n14-20020a05600c3b8e00b003ed290bdc68mr23772731wms.12.1679307038198; 
 Mon, 20 Mar 2023 03:10:38 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 bg7-20020a05600c3c8700b003eb2e33f327sm27320431wmb.2.2023.03.20.03.10.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 03:10:36 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4124B1FFBC;
 Mon, 20 Mar 2023 10:10:36 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Alessandro Di Federico <ale@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 04/10] accel/tcg: don't bother with ifdef for CPU_DUMP_CCOP
Date: Mon, 20 Mar 2023 10:10:29 +0000
Message-Id: <20230320101035.2214196-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230320101035.2214196-1-alex.bennee@linaro.org>
References: <20230320101035.2214196-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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

While only i386 dumps anything useful for the flag it could
potentially be used by others. Front ends that don't understand the
flag will ignore it anyway.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 accel/tcg/cpu-exec.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 5e5906e199..f883be197f 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -309,14 +309,11 @@ static void log_cpu_exec(target_ulong pc, CPUState *cpu,
         if (qemu_loglevel_mask(CPU_LOG_TB_CPU)) {
             FILE *logfile = qemu_log_trylock();
             if (logfile) {
-                int flags = 0;
+                int flags = CPU_DUMP_CCOP;;
 
                 if (qemu_loglevel_mask(CPU_LOG_TB_FPU)) {
                     flags |= CPU_DUMP_FPU;
                 }
-#if defined(TARGET_I386)
-                flags |= CPU_DUMP_CCOP;
-#endif
                 cpu_dump_state(cpu, logfile, flags);
                 qemu_log_unlock(logfile);
             }
-- 
2.39.2


