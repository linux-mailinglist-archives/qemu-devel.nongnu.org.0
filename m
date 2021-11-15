Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D3C450574
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 14:29:51 +0100 (CET)
Received: from localhost ([::1]:41252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmc3S-0002wJ-Eh
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 08:29:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1mmc07-00016E-53; Mon, 15 Nov 2021 08:26:23 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:35410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1mmc04-0001z2-IL; Mon, 15 Nov 2021 08:26:22 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AFBf978003450; 
 Mon, 15 Nov 2021 13:26:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=U+pkyvShVpDeMRNj5gek7Zms4IXoWtrESxITNn8jtNM=;
 b=b61AoOY8ZlDAxKKWw3LiskyeY7zCJXmEX6djjIHT6B5gZMfoaRpY1tLMuMbFn9TfVAx4
 lQXBA8W5BNZQkoM8BqPR7EkV0RC157m3bFaOcz+EZa/rgexnj1C8tKZqY/tzgx5gi8dw
 oI2afGWWyXCocVTtQSpj+fPEgntXw0KkIH/UTfAC9Psinc0v1JHoupbWm9ThadqGraOO
 BiZNNpJKA/We1emYqnihis0jhbIyttowFuB8K+g03cGVHFBSouW+0eNSmB1GCy1tsvEb
 LHwIYkVhkWmqUYdxuGcGN2dzziDKr0Hfxg8x6jkrPazvZJkydYua/6HNu3FnxiUG87RC lA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cbm00nue7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Nov 2021 13:26:15 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1AFDEOpP028726;
 Mon, 15 Nov 2021 13:26:15 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cbm00nudh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Nov 2021 13:26:15 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AFDD9wv010695;
 Mon, 15 Nov 2021 13:26:12 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3ca50anu54-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Nov 2021 13:26:12 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1AFDJGSV55837122
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Nov 2021 13:19:16 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6099AA4062;
 Mon, 15 Nov 2021 13:26:09 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D42CCA4067;
 Mon, 15 Nov 2021 13:26:08 +0000 (GMT)
Received: from li-e979b1cc-23ba-11b2-a85c-dfd230f6cf82 (unknown [9.171.68.86])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 15 Nov 2021 13:26:08 +0000 (GMT)
Date: Mon, 15 Nov 2021 14:26:05 +0100
From: Halil Pasic <pasic@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [RFC PATCH v2 1/5] virtio: introduce virtio_force_modern()
Message-ID: <20211115142605.44f452aa.pasic@linux.ibm.com>
In-Reply-To: <877dddmllb.fsf@redhat.com>
References: <20211112145749.618157-1-pasic@linux.ibm.com>
 <20211112145749.618157-2-pasic@linux.ibm.com>
 <877dddmllb.fsf@redhat.com>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 3X3ZCa4YTlYJmG5h-l1bJZiSw93YyNXh
X-Proofpoint-GUID: DlratAmTdn6HT9BNP9hQHIUqBQ3dMTuS
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-15_10,2021-11-15_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 mlxscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111150071
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pasic@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 12 Nov 2021 16:37:20 +0100
Cornelia Huck <cohuck@redhat.com> wrote:

> On Fri, Nov 12 2021, Halil Pasic <pasic@linux.ibm.com> wrote:
> 
> > Legacy vs modern should be detected via transport specific means. We
> > can't wait till feature negotiation is done. Let us introduce
> > virtio_force_modern() as a means for the transport code to signal
> > that the device should operate in modern mode (because a modern driver
> > was detected).
> >
> > A new callback is added for the situations where the device needs
> > to do more than just setting the VIRTIO_F_VERSION_1 feature bit. For
> > example, when vhost is involved, we may need to propagate the features
> > to the vhost device.
> >
> > Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
> > ---
> >
> > I'm still struggling with how to deal with vhost-user and co. The
> > problem is that I'm not very familiar with the life-cycle of, let us
> > say, a vhost_user device.
> >
> > Looks to me like the vhost part might be just an implementation detail,
> > and could even become a hot swappable thing.
> >
> > Another thing is, that vhost processes set_features differently. It
> > might or might not be a good idea to change this.
> >
> > Does anybody know why don't we propagate the features on features_set,
> > but under a set of different conditions, one of which is the vhost
> > device is started?
> > ---
> >  hw/virtio/virtio.c         | 13 +++++++++++++
> >  include/hw/virtio/virtio.h |  2 ++
> >  2 files changed, 15 insertions(+)
> >  
> 
> Did you see my feedback in
> https://lore.kernel.org/qemu-devel/87tugzc26y.fsf@redhat.com/? I think
> at least some of it still applies.
> 

Sure. My idea was to send out a v2 first which helps us think about the
bigger picture, and then answer that mail. Now I realize I should have
sent the response first, and then the v2 immediately afterwards.

> > diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> > index 3a1f6c520c..26db1b31e6 100644
> > --- a/hw/virtio/virtio.c
> > +++ b/hw/virtio/virtio.c
> > @@ -3281,6 +3281,19 @@ void virtio_init(VirtIODevice *vdev, const char *name,
> >      vdev->use_guest_notifier_mask = true;
> >  }
> >  
> > +void  virtio_force_modern(VirtIODevice *vdev)  
> 
> I'd still prefer to call this virtio_indicate_modern: we don't really
> force anything; the driver has simply already decided that it will use
> the modern interface and we provide an early indication in the features
> so that code looking at them makes the right decisions.

I tried to explain my dislike for virtio_indicate_modern in my response
to that email. In somewhat different words: IMHO indication is about an
external observer and has a symbolic dimension to it. Please see
https://www.oxfordlearnersdictionaries.com/definition/english/indicate
This function is about changing the behavior of the device. Its
post-condition is: the device acts compliant to virtio 1.0 or higher.

> 
> > +{
> > +    VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
> > +
> > +    virtio_add_feature(&vdev->guest_features, VIRTIO_F_VERSION_1);
> > +    /* Let the device do it's normal thing. */
> > +    virtio_set_features(vdev, vdev->guest_features);  
> 
> I don't think this is substantially different from setting VERSION_1
> only: At least the callers you introduce call this during reset,
> i.e. when guest_features is 0 anyway. 

I agree. Just wanted to be conservative, and preserve whatever is there.


> We still have the whole processing
> that is done after feature setting that may have effects different from
> what the ultimate feature setting will give us.

Yes, this is an intermediate state. As I pointed out, intermediate states
are necessary.

> While I don't think
> calling set_features twice is forbidden, that sequence is likely quite
> untested, and I'm not sure we can exclude side effects.

I can't disagree with that. But IMHO we can just say: such problems, if
any, are bugs that need to be fixed.

I think not doing the whole song-and-dance is conceptually more
problematic because it is more likely to lead to inconsistent internal
state. For example check out: vhost acked_features <-> guest_features.

Regards,
Halil

> 
> > +    /* For example for vhost-user we have to propagate to the vhost dev. */
> > +    if (k->force_modern) {
> > +        k->force_modern(vdev);
> > +    }
> > +}
> > +
> >  /*
> >   * Only devices that have already been around prior to defining the virtio
> >   * standard support legacy mode; this includes devices not specified in the  
> 
> 


