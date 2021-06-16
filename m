Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A493AA125
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 18:22:06 +0200 (CEST)
Received: from localhost ([::1]:38814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltYIn-0005EH-0H
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 12:22:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltYBp-0002fZ-7J; Wed, 16 Jun 2021 12:14:53 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:35437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltYBn-0005xR-OW; Wed, 16 Jun 2021 12:14:52 -0400
Received: by mail-wr1-x431.google.com with SMTP id m18so3341360wrv.2;
 Wed, 16 Jun 2021 09:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5aEVDqUseYYwXDUj9I4DDboAqkXF8aATk7ZG+d3YXVg=;
 b=XsqtSV8oaLOyjIC8TMHCtq4LHDQUpXFOl34+XwRMsfSAeIpR7EZjhuGjhA9ID9XWOf
 dRmC7Czh/ccm8obaYww7ul0vTXO1VhD6fZ+UDRZu638VNSyObx7335AQNKoFwUuzLYhu
 I+mIMeGh1HYTHIQjCUG9+WDa4KdRE5swTXBJhXTp/H742xSO2fX6tIneQ2CJYh/y65th
 A+QExky5feg8lgWDGLknuXWkNZoYFRJ0ieDh07noiDn41+cVQXxSvOOJ//qY01jvEsSu
 sFe3gU95tUKSVwFXUgQZLvpXfoHttwGc4owC+YKfNSR569FgqgDLEF8A7t5GRgpdEHcw
 gZNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=5aEVDqUseYYwXDUj9I4DDboAqkXF8aATk7ZG+d3YXVg=;
 b=JBzoy+pB+duvJ4chjiSq+ugG4eGOQYBiRStEvPJxa5Hqe+gr/1DvWdwsQ6eL/Som3g
 W+uU+jrXwYr/k5n3ECsP/l9pxNWkXhONh3ZzCG1JMxpR2S8izw9KynSY0oor49N3qxqn
 1hdFkh4jvQOj7/iGA+IkzDH82uihj7qmAFmHfrVB3m4X4JlKttjoRzaNLoNGezBNsQqz
 qQJVlcWYh8NqKdkuN8B/VKhWZxPM5NVINj243bQ6ViJPdiSv0kZQAyxIJcUdrTgB4wBZ
 Is69I6zAnDX5T0/z6kRP9P0V1kjm7j9bMcE5w4neRzdFJyje3M6letzWR5xbBPBEY6RO
 wRRw==
X-Gm-Message-State: AOAM5304E6sfEJodWkLfLv3d2LhZo8XPoWxEjxde+az4issVSh87Ryc1
 Y2Th7xr+FE+vT32okTBK19qPcny6mLBB+Q==
X-Google-Smtp-Source: ABdhPJyp1RkSmkBwi9661Rqx6Wxxrg1MgMzwGc8R+iQZl/yb+VD6xhkvLqNvF4lWRON6k75i9FOrMw==
X-Received: by 2002:a05:6000:154c:: with SMTP id
 12mr250756wry.126.1623860089435; 
 Wed, 16 Jun 2021 09:14:49 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id m6sm3175364wrw.9.2021.06.16.09.14.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 09:14:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 06/13] hw/i2c/ppc4xx_i2c: Replace i2c_send_recv() by
 i2c_recv() & i2c_send()
Date: Wed, 16 Jun 2021 18:14:11 +0200
Message-Id: <20210616161418.2514095-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210616161418.2514095-1-f4bug@amsat.org>
References: <20210616161418.2514095-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Signed-off-by : Frederic Konrad" <frederic.konrad@adacore.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of using the confuse i2c_send_recv(), rewrite to directly
call i2c_recv() & i2c_send(), resulting in code easire to review.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/i2c/ppc4xx_i2c.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/hw/i2c/ppc4xx_i2c.c b/hw/i2c/ppc4xx_i2c.c
index f4c5bc12d36..b3d3da56e38 100644
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
+                    } else if (i2c_send(i2c->bus, i2c->mdata[i])) {
+                        i2c->sts |= IIC_STS_ERR;
+                        i2c->extsts |= IIC_EXTSTS_XFRA;
+                        break;
+                    }
                 }
                 if (value & IIC_CNTL_RPST || !(value & IIC_CNTL_CHT)) {
                     i2c_end_transfer(i2c->bus);
-- 
2.31.1


