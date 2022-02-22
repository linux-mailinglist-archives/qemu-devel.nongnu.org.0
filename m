Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 806804C0235
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 20:45:44 +0100 (CET)
Received: from localhost ([::1]:39892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMb6V-00062M-IC
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 14:45:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nMawI-0003Lu-4O
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 14:35:10 -0500
Received: from [2a00:1450:4864:20::629] (port=39819
 helo=mail-ej1-x629.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nMawG-00073Y-1a
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 14:35:09 -0500
Received: by mail-ej1-x629.google.com with SMTP id p9so46083204ejd.6
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 11:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OuZTr6rv/jwpyEGm5IkqFfaSg0z98+rElW1EZeduKOw=;
 b=Ldp8N4v/GKXxR7vQZVjhCstjMJQD7xmPWyoxedQRYNfQca18lFgizP6nh09CY4PT1w
 DyUP5oKMltrVHyS4Vfn0TOcmZ74NSD2mqWy7QlrzKdV1r8uqEpwEt1wvDFdpgXtrzA0W
 TJOrUM9iFNFtXXGW65oUfgkte1Bh1YiHSpnqsvamRtuTZDoofJVIG0FVUm7zr1vs4n+R
 TOvOwgQOUuEsYCm8oM15N5PgfM1YKCm2sQKLk3S5hi3UkRMjs5ieoHb5AmSdIBpKF0yo
 aZ8cCO9YFz05JcJB1TMYYAK7DTWsRG/KDuCiHXUdmezZsy5qF88VBgoUwak2OGqjfRi3
 41Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OuZTr6rv/jwpyEGm5IkqFfaSg0z98+rElW1EZeduKOw=;
 b=ulfxuoVl7WRJqVfnNN5MIrhJDp/fQyBbQXExOWElHX3avLxVzd1uhwmevcxI07hw67
 Vpto6xFhtxC/gQLtar0Qp2b6U09MYfNjf/BP61jxQMnv2uVsevDzqH5VL59ZObNMTCKM
 DjNylAhCfv+X052QMZuAwe3PBZ+a1cGvbLyDdBCBEWBHBZOZsnGjiWCG2ZnHFnIr7S6r
 jeGyr0VppwIC93PUHqL/F+IFIvukqo0NnYHF8AWPQhb7KaE+mrJZjLtCM062Bnsp9+l0
 i+PQjTtsA/bthC38S/zIEbmb/qKGY1lkjEf3UFCYeMnZIlfTYGLkUKp5hDrNjiauMKgO
 QJHQ==
X-Gm-Message-State: AOAM530zYLTpHIc+3iYNWCsjy5ppCusNK5e1LunU7Z8Q2+sVeLkwdEJo
 deqfAkVkkDO91LCO29iuLfxkGuVkJjA=
X-Google-Smtp-Source: ABdhPJyx8ZhDm9qiouh5Gsxu2ZPwqYIR5Es3kIt1I8cuIPlalUo+mQnmZt+ciBO7yFOGj04BTWJ4WA==
X-Received: by 2002:a17:906:af79:b0:6cf:6b3f:5b3b with SMTP id
 os25-20020a170906af7900b006cf6b3f5b3bmr20698798ejb.14.1645558506494; 
 Tue, 22 Feb 2022 11:35:06 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-089-012-227-088.89.12.pool.telefonica.de. [89.12.227.88])
 by smtp.gmail.com with ESMTPSA id i1sm766532edj.84.2022.02.22.11.35.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 11:35:06 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 15/22] hw/ipmi/isa_ipmi_bt: Disuse isa_init_irq()
Date: Tue, 22 Feb 2022 20:34:39 +0100
Message-Id: <20220222193446.156717-16-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222193446.156717-1-shentey@gmail.com>
References: <20220222193446.156717-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::629
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x629.google.com
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
Cc: Bernhard Beschow <shentey@gmail.com>, Corey Minyard <minyard@acm.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

isa_init_irq() has become a trivial one-line wrapper for isa_get_irq().
Use the original instead such that isa_init_irq() can be removed
eventually.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/ipmi/isa_ipmi_bt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ipmi/isa_ipmi_bt.c b/hw/ipmi/isa_ipmi_bt.c
index 02625eb94e..88aa734e9e 100644
--- a/hw/ipmi/isa_ipmi_bt.c
+++ b/hw/ipmi/isa_ipmi_bt.c
@@ -92,7 +92,7 @@ static void isa_ipmi_bt_realize(DeviceState *dev, Error **errp)
     }
 
     if (iib->isairq > 0) {
-        isa_init_irq(isadev, &iib->irq, iib->isairq);
+        iib->irq = isa_get_irq(isadev, iib->isairq);
         iib->bt.use_irq = 1;
         iib->bt.raise_irq = isa_ipmi_bt_raise_irq;
         iib->bt.lower_irq = isa_ipmi_bt_lower_irq;
-- 
2.35.1


