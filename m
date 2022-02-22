Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 790B34C0285
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 20:56:37 +0100 (CET)
Received: from localhost ([::1]:38024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMbH2-0006wZ-JJ
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 14:56:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nMawJ-0003Oe-No
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 14:35:13 -0500
Received: from [2a00:1450:4864:20::635] (port=46955
 helo=mail-ej1-x635.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nMawH-000748-Jp
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 14:35:11 -0500
Received: by mail-ej1-x635.google.com with SMTP id qx21so45966154ejb.13
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 11:35:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/3j29R7lXMdrMKGnt5++sE1+VglPHaZYEgL5oGNi9kU=;
 b=G5ps2Ug6i1TeGmXMFb8EWZksfkoK1GrvrS8E/LRDGfIJxJTAMmW9fLvBk+n4FsEqcG
 Y6IoG9fwJEti3tJAVaK/pEXNquWgColYeGyAO3R63b2/dqU5KnLwZ9W3kRSBy8tITPLQ
 B8VqQj+pNbNtXmY3wIW4l8QK8whMnuSCyeLs+ojmTf09qM84ArNA5QsNbbtt+BwloD6z
 dHjRCjUVBSJaGzKIPJ3uanZZRTc1PQ1ULE9WmZEyjFcBtRdhW5k030WYM8VqdrqB2yIz
 fFrKIvb9Q6RQXeeNumMkHTwDNhGd6Hq7KcnWxX3GxVccDhFIUFY1q4Lq16hy9xKoksEG
 isXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/3j29R7lXMdrMKGnt5++sE1+VglPHaZYEgL5oGNi9kU=;
 b=ML08XVATSmsaKgT/xCABFgjG8MpGPUFgeMEbV+Q3PxC1URzszbEdsRk0euZtPMkgGw
 /srB7ZyG19PGsmzN51PrFk/DlMIFZGL4+sJh9vVqNpHfUjD5UGq0OwIhx5f24e0CUqy/
 5iHWJYmC26k8kYVKAXnS+mHw10//6TlHsDlKE6E8LgMIZ9HoMReCXMpGQ9Ds0mp0fmKA
 Q434ekbzafDjwV1b2zeA1eoqannsgVScT2kWsinHrUfzoits6mRTzdtIGZOXBhF4FYAT
 07da1aT1FpJWOp2zZdMvMOWLWmYfMdwkvVgBejSA1WSVPilZE/Yo0RWC7OsDf+9khzb0
 NMEw==
X-Gm-Message-State: AOAM531Go7N3t36j0ceyCZ4KI/XJLVhGjlG7dBnpN0GKVpKq2vxuocZB
 zQZvEFQWPtp9kN+OkT7vKJ6HHG4l7Uk=
X-Google-Smtp-Source: ABdhPJxX00lVbOpHzuMj79FIFA74Uty8nc1peB1bt72w7qzk219EdisjBdSnM8GPePlDSSw5uZCrvg==
X-Received: by 2002:a17:906:364d:b0:6cd:9109:cfd4 with SMTP id
 r13-20020a170906364d00b006cd9109cfd4mr20402697ejb.198.1645558508242; 
 Tue, 22 Feb 2022 11:35:08 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-089-012-227-088.89.12.pool.telefonica.de. [89.12.227.88])
 by smtp.gmail.com with ESMTPSA id i1sm766532edj.84.2022.02.22.11.35.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 11:35:07 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 17/22] hw/isa/piix4: Disuse isa_init_irq()
Date: Tue, 22 Feb 2022 20:34:41 +0100
Message-Id: <20220222193446.156717-18-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222193446.156717-1-shentey@gmail.com>
References: <20220222193446.156717-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::635
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x635.google.com
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
Cc: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

isa_init_irq() has become a trivial one-line wrapper for isa_get_irq().
Use the original instead such that isa_init_irq() can be removed
eventually.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/piix4.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index cb291d121c..0fd6756dcf 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -197,7 +197,7 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
     if (!qdev_realize(DEVICE(&s->rtc), BUS(isa_bus), errp)) {
         return;
     }
-    isa_init_irq(ISA_DEVICE(&s->rtc), &s->rtc.irq, s->rtc.isairq);
+    s->rtc.irq = isa_get_irq(ISA_DEVICE(&s->rtc), s->rtc.isairq);
 
     piix4_dev = dev;
 }
-- 
2.35.1


