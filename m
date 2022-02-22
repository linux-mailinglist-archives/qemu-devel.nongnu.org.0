Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 010594C0293
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 20:59:01 +0100 (CET)
Received: from localhost ([::1]:46128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMbJM-00040N-1U
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 14:59:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nMawG-0003Ls-MP; Tue, 22 Feb 2022 14:35:10 -0500
Received: from [2a00:1450:4864:20::536] (port=36400
 helo=mail-ed1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nMawE-00072y-Sm; Tue, 22 Feb 2022 14:35:08 -0500
Received: by mail-ed1-x536.google.com with SMTP id cm8so29845879edb.3;
 Tue, 22 Feb 2022 11:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hODc348sDBOJP+v8u2lpOm8duN5QJTp75AGojk1OzEo=;
 b=iMQ+2BebXmeemEq7qYIKlZTSSYQ7ibxs9dpG0JSQHqczMmvEm160B4VsCyWLW35cN5
 c/6mcC6rVDpZZ4jRGycsh1Guh74D/WmERxCCbC5IJS3bywPxSLNqhoq5uVWKURJ7lKZU
 MGHb4ydnerJ8q20DwBBCMRXPsDt31ZH32PIdeSaUv7FTfTXtD5p+pVsCfo6kyh2I0bvK
 EDi31242+RYcEV4a3xMyuNeYbg3/xygdN5cABkxOiHKyJ2Wc5FSX5hBNl3PTfkI4GDcn
 FjNoAAt5sZNtlrega2BRo23rcY9yB1q7UabJPsaGgt6Yx7oTWYKIXDBkQi83TH//x/c5
 Q1Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hODc348sDBOJP+v8u2lpOm8duN5QJTp75AGojk1OzEo=;
 b=YnWNKjT9drkUQODOEjOFuoruTMBmqUYgClfXDoz/HfV+W8hVmvpBqbDmzLtkO8NIYK
 0vKtrtNMAcJWUvkhAFZmhtzkXf1YloHcyY3Vjzdht0H8Z7c83YQ2wLO6kD940YH28bfD
 uDe+6b5vqju+6rgIwIsu3NeQJBgripIn6mgiec18EhAJA6shdR1ok0l+aeBjszemqHKc
 nU+CTq7+QZxHJmiagaimyMqn98no8YqhYbZAhr3qlRUT3FQk3gxFpdxG3AvMRGgCjrir
 JJh2RsXnvgicHFvYKGELv6is+nZQJdfn2YZEOLIpBnD8WHbPy4aa8uNTYx+dvESqD1xU
 vdcQ==
X-Gm-Message-State: AOAM530gTZ4Y7nkIu6Ba/SheufFie+o+1PYc9L6wgCiGGPIt0imTqFvn
 zyQmFxDIybzdE0xKpc5r/xjs5adM9m0=
X-Google-Smtp-Source: ABdhPJwbNwRzvuhOb0L0xwQl6k/tXWKcXJ0wj11YPwO/kBPA75Z3Yv040O0FJ+Rc6ZzVyjlW9YAE/w==
X-Received: by 2002:a50:c048:0:b0:410:a2e6:eb66 with SMTP id
 u8-20020a50c048000000b00410a2e6eb66mr28586520edd.156.1645558504825; 
 Tue, 22 Feb 2022 11:35:04 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-089-012-227-088.89.12.pool.telefonica.de. [89.12.227.88])
 by smtp.gmail.com with ESMTPSA id i1sm766532edj.84.2022.02.22.11.35.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 11:35:04 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 13/22] hw/ide/isa: Disuse isa_init_irq()
Date: Tue, 22 Feb 2022 20:34:37 +0100
Message-Id: <20220222193446.156717-14-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222193446.156717-1-shentey@gmail.com>
References: <20220222193446.156717-1-shentey@gmail.com>
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
Cc: John Snow <jsnow@redhat.com>, Bernhard Beschow <shentey@gmail.com>,
 "open list:IDE" <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

isa_init_irq() has become a trivial one-line wrapper for isa_get_irq().
Use the original instead such that isa_init_irq() can be removed
eventually.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/ide/isa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ide/isa.c b/hw/ide/isa.c
index 24bbde24c2..8bedbd13f1 100644
--- a/hw/ide/isa.c
+++ b/hw/ide/isa.c
@@ -75,7 +75,7 @@ static void isa_ide_realizefn(DeviceState *dev, Error **errp)
 
     ide_bus_init(&s->bus, sizeof(s->bus), dev, 0, 2);
     ide_init_ioport(&s->bus, isadev, s->iobase, s->iobase2);
-    isa_init_irq(isadev, &s->irq, s->isairq);
+    s->irq = isa_get_irq(isadev, s->isairq);
     ide_init2(&s->bus, s->irq);
     vmstate_register(VMSTATE_IF(dev), 0, &vmstate_ide_isa, s);
     ide_register_restart_cb(&s->bus);
-- 
2.35.1


