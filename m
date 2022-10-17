Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D007601801
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 21:48:12 +0200 (CEST)
Received: from localhost ([::1]:46230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okW5r-00048t-1U
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 15:48:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1okVfk-0002Xs-Tw; Mon, 17 Oct 2022 15:21:13 -0400
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33]:45014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1okVfj-0002xB-6v; Mon, 17 Oct 2022 15:21:12 -0400
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-132b8f6f1b2so14356001fac.11; 
 Mon, 17 Oct 2022 12:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kESdHqgE2z+F/UZlt53Vf101LIX5FdnTM9wdubvabds=;
 b=lEKTMEsw7Xoa0lymAQxx/PDcw6+lQFoqfs/tU2bhgh8zb6IOHwfQ6BSNlq+FWvmt+L
 4TdvPvTUfgy8bmPivKTaORx42ivpYBfduc2VX28jreZcJexN/o7vYX9prfZHmCaClrvQ
 T/pMiUczlhKlUa/Xjlm6CWpnqQGPXOvjSTU/JWDnY+ipq/zm8jAVhzL0Jq8HQF2sEtky
 Hm1f5idbPhUb+CWSGT1BB+AWh2R0jvXVPwSI15h0xhwq0gRT4uiye9RPa9Pj7tDuYNTB
 5m+UPnQvhi1k4KygCheXvD1kzwo3E//emhUIWkYFDbrXribTSlTQQOl3RH2KNwWqAI+3
 SMrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kESdHqgE2z+F/UZlt53Vf101LIX5FdnTM9wdubvabds=;
 b=44LKdDnHvXcbbh8TLELAe/omJOWo0o2ppHA8566eMe89iqF7PAG/Y7ZVkeSGA4ZvD7
 fNpsjdp3cVsTNc8pREff/wqlYba1xoThr8V5KMr4Knu0NeavvPODhqsU3RFwCpE9FTYz
 8uWSIJOQeDPhkZ5y9Tbrfwr24yayZUvy8dNKt4DI+rSWPb0il1zs0b4LekHPz7glpQZ/
 Ed3OOvnhQbeKMu0IKByhU5bKR009MRL/EmfaJxVQHxC0YbFr2VRLg0NQNJRSM4rrvnjy
 CzRVTR9x3FsvAi03TUofeP1gEnc5dVOUB3TNQgDoKCzAFDZnHJTpdHpoTFLstpwlMh0L
 1asA==
X-Gm-Message-State: ACrzQf3h0rkyXyQfblqRE2psyATr7pgvCDpURh86d2SAbxt4tCVCQyte
 03twFjODWDHreNMm+++Ddw/BZ6i7eSQ=
X-Google-Smtp-Source: AMsMyM4I9GjpvBbWYl46xALhpIto/9JeqLDlDzB9Tmduf03SrRU8reeWox87A03Qop3hqxxo6b6TTQ==
X-Received: by 2002:a05:6870:40c8:b0:136:4389:1375 with SMTP id
 l8-20020a05687040c800b0013643891375mr16559881oal.46.1666034469536; 
 Mon, 17 Oct 2022 12:21:09 -0700 (PDT)
Received: from balboa.COMFAST ([179.111.38.2])
 by smtp.gmail.com with ESMTPSA id
 n132-20020aca408a000000b00342eade43d4sm4648005oia.13.2022.10.17.12.21.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 12:21:09 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 Bernhard Beschow <shentey@gmail.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 20/38] hw/ppc/meson: Allow e500 boards to be enabled separately
Date: Mon, 17 Oct 2022 16:19:51 -0300
Message-Id: <20221017192009.92404-21-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221017192009.92404-1-danielhb413@gmail.com>
References: <20221017192009.92404-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x33.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bernhard Beschow <shentey@gmail.com>

Gives users more fine-grained control over what should be compiled into
QEMU.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20221003203142.24355-2-shentey@gmail.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
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


