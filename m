Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0900688044
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 15:40:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNajr-00027y-4K; Thu, 02 Feb 2023 09:38:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1pNajm-00027I-PE
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 09:38:55 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1pNajk-000832-Ff
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 09:38:54 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 312DD3GF016494; Thu, 2 Feb 2023 14:38:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : mime-version : content-transfer-encoding; s=pp1;
 bh=ifhuSaKLkJgcAK4vAvQWM/QzSwWMYPkxmhDTHEtRoG4=;
 b=m5rCiSoIM3FRVSUbMa0bB1snOoUckVbGUxipvL3OVJplg4WmRUmNlV4ibcgkBYa4rkv+
 zo/gi14oUHLWIBsaa/bx/oe8x5WFvBuxb3b+6L9szakWnUIrfUTXTG8BZ2n+by2p2dnD
 fi3NYWROAIveMal1Zx6AG0qAJwFgipa9RsQhYcNAZsDQdHFaTGSE46kDjkDpG/+9oSSM
 3rTlllwTnc4++G3alUfA6th0JurlW3YU/oDY5FjqMLcu3d5CyFvfW6j7uHdoJVCFSPxl
 gXUcYcK620wXGCsWoX5OgNPrSTtrDqxAWxVu5HWlUvNpbNR/6dVGq8shh2I9tPWP3l4n dQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ng92m9rfj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Feb 2023 14:38:48 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 312EW4l7020687;
 Thu, 2 Feb 2023 14:38:48 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ng92m9rej-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Feb 2023 14:38:47 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 312BsVjL005472;
 Thu, 2 Feb 2023 14:38:46 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([9.208.129.119])
 by ppma02wdc.us.ibm.com (PPS) with ESMTPS id 3ncvv23wh6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Feb 2023 14:38:46 +0000
Received: from b03ledav001.gho.boulder.ibm.com ([9.17.130.232])
 by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 312EciT424969732
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 2 Feb 2023 14:38:45 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 452766E050;
 Thu,  2 Feb 2023 14:40:55 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4E5996E04E;
 Thu,  2 Feb 2023 14:40:54 +0000 (GMT)
Received: from lingrow.int.hansenpartnership.com (unknown [9.211.110.248])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  2 Feb 2023 14:40:53 +0000 (GMT)
Message-ID: <d2e01e48fa215684447d17d21d48fa681ab7f7d3.camel@linux.ibm.com>
Subject: Re: [PATCH] x86: fix q35 kernel measurements broken due to rng seeding
From: James Bottomley <jejb@linux.ibm.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann
 <kraxel@redhat.com>, DOV MURIK <Dov.Murik1@il.ibm.com>, "H . Peter Anvin"
 <hpa@zytor.com>
Date: Thu, 02 Feb 2023 09:38:12 -0500
In-Reply-To: <CAHmME9qy3_TPXoZ4j10JUvGGAbNikb5MdgQRw5DgTmj7nqLujA@mail.gmail.com>
References: <da39abab9785aea2a2e7652ed6403b6268aeb31f.camel@linux.ibm.com>
 <CAHmME9ouTTk1ONXm276CwunOpy=MAW1Q79x25kcQv=YJTZ88dQ@mail.gmail.com>
 <2b8fc552e1dc3a14de404eeaff0819ec8da7de54.camel@linux.ibm.com>
 <CAHmME9ps8w8TbC_6Bk8OQbJytR-_CJrcUWT_uXDV+xjL293NHQ@mail.gmail.com>
 <a2d5634ab624497d7d98569041e76661062f7eaf.camel@linux.ibm.com>
 <CAHmME9qy3_TPXoZ4j10JUvGGAbNikb5MdgQRw5DgTmj7nqLujA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: qUwqnPjGbQxlsz-GuIvQ5w6qhO4u0f3J
X-Proofpoint-ORIG-GUID: YEjks8_aI8bh8DjX-Jrdf0mycuC496l8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-02_04,2023-02-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 adultscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 clxscore=1011
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302020131
Received-SPF: pass client-ip=148.163.156.1; envelope-from=jejb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Reply-To: jejb@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 2023-02-01 at 15:48 -0500, Jason A. Donenfeld wrote:
[...]
> But it sounds like you might now have a concrete suggestion on
> something even better. I'm CCing hpa, as this is his wheelhouse, and
> maybe you two can divise the next step while I'm away. Maybe the pad9
> thing you mentioned is the super nice solution we've been searching
> for this whole time. When I'm home in 10 days and have internet
> again, I'll take a look at where thing's are out and try to figure
> out how I can be productive again with it.

OK, so just FYI HPA, this is the patch I'm thinking of sending to
linux-kernel to reserve space in struct boot_params for this.  If you
could take a look and advise on the location before I send the final
patch, I'd be grateful.  I took space in _pad9 because that's the
standard method (add on to end), but it does strike me we could also
use all of _pad8 for the (the addition is only 48 bytes) or even _pad3
+ hd0_info + hd1_info.

James

---

diff --git a/arch/x86/boot/header.S b/arch/x86/boot/header.S
index 9338c68e7413..0120ab77dac9 100644
--- a/arch/x86/boot/header.S
+++ b/arch/x86/boot/header.S
@@ -308,7 +308,7 @@ _start:
 	# Part 2 of the header, from the old setup.S
 
 		.ascii	"HdrS"		# header signature
-		.word	0x020f		# header version number (>= 0x0105)
+		.word	0x0210		# header version number (>= 0x0105)
 					# or else old loadlin-1.5 will fail)
 		.globl realmode_swtch
 realmode_swtch:	.word	0, 0		# default_switch, SETUPSEG
diff --git a/arch/x86/include/uapi/asm/bootparam.h b/arch/x86/include/uapi/asm/bootparam.h
index 01d19fc22346..c614ff0755f2 100644
--- a/arch/x86/include/uapi/asm/bootparam.h
+++ b/arch/x86/include/uapi/asm/bootparam.h
@@ -181,6 +181,19 @@ struct ima_setup_data {
 	__u64 size;
 } __attribute__((packed));
 
+/*
+ * Define a boot_param area for the RNG seed which can be used via the
+ * setup_data mechanism (so must have a setup_data header) but which
+ * is embedded in boot_params because qemu has been unable to find
+ * a safe data space for it.  The value RNG_SEED_LENGTH must not
+ * change (pad length dependent on it) and must match the value in QEMU
+ */
+#define RNG_SEED_LENGTH	32
+struct random_seed_data {
+	struct	setup_data s;
+	__u8	data[RNG_SEED_LENGTH];
+} __attribute__((packed));
+
 /* The so-called "zeropage" */
 struct boot_params {
 	struct screen_info screen_info;			/* 0x000 */
@@ -228,7 +241,8 @@ struct boot_params {
 	struct boot_e820_entry e820_table[E820_MAX_ENTRIES_ZEROPAGE]; /* 0x2d0 */
 	__u8  _pad8[48];				/* 0xcd0 */
 	struct edd_info eddbuf[EDDMAXNR];		/* 0xd00 */
-	__u8  _pad9[276];				/* 0xeec */
+	struct random_seed_data random_seed;		/* 0xeec */
+	__u8  _pad9[228];				/* 0xf1c */
 } __attribute__((packed));
 
 /**
diff --git a/arch/x86/kernel/kexec-bzimage64.c b/arch/x86/kernel/kexec-bzimage64.c
index 6b58610a1552..fb719682579d 100644
--- a/arch/x86/kernel/kexec-bzimage64.c
+++ b/arch/x86/kernel/kexec-bzimage64.c
@@ -110,13 +110,10 @@ static int setup_e820_entries(struct boot_params *params)
 	return 0;
 }
 
-enum { RNG_SEED_LENGTH = 32 };
-
 static void
-setup_rng_seed(struct boot_params *params, unsigned long params_load_addr,
-	       unsigned int rng_seed_setup_data_offset)
+setup_rng_seed(struct boot_params *params, unsigned long params_load_addr)
 {
-	struct setup_data *sd = (void *)params + rng_seed_setup_data_offset;
+	struct setup_data *sd = &params->random_seed.s;
 	unsigned long setup_data_phys;
 
 	if (!rng_is_initialized())
@@ -125,7 +122,8 @@ setup_rng_seed(struct boot_params *params, unsigned long params_load_addr,
 	sd->type = SETUP_RNG_SEED;
 	sd->len = RNG_SEED_LENGTH;
 	get_random_bytes(sd->data, RNG_SEED_LENGTH);
-	setup_data_phys = params_load_addr + rng_seed_setup_data_offset;
+	setup_data_phys = params_load_addr + offsetof(struct boot_params,
+						      random_seed);
 	sd->next = params->hdr.setup_data;
 	params->hdr.setup_data = setup_data_phys;
 }
@@ -306,7 +304,7 @@ setup_boot_parameters(struct kimage *image, struct boot_params *params,
 	}
 
 	/* Setup RNG seed */
-	setup_rng_seed(params, params_load_addr, setup_data_offset);
+	setup_rng_seed(params, params_load_addr);
 
 	/* Setup EDD info */
 	memcpy(params->eddbuf, boot_params.eddbuf,


