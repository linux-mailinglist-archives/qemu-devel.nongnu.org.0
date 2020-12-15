Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D61252DAEC7
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 15:20:52 +0100 (CET)
Received: from localhost ([::1]:33554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpBC7-0001sO-Qg
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 09:20:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpB4W-0001WA-KK
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 09:13:00 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:36184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpB4O-00079d-Vz
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 09:13:00 -0500
Received: by mail-wm1-x329.google.com with SMTP id y23so18655164wmi.1
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 06:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=qgfC7l4EWvSrwnuyqWJuBWbsmGfDi3SFHMaqqRdkMvE=;
 b=wEp0g04liYWw/H+sTFCDYhYpr5uP+9WAXqoqhO2L2SS7aLg2ALlCfgUZRGMyzyO2fm
 vsSoekcRtHzLsRsQVEGXiEcdVvY/jOzvrpr75fajzEy3up6rx6fn3TaEFNBdQjLJZg/v
 7nTuvTxeffZ9cq37DgYxSB/iYhWrIWMpYyZrL51ddxLstAgbQLJXbHsi6hI2mqOdyRYK
 oYvBilWq+K9zrNuTe5bcdny4AOrqwF+QFsQtRbjGj0lp0e6V6jYW/Q2W7vk3CPMzIv79
 75G+DeEU5n7jto3vcdBpc09lEQmPgaNeyd2A/Wh4aHpFmOibsIMqqRqQ/tf+Kgpu2Rpy
 g20g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qgfC7l4EWvSrwnuyqWJuBWbsmGfDi3SFHMaqqRdkMvE=;
 b=ZNLO7pYYOydrJYmXbKHmPGdtjTv9DXNgW+xWIUtZxt1/AJKVFAdusQbZfmwIaqfRpr
 YqcEUyqwjUhYBEQfPElRGqE2C3B7UkqT+N1++apk479NnTf4Mshd5JRvvRuzw06nxe2g
 5O6EremhMTNeyW+1jJpuUhAw3Z+4YYrrlJNf3wCdogG9S46Kms3f4FJAImFrVELgglOC
 m95DkWSENQy08GT8Ah/dvlhkkgmAMLZh2dlzfIjZ/UuKUvrlFxpYvRHGSThKZq+RgyT4
 7zdfgaD99xWnYUUw5NZM7Bl909GREGJi0qiLlVQS1so16/nJj47zJBxQ+wS2No9PBPeo
 CHDQ==
X-Gm-Message-State: AOAM533kT6+Nxml3rYssxWdkWVQZGHRKBRnhfKoYwpeyecAqWjomg1Hn
 Rb+jqWu0R+ZLVAs0UyClQVAoQimvt1x8sA==
X-Google-Smtp-Source: ABdhPJx+0WQJR90XGbLlEvOFvh+gQYn1iqJXnKY6gr8RtVmjc7JtdjnngdwMs46c7AtQCM4yyAJCfQ==
X-Received: by 2002:a7b:c7d3:: with SMTP id z19mr22530758wmk.31.1608041571438; 
 Tue, 15 Dec 2020 06:12:51 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w21sm19667319wmi.45.2020.12.15.06.12.50
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 06:12:50 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/20] elf_ops.h: Don't truncate name of the ROM blobs we create
Date: Tue, 15 Dec 2020 14:12:27 +0000
Message-Id: <20201215141237.17868-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201215141237.17868-1-peter.maydell@linaro.org>
References: <20201215141237.17868-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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

Currently the load_elf code assembles the ROM blob name into a
local 128 byte fixed-size array. Use g_strdup_printf() instead so
that we don't truncate the pathname if it happens to be long.
(This matters mostly for monitor 'info roms' output and for the
error messages if ROM blobs overlap.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20201129203923.10622-4-peter.maydell@linaro.org
---
 include/hw/elf_ops.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/hw/elf_ops.h b/include/hw/elf_ops.h
index 6fdff3dced5..53e0152af53 100644
--- a/include/hw/elf_ops.h
+++ b/include/hw/elf_ops.h
@@ -330,7 +330,6 @@ static int glue(load_elf, SZ)(const char *name, int fd,
     uint64_t addr, low = (uint64_t)-1, high = 0;
     GMappedFile *mapped_file = NULL;
     uint8_t *data = NULL;
-    char label[128];
     int ret = ELF_LOAD_FAILED;
 
     if (read(fd, &ehdr, sizeof(ehdr)) != sizeof(ehdr))
@@ -544,7 +543,8 @@ static int glue(load_elf, SZ)(const char *name, int fd,
              */
             if (mem_size != 0) {
                 if (load_rom) {
-                    snprintf(label, sizeof(label), "phdr #%d: %s", i, name);
+                    g_autofree char *label =
+                        g_strdup_printf("phdr #%d: %s", i, name);
 
                     /*
                      * rom_add_elf_program() takes its own reference to
-- 
2.20.1


