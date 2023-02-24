Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E65C6A1766
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 08:40:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVSfY-0006TQ-Ap; Fri, 24 Feb 2023 02:39:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVSfV-0006T5-Sw
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 02:39:02 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVSfT-0006nN-FU
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 02:39:01 -0500
Received: by mail-wr1-x42c.google.com with SMTP id c12so12958189wrw.1
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 23:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bAATd33pSc/j3eZSZHA0QRA2qTENQnY0OI3ynPM+aM8=;
 b=iZu9TK+4KhrU2gs88QFvqTwwRzk4IABfC9EUw85/XnoDvjXWQaczw7HGHj8/aHdXd0
 YoWFE9FouxfoQSB2FjCkzEVq9zBZEf0TeN7rcvyE4DoYQWuMrXTnEXdrZDvDKfg6VYPK
 9pjRUK9iTvRQvjoc2gT98g4PN5cm47epG4a6939pyDhlHGUJflEgTc6Dyy7q+g83+KaA
 bHHMHf0WL02bXDCFYjsUyiP0EolkTJwPu8Ahbkz45EVOvQVi27eB4j5klR/qzH75gVZb
 TItq6RvoWhneN/+V/mIzYfP80YxIwsGy4LVJ/lxdJ6ZRcXo8RmsypJnZIutinxC/r60V
 Gong==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bAATd33pSc/j3eZSZHA0QRA2qTENQnY0OI3ynPM+aM8=;
 b=KQyu0kwNG3vjlOjDxQ9wXZ4uVY1pFem8SWsEMAe+0NxcbrWVrTcRxlbToHfOX0duWg
 xQjGiuMhPLuU4mz+9VF+VM2uysTwb/bP6WfbFWavSe1jZkd3OHdGiAXkLIH/bJqd7/xP
 ox6Ij0UUlKYMsDyMq92FH0rlvru9aP11b/0WCpn7R3xMhTmJFhTE5IZxS74q0aX3+9nV
 PsP+RWKLDs709oHCQwEmRZletKJ/pL9bK1bi9QvMmiDrEwMoCO7zGLs2xlVHPT0cfv/H
 7ltvuIXQ4QWqEbdhJ9vCKKYyjUSjH5h8IM4J+30e3nEt/EqzV3gxXB45QA0VpMbpPCl6
 s7+A==
X-Gm-Message-State: AO0yUKWSGFrWHTQYaMoElJFVNn0+hYia3joYBfGy6FoMppWgW+bBhzgD
 jpNlsHvy95Nmt2lGQKFejvawerhcPn1EdK9n
X-Google-Smtp-Source: AK7set+Ob0pQWR5FCJ+ru02autwwdgrPRqpVChh2z26QTxDQ3WB+L66LEZVtCXUEfjNOAA3DiJDxYQ==
X-Received: by 2002:adf:e788:0:b0:2c5:585e:334f with SMTP id
 n8-20020adfe788000000b002c5585e334fmr13488638wrm.41.1677224337330; 
 Thu, 23 Feb 2023 23:38:57 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 d10-20020adfe84a000000b002c71d206329sm918169wrn.55.2023.02.23.23.38.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Feb 2023 23:38:56 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Janosch Frank <frankja@linux.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v5 1/5] dump: Replace tswapN() -> cpu_to_dumpN()
Date: Fri, 24 Feb 2023 08:38:46 +0100
Message-Id: <20230224073850.84913-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230224073850.84913-1-philmd@linaro.org>
References: <20230224073850.84913-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

All uses of tswap in that file are wrong, and should be using
cpu_to_dumpN, which correctly tests the endianness of the output.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 dump/dump.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index 279b07f09b..7101169ecb 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -907,13 +907,13 @@ static void get_note_sizes(DumpState *s, const void *note,
     if (dump_is_64bit(s)) {
         const Elf64_Nhdr *hdr = note;
         note_head_sz = sizeof(Elf64_Nhdr);
-        name_sz = tswap64(hdr->n_namesz);
-        desc_sz = tswap64(hdr->n_descsz);
+        name_sz = cpu_to_dump64(s, hdr->n_namesz);
+        desc_sz = cpu_to_dump64(s, hdr->n_descsz);
     } else {
         const Elf32_Nhdr *hdr = note;
         note_head_sz = sizeof(Elf32_Nhdr);
-        name_sz = tswap32(hdr->n_namesz);
-        desc_sz = tswap32(hdr->n_descsz);
+        name_sz = cpu_to_dump32(s, hdr->n_namesz);
+        desc_sz = cpu_to_dump32(s, hdr->n_descsz);
     }
 
     if (note_head_size) {
-- 
2.38.1


