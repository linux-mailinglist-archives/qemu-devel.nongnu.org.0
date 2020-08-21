Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5A624E369
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Aug 2020 00:29:52 +0200 (CEST)
Received: from localhost ([::1]:51894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k9FXj-0005Ve-PE
	for lists+qemu-devel@lfdr.de; Fri, 21 Aug 2020 18:29:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <carenas@gmail.com>) id 1k9FWm-0004hZ-JV
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 18:28:52 -0400
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:52410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <carenas@gmail.com>) id 1k9FWl-0003rb-4t
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 18:28:52 -0400
Received: by mail-pj1-x1043.google.com with SMTP id kr4so1425599pjb.2
 for <qemu-devel@nongnu.org>; Fri, 21 Aug 2020 15:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QCC6D8m3MVJ4dqU5ZmMcrX0nDUrCnVceZw7vbBP0m1Y=;
 b=cWO2Jqyja4P6gp/hQ/2QVZWM22s8A+HpcVeCY9AF+QvQOWy5qToPNuXg1wRFaah7vK
 BYa0BXCAo8RMRQvmAehmi5n4RCwsF1q2TXDJriokt9rh19IyMvNejaXkqGsSyxxlFBQZ
 S3Vg3UgVF1nZRpFTGuyBlb4QHnmL0Vh5Zvdz7XIKSrNvhjW9WD39cCeIhrKGpLdPEcXS
 B6GBMv6/hGjyOGLMo6gBu9qT8gbo96655tqDOY4aq8raq6TrSSQKo9tdE5k2PMu+OPe3
 XHR8f7QUqKz1i4vjzVsCqpOW8dJG13sr5vwjK+b/lpD0IE9u9jZ2a41TdWZIHFW2v+bi
 /gSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QCC6D8m3MVJ4dqU5ZmMcrX0nDUrCnVceZw7vbBP0m1Y=;
 b=Wa8SA55SLZnxmL3Fnh4QfnNMzTVM7rjDfdp9xOjUn9zDiV2bJMnzsMhOzxqCJWXpFz
 /96h5lneZaa+HSpeTsuCXOwP3etdueVb2kSefu6DCQZ6yLZQ52XTLyxjW+O8nGgvgPLm
 gdowpv/59BUZvfnzJovAE1BOfUtCxd0ptPQ3bkX+W5VAYgv4LIhACvgasxWMLQGRkk4j
 lm/xsBbcloCBi9GVlBjJmOuDUPWgM9kz1yUjteKYviddk57btpBlQL7Kruu9oBxSrCmH
 qdOU6G/E8uKNK45aZ9tpjBu7A5dizVssKIGmGr/SDKJB8luMRtZxcKbAB/jHJxIIUrHW
 X64Q==
X-Gm-Message-State: AOAM5302f5YUfdRWHwDfRQn/YaWV0Dao0/UFUKfRdAMZx5AXRHWcZvrv
 zwIczJrzQU65IN0iQU+lEw+bPJUUbsQ=
X-Google-Smtp-Source: ABdhPJySIFKuEPIYo/nYD6gYLxY+zKk6dQHpuCGDSFKrVz0+b6KNrj5BrsllYYh0JtLSWqEohml5dg==
X-Received: by 2002:a17:902:a412:: with SMTP id
 p18mr3906979plq.283.1598048928971; 
 Fri, 21 Aug 2020 15:28:48 -0700 (PDT)
Received: from localhost.localdomain (c-67-188-192-166.hsd1.ca.comcast.net.
 [67.188.192.166])
 by smtp.gmail.com with ESMTPSA id u14sm3611805pfm.103.2020.08.21.15.28.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 21 Aug 2020 15:28:48 -0700 (PDT)
From: =?UTF-8?q?Carlo=20Marcelo=20Arenas=20Bel=C3=B3n?= <carenas@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] linux-user: warn if trying to use qemu-mipsn32[el] with non
 n32 ELF
Date: Fri, 21 Aug 2020 15:28:30 -0700
Message-Id: <20200821222830.91463-1-carenas@gmail.com>
X-Mailer: git-send-email 2.28.0.213.gdd9653da77
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1043;
 envelope-from=carenas@gmail.com; helo=mail-pj1-x1043.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: =?UTF-8?q?Carlo=20Marcelo=20Arenas=20Bel=C3=B3n?= <carenas@gmail.com>,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While technically compatible will (depending on the CPU) hopefully fail
later with a cryptic error:

  qemu: Unexpected FPU mode

Provide an earlier hint of what the problem might be by detecting if the
binary might not be using the n32 ABI and print a warning.

Signed-off-by: Carlo Marcelo Arenas Belón <carenas@gmail.com>
---
 linux-user/elfload.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index fe9dfe795d..64c3921cd9 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -2390,6 +2390,13 @@ static void load_elf_image(const char *image_name, int image_fd,
     if (!elf_check_ehdr(ehdr)) {
         goto exit_errmsg;
     }
+#ifdef TARGET_ABI_MIPSN32
+/* from arch/mips/include/asm/elf.h */
+#define EF_MIPS_ABI2 0x00000020
+    if (!(ehdr->e_flags & EF_MIPS_ABI2)) {
+        fprintf(stderr, "warning: ELF binary missing n32 flag\n");
+    }
+#endif
 
     i = ehdr->e_phnum * sizeof(struct elf_phdr);
     if (ehdr->e_phoff + i <= BPRM_BUF_SIZE) {
-- 
2.28.0.213.gdd9653da77


