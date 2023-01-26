Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4AB667C925
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 11:51:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKznm-0003Jd-V1; Thu, 26 Jan 2023 05:48:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pKznP-0002pc-96
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 05:47:59 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pKznL-0005XE-Ez
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 05:47:55 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 t12-20020a17090aae0c00b00229f4cff534so5621196pjq.1
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 02:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DfHbFzEFpZAIU4LZ6NgwvgYjQ8+Nr9IG/Jg0A+8VsYk=;
 b=LoDAf1dKNnPtF37xqrioQ0hpGudEJYPJbiu7nuKTx9ePJekucjJ5/WaxSdHxbWAwmx
 mVE4njjTZqsDwi29r4ZAx82iF9Nz/JaH4kB/4sbHvfzCGyZG2D2Pl9WW1Iw16TScNrjc
 cGZI5K/X2lMxKEWLEblcTsBVABtg7soEBzOFoBG4UyZBqfNoq88joz0vfLSkhochxCjm
 6tlzedCwm5UhaTYszsknO03oqk33ga73ik+ppzHFb8/ZlawjRssqXxdQwmivLUKMgXv6
 shtZ9KwXdKhvHOB9IpBT6aIL9vzD3qVQ62+Hm9W2NyyiJcvHKyk0Mv+Q8CSsExLv9a8C
 PAVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DfHbFzEFpZAIU4LZ6NgwvgYjQ8+Nr9IG/Jg0A+8VsYk=;
 b=tmJ0xf94VELU8pmlk7u260CCt5l4n5Rl7FLpqShK8l14KnfEzdE+EmCVvUHofmLP9v
 Ds5slv+hRFAtbe51+sGq32DS6LMiU9aknhVhHVskU5NS/GrBf2wEQWBlBI0tb8z+0b7R
 LziYpDWq76k1H+biW1Qgmm83+qNNQG7sFlXCdwMQjY8PkCkR2QlUXZKE/k297yqN4V75
 Z/Pj4qk1VhgYKkhXp9A43VyRGqYrWlB8NfzKQ9i1yXTwkX2gdAtXhUavOP9B3fWp08d+
 hxydjuqbKGt8gMAIvTXttoim08vpCG7f463/MLp9J11w9Jzd/k6kf6M7oArWf6hz9zia
 KSwg==
X-Gm-Message-State: AFqh2kp2bCbpa5MhJjuKIAkskj6miUvX7Nj9CfEEDI6jqKa1SBbj5BnB
 wyy52Y38ZNpZAeJuVjYPKL7OCA==
X-Google-Smtp-Source: AMrXdXsv3tgVvsE38ZONH3e2Ca/PHHQmIugrt09p6jzK3UYk/1ORvw+1QqN/wj9mCRjWTMJS8GIkqQ==
X-Received: by 2002:a05:6a20:671a:b0:b8:5916:c720 with SMTP id
 q26-20020a056a20671a00b000b85916c720mr37792094pzh.45.1674730069175; 
 Thu, 26 Jan 2023 02:47:49 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 s8-20020a63af48000000b0046b1dabf9a8sm496789pgo.70.2023.01.26.02.47.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 02:47:48 -0800 (PST)
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
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v3 10/26] e1000e: Use memcpy to intialize registers
Date: Thu, 26 Jan 2023 19:46:49 +0900
Message-Id: <20230126104705.35023-11-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230126104705.35023-1-akihiko.odaki@daynix.com>
References: <20230126104705.35023-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1030;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1030.google.com
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
2.39.0


