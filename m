Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F773730CA
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 21:28:16 +0200 (CEST)
Received: from localhost ([::1]:41364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1le0iN-0006F5-R9
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 15:28:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1le0hE-0005Gt-1I
 for qemu-devel@nongnu.org; Tue, 04 May 2021 15:27:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1le0hC-0005ln-FC
 for qemu-devel@nongnu.org; Tue, 04 May 2021 15:27:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620156421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZJ1IPBlZva99hTCLka8FoO0xPOYQROj7uJjZOZxkowQ=;
 b=agI3Xr1Ci+O/rlsiv1JpGhDVup50i2WyB9oCwHfMhCNVlUFoDEvmBBkO9fgQAyW8xMkP3/
 XRohPeolSq540ImQGEFF19SBaibgAWDp/o7L+tgbUUVXPatbBjNWfDiC1tnShyo5FZRqEV
 teS3vlZohP8b2z3LyK3gL7nXNP8S0qg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-CA0OPYIpNIKbazrjYfR-dA-1; Tue, 04 May 2021 15:26:58 -0400
X-MC-Unique: CA0OPYIpNIKbazrjYfR-dA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF97C107ACE6;
 Tue,  4 May 2021 19:26:56 +0000 (UTC)
Received: from [10.3.114.144] (ovpn-114-144.phx2.redhat.com [10.3.114.144])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4325119C44;
 Tue,  4 May 2021 19:26:56 +0000 (UTC)
Subject: Re: [PATCH 04/10] qcow2-refcount: introduce fix_l2_entry_by_zero()
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210504152023.322862-1-vsementsov@virtuozzo.com>
 <20210504152023.322862-5-vsementsov@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <e6642e5f-4928-8820-41ef-57262f1bd9e4@redhat.com>
Date: Tue, 4 May 2021 14:26:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210504152023.322862-5-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
> Split fix_l2_entry_by_zero() out of check_refcounts_l2() to be
> reused in further patch.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  block/qcow2-refcount.c | 87 +++++++++++++++++++++++++++++-------------
>  1 file changed, 60 insertions(+), 27 deletions(-)
> 
> diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
> index 66cbb94ef9..f1e771d742 100644
> --- a/block/qcow2-refcount.c
> +++ b/block/qcow2-refcount.c
> @@ -1587,6 +1587,54 @@ enum {
>      CHECK_FRAG_INFO = 0x2,      /* update BlockFragInfo counters */
>  };
>  
> +/*
> + * Fix L2 entry by making it QCOW2_CLUSTER_ZERO_PLAIN.
> + *
> + * Function do res->corruptions-- on success, so caller is responsible to do
> + * corresponding res->corruptions++ prior to the call.

This function decrements res->corruptions on success, so the caller is
responsible to increment res->corruptions prior to the call.

> + *
> + * On failure in-memory @l2_table may be modified.
> + */
> +static int fix_l2_entry_by_zero(BlockDriverState *bs, BdrvCheckResult *res,
> +                                uint64_t l2_offset,
> +                                uint64_t *l2_table, int l2_index, bool active,
> +                                bool *metadata_overlap)

Otherwise seems okay.
Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


