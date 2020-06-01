Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B771EA204
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Jun 2020 12:40:32 +0200 (CEST)
Received: from localhost ([::1]:42650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jfhrq-0003lP-Tt
	for lists+qemu-devel@lfdr.de; Mon, 01 Jun 2020 06:40:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>) id 1jfhqd-0003Bz-69
 for qemu-devel@nongnu.org; Mon, 01 Jun 2020 06:39:15 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:52196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>) id 1jfhqZ-0003zu-IW
 for qemu-devel@nongnu.org; Mon, 01 Jun 2020 06:39:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=mYCZydrMv1/WP7UppoKWXJsNG7S2kPka0AV9INxFnsU=; 
 b=ptdVFYzbvd8mjZopLBaGQfew4lK3xiHd3SZIAun8JlTNYN9lsEtYPGmr7aSq74RdGIz6tLIkFZiFF7I5y2WLn6XQJM9Mq5Y1dMSNp3IU9X+tkPGEGGzUDiu9NFf1BS1cvaHgwwXuZP0WC8SoLpACP/JMFb7waRm0FzHDpAxmKFmi8EO+bMwdU0fUKsuCTCurHQNGSitDoprZR/5T1IoC9TcIu3imQ1sYdRI15yQ46K1PR9jw3vbe69BYJeNJfkkVsTcrG4E8usorKR/J7Or97UvqUlhO7bVsOxxI6XU6VJChQpDd3LSuKNFBsyfPaggMPm+8XXuW2CeWCkWvznACyA==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1jfhpw-0002kO-BG; Mon, 01 Jun 2020 12:38:32 +0200
Received: from berto by mail.igalia.com with local (Exim)
 id 1jfhpw-0005RZ-1h; Mon, 01 Jun 2020 12:38:32 +0200
From: Alberto Garcia <berto@igalia.com>
To: Zhang Chen <chen.zhang@intel.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, qemu-dev <qemu-devel@nongnu.org>
Subject: Re: [PATCH] block/quorum.c: Decrease child index when del_child
In-Reply-To: <20200601071956.18006-1-chen.zhang@intel.com>
References: <20200601071956.18006-1-chen.zhang@intel.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Mon, 01 Jun 2020 12:38:32 +0200
Message-ID: <w515zcbm5p3.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/01 06:38:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Jason Wang <jasowang@redhat.com>, Zhang Chen <chen.zhang@intel.com>,
 Zhanghailiang <zhang.zhanghailiang@huawei.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Zhang Chen <zhangckid@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon 01 Jun 2020 09:19:56 AM CEST, Zhang Chen wrote:
> From: Zhang Chen <chen.zhang@intel.com>
>
> Fix this bug:
> colo: Can not recover colo after svm failover twice
> https://bugs.launchpad.net/bugs/1881231
>
> The child index still be hold when it be deleted, the max num is 32.
>
> Reported-by: Ye.Zou <ye.zou@zstack.io>
> Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> ---
>  block/quorum.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/block/quorum.c b/block/quorum.c
> index 7cf7ab1546..f71bd4e19d 100644
> --- a/block/quorum.c
> +++ b/block/quorum.c
> @@ -1099,6 +1099,7 @@ static void quorum_del_child(BlockDriverState *bs, BdrvChild *child,
>              (s->num_children - i - 1) * sizeof(BdrvChild *));
>      s->children = g_renew(BdrvChild *, s->children, --s->num_children);
>      bdrv_unref_child(bs, child);
> +    s->next_child_index--;
>  
>      bdrv_drained_end(bs);
>  }

As I explained a few weeks ago this patch is not correct.
quorum_del_child() allows you to remove any child from the Quorum
device, so nothing guarantees that next_child_index-1 is free.

https://lists.gnu.org/archive/html/qemu-block/2020-05/msg00634.html

Berto

