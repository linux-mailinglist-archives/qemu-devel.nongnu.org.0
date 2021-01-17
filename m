Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5D82F9417
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 18:07:36 +0100 (CET)
Received: from localhost ([::1]:51448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1BWY-0001cp-Nw
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 12:07:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1BTO-0000Vz-3n
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 12:04:18 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:34157)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1BTM-0007Mi-Dm
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 12:04:17 -0500
Received: by mail-wm1-x32b.google.com with SMTP id o10so4738030wmc.1
 for <qemu-devel@nongnu.org>; Sun, 17 Jan 2021 09:04:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Uuhg9E01gIMN6bxPkPWGwBLQ5Y4pX/rH09FJ5cXM4eg=;
 b=fv9NEdiVgZ10QSTl0hVJjuNZYRukbZwkCmwg3kY/5hwozedB+THQt6wjo3RWR3Dc+T
 XmJl9mmrvM0yjt8Yx8nkaFCtVE0olYMF6DNYJ/4boqr0+/gr1DYgKH4QwJfGxHHa8ewN
 S/TDg21HiWPewIzvjCLIIeSbEFNZrEWRU6IFo5dDo2lJ9dyMOXrjvrYZAzD+Kp8+e/JE
 hPEWBsomBx3JnEYrHlToJbBBkO9g9n++M3vo5Zq+Ohzad7PNChz0f+tKcZH5UQWl/UNG
 XLnkbZOc2FX0tb75hP2Ea/on3RxuTAtIqQzhBMUcRRispqiu7IoIhckd1wenmnamUHEi
 jkBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Uuhg9E01gIMN6bxPkPWGwBLQ5Y4pX/rH09FJ5cXM4eg=;
 b=Ux9lry2dRl94XmNDG7SriPtCMXK9JA0BXG/oMCK6R9KT6scftsGYNCgooXiQhexZbg
 Hd4IVAA2c0JsdeHCf4yH037j2Bn7DMBxAPSSrnm197KCWoThMTqnCIHmEbBjvtnO4xm4
 LS8qbf5plyz8N5wiVyhpL3BpyBvEMZQ2TbQT+CJ66OpT2wcOMzZmx7O6uTchGfnhiBbB
 kli21WNmnczITo/SyZ6mxkErwsXyfqhJdhkbdENcZFXl79uxN+QJRFaQ1WoW+rrjekDF
 iCFQwipdE4z0wMXbv+LnUY+9esn/WLn0+q33RWvr9ySPzOCOR9VBoQpKc6SsChxE/w9Y
 Ef9A==
X-Gm-Message-State: AOAM532Au4LHrVzZxndqhCVfjkrMJhOOT/6mM0K33OBAUprjTP5y6o2W
 ns1vNCjR8Zeulw+zUn78q2aqWvLFLhQ=
X-Google-Smtp-Source: ABdhPJwz9Gi6LDlBnfFGk1aKKWiM4cBb4H3TtJ5IITkIiAdFxyjnSmQ5eelXnbBChPdFA6qfqXFG8g==
X-Received: by 2002:a1c:e90b:: with SMTP id q11mr17605631wmc.102.1610903054288; 
 Sun, 17 Jan 2021 09:04:14 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id v20sm26342639wra.19.2021.01.17.09.04.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jan 2021 09:04:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] softmmu/physmem: Silence GCC 10 maybe-uninitialized error
Date: Sun, 17 Jan 2021 18:04:11 +0100
Message-Id: <20210117170411.4106949-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When building with GCC 10.2 configured with --extra-cflags=-Os, we get:

  softmmu/physmem.c: In function ‘address_space_translate_for_iotlb’:
  softmmu/physmem.c:643:26: error: ‘notifier’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
    643 |         notifier->active = true;
        |                          ^
  softmmu/physmem.c:608:23: note: ‘notifier’ was declared here
    608 |     TCGIOMMUNotifier *notifier;
        |                       ^~~~~~~~

Initialize 'notifier' to silence the warning.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v2: Remove pointless assert (Peter Maydell)

Yet another hole in our CI.

Supersedes: <20210117160754.4086411-1-f4bug@amsat.org>
---
 softmmu/physmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 6301f4f0a5c..cdcd197656f 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -605,7 +605,7 @@ static void tcg_register_iommu_notifier(CPUState *cpu,
      * when the IOMMU tells us the mappings we've cached have changed.
      */
     MemoryRegion *mr = MEMORY_REGION(iommu_mr);
-    TCGIOMMUNotifier *notifier;
+    TCGIOMMUNotifier *notifier = NULL;
     int i;
 
     for (i = 0; i < cpu->iommu_notifiers->len; i++) {
-- 
2.26.2


