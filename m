Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2C764FB43
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Dec 2022 18:30:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6b0S-00027O-0S; Sat, 17 Dec 2022 12:29:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6b0I-00025o-LY
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 12:29:42 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6b0H-0002NC-6I
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 12:29:42 -0500
Received: by mail-ej1-x632.google.com with SMTP id vv4so13001935ejc.2
 for <qemu-devel@nongnu.org>; Sat, 17 Dec 2022 09:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6ZSUdi6MPqmLHvEe0ND7y8PBSQThNukontDiEvm1T8g=;
 b=ynZZBnIu3uHw8ZjTU+ptvD8NAEOs31tgcoL65oO/ziaJtUsIIDjislHra910JvDW+s
 3Or/QGT2iRJABqQ+5+Lrq0uvI7J5EmBBjec5B0ed4Dh4mmgt3G/SQkQcZhv+5ouILmAZ
 IDw4kv8HHlsCPdNam3qvGEzM1xTo6BZIf6vaBMAbESxTVvwNCUdLku4YUNpJoGoD1M5R
 ptjCRFtTW4fJImCc/odk5Ip3i/zWhGOlwMeNHGUDMDN+0HCYLfqxSom/O7ApsYSBQlqR
 2sm3kZXXr/4Mlg7YVNIzT00WyYQfV7oU2ViR7ezs7WfMjFZ68mYw8Hr/vo7zEjLhWFLG
 M20g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6ZSUdi6MPqmLHvEe0ND7y8PBSQThNukontDiEvm1T8g=;
 b=1gvNOBQ/WAJeAYuM3VNwvDAJ0qwtcSUjn7aTv+u7tQz/wAPaSkd4U13AGYxSdiDvzQ
 078EkzjY6KQi/50vJsMHBhbxuR5Lre8K10CDi7g2MNtItATRoW9Qu8nNW6Qf7mroNZSJ
 Hqav9tLcFUXuu/tnemwsV6gmTKAj18wSc2XpZ7/BI6Jf56yl36gR+5kXPV4tKypwb8yO
 nlzuj7eryfeDd6xjqNqrpKDkKRcoYrSzWZQpNvfklojRetJYgPEaah51xE31AgFmeYYf
 e5CT9+Ixf1uW9/pJvxR9rmskYLBlkZn6TFE3pxJHVTTF+6SAqamfmd4KZehbpR0D89Bx
 yVWQ==
X-Gm-Message-State: ANoB5pntptYC+1foPGOK5TO2gdnzhSnVFKs0pK7/rqMu3M0zguBTJPWm
 vTGOozZuqrmXj5Uhpa0YuGxpYRdZijeBxZFH9e4=
X-Google-Smtp-Source: AMrXdXvq5oxwBsxndznqbCK8B0fVpBp4xftm2X6MLOx+v8Vfc00Bci5+pJJyScz+r5MkI7euEneKAg==
X-Received: by 2002:a17:907:98eb:b0:7c4:fc02:46a3 with SMTP id
 ke11-20020a17090798eb00b007c4fc0246a3mr12442428ejc.30.1671298180297; 
 Sat, 17 Dec 2022 09:29:40 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 da6-20020a056402176600b0046c7c3755a7sm2203849edb.17.2022.12.17.09.29.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 17 Dec 2022 09:29:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Max Filippov <jcmvbkbc@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bin.meng@windriver.com>, kvm@vger.kernel.org,
 qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>, qemu-riscv@nongnu.org,
 Song Gao <gaosong@loongson.cn>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 3/9] target/loongarch/cpu: Restrict "memory.h" header to
 sysemu
Date: Sat, 17 Dec 2022 18:29:01 +0100
Message-Id: <20221217172907.8364-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221217172907.8364-1-philmd@linaro.org>
References: <20221217172907.8364-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Missed in 0093b9a5ee ("target/loongarch: Adjust functions
and structure to support user-mode") while cleaning commit
f84a2aacf5 ("target/loongarch: Add LoongArch IOCSR instruction").

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/loongarch/cpu.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
index c8612f5466..2f17ac6b47 100644
--- a/target/loongarch/cpu.h
+++ b/target/loongarch/cpu.h
@@ -12,7 +12,9 @@
 #include "fpu/softfloat-types.h"
 #include "hw/registerfields.h"
 #include "qemu/timer.h"
+#ifndef CONFIG_USER_ONLY
 #include "exec/memory.h"
+#endif
 #include "cpu-csr.h"
 
 #define IOCSRF_TEMP             0
-- 
2.38.1


