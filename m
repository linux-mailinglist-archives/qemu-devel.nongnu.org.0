Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 712DB6E7F6
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Jul 2019 17:29:06 +0200 (CEST)
Received: from localhost ([::1]:46274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hoUoj-0006qn-JE
	for lists+qemu-devel@lfdr.de; Fri, 19 Jul 2019 11:29:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60503)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgilbert@redhat.com>) id 1hoUoX-0006KF-PB
 for qemu-devel@nongnu.org; Fri, 19 Jul 2019 11:28:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1hoUoS-0005gZ-5v
 for qemu-devel@nongnu.org; Fri, 19 Jul 2019 11:28:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48046)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1hoUoM-0004yM-Qk
 for qemu-devel@nongnu.org; Fri, 19 Jul 2019 11:28:44 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 95678307D95F;
 Fri, 19 Jul 2019 15:10:07 +0000 (UTC)
Received: from work-vm (ovpn-117-245.ams2.redhat.com [10.36.117.245])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7BD7E60BF3;
 Fri, 19 Jul 2019 15:10:04 +0000 (UTC)
Date: Fri, 19 Jul 2019 16:10:02 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Message-ID: <20190719151002.GC3000@work-vm>
References: <20190626004211.4822-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190626004211.4822-1-richardw.yang@linux.intel.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Fri, 19 Jul 2019 15:10:07 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] migration: current_migration is never NULL
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
> migration_object_init() create and assign current_migration, which means
> it will never be null until migration_shutdown().
> 
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
> ---
>  migration/migration.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index 0fd2364961..43fd8297ef 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -1667,10 +1667,6 @@ bool migration_is_idle(void)
>  {
>      MigrationState *s = current_migration;
>  
> -    if (!s) {
> -        return true;
> -    }
> -

I'd prefer to keep that because it's used by migrate_add_blocker
and without this check it means we'd only be able to add a blocker
after the migration object init - which is probably fine but we
would have to check all the cases and make sure no one breaks it in
the future;  where as this check makes it just work and we don't
need to worry about the order.

Dave

>      switch (s->state) {
>      case MIGRATION_STATUS_NONE:
>      case MIGRATION_STATUS_CANCELLED:
> -- 
> 2.19.1
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

