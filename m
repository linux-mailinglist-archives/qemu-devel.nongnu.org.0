Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A29BA32F1F7
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 18:57:15 +0100 (CET)
Received: from localhost ([::1]:43394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIEhO-0006Nd-LR
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 12:57:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIE3S-00074a-6j
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:15:58 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:35622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIE3B-0007dm-Hq
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:15:57 -0500
Received: by mail-wr1-x42f.google.com with SMTP id l12so2900354wry.2
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 09:15:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=gj5VjeYF9Elb4NtSjOuTjpuxn7GzS8nIUQntXvjQ7Zo=;
 b=bV54Jm00aMFWs3G9Ch6ptVf7t+vHU/KlfrmUs0P5QMgV/FK7mBOU0yhNx5sWoPXWQ5
 Tz7y2VFsbfDzCA7NnjcXCYDLzR2J5ScFKENi2zM41/yNBDUm4ahKD6ebjTKZek/TvHVx
 2ossqCXFn9RhkAVOqt8gDLB/pPEgr3FfGnu4NfttAAKd94jZ1FLvXdJlKqoLbuqtFeoS
 RWCXNzQHD2WptlJLfKK6kAxGHr1Ub3h00peVetrPhvBrxWIMZQnrY2acwCzLMvhw9rBQ
 CaIoaA+wrwUXu2pMDkOj8YgtgkUYlmR7ixEM/MOFpL3kqaXULLM6SgINIAUo81gUpuyt
 TpOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gj5VjeYF9Elb4NtSjOuTjpuxn7GzS8nIUQntXvjQ7Zo=;
 b=cImq47/sT6c+5VcYAdzRbbWW/qNNP5Y2NS8Begok04btq2mt0fEOIGF2avuOw8weBu
 nHKEvpzCbtP244/io7p/CN44V6w+wbjSwBoW2HEUIRo8P64HQWbrVWUdekG9w8m3c1Uk
 FG/0KufhkpUzLQQVXr39WZKlzBfL3qJUxbT3aI0QngZ1Pa6g7/oaNLYJTSSGLsJQMkEd
 NrUqyuFlVR/WQyakdOPIEfk1UmiHY9ElkHE5mHqjyqafTQDpnpUw2X4c8gE3/YUfnEy5
 vuM9Ei9F01jiIK02JzL+V/8Xl2KkzhnbqXNXBDLcpPHiH79TJXLnOB9V+qKEG1h5HbRs
 jRrQ==
X-Gm-Message-State: AOAM5329fxaG7BmSa15JhFXXYfC/ips22jndK1cCts0QU5LK0cuvZAAK
 kUSBomaYjvGRW8MSQUEo1hmDdOOQecZQXQ==
X-Google-Smtp-Source: ABdhPJxLaM9BmKJZuSV8VnPvoSWvgYO5Vya0Z6rSNN1jrVQRrlAjQ6v4BL9zdJHoXeeXA/GWf2J3TQ==
X-Received: by 2002:adf:f44b:: with SMTP id f11mr10544601wrp.345.1614964537259; 
 Fri, 05 Mar 2021 09:15:37 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m132sm5942357wmf.45.2021.03.05.09.15.36
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 09:15:36 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 28/49] hw/arm/mps2-tz: Correct the OSCCLK settings for
 mps2-an505 and mps2-an511
Date: Fri,  5 Mar 2021 17:14:54 +0000
Message-Id: <20210305171515.1038-29-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210305171515.1038-1-peter.maydell@linaro.org>
References: <20210305171515.1038-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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

We were previously using the default OSCCLK settings, which are
correct for the older MPS2 boards (mps2-an385, mps2-an386,
mps2-an500, mps2-an511), but wrong for the mps2-an505 and mps2-511
implemented in mps2-tz.c.  Now we're setting the values explicitly we
can fix them to be correct.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210215115138.20465-4-peter.maydell@linaro.org
---
 hw/arm/mps2-tz.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 7c066c11ed4..976f5f5c682 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -221,8 +221,8 @@ static MemoryRegion *make_scc(MPS2TZMachineState *mms, void *opaque,
     qdev_prop_set_uint32(sccdev, "scc-id", mmc->scc_id);
     /* This will need to be per-FPGA image eventually */
     qdev_prop_set_uint32(sccdev, "len-oscclk", 3);
-    qdev_prop_set_uint32(sccdev, "oscclk[0]", 50000000);
-    qdev_prop_set_uint32(sccdev, "oscclk[1]", 24576000);
+    qdev_prop_set_uint32(sccdev, "oscclk[0]", 40000000);
+    qdev_prop_set_uint32(sccdev, "oscclk[1]", 24580000);
     qdev_prop_set_uint32(sccdev, "oscclk[2]", 25000000);
     sysbus_realize(SYS_BUS_DEVICE(scc), &error_fatal);
     return sysbus_mmio_get_region(SYS_BUS_DEVICE(sccdev), 0);
-- 
2.20.1


