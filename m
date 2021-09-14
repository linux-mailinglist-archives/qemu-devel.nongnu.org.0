Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 248F840AA09
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 10:58:05 +0200 (CEST)
Received: from localhost ([::1]:40252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ4GS-0000Dh-6G
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 04:58:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQ4D7-0005J8-R5
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 04:54:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQ4D3-0000sx-Tq
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 04:54:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631609672;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GKTbNZ3gWKTTBNqqb81VtQvASTcP/qe7/2shVDcWhQA=;
 b=C+/aXN7yphYpaYKPoV9xG5KzrrDuhkaon/Pop6vz3pO5YVAbqjx0r7O/u+ZwNs3xi1+mJ7
 Zt6FE+w9tNtcYW4il+wnEDLl4WHhynCQ3RTF/i7rd2UwnWdB2FLWAF0GviYdArqKq65I6L
 nyaHnKRO0Q8LehixLBb5wNxXvieXK+k=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-HFYj9WIBO7aC6rsKjn5FQA-1; Tue, 14 Sep 2021 04:54:31 -0400
X-MC-Unique: HFYj9WIBO7aC6rsKjn5FQA-1
Received: by mail-wr1-f69.google.com with SMTP id
 z2-20020a5d4c82000000b0015b140e0562so3702171wrs.7
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 01:54:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=GKTbNZ3gWKTTBNqqb81VtQvASTcP/qe7/2shVDcWhQA=;
 b=UkQdVYltX78Sa57hLVC/KZAjuUbF6C0+Nsx8Y9fd0pryc0Esgw+VZDme0wANqNU15T
 GfPAt5YzAFuE4ByNCZ1NbB76DYh0WCpmLVfaVQ/yZikD693JzPFMJlQlFhtxZOm27YvS
 ru9Z4HZVXk3FEjePK4KmR0+glSX6jZhTeqlyGIw9WaFG3YgK5hziNxrzJGLBTyxXOGkL
 eO0UBZDLjLo+pphUaYNeSZosJhvv+OkbaMmpm+JTxjPcVvM6kmBm6OOCdkPnUeB6CQjq
 Jr4Qk0gdN+YThgcIPaPXhO0e0zF9CSEjK6A7iomuqyJmLz6NIHARxsRUHAWmC20HdInP
 dWzA==
X-Gm-Message-State: AOAM533peNUPbrDWpymPf/fSElaoj/ioBBE38iXMBdITNXuwkI6Yh5kA
 rhKThpLbuzIuwru1JQ9qpAXHYt+2x++ewIBtb0m3UwaLTrBW7UCqP1qpBCa53uFo1davymsfbul
 qukXXq8f0fXP9cZE=
X-Received: by 2002:a05:600c:510a:: with SMTP id
 o10mr887633wms.81.1631609670200; 
 Tue, 14 Sep 2021 01:54:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzGLf39Vd0e/n2SzQ24dAf/xs3NQ3MVIG12/4U1iTb5PjUT5K8cGAeHTDDsicBhXFcqQzNZFg==
X-Received: by 2002:a05:600c:510a:: with SMTP id
 o10mr887619wms.81.1631609670034; 
 Tue, 14 Sep 2021 01:54:30 -0700 (PDT)
Received: from dresden.str.redhat.com
 ([2a02:908:1e42:9e20:fd73:7ee2:9975:24d9])
 by smtp.gmail.com with ESMTPSA id i2sm5736654wrq.78.2021.09.14.01.54.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 01:54:29 -0700 (PDT)
Subject: Re: [PATCH v3 06/10] qcow2-refcount: check_refcounts_l2(): check
 l2_bitmap
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210524142031.142109-1-vsementsov@virtuozzo.com>
 <20210524142031.142109-7-vsementsov@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <704ed8a0-387a-d2e7-827f-39957f67b892@redhat.com>
Date: Tue, 14 Sep 2021 10:54:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210524142031.142109-7-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.398, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.969,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, berto@igalia.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, ktkhai@virtuozzo.com, den@openvz.org, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24.05.21 16:20, Vladimir Sementsov-Ogievskiy wrote:
> Check subcluster bitmap of the l2 entry for different types of
> clusters:
>
>   - for compressed it must be zero
>   - for allocated check consistency of two parts of the bitmap
>   - for unallocated all subclusters should be unallocated
>     (or zero-plain)
>
> For unallocated clusters we can safely fix the entry by making it
> zero-plain.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Tested-by: Kirill Tkhai <ktkhai@virtuozzo.com>
> ---
>   block/qcow2-refcount.c | 30 +++++++++++++++++++++++++++++-
>   1 file changed, 29 insertions(+), 1 deletion(-)
>
> diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
> index f48c5e1b5d..062ec48a15 100644
> --- a/block/qcow2-refcount.c
> +++ b/block/qcow2-refcount.c
> @@ -1681,6 +1681,7 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
>           uint64_t coffset;
>           int csize;
>           l2_entry = get_l2_entry(s, l2_table, i);
> +        uint64_t l2_bitmap = get_l2_bitmap(s, l2_table, i);

This is a declaration after a statement.  (Easily fixable by moving the 
l2_entry declaration here, though.  Or by putting the l2_bitmap 
declaration where l2_entry is declared.)

[...]

> @@ -1800,6 +1815,19 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
>   
>           case QCOW2_CLUSTER_ZERO_PLAIN:
>           case QCOW2_CLUSTER_UNALLOCATED:
> +            if (l2_bitmap & QCOW_L2_BITMAP_ALL_ALLOC) {
> +                res->corruptions++;
> +                fprintf(stderr, "%s: Unallocated "
> +                        "cluster has non-zero subcluster allocation map\n",
> +                        fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR");
> +                if (fix & BDRV_FIX_ERRORS) {
> +                    ret = fix_l2_entry_by_zero(bs, res, l2_offset, l2_table, i,
> +                                               active, &metadata_overlap);

I believe this is indeed the correct repair method for 
QCOW2_CLUSTER_ZERO_PLAIN, but I’m not so sure for 
QCOW2_CLUSTER_UNALLOCATED.  As far as I can tell, 
qcow2_get_subcluster_type() will return QCOW2_SUBCLUSTER_INVALID for 
this case, and so trying to read from this clusters will produce I/O 
errors.  But still, shouldn’t we rather make such a cluster unallocated 
rather than zero then?

And as for QCOW2_CLUSTER_ZERO_PLAIN, I believe qcow2_get_cluster_type() 
will never return it when subclusters are enabled.  So this repair path 
will never happen with a cluster type of ZERO_PLAIN, but only for 
UNALLOCATED.

Hanna

> +                    if (metadata_overlap) {
> +                        return ret;
> +                    }
> +                }
> +            }
>               break;
>   
>           default:


