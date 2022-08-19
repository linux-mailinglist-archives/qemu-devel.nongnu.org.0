Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EAD7599EA3
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 17:44:06 +0200 (CEST)
Received: from localhost ([::1]:40696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oP4AH-00062k-9I
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 11:44:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oP46C-0005lO-BM
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 11:39:53 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:39652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oP468-00065d-Fz
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 11:39:52 -0400
Received: by mail-wr1-x431.google.com with SMTP id r16so5619983wrm.6
 for <qemu-devel@nongnu.org>; Fri, 19 Aug 2022 08:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=wicKql4I/h9UnyT0qeiWtm97WB3+4GVyQ+X7NhjeYE4=;
 b=A3+tajuM/D+cBNz8wVn21umtZzep7yXocwXNlSjy9AmPvLeySUgvajsTefklCwaTPz
 A6S44opQ3e52W6gZaxmbVXXsVWsqyKcBRJZQqqSCbqw7EM1/1lnP1osx/9WeB9sAjeIG
 RX3Yluv1rRbWzX9Sn+kXVRiNwgwzaJ9kiiB9DxBgXo10xlV8TgEsYfLaPzPrnv6eccL/
 lc7ovIH0eFtKCiIpbdAldAL9x6P6t+FB3O61h2OklmwHOO8kiPbhXtlN90u5TLASMwMh
 JaZG3cDHiW3MIHz0aAaKkpSHHqOma4HmFtSOxodLWFJHf4qt0l6mVo1Gi183PxgqZDeZ
 BbFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=wicKql4I/h9UnyT0qeiWtm97WB3+4GVyQ+X7NhjeYE4=;
 b=fFB2vRz7L+oJ68mW7QbqiWwH6oi5zdySSO5YpP+iyqZlNpSjz6wU6XCxHvqSpTxufc
 Wkcm8f/GPiO7KJ1OL8JISTW4tZbewksJLHFu8eE3xP4jvCDb7AC+HNpB+DGJ3nXMOb5I
 At8uM1whNb52hEwutsnUD9VAdrBN0BYanFhk2OFQUYg50Xp4ArPv7UFljoLy2m9txgZY
 cD6VSMTPON5U2IHOHSRy5PVhAjLu1sWLFTaiZcTeyFXohTsxDMx5QAJTiAs1fL/du8J+
 CTNqqcDRROK6rC/9QwT8tZinUvpk8g4bNiePW/S61ir0slnT17Z53PGFbNFffwLM/KTC
 cQow==
X-Gm-Message-State: ACgBeo1GBegnedj0YpyzLdhVVRLb6TC3aseAz+L3XRLmIez5LyLjxqe/
 /FieC3g284WIRIxEc+dX4SNOt/m2FUgivQ==
X-Google-Smtp-Source: AA6agR6dBct5DooPmF2wUlVZLk86l55DJfWxYUIfhvTjY5iU06dk3F2seoBbT8W1dOrB8u2hANiuqg==
X-Received: by 2002:a5d:48c5:0:b0:225:2f99:430d with SMTP id
 p5-20020a5d48c5000000b002252f99430dmr4769879wrs.358.1660923586670; 
 Fri, 19 Aug 2022 08:39:46 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi13-20020a05600c3d8d00b003a54109a6a0sm5558396wmb.3.2022.08.19.08.39.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 08:39:46 -0700 (PDT)
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
Subject: [PATCH v2 09/11] hw/usb/hcd-ohci: Use definition to avoid dynamic
 stack allocation
Date: Fri, 19 Aug 2022 16:39:29 +0100
Message-Id: <20220819153931.3147384-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220819153931.3147384-1-peter.maydell@linaro.org>
References: <20220819153931.3147384-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

The compiler isn't clever enough to figure 'width' is a constant,
so help it by using a definitions instead.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/usb/hcd-ohci.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
index 895b29fb865..5585fd32ccf 100644
--- a/hw/usb/hcd-ohci.c
+++ b/hw/usb/hcd-ohci.c
@@ -805,13 +805,14 @@ static int ohci_service_iso_td(OHCIState *ohci, struct ohci_ed *ed)
     return 1;
 }
 
+#define HEX_CHAR_PER_LINE 16
+
 static void ohci_td_pkt(const char *msg, const uint8_t *buf, size_t len)
 {
     bool print16;
     bool printall;
-    const int width = 16;
     int i;
-    char tmp[3 * width + 1];
+    char tmp[3 * HEX_CHAR_PER_LINE + 1];
     char *p = tmp;
 
     print16 = !!trace_event_get_state_backends(TRACE_USB_OHCI_TD_PKT_SHORT);
@@ -822,7 +823,7 @@ static void ohci_td_pkt(const char *msg, const uint8_t *buf, size_t len)
     }
 
     for (i = 0; ; i++) {
-        if (i && (!(i % width) || (i == len))) {
+        if (i && (!(i % HEX_CHAR_PER_LINE) || (i == len))) {
             if (!printall) {
                 trace_usb_ohci_td_pkt_short(msg, tmp);
                 break;
-- 
2.25.1


