Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 089D855F431
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 05:39:28 +0200 (CEST)
Received: from localhost ([::1]:38730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6OY2-0002J4-Mc
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 23:39:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterdelevoryas@gmail.com>)
 id 1o6OVN-0007Sp-GU; Tue, 28 Jun 2022 23:36:41 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:47006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peterdelevoryas@gmail.com>)
 id 1o6OVM-0006gx-0l; Tue, 28 Jun 2022 23:36:41 -0400
Received: by mail-pl1-x62d.google.com with SMTP id q18so12832528pld.13;
 Tue, 28 Jun 2022 20:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6h+oD3INdlvLAYbbdQxBhdr6X4GdD4XpIa63iOUDJvU=;
 b=JMWObqJ3SanHu9O97jKpug8ylHeS09eRuH8CXE3oitlbPLx503eYeGZqNm7e8ni/55
 LizpKVqDck7twv5b7asazwb4SFu1L/V5SQUyLB0qVONDzqXhaUl8cEyF3SRpOns0v69y
 unv10w7BqTWN9eH+P6RQqXRvktbtdzKrt3h7TPJj75X57HmiU283qBrAtT2nboisrbbA
 nRw5wQioTV6CrQInKyhHwfJRsIUdV+e4/bXSgAOm6MyfSocxoeHX9yGbIhcLXHwupXbm
 U45ixB20CXxfsIoIswV+s0TfcMODtdWKQCFJ4gr7J7sp7VGZc9z0hlB+bj5xS59ZCvfV
 1GSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6h+oD3INdlvLAYbbdQxBhdr6X4GdD4XpIa63iOUDJvU=;
 b=3sZDavkloYLSPNmFwwLpmVImtOgHWE5eTK64vLeUIbFqaEM1HwP/sGN+s8Bpc6KflA
 fnp0YQNN199HUFGoPGuYLZl1ijVnSCyHJVlKwbDT4dBxx6BmxOKQYjHQB88u9l6v6Lz+
 E4m4Y0rmdbhCaj0EyjK/XAzQPhzkAokIo0liZ1VYG14fXEj79PzZvTh61SEPZaDYbaCD
 75wHC9H14oAAGoe3H/iRgKepRyux6xiy3Z1ynMijmtJrzo6sIDM73d70x7ZkbvHSgWMX
 W1nP0vwb1vG1Jv6iWp3GMGEnK3MgyQR9Qdq6ulCXRzhgnNvtZ+1vv93o+rZVn+sw0A7O
 2cPw==
X-Gm-Message-State: AJIora8eomcXTImVmI1nPqUYzYzahBL+y0usW/YxkSLkVwhtPkzyMwkb
 iQlOokSyh+8JNd955PbwcKE=
X-Google-Smtp-Source: AGRyM1vPFGj04pv7plYfxSYK+w7o3J+9KFHbuyeG0RdNKYhilZUNdI35Ht73jOCImIi5yuGfE4cMlg==
X-Received: by 2002:a17:902:ce85:b0:16a:4637:c4da with SMTP id
 f5-20020a170902ce8500b0016a4637c4damr8475143plg.82.1656473798389; 
 Tue, 28 Jun 2022 20:36:38 -0700 (PDT)
Received: from localhost (fwdproxy-prn-002.fbsv.net.
 [2a03:2880:ff:2::face:b00c]) by smtp.gmail.com with ESMTPSA id
 j18-20020a63e752000000b0040aeb7e9358sm9880203pgk.90.2022.06.28.20.36.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 20:36:38 -0700 (PDT)
From: Peter Delevoryas <peterdelevoryas@gmail.com>
X-Google-Original-From: Peter Delevoryas <pdel@fb.com>
To: 
Cc: clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 cminyard@mvista.com, titusr@google.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, zhdaniel@fb.com, pdel@fb.com
Subject: [PATCH v2 03/13] hw/i2c/aspeed: Fix MASTER_EN missing error message
Date: Tue, 28 Jun 2022 20:36:24 -0700
Message-Id: <20220629033634.3850922-4-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220629033634.3850922-1-pdel@fb.com>
References: <20220629033634.3850922-1-pdel@fb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=peterdelevoryas@gmail.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

aspeed_i2c_bus_is_master is checking if master mode is enabled in the I2C
bus controller's function-control register, not that slave mode is enabled
or something.  The error here is that the guest is trying to trigger an I2C
master mode command while master mode is not enabled.

Fixes: ba2cccd64e90f342 ("aspeed: i2c: Add new mode support")
Signed-off-by: Peter Delevoryas <pdel@fb.com>
---
 hw/i2c/aspeed_i2c.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index cbaa7c96fc..c153a1a942 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -601,7 +601,7 @@ static void aspeed_i2c_bus_new_write(AspeedI2CBus *bus, hwaddr offset,
         }
 
         if (!aspeed_i2c_bus_is_master(bus)) {
-            qemu_log_mask(LOG_UNIMP, "%s: slave mode not implemented\n",
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: Master mode is not enabled\n",
                           __func__);
             break;
         }
@@ -744,7 +744,7 @@ static void aspeed_i2c_bus_old_write(AspeedI2CBus *bus, hwaddr offset,
         }
 
         if (!aspeed_i2c_bus_is_master(bus)) {
-            qemu_log_mask(LOG_UNIMP, "%s: slave mode not implemented\n",
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: Master mode is not enabled\n",
                           __func__);
             break;
         }
-- 
2.30.2


