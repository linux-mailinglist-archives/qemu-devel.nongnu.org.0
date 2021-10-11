Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC914296B1
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 20:16:29 +0200 (CEST)
Received: from localhost ([::1]:35212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZzqe-0005i1-3T
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 14:16:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1mZzZ2-00039l-FQ; Mon, 11 Oct 2021 13:58:16 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:43158
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1mZzYy-0004Iv-Jm; Mon, 11 Oct 2021 13:58:15 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19BHfJJW009814; 
 Mon, 11 Oct 2021 13:58:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=FdYN1l8Z1rfKDygHr+lfhzzlOyiFONqjwR6g23+EENk=;
 b=LLHb4YRIBEH3kikfojve84R14cuo3sbExML/K8oyGqg4/CnfFgDrBJuo1gQM0GOnK6Cf
 uPcA27hxLxo9WSe+4ljqsh+ABET9ktHVdaAjlM9HYLOOlmOolBYnustKHJjiOQaijV0Y
 pvoWPP0bzBcVDCfcifvBuBItRo3uNEOPVVKNTbF3kNLQjtkMK7IG4bg1SeTnZJcwBBmC
 jpWZ5yRwczBSYGLiKI5RQl9z7z50i4o5T6VmFuM/abTxtF5tkUld8O1cqtsRQlB9m+rC
 UjWEc/wmF//5x1qbYNrTEvHsCpRwrSL6FQmAvaaLSxkKMG+Kigk7oZh/jNB3zyAEM96R Fg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3bmj9sbeby-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Oct 2021 13:58:08 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19BHg4un016075;
 Mon, 11 Oct 2021 13:58:08 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3bmj9sbebq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Oct 2021 13:58:08 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19BHvH2M032641;
 Mon, 11 Oct 2021 17:58:07 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma03wdc.us.ibm.com with ESMTP id 3bk2qa2q1v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Oct 2021 17:58:07 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19BHw6Ci52822382
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Oct 2021 17:58:06 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8C7E1B206A;
 Mon, 11 Oct 2021 17:58:06 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5F143B206E;
 Mon, 11 Oct 2021 17:58:04 +0000 (GMT)
Received: from farman-thinkpad-t470p (unknown [9.211.134.52])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 11 Oct 2021 17:58:04 +0000 (GMT)
Message-ID: <5f68f12b09b6ec0b4fa23a89ba8c944c22714990.camel@linux.ibm.com>
Subject: Re: [RFC PATCH v1 2/2] s390x/kvm: Pass SIGP Stop flags
From: Eric Farman <farman@linux.ibm.com>
To: David Hildenbrand <david@redhat.com>, Christian Borntraeger
 <borntraeger@de.ibm.com>, Halil Pasic <pasic@linux.ibm.com>, Cornelia Huck
 <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>
Date: Mon, 11 Oct 2021 13:58:03 -0400
In-Reply-To: <fd2325a4-7c3a-b677-d259-b3731da507a2@redhat.com>
References: <20211008203811.1980478-1-farman@linux.ibm.com>
 <20211008203811.1980478-3-farman@linux.ibm.com>
 <0addcdbc-50cb-420d-5864-af3a8a894321@redhat.com>
 <28832611-02f0-7e52-6f15-39427c96d8bf@de.ibm.com>
 <fd2325a4-7c3a-b677-d259-b3731da507a2@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-16.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: UG__cr_OHMRV1uO690b01G3-Jent-leL
X-Proofpoint-ORIG-GUID: apciqbtmLwDyZZfB-Y8OISVlgh7xSgr0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-11_06,2021-10-11_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 mlxlogscore=873 clxscore=1015 mlxscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110110103
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farman@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Janosch Frank <frankja@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 2021-10-11 at 11:21 +0200, David Hildenbrand wrote:
> On 11.10.21 10:40, Christian Borntraeger wrote:
> > 
> > Am 11.10.21 um 09:09 schrieb David Hildenbrand:
> > > On 08.10.21 22:38, Eric Farman wrote:
> > > > When building a Stop IRQ to pass to KVM, we should incorporate
> > > > the flags if handling the SIGP Stop and Store Status order.
> > > > With that, KVM can reject other orders that are submitted for
> > > > the same CPU while the operation is fully processed.
> > > > 
> > > > Signed-off-by: Eric Farman <farman@linux.ibm.com>
> > > > Acked-by: Janosch Frank <frankja@linux.ibm.com>
> > > > ---
> > > >    target/s390x/kvm/kvm.c | 4 ++++
> > > >    1 file changed, 4 insertions(+)
> > > > 
> > > > diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
> > > > index 5b1fdb55c4..701b9ddc88 100644
> > > > --- a/target/s390x/kvm/kvm.c
> > > > +++ b/target/s390x/kvm/kvm.c
> > > > @@ -2555,6 +2555,10 @@ void kvm_s390_stop_interrupt(S390CPU
> > > > *cpu)
> > > >            .type = KVM_S390_SIGP_STOP,
> > > >        };
> > > > +    if (cpu->env.sigp_order == SIGP_STOP_STORE_STATUS) {
> > > > +        irq.u.stop.flags = KVM_S390_STOP_FLAG_STORE_STATUS;
> > > > +    }
> > > > +
> > > 
> > > KVM_S390_STOP_FLAG_STORE_STATUS tells KVM to perform the store
> > > status as well ... is that really what we want?
> > At least it should not hurt I guess. QEMU then does it again?
> 
> The thing is, that before we officially completed the action in user 
> space (and let other SIGP actions actually succeed in user space on
> the 
> CPU), the target CPU will be reported as !busy in the kernel
> already. 
> And before we even inject the stop interrupt, the CPU will be
> detected 
> as !busy in the kernel. I guess it will fix some cases where we poll
> via 
> SENSE if the stop and store happened, because the store *did* happen
> in 
> the kernel and we'll simply store again in user space.
> 
> However, I wonder if we want to handle it more generically: Properly 
> flag a CPU as busy for SIGP when we start processing the order until
> we 
> completed processing the order. That would allow to handle other
> SIGP 
> operations in user space cleanly, without any chance for races with 
> SENSE code running in the kernel.
> 

I think a generic solution would be ideal, but I'm wrestling with the
race with the kernel's SENSE code. Today, handle_sigp_single_dst
already checks to see if a CPU is currently processing an order and
returns a CC2 when it does, but of course the kernel's SENSE code
doesn't know that. We could flag the CPU as busy in the kernel when
sending a SIGP to userspace, so that the SENSE code indicates BUSY, but
then how do we know when userspace is finished and the CPU is no longer
BUSY?

Eric


