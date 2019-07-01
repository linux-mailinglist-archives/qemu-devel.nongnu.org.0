Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B521CCAD
	for <lists+qemu-devel@lfdr.de>; Tue, 14 May 2019 18:13:45 +0200 (CEST)
Received: from localhost ([127.0.0.1]:50641 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQa3k-0004aF-Is
	for lists+qemu-devel@lfdr.de; Tue, 14 May 2019 12:13:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33098)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1hQZmY-0007SZ-2g
	for qemu-devel@nongnu.org; Tue, 14 May 2019 11:55:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1hQZmV-0001Ni-Kq
	for qemu-devel@nongnu.org; Tue, 14 May 2019 11:55:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58086)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1hQZmV-0001Mo-DX
	for qemu-devel@nongnu.org; Tue, 14 May 2019 11:55:55 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C70DADBD9C;
	Tue, 14 May 2019 15:55:53 +0000 (UTC)
Received: from work-vm (ovpn-117-232.ams2.redhat.com [10.36.117.232])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F0CA6608A6;
	Tue, 14 May 2019 15:55:52 +0000 (UTC)
Date: Tue, 14 May 2019 16:55:50 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Message-ID: <20190514155550.GN2753@work-vm>
References: <20190424004700.12766-1-richardw.yang@linux.intel.com>
	<20190424004700.12766-2-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190424004700.12766-2-richardw.yang@linux.intel.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 14 May 2019 15:55:53 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 1/4] migration/savevm: remove duplicate
 check of migration_is_blocked
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Wei Yang (richardw.yang@linux.intel.com) wrote:
> Current call flow of save_snapshot is:
> 
>   save_snapshot
>     migration_is_blocked
>       qemu_savevm_state
>         migration_is_blocked
> 
> Since qemu_savevm_state is only called in save_snapshot, this means
> migration_is_blocked has been already checked.
> 
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>

Queued 1,3,4

> ---
>  migration/savevm.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/migration/savevm.c b/migration/savevm.c
> index 92af2471cd..2eea604624 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -1412,10 +1412,6 @@ static int qemu_savevm_state(QEMUFile *f, Error **errp)
>          return -EINVAL;
>      }
>  
> -    if (migration_is_blocked(errp)) {
> -        return -EINVAL;
> -    }
> -
>      if (migrate_use_block()) {
>          error_setg(errp, "Block migration and snapshots are incompatible");
>          return -EINVAL;
> -- 
> 2.19.1
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

