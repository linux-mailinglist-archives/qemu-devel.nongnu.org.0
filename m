Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF5915702C
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Feb 2020 09:01:19 +0100 (CET)
Received: from localhost ([::1]:58046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j140M-0006Pr-Qj
	for lists+qemu-devel@lfdr.de; Mon, 10 Feb 2020 03:01:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35319)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <raphael.norwitz@nutanix.com>) id 1j13zF-0005sW-Hb
 for qemu-devel@nongnu.org; Mon, 10 Feb 2020 03:00:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <raphael.norwitz@nutanix.com>) id 1j13zD-0007H5-RQ
 for qemu-devel@nongnu.org; Mon, 10 Feb 2020 03:00:08 -0500
Received: from [192.146.154.1] (port=35926 helo=mcp01.nutanix.com)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <raphael.norwitz@nutanix.com>) id 1j13zD-0007G1-MU
 for qemu-devel@nongnu.org; Mon, 10 Feb 2020 03:00:07 -0500
Received: from localhost.localdomain (unknown [10.40.36.165])
 by mcp01.nutanix.com (Postfix) with ESMTP id 2FB5810074F4;
 Mon, 10 Feb 2020 08:00:06 +0000 (UTC)
Date: Sun, 9 Feb 2020 12:14:42 -0500
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2 0/3] vhost-user: Lift Max Ram Slots Limitation
Message-ID: <20200209171442.GA14809@localhost.localdomain>
References: <1579143426-18305-1-git-send-email-raphael.norwitz@nutanix.com>
 <20200206033248-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200206033248-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 192.146.154.1
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

On Thu, Feb 06, 2020 at 03:33:13AM -0500, Michael S. Tsirkin wrote:
> 
> On Wed, Jan 15, 2020 at 09:57:03PM -0500, Raphael Norwitz wrote:
> > 
> > Changes since V1:
> >     * Kept the assert in vhost_user_set_mem_table_postcopy, but moved it
> >       to prevent corruption
> >     * Made QEMU send a single VHOST_USER_GET_MAX_MEMSLOTS message at
> >       startup and cache the returned value so that QEMU does not need to
> >       query the backend every time vhost_backend_memslots_limit is called.
> 
> I'm a bit confused about what happens on reconnect.
> Can you clarify pls?
> 
From what I can see, backends which support reconnect call vhost_dev_init,
which then calls vhost_user_backend_init(), as vhost-user-blk does here:
https://github.com/qemu/qemu/blob/master/hw/block/vhost-user-blk.c#L315. The
ram slots limit is fetched in vhost_user_backend_init() so every time the
device reconnects the limit should be refetched. 

