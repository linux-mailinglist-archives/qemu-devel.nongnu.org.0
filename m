Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F4829ABDE
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Oct 2020 13:19:30 +0100 (CET)
Received: from localhost ([::1]:60542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXNwn-0007wJ-1Y
	for lists+qemu-devel@lfdr.de; Tue, 27 Oct 2020 08:19:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kXNPU-0001JZ-Lk
 for qemu-devel@nongnu.org; Tue, 27 Oct 2020 07:45:08 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:46817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kXNPM-0004RN-SF
 for qemu-devel@nongnu.org; Tue, 27 Oct 2020 07:45:04 -0400
Received: by mail-wr1-x444.google.com with SMTP id n6so1489149wrm.13
 for <qemu-devel@nongnu.org>; Tue, 27 Oct 2020 04:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=6+6huhfRLnp7pz9bNCzrdSRVvvTMmhekYomrqFurS68=;
 b=QHMcCfYCUyYOH0bn8+HCTVw7qDETq56T/JkGqTmAjnDYptK3p0t3YwGZkV6GwxPKIJ
 g11XlXhuX3ZnOPHPuqpE+OleoVMR8dg6FroqkB9lMO2V5Kr7tSMpiiXM9G9swBpgfbWI
 +nQ1fL/8r8lPLvZ9WdQCeyBfL32fP65yUXv1m0XAM0FszHLP6EhEP329llUzoO/PG4/J
 zWyD5UPkeTP2q7CRM9sjlBt3E8uav5X9t0JQ0uX4XfelkvWmZ8XLV0pJd2CIC99uhGKS
 H7sOSUKvxiYlH5r+gUKSfjYhgcSm7b8ndgeeZfKdiRmsh+Tqnw15708lGlR5ufwtlV/I
 we9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6+6huhfRLnp7pz9bNCzrdSRVvvTMmhekYomrqFurS68=;
 b=exWlsR6EkgogvOpF9K+n9BCxpJ3+g0reyTNupHmWfnxV0b9Bc9FGUoF8L4UNb2Luq9
 bIV69WGsS6CN2cEOb522THq8Q+nVSwCmD4lD9mPTg3UJ+fpvuh62mwECmLkMXzN1lW1c
 Jqn8MZCOxExheeg/KsHj8wwfgukCi+YGoO7oIF+f+vjngtbeVbf+JRz/ptJwzqkgQxDf
 yWXVPCXLf9oZdSA6oJjIjqPmGkHWkAGoNAeYsVCsiyL/85ssq3sS4CQTCA9UrtZCkvwG
 Gk5OHUPSpY5qHu/fHMTDLbcNpMzZDVHPfO3qQ0+os49mskohdlzO6lzkMAamnbi0CpnJ
 /+Vg==
X-Gm-Message-State: AOAM533XDaSIBix0oQzm0mjzk15EwLIpKfLq1QcAPmY/omZEVD5yMv8a
 epGGnMunWAwzOunQTtcEzrVRZ+6vRWn/Sw==
X-Google-Smtp-Source: ABdhPJwN96g1rmF4e6CBefjKd+fsOdL89YW2axaDI85nBsA7gMDvSHRWGQwOo/OKQYqP+I9X/YWpwQ==
X-Received: by 2002:adf:f10e:: with SMTP id r14mr2245904wro.337.1603799089272; 
 Tue, 27 Oct 2020 04:44:49 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 32sm1712203wro.31.2020.10.27.04.44.48
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 04:44:48 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/48] linux-user/elfload: Adjust iteration over phdr
Date: Tue, 27 Oct 2020 11:43:56 +0000
Message-Id: <20201027114438.17662-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201027114438.17662-1-peter.maydell@linaro.org>
References: <20201027114438.17662-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

The second loop uses a loop induction variable, and the first
does not.  Transform the first to match the second, to simplify
a following patch moving code between them.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20201021173749.111103-7-richard.henderson@linaro.org
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 linux-user/elfload.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 290ef70222b..210592aa90a 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -2426,17 +2426,18 @@ static void load_elf_image(const char *image_name, int image_fd,
     loaddr = -1, hiaddr = 0;
     info->alignment = 0;
     for (i = 0; i < ehdr->e_phnum; ++i) {
-        if (phdr[i].p_type == PT_LOAD) {
-            abi_ulong a = phdr[i].p_vaddr - phdr[i].p_offset;
+        struct elf_phdr *eppnt = phdr + i;
+        if (eppnt->p_type == PT_LOAD) {
+            abi_ulong a = eppnt->p_vaddr - eppnt->p_offset;
             if (a < loaddr) {
                 loaddr = a;
             }
-            a = phdr[i].p_vaddr + phdr[i].p_memsz;
+            a = eppnt->p_vaddr + eppnt->p_memsz;
             if (a > hiaddr) {
                 hiaddr = a;
             }
             ++info->nsegs;
-            info->alignment |= phdr[i].p_align;
+            info->alignment |= eppnt->p_align;
         }
     }
 
-- 
2.20.1


