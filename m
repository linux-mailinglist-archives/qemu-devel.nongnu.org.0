Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A3C2A9857
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Nov 2020 16:16:06 +0100 (CET)
Received: from localhost ([::1]:56996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kb3TC-0006jn-1B
	for lists+qemu-devel@lfdr.de; Fri, 06 Nov 2020 10:16:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kb3RX-0005kp-KU; Fri, 06 Nov 2020 10:14:23 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:49854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kb3RV-0004KV-VN; Fri, 06 Nov 2020 10:14:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=Lz5ejR9eqdoxiqJ8a5+P+Hxlu6FXXSJgOuGPrNoSBa0=; 
 b=E1Zeofq51IMklJ6V7wy2r8xV3ncA2ZIeSs0UnIpOgY1y5RWOGgv1NRI/2/tQ+g7vt2xv3FHAlSll23WeZ0Ky5RMBuyn3467aQ3A4jrpvn08xQNNXyZftnUMwJK15DnVGAIam4L7yIx3AaJJmhy5mrpdv8hQHkj0dVKK/JJ0sWBJE9FmTztxOFsGSaqICC6Tm1bUAv21P+y0zYtDqiKQyTmy0GZCF27uRooXYLpAPknqfd0cnSQcSGeV2JiFDnmEyyT2yyGmOOCKjmI9nzKlbIWjVNCllEjNGvlI6qr97wwcODHHpUboAu63TpFGRkG0IhOVE9yfANaGJz0L0IW70pw==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1kb3RT-0002cM-29; Fri, 06 Nov 2020 16:14:19 +0100
Received: from berto by mail.igalia.com with local (Exim)
 id 1kb3RS-0000Ia-Ow; Fri, 06 Nov 2020 16:14:18 +0100
From: Alberto Garcia <berto@igalia.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
Subject: Re: [PATCH v2 4/7] block: add bdrv_refresh_perms() helper
In-Reply-To: <20201106124241.16950-5-vsementsov@virtuozzo.com>
References: <20201106124241.16950-1-vsementsov@virtuozzo.com>
 <20201106124241.16950-5-vsementsov@virtuozzo.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Fri, 06 Nov 2020 16:14:18 +0100
Message-ID: <w51zh3u8qlx.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/06 10:12:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, den@openvz.org, vsementsov@virtuozzo.com,
 qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri 06 Nov 2020 01:42:38 PM CET, Vladimir Sementsov-Ogievskiy wrote:
> Make separate function for common pattern.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  block.c | 60 ++++++++++++++++++++++++++++-----------------------------
>  1 file changed, 30 insertions(+), 30 deletions(-)
>
> diff --git a/block.c b/block.c
> index 77a3f8f1e2..fc7633307f 100644
> --- a/block.c
> +++ b/block.c
> @@ -2321,6 +2321,23 @@ static void bdrv_child_abort_perm_update(BdrvChild *c)
>      bdrv_abort_perm_update(c->bs);
>  }
>  
> +static int bdrv_refresh_perms(BlockDriverState *bs, bool *tighten_restrictions,
> +                              Error **errp)
> +{
> +    int ret;
> +    uint64_t perm, shared_perm;
> +
> +    bdrv_get_cumulative_perm(bs, &perm, &shared_perm);
> +    ret = bdrv_check_perm(bs, NULL, perm, shared_perm, NULL, NULL,
> errp);

Aren't you supposed to pass tighten_restrictions here ?

Berto

