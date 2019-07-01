Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A7B42118
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jun 2019 11:39:41 +0200 (CEST)
Received: from localhost ([::1]:58114 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hazjI-0003fv-VQ
	for lists+qemu-devel@lfdr.de; Wed, 12 Jun 2019 05:39:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43159)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <cohuck@redhat.com>) id 1hazi5-00038A-BV
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 05:38:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1hazi4-00078m-9l
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 05:38:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46506)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>)
 id 1hazi4-000789-1a; Wed, 12 Jun 2019 05:38:24 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 18777883D7;
 Wed, 12 Jun 2019 09:38:19 +0000 (UTC)
Received: from gondolin (ovpn-116-169.ams2.redhat.com [10.36.116.169])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 940695D9C9;
 Wed, 12 Jun 2019 09:38:13 +0000 (UTC)
Date: Wed, 12 Jun 2019 11:38:08 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Farhan Ali <alifm@linux.ibm.com>
Message-ID: <20190612113808.06fec7d7.cohuck@redhat.com>
In-Reply-To: <e07bf42d-2b8a-382c-85c8-520985ddfe8a@linux.ibm.com>
References: <20190607145353.2052-1-cohuck@redhat.com>
 <e07bf42d-2b8a-382c-85c8-520985ddfe8a@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Wed, 12 Jun 2019 09:38:23 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v5] vfio-ccw: support async command
 subregion
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
Cc: Halil Pasic <pasic@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 qemu-s390x@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 11 Jun 2019 15:33:59 -0400
Farhan Ali <alifm@linux.ibm.com> wrote:

> On 06/07/2019 10:53 AM, Cornelia Huck wrote:
> > A vfio-ccw device may provide an async command subregion for
> > issuing halt/clear subchannel requests. If it is present, use
> > it for sending halt/clear request to the device; if not, fall
> > back to emulation (as done today).
> > 
> > Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> > ---
> > 
> > v4->v5:
> > - It seems we need to take the indirection via the class for the
> >    callbacks after all :(
> > - Dropped Eric's R-b: for that reason
> > 
> > ---
> >   hw/s390x/css.c              |  27 +++++++--
> >   hw/s390x/s390-ccw.c         |  20 +++++++
> >   hw/vfio/ccw.c               | 112 +++++++++++++++++++++++++++++++++++-
> >   include/hw/s390x/css.h      |   3 +
> >   include/hw/s390x/s390-ccw.h |   2 +
> >   5 files changed, 158 insertions(+), 6 deletions(-)
> > 

> > @@ -309,11 +400,26 @@ static void vfio_ccw_get_region(VFIOCCWDevice *vcdev, Error **errp)
> >       vcdev->io_region_offset = info->offset;
> >       vcdev->io_region = g_malloc0(info->size);
> >   
> > +    /* check for the optional async command region */
> > +    ret = vfio_get_dev_region_info(vdev, VFIO_REGION_TYPE_CCW,
> > +                                   VFIO_REGION_SUBTYPE_CCW_ASYNC_CMD, &info);
> > +    if (!ret) {
> > +        vcdev->async_cmd_region_size = info->size;
> > +        if (sizeof(*vcdev->async_cmd_region) != vcdev->async_cmd_region_size) {
> > +            error_setg(errp, "vfio: Unexpected size of the async cmd region");
> > +            g_free(info);
> > +            return;
> > +        }
> > +        vcdev->async_cmd_region_offset = info->offset;
> > +        vcdev->async_cmd_region = g_malloc0(info->size);
> > +    }
> > +
> >       g_free(info);
> >   }
> >   
> >   static void vfio_ccw_put_region(VFIOCCWDevice *vcdev)
> >   {
> > +    g_free(vcdev->async_cmd_region);
> >       g_free(vcdev->io_region);
> >   }  
> 
> I think we can have a memory leak given how the code is currently 
> structured and how we call vfio_ccw_get_region.
> 
> vfio_ccw_get_region is called in vfio_ccw_realize. So if we return an 
> error from vfio_ccw_get_region, we would jump to out_region_err in 
> vfio_ccw_realize which would call vfio_ccw_put_device.
> 
> Now we can also return an error from vfio_ccw_get_region for the async 
> region, and so we might never end up freeing the io_region for which we 
> allocated memory successfully.
> 
> I think we would also need to change vfio_ccw_realize, no?

Indeed, you're right. I have the following change on top:

diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
index c9d1c76b4d04..d21ac24f743c 100644
--- a/hw/vfio/ccw.c
+++ b/hw/vfio/ccw.c
@@ -407,6 +407,7 @@ static void vfio_ccw_get_region(VFIOCCWDevice *vcdev, Error **errp)
         vcdev->async_cmd_region_size = info->size;
         if (sizeof(*vcdev->async_cmd_region) != vcdev->async_cmd_region_size) {
             error_setg(errp, "vfio: Unexpected size of the async cmd region");
+            g_free(vcdev->io_region);
             g_free(info);
             return;
         }

Anything else before I respin?

