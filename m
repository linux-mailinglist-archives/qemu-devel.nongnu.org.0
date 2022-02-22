Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F27D4C025C
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 20:48:59 +0100 (CET)
Received: from localhost ([::1]:48652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMb9e-0003Wt-Bp
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 14:48:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nMawG-0003Lo-9g
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 14:35:10 -0500
Received: from [2a00:1450:4864:20::52c] (port=42685
 helo=mail-ed1-x52c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nMawC-000700-8Y
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 14:35:07 -0500
Received: by mail-ed1-x52c.google.com with SMTP id i11so37726952eda.9
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 11:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rI52xLFwbXQFqfgLnwofbV81YzDkaqrpGEFiKBHgqXU=;
 b=mOUIUCiEMMsAcD0BEzCsieFRqUIjoSf2JGAsZ/P7qlHGyXvUHIPyu41IuRwAKu5eZa
 zONphB1vMrwnonFcxqHkbc6pXho/4L+X4QdoajQ2cAEpAOWs3sH6NdqGPUBjs2R+EX6D
 dREZbMfNznqKtUPaSzK7WHUQd264v1q6OWw0zZ7qXs/h0dBb+qYy8KGZL4tssquWA+sZ
 UKf4VM/2PZG1vSPuoFEfe9+D7/vGgG44hMHqwbCW+erU4sSQkZ3HObNFtIvatBG4UNHn
 YaxrDb7bSXqeZ+rDYEbZ13R1a8G6OSUEa6mKXHOG/e55DJL42I0GR5Eq/tPjQWTx1+Tk
 Nq/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rI52xLFwbXQFqfgLnwofbV81YzDkaqrpGEFiKBHgqXU=;
 b=w46PHDdpWcJLyjG4dARAvamxmG+h0hSDxZZvYHEEM1hkHAUc1PL/zSkNp/cD/AtdH8
 VidAkBnEd2FT6PTtXwsDCrlOtA8KJyaEHfcDjYbL342v4jEV289LyFrrkxv0qVKTDozM
 03VCeI+pM1rVPXQATXs63gTXw/Kf4m9PrU7Sx6ArOsmUDfL+qV9G0boWczVpK8GO3NAI
 WraPUoSzZDOTdiFCKvMOs96oasANOfLg4jXmKPPPxhwOomIWFcZmN9jgzJ3LRFRDFSXz
 YGBvz5cmJA/arM8Fa2vY5jfD7vlpsgpCYYVq7jQ26VIZAdBOsHu9/cuL33r3jvIJ/K6e
 JxGg==
X-Gm-Message-State: AOAM5302LCv/VZSaf9iXKG4tnKqejN6Ydxw4sFNj3ZaJ8JrhwndiRrJ/
 Jyj3sYYmkjLWfVOBHeh4jdot1M1Z3SM=
X-Google-Smtp-Source: ABdhPJxSDSybqQPWqJ0W2d8BoBSB92weJqZJNaGUz2aESf6Am+VH5J4eivOgFUazChJJx/b9TDskwA==
X-Received: by 2002:a05:6402:42ca:b0:408:ed7:b011 with SMTP id
 i10-20020a05640242ca00b004080ed7b011mr27399469edc.6.1645558502983; 
 Tue, 22 Feb 2022 11:35:02 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-089-012-227-088.89.12.pool.telefonica.de. [89.12.227.88])
 by smtp.gmail.com with ESMTPSA id i1sm766532edj.84.2022.02.22.11.35.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 11:35:02 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/22] hw/char/parallel: Disuse isa_init_irq()
Date: Tue, 22 Feb 2022 20:34:35 +0100
Message-Id: <20220222193446.156717-12-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222193446.156717-1-shentey@gmail.com>
References: <20220222193446.156717-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52c.google.com
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


