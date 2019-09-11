Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AAC2B024C
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Sep 2019 19:00:42 +0200 (CEST)
Received: from localhost ([::1]:53938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i85yz-0007kx-Ev
	for lists+qemu-devel@lfdr.de; Wed, 11 Sep 2019 13:00:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45543)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1i85y3-0007E2-Tt
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 12:59:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1i85y2-0001Qg-Ir
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 12:59:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52382)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1i85y2-0001QN-Dm
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 12:59:42 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id BF0C230821BF
 for <qemu-devel@nongnu.org>; Wed, 11 Sep 2019 16:59:41 +0000 (UTC)
Received: from redhat.com (unknown [10.42.17.64])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EC15860C05;
 Wed, 11 Sep 2019 16:59:40 +0000 (UTC)
Date: Wed, 11 Sep 2019 17:59:38 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Message-ID: <20190911165938.GI24295@redhat.com>
References: <20190911164202.31136-1-dgilbert@redhat.com>
 <20190911164202.31136-3-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190911164202.31136-3-dgilbert@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Wed, 11 Sep 2019 16:59:41 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 2/3] migration: Use automatic rcu_read
 unlock in ram.c
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 11, 2019 at 05:42:01PM +0100, Dr. David Alan Gilbert (git) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> Use the automatic read unlocker in migration/ram.c;
> only for the cases where the unlock is at the end of the function.
> 
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  migration/ram.c | 25 +++++++++----------------
>  1 file changed, 9 insertions(+), 16 deletions(-)
> 
> diff --git a/migration/ram.c b/migration/ram.c
> index b2bd618a89..750d198f37 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -181,14 +181,14 @@ int foreach_not_ignored_block(RAMBlockIterFunc func, void *opaque)
>      RAMBlock *block;
>      int ret = 0;
>  
> -    rcu_read_lock();
> +    RCU_READ_LOCK_AUTO

FWIW, I'm not a fan of macros which are used without a trailing ';'
as I believe it can confuses editors' code indentation logic.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

