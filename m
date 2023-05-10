Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4843F6FD845
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 09:33:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pweK3-0001BU-3u; Wed, 10 May 2023 03:33:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1pweK0-0001B3-SG; Wed, 10 May 2023 03:33:12 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1pweJy-00068Z-Nx; Wed, 10 May 2023 03:33:12 -0400
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34A7JUDS030852; Wed, 10 May 2023 07:33:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=+DoZ/qZ5gXH0NsP2Zdf9CZRAQTKFPUANKEjFN0ziSpY=;
 b=DVZC00By17ofAQzINsNUSBtz1cDYTZiVoBJ2MQqHdUnklzI/4wJxExg/aCwQVJH/v7bo
 6i7rZmRRNUiUkCXwWireCoDXOnHv8L4c/cpxq/VFFTuFEmwHvGyZl5VelMz7gSFOjrTf
 sbPkE39599V51Ev08fLnPxwo3uimXnWWpGaKDVR+ZexuNGv280T1+L0418WjaB4CP04o
 dhX1C0JDpknVWz6myMtaKuROroWFET82x1Wx1NBDEjfEdmHolNwvqYr0EQHrB9G4noIO
 50OtqfuTlVwzRtipiyXldhz5fgwNBokDpAbAL0G11CY9G/L+J09XvwYFhPzhU1R1KGcr 5g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qg6an13g5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 May 2023 07:33:08 +0000
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34A7Ok29016209;
 Wed, 10 May 2023 07:33:07 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qg6an13ex-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 May 2023 07:33:07 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 34A3E8KH025044;
 Wed, 10 May 2023 07:33:05 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
 by ppma01fra.de.ibm.com (PPS) with ESMTPS id 3qf7e0rqkj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 May 2023 07:33:05 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com
 [10.20.54.105])
 by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 34A7X25a54329692
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 May 2023 07:33:02 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F2D9420043;
 Wed, 10 May 2023 07:33:01 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AC17920040;
 Wed, 10 May 2023 07:33:01 +0000 (GMT)
Received: from p-imbrenda (unknown [9.152.224.56])
 by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Wed, 10 May 2023 07:33:01 +0000 (GMT)
Date: Wed, 10 May 2023 09:32:59 +0200
From: Claudio Imbrenda <imbrenda@linux.ibm.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org, borntraeger@de.ibm.com,
 nsg@linux.ibm.com, nrb@linux.ibm.com, frankja@linux.ibm.com,
 pasic@linux.ibm.com, mhartmay@linux.ibm.com
Subject: Re: [PATCH v1 1/1] s390x/pv: Fix spurious warning with asynchronous
 teardown
Message-ID: <20230510093259.7884eb40@p-imbrenda>
In-Reply-To: <e2f59e7e-e5d5-0bc3-e889-e84460ca99d6@redhat.com>
References: <20230509162740.58081-1-imbrenda@linux.ibm.com>
 <e2f59e7e-e5d5-0bc3-e889-e84460ca99d6@redhat.com>
Organization: IBM
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: BFXrUFparLEeBplBDdMTrY00RI7LHLwj
X-Proofpoint-GUID: TI41ONIM7sm6P9OITzulO8WDsaQrNlkq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-10_04,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0
 phishscore=0 spamscore=0 mlxlogscore=999 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 mlxscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305100059
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=imbrenda@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 10 May 2023 08:47:08 +0200
Thomas Huth <thuth@redhat.com> wrote:

> On 09/05/2023 18.27, Claudio Imbrenda wrote:
> > When rebooting a small VM using asynchronous teardown, a spurious
> > warning is emitted when the KVM_PV_ASYNC_CLEANUP_PREPARE ioctl fails.  
> 
> Why does the _PREPARE fail in that case? Why 4GiB and not more or less? This 

because of kernel commit 292a7d6fca33df70ca4b8e9b0d0e74adf87582dc, which
fixes problems in case the VM is small (<2GiB)

> sounds racy... what if you have a faster or slower machine?

why racy?

2 or 4GiB is still very fast, and at some point you have to draw a line.
I could make it 2GiB, which is the limit at which _PREPARE will fail,
but since I'm touching this code, I would like to avoid unnecessary
overhead, instead of "just fixing" 

I can put the limit to 2GiB if you think it's more clean

> 
> > Avoid using asynchronous teardown altogether when the VM is small
> > enough; the cutoff is set at 4GiB. This will avoid triggering the
> > warning and also avoid pointless overhead; normal teardown is fast
> > enough for small VMs.
> > 
> > Reported-by: Marc Hartmayer <mhartmay@linux.ibm.com>
> > Fixes: c3a073c610 ("s390x/pv: Add support for asynchronous teardown for reboot")
> > Signed-off-by: Claudio Imbrenda <imbrenda@linux.ibm.com>
> > ---
> >   hw/s390x/pv.c | 6 +++++-
> >   1 file changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/hw/s390x/pv.c b/hw/s390x/pv.c
> > index 49ea38236c..17c5556319 100644
> > --- a/hw/s390x/pv.c
> > +++ b/hw/s390x/pv.c
> > @@ -13,6 +13,7 @@
> >   
> >   #include <linux/kvm.h>
> >   
> > +#include "qemu/units.h"
> >   #include "qapi/error.h"
> >   #include "qemu/error-report.h"
> >   #include "sysemu/kvm.h"
> > @@ -117,13 +118,16 @@ static void *s390_pv_do_unprot_async_fn(void *p)
> >   
> >   bool s390_pv_vm_try_disable_async(void)
> >   {
> > +    MachineState *machine = MACHINE(qdev_get_machine());  
> 
> The calling function (s390_machine_unprotect()) already has a 
> S390CcwMachineState as parameter ... so you could pass along that value to 
> avoid the qdev_get_machine() here.

yes, I was thinking about that and decided against it to avoid changing
interfaces; I'll fix it in the next version

> 
> >       /*
> >        * t is only needed to create the thread; once qemu_thread_create
> >        * returns, it can safely be discarded.
> >        */
> >       QemuThread t;
> >   
> > -    if (!kvm_check_extension(kvm_state, KVM_CAP_S390_PROTECTED_ASYNC_DISABLE)) {
> > +    /* Avoid the overhead of asynchronous teardown for small machines */
> > +    if ((machine->maxram_size < 4 * GiB) ||
> > +        !kvm_check_extension(kvm_state, KVM_CAP_S390_PROTECTED_ASYNC_DISABLE)) {
> >           return false;
> >       }
> >       if (s390_pv_cmd(KVM_PV_ASYNC_CLEANUP_PREPARE, NULL) != 0) {  
> 
>   Thomas
> 


