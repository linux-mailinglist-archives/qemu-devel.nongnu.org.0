Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D76222D7A82
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 17:09:36 +0100 (CET)
Received: from localhost ([::1]:36492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knkz9-0000zk-Qk
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 11:09:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1knkvM-0005Zr-5f
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 11:05:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1knkvI-0003pZ-Kx
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 11:05:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607702734;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ce0XtyYkNCrwjkyRDrPUslTPGVxloaE5LpvpJKju7J0=;
 b=Ds3aBRXZKrDsJGsym92rGsOlZaF66siHalD1+Xy+j4hVWikDZemn6fjl8j5iYNmiQMouNF
 dKxCJYQfo7vcnB7XSTBM4/05qp6TszrjeMszXhcW0usrtDSIAdDX4Kenr3ha5tOy5YzLwA
 pQVVor9U+6ZdgR8nqwmRl5RmDmJR30Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-560-8MTjgAmEMiqf99iJHa7SmQ-1; Fri, 11 Dec 2020 11:05:29 -0500
X-MC-Unique: 8MTjgAmEMiqf99iJHa7SmQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5B0011823DD4;
 Fri, 11 Dec 2020 16:05:16 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-112-98.ams2.redhat.com
 [10.36.112.98])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 076E160BE5;
 Fri, 11 Dec 2020 16:05:10 +0000 (UTC)
Subject: Re: [PATCH v14 10/13] qapi: block-stream: add "bottom" argument
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20201204220758.2879-1-vsementsov@virtuozzo.com>
 <20201204220758.2879-11-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <79993af7-1993-5af1-d343-04f208b03d73@redhat.com>
Date: Fri, 11 Dec 2020 17:05:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201204220758.2879-11-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com,
 stefanha@redhat.com, andrey.shinkevich@virtuozzo.com, den@openvz.org,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04.12.20 23:07, Vladimir Sementsov-Ogievskiy wrote:
> The code already don't freeze base node and we try to make it prepared
> for the situation when base node is changed during the operation. In
> other words, block-stream doesn't own base node.
> 
> Let's introduce a new interface which should replace the current one,
> which will in better relations with the code. Specifying bottom node
> instead of base, and requiring it to be non-filter gives us the
> following benefits:
> 
>   - drop difference between above_base and base_overlay, which will be
>     renamed to just bottom, when old interface dropped
> 
>   - clean way to work with parallel streams/commits on the same backing
>     chain, which otherwise become a problem when we introduce a filter
>     for stream job
> 
>   - cleaner interface. Nobody will surprised the fact that base node may
>     disappear during block-stream, when there is no word about "base" in
>     the interface.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   qapi/block-core.json           |  8 +++--
>   include/block/block_int.h      |  1 +
>   block/monitor/block-hmp-cmds.c |  3 +-
>   block/stream.c                 | 50 +++++++++++++++++++---------
>   blockdev.c                     | 61 ++++++++++++++++++++++++++++------
>   5 files changed, 94 insertions(+), 29 deletions(-)
> 
> diff --git a/qapi/block-core.json b/qapi/block-core.json
> index 04055ef50c..5d6681a35d 100644
> --- a/qapi/block-core.json
> +++ b/qapi/block-core.json
> @@ -2522,6 +2522,10 @@
>   # @base-node: the node name of the backing file.
>   #             It cannot be set if @base is also set. (Since 2.8)
>   #
> +# @bottom: the last node in the chain that should be streamed into
> +#          top. It cannot be set any of @base, @base-node or @backing-file

s/set any/set if any/

But what’s the problem with backing-file?  The fact that specifying 
backing-file means that stream will look for that filename in the 
backing chain when the job is done (so if you use @bottom, we generally 
don’t want to rely on the presence of any nodes below it)?

(If so, I would have thought that we actually want the user to specify 
backing-file so we don’t have to look down below @bottom to look for a 
filename.  Perhaps a @backing-fmt parameter would help.)

[...]

> diff --git a/blockdev.c b/blockdev.c
> index 70900f4f77..e0e19db88b 100644
> --- a/blockdev.c
> +++ b/blockdev.c

[...]

> @@ -2551,8 +2567,33 @@ void qmp_block_stream(bool has_job_id, const char *job_id, const char *device,
>           bdrv_refresh_filename(base_bs);
>       }
>   
> -    /* Check for op blockers in the whole chain between bs and base */
> -    for (iter = bs; iter && iter != base_bs;
> +    if (has_bottom) {
> +        bottom_bs = bdrv_lookup_bs(NULL, bottom, errp);
> +        if (!bottom_bs) {
> +            goto out;
> +        }
> +        if (!bottom_bs->drv) {
> +            error_setg(errp, "Node '%s' is not open", bottom);
> +            goto out;
> +        }
> +        if (bottom_bs->drv->is_filter) {
> +            error_setg(errp, "Node '%s' is filter, use non-filter node"
> +                       "as 'bottom'", bottom);

Missing a space between “node” and “as”.  (Also, probably two articles, 
i.e. “Node '%s' is a filter, use a non-filter node...”.)

The rest looks good to me, but I’m withholding my R-b because I haven’t 
understood why using @bottom precludes giving @backing-file.

Max


