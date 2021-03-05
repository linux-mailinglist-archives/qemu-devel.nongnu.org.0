Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9286132F702
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 00:58:45 +0100 (CET)
Received: from localhost ([::1]:36416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIKLE-0002ip-Ke
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 18:58:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lIKHC-000730-2c
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 18:54:34 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:53318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lIKHA-0005vD-M4
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 18:54:33 -0500
Received: by mail-wm1-x330.google.com with SMTP id e23so2667673wmh.3
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 15:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0wsEumeFIlRACswExG1nCE5Q11cdVztT7j+RbemABes=;
 b=o9Kz8pwKG0IfBq/GluT9CyQyCr/qVTZuluBmaluNTDSVp1mESiADbji5RyWQG7JsvB
 CHQerRUjXSKtEzxFtxxL4r9M9KYBT+B750tqchK0Gw2lyOqKSuddpSoAyGpR3glCD9PW
 QZqp9FgCIRnaaYw57BSqeQ5bG6IfaF2r7WLBzSMlFFNGYi5EmHGL0tzCFp9ZShN2Gkg5
 79En88od6mtMWM0FIGCsGxw1uW8EFjJHRtDRfCZ00k1cvds9bEGqflDhgnQ5iIrGDxMN
 Yd3kR/H3J20n2exR83n11Z7E0L93Oq7ZJLbGDiWIXCC9Nn1ABsqustE7MVun+kUkLG60
 K1Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=0wsEumeFIlRACswExG1nCE5Q11cdVztT7j+RbemABes=;
 b=XVwrJbDWzpMlqLoshiUGyyQlMQRACrse5hTOueLmxE1TMoLtKNZj/Tvw3ncsM7z/bc
 4U55YIUSHW4v7J6xKFlwsUHHawcpsldq1TRtMMP0fT6I0UMwJVyOQjxAqS2pS8wQPXhV
 2SiXz2uTJ+HB7eEq+CTMdSGcLeuo9ImE/3gHahbVO9OD6ZNXDRJ6KWv3BQviaBkqaNSA
 eN0gVuOZ8lRHJ2knGncIjJZRjrIRY3vK0RsEtbG1uGmrwX9kqx45fFDFQ6VYKjn6dh3W
 w+8MtgKmarK5XuANgqmTQTNCcGi4JbYIm4GvZc1QN5gm81ILqI+ZR9m5XJg6DQ3hkAfO
 wUgA==
X-Gm-Message-State: AOAM533G5PolJN9pHGTOZjnUKIqBiYrDaR3s5q8mcTY4qIwnGyZ8eSQH
 45VIWa2yxj4ldmz63QPxwLiXilLZJVc=
X-Google-Smtp-Source: ABdhPJzlmQhxZPK1jzNuuzqCqA32JU0expmki8lu3ONtbZ3VmdH1d2QM5e8aUCko1+YROC7gA2QV4Q==
X-Received: by 2002:a05:600c:210a:: with SMTP id
 u10mr2827163wml.147.1614988471063; 
 Fri, 05 Mar 2021 15:54:31 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id z7sm6416121wrt.70.2021.03.05.15.54.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 15:54:30 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] memory: Make memory_region_to_absolute_addr() take a
 const MemoryRegion
Date: Sat,  6 Mar 2021 00:54:14 +0100
Message-Id: <20210305235414.2358144-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210305235414.2358144-1-f4bug@amsat.org>
References: <20210305235414.2358144-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>, Alexander Bulekov <alxndr@bu.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is no reason to not have memory_region_to_absolute_addr()
work with a const MemoryRegion. Else we get:

softmmu/memory.c: error: passing argument 1 of ‘memory_region_to_absolute_addr’ discards ‘const’ qualifier from pointer target type [-Werror=discarded-qualifiers]
 6666 |     myaddr = memory_region_to_absolute_addr(constmr, addr);
      |                                             ^~
softmmu/memory.c:410:60: note: expected ‘MemoryRegion *’ but argument is of type ‘const MemoryRegion *’
  410 | static hwaddr memory_region_to_absolute_addr(MemoryRegion *mr, hwaddr offset)
      |                                              ~~~~~~~~~~~~~~^~

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 softmmu/memory.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index 991d9227a88..6d1e96ba37d 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -407,9 +407,10 @@ static inline uint64_t memory_region_shift_write_access(uint64_t *value,
     return tmp;
 }
 
-static hwaddr memory_region_to_absolute_addr(MemoryRegion *mr, hwaddr offset)
+static hwaddr memory_region_to_absolute_addr(const MemoryRegion *mr,
+                                             hwaddr offset)
 {
-    MemoryRegion *root;
+    const MemoryRegion *root;
     hwaddr abs_addr = offset;
 
     abs_addr += mr->addr;
-- 
2.26.2


