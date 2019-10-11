Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3154D4118
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Oct 2019 15:27:09 +0200 (CEST)
Received: from localhost ([::1]:50130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIuwm-0006Mw-Q2
	for lists+qemu-devel@lfdr.de; Fri, 11 Oct 2019 09:27:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35725)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iIuvx-0005rZ-Cn
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 09:26:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iIuvw-0001S7-4Z
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 09:26:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39996)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iIuvv-0001Rj-ST
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 09:26:16 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id BF12118CB8F0;
 Fri, 11 Oct 2019 13:26:14 +0000 (UTC)
Received: from work-vm (ovpn-117-210.ams2.redhat.com [10.36.117.210])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 527CE61559;
 Fri, 11 Oct 2019 13:26:11 +0000 (UTC)
Date: Fri, 11 Oct 2019 14:26:08 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, peterx@redhat.com, quintela@redhat.com,
 groug@kaod.org
Subject: Re: [PATCH] migration: Don't try and recover return path in
 non-postcopy
Message-ID: <20191011132608.GC18007@work-vm>
References: <20191007103507.31308-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191007103507.31308-1-dgilbert@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.63]); Fri, 11 Oct 2019 13:26:14 +0000 (UTC)
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Dr. David Alan Gilbert (git) (dgilbert@redhat.com) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> In normal precopy we can't do reconnection recovery - but we also
> don't need to, since you can just rerun migration.
> At the moment if the 'return-path' capability is on, we use
> the return path in precopy to give a postiive 'OK' to the end
> of migration; however if migration fails then we fall into
> the postcopy recovery path and hang.  This fixes it by only
> running the return path in the postcopy case.
> 
> Reported-by: Greg Kurz <groug@kaod.org>
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Queued

> ---
>  migration/migration.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index 5f7e4d15e9..d5d9b31bb7 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -2481,7 +2481,7 @@ retry:
>  out:
>      res = qemu_file_get_error(rp);
>      if (res) {
> -        if (res == -EIO) {
> +        if (res == -EIO && migration_in_postcopy()) {
>              /*
>               * Maybe there is something we can do: it looks like a
>               * network down issue, and we pause for a recovery.
> -- 
> 2.21.0
> 
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

