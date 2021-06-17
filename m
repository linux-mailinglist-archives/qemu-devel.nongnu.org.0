Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE783AB325
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 14:01:08 +0200 (CEST)
Received: from localhost ([::1]:51834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltqhn-00030G-2z
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 08:01:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltqb1-0007AX-LH
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 07:54:07 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:34490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltqb0-0005Kx-0l
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 07:54:07 -0400
Received: by mail-wr1-x42d.google.com with SMTP id e22so2861560wrc.1
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 04:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WmyHaJHcvUKLEVm6aSpmTart9qZchQ/2Um+oWz7mMdA=;
 b=X9jMfQFSYaokIrJZgLTlIh90r++RmcxwxZ9RzZwSiOFjtN3CHjZqt/amS5e3CZaXPQ
 6f117Et2G/F1m1yoGa240WMr/6u+VLdxuEe0JC01KMueSKYfMwV4iUYtSWbjL1u8xtmz
 n6ohTuFv9bDnbEewUQjZhs7823y44hj5SWML9N0DY/mTfluO/KpXdnHo5smOAHAit434
 sQ48EN9bigAF/P01ilMsTsANZcPTNtzld/MW1zLw3/YSrdW2yF5DBpW+drayPbnPQne4
 mYeLuDqQyMf15dSaD8acsnDfYTtlICtIlkaAeQdEbpwPmqUU8HiOAlwHTCNAtwky2fyl
 22EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=WmyHaJHcvUKLEVm6aSpmTart9qZchQ/2Um+oWz7mMdA=;
 b=n66uFYRGeALIVPhUKEXIK0fKRRfz+otg8wsMQij0vDuphwEVTHe1Ct3//f8dsPJfgQ
 H6+g7f8h/3kgsWMQFVhsFpjJFrQVJ4Kp34pDmGEyyCg7JJk+bdFyfrAwPxmP5cuz93B4
 jdWFxmCqk8YeQEggSsvxh5Bh07SXuriWI1d35r7ABl3D5eF0cbirpUMq48SinvrKVkW6
 JnMnDXXgoaVGZlAa5RhHsTj7WmwTh218QrYNt33VgBeKTariTvrlfY3ImDRsyngPubvb
 PzPCdWjlfpn27auwaBelzORsbYvA9WKJ7/ktOaWtdp45RERsWhUo5fSaWEdwIsBGHAi7
 9anQ==
X-Gm-Message-State: AOAM530uK82vjhRa4OdmzY11oP9s4PAgqJsIE2/EuwwR5c2H+vOEFoVa
 8jMM+yMV7svmB2R7LdltZv9QVtHyL9LzJA==
X-Google-Smtp-Source: ABdhPJw0RrTLORTJPfvp+O+0sFRcg5OSgR/BCQ7u2LfBXQH+C9Im4wFEiIReX7F7PFPd471SjQLp2w==
X-Received: by 2002:a05:6000:18a8:: with SMTP id
 b8mr5088922wri.208.1623930844525; 
 Thu, 17 Jun 2021 04:54:04 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id a24sm4183461wmj.30.2021.06.17.04.54.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 04:54:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 06/15] hw/i2c/ppc4xx_i2c: Replace i2c_send_recv() by
 i2c_recv() & i2c_send()
Date: Thu, 17 Jun 2021 13:53:25 +0200
Message-Id: <20210617115334.2761573-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617115334.2761573-1-f4bug@amsat.org>
References: <20210617115334.2761573-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Corey Minyard <cminyard@mvista.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of using the confuse i2c_send_recv(), rewrite to directly
call i2c_recv() & i2c_send(), resulting in code easier to review.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Corey Minyard <cminyard@mvista.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/i2c/ppc4xx_i2c.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/hw/i2c/ppc4xx_i2c.c b/hw/i2c/ppc4xx_i2c.c
index f4c5bc12d36..75d50f15158 100644
--- a/hw/i2c/ppc4xx_i2c.c
+++ b/hw/i2c/ppc4xx_i2c.c
@@ -240,11 +240,14 @@ static void ppc4xx_i2c_writeb(void *opaque, hwaddr addr, uint64_t value,
                         i2c->sts &= ~IIC_STS_ERR;
                     }
                 }
-                if (!(i2c->sts & IIC_STS_ERR) &&
-                    i2c_send_recv(i2c->bus, &i2c->mdata[i], !recv)) {
-                    i2c->sts |= IIC_STS_ERR;
-                    i2c->extsts |= IIC_EXTSTS_XFRA;
-                    break;
+                if (!(i2c->sts & IIC_STS_ERR)) {
+                    if (recv) {
+                        i2c->mdata[i] = i2c_recv(i2c->bus);
+                    } else if (i2c_send(i2c->bus, i2c->mdata[i]) < 0) {
+                        i2c->sts |= IIC_STS_ERR;
+                        i2c->extsts |= IIC_EXTSTS_XFRA;
+                        break;
+                    }
                 }
                 if (value & IIC_CNTL_RPST || !(value & IIC_CNTL_CHT)) {
                     i2c_end_transfer(i2c->bus);
-- 
2.31.1


