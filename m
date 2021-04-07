Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E07AB35738D
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 19:50:55 +0200 (CEST)
Received: from localhost ([::1]:57704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUCKM-0004UD-PA
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 13:50:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1lUCGK-0007TM-TE; Wed, 07 Apr 2021 13:46:45 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:56421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1lUCGI-0001kT-Ff; Wed, 07 Apr 2021 13:46:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=RkYJkqWf4kpjmao3EfEJ1Mc35ixuoGLsrI4zEr8+QrM=; 
 b=ZYFHn+t8zZYhDath+qck5SF4sp9TH6Z4ui97x69QKlMxrJNf0Ls5svevy3FS0YLuWGKlXfd48FHlFyeZU1E7Lp/VpkrGxphz/iKvh8gp67pMm5arE8yiGjw8hzehTdgcyJpBvXozmhIrZmhRni/WlEbCeEETWkb9vK+wpn7kcTCQo9/v15D/FKP3cbihGKMSMvi6ePwfw5/xo/ET2J9VA4vXHmaFImRDwaVjuNhYtWkEb6n7GYj2GcSr9Dtue8Hn0O4UOPHMkx1+zFSq/87/fIr1EXFyY7ht80e6Izsqg3cSjgDh9Bw2HBvtuxSqItMKO4fu+ZuF6Wse3bNaxvf2wQ==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1lUCGF-0006LP-3z; Wed, 07 Apr 2021 19:46:39 +0200
Received: from berto by mail.igalia.com with local (Exim)
 id 1lUCGE-0004s4-Qd; Wed, 07 Apr 2021 19:46:38 +0200
From: Alberto Garcia <berto@igalia.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
Subject: Re: [PATCH v3 04/36] block: bdrv_append(): don't consume reference
In-Reply-To: <20210317143529.615584-5-vsementsov@virtuozzo.com>
References: <20210317143529.615584-1-vsementsov@virtuozzo.com>
 <20210317143529.615584-5-vsementsov@virtuozzo.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Wed, 07 Apr 2021 19:46:38 +0200
Message-ID: <w51o8eqasxt.fsf@maestria.local.igalia.com>
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
Cc: fam@euphon.net, kwolf@redhat.com, vsementsov@virtuozzo.com,
 qemu-devel@nongnu.org, armbru@redhat.com, stefanha@redhat.com,
 mreitz@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed 17 Mar 2021 03:34:57 PM CET, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> wrote:
> We have too much comments for this feature. It seems better just don't
> do it. Most of real users (tests don't count) have to create additional
> reference.
>
> Drop also comment in external_snapshot_prepare:
>  - bdrv_append doesn't "remove" old bs in common sense, it sounds
>    strange
>  - the fact that bdrv_append can fail is obvious from the context
>  - the fact that we must rollback all changes in transaction abort is
>    known (it's the direct role of abort)
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Reviewed-by: Alberto Garcia <berto@igalia.com>

> @@ -4645,36 +4640,22 @@ int bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
>   * bs_new must not be attached to a BlockBackend.
>   *
>   * This function does not create any image files.
> - *
> - * bdrv_append() takes ownership of a bs_new reference and unrefs it because
> - * that's what the callers commonly need. bs_new will be referenced by the old
> - * parents of bs_top after bdrv_append() returns. If the caller needs to keep a
> - * reference of its own, it must call bdrv_ref().
>   */
>  int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
>                  Error **errp)

You could still mention explicitly that the old parents of @bs_top will
add a new reference to @bs_new.

Berto

