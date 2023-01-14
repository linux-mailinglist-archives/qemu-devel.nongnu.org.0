Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBD966A916
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Jan 2023 05:03:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGXik-0000L7-9l; Fri, 13 Jan 2023 23:00:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pGXiQ-0000Bt-Pl
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 23:00:23 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pGXiM-0005Yt-48
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 23:00:20 -0500
Received: by mail-pj1-x1035.google.com with SMTP id v23so24249017pju.3
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 20:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DfHbFzEFpZAIU4LZ6NgwvgYjQ8+Nr9IG/Jg0A+8VsYk=;
 b=IT/cPnFuNuIBG1BzdmTayhYkkVLj8OdjUlj0mOjemKVoDztf98XkP0YxFDt/OeWOR9
 /w1eSIssBgC1FKvxrRdr8XRfpBDwqnOovHnCNrNRiUoAwIlCiwvKM8U90JGC8rpPMC+D
 uTKo/lHHa8E1Gn/i8Iv9mQg92vetATyFcJG97pu5D/W0iGwGAwi4roFjMi9f7hjkI7Dv
 9IEbaACJaSq1dtjUTn92S32/PhojCnnsh9U2dGSMzoom6iS8TcM3XGsF+g4lML6hRq72
 VmWXY4SvKl0oVUpilu0eXdWMCnbnxBQ4JF9oeB6nTucCxPAljy20LKSEphOUlnaFxgHa
 MioQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DfHbFzEFpZAIU4LZ6NgwvgYjQ8+Nr9IG/Jg0A+8VsYk=;
 b=wUpCNz9O7irg9zio1BTgjWj6zYCABTkoCZ8X7uKZR9qctyuobvX5owqX69jb1lh/Er
 /Iimpk9BkNkwI7JV3LDZJmc0BSBFAPEibkahWPWxB8txR7COAMxcXF52HFPCNLhmgtbQ
 llDLJGGgfMUvIZnVnOisQTpMhZO26e8RZ+iBI3Fkvmq1ZqLh/YBa+bNMXlM3r+Ljuq+m
 wTl2QruTEzFgrbnva0jQPn7E/NP5S0a19kqL1LWeHn7WaPRFtJgt/aUpN+hn5+isu1Xr
 PQo6sfmHpsLRTX+qpNJN3KSYnKvMtJiJGZygp23bkf+ikCG8QLKSlWCa0D4pVuyxMzmv
 qolg==
X-Gm-Message-State: AFqh2kqLVY4atNdqG3+pS9Bi5Nyx/+jEy027WFW79au0UBjAaKGheOj2
 FCQR9sml/XOE9qQYj0aMZNFupg==
X-Google-Smtp-Source: AMrXdXv7wQ8jFmnuTNAevQjqKhL6Ymd+VJxuZgAo+KCgCBAT+mmeXqBmdNwhOnbcRJEEtaPg93V1VA==
X-Received: by 2002:a17:902:ce08:b0:189:81dd:6b8b with SMTP id
 k8-20020a170902ce0800b0018981dd6b8bmr111298968plg.63.1673668815826; 
 Fri, 13 Jan 2023 20:00:15 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 g15-20020a170902868f00b00189fdadef9csm910894plo.107.2023.01.13.20.00.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 20:00:15 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH 10/19] e1000e: Use memcpy to intialize registers
Date: Sat, 14 Jan 2023 12:59:10 +0900
Message-Id: <20230114035919.35251-11-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230114035919.35251-1-akihiko.odaki@daynix.com>
References: <20230114035919.35251-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1035;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1035.google.com
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


