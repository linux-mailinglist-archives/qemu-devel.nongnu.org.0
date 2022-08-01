Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A5B586C61
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 15:57:22 +0200 (CEST)
Received: from localhost ([::1]:59296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIVv6-0006DP-Gy
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 09:57:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1oIVdJ-0001FT-1g
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 09:38:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1oIVdG-0003tY-JL
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 09:38:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659361133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gGuFtr5V6f43nJT7lTikmn91ygy0tx/z9W7ZDza/kIg=;
 b=T7Hi56jM98XtKARZ8nSZFi8bA83/4nTm+fNEtZ9CO0t8aIY5NPqh3ZYZ0GMyb22MTM+LGd
 AEF5Hv2Rtmc03QI7toQdl28BN8ckPkYyYRy/iJBsZCV7NX+9dTgzS4lQzQ39uejEuWTr1t
 vSpO2OUTB8JabRtmJVuToTgI+aREqrI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-uiUlMj_DPNWAMASYkZNqkQ-1; Mon, 01 Aug 2022 09:38:50 -0400
X-MC-Unique: uiUlMj_DPNWAMASYkZNqkQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C870F280EE2E;
 Mon,  1 Aug 2022 13:38:49 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7786490A00;
 Mon,  1 Aug 2022 13:38:48 +0000 (UTC)
Date: Mon, 1 Aug 2022 08:38:46 -0500
From: Eric Blake <eblake@redhat.com>
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel@nongnu.org, damien.lemoal@opensource.wdc.com,
 dmitry.fomichev@wdc.com, hare@suse.de, stefanha@redhat.com,
 mst@redhat.com, armbru@redhat.com, qemu-block@nongnu.org,
 fam@euphon.net, kwolf@redhat.com, hreitz@redhat.com
Subject: Re: [RFC v5 05/11] block: add block layer APIs resembling Linux
 ZonedBlockDevice ioctls
Message-ID: <20220801133846.opjunacnhorxftxl@redhat.com>
References: <20220801013305.10561-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220801013305.10561-1-faithilikerun@gmail.com>
User-Agent: NeoMutt/20220429
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 01, 2022 at 09:33:05AM +0800, Sam Li wrote:
> By adding zone management operations in BlockDriver, storage controller
> emulation can use the new block layer APIs including Report Zone and
> four zone management operations (open, close, finish, reset).
> 
> BlockDriver can get zone information from null_blk device by refreshing
> BLockLimits.
> 
> Signed-off-by: Sam Li <faithilikerun@gmail.com>
> ---
>  block/block-backend.c            |  47 ++++++
>  block/coroutines.h               |   6 +
>  block/file-posix.c               | 272 ++++++++++++++++++++++++++++++-
>  block/io.c                       |  57 +++++++
>  include/block/block-common.h     |   1 -
>  include/block/block-io.h         |  13 ++
>  include/block/block_int-common.h |  22 ++-
>  include/block/raw-aio.h          |   6 +-
>  meson.build                      |   1 +
>  qapi/block-core.json             |   7 +-
>  10 files changed, 426 insertions(+), 6 deletions(-)
> 

> +++ b/qapi/block-core.json
> @@ -2955,7 +2955,8 @@
>              'luks', 'nbd', 'nfs', 'null-aio', 'null-co', 'nvme', 'parallels',
>              'preallocate', 'qcow', 'qcow2', 'qed', 'quorum', 'raw', 'rbd',
>              { 'name': 'replication', 'if': 'CONFIG_REPLICATION' },
> -            'ssh', 'throttle', 'vdi', 'vhdx', 'vmdk', 'vpc', 'vvfat' ] }
> +            'ssh', 'throttle', 'vdi', 'vhdx', 'vmdk', 'vpc', 'vvfat',
> +            { 'name': 'zoned_host_device', 'if': 'CONFIG_BLKZONED' } ] }

Missing a documentation line of '# @zoned_host_deivce: Since 7.2'.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


