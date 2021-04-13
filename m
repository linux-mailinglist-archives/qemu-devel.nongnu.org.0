Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2800C35DF98
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 14:59:57 +0200 (CEST)
Received: from localhost ([::1]:40710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWIe4-0003KE-8O
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 08:59:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1lWIZV-0006YV-94; Tue, 13 Apr 2021 08:55:13 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:46882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1lWIZT-0005QZ-I1; Tue, 13 Apr 2021 08:55:13 -0400
Received: by mail-pl1-x629.google.com with SMTP id m18so5949111plc.13;
 Tue, 13 Apr 2021 05:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GED0ZF8HtdzmoND4pHbVLrTUNvZgoh07XD60ebAVcAY=;
 b=T7RFVgdupcZyvU2/JZkMCR24oy9y5ngrjrlfdAsKUQflEd+CET3r2v9G+3reAsXrya
 TL78p71gFJMTTFOdyb/bYsUYcj0+ggvdgosW2t3/0mksPVzCXvWTv2aiYPb/aOsq+xUk
 1HxYuoKq44N8r9x26Em3ddBryBKnQ+wIrC/VpARB5F2j2HBkC86k6hcmmZIImfRmBB3G
 +L5MMYF6MOBmNys2MS1qa9Uev6Kov+hkvh5p9Tut2vz3C2PBiElq+BPTzelDFjjHLmDx
 7hvc7TanBenOmwubgF+PGvfRlveHnXIg1etUJ+XHykKkDpIjDyqDGc1fsiUMeFpsyrsk
 USFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GED0ZF8HtdzmoND4pHbVLrTUNvZgoh07XD60ebAVcAY=;
 b=QYCpsfwd7uYIhAVUZVyPxpuOr6J3EKh5ghRoyFW0aDS2FUa8JOIx4WR5DEdnWfxLOx
 00IIsYzKG29MhYcMIakjr5QZ7SWLT5Rjpv5CSolj7kE7I+KUfOIt8hFh9FdfVQxZgZHL
 hjnP3ya14/0NPHcSMW7ayqx/5zZmJJX3846XsfcZscbvbzjRo26HkyBJgC+bYVrDuoQf
 cn8EKgN0d1hychX25f5P2cNuX14NQeQwJtkd9hpGqol1tpuXAFJ5xY918H7hiM+QB0oq
 jB6l3IDpfj+S6+FG+e4KNtunsMTlqseeWMT9xeMzHIpmvOcC1P5iDNWrbbzlxOR5Mlav
 MDmg==
X-Gm-Message-State: AOAM533mwKgdh5SAlIw5rdgp4oJY9JTp1jOi+jNo3EhVbBux4uF050Ut
 Dq4Pz56wKgItMKUgCPcIxw5OWvJUTCc=
X-Google-Smtp-Source: ABdhPJxEzERdmkWMwrNVceHwnxrz6LWwNuwD62oBPf8nEaG7TpGqhy4Ezo2XFf/Z8xolNGIEkevZog==
X-Received: by 2002:a17:902:c1c1:b029:ea:e47d:bbaf with SMTP id
 c1-20020a170902c1c1b02900eae47dbbafmr12747659plc.34.1618318509813; 
 Tue, 13 Apr 2021 05:55:09 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (193-116-90-211.tpgi.com.au.
 [193.116.90.211])
 by smtp.gmail.com with ESMTPSA id s40sm9627352pfw.133.2021.04.13.05.55.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 05:55:09 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Subject: [PATCH v1 2/3] target/ppc: POWER10 supports scv
Date: Tue, 13 Apr 2021 22:54:47 +1000
Message-Id: <20210413125448.1689545-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210413125448.1689545-1-npiggin@gmail.com>
References: <20210413125448.1689545-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=npiggin@gmail.com; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@fr.ibm.com>,
 qemu-devel@nongnu.org, Nicholas Piggin <npiggin@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This must have slipped through the cracks between adding POWER10 support
and scv support.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 target/ppc/translate_init.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
index c03a7c4f52..70f9b9b150 100644
--- a/target/ppc/translate_init.c.inc
+++ b/target/ppc/translate_init.c.inc
@@ -9323,7 +9323,7 @@ POWERPC_FAMILY(POWER10)(ObjectClass *oc, void *data)
     pcc->flags = POWERPC_FLAG_VRE | POWERPC_FLAG_SE |
                  POWERPC_FLAG_BE | POWERPC_FLAG_PMM |
                  POWERPC_FLAG_BUS_CLK | POWERPC_FLAG_CFAR |
-                 POWERPC_FLAG_VSX | POWERPC_FLAG_TM;
+                 POWERPC_FLAG_VSX | POWERPC_FLAG_TM | POWERPC_FLAG_SCV;
     pcc->l1_dcache_size = 0x8000;
     pcc->l1_icache_size = 0x8000;
     pcc->interrupts_big_endian = ppc_cpu_interrupts_big_endian_lpcr;
-- 
2.23.0


