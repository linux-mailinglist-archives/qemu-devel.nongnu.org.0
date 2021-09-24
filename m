Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F761416F70
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 11:48:26 +0200 (CEST)
Received: from localhost ([::1]:41584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mThof-0000IZ-Hl
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 05:48:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mThfj-0002ux-IH
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:39:12 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:41536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mThfi-00064U-2x
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:39:11 -0400
Received: by mail-wr1-x434.google.com with SMTP id w29so25411158wra.8
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 02:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q67ayF6mp3x5mowVghP1HWubdfr0XK9yIREcYkI/kjw=;
 b=X8jSb8nlvy5DUpq4TReP05C74t8DlQTUjC9WZyHg9+N597Hi1Q7xk+7LGFGfJ1rj9q
 G6pMzt/xI0ZVBxcI7p6dQaCTAchymKCBWOxxR7iyM2HqcKwOnxGYUO7NIQ1fu3H5LbCY
 +ar/LzCQ+2nnLUAbrSE7G5EjhAvSenY8urSQuT74OFjK5MWL9ZLc//Rgo4PAfIDI6wol
 Ym3nEke8uC7jWo9iO4+Dtxg0GJsyV+ozUT28S9Q2C0eNxC/S/VhT9ISeTTcbvHSgmUgx
 acl2iVfvfVdM5ENxLspEl5+THSFKEC60KXHx03yHZRe61bl/yO9OogSbcRu74pQ95zpg
 Um6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Q67ayF6mp3x5mowVghP1HWubdfr0XK9yIREcYkI/kjw=;
 b=QkyUF/CZfpyZ5yAoN6ZMd8oEm3RCq2DXRSrB1uXNZ/lwdKZEZ75B0Zpz0wkb2XDvRm
 rhxBLeXSfYj5e9sP0iVqXFqujg2+j3xxuo8tQyV/xvtCcyyXYwIzbZIhvEd8/z7ChAVd
 r+swV4jnDyTyDoPCRwVtm2duljFyHjPfjLmpIbIp8NdR/DWhelBBf338fFRgzzsssBD6
 AhckFYfEl96NQmnFB3m6Hezvfdy8+3JzKgJwNSY+Xd/mx8h1/lG89U2lWk3VRQO2igJS
 n1XBagtomzfYULGyhyvrJgYyNIkv/yf3Y5QqFvF0kQ/lULeCj1hkcjhy6XMm0X/XfUWe
 RnmQ==
X-Gm-Message-State: AOAM531SIYl1A4LZEL6iryGUSAt8D8X+TDvgfLP8kyqXXEvBAlbuLV0R
 C2mfH/RJnmiCG4M+4ioqkVCwcdA92dc=
X-Google-Smtp-Source: ABdhPJxyM6ks6f/AtXulz0XTwPp/1u7KfSSyfo+XwK0vrDjMgXFmljXnDBube4Y4Mvua0waVnfMNfg==
X-Received: by 2002:a1c:9dd2:: with SMTP id g201mr1046586wme.46.1632476348340; 
 Fri, 24 Sep 2021 02:39:08 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 s2sm7438491wrn.77.2021.09.24.02.39.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 02:39:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 04/40] hw/core: Un-inline cpu_has_work()
Date: Fri, 24 Sep 2021 11:38:11 +0200
Message-Id: <20210924093847.1014331-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210924093847.1014331-1-f4bug@amsat.org>
References: <20210924093847.1014331-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We want to make cpu_has_work() per-accelerator. Only declare its
prototype and move its definition to softmmu/cpus.c.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/cpu.h | 8 +-------
 softmmu/cpus.c        | 8 ++++++++
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 2bd563e221f..e2dd171a13f 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -546,13 +546,7 @@ void cpu_dump_state(CPUState *cpu, FILE *f, int flags);
  *
  * Returns: %true if the CPU has work, %false otherwise.
  */
-static inline bool cpu_has_work(CPUState *cpu)
-{
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-
-    g_assert(cc->has_work);
-    return cc->has_work(cpu);
-}
+bool cpu_has_work(CPUState *cpu);
 
 /**
  * cpu_get_phys_page_attrs_debug:
diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 646326b24fd..6a05860f7fe 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -251,6 +251,14 @@ void cpu_interrupt(CPUState *cpu, int mask)
     }
 }
 
+bool cpu_has_work(CPUState *cpu)
+{
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+
+    g_assert(cc->has_work);
+    return cc->has_work(cpu);
+}
+
 static int do_vm_stop(RunState state, bool send_stop)
 {
     int ret = 0;
-- 
2.31.1


