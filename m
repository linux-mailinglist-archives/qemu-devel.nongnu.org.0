Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD4851811E
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 11:37:25 +0200 (CEST)
Received: from localhost ([::1]:47816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nloyC-00073x-M7
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 05:37:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nlovd-00066B-UH
 for qemu-devel@nongnu.org; Tue, 03 May 2022 05:34:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nlovX-0003H8-Eb
 for qemu-devel@nongnu.org; Tue, 03 May 2022 05:34:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651570478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9GgjTQE/kB+X69RPrFR/ptYt3I6b/XE2IknzZo3a6ow=;
 b=bVc7Vf0kYOECNtinwa1tBLBcm5UagQx+rxPrseDKPSb0XLEjrz6XVJ43F8KqHJJ3PsJVFZ
 Z/I1BHNUiCgQg6josNDABq57t0qAZWXV7YS7S47ApBPfuS71A2PA0u3X+X92v0ulrm3gOT
 ayCBug0wq2I+Jft5yFNjiM/OQVbWwxs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-246-1svikIo9MxSvslVVPaTDug-1; Tue, 03 May 2022 05:34:35 -0400
X-MC-Unique: 1svikIo9MxSvslVVPaTDug-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 38E5A802819;
 Tue,  3 May 2022 09:34:35 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.201])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D825B40CFD29;
 Tue,  3 May 2022 09:34:33 +0000 (UTC)
Date: Tue, 3 May 2022 11:34:32 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, eblake@redhat.com,
 hreitz@redhat.com, v.sementsov-og@mail.ru, jsnow@redhat.com,
 vsementsov@openvz.org, nikita.lapshin@virtuozzo.com
Subject: Re: [PATCH v3 3/3] block: simplify handling of try to merge
 different sized bitmaps
Message-ID: <YnD3KJbZICgN7vkV@redhat.com>
References: <20220401100804.315728-1-vsementsov@openvz.org>
 <20220401100804.315728-4-vsementsov@openvz.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220401100804.315728-4-vsementsov@openvz.org>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 01.04.2022 um 12:08 hat Vladimir Sementsov-Ogievskiy geschrieben:
> We have too much logic to simply check that bitmaps are of the same
> size. Let's just define that hbitmap_merge() and
> bdrv_dirty_bitmap_merge_internal() require their argument bitmaps be of
> same size, this simplifies things.
> 
> Let's look through the callers:
> 
> For backup_init_bcs_bitmap() we already assert that merge can't fail.
> 
> In bdrv_reclaim_dirty_bitmap_locked() we gracefully handle the error
> that can't happen: successor always has same size as its parent, drop
> this logic.
> 
> In bdrv_merge_dirty_bitmap() we already has assertion and separate
> check. Make the check explicit and improve error message.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
> Reviewed-by: Nikita Lapshin <nikita.lapshin@virtuozzo.com>

Reviewed-by: Kevin Wolf <kwolf@redhat.com>


