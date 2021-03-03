Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A7F32B629
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 10:27:36 +0100 (CET)
Received: from localhost ([::1]:53112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHNn5-0003L5-1O
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 04:27:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lHNi3-0005Dd-Se
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 04:22:23 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:43053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lHNi2-0001Ha-AH
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 04:22:23 -0500
Received: by mail-ej1-x635.google.com with SMTP id p8so14456283ejb.10
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 01:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=IE0qfuFnzVIK6DZCDqQ7WbPvxJH1wtTUaIMLDrAARCM=;
 b=siHaRYiiplNh3AUV31jT3ytO2Qo+bokilsI6NL8oadSYEfYpP57/23bpAiMmWzPYuz
 c9BgNGmKML9xslxcQZRRvEhrQFypj/9y05VcPfp4rBDoSbFUNPVOEusngWZQLdoZisuZ
 pnCVC/FbfDWy3k585FqbcUgSBi6J9XWUrCXiPOF1h57bRsj1LeWSODxZ3NDQ35D4M17w
 9E6swDMpFHiwAj7y32+lQi3a/XMBiXfhay6esI0BTOltVcijUKyilNzPepygt6cxeI4x
 QYPfXcKUqSFDHDtVYklUnQbSEJ7j3pd/wpIhkcEPr8OAQU4D0c4oKqcVwSYoZtoMob/u
 cB7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=IE0qfuFnzVIK6DZCDqQ7WbPvxJH1wtTUaIMLDrAARCM=;
 b=qQu2L3KufUeeb+jdVWtkPSKy95c1sOqLnCJt4YeHbaKwUDffsw8lWUWs9YNwdxI8MJ
 xfBPGG8cvo9eWQ4wbxEE6WewpsGkALYSAt5qXt/87hAHlyfrrb7bcfCnhWV+Zpt5VrJC
 FWBTvltudhiK4LFQrlWbtr9T4d05fPzDZThgbCjtoOj5gtMOiDdYsIH1Uxz891+BC4RK
 cxTQ2pveCTUb271zw+T990/WVWgSHNWvkrlknQw7c36ujzrGL8yXdqN7cXjMgM0hyQ4e
 yRzbaKhzUzuInruZf2DAHcRAQxRotAfX8zXN0gAs72zMqGf5GTLm+H20AKBta5OGSAB6
 dRIw==
X-Gm-Message-State: AOAM530adn1Au1DxaS/DA9E0QzFSvYZ/x2GCQR3T0ZIoBWlW2ouDI2K0
 gtR100pYPYG2CY+GxhqCyYg=
X-Google-Smtp-Source: ABdhPJyNIgVG/q3xAbHFI93W5Kl+A1oV42x5zb0VowUnW74tLupRDQMo9z7XgcOIABz74JGVPwNbsg==
X-Received: by 2002:a17:906:a0d3:: with SMTP id
 bh19mr25402126ejb.199.1614763341113; 
 Wed, 03 Mar 2021 01:22:21 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id i6sm16614865ejz.95.2021.03.03.01.22.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Mar 2021 01:22:20 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: [RFC PATCH v2 6/9] hw/net: pcnet: Remove the logic of padding short
 frames in the receive path
Date: Wed,  3 Mar 2021 17:21:43 +0800
Message-Id: <1614763306-18026-7-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614763306-18026-1-git-send-email-bmeng.cn@gmail.com>
References: <1614763306-18026-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Now that we have implemented unified short frames padding in the
QEMU networking codes, remove the same logic in the NIC codes.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

(no changes since v1)

 hw/net/pcnet.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/hw/net/pcnet.c b/hw/net/pcnet.c
index f3f18d8..1633033 100644
--- a/hw/net/pcnet.c
+++ b/hw/net/pcnet.c
@@ -987,7 +987,6 @@ ssize_t pcnet_receive(NetClientState *nc, const uint8_t *buf, size_t size_)
 {
     PCNetState *s = qemu_get_nic_opaque(nc);
     int is_padr = 0, is_bcast = 0, is_ladr = 0;
-    uint8_t buf1[60];
     int remaining;
     int crc_err = 0;
     size_t size = size_;
@@ -1000,14 +999,6 @@ ssize_t pcnet_receive(NetClientState *nc, const uint8_t *buf, size_t size_)
     printf("pcnet_receive size=%zu\n", size);
 #endif
 
-    /* if too small buffer, then expand it */
-    if (size < MIN_BUF_SIZE) {
-        memcpy(buf1, buf, size);
-        memset(buf1 + size, 0, MIN_BUF_SIZE - size);
-        buf = buf1;
-        size = MIN_BUF_SIZE;
-    }
-
     if (CSR_PROM(s)
         || (is_padr=padr_match(s, buf, size))
         || (is_bcast=padr_bcast(s, buf, size))
-- 
2.7.4


