Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E79AE3143C5
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 00:29:42 +0100 (CET)
Received: from localhost ([::1]:45190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9FyP-0006yO-Tt
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 18:29:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCt-0003jR-Jp
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:24:19 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:36806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCp-0006Nb-9x
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:24:16 -0500
Received: by mail-wr1-x42d.google.com with SMTP id u14so18423752wri.3
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 10:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I2Aph69adGLflQzOi00r3lbWRxRLJVNf2GcXimWPXvU=;
 b=NDaD1VG6ilh1S+I8WCxrGpQQMaii2+qUXEE2DdKTMicN9jIMvZ2LKw14g3VL0swj2/
 lytrgeStxTcGFc9H81CcPQ1fp3Xlu7uh1BFiC0x6ZzCTEcAfd9MwuX7YsI6HVRRiOtQx
 Jneu5GdIkH47vl5WUVqOUciGOceZGj9K1FTMaoQXr6vBzQBcaOQqX9KW16tNsqfKeqha
 XvMFiIKpqUh9fZYtVq99JLkvsm2AsVNBtmn6csvClLZI9h67fhSCXbqFElGe8Il9p9jh
 6Nxf6bIhwwc+HdytOWVL1nA5NQWhiKi01tYj3lMThjooiRFgS8CSFZdSLVEciTQyGB5+
 Yegw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=I2Aph69adGLflQzOi00r3lbWRxRLJVNf2GcXimWPXvU=;
 b=EoVPF50v/YCIvY57gU5y2kTNSdzI/Ku+m1jvx9QGxVTtd7zCSnZtkwoa5fXBwMKvjT
 kQq+s6diEQ6nvag3AH/or+dRxLR7nDofT5bMkkeKd3bapbvzrgYbThSESsVAlk8FKU9t
 idZrguFGr7UmQFhNkv4kAkWThCIZo6LQHDgrGjqEvZv6SKRdQeZlR3ovVLMdjFEhuo/W
 rf8HfSZmQQjKPffSTM4g46ZDBZYSS94SyprqrPw73hBsgt2AK8ZPr3LXfsWEepDXllfy
 5G+9AV7jI45eEiam6wZJcews6vUOfF6wfxNA/01+mEruyFjUArz9e9NKYMgrwUwxb0mj
 8rzA==
X-Gm-Message-State: AOAM533tQJsP/rGsBp6SEjuCre1rYMs+TvOiEvc/jKtrgBzxP0nTYikh
 rFHd/k12mhLYa42Zba5QqAB3UVOCMymixA==
X-Google-Smtp-Source: ABdhPJwZN8zLSBj5SGcZYcsa0/lwTSGBQ/F8XohP0fNFg9Pp3gdNI/IwNZP8/a/n+2lE3US9bfyzsw==
X-Received: by 2002:a05:6000:1806:: with SMTP id
 m6mr12811676wrh.320.1612808651363; 
 Mon, 08 Feb 2021 10:24:11 -0800 (PST)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 x22sm19670wmc.25.2021.02.08.10.24.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 10:24:10 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 40/46] prep: add ppc-parity write method
Date: Mon,  8 Feb 2021 19:23:25 +0100
Message-Id: <20210208182331.58897-41-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210208182331.58897-1-pbonzini@redhat.com>
References: <20210208182331.58897-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Lei Sun <slei.casper@gmail.com>, Li Qiang <liq3ea@gmail.com>,
 Prasad J Pandit <pjp@fedoraproject.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Prasad J Pandit <pjp@fedoraproject.org>

Add ppc-parity mmio write method to avoid NULL pointer dereference
issue.

Reported-by: Lei Sun <slei.casper@gmail.com>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
Reviewed-by: Li Qiang <liq3ea@gmail.com>
Message-Id: <20200811114133.672647-5-ppandit@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/ppc/prep_systemio.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/ppc/prep_systemio.c b/hw/ppc/prep_systemio.c
index 4e48ef245c..b2bd783248 100644
--- a/hw/ppc/prep_systemio.c
+++ b/hw/ppc/prep_systemio.c
@@ -23,6 +23,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "hw/irq.h"
 #include "hw/isa/isa.h"
 #include "hw/qdev-properties.h"
@@ -235,8 +236,15 @@ static uint64_t ppc_parity_error_readl(void *opaque, hwaddr addr,
     return val;
 }
 
+static void ppc_parity_error_writel(void *opaque, hwaddr addr,
+                                    uint64_t data, unsigned size)
+{
+    qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid access\n", __func__);
+}
+
 static const MemoryRegionOps ppc_parity_error_ops = {
     .read = ppc_parity_error_readl,
+    .write = ppc_parity_error_writel,
     .valid = {
         .min_access_size = 4,
         .max_access_size = 4,
-- 
2.29.2



