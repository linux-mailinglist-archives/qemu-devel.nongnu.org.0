Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8B25F378D
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 23:18:49 +0200 (CEST)
Received: from localhost ([::1]:36962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofSpp-0003bg-Gd
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 17:18:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ofS7b-0001zd-QH; Mon, 03 Oct 2022 16:33:05 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:44028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ofS7Y-00041f-2d; Mon, 03 Oct 2022 16:33:03 -0400
Received: by mail-ed1-x52c.google.com with SMTP id y8so16164831edc.10;
 Mon, 03 Oct 2022 13:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=9b5vMTAI3YAEZ9E6MgO2I1pyQYA0NxY1asETD+oGIfM=;
 b=Y4NK3MVjG6kYAFoM4KER53kMH46xM+bbzLPcXWbSUpHgtsz+qHth+d4o2I1yuvGBj2
 Txu0dpuEYMKB9dFFlC0oDl+5nfo6swiQcQW5+BbwLm66N5uECht71FW5pSsljdggMx5L
 /qlcU4qLX6PUxbm2K1+GQKV+VxLk/Wg0whMMd49oxYq+5GcLm+/1oTxUd2RzZRCt3qQV
 N+00kdNI6s178y8A1OSogTc97BIxX0df9Zl0ApBV0bHP1L1YtRv78WV0pcCPb6tQFXfi
 U6F2l5gTgXKCuUKGRmVq8JXsrLrDuW8zen7vqU+N3j2nt5jP5HxFTU6w/K1MRZJzH4XY
 HnAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=9b5vMTAI3YAEZ9E6MgO2I1pyQYA0NxY1asETD+oGIfM=;
 b=ERRphSHETLNoOQ3UIo2f3aR9SXitWim2GBcmk0mgtdOcWGmuSTILKqEziPcc4MWwRw
 dbwLG7O0LQb2aWmBorc4EhDPlTX3m9cIH9svyYGF3xIp1QXiLOmm46viUPkpG2GJ2+ke
 +3RfwYB5eyBMDeDaw6GB/9Jo0iykLYLdsJwQyJRQr+UlgEcREVH3lhNahgGmmPApiGsb
 PriHXtOTmx33cjWWnL/LawKVGoEyzCrYuizS4yDMAEwcUtikwN1YvejTpnahEaKKwHdQ
 +Ijf+bgJxK/FL5Aj9Facf/NHvcEcJcT5qrKAwyRHHNbPb9/C/0TB59a2zl6r+uYRvYI2
 Mq2w==
X-Gm-Message-State: ACrzQf2QSmh/epL91viPaOzg4Ft+aqEA+VQ5kR2NCoD0yHSaABrs/XO7
 t2G+ZVMGq6lmxbvR2rRD+t5BDVcURDQ=
X-Google-Smtp-Source: AMsMyM4mzi+/5sa/UAJcSQzavqaP4nofhHh4toAZemhLeT31yddNrtote9uYEDCRP06PCSxU28R7dg==
X-Received: by 2002:a05:6402:142:b0:458:5d74:f4f4 with SMTP id
 s2-20020a056402014200b004585d74f4f4mr16683314edu.44.1664829177578; 
 Mon, 03 Oct 2022 13:32:57 -0700 (PDT)
Received: from localhost.localdomain ([46.183.103.8])
 by smtp.gmail.com with ESMTPSA id
 lb9-20020a170907784900b0073ddd36ba8csm5978087ejc.145.2022.10.03.13.32.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Oct 2022 13:32:57 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Kevin Wolf <kwolf@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v2 01/13] hw/ppc/meson: Allow e500 boards to be enabled
 separately
Date: Mon,  3 Oct 2022 22:31:30 +0200
Message-Id: <20221003203142.24355-2-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221003203142.24355-1-shentey@gmail.com>
References: <20221003203142.24355-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


