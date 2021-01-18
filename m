Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 969C22FA83A
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 19:03:45 +0100 (CET)
Received: from localhost ([::1]:40474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1YsS-0007FN-DG
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 13:03:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l1YoY-000650-O3
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 12:59:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l1YoV-0003qv-E0
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 12:59:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610992776;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GJNi6Z+2Lwe0Wq4Yd9jsSCpBQGbQVSEX87GrosatgVg=;
 b=WPw2oshApuQGzQeR1UGXOtHGOZT44o9BKUt4pDSsku2yKJmIH4RE7l9zaJj3WAIbw9ikzP
 4p7SFh8cIieSPPS68VQkibbopTReiOeEXVz4ppLs96IPxvQsYxrG/4Ekzz2B1nV/pBDMky
 0G0x3Uf7+2xYkB/8M1J6I1DeNU3CKsU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-fgvIaJd-PPKJehtIxUUYTQ-1; Mon, 18 Jan 2021 12:59:34 -0500
X-MC-Unique: fgvIaJd-PPKJehtIxUUYTQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C73A806662;
 Mon, 18 Jan 2021 17:59:33 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-75.ams2.redhat.com [10.36.115.75])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0EABD5D737;
 Mon, 18 Jan 2021 17:59:31 +0000 (UTC)
Date: Mon, 18 Jan 2021 18:59:30 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v2 03/36] block: bdrv_append(): don't consume reference
Message-ID: <20210118175930.GM11555@merkur.fritz.box>
References: <20201127144522.29991-1-vsementsov@virtuozzo.com>
 <20201127144522.29991-4-vsementsov@virtuozzo.com>
 <20210118141820.GD11555@merkur.fritz.box>
 <d1f414b0-9cdd-a715-0310-64f34191c1a9@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <d1f414b0-9cdd-a715-0310-64f34191c1a9@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.175,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-block@nongnu.org, armbru@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 18.01.2021 um 18:21 hat Vladimir Sementsov-Ogievskiy geschrieben:
> 18.01.2021 17:18, Kevin Wolf wrote:
> > Am 27.11.2020 um 15:44 hat Vladimir Sementsov-Ogievskiy geschrieben:
> > > We have too much comments for this feature. It seems better just don't
> > > do it. Most of real users (tests don't count) have to create additional
> > > reference.
> > > 
> > > Drop also comment in external_snapshot_prepare:
> > >   - bdrv_append doesn't "remove" old bs in common sense, it sounds
> > >     strange
> > >   - the fact that bdrv_append can fail is obvious from the context
> > >   - the fact that we must rollback all changes in transaction abort is
> > >     known (it's the direct role of abort)
> > > 
> > > Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

> > > diff --git a/blockdev.c b/blockdev.c
> > > index b5f11c524b..96c96f8ba6 100644
> > > --- a/blockdev.c
> > > +++ b/blockdev.c
> > > @@ -1587,10 +1587,6 @@ static void external_snapshot_prepare(BlkActionState *common,
> > >           goto out;
> > >       }
> > > -    /* This removes our old bs and adds the new bs. This is an operation that
> > > -     * can fail, so we need to do it in .prepare; undoing it for abort is
> > > -     * always possible. */
> > 
> > This comment is still relevant, it's unrelated to the bdrv_ref().
> 
> I described in commit message, why I dislike this comment :) I can
> keep it of course, it's not critical

Ah, right, I missed this bit in the commit message (or forgot it until I
reached this hunk) and thought it was an accidental removal.

If it's intentional, no reason to change the patch.

Kevin


