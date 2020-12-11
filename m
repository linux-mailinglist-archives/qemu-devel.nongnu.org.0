Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BEF2D7911
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 16:21:03 +0100 (CET)
Received: from localhost ([::1]:56648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knkEA-000726-2q
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 10:21:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1knk9U-0002vW-7u
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 10:16:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1knk9R-00034S-5D
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 10:16:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607699768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OntNca3yJw99bCjQjQU27B+oPSt4e6UwgKtXS6xv6+U=;
 b=QOXLADbbmkCVl1QsEf1H7n1akeMysmlHOQN92f4UfO6v5XlZdRaMZPDsTWABmkgPCR9VLa
 BcxxnzfHZccaP6WpnmIHH3CtF5jtfJEe9Hqrt5Gyccts7WYxdS0OdsNL2VT23fBDA8xW3n
 VWd1LzcSFj7P4bKQS73/Kyy1pExHITY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545-QTrjqMmvNn-vtUmNkxzAAg-1; Fri, 11 Dec 2020 10:16:06 -0500
X-MC-Unique: QTrjqMmvNn-vtUmNkxzAAg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BFF3E18C89C4;
 Fri, 11 Dec 2020 15:16:04 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-112-98.ams2.redhat.com
 [10.36.112.98])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B32B5D6A8;
 Fri, 11 Dec 2020 15:15:58 +0000 (UTC)
Subject: Re: [PATCH v14 09/13] stream: skip filters when writing backing file
 name to QCOW2 header
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20201204220758.2879-1-vsementsov@virtuozzo.com>
 <20201204220758.2879-10-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <a55e0557-2b86-b2ee-b9a9-406da522b53c@redhat.com>
Date: Fri, 11 Dec 2020 16:15:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201204220758.2879-10-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com,
 stefanha@redhat.com, andrey.shinkevich@virtuozzo.com, den@openvz.org,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04.12.20 23:07, Vladimir Sementsov-Ogievskiy wrote:
> From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
> 
> Avoid writing a filter JSON file name and a filter format name to QCOW2
> image when the backing file is being changed after the block stream
> job. It can occur due to a concurrent commit job on the same backing
> chain.
> A user is still able to assign the 'backing-file' parameter for a
> block-stream job keeping in mind the possible issue mentioned above.
> If the user does not specify the 'backing-file' parameter, QEMU will
> assign it automatically.
> 
> Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
>   [vsementsov: use unfiltered_bs for bdrv_find_backing_image()]
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   block/stream.c | 21 +++++++++++++++++++--
>   blockdev.c     |  8 +-------
>   2 files changed, 20 insertions(+), 9 deletions(-)
> 
> diff --git a/block/stream.c b/block/stream.c
> index 6e281c71ac..c208393c34 100644
> --- a/block/stream.c
> +++ b/block/stream.c

[...]

> @@ -75,8 +78,22 @@ static int stream_prepare(Job *job)
>           const char *base_id = NULL, *base_fmt = NULL;
>           if (base) {
>               base_id = s->backing_file_str;
> -            if (base->drv) {
> -                base_fmt = base->drv->format_name;
> +            if (base_id) {
> +                backing_bs = bdrv_find_backing_image(unfiltered_bs, base_id);
> +                if (backing_bs && backing_bs->drv) {
> +                    base_fmt = backing_bs->drv->format_name;
> +                } else {
> +                    error_report("Format not found for backing file %s",
> +                                 s->backing_file_str);

I think it’s actually going to be rather likely that we’re not going to 
find the backing file here.  If the user were to use a filename that 
just appears as-such in the backing chain, they wouldn’t need to specify 
a backing-file parameter at all, because the one figured out 
automatically would be just fine.

But then again, what are we supposed to do then.  We can continue as 
before, which is to just use the base node’s format.  But if the user 
wants to perhaps use a backing file that isn’t even open in qemu (a copy 
of the the base on some different storage), we have no idea what format 
it’s in.

So printing an error here, but continuing on with setting a backing_fmt 
is probably the most reasonable thing to do indeed.

> +                }
> +            } else {
> +                base_unfiltered = bdrv_skip_filters(base);
> +                if (base_unfiltered) {

@base_unfiltered cannot be NULL here (because @base is sure not to be 
NULL).  Of course, double-checking isn’t wrong, it just looks a bit 
weird, because it seems to imply that we might end up with a case where 
base != NULL, but base_id == NULL.  Anyway:

Reviewed-by: Max Reitz <mreitz@redhat.com>

> +                    base_id = base_unfiltered->filename;
> +                    if (base_unfiltered->drv) {
> +                        base_fmt = base_unfiltered->drv->format_name;
> +                    }
> +                }
>               }
>           }
>           bdrv_set_backing_hd(unfiltered_bs, base, &local_err);


