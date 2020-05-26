Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A202A1D31D5
	for <lists+qemu-devel@lfdr.de>; Thu, 14 May 2020 15:53:25 +0200 (CEST)
Received: from localhost ([::1]:39642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZEIe-0002qz-NJ
	for lists+qemu-devel@lfdr.de; Thu, 14 May 2020 09:53:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <s.reiter@proxmox.com>)
 id 1jZEHX-0001eu-6e; Thu, 14 May 2020 09:52:15 -0400
Received: from proxmox-new.maurer-it.com ([212.186.127.180]:46985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <s.reiter@proxmox.com>)
 id 1jZEHV-00073d-R7; Thu, 14 May 2020 09:52:14 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 0870242DF3;
 Thu, 14 May 2020 15:52:04 +0200 (CEST)
Subject: Re: [RFC PATCH 3/3] block: Assert we're running in the right thread
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20200512144318.181049-1-kwolf@redhat.com>
 <20200512144318.181049-4-kwolf@redhat.com>
From: Stefan Reiter <s.reiter@proxmox.com>
Message-ID: <4d2d9ecd-b921-c9e8-2eb4-066e092e6c1f@proxmox.com>
Date: Thu, 14 May 2020 15:52:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200512144318.181049-4-kwolf@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=212.186.127.180;
 envelope-from=s.reiter@proxmox.com; helo=proxmox-new.maurer-it.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/14 09:21:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-devel@nongnu.org, t.lamprecht@proxmox.com, armbru@redhat.com,
 stefanha@redhat.com, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/12/20 4:43 PM, Kevin Wolf wrote:
> tracked_request_begin() is called for most I/O operations, so it's a
> good place to assert that we're indeed running in the home thread of the
> node's AioContext.
> 

Is this patch supposed to be always correct or only together with nr. 2?

I changed our code to call bdrv_flush_all from the main AIO context and 
it certainly works just fine (even without this series, so I suppose 
that would be the 'correct' way to fix it you mention on the cover), 
though of course it trips this assert without patch 2.

> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>   block/io.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/block/io.c b/block/io.c
> index 7808e8bdc0..924bf5ba46 100644
> --- a/block/io.c
> +++ b/block/io.c
> @@ -695,14 +695,17 @@ static void tracked_request_begin(BdrvTrackedRequest *req,
>                                     uint64_t bytes,
>                                     enum BdrvTrackedRequestType type)
>   {
> +    Coroutine *self = qemu_coroutine_self();
> +
>       assert(bytes <= INT64_MAX && offset <= INT64_MAX - bytes);
> +    assert(bs->aio_context == qemu_coroutine_get_aio_context(self));
>   
>       *req = (BdrvTrackedRequest){
>           .bs = bs,
>           .offset         = offset,
>           .bytes          = bytes,
>           .type           = type,
> -        .co             = qemu_coroutine_self(),
> +        .co             = self,
>           .serialising    = false,
>           .overlap_offset = offset,
>           .overlap_bytes  = bytes,
> 


