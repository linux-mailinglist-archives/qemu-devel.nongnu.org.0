Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3B5678F4F
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 05:36:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKAyy-0002ZM-8R; Mon, 23 Jan 2023 23:32:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pKAyw-0002YQ-6T
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 23:32:26 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pKAyu-0002Nm-J4
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 23:32:25 -0500
Received: by mail-pj1-x102e.google.com with SMTP id b10so13684605pjo.1
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 20:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DfHbFzEFpZAIU4LZ6NgwvgYjQ8+Nr9IG/Jg0A+8VsYk=;
 b=Fhmnr2EHsR39b4q+VOdsBEWJyMvD1DSLY+X4jghngFhEb1O4Pc7XoMLLwrkdZ67mwI
 IzIXk9G3OblZS/H0jyObhJYSPk70oqY/PtvY+cwcV69cstI9gOMDwKyIPxIrzXpdJp+u
 63v2ph+5u5+cjvFlp01m8LfMHZfnPqKJUNKn5VQbRm4TUC7zK16iRku10X9HavWzLUxL
 AwlJPVRswOUhYdNpw5ZxalR/wvoPhN3zfQrGDYgKq5wpefGZWbU82xP+AipRHplh1mtT
 rFQKEuz0k19Ay1qc62NnLmalRp8IRrW4YJMMLdB5ulzzogUznIy9iaV6dMcBs2W2RrEO
 1xNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DfHbFzEFpZAIU4LZ6NgwvgYjQ8+Nr9IG/Jg0A+8VsYk=;
 b=Iwz+NBSg8CfMlLIx8q4wEkMSqfjXKWaQKUJJGjTMyo96YUWAovqRvTJMjQeg156T24
 A/PE0gzrzNxzmoNu6kNQwoVxSD3A9h+0FRaOvhRV4FtO1WZ4Aovk3XxoUGfPjt6noH62
 FgxbclXjL/zNVIFx0VZeLkbwZ5mC9vMdPTqW90sSlHKQGFvY4jbMS0NM9/lG6FS5Mpp0
 cBE6lSvMNIUxBhiUyU6iowRaMtfDDe/rcOV+DOpwB1typfm2uewgrFHwzBcWvoG6WprP
 F9H2956n8Sb0UWvJ7HGAecob9FBDkMTJWNkHWMELpQV2rUno0uK5lLaaPXF/VBGLEg3V
 cQwA==
X-Gm-Message-State: AFqh2kqWXEEn26M8GeNJvfNJPVW/1ha0EdXiXNRS2JCFgECe1VvBZZCM
 z7r3gw2gXyUH7Gl2P+gj34LRfQ==
X-Google-Smtp-Source: AMrXdXsrFZuvGcpy50qDMGWicVK2NpwWwFA9K9jkl/94AfkeLBfRo1ZlYUetrRFroBQ94hbD4ssLcA==
X-Received: by 2002:a17:902:9b97:b0:194:a1f6:65ae with SMTP id
 y23-20020a1709029b9700b00194a1f665aemr25530601plp.12.1674534743954; 
 Mon, 23 Jan 2023 20:32:23 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 z5-20020a170902708500b00196030312ccsm548033plk.78.2023.01.23.20.32.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 20:32:23 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Yan Vugenfirer <yvugenfi@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v2 10/26] e1000e: Use memcpy to intialize registers
Date: Tue, 24 Jan 2023 13:31:27 +0900
Message-Id: <20230124043143.5515-11-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230124043143.5515-1-akihiko.odaki@daynix.com>
References: <20230124043143.5515-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102e;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102e.google.com
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


