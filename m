Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8EF6A28A7
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Feb 2023 10:50:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVrB8-0008I6-EW; Sat, 25 Feb 2023 04:49:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVrB6-0008HP-7l
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:49:16 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVrB4-0000M8-LV
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:49:16 -0500
Received: by mail-wm1-x336.google.com with SMTP id p16so1284670wmq.5
 for <qemu-devel@nongnu.org>; Sat, 25 Feb 2023 01:49:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=246xagcTsnQ1kTR2FWcWjuRTykOQzJVC1A3AAvRLwWQ=;
 b=nVdAtlkXPxM3OTiTLluZqNrT9rsJrlRpDUlsPdLxxr/oi9GEUwB7p8iaPwZAeg4hvR
 MCrPBAfbj5mI+XwrwIdCwfjJh3/k1Vc6RyM5Gx9IzW2R928zYz8EHz8fTN+uzxJc8PKj
 ZNvKn77NdUbOibDbUZpPEajIegG7gXUA3DhjwxL1FproHY9LuzNvraMYTnT6Lm7+5+/+
 YYhUmR9TdZtcKaxcAq6n/nqokxF3nfT2IaPMOa+eaYOR4OADOphqBam+oaoRAiZgzAaZ
 Z3DPpcnVfV/p1mOVvQMT1NdgTg7ppfbtx0zFQ5i+DY+OlvK87OxyNVzc+76S/PzPddD9
 FwuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=246xagcTsnQ1kTR2FWcWjuRTykOQzJVC1A3AAvRLwWQ=;
 b=bfgt8V9n9M9ybId79bItnS6k/4Xzf0Sfka9OKJ3y1FE3Nimojr8cVWqbs+ATE7Fapb
 SxE4U0XmOcqI/IvTkXOWPUUKHHpTAydz1+GcK+eRORMlVd8hldOg4qGRFyy8dLsvs0NF
 KgS7ns1hXj1zQH+3DBV1QiqWvR4vNFDphUyHKGwBiiiNzvv4jk/Z6/2+dcuGxYoP3fxz
 eYyegSdCMS3xjSr9jXi5RyYMXRuqM0chpEnWoaY3TB0Wr5VNnNlFSb0ntR4oVfKs+hZz
 5QU2dj5zqMMkKvL8mGZuBipeulfNL/HbNYYeWHMzz7IZWVaMhnB0JYwqPLZUh98mSLPO
 8kew==
X-Gm-Message-State: AO0yUKW1GYvsDJWue+k/5MeR8Y22A0mOC0S3RzRV6z+1z1PHD2bpOgH+
 KLkNCnJ/kg7DbDDmdoGiho/gj3OuIb+qoFrvNoc=
X-Google-Smtp-Source: AK7set9rCp7dqPI5No4yuV0IplIxKkzlg7c0GOmXWQmhludGyGo3kw3/UA3UP1WDZgbcEjzWCQ1sXA==
X-Received: by 2002:a05:600c:44d2:b0:3ea:4af0:3475 with SMTP id
 f18-20020a05600c44d200b003ea4af03475mr7090621wmo.1.1677318553043; 
 Sat, 25 Feb 2023 01:49:13 -0800 (PST)
Received: from localhost.localdomain (120.red-95-127-35.staticip.rima-tde.net.
 [95.127.35.120]) by smtp.gmail.com with ESMTPSA id
 r14-20020adff70e000000b002c567881dbcsm1292986wrp.48.2023.02.25.01.49.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 25 Feb 2023 01:49:12 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Janosch Frank <frankja@linux.ibm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v6 1/5] dump: Replace tswapN() -> cpu_to_dumpN()
Date: Sat, 25 Feb 2023 10:48:59 +0100
Message-Id: <20230225094903.53167-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230225094903.53167-1-philmd@linaro.org>
References: <20230225094903.53167-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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

Reported-by: Richard Henderson <richard.henderson@linaro.org>
Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 dump/dump.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index 1362810991..0ab229e5e9 100644
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


