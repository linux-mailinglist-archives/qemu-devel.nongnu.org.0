Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF8C2C7B35
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Nov 2020 21:45:54 +0100 (CET)
Received: from localhost ([::1]:53890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjTZx-00053P-92
	for lists+qemu-devel@lfdr.de; Sun, 29 Nov 2020 15:45:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kjTU4-0007IE-1u
 for qemu-devel@nongnu.org; Sun, 29 Nov 2020 15:39:48 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:42209)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kjTTm-0001IE-Ve
 for qemu-devel@nongnu.org; Sun, 29 Nov 2020 15:39:47 -0500
Received: by mail-wr1-x443.google.com with SMTP id l1so12588647wrb.9
 for <qemu-devel@nongnu.org>; Sun, 29 Nov 2020 12:39:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7CciqfkCFJWruhtp6R5XMHKgV21axKR+IckWxPTjD2k=;
 b=jOSwrIYWrOBhgVDROjHbF7HtRU/WmZ5F32ZKtoZRYH233d6gJjfqFiVjuQpbaSQF5j
 o6LCs/W4OAI9E3PEOWx5FwNvQPl42C6ss56W1t32qB5d482qDrIgDsJZmleVkFUPslVh
 8bIzRoAue0xJirDAXpqHaxIx8yczjFHoxTiAdKI0uCr6QYOjuN4KlsyZYmotWSVKbo6o
 FbtZUEOI9QSQUBG9q/5GhjIDCGOChG9uKLSuC5afpJfSL1nWLWOb6oLqSUMIFQbJsbYT
 dru0FeG9p1XupRjlR92oLB+zodtg6zHUHfc46F72ML/cxun6dR2iAixUsblVLDEi0hcZ
 1JKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7CciqfkCFJWruhtp6R5XMHKgV21axKR+IckWxPTjD2k=;
 b=QBsF++m17kAya4PAUtdm9R6pwgqgCaIG9eneWF7zziQZ80XyM+jmC8rmAxPA+4v5l3
 m+af/k4PxWbz3KJE3APWHZ4ggL4oDBwEaCPQMMmXECbKnjJ3el+/TmUn3COhD3ayzKnB
 M4Nxai5yl+wAGgt3FYBldZE7B0FTYQ/NaNC+5veruHbN9YU9MOllQqK+ppL5cWRlvfoX
 f5ImsjBhwfeSF7y5xesxUrlTBXX46bs+qtOBR0C2/WzeA2x5dDtspJKla6Ts0kPzqtYk
 REW+pg/U+Lg5YjhrXMGb0BCqoboSqDuSrWJEW9rDRLMwuAaLJrJ6zcfI0YBjABK+6Af/
 IclA==
X-Gm-Message-State: AOAM53346e3jI5yqM/jJssKgSGAzu/koyRxyKk8yisgIAvsziRc42EaL
 nJhbNAANCz39lVz80WoPTTU4OwHOEljwKw==
X-Google-Smtp-Source: ABdhPJyrtp8LhJVvj/6RkZ9UGNlmRZOjcmp1rHbjIUlXfoo/EWFco7It3tGA5F/RwtTTV055oxWsLw==
X-Received: by 2002:a5d:4591:: with SMTP id p17mr24974652wrq.361.1606682369560; 
 Sun, 29 Nov 2020 12:39:29 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q12sm23618393wrx.86.2020.11.29.12.39.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Nov 2020 12:39:28 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] elf_ops.h: Be more verbose with ROM blob names
Date: Sun, 29 Nov 2020 20:39:23 +0000
Message-Id: <20201129203923.10622-5-peter.maydell@linaro.org>
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

Instead of making the ROM blob name something like:
  phdr #0: /home/petmay01/linaro/qemu-misc-tests/ldmia-fault.axf
make it a little more self-explanatory for people who don't know
ELF format details:
  /home/petmay01/linaro/qemu-misc-tests/ldmia-fault.axf ELF program header segment 0

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
This seems nicer to me, but it's a matter of taste, so if people
prefer the current name form we should probably leave it be.
---
 include/hw/elf_ops.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/hw/elf_ops.h b/include/hw/elf_ops.h
index 53e0152af53..8e8436831d2 100644
--- a/include/hw/elf_ops.h
+++ b/include/hw/elf_ops.h
@@ -544,7 +544,8 @@ static int glue(load_elf, SZ)(const char *name, int fd,
             if (mem_size != 0) {
                 if (load_rom) {
                     g_autofree char *label =
-                        g_strdup_printf("phdr #%d: %s", i, name);
+                        g_strdup_printf("%s ELF program header segment %d",
+                                        name, i);
 
                     /*
                      * rom_add_elf_program() takes its own reference to
-- 
2.20.1


