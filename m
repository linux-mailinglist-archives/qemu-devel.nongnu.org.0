Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 870861EE6AD
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Jun 2020 16:31:13 +0200 (CEST)
Received: from localhost ([::1]:42356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jgqtj-0000GQ-LP
	for lists+qemu-devel@lfdr.de; Thu, 04 Jun 2020 10:31:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1jgqsa-00086p-Ny
 for qemu-devel@nongnu.org; Thu, 04 Jun 2020 10:30:00 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:53208
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1jgqsZ-0000RC-7E
 for qemu-devel@nongnu.org; Thu, 04 Jun 2020 10:30:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591280997;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lwbKncISewrjC8jqQyo6/MXAtSyC/GQgY85CDksiWDA=;
 b=ghoIjUNmEBUX1dzzalkj0ym/ivWu8OBnJy+sGu0AZoLB22GmVIkH5QQLwROL5Sn0tueU1i
 1wyG7bVO8WrOTvG3hQOt6hrhZ7P60yh5J4wUAsY7ebJqs4l6WxkMV5uNF9o/Z8eFftD8RW
 It6sD26atWD5fzAqjuZoHkoXKHWQH0s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-305-ljeiyhdfMJW4aXpturl9ew-1; Thu, 04 Jun 2020 10:29:56 -0400
X-MC-Unique: ljeiyhdfMJW4aXpturl9ew-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 00DE2100CD0F;
 Thu,  4 Jun 2020 14:29:55 +0000 (UTC)
Received: from work-vm (ovpn-114-247.ams2.redhat.com [10.36.114.247])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1526B5D9CD;
 Thu,  4 Jun 2020 14:29:44 +0000 (UTC)
Date: Thu, 4 Jun 2020 15:29:42 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [RFC PATCH] hw/virtio/vhost: re-factor vhost-section and allow
 DIRTY_MEMORY_CODE
Message-ID: <20200604142942.GH2851@work-vm>
References: <20200604111323.7458-1-alex.bennee@linaro.org>
 <20200604132635.GG2851@work-vm> <875zc753pf.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <875zc753pf.fsf@linaro.org>
User-Agent: Mutt/1.13.4 (2020-02-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/04 01:31:23
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, T_HK_NAME_DR=0.01, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Alex Bennée (alex.bennee@linaro.org) wrote:
> 
> Dr. David Alan Gilbert <dgilbert@redhat.com> writes:
> 
> > * Alex BennÃ©e (alex.bennee@linaro.org) wrote:
> >> The purpose of vhost_section is to identify RAM regions that need to
> >> be made available to a vhost client. However when running under TCG
> >> all RAM sections have DIRTY_MEMORY_CODE set which leads to problems
> >> down the line. The original comment implies VGA regions are a problem
> >> but doesn't explain why vhost has a problem with it.
> >> 
> >> Re-factor the code so:
> >> 
> >>   - steps are clearer to follow
> >>   - reason for rejection is recorded in the trace point
> >>   - we allow DIRTY_MEMORY_CODE when TCG is enabled
> >
> > The problem with VGA is that a VGA page can become mapped and unmapped
> > under the control of the guest; somewhere in a low address.  This tends
> > to break hugepage mappings.
> > For vhost-user, and in particular vhost-user-postcopy this means it
> > fails the mapping on the vhost-user client.
> >
> > However the other problem is that with vhost-user, the vhost-user client
> > is changing memory; and won't mark the pages as dirty - except for
> > migration (I'm not clear if vhost kernel does this).
> 
> For virtio this shouldn't be a problem because whatever the vhost-user
> client writes to should never be read by the guest until it gets kicked
> by the client to signal the virtqueue is done.
> 
> I guess migration is a fairly moot point given I haven't seen anything
> outside of a test declare VHOST_F_LOG_ALL support.
> 
> > So TCG won't notice a page that's been changed by the driver; now in
> > most cases it's rare for a device to be writing directly into a page
> > you're going to execute out of, but it's not unknown.
> 
> Not unknown outside of bugs?

I can think of sane reasons, I just don't know if they normally happen.
For example, it would make sense to me for a boot loader or simple OS to
tell a virtio-blk device to write directly into an area of RAM and then
for the OS to jump into it as soon as it gets notified that the device
completes.
I'm assuming incoming data under Linux gets copied around before use
so that incoming data never gets immediately executed.

> So stage 2 of this exercise is limiting the amount of exposed RAM to the
> client to just the virtqueues themselves (which is all vhost-user-rpmb
> should need).
> 
> > So, as it is, any area that's expecting to get non-migration dirty
> > notifications is going to be disappointed by a vhost-user backend.
> 
> It's not outside the realms of possibility that we could implement
> feedback to the softmmu/migration information from a vhost-user client
> but for now I think it's safe to assume we are eliding over the issue.

Dave

> 
> >
> > Dave
> >
> >> Signed-off-by: Alex BennÃ©e <alex.bennee@linaro.org>
> >> Cc: Michael S. Tsirkin <mst@redhat.com>
> >> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> >> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> >> ---
> >>  hw/virtio/vhost.c | 46 ++++++++++++++++++++++++++++++++--------------
> >>  1 file changed, 32 insertions(+), 14 deletions(-)
> >> 
> >> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> >> index aff98a0ede5..f81fc87e74c 100644
> >> --- a/hw/virtio/vhost.c
> >> +++ b/hw/virtio/vhost.c
> >> @@ -27,6 +27,7 @@
> >>  #include "migration/blocker.h"
> >>  #include "migration/qemu-file-types.h"
> >>  #include "sysemu/dma.h"
> >> +#include "sysemu/tcg.h"
> >>  #include "trace.h"
> >>  
> >>  /* enabled until disconnected backend stabilizes */
> >> @@ -403,26 +404,43 @@ static int vhost_verify_ring_mappings(struct vhost_dev *dev,
> >>      return r;
> >>  }
> >>  
> >> +/*
> >> + * vhost_section: identify sections needed for vhost access
> >> + *
> >> + * We only care about RAM sections here (where virtqueue can live). If
> >> + * we find one we still allow the backend to potentially filter it out
> >> + * of our list.
> >> + */
> >>  static bool vhost_section(struct vhost_dev *dev, MemoryRegionSection *section)
> >>  {
> >> -    bool result;
> >> -    bool log_dirty = memory_region_get_dirty_log_mask(section->mr) &
> >> -                     ~(1 << DIRTY_MEMORY_MIGRATION);
> >> -    result = memory_region_is_ram(section->mr) &&
> >> -        !memory_region_is_rom(section->mr);
> >> -
> >> -    /* Vhost doesn't handle any block which is doing dirty-tracking other
> >> -     * than migration; this typically fires on VGA areas.
> >> -     */
> >> -    result &= !log_dirty;
> >> +    enum { OK = 0, NOT_RAM, DIRTY, FILTERED } result = NOT_RAM;
> >> +
> >> +    if (memory_region_is_ram(section->mr) && !memory_region_is_rom(section->mr)) {
> >> +        uint8_t dirty_mask = memory_region_get_dirty_log_mask(section->mr);
> >> +        uint8_t handled_dirty;
> >>  
> >> -    if (result && dev->vhost_ops->vhost_backend_mem_section_filter) {
> >> -        result &=
> >> -            dev->vhost_ops->vhost_backend_mem_section_filter(dev, section);
> >> +        /*
> >> +         * Vhost doesn't handle any block which is doing dirty-tracking other
> >> +         * than migration; this typically fires on VGA areas. However
> >> +         * for TCG we also do dirty code page tracking which shouldn't
> >> +         * get in the way.
> >> +         */
> >> +        handled_dirty = (1 << DIRTY_MEMORY_MIGRATION);
> >> +        if (tcg_enabled()) {
> >> +            handled_dirty |= (1 << DIRTY_MEMORY_CODE);
> >> +        }
> >> +        if (dirty_mask & ~handled_dirty) {
> >> +            result = DIRTY;
> >> +        } else if (dev->vhost_ops->vhost_backend_mem_section_filter &&
> >> +            !dev->vhost_ops->vhost_backend_mem_section_filter(dev, section)) {
> >> +            result = FILTERED;
> >> +        } else {
> >> +            result = OK;
> >> +        }
> >>      }
> >>  
> >>      trace_vhost_section(section->mr->name, result);
> >> -    return result;
> >> +    return result == OK;
> >>  }
> >>  
> >>  static void vhost_begin(MemoryListener *listener)
> >> -- 
> >> 2.20.1
> >> 
> 
> 
> -- 
> Alex Bennée
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


