Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7484B685E07
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 04:39:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pN3v4-0006Ts-Dd; Tue, 31 Jan 2023 22:36:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pN3v0-0006NN-Nz
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 22:36:18 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pN3uz-0000Qf-BO
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 22:36:18 -0500
Received: by mail-pl1-x629.google.com with SMTP id z1so9641303plg.6
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 19:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LG8tq76sMobR10hriWHj/a6wTqkVZm1W1tagtp7KN+0=;
 b=CuSi38gqao9Oo/YJDrfWlWIcvDAeFdeH+yl+n2DkcEkTwbXQZbpMtl1/ad/2zy+WqA
 iCQwUx6H4nhQD+fd2h6XrAnAWk9HkQ1j8RvtU1p5UZdCT9vjjvSTaILqdxlMSjc7OFyL
 Cr4cTe7/pkijs7/SW8JEVJywVs4dFIssBxm3XYJQUxYBhBfS0DwjcgqP5gd1FDxbBHQo
 XZXxikZYWrmz+SRlmDQ8VFV9rg2izf5yQyvkaGNKFsx8+Oz1PlgH9QNZ/mLWdmwxmSng
 WnnFdbHuXO+zXt6vboXoO3VAtNG+QmsJkQR3/NOjFSi8dhxZ2b8zv1XnqHKBGOehxg0r
 SmAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LG8tq76sMobR10hriWHj/a6wTqkVZm1W1tagtp7KN+0=;
 b=KT+Bup+vqDC88ZgwzdgzfqAQoCyuB3Q3i1mw7a1u06hq14tK7j10NDIOt5Hn/YpnOq
 D0ujqnjNeLJUaxpwazcGeWtDifiFt/V6g+WeaS0TyqLVrFoncT73VWBVgwNF4DQof3qS
 HwILIiRNH3QtNGdJsARYoE4T8ST10tjnlmWYYzF4bQ6IUF6mDQQutcxzlWNtOHt8sC4F
 vfK+Q658OYlccxG8Rd2JEXP9R3ksyW/G6kp4r1bvxds06QE+W4lDAWBjjb1EYKuBQrOl
 yilTs3UOECTNOImsiE+jRwSO/dr9pixtgoYiUE94zm90dIlsjFUZbmP6jWYB+x0WMu/M
 PwYw==
X-Gm-Message-State: AO0yUKUCwseB8vTqAtljD9WkGKXBhZpEJb7RLvDKkd5Ao4IPnHny3KtL
 yWS7yf++WCXndCltlwbe+AWGuQ==
X-Google-Smtp-Source: AK7set8oMMWO0l42d6bLvGJB/0C1+GARS08hZ5c1G2wws1IHv1rm1J9RhStAHaq0YlxGWvfwUTAsvA==
X-Received: by 2002:a17:902:ca83:b0:194:52ed:7a2b with SMTP id
 v3-20020a170902ca8300b0019452ed7a2bmr1078593pld.39.1675222576019; 
 Tue, 31 Jan 2023 19:36:16 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a170902ec8f00b001968b529c98sm4185557plg.128.2023.01.31.19.36.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 19:36:15 -0800 (PST)
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
Subject: [PATCH v5 09/29] e1000: Use memcpy to intialize registers
Date: Wed,  1 Feb 2023 12:35:19 +0900
Message-Id: <20230201033539.30049-10-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230201033539.30049-1-akihiko.odaki@daynix.com>
References: <20230201033539.30049-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::629;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x629.google.com
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


