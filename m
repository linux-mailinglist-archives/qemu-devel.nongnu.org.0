Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9859F32BA2E
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 20:22:05 +0100 (CET)
Received: from localhost ([::1]:50044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHX4O-0008Tb-Lw
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 14:22:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHWvh-0000bS-1J
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 14:13:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHWvf-000741-8k
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 14:13:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614798782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BuH4+Q0BM50iRTQU72DhaJAvYxJTYB/CnCHI67AXPbc=;
 b=XLGM4Usd/UJu0ikT9KrijgGyQyEQjg4JJssGc//FuEqx3vvG+lxlhFva8lZ891kwXKDFOe
 yg586oyeUinkNHG55+Jo1/Mi7btA/FqqOL6wwpzVxRXsIiteqhn3zfu4SGXpvECj5INIdQ
 3vtggc9MYhkoSGpR2VcheCGzpo0numo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-yfklY0mVNeShX1N9lYzklg-1; Wed, 03 Mar 2021 14:13:01 -0500
X-MC-Unique: yfklY0mVNeShX1N9lYzklg-1
Received: by mail-wr1-f69.google.com with SMTP id g5so13155501wrd.22
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 11:13:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BuH4+Q0BM50iRTQU72DhaJAvYxJTYB/CnCHI67AXPbc=;
 b=nN/FIiEfXcDfkZcPOBviABkHw/D/80Gof89c9QYVQU+DkQNSnPim0pIawD+jXKa8QD
 bWemHwwGzISGF/ZahjX3/ONw3GJee21LUrCkAqNCQD1TP9rQsee5EbaZkA8q6F23cVZ+
 tvzwIqjZIavd7udN2Fkh0qgiEMMJngiWnkcoA5xU9cbbIPY3VhhE7cE9ZfIkPZE+gwUY
 g++V4hm/L09q2+Gh2k/sphxl5MXztIrWdPD5U0gnUxEp1jocFUE70KGnWPM7T4VTQiBx
 L7sVSrZTE4drvs3H0kvJ13Hh29UjVnfqWNEuhGOT40NWM+pZsEwJucFiq0ql2PlKIyvm
 jKtg==
X-Gm-Message-State: AOAM533kQUUcfdjn1Dm5Y0T6sIDVY4CE96HT07Qz2cqi9TEy7OxriIaw
 hsSsNo9hyOGZjb1Der/ep3Fe7rai0qrWZO49o2skgdJF6Lerc7wHcvIGBuc6OjDbOTQH6DMtiEP
 PLegOEj6blj/u4JoljhFChJcgwdemkav+QVPrU3eIX/yAqH3VxZNdaPRMO8mJiclE
X-Received: by 2002:a05:6000:18a:: with SMTP id
 p10mr224949wrx.166.1614798779314; 
 Wed, 03 Mar 2021 11:12:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzWtN2TXiNu/ZWiYkxV34OkYRiF1Vbunrzq6zARCVyP8COfaatgOcglggtfP1H3F9F4efQC9A==
X-Received: by 2002:a05:6000:18a:: with SMTP id
 p10mr224930wrx.166.1614798779180; 
 Wed, 03 Mar 2021 11:12:59 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id v5sm6812810wmh.2.2021.03.03.11.12.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 11:12:58 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 10/10] hw/net: sunhme: Remove the logic of padding
 short frames in the receive path
Date: Wed,  3 Mar 2021 20:12:05 +0100
Message-Id: <20210303191205.1656980-11-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210303191205.1656980-1-philmd@redhat.com>
References: <20210303191205.1656980-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Now that we have implemented unified short frames padding in the
QEMU networking codes, remove the same logic in the NIC codes.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Message-Id: <1614763306-18026-10-git-send-email-bmeng.cn@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/net/sunhme.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/hw/net/sunhme.c b/hw/net/sunhme.c
index fc34905f875..6971796e575 100644
--- a/hw/net/sunhme.c
+++ b/hw/net/sunhme.c
@@ -714,8 +714,6 @@ static inline void sunhme_set_rx_ring_nr(SunHMEState *s, int i)
     s->erxregs[HME_ERXI_RING >> 2] = ring;
 }
 
-#define MIN_BUF_SIZE 60
-
 static ssize_t sunhme_receive(NetClientState *nc, const uint8_t *buf,
                               size_t size)
 {
@@ -724,7 +722,6 @@ static ssize_t sunhme_receive(NetClientState *nc, const uint8_t *buf,
     dma_addr_t rb, addr;
     uint32_t intstatus, status, buffer, buffersize, sum;
     uint16_t csum;
-    uint8_t buf1[60];
     int nr, cr, len, rxoffset, csum_offset;
 
     trace_sunhme_rx_incoming(size);
@@ -775,14 +772,6 @@ static ssize_t sunhme_receive(NetClientState *nc, const uint8_t *buf,
 
     trace_sunhme_rx_filter_accept();
 
-    /* If too small buffer, then expand it */
-    if (size < MIN_BUF_SIZE) {
-        memcpy(buf1, buf, size);
-        memset(buf1 + size, 0, MIN_BUF_SIZE - size);
-        buf = buf1;
-        size = MIN_BUF_SIZE;
-    }
-
     rb = s->erxregs[HME_ERXI_RING >> 2] & HME_ERXI_RING_ADDR;
     nr = sunhme_get_rx_ring_count(s);
     cr = sunhme_get_rx_ring_nr(s);
-- 
2.26.2


