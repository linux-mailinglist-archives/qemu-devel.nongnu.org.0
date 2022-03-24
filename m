Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0E34E68A3
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 19:27:30 +0100 (CET)
Received: from localhost ([::1]:37852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXSBC-0004eL-WD
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 14:27:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zongyuan.li@smartx.com>)
 id 1nXS0Z-00062G-BT
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 14:16:27 -0400
Received: from [2607:f8b0:4864:20::42f] (port=47046
 helo=mail-pf1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zongyuan.li@smartx.com>)
 id 1nXS0X-00036C-Rt
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 14:16:27 -0400
Received: by mail-pf1-x42f.google.com with SMTP id s11so4564409pfu.13
 for <qemu-devel@nongnu.org>; Thu, 24 Mar 2022 11:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smartx-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z8/3sggV+dBbiO1PXwaQwIz5VINnWuh2AxxWFR/Xqcs=;
 b=n74/903K9K91arDavIWSUjrmzgHmJcYhR9NuK+0bYhjBSeppUF+hdchUvL80I7WSBh
 1NwamyFVC3C3Qm3wRy3SKG2DyKpb+eDmZGqSShKQ7t5tdnP/g6IS5Xp7wHFZUlegnxqA
 9vUdH97SF9wL1phB5QxyadvvZd2LMnhsleF443yvD1YOA9RHYaoUJk3fQF6aDY2+nE4d
 4Xo/xa0fh1cf/Ec88ey3mNKl6f9rA4SElcjDYebwqYdWjlG7soHXvR5RxBhRRdQ88azI
 YGBnIAKc6DU94HNCwdu+vnPlJmqA9xVNlIqK2uU7A1KSUcjFkgSz7bpQU24zi0QxPPWt
 /ebA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z8/3sggV+dBbiO1PXwaQwIz5VINnWuh2AxxWFR/Xqcs=;
 b=cp/oeCjrGPvfvsd6I8lfz7tnRmjH3LYHk/toKzpc0tJfAwYj6uPUwPprdnifUxsH0h
 lLlH3AMNamUCqyg+jWJY5WEOv0MLeiWxurWX5YwssIuzgbE3kjePyHN743UihqJvDzYQ
 Gl9MV8EiEYasep1zI4lUAR1W82OxIE1+CTebxmLJjlulDwEnZM4IO71Xquq/FkgrCnda
 Wr90WQU2l0A6AXmcbPp8xzXkWdFUlL1q+iP4HxzVv2xIim+Q1TnDwcLaP/PfL3GVZkVK
 i0/gdhcbOALZzhp6QxEljzmOIG8mQWGYp/E3qgQNChXgEdgBe5NfB8HZAMdx0COSyMLx
 cCuw==
X-Gm-Message-State: AOAM532NBGzfVeva9UFXAWZL6OBqW5tQOwpVB8q5es0fj61pRKMdS3a4
 jArZwM7ywNxuuQ9OdtgJUTQ5FxVYpj29Yg==
X-Google-Smtp-Source: ABdhPJwZpdY2shn5imVKbiEbaYKx/g5YfcokJBKH/RNAgd0cxXmBUnFjy+hdJNTRySSZfL9JU/Q6LQ==
X-Received: by 2002:a05:6a00:16c7:b0:4f7:e497:69b8 with SMTP id
 l7-20020a056a0016c700b004f7e49769b8mr6427731pfc.6.1648145784468; 
 Thu, 24 Mar 2022 11:16:24 -0700 (PDT)
Received: from dev.lizongyuan.local ([103.177.44.101])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a17090a2b8a00b001c6594e5ddcsm3577725pjd.15.2022.03.24.11.16.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Mar 2022 11:16:24 -0700 (PDT)
From: Zongyuan Li <zongyuan.li@smartx.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 4/4] hw/core/irq: remove unused 'qemu_irq_split' function
Date: Fri, 25 Mar 2022 02:15:57 +0800
Message-Id: <20220324181557.203805-5-zongyuan.li@smartx.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20220324181557.203805-1-zongyuan.li@smartx.com>
References: <20220324181557.203805-1-zongyuan.li@smartx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42f
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::42f;
 envelope-from=zongyuan.li@smartx.com; helo=mail-pf1-x42f.google.com
X-Spam_score_int: 29
X-Spam_score: 2.9
X-Spam_bar: ++
X-Spam_report: (2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Zongyuan Li <zongyuan.li@smartx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Zongyuan Li <zongyuan.li@smartx.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/811
---
 hw/core/irq.c    | 15 ---------------
 include/hw/irq.h |  5 -----
 2 files changed, 20 deletions(-)

diff --git a/hw/core/irq.c b/hw/core/irq.c
index 741219277b..3623f711fe 100644
--- a/hw/core/irq.c
+++ b/hw/core/irq.c
@@ -106,21 +106,6 @@ qemu_irq qemu_irq_invert(qemu_irq irq)
     return qemu_allocate_irq(qemu_notirq, irq, 0);
 }
 
-static void qemu_splitirq(void *opaque, int line, int level)
-{
-    struct IRQState **irq = opaque;
-    irq[0]->handler(irq[0]->opaque, irq[0]->n, level);
-    irq[1]->handler(irq[1]->opaque, irq[1]->n, level);
-}
-
-qemu_irq qemu_irq_split(qemu_irq irq1, qemu_irq irq2)
-{
-    qemu_irq *s = g_new0(qemu_irq, 2);
-    s[0] = irq1;
-    s[1] = irq2;
-    return qemu_allocate_irq(qemu_splitirq, s, 0);
-}
-
 void qemu_irq_intercept_in(qemu_irq *gpio_in, qemu_irq_handler handler, int n)
 {
     int i;
diff --git a/include/hw/irq.h b/include/hw/irq.h
index dc7abf199e..645b73d251 100644
--- a/include/hw/irq.h
+++ b/include/hw/irq.h
@@ -46,11 +46,6 @@ void qemu_free_irq(qemu_irq irq);
 /* Returns a new IRQ with opposite polarity.  */
 qemu_irq qemu_irq_invert(qemu_irq irq);
 
-/* Returns a new IRQ which feeds into both the passed IRQs.
- * It's probably better to use the TYPE_SPLIT_IRQ device instead.
- */
-qemu_irq qemu_irq_split(qemu_irq irq1, qemu_irq irq2);
-
 /* For internal use in qtest.  Similar to qemu_irq_split, but operating
    on an existing vector of qemu_irq.  */
 void qemu_irq_intercept_in(qemu_irq *gpio_in, qemu_irq_handler handler, int n);
-- 
2.34.0


