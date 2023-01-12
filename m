Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD390666ED9
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 10:59:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFuM9-0003SJ-IA; Thu, 12 Jan 2023 04:58:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pFuM6-0003S0-Lr
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 04:58:42 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pFuM4-0004Lx-Kf
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 04:58:41 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 o7-20020a17090a0a0700b00226c9b82c3aso20248989pjo.3
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 01:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pPGbSO/EJSNHIhF9cvZ4QHtIhEZpBwy3aj3fB3KetnQ=;
 b=rkY/1D8qRspjx1FVVls/rjcf2bDnsbXjsYn6OTvaYXdULVjGVdhYGgKdAaK3VVfwIi
 8w4KMCO9jFQ9iuacui96ZSIRRefopYoT5zClYoM2AkwV/pauzkNrEv4FGFTKX9B9R708
 gtBc6JvBph+q1Bx9r79zUhEMpQytw9StrOGniqXZbRfktPMbo9vwsBlgasD9qezFRRgf
 8mPd5sqLEdBhEj1naP0siTuYdrzBhMC/zpANGBhY04SJxxPUDup5RfVoaT3IZILp/qos
 7zmd+2Dqp0RCHMQaI9kq6EwUn/CfDLFJblIoOpJCu4F/HrclTYsZirgthVh9LOt0LyZK
 g6CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pPGbSO/EJSNHIhF9cvZ4QHtIhEZpBwy3aj3fB3KetnQ=;
 b=ZxNsPxuNHliGSrh+lXuqRs9TgvAduf4CTajZyql0CE5xL3wn9Zx+txnsfVzONAPTyp
 35qNaE6jhhRyQAAENi+WxacWPcq7mGnRKccLnJx60krO25ZLBlZ3yqiJI56oxVvDOxjH
 hS/oB3EIQxnNk8IcPOPv/TG6HGPtW8ze5aEfnWmRPUM6HED5cXM1UY2sIndOkF7ctBBL
 AxQbVTMNi9gXpjXUZEWtuSszvlLvdOH1zoAZWvSU+P5pKcRKzXuYMyHr5NQXrkUMLWNA
 n3ykH+yWAbACjriUzoebRVaN72jIN3HzHhmM27pGuwJNX0VDKw03mW47X3rc5rji6wuZ
 pYnw==
X-Gm-Message-State: AFqh2konx7sHUXgy11AMXm43ppmqT19oa4VbnjSP/euFiSlUJNFnX41F
 7G2iNUwxqGAcSB/5+utsmrsZkg==
X-Google-Smtp-Source: AMrXdXsdbtbnuGsfix/lOp39incc0wVGfMuJrB6zuPj++Im7PFo8zInMhWdCsFtW41NdfDRINnytZQ==
X-Received: by 2002:a17:90b:2544:b0:228:cf3a:9e86 with SMTP id
 nw4-20020a17090b254400b00228cf3a9e86mr5929319pjb.23.1673517520029; 
 Thu, 12 Jan 2023 01:58:40 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 k13-20020a17090a3ccd00b00219025945dcsm12095450pjd.19.2023.01.12.01.58.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 01:58:39 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>, Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, devel@daynix.com,
 Yan Vugenfirer <yvugenfi@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH 09/31] e1000: Use memcpy to intialize registers
Date: Thu, 12 Jan 2023 18:57:21 +0900
Message-Id: <20230112095743.20123-10-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230112095743.20123-1-akihiko.odaki@daynix.com>
References: <20230112095743.20123-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1030;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1030.google.com
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
index 8412a751ae..1bcc0cd4f3 100644
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
2.39.0


