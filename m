Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E573E457010
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 14:51:03 +0100 (CET)
Received: from localhost ([::1]:55698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo4IB-0006d2-1C
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 08:51:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1mo4CI-0006xD-2J; Fri, 19 Nov 2021 08:44:58 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:51844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1mo4CF-0006xq-OP; Fri, 19 Nov 2021 08:44:57 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AJDPFOs011004; 
 Fri, 19 Nov 2021 13:44:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=oMROIG328Br+8d9gAbSoBLZ3P0m0w/BRjwNjQpdmAl0=;
 b=mcQJLeFGallN7eVlOfyFicgSf+GTK4HcOm2sbeGJoBAf+TB544xTooOIA0jFu7QDUt/X
 +61l6c0WYyh8QQIQB6qSP+Vw2/WPOPY725dqDPSSZVnqGmIolcehzsp5mxf4CtqaZCHd
 oyuBHOtd813RgxHyieCAVLTfhNnpXSUp9FRfWUcd5DnICr7x/2OcUp8swKWHBQFTjm1a
 iBnRL9UXFghRXGkLtZI3Z5iRFxbx36ng5btlczrrXqIzH3Ks/hRN9mvbpo7uI/vSprsX
 eYsqvX8zCxTH90MLUnNXYhfvQ897xCCsSFKO73VfMMwJ+OTVK81MuFb8Sa5KKY58o/gS 8w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ceae2bq0q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Nov 2021 13:44:42 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1AJCxg9S017576;
 Fri, 19 Nov 2021 13:44:42 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ceae2bq0c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Nov 2021 13:44:42 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AJDbBP2006364;
 Fri, 19 Nov 2021 13:44:41 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma02dal.us.ibm.com with ESMTP id 3ca50ejcr0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Nov 2021 13:44:41 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1AJDiemY41222440
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Nov 2021 13:44:40 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1C8A6C605F;
 Fri, 19 Nov 2021 13:44:40 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2E86FC605B;
 Fri, 19 Nov 2021 13:44:38 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.163.29.60])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 19 Nov 2021 13:44:37 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 1/2] ppc: Add support for MPC7450 software TLB miss
 interrupts
Date: Fri, 19 Nov 2021 10:44:30 -0300
Message-Id: <20211119134431.406753-2-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211119134431.406753-1-farosas@linux.ibm.com>
References: <20211119134431.406753-1-farosas@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 5uoqWzHR-GL4GIkP-Ql7gGBX102fMr55
X-Proofpoint-ORIG-GUID: eK08-eOXwtOl1tEQ8esi18SCaeJfWunK
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-19_09,2021-11-17_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0
 mlxscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111190075
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: danielhb413@gmail.com, mark.cave-ayland@ilande.co.uk, qemu-ppc@nongnu.org,
 clg@kaod.org, openbios@openbios.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The MPC7450 Family has a software TLB search feature that defines
three interrupts at 0x1000, 0x1100 and 0x1200. These are not currently
implemented in openbios.

Due to an outstanding bug in QEMU[1], the feature is always enabled
when emulating the 7450, requiring any software that runs in those
cpus to implement the interrupt handlers.

Fortunately, the 7450 User Manual provides sample code[2] for the TLB
miss handlers so adding support for the feature in openbios is
somewhat easy.

This patch implements the software TLB search so that we can get the
MPC7450 working again on the emulator.

1- https://gitlab.com/qemu-project/qemu/-/issues/86
2- https://www.nxp.com/docs/en/reference-manual/MPC7450UM.pdf
(5.5.5.2.2 - Code for Example Exception Handlers)

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 arch/ppc/qemu/start.S | 236 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 233 insertions(+), 3 deletions(-)

diff --git a/arch/ppc/qemu/start.S b/arch/ppc/qemu/start.S
index c679230..a09a210 100644
--- a/arch/ppc/qemu/start.S
+++ b/arch/ppc/qemu/start.S
@@ -25,6 +25,10 @@
 #define ILLEGAL_VECTOR( v )	.org __vectors + v ; vector__##v: bl trap_error ;
 #define VECTOR( v, dummystr )	.org __vectors + v ; vector__##v
 
+#define SPR_TLBMISS 980
+#define SPR_PTEHI   981
+#define SPR_PTELO   982
+
 #ifdef CONFIG_PPC_64BITSUPPORT
 
 /* We're trying to use the same code for the ppc32 and ppc64 handlers here.
@@ -164,6 +168,76 @@
 	EXCEPTION_EPILOGUE_TEMPLATE
 .endm
 
+.macro ITLB_SEARCH
+	TLB_SEARCH
+.endm
+
+.macro DTLB_SEARCH
+	TLB_SEARCH 1
+.endm
+
+.macro TLB_SEARCH data
+	mfspr	r0,SPR_TLBMISS /* EA of access that missed */
+	rlwinm	r0,r0,20,16,31 /* mask out lower 16 bits of EA */
+	mfspr	r1,SPR_PTEHI   /* PTEHI[1:24] has the VSID */
+	rlwinm	r1,r1,25,8,31  /* mask out upper 23 bits of VSID */
+
+	xor	r1,r0,r1       /* primary hash */
+	mfsdr1	r3
+	rlwinm	r0,r3,10,13,31 /* align HTMEXT and HTABMASK fields */
+	ori	r0,r0,0x3ff    /* mask out HTMEXT and HTABMASK */
+	and	r1,r0,r1
+	rlwinm	r0,r3,26,13,21
+	or	r1,r0,r1
+
+/* 32-bit PTEG address generation into r2 */
+	andis.	r2,r3,0xfe00
+	rlwimi	r2,r1,6,7,25
+
+	xor	r1,r1,r1
+	addi	r1,r1,8
+	mfspr	r3,SPR_PTEHI
+	addi	r2,r2,-8
+
+1:
+	mtctr	r1
+2:
+	lwzu	r1,8(r2)      /* get next pte */
+	cmp	0,r1,r3
+	bdnzf	eq,2b
+	beq	1f           /* found */
+
+	andi.	r1,r3,0x0040   /* see if we have done second hash */
+.ifnb data
+	bne	do_dsi
+.else
+	bne	do_isi
+.endif
+	mfspr	r0,SPR_TLBMISS /* EA of access that missed */
+	rlwinm	r0,r0,20,16,3  /* mask out lower 16 bits of EA */
+	mfspr	r1,SPR_PTEHI   /* PTEHI[1:24] has the VSID */
+	rlwinm	r1,r1,25,8,31  /* mask out uppder 23 bits of VSID */
+
+	xor	r1,r0,r1       /* primary hash */
+	mfsdr1	r3
+	rlwinm	r0,r3,10,13,31  /* align HTMEXT and HTABMASK fields */
+	ori	r0,r0,0x3ff     /* mask out HTMEXT and HTABMASK */
+	and	r1,r0,r1
+	rlwinm	r0,r3,26,13,21
+	or	r1,r0,r1
+
+/* 32-bit PTEG address generation into r2 */
+	andis.	r2,r3,0xfe00
+	rlwimi	r2,r1,6,7,25
+
+	ori	r3,r3,0x0040
+	addi	r1,r0,8
+	addi	r2,r2,-8
+	b	1b
+
+1:
+.endm
+
 #undef ULONG_SIZE
 #undef stl
 #undef ll
@@ -329,9 +403,16 @@ ILLEGAL_VECTOR( 0xd00 )
 ILLEGAL_VECTOR( 0xe00 )
 ILLEGAL_VECTOR( 0xf00 )
 ILLEGAL_VECTOR( 0xf20 )
-ILLEGAL_VECTOR( 0x1000 )
-ILLEGAL_VECTOR( 0x1100 )
-ILLEGAL_VECTOR( 0x1200 )
+
+VECTOR( 0x1000, "IFTLB" ):
+	b	insn_tlb_miss
+
+VECTOR( 0x1100, "DLTLB" ):
+	b	data_load_tlb_miss
+
+VECTOR( 0x1200, "DSTLB" ):
+	b	data_store_tlb_miss
+
 ILLEGAL_VECTOR( 0x1300 )
 ILLEGAL_VECTOR( 0x1400 )
 ILLEGAL_VECTOR( 0x1500 )
@@ -373,6 +454,155 @@ real_isi:
 exception_return:
 	EXCEPTION_EPILOGUE
 
+/*
+ * Instruction TLB miss
+ * Entry:
+ *       srr0    -> address of instruction that missed
+ *       srr1    -> 16:31 = saved MSR
+ *       TLBMISS -> ea that missed
+ *       PTEHI   -> upper 32-bits of pte value
+ *       PTELO   -> lower 32-bits of pte value
+ */
+insn_tlb_miss:
+	EXCEPTION_PREAMBLE
+	mtsprg3	r1             /* save ABI frame, we might call into C later */
+
+	ITLB_SEARCH
+
+/* pte found*/
+	lwz	r1,4(r2)          /* load tlb entry lower-word */
+	andi.	r3,r1,8           /* check G-bit */
+	bne	isi_prot          /* if guarded, take an ISI */
+
+	ori	r1,r1,0x100       /* set reference bit */
+	mtspr	SPR_PTELO,r1      /* put rpn into PTELO */
+	mfspr	r0,SPR_TLBMISS
+	tlbli	r0                /* load the itlb */
+	srwi	r1,r1,8           /* get byte 7 of pte */
+	stb	r1,6(r2)          /* update page table */
+
+	mfsprg3 r1           /* restore C ABI stack */
+	b exception_return
+
+/* Guarded memory protection violation: synthesize an ISI exception */
+isi_prot:
+	mfsrr1	r3
+	andi.	r2,r3,0xffff /* clean upper SRR1 */
+	addis	r2,r2,0x0800 /* protection violation flag */
+	b	1f
+
+do_isi:
+	mfsrr1	r3
+	andi.	r2,r3,0xffff
+	addis	r2,r2,0x4000 /* pte not found flag */
+	mtsrr1	r2
+	mtcrf	0x80,r3
+1:
+	mfsprg3 r1           /* restore C ABI stack */
+	LOAD_REG_FUNC(r3, isi_exception)
+	mtctr	r3
+	bctrl
+	b exception_return
+
+/*
+ * Data Load TLB miss
+ * Entry:
+ *       srr0    -> address of instruction that caused data tlb miss
+ *       srr1    -> 16:31 = saved MSR
+ *       TLBMISS -> ea that missed
+ *       PTEHI   -> upper 32-bits of pte value
+ *       PTELO   -> lower 32-bits of pte value
+ */
+data_load_tlb_miss:
+	EXCEPTION_PREAMBLE
+	mtsprg3	r1             /* save ABI frame, we might call into C later */
+
+	DTLB_SEARCH
+
+/* pte found */
+	lwz	r1,4(r2)       /* load tlb entry lower-word */
+	ori	r1,r1,0x100    /* set reference bit */
+	mtspr	SPR_PTELO,r1   /* put RPN into PTELO */
+	mfspr	r0,SPR_TLBMISS
+	tlbld	r0             /* load the dtlb */
+	srwi	r1,r1,8        /* get byte 7 of pte */
+	stb	r1,6(r2)       /* update page table */
+
+	mfsprg3 r1             /* restore C ABI stack */
+	b exception_return
+
+/*
+ * Data Store TLB miss
+ * Entry:
+ *       srr0    -> address of instruction that caused data tlb miss
+ *       srr1    -> 16:31 = saved MSR
+ *       TLBMISS -> ea that missed
+ *       PTEHI   -> upper 32-bits of pte value
+ *       PTELO   -> lower 32-bits of pte value
+ */
+data_store_tlb_miss:
+	EXCEPTION_PREAMBLE
+	mtsprg3	r1             /* save ABI frame, we might call into C later */
+
+	DTLB_SEARCH
+
+/* pte found */
+	lwz	r1,4(r2)               /* load tlb entry lower-word */
+	andi.	r3,r1,0x80             /* check the C-bit */
+	beq	data_store_prot_check  /* if (C==0) go check protection modes */
+3:
+	ori	r1,r1,0x180     /* set reference and change bit */
+	mtspr	SPR_PTELO,r1    /* put RPN into PTELO */
+	mfspr	r0,SPR_TLBMISS
+	xori	r0,r0,0x01      /* toggle LRU bit */
+	tlbld	r0              /* load the dtlb */
+	sth	r1,6(r2)        /* update page table */
+
+	mfsprg3 r1             /* restore C ABI stack */
+	b exception_return
+
+data_store_prot_check:
+	rlwinm.	r3,r1,30,0,1  /* test PP */
+	bge-	1f            /* if (PP==00 or PP==01) go check KEY bit */
+	andi.	r3,r1,1       /* test PP[0] */
+	beq+	3b            /* return if PP[0]==0 */
+	b	dsi_prot
+1:
+	mfsrr1	r3
+	andis.	r3,r3,0x0008  /* test the KEY bit (SRR1-bit 12) */
+	ble	3b
+
+dsi_prot:
+	mfsrr1	r3
+	rlwinm	r1,r3,9,6,6  /* copy load/store bit over */
+	addis	r1,r1,0x0800 /* protection violation flag */
+	b	2f
+
+do_dsi:
+	mfsrr1	r3
+	rlwinm	r1,r3,9,6,6   /* copy load/store bit over */
+	addis	r1,r1,0x4000  /* pte not found */
+
+2:
+	andis.	r2,r3,0x0200  /* save the Altivec Avail. bit in r2 */
+	andi.	r3,r3,0xffff  /* clear upper SRR1 */
+	or	r2,r2,r3
+	mtsrr1	r2
+	mtdsisr	r1
+	mfspr	r1,SPR_TLBMISS
+	rlwinm	r1,r1,0,0,30   /* Clear the LRU bit */
+	rlwinm.	r2,r2,0,31,31  /* test LE bit */
+	beq	3f
+	xori	r1,r1,0x07
+3:
+	mtdar	r1
+	mtcrf	0x80,r3
+	mfsprg3 r1           /* restore C ABI stack */
+	LOAD_REG_FUNC(r3, dsi_exception)
+	mtctr	r3
+	bctrl
+	b exception_return
+
 GLOBL(__vectors_end):
 
 /************************************************************************/
-- 
2.29.2


