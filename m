Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6344C0236
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 20:45:46 +0100 (CET)
Received: from localhost ([::1]:40020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMb6X-00067K-Qx
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 14:45:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nMawB-0003KD-53
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 14:35:04 -0500
Received: from [2a00:1450:4864:20::632] (port=46950
 helo=mail-ej1-x632.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nMaw9-0006qq-AL
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 14:35:02 -0500
Received: by mail-ej1-x632.google.com with SMTP id qx21so45965151ejb.13
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 11:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CmvV1KBAyLb40CrSZESm4OuVCUBSwXaZp8sAs9w/www=;
 b=X3LQF2WeT7RC8qAvQGavLZolJU73UOAttU0npTkfKeezDKZ8IkfJC/4WlYUZigWzLe
 H14fueU3r33eSbtQPJbChZlb0oW3N4QIRE1NaZ5xtMc7PQ3nZKB66CsA97uvLbOmZ62A
 a+VAmbh72rfLCM59nXvVT/2mEmWkz5GbKqcK0bJvP5EGabGOMt6v+WwJap252sNyZQwd
 ZZVgP0c/gArwQ/YYfZ7R6+cQOkIZHIB8HsbONSappV6MZIbH0IuKI0dlw+VhqTVYIRzN
 rHJOwhxqP2FXUGyKQDmLuF1rCpslyftfVlW7mDoDaTdvMMM7gedAEJLE64GUIJcW8x4d
 fh6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CmvV1KBAyLb40CrSZESm4OuVCUBSwXaZp8sAs9w/www=;
 b=Apcx57pK929mjR5dcq1sn1VsPgliI2BMnwRPnWT8ViusNZV0lstd01rCCAb4/szGGe
 qatLUFLmZoyas5xN9cQuHvlKIfsQFclkAWl/HCEM2ECxcomKmljIas7nvXRe5pVT4FIW
 wPaGZB4eVS3FqGhXJ4D2Pv4TTzvzGd2Ziz4rSffJQhU2djxFBHZqLYfWyzvzvugW7tR7
 ZoJV/A3nh7tdsv85Fmwx2CaYcrIKGS+uY9m1//ZW6IKiGtC4eXc1YV6tgwIj0WuClruG
 nHOlFxTtQrxFGqsw7X1kWoBRvDhhiyhD7fHxxClnKZM3cMgw6lxcCGxlxHb9eHOSzLIc
 TUjQ==
X-Gm-Message-State: AOAM531nUxFNhWQDVPRBlQAl8C45HJ/5uOT2f7xRtPKyi+iTc+yAwToR
 GNTg0FKDta0dXZ/TpSpZZxlOv25oYl8=
X-Google-Smtp-Source: ABdhPJz3XXVxoxrZgoGgcrz2rHTX3jJ7KHkXibYm2LlwAF/NFqjDxpnmRKPJ0vTucd1iLJe74gMVjg==
X-Received: by 2002:a17:906:e08c:b0:6bb:6f89:7d59 with SMTP id
 gh12-20020a170906e08c00b006bb6f897d59mr20040911ejb.85.1645558499789; 
 Tue, 22 Feb 2022 11:34:59 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-089-012-227-088.89.12.pool.telefonica.de. [89.12.227.88])
 by smtp.gmail.com with ESMTPSA id i1sm766532edj.84.2022.02.22.11.34.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 11:34:59 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/22] hw/audio/gus: Disuse isa_init_irq()
Date: Tue, 22 Feb 2022 20:34:32 +0100
Message-Id: <20220222193446.156717-9-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222193446.156717-1-shentey@gmail.com>
References: <20220222193446.156717-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::632
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x632.google.com
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


