Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1582F3512E1
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 11:59:41 +0200 (CEST)
Received: from localhost ([::1]:57996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRu71-0002tP-IU
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 05:59:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lRu5Y-00024X-1I
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 05:58:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lRu5P-0002EJ-Cw
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 05:58:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617271076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OtYJ4q20+YoLhPOPUkziAI00Hckj8GMwNsXHnrmSoqo=;
 b=MYyP+oHCroVnOYk/0FoFc0fop2z8TsZGLI9hxwzoIWiHKInxbcPF/9QoalSxdI/j/guc4w
 5u8zMIUAn6QmImYZipdchOQ1JT3zAra5nJtq7w60l53npw49gmwWg9TSF+Iyq6bHJEZ2+D
 G6Rlqwdl3xWDBhw68R9nWBHTbiJKmgQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-d8406JvLMDONoR3kFlXIVA-1; Thu, 01 Apr 2021 05:57:55 -0400
X-MC-Unique: d8406JvLMDONoR3kFlXIVA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E43881853026;
 Thu,  1 Apr 2021 09:57:53 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-60.ams2.redhat.com
 [10.36.114.60])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7293A10023AC;
 Thu,  1 Apr 2021 09:57:49 +0000 (UTC)
Subject: Re: [RFC PATCH] block: always update auto_backing_file to full path
To: Joe Jin <joe.jin@oracle.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
References: <ce32e1c2-c652-e83b-a6f4-c9773099cf9a@oracle.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <237ac4ab-6210-832a-7068-7f2a2c90594d@redhat.com>
Date: Thu, 1 Apr 2021 11:57:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <ce32e1c2-c652-e83b-a6f4-c9773099cf9a@oracle.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01.04.21 06:22, Joe Jin wrote:
> Some time after created snapshot, auto_backing_file only has filename,
> this confused overridden check, update it to full path if it is not.
> 
> Signed-off-by: Joe Jin <joe.jin@oracle.com>
> ---
>   block.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)

Do you have a test for this?

The thing is, I’m not sure about this solution, and I think having a 
test would help me understand better.
bs->auto_backing_file is meant to track what filename a BDS would have 
if we opened bs->backing_file.  To this end, we generally set it to 
whatever bs->backing_file is and then refresh it when we actually do 
open a BDS from it.

So it seems strange to blindly modify it somewhere that doesn’t have to 
do with any of these things.

Now, when opening a backing file from bs->backing_file, we first do make 
it an absolute filename via bdrv_get_full_backing_filename().  So it 
kind of seems prudent to replicate that elsewhere, but I’m not sure 
where exactly.  I would think the best place would be whenever 
auto_backing_file is set to be equal to backing_file (which is generally 
in the image format drivers, when they read the backing file string from 
the image metadata), but that might break the strcmp() in 
bdrv_open_backing_file()...

I don’t think bdrv_refresh_filename() is the right place, though, 
because I’m afraid that this might modify filenames we’ve already 
retrieved from the actual backing BDS, or something.

For example, with this patch applied, iotest 024 fails.

> diff --git a/block.c b/block.c
> index c5b887cec1..8f9a027dee 100644
> --- a/block.c
> +++ b/block.c
> @@ -6969,6 +6969,19 @@ void bdrv_refresh_filename(BlockDriverState *bs)
>           return;
>       }
>   
> +    /* auto_backing_file only has filename, update it to the full path */
> +    if (bs->backing && bs->auto_backing_file[0] != '/') {
> +        char *backing_filename = NULL;
> +        Error *local_err = NULL;
> +
> +        backing_filename = bdrv_make_absolute_filename(bs,
> +                                     bs->auto_backing_file, &local_err);
> +        if (!local_err && backing_filename) {
> +            pstrcpy(bs->auto_backing_file, sizeof(bs->auto_backing_file),
> +                     backing_filename);
> +            g_free(backing_filename);
> +        }
> +    }

All spaces here are 0xa0 (non-breaking space), which is kind of broken 
and makes it difficult to apply this patch.

Furthermore, if local_err != NULL, we’d need to free it.

Max

>       backing_overridden = bdrv_backing_overridden(bs);
>   
>       if (bs->open_flags & BDRV_O_NO_IO) {
> 


