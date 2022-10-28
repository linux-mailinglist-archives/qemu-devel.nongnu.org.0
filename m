Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A596117DC
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 18:45:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooSSZ-0007S9-G4; Fri, 28 Oct 2022 12:43:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSRh-0007zY-MZ; Fri, 28 Oct 2022 12:43:01 -0400
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSRg-0000VD-BE; Fri, 28 Oct 2022 12:43:01 -0400
Received: by mail-oi1-x236.google.com with SMTP id u132so6767098oib.0;
 Fri, 28 Oct 2022 09:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qgOUQP7NSW8n0xyZvE3H5JJHoDspNuiKlq12yv+lspA=;
 b=DIkvkSosrcSw1STNqa99J7dLR93p+ZCaikDLPqewSADiHHkePGJli+P0FIwnCGlSwB
 puyR/Le2XD4nkrTDSh+P2Yc578b6TBxO0k6pd5yt5uuh8GgZQvoH7TXeAHgoqVf0lGTo
 t9wMGePatffCq+TI/snfnSXfTOdVTNSS0foo4FIacLqYGpPIBmsa6SUQrbBkgREDNgTW
 Io4rsBMdGIWIKaaG4Xb/HqML58REZvwy9AmmuzlE1UhRsb+xAyfWX5Fj5vvirooDgw0Y
 7RE6dm2eioHuRUBSSJbv4EXyZPLBR7Y/nF+Bpb7tUJQ1RAXaodIIzNccDPtqwpwBEg6K
 4Qiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qgOUQP7NSW8n0xyZvE3H5JJHoDspNuiKlq12yv+lspA=;
 b=oQYLwoa0h64E89A7ejeWQ0A1zmdLVDkbXzqw4r4xxQ648xADDfk5xFY+9UzEeeYZxs
 YuIe4LqVv0aEwIqkeyCesRh5XigHMyeFMQb3rmVG31ZrdzHkv8WpMLsP5DDrPoIEGbQS
 s66nRDPVWgzIjxSFap4zh9qaKOXulQnWr5uwGPBXixHMQ4sRgLBAy7lkQ47JptUCkZh6
 O0++SbbT/CU2xbULzi1VyldUOdTbAIzO8e6rV59jp1WRBA/xNawyA+uxlQtPXI6Yi8nH
 0d9/f/8s+ZRTYhfrKYMgaPG4k7jE+Gy0SOb9ML+73B1r/p7Knr6y+tyPFlYCVR2Sp4dY
 g0hw==
X-Gm-Message-State: ACrzQf196iLMrkTxITuZd0f1cy11w3wYiIJXDGJSweU0lgyH5BXHl7xe
 rUgXGN9gaZ+LgwYHJd+9QH7REkjlY7FlCA==
X-Google-Smtp-Source: AMsMyM4hOutYsuJQcCy444qOs6SQqTYi5j1J2+hXHvryK/pKanEi1BYMPrWe2HmVTjbEZrWjmy6WYQ==
X-Received: by 2002:a05:6808:2116:b0:359:dc32:4f6e with SMTP id
 r22-20020a056808211600b00359dc324f6emr1057437oiw.86.1666975377931; 
 Fri, 28 Oct 2022 09:42:57 -0700 (PDT)
Received: from balboa.COMFAST ([177.45.165.63])
 by smtp.gmail.com with ESMTPSA id
 s127-20020acaa985000000b00354b7120d60sm1658373oie.52.2022.10.28.09.42.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 09:42:57 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Fabiano Rosas <farosas@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 41/62] target/ppc: remove generic architecture checks from
 p7_deliver_interrupt
Date: Fri, 28 Oct 2022 13:39:30 -0300
Message-Id: <20221028163951.810456-42-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221028163951.810456-1-danielhb413@gmail.com>
References: <20221028163951.810456-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x236.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Message-Id: <20221011204829.1641124-24-matheus.ferst@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/excp_helper.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 5373e088b4..9164dc2e0f 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -2071,9 +2071,6 @@ static void p7_deliver_interrupt(CPUPPCState *env, int interrupt)
         break;
 
     case PPC_INTERRUPT_DECR: /* Decrementer exception */
-        if (ppc_decr_clear_on_delivery(env)) {
-            env->pending_interrupts &= ~PPC_INTERRUPT_DECR;
-        }
         powerpc_excp(cpu, POWERPC_EXCP_DECR);
         break;
     case PPC_INTERRUPT_PERFM:
-- 
2.37.3


