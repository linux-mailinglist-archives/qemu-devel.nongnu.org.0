Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFABA410F50
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 07:30:51 +0200 (CEST)
Received: from localhost ([::1]:47782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSBtC-0005JS-JQ
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 01:30:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mSBrC-0003qC-2g
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 01:28:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mSBr9-0000w1-QH
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 01:28:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632115722;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3bVqjviNMDx0LGtH1xApOblF4/7MicSrBuqNKpdKxA0=;
 b=NPWKAqv7InVDrUI1N6oRKbRPk32SbS3MsjcCDo4yqUozfWMHd3JhFU4DNy8675UEbxtbKH
 hBLYmqopT3pmupjNoaKWsXD1/1HgtJWXhRpmbRnNNGCNC/tK316fLo4jZ/JdsiGJfQNoWw
 lu13pF7wVe330fGsDsicYi0CF0MtZjg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-123-8S1HmKr-P1S9NaT0_eN6fQ-1; Mon, 20 Sep 2021 01:28:41 -0400
X-MC-Unique: 8S1HmKr-P1S9NaT0_eN6fQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 755CF1006AA4;
 Mon, 20 Sep 2021 05:28:39 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 79DEF1AC7E;
 Mon, 20 Sep 2021 05:28:22 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E363F113865F; Mon, 20 Sep 2021 07:28:20 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH 2/8] block: add BlockParentClass class
References: <20210802185416.50877-1-vsementsov@virtuozzo.com>
 <20210802185416.50877-3-vsementsov@virtuozzo.com>
Date: Mon, 20 Sep 2021 07:28:20 +0200
In-Reply-To: <20210802185416.50877-3-vsementsov@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Mon, 2 Aug 2021 21:54:10 +0300")
Message-ID: <87wnnb4xzf.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.476,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, pkrempa@redhat.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, libvir-list@redhat.com,
 dim@virtuozzo.com, igor@virtuozzo.com, armbru@redhat.com,
 qemu-devel@nongnu.org, yur@virtuozzo.com, nshirokovskiy@virtuozzo.com,
 stefanha@redhat.com, den@openvz.org, pbonzini@redhat.com, mreitz@redhat.com,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:

> Add a class that will unify block parents for blockdev-replace
> functionality we are going to add.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  include/block/block-parent.h | 32 +++++++++++++++++
>  block/block-parent.c         | 66 ++++++++++++++++++++++++++++++++++++
>  block/meson.build            |  1 +
>  3 files changed, 99 insertions(+)
>  create mode 100644 include/block/block-parent.h
>  create mode 100644 block/block-parent.c
>
> diff --git a/include/block/block-parent.h b/include/block/block-parent.h
> new file mode 100644
> index 0000000000..bd9c9d91e6
> --- /dev/null
> +++ b/include/block/block-parent.h
> @@ -0,0 +1,32 @@
> +/*
> + * Block Parent class
> + *
> + * Copyright (c) 2021 Virtuozzo International GmbH.
> + *
> + * Authors:
> + *  Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#ifndef BLOCK_PARENT_H
> +#define BLOCK_PARENT_H
> +
> +#include "block/block.h"
> +
> +typedef struct BlockParentClass {
> +    const char *name;
> +
> +    int (*find_child)(const char *parent_id, const char *child_name,
> +                      BlockDriverState *child_bs, BdrvChild **child,
> +                      Error **errp);
> +    QTAILQ_ENTRY(BlockParentClass) next;
> +} BlockParentClass;
> +
> +void block_parent_class_register(BlockParentClass *cls);
> +
> +BdrvChild *block_find_child(const char *parent_id, const char *child_name,
> +                            BlockDriverState *child_bs, Error **errp);
> +
> +#endif /* BLOCK_PARENT_H */
> diff --git a/block/block-parent.c b/block/block-parent.c
> new file mode 100644
> index 0000000000..73b6026c42
> --- /dev/null
> +++ b/block/block-parent.c
> @@ -0,0 +1,66 @@
> +/*
> + * Block Parent class
> + *
> + * Copyright (c) 2021 Virtuozzo International GmbH.
> + *
> + * Authors:
> + *  Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "block/block-parent.h"
> +#include "qapi/error.h"
> +
> +static QTAILQ_HEAD(, BlockParentClass) block_parent_classes =
> +    QTAILQ_HEAD_INITIALIZER(block_parent_classes);
> +
> +void block_parent_class_register(BlockParentClass *cls)
> +{
> +    QTAILQ_INSERT_HEAD(&block_parent_classes, cls, next);
> +}
> +
> +BdrvChild *block_find_child(const char *parent_id, const char *child_name,
> +                            BlockDriverState *child_bs, Error **errp)
> +{
> +    BdrvChild *found_child = NULL;
> +    BlockParentClass *found_cls = NULL, *cls;
> +
> +    QTAILQ_FOREACH(cls, &block_parent_classes, next) {
> +        int ret;
> +        BdrvChild *c;
> +
> +        /*
> +         * Note that .find_child must fail if parent is found but doesn't have
> +         * corresponding child.
> +         */
> +        ret = cls->find_child(parent_id, child_name, child_bs, &c, errp);
> +        if (ret < 0) {
> +            return NULL;

Interesting: when one method fails, the entire function fails, even when
other methods succeed.  The contract should probably spell this out.

> +        }
> +        if (ret == 0) {
> +            continue;
> +        }
> +
> +        if (!found_child) {
> +            found_cls = cls;
> +            found_child = c;
> +            continue;
> +        }
> +
> +        error_setg(errp, "{%s, %s} parent-child pair is ambiguous: it match "
> +                   "both %s and %s", parent_id, child_name, found_cls->name,
> +                   cls->name);
> +        return NULL;
> +    }

Style recommendation: if very much prefer

           if bad
               error out
           normal

over

           if ok
               normal
           bad

In this case:

           if (found_child) {
               error_setg(...);
               return 0;
           }

           found_cls = cls;
           found_child = c;
       }

> +
> +    if (!found_child) {
> +        error_setg(errp, "{%s, %s} parent-child pair not found", parent_id,
> +                   child_name);
> +        return NULL;
> +    }
> +
> +    return found_child;
> +}
> diff --git a/block/meson.build b/block/meson.build
> index 0450914c7a..5200e0ffce 100644
> --- a/block/meson.build
> +++ b/block/meson.build
> @@ -10,6 +10,7 @@ block_ss.add(files(
>    'blkverify.c',
>    'block-backend.c',
>    'block-copy.c',
> +  'block-parent.c',
>    'commit.c',
>    'copy-on-read.c',
>    'preallocate.c',


