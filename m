Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37EBA192B32
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Mar 2020 15:34:16 +0100 (CET)
Received: from localhost ([::1]:37222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jH76l-0006MK-97
	for lists+qemu-devel@lfdr.de; Wed, 25 Mar 2020 10:34:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35020)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <npiggin@gmail.com>) id 1jH72m-0002Fg-Gp
 for qemu-devel@nongnu.org; Wed, 25 Mar 2020 10:30:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <npiggin@gmail.com>) id 1jH72l-0002kS-DF
 for qemu-devel@nongnu.org; Wed, 25 Mar 2020 10:30:08 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:44867)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <npiggin@gmail.com>)
 id 1jH72i-0002fo-Nb; Wed, 25 Mar 2020 10:30:04 -0400
Received: by mail-pf1-x433.google.com with SMTP id b72so1104122pfb.11;
 Wed, 25 Mar 2020 07:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ENlqhDXY1VN8Te0oscoNTqgy8InnCmLXyV4U286tXj4=;
 b=V1pARf1AEwFaJ+wb0CsNADmTdrrFnQzC5apmBKxsoz+JG6WQbMSTKZVy6dC5aoEdUY
 SX2fLSDWfAbKO65M/sRIkpvGeMQmm9t3aFOi6o+LTPn/cdFCBfAt93ev2pqMDaMFDj7j
 f0GTMRwtBbOS2T6fEWxnM1rbnJICfAj50lCz06EzDxHS0FEcva1cvoS+hOyhSebZ6fzg
 U5hRVa2G2Kyastk6MITgmtItcsqAmKNmMgwqM9qoo/DXOEw7RXls9HXzwieUcotBWSNd
 HB0XB0y1fk+C6mKC+TAKahK1sXh1nsQSsFrPzRiVFeQSmuXZX3bSOW0YYts3lJpKCTkd
 Q9HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ENlqhDXY1VN8Te0oscoNTqgy8InnCmLXyV4U286tXj4=;
 b=sv+ShakEPE2zINP/uof8TAckxoBS5/0Qru/a1HzjQARyrQrjt9HL97gmsjwDZUrhg0
 gjyVeZJT422AEQ6j+RtHVlDePgSZjVOL58FBXUwnNyBlFNzN/HYuajJzgcAo6xrGdM4U
 jEjq4y/hxAhp+Q0P6FGuZocBuLyWr0pYZNoDNAFbPSBZEskb0NPetVu1EiPlCqUEpcwr
 Fvg7YZzZENxzOQB41YjTKVSbWX+iLZvwdHu/m0MNGAyS4ox3e3MsiEdK/kWsGW7lIS9b
 i9oadzFNI2UE5tP6iHzTZbPiHwWORvAuCQqhbY78XXl3IhBwb0LOTWi9+xLa6m6+TP3V
 u3xw==
X-Gm-Message-State: ANhLgQ38TpcTPpBOl8elPZr7RokHuO3E1GksPP3tYdh9L8aTC8EZtf7+
 idUWc00rnnCIeutUMOfENeHBk64N
X-Google-Smtp-Source: ADFU+vtWidIfdZFf3u0PUfXnNZKSaA+ych7BJZ8LeO5wSEHsdhiSTJU2UDDpH/mRjeU0m/wbx9RSxQ==
X-Received: by 2002:a63:d7:: with SMTP id 206mr3323040pga.366.1585146603562;
 Wed, 25 Mar 2020 07:30:03 -0700 (PDT)
Received: from bobo.ibm.com (14-202-190-183.tpgi.com.au. [14.202.190.183])
 by smtp.gmail.com with ESMTPSA id i20sm10609622pfd.89.2020.03.25.07.29.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2020 07:30:03 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Subject: [PATCH v2 2/4] ppc/spapr: Improve FWNMI machine check delivery corner
 case comments
Date: Thu, 26 Mar 2020 00:29:04 +1000
Message-Id: <20200325142906.221248-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200325142906.221248-1-npiggin@gmail.com>
References: <20200325142906.221248-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::433
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
Cc: Aravinda Prasad <arawinda.p@gmail.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>, qemu-devel@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@fr.ibm.com>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some of the conditions are not as clearly documented as they could be.
Also the non-FWNMI case does not need a large comment.

Reviewed-by: Greg Kurz <groug@kaod.org>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 hw/ppc/spapr_events.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/hw/ppc/spapr_events.c b/hw/ppc/spapr_events.c
index a4a540f43d..a908c5d0e9 100644
--- a/hw/ppc/spapr_events.c
+++ b/hw/ppc/spapr_events.c
@@ -860,17 +860,13 @@ void spapr_mce_req_event(PowerPCCPU *cpu, bool recovered)
     Error *local_err = NULL;
 
     if (spapr->fwnmi_machine_check_addr == -1) {
-        /*
-         * This implies that we have hit a machine check either when the
-         * guest has not registered FWNMI (i.e., "ibm,nmi-register" not
-         * called) or between system reset and "ibm,nmi-register".
-         * Fall back to the old machine check behavior in such cases.
-         */
+        /* Non-FWNMI case, deliver it like an architected CPU interrupt. */
         cs->exception_index = POWERPC_EXCP_MCHECK;
         ppc_cpu_do_interrupt(cs);
         return;
     }
 
+    /* Wait for FWNMI interlock. */
     while (spapr->fwnmi_machine_check_interlock != -1) {
         /*
          * Check whether the same CPU got machine check error
@@ -882,8 +878,13 @@ void spapr_mce_req_event(PowerPCCPU *cpu, bool recovered)
             return;
         }
         qemu_cond_wait_iothread(&spapr->fwnmi_machine_check_interlock_cond);
-        /* Meanwhile if the system is reset, then just return */
         if (spapr->fwnmi_machine_check_addr == -1) {
+            /*
+             * If the machine was reset while waiting for the interlock,
+             * abort the delivery. The machine check applies to a context
+             * that no longer exists, so it wouldn't make sense to deliver
+             * it now.
+             */
             return;
         }
     }
@@ -894,7 +895,9 @@ void spapr_mce_req_event(PowerPCCPU *cpu, bool recovered)
          * We don't want to abort so we let the migration to continue.
          * In a rare case, the machine check handler will run on the target.
          * Though this is not preferable, it is better than aborting
-         * the migration or killing the VM.
+         * the migration or killing the VM. It is okay to call
+         * migrate_del_blocker on a blocker that was not added (which the
+         * nmi-interlock handler would do when it's called after this).
          */
         warn_report("Received a fwnmi while migration was in progress");
     }
-- 
2.23.0


