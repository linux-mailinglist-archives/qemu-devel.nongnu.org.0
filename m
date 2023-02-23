Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C30A56A13A9
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 00:19:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVKqn-0008VJ-Nf; Thu, 23 Feb 2023 18:18:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVKqk-0008V9-EP
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 18:18:06 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVKqi-0000Ry-TV
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 18:18:06 -0500
Received: by mail-wm1-x32a.google.com with SMTP id az36so671649wmb.1
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 15:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wWu2Li0HdtRyVbKb/qvrvVuTsZ+F9Z5D4ZsK6YGQoVI=;
 b=lj9M2Mafl9UAuQ3IL09b432c7nvJHA2y5nfxlSA1rbHRGirABBZ0l7XMN6OKxjZ6bs
 HZKk+DnUDoVp6z2q6TM/0inCFB5awJAtiVLkaO60R58+o29kVYDrxPW4fFMJKFQ9am6w
 69hXBDMLhQKj3zG6SYCOhCXchNcdLAUzFMGsXc1JZEB0ddBatQUJ+C6ocCQWh73Ad1BF
 QfwXLVUx2tA4ZDvwxbhqjW4D7uAugp+uZUy8SfKSf2MDzkhQVUKxAaWxfFa+Gtt0C2hc
 6pQ9I8acWpW7E5hHQ6fVW9gEqcXKRgjP88geZeAmM1AdZsyuWM281xMQeK1cCoaSdVEu
 ox1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wWu2Li0HdtRyVbKb/qvrvVuTsZ+F9Z5D4ZsK6YGQoVI=;
 b=C1v/L2OrqbJnyTVAOqlC61Yuln6cGe6oOidKeWY0wE1zModNud+WMdV5xhaEH4ZHoV
 zvsaLHQ0Avx061ig8Ce4qU1IU15G4iI8GrsStGeRAl3vd9SRQhgUqWNkTkdiuCKZwRB4
 Ff2KyyO62f18y860nxuLimPJljrTNePZp1d/m+Ruc1mOfzTlI2AzbEPERXYrNysSr//a
 XrzClewJV3W4YCZOz+JSEFs3IUcudbjzvG2JXq/G/g8368WBVoyt/3zFb8IfseW9acvz
 2zvM0Qn6aU79rcxMcDjIUHUNo9yIhdXZDQ216T5dXyhanspU9xId+pPyP76VhEvu2B+d
 49bw==
X-Gm-Message-State: AO0yUKWaXq74pHSbqv4bqAGMkJrLRKNkM+8vl2T/tF3zq5tYiLU3WIyx
 TztWpo7bKZvhPcox+QRjzYJ/VBEqZmc2Vzn5
X-Google-Smtp-Source: AK7set9xGP6wlkpIE/BCD0V0qLLTGQaYqfSFBZSK13N3kTCSIPsh1qtKZxFKoT3x5lf9YeloeaZ+Wg==
X-Received: by 2002:a05:600c:30d3:b0:3d5:365b:773e with SMTP id
 h19-20020a05600c30d300b003d5365b773emr5351712wmn.39.1677194283002; 
 Thu, 23 Feb 2023 15:18:03 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 u16-20020a05600c441000b003eafc47eb09sm571786wmn.43.2023.02.23.15.18.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Feb 2023 15:18:02 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Janosch Frank <frankja@linux.ibm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v4 1/7] dump: Replace tswapN() -> cpu_to_dumpN()
Date: Fri, 24 Feb 2023 00:17:49 +0100
Message-Id: <20230223231755.81633-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230223231755.81633-1-philmd@linaro.org>
References: <20230223231755.81633-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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


