Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9584C008B
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 18:55:53 +0100 (CET)
Received: from localhost ([::1]:60616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMZOC-0006oX-2S
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 12:55:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nMZ7f-000430-Ph
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 12:38:47 -0500
Received: from [2a00:1450:4864:20::52e] (port=45690
 helo=mail-ed1-x52e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nMZ7d-0002qu-WE
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 12:38:47 -0500
Received: by mail-ed1-x52e.google.com with SMTP id c6so35852006edk.12
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 09:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M0VwRAVUenlZUvRbc1a5N4xtILg9Nv9mnMQHhVnmjwI=;
 b=EODm9VRTFmJtqu+YHzCPHxxH1zwA7u80Zzo0Ku7JtZ+kCQBUbKQ7NO4SIlwc9gHvTb
 HimccB2FeTE4gFLk/jjUR+Cf/N8PE/q2U7N/osbyiCNjGP8AxRxgzeJk0eMnZgraNmnO
 XYUb4ipNVuf38QdgQk+E46sgYYll5SSdFHIeYuyhj3QMgwwpsH4huKrCMSNbz9NrsGiZ
 9+174a46b2fZ9n0OyeOW785HcYAmRq95XzF30RillIbU6YHKL3Esxsx0QpH6hlSH7L96
 mtLfDgH3LcpI/OrFi7eBTvJDZj9lIK9OxcVOP4SrewptaYsRP/FjUSFuUpC9Gv32M6ds
 m57A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M0VwRAVUenlZUvRbc1a5N4xtILg9Nv9mnMQHhVnmjwI=;
 b=fbr43BlxTYrYKfem3K5LlTcaZmlEPOlUO6s32EqYtXT4b9Ajx0siEvnjZITFmHSQvH
 FGy88Vu8dEhUgCqsABJB7wCVURLfmdAucK8TbYNmEw3xhGjvhVe1RWMKdA5Uuqk3BrTh
 ooouGh0MdWpeSarMbZBw1V45J4sdQbtKqdM/lWb+stdpdp9mB9P8lIA28dVH3zHL8Y25
 NJur/YlrzGmQwYTx7y7KShUW3aq3bc3roAFoJe6Ae+ewuGOx44CIxQMo2XW4LiVkASts
 lYbhttFrMpWpL2qpclVn2jRoAIpAxDauqH0NeqHwNf/rBsSK1u+uGLEsxMdGfpZuZ2wv
 /nsg==
X-Gm-Message-State: AOAM531nl9PfZmi/KrCByK2E+EFN1JBKZwX30SI9BvRvxckmJHKi6f8I
 LhlrIeZLL639x7P0kz+4o/H+Sybgd5Q=
X-Google-Smtp-Source: ABdhPJw0j/+5hsq2wmH7/CQSo0rNPfXFDeWBUo7fOu50ztZ6gvZ/f6C+IP3C6OONEgi7F9yWepsenQ==
X-Received: by 2002:a50:9f8b:0:b0:413:2dbd:8793 with SMTP id
 c11-20020a509f8b000000b004132dbd8793mr636533edf.39.1645551524734; 
 Tue, 22 Feb 2022 09:38:44 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-089-012-227-088.89.12.pool.telefonica.de. [89.12.227.88])
 by smtp.gmail.com with ESMTPSA id et2sm6449382ejc.101.2022.02.22.09.38.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 09:38:44 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 18/22] hw/net/ne2000-isa: Disuse isa_init_irq()
Date: Tue, 22 Feb 2022 18:38:15 +0100
Message-Id: <20220222173819.76568-19-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222173819.76568-1-shentey@gmail.com>
References: <20220222173819.76568-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52e.google.com
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
Cc: Jason Wang <jasowang@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

isa_init_irq() has become a trivial one-line wrapper for isa_get_irq().
Use the original instead such that isa_init_irq() can be removed
eventually.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/net/ne2000-isa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/ne2000-isa.c b/hw/net/ne2000-isa.c
index dd6f6e34d3..6ced6775ff 100644
--- a/hw/net/ne2000-isa.c
+++ b/hw/net/ne2000-isa.c
@@ -68,7 +68,7 @@ static void isa_ne2000_realizefn(DeviceState *dev, Error **errp)
     ne2000_setup_io(s, DEVICE(isadev), 0x20);
     isa_register_ioport(isadev, &s->io, isa->iobase);
 
-    isa_init_irq(isadev, &s->irq, isa->isairq);
+    s->irq = isa_get_irq(isadev, isa->isairq);
 
     qemu_macaddr_default_if_unset(&s->c.macaddr);
     ne2000_reset(s);
-- 
2.35.1


