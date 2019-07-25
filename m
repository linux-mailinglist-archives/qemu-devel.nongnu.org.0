Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D7C74F30
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jul 2019 15:23:02 +0200 (CEST)
Received: from localhost ([::1]:60180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqdhz-0000xk-Jb
	for lists+qemu-devel@lfdr.de; Thu, 25 Jul 2019 09:22:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47633)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgilbert@redhat.com>) id 1hqdhn-0000Z9-8i
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 09:22:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1hqdhm-0002gG-CI
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 09:22:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:31561)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1hqdhm-0002fM-6U
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 09:22:46 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D2B43326036A;
 Thu, 25 Jul 2019 13:22:43 +0000 (UTC)
Received: from work-vm (ovpn-117-187.ams2.redhat.com [10.36.117.187])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 726D819C7F;
 Thu, 25 Jul 2019 13:22:37 +0000 (UTC)
Date: Thu, 25 Jul 2019 14:22:34 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: "Oleinik, Alexander" <alxndr@bu.edu>
Message-ID: <20190725132234.GG2656@work-vm>
References: <20190725032321.12721-1-alxndr@bu.edu>
 <20190725032321.12721-6-alxndr@bu.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190725032321.12721-6-alxndr@bu.edu>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Thu, 25 Jul 2019 13:22:44 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [RFC 05/19] fuzz: expose qemu_savevm_state & skip
 state header
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
Cc: Juan Quintela <quintela@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "bsd@redhat.com" <bsd@redhat.com>,
 "superirishdonkey@gmail.com" <superirishdonkey@gmail.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Oleinik, Alexander (alxndr@bu.edu) wrote:
> Signed-off-by: Alexander Oleinik <alxndr@bu.edu>
> ---
>  migration/savevm.c | 8 ++++++--
>  migration/savevm.h | 3 +++
>  2 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/migration/savevm.c b/migration/savevm.c
> index 79ed44d475..80c00ea560 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -1404,8 +1404,11 @@ void qemu_savevm_state_cleanup(void)
>          }
>      }
>  }
> -
> +#ifdef CONFIG_FUZZ
> +int qemu_savevm_state(QEMUFile *f, Error **errp)
> +#else
>  static int qemu_savevm_state(QEMUFile *f, Error **errp)
> +#endif

If it's useful to you, I'd rather you just dropped the 'static'
rather than add the ifdef.

>  {
>      int ret;
>      MigrationState *ms = migrate_get_current();
> @@ -1471,11 +1474,12 @@ void qemu_savevm_live_state(QEMUFile *f)
>  int qemu_save_device_state(QEMUFile *f)
>  {
>      SaveStateEntry *se;
> -
> +#ifndef CONFIG_FUZZ
>      if (!migration_in_colo_state()) {
>          qemu_put_be32(f, QEMU_VM_FILE_MAGIC);
>          qemu_put_be32(f, QEMU_VM_FILE_VERSION);
>      }
> +#endif

Can you explain why you want to skip the header?

Dave

>      cpu_synchronize_all_states();
>  
>      QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
> diff --git a/migration/savevm.h b/migration/savevm.h
> index 51a4b9caa8..30315d0cfd 100644
> --- a/migration/savevm.h
> +++ b/migration/savevm.h
> @@ -64,4 +64,7 @@ void qemu_loadvm_state_cleanup(void);
>  int qemu_loadvm_state_main(QEMUFile *f, MigrationIncomingState *mis);
>  int qemu_load_device_state(QEMUFile *f);
>  
> +#ifdef CONFIG_FUZZ
> +int qemu_savevm_state(QEMUFile *f, Error **errp);
> +#endif
>  #endif
> -- 
> 2.20.1
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

