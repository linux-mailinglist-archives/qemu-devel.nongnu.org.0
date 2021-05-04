Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F01483730F2
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 21:39:59 +0200 (CEST)
Received: from localhost ([::1]:54840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1le0tj-0003sj-29
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 15:39:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1le0sR-0003LU-S6
 for qemu-devel@nongnu.org; Tue, 04 May 2021 15:38:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50160)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1le0sM-0004d8-IS
 for qemu-devel@nongnu.org; Tue, 04 May 2021 15:38:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620157113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hSUzG3mbW5I3GMmv3Txjuqo+7iNq8U4UCjG+KfE/ids=;
 b=SIIEoAqX68mQ0p34EDS71M0IS1JGxrQWpIeHRCC6EsbYDj6QpnuEQdUoBiHunDvrkkID2k
 MSN9ndbI55W7fUR9lnMVcUB6dgSb1EjqfoyqA7OnNUDXtbuIlHlV3fS4HANXysazOqLaqr
 kPBFtHkgUfwlTv6TWA2HUjdcrIpiRqE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-DAyTpLm2MkuwpaIc-n1xvw-1; Tue, 04 May 2021 15:38:31 -0400
X-MC-Unique: DAyTpLm2MkuwpaIc-n1xvw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9926A106BB2B;
 Tue,  4 May 2021 19:38:30 +0000 (UTC)
Received: from [10.3.114.144] (ovpn-114-144.phx2.redhat.com [10.3.114.144])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0AA9B19C71;
 Tue,  4 May 2021 19:38:29 +0000 (UTC)
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210504152023.322862-1-vsementsov@virtuozzo.com>
 <20210504152023.322862-6-vsementsov@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Subject: Re: [PATCH 05/10] qcow2-refcount: fix_l2_entry_by_zero(): also zero
 L2 entry bitmap
Message-ID: <96086f78-b8c6-ccc8-25e6-d41f928f3af2@redhat.com>
Date: Tue, 4 May 2021 14:38:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210504152023.322862-6-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
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
Cc: kwolf@redhat.com, den@openvz.org, ktkhai@virtuozzo.com,
 qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/4/21 10:20 AM, Vladimir Sementsov-Ogievskiy wrote:
> We'll reuse the function to fix wrong L2 entry bitmap. Support it now.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  block/qcow2-refcount.c | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
> index f1e771d742..62d59eb2e9 100644
> --- a/block/qcow2-refcount.c
> +++ b/block/qcow2-refcount.c
> @@ -1588,7 +1588,8 @@ enum {
>  };
>  
>  /*
> - * Fix L2 entry by making it QCOW2_CLUSTER_ZERO_PLAIN.
> + * Fix L2 entry by making it QCOW2_CLUSTER_ZERO_PLAIN (or maing all its present

making

> + * subclusters QCOW2_SUBCLUSTER_ZERO_PLAIN).
>   *
>   * Function do res->corruptions-- on success, so caller is responsible to do
>   * corresponding res->corruptions++ prior to the call.
> @@ -1605,9 +1606,20 @@ static int fix_l2_entry_by_zero(BlockDriverState *bs, BdrvCheckResult *res,
>      int idx = l2_index * (l2_entry_size(s) / sizeof(uint64_t));
>      uint64_t l2e_offset = l2_offset + (uint64_t)l2_index * l2_entry_size(s);
>      int ign = active ? QCOW2_OL_ACTIVE_L2 : QCOW2_OL_INACTIVE_L2;
> -    uint64_t l2_entry = has_subclusters(s) ? 0 : QCOW_OFLAG_ZERO;
>  
> -    set_l2_entry(s, l2_table, l2_index, l2_entry);
> +    if (has_subclusters(s)) {
> +        uint64_t l2_bitmap = get_l2_bitmap(s, l2_table, l2_index);
> +
> +        /* Allocated subclusters becomes zero */

become

> +        l2_bitmap |= l2_bitmap << 32;
> +        l2_bitmap &= QCOW_L2_BITMAP_ALL_ZEROES;
> +
> +        set_l2_bitmap(s, l2_table, l2_index, l2_bitmap);
> +        set_l2_entry(s, l2_table, l2_index, 0);
> +    } else {
> +        set_l2_entry(s, l2_table, l2_index, QCOW_OFLAG_ZERO);
> +    }
> +
>      ret = qcow2_pre_write_overlap_check(bs, ign, l2e_offset, l2_entry_size(s),
>                                          false);
>      if (metadata_overlap) {
> 

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


