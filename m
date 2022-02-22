Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A294C0279
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 20:53:47 +0100 (CET)
Received: from localhost ([::1]:33516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMbEI-0003vb-A5
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 14:53:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nMawG-0003Lp-B9
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 14:35:10 -0500
Received: from [2a00:1450:4864:20::52a] (port=33765
 helo=mail-ed1-x52a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nMawD-00072f-Ts
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 14:35:08 -0500
Received: by mail-ed1-x52a.google.com with SMTP id s14so22067994edw.0
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 11:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Khkty+gm2SXPwPmKhEricJRnhM6YQl7su7I42HaaWvw=;
 b=i7kP2WMZQ5qeunfhUVkU1qhSky1tF//XW+Qpm9fpLqxZt5UKlTo2K0EIDBVL9t8zEk
 GYVzKla5hdWGPRCdbI0xCUt748ctLp2bpz6jY9QsGNwtnXDsKjbMDJyUayXVBBvjnhnp
 xYqM3is5gBPIKXfTAx+qhw/YsQb66JizcAZF8dcaGNbVDV8s1u2TbLafWyiwnCiaLD8y
 b1JFme3pb22YylmcMM+OxSrNFxMRtlD1bEW5xA2QIFY1+/jDyL5puSTyvN7DvfGoANTf
 1Qukm3kpGaEwBYMtCnKdPxoHqD2AyMZypKlzYg5MByIImSZbrubrQj/R0GF4uN95pAcL
 A9iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Khkty+gm2SXPwPmKhEricJRnhM6YQl7su7I42HaaWvw=;
 b=kOZqWGF0U15Mo9gyKbIlGYPXtBY//7IlGSdNPbny5CfdEBe98ikjMTtJszSaNtnVg6
 YCYv6sTKVk/+xmKK2LLLFSAQreeaogUwtrQNd3YgoMuq9BeAhpQPk13reoWlPtGviyqX
 Grz/qgCHHLT8XFKWSWtAn8Y6qKhJmcU3r3d4O13OKeQHWfl6h/NHQzcL8SWO47NaatOr
 Zkz4pEdCzLU3+UjZAvxwBfDSyIUztAf0MvneYzgxl0ZXGgKeiSf9EOVZaWTL3ZY4LAW2
 4zmhGJVuU5Lkg/vpneIFhHMX16523FY0vor+XuQHrdggcsXSxuK3f+zljC+fZp2W1d25
 QtwA==
X-Gm-Message-State: AOAM533nKBWRwt2lnsV7z8togB8MzueTMBOalioUOr+LeYtnJbPZB1MG
 xfwUFEaHJVv3rWxG6jom+HW/2sLflDI=
X-Google-Smtp-Source: ABdhPJy37CyAwLD7Gk8bIxmi7g7VS4tIs1qOrxWdZyeHEU0PxDlu5C3f8vRfkWT5Y8fyQnpmx0JY+g==
X-Received: by 2002:aa7:d64e:0:b0:410:f19a:2966 with SMTP id
 v14-20020aa7d64e000000b00410f19a2966mr28321294edr.415.1645558504036; 
 Tue, 22 Feb 2022 11:35:04 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-089-012-227-088.89.12.pool.telefonica.de. [89.12.227.88])
 by smtp.gmail.com with ESMTPSA id i1sm766532edj.84.2022.02.22.11.35.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 11:35:03 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/22] hw/char/serial-isa: Disuse isa_init_irq()
Date: Tue, 22 Feb 2022 20:34:36 +0100
Message-Id: <20220222193446.156717-13-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222193446.156717-1-shentey@gmail.com>
References: <20220222193446.156717-1-shentey@gmail.com>
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


