Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8243F1B8C
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 16:23:27 +0200 (CEST)
Received: from localhost ([::1]:56054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGix4-0006cU-FM
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 10:23:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGiuq-0003L3-Gu
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 10:21:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36079)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGiuo-0006ZF-TJ
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 10:21:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629382866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zZLP80M+KMpFzOA/bjjaS/ry2kFipBSjMsh/PACigbc=;
 b=JQFkEu0CqBGwyZ2nY7HJbwkaEyYcclqIwD8VuQOM42Cbecua0yTvsuBiL7INhXNw9AbGfk
 e+gCYu/uCQwhr9TNdBxpVEXyeyBWK2j5dfKxbJrNnBi7tptt1o3yGfzTuqCqSjmSQ2Rz/v
 nW2hZg91I/wFjehwH0IEXxtE3AqUUZc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-477-S8QMZQsIPzmvHUh1X0BD3A-1; Thu, 19 Aug 2021 10:21:02 -0400
X-MC-Unique: S8QMZQsIPzmvHUh1X0BD3A-1
Received: by mail-wr1-f72.google.com with SMTP id
 l1-20020adff481000000b00156e670a09dso1767315wro.1
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 07:21:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zZLP80M+KMpFzOA/bjjaS/ry2kFipBSjMsh/PACigbc=;
 b=aanvx06+uNZWgyAcitcwwk54cru19suC0rpVhbUxkXXfe4C8/23ZXPWAgxtv70NFV2
 qZ6CJtffLqjNtKMrDZAT6gnAuFnXg4AEVqnXMPt+DR7txSaDieW1xtHUG6IeHsSixVfg
 8WAIg8zMuj9EXFQZQRq0qu4FUK6MQzxmI7wWssFvzu7FnVSRqPBqF8teRst4kdpwfWqm
 FgJs/FISIapuvpSNX4vjdS+MXQ89BMngjeSy0cjtyV4LqmMnA2QGqD+6Q6Cw82FjCX6r
 0LIhUi3aFu8Bcw3gLCmj0kjtt6xj9pF50dsvcLo630Z1OZMaLpqCcMg5sMofRqeznIH3
 yryQ==
X-Gm-Message-State: AOAM530cjwYID2McRBXCf3LIZFksqOmKfUdH7iOBiHCPSyjwYQUVm7mo
 1W2Ga0v7SC5jCDOzjBeKjJiLwNzUSGJCO4w+2gmPbMr+LQAw5EVCUpooo88wIoDmzSaHPM5HxD3
 Uli8i1YfrIfexkjmLliO32ckjvsQ/Czv8/ocW81H22Ao1FAOvYN/IC/nEBDvigtPI
X-Received: by 2002:adf:fb8d:: with SMTP id a13mr4371240wrr.164.1629382860196; 
 Thu, 19 Aug 2021 07:21:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzRDdE5l3tFMlrawDe6jBMujrunyjEgjm9hDLsAevR0HAqyGZiyFsUm6Y+xoVG1YZVto2dhwQ==
X-Received: by 2002:adf:fb8d:: with SMTP id a13mr4371209wrr.164.1629382860023; 
 Thu, 19 Aug 2021 07:21:00 -0700 (PDT)
Received: from x1w.redhat.com (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id u23sm7816790wmc.24.2021.08.19.07.20.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 07:20:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/6] hw/dma: Replace alloc() + address_space_init() by
 address_space_create()
Date: Thu, 19 Aug 2021 16:20:37 +0200
Message-Id: <20210819142039.2825366-5-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210819142039.2825366-1-philmd@redhat.com>
References: <20210819142039.2825366-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Jianxian Wen <jianxian.wen@verisilicon.com>, Peter Xu <peterx@redhat.com>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace g_malloc0() + address_space_init() by address_space_create().
Release the resource in DeviceUnrealize().

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/dma/xlnx-zdma.c    | 15 +++++++++------
 hw/dma/xlnx_csu_dma.c |  9 ++-------
 2 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/hw/dma/xlnx-zdma.c b/hw/dma/xlnx-zdma.c
index fa38a556341..9f6b3fa47c6 100644
--- a/hw/dma/xlnx-zdma.c
+++ b/hw/dma/xlnx-zdma.c
@@ -777,15 +777,17 @@ static void zdma_realize(DeviceState *dev, Error **errp)
         };
     }
 
-    if (s->dma_mr) {
-        s->dma_as = g_malloc0(sizeof(AddressSpace));
-        address_space_init(s->dma_as, s->dma_mr, NULL);
-    } else {
-        s->dma_as = &address_space_memory;
-    }
+    s->dma_as = address_space_create(s->dma_mr ?: get_system_memory(), NULL);
     s->attr = MEMTXATTRS_UNSPECIFIED;
 }
 
+static void zdma_unrealize(DeviceState *dev)
+{
+    XlnxZDMA *s = XLNX_ZDMA(dev);
+
+    address_space_destroy(s->dma_as);
+}
+
 static void zdma_init(Object *obj)
 {
     XlnxZDMA *s = XLNX_ZDMA(obj);
@@ -827,6 +829,7 @@ static void zdma_class_init(ObjectClass *klass, void *data)
 
     dc->reset = zdma_reset;
     dc->realize = zdma_realize;
+    dc->unrealize = zdma_unrealize;
     device_class_set_props(dc, zdma_props);
     dc->vmsd = &vmstate_zdma;
 }
diff --git a/hw/dma/xlnx_csu_dma.c b/hw/dma/xlnx_csu_dma.c
index 0c1c19cab5a..730c0f999ce 100644
--- a/hw/dma/xlnx_csu_dma.c
+++ b/hw/dma/xlnx_csu_dma.c
@@ -648,13 +648,7 @@ static void xlnx_csu_dma_realize(DeviceState *dev, Error **errp)
     s->src_timer = ptimer_init(xlnx_csu_dma_src_timeout_hit,
                                s, PTIMER_POLICY_DEFAULT);
 
-    if (s->dma_mr) {
-        s->dma_as = g_malloc0(sizeof(AddressSpace));
-        address_space_init(s->dma_as, s->dma_mr, NULL);
-    } else {
-        s->dma_as = &address_space_memory;
-    }
-
+    s->dma_as = address_space_create(s->dma_mr ?: get_system_memory(), NULL);
     s->attr = MEMTXATTRS_UNSPECIFIED;
 
     s->r_size_last_word = 0;
@@ -665,6 +659,7 @@ static void xlnx_csu_dma_unrealize(DeviceState *dev)
     XlnxCSUDMA *s = XLNX_CSU_DMA(dev);
 
     ptimer_free(s->src_timer);
+    address_space_destroy(s->dma_as);
 }
 
 static const VMStateDescription vmstate_xlnx_csu_dma = {
-- 
2.31.1


