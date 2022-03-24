Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C9D4E67CE
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 18:27:51 +0100 (CET)
Received: from localhost ([::1]:53818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXRFW-0006bc-SQ
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 13:27:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zongyuan.li@smartx.com>)
 id 1nXR79-0007CW-EI
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 13:19:11 -0400
Received: from [2607:f8b0:4864:20::42e] (port=40518
 helo=mail-pf1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zongyuan.li@smartx.com>)
 id 1nXR77-0007rt-W4
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 13:19:11 -0400
Received: by mail-pf1-x42e.google.com with SMTP id y10so1137596pfa.7
 for <qemu-devel@nongnu.org>; Thu, 24 Mar 2022 10:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smartx-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z8/3sggV+dBbiO1PXwaQwIz5VINnWuh2AxxWFR/Xqcs=;
 b=KrNY1whpGZqADm36i6SM5lz1JEqxr0gvBMLEavz8acWROuY7HM4EMXW4VQdMuU4ViI
 yRmVZUAAx5zHnMlwt3uAdhK2jA4dXiiUtk1v3j4OUbSXLZSPqhvdmXz8rzH+lDoNhS2d
 WpJrv9JoAjbaOBLy6EUkEsMSKIaAKo8nbJY8rCn9tH4IroDozvFwvkJxhwdk51olO1ca
 lkbat3AyrhXPQgBkjP/y6sfSNhDO4ylbDvV1V2dd5vJBMkNhxyLGRITHRUpje5maqxmk
 RQyCOpDVM4fP3ZmDH0KgNmpDFsID2MLM8Z9uN2FKmHUn+q+6kPTZudhCtAM5MwCqKFeH
 b9hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z8/3sggV+dBbiO1PXwaQwIz5VINnWuh2AxxWFR/Xqcs=;
 b=nFP5zzd623xicHW8mLQpOWEU/CbKdtcNlBDZhw2Arw5g5nrcvQaXvRt5oEOShnt0Jp
 OjgPPqvBgnepDgC+2Qr/JWzDBQvQqby9+WFKiJb7JEtQzO+/MCl0gP46NmtzaZ+lu5yB
 M9ojvozQZOw83s2nE8urBOBixyX0jXomXk2JuCdYtg5NdWbKj1c9iQjn5JqfxjV5I+g2
 cZWZYUEpzkmmikCnwv4Q3OIFyvWuY8ZvuxrDaEM0MaeGLDGwVFPosThXU4xSs0fAHNdx
 XAF7zGjAZpn8OtjEnZnLOsoLy7cZX+RJLW87hLyFPj77B54ETmscSXVvveoHjKKEDzIm
 Fl+g==
X-Gm-Message-State: AOAM533rxRc2Wdw6knFpqVpvyyTSEX41cPVXJgi8mRQND0UsKtLEh/bC
 Rb3YKsWfnWBEdCTpa029r/CqcoPTtnMrAw==
X-Google-Smtp-Source: ABdhPJzxaZuT9VBVP59KcvszZl+xoUXFrFHBSwzXTvJL/7wZLfAiNG0v7/pJc0DVpjrWIfV6Cseq7Q==
X-Received: by 2002:a65:6cc3:0:b0:382:9d3c:ff82 with SMTP id
 g3-20020a656cc3000000b003829d3cff82mr4956123pgw.110.1648142348569; 
 Thu, 24 Mar 2022 10:19:08 -0700 (PDT)
Received: from dev.lizongyuan.local ([103.177.44.10])
 by smtp.gmail.com with ESMTPSA id
 p128-20020a625b86000000b004fa666a1327sm3937412pfb.102.2022.03.24.10.19.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Mar 2022 10:19:08 -0700 (PDT)
From: Zongyuan Li <zongyuan.li@smartx.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 4/4] hw/core/irq: remove unused 'qemu_irq_split' function
Date: Fri, 25 Mar 2022 01:17:56 +0800
Message-Id: <20220324171756.196654-5-zongyuan.li@smartx.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20220324171756.196654-1-zongyuan.li@smartx.com>
References: <20220324171756.196654-1-zongyuan.li@smartx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42e
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::42e;
 envelope-from=zongyuan.li@smartx.com; helo=mail-pf1-x42e.google.com
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


