Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9042DE0DF
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 11:22:11 +0100 (CET)
Received: from localhost ([::1]:39080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqCtl-0001By-Jq
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 05:22:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kqCrd-00007W-5x
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:19:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kqCra-0005aw-Ou
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:19:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608286793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xccaUp7hhKcYp1527odmwDQcCG3Q6tk/gqm0zReKG7o=;
 b=X/PumbeXvOfFl2l+ruM8y2FHuzbbYnCmsGOjD+Z+YLpg4AHBi+9SpwkNCDCvFdGAPMbHhc
 3OvJDJn7w5D8E33Db50AOvYDXoEpzR7bbzJN95CmdDi1iNhy2PqJp5lYgECSrWYvZN0FRv
 gGXJ3Tp6m1Vl3I90Fvle714iYVKA3PU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-wbC_-A8bOd21CL39g1RGdA-1; Fri, 18 Dec 2020 05:19:50 -0500
X-MC-Unique: wbC_-A8bOd21CL39g1RGdA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A026510054FF;
 Fri, 18 Dec 2020 10:19:49 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-84.ams2.redhat.com
 [10.36.114.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5B5D510023AB;
 Fri, 18 Dec 2020 10:19:48 +0000 (UTC)
Subject: Re: [PATCH 1/9] block/vpc: Make vpc_open() read the full dynamic
 header
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20201217162003.1102738-1-armbru@redhat.com>
 <20201217162003.1102738-2-armbru@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <c47aef12-38cd-fd21-7fdb-af3be0af1833@redhat.com>
Date: Fri, 18 Dec 2020 11:19:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201217162003.1102738-2-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: kwolf@redhat.com, mrezanin@redhat.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17.12.20 17:19, Markus Armbruster wrote:
> The dynamic header's size is 1024 bytes.
> 
> vpc_open() reads only the 512 bytes of the dynamic header into buf[].
> Works, because it doesn't actually access the second half.  However, a
> colleague told me that GCC 11 warns:
> 
>      ../block/vpc.c:358:51: error: array subscript 'struct VHDDynDiskHeader[0]' is partly outside array bounds of 'uint8_t[512]' [-Werror=array-bounds]
> 
> Clean up to read the full header.
> 
> Rename buf[] to dyndisk_header_buf[] while there.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   block/vpc.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/block/vpc.c b/block/vpc.c
> index 1ab55f9287..2fcf3f6283 100644
> --- a/block/vpc.c
> +++ b/block/vpc.c
> @@ -220,7 +220,7 @@ static int vpc_open(BlockDriverState *bs, QDict *options, int flags,
>       QemuOpts *opts = NULL;
>       Error *local_err = NULL;
>       bool use_chs;
> -    uint8_t buf[HEADER_SIZE];
> +    uint8_t dyndisk_header_buf[1024];

Perhaps this should be heap-allocated, but I don’t know whether qemu has 
ever established a (perhaps just inofficial) threshold on what goes on 
the stack and what goes on the heap.

>       uint32_t checksum;
>       uint64_t computed_size;
>       uint64_t pagetable_size;
> @@ -340,14 +340,14 @@ static int vpc_open(BlockDriverState *bs, QDict *options, int flags,
>       }
>   
>       if (disk_type == VHD_DYNAMIC) {
> -        ret = bdrv_pread(bs->file, be64_to_cpu(footer->data_offset), buf,
> -                         HEADER_SIZE);
> +        ret = bdrv_pread(bs->file, be64_to_cpu(footer->data_offset),
> +                         dyndisk_header_buf, 1024);

sizeof() would be better, but I see that’s what patch 6 is for.

>           if (ret < 0) {
>               error_setg(errp, "Error reading dynamic VHD header");
>               goto fail;
>           }
>   
> -        dyndisk_header = (VHDDynDiskHeader *) buf;
> +        dyndisk_header = (VHDDynDiskHeader *)dyndisk_header_buf;
>   
>           if (strncmp(dyndisk_header->magic, "cxsparse", 8)) {
>               error_setg(errp, "Invalid header magic");

Reviewed-by: Max Reitz <mreitz@redhat.com>


