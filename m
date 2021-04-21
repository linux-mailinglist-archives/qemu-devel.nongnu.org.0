Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D881366AD7
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 14:33:14 +0200 (CEST)
Received: from localhost ([::1]:54166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZC2b-0008E3-1S
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 08:33:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1lZBxv-0006Rc-C3; Wed, 21 Apr 2021 08:28:23 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:30158
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1lZBxt-00025J-9O; Wed, 21 Apr 2021 08:28:23 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13LC4cuG063511; Wed, 21 Apr 2021 08:28:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=W0+6zYvj4QITzwGlA8c5ui1VRaDkdXZR4pjh/E55Gwo=;
 b=ejDPZlMOlhteKqQUDBwmcHkIQPevi7K5SegujbwZKazIqJroM+WhKV+TxZVNAe5MyGUI
 xn3gU+nXthUZZm9j2dMo+L+Iwbv6jjQVqbGhhIWr1a1kvRG0pJ6yVhzwI5T0FZYTc7gC
 J0ya8SKLW68OUlMDIiiTvCRR+NCb8T+Ap0f9i5AhlR4B0edE3HuqJTyFQhluZhDWIbQ/
 y1G/0E/TvC9EWv+CAPvR022u+v5kg+R2VXgDPVPYp/stY3RPMiV65varKXrEAH1o89Yc
 qLgd+g6sr9InXQGqo6hAWXxyxsA1akKZ1j6ZEX5Rjf1h1hBSj302SG50M1Wyad3b1+X5 MQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 382jds310u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Apr 2021 08:28:18 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13LC4i8p064064;
 Wed, 21 Apr 2021 08:28:17 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 382jds3109-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Apr 2021 08:28:17 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13LCRWug018718;
 Wed, 21 Apr 2021 12:28:17 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma03dal.us.ibm.com with ESMTP id 37yqaaj6r4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Apr 2021 12:28:16 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13LCSFNv41550406
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Apr 2021 12:28:15 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A71A26E052;
 Wed, 21 Apr 2021 12:28:15 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B7F506E050;
 Wed, 21 Apr 2021 12:28:14 +0000 (GMT)
Received: from farman-thinkpad-t470p (unknown [9.160.17.178])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 21 Apr 2021 12:28:14 +0000 (GMT)
Message-ID: <91f127d8a6bf15a87fa4f864f3a0d6a6a2e626c9.camel@linux.ibm.com>
Subject: Re: [RFC PATCH] vfio-ccw: Permit missing IRQs
From: Eric Farman <farman@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>
Date: Wed, 21 Apr 2021 08:28:13 -0400
In-Reply-To: <20210421120146.46572f86.cohuck@redhat.com>
References: <20210419184906.2847283-1-farman@linux.ibm.com>
 <20210421120146.46572f86.cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-14.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -eExdx1o9ONQR2hS4kjKHJGSROa8D8hS
X-Proofpoint-ORIG-GUID: a_vb6DO4TL8YNLbODzQABP8Pd-XKzPOS
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-21_04:2021-04-21,
 2021-04-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 suspectscore=0 phishscore=0 mlxlogscore=999
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104210094
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farman@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
 qemu-devel@nongnu.org, Matthew Rosato <mjrosato@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2021-04-21 at 12:01 +0200, Cornelia Huck wrote:
> On Mon, 19 Apr 2021 20:49:06 +0200
> Eric Farman <farman@linux.ibm.com> wrote:
> 
> > Commit 690e29b91102 ("vfio-ccw: Refactor ccw irq handler") changed
> > one of the checks for the IRQ notifier registration from saying
> > "the host needs to recognize the only IRQ that exists" to saying
> > "the host needs to recognize ANY IRQ that exists."
> > 
> > And this worked fine, because the subsequent change to support the
> > CRW IRQ notifier doesn't get into this code when running on an
> > older
> > kernel, thanks to a guard by a capability region. The later
> > addition
> > of the REQ(uest) IRQ by commit b2f96f9e4f5f ("vfio-ccw: Connect the
> > device request notifier") broke this assumption because there is no
> > matching capability region. Thus, running new QEMU on an older
> > kernel fails with:
> > 
> >   vfio: unexpected number of irqs 2
> > 
> > Let's simply remove the check (and the less-than-helpful message),
> > and make the VFIO_DEVICE_GET_IRQ_INFO ioctl request for the IRQ
> > being processed. If it returns with EINVAL, we can treat it as
> > an unfortunate mismatch but not a fatal error for the guest.
> > 
> > Fixes: 690e29b91102 ("vfio-ccw: Refactor ccw irq handler")
> > Fixes: b2f96f9e4f5f ("vfio-ccw: Connect the device request
> > notifier")
> > Signed-off-by: Eric Farman <farman@linux.ibm.com>
> > ---
> >  hw/vfio/ccw.c | 15 +++++++--------
> >  1 file changed, 7 insertions(+), 8 deletions(-)
> > 
> > diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
> > index b2df708e4b..cfbfc3d1a2 100644
> > --- a/hw/vfio/ccw.c
> > +++ b/hw/vfio/ccw.c
> > @@ -411,20 +411,19 @@ static void
> > vfio_ccw_register_irq_notifier(VFIOCCWDevice *vcdev,
> >          return;
> >      }
> >  
> > -    if (vdev->num_irqs < irq + 1) {
> > -        error_setg(errp, "vfio: unexpected number of irqs %u",
> > -                   vdev->num_irqs);
> 
> Alternative proposal: Change this message to
> 
> "vfio: IRQ %u not available (number of irqs %u)"

> and still fail this function, while treating a failure of
> vfio_ccw_register_irq_notifier(vcdev, VFIO_CCW_REQ_IRQ_INDEX, &err);
> in
> vfio_ccw_realize() as a non-fatal error (maybe log a message).

This all sounds fine to me. I'll send a v2 as such.

> 
> This allows us to skip doing an ioctl call, of which we already know
> that it would fail. 

True, though as this is at the configuration time it's not as critical.

> Still, we can catch cases where a broken kernel e.g.
> provides the crw region, but not the matching irq (I believe
> something
> like that should indeed be a fatal error.)

Well they shouldn't do THAT. :)

> 
> > -        return;
> > -    }
> > -
> >      argsz = sizeof(*irq_info);
> >      irq_info = g_malloc0(argsz);
> >      irq_info->index = irq;
> >      irq_info->argsz = argsz;
> >      if (ioctl(vdev->fd, VFIO_DEVICE_GET_IRQ_INFO,
> >                irq_info) < 0 || irq_info->count < 1) {
> > -        error_setg_errno(errp, errno, "vfio: Error getting irq
> > info");
> > -        goto out_free_info;
> > +        if (errno == EINVAL) {
> > +            warn_report("Unable to get information about IRQ %u",
> > irq);
> > +            goto out_free_info;
> > +        } else {
> > +            error_setg_errno(errp, errno, "vfio: Error getting irq
> > info");
> > +            goto out_free_info;
> > +        }
> >      }
> >  
> >      if (event_notifier_init(notifier, 0)) {


