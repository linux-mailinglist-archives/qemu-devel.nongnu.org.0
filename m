Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CBA364BE6D
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 22:30:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5Cmf-0000as-3Q; Tue, 13 Dec 2022 16:25:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p5Cmd-0000aM-5i
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 16:25:51 -0500
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p5Cmb-0003Cd-Il
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 16:25:50 -0500
Received: by mail-oi1-x22d.google.com with SMTP id q186so1022121oia.9
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 13:25:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=1fcBWbZUmm5Jnpz4Izudl/A6K0HNswQpl9r23JhxDb4=;
 b=h/hzm/2FHR1E88XejO8s29lpgq/7aDGg3/Qn4G/blVonnpyeqNPO6Ay9cz2tEP5rkW
 s5RX6KfDAAZnMoOGfK877pxGROA4qgWlrtt0dRLECySMjKBob4gv9Gw2/8FFCR/h/vgf
 AQcWTBUiz12fRNU0GPvHFdRkwazEXRoX55TKiqGhM65eVxWWrm2izhsMcqXhlTB9x/MR
 7CfRqoxeJDmO0gdsEodm0liPvZSWRjcW2/VnqYRx/NYlfaXQ6W1zZb95+CiMMRQJ/CeF
 KgZpZFg9vkq2qSbACf/Chf4itF9Wsp6h4vOF++H+Sh92O/UnGCCSyI+3nQRKK2Qj/6nQ
 kZLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1fcBWbZUmm5Jnpz4Izudl/A6K0HNswQpl9r23JhxDb4=;
 b=HWbVJigd8Xy6R0JbbNQzi2RA3L/vspS5oSlykrc6fTJwUF/Su8LwBLYXGaX91xEaMG
 IgOCZpAH62N4kNnPp/iIjRwGiKT1MNRYK8wy8apGchaGk1SW1NaQyYxx3FhncoHvTLJV
 3PVccMIDamuafZkfVdzVPuHvUks/6rF0hfrVOMRAVVG7jrzFIIAoOycnf7nhJjDQtE8M
 JHhxhwP9bq2sI2vZEv6obHAn5WbHzekjmxeAS0mDzhCYPEod6HtZrU2+fsB4wV+bls8s
 vZvjZCTpKNP2HBkkN8h8vT+MAaVDFP8/Z2hmy1TKOYc/ER7AqGxF+6nx+COJh4Rx8Udj
 +oRA==
X-Gm-Message-State: ANoB5pnsSiEroqqSbiYmAigc69DcufnpUg2UNKWlfuSE1AoufX21pfBU
 FM0gDT3YDEOQ9IDag+lmu73BHMX3kPzE3XRJN9s=
X-Google-Smtp-Source: AA0mqf6GkiNTL8d3NXEWxTtJjbqoM9LmGzubJUEqMjCFGyFDwruYUiDj0655eSi7VncAzzoyw1rjLg==
X-Received: by 2002:a05:6808:23d6:b0:35b:eddd:653c with SMTP id
 bq22-20020a05680823d600b0035beddd653cmr13015445oib.40.1670966748410; 
 Tue, 13 Dec 2022 13:25:48 -0800 (PST)
Received: from stoup.. ([2806:102e:18:2efc:c63:85ed:4256:8ad0])
 by smtp.gmail.com with ESMTPSA id
 a7-20020a056808098700b0035c073aa0d8sm5006831oic.18.2022.12.13.13.25.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Dec 2022 13:25:47 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 05/27] accel/tcg: Set cflags_next_tb in cpu_common_initfn
Date: Tue, 13 Dec 2022 15:25:19 -0600
Message-Id: <20221213212541.1820840-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221213212541.1820840-1-richard.henderson@linaro.org>
References: <20221213212541.1820840-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22d.google.com
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

While we initialize this value in cpu_common_reset, that
isn't called during startup, so set it as well in init.
This fixes -singlestep versus the very first TB.

Fixes: 04f5b647ed07 ("accel/tcg: Handle -singlestep in curr_cflags")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/core/cpu-common.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index f9fdd46b9d..6a4022eb14 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -235,6 +235,7 @@ static void cpu_common_initfn(Object *obj)
     /* the default value is changed by qemu_init_vcpu() for softmmu */
     cpu->nr_cores = 1;
     cpu->nr_threads = 1;
+    cpu->cflags_next_tb = -1;
 
     qemu_mutex_init(&cpu->work_mutex);
     QSIMPLEQ_INIT(&cpu->work_list);
-- 
2.34.1


