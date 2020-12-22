Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FF32E0D14
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Dec 2020 17:09:11 +0100 (CET)
Received: from localhost ([::1]:34132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krkDm-0004ju-NA
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 11:09:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1krkCE-0003d8-Fo
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 11:07:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1krkCC-0000aM-4b
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 11:07:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608653251;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tr0RF5mNK3Z7XmBCMZCf7xz6qy3jLZC7WGPVXd2VIdU=;
 b=S9kQx+Y3NMFMRL2HxX9iS3+YLg9NQxftJi155lgjB+5qzR72Q27cT/Lgo1B4oGvEJ2nnJx
 6ytOkAEW41TruyMetwyIxQezg+W8y6bgMq+NfceIR8pEW0oU26os59HGDk1l9bHFutgZ1M
 50vinS5s5YCEmQGzzmMFSjfQalCRYlc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-V_3a2XQnNzebM20Bz_sraQ-1; Tue, 22 Dec 2020 11:07:27 -0500
X-MC-Unique: V_3a2XQnNzebM20Bz_sraQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB0E8800D53;
 Tue, 22 Dec 2020 16:07:25 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-113-243.ams2.redhat.com
 [10.36.113.243])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E1D5779CD;
 Tue, 22 Dec 2020 16:07:20 +0000 (UTC)
Subject: Re: [PATCH v15 10/13] qapi: block-stream: add "bottom" argument
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20201216061703.70908-1-vsementsov@virtuozzo.com>
 <20201216061703.70908-11-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <d7d127a1-e70b-4e1f-acc8-eaf9230dd70a@redhat.com>
Date: Tue, 22 Dec 2020 17:07:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201216061703.70908-11-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.521, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
 stefanha@redhat.com, den@openvz.org, andrey.shinkevich@virtuozzo.com,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16.12.20 07:17, Vladimir Sementsov-Ogievskiy wrote:
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
>   qapi/block-core.json           | 12 ++++---
>   include/block/block_int.h      |  1 +
>   block/monitor/block-hmp-cmds.c |  3 +-
>   block/stream.c                 | 50 +++++++++++++++++++---------
>   blockdev.c                     | 59 ++++++++++++++++++++++++++++------
>   5 files changed, 94 insertions(+), 31 deletions(-)
> 
> diff --git a/qapi/block-core.json b/qapi/block-core.json
> index b8094a5ec7..cb0066fd5c 100644
> --- a/qapi/block-core.json
> +++ b/qapi/block-core.json
> @@ -2517,10 +2517,14 @@
>   # @device: the device or node name of the top image
>   #
>   # @base: the common backing file name.
> -#        It cannot be set if @base-node is also set.
> +#        It cannot be set if @base-node or @bottom is also set.
>   #
>   # @base-node: the node name of the backing file.
> -#             It cannot be set if @base is also set. (Since 2.8)
> +#             It cannot be set if @base or @bottom is also set. (Since 2.8)
> +#
> +# @bottom: the last node in the chain that should be streamed into
> +#          top. It cannot be set if @base or @base-node is also set.
> +#          It cannot be filter node. (Since 6.0)

As far as I can make out, one of the results of our discussion on v14 
was that when using backing-file + bottom, we want to require the user 
to specify backing-fmt as well.  Now, backing-fmt isn’t present yet. 
Doesn’t that mean we have to make bottom + backing-file an error until 
we have backing-fmt (like it was in v14)?

Or do you consider the change to patch 9 sufficient to make at least the 
case work for which backing-file was purportedly introduced, i.e. FD 
passing?  (Patch 9’s new version will just take the format of the base 
post-streaming, which would be most likely a correct guess when using FD 
passing.)

(I.e., now with patch 9 being more liberal in guessing, perhaps you 
decided to no longer make backing-fmt mandatory after all.)

Max


