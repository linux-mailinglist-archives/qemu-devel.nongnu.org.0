Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 803202C7B32
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Nov 2020 21:42:10 +0100 (CET)
Received: from localhost ([::1]:43602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjTWL-0000FL-HF
	for lists+qemu-devel@lfdr.de; Sun, 29 Nov 2020 15:42:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kjTU3-0007I1-SL
 for qemu-devel@nongnu.org; Sun, 29 Nov 2020 15:39:47 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:40445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kjTTm-0001IA-3l
 for qemu-devel@nongnu.org; Sun, 29 Nov 2020 15:39:47 -0500
Received: by mail-wr1-x443.google.com with SMTP id m6so12585197wrg.7
 for <qemu-devel@nongnu.org>; Sun, 29 Nov 2020 12:39:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I0qwXA+9gejr5uvpg7PQ9uQgqOS7NlfKkSTdv7SC2QI=;
 b=VFjWvij+Omnf/xjpVSDcX3JvCLOIZ+WwnfgT/8+bOoyEIyP0t4eZEaNQzyH/7dW77Q
 CHkMiqz23k5ED5difVOEkb0s89/XJirLD4GxxsGMFH+aNY44Z8H8rpmA3s4BDhSDm/pg
 23xsVOOdPq+CKd8fNClwn67zwo7ZwnKOW0pAH2MWaMdt0OIExc5OWz+AnO0PgUdxcMuV
 wAYq0JQOIyP2SLC8Wt3sfbNuAhsfZwu3/vVy19TXEyD3ccTzyeph4dDcZ52IKtP9U3mx
 VBD+n0g+5tneEWxa/LydDbKIw6pMWENTMSy5gfB8izQVCdTnYtUUTQgdnvvfXaWfFhZi
 Dk+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I0qwXA+9gejr5uvpg7PQ9uQgqOS7NlfKkSTdv7SC2QI=;
 b=VNqcLeRvZVn2tq3j/ktARQWFYFs4CBU0baIfXWaaO/GzXA4CZqaQFDOsbK/uDHcsH9
 xX96AbvaVFCI9jpTIQcWrqZsgbCKTGF8tldXbxet/ziSFE7KetCSJLYZxe96acHTBVlr
 j0clUf55P7RmyzNGrEyz22akoXsOC6FvnC5NBYE3A5Vo75/+Q+uMnSPkFUK2walRPSAN
 ZzNXN8GzzpnwJ7xAX+XtXVEGjxjuLd1KUd2zlC4HfK1tn7b6lZpDD++ydUCOsysp+MLP
 VU9xX/K4XbFU/LkfuzLhkrzf3oVYK0EoIEM3Jm/YDiEmawdEeIW+qwPZE+iuO+k0mERd
 IeWA==
X-Gm-Message-State: AOAM532nOF9KiUs3M/tSVhiyp8UAn9EPsvEcUB03knjWd2A+bg0PQB2U
 /Ux/tCCYLxLJ2+dl8ToCOXqtWnX65OKUhw==
X-Google-Smtp-Source: ABdhPJxNlIuspWZPxG38hY72ANKFFDCHD9VK1nzXaSyz4Vv+2tWZu1nIKP8hEyTkp5xxPOMqU3+7WQ==
X-Received: by 2002:adf:e54f:: with SMTP id z15mr24663384wrm.159.1606682368489; 
 Sun, 29 Nov 2020 12:39:28 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q12sm23618393wrx.86.2020.11.29.12.39.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Nov 2020 12:39:27 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] elf_ops.h: Don't truncate name of the ROM blobs we create
Date: Sun, 29 Nov 2020 20:39:22 +0000
Message-Id: <20201129203923.10622-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201129203923.10622-1-peter.maydell@linaro.org>
References: <20201129203923.10622-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x443.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently the load_elf code assembles the ROM blob name into a
local 128 byte fixed-size array. Use g_strdup_printf() instead so
that we don't truncate the pathname if it happens to be long.
(This matters mostly for monitor 'info roms' output and for the
error messages if ROM blobs overlap.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
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


