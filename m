Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6F0454198
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 08:06:49 +0100 (CET)
Received: from localhost ([::1]:32836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnF1s-0004Lw-Eb
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 02:06:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1mnEtc-0004xy-T6; Wed, 17 Nov 2021 01:58:16 -0500
Received: from [2607:f8b0:4864:20::52a] (port=36404
 helo=mail-pg1-x52a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1mnEtb-0005bV-2U; Wed, 17 Nov 2021 01:58:16 -0500
Received: by mail-pg1-x52a.google.com with SMTP id g28so1429970pgg.3;
 Tue, 16 Nov 2021 22:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Bbabirie2Kfapu1I8GL4Ixr3K2Z2oG6ScmZwYuwJk9g=;
 b=SHxVrNbTiQZfye0IKJxupED70648O6vwMI2Td7nl0s39lyJOLyzQM0kooL0nPCbrhz
 r7I7B9SR1GeThdwwVAW8nid8kBWa1m8kGTKCSIoXGTxruAhyGV25hZ62xzCvG7IZDLE4
 gxgeyZHKJXMwdKW8Zas0N7o6PtI5G7HJS1b1NUlNNRmmrU6t8EFpgk2t8nzkOW6xSEWf
 71GTTP/VTP1CAe53zXcbrBfPKeWG1RsSdNVIUtRSBSzMMOQ2zrIXghzqVevtgIMIsF7U
 zOJbbm7ogBfuz5aYpAgWJMGTNooSgqr2qMeAZZOAYxfs3wa2mChK0sXHoJGq2SNPnyeT
 A39g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Bbabirie2Kfapu1I8GL4Ixr3K2Z2oG6ScmZwYuwJk9g=;
 b=fa9X/mAogiV76ot4jgv7+GffmNtHUf48k7dLxcd1M927Iv93Ti4qbmkUoM/etv628T
 JFsh+sdk5zAm3IwqD7gTdaB+/VTwgCfSidODKEA878IIPi+Zh8Ed5s2NKU5thv4pusGZ
 pOvdXAx17n80UyOFTLuPZT9tdTYA0wCF25nhJKVu70LF/lIHFEIvckkVWT+QAXh8BS7J
 PQOXvW2/Xdyg+Z06cjQa+UyDXMir4Ricw0CTtcMTPabD5DEl2ZvNsjF6fH43DvRKnkD3
 GOIDpOIrM4yFK+U35XhcA2OHy9JrXdx8U3GAV2f9cMYCTRr6gpM4mo6EoUxUOlFcna5w
 FmWw==
X-Gm-Message-State: AOAM530Ul0BwU+pVb5UAI7OMnjByr4h3e32PNuQvVDfpcejx3uR2nv/d
 mZjqIGneKad/+VPW9E6GsN4=
X-Google-Smtp-Source: ABdhPJy+JDnxuQY5o0W1Pxa8fWs5oxLaxAkHfqyPcwXv+QVy/8rcLOEc10h8IoL7VrFFchqQI4B1ww==
X-Received: by 2002:a63:5813:: with SMTP id m19mr3609564pgb.441.1637132293328; 
 Tue, 16 Nov 2021 22:58:13 -0800 (PST)
Received: from voyager.guest.fluxperth.local
 (210-10-213-150.per.static-ipl.aapt.com.au. [210.10.213.150])
 by smtp.gmail.com with ESMTPSA id d13sm21914618pfu.196.2021.11.16.22.58.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 22:58:12 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 4/4] docs: aspeed: ADC is now modelled
Date: Wed, 17 Nov 2021 14:57:52 +0800
Message-Id: <20211117065752.330632-5-joel@jms.id.au>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211117065752.330632-1-joel@jms.id.au>
References: <20211117065752.330632-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=joel.stan@gmail.com; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move it to the supported list.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v2: New patch
---
 docs/system/arm/aspeed.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
index 6aafd611e9a5..d8b102fa0ad0 100644
--- a/docs/system/arm/aspeed.rst
+++ b/docs/system/arm/aspeed.rst
@@ -56,13 +56,13 @@ Supported devices
  * Front LEDs (PCA9552 on I2C bus)
  * LPC Peripheral Controller (a subset of subdevices are supported)
  * Hash/Crypto Engine (HACE) - Hash support only. TODO: HMAC and RSA
+ * ADC
 
 
 Missing devices
 ---------------
 
  * Coprocessor support
- * ADC (out of tree implementation)
  * PWM and Fan Controller
  * Slave GPIO Controller
  * Super I/O Controller
-- 
2.33.0


