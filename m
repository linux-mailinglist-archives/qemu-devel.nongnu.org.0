Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 216C94C0050
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 18:45:42 +0100 (CET)
Received: from localhost ([::1]:34978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMZEL-0006M7-6L
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 12:45:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nMZ7Z-0003gF-8B
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 12:38:41 -0500
Received: from [2a00:1450:4864:20::52a] (port=35734
 helo=mail-ed1-x52a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nMZ7X-0002nh-MW
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 12:38:40 -0500
Received: by mail-ed1-x52a.google.com with SMTP id bq11so17423567edb.2
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 09:38:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rI52xLFwbXQFqfgLnwofbV81YzDkaqrpGEFiKBHgqXU=;
 b=NvMTiL36NeZE22a/XFbZwuX//IEAFtbzEkS+J0bPvuOMZGgNwpdJVQdJ+jU85mRcub
 /kQICb5vfd7iVu3FrCfJkWB7kwqGNr2V+rCxczcW9D0khLdmAH9nQReNL7ob/j+J4lU2
 CzWRkSPX+3DO6LX/hxI2QntYpyBaAGfMmnFlw+QU9J4NJlY1xasFbJI4d7mby30Ec2eU
 SuqFRbGuxo7fuwVU3m9bIhTVdMj2/Us8INBRjJ3j2dGUTMo0UkcoZrLlqyP0cWnm/QMP
 mQfulTZM6ULTy4hXQIyWop0Vf9MZJI7ejdHOQ1r5lvncdATA2poPbah7ll7WefOPVfkv
 XUpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rI52xLFwbXQFqfgLnwofbV81YzDkaqrpGEFiKBHgqXU=;
 b=sg20j7zM5ia22bZKIwUadCEpwVwn09d8xaS8p6zjVuxqsGc+4gygFhndq7Qu0Mu6NC
 SbsOi6I9YN6zbQmXsjQktCbasgIIEYmJFksAEFiI/tb/Hb2yHt2s08yV5qf5pNUEzc53
 rberN2npAZT+k63yzJ8f0YLgEyCBz9I9swguEJGylfQDRpgIWoEUrdj32IXwCiPlGPfY
 ah9rNUuz0Wm8daYK0JY02JKHwxiN8P2je2iLCNC4Kb/k78bG62Xk8nNk1BBc44OKyaV7
 qbmWnx1zMU8Gdj/3qsuF6A88LUNeuuHCFa8GIhrXhMTUgIv/1Ht/EKBlpMUUaClNp573
 k+IQ==
X-Gm-Message-State: AOAM533kLFvDvli20DMtf/o5rR3DRKJV3BC+3ixT6suKot5zxPnfD7Yh
 aoieH4mIRhN71vIMit/Fs+J32DETqlE=
X-Google-Smtp-Source: ABdhPJz+nEuGl/nS4S5Drbo/gTliyIO8a6yfusMxCJ1dDBGGVF0KLlPhb1DXz8coJSWtnrmtphKP4g==
X-Received: by 2002:a05:6402:1e8c:b0:411:7180:7dfc with SMTP id
 f12-20020a0564021e8c00b0041171807dfcmr27869257edf.74.1645551518210; 
 Tue, 22 Feb 2022 09:38:38 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-089-012-227-088.89.12.pool.telefonica.de. [89.12.227.88])
 by smtp.gmail.com with ESMTPSA id et2sm6449382ejc.101.2022.02.22.09.38.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 09:38:37 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/22] hw/char/parallel: Disuse isa_init_irq()
Date: Tue, 22 Feb 2022 18:38:08 +0100
Message-Id: <20220222173819.76568-12-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222173819.76568-1-shentey@gmail.com>
References: <20220222173819.76568-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52a.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

isa_init_irq() has become a trivial one-line wrapper for isa_get_irq().
Use the original instead such that isa_init_irq() can be removed
eventually.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/char/parallel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/char/parallel.c b/hw/char/parallel.c
index b45e67bfbb..adb9bd9be3 100644
--- a/hw/char/parallel.c
+++ b/hw/char/parallel.c
@@ -553,7 +553,7 @@ static void parallel_isa_realizefn(DeviceState *dev, Error **errp)
     index++;
 
     base = isa->iobase;
-    isa_init_irq(isadev, &s->irq, isa->isairq);
+    s->irq = isa_get_irq(isadev, isa->isairq);
     qemu_register_reset(parallel_reset, s);
 
     qemu_chr_fe_set_handlers(&s->chr, parallel_can_receive, NULL,
-- 
2.35.1


