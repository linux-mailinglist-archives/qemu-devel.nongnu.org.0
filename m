Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5443B68DD
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 21:13:04 +0200 (CEST)
Received: from localhost ([::1]:53062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxwgp-0008SX-6K
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 15:13:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lxwfr-0007Xy-5U
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 15:12:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lxwfn-0007XB-DZ
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 15:12:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624907517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AgGHJYX0bSlIpU+ZJ96zwaQkQ5X3uktKe0yYAv2Hn3s=;
 b=CuyxD79ggbmT8Fxd7Uf/6GcovyQ8ih68NUWntKBQK9gfFs/6AQAuTT35reKWKLeyvnRmw9
 H9qgBn1EoDOZx25EopuO/dZmjCiQYygBsMfQjIFU2CR8l+KtM3jstJQVCFkFVVmYzyFJGf
 VaHP0ZrP9qyq13hxhWkeG2EnyB2Wbgs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-513-mQCpUFfkP4CJ711OXFbyrQ-1; Mon, 28 Jun 2021 15:11:54 -0400
X-MC-Unique: mQCpUFfkP4CJ711OXFbyrQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EAF0489F931;
 Mon, 28 Jun 2021 19:11:52 +0000 (UTC)
Received: from redhat.com (ovpn-113-39.phx2.redhat.com [10.3.113.39])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C9D65C1D0;
 Mon, 28 Jun 2021 19:11:52 +0000 (UTC)
Date: Mon, 28 Jun 2021 14:10:44 -0500
From: Eric Blake <eblake@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH v2 3/6] block: Clarify that @bytes is no limit on *pnum
Message-ID: <20210628191044.or4e2h7jza6r4a4m@redhat.com>
References: <20210623150143.188184-1-mreitz@redhat.com>
 <20210623150143.188184-4-mreitz@redhat.com>
 <adfe02d6-4b40-86f1-fa6b-55cf00405036@virtuozzo.com>
 <3c4ae0ed-a7d7-b6c3-1785-f6e4a9efec7e@redhat.com>
MIME-Version: 1.0
In-Reply-To: <3c4ae0ed-a7d7-b6c3-1785-f6e4a9efec7e@redhat.com>
User-Agent: NeoMutt/20210205-557-802118
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.375,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> > > +++ b/include/block/block_int.h
> > > @@ -347,6 +347,11 @@ struct BlockDriver {
> > >        * clamped to bdrv_getlength() and aligned to request_alignment,
> > >        * as well as non-NULL pnum, map, and file; in turn, the driver
> > >        * must return an error or set pnum to an aligned non-zero value.
> > > +     *
> > > +     * Note that @bytes is just a hint on how big of a region the
> > > +     * caller wants to inspect.  It is not a limit on *pnum.
> > > +     * Implementations are free to return larger values of *pnum if
> > > +     * doing so does not incur a performance penalty.
> > 
> > Worth mention that the cache will benefit of it?
> 
> Oh, right, absolutely.  Like so:
> 
> "block/io.c's bdrv_co_block_status() will clamp *pnum before returning it to
> its caller, but it itself can still make use of the unclamped *pnum value. 
> Specifically, the block-status cache for protocol nodes will benefit from
> storing as large a region as possible."

How about this tweak to the wording to make it flow a little better:

block/io.c's bdrv_co_block_status() will utilize an unclamped *pnum
value for the block-status cache on protocol nodes, prior to clamping
*pnum for return to its caller.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


