Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2447A642A56
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 15:24:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2CN2-00017T-8N; Mon, 05 Dec 2022 09:23:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <znscnchen@gmail.com>)
 id 1p2AGl-00087L-2S
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 07:08:23 -0500
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <znscnchen@gmail.com>)
 id 1p2AGj-00066G-4H
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 07:08:22 -0500
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-12c8312131fso13190539fac.4
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 04:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=d66GNScGrl0cFnfZBZX8FTbpKHK6SvXld89DEljGd6k=;
 b=aaLlxz/F+69PagT6hAHYcK80R5nXIp0ebjrwt9rTEXFV5gb+4B2dLmuZymMNhgr9gC
 u8H3TTpKNECFdxHwZEKtMBFENpNNuZuGJVsxdDV+Bc0F0ydvkX3O8/T8DqurTC4bvSMn
 urkJneYwIz1glE+kWUSAqUzc0zgEAUhsdALx4KsMJY8v28pQwsN7+d/wv5ZmneZiNADc
 ejHcFyAWYlpnLuWvPmSv8GX/MIvMs5XWbpL6lKnACv5LOws2op0Lj/vP6+F5P4WzfUnZ
 20qqP4AkLXCjGn9V7CSyGGPaw34X9AHGdyExAKU0wDIg5Mij/MtXdDuHmI52qPNmSRor
 SyHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=d66GNScGrl0cFnfZBZX8FTbpKHK6SvXld89DEljGd6k=;
 b=ysjluutdQAvvl2I5M19fc6/zAFY7LfKkulcMt5AG/Z7VTLHk0xfnuckYk1WHOGHgr5
 nUrY2VGakXR2Ay5ORJ8c770217AVOQWOrnT3HIBV9sVbusQ1bqgrZz9glseVyotswCUu
 UOHpAAhr5Bvnd7/TYEAhuNmCmc+BkAwBNsg/0+by0Djm+cuFcIQlgtY696ts85cnY2zU
 yqGw+SccUXSB/eZV3QhL7Dhf0b7hvW3GPurrVkAmjDpTqOkxq+2HtLSeRBvXK479JNn6
 fRZzGiCNcVP4obASwKYVbSwE+J9xGMJ/slwfh6u4XdyzbRNg37AUfJakeObKao7fQHGj
 /02Q==
X-Gm-Message-State: ANoB5pkoI1TfgIuq7n9h2AdQULGLesLTWEcOIJ4nEatPz1x2QdWLJ+Rc
 exuXkIx+VWzM+lFN8yojwQ==
X-Google-Smtp-Source: AA0mqf74H8PViZBiA+Ev5yVJlnptpV9IduHx6EM1vMecKzNFNPKBjQwfruwnBPq5yj/wIO7CrtQbxg==
X-Received: by 2002:a05:6870:6586:b0:132:7d3c:745b with SMTP id
 fp6-20020a056870658600b001327d3c745bmr35899552oab.180.1670242099297; 
 Mon, 05 Dec 2022 04:08:19 -0800 (PST)
Received: from ted-dallas.. ([2001:19f0:6401:18f2:5400:4ff:fe20:62f])
 by smtp.gmail.com with ESMTPSA id
 y21-20020a0568302a1500b0066c49ce8b77sm7618729otu.77.2022.12.05.04.08.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 04:08:18 -0800 (PST)
From: Ted Chen <znscnchen@gmail.com>
To: pbonzini@redhat.com, peterx@redhat.com, david@redhat.com, philmd@linaro.org
Cc: qemu-devel@nongnu.org,
	Ted Chen <znscnchen@gmail.com>
Subject: [PATCH] memory: dump HPA and access type of ramblocks
Date: Mon,  5 Dec 2022 20:07:12 +0800
Message-Id: <20221205120712.269013-1-znscnchen@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=znscnchen@gmail.com; helo=mail-oa1-x2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 05 Dec 2022 09:22:55 -0500
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

It's convenient to dump HVA and RW/RO status of a ramblock in "info ramblock"
for debug purpose.

Before:
            Offset               Used              Total
0x0000000000000000 0x0000000400000000 0x0000000400000000

After:
            Offset               Used              Total                HVA  RO
0x0000000000000000 0x0000000400000000 0x0000000400000000 0x00007f12ebe00000  rw

Signed-off-by: Ted Chen <znscnchen@gmail.com>
---
 softmmu/physmem.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 1b606a3002..fed4dfb72c 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -1316,15 +1316,21 @@ GString *ram_block_format(void)
     GString *buf = g_string_new("");
 
     RCU_READ_LOCK_GUARD();
-    g_string_append_printf(buf, "%24s %8s  %18s %18s %18s\n",
-                           "Block Name", "PSize", "Offset", "Used", "Total");
+    g_string_append_printf(buf, "%24s %8s  %18s %18s %18s %18s %3s\n",
+                           "Block Name", "PSize", "Offset", "Used", "Total",
+                           "HVA", "RO");
+
     RAMBLOCK_FOREACH(block) {
         psize = size_to_str(block->page_size);
         g_string_append_printf(buf, "%24s %8s  0x%016" PRIx64 " 0x%016" PRIx64
-                               " 0x%016" PRIx64 "\n", block->idstr, psize,
+                               " 0x%016" PRIx64 " 0x%016" PRIx64 " %3s\n",
+                               block->idstr, psize,
                                (uint64_t)block->offset,
                                (uint64_t)block->used_length,
-                               (uint64_t)block->max_length);
+                               (uint64_t)block->max_length,
+                               (uint64_t)block->host,
+                               block->mr->readonly ? "ro" : "rw");
+
         g_free(psize);
     }
 
-- 
2.34.1


