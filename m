Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC87165F84
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Feb 2020 15:13:32 +0100 (CET)
Received: from localhost ([::1]:43158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4ma3-0004rM-5d
	for lists+qemu-devel@lfdr.de; Thu, 20 Feb 2020 09:13:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38712)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1j4mZ7-0004Dw-Ck
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 09:12:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1j4mZ5-0008R9-NG
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 09:12:32 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:26485
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1j4mZ5-0008QY-J4
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 09:12:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582207950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1K54iuW+CASP9uuFr283BHFzc7LPSg+aJHTR43b+tgE=;
 b=FVp3aND/FJpr/QeT3J3OeL/Kqw04fm5o71bOEhxbkNiRuJhJ+Kw+ILP5sLzF5HZGEyiZl5
 aIIZEgu7DXTNFaVdfj47xZIAtT0M0YQG9+VIOlMO7Jj6RF32ghrKftiTC5fzl2U8lD/M5e
 Bhi3oqq2L8TKiqEf/OIobU/06XszHEk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-wdwKse8WM_Oohr91162nAA-1; Thu, 20 Feb 2020 09:12:23 -0500
X-MC-Unique: wdwKse8WM_Oohr91162nAA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 020A0DB49;
 Thu, 20 Feb 2020 14:12:21 +0000 (UTC)
Received: from [10.3.116.180] (ovpn-116-180.phx2.redhat.com [10.3.116.180])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 10AC95DA76;
 Thu, 20 Feb 2020 14:12:19 +0000 (UTC)
Subject: Re: [RFC PATCH v3 25/27] qcow2: Add the 'extended_l2' option and the
 QCOW2_INCOMPAT_EXTL2 bit
To: Alberto Garcia <berto@igalia.com>, qemu-devel@nongnu.org
References: <cover.1577014346.git.berto@igalia.com>
 <a4892ab10ae557f30dd901d218f06239bca2cd7a.1577014346.git.berto@igalia.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <ac259d2c-72cc-370f-322d-58b15892f667@redhat.com>
Date: Thu, 20 Feb 2020 08:12:19 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <a4892ab10ae557f30dd901d218f06239bca2cd7a.1577014346.git.berto@igalia.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Kevin Wolf <kwolf@redhat.com>, Anton Nefedov <anton.nefedov@virtuozzo.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "Denis V . Lunev" <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/22/19 5:37 AM, Alberto Garcia wrote:
> Now that the implementation of subclusters is complete we can finally
> add the necessary options to create and read images with this feature,
> which we call "extended L2 entries".
> 
> Signed-off-by: Alberto Garcia <berto@igalia.com>
> ---

Preliminary review on just interface items (I may do a deeper dive into 
the rest of the patch after getting through the series).

> +++ b/block/qcow2.c
> @@ -1383,6 +1383,12 @@ static int coroutine_fn qcow2_do_open(BlockDriverState *bs, QDict *options,
>       s->subcluster_size = s->cluster_size / s->subclusters_per_cluster;
>       s->subcluster_bits = ctz32(s->subcluster_size);
>   
> +    if (s->subcluster_size < (1 << MIN_CLUSTER_BITS)) {
> +        error_setg(errp, "Unsupported subcluster size: %d", s->subcluster_size);
> +        ret = -EINVAL;
> +        goto fail;
> +    }
> +
>       /* Check support for various header values */
>       if (header.refcount_order > 6) {
>           error_setg(errp, "Reference count entry width too large; may not "
> @@ -2856,6 +2862,11 @@ int qcow2_update_header(BlockDriverState *bs)
>                   .bit  = QCOW2_COMPAT_LAZY_REFCOUNTS_BITNR,
>                   .name = "lazy refcounts",
>               },
> +            {
> +                .type = QCOW2_FEAT_TYPE_INCOMPATIBLE,
> +                .bit  = QCOW2_INCOMPAT_EXTL2_BITNR,
> +                .name = "extended L2 entries",
> +            },

I'd sort this to be grouped with the other INCOMPATIBLE bits (after 
"external data file", rather than placing a COMPATIBLE bit in the middle.

Rebase conflict with my patches proposing the addition of an AUTOCLEAR 
bit, here and in the impacted iotests.  Should be trivial to resolve, by 
whoever lands second.

> +++ b/qapi/block-core.json
> @@ -66,6 +66,9 @@
>   #                 standalone (read-only) raw image without looking at qcow2
>   #                 metadata (since: 4.0)
>   #
> +# @extended-l2: true if the image has extended L2 entries; only valid for
> +#               compat >= 1.1 (since 4.2)
> +#

5.0, now.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


