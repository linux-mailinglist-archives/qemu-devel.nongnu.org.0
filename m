Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5623A37CFCE
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 19:32:57 +0200 (CEST)
Received: from localhost ([::1]:60480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgsjA-0006as-8b
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 13:32:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1lgsUf-0007K5-Kx
 for qemu-devel@nongnu.org; Wed, 12 May 2021 13:17:57 -0400
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132]:42928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1lgsUR-0008LV-J9
 for qemu-devel@nongnu.org; Wed, 12 May 2021 13:17:57 -0400
Received: by mail-il1-x132.google.com with SMTP id s9so3526671ilp.9
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 10:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NZAeTzWq6yzAsdTF9f48XYP2VE7+jJHqHG4YMFKg6Bk=;
 b=ojLqkrW3oOlf+9giqzX5ScNEMmouAcrxY5pa3xi7fhzz8IL3a/PFRX2HOsy1gfjs0w
 HLiaRRpBzFHeSv1wDaD3Y5Zx91LrDMal5WYyMLRl7SP7uOvzLO3vH7NAHewbZ34iQOa7
 Xf13dN0+fqOoZMR0LQAuIkuy8mNpfMCgbs5m++rb4wVDU4ZEym1ErLmok73322O8dvK8
 E+KUUHcmaJePseCVlt8fz/BN0uF20704R5u84AP+mtzyE2ag4slCO30HnTTLKY5qamKq
 C7HziKx7EG7GvSWDPNvkFv6ZRCYYX+7m3/Sh1UGfmQCWyDKruxzJDT5oH1OpvqEtqHar
 cwaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NZAeTzWq6yzAsdTF9f48XYP2VE7+jJHqHG4YMFKg6Bk=;
 b=gImVf6aJymLf3+A/5/mspVLffhAVeMs7HCCJyWoIDcirPTbJecGx/Bks0wZCqTAGdz
 W/OFZWdMbB04okonuy68tE6MaSLlBdcoboyJ74ruLRnQxtCwMTCfZt8l1A4rUsFuiNEK
 xAi47VnDllaEMqY+pwTjnsceR8BxgoEco9OfEkdzvLvZ7L+oREPHcRl/Jm9sDwgeCyH4
 6iDK8jF7c8sHh1GCnxY6wwoGCpErr8CGI13oJnOkg1XmgVt1CkpfVJUYZ5HYCirljazS
 0mqQ1+WN5ATA0ILmUCplAa+N2/Z/apz5+Nz+NhrGjUCmfHH0UIeXPP8HDSA0nEwPg210
 T/2w==
X-Gm-Message-State: AOAM532p6MiNB301Tic3/h51Uq0x2VajxnoV5tciuzaCgqfLHmFuhXzk
 iFSF3YiGskA1mrP0oghbmxcwS8phN9CjYw==
X-Google-Smtp-Source: ABdhPJzgG5I26KwUaxvExXhqAmmhCGfE+x+7eMHLtHxCamAo81qhey5JM6CFGpF1KCusXW8fOh/tlA==
X-Received: by 2002:a92:c54b:: with SMTP id a11mr17975094ilj.174.1620839859133; 
 Wed, 12 May 2021 10:17:39 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id d2sm192064ile.18.2021.05.12.10.17.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 May 2021 10:17:38 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/20] bsd-user: use qemu_strtoul in preference to strtol
Date: Wed, 12 May 2021 11:17:12 -0600
Message-Id: <20210512171720.46744-13-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210512171720.46744-1-imp@bsdimp.com>
References: <20210512171720.46744-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::132;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x132.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: kevans@freebsd.org, Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/main.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index 0f9e6bfbc0..18f806b032 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -36,6 +36,7 @@
 #include "tcg/tcg.h"
 #include "qemu/timer.h"
 #include "qemu/envlist.h"
+#include "qemu/cutils.h"
 #include "exec/log.h"
 #include "trace/control.h"
 
@@ -612,7 +613,7 @@ int main(int argc, char **argv)
     TaskState ts1, *ts = &ts1;
     CPUArchState *env;
     CPUState *cpu;
-    int optind;
+    int optind, rv;
     const char *r;
     const char *gdbstub = NULL;
     char **target_environ, **wrk;
@@ -677,8 +678,8 @@ int main(int argc, char **argv)
             }
         } else if (!strcmp(r, "s")) {
             r = argv[optind++];
-            x86_stack_size = strtol(r, (char **)&r, 0);
-            if (x86_stack_size <= 0) {
+            rv = qemu_strtoul(r, &r, 0, &x86_stack_size);
+            if (rv < 0 || x86_stack_size <= 0) {
                 usage();
             }
             if (*r == 'M') {
@@ -709,7 +710,10 @@ int main(int argc, char **argv)
                 exit(1);
             }
         } else if (!strcmp(r, "B")) {
-            guest_base = strtol(argv[optind++], NULL, 0);
+            rv = qemu_strtoul(argv[optind++], NULL, 0, &guest_base);
+            if (rv < 0) {
+                usage();
+            }
             have_guest_base = true;
         } else if (!strcmp(r, "drop-ld-preload")) {
             (void) envlist_unsetenv(envlist, "LD_PRELOAD");
-- 
2.22.1


