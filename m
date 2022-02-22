Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 922044C0054
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 18:48:23 +0100 (CET)
Received: from localhost ([::1]:40718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMZGw-0001s6-MH
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 12:48:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nMZ7a-0003lR-Cm
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 12:38:42 -0500
Received: from [2a00:1450:4864:20::533] (port=36584
 helo=mail-ed1-x533.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nMZ7Y-0002oO-Hk
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 12:38:42 -0500
Received: by mail-ed1-x533.google.com with SMTP id cm8so29134216edb.3
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 09:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Khkty+gm2SXPwPmKhEricJRnhM6YQl7su7I42HaaWvw=;
 b=HFxhnd1p4AsycSYUs3/DJDEtXdJysjcru6fGYwv/20+1UVJPQaDCWghYFn/ndqzM25
 RjYbwangGHtPKq5qszfkbuFCcJcZrmCwjMMGvacrRDkASkkfDiRJvFCLRpYHZaH38jAL
 drLYRJo4HPBfoEIZ+MVe3CuDN9JxFE7PTvDSut4ZAavIoOrp4CK4gBfMiWp75cyTwPHU
 GPOvZamPWEmrrduuP2UW9BNsuYj6MOPKrqgK3FryEveuVvjUHdIdmYSn6UmE4I+4XaZk
 wb26NGVy1fyHNXPEjlw3I4X+U5rzJW3xC+5ruGNquxYs/tNtrRZg5Bl5wpgXVecZ/FKY
 DtIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Khkty+gm2SXPwPmKhEricJRnhM6YQl7su7I42HaaWvw=;
 b=wW/dQFMw8B64nMGNfthRJ634SiD0TReb7vBSti8h0TYqrZyxM2ktGdSzHk4lcHwBuQ
 aQPC+Bw2CLQsKFQxsA1cns32eiZgQR9iLzJxZzEh7IuNKE3zXdgCE90+UPs3KsTDRBxz
 wg2P43t/WSjLX1LW4jwcKLkSieBPdJJoS0MffEEVH3WsfK94UOIW8ZFPmLD+0vjuL8RT
 NXZmS82XvfpLFHk9RJOIpuPvMVkBAFHLvB06K8PSCQNRRXnAF2KIx67HJxWAZXq9PCKz
 GrORcMsLIVU68HnkyxeVh1iPDhIs+SyVgaKaLkbe0+3gdSq4gdj0QVQ+6Nvjhm21q6eS
 rPqQ==
X-Gm-Message-State: AOAM5337/kG4zyRS2c1w77FLo1NPnAYNYrFtteow2dFgLFn0Q7quoc8t
 wvkoVf5bOB+IiVTr5t72wJJDjowRSok=
X-Google-Smtp-Source: ABdhPJzN6lOORyiNJANZ3qtuRnL1kcs/8gKEASez26JxDk7xqULbYd5kuq2e8GSHrVESB1O2Xq18rg==
X-Received: by 2002:aa7:d74d:0:b0:410:b60a:c37e with SMTP id
 a13-20020aa7d74d000000b00410b60ac37emr27215655eds.330.1645551519176; 
 Tue, 22 Feb 2022 09:38:39 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-089-012-227-088.89.12.pool.telefonica.de. [89.12.227.88])
 by smtp.gmail.com with ESMTPSA id et2sm6449382ejc.101.2022.02.22.09.38.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 09:38:38 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/22] hw/char/serial-isa: Disuse isa_init_irq()
Date: Tue, 22 Feb 2022 18:38:09 +0100
Message-Id: <20220222173819.76568-13-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222173819.76568-1-shentey@gmail.com>
References: <20220222173819.76568-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::533
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x533.google.com
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
 hw/char/serial-isa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/char/serial-isa.c b/hw/char/serial-isa.c
index 1b8b303079..7a7ed239cd 100644
--- a/hw/char/serial-isa.c
+++ b/hw/char/serial-isa.c
@@ -75,7 +75,7 @@ static void serial_isa_realizefn(DeviceState *dev, Error **errp)
     }
     index++;
 
-    isa_init_irq(isadev, &s->irq, isa->isairq);
+    s->irq = isa_get_irq(isadev, isa->isairq);
     qdev_realize(DEVICE(s), NULL, errp);
     qdev_set_legacy_instance_id(dev, isa->iobase, 3);
 
-- 
2.35.1


