Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A7A3E1CDF
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 21:38:57 +0200 (CEST)
Received: from localhost ([::1]:34754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBjCi-0000pi-HU
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 15:38:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mBj9T-0004n3-0d
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 15:35:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mBj9Q-0002VK-GC
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 15:35:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628192131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YFbusjAxs41vh62xcy4YBFmC4tApV2qqlxIUY0gJAcU=;
 b=Zgijk1ZO9Lxh3m0aesNdgKbBePt9/udAMRhnUBDjz0NBY6kCBRIb8W8k/waekVRwXff9bi
 qgCYGJbJ0Ixo1bweCACaE7D8j3dXVzsmOIJhvBBGXFFKXx+bI3s18A9/ShK4b5o1ADXOLP
 1iiNI3T4G9nMbx9itCPNiEtdd3Hw1EA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-360-xmxnWc3SN0i6Ns8sUK_vYg-1; Thu, 05 Aug 2021 15:35:29 -0400
X-MC-Unique: xmxnWc3SN0i6Ns8sUK_vYg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 248E6190D341;
 Thu,  5 Aug 2021 19:35:29 +0000 (UTC)
Received: from redhat.com (ovpn-112-138.phx2.redhat.com [10.3.112.138])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BA7AA5DF21;
 Thu,  5 Aug 2021 19:35:28 +0000 (UTC)
Date: Thu, 5 Aug 2021 14:35:27 -0500
From: Eric Blake <eblake@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH] gluster: Align block-status tail
Message-ID: <20210805193527.snterixylzx3zodw@redhat.com>
References: <20210805143603.59503-1-mreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210805143603.59503-1-mreitz@redhat.com>
User-Agent: NeoMutt/20210205-687-0ed190
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 05, 2021 at 04:36:03PM +0200, Max Reitz wrote:
> gluster's block-status implementation is basically a copy of that in
> block/file-posix.c, there is only one thing missing, and that is
> aligning trailing data extents to the request alignment (as added by
> commit 9c3db310ff0).
> 
> Note that 9c3db310ff0 mentions that "there seems to be no other block
> driver that sets request_alignment and [...]", but while block/gluster.c
> does indeed not set request_alignment, block/io.c's
> bdrv_refresh_limits() will still default to an alignment of 512 because
> block/gluster.c does not provide a byte-aligned read function.
> Therefore, unaligned tails can conceivably occur, and so we should apply
> the change from 9c3db310ff0 to gluster's block-status implementation.
> 
> Reported-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>  block/gluster.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)

Probably not a show-stopper for 6.1, so I'm fine if it sits until 6.2.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


