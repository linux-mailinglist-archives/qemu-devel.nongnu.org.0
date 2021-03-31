Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C66A350838
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 22:30:53 +0200 (CEST)
Received: from localhost ([::1]:43512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRhUK-0000dG-Fb
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 16:30:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lRhRQ-0007Lz-Dw
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 16:27:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lRhRP-0002w0-0s
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 16:27:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617222469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3LobwBlq/l3pr4PKpsNEkGAj6Wn8YBcdYRGAx0xEj8w=;
 b=WGoNUlyUqjjkZFQ/9/flk93tf6iN82v153pkYRdDhJgouRprPTvNGzMFftTOfRvSjGcJUh
 D7hFye+9zHYczM+TChlO96XaOw0p5E2ahKkYtitCt3sX9tJsZlzETx0mrQHjEXOte76Kvr
 W9fZVWYAzJnvdlK/jufuamk5Z+6nDJo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-383-KoqkS4wyNQSC5sxXS_i6Iw-1; Wed, 31 Mar 2021 16:27:47 -0400
X-MC-Unique: KoqkS4wyNQSC5sxXS_i6Iw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 110501019624;
 Wed, 31 Mar 2021 20:27:46 +0000 (UTC)
Received: from [10.3.113.141] (ovpn-113-141.phx2.redhat.com [10.3.113.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 91D2A5D72F;
 Wed, 31 Mar 2021 20:27:45 +0000 (UTC)
Subject: Re: [PATCH] block/export: improve vu_blk_sect_range_ok()
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20210331142727.391465-1-stefanha@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <31625024-d4cf-7dc6-93b1-35da7166b513@redhat.com>
Date: Wed, 31 Mar 2021 15:27:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210331142727.391465-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Coiby Xu <Coiby.Xu@gmail.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/31/21 9:27 AM, Stefan Hajnoczi wrote:
> The checks in vu_blk_sect_range_ok() assume VIRTIO_BLK_SECTOR_SIZE is
> equal to BDRV_SECTOR_SIZE. This is true, but let's add a
> QEMU_BUILD_BUG_ON() to make it explicit.
> 
> We might as well check that the request buffer size is a multiple of
> VIRTIO_BLK_SECTOR_SIZE while we're at it.
> 
> Suggested-by: Max Reitz <mreitz@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  block/export/vhost-user-blk-server.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


