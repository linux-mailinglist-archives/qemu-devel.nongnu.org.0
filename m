Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D38E33A8EC
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 00:48:48 +0100 (CET)
Received: from localhost ([::1]:56944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLaTX-000166-HM
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 19:48:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLaS2-0008IV-8l
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 19:47:14 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:34231)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLaS0-0003Iq-Tf
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 19:47:14 -0400
Received: by mail-wr1-x430.google.com with SMTP id u16so7812703wrt.1
 for <qemu-devel@nongnu.org>; Sun, 14 Mar 2021 16:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9Pqxi10fbsg2XrttAg2CR3o2aw4WFlVph75B1Jn7x08=;
 b=MYGxtPZbq/OjZ+eGF45mW6dpq9FkCAZG2+941WA3g+w2KU8i5/AP5Iwt+tn/4obqxs
 EYb6R4yfAqXBMlSeBtjBNfyJQuQoxlFFAV0crGVVtNkoUxHd1Jtkbs1pLnWu4wbwrx+v
 q/pU+g7ZyfA6YudXt+K7MtKLs3r1yE4q55BgiMYt92pcJ144RJJO+2UqOT7U9S8wMF/G
 fQsZnDZn75+98/6zozeGLCt/FcshIeHQbMqZICnVbRIuo/KLyWJyQf+xd1JG3kQbeEJk
 gzVIIF0p3rT4bN4x1uDC04srBRx/oi1RLXn5yzrCMb887B2tlYoVR6jFrTQGZs5gxALI
 1RrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=9Pqxi10fbsg2XrttAg2CR3o2aw4WFlVph75B1Jn7x08=;
 b=Jgo+j2BoyxrHhV0y02TOnufU+6Nv4LnvYSX1Xzce0Ma0e96G9FC5T6d3+vpoSN01mK
 kicWmv/c3ATa0vFB5LTcZ6Rb45tb6Dzchmbk/opUWwDcDlpaFqdNf8tJ/IY/UDSMCD5l
 u5kfeJGO0bW4i8RtXzOtehkOuK8QzYE8tYgNlctt1GLqgbE0+Bwr8UNUHZOuB16oNwNC
 btvseLXTJvkZ/9P2vaKO6c55UZz3gHCZ1NMEs4wo/soOB9/rvmqmNoB7thxKdWgvFoyO
 2FMm+w+ya6pFU5dSuk/wGIEgp6czmGop4H139JldSLthlX1/pqWDeCDAbEESYNCkFYJ4
 IevQ==
X-Gm-Message-State: AOAM533XIdCJc/YTSWXmrkTDCx97r3XrjT2H7zlklGuDQHLW6xI7jNC7
 xTvOGhXCG7drJY9taBiJ+PW9ahNeJ8T6+A==
X-Google-Smtp-Source: ABdhPJxScGfCQR+LpJThf4sPB3cay+D0xIwRn8ovxCnvdu+GwQe/X6qnlUatmVdp0HMmK0IOaBvbkA==
X-Received: by 2002:adf:9544:: with SMTP id 62mr943783wrs.128.1615765631436;
 Sun, 14 Mar 2021 16:47:11 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id n66sm10394355wmn.25.2021.03.14.16.47.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 16:47:11 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 4/4] target/avr: Fix interrupt execution
Date: Mon, 15 Mar 2021 00:46:49 +0100
Message-Id: <20210314234649.2614590-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210314234649.2614590-1-f4bug@amsat.org>
References: <20210314234649.2614590-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Sarah Harris <S.E.Harris@kent.ac.uk>,
 Ivanov Arkasha <ivanovrkasha@gmail.com>, Michael Rolnik <mrolnik@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ivanov Arkasha <ivanovrkasha@gmail.com>

Only one interrupt is in progress at the moment.
It is only necessary to set to reset interrupt_request
after all interrupts have been executed.

Signed-off-by: Ivanov Arkasha <ivanovrkasha@gmail.com>
Message-Id: <20210312164754.18437-1-arkaisp2021@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Michael Rolnik <mrolnik@gmail.com>
---
 target/avr/helper.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/avr/helper.c b/target/avr/helper.c
index b4532de2523..35e10195940 100644
--- a/target/avr/helper.c
+++ b/target/avr/helper.c
@@ -49,7 +49,9 @@ bool avr_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
             cc->tcg_ops->do_interrupt(cs);
 
             env->intsrc &= env->intsrc - 1; /* clear the interrupt */
-            cs->interrupt_request &= ~CPU_INTERRUPT_HARD;
+            if (!env->intsrc) {
+                cs->interrupt_request &= ~CPU_INTERRUPT_HARD;
+            }
 
             ret = true;
         }
-- 
2.26.2


