Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C2E6AFABD
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 00:50:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZh3f-0005yM-52; Tue, 07 Mar 2023 18:49:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZh3N-0005ZS-RI
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 18:49:11 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZh3M-0002z2-7F
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 18:49:09 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 l7-20020a05600c4f0700b003e79fa98ce1so156929wmq.2
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 15:49:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678232946;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d/943dM73+CscRWT5p4HgkQ0Mpf3ps69VM4jkjUa4hA=;
 b=UEXGQP5JYl6F8NyKaqcNMtpuhKxE7o/SMahDyFKf90VUG91tOEdGgGPLyZHqDZIyMQ
 IRxKqNvOV60fKkn8iUeghS+hLnIwgv6XZZACF5x0ljQVKwwioYEyVWvmImxPS7EFcedb
 yZll+xuHtyClQqb9VTOixAVK/DvxaggQqzeWns1cTh/sqSRJCaCa4turo63AG0JM8Yzt
 lBU6XcWK8KR343+Z9wYcEjDdaZcjUATF5Jjviguwvf4hBd0KLvIaQo6LtMk8mzERSnPF
 pZcvRi3/qH7Guh/CpQshxNr+zoEoJv+YWkwXL5mFIIfSwuPk7LpZBDoHjEjgs9uQ+kdz
 zFsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678232946;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d/943dM73+CscRWT5p4HgkQ0Mpf3ps69VM4jkjUa4hA=;
 b=PMVx47jomeJY4gupCQEoKkPMAgi4ytG9mT3WSoaLEej1yBKfNnElQi8zFFMj5AeJ/x
 SL2LEf4cFHOCjFQkJHkNWFUtG5qmkVWG375UMUiYbTUE91OiBKnhb1IRhIkDC7piyKrh
 xGuEVJxYU5GVy/wZx38WoQD7GSNqw1WCRtdOB+GrY5Ps10cTdNwe+yMwMnE3MmEygYXv
 cIiKgCNJNiTjELLvHDrhAkkBC0O0IkWed1nun6kdpgG6sjPVeE54Y0wXC2Kw9jkxseYP
 dvlzh5FbbTkImw7AbbxImMrPsHcFBNRIoc83fI9pWp0WA/qdGfGVISpkXfFfBLUd6bkX
 dedw==
X-Gm-Message-State: AO0yUKU7qmgu8CdIDheE8/mOLuRJFrLxM8D2ZGeF7YZ5DLmV1MhkIZRS
 pP17JInKSXN2IOmJlkh5a+XATpoYOXJ/sxJDDeE=
X-Google-Smtp-Source: AK7set8LzC9p2bAZI6/vk8TB4eMRvMaWijG12eEQ/Sas63UDrdAllqP58bhJ4l/lXNoEb3OcBFxarA==
X-Received: by 2002:a05:600c:4f13:b0:3eb:3998:8bca with SMTP id
 l19-20020a05600c4f1300b003eb39988bcamr14698884wmq.17.1678232946724; 
 Tue, 07 Mar 2023 15:49:06 -0800 (PST)
Received: from localhost.localdomain (57.red-88-29-179.dynamicip.rima-tde.net.
 [88.29.179.57]) by smtp.gmail.com with ESMTPSA id
 f18-20020a05600c43d200b003dec22de1b1sm13849131wmn.10.2023.03.07.15.49.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 07 Mar 2023 15:49:06 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Ted Chen <znscnchen@gmail.com>,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 19/20] memory: Dump HPA and access type of ramblocks
Date: Wed,  8 Mar 2023 00:47:10 +0100
Message-Id: <20230307234711.55375-20-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230307234711.55375-1-philmd@linaro.org>
References: <20230307234711.55375-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Ted Chen <znscnchen@gmail.com>

It's convenient to dump HVA and RW/RO status of a ramblock in "info ramblock"
for debug purpose.

Before:
            Offset               Used              Total
0x0000000000000000 0x0000000400000000 0x0000000400000000

After:
            Offset               Used              Total                HVA  RO
0x0000000000000000 0x0000000400000000 0x0000000400000000 0x00007f12ebe00000  rw

Signed-off-by: Ted Chen <znscnchen@gmail.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221205120712.269013-1-znscnchen@gmail.com>
[PMD: Add uintptr_t cast for 32-bit hosts]
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 softmmu/physmem.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 47143edb4f..085b3ca6d2 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -1126,15 +1126,21 @@ GString *ram_block_format(void)
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
+                               (uint64_t)(uintptr_t)block->host,
+                               block->mr->readonly ? "ro" : "rw");
+
         g_free(psize);
     }
 
-- 
2.38.1


