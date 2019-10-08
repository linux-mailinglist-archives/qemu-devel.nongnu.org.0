Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F159D00D6
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Oct 2019 20:49:50 +0200 (CEST)
Received: from localhost ([::1]:33428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iHuYO-0006v0-OX
	for lists+qemu-devel@lfdr.de; Tue, 08 Oct 2019 14:49:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41372)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iHuWX-0006Os-MN
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 14:47:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iHuWU-0002Ce-Tk
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 14:47:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41424)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iHuWT-00026E-0z
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 14:47:49 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3552018C426F;
 Tue,  8 Oct 2019 18:47:46 +0000 (UTC)
Received: from work-vm (ovpn-116-59.ams2.redhat.com [10.36.116.59])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 29E1C60BE2;
 Tue,  8 Oct 2019 18:47:45 +0000 (UTC)
Date: Tue, 8 Oct 2019 19:47:42 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Subject: Re: [PATCH 1/3] migration/postcopy: mis->have_listen_thread check
 will never be touched
Message-ID: <20191008184742.GK3441@work-vm>
References: <20191006000249.29926-1-richardw.yang@linux.intel.com>
 <20191006000249.29926-2-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191006000249.29926-2-richardw.yang@linux.intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.62]); Tue, 08 Oct 2019 18:47:46 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: qemu-devel@nongnu.org, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Wei Yang (richardw.yang@linux.intel.com) wrote:
> If mis->have_listen_thread is true, this means current PostcopyState
> must be LISTENING or RUNNING. While the check at the beginning of the
> function makes sure the state transaction happens when its previous
> PostcopyState is ADVISE or DISCARD.
> 
> This means we would never touch this check.
> 
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>

Yes, OK - although I think it's OK sometimes to leave in checks
for things you don't expect to happen!


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/savevm.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/migration/savevm.c b/migration/savevm.c
> index feb757de79..eaa4cf58ef 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -1878,11 +1878,6 @@ static int loadvm_postcopy_handle_listen(MigrationIncomingState *mis)
>          return -1;
>      }
>  
> -    if (mis->have_listen_thread) {
> -        error_report("CMD_POSTCOPY_RAM_LISTEN already has a listen thread");
> -        return -1;
> -    }
> -
>      mis->have_listen_thread = true;
>      /* Start up the listening thread and wait for it to signal ready */
>      qemu_sem_init(&mis->listen_thread_sem, 0);
> -- 
> 2.17.1
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

