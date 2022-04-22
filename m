Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CF250C09B
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 22:06:36 +0200 (CEST)
Received: from localhost ([::1]:54918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhzY3-0002jy-HR
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 16:06:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nhzWW-0001ig-3h
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 16:05:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nhzWU-0001os-3e
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 16:04:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650657896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yTyCSlYfKLK9+arwhpy9R/20/pk0kVMKpkK6ZrdIjWg=;
 b=esWaxpsRP7nu2SgveiXMJk/R63MAsCAsBLbbNZkYUCsqSnUoh55++PqdUvzQJxGC3eep0F
 zz8Qv1iDgPGx5aPek+SU1oZWBn0XuEIY7YupRlI5kCt/CUkUktpjYTB1a/xAmEWYN4bCFN
 las9J+uxSDYHgkiSs4BLLg54Afkq9/o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-216-UODfAjOPMN6txBH3RL-b8A-1; Fri, 22 Apr 2022 16:04:53 -0400
X-MC-Unique: UODfAjOPMN6txBH3RL-b8A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 576EE85A5BE;
 Fri, 22 Apr 2022 20:04:52 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.133])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 24ECF76C4;
 Fri, 22 Apr 2022 20:04:49 +0000 (UTC)
Date: Fri, 22 Apr 2022 15:04:48 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
Subject: Re: [PATCH v2 2/3] qapi: nbd-export: allow select bitmaps by
 node/name pair
Message-ID: <20220422200448.5thc3clwya5tx2c6@redhat.com>
References: <20220314213226.362217-1-v.sementsov-og@mail.ru>
 <20220314213226.362217-3-v.sementsov-og@mail.ru>
 <20220316212855.ra54pckg3u6xgwzw@redhat.com>
 <f28af710-a1fd-7475-d74d-8fa46c3dd46f@mail.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f28af710-a1fd-7475-d74d-8fa46c3dd46f@mail.ru>
User-Agent: NeoMutt/20211029-35-db88c3
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Fri, Apr 08, 2022 at 11:27:42PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> 17.03.2022 00:28, Eric Blake wrote:
> > > +++ b/qapi/block-export.json
> > > @@ -6,6 +6,7 @@
> > >   ##
> > >   { 'include': 'sockets.json' }
> > > +{ 'include': 'block-core.json' }
> > Hmm.  Does this extra inclusion negatively impact qemu-storage-daemon,
> > since that is why we created block-export.json in the first place (to
> > minimize the stuff that qsd pulled in without needing all of
> > block-core.json)?  In other words, would it be better to move
> > BlockDirtyBitmapOrStr to this file?
> 
> Actually, looking at storage-daemon/qapi/qapi-schema.json I see block-cores.json.
> 
> That's block.json which is not mentioned in storage-daemon/qapi/qapi-schema.json.
> 
> So, I think it's OK to keep simple include for now.

We're early enough in the 7.1 cycle that if someone proposes a reason
why this would need to change, then we can adjust it.

So for now, I'm adding

Reviewed-by: Eric Blake <eblake@redhat.com>

and queuing this series through my NBD tree.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


