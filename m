Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3695A7F2B
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Sep 2019 11:20:40 +0200 (CEST)
Received: from localhost ([::1]:54998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i5RSx-0004Lo-NF
	for lists+qemu-devel@lfdr.de; Wed, 04 Sep 2019 05:20:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40614)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1i5RKE-0003pl-HW
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 05:11:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1i5RKC-0004kd-Fw
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 05:11:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48078)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1i5RKC-0004j0-9X
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 05:11:36 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id DEABE10F23F9;
 Wed,  4 Sep 2019 09:11:34 +0000 (UTC)
Received: from redhat.com (ovpn-112-33.ams2.redhat.com [10.36.112.33])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 81076600CD;
 Wed,  4 Sep 2019 09:11:21 +0000 (UTC)
Date: Wed, 4 Sep 2019 10:11:18 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Message-ID: <20190904091118.GD19582@redhat.com>
References: <cover.1567534653.git.jag.raman@oracle.com>
 <32b6764ce960a792b6f523d615ff160ef7d3d12e.1567534653.git.jag.raman@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <32b6764ce960a792b6f523d615ff160ef7d3d12e.1567534653.git.jag.raman@oracle.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.66]); Wed, 04 Sep 2019 09:11:35 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [RFC v3 PATCH 02/45] multi-process: util: Add
 qemu_thread_cancel() to cancel running thread
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: elena.ufimtseva@oracle.com, fam@euphon.net, thuth@redhat.com,
 john.g.johnson@oracle.com, ehabkost@redhat.com, konrad.wilk@oracle.com,
 quintela@redhat.com, mst@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com,
 ross.lagerwall@citrix.com, mreitz@redhat.com, kanth.ghatraju@oracle.com,
 kraxel@redhat.com, stefanha@redhat.com, pbonzini@redhat.com,
 liran.alon@oracle.com, marcandre.lureau@gmail.com, kwolf@redhat.com,
 dgilbert@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 03, 2019 at 04:37:28PM -0400, Jagannathan Raman wrote:
> qemu_thread_cancel() added to destroy a given running thread.
> This will be needed in the following patches.

I don't see anything in the following patches that actually uses
this new function.

That is good though, because it is incredibly difficult to
correctly use pthread_cancel() in such a way that you correctly
release all memory and other resources (file descriptors) owned
by the thread being cancelled.

So this looks like it can thankfully be dropped.

> 
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> ---
>  include/qemu/thread.h    |  1 +
>  util/qemu-thread-posix.c | 10 ++++++++++
>  2 files changed, 11 insertions(+)

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

