Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B549C2F392B
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 19:49:30 +0100 (CET)
Received: from localhost ([::1]:51038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzOjR-00052z-En
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 13:49:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzOWu-0001qp-4u; Tue, 12 Jan 2021 13:36:32 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:43323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzOWr-0007WO-St; Tue, 12 Jan 2021 13:36:31 -0500
Received: by mail-ej1-x62d.google.com with SMTP id jx16so4892396ejb.10;
 Tue, 12 Jan 2021 10:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3oL8bC8x9VFwiA/xc6ZokDU2TIJ+D0ZdajpMhJAtRjE=;
 b=pzLiDzMgO2qqe2xY1cGknoalgMmhRxSV1G3RrQhEbCujzyXMOPbxqRLBBZh8ioK+QC
 JSOBJWrEv+/WfBDGtrj1o1uuMDav0IQXvK7K21u4+v2oY0ZivsHgnRik7wkYZsWRzazS
 AdWAY7UqPK2MnePUxrTKaZUP99Fhc1XAvhzraM52iOTf85rv9T2a0WlKugOgfoK2AGnO
 MEt/uV9mlP0iyoS0pLf/uf5qVldhU+eNCHg4khq7OuA6dddSVlDGrbm/pHqL3od20eY1
 Dt4hKixGQrE9LYy/JTomthxBKyfCQ00mwDxYDtpU8NbRXfrNWuGkTYg4QfZriqo8VWXJ
 J6Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=3oL8bC8x9VFwiA/xc6ZokDU2TIJ+D0ZdajpMhJAtRjE=;
 b=JZAfOJzuhlMUAum/xVpZdUm/DEVXhvOh4hiplz6ykEa5co69bgD3Q/y50UJubHqJM0
 V1c7kntjtyTsBUr+v4XMBrWOnPNV6QeI2hOg5ZjRo3SMZtkwAZj/d0GbyJGBlE36XgU5
 TAdgxQy5ra0s5y8ssQgor2QByO0jf8i57WYFVBi44eHDERMNC5zH0nEWmg51ke5U6nyg
 r+Tt3em1Zwt7JXw9gqH5CyzED1r9nMvEVk6wG3QXERso+2STd4woQV77NGzm2V1zjkhT
 9lf52ZjfsreRMyz8g0B22n0M2RCiUthyLpu1N8Yjdi5G4ddONogo8G+f7bj3+/l/Hz9H
 uXLw==
X-Gm-Message-State: AOAM5317kOdhdIAofY1itsGUq/qBxXmO4Ia5KVB+Xx72enAcSfaD6yJS
 8mpMlTsWVQyb/8NDcDRwehw=
X-Google-Smtp-Source: ABdhPJzNVjPNHTWfdTDu4WsmxLITpifXl/wpM6+l3N1UEWB9deJNBPNSw+YabAM7dHGcuTVg3j30VQ==
X-Received: by 2002:a17:906:90d6:: with SMTP id
 v22mr139279ejw.88.1610476588169; 
 Tue, 12 Jan 2021 10:36:28 -0800 (PST)
Received: from x1w.redhat.com (190.red-83-57-173.dynamicip.rima-tde.net.
 [83.57.173.190])
 by smtp.gmail.com with ESMTPSA id k15sm1503481ejc.79.2021.01.12.10.36.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 10:36:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [RFC PATCH v6 08/11] hw/ssi: imx_spi: Disable chip selects when
 controller is disabled
Date: Tue, 12 Jan 2021 19:35:26 +0100
Message-Id: <20210112183529.2011863-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210112183529.2011863-1-f4bug@amsat.org>
References: <20210112183529.2011863-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62d.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xuzhou Cheng <xuzhou.cheng@windriver.com>

When a write to ECSPI_CONREG register to disable the SPI controller,
imx_spi_reset() is called to reset the controller, but chip select
lines should have been disabled, otherwise the state machine of any
devices (e.g.: SPI flashes) connected to the SPI master is stuck to
its last state and responds incorrectly to any follow-up commands.

Fixes: c906a3a01582 ("i.MX: Add the Freescale SPI Controller")
Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210112145526.31095-4-bmeng.cn@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/ssi/imx_spi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index 801daa5cbfa..2f9e800dd3a 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -255,6 +255,10 @@ static void imx_spi_reset(DeviceState *dev)
 
     imx_spi_update_irq(s);
 
+    for (i = 0; i < ECSPI_NUM_CS; i++) {
+        qemu_set_irq(s->cs_lines[i], 1);
+    }
+
     s->burst_length = 0;
 }
 
-- 
2.26.2


