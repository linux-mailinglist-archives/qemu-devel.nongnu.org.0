Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 881D85BE971
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 16:58:34 +0200 (CEST)
Received: from localhost ([::1]:42426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaehk-0004l7-P0
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 10:58:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oacO3-00028O-7q
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 08:30:03 -0400
Received: from forwardcorp1p.mail.yandex.net
 ([2a02:6b8:0:1472:2741:0:8b6:217]:41722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oacNz-00020a-5w
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 08:30:02 -0400
Received: from vla5-b2806cb321eb.qloud-c.yandex.net
 (vla5-b2806cb321eb.qloud-c.yandex.net
 [IPv6:2a02:6b8:c18:3e0d:0:640:b280:6cb3])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id C0DBC2E12AE;
 Tue, 20 Sep 2022 15:29:49 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b65b::1:34] (unknown
 [2a02:6b8:b081:b65b::1:34])
 by vla5-b2806cb321eb.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 wzzdq9Lqbi-TmOevJ5H; Tue, 20 Sep 2022 15:29:49 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1663676989; bh=7SmIZK8VbRI/I/EAQ6ASLRcWnhexf9RybatksTI1IRQ=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=Adhu1I4tTunnTaBL7turqt1xgqs4EDviOn1C+xe46lstZyfKXaCORfBZ/PIVKjaq3
 0SegbtrqQ1Jy+bV9a8RE4dFI8vlsikB2mtXQGX0R99emJUqvtU4Yg35YrrqF9H3BfH
 1VtOd77YgDO+qz5yMnEvTpSJeBeNLTvOnr/Poroo=
Authentication-Results: vla5-b2806cb321eb.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <e6b06e85-d073-aa74-c285-a08e66ed1040@yandex-team.ru>
Date: Tue, 20 Sep 2022 15:29:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] This patch is to solve the problem that the bitmap file
 in memory is lost after creating a snapshot
Content-Language: en-US
To: Hongleilee <281773481@qq.com>, qemu-devel@nongnu.org
Cc: kwolf@redhat.com, eesposit@redhat.com, hreitz@redhat.com,
 vsementsov@virtuozzo.com, laurent@vivier.eu,
 =?UTF-8?B?SG9uZ2xlaWxpIExpICjmnY7nuqLno4opLeS6keaVsOaNruS4reW/g+mbhuWbog==?=
 <lihonglei03@inspur.com>, John Snow <jsnow@redhat.com>,
 Eric Blake <eblake@redhat.com>
References: <tencent_647D077359960B50AA4B806516042ABCC508@qq.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <tencent_647D077359960B50AA4B806516042ABCC508@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:0:1472:2741:0:8b6:217;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.182,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

[Cc Eric and John]

On 9/20/22 05:47, Hongleilee wrote:
> From: Hongleili Li (李红磊)-云数据中心集团 <lihonglei03@inspur.com>
> 
> Signed-off-by: Hongleili Li (李红磊)-云数据中心集团 <lihonglei03@inspur.com>
> ---
>   blockdev.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/blockdev.c b/blockdev.c
> index 9230888e34..a6b85d06b7 100644
> --- a/blockdev.c
> +++ b/blockdev.c
> @@ -1534,6 +1534,10 @@ static void external_snapshot_prepare(BlkActionState *common,
>   
>       state->new_bs = bdrv_open(new_image_file, snapshot_ref, options, flags,
>                                 errp);
> +
> +    state->new_bs->dirty_bitmaps = state->old_bs->dirty_bitmaps;
> +    QLIST_INIT(&state->old_bs->dirty_bitmaps);
> +
>       /* We will manually add the backing_hd field to the bs later */
>       if (!state->new_bs) {
>           goto out;

Hi Hongleili Li!

I understand your problem, but we can't change the behavior in that manner, as it will break existing users.

Qemu don't move bitmaps to the new node automatically. Instead we have Bitmap API: to move the bitmap from node A to node B, you need three QMP commands:

block-dirty-bitmap-add {node: B, name: bitmap0}
block-dirty-bitmap-merge {node: B, target: bitmap0, bitmaps: [{node: A, name: bitmap0}]}
block-dirty-bitmap-remove {node: A, name: bitmap0}

(and you may run them in a QMP transaction, even together with blockdev-snapshot)

Will it work for you?

-- 
Best regards,
Vladimir

