Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6DEE6A44A1
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:37:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWeCW-000633-5O; Mon, 27 Feb 2023 09:10:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeCP-0005bS-Mi
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:09:53 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeCN-0000ev-Te
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:09:53 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 fm20-20020a05600c0c1400b003ead37e6588so7239852wmb.5
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:09:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=0m6KPJ37JOrM04k9+URwQ6acVFhlO5OtjPrDp8PrsTQ=;
 b=ffqzD0IuDhir/Ptkh+lY/0mfruMibA3NpoQeNFVXE/odGxef4UcHvQN1xnl+dN+4ut
 Hye+4KhCsgQvCxpHr32NyP4IgNa5HyHIgQ5ljlxFecXhmGFsGzMusH3vlDWnGvBg3NV4
 vFug2aPzQCFzoKaRa8ecfCOvmACuv6LukcaXFtx2n3ui+386vU3xIJvTEowrTzgiXIqz
 Dr8xy/QF4TlLVCcjwAHDSv3O7QIkoXXFBExnSsNB9+sNWsURiAl3a06FwwnQpibButDj
 ZxzA+YvqR3lZ+d0dI+3fZThE7THcP5r/HmAPFJi/3gYfBB0SFb/vdRGO3VNr5mhBVvN9
 ireA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0m6KPJ37JOrM04k9+URwQ6acVFhlO5OtjPrDp8PrsTQ=;
 b=NLcj9SeNXf0HJI4P0s+/sX7xisNC6mOf73Sm2+3QHDJN23ZflX23JaRMIG2+eGyXsW
 rMkJBXnNOHLghdGFWvCgif4KOjMdUUKjwFKhYBT96jLu99jilivBcjvUcacH8stRxPRB
 FPnSSXku5ZaBNILadfiHon56FiAKak4RAjUqnDAkeQ7NmFVT/ArnxZiYsKCy8UyfqZ+6
 oQ41GyifThaZ9i4brpyqnNe75qANiC4HOLwuq7w2X1L4l3QEhi2weGz1LZoEVqlS43eN
 l+bfY9LM5nVwCGQFIGwq7SxJKJdqGK0/uhxFmZO/nUt7kFFLQ//5bO74vbe4ouohaAef
 ByeQ==
X-Gm-Message-State: AO0yUKWdI5qDrPQChpunAFmn2MtjEPQjG0S4orYVut8erRacL0yuzG+/
 bRMW0KWr0dHM6eb5t/7+lUEr7T3dudkjP+ln
X-Google-Smtp-Source: AK7set+oa5X5jsRTFwfSbUHmCKFs1QT18eqr2lNprTGjHMNY3taQUYBi/at1uihC3FPzYPmfSzKbSg==
X-Received: by 2002:a05:600c:1708:b0:3eb:376e:2b9c with SMTP id
 c8-20020a05600c170800b003eb376e2b9cmr5488342wmn.36.1677506990103; 
 Mon, 27 Feb 2023 06:09:50 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 e17-20020a05600c219100b003e7f1086660sm12863668wme.15.2023.02.27.06.09.49
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:09:49 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 093/126] hw/ppc/sam460ex: Correctly set MAL properties
Date: Mon, 27 Feb 2023 15:01:40 +0100
Message-Id: <20230227140213.35084-84-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

MAL properties are declared as uint8_t:

  static Property ppc4xx_mal_properties[] = {
      DEFINE_PROP_UINT8("txc-num", Ppc4xxMalState, txcnum, 0),
      DEFINE_PROP_UINT8("rxc-num", Ppc4xxMalState, rxcnum, 0),
      DEFINE_PROP_END_OF_LIST(),
  };

Correct the API use by setting the property using
qdev_prop_set_uint8(). No behavioral change.

Fixes: da116a8aab ("ppc/ppc405: QOM'ify MAL")
Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230203145536.17585-7-philmd@linaro.org>
---
 hw/ppc/sam460ex.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
index 4a22ce3761..cf065aae0e 100644
--- a/hw/ppc/sam460ex.c
+++ b/hw/ppc/sam460ex.c
@@ -389,8 +389,8 @@ static void sam460ex_init(MachineState *machine)
 
     /* MAL */
     dev = qdev_new(TYPE_PPC4xx_MAL);
-    qdev_prop_set_uint32(dev, "txc-num", 4);
-    qdev_prop_set_uint32(dev, "rxc-num", 16);
+    qdev_prop_set_uint8(dev, "txc-num", 4);
+    qdev_prop_set_uint8(dev, "rxc-num", 16);
     ppc4xx_dcr_realize(PPC4xx_DCR_DEVICE(dev), cpu, &error_fatal);
     object_unref(OBJECT(dev));
     sbdev = SYS_BUS_DEVICE(dev);
-- 
2.38.1


