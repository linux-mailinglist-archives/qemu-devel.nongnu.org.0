Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A54D6A43A1
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:03:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWe5L-0003vF-By; Mon, 27 Feb 2023 09:02:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pWe4S-0000px-Oi
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:01:46 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pWe4P-0007WH-M9
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:01:39 -0500
Received: by mail-wr1-x436.google.com with SMTP id bx12so3175870wrb.11
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=UjsmPr4NI1xBRDaPfLgfuSMFB/tmuf/54srjtmPP27c=;
 b=EhnD367YwV75/gp9l5edA72NTiWkJlJR4DFKmtpXOPN+GRxXwLE+tvYxqExQb7GQ0k
 //yqcFdMrHIgztELWGcQCrhrLQWv3zHJ4rdHZ+LeoT7bumAS/rOiZ8IHpVG8b4n6znlI
 ziXhwrXXTmPcZ2AjYbsmrwEOHnmmeYZN9LBNs3KUhKtO/7IOQMxfiWgzyWVerLtHJz5y
 3Kl8pm9YKbrXa4NZCCv8U8+hNL0bg8gmJr1vq0s66TPq/hgTScgzUTgSrnmFrDoaLU1J
 5JvA4YgxfMDo5aM/nRE50IgrOyvQUu7ls8usa6KgTX6sVm+7Q8I5oY8uqvBqzII2TW8e
 0ogA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UjsmPr4NI1xBRDaPfLgfuSMFB/tmuf/54srjtmPP27c=;
 b=ZhmWCic+h2zN0QSeSFHrUdHztcbyuwX+BpC9FTmIeHHZoS8CNtwsK9P8V/yl7rOE1w
 dr505hrlwwuvpsMfdRw8noLUhhyeS02j21nIAKn0ulR4bUxRKZOerZ4fhB5U7dOqY6xi
 /bbIZ2CgXurvaaSQR2tSDwt4MzzrBKfClBOPHdDI8HcbAZ0YCqv9qwxxJe1lBgaBplLv
 yXl8vtqfUCY1aDvjZyGud7KpQNciJTe17p/7AHVTU+Ck9trpCK6ixrfvvg1sFA7eee5F
 yW8MAgeoufagbiGrHEFhq+XVOcoJk4G3xo/7Q0v7a2DttjLGmIWKvGF0RQ0TOZEk6cX0
 Gjdw==
X-Gm-Message-State: AO0yUKUlZezSpPxagcq+y5swp972EvGIVVYrY9FRRi7baZYpU5eru+o0
 lIuRD+sP4IN1fhzcZbqWqkUI7iwPXSrwIrSj
X-Google-Smtp-Source: AK7set8I1THzidQ+SjLUP21UWvJUl+tRVDlMc5kLeIFWBWD+LirIY0f1aRgi7iFYx1fxhnYKUJGmVg==
X-Received: by 2002:a5d:6e88:0:b0:2cc:1935:1ae8 with SMTP id
 k8-20020a5d6e88000000b002cc19351ae8mr1972459wrz.47.1677506496973; 
 Mon, 27 Feb 2023 06:01:36 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 s9-20020a5d4249000000b002c5598c14acsm7158514wrr.6.2023.02.27.06.01.36
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 06:01:36 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 24/25] hw/or-irq: Declare QOM macros using
 OBJECT_DECLARE_SIMPLE_TYPE()
Date: Mon, 27 Feb 2023 14:01:01 +0000
Message-Id: <20230227140102.3712344-25-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227140102.3712344-1-peter.maydell@linaro.org>
References: <20230227140102.3712344-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Missed during automatic conversion from commit 8063396bf3
("Use OBJECT_DECLARE_SIMPLE_TYPE when possible").

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20230113200138.52869-4-philmd@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/or-irq.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/hw/or-irq.h b/include/hw/or-irq.h
index f2f0a273810..131abc2e0c7 100644
--- a/include/hw/or-irq.h
+++ b/include/hw/or-irq.h
@@ -37,8 +37,7 @@
 
 typedef struct OrIRQState qemu_or_irq;
 
-DECLARE_INSTANCE_CHECKER(qemu_or_irq, OR_IRQ,
-                         TYPE_OR_IRQ)
+OBJECT_DECLARE_SIMPLE_TYPE(OrIRQState, OR_IRQ)
 
 struct OrIRQState {
     DeviceState parent_obj;
-- 
2.34.1


