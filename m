Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D79B6A44A3
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:37:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWeFT-0002lY-VA; Mon, 27 Feb 2023 09:13:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeEF-0000OZ-5M
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:11:47 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeED-0001CS-Hh
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:11:46 -0500
Received: by mail-wr1-x429.google.com with SMTP id j2so6354316wrh.9
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=boxJ68eJA67XnJT9rYf8WV4k46uWX8EKHHrm/LJLj1s=;
 b=eSWQAD6CcgyPQ1iPA2AIG+VX0FfnPPTEL8cW0kTPSQ+lNxqRYCnuKpCSD/9y5dJCIV
 0t71E1LPQjMq7YBmJRJcRGqaignk9vgGhrk34+8UPe1+MUvIP0mGhzxU15hq256p+ihp
 XLUDSM6GE1vzsEK051io3LgxF7dPA4OxRVWChR3owkAjTe281YDL3U73Q/jp0jrZhPN2
 xOZ3srxjuSEnVtCzn6OmdzVEvyhW07QdUXmitWdiaYjUwnxfJqCIBA5BPGy7+q3OqQxT
 SF1Ti3Tj7Nios18VxCLaOJzEbFYi9yJQbujwvLnQ4M8IjxFlqJr8HP7QNsf05jzqzzkl
 lviA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=boxJ68eJA67XnJT9rYf8WV4k46uWX8EKHHrm/LJLj1s=;
 b=w5CWr2TIdFtRvtvpfwMXGA3FmEQ/FtBfE+Hy9qkwlhICKEW2q7RG+k1QRBAJ0x0I/v
 khl3nIIrLX71W1UB/2WsVlNNGjGuyq5NWYPGhPaxjttGyTkO3We5NR6+ClmGbTf4NArd
 piGvrF+B1b65PU89pktpyrf7t09BpdhIzGBvc6R3Y93FOziiyuXJ7C7AsoVPW4OpSY69
 0jId9XhKQJ/ebe1SOlBQlXQ+x9ACrv3SmphofO7Dd3LxByq69z+eefhHhgXHitk2GJHQ
 Cw+aymwJcpqWFdeeYw2mSr2eOhje+DivgRakLf+M9DQPGF2T/qmoA25w7XbeaH254e9B
 KN+A==
X-Gm-Message-State: AO0yUKXtBS5+Yy5Br/wqkltw8FIdwmQAtQIPHoNjVG/43winiBaPEQp9
 xH/1hB5IV6Dlf0Qy82+ZguyQwkNP8R0L/gCw
X-Google-Smtp-Source: AK7set+S0DDyvaS67ej1WNoplP4s8WAwleflBxbghCfLkqmQj4ZVpulkBK/mxTqlNbYIxt/w51Jk5w==
X-Received: by 2002:a5d:6812:0:b0:2c7:f2f:e47 with SMTP id
 w18-20020a5d6812000000b002c70f2f0e47mr13043859wru.22.1677507103941; 
 Mon, 27 Feb 2023 06:11:43 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 c4-20020adffb04000000b002c70bfe505esm7159484wrr.82.2023.02.27.06.11.43
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:11:43 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 114/126] hw/ide/ioport: Remove unnecessary includes
Date: Mon, 27 Feb 2023 15:02:01 +0100
Message-Id: <20230227140213.35084-105-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
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
Message-Id: <20230215112712.23110-17-philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/ide/ioport.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/hw/ide/ioport.c b/hw/ide/ioport.c
index e6caa537fa..e2ecc6230c 100644
--- a/hw/ide/ioport.c
+++ b/hw/ide/ioport.c
@@ -25,16 +25,6 @@
 
 #include "qemu/osdep.h"
 #include "hw/isa/isa.h"
-#include "qemu/error-report.h"
-#include "qemu/timer.h"
-#include "sysemu/blockdev.h"
-#include "sysemu/dma.h"
-#include "hw/block/block.h"
-#include "sysemu/block-backend.h"
-#include "qapi/error.h"
-#include "qemu/cutils.h"
-#include "sysemu/replay.h"
-
 #include "hw/ide/internal.h"
 #include "trace.h"
 
-- 
2.38.1


