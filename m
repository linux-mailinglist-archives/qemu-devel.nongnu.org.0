Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6952F1A76
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 17:09:03 +0100 (CET)
Received: from localhost ([::1]:53438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyzkc-0007ty-4n
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 11:09:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kyzj1-0006iJ-9i
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 11:07:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kyzix-00035x-7d
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 11:07:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610381236;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iQSYuhADVevw8gnYrhzHXUqHBkmJgTUeNJKT1IKCkKc=;
 b=RTac0YkpzRGyc1zfkctFuCoT2ZjkNKi4HUzVBN545F+zKK4xbEiSQg4EDI8WKhg6ieXpcD
 m51RM72buYRwk9n5B6cnAFjovKS9k3lW6UxpQiHfXRk9/lMUDxh7ukrQ2OblHPyMBMgoUW
 hJq1FUNBWSjyEGQbVH2g0kuL+GlKAGo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-fmb4KJUlOEa9dVS2zwJhcA-1; Mon, 11 Jan 2021 11:07:12 -0500
X-MC-Unique: fmb4KJUlOEa9dVS2zwJhcA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D6EEE100C660;
 Mon, 11 Jan 2021 16:07:10 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-115-17.ams2.redhat.com
 [10.36.115.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9688F1349A;
 Mon, 11 Jan 2021 16:07:08 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH v3 02/25] qapi: backup: add perf.use-copy-range parameter
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20201026171815.13233-1-vsementsov@virtuozzo.com>
 <20201026171815.13233-3-vsementsov@virtuozzo.com>
Message-ID: <7a4e5008-8651-3d96-7a79-7b9d24a5e731@redhat.com>
Date: Mon, 11 Jan 2021 17:07:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201026171815.13233-3-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, wencongyang2@huawei.com, xiechanglong.d@gmail.com,
 qemu-devel@nongnu.org, armbru@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26.10.20 18:17, Vladimir Sementsov-Ogievskiy wrote:
> Experiments show, that copy_range is not always making things faster.
> So, to make experimentation simpler, let's add a parameter. Some more
> perf parameters will be added soon, so here is a new struct.
> 
> For now, add new backup qmp parameter with x- prefix for the following
> reasons:
> 
>   - We are going to add more performance parameters, some will be
>     related to the whole block-copy process, some only to background
>     copying in backup (ignored for copy-before-write operations).
>   - On the other hand, we are going to use block-copy interface in other
>     block jobs, which will need performance options as well.. And it
>     should be the same structure or at least somehow related.
> 
> So, there are too much unclean things about how the interface and now
> we need the new options mostly for testing. Let's keep them
> experimental for a while.
> 
> In do_backup_common() new x-perf parameter handled in a way to
> make further options addition simpler.
> 
> We add use-copy-range with default=true, and we'll change the default
> in further patch, after moving backup to use block-copy.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   qapi/block-core.json       | 17 ++++++++++++++++-
>   block/backup-top.h         |  1 +
>   include/block/block-copy.h |  2 +-
>   include/block/block_int.h  |  3 +++
>   block/backup-top.c         |  4 +++-
>   block/backup.c             |  6 +++++-
>   block/block-copy.c         |  4 ++--
>   block/replication.c        |  2 ++
>   blockdev.c                 |  8 ++++++++
>   9 files changed, 41 insertions(+), 6 deletions(-)

Reviewed-by: Max Reitz <mreitz@redhat.com>


