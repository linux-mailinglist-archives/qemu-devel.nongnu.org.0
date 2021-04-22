Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE59D368930
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 01:04:40 +0200 (CEST)
Received: from localhost ([::1]:58170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZiND-0006jB-Ud
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 19:04:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZiLC-0005A8-4X
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 19:02:34 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:44831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZiL9-0007ov-VW
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 19:02:33 -0400
Received: by mail-pg1-x529.google.com with SMTP id y32so33906663pga.11
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 16:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i2qHlCiJ2ypvQTREB0mNHsQoQ+IiJSRCvrbrqzPax/E=;
 b=Dic/n7O6ICQOz1iGkTB5aoOiLwB53NZ1EwzjoR3OW+9JkKZ4MhYorNDWx4wpOqANae
 0jyQ1LDF7QU2zCg1rmU4rwVmQCF3zdpHIalgpSJQ2eXlBmnvJadvy2WQNOUnyP9vFfPk
 FuLyj0MxSLmIcTx1PmCSaNyjCuMhlhBIJST2031JSnjePD/xAiblbWzU2FU42aGjVc71
 CaL8UVFreGQzktIFRdXJgtiEg1F2GU/2f+Q+GZYAXHMt2/TcTnULY1V/GJLLpcDl8J57
 eRVza+8RR5r7K8StrHuyCjPXSJ6u//rHat+jyUNJ6VVHcuiSckx5wMUYVe+CO68udEbS
 KCYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i2qHlCiJ2ypvQTREB0mNHsQoQ+IiJSRCvrbrqzPax/E=;
 b=p6bhkNBEJcI/KigyQM8Q1GclQip/lRvDwWykRcu0KLAN1FWkSV6f8mtsm6gaq04NSD
 nMPYuQX0kiAH8AZSQpX/nPX6DarhS4k9ObvTqYUmPpE5eVLmbZWHdQV/OehJV2xf++oc
 JFRzpObn5C5kx1DNPQGhV309ApBV42zeDKFCEZEkjsXAkxnqANQdK4l4e54OLX5l7Bi6
 Fy5TAtt0RVnXfatJv/6YOL69R7nigP5PKIYlSvWmLHPSWn42EneK9I5IRExDWzrovOVa
 lBkWjptQQuDXtvCJnSZdfj/G5wOoegWCyKk9atm7UlGFa7AVY6R1P4LPX6oi3KnM/7e0
 JwAw==
X-Gm-Message-State: AOAM531r5mLpXgc17vva3Z9qG3xE+E/eQUxzKClL8eTVdIgBX+JRu0n5
 Qsv2WQ9bGsD8bRtXRKcLYJYQRa/KTopwgg==
X-Google-Smtp-Source: ABdhPJy8kl/NznFQAWjxFnvmR3JbFGBPTPvlWvx2Bwo/FvikwmjnCmjy3KDaiI4Q5Mj7LKDhiUvV9A==
X-Received: by 2002:a63:3c59:: with SMTP id i25mr943724pgn.366.1619132550121; 
 Thu, 22 Apr 2021 16:02:30 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id z12sm2930605pfn.195.2021.04.22.16.02.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 16:02:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/7] linux-user/alpha: Fix rt sigframe return
Date: Thu, 22 Apr 2021 16:02:21 -0700
Message-Id: <20210422230227.314751-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210422230227.314751-1-richard.henderson@linaro.org>
References: <20210422230227.314751-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We incorrectly used the offset of the non-rt sigframe.

Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/alpha/signal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/alpha/signal.c b/linux-user/alpha/signal.c
index c5c27ce084..86f5d2276d 100644
--- a/linux-user/alpha/signal.c
+++ b/linux-user/alpha/signal.c
@@ -200,7 +200,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
                    &frame->retcode[1]);
         __put_user(INSN_CALLSYS, &frame->retcode[2]);
         /* imb(); */
-        r26 = frame_addr + offsetof(struct target_sigframe, retcode);
+        r26 = frame_addr + offsetof(struct target_rt_sigframe, retcode);
     }
 
     if (err) {
-- 
2.25.1


