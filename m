Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7288168C9A9
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 23:39:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPA6L-00023V-2D; Mon, 06 Feb 2023 17:36:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPA5c-0001wD-5t
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 17:35:56 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPA5a-0004Rt-ID
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 17:35:55 -0500
Received: by mail-wr1-x42f.google.com with SMTP id o18so11896371wrj.3
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 14:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/k7Xuyi4yDhm+JEx9OBf9mhnkAiRR8pR4vzYzacLnP8=;
 b=U3eTCcOy6zdmk2vKJvcQTKLuIHvtaW174JDHL80aevYN+nwHs5E+BdMrtJVPqP/EQc
 OgybLpw+f2wCkx5A+c1I14efpk6ZobychfMRbOlX/0IWex64SpRXhWxqdkA6Jk8/L2aM
 p8ibcfO/fLS8wWos/Sj/lkYb1YFMIsBy9M7Mw3lXXrnbkweq5lbNnrC/4d/RopkOz+WK
 sHE5Oe30RL8r+Z9Q30NXD6oT0/klhmR85/LXaTf+3z63Hgr1FCjkaIC5ttgi6r2HTvy6
 68xdGOgJncQ1oV8NhK6OY3ADxb88UYZ2Gx2ScGoXSjHFosTrZT1nmK3W3zGWMOZZ6wie
 3E7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/k7Xuyi4yDhm+JEx9OBf9mhnkAiRR8pR4vzYzacLnP8=;
 b=XrmlnAeNLf+n09ahUry2Jy81sLe0/kPHp83IPBBu0nEKgHGGYxFdpiIrLmZ2LlhJ0c
 FgqeRVtJoUn9ziRkYBcOOCKRmZ/NZBmmopRT3ACHX4oIi1T6s6w6KPxcUitHpJfoOA8C
 0wfk74cny+JLx08Qjtc+WgcUV64caV6twlQLY6oc/LPt/bjN8wtmvayCi/lsu3h22RKU
 4nNqqwgF1daLpONaJKitXgovwAW4lwkAPAK0EkicyhVgQ0SYgsFwoFYcJr4Rqvm52480
 R/da+2OmHpJ/UdfWMEU1mJ0h23QnhgHWrRMkaYDd1dY0SDBSZwpRlWTxA8FPAUX+f3UH
 qlCA==
X-Gm-Message-State: AO0yUKVBUIbNn6IgHRCTVbfyCfE47FSI+Qi8pzunkkFRZID4X6bzmkIV
 W/30vh5zWR41OEYkBP9cerboNkcH8meK67Aj
X-Google-Smtp-Source: AK7set/M08H/y2VdGazDBS3RCK2ZtHB/AKx6Xgaz0nvCL4dmeZlIzWaXyfOLaG7nz95xdP6nyADlDw==
X-Received: by 2002:adf:db88:0:b0:2bf:d776:1c9a with SMTP id
 u8-20020adfdb88000000b002bfd7761c9amr505199wri.4.1675722953688; 
 Mon, 06 Feb 2023 14:35:53 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 d5-20020adfef85000000b002c3e600d1a8sm4481597wro.95.2023.02.06.14.35.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 06 Feb 2023 14:35:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 09/11] target/arm: Restrict CPUARMState::nvic to sysemu
Date: Mon,  6 Feb 2023 23:35:00 +0100
Message-Id: <20230206223502.25122-10-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230206223502.25122-1-philmd@linaro.org>
References: <20230206223502.25122-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/cpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index a574e85b76..01f9566a1b 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -767,8 +767,8 @@ typedef struct CPUArchState {
         uint32_t ctrl;
     } sau;
 
-    void *nvic;
 #if !defined(CONFIG_USER_ONLY)
+    void *nvic;
     const struct arm_boot_info *boot_info;
     /* Store GICv3CPUState to access from this struct */
     void *gicv3state;
-- 
2.38.1


