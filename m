Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA8FB0CCD
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Sep 2019 12:24:35 +0200 (CEST)
Received: from localhost ([::1]:60378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i8MHC-0001Fh-MS
	for lists+qemu-devel@lfdr.de; Thu, 12 Sep 2019 06:24:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54071)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1i8MEW-0008AO-Fz
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 06:21:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1i8MEV-0008Hs-HL
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 06:21:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59798)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1i8MEV-0008HU-CR
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 06:21:47 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B92D53082D9E
 for <qemu-devel@nongnu.org>; Thu, 12 Sep 2019 10:21:46 +0000 (UTC)
Received: from work-vm (unknown [10.36.118.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 866E81001B09;
 Thu, 12 Sep 2019 10:21:42 +0000 (UTC)
Date: Thu, 12 Sep 2019 11:21:40 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Message-ID: <20190912102140.GF7230@work-vm>
References: <20190906130103.20961-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190906130103.20961-1-peterx@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Thu, 12 Sep 2019 10:21:46 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] migration: Fix postcopy bw for recovery
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
Cc: Laurent Vivier <lvivier@redhat.com>, Xiaohui Li <xiaohli@redhat.com>,
 qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> We've got max-postcopy-bandwidth parameter but it's not applied
> correctly after a postcopy recovery so the recovered migration stream
> will still eat the whole net bandwidth.  Fix that up.
> 
> Reported-by: Xiaohui Li <xiaohli@redhat.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Queued

> ---
>  migration/migration.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index 8b9f2fe30a..b307813aa3 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -3327,7 +3327,8 @@ void migrate_fd_connect(MigrationState *s, Error *error_in)
>  
>      if (resume) {
>          /* This is a resumed migration */
> -        rate_limit = INT64_MAX;
> +        rate_limit = s->parameters.max_postcopy_bandwidth /
> +            XFER_LIMIT_RATIO;
>      } else {
>          /* This is a fresh new migration */
>          rate_limit = s->parameters.max_bandwidth / XFER_LIMIT_RATIO;
> -- 
> 2.21.0
> 
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

