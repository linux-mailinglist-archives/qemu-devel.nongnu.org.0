Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88276599EC0
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 17:44:58 +0200 (CEST)
Received: from localhost ([::1]:42270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oP4B7-0000Oa-Kt
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 11:44:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oP468-0005eo-Gw
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 11:39:48 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:46870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oP462-00064V-RT
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 11:39:48 -0400
Received: by mail-wr1-x42a.google.com with SMTP id e20so5124306wri.13
 for <qemu-devel@nongnu.org>; Fri, 19 Aug 2022 08:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=cl6TQtvSxV7arO6sC6GB32F3upDS/NEMszQzruWKRcc=;
 b=GzQ3s7s/pWvsd6xhdPcB3eBKkYXcfsqDGmDVT8dxc2wkiCmXvGWd7kvqe9NWkJXLPX
 NKnrPdGuCVzZiA5wN2cblqU4HT9GVNWZkSOuBpCgMJtajE3JXtFpedUiX3g2BEY1OFUM
 ErwfA29zDJNGM5QNSaHdqZI1nqY0QiL0WkkFAwle52+JMtbAMQ/Sl8TJb9ECvT9z0saB
 Y8nGNDAJZTBcYs3EN54mB7+P/SZNpIAkMF+awJyvh3+mw4++mtCwfvF4AC5bGhcf1obs
 O7ILTvvW2eo0e4IMpM2nRn4iFbXpOIvw22+d+vagUC53fQRxrc/1/NXaHMwE6Jb1t5kA
 e6Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=cl6TQtvSxV7arO6sC6GB32F3upDS/NEMszQzruWKRcc=;
 b=MxnufD8LvmBMsSDaPp5Lx9h8HZs4Q2s/Xk+7YYQqml/Cv5rVfDZEoRjjtOFAdHlajv
 yyqDV+Tzxzp874FgiH0k3jVRIMihvrI5L1fXYgUB5xeNsQ1+XlrYv8GGy1Btdj1F7/Df
 z6wXbx1roHvEgaB4zBeCdeAcl3GNe1L63pJ5iIDV4y53SZC37xpmsV4yxRD9FOkLQu2m
 icaIzYN1SbwQfOpEbeYjpecTKFZkfn8Kbs9F4Mioarapb5kk9E5EWh+6Cz9uYwoziTU5
 ov+YqkrCgnuanhcEIGbrCaUeiMuJSyc+ABKqfgkXWnG+9IKda5JOxvMUzofmMk5WtH17
 2EAg==
X-Gm-Message-State: ACgBeo1ir8E8KsMqz89a4YqseuuNHUetn+blW4r4FNcZkaJJqoR3yRxW
 Mftu08JwZ7OGZOD9LKTg9VNAtyH/W2NWdg==
X-Google-Smtp-Source: AA6agR7o9oiM5Ax5NWGoLwW4ocg8WHS1lP829SnIBrG4qeMikWn2BpkhDwixaCAOF1QR1luBKp7KVg==
X-Received: by 2002:a5d:6c6b:0:b0:225:dde:ab40 with SMTP id
 r11-20020a5d6c6b000000b002250ddeab40mr4611589wrz.690.1660923581387; 
 Fri, 19 Aug 2022 08:39:41 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi13-20020a05600c3d8d00b003a54109a6a0sm5558396wmb.3.2022.08.19.08.39.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 08:39:41 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-ppc@nongnu.org
Subject: [PATCH v2 05/11] hw/net/e1000e_core: Use definition to avoid dynamic
 stack allocation
Date: Fri, 19 Aug 2022 16:39:25 +0100
Message-Id: <20220819153931.3147384-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220819153931.3147384-1-peter.maydell@linaro.org>
References: <20220819153931.3147384-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

From: Philippe Mathieu-Daudé <philmd@redhat.com>

The compiler isn't clever enough to figure 'min_buf_size'
is a constant, so help it by using a definitions instead.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/net/e1000e_core.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index 208e3e0d798..82aa61fedcd 100644
--- a/hw/net/e1000e_core.c
+++ b/hw/net/e1000e_core.c
@@ -1622,15 +1622,16 @@ e1000e_rx_fix_l4_csum(E1000ECore *core, struct NetRxPkt *pkt)
     }
 }
 
+/* Min. octets in an ethernet frame sans FCS */
+#define MIN_BUF_SIZE 60
+
 ssize_t
 e1000e_receive_iov(E1000ECore *core, const struct iovec *iov, int iovcnt)
 {
     static const int maximum_ethernet_hdr_len = (14 + 4);
-    /* Min. octets in an ethernet frame sans FCS */
-    static const int min_buf_size = 60;
 
     uint32_t n = 0;
-    uint8_t min_buf[min_buf_size];
+    uint8_t min_buf[MIN_BUF_SIZE];
     struct iovec min_iov;
     uint8_t *filter_buf;
     size_t size, orig_size;
-- 
2.25.1


