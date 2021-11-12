Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A00544EB7F
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 17:37:22 +0100 (CET)
Received: from localhost ([::1]:56876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlZYG-0004z4-Dv
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 11:37:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1mlZXC-0004FR-Ti; Fri, 12 Nov 2021 11:36:15 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:40856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1mlZXA-0001zx-Lg; Fri, 12 Nov 2021 11:36:14 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1ACFIH27023593; 
 Fri, 12 Nov 2021 16:36:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=ar0yboU3GBWPLR4lUAFxPrhf1ITg2SuqU91P6CQt/ak=;
 b=OmVV/I6kJ3+FdW3k2raqUl5d+iV9KhCSXPy63vojvQOgPZfRNQsqO45PNmFa6I8D7szE
 dnmoGssN0D5uUiwrOgSu0G1V1WAzWbJJwW8YR2Y7WRZizE0/WGLsEUaxe9N+ikS7ODVx
 cunk+I1vvGHEFGTDzwCdNaV05LdyYcqVJlzGlhm/bR0OBkkr9Uab5cBvmKNuVdOXC39L
 yo0xNxKuNSTscamAYDBBOvJqKgrZR9NcFb3WUBxd8efIHzlYF+WghGhd4Z9jgJmJQqmU
 Bbj4FzoYAZ+svE2RWG6FzYlg2mMaghYvBMDHQTncucQhPDmueREotdkxbd8ifwUNSj1M sA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c9tsw1r84-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Nov 2021 16:36:09 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1ACGNEU9008964;
 Fri, 12 Nov 2021 16:36:08 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c9tsw1r7c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Nov 2021 16:36:08 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1ACGTVkS001718;
 Fri, 12 Nov 2021 16:36:06 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03fra.de.ibm.com with ESMTP id 3c5hbb74bg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Nov 2021 16:36:06 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1ACGa3Gl56492324
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Nov 2021 16:36:03 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1B1EB42047;
 Fri, 12 Nov 2021 16:36:03 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9203842045;
 Fri, 12 Nov 2021 16:36:02 +0000 (GMT)
Received: from li-e979b1cc-23ba-11b2-a85c-dfd230f6cf82 (unknown [9.171.88.172])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 12 Nov 2021 16:36:02 +0000 (GMT)
Date: Fri, 12 Nov 2021 17:36:00 +0100
From: Halil Pasic <pasic@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [RFC PATCH v1 1/3] virtio: introduce virtio_force_modern()
Message-ID: <20211112173600.5280e5c5.pasic@linux.ibm.com>
In-Reply-To: <874k8hmkrl.fsf@redhat.com>
References: <20211028220017.930806-1-pasic@linux.ibm.com>
 <20211028220017.930806-2-pasic@linux.ibm.com>
 <87tugzc26y.fsf@redhat.com>
 <20211112164208.71a2ca73.pasic@linux.ibm.com>
 <874k8hmkrl.fsf@redhat.com>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: wNUtHJ4Zr0ICpMOH7V9_xSB8YFOVNh-3
X-Proofpoint-ORIG-GUID: upX7RLDG_g43O_SdqjVS327dqoOIXItG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-12_05,2021-11-12_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 mlxlogscore=999 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111120094
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

On Fri, 12 Nov 2021 16:55:10 +0100
Cornelia Huck <cohuck@redhat.com> wrote:

> On Fri, Nov 12 2021, Halil Pasic <pasic@linux.ibm.com> wrote:
> 
> > On Fri, 29 Oct 2021 16:53:25 +0200
> > Cornelia Huck <cohuck@redhat.com> wrote:
> >  
> >> On Fri, Oct 29 2021, Halil Pasic <pasic@linux.ibm.com> wrote:
> >>   
> >> > Legacy vs modern should be detected via transport specific means. We
> >> > can't wait till feature negotiation is done. Let us introduce
> >> > virtio_force_modern() as a means for the transport code to signal
> >> > that the device should operate in modern mode (because a modern driver
> >> > was detected).
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
> >> >  hw/virtio/virtio.c         | 12 ++++++++++++
> >> >  include/hw/virtio/virtio.h |  1 +
> >> >  2 files changed, 13 insertions(+)
> >> >
> >> > diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> >> > index 3a1f6c520c..75aee0e098 100644
> >> > --- a/hw/virtio/virtio.c
> >> > +++ b/hw/virtio/virtio.c
> >> > @@ -3281,6 +3281,18 @@ void virtio_init(VirtIODevice *vdev, const char *name,
> >> >      vdev->use_guest_notifier_mask = true;
> >> >  }
> >> >  
> >> > +void  virtio_force_modern(VirtIODevice *vdev)    
> >> 
> >> <bikeshed> I'm not sure I like that name. We're not actually forcing the
> >> device to be modern, we just set an early indication in the device
> >> before proper feature negotiation has finished. Maybe
> >> virtio_indicate_modern()? </bikeshed>  
> >
> >
> > I don't like virtio_indicate_modern(dev) form object orientation
> > perspective. In an OO language one would write it like
> > dev.virtio_indicate_modern()
> > which would read like the device should indicate modern to somebody.  
> 
> I think that is actually what happens: we indicate that it is a modern
> device to the code making the endianness decisions.
> 

But in an OO school of thought that code belongs to the given
virtio device object and is one of the building blocks that makes the
object what it is. What I'm trying to explain is: that code ain't no
external entity we have to indicate something to.

On the contrary, if we had to indicate 'modern' to the driver, how would
you name that function? Clearly we don't need such functionality, I'm
just trying to make an argument here.

To take a different example, imagine a ccw channel path. We may break the
the channel path, we may indicate to the OS that the channel path is
broken (via CRW), and we may do first break than indicate.


> >
> > In my opinion what happens is that we want to disable the legacy
> > interface if it is exposed by the device, or in other words instruct the
> > device that should act (precisely and exclusively) according to the
> > interface specification of the modern interface.  
> 
> I don't see us disabling anything; the driver has already chosen what
> they want, and we simply need to make sure that all code honours that
> decision.

IMHO a buggy driver could make an attempt at using the legacy interface
at least in case of pci.

My understanding is that the decision of the driver results in an
interaction between the driver and the device, and as a result of that
interaction, the state of the device changes. This function is supposed
to implement that state-change. 

Do we agree that there is a state change? If yes, how would you describe
that state change?

> 
> >
> > Maybe we can find a better name than force_modern, but I don't think
> > indicate_modern is a better name.
> >  
> >>   
> >> > +{
> >> > +    /*
> >> > +     * This takes care of the devices that implement config space access
> >> > +     * in QEMU. For vhost-user and similar we need to make sure the features
> >> > +     * are actually propagated to the device implementing the config space.
> >> > +     *
> >> > +     * A VirtioDeviceClass callback may be a good idea.
> >> > +     */
> >> > +    virtio_set_features(vdev, (1ULL << VIRTIO_F_VERSION_1));    
> >> 
> >> Do we really need/want to do the whole song-and-dance for setting
> >> features, just for setting VERSION_1?   
> >
> > When doing the whole song-and-dance the chance is higher that the
> > information will propagate to every place it needs to reach. For
> > example to the acked_features of vhost_dev. I've just posted a v2 RFC.
> > It should not be hard to see what I mean after examining that RFC.
> >  
> >> Devices may modify some of their
> >> behaviour or features, depending on what features they are called with,  
> >
> > I believe, if this is the case, we want the behavior that corresponds to
> > VERSION_1 set, i.e. 'modern'. So in my understanding this is rather good
> > than bad.
> >  
> >> and we will be calling this one again later with what is likely a
> >> different feature set.   
> >
> > That is true, but the driver is allowed to set the features multiple
> > times, and since transports only support piecemeal access to the
> > features (32 bits at a time), I guess this is biz as usual.  
> 
> Also see my comment in the v2: I'm not sure how well tested that
> actually is.
> 

Will answer there.

> >  
> >>Also, the return code is not checked.
> >>   
> >
> > That is true! It might be a good idea to log an error. Unfortunately I
> > don't think there is anything else we can sanely do.
> >  
> >> Maybe introduce a new function that sets guest_features directly and
> >> errors out if the features are not set in host_features?   
> >
> > See above.
> >  
> >> If we try to
> >> set VERSION_1 here despite the device not offering it, we are in a
> >> pickle anyway, as we should not have gotten here if we did not offer it,
> >> and we really should moan and fail in that case.  
> >
> > I agree about the moan part. I'm not sure what is the best way to
> > 'fail'. Maybe we should continue this discussion in the v2 thread.  
> 
> Yeah, let's continue there, since that code is a bit different.
> 

Nod!

Thanks!
Halil

