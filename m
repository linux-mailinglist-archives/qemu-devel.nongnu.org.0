Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 774694C0052
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 18:48:09 +0100 (CET)
Received: from localhost ([::1]:39864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMZGi-0001IJ-Gp
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 12:48:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nMZ7W-0003X4-56
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 12:38:38 -0500
Received: from [2a00:1450:4864:20::62d] (port=39633
 helo=mail-ej1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nMZ7U-0002ml-O8
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 12:38:37 -0500
Received: by mail-ej1-x62d.google.com with SMTP id p9so45187298ejd.6
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 09:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CmvV1KBAyLb40CrSZESm4OuVCUBSwXaZp8sAs9w/www=;
 b=GJjRwv3bzvzbLoeR0Gzzij+Ucr1xjFu0dAnlUNI71Ed0u58ZK0K0DB6qqyfvE0y+U8
 YJseSv3e1b/fBOyhMHxU4MYLMr1fLsHotBxmsjlDLa9LPHULM79MbfCQHqDrvVDw/dal
 cHNU7zCIE73fXpw/T3aCct5ZvW3MAGGBjA0+eE9Yns7wD/C/4mzZoaR0S6t4WUFhfmEq
 9FitcijrvWGwUIqfBVZkiOJFAbKwDgid034U5iFlgvdmfVaX18vBRbwW3mlhZyImapiY
 GX2axvF6kb4K4WApeq5VppVF9UaIWDoMaAr1SrBs7rDnQVge8hjamDm6a97WNw1EB2TS
 tZjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CmvV1KBAyLb40CrSZESm4OuVCUBSwXaZp8sAs9w/www=;
 b=iwmsxuVRkCbfPYHHFyvbV70o9xlcgLX3YFtALC+H/4s+s9ssYaBuBVysiWy5m4ZfXd
 /4U2HqKTiUd3b7BohhyGOfYBvsfFLBOnbs7sXQCZRsB4BcGIxgYEXsm8ejt983doYHHC
 SYj9yQhB3wqdT4HERz9xzK654frZzbUgvVeHD6WQm4jwHoyYoFuiD4GqFJAc55NFYiUY
 eBtAhpUEYpnrg4mWJolrfSMkSpMiue7eKJB7og0AWlOQ3Xe6oAxZY6GpPmvAgPfDM80a
 lAfH9nIsd8tcJTgTcbus4K0KhNSKP7NB7iIKmmsNuBY7B5FlhRL9bmNq5TlL9Yx8+ZKn
 tXsA==
X-Gm-Message-State: AOAM531eVm+MJl7dvLq7cvMIQdGhAA9PBfgu82dkWYFefRSf9rK7TpFd
 scgUJRT7GM9yBrkJKUa7/ZPM2/yoREg=
X-Google-Smtp-Source: ABdhPJw/q3kErtWGqpatxpJOMFM8CA2f+skc/QL5yW/eimabMqoQ+s2/DjKlfnE+F/t2wi612zrVvw==
X-Received: by 2002:a17:906:a10:b0:6ce:7107:598b with SMTP id
 w16-20020a1709060a1000b006ce7107598bmr19810697ejf.653.1645551515381; 
 Tue, 22 Feb 2022 09:38:35 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-089-012-227-088.89.12.pool.telefonica.de. [89.12.227.88])
 by smtp.gmail.com with ESMTPSA id et2sm6449382ejc.101.2022.02.22.09.38.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 09:38:34 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/22] hw/audio/gus: Disuse isa_init_irq()
Date: Tue, 22 Feb 2022 18:38:05 +0100
Message-Id: <20220222173819.76568-9-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222173819.76568-1-shentey@gmail.com>
References: <20220222173819.76568-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62d.google.com
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
Cc: Bernhard Beschow <shentey@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

isa_init_irq() has become a trivial one-line wrapper for isa_get_irq().
Use the original instead such that isa_init_irq() can be removed
eventually.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/audio/gus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/audio/gus.c b/hw/audio/gus.c
index e8719ee117..42f010b671 100644
--- a/hw/audio/gus.c
+++ b/hw/audio/gus.c
@@ -282,7 +282,7 @@ static void gus_realizefn (DeviceState *dev, Error **errp)
     s->emu.himemaddr = s->himem;
     s->emu.gusdatapos = s->emu.himemaddr + 1024 * 1024 + 32;
     s->emu.opaque = s;
-    isa_init_irq (d, &s->pic, s->emu.gusirq);
+    s->pic = isa_get_irq(d, s->emu.gusirq);
 
     AUD_set_active_out (s->voice, 1);
 }
-- 
2.35.1


