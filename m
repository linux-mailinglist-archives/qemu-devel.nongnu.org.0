Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2D351ADA4
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 21:17:59 +0200 (CEST)
Received: from localhost ([::1]:35186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmKVa-00046W-FE
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 15:17:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nmKUS-0002yh-Ly; Wed, 04 May 2022 15:16:48 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:29806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nmKUP-0004OX-Hq; Wed, 04 May 2022 15:16:48 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 244J6agK021557;
 Wed, 4 May 2022 19:16:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=UEsWDSuSnsR2nIKX2srX/fuAso3tVZp55k1Q7psmnaE=;
 b=ZklFnsbP6ac8dzaHAdhKjip54e4PmYqdnV22JAOAEG0J+q6LvsObAQ7sY3cAjr+nqFgH
 9FjqjyqlvGTrg5yXtwjk1jsbOXTkR4T2XxsMu0PiF5PKw8hvfVhByrS4u9aZGsg3Gs8t
 HTnpURT96xuc87h/3Vib8YZQzaUMYmObwvSUpp8fTi+ytUhw+RfNfxeRMwcQTBYWuBya
 De3GRgclb5KV+cTBd/cZGfFddQHIsBkMrJc9L4SQl/XPCZd5Iqr8Q4mEsCQBpxUU1N0+
 /C0awkAXuYO9nDXYPvp8eZ0atw6knhhDT11JrFWSflwvc4B4BJ1kssfY4c22pFbEPQU0 tw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fuxqa8tuk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 May 2022 19:16:36 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 244JGZCd030470;
 Wed, 4 May 2022 19:16:35 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fuxqa8tu9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 May 2022 19:16:35 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 244J86eE023935;
 Wed, 4 May 2022 19:16:34 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma03dal.us.ibm.com with ESMTP id 3frvrabswk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 May 2022 19:16:34 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 244JGXnn36897176
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 4 May 2022 19:16:33 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 65857C6062;
 Wed,  4 May 2022 19:16:33 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AAA4EC6066;
 Wed,  4 May 2022 19:16:32 +0000 (GMT)
Received: from localhost (unknown [9.160.62.101])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Wed,  4 May 2022 19:16:32 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-ppc@nongnu.org
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-devel@nongnu.org, David
 Gibson <david@gibson.dropbear.id.au>, Daniel Henrique Barboza
 <danielhb413@gmail.com>
Subject: Re: [PATCH qemu] spapr: Use address from elf parser for kernel address
In-Reply-To: <20220504065536.3534488-1-aik@ozlabs.ru>
References: <20220504065536.3534488-1-aik@ozlabs.ru>
Date: Wed, 04 May 2022 16:16:30 -0300
Message-ID: <87fslp9khd.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: JZqC1YnwMkqeghUhmbXxJIsKveKxEzuj
X-Proofpoint-ORIG-GUID: JsHpp58Mu9nkC0WPdvcObdKPFyMrvzyM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-04_05,2022-05-04_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 mlxscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205040112
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Alexey Kardashevskiy <aik@ozlabs.ru> writes:

> tl;dr: This allows Big Endian zImage booting via -kernel + x-vof=on.
>
> QEMU loads the kernel at 0x400000 by default which works most of
> the time as Linux kernels are relocatable, 64bit and compiled with "-pie"
> (position independent code). This works for a little endian zImage too.
>
> However a big endian zImage is compiled without -pie, is 32bit, linked to
> 0x4000000 so current QEMU ends up loading it at
> 0x4400000 but keeps spapr->kernel_addr unchanged so booting fails.
>
> This uses the kernel address returned from load_elf().
> If the default kernel_addr is used, there is no change in behavior (as
> translate_kernel_address() takes care of this), which is:
> LE/BE vmlinux and LE zImage boot, BE zImage does not.
> If the VM created with "-machine kernel-addr=0,x-vof=on", then QEMU
> prints a warning and BE zImage boots.

I think we can fix this without needing a different command line for BE
zImage (apart from x-vof, which is a separate matter).

If you look at translate_kernel_address, it cannot really work when the
ELF PhysAddr is != 0. We would always hit this sort of 0x4400000 issue,
so if we fix that function like this...

static uint64_t translate_kernel_address(void *opaque, uint64_t addr)
{
    SpaprMachineState *spapr = opaque;

    return addr ? addr : spapr->kernel_addr;
}

...then we could always use the ELF PhysAddr if it is different from 0
and only use the default load addr if the ELF PhysAddr is 0. If the user
gives kernel_addr on the cmdline, we honor that, even if puts the kernel
over the firmware (we have code to detect that).

> @@ -2988,6 +2990,12 @@ static void spapr_machine_init(MachineState *machine)
>              exit(1);
>          }
>  
> +        if (spapr->kernel_addr != loaded_addr) {

This could be:

        if (spapr->kernel_addr == KERNEL_LOAD_ADDR &&
	    spapr->kernel_addr != loaded_addr) {

So the precedence would be:

1- ELF PhysAddr, if != 0. After all, that is what it's for. BE zImage
   falls here;
    
2- KERNEL_LOAD_ADDR. Via translate_kernel_address, LE/BE vmlinux fall
   here;

3- kernel_addr. The user is probably hacking something, just use what
   they gave us. QEMU will yell if they load the kernel over the fw.

> +            warn_report("spapr: kernel_addr changed from 0x%lx to 0x%lx",
> +                        spapr->kernel_addr, loaded_addr);
> +            spapr->kernel_addr = loaded_addr;
> +        }
> +
>          /* load initrd */
>          if (initrd_filename) {
>              /* Try to locate the initrd in the gap between the kernel

