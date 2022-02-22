Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B4E4C0270
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 20:52:46 +0100 (CET)
Received: from localhost ([::1]:57620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMbDJ-00018T-SZ
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 14:52:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nMawL-0003Op-Gs; Tue, 22 Feb 2022 14:35:13 -0500
Received: from [2a00:1450:4864:20::530] (port=44984
 helo=mail-ed1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nMawJ-00074h-Nh; Tue, 22 Feb 2022 14:35:13 -0500
Received: by mail-ed1-x530.google.com with SMTP id x5so39337329edd.11;
 Tue, 22 Feb 2022 11:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I7puGt2s3b15Sv26Fv0lRYePOTVn0bOsnqCEUxcw0JI=;
 b=bTuebAb5eNwsmNAFKp2HUpAvGgnfwjE468lOlitrrCGsBANVJ6U8vR0/5z8HOR0dt+
 4DojKPKL9mVyYT0y2cR/4ijeuPS76l8quSVTmEQvU/xYIgVmtQXLk2E+e0VGVV46y+CM
 brIQ+PyPUIKDvbeF0nSRuK6VN9WNtpWUhA+zz6DUkCKGRFng9d8WL5dAGCN8aLjCehgS
 CJ1oHZqqji8UEU4sgo01jllgdzwvPAMYrKImHyIcNIy+ci8+uFqpJz5jgxr+aChvjytK
 kWmI/PZ1JYxKvFcQeOP232VGTT33FHOQhBMpPecz2JA7iEAOmeYtAPoMgH3Fxk/lSQ1m
 FsXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I7puGt2s3b15Sv26Fv0lRYePOTVn0bOsnqCEUxcw0JI=;
 b=fogsPrGpwuDhy/sorM80FjN+hOrn92cqnPnHtez8Kf2OGE9Pbmg8JtFgw93hd9hKCZ
 PqbiJOTMKlhA1IUpM6c3dSQvzp6pbELExG1SDgipJO+h8V6Z8/KxjCEFlJmiparni5nR
 /EMYNp84eCdp6cDoJuPhZKe6dC93XtWPVkd3mZAKCM/MmFT2/gmvq/3GuFEgdmKwgICA
 vSUHoMVXJ/65dwmjG0L+/9Fznalh31CWiiAkTE06TCWVlXfog7JY6fFJqzFZEV0Vd9Qa
 8i82SUZeIFK34x8vDdF6FA0rQNkyI7k1UsizYR9WVufC8WAhfKQ1YFqp8tJoCGaQaf1A
 AYXQ==
X-Gm-Message-State: AOAM532iIPeibw97qudkX/Pz0MSJ1Bo+DDW1VFpEhU83TX2CStXDulur
 VZMehBJJnrUBxwXxJU5WwsBvUe23ii4=
X-Google-Smtp-Source: ABdhPJy8P7kplq9JM4YhPbvbzp+2Qf6PzRvuKW4JEQVP/A06HdyZlR/iywCZfFqSOZQ9rx82asJq/Q==
X-Received: by 2002:a05:6402:13cb:b0:410:820f:4e8 with SMTP id
 a11-20020a05640213cb00b00410820f04e8mr27151645edx.352.1645558509937; 
 Tue, 22 Feb 2022 11:35:09 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-089-012-227-088.89.12.pool.telefonica.de. [89.12.227.88])
 by smtp.gmail.com with ESMTPSA id i1sm766532edj.84.2022.02.22.11.35.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 11:35:09 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 19/22] hw/rtc/m48t59-isa: Disuse isa_init_irq()
Date: Tue, 22 Feb 2022 20:34:43 +0100
Message-Id: <20220222193446.156717-20-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222193446.156717-1-shentey@gmail.com>
References: <20220222193446.156717-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::530
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x530.google.com
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
Cc: "open list:PReP" <qemu-ppc@nongnu.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Bernhard Beschow <shentey@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

isa_init_irq() has become a trivial one-line wrapper for isa_get_irq().
Use the original instead such that isa_init_irq() can be removed
eventually.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/rtc/m48t59-isa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/rtc/m48t59-isa.c b/hw/rtc/m48t59-isa.c
index cd63138e1e..990ea15bce 100644
--- a/hw/rtc/m48t59-isa.c
+++ b/hw/rtc/m48t59-isa.c
@@ -106,7 +106,7 @@ static void m48t59_isa_realize(DeviceState *dev, Error **errp)
 
     s->model = u->info.model;
     s->size = u->info.size;
-    isa_init_irq(isadev, &s->IRQ, d->isairq);
+    s->IRQ = isa_get_irq(isadev, d->isairq);
     m48t59_realize_common(s, errp);
     memory_region_init_io(&d->io, OBJECT(dev), &m48t59_io_ops, s, "m48t59", 4);
     if (d->io_base != 0) {
-- 
2.35.1


