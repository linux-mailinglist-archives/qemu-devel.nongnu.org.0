Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE286393322
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 18:03:14 +0200 (CEST)
Received: from localhost ([::1]:49852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmITZ-0001gz-KQ
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 12:03:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lmIQE-0007Wg-Mk
 for qemu-devel@nongnu.org; Thu, 27 May 2021 11:59:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lmIQC-00077r-Cf
 for qemu-devel@nongnu.org; Thu, 27 May 2021 11:59:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622131182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iq3/KZ7IAu4fYVHKvJToAIdCbMM1tPOI/jWQKHAJwoo=;
 b=FMty2HbmJ0gTwrCrUbZVjqB3boJNAT/Vif1cH9REQvMDlAUdcCCU2A75yc1tzfgF7ZqnVR
 wrknI7XfdedFRrA/sGv48WIBRHQzGTapc6k3OTHcRmjMtjxI38TY0nV9QDu+S1RpH6nzDp
 fjYlQKcygCCb5ZGR2+Ed2FBDhmA20oc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-533-cPcNCpf8OriUYUslO_mqQw-1; Thu, 27 May 2021 11:59:40 -0400
X-MC-Unique: cPcNCpf8OriUYUslO_mqQw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E8CAE801106;
 Thu, 27 May 2021 15:59:39 +0000 (UTC)
Received: from work-vm (ovpn-114-249.ams2.redhat.com [10.36.114.249])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B9BE25B689;
 Thu, 27 May 2021 15:59:32 +0000 (UTC)
Date: Thu, 27 May 2021 16:59:29 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v3 03/26] DAX: vhost-user: Rework slave return values
Message-ID: <YK/B4TX7L/NHfNCQ@work-vm>
References: <20210428110100.27757-1-dgilbert@redhat.com>
 <20210428110100.27757-4-dgilbert@redhat.com>
 <YJFm+hocgArYnWAB@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <YJFm+hocgArYnWAB@stefanha-x1.localdomain>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org, vgoyal@redhat.com,
 groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Stefan Hajnoczi (stefanha@redhat.com) wrote:
> On Wed, Apr 28, 2021 at 12:00:37PM +0100, Dr. David Alan Gilbert (git) wrote:
> > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> > 
> > All the current slave handlers on the qemu side generate an 'int'
> > return value that's squashed down to a bool (!!ret) and stuffed into
> > a uint64_t (field of a union) to be returned.
> > 
> > Move the uint64_t type back up through the individual handlers so
> > that we can make one actually return a full uint64_t.
> > 
> > Note that the definition in the interop spec says most of these
> > cases are defined as returning 0 on success and non-0 for failure,
> > so it's OK to change from a bool to another non-0.
> > 
> > Vivek:
> > This is needed because upcoming patches in series will add new functions
> > which want to return full error code. Existing functions continue to
> > return true/false so, it should not lead to change of behavior for
> > existing users.
> > 
> > Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > Reviewed-by: Greg Kurz <groug@kaod.org>
> > ---
> >  hw/virtio/vhost-backend.c         |  6 +++---
> >  hw/virtio/vhost-user.c            | 31 ++++++++++++++++---------------
> >  include/hw/virtio/vhost-backend.h |  2 +-
> >  3 files changed, 20 insertions(+), 19 deletions(-)
> > 
> > diff --git a/hw/virtio/vhost-backend.c b/hw/virtio/vhost-backend.c
> > index 31b33bde37..1686c94767 100644
> > --- a/hw/virtio/vhost-backend.c
> > +++ b/hw/virtio/vhost-backend.c
> > @@ -401,8 +401,8 @@ int vhost_backend_invalidate_device_iotlb(struct vhost_dev *dev,
> >      return -ENODEV;
> >  }
> >  
> > -int vhost_backend_handle_iotlb_msg(struct vhost_dev *dev,
> > -                                          struct vhost_iotlb_msg *imsg)
> > +uint64_t vhost_backend_handle_iotlb_msg(struct vhost_dev *dev,
> > +                                        struct vhost_iotlb_msg *imsg)
> >  {
> >      int ret = 0;
> 
> This patch is messy. We want uint64_t but these functions use int ret
> internally. The actual return values are true/false instead of int 0 and
> 1.

Yeh.

> Please use uint64_t everywhere: return 0 for success and 1 for failure
> instead of bool literals and change the type of the local ret variables
> to uint64_t.


OK, reworked, this part of it now looks like :

int vhost_backend_handle_iotlb_msg(struct vhost_dev *dev,
-                                          struct vhost_iotlb_msg *imsg)
+uint64_t vhost_backend_handle_iotlb_msg(struct vhost_dev *dev,
+                                        struct vhost_iotlb_msg *imsg)
 {
-    int ret = 0;
+    uint64_t ret = 0;
 
     if (unlikely(!dev->vdev)) {
         error_report("Unexpected IOTLB message when virtio device is stopped");
-        return -EINVAL;
+        return EINVAL;
     }
 
     switch (imsg->type) {
     case VHOST_IOTLB_MISS:
-        ret = vhost_device_iotlb_miss(dev, imsg->iova,
-                                      imsg->perm != VHOST_ACCESS_RO);
+        ret = -vhost_device_iotlb_miss(dev, imsg->iova,
+                                       imsg->perm != VHOST_ACCESS_RO);
         break;
     case VHOST_IOTLB_ACCESS_FAIL:
         /* FIXME: report device iotlb error */
         error_report("Access failure IOTLB message type not supported");
-        ret = -ENOTSUP;
+        ret = ENOTSUP;
         break;
     case VHOST_IOTLB_UPDATE:
     case VHOST_IOTLB_INVALIDATE:
     default:
         error_report("Unexpected IOTLB message type");
-        ret = -EINVAL;
+        ret = EINVAL;
         break;
     }


-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


