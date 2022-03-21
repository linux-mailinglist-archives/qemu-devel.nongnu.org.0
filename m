Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09FCA4E278B
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 14:33:19 +0100 (CET)
Received: from localhost ([::1]:45524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWI9u-0002b7-5Z
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 09:33:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nWI6z-0000rY-DA
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 09:30:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nWI6t-0001rc-M2
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 09:30:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647869410;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5u/2ed8tY4njzj0no2M+vTsP3VDF2n9egrRp7+a77VI=;
 b=MCzVFYMvnPqpWYEVkRw5voNpF70ZT+mtjmvkdEVxJE5+p4el3kYSWsIU66yI9LLe8d0TGy
 Nz+WH56L0jW/RvC4kTjJJ51G2QzzI3HP9JCCwj2forQZli8fZwhpOWLYo2DFZJY/B60ao6
 KmknVvq+A0ql/1XIcHZMRV/LmiO5loo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-392-q9LcirmSOQ-b4pbNsogh7w-1; Mon, 21 Mar 2022 09:30:09 -0400
X-MC-Unique: q9LcirmSOQ-b4pbNsogh7w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ABB1680159B;
 Mon, 21 Mar 2022 13:30:08 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.194])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D94340C1241;
 Mon, 21 Mar 2022 13:30:06 +0000 (UTC)
Date: Mon, 21 Mar 2022 08:30:05 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
Subject: Re: [PATCH v2 2/3] qapi: nbd-export: allow select bitmaps by
 node/name pair
Message-ID: <20220321133005.uywndq3yitflawyp@redhat.com>
References: <20220314213226.362217-1-v.sementsov-og@mail.ru>
 <20220314213226.362217-3-v.sementsov-og@mail.ru>
 <20220316212855.ra54pckg3u6xgwzw@redhat.com>
 <b55b3f46-6b8d-8522-9a08-e7c2ddcf8f67@mail.ru>
MIME-Version: 1.0
In-Reply-To: <b55b3f46-6b8d-8522-9a08-e7c2ddcf8f67@mail.ru>
User-Agent: NeoMutt/20211029-454-6adf99
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Mon, Mar 21, 2022 at 02:50:25PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> > > +++ b/qapi/block-export.json
> > > @@ -6,6 +6,7 @@
> > >   ##
> > >   { 'include': 'sockets.json' }
> > > +{ 'include': 'block-core.json' }
> > 
> > Hmm.  Does this extra inclusion negatively impact qemu-storage-daemon,
> > since that is why we created block-export.json in the first place (to
> > minimize the stuff that qsd pulled in without needing all of
> > block-core.json)?  In other words, would it be better to move
> > BlockDirtyBitmapOrStr to this file?
> 
> And include block-export in block-core?

Right now, we have:

qapi/block-core.json "Block core (VM unrelated)" - includes
{common,crypto,job,sockets}.json

qapi/block-export.json "Block device exports" - includes sockets.json

qapi/block.json "Additional block stuff (VM related)" - includes block-core.json

Kevin, you forked off qapi/block-export.json.  What do you propose here?

> 
> Another alternative is to move BlockDirtyBitmapOrStr to a separate file included from both block-export and block-core but that seems to be too much.

Indeed, that feels like a step too far; we already have confusion on
which file to stick new stuff in, and adding another file won't help
that.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


