Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F0F4E57CC
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 18:47:15 +0100 (CET)
Received: from localhost ([::1]:46696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX54k-0006G7-Ap
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 13:47:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zongyuan.li@smartx.com>)
 id 1nX4vT-0002et-Jh
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 13:37:39 -0400
Received: from [2607:f8b0:4864:20::630] (port=43769
 helo=mail-pl1-x630.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zongyuan.li@smartx.com>)
 id 1nX4vR-0005iD-Qy
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 13:37:39 -0400
Received: by mail-pl1-x630.google.com with SMTP id w8so2194883pll.10
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 10:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smartx-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AOL9NtYfd3bDRvXkeA7t/+Y1sU79nqDVVqBTzIOcqRk=;
 b=arBhUosiXVq1AGwQFuvnjee4LVQuG+pOtEAFI7JNzceVEohrbNuJBF8KWTeP8scxfJ
 duxqLnS6K94JMAXtXZtgy/dZEhVrPEY77GIItlz3AHH6cuc5Inn05SG3PzV8tWYJEAuc
 VczcpDi81fYLroEqvutbCNX+5bOQz1PxQxx49SiGwS/hDHEPDWKzrJjzaY+VZZhE1oZN
 5PUms/5OyXuywsf08uO8n1Ij/8DgPYk4o7dYz0yOSDm7j5YyBnd1+GwSk47KCF0TCHXP
 yx2O5bLlFgMRmMLMzRQRNWKClMxdBabrR+XqaU06225GxKCrmoNbKE6KPqO/O+FvcW2F
 7K5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AOL9NtYfd3bDRvXkeA7t/+Y1sU79nqDVVqBTzIOcqRk=;
 b=SXPAXKmDV7jsZygKmFxT4JJTD4q54u+eftLb/ukEbFBCF37WHCe6B/o562KyLNdm1o
 /wjwca0WzkwRYd+4xoFb+CQecC6mp6RjIyCP+BQBFECbsfaW690tC9g6W3LiekBFyB0s
 guvlaaNM6J58ZlxM69ggPjW+UlCoqZpJjqEkdbeul4PgxfJWNEZx+0Hb/2HS4R025xvs
 ZcVmpyXNyNAe9m1FB7emIAn8gnelxBUw4NEgdH17bhvnZF9hcPxMbkW4o2N0rlQqcJco
 AyrhMOLYwsH1gp1Wqa/xcrrPgxDPCx6kJwGVukxFXWQ4H1E9U3DROM2VZ4+Mm8W0IXwR
 QmpA==
X-Gm-Message-State: AOAM530kHG3ky9oS6H2fKU03MTLNEIguRafbB06WMJ9jFnf5kdUQEGfM
 X8jVvGrXmBuJ/t2qK0gIa+Pre+l7EbqW0g==
X-Google-Smtp-Source: ABdhPJxZ3T9NcYv0Qy5vy6wcfke8sYjvzFEHLe8MNKRUryh+wYUdPZgS2YSnL2DlZPWwVWBGH1J4Tg==
X-Received: by 2002:a17:90a:9412:b0:1bc:f629:43bc with SMTP id
 r18-20020a17090a941200b001bcf62943bcmr13046457pjo.103.1648057055965; 
 Wed, 23 Mar 2022 10:37:35 -0700 (PDT)
Received: from dev.lizongyuan.local ([103.177.44.11])
 by smtp.gmail.com with ESMTPSA id
 w19-20020a056a0014d300b004fae5e3970csm553239pfu.35.2022.03.23.10.37.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 10:37:35 -0700 (PDT)
From: Zongyuan Li <zongyuan.li@smartx.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 5/5] hw/core/irq: remove unused 'qemu_irq_split' function
Date: Thu, 24 Mar 2022 01:35:44 +0800
Message-Id: <20220323173543.146442-6-zongyuan.li@smartx.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20220323173543.146442-1-zongyuan.li@smartx.com>
References: <20220323173543.146442-1-zongyuan.li@smartx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::630
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::630;
 envelope-from=zongyuan.li@smartx.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
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


