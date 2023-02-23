Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 987746A061E
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 11:25:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pV8j3-00066G-W9; Thu, 23 Feb 2023 05:21:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pV8j1-00065J-Gr
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 05:21:19 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pV8j0-00020i-2A
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 05:21:19 -0500
Received: by mail-pl1-x62f.google.com with SMTP id ky4so13410780plb.3
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 02:21:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LG8tq76sMobR10hriWHj/a6wTqkVZm1W1tagtp7KN+0=;
 b=I8c0tV3IN0m6tHZv0vLS7dwfoManBSz13vH+178e3scNW9Trk7mw4iBfKsxwMyr+v3
 FiXkpRVmfQpknvPjmdRGi48jRm2rzyQf6n9ycKcBwmFaqYX6ZaZn/C1ZZaerwB9eanif
 +Key4hhH5NFQkI8iIITuSZPGK5qy/rru6tQU0A1uhhGbEOAr5xpeYo+PROMrwqxBROT9
 1To3LgxZZURpmAE3wtfpNCtOAE6OtvUHYYW3tVf65Mq9Io636FkZ2csHzL4U2xfaj5kv
 njTnVYg9lHgXdOyR0y7lbCCg8MuYFfi8ZKgvsU8BVtYU3tzOdLVQKrVykGV8j1b6xY/Y
 zFtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LG8tq76sMobR10hriWHj/a6wTqkVZm1W1tagtp7KN+0=;
 b=gtmd0AeMy96hvA7i8B/QSsx27kaR7mcejBmZQmRFKdhpOpxZR2fOA7kZyp4z1g/52i
 pIlXiRZKKzsMkEILIWq7h5D7goAnupF3PDrqmvwSyUVWyxHYAVvNxZ63yh+enVGbf5p5
 MAPnCAeh9YHLQ5+OJPoLURID6TGbTJeouuhdzwzOZ8wruGyZSfo3WY2NfFOZDsmD7OzN
 CAIp2Ja3SnYSIZaiUtOkTkDJ60ah2AOjSUHZL+j3D/P3Dod9whd4S4H8G3CWnvqvroTv
 SCUhHm2Je/cxMUs0tg5gopepZokVl1U14/KagdxREcDiJ0ybopufvveq4F+AdMsvuY6L
 2Oww==
X-Gm-Message-State: AO0yUKX+/eCjv7x6A+FFlvgMIL2W0B9UkrLvXb+VArwyYfvwOEa7OT/q
 s3RnLZ2jFJk8nOUurkuQACigxQ==
X-Google-Smtp-Source: AK7set9JKdl4n/U6ZBKdpsEZ0iEU23VLJyT96qsMc/rKATo1SOL4tL6JOjaJX2DrJfDiPsHbm/i3cw==
X-Received: by 2002:a17:902:d486:b0:19a:8b3a:fad with SMTP id
 c6-20020a170902d48600b0019a8b3a0fadmr16283480plg.20.1677147677013; 
 Thu, 23 Feb 2023 02:21:17 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 c20-20020a170902c1d400b00196217f1219sm4107734plc.70.2023.02.23.02.21.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 02:21:16 -0800 (PST)
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
Subject: [PATCH v6 10/34] e1000: Use memcpy to intialize registers
Date: Thu, 23 Feb 2023 19:19:54 +0900
Message-Id: <20230223102018.141748-11-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230223102018.141748-1-akihiko.odaki@daynix.com>
References: <20230223102018.141748-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62f;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
 hw/net/e1000.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/net/e1000.c b/hw/net/e1000.c
index d9d048f665..3353a3752c 100644
--- a/hw/net/e1000.c
+++ b/hw/net/e1000.c
@@ -390,10 +390,10 @@ static void e1000_reset(void *opaque)
     d->mit_irq_level = 0;
     d->mit_ide = 0;
     memset(d->phy_reg, 0, sizeof d->phy_reg);
-    memmove(d->phy_reg, phy_reg_init, sizeof phy_reg_init);
+    memcpy(d->phy_reg, phy_reg_init, sizeof phy_reg_init);
     d->phy_reg[MII_PHYID2] = edc->phy_id2;
     memset(d->mac_reg, 0, sizeof d->mac_reg);
-    memmove(d->mac_reg, mac_reg_init, sizeof mac_reg_init);
+    memcpy(d->mac_reg, mac_reg_init, sizeof mac_reg_init);
     d->rxbuf_min_shift = 1;
     memset(&d->tx, 0, sizeof d->tx);
 
-- 
2.39.1


