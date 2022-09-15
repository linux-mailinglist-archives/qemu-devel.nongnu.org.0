Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 099AD5B9ECA
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Sep 2022 17:29:10 +0200 (CEST)
Received: from localhost ([::1]:49286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYqnc-0004xg-PL
	for lists+qemu-devel@lfdr.de; Thu, 15 Sep 2022 11:29:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oYqkW-0007nQ-6U; Thu, 15 Sep 2022 11:25:56 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:43535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oYqkU-0007Dw-J3; Thu, 15 Sep 2022 11:25:55 -0400
Received: by mail-ej1-x62c.google.com with SMTP id lh5so1212407ejb.10;
 Thu, 15 Sep 2022 08:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=nzugGvytbDNUTu0tbrVX+Lh2a7ZkRAaoKEr707jbXjk=;
 b=otlb+twSpJa7jA8FoO440eRq+QscM1WDGIb9Rrv4s1gCAK1ht1T5DmAiodlL0tqKyY
 Co2lQk4MXKNhGQ+VV0hsv4i81iYQZIKXnQJfx+SP8p55h6xVtJKn4WpFuApPcipFukcC
 8rAzyEaPMDwUIWl2lf+Ty2LOF4PO3GePmqdFkgAugtM4AeKQ4fktL3fJN2qF0sRIXifJ
 /pbhfpRW2FP+oe2pJ7XYchBemdwNg3Ng9U5gllj2EUp7Ec12m1dQqexg4pm2hCYKQJOA
 DPWHI1UXOGblSbwBxPxW6sYZiRHeb3IhAoXtey/wMfggtNfZ8BuUDsNsClyI+HHEvbA/
 CeMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=nzugGvytbDNUTu0tbrVX+Lh2a7ZkRAaoKEr707jbXjk=;
 b=HkEoWueYG1VLq4LNsErEmtX6SjwWEjM2DbT/tBkZ95QuwCqntu4Srd2iZXmMN5KAT4
 dmBPkzfk+u6hjnZa9xJSnYoBRx/emBoFDoMaTv4g5eYHKpzSvfkXIHodE2z22ZFr8cK/
 xqllPH3DpVUMsG/RhaijVj6tG5TtjBOOUjcPvRXEqXfxILXPCkIUxdbzGzEkJneExM+k
 centLUxdJhMxiNDklJusfInLMX9zfH8yacu5HbA9xgjhhMQAVU5YpE9NE0iggjj0E5FI
 67qNrVbkKtgTIBAy2iFBfXf96GyrBg7jQ7u1dDm8vf4J4MaI0bSYzdcv05ATda5vumqV
 22xQ==
X-Gm-Message-State: ACrzQf0hNkYL/pyG7l6Lbto2DYDFojxHQUHyfmosQnmVKdj3kdbG99BG
 D7eLCiQY1YnjSlWtz8MZ5gPh7bSOrWA=
X-Google-Smtp-Source: AMsMyM7sdXqG69kFVFH1U7di19u2QIsiMz/9jSz94HWxEAfZwM/o7jIvDRFwklGl4HqxJ2owPPYitw==
X-Received: by 2002:a17:907:7208:b0:73d:7097:ac6f with SMTP id
 dr8-20020a170907720800b0073d7097ac6fmr379137ejc.388.1663255552224; 
 Thu, 15 Sep 2022 08:25:52 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-077-191-182-143.77.191.pool.telefonica.de. [77.191.182.143])
 by smtp.gmail.com with ESMTPSA id
 2-20020a170906210200b00730979f568fsm9297138ejt.150.2022.09.15.08.25.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Sep 2022 08:25:51 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 qemu-ppc@nongnu.org, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 01/11] hw/ppc/meson: Allow e500 boards to be enabled separately
Date: Thu, 15 Sep 2022 17:25:10 +0200
Message-Id: <20220915152520.21948-2-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220915152520.21948-1-shentey@gmail.com>
References: <20220915152520.21948-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Gives users more fine-grained control over what should be compiled into
QEMU.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 configs/devices/ppc-softmmu/default.mak | 3 ++-
 hw/ppc/Kconfig                          | 8 ++++++++
 hw/ppc/meson.build                      | 6 ++----
 3 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/configs/devices/ppc-softmmu/default.mak b/configs/devices/ppc-softmmu/default.mak
index 658a454426..a887f5438b 100644
--- a/configs/devices/ppc-softmmu/default.mak
+++ b/configs/devices/ppc-softmmu/default.mak
@@ -1,7 +1,8 @@
 # Default configuration for ppc-softmmu
 
 # For embedded PPCs:
-CONFIG_E500=y
+CONFIG_E500PLAT=y
+CONFIG_MPC8544DS=y
 CONFIG_PPC405=y
 CONFIG_PPC440=y
 CONFIG_VIRTEX=y
diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
index 3a4418a69e..22a64745d4 100644
--- a/hw/ppc/Kconfig
+++ b/hw/ppc/Kconfig
@@ -132,6 +132,14 @@ config E500
     select FDT_PPC
     select DS1338
 
+config E500PLAT
+    bool
+    select E500
+
+config MPC8544DS
+    bool
+    select E500
+
 config VIRTEX
     bool
     select PPC4XX
diff --git a/hw/ppc/meson.build b/hw/ppc/meson.build
index 62801923f3..32babc9b48 100644
--- a/hw/ppc/meson.build
+++ b/hw/ppc/meson.build
@@ -71,12 +71,10 @@ ppc_ss.add(when: 'CONFIG_MAC_OLDWORLD', if_true: files('mac_oldworld.c'))
 # NewWorld PowerMac
 ppc_ss.add(when: 'CONFIG_MAC_NEWWORLD', if_true: files('mac_newworld.c'))
 # e500
+ppc_ss.add(when: 'CONFIG_E500PLAT', if_true: files('e500plat.c'))
+ppc_ss.add(when: 'CONFIG_MPC8544DS', if_true: files('mpc8544ds.c'))
 ppc_ss.add(when: 'CONFIG_E500', if_true: files(
   'e500.c',
-  'mpc8544ds.c',
-  'e500plat.c'
-))
-ppc_ss.add(when: 'CONFIG_E500', if_true: files(
   'mpc8544_guts.c',
   'ppce500_spin.c'
 ))
-- 
2.37.3


