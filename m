Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E58768AF45
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 11:09:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pObuC-0001b4-0q; Sun, 05 Feb 2023 05:05:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pObts-00017q-RU; Sun, 05 Feb 2023 05:05:36 -0500
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pObtr-0005TT-Af; Sun, 05 Feb 2023 05:05:32 -0500
Received: by mail-oi1-x22f.google.com with SMTP id c15so7454117oic.8;
 Sun, 05 Feb 2023 02:05:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M2kPo468f1r7zwyieHHLTlxuPu7VFL933QsJp5BPQVc=;
 b=Kt9srllQ6qSUe1eD0FEyn9Fx3wpJcWHMKiViW4KUXOF9XVuSjo/mN/JPcANur50jFk
 KIQxgs3YXiNDkadMWJo2ffhe0KQ/AfReoZUKH8xV02XS9EXqH1zoVBlL3CeCTbNS5YH4
 CZIzXiGCW+84oYvCL9hOIvz+EhLzzzf8iuH7NKkjQvCquVgMBY4Gw1lf5p+293h/wY2b
 UVSJRyfZXmOKjL7JTBfBnezJcWft5ISyX+WlOfXEDmpss8pWJmCjSsYqWFvMXfjDaTur
 NYawR/ZaX3BrL0D/7IT729JarFtIP0u3LzmRA9dSBLJk1Zww3huiiHPR5O0R6LyOiMXE
 hqUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M2kPo468f1r7zwyieHHLTlxuPu7VFL933QsJp5BPQVc=;
 b=HzEVPP1PeZa4blURArc7ZBGR+7hzmObjzlncv8djzltDxbf3mn9ctyiYiBEpqNuRhN
 Ro5mQZtH6Ry3ktMUiAy+A1zOhMOssJLklTCfAjXH1KL4dd2yh0B53k1Tbq70p9BDOOIn
 n6M6wQw+cRhcBty+vG4juBTo3J4bjC6ls2oa6qlzu0LyW9bOhgTtRMBDoV6VhlivJU6I
 GsvS3FYeKJ+xUkEl367kk/mkfrrJO5J8D+DPzqgdnFzVxuNSdTu8Y0HYR3qABLxGblwo
 icLn52nl0Wl2KWrzHV7Np9VlwRpLBKPncjSqc8t4PJwSqGs8V6WJHjdHGnnNRFE5mUHp
 SSOQ==
X-Gm-Message-State: AO0yUKUJZ8e90V9LDS2IzZ/2QgIB+nnQIOIj/E/juaQRAWhhEJFzGps3
 tjuWrVOKDv4RlnjGWE5SB2IYUoXM5l4=
X-Google-Smtp-Source: AK7set/Rx54N8JidPlmD7AvbRIwkJvfHa2C6RNNfPZVTc1LAabJOKLLzkhe+a6tEY8fvl6yrBWpV1Q==
X-Received: by 2002:a05:6808:1b24:b0:35e:92bc:9f72 with SMTP id
 bx36-20020a0568081b2400b0035e92bc9f72mr9266141oib.30.1675591528908; 
 Sun, 05 Feb 2023 02:05:28 -0800 (PST)
Received: from grind.. ([191.19.125.138]) by smtp.gmail.com with ESMTPSA id
 s191-20020acaa9c8000000b003631fe1810dsm2730924oie.47.2023.02.05.02.05.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Feb 2023 02:05:28 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 16/16] hw/display/sm501: Code style fix
Date: Sun,  5 Feb 2023 07:04:49 -0300
Message-Id: <20230205100449.2352781-17-danielhb413@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230205100449.2352781-1-danielhb413@gmail.com>
References: <20230205100449.2352781-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

From: BALATON Zoltan <balaton@eik.bme.hu>

Fix checkpatch warning about multi-line comment.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <8801292992a304609e1eac680fe36b515592b926.1674333199.git.balaton@eik.bme.hu>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/display/sm501.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index 1e17072452..e1d0591d36 100644
--- a/hw/display/sm501.c
+++ b/hw/display/sm501.c
@@ -1768,7 +1768,8 @@ static const GraphicHwOps sm501_ops = {
 static void sm501_reset(SM501State *s)
 {
     s->system_control = 0x00100000; /* 2D engine FIFO empty */
-    /* Bits 17 (SH), 7 (CDR), 6:5 (Test), 2:0 (Bus) are all supposed
+    /*
+     * Bits 17 (SH), 7 (CDR), 6:5 (Test), 2:0 (Bus) are all supposed
      * to be determined at reset by GPIO lines which set config bits.
      * We hardwire them:
      *  SH = 0 : Hitachi Ready Polarity == Active Low
-- 
2.39.1


