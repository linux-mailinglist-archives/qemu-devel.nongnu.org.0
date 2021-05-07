Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D48C8376884
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 18:19:11 +0200 (CEST)
Received: from localhost ([::1]:54248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf3C2-0000fl-TI
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 12:19:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lf3Ad-0008Dp-FV
 for qemu-devel@nongnu.org; Fri, 07 May 2021 12:17:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lf3Aa-0000xR-06
 for qemu-devel@nongnu.org; Fri, 07 May 2021 12:17:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620404258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uAt1YeOQxV4jwLH/4UszC3xTWqjjiXI34at14DhvnAM=;
 b=WTXwrtKE8FBxCLL4IiOhfxCIuqPongcAgflcEZCqJp7nGmgHDhYaKDhWROpfDP2Htb9nr3
 rrY0o2RoQIioC2UjA4SQZ1r3dAVCdyfoK4FqLl8OFhCQpkochce+Hfy76uGiaIszAlALEs
 Nsa0tk2M6dsR/JbKrGgPYU4kUq46ORM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-F3hjIGbSN_y5877AXevMvg-1; Fri, 07 May 2021 12:17:36 -0400
X-MC-Unique: F3hjIGbSN_y5877AXevMvg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 70C5A8B13A6;
 Fri,  7 May 2021 16:17:35 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-35.ams2.redhat.com
 [10.36.114.35])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F8A15C234;
 Fri,  7 May 2021 16:17:33 +0000 (UTC)
Subject: Re: [PATCH 3/4] block/vvfat: Fix leak of mapping_t::path
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210430162519.271607-1-philmd@redhat.com>
 <20210430162519.271607-4-philmd@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <b81ba369-33dc-c58b-21a6-96415ebe6444@redhat.com>
Date: Fri, 7 May 2021 18:17:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210430162519.271607-4-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Johannes Schindelin <johannes.schindelin@gmx.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30.04.21 18:25, Philippe Mathieu-Daudé wrote:
> read_directory() keeps pointers to alloc'ed data in path ...:
> 
>   743 static int read_directory(BDRVVVFATState* s, int mapping_index)
>   744 {
>   ...
>   792         buffer = g_malloc(length);
>   ...
>   828         /* create mapping for this file */
>   829         if(!is_dot && !is_dotdot && (S_ISDIR(st.st_mode) || st.st_size)) {
>   830             s->current_mapping = array_get_next(&(s->mapping));
>   ...
>   847             s->current_mapping->path=buffer;
> 
> ... but these pointers are never free'd.

“Never” is not quite right, they are freed in some places: Namely in 
remove_mapping(), and in handle_renames_and_mkdirs().

Speaking of the latter, which does some commit_t handling – should those 
paths also be freed?  (i.e. the ones in commit_t, in s->commits)

> Free them in vvfat_close(),
> to fix (QEMU built with --enable-sanitizers):
> 
>    Direct leak of 148 byte(s) in 6 object(s) allocated from:
>      #0 0x55d7a363773f in malloc (qemu-system-x86_64+0x1dab73f)
>      #1 0x7f55c6447958 in g_malloc (/lib64/libglib-2.0.so.0+0x58958)
>      #2 0x55d7a5e17679 in init_directories block/vvfat.c:962:16
>      #3 0x55d7a5e1251e in vvfat_open block/vvfat.c:1255:9
>      #4 0x55d7a5a5363f in bdrv_open_driver block.c:1526:15
>      #5 0x55d7a5a9d369 in bdrv_open_common block.c:1802:11
>      #6 0x55d7a5a609f1 in bdrv_open_inherit block.c:3444:11
>      #7 0x55d7a5a65411 in bdrv_open_child_bs block.c:3079:10
>      #8 0x55d7a5a60079 in bdrv_open_inherit block.c:3391:19
>      #9 0x55d7a5a65da3 in bdrv_open block.c:3537:12
>      #10 0x55d7a5b33f6a in blk_new_open block/block-backend.c:421:10
>      #11 0x55d7a5a0a33e in blockdev_init blockdev.c:610:15
>      #12 0x55d7a5a088e7 in drive_new blockdev.c:994:11
>      #13 0x55d7a51b10c4 in drive_init_func softmmu/vl.c:636:12
>      #14 0x55d7a620e148 in qemu_opts_foreach util/qemu-option.c:1167:14
>      #15 0x55d7a51b0e20 in configure_blockdev softmmu/vl.c:695:9
>      #16 0x55d7a51a70b5 in qemu_create_early_backends softmmu/vl.c:1895:5
>      #17 0x55d7a519bf87 in qemu_init softmmu/vl.c:3551:5
>      #18 0x55d7a366f619 in main softmmu/main.c:49:5
> 
> Fixes: a046433a161 ("Major overhaul of the virtual FAT driver for read/write support")
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   block/vvfat.c | 5 +++++
>   1 file changed, 5 insertions(+)

First:

Reviewed-by: Max Reitz <mreitz@redhat.com>

Second:

In commit_mappings(), there is this line:

next_mapping->path = mapping->path;

That looks strange.  Should that be a g_strdup(), or am I missing the 
place where only one of them can really exist?

But, well, all of the vvfat code is just strange to me.

> diff --git a/block/vvfat.c b/block/vvfat.c
> index 2cc21787600..c193a816646 100644
> --- a/block/vvfat.c
> +++ b/block/vvfat.c
> @@ -3228,6 +3228,11 @@ static void vvfat_close(BlockDriverState *bs)
>   {
>       BDRVVVFATState *s = bs->opaque;
>   
> +    for (unsigned j = 0; j < s->mapping.next; j++) {
> +        mapping_t *mapping = array_get(&(s->mapping), j);
> +
> +        g_free(mapping->path);
> +    }
>       vvfat_close_current_file(s);
>       array_free(&(s->fat));
>       array_free(&(s->directory));
> 


