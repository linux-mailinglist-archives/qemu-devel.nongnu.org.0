Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F087E373112
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 21:54:58 +0200 (CEST)
Received: from localhost ([::1]:45722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1le18D-0003y7-J3
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 15:54:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1le16u-0003G9-Mk
 for qemu-devel@nongnu.org; Tue, 04 May 2021 15:53:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1le16q-0005RC-MY
 for qemu-devel@nongnu.org; Tue, 04 May 2021 15:53:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620158011;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SGYFQaJlW4y3X009ChQ5kV+5vBirU/EC/yfW5L7zZps=;
 b=bpbPzDifl73p+TQUKWPVLBhfN0eKm+zMklM6QQCdRz2+GmEwxUNZ5UJv8tgRVASpDtP8vK
 VJj9aGLmmZb7pfQXnHH3krccDTnwj7o1wwDm0MLqur6bWF+1Xz8An0JJrAjGr2Sv3u1yo9
 TfEdQ5yZLHx2FwmJ4LyMkS7XvsUzs7s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-Vcylz9JONPKMoOORC6QsYw-1; Tue, 04 May 2021 15:53:27 -0400
X-MC-Unique: Vcylz9JONPKMoOORC6QsYw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8E4C5107ACCA;
 Tue,  4 May 2021 19:53:25 +0000 (UTC)
Received: from [10.3.114.144] (ovpn-114-144.phx2.redhat.com [10.3.114.144])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B0A275D9DE;
 Tue,  4 May 2021 19:53:24 +0000 (UTC)
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210504152023.322862-1-vsementsov@virtuozzo.com>
 <20210504152023.322862-9-vsementsov@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Subject: Re: [PATCH 08/10] qcow2-refcount: improve style of
 check_refcounts_l1()
Message-ID: <d3b3564b-16c7-40d4-d229-363b77d2c0ee@redhat.com>
Date: Tue, 4 May 2021 14:53:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210504152023.322862-9-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
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
Cc: kwolf@redhat.com, den@openvz.org, ktkhai@virtuozzo.com,
 qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/4/21 10:20 AM, Vladimir Sementsov-Ogievskiy wrote:
>  - use g_autofree for l1_table
>  - better name for size in bytes variable
>  - reduce code blocks nesting
>  - whitespaces, braces, newlines
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  block/qcow2-refcount.c | 97 +++++++++++++++++++++---------------------
>  1 file changed, 49 insertions(+), 48 deletions(-)
> 
> diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
> index 44fc0dd5dc..eb6de3dabd 100644
> --- a/block/qcow2-refcount.c
> +++ b/block/qcow2-refcount.c
> @@ -1864,71 +1864,72 @@ static int check_refcounts_l1(BlockDriverState *bs,
>                                int flags, BdrvCheckMode fix, bool active)
>  {
>      BDRVQcow2State *s = bs->opaque;
> -    uint64_t *l1_table = NULL, l2_offset, l1_size2;
> +    size_t l1_size_bytes = l1_size * L1E_SIZE;
> +    g_autofree uint64_t *l1_table = g_try_malloc(l1_size_bytes);

Note that this now happens...

> +    uint64_t l2_offset;
>      int i, ret;
>  
> -    l1_size2 = l1_size * L1E_SIZE;
> +    if (!l1_size) {
> +        return 0;

...before you validate whether l1_size is non-zero, which can result in
g_try_malloc(0).  Probably harmless, but it might be better if you declare
 g_autofree uint64_t *l1_table = NULL;
and then initialize it via malloc only after the sanity check.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


