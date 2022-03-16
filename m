Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 298024DBA1B
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 22:30:05 +0100 (CET)
Received: from localhost ([::1]:54130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUbDY-0003dF-5z
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 17:30:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nUbCY-0002qB-Gx
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 17:29:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nUbCW-0007lj-6H
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 17:29:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647466139;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=t16m8BUsqo/ez41v2ha9UAV9SpxQuavSPMVkobTsjW4=;
 b=AGBgkbJ+tw8zrblQ4oPCSzX8rr2q5t7vs6RNg6z7rIjf3yAjzrHr34Bpk4o2Hh1q1Z9eP4
 ukHKKmMeJ7889hcFp9ar4NXgh5c6zHLm9QgzVMzpgB8vuBALcryKjvZmQUu5oA5wIWMyFm
 SHNWxAhGVDTbCYjSVE5dwf+fJcQtNf0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-455-LkWp31fzMqa998Du1cO2Og-1; Wed, 16 Mar 2022 17:28:58 -0400
X-MC-Unique: LkWp31fzMqa998Du1cO2Og-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9B4D3802A5E;
 Wed, 16 Mar 2022 21:28:57 +0000 (UTC)
Received: from redhat.com (unknown [10.22.33.105])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E52B840D2962;
 Wed, 16 Mar 2022 21:28:56 +0000 (UTC)
Date: Wed, 16 Mar 2022 16:28:55 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
Subject: Re: [PATCH v2 2/3] qapi: nbd-export: allow select bitmaps by
 node/name pair
Message-ID: <20220316212855.ra54pckg3u6xgwzw@redhat.com>
References: <20220314213226.362217-1-v.sementsov-og@mail.ru>
 <20220314213226.362217-3-v.sementsov-og@mail.ru>
MIME-Version: 1.0
In-Reply-To: <20220314213226.362217-3-v.sementsov-og@mail.ru>
User-Agent: NeoMutt/20211029-454-6adf99
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 armbru@redhat.com, hreitz@redhat.com, v.sementsov-og@ya.ru,
 yuriy.vasiliev@virtuozzo.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 15, 2022 at 12:32:25AM +0300, Vladimir Sementsov-Ogievskiy wrote:
> From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@ya.ru>
> 
> Hi all! Current logic of relying on search through backing chain is not
> safe neither convenient.
> 
> Sometimes it leads to necessity of extra bitmap copying. Also, we are
> going to add "snapshot-access" driver, to access some snapshot state
> through NBD. And this driver is not formally a filter, and of course
> it's not a COW format driver. So, searching through backing chain will
> not work. Instead of widening the workaround of bitmap searching, let's
> extend the interface so that user can select bitmap precisely.
> 
> Note, that checking for bitmap active status is not copied to the new
> API, I don't see a reason for it, user should understand the risks. And
> anyway, bitmap from other node is unrelated to this export being
> read-only or read-write.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <v.sementsov-og@ya.ru>
> ---
>  blockdev-nbd.c         |  8 +++++-
>  nbd/server.c           | 63 +++++++++++++++++++++++++++---------------
>  qapi/block-export.json |  5 +++-
>  qemu-nbd.c             | 11 ++++++--
>  4 files changed, 61 insertions(+), 26 deletions(-)
> 

> @@ -1709,37 +1709,56 @@ static int nbd_export_create(BlockExport *blk_exp, BlockExportOptions *exp_args,
>      }
>      exp->export_bitmaps = g_new0(BdrvDirtyBitmap *, exp->nr_export_bitmaps);
>      for (i = 0, bitmaps = arg->bitmaps; bitmaps;
> -         i++, bitmaps = bitmaps->next) {
> -        const char *bitmap = bitmaps->value;
> +         i++, bitmaps = bitmaps->next)
> +    {
> +        const char *bitmap;

I'm not sure if our prevailing style splits { to its own line on a
multi-line 'for'.  But this is a cosmetic question, not one of
correctness.

> +        case QTYPE_QDICT:
> +            bitmap = bitmaps->value->u.external.name;
> +            bm = block_dirty_bitmap_lookup(bitmaps->value->u.external.node,
> +                                           bitmap, NULL, errp);
> +            if (!bm) {
> +                ret = -ENOENT;
> +                goto fail;
> +            }
> +            break;
> +        default:
> +            abort();

Not sure if g_assert_not_reached() or __builtin_unreachable() would be
any better here.  I'm fine with the abort() for now.

> +++ b/qapi/block-export.json
> @@ -6,6 +6,7 @@
>  ##
>  
>  { 'include': 'sockets.json' }
> +{ 'include': 'block-core.json' }

Hmm.  Does this extra inclusion negatively impact qemu-storage-daemon,
since that is why we created block-export.json in the first place (to
minimize the stuff that qsd pulled in without needing all of
block-core.json)?  In other words, would it be better to move
BlockDirtyBitmapOrStr to this file?

Everything else looks okay with this patch.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


