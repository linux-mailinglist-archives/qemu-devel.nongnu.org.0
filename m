Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D292F4C004E
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 18:44:23 +0100 (CET)
Received: from localhost ([::1]:59292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMZD4-0003lv-Um
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 12:44:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nMZ7V-0003Vl-Pa
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 12:38:37 -0500
Received: from [2a00:1450:4864:20::536] (port=35744
 helo=mail-ed1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nMZ7T-0002mO-Rt
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 12:38:37 -0500
Received: by mail-ed1-x536.google.com with SMTP id bq11so17423130edb.2
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 09:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v+v6TfEZmb9wwuiX3YkPxG5IdVxlkTReFcgd8M252ME=;
 b=gL0hMcdBN8hz7YtN9uApjaH9NflMXfBsOVJngeYQicRnNyhpVq+pusx1vp379aZEYc
 fWKT4rhThPnp1Hq5BRlAr4iacUhrtrZAtqEOJAm+SusJXE0bCPPMmQUqdZCN6Nha6t+F
 NSMB12opEQHAg24QGswiDpaneIkiXMDkP9nQl3tTZUZxBcfRPxJDD/WofnjGc4OUoEYM
 cQRgKfxcFgl1Cg4cpQHazT9Rf5mHtLAeYviFQZSny4VE/up4XRPO0yncMR5lELBx7Ysy
 E2epMKmiLgxbNjbZgvQQfnJKd5snVVlhKX/qqyDoHCiiO9m3MITCiNU8NHBojkVindf5
 lP4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v+v6TfEZmb9wwuiX3YkPxG5IdVxlkTReFcgd8M252ME=;
 b=nUWmQxtwZewIK9A5FE4o1Sq1gbWOV/uxvaEqcUEmSMckSvSF0zQxv6ae4K2GCHZhti
 hEWKfPj4pmF39G5qMZ0GXNEpMOgQurKVBn8yMbMM202eMQg+SN4mCk6bL9Z8+ycgtdBR
 afBBv0pdQQeiMoWB9Q8MyLHzzRSGqQvQLAv0JEHlMhEK6LBPYH1sP2FWa9wN506KHT6O
 k9Lze4ffRoWidHFIQiJQPnitFGRKFZcscOs3trFOCFoj9dxmo+gNoOBEht8toUNBeQM1
 4m3/lNy3iPLrEgH4xPFQqahWUKaW2uxIMNgqqmk3jQ/WzW6ItK5Xf3iOT4JZJmpn4ux9
 EKMQ==
X-Gm-Message-State: AOAM531bT8XFeyucp6gl17JI31utYOlzkes0QeCda6lQRD04ytEP1URt
 fiLXZoIPDHL+BZ5tLjuJ2Vzplt1wyv4=
X-Google-Smtp-Source: ABdhPJwIfUhN9czetpkqoSZb2bYbVkfSGf/mMOMkODcmaHW/WRm6Bf7RM0cpNkIN10XaGS9lEgtUQg==
X-Received: by 2002:aa7:d3d9:0:b0:410:7a81:c0cf with SMTP id
 o25-20020aa7d3d9000000b004107a81c0cfmr27598085edr.177.1645551514535; 
 Tue, 22 Feb 2022 09:38:34 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-089-012-227-088.89.12.pool.telefonica.de. [89.12.227.88])
 by smtp.gmail.com with ESMTPSA id et2sm6449382ejc.101.2022.02.22.09.38.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 09:38:34 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/22] hw/audio/cs4231a: Disuse isa_init_irq()
Date: Tue, 22 Feb 2022 18:38:04 +0100
Message-Id: <20220222173819.76568-8-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222173819.76568-1-shentey@gmail.com>
References: <20220222173819.76568-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::536
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Bernhard Beschow <shentey@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

isa_init_irq() has become a trivial one-line wrapper for isa_get_irq().
Use the original instead such that isa_init_irq() can be removed
eventually.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/audio/cs4231a.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/audio/cs4231a.c b/hw/audio/cs4231a.c
index 7d60ce6f0e..0723e39430 100644
--- a/hw/audio/cs4231a.c
+++ b/hw/audio/cs4231a.c
@@ -677,7 +677,7 @@ static void cs4231a_realizefn (DeviceState *dev, Error **errp)
         return;
     }
 
-    isa_init_irq(d, &s->pic, s->irq);
+    s->pic = isa_get_irq(d, s->irq);
     k = ISADMA_GET_CLASS(s->isa_dma);
     k->register_channel(s->isa_dma, s->dma, cs_dma_read, s);
 
-- 
2.35.1


