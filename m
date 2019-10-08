Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6721D0068
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Oct 2019 20:02:45 +0200 (CEST)
Received: from localhost ([::1]:59660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iHtoq-0001cr-B6
	for lists+qemu-devel@lfdr.de; Tue, 08 Oct 2019 14:02:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54409)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iHtji-0007Mx-3q
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 13:57:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iHtjf-0007C3-Kb
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 13:57:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39344)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iHtjf-0007Aa-F3
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 13:57:23 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 022CFC054C58;
 Tue,  8 Oct 2019 17:57:22 +0000 (UTC)
Received: from work-vm (ovpn-116-59.ams2.redhat.com [10.36.116.59])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B6DDB60A9F;
 Tue,  8 Oct 2019 17:57:20 +0000 (UTC)
Date: Tue, 8 Oct 2019 18:57:18 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Subject: Re: [PATCH 3/4] migration: pass in_postcopy instead of check state
 again
Message-ID: <20191008175718.GJ3441@work-vm>
References: <20191005220517.24029-1-richardw.yang@linux.intel.com>
 <20191005220517.24029-4-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191005220517.24029-4-richardw.yang@linux.intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Tue, 08 Oct 2019 17:57:22 +0000 (UTC)
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
> Not necessary to do the check again.
> 
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/migration.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index c8eaa85867..56031305e3 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -3148,8 +3148,7 @@ static MigIterateState migration_iteration_run(MigrationState *s)
>              return MIG_ITERATE_SKIP;
>          }
>          /* Just another iteration step */
> -        qemu_savevm_state_iterate(s->to_dst_file,
> -            s->state == MIGRATION_STATUS_POSTCOPY_ACTIVE);
> +        qemu_savevm_state_iterate(s->to_dst_file, in_postcopy);
>      } else {
>          trace_migration_thread_low_pending(pending_size);
>          migration_completion(s);
> -- 
> 2.17.1
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

