Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E110816401B
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Feb 2020 10:17:37 +0100 (CET)
Received: from localhost ([::1]:47652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4LU8-00040Q-Nr
	for lists+qemu-devel@lfdr.de; Wed, 19 Feb 2020 04:17:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43268)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <raphael.norwitz@nutanix.com>) id 1j4LT2-0003Ns-Az
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 04:16:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <raphael.norwitz@nutanix.com>) id 1j4LT0-0005jF-Eh
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 04:16:27 -0500
Received: from [192.146.154.243] (port=44821 helo=mcp01.nutanix.com)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <raphael.norwitz@nutanix.com>) id 1j4LT0-0005iF-9n
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 04:16:26 -0500
Received: from localhost.localdomain (unknown [10.40.36.165])
 by mcp01.nutanix.com (Postfix) with ESMTP id 8A93A1007A28;
 Wed, 19 Feb 2020 09:16:23 +0000 (UTC)
Date: Wed, 19 Feb 2020 00:33:24 -0500
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2 0/3] vhost-user: Lift Max Ram Slots Limitation
Message-ID: <20200219053324.GA3052@localhost.localdomain>
References: <1579143426-18305-1-git-send-email-raphael.norwitz@nutanix.com>
 <20200206033248-mutt-send-email-mst@kernel.org>
 <20200209171442.GA14809@localhost.localdomain>
 <20200210110330-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200210110330-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 192.146.154.243
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 10, 2020 at 11:04:28AM -0500, Michael S. Tsirkin wrote:
> 
> On Sun, Feb 09, 2020 at 12:14:42PM -0500, Raphael Norwitz wrote:
> > On Thu, Feb 06, 2020 at 03:33:13AM -0500, Michael S. Tsirkin wrote:
> > > 
> > > On Wed, Jan 15, 2020 at 09:57:03PM -0500, Raphael Norwitz wrote:
> > > > 
> > > > Changes since V1:
> > > >     * Kept the assert in vhost_user_set_mem_table_postcopy, but moved it
> > > >       to prevent corruption
> > > >     * Made QEMU send a single VHOST_USER_GET_MAX_MEMSLOTS message at
> > > >       startup and cache the returned value so that QEMU does not need to
> > > >       query the backend every time vhost_backend_memslots_limit is called.
> > > 
> > > I'm a bit confused about what happens on reconnect.
> > > Can you clarify pls?
> > > 
> > >From what I can see, backends which support reconnect call vhost_dev_init,
> > which then calls vhost_user_backend_init(), as vhost-user-blk does here:
> > https://github.com/qemu/qemu/blob/master/hw/block/vhost-user-blk.c#L315. The
> > ram slots limit is fetched in vhost_user_backend_init() so every time the
> > device reconnects the limit should be refetched. 
> 
> Right. Point is, we might have validated using an old limit.
> Reconnect needs to verify limit did not change or at least
> did not decrease.
> 
> -- 
> MST
Good point - I did not consider this case. Could we keep the slots limit in
the VhostUserState instead?

Say vhost_user_init() initializes the limit inside the VhostUserState to 0. Then,
vhost_user_backend_init() checks if this limit is 0. If so, this is the initial
connection and qemu fetches the limit from the backend, ensures the returned
value is nonzero, and sets the limit the VhostUserState. If not, qemu knows this
is a reconnect and queries the backend slots limit. If the returned value does
not equal the limit in the VhostUserState, vhost_user_backend_init() returns an
error.

Thoughts?

