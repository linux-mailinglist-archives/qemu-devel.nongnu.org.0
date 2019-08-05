Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BF281638
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Aug 2019 12:01:37 +0200 (CEST)
Received: from localhost ([::1]:52210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1huZo8-0002xl-8Q
	for lists+qemu-devel@lfdr.de; Mon, 05 Aug 2019 06:01:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36956)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgilbert@redhat.com>) id 1huZnM-0002XX-Uy
 for qemu-devel@nongnu.org; Mon, 05 Aug 2019 06:00:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1huZnK-0005dU-Hy
 for qemu-devel@nongnu.org; Mon, 05 Aug 2019 06:00:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37106)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1huZnJ-0005br-8y
 for qemu-devel@nongnu.org; Mon, 05 Aug 2019 06:00:45 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 115B5300DA2A;
 Mon,  5 Aug 2019 10:00:44 +0000 (UTC)
Received: from work-vm (ovpn-117-168.ams2.redhat.com [10.36.117.168])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F8D9194B9;
 Mon,  5 Aug 2019 10:00:42 +0000 (UTC)
Date: Mon, 5 Aug 2019 11:00:40 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Message-ID: <20190805100040.GE13734@work-vm>
References: <20190718083747.5859-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190718083747.5859-1-richardw.yang@linux.intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Mon, 05 Aug 2019 10:00:44 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] migration/postcopy: start_postcopy could
 be true only when migrate_postcopy() return true
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
> There is only one place to set start_postcopy to true,
> qmp_migrate_start_postcopy(), which make sure start_postcopy could be
> set to true when migrate_postcopy() return true.
> 
> So start_postcopy is true implies the other one.
> 
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/migration.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index 719d125041..27ca10122f 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -3101,8 +3101,7 @@ static MigIterateState migration_iteration_run(MigrationState *s)
>  
>      if (pending_size && pending_size >= s->threshold_size) {
>          /* Still a significant amount to transfer */
> -        if (migrate_postcopy() && !in_postcopy &&
> -            pend_pre <= s->threshold_size &&
> +        if (!in_postcopy && pend_pre <= s->threshold_size &&
>              atomic_read(&s->start_postcopy)) {
>              if (postcopy_start(s)) {
>                  error_report("%s: postcopy failed to start", __func__);
> -- 
> 2.17.1
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

