Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 463486C5C87
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 03:23:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfAbW-00026A-2E; Wed, 22 Mar 2023 22:23:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1pfAbT-00024m-Nm; Wed, 22 Mar 2023 22:22:59 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1pfAbS-00084E-5p; Wed, 22 Mar 2023 22:22:59 -0400
Received: by mail-pl1-x62b.google.com with SMTP id iw3so21013489plb.6;
 Wed, 22 Mar 2023 19:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679538176;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ED9m53P2RqmgU/d0l92tXekBAwOFR1U7QW39zIg74MM=;
 b=a1OvQ/snx6pQ/Bbl+GW14vKXy8Z2V5X6BKB2J5SEHFsiyOgeWzIIcp//beX4oQU1AM
 TYX0XSmizAw49ePyHO9onEVEjS1N4uBBYuLwQx+tiqocxejub+T40TMeCrthJxlDUoE3
 qRMFnx8uI2A+Vac+PUXNMtQqogVSFuC/VFsGR1RPKZPz6yUM0acV/xJkaXClO/L7LZBW
 11KPu4zqtUengVkK/h+rjpexh5WKUP1VJiyp8XOTyd9vihlsUccIajqDdQfJTbKhisTb
 rJncZV2+lHe+mmPu5FcUYB8ckQhdewsB2sg6YCOoCZhbdd5tA5o2UbAc2BZMDQC6Hf+r
 B41g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679538176;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ED9m53P2RqmgU/d0l92tXekBAwOFR1U7QW39zIg74MM=;
 b=YKOLx5WfQ0nwL5KLPIxYZLubKb0U086lIisp8Ci2vs/k9QSROO3qfCj0yFDnT1EKGZ
 1IQaR4tacTJxSffHiWJjkmhWhN2d0jqentKecBJDgH18aGsUZcag2zgwmm4Uo37h5DJB
 ulADUqsM982GeJFrt5Zs/ObJN8PvXgySah77SMxfSg3HZMqy5tQM6/t8weA2cgss6DYo
 d2s6Kx12Tb3am1wtu6XnalO2vmHPwaJNgg3gQVfvO7oc+chCry7tRiWGxEpLZpWxiFhJ
 rQuwg160IodhCp2lkmuNNU5HtH/D7ZjsPQuF1CDFUZltOm6MeiYnjJ7vx2ZsgYgmzgey
 8v3w==
X-Gm-Message-State: AAQBX9eBbOa1lTZDMisWFQIXHqmrOOjl7E0+r4q5hohRD7LOjoxvn2tB
 QfPcGtGltEOPBeKUIwg0CM1jM3rg9b2LhQ==
X-Google-Smtp-Source: AKy350ZIEL67Y2eLYMtskAZAPKkB+spzkKYH6y6pXKX3YG7eaao192m0liriYx5qY2y4c6jUERZxgw==
X-Received: by 2002:a17:903:2291:b0:1a1:a727:a802 with SMTP id
 b17-20020a170903229100b001a1a727a802mr4034219plh.19.1679538175541; 
 Wed, 22 Mar 2023 19:22:55 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (61-68-215-123.tpgi.com.au. [61.68.215.123])
 by smtp.gmail.com with ESMTPSA id
 jc11-20020a17090325cb00b001a1abc93eabsm10609438plb.226.2023.03.22.19.22.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 19:22:55 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Cc: Nicholas Piggin <npiggin@gmail.com>,
	qemu-devel@nongnu.org
Subject: [PATCH 4/6] target/ppc: Alignment faults do not set DSISR in ISA v3.0
 onward
Date: Thu, 23 Mar 2023 12:22:35 +1000
Message-Id: <20230323022237.1807512-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230323022237.1807512-1-npiggin@gmail.com>
References: <20230323022237.1807512-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=npiggin@gmail.com; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This optional behavior was removed from the ISA in v3.0, see
Summary of Changes preface:

  Data Storage Interrupt Status Register for Alignment Interrupt:
  Simplifies the Alignment interrupt by remov- ing the Data Storage
  Interrupt Status Register (DSISR) from the set of registers modified
  by the Alignment interrupt.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 target/ppc/excp_helper.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 5f0e363363..c8b8eca3b1 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1456,13 +1456,22 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
         break;
     }
     case POWERPC_EXCP_ALIGN:     /* Alignment exception                      */
-        /* Get rS/rD and rA from faulting opcode */
-        /*
-         * Note: the opcode fields will not be set properly for a
-         * direct store load/store, but nobody cares as nobody
-         * actually uses direct store segments.
-         */
-        env->spr[SPR_DSISR] |= (env->error_code & 0x03FF0000) >> 16;
+        switch (env->excp_model) {
+        case POWERPC_EXCP_970:
+        case POWERPC_EXCP_POWER7:
+        case POWERPC_EXCP_POWER8:
+            /* Get rS/rD and rA from faulting opcode */
+            /*
+             * Note: the opcode fields will not be set properly for a
+             * direct store load/store, but nobody cares as nobody
+             * actually uses direct store segments.
+             */
+            env->spr[SPR_DSISR] |= (env->error_code & 0x03FF0000) >> 16;
+            break;
+        default:
+            /* Optional DSISR update was removed from ISA v3.0 */
+            break;
+        }
         break;
     case POWERPC_EXCP_PROGRAM:   /* Program exception                        */
         switch (env->error_code & ~0xF) {
-- 
2.37.2


