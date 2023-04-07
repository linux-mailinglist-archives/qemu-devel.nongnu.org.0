Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3093A6DB454
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Apr 2023 21:40:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkrv1-0007CR-G3; Fri, 07 Apr 2023 15:38:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pkrv0-0007CB-50
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 15:38:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pkruy-0004Yo-LI
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 15:38:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680896318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wtA6ag02v2gkdNxfHzl+K+FNhWDXbIO3gb3mseShmoc=;
 b=UKDV85s6Wx88BmeRW90ImXvfisys2b+1LbRRsPc0sVLMZUvxbr0Q/kuLdK2QEcJxZZ+1X3
 Y3wOTPJu0mdJEaH1p1ge9eeXbtYyCtYnMdfcccQrXBMpfJMiAP7Mo8KcZMZh19zHIZkPzM
 BCHzMrLC2KOsd7FUO35TZBOH1oGk7Vs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-588-qbG8d6jXPa6SXPc7b2g4DQ-1; Fri, 07 Apr 2023 15:38:36 -0400
X-MC-Unique: qbG8d6jXPa6SXPc7b2g4DQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8B1B429AA3B0;
 Fri,  7 Apr 2023 19:38:36 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.67])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CF6C1492B00;
 Fri,  7 Apr 2023 19:38:35 +0000 (UTC)
Date: Fri, 7 Apr 2023 14:38:34 -0500
From: Eric Blake <eblake@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, stefanha@redhat.com, kwolf@redhat.com, 
 qemu-block@nongnu.org, hreitz@redhat.com
Subject: Re: [PATCH 1/8] block: move has_variable_length to BlockLimits
Message-ID: <zgxk4cdsfv4sgzdvreuhcisyzf37qu22ghwk2amf4syoferydv@fwz5jvxqvyjv>
References: <20230407153303.391121-1-pbonzini@redhat.com>
 <20230407153303.391121-2-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230407153303.391121-2-pbonzini@redhat.com>
User-Agent: NeoMutt/20230322
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Apr 07, 2023 at 05:32:56PM +0200, Paolo Bonzini wrote:
> At the protocol level, has_variable_length only needs to be true in the
> very special case of host CD-ROM drives, so that they do not need an
> explicit monitor command to read the new size when a disc is loaded
> in the tray.
> 
> However, at the format level has_variable_length has to be true for all
> raw blockdevs and for all filters, even though in practice the length
> depends on the underlying file and thus will not change except in the
> case of host CD-ROM drives.
> 
> As a first step towards computing an accurate value of has_variable_length,
> add the value into the BlockLimits structure and initialize the field
> from the BlockDriver.

My assumption here is that all other resizes (such as a block device
that can be externally enlarged upon seeing the guest pause due to an
ENOSPC condition on the current size) are NOT expected to have
automatic reaction in qemu, but instead rely on some other external
action (such as resuming after ENOSPC or an explicit monitor command)
as the reason for why qemu eventually learns the new size.  If my
assumption is right, then you do sound correct in stating that CDROMs
are special in that the guest OS can request the tray to be loaded and
change the size from 0 to the size of the newly-inserted disc, with no
intervening action or QMP command, and qemu must react to that size
change.

I'm asking because at one point, there was a proposal to extend the
NBD protocol to allow dynamic resizing, somewhat similar to how a
block device can be externally resized; there were questions on how
much of a resize action has to be from client-to-server "please poll
if the server has changed size recently" instead of server-to-client
"by the way, the size just changed".  I don't want NBD resize (if
someone ever fleshes out the extension propsal into an actual
implementation) to be hamstrung by an inability to reflect size
changes initiated on the server side, rather than triggered at the
client side.  But since I think regular files and block devices have
the same considerations, I don't think it is a show-stopper to this
series.

> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block.c                          | 2 +-
>  block/io.c                       | 6 ++++++
>  include/block/block_int-common.h | 8 ++++++++
>  3 files changed, 15 insertions(+), 1 deletion(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


