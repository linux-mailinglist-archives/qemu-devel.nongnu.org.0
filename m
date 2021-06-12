Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECC33A4F6A
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Jun 2021 17:02:08 +0200 (CEST)
Received: from localhost ([::1]:36478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ls59D-0004lB-5T
	for lists+qemu-devel@lfdr.de; Sat, 12 Jun 2021 11:02:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ls57N-0003oa-Gy; Sat, 12 Jun 2021 11:00:13 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:34516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ls57L-0004iG-Bg; Sat, 12 Jun 2021 11:00:12 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 u5-20020a7bc0450000b02901480e40338bso7563347wmc.1; 
 Sat, 12 Jun 2021 08:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V1tHPWc7IoUl8aeLrAnszpR4W9O8ua1Vcngeui0rTRw=;
 b=C0bFPpjy4iReiVnSoBSjKNUBQWjaQmpZC9uAQCch9QpaG/HlY+du8JFdhtmbHg4G8D
 CsrwXbcX3uarXt761UphXOxIei2xSa+sWpO0YWZe9pYxZg2wSkrjnpSaR8IV9lC2A9Id
 2PM1RdUXXXM8aww+dHLcjIV55QCSeZkqtBpdu1H4ong9HO09kVqEYHXtT0fdRi8FaXne
 1KOOJBa0sH/36oKwGpx8ZfmaQzfXPLZJjqrpG4BGbMnaLQXFTAq2DDuJckukKr3UEGMK
 3CPC7XF5/PZSL5nCzWCy8QSMVVWAfWRui43+LsNOu4TrNzr0D6j4E6wgn/Rm+eJ7VNXo
 N6Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=V1tHPWc7IoUl8aeLrAnszpR4W9O8ua1Vcngeui0rTRw=;
 b=Nrf68icmEy2MvRelDis5Ee7VbvJdkyRRGcLMY18WrSRTnn/RX7osdQXosy5xHtpOQM
 oPHJvZDlPnGE/nnYWXk4/TrEXhJAPKe0hDN/f5yXR8vmjac2ehlYLxCKTjcCihxxgAdN
 U1pCnFQxuZAXbt1W6R8KX2Ow+UEEWNtVL4DtgckySbZPdtpdOVosbuIEQK0YTXva6kJe
 VIyQRemR4lU7T6GpRftCQd1lKMUvrUcpsoY5S7KtqGF566lHQxx10+k4sRNCKtDP7yvk
 ytondlc/c+FnSHh4vOOrCgNhWDZruhSKQ5LvV7gyJafVLJ5rlYH+zHq8HLb7+oED2JFn
 uopg==
X-Gm-Message-State: AOAM53396JPiL0tX2WmOfEWotUkRkW6kIGCeqDOZSHL7utDX1axDbQMO
 4XxP6hp7+9Q0eR5usIzrV0epv5bpr5xxqw==
X-Google-Smtp-Source: ABdhPJxpioCeR6eN+a1A64LTB7ZuSP+ohc9xNKKHss7wK7q4el16Arb6CSB9Z/0krFjnzQU92uswhA==
X-Received: by 2002:a1c:a54b:: with SMTP id o72mr8465747wme.124.1623510008056; 
 Sat, 12 Jun 2021 08:00:08 -0700 (PDT)
Received: from x1w.redhat.com (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id p23sm7697946wmi.26.2021.06.12.08.00.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Jun 2021 08:00:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] fuzz: Display hexadecimal value with '0x' prefix
Date: Sat, 12 Jun 2021 17:00:04 +0200
Message-Id: <20210612150004.1489198-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/qtest/fuzz/generic_fuzz.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
index cea7d4058e8..1307299df52 100644
--- a/tests/qtest/fuzz/generic_fuzz.c
+++ b/tests/qtest/fuzz/generic_fuzz.c
@@ -841,7 +841,7 @@ static void generic_pre_fuzz(QTestState *s)
 
     g_hash_table_iter_init(&iter, fuzzable_memoryregions);
     while (g_hash_table_iter_next(&iter, (gpointer)&mr, NULL)) {
-        printf("  * %s (size %lx)\n",
+        printf("  * %s (size 0x%lx)\n",
                object_get_canonical_path_component(&(mr->parent_obj)),
                (uint64_t)mr->size);
     }
-- 
2.31.1


