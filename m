Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F32F9453499
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 15:48:43 +0100 (CET)
Received: from localhost ([::1]:40250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmzlK-0000pl-Rj
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 09:48:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1mmzhu-0005XI-Ht; Tue, 16 Nov 2021 09:45:11 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:38142)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1mmzhq-0006p2-Oo; Tue, 16 Nov 2021 09:45:10 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AGDnfTL031667; 
 Tue, 16 Nov 2021 14:45:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=25sySyEmHpgDYZUb/GCc50ugj4kzejImwpBzpJgTbkg=;
 b=Jvkp66YlMhNFF/gyBZXz2YfPuMVkz3FwgFWXdRq95kYZE5RdF1a8uJpcv8j7bZLczmej
 DHbCwZmUZp7jughd1MjevYuhWhU/U1Gj1t7ZoCZ9Rif+hkMIiRuvEdeOyTbL9fHU09oR
 Vc1TEuB9XKf2Ht1KO5ZB6ceG0oHvTvMToinLAUhJ5bzEaGEOIBbnS/7Wq9Bnj9qo6O0o
 dNRuCoiJd36Co9Y9T37OPnD0S8IRH/kebmzdQEdVPbrkYe/ttno6F6qH3U+h7SMY4A8o
 de4G/Ww+1kZnlSfIarEj+j1WSgRgT8qPzU02AnuswLcuN0ZaRz3vMmDRtqV9Hq6nuXVP hQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ccdv8hgg8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Nov 2021 14:45:02 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1AGEVvfA032696;
 Tue, 16 Nov 2021 14:45:01 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ccdv8hgd4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Nov 2021 14:45:01 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AGERMiV007782;
 Tue, 16 Nov 2021 14:44:56 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma02fra.de.ibm.com with ESMTP id 3ca509qqm4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Nov 2021 14:44:56 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1AGEir2J3342862
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Nov 2021 14:44:53 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6AB7E5204F;
 Tue, 16 Nov 2021 14:44:53 +0000 (GMT)
Received: from li-e979b1cc-23ba-11b2-a85c-dfd230f6cf82 (unknown [9.171.81.35])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id DFBD252057; 
 Tue, 16 Nov 2021 14:44:52 +0000 (GMT)
Date: Tue, 16 Nov 2021 15:44:37 +0100
From: Halil Pasic <pasic@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [RFC PATCH v2 1/5] virtio: introduce virtio_force_modern()
Message-ID: <20211116154437.1909b99c.pasic@linux.ibm.com>
In-Reply-To: <87v90tl5l3.fsf@redhat.com>
References: <20211112145749.618157-1-pasic@linux.ibm.com>
 <20211112145749.618157-2-pasic@linux.ibm.com>
 <877dddmllb.fsf@redhat.com>
 <20211115142605.44f452aa.pasic@linux.ibm.com>
 <87v90tl5l3.fsf@redhat.com>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 6YVItrtxLPaf1fPfIexmsxEv4XIFoPeF
X-Proofpoint-ORIG-GUID: q5py_E5SMp3NhQlbenHv5_oEfQOr6sC3
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-16_02,2021-11-16_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999
 spamscore=0 priorityscore=1501 malwarescore=0 mlxscore=0 suspectscore=0
 clxscore=1015 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111160072
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

On Mon, 15 Nov 2021 17:57:28 +0100
Cornelia Huck <cohuck@redhat.com> wrote:

> On Mon, Nov 15 2021, Halil Pasic <pasic@linux.ibm.com> wrote:
> 
> > On Fri, 12 Nov 2021 16:37:20 +0100
> > Cornelia Huck <cohuck@redhat.com> wrote:
> >  
> >> On Fri, Nov 12 2021, Halil Pasic <pasic@linux.ibm.com> wrote:
> >>   
> >> > Legacy vs modern should be detected via transport specific means. We
> >> > can't wait till feature negotiation is done. Let us introduce
> >> > virtio_force_modern() as a means for the transport code to signal
> >> > that the device should operate in modern mode (because a modern driver
> >> > was detected).
> >> >
> >> > A new callback is added for the situations where the device needs
> >> > to do more than just setting the VIRTIO_F_VERSION_1 feature bit. For
> >> > example, when vhost is involved, we may need to propagate the features
> >> > to the vhost device.
> >> >
> >> > Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
> >> > ---
> >> >
> >> > I'm still struggling with how to deal with vhost-user and co. The
> >> > problem is that I'm not very familiar with the life-cycle of, let us
> >> > say, a vhost_user device.
> >> >
> >> > Looks to me like the vhost part might be just an implementation detail,
> >> > and could even become a hot swappable thing.
> >> >
> >> > Another thing is, that vhost processes set_features differently. It
> >> > might or might not be a good idea to change this.
> >> >
> >> > Does anybody know why don't we propagate the features on features_set,
> >> > but under a set of different conditions, one of which is the vhost
> >> > device is started?
> >> > ---
> >> >  hw/virtio/virtio.c         | 13 +++++++++++++
> >> >  include/hw/virtio/virtio.h |  2 ++
> >> >  2 files changed, 15 insertions(+)
> >> >    
> >> 
> >> Did you see my feedback in
> >> https://lore.kernel.org/qemu-devel/87tugzc26y.fsf@redhat.com/? I think
> >> at least some of it still applies.
> >>   
> >
> > Sure. My idea was to send out a v2 first which helps us think about the
> > bigger picture, and then answer that mail. Now I realize I should have
> > sent the response first, and then the v2 immediately afterwards.
> >  
> >> > diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> >> > index 3a1f6c520c..26db1b31e6 100644
> >> > --- a/hw/virtio/virtio.c
> >> > +++ b/hw/virtio/virtio.c
> >> > @@ -3281,6 +3281,19 @@ void virtio_init(VirtIODevice *vdev, const char *name,
> >> >      vdev->use_guest_notifier_mask = true;
> >> >  }
> >> >  
> >> > +void  virtio_force_modern(VirtIODevice *vdev)    
> >> 
> >> I'd still prefer to call this virtio_indicate_modern: we don't really
> >> force anything; the driver has simply already decided that it will use
> >> the modern interface and we provide an early indication in the features
> >> so that code looking at them makes the right decisions.  
> >
> > I tried to explain my dislike for virtio_indicate_modern in my response
> > to that email. In somewhat different words: IMHO indication is about an
> > external observer and has a symbolic dimension to it. Please see
> > https://www.oxfordlearnersdictionaries.com/definition/english/indicate
> > This function is about changing the behavior of the device. Its
> > post-condition is: the device acts compliant to virtio 1.0 or higher.  
> 
> My personal preference is "indicate", I don't like "force". I don't want
> a semantics discussion; I'll leave the decision to the virtio
> maintainers.

I can't really follow your train of thought, but I'm OK with the outcome.

> 
> >  
> >>   
> >> > +{
> >> > +    VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
> >> > +
> >> > +    virtio_add_feature(&vdev->guest_features, VIRTIO_F_VERSION_1);
> >> > +    /* Let the device do it's normal thing. */
> >> > +    virtio_set_features(vdev, vdev->guest_features);    
> >> 
> >> I don't think this is substantially different from setting VERSION_1
> >> only: At least the callers you introduce call this during reset,
> >> i.e. when guest_features is 0 anyway.   
> >
> > I agree. Just wanted to be conservative, and preserve whatever is there.
> >
> >  
> >> We still have the whole processing
> >> that is done after feature setting that may have effects different from
> >> what the ultimate feature setting will give us.  
> >
> > Yes, this is an intermediate state. As I pointed out, intermediate states
> > are necessary.  
> 
> Why? We just want VERSION_1 so that the checks work, why do we need to
> fiddle with other settings? We only need to propagate it to e.g. vhost.
>

Intermediate states are necessary, because transports can not set
features as an atomic operation. That is, if both feature bits > 31 and
<= 31 need to be set, an intermediate state is necessary.

I think virtio_set_features() is what computer science calls a "mutator
method" (for reference see:
https://en.wikipedia.org/wiki/Mutator_method). Do we agree that
virtio_set_features() is a mutator?
 

Not using the mutator method is considered bad practice AFAIK. Just to
get this perfectly clear you want me to not use virtio_set_features()
here, right?

> >  
> >> While I don't think
> >> calling set_features twice is forbidden, that sequence is likely quite
> >> untested, and I'm not sure we can exclude side effects.  
> >
> > I can't disagree with that. But IMHO we can just say: such problems, if
> > any, are bugs that need to be fixed.  
> 
> Well, what about first fixing the endianness bugs, before we potentially
> open up a can of worms?

That can of worms is already open, because the driver can set features
several times. I'm not exactly clear on what exactly is your concern
here. So let us have a look at what virtio_set_features() does:

(1) Makes sure the device is in a state when features can be set
(!VIRTIO_CONFIG_S_FEATURES_OK)
(2) Does basic validation and filtering (accepts only features that are
indeed offered).
(3) Calls the callback of the device class ->set_features() if any.
(4) If VIRTIO_RING_F_EVENT_IDX does virtio_init_region_cache() for
relevant queues.
(5) Manages start_on_kick for legacy.

In my opinion points (1) and (2) are desirable and could help catching
bugs. Points (4) and (5) are irrelevant but conditional and obviously do
not hurt.

So I assume your problem is with the call to
VirtioDeviceClass.set_features(), right?


> 
> >
> > I think not doing the whole song-and-dance is conceptually more
> > problematic because it is more likely to lead to inconsistent internal
> > state. For example check out: vhost acked_features <-> guest_features.  
> 
> What is wrong with verifying with one single feature?
> 

I don't think verifying with one single features is wrong. I don't think
I ever said it is wrong. And I'm not sure what you mean by this.

What is in my opinion not nice, and arguably an encapsulation and
layering violation is tweaking the features without calling
VirtioDeviceClass.set_features(). In my opinion, a device implementation
can reasonably assume that the features didn't change if the
implementation provided a set_features() callback, and this callback was
not called. IMHO the callback is there, so that the device implementation
can notified about feature changes. Or do you disagree?

For something like vhost, when parts of the device don't live in the
qemu process and have no access to vdev->guest_features, this is very
reasonable: the QEMU external part will "cache" the relevant features,
but it ain't prohibited in the general case either.

What needs to be done and what may be done by the device on setting the
features isnot over-specified. In the sense of virtio 1.0 or higher the
changes have to take effect when feature negotiation is completed. That
is when FEATURES_OK is set. For pre 1.0 virtio, it is for me hard to
tell. I believe "feature negotiation completed" is tightly related to the
QEMU concept of "started", although we also have "DRIVER_OK" which also
plays a role.

The validation of the features also takes place when FEATURES_OK is set
and not before.

I really can't put my finger on what are you concerned about. In practice
guest_features goes from 0 to VIRTIO_F_VERSION_1. So even if the
->set_features callback were to do some funky feature enabling and
disabling, it would only enable the functionality it associates with
VIRTIO_F_VERSION_1 a.k.a. "modern", which is exactly what we want, and
disable nothing, because no bit went from 1 to 0. Right?

Yes, adding an unsolicited change to the feature set when transport
detects a modern driver that is trying to drive a modern device is
something unprecedented. But that is inherent. We want a transitional
device to behave according to "features == 0" (legacy) -> "features ==
VIRTIO_F_VERSION_1" (modern) -> "features negotiated and final" (modern
and features negotiated).

Michael, can you please help us with this dispute?

Regards,
Halil






