Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD892F2772
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 05:59:41 +0100 (CET)
Received: from localhost ([::1]:47174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzBmO-0001Hb-3B
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 23:59:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kzBgh-0002Oc-Sb
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 23:53:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40248)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kzBga-0002BD-Qw
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 23:53:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610427218;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4v4gfo/iXLcxcR+oWZx5a1MRJB45fENiDxyBusdXbv0=;
 b=OfJHXbtHWwMK8DbPSvnur+/9i8ad0lc2EXZRC6DlPvoZQAniOJrVLntbAcEmtY96ngu7DD
 R/dOfZZj0dEzqX+fNm8eVsncxEM4wbWwwrSjHykd6WdZxCVRqAc9frx6BKYB1FL1BD/qrK
 ykUd3KCGBY9BNpilLGYu0cQCex9sRAE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-9HQJPuXDO0KPUwnlwWGUqQ-1; Mon, 11 Jan 2021 23:53:36 -0500
X-MC-Unique: 9HQJPuXDO0KPUwnlwWGUqQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 092C01005D44;
 Tue, 12 Jan 2021 04:53:34 +0000 (UTC)
Received: from [10.72.13.2] (ovpn-13-2.pek2.redhat.com [10.72.13.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9BBD619D9F;
 Tue, 12 Jan 2021 04:53:32 +0000 (UTC)
Subject: Re: [PATCH 5/5] net/tap: net_init_tap_one(): fix net-client leak on
 failure path
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org
References: <20201221190609.93768-1-vsementsov@virtuozzo.com>
 <20201221190609.93768-6-vsementsov@virtuozzo.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <3c1f4d68-c0e9-4ecc-fede-e575e77be8e3@redhat.com>
Date: Tue, 12 Jan 2021 12:53:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201221190609.93768-6-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2020/12/22 上午3:06, Vladimir Sementsov-Ogievskiy wrote:
> net_tap_fd_init() allocates new NetClientState through
> qemu_new_net_client(). We should free it on failure path.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>
> Attention: it's an intuitive patch.
>
> I see, that net-client is leaked. May be it's still freed some tricky
> way? And I don't understand the whole logic of qemu_del_net_client(),
> it's just the only public interface to free net-client I found.


Your patch looks correct and it's indeed a leak.

I wonder whether it's better to do the cleanup in the free_fail label in 
net_init_tap(). The reason is that we need deal with case of multiqueue. 
Though qemu_del_net_client() can handle this but it's not clear if we do 
it in net_init_tap_one().

Thanks


>
>   net/tap.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/net/tap.c b/net/tap.c
> index 89ea04862b..ba4c34af3d 100644
> --- a/net/tap.c
> +++ b/net/tap.c
> @@ -711,7 +711,7 @@ static void net_init_tap_one(const NetdevTapOptions *tap, NetClientState *peer,
>   
>       ret = tap_set_sndbuf(s->fd, tap, errp);
>       if (ret < 0) {
> -        return;
> +        goto fail;
>       }
>   
>       if (tap->has_fd || tap->has_fds) {
> @@ -739,13 +739,20 @@ static void net_init_tap_one(const NetdevTapOptions *tap, NetClientState *peer,
>           if (ret < 0) {
>               if (tap->has_vhostforce && tap->vhostforce) {
>                   error_propagate(errp, err);
> +                goto fail;
>               } else {
>                   warn_report_err(err);
>               }
>           }
>       } else if (vhostfdname) {
>           error_setg(errp, "vhostfd(s)= is not valid without vhost");
> +        goto fail;
>       }
> +
> +    return;
> +
> +fail:
> +    qemu_del_net_client(&s->nc);
>   }
>   
>   static int get_fds(char *str, char *fds[], int max)


