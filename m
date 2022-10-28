Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 894826117B1
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 18:41:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooSPI-0002uW-Sd; Fri, 28 Oct 2022 12:40:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSOx-0002fj-1v; Fri, 28 Oct 2022 12:40:11 -0400
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSOs-0007gO-3Z; Fri, 28 Oct 2022 12:40:10 -0400
Received: by mail-ot1-x329.google.com with SMTP id
 16-20020a9d0490000000b0066938311495so3272262otm.4; 
 Fri, 28 Oct 2022 09:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EzkPvmu7MHFKAfaex8a55ZZ/l01OAJQ4OKdCLzrVLGE=;
 b=qUGVDffF8taq+moTbeZgAhW0p5IKB/ZGgISbyCSyP3MD9AK796s5x2NqopgvGHafwJ
 28SWN8Yma0jCP21hsDHtB3L6CwB/bHobELkqoZu6OGBmxHkWatTqo1Ly5+92qFQuoglI
 vD8FPZzcr4sUHxk5mscoJfGZrDfScSC/ZtPlRATtWIJEgNGiL4xHvq5NApsq4hFdXkqr
 fFF+jHwdCI8aK3vrhxzDoHPPHZ/iBb8v+44mLfvFNx1425v/KtIOFPh1noWpZoAkMWNZ
 tLUZyya6ieWG+SrYdqHOE0TRPlRX6fSO7gvpOpUmdZRls8IBr8yKGhRZcoelpPyGNFZH
 /E1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EzkPvmu7MHFKAfaex8a55ZZ/l01OAJQ4OKdCLzrVLGE=;
 b=nRcR0DxZ10sh8ULrgSIqhGI3PW2Zuns+UjNKlpFj2Qh7/jd5zc/8RxxDyRGpn4waNH
 2gh+AjbHM+uKTnmf2d9NZhZ25R/6s4aGzUwN2Jd1H/aPFH5FYHE5b3TlV4RY07IrXBWH
 jeqy+390lx0QBoEuynnmUnMuDmqq8O2tTUVw39gVW5n27MIA8N9/ZJlYOAxgAeiLLQtp
 V4zNKJB8NJS9yE/K+OJBJ9pubTRl7/dHatsJwy5nTaMEkGPb+X+LTC99W+aIVNXx7NmC
 JBFJzQJpS1Kwx1wr63f3TBdP7PNVPCdpEzjJkhSt11aJfv6ZMAIUXyyca8dVGzI46p9P
 KpUg==
X-Gm-Message-State: ACrzQf16ZxqOSD3nU1FORew9L4f4nrG2vp7whUvuyNVIagBeaJ+BuHCC
 3Pumjf0D9DWeN+e/erJ3Vc53qAb1O0U6TA==
X-Google-Smtp-Source: AMsMyM6tzpgBa2cuulnR+kx8fuSxotJXzI8C3nJv7X2Y2GvV51G+RYP49FXV0ymvSSy3N+Ugthw+4g==
X-Received: by 2002:a9d:12a6:0:b0:661:d26c:708c with SMTP id
 g35-20020a9d12a6000000b00661d26c708cmr119750otg.160.1666975204209; 
 Fri, 28 Oct 2022 09:40:04 -0700 (PDT)
Received: from balboa.COMFAST ([177.45.165.63])
 by smtp.gmail.com with ESMTPSA id
 s127-20020acaa985000000b00354b7120d60sm1658373oie.52.2022.10.28.09.40.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 09:40:03 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Fabiano Rosas <farosas@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 01/62] target/ppc: fix msgclr/msgsnd insns flags
Date: Fri, 28 Oct 2022 13:38:50 -0300
Message-Id: <20221028163951.810456-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221028163951.810456-1-danielhb413@gmail.com>
References: <20221028163951.810456-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x329.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

On Power ISA v2.07, the category for these instructions became
"Embedded.Processor Control" or "Book S".

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Message-Id: <20221006200654.725390-2-matheus.ferst@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 7228857e23..b5d80fd13d 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -6902,9 +6902,9 @@ GEN_HANDLER2_E(tlbivax_booke206, "tlbivax", 0x1F, 0x12, 0x18, 0x00000001,
 GEN_HANDLER2_E(tlbilx_booke206, "tlbilx", 0x1F, 0x12, 0x00, 0x03800001,
                PPC_NONE, PPC2_BOOKE206),
 GEN_HANDLER2_E(msgsnd, "msgsnd", 0x1F, 0x0E, 0x06, 0x03ff0001,
-               PPC_NONE, PPC2_PRCNTL),
+               PPC_NONE, (PPC2_PRCNTL | PPC2_ISA207S)),
 GEN_HANDLER2_E(msgclr, "msgclr", 0x1F, 0x0E, 0x07, 0x03ff0001,
-               PPC_NONE, PPC2_PRCNTL),
+               PPC_NONE, (PPC2_PRCNTL | PPC2_ISA207S)),
 GEN_HANDLER2_E(msgsync, "msgsync", 0x1F, 0x16, 0x1B, 0x00000000,
                PPC_NONE, PPC2_PRCNTL),
 GEN_HANDLER(wrtee, 0x1F, 0x03, 0x04, 0x000FFC01, PPC_WRTEE),
-- 
2.37.3


