Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D3737187F
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 17:53:36 +0200 (CEST)
Received: from localhost ([::1]:43588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldat5-0004HV-3m
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 11:53:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1ldarX-0003Kz-2T; Mon, 03 May 2021 11:51:59 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:36035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1ldarU-0008HF-Ls; Mon, 03 May 2021 11:51:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=yPc4rN/i4Wyw1MycjGJOrqa0hD8UBWfbxTD5TZSyrHc=; 
 b=p5QtQfHXerJP03W9Jr0m1CsaDVyFVg7rA5Vg6OS39V3/M3HI8hDMh0ckOhzO9/0pBoWoYYQEEb8D7M7rqkYGGRS0QPe+7GYzgv2D8gJUoQOy5qGIhfUXfUqkRsyseCBWfPP+NSvbr3zxOQVZ/Eam+iKHP2Ez/mjzhaaLhl51t5Kw+1leGi6Uiiozm6JL6rlTxjeSkQppQM1Z7SlFq+803jXSxO6v1dKIbqR/OOgTBoGVFwgpRA/7WrA0jgN5EhRfz+EsaJ+Pucx1kUpIyhvsB+SaGYBMyyM3lzxsdbNYvy0FKa4vvzOLjvyHzZ/feQOn941IWKWvExCSXd3wFXBmxA==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1ldar7-00089y-7l; Mon, 03 May 2021 17:51:33 +0200
Received: from berto by mail.igalia.com with local (Exim)
 id 1ldar6-0008V0-Ul; Mon, 03 May 2021 17:51:32 +0200
From: Alberto Garcia <berto@igalia.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
Subject: Re: [PATCH 1/6] block: fix leak of tran in bdrv_root_attach_child
In-Reply-To: <20210503113402.185852-2-vsementsov@virtuozzo.com>
References: <20210503113402.185852-1-vsementsov@virtuozzo.com>
 <20210503113402.185852-2-vsementsov@virtuozzo.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Mon, 03 May 2021 17:51:32 +0200
Message-ID: <w51wnsfhl2z.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
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
Cc: kwolf@redhat.com, Peter Maydell <peter.maydell@linaro.org>,
 vsementsov@virtuozzo.com, qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon 03 May 2021 01:33:57 PM CEST, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> wrote:
> @@ -2918,12 +2918,18 @@ BdrvChild *bdrv_root_attach_child(BlockDriverState *child_bs,
>                                     child_role, perm, shared_perm, opaque,
>                                     &child, tran, errp);
>      if (ret < 0) {
> -        bdrv_unref(child_bs);
> -        return NULL;
> +        goto out;
>      }
>  
>      ret = bdrv_refresh_perms(child_bs, errp);
> +    if (ret < 0) {
> +        goto out;
> +    }
> +
> +out:

I see why you're doing this last error check, but it looks a bit
weird. My first reaction was to think that I was missing something.

I would remove it.

Berto

