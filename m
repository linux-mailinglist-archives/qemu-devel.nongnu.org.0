Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB1C30A2F8
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 09:05:08 +0100 (CET)
Received: from localhost ([::1]:56776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6UCp-0000hb-Jz
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 03:05:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6UBe-00009O-W2; Mon, 01 Feb 2021 03:03:55 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:40659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6UBd-0007wQ-HN; Mon, 01 Feb 2021 03:03:54 -0500
Received: by mail-wr1-x432.google.com with SMTP id c12so15491236wrc.7;
 Mon, 01 Feb 2021 00:03:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=heutC6rB2Jj4FFexObbfHYedqet2ADGcqJ4tiRcLAGw=;
 b=Xj/cCURNppsKTWvEkIN0lbZ4YDwe2nP0VuJrfZwbf+kSwj0VmiM4z2AYx00z1QffUh
 P5iFkPgudB0mK8TbM7qL+Mfqt2YnwMYyY3RjqGK0xQ2oQMw2xpkPVFr/CrD2ClgcRjvG
 PBZyqfJmzuQRG3sqEzRFxiz8IjGeXiTXIhssQ+wdKXWDehjIaRXc7P5W0L4o69vRBe1t
 PrA3JB/kAZ9COb0b6+KcElh2ozXnkZXFr5OBY5TuSWVM45wW+D+Cl94tRDztcZvA+UQN
 Q6banGwhDGOlSl2WI6D65h5ZYm/YCw1mW0OrpLx6+ET/F042Ii0GJicWI40euIQ9eYvB
 K/Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=heutC6rB2Jj4FFexObbfHYedqet2ADGcqJ4tiRcLAGw=;
 b=SN56WKPDtLaLQlNsSu8JsrNnq2OPgC61Z5X+PyjIW0o0JE6Nn6tIqtFPnIC7DjAqMn
 LgyTfeuM+xFH02iwcHM6/cOmjNhB/ZwWDPdqKhBAqNzp8QPN/i5bK1idSUOQHVO4/RRn
 wB0Y8EG7zYjqO29Tzc7nOY9WAkRPQW0+D4+OYPpTCPiNi2nooQrGXzutP11FUbCsIWy3
 Bf7JWb6lQHuSmg7j4/2XzpZg1xJZ5BcIdkOG1dzi5loiOJHa9hytNlFOdfDdFeuqzUdW
 Q1nLY4lYK+DLvHS+dA4wspNOwA536/wgN0w/32jnAwnAzKgGQHkfzuU7zPtaHY/d9M5P
 qQWw==
X-Gm-Message-State: AOAM530HH6ygvr9GnB6AGBd/il0aHng67kgcLpqceFgXJK+4Sjjg9MKO
 fPdhKJN7Zs/DVg97HU6mnyA6VLYkbwU=
X-Google-Smtp-Source: ABdhPJzO+HSjSYJEMGQLsjKgnv9HmTtj63q627jN1IMmLmEOkk7VfvL+84R1yh9c6TVaRiEKvUK98w==
X-Received: by 2002:adf:9031:: with SMTP id h46mr16812679wrh.19.1612166631392; 
 Mon, 01 Feb 2021 00:03:51 -0800 (PST)
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id t18sm22059871wrr.56.2021.02.01.00.03.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 00:03:50 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/avr/cpu: Use device_class_set_parent_realize()
Date: Mon,  1 Feb 2021 09:03:48 +0100
Message-Id: <20210201080348.438095-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
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
Cc: qemu-trivial@nongnu.org, Sarah Harris <S.E.Harris@kent.ac.uk>,
 Michael Rolnik <mrolnik@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Change generated automatically using the Coccinelle
patch included in commit bf853881690 ("qdev: use
device_class_set_parent_realize/unrealize/reset()")

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/avr/cpu.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index 6f3d5a9e4a7..e60036e41ef 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -190,9 +190,7 @@ static void avr_cpu_class_init(ObjectClass *oc, void *data)
     CPUClass *cc = CPU_CLASS(oc);
     AVRCPUClass *mcc = AVR_CPU_CLASS(oc);
 
-    mcc->parent_realize = dc->realize;
-    dc->realize = avr_cpu_realizefn;
-
+    device_class_set_parent_realize(dc, avr_cpu_realizefn, &mcc->parent_realize);
     device_class_set_parent_reset(dc, avr_cpu_reset, &mcc->parent_reset);
 
     cc->class_by_name = avr_cpu_class_by_name;
-- 
2.26.2


