Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE3F275D61
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Sep 2020 18:26:58 +0200 (CEST)
Received: from localhost ([::1]:56872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kL7bc-00045I-Ug
	for lists+qemu-devel@lfdr.de; Wed, 23 Sep 2020 12:26:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kL7Tp-0004Qm-2J; Wed, 23 Sep 2020 12:18:53 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:38923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kL7Tl-00083W-TE; Wed, 23 Sep 2020 12:18:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=Sg+Sh+IRPQ5ub7D+DLJ/SQyW/FOzogwPpsqq9jchkl0=; 
 b=KUx7BYA5YW3FWoBm6ZWJcBnvXnzGB+e5MmYSXXgsyYHWZ91VmAcKszENgSML88CigvGB/2mCIt+nuO8WhnaBSe/FxnfhrgKNgiOQL+ggtYVRMzrxKxSHf0FzFXMSig5o7tAi86LN4G3w1+6u5MTE6vG8MxUhndsb5nNWFj8lHvPkmBF76gGLaCNs0mH49DiIzFIiZMD84XWbb+oY3kXrTe7WKeZiSps7kVhxGwOBTPLmHcA+kB6Yo/xd4FW7nf7HEJflzele2LujhHk4s9QXEOmBoFQW/iB0PAsS72BZ/WUXIL93NsP5BCZdoebz25o8WNg7YuTx2xCPzISHlvghaA==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1kL7Tf-0001Jb-B7; Wed, 23 Sep 2020 18:18:43 +0200
Received: from berto by mail.igalia.com with local (Exim)
 id 1kL7Tf-0005hZ-0n; Wed, 23 Sep 2020 18:18:43 +0200
From: Alberto Garcia <berto@igalia.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
Subject: Re: [PATCH v6 2/5] block/io: bdrv_common_block_status_above: support
 include_base
In-Reply-To: <20200916122008.20303-3-vsementsov@virtuozzo.com>
References: <20200916122008.20303-1-vsementsov@virtuozzo.com>
 <20200916122008.20303-3-vsementsov@virtuozzo.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Wed, 23 Sep 2020 18:18:43 +0200
Message-ID: <w51tuvoa2l8.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/23 11:59:29
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
Cc: fam@euphon.net, kwolf@redhat.com, vsementsov@virtuozzo.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, stefanha@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed 16 Sep 2020 02:20:05 PM CEST, Vladimir Sementsov-Ogievskiy wrote:
> -    for (p = backing_bs(bs); p != base; p = backing_bs(p)) {
> +    for (p = backing_bs(bs); include_base || p != base; p = backing_bs(p)) {
>          ret = bdrv_co_block_status(p, want_zero, offset, bytes, pnum, map,
>                                     file);
>          if (ret < 0) {
> @@ -2420,6 +2422,11 @@ bdrv_co_common_block_status_above(BlockDriverState *bs,
>              break;
>          }
>  
> +        if (p == base) {
> +            assert(include_base);
> +            break;
> +        }
> +

Another option is something like:

   BlockDriverState *last_bs = include_base ? base : backing_bs(base);

and you get a simpler 'for' loop.

But why do we need include_base at all? Can't the caller just pass
backing_bs(base) instead? I'm talking also about the existing case of
bdrv_is_allocated_above().

Berto

