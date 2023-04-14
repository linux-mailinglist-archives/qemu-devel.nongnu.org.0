Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24AFE6E2267
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 13:39:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnHlo-0001E0-1c; Fri, 14 Apr 2023 07:39:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pnHll-0001Ay-IN
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 07:39:09 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pnHlk-0001Qi-1T
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 07:39:09 -0400
Received: by mail-pl1-x636.google.com with SMTP id w11so18014918plp.13
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 04:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1681472346; x=1684064346;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1dx7tsylwn1L5BY0wLuQa9BFnmXyEFghTFHqC+KsGRc=;
 b=w95mJslSn9ySa0NJPMWhWS1vboaWGNXDxi3xmGefhV/Cz2DO0oAsv9DG7l5M3PzUEm
 CS+QT1TVxleEpbnbUcSaYjV2fwYw5BvfoMMUGPpvlPaDQVlQ/Pz86x+7dI06lBPyESUH
 OrDY4k8Xwyr2DJJ25DHLiHzQ/EhfKdzgfFNwRktDmJt5ucoLv2Yt3wP1kMpQc4sy3RBV
 vvMH3WRUGG2xuDPmpZqXnRlPvPR4BgQ3Hvj57/PnsahwGgqj4GTA14ceuJm7xYsaNImE
 i5XoEkC+MR+tydS7iuwofO1dwr1ghIDlk5c6k66SV7o7ljxjya3KNWvJafwGu97Jvg5y
 UPiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681472346; x=1684064346;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1dx7tsylwn1L5BY0wLuQa9BFnmXyEFghTFHqC+KsGRc=;
 b=lccu5Fxpl6f4gn/xIl48uxJcSTsYDVLzUybOHMLP3uN9mvSLAEKW5UQgOSzF5Dx9O8
 a0YsvjX+grAPtlBiKDE8ZMFtBWhHfW/y71o+gYyrDAF5WIjWTd+vOTGAoBDigZmjbwpc
 4lpF/Gtj8d+GygLnoEzJ451MjtLXfqAQdYQNXDvFpOy9/v2R+a8mMVAdC66gV23GLUgq
 gyRGenOhauhgGumKiUFDaV7FmfbhkU1uSfxHBEcvkRtbaJMnoDc2eFk0zpAIX03d8pzN
 svnDam6buvJGIyOWA2hyU+9Ydz4RASh81pv4WlHKDra8tFJu4ku4So4EJIcC95v2dCx+
 toag==
X-Gm-Message-State: AAQBX9fxmABtDbZ5l7mMYhNN9T/OcUEbPWB3DT9rKC8JGnLdc5wu3aEU
 Bm1NJHZU/zN50niCKLMS6pUw9Q==
X-Google-Smtp-Source: AKy350Y3oIlzcRArpDDU4Rb4XpCHBIOzvniEZOXcr9nGFhAaXtf00lOma9gM6FGs2/aeB8GGAUGYHg==
X-Received: by 2002:a17:90a:17c3:b0:237:ae7c:15be with SMTP id
 q61-20020a17090a17c300b00237ae7c15bemr4843310pja.30.1681472346591; 
 Fri, 14 Apr 2023 04:39:06 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 u19-20020a170902a61300b001a20b31a23fsm2889249plq.293.2023.04.14.04.39.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Apr 2023 04:39:06 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH 15/40] e1000x: Take CRC into consideration for size check
Date: Fri, 14 Apr 2023 20:37:12 +0900
Message-Id: <20230414113737.62803-16-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230414113737.62803-1-akihiko.odaki@daynix.com>
References: <20230414113737.62803-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::636;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Section 13.7.15 Receive Length Error Count says:
>  Packets over 1522 bytes are oversized if LongPacketEnable is 0b
> (RCTL.LPE). If LongPacketEnable (LPE) is 1b, then an incoming packet
> is considered oversized if it exceeds 16384 bytes.

> These lengths are based on bytes in the received packet from
> <Destination Address> through <CRC>, inclusively.

As QEMU processes packets without CRC, the number of bytes for CRC
need to be subtracted.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/net/e1000x_common.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/net/e1000x_common.c b/hw/net/e1000x_common.c
index 6cc23138a8..b4dfc74b66 100644
--- a/hw/net/e1000x_common.c
+++ b/hw/net/e1000x_common.c
@@ -142,10 +142,10 @@ bool e1000x_is_oversized(uint32_t *mac, size_t size)
 {
     /* this is the size past which hardware will
        drop packets when setting LPE=0 */
-    static const int maximum_ethernet_vlan_size = 1522;
+    static const int maximum_ethernet_vlan_size = 1522 - 4;
     /* this is the size past which hardware will
        drop packets when setting LPE=1 */
-    static const int maximum_ethernet_lpe_size = 16 * KiB;
+    static const int maximum_ethernet_lpe_size = 16 * KiB - 4;
 
     if ((size > maximum_ethernet_lpe_size ||
         (size > maximum_ethernet_vlan_size
-- 
2.40.0


