Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C01A1147F74
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jan 2020 12:03:25 +0100 (CET)
Received: from localhost ([::1]:40688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuwkG-0007V3-Ql
	for lists+qemu-devel@lfdr.de; Fri, 24 Jan 2020 06:03:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57809)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1iuwin-0006qK-De
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 06:01:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1iuwim-0004FX-6D
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 06:01:53 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:45602
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1iuwim-0004F7-1g
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 06:01:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579863711;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uJMWZeTSyzprSWtHCgewX8BzfMkVUjf01klQm187dLU=;
 b=FiWykBT0YF5YKW/hk8tPKHkq47RkyCwE6USbCoGJG+2PxfOKm33Fq+E/CpyWuOrcuduZ47
 53Or0JTjZgP7o8krt00gpV0zDUJnfb+iVC49GcSjw/hlW/inljAASn9wb1Qsphg+yPmdi0
 HjjMUCjU/5ImH+wNTj05hQy2XbR7dbc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-IsQd_hU4OjS2U0fPyPUr0Q-1; Fri, 24 Jan 2020 06:01:47 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1A0231088380;
 Fri, 24 Jan 2020 11:01:46 +0000 (UTC)
Received: from redhat.com (unknown [10.36.118.61])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 02A2E5C28D;
 Fri, 24 Jan 2020 11:01:40 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH 4/7] migration/block-dirty-bitmap: keep bitmap state for
 all bitmaps
In-Reply-To: <20200122132328.31156-5-vsementsov@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Wed, 22 Jan 2020 16:23:25 +0300")
References: <20200122132328.31156-1-vsementsov@virtuozzo.com>
 <20200122132328.31156-5-vsementsov@virtuozzo.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
Date: Fri, 24 Jan 2020 12:01:38 +0100
Message-ID: <875zh15d9p.fsf@secure.laptop>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: IsQd_hU4OjS2U0fPyPUr0Q-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 207.211.31.81
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
Reply-To: quintela@redhat.com
Cc: kwolf@redhat.com, fam@euphon.net, qemu-block@nongnu.org,
 dgilbert@redhat.com, qemu-devel@nongnu.org, stefanha@redhat.com,
 mreitz@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> wrote:
> Keep bitmap state for disabled bitmaps too. Keep the state until the
> end of the process. It's needed for the following commit to implement
> bitmap postcopy canceling.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> -
> -        b =3D g_new(DirtyBitmapLoadBitmapState, 1);
> -        b->bs =3D s->bs;
> -        b->bitmap =3D s->bitmap;
> -        b->migrated =3D false;
> -        dbm_load_state.enabled_bitmaps =3D
> -            g_slist_prepend(dbm_load_state.enabled_bitmaps, b);
>      }
> =20
> +    b =3D g_new(DirtyBitmapLoadBitmapState, 1);
> +    *b =3D (DirtyBitmapLoadBitmapState) {
> +        .bs =3D s->bs,
> +        .bitmap =3D s->bitmap,
> +        .migrated =3D false,
> +        .enabled =3D flags & DIRTY_BITMAP_MIG_START_FLAG_ENABLED,
> +    };

What is wrong with:
     b->bs =3D s->bs;
     b->bitmap =3D s->bitmap;
     b->migrated =3D false;
     b->enabled =3D flags & DIRTY_BITMAP_MIG_START_FLAG_ENABLED;

???

Later, Juan.


