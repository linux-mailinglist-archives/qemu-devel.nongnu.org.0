Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FDB152BEC3
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 17:33:52 +0200 (CEST)
Received: from localhost ([::1]:36614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrLgN-0000bs-GV
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 11:33:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nrLem-0007wO-12
 for qemu-devel@nongnu.org; Wed, 18 May 2022 11:32:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53351)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nrLei-0005g9-JH
 for qemu-devel@nongnu.org; Wed, 18 May 2022 11:32:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652887927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zzbjlTqE6Mkr8auoGmUdDtLZK+z9VMDEizkXgcmtcW0=;
 b=X4nxXmOFNPgcUyAmXnGMNwLbtGepEZiDb+pY4o26oPoQBVY4uf1CxUGLEptwmTI+kdnOHv
 FYXAXwW9XknS9/8wNfWE3UbktcMA1RQ0SBzfEmKL1l8YtpS2zkxaESdexWMIQyErbOyY6/
 vJqcziNl5nYivItp3CUKQwpgVLvu6t0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-1oByRKrXOSiS9z43x0VssA-1; Wed, 18 May 2022 11:32:04 -0400
X-MC-Unique: 1oByRKrXOSiS9z43x0VssA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A45578015BA;
 Wed, 18 May 2022 15:32:03 +0000 (UTC)
Received: from redhat.com (unknown [10.2.17.180])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 08C8C1121314;
 Wed, 18 May 2022 15:32:02 +0000 (UTC)
Date: Wed, 18 May 2022 10:32:01 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, hreitz@redhat.com,
 kwolf@redhat.com, jsnow@redhat.com,
 Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
Subject: Re: [PATCH v4 0/3] block/dirty-bitmaps: fix and improve bitmap merge
Message-ID: <20220518153201.g7dmw3tzbc7kqxbw@redhat.com>
References: <20220517111206.23585-1-v.sementsov-og@mail.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220517111206.23585-1-v.sementsov-og@mail.ru>
User-Agent: NeoMutt/20220429-71-6f7d3e
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 17, 2022 at 02:12:03PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
> 
> v4:
> 01,03: add Kevin's r-b
> 02: add hbitmap_free() on success patch if local_backup is not needed
> 
> Vladimir Sementsov-Ogievskiy (3):
>   block: block_dirty_bitmap_merge(): fix error path
>   block: improve block_dirty_bitmap_merge(): don't allocate extra bitmap
>   block: simplify handling of try to merge different sized bitmaps

I plan to queue this through my block bitmaps tree, if no other block
maintainer beats me to it (I may do a combined pull request for that
and NBD patches).

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


