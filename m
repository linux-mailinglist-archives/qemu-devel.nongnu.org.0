Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A7C425726
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 17:54:12 +0200 (CEST)
Received: from localhost ([::1]:42536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYVik-0005cb-Do
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 11:54:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1mYVhb-0004wy-FM
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 11:52:59 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:8770
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1mYVhZ-0007Hb-CW
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 11:52:59 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 197FWBfs020742; 
 Thu, 7 Oct 2021 11:52:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=D4gV/cC9u4yVs9N6u2ui7oN9824y/ReTFv9fZNb/ET4=;
 b=pCKUlxxt4fQw694868BYBMTJN0MxsUU0Ek969JgW3kUnr/hN/GljnD0diFMHhF4aYbtO
 fgTKBhmXkjYXWQsSKnSOqidGS0alsRocvafZhvTVCrFUGa/xURrYOeyO/yPzBIFz3T4I
 elMSHRraK9dHM7PFBBGxn9hA3oMP6JaJtdKf+tqAJBleifo4kiPSeo5HuBO6nfpGFa+x
 woKEFAV/+Zj05JvtHtt5pYULg5s5fY6VbUStTk1dw2RKXw7hVsvKAX9BcAdXpKIH9jDd
 yfCHfWN2caEhIwVtFisp5JSxtiPRra9KQcR6Wgu90SJVo2U/HV5Lty7UXxpf/kk5Olph zA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3bj2rdj7bm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Oct 2021 11:52:53 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 197EXFYT022754;
 Thu, 7 Oct 2021 11:52:52 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3bj2rdj7b0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Oct 2021 11:52:52 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 197Fm1ns002779;
 Thu, 7 Oct 2021 15:52:50 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04ams.nl.ibm.com with ESMTP id 3bef2bhyb7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Oct 2021 15:52:50 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 197FqjMF44433836
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 7 Oct 2021 15:52:45 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B6A7EA405B;
 Thu,  7 Oct 2021 15:52:45 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D7ADEA406A;
 Thu,  7 Oct 2021 15:52:44 +0000 (GMT)
Received: from li-e979b1cc-23ba-11b2-a85c-dfd230f6cf82 (unknown [9.171.45.119])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu,  7 Oct 2021 15:52:44 +0000 (GMT)
Date: Thu, 7 Oct 2021 17:52:42 +0200
From: Halil Pasic <pasic@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH 1/1] virtio: write back F_VERSION_1 before validate
Message-ID: <20211007175242.4b0155b8.pasic@linux.ibm.com>
In-Reply-To: <8735pczwjj.fsf@redhat.com>
References: <20211006142533.2735019-1-pasic@linux.ibm.com>
 <875yu9yruv.fsf@redhat.com>
 <20211007163255.61d95513.pasic@linux.ibm.com>
 <8735pczwjj.fsf@redhat.com>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 8qM-a0uJ38LmRa_8qRQ5tnNtExH-AgEu
X-Proofpoint-GUID: mZZoBXl8LjQNHDs4rEn3GtR4FOFRoEZK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-07_02,2021-10-07_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0
 adultscore=0 mlxlogscore=999 suspectscore=0 lowpriorityscore=0 mlxscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110070101
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pasic@linux.ibm.com;
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
Cc: linux-s390@vger.kernel.org, markver@us.ibm.com,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, linux-kernel@vger.kernel.org,
 Halil Pasic <pasic@linux.ibm.com>, Xie Yongji <xieyongji@bytedance.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>, stefanha@redhat.com,
 virtualization@lists.linux-foundation.org,
 Christian Borntraeger <borntraeger@de.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 07 Oct 2021 17:25:52 +0200
Cornelia Huck <cohuck@redhat.com> wrote:

> On Thu, Oct 07 2021, Halil Pasic <pasic@linux.ibm.com> wrote:
> 
> > On Thu, 07 Oct 2021 13:52:24 +0200
> > Cornelia Huck <cohuck@redhat.com> wrote:
> >  
> >> On Wed, Oct 06 2021, Halil Pasic <pasic@linux.ibm.com> wrote:
> >>   
> >> > The virtio specification virtio-v1.1-cs01 states: "Transitional devices
> >> > MUST detect Legacy drivers by detecting that VIRTIO_F_VERSION_1 has not
> >> > been acknowledged by the driver."  This is exactly what QEMU as of 6.1
> >> > has done relying solely on VIRTIO_F_VERSION_1 for detecting that.
> >> >
> >> > However, the specification also says: "... driver MAY read (but MUST NOT
> >> > write) the device-specific configuration fields to check that it can
> >> > support the device ..." before setting FEATURES_OK.    
> >> 
> >> Suggest to put the citations from the spec into quotes, so that they are
> >> distinguishable from the rest of the text.  
> >
> > For the record: I basically took Michael's description, the one which you
> > said you prefer, with some minor changes.  
> 
> Well I did look at what the text said, not the details in the formatting...
> 
> >
> > This is one of the changes, which renders this a paraphrase and not a
> > quote. Michael didn't use quotation marks so I was not sure it is was
> > a word by word quote anyway. It was. But the spec depends on "During this
> > step" which does not make any sense without the context. That is why I made
> > the end of step explicit.  
> 
> I still think that would be nicer while using some quotation marks, even
> if you are just doing a partial quote.
> 
> In the first paragraph, however, we really should mark the quote
> properly. It gave me a stop when I first read it.

I've added in some quotation marks and ellipsis marks. Does that look
good for you?

> 
> >
> > I think we are fine without quotation marks. Those who care can read the
> > spec.
> >  
> >>   
> >> >
> >> > In that case, any transitional device relying solely on
> >> > VIRTIO_F_VERSION_1 for detecting legacy drivers will return data in
> >> > legacy format.  In particular, this implies that it is in big endian
> >> > format for big endian guests. This naturally confuses the driver which
> >> > expects little endian in the modern mode.
> >> >
> >> > It is probably a good idea to amend the spec to clarify that
> >> > VIRTIO_F_VERSION_1 can only be relied on after the feature negotiation
> >> > is complete. However, we already have regression so let's try to address    
> >> 
> >> s/regression/a regression/
> >>   
> >
> > Yes. Was like this in the original. Will change
> >  
> >> > it.    
> >> 
> >> Maybe mention what the regression is?  
> >
> > How about the following?
> >
> > The regressions affect the VIRTIO_NET_F_MTU feature of virtio-net and the
> > VIRTIO_BLK_F_BLK_SIZE feature of virtio-blk for BE guests when virtio
> > 1.0 is used on both sides. The latter renders virtio-blk unusable with
> > DASD backing, because things simply don't work with the default.  
> 
> Sounds good to me.

Will add it to the end.

> 
> >  
> >> 
> >> Also mention that we use this workaround for modern on BE only?  
> >
> > We have that already, don't we. The sentence that starts with "In
> > particular". The regression description should reinforce that
> > sufficiently IMHO.  
> 
> No strong opinion here. Anyone else?
> 
> >  
> >>   
> >> >
> >> > Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
> >> > Fixes: 82e89ea077b9 ("virtio-blk: Add validation for block size in config space")
> >> > Fixes: fe36cbe0671e ("virtio_net: clear MTU when out of range")
> >> > Reported-by: markver@us.ibm.com
> >> > ---
> >> >  drivers/virtio/virtio.c | 10 ++++++++++
> >> >  1 file changed, 10 insertions(+)
> >> >
> >> > diff --git a/drivers/virtio/virtio.c b/drivers/virtio/virtio.c
> >> > index 0a5b54034d4b..494cfecd3376 100644
> >> > --- a/drivers/virtio/virtio.c
> >> > +++ b/drivers/virtio/virtio.c
> >> > @@ -239,6 +239,16 @@ static int virtio_dev_probe(struct device *_d)
> >> >  		driver_features_legacy = driver_features;
> >> >  	}
> >> >  
> >> > +	/*
> >> > +	 * Some devices detect legacy solely via F_VERSION_1. Write
> >> > +	 * F_VERSION_1 to force LE for these when needed.    
> >> 
> >> "...to force LE config space accesses before FEATURES_OK for these when
> >> needed (BE)."
> >> 
> >> ?  
> >
> > Can do, but I would rather omit the (BE) at the end. All the conditions
> > are necessary:
> > * have validate callback
> > * device offered VERSION_1
> > * virtio legacy is be
> >  
> 
> Ok, let's use that without the trailing BE.
>

Nod.
 
> >>   
> >> > +	 */
> >> > +	if (drv->validate && !virtio_legacy_is_little_endian()
> >> > +			  && BIT_ULL(VIRTIO_F_VERSION_1) & device_features) {    
> >> 
> >> Nit: putting device_features first would read more naturally to me.
> >>   
> >
> > Can do.
> >  
> >> > +		dev->features = BIT_ULL(VIRTIO_F_VERSION_1);
> >> > +		dev->config->finalize_features(dev);
> >> > +	}
> >> > +
> >> >  	if (device_features & (1ULL << VIRTIO_F_VERSION_1))
> >> >  		dev->features = driver_features & device_features;
> >> >  	else    
> >> 
> >> Patch LGTM.
> >> 
> >>   
> >
> > Thanks for having a look. If you are fine with the proposed solution
> > please tell me, so I can send out a v2.  
> 
> No further comments other than what I wrote above, but maybe others have
> comments as well?
> 
> 

I will wait then till end of day before sending out a v2.

Thank you very much!

Regards,
Halil

