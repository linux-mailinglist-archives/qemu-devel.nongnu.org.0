Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BB0372E83
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 19:11:31 +0200 (CEST)
Received: from localhost ([::1]:36058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldya1-00041Z-L3
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 13:11:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ktkhai@virtuozzo.com>)
 id 1ldyNX-0005UZ-2K; Tue, 04 May 2021 12:58:35 -0400
Received: from relay.sw.ru ([185.231.240.75]:34814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ktkhai@virtuozzo.com>)
 id 1ldyNT-000877-Mb; Tue, 04 May 2021 12:58:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=virtuozzo.com; s=relay; h=Content-Type:MIME-Version:Date:Message-ID:From:
 Subject; bh=wNDbrrSqn+6Dl54mvJOQCCgiodLUlPlMlbCVJHB6frE=; b=b9v14rhrKfDMy22Po
 +isr0SimuUpgOvOgaomJxobtW7Z4KIKi8AFNYj0n0d3+UrtVlYA5bOI1mwBeR9UM5MgjNx51ysllp
 Cazvauza6OrfQCGnSVQ9/pJjDJB9TagEvU4Wh4ULT7Gaq4Y4cy+SVE3i5SJHvf0hCKX0UFb7hhf+k
 =;
Received: from [192.168.15.213] by relay.sw.ru with esmtp (Exim 4.94)
 (envelope-from <ktkhai@virtuozzo.com>)
 id 1ldyNL-001shW-N2; Tue, 04 May 2021 19:58:23 +0300
Subject: Re: [PATCH] qcow2: set bdi->is_dirty
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com, den@openvz.org
References: <20210504160656.462836-1-vsementsov@virtuozzo.com>
From: Kirill Tkhai <ktkhai@virtuozzo.com>
Message-ID: <11eda246-ff49-010e-8a21-6ec0f9860746@virtuozzo.com>
Date: Tue, 4 May 2021 19:58:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210504160656.462836-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=185.231.240.75; envelope-from=ktkhai@virtuozzo.com;
 helo=relay.sw.ru
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 04 May 2021 13:02:31 -0400
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04.05.2021 19:06, Vladimir Sementsov-Ogievskiy wrote:
> Set bdi->is_dirty, so that qemu-img info could show dirty flag.
> 
> After this commit the following check will show '"dirty-flag": true':
> 
> ./build/qemu-img create -f qcow2 -o lazy_refcounts=on x 1M
> ./build/qemu-io x
> qemu-io> write 0 1M
> 
>  After "write" command success, kill the qemu-io process:
> 
> kill -9 <qemu-io pid>
> 
> ./build/qemu-img info --output=json x
> 
> This will show '"dirty-flag": true' among other things. (before this
> commit it shows '"dirty-flag": false')
> 
> Note, that qcow2's dirty-bit is not a "dirty bit for the image". It
> only protects qcow2 lazy refcounts feature. So, there are a lot of
> conditions when qcow2 session may be not closed correctly, but bit is
> 0. Still, when bit is set, the last session is definitely not finished
> correctly and it's better to report it.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Works for me. Thanks,

Tested-by: Kirill Tkhai <ktkhai@virtuozzo.com>

> ---
>  block/qcow2.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/block/qcow2.c b/block/qcow2.c
> index 9727ae8fe3..39b91ef940 100644
> --- a/block/qcow2.c
> +++ b/block/qcow2.c
> @@ -5089,6 +5089,7 @@ static int qcow2_get_info(BlockDriverState *bs, BlockDriverInfo *bdi)
>      BDRVQcow2State *s = bs->opaque;
>      bdi->cluster_size = s->cluster_size;
>      bdi->vm_state_offset = qcow2_vm_state_offset(s);
> +    bdi->is_dirty = s->incompatible_features & QCOW2_INCOMPAT_DIRTY;
>      return 0;
>  }
>  
> 


