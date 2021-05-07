Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2E83766DE
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 16:10:46 +0200 (CEST)
Received: from localhost ([::1]:37990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf1Bj-0003le-7h
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 10:10:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lf1AY-0003Gy-84
 for qemu-devel@nongnu.org; Fri, 07 May 2021 10:09:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24339)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lf1AV-0003a6-Gd
 for qemu-devel@nongnu.org; Fri, 07 May 2021 10:09:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620396566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z6pgOkKxKPoyZybXT5+fP6mceNE73Anh+b/63uCapWE=;
 b=WQbdGldBGHmlOYRzy0gD1LhrgwsAnuJXcwQTEUbtXzIw8Hl2VK+H0S3mPByoMcImRkP8Tr
 TTxtWt7u61CzfKa5uDmTrSdgt3k6r+wWEn64XaBeJ+6E094OSWNxjfZNhbXc7ni+59Nr5c
 AXc3ittk2XIzEhOj3haLqTbMXVq+lV8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-AysP20lYNWyPfjKsBB5z0w-1; Fri, 07 May 2021 10:09:24 -0400
X-MC-Unique: AysP20lYNWyPfjKsBB5z0w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 14A72107ACC7;
 Fri,  7 May 2021 14:09:23 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-155.ams2.redhat.com [10.36.115.155])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 169455D6A1;
 Fri,  7 May 2021 14:09:20 +0000 (UTC)
Date: Fri, 7 May 2021 16:09:19 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v4 2/6] block: Allow changing bs->file on reopen
Message-ID: <YJVKD1Mh4ASCA1vU@merkur.fritz.box>
References: <cover.1616000692.git.berto@igalia.com>
 <31ccb1061199ee11bf9879f6c60608a19b83263d.1616000692.git.berto@igalia.com>
 <eaa0b429-223a-dd84-9e14-ba37fb0ad03e@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <eaa0b429-223a-dd84-9e14-ba37fb0ad03e@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Alberto Garcia <berto@igalia.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 07.05.2021 um 09:11 hat Vladimir Sementsov-Ogievskiy geschrieben:
> 17.03.2021 20:15, Alberto Garcia wrote:
> > When the x-blockdev-reopen was added it allowed reconfiguring the
> > graph by replacing backing files, but changing the 'file' option was
> > forbidden. Because of this restriction some operations are not
> > possible, notably inserting and removing block filters.
> 
> 
> I now started to work on making backup-top filter public..
> 
> And I think, we'll need separate commands to insert/remove filters
> anyway.. As blockdev-reopen has the following problems:
> 
> 1. It can't append filter above top node, connected to block-device.
> (but bdrv_append() can do it)

We once had some patches that made the 'drive' qdev property runtime
writable. What happened to them?

> 2. It can't simultaneously create new node and append it. This is
> important for backup-top filter, which unshares write even when has no
> writing parent. Now bdrv_append() works in a smart way for it: it
> first do both graph modification (add child to filter, and replace
> original node by filter) and then update graph permissions. So, we'll
> need a command which in one roll create filter node and inserts it
> where needed.

What backup-top could do, however, is enabling restrictions only if it
has a parent (no matter whether that parent requires writing or not).

> 3. blockdev-reopen requires to specify all options (otherwise, they
> will be changed to default). So it requires passing a lot of
> information. But we don't need to touch any option of original bs
> parent to insert a filter between parent and bs. In other words, we
> don't want to reopen something. We want to insert filter.

Yeah, but this was a decision we made consciously because otherwise we'd
have a hard time telling which options should be updated and which
shouldn't, and we would need separate QAPI types for open and reopen.

If we now say that this is a reason for avoiding blockdev-reopen even
though changing some option is the goal, that would be inconsistent.

> 
> ===
> 
> Hmm, another mentioned use of blockdev-reopen was reopening some RO
> node to RW, to modify bitmaps.. And here again, blockdev-reopen is not
> very convenient:
> 
> 1. Again, it requires to specify all options (at least, that was not
> default on node open).. And this only to change one property:
> read-only. Seems overcomplicated.
> 
> 2. Bitmaps modifications are usually done in transactions. Adding a
> clean transaction support for small command that reopens only to RW,
> and back to RO on transaction finalization seems simpler, than for
> entire generic blockdev-reopen.
> 
> 
> ===
> 
> Hmm, interesting. x-blockdev-reopen says that not specified options
> are reset to default. x-blockdev-reopen works through
> bdrv_reopen_multiple, so I think bdrv_reopen_mutliple should reset
> options to default as well. Now look at bdrv_reopen_set_read_only():
> it specifies only one option: "read-only". This means that all other
> options will be reset to default. But for sure, callers of
> bdrv_reopen_set_read_only() want only to change read-only status of
> node, not all other options. Do we have a bug here?

The difference between these cases is the keep_old_opts parameter to
bdrv_reopen_queue(). It is false for x-blockdev-reopen, but true in
bdrv_reopen_set_read_only().

Kevin


