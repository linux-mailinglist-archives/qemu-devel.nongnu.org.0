Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0889B35D087
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 20:44:51 +0200 (CEST)
Received: from localhost ([::1]:45678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lW1YH-0000t4-Ue
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 14:44:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lW1X8-0000Rx-Ur
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 14:43:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lW1X5-00064D-C1
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 14:43:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618253013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZxWStDED0kulfL3cd2SlIso6FjoeASEnnwzDMSpqduc=;
 b=fjiQ1wsj7qGDwZIkgz5KgkNiNTtOrPOrdqcXnfZNGlb8TvoA8qW6/tDl3usOMswToI8JIx
 4s/0CJCYw9rqRr5MK+nbJzLLPwfUm8sZY6qHE2d2+JUhyddhM7A6TMwojc1Gzrj2MHsWI0
 gVr7XodpRGvOzSrRwhYEdd+h/rEYGl4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-410-mx0cI8K0Osi29pMH2x3pQQ-1; Mon, 12 Apr 2021 14:43:30 -0400
X-MC-Unique: mx0cI8K0Osi29pMH2x3pQQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A78D0180FCA6;
 Mon, 12 Apr 2021 18:43:29 +0000 (UTC)
Received: from horse.redhat.com (ovpn-113-141.rdu2.redhat.com [10.10.113.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ADCF310023AF;
 Mon, 12 Apr 2021 18:43:16 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 3CD3722054F; Mon, 12 Apr 2021 14:43:16 -0400 (EDT)
Date: Mon, 12 Apr 2021 14:43:16 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Anton Kuchin <antonkuchin@yandex-team.ru>
Subject: Re: [Virtio-fs] [PATCH] vhost-user-fs: fix features handling
Message-ID: <20210412184316.GF1184147@redhat.com>
References: <20210408195534.647895-1-antonkuchin@yandex-team.ru>
 <20210409155657.GE1111800@redhat.com>
 <14f05a3d-7db6-2c01-7fe0-f83586ff1fd6@yandex-team.ru>
MIME-Version: 1.0
In-Reply-To: <14f05a3d-7db6-2c01-7fe0-f83586ff1fd6@yandex-team.ru>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Apr 11, 2021 at 09:21:54AM +0300, Anton Kuchin wrote:
> 
> On 09/04/2021 18:56, Vivek Goyal wrote:
> > On Thu, Apr 08, 2021 at 10:55:34PM +0300, Anton Kuchin wrote:
> > > Make virtio-fs take into account server capabilities.
> > > 
> > > Just returning requested features assumes they all of then are implemented
> > > by server and results in setting unsupported configuration if some of them
> > > are absent.
> > > 
> > > Signed-off-by: Anton Kuchin<antonkuchin@yandex-team.ru>
> > [CC stefan and qemu-devel.]
> > 
> > Can you give more details of what problem exactly you are facing. Or
> > this fix is about avoiding a future problem where device can refuse
> > to support a feature qemu is requesting for.
> 
> This fixes existing problem that qemu ignores features (un)supported by
> backend and this works fine only if backend features match features of qemu.
> Otherwise qemu incorrectly assumes that backend suports all of them and
> calls vhost_set_features() not taking into account result of previous
> vhost_get_features() call. This breaks protocol and can crash server or
> cause incorrect behavior.
> 
> This is why I hope it to be accepted in time for 6.0 release.
> 
> > IIUC, this patch is preparing a list of features vhost-user-fs device
> > can support. Then it calls vhost_get_features() which makes sure that
> > all these features are support by real vhost-user device (hdev->features).
> > If not, then corresponding feature is reset and remaining features
> > are returned to caller.
> When this callback is executed in virtio_bus_device_plugged() list of
> features that vhost-backend supports has been already obtained earlier by
> vhost_user_get_features() in vuf_device_realize() and stored in
> hdev->features.

> vuf_get_features() should return bitmask of features that
> are common for vhost backend (hdev->features) and frontend
> (vdev->host_features).

But that's not what exactly this patch seems to be doing.
IIUC, It only resets some of the features from list passed from
the caller. So whatever has been defined in user_feature_bits[],
and if these features are not supported by vhost-user backend, then
that feature will be reset before returning to caller.

So the question is what are those features which should be in
user_feature_bits[]? For example, by default libvhost-user
also supports.

        /* vhost-user feature bits */
        1ULL << VHOST_F_LOG_ALL |
        1ULL << VHOST_USER_F_PROTOCOL_FEATURES;

Should that be in user_feature_bits[] too. So that if a customer
vhost-user-fs backend does not support VHOST_F_LOG_ALL or
VHOST_USER_F_PROTOCOL_FEATURES, it is reset.

IIUC, your current patch is not going to reset these features if
caller passed you those in vuf_get_features(,requested_features).

So to me this becomes more of a question that what are those common
features which both the ends of vhost-user device should support for
it to work and should be checked in vuf_get_features(). 

Thanks
Vivek

> But instead it just returns host features.
> > This feature negotion bit is called in so many places that I am kind of
> > lost that who should be doing what. Will leave it to Stefan who
> > understands it much better.
> > 
> > 
> > > ---
> > >   hw/virtio/vhost-user-fs.c | 17 +++++++++++++----
> > >   1 file changed, 13 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
> > > index ac4fc34b36..6cf983ba0e 100644
> > > --- a/hw/virtio/vhost-user-fs.c
> > > +++ b/hw/virtio/vhost-user-fs.c
> > > @@ -24,6 +24,14 @@
> > >   #include "monitor/monitor.h"
> > >   #include "sysemu/sysemu.h"
> > > +static const int user_feature_bits[] = {
> > > +    VIRTIO_F_VERSION_1,
> > > +    VIRTIO_RING_F_INDIRECT_DESC,
> > > +    VIRTIO_RING_F_EVENT_IDX,
> > > +    VIRTIO_F_NOTIFY_ON_EMPTY,
> > > +    VHOST_INVALID_FEATURE_BIT
> > > +};
> > > +
> > >   static void vuf_get_config(VirtIODevice *vdev, uint8_t *config)
> > >   {
> > >       VHostUserFS *fs = VHOST_USER_FS(vdev);
> > > @@ -129,11 +137,12 @@ static void vuf_set_status(VirtIODevice *vdev, uint8_t status)
> > >   }
> > >   static uint64_t vuf_get_features(VirtIODevice *vdev,
> > > -                                      uint64_t requested_features,
> > > -                                      Error **errp)
> > > +                                 uint64_t features,
> > Will it make sense to keep the name requested_features. This kind of
> > makes it clear that caller is requesting these features.
> > 
> > I feel there should be few lines of comments also to make it clear
> > what this function is actually doing.
> 
> This fix was inspired by similar functions in hw/scsi/vhost-scsi-common.c,
> hw/virtio/vhost-user-vsock.c, hw/block/vhost-user-blk.c and
> hw/net/vhost_net.c and I borrowed naming from them just to be consistent.
> 
> IMO this looks like a good place for refactoring because we have more and
> more vhost-user devices that duplicate that code, but it can be done after
> the bug is fixed.
> 
> > Vivek
> > 
> > > +                                 Error **errp)
> > >   {
> > > -    /* No feature bits used yet */
> > > -    return requested_features;
> > > +    VHostUserFS *fs = VHOST_USER_FS(vdev);
> > > +
> > > +    return vhost_get_features(&fs->vhost_dev, user_feature_bits, features);
> > >   }
> > >   static void vuf_handle_output(VirtIODevice *vdev, VirtQueue *vq)
> > > -- 
> > > 2.25.1
> > > 
> > > 
> > > _______________________________________________
> > > Virtio-fs mailing list
> > > Virtio-fs@redhat.com
> > > https://listman.redhat.com/mailman/listinfo/virtio-fs
> 


