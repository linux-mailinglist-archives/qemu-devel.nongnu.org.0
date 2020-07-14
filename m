Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7679821F79A
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jul 2020 18:46:40 +0200 (CEST)
Received: from localhost ([::1]:58344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jvO4l-0005zi-9u
	for lists+qemu-devel@lfdr.de; Tue, 14 Jul 2020 12:46:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jvO1K-00016k-8R
 for qemu-devel@nongnu.org; Tue, 14 Jul 2020 12:43:06 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:35708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jvO1I-0006og-RM
 for qemu-devel@nongnu.org; Tue, 14 Jul 2020 12:43:05 -0400
Received: by mail-wr1-x444.google.com with SMTP id z2so23010981wrp.2
 for <qemu-devel@nongnu.org>; Tue, 14 Jul 2020 09:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PzbjB/znNTLdn/duWFeKb6OtNfTdbAMU2eEEnU94nEU=;
 b=D6JeR7niBPeOtM2aVpDV7H5eGxh1Ga04hpsRY8rq57U+JAW8Bp+9pCT9Z6bKlknHYS
 VqJ3kjWCz/BZbnRqOQgqsaFc5IBCtQ5SqdQKqzr4l/mO0oTgspErlnajjDq0VhBBZDoR
 l7y6tMrUzkXB06v8RA6roiUxfOT7+0s4bMo/5GhR/BgCj57LIEG+8qI6K3nEqwfd28Ma
 D34hucEA/nquLozEj1L3GvZG3yuvivDeSforMu0fFrVdaeFgHCFbE1R4neGBsKp1qClv
 CibaC8jeqw7B2n8Tczy6WTx1nrwQxXEvHRNMI+vajkSREgSq/HGheQ/Mo26h5l4ifOSw
 CpzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=PzbjB/znNTLdn/duWFeKb6OtNfTdbAMU2eEEnU94nEU=;
 b=IkLEOev+5EWTFTWV1lZF0ZOg3PJ2xpMESZ76bxnmPfqR4cBPlCrgTp2nxmL1PG+lWv
 HyYkG8aYm866zQa20yPcYtqpTXPNkoemWA+ZC2NN6S7knq4xOB05ot5CNXmB6On8m5w4
 r8zSmG8EUUYoEYxHCtxJHJXECFPJyaePIC+lHO7xe9FQ2KLPKuXcj5y1Y8ntYs67BJL4
 QJ2xlhJivCAdtbHU19v3FIDI3Hx6mw8OCD9yeH/vQ7y9QZ9ty1l+77o8fvkESmjrzebP
 NaYjvDVmC6CAz81jzQCURXLDQPu6qrzhv5v6LF+tdIVNC36XlXTpqkSXp/6JQrdFH0nq
 Eh9g==
X-Gm-Message-State: AOAM530D0Il5xhcqj/4TVB/UCLg02ttmDzuWEvJKMl6dzMl4RI44UzRv
 S1iLu+PJLkCfAKsh9MLU1uy7gVKcHsw=
X-Google-Smtp-Source: ABdhPJznc143xysamN84kM58D8aC4AFCINXWkIKeiF9kYtcARHnZQith5zcV9pZyfF1TmEKG9HMXhQ==
X-Received: by 2002:adf:f60b:: with SMTP id t11mr7324748wrp.249.1594744983428; 
 Tue, 14 Jul 2020 09:43:03 -0700 (PDT)
Received: from localhost.localdomain
 (138.red-83-57-170.dynamicip.rima-tde.net. [83.57.170.138])
 by smtp.gmail.com with ESMTPSA id 138sm6474380wmb.1.2020.07.14.09.43.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 09:43:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.1 4/4] hw/avr/boot: Fix memory leak in
 avr_load_firmware()
Date: Tue, 14 Jul 2020 18:42:57 +0200
Message-Id: <20200714164257.23330-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200714164257.23330-1-f4bug@amsat.org>
References: <20200714164257.23330-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sarah Harris <S.E.Harris@kent.ac.uk>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Michael Rolnik <mrolnik@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The value returned by qemu_find_file() must be freed.

This fixes Coverity issue CID 1430449, which points out
that the memory returned by qemu_find_file() is leaked.

Fixes: Coverity CID 1430449 (RESOURCE_LEAK)
Fixes: 7dd8f6fde4 ('hw/avr: Add support for loading ELF/raw binaries')
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/avr/boot.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/avr/boot.c b/hw/avr/boot.c
index 6fbcde4061..151734f82d 100644
--- a/hw/avr/boot.c
+++ b/hw/avr/boot.c
@@ -60,7 +60,7 @@ static const char *avr_elf_e_flags_to_cpu_type(uint32_t flags)
 bool avr_load_firmware(AVRCPU *cpu, MachineState *ms,
                        MemoryRegion *program_mr, const char *firmware)
 {
-    const char *filename;
+    g_autofree char *filename;
     int bytes_loaded;
     uint64_t entry;
     uint32_t e_flags;
-- 
2.21.3


