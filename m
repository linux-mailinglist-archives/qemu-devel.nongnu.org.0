Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02072509293
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 00:18:27 +0200 (CEST)
Received: from localhost ([::1]:35078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhIeY-0008N7-3H
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 18:18:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nhIbz-0006JE-JD; Wed, 20 Apr 2022 18:15:49 -0400
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336]:39494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nhIbx-0005uA-Sg; Wed, 20 Apr 2022 18:15:47 -0400
Received: by mail-ot1-x336.google.com with SMTP id
 k29-20020a056830243d00b006040caa0988so2050960ots.6; 
 Wed, 20 Apr 2022 15:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=46FCMMBhjj4ddWjif9I3KHIqyeLT+M5TmhcoJIrtOxU=;
 b=AFkxw29VTs3CFGCgRWZJqAXCfZkkAuuPMBJCB9fa4xf1GKjtcGlwPx/PXbWh9HfGpV
 jzTcr1WOjOMF0IkaDss5Vahee2GGH7IOYCJstmVuXo+u5mUtMNV9CEebm32wqyCI0j4E
 p2JImVQNP7EG0zCweWf0HFvdHu9xz89p6Xv388U2j3A0SDizue5597sDVe1o2pwEPFSZ
 MBcI0Jmg7jWwjc2kAk0MNWgzYazcevbExC6+HETe5HacVZ3JdEYGUJKL0cavOaKkhHoz
 WZT73mufmSlujVhAKTQq8kdRg19LbPdJGGcitQzne05drFaypdUkFeAWnggazdplNPYx
 /n6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=46FCMMBhjj4ddWjif9I3KHIqyeLT+M5TmhcoJIrtOxU=;
 b=UmnA/cITzBggJLnoi+pNhquwxEvh2hO7q9I02F1eTaKf7SDr2rIOu1nh8Wl27fB11i
 D/UJp8FUcT4YHdv++X1nj9wDU+PA4Y3SaDHu3Pqe1TO6pSLb+rdHFRY9h1g0r9vvwFJr
 JIWESFYDI+NdNDxM9W6pAU1BkStlUhYmdfbqJBCOP7qJobvRzFZEjOz/afSzEvJ9Gb8m
 yNYa7qdhpJ3w926EMIgdheCKHcz5kP0Hvz/LxTyk2jNsKCSIbPucORoGRPRrxAGwu05y
 GTaHvHb8KdnEl0O2j+EIJn6g1KrrZFMJSKjzU12p357LUVlgDYCm/C33bo4s41WfEKRN
 DmEQ==
X-Gm-Message-State: AOAM532Ti+L01jty88/1T40oXtXHhqGTHpNwox6kq006+of2y+SKaBSi
 FYKagXBnp644y/JcGawUx5l5gI+rDBg=
X-Google-Smtp-Source: ABdhPJxx7m2CkN7iOE7XdnFX9A5+kSOPD1yFmZRjZfMq3JNzxjjYWmPojHDpuX6yI6u/+bZ+wCjPIw==
X-Received: by 2002:a9d:5d11:0:b0:605:51a0:1ab3 with SMTP id
 b17-20020a9d5d11000000b0060551a01ab3mr4551925oti.17.1650492944230; 
 Wed, 20 Apr 2022 15:15:44 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c7:486c:c4fd:c4aa:a799:60c2])
 by smtp.gmail.com with ESMTPSA id
 14-20020aca110e000000b00322847e6f53sm3876082oir.46.2022.04.20.15.15.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 15:15:34 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/23] ppc/spapr/ddw: Add 2M pagesize
Date: Wed, 20 Apr 2022 19:13:08 -0300
Message-Id: <20220420221329.169755-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220420221329.169755-1-danielhb413@gmail.com>
References: <20220420221329.169755-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x336.google.com
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, peter.maydell@linaro.org,
 richard.henderson@linaro.org, danielhb413@gmail.com, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexey Kardashevskiy <aik@ozlabs.ru>

Recently the LoPAPR spec got a new 2MB pagesize to support in Dynamic DMA
Windows API (DDW), this adds the new flag.

Linux supports it since
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=38727311871

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-Id: <20220321071945.918669-1-aik@ozlabs.ru>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr_rtas_ddw.c | 1 +
 include/hw/ppc/spapr.h  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/hw/ppc/spapr_rtas_ddw.c b/hw/ppc/spapr_rtas_ddw.c
index 3e826e1308..13d339c807 100644
--- a/hw/ppc/spapr_rtas_ddw.c
+++ b/hw/ppc/spapr_rtas_ddw.c
@@ -72,6 +72,7 @@ static uint32_t spapr_page_mask_to_query_mask(uint64_t page_mask)
     const struct { int shift; uint32_t mask; } masks[] = {
         { 12, RTAS_DDW_PGSIZE_4K },
         { 16, RTAS_DDW_PGSIZE_64K },
+        { 21, RTAS_DDW_PGSIZE_2M },
         { 24, RTAS_DDW_PGSIZE_16M },
         { 25, RTAS_DDW_PGSIZE_32M },
         { 26, RTAS_DDW_PGSIZE_64M },
diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index f5c33dcc86..14b01c3f59 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -745,6 +745,7 @@ void push_sregs_to_kvm_pr(SpaprMachineState *spapr);
 #define RTAS_DDW_PGSIZE_128M     0x20
 #define RTAS_DDW_PGSIZE_256M     0x40
 #define RTAS_DDW_PGSIZE_16G      0x80
+#define RTAS_DDW_PGSIZE_2M       0x100
 
 /* RTAS tokens */
 #define RTAS_TOKEN_BASE      0x2000
-- 
2.35.1


