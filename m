Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FDB64FB4F
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Dec 2022 18:32:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6b0b-0002D2-Ro; Sat, 17 Dec 2022 12:30:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6b0Z-0002C9-13
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 12:29:59 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6b0X-0002P3-Kg
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 12:29:58 -0500
Received: by mail-ej1-x62f.google.com with SMTP id ud5so12970322ejc.4
 for <qemu-devel@nongnu.org>; Sat, 17 Dec 2022 09:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Je6pglm7Ro/G6/Hw82+zaiN4Czg7YWpLl/0Q2PSll9w=;
 b=GtUaV+75kc/w2Jz9y6r/nJ0UXl5KQ9zRbxRmQxJApuJqSpXejlL04qdNyMDJZAF0Sd
 c7hb2VL3FVp+WZjsMksKpWTI8AtikUc68bY3ruW2CqV3ESSKydsEnZ2b+X2oRE/24DIz
 gGDdPT2WsiklD4zZ8h8pGe5pgiY7Z5/9RAbS4yWntEgX6RDhQ2aP3f6TqZ+rMFkqkOSF
 3ur44FGMR9tQImO0CndosOLQOONsdMZLCETwu92SLfn0xssvLS3NqWGM2nAyYzd6FMUB
 TP2YOxP3+O0lgxLz09QCXkpNxHcmbYOqYaKI08g9NOoXwW5oVWIZ1J3lkiIZ3ZtuBplq
 hAXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Je6pglm7Ro/G6/Hw82+zaiN4Czg7YWpLl/0Q2PSll9w=;
 b=QJLeJgRHXJKlm0NjSbgAB4rf9fJXqKJrz8z2XVAnuBi9JqkiL5OiyI4m+wsautSZrJ
 loKrKsN0M/yTlBJKjdeTV9IMrFng7OVtMsG3FN6m3anOAPBmnfo6LnCNGPNGLppUhvzj
 fpz1gG2QZyaLDiLeUIAhYDtKTY1UyE8qdfHYvvr/BbuSjQGlmOIGZnK8/pNDBXvF7GnS
 IPx7Uhc9V/3DL1GxZ68Iz1HycQo3lDwk8Fo3SrJ7tVVu52+DNPGFnbRKm7c/hrv6ihUU
 qpGldmHDuJolLQ9sDZmR1RnhkQid26diBtPBFWUyuINMPsGVGX2tVdTufrK2uGKSWskw
 4uPQ==
X-Gm-Message-State: ANoB5plxBFuzWNPwXU7AUuneYknlFfpaWf1vSjjOXQUrl5hze6qabrF4
 Il2b7u4VnqpkoUW4rv9p2G/yeZH/iJ/p9Geg1Ao=
X-Google-Smtp-Source: AA0mqf72Pm4NY4wNp46CZqXV4Nvqqb64mTPo5WGko4tfGBRcVj0ixpsUx8E+tmqvXqstRrhMA/coNw==
X-Received: by 2002:a17:906:9f1e:b0:7c0:7d35:e9db with SMTP id
 fy30-20020a1709069f1e00b007c07d35e9dbmr43794106ejc.15.1671298196789; 
 Sat, 17 Dec 2022 09:29:56 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 t1-20020a170906a10100b007a1d4944d45sm2239662ejy.142.2022.12.17.09.29.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 17 Dec 2022 09:29:56 -0800 (PST)
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
Subject: [PATCH v2 5/9] target/ppc/kvm: Remove unused "sysbus.h" header
Date: Sat, 17 Dec 2022 18:29:03 +0100
Message-Id: <20221217172907.8364-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221217172907.8364-1-philmd@linaro.org>
References: <20221217172907.8364-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62f.google.com
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

Nothing requires SysBus declarations here.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/ppc/kvm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index 7c25348b7b..78f6fc50cd 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -32,7 +32,6 @@
 #include "sysemu/device_tree.h"
 #include "mmu-hash64.h"
 
-#include "hw/sysbus.h"
 #include "hw/ppc/spapr.h"
 #include "hw/ppc/spapr_cpu_core.h"
 #include "hw/hw.h"
-- 
2.38.1


