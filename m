Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BF73696DA
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 18:26:15 +0200 (CEST)
Received: from localhost ([::1]:56154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZydC-00026x-Ef
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 12:26:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1lZyc7-0001W6-9f; Fri, 23 Apr 2021 12:25:07 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:21436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1lZyc3-00040h-Mp; Fri, 23 Apr 2021 12:25:06 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13NG389b036434; Fri, 23 Apr 2021 12:25:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=BlLYRmXNjH+X8FDsZ8iDQPDDDOI9SQskwF8mHk8DUxA=;
 b=MCZQSWslfdu0wsBwsS4tA2jNHEVeWhAa7LgUgXysQj8Z5l/XeuETOoEZmgDJF9dDo9N0
 TXHByf+x5A3PzKfb1S9OZYqsty5AO5GGDqwXU4wH97jzinF0NsMYklrB+9TA0mtW7XHG
 OYcmCaTTHNdGsVNiciSEZRQ0wfc1F5DkWrtyNpFD8UNgzu3BwP7nit2uMkm5YfKmo14m
 6Y4U5pGfAyUofe1KrMvmR3l97adLogcndHyfuQflqpwvE5YhBKEmqH+ag8vIoNfnVW10
 5x7SU5K97zJtg5NbScwvC4YeXeDYc3zvIqL6SU2aUqzaTFwSLK+4SOAZE4nPyPROctFf LQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 383y5g5tht-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Apr 2021 12:25:00 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13NG3KgC037359;
 Fri, 23 Apr 2021 12:25:00 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 383y5g5thh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Apr 2021 12:25:00 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13NGMuRH019975;
 Fri, 23 Apr 2021 16:24:59 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma04dal.us.ibm.com with ESMTP id 37yqaapj3d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Apr 2021 16:24:59 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13NGOwXG53215660
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 23 Apr 2021 16:24:59 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DE62FAE05F;
 Fri, 23 Apr 2021 16:24:58 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 74BF7AE05C;
 Fri, 23 Apr 2021 16:24:58 +0000 (GMT)
Received: from farman-thinkpad-t470p (unknown [9.160.17.178])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 23 Apr 2021 16:24:58 +0000 (GMT)
Message-ID: <48d2a3b8ef52ac657d8d0ea2f292d21e0ef0383c.camel@linux.ibm.com>
Subject: Re: [PATCH v2] vfio-ccw: Permit missing IRQs
From: Eric Farman <farman@linux.ibm.com>
To: Matthew Rosato <mjrosato@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>
Date: Fri, 23 Apr 2021 12:24:57 -0400
In-Reply-To: <7be02ac9-c5d7-1263-ea0e-e0e0a2894521@linux.ibm.com>
References: <20210421152053.2379873-1-farman@linux.ibm.com>
 <20210423134252.264059e5.cohuck@redhat.com>
 <7be02ac9-c5d7-1263-ea0e-e0e0a2894521@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-14.el8) 
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: MktTJpQVng6_r4kwXBIcAEovZdbrya24
X-Proofpoint-GUID: arW33uQcgRXhL1B8WcWMBynvMM2tBrhx
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-23_07:2021-04-23,
 2021-04-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015
 mlxlogscore=999 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 bulkscore=0 spamscore=0 adultscore=0 impostorscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104230101
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farman@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-s390x@nongnu.org, Alex Williamson <alex.williamson@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 2021-04-23 at 09:22 -0400, Matthew Rosato wrote:
> On 4/23/21 7:42 AM, Cornelia Huck wrote:
> > On Wed, 21 Apr 2021 17:20:53 +0200
> > Eric Farman <farman@linux.ibm.com> wrote:
> > 
> > > Commit 690e29b91102 ("vfio-ccw: Refactor ccw irq handler")
> > > changed
> > > one of the checks for the IRQ notifier registration from saying
> > > "the host needs to recognize the only IRQ that exists" to saying
> > > "the host needs to recognize ANY IRQ that exists."
> > > 
> > > And this worked fine, because the subsequent change to support
> > > the
> > > CRW IRQ notifier doesn't get into this code when running on an
> > > older
> > > kernel, thanks to a guard by a capability region. The later
> > > addition
> > > of the REQ(uest) IRQ by commit b2f96f9e4f5f ("vfio-ccw: Connect
> > > the
> > > device request notifier") broke this assumption because there is
> > > no
> > > matching capability region. Thus, running new QEMU on an older
> > > kernel fails with:
> > > 
> > >    vfio: unexpected number of irqs 2
> > > 
> > > Let's adapt the message here so that there's a better clue of
> > > what
> > > IRQ is missing.
> > > 
> > > Furthermore, let's make the REQ(uest) IRQ not fail when
> > > attempting
> > > to register it, to permit running vfio-ccw on a newer QEMU with
> > > an
> > > older kernel.
> > > 
> > > Fixes: b2f96f9e4f5f ("vfio-ccw: Connect the device request
> > > notifier")
> > > Signed-off-by: Eric Farman <farman@linux.ibm.com>
> > > ---
> > > 
> > > Notes:
> > >      v1->v2:
> > >       - Keep existing "invalid number of IRQs" message with
> > > adapted text [CH]
> > >       - Move the "is this an error" test to the registration of
> > > the IRQ in
> > >         question, rather than making it allowable for any IRQ
> > > mismatch [CH]
> > >       - Drop Fixes tag for initial commit [EF]
> > >      
> > >      v1: 
> > > https://lore.kernel.org/qemu-devel/20210419184906.2847283-1-farman@linux.ibm.com/
> > > 
> > >   hw/vfio/ccw.c | 12 +++++++-----
> > >   1 file changed, 7 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
> > > index b2df708e4b..400bc07fe2 100644
> > > --- a/hw/vfio/ccw.c
> > > +++ b/hw/vfio/ccw.c
> > > @@ -412,8 +412,8 @@ static void
> > > vfio_ccw_register_irq_notifier(VFIOCCWDevice *vcdev,
> > >       }
> > >   
> > >       if (vdev->num_irqs < irq + 1) {
> > > -        error_setg(errp, "vfio: unexpected number of irqs %u",
> > > -                   vdev->num_irqs);
> > > +        error_setg(errp, "vfio: IRQ %u not available (number of
> > > irqs %u)",
> > > +                   irq, vdev->num_irqs);
> > >           return;
> > >       }
> > >   
> > > @@ -696,13 +696,15 @@ static void vfio_ccw_realize(DeviceState
> > > *dev, Error **errp)
> > >   
> > >       vfio_ccw_register_irq_notifier(vcdev,
> > > VFIO_CCW_REQ_IRQ_INDEX, &err);
> > >       if (err) {
> > > -        goto out_req_notifier_err;
> > > +        /*
> > > +         * Report this error, but do not make it a failing
> > > condition.
> > > +         * Lack of this IRQ in the host does not prevent normal
> > > operation.
> > > +         */
> > > +        error_report_err(err);
> > >       }
> > >   
> > >       return;
> > >   
> > > -out_req_notifier_err:
> > > -    vfio_ccw_unregister_irq_notifier(vcdev,
> > > VFIO_CCW_CRW_IRQ_INDEX);
> > >   out_crw_notifier_err:
> > >       vfio_ccw_unregister_irq_notifier(vcdev,
> > > VFIO_CCW_IO_IRQ_INDEX);
> > >   out_io_notifier_err:
> > 
> > Patch looks good to me, but now I'm wondering: Is calling
> > vfio_ccw_unregister_irq_notifier() for an unregistered irq actually
> > safe? I think it is (our notifiers are always present, and we
> > should
> 
> So the unregister really does 4 things of interest:

s/4/3/ :)

> 
> 1) vfio_set_irq_signaling(VFIO_IRQ_SET_ACTION_TRIGGER)
> This will drive VFIO_DEVICE_SET_IRQS ioctl, and it looks to me like
> the 
> VFIO_DEVICE_SET_IRQS ioctl should return -EINVAL if it's not
> registered 
> with the kernel, which will in turn cause the vfio_set_irq_signaling
> to 
> fast-path out on a return 0.  That seems correct.
> 
> 2) qemu_set_fd_handler
> If we never registered (or it was already unregistered) then fd
> should 
> not show up in find_aio_handler() so we should also bail out fast on 
> qemu_set_fd_handler()
> 
> 3) event_notifier_cleanup
> Should bail out right away if already cleaned up before
> (!initialized)
> 
> So, this looks OK to me.

+1 (Thanks for doing the research, Matt)

> 
> 
> > handle any ioctl failure gracefully), but worth a second look. In
> > fact,
> > we already unregister the crw irq unconditionally, so we would
> > likely
> > already have seen any problems for that one, so I assume all is
> > good.
> > 
> 
> But +1 on driving the path and making sure it works anyway (do a 
> double-unregister?)

Yeah, works fine. Tried skipping the register of the CRW and double-
unregistering the IO IRQ.

I also tried a combination where I unconditionally unregister the REQ
IRQ, which obviously throws a message when it doesn't exist on the
host.

That might be nice to clean up so that adding new IRQs in the future is
more intuitive; I'll add it to the list unless you want me to address
it in a v2 of this. (Previously, the addition of the REQ IRQ needed to
add the cleanup of the CRW IRQ. So the next IRQ would need to cleanup
the REQ IRQ.)

Eric


