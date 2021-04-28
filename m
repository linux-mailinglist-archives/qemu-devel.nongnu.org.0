Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 039D236D7E4
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 15:03:14 +0200 (CEST)
Received: from localhost ([::1]:34108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbjqT-0006dW-29
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 09:03:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1lbjmW-0003vx-P5; Wed, 28 Apr 2021 08:59:08 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:33896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1lbjmU-00068W-R9; Wed, 28 Apr 2021 08:59:08 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13SCYDDG110237; Wed, 28 Apr 2021 08:59:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=2Rnsf1EsHmqxusWbfz5XFxXtnlgn7bgWXui47GNIQvo=;
 b=oDTJ9Q7fouLCrDsLlM8nkvvN1Dg5BpIAuGsTSPw2eaSKmRRfyKA2qR/+T0WFLvJ4ISlq
 EbGgdxkTWR4jwbBu9hDdlyqmtBOCXvtcieZCxIwNvWKUlpwDVWD/Z044S8fYVsPzAauM
 +ZYG9oSv7wVjB7FcP4gCo9JvhUbKcFQE4+SnpRX4f9gezlygPppW+Vbqy2TjGSDSBMla
 nr6y3IBMKBghSh1OqzqvhpYNGvNPsd6C0ywH3h7x/smO7EVpaBfMF0MPpPPNxynKpzEG
 4kYDDYxR5l3/OV8ncy6tcEeT1spQng2GbyvaknjDVj+dwC9HmoNH/D3miNb9xq2gIwEv /Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3877s08sap-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Apr 2021 08:59:05 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13SCYc0c113168;
 Wed, 28 Apr 2021 08:59:04 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3877s08sab-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Apr 2021 08:59:04 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13SCw8kl002105;
 Wed, 28 Apr 2021 12:59:04 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma03dal.us.ibm.com with ESMTP id 384ay9c5yd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Apr 2021 12:59:04 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13SCx3Bf40960392
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 28 Apr 2021 12:59:03 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3F1ECAE06A;
 Wed, 28 Apr 2021 12:59:03 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D2681AE05C;
 Wed, 28 Apr 2021 12:59:02 +0000 (GMT)
Received: from farman-thinkpad-t470p (unknown [9.160.111.105])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 28 Apr 2021 12:59:02 +0000 (GMT)
Message-ID: <73b453a9feaaf92d5d473e1b050972f73b28628f.camel@linux.ibm.com>
Subject: Re: [PATCH] vfio-ccw: Attempt to clean up all IRQs on error
From: Eric Farman <farman@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>
Date: Wed, 28 Apr 2021 08:59:02 -0400
In-Reply-To: <20210428123712.49f49156.cohuck@redhat.com>
References: <20210427142511.2125733-1-farman@linux.ibm.com>
 <20210428123712.49f49156.cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-14.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: rF1mvc_yFw2OhLgPnFQC0YPjp6Uk6rdp
X-Proofpoint-GUID: fnwIs3LbLTofwrxL1b8Tun5oB6jpWFhv
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-28_06:2021-04-27,
 2021-04-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 impostorscore=0
 suspectscore=0 adultscore=0 phishscore=0 clxscore=1015 mlxscore=0
 malwarescore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104280084
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
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Matthew Rosato <mjrosato@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2021-04-28 at 12:37 +0200, Cornelia Huck wrote:
> On Tue, 27 Apr 2021 16:25:11 +0200
> Eric Farman <farman@linux.ibm.com> wrote:
> 
> > The vfio_ccw_unrealize() routine makes an unconditional attempt to
> > unregister every IRQ notifier, though they may not have been
> > registered
> > in the first place (when running on an older kernel, for example).
> > 
> > Let's mirror this behavior in the error cleanups in
> > vfio_ccw_realize()
> > so that if/when new IRQs are added, it is less confusing to
> > recognize
> > the necessary procedures. The worst case scenario would be some
> > extra
> > messages about an undefined IRQ, but since this is an error exit
> > that
> > won't be the only thing to worry about.
> 
> I'm wondering whether we should downgrade the moan during unregister
> from error to warn; the code deals with it gracefully, and we're not
> losing any functionality.

Ha, I thought it already was a warning. I think that's a good idea, let
me spin a quick v2.

> 
> Patch looks good.

Thanks,
Eric

> 
> > Signed-off-by: Eric Farman <farman@linux.ibm.com>
> > ---
> >  hw/vfio/ccw.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
> > index 400bc07fe2..169438c3b8 100644
> > --- a/hw/vfio/ccw.c
> > +++ b/hw/vfio/ccw.c
> > @@ -690,7 +690,7 @@ static void vfio_ccw_realize(DeviceState *dev,
> > Error **errp)
> >      if (vcdev->crw_region) {
> >          vfio_ccw_register_irq_notifier(vcdev,
> > VFIO_CCW_CRW_IRQ_INDEX, &err);
> >          if (err) {
> > -            goto out_crw_notifier_err;
> > +            goto out_irq_notifier_err;
> >          }
> >      }
> >  
> > @@ -705,7 +705,9 @@ static void vfio_ccw_realize(DeviceState *dev,
> > Error **errp)
> >  
> >      return;
> >  
> > -out_crw_notifier_err:
> > +out_irq_notifier_err:
> > +    vfio_ccw_unregister_irq_notifier(vcdev,
> > VFIO_CCW_REQ_IRQ_INDEX);
> > +    vfio_ccw_unregister_irq_notifier(vcdev,
> > VFIO_CCW_CRW_IRQ_INDEX);
> >      vfio_ccw_unregister_irq_notifier(vcdev,
> > VFIO_CCW_IO_IRQ_INDEX);
> >  out_io_notifier_err:
> >      vfio_ccw_put_region(vcdev);


