Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8220339F55
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 18:04:29 +0100 (CET)
Received: from localhost ([::1]:39582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lL7gi-0004VO-Kc
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 12:04:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lL7YJ-0005om-MO
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 11:55:47 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:36591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lL7YI-0001Ji-9Y
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 11:55:47 -0500
Received: by mail-wr1-x429.google.com with SMTP id k8so3447180wrc.3
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 08:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rQ1byxN4phqb2WGKGojssryaH6KbeKgPExH0MIQ80UI=;
 b=ACNRQD21GDbVwPkqeKjs0DOiaC2nHoRrRxVGIQqa9axb3Dg4Q1omtmkbESBU6n4qb5
 GfwI+lU0EApSFvAPX0KlM2vPgQag2XPKWuyM4fGBX+XSXKjUXRFI09FoZZiRBwtxb1G6
 VdEwGZJsKA8waaCj1ZmMIzxFoXDkKk3vAsJ1L9lGmwp8V3+lPSVHy3UBJFNkepXPR2Vg
 b4ejr6S9n1eJq2avpzTyiwraBkntxS/VvEZJLhGMGI2ZOyP1MImHJOBo6INwrDmYQsS3
 dmqZHzuSbk0RaiXLDydLKq4nwqu9VcgnGJtO4sfzbi5YI54okklbklUBSTxaHrcUG61g
 pNOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=rQ1byxN4phqb2WGKGojssryaH6KbeKgPExH0MIQ80UI=;
 b=GFqSWOMqUI3EE5wgbwUpqMWY9DoqhQFF7aKNPAUAkTqnkIjd8H/cBwtC7dYDhJ3XNC
 BKET/wTmEpcX2TXkrC5Jh+eP6GPFf1oY4OYn62ZudrJBHc0eEfgLoe4N3HA6WHyUasBO
 CHT2PlW7H5rwY5NRVIHmc9uDFYSGtDJpSYl5y/wsPc3olyWK2ShQ2OinCZ1laYxUJ00K
 FHJ6ZXDW+FeOofTi1lxZv2VCxdVlHcqQVizWlGt6Oh7+wft05T2dZMkYdf+h9c+28w8W
 5GgXyfLiC17QJGCIdlqkBQr2/U+1Z/lqmZzeHKyhdiduhBk8tKa0Z7M3EdTBxSqOYaSI
 Q6sw==
X-Gm-Message-State: AOAM530ZtgEhl53Q8DKC/58FlLL4bIgibtcWXJQrDp3DkU572pJuqdoX
 I6EqhU3JuZndPIGeEILTSm76XLuIgKLw1g==
X-Google-Smtp-Source: ABdhPJxsbgcMVVzmUBxpVi23GMcku7SOffPXglTywGuleW4rpBmfhg3Zwnt2wXMnaUMhhtXYx3D+Eg==
X-Received: by 2002:adf:dcd2:: with SMTP id x18mr20258107wrm.361.1615654544787; 
 Sat, 13 Mar 2021 08:55:44 -0800 (PST)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id y205sm8413084wmc.18.2021.03.13.08.55.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Mar 2021 08:55:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/11] target/avr: Fix interrupt execution
Date: Sat, 13 Mar 2021 17:54:45 +0100
Message-Id: <20210313165445.2113938-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210313165445.2113938-1-f4bug@amsat.org>
References: <20210313165445.2113938-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Thomas Huth <huth@tuxfamily.org>, Sarah Harris <S.E.Harris@kent.ac.uk>,
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


