Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D03542CB7
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 12:12:21 +0200 (CEST)
Received: from localhost ([::1]:47254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nysfk-0002c1-D3
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 06:12:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nysYh-0000UR-Lm
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 06:05:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nysYd-0003cc-Cb
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 06:05:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654682683;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L6eYomcYCuXq6IOCVLC4vU/usTjHrmkDQrL+vdk1ydg=;
 b=iTZvZHkXD3dTN2ysbaE8QI1cTmQAeRAMXyzbCYpWwX1kn0H1C9/8Y5fiaOiVrdwFNGddRA
 QjnJ/ngU8yanw3qrgeP6Z/2ECpZfODjDTphS3bWNTIIRUqEqFoLv50F7mZzKXbye9JcAq7
 1bCzZDLN7VMTQ5J0MhttUrNpGGEW7Mg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-582-ap8DTiAqPB-DLldZ4JhmxQ-1; Wed, 08 Jun 2022 06:04:42 -0400
X-MC-Unique: ap8DTiAqPB-DLldZ4JhmxQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 u12-20020a05600c19cc00b0038ec265155fso14190082wmq.6
 for <qemu-devel@nongnu.org>; Wed, 08 Jun 2022 03:04:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=L6eYomcYCuXq6IOCVLC4vU/usTjHrmkDQrL+vdk1ydg=;
 b=lvuG86Usqk4NGpfHVueb4p0Yf8vc2422OFbMxd/Fx+IXCbJLXllqwY/vv7wzUqMcDQ
 vMG7idlzRQBOs6iLAoEqBmmlE32+sbXzsPHMHx5ETV4HpEaAuHWgtt0lrFi2QFNan8wj
 HLr7N2IsxtSq+sCqxPw10hgxltUe9lh/Rxh3uRWkFjM7HBmyrQBW7IFSSv4afsc5JXDq
 ccmlooKWtKHnEP+Gf0uS8cvHUA9eRYbE56CC6ilZPluoQpZqaq3n9SY/zhvzoEwmuclL
 TqPP88gRzq3KqTkXdMydGosqCOd3bMcsTCSUdnUZgWVsbax+FE6rrkTsu1KWjJ7Ha7vS
 lEJg==
X-Gm-Message-State: AOAM533pGKGDgcGucrY3v/LX0edeOC2rL4etuSq4UKCK+ObQbZBXNAAN
 y8oaS52D7C3htaten9OOf3mT2SvWzgf7X5ZnaeelHMO7LJUq1WspXZBTw9vXARciaUc6wbf1q6h
 IMQiRy6fUcigpGkc=
X-Received: by 2002:a05:6000:2a9:b0:218:4bf5:a43 with SMTP id
 l9-20020a05600002a900b002184bf50a43mr10378109wry.154.1654682681608; 
 Wed, 08 Jun 2022 03:04:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxh3/FmKWYj8cuURvUa3U6ceZzGsUWNpNGuAjpvS7f4vynq3dTR8yke5H6MNyeH440r6ZIkRA==
X-Received: by 2002:a05:6000:2a9:b0:218:4bf5:a43 with SMTP id
 l9-20020a05600002a900b002184bf50a43mr10378071wry.154.1654682681308; 
 Wed, 08 Jun 2022 03:04:41 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5056:d40:63e3:25a7:c1a1:4455?
 ([2a02:8071:5056:d40:63e3:25a7:c1a1:4455])
 by smtp.gmail.com with ESMTPSA id
 h13-20020a5d430d000000b002130f1dfe0bsm18620028wrq.74.2022.06.08.03.04.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jun 2022 03:04:40 -0700 (PDT)
Message-ID: <f794f7f9-588a-573e-f290-4dd59d38bf96@redhat.com>
Date: Wed, 8 Jun 2022 12:04:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v5 15/45] block: refactor
 bdrv_remove_file_or_backing_child to bdrv_remove_child
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, vsementsov@openvz.org,
 v.sementsov-og@mail.ru
References: <20220330212902.590099-1-vsementsov@openvz.org>
 <20220330212902.590099-16-vsementsov@openvz.org>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220330212902.590099-16-vsementsov@openvz.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

On 30.03.22 23:28, Vladimir Sementsov-Ogievskiy wrote:
> Now the function can remove any child, so give it more common name.
> Drop assertions and drop bs argument which becomes unused. Function
> would be reused in a further commit.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
> ---
>   block.c | 22 ++++++++--------------
>   1 file changed, 8 insertions(+), 14 deletions(-)

Good!

> diff --git a/block.c b/block.c
> index 6b43e101a1..ea5687edc8 100644
> --- a/block.c
> +++ b/block.c

[...]

> -static TransactionActionDrv bdrv_remove_filter_or_cow_child_drv = {
> -    .commit = bdrv_remove_filter_or_cow_child_commit,
> +static TransactionActionDrv bdrv_remove_child_drv = {
> +    .commit = bdrv_remove_child_commit,
>   };
>   
>   /*
>    * A function to remove backing or file child of @bs.

I think it’d make sense to update this description here.

>    * Function doesn't update permissions, caller is responsible for this.
>    */
> -static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
> -                                              BdrvChild *child,
> -                                              Transaction *tran)
> +static void bdrv_remove_child(BdrvChild *child, Transaction *tran)
>   {
> -    assert(child == bs->backing || child == bs->file);
> -
>       if (!child) {
>           return;
>       }


