Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D87390498
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 17:06:00 +0200 (CEST)
Received: from localhost ([::1]:55116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llYd5-0004lt-28
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 11:05:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYan-0001YP-0D
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:03:37 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:44892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYal-00041c-5e
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:03:36 -0400
Received: by mail-wr1-x429.google.com with SMTP id i17so32596975wrq.11
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=YD9gvKP5eBMz5gSAgFIXdWeF4IeCcqagvgPRXfCAocM=;
 b=Hf361ilAzwXLYtS7dGiH5fr8fu9x2jPm1RQ/KDgZ/gWztdf+RMe2PjI07Zi16Jt2G2
 3KM8NIPbG1kaSxFpy7TmShvUZ4O0TP23OUcGQU4Yki7E8sqVIvHiXpg4c++8nfJsfA0Q
 L7/g2EmmDyuYLzgVBkYIGEnE/ECAOZlp/58JS1zPkepDY+yj8eGAT7A7wARg0VEKRuST
 gB/LVueTKQYAdwzRr+yxn0+1uqpcVm6siXuMreL7hWFWc5l/L/jXL0pkaXskaOU1Qvx4
 viUtM2JLwgzt5Q9/Vw38ne5NG1TEhICZcNW5/U+rT6lYSPD/Fw0VdHAtcyzuWrGhmRd4
 xUzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YD9gvKP5eBMz5gSAgFIXdWeF4IeCcqagvgPRXfCAocM=;
 b=BQkN7oXSUgQK8vWKNGnHj8OHE/ue6vC6f+W4VZHY0+7gNlYysKz9QT2tsKfRnPusy4
 xiuJUv0kXG2yItaOH9PyHTqBwAsNb5H3m7PohDJXBw7OKO2xhpXT3zi4BhIyrj7+IRAW
 Gs55KVuSFnyYQaKEJasw+DxpZ5rCuuMJZSIu0FngPbJ8CDi6dOOH7S0vBTiRWP+vyO7p
 yYPO5vN/7Ktjw4yJewzsGGWVglrpxReRE77v/5jHyuvTFhvPHJxJTL/k8RwNk0eUkKsa
 ehzrMYpngMIV9oeu9KkclkHfSrRBvHg/298nKxoFUXMenAEHcarNSwTQXSuFTpbfdIcK
 EWUw==
X-Gm-Message-State: AOAM533dx92PI9Sk0/6vdOQqBa/qIDvhX+S7lbWy4YDQs7u8a6HMeEwz
 BTXAXCONwfsGnTWM+bAZSEGG4PkI/GEEaIpO
X-Google-Smtp-Source: ABdhPJzXU3HaVg0SBkqIthERoXmzPFIKgRp2lH6qFxe5TLhoqIhclUChQVN5rXQltEirGLzjR8H23g==
X-Received: by 2002:a5d:50cf:: with SMTP id f15mr12846055wrt.287.1621955013625; 
 Tue, 25 May 2021 08:03:33 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q62sm11710284wma.42.2021.05.25.08.03.33
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:03:33 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 003/114] hw/arm/mps2-tz: Don't duplicate modelling of SRAM in
 AN524
Date: Tue, 25 May 2021 16:01:33 +0100
Message-Id: <20210525150324.32370-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525150324.32370-1-peter.maydell@linaro.org>
References: <20210525150324.32370-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The SRAM at 0x2000_0000 is part of the SSE-200 itself, and we model
it that way in hw/arm/armsse.c (along with the associated MPCs).  We
incorrectly also added an entry to the RAMInfo array for the AN524 in
hw/arm/mps2-tz.c, which was pointless because the CPU would never see
it.  Delete it.

The bug had no guest-visible effect because devices in the SSE-200
take priority over those in the board model (armsse.c maps
s->board_memory at priority -2).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210510190844.17799-2-peter.maydell@linaro.org
---
 hw/arm/mps2-tz.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 70aa31a7f6c..77ff83acb06 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -243,19 +243,13 @@ static const RAMInfo an524_raminfo[] = { {
         .size = 512 * KiB,
         .mpc = 0,
         .mrindex = 0,
-    }, {
-        .name = "sram",
-        .base = 0x20000000,
-        .size = 32 * 4 * KiB,
-        .mpc = -1,
-        .mrindex = 1,
     }, {
         /* We don't model QSPI flash yet; for now expose it as simple ROM */
         .name = "QSPI",
         .base = 0x28000000,
         .size = 8 * MiB,
         .mpc = 1,
-        .mrindex = 2,
+        .mrindex = 1,
         .flags = IS_ROM,
     }, {
         .name = "DDR",
-- 
2.20.1


