Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD6C4C0078
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 18:51:44 +0100 (CET)
Received: from localhost ([::1]:50162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMZKB-0008Ei-9H
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 12:51:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nMZ7X-0003dH-Lk
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 12:38:39 -0500
Received: from [2a00:1450:4864:20::635] (port=46765
 helo=mail-ej1-x635.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nMZ7V-0002nB-UT
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 12:38:39 -0500
Received: by mail-ej1-x635.google.com with SMTP id qx21so45069743ejb.13
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 09:38:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yYCWkHPOuJ94dyXJk+F5NkE0t29yoLIYoBmG6Tsv8gE=;
 b=PRNpnUqOiM/QzTqzNSRnoDtQxCmgU+f7c4ZRHskfPQy117gG9bAyqak6A5Y2fGmgwe
 BQBjkZRtCZ8ElPZdKLkIH/nD4O2ziqESVNChxZJV6SSeO437tOOHujeSmpjRFX9ax6Re
 53b16EjCemkj1Vj422M51msqxNp6dY7/gOVbeQNFqBFcRsfOviCYXc4hZqC46wxctSS/
 kz0scaU+E5CKrNv15ONiHeSJ3j1vmzi9YA/ooOAen7O2B91YGv87IEovYRzNEgbKl5a5
 SN+Gc+c7TheaNxw2f8p0otu2qNyJXK0eL3qYVN2Ah0MLS3kvGgV6nF4HsboCNFfR+2jj
 tFhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yYCWkHPOuJ94dyXJk+F5NkE0t29yoLIYoBmG6Tsv8gE=;
 b=IZF7PDqar4uxMVYGLPNohZCTtXg7/BMosKVCQLUPIpDVzB4L1akG3hSsrVMGcmjh8l
 Relkq20f4TzXgCCEwKOCcsL6L2Y1oWRDnbrLxwc9ikPMQxYtuCxlHlKuxLSra6zs6wSR
 V7L7JNULFYTH+eCThZD5M4B+14MA9U/gc0FGVCQIgOO/gomgah6OZwiF+kT0pRkR5quC
 J8AGDypidCaJFgy6FG2dHJzbSQBGHId89hzXV+vpt8G2cvHcpmRgZQafJnIkC/KbHQvp
 IAe/37iuaKo6v9RNWVP0sQVp+6cjDR/t7xYQAHOWVLaIs2BVkgds3y8UwXJCpdx1Ra0U
 F5JQ==
X-Gm-Message-State: AOAM533WgDYwT0+QOPGmE0wABI6D3kyMhwPjCRjeLGDlHrGKhvYBP6pB
 Kn0eqdLt+s+D5QebNMshCmy4wPbV86E=
X-Google-Smtp-Source: ABdhPJw8/ptrEsGLCg625R3+8RlKsnqk1nq7pRy4kmkjDcN58goLQrMcgxiUYAbnEgxgcfvAqaQq0w==
X-Received: by 2002:a17:906:1ccd:b0:6ce:b0c1:b3ed with SMTP id
 i13-20020a1709061ccd00b006ceb0c1b3edmr19732122ejh.26.1645551516251; 
 Tue, 22 Feb 2022 09:38:36 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-089-012-227-088.89.12.pool.telefonica.de. [89.12.227.88])
 by smtp.gmail.com with ESMTPSA id et2sm6449382ejc.101.2022.02.22.09.38.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 09:38:35 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/22] hw/audio/sb16: Disuse isa_init_irq()
Date: Tue, 22 Feb 2022 18:38:06 +0100
Message-Id: <20220222173819.76568-10-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222173819.76568-1-shentey@gmail.com>
References: <20220222173819.76568-1-shentey@gmail.com>
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
Cc: Bernhard Beschow <shentey@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

isa_init_irq() has become a trivial one-line wrapper for isa_get_irq().
Use the original instead such that isa_init_irq() can be removed
eventually.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/audio/sb16.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/audio/sb16.c b/hw/audio/sb16.c
index 60f1f75e3a..2215386ddb 100644
--- a/hw/audio/sb16.c
+++ b/hw/audio/sb16.c
@@ -1408,7 +1408,7 @@ static void sb16_realizefn (DeviceState *dev, Error **errp)
         return;
     }
 
-    isa_init_irq (isadev, &s->pic, s->irq);
+    s->pic = isa_get_irq(isadev, s->irq);
 
     s->mixer_regs[0x80] = magic_of_irq (s->irq);
     s->mixer_regs[0x81] = (1 << s->dma) | (1 << s->hdma);
-- 
2.35.1


