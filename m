Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5FE6A05F2
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 11:22:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pV8j7-00069G-7Z; Thu, 23 Feb 2023 05:21:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pV8j5-00066r-1A
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 05:21:23 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pV8j3-00023A-GW
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 05:21:22 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 cp7-20020a17090afb8700b0023756229427so3427563pjb.1
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 02:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2I2qnGVaZLWPm0YolfUBdJT/b10cmArelvHHWWX/I+I=;
 b=4ZJvwLPVk0hsh2wnoiXwneZyluIAFUE0/Blagwp28LqjFx0mwjlVtMk4RsxlYfBBBD
 f89qOdlYOlsT6xipM7GElYf3YpMjlyM1XMx6REgNOByNrcDCSS3hmCV4fgJQ2Z/gis8G
 IE8g7Ip7BZ4KSm1MUISMZbUlsw/KHuXgzbh93Hvgw493zpEt13BsaYTqRhAbXuCoJWWo
 +8C2tZLwoHjNR6NsaWB4xOCV7WpZL6h+kr4nvzibLFWtwMv2ia6DcA90rWw/g9+AdAvV
 nhW6RzbYOCQ7FkqawKiIQSeV2kgF2NnvD37cvk9BDG8uhy2fPvNdeaOz3OkV4rWPhtHo
 vLkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2I2qnGVaZLWPm0YolfUBdJT/b10cmArelvHHWWX/I+I=;
 b=Fy5VMqn6JxrflJ2ZQjXR16APyBTc9q5ZTX228XUMVcE6DAAhQ9Ni0yG998fGMcg9t2
 siM1jdJEWfKhrScOMsOzNjotyWEelT/o6Mn6FI1V82LoYU+Hnii3JN0cHcAQ9sVZV87q
 hTFoimkKSO08cKaGvQy0bcJW6dBMXxeRazhW1uxE8d5xtDrg340SlLvgPo2Az50e3sMx
 VIURj0vj+PT204wldNYQ4X3pjDEeuyxZ0wSvs8HOC/BBuLAN5+f+8EYFnCc6FzsTeqfD
 L3A7083qzw4pZwhBvAu7FFxkmI/wB/oA96GQwonZ85tekjswleHihf7ZabFUkFspSFZq
 MjWA==
X-Gm-Message-State: AO0yUKW7ZLFKAecpnBOlZukb6aygD7sjv95sFQ1Zz+oVBj2oeQL6cZQR
 44usaGBaPa/Cw96p44+VhtXZ0A==
X-Google-Smtp-Source: AK7set/XohguJuUEXI7Xza+cxNQXxtAI69DT0HKO17Yh4eOSHhWKnXo8rXouU37O5tyXhSpwrz9f8Q==
X-Received: by 2002:a17:903:7cc:b0:19a:b343:d9ac with SMTP id
 ko12-20020a17090307cc00b0019ab343d9acmr9657220plb.65.1677147680432; 
 Thu, 23 Feb 2023 02:21:20 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 c20-20020a170902c1d400b00196217f1219sm4107734plc.70.2023.02.23.02.21.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 02:21:20 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>,
 Yan Vugenfirer <yvugenfi@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Alexander Bulekov <alxndr@bu.edu>, Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v6 11/34] e1000e: Use memcpy to intialize registers
Date: Thu, 23 Feb 2023 19:19:55 +0900
Message-Id: <20230223102018.141748-12-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230223102018.141748-1-akihiko.odaki@daynix.com>
References: <20230223102018.141748-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1036;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Use memcpy instead of memmove to initialize registers. The initial
register templates and register table instances will never overlap.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/net/e1000e_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index 6a4da72bd3..87f964cdc1 100644
--- a/hw/net/e1000e_core.c
+++ b/hw/net/e1000e_core.c
@@ -3511,9 +3511,9 @@ e1000e_core_reset(E1000ECore *core)
     e1000e_intrmgr_reset(core);
 
     memset(core->phy, 0, sizeof core->phy);
-    memmove(core->phy, e1000e_phy_reg_init, sizeof e1000e_phy_reg_init);
+    memcpy(core->phy, e1000e_phy_reg_init, sizeof e1000e_phy_reg_init);
     memset(core->mac, 0, sizeof core->mac);
-    memmove(core->mac, e1000e_mac_reg_init, sizeof e1000e_mac_reg_init);
+    memcpy(core->mac, e1000e_mac_reg_init, sizeof e1000e_mac_reg_init);
 
     core->rxbuf_min_shift = 1 + E1000_RING_DESC_LEN_SHIFT;
 
-- 
2.39.1


