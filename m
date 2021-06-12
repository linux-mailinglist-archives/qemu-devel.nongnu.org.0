Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 205403A5070
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Jun 2021 21:59:45 +0200 (CEST)
Received: from localhost ([::1]:38402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ls9nE-0004yf-63
	for lists+qemu-devel@lfdr.de; Sat, 12 Jun 2021 15:59:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ls9mL-000486-MJ; Sat, 12 Jun 2021 15:58:49 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:46927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ls9mK-0005dX-0w; Sat, 12 Jun 2021 15:58:49 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 h22-20020a05600c3516b02901a826f84095so10460010wmq.5; 
 Sat, 12 Jun 2021 12:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OxptY+TaWuYahzVh0i696gVvEiFQd99aIk6geK7Nd94=;
 b=BnQGjEr/NwQVxm74bqe1xW2bH+CBIoYO2hMnZwq3aU7+0PY7fEeq/cxYOi4tPrhTaK
 Y/2TdaRzumGOXoLDHiDQbBTPPDdCNHf8d2QZAnVQRnDxoXF+WT+gd1Ba0z1wwv3doB2j
 HlElJ0RKbWHCKSMLXBzKSQBh3Zi00Nizyq9GMyOE7VNKANtvHX5Re377YkSVMICsuNy7
 gzcX/CxteSLCWnx20oqLG4gYZbyChpbxxFTwGBMBe4ZwRQL/wrrmMbSMIaGPR+WhMCTc
 u3ocVMPLGz2ZOxZO+Va/GeHW2aoUnSauJHeyZR9m/ANc4lSQF3fF5Nt/xDqgLEXOuPR8
 tGUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=OxptY+TaWuYahzVh0i696gVvEiFQd99aIk6geK7Nd94=;
 b=iOWjuJImRGVD4cRBrQ4vU34/03cTdwTnk9U9VjyCli2pD5NSqKOMxz/CTOyflfszgA
 C2qnQ0FGkUMa4PqmfNL2/8b8OFEg7jmg0Tl2efEnzFu9vfAob8OwbeIkBpQmrmJSCCjE
 QTZXMuv40wkAH6CFK4TG/3P6I94Hl/4S5Ph92iBx1p7IX/n9bLWL0oI/WqnQ8u7j9H7f
 kShuTx0rK8MtVrn3JFrYF0ewE+anUs2CF30psE46JhT/K8071tt3ERRR6c+pmvWkRfs+
 Y8VeyXhuxlCqp3DnSKXB4UYrULa8BlRotj/9Ozx/Hmg59iBpZvWxMNCQHo8ETjQ+PW3L
 2+Sw==
X-Gm-Message-State: AOAM5330d7lQJw1a9nfL1NX/i8BS2A7WcXRRn5ajQ/MwdxpMnP3ZkQsO
 TgHpMsSzIJfUNYb081jK9HKyuaJlZTSsUg==
X-Google-Smtp-Source: ABdhPJxQOtvjyDlV2bt2IzsGdqJvWfFtN5kG6diV0HNvET8nT3q8oeOuNvnhZAnxPfzR0JmfBNvEjA==
X-Received: by 2002:a05:600c:354d:: with SMTP id
 i13mr9337446wmq.67.1623527925578; 
 Sat, 12 Jun 2021 12:58:45 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id y189sm9801243wmy.25.2021.06.12.12.58.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Jun 2021 12:58:44 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] fuzz: Display hexadecimal value with '0x' prefix
Date: Sat, 12 Jun 2021 21:58:42 +0200
Message-Id: <20210612195842.1595999-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
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

Use memory_region_size() to get the MemoryRegion size,
and display it with the '0x' prefix.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v2:
- Use PRIx64 (lvivier)
- Use memory_region_size()
---
 tests/qtest/fuzz/generic_fuzz.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
index cea7d4058e8..6c675227174 100644
--- a/tests/qtest/fuzz/generic_fuzz.c
+++ b/tests/qtest/fuzz/generic_fuzz.c
@@ -841,9 +841,9 @@ static void generic_pre_fuzz(QTestState *s)
 
     g_hash_table_iter_init(&iter, fuzzable_memoryregions);
     while (g_hash_table_iter_next(&iter, (gpointer)&mr, NULL)) {
-        printf("  * %s (size %lx)\n",
+        printf("  * %s (size 0x%" PRIx64 ")\n",
                object_get_canonical_path_component(&(mr->parent_obj)),
-               (uint64_t)mr->size);
+               memory_region_size(mr));
     }
 
     if (!g_hash_table_size(fuzzable_memoryregions)) {
-- 
2.31.1


