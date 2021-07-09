Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 883093C28B7
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 19:47:48 +0200 (CEST)
Received: from localhost ([::1]:42292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1ubK-0000Lx-Pp
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 13:47:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m1uZ7-0006gH-Dd
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 13:45:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m1uZ3-0004I8-Md
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 13:45:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625852723;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ujiqjNGHzwVm2wxBlHO6u9+x41beCcaShLqjmvoG7Vo=;
 b=MWv1pce+Vdq8BRGlzcpx6U4mzeRsXNh93HbDd469CR6K9OhckW9RgAF6adcBQdfzuH+M0k
 uqEjv27Lgpn0+xNYZobQu56LZ24kvn241Tjjd7zW7hTrB1Z70pJGQFWsZ7lT1tnBbg/jvR
 T+U1YoFoKFXEZqf9fLq8zofJlAM4iaw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-SU0mhWplPOu97T_5dW3rLg-1; Fri, 09 Jul 2021 13:45:20 -0400
X-MC-Unique: SU0mhWplPOu97T_5dW3rLg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DECF91835AC3;
 Fri,  9 Jul 2021 17:45:19 +0000 (UTC)
Received: from redhat.com (ovpn-112-103.phx2.redhat.com [10.3.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 632C8100164A;
 Fri,  9 Jul 2021 17:45:19 +0000 (UTC)
Date: Fri, 9 Jul 2021 12:45:17 -0500
From: Eric Blake <eblake@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH] block: Add option to use driver whitelist even in tools
Message-ID: <20210709174517.bauuzc42l5zjawph@redhat.com>
References: <20210709164141.254097-1-kwolf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210709164141.254097-1-kwolf@redhat.com>
User-Agent: NeoMutt/20210205-571-666bd6
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 09, 2021 at 06:41:41PM +0200, Kevin Wolf wrote:
> Currently, the block driver whitelists are only applied for the system
> emulator. All other binaries still give unrestricted access to all block
> drivers. There are use cases where this made sense because the main
> concern was avoiding customers running VMs on less optimised block
> drivers and getting bad performance. Allowing the same image format e.g.
> as a target for 'qemu-img convert' is not a problem then.
> 
> However, if the concern is the supportability of the driver in general,
> either in full or when used read-write, not applying the list driver
> whitelist in tools doesn't help - especially since qemu-nbd and
> qemu-storage-daemon now give access to more or less the same operations
> in block drivers as running a system emulator.
> 
> In order to address this, introduce a new configure option that enforces
> the driver whitelist in all binaries.

Is it feasible that someone would want two separate lists: one for
qemu (which runs run efficiently) and another for tools (which ones do
we support at all)?  As written, your patch offers no chance to
distinguish between the two.

Also, is now a good time to join the bandwagon on picking a more
descriptive name (such as 'allow-list') for this terminology?

> +++ b/block.c
> @@ -6162,6 +6162,9 @@ BlockDriverState *bdrv_find_backing_image(BlockDriverState *bs,
>  
>  void bdrv_init(void)
>  {
> +#ifdef CONFIG_BDRV_WHITELIST_TOOLS
> +    use_bdrv_whitelist = 1;

Pre-existing, but this variable seems like a natural candidate to be
bool instead of int.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


