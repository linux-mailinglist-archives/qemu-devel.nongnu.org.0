Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF215092E2
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 00:34:22 +0200 (CEST)
Received: from localhost ([::1]:44242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhItx-0000in-NL
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 18:34:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nhIe7-0000nA-Gd; Wed, 20 Apr 2022 18:17:59 -0400
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30]:42897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nhIe5-0006C2-UQ; Wed, 20 Apr 2022 18:17:59 -0400
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-e604f712ecso3498123fac.9; 
 Wed, 20 Apr 2022 15:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Nbl4dsoUDfs/HAXd7ljfIQlE+QgstTQR9elRNvEvUbU=;
 b=okXXjV3hNxIuXaY86IhANYuTvxQBG/vGUqCQFQswM1Fl8DPlLaix7knNJ1IJ95fwgX
 uXdXMitVuXA9P2mRK+k6a2QmbyueNlNj5H2DD12klkNPI0rojU2n3sHIb2lHkhKQkyg5
 u4mBkVcuHb31nXq29/ndefZXFJu4oF9FscZyAM8nu/kpUYxFU2NmOK4slHu9RG0Z62Hj
 wR5ZBN5I6rxf4mc13Y+kT7Ou8o9ZAuRDDI/LdKHmacHU+qjwNcKdkL8IlactpbV22/Zr
 qM70dDU+b0Cu89WZwuEAf7ppvSLZp9Yjo5Ql3nRgefVgRZ7EuLsTNoUZ8H9BD/p9tx0Y
 JTLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Nbl4dsoUDfs/HAXd7ljfIQlE+QgstTQR9elRNvEvUbU=;
 b=MfqyhVO2l3jttBD6XRMtp7eZPfR/FCR4R5WMCJaK3ihIkE7B3wODCxfQSyUjNxhOFi
 j9QiKEhEsL/+Ml3MJTrCHlzrBHxt3kYtVDC9C/gEuJkGpDKrhBmGwUKPRxV34u2YIgqJ
 UtbEK50afwuuczHb187qt3qC+4lWn/aXxmwA1QdcGDBKVjQ/J+czPhl9fp03s60CoC9L
 ce/CJeiAKlT0JrJv1JV6vo4uvaklKU5mKHrnPB9U5SCZLkfDjPdEYFNs21bYpkfeQJ1r
 FO2cOwOexCUH3YQpmZWKjlwlp0YR/iEviU6uwjkzEsDoYfA8wcEnG2Y/BHAw94HUcYN4
 8Y7A==
X-Gm-Message-State: AOAM531tZpk54hbhRKQujEJ3vQNkv9rLc+LkHpUzxpWIY+R7yn5MRuQi
 1VbSm9ZcXqxFQUeJ2gxvOQD+nCLxS8I=
X-Google-Smtp-Source: ABdhPJz8KF/DnXnYfpSq+/NFcMX9/L4GS8GQ/4JUINVBzOkdqXR4nlkP2mL0yiRJMCnmtYy0/bYLDQ==
X-Received: by 2002:a05:6870:a1a0:b0:e2:9331:cc30 with SMTP id
 a32-20020a056870a1a000b000e29331cc30mr2529385oaf.155.1650493076491; 
 Wed, 20 Apr 2022 15:17:56 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c7:486c:c4fd:c4aa:a799:60c2])
 by smtp.gmail.com with ESMTPSA id
 14-20020aca110e000000b00322847e6f53sm3876082oir.46.2022.04.20.15.17.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 15:17:56 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 18/23] hw/ppc/ppc405_boards: Initialize g_autofree pointer
Date: Wed, 20 Apr 2022 19:13:24 -0300
Message-Id: <20220420221329.169755-19-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220420221329.169755-1-danielhb413@gmail.com>
References: <20220420221329.169755-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::30;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x30.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 danielhb413@gmail.com, qemu-ppc@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bernhard Beschow <shentey@gmail.com>

Resolves the only compiler warning when building a full QEMU under Arch Linux:

  Compiling C object libqemu-ppc-softmmu.fa.p/hw_ppc_ppc405_boards.c.o
  In file included from /usr/include/glib-2.0/glib.h:114,
                   from qemu/include/glib-compat.h:32,
                   from qemu/include/qemu/osdep.h:132,
                   from ../src/hw/ppc/ppc405_boards.c:25:
  ../src/hw/ppc/ppc405_boards.c: In function ‘ref405ep_init’:
  /usr/include/glib-2.0/glib/glib-autocleanups.h:28:3: warning: ‘filename’ may be used uninitialized in this function [-Wmaybe-uninitialized]
     28 |   g_free (*pp);
        |   ^~~~~~~~~~~~
  ../src/hw/ppc/ppc405_boards.c:265:26: note: ‘filename’ was declared here
    265 |         g_autofree char *filename;
        |                          ^~~~~~~~

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220405123534.3395-1-shentey@gmail.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/ppc405_boards.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
index 32013b8983..a66ad05e3a 100644
--- a/hw/ppc/ppc405_boards.c
+++ b/hw/ppc/ppc405_boards.c
@@ -261,13 +261,13 @@ static void ref405ep_init(MachineState *machine)
     /* allocate and load BIOS */
     if (machine->firmware) {
         MemoryRegion *bios = g_new(MemoryRegion, 1);
-        g_autofree char *filename;
+        g_autofree char *filename = qemu_find_file(QEMU_FILE_TYPE_BIOS,
+                                                   machine->firmware);
         long bios_size;
 
         memory_region_init_rom(bios, NULL, "ef405ep.bios", BIOS_SIZE,
                                &error_fatal);
 
-        filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, machine->firmware);
         if (!filename) {
             error_report("Could not find firmware '%s'", machine->firmware);
             exit(1);
-- 
2.35.1


