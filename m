Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 150C93601D8
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 07:44:52 +0200 (CEST)
Received: from localhost ([::1]:56614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWuo6-0002T6-Cz
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 01:44:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1lWumH-0000lW-Nb; Thu, 15 Apr 2021 01:42:57 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:43676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1lWumG-0007JR-4k; Thu, 15 Apr 2021 01:42:57 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 x21-20020a17090a5315b029012c4a622e4aso12048575pjh.2; 
 Wed, 14 Apr 2021 22:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GED0ZF8HtdzmoND4pHbVLrTUNvZgoh07XD60ebAVcAY=;
 b=K/J6xKJ+Yaj2vo7UspnjHvP1/axJXx07+Pu7sx8AdhJIu89G7BoycDOALJl/O0xXgz
 ac2OO5HxLculSQZozhC9f4mmyGkoQKQorebgKBPbO6Liw6cL+1W2XZMCiP7AcSHzZ4JV
 BZiI8InsmPvkoQGWAmOfm+lqtkFIOzoXFW8z9zXOIRiRgd9YBiYB3li+yBnxnsskIoAt
 EhxHaQGH636g9YwTL4+fk0UCuojZtaQCRlC59RR5n+ftvX+A5pZR0d2XEzsK1NGzbbZ4
 hYcG4e73LT2P7vlQoXwp3kB2HU7WAxGjZ+liEJ9mDNnUk10w7GEK51NZetGF/iCdmSYx
 58hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GED0ZF8HtdzmoND4pHbVLrTUNvZgoh07XD60ebAVcAY=;
 b=e2wndz/VoThUtwxhpM1v8/Mv3fN0yMVPm7zXt6yuzmlcX5lnHOrhMvbNs0MH5LS6Wg
 O5nxjXLETj8W5wzv27kL29CLeGk+/4L77gFyl6c89Qiai7ROY/RGpGYblAOB+dsiD4KE
 jgIV1rFA3lYoWerS9+u98iy0P1AO4ugLzrZynSmzCZ2uRrhThtJV8hhSqR9pPTWFnytS
 EsS0NEEZyOcntAvW3kyUkahPGRa0DX/HbXidJyShqYCrcmCXwajtrndHQc2/ob+xCXWi
 fKyqjDD/H/UG50Y4XavhHO2BglWMEUsdU8CYlQlWAIItkRi5U2sYGpwGctQ+5OYNOv5f
 MNzw==
X-Gm-Message-State: AOAM531jrqyeIzuYLil9h/tlfPLSBsU2IHmGgJUOOjdVqv6RSs9BV1hx
 oBr7K4xFnJWphUuLahDV4MgRZVFw8Ug=
X-Google-Smtp-Source: ABdhPJy0M9MYDW7ZRzrc1f7XHtXlrDVVJjbAqAALg803RnlOG1ZA8ilevHO+NfiSU1sUVtLdyThTyw==
X-Received: by 2002:a17:90b:2314:: with SMTP id
 mt20mr1975782pjb.99.1618465374580; 
 Wed, 14 Apr 2021 22:42:54 -0700 (PDT)
Received: from bobo.ibm.com (193-116-90-211.tpgi.com.au. [193.116.90.211])
 by smtp.gmail.com with ESMTPSA id c5sm946151pfp.183.2021.04.14.22.42.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Apr 2021 22:42:54 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Subject: [PATCH v2 2/4] target/ppc: POWER10 supports scv
Date: Thu, 15 Apr 2021 15:42:25 +1000
Message-Id: <20210415054227.1793812-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210415054227.1793812-1-npiggin@gmail.com>
References: <20210415054227.1793812-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=npiggin@gmail.com; helo=mail-pj1-x102e.google.com
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
Cc: Fabiano Rosas <farosas@linux.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@fr.ibm.com>, qemu-devel@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>,
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


