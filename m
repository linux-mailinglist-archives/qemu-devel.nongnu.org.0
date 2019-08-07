Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1B58532F
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Aug 2019 20:47:27 +0200 (CEST)
Received: from localhost ([::1]:44470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hvQy6-00073n-9A
	for lists+qemu-devel@lfdr.de; Wed, 07 Aug 2019 14:47:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43033)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgilbert@redhat.com>) id 1hvQxN-0006CQ-3N
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 14:46:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1hvQxL-0001Gn-Ho
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 14:46:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48064)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1hvQxL-0001BI-8U
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 14:46:39 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id AAB2430FB8FE;
 Wed,  7 Aug 2019 18:46:37 +0000 (UTC)
Received: from work-vm (ovpn-117-204.ams2.redhat.com [10.36.117.204])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CE3C719C69;
 Wed,  7 Aug 2019 18:46:36 +0000 (UTC)
Date: Wed, 7 Aug 2019 19:46:34 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Message-ID: <20190807184634.GR27871@work-vm>
References: <20190402003106.17614-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190402003106.17614-1-richardw.yang@linux.intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Wed, 07 Aug 2019 18:46:37 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] migration: remove unused field bytes_xfer
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
> MigrationState->bytes_xfer is only set to 0 in migrate_init().
> 
> Remove this unnecessary field.
> 
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>

Queued (finally!)

> ---
>  migration/migration.c | 1 -
>  migration/migration.h | 1 -
>  2 files changed, 2 deletions(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index dea7078bf4..c929cf8d0f 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -1681,7 +1681,6 @@ void migrate_init(MigrationState *s)
>       * parameters/capabilities that the user set, and
>       * locks.
>       */
> -    s->bytes_xfer = 0;
>      s->cleanup_bh = 0;
>      s->to_dst_file = NULL;
>      s->rp_state.from_dst_file = NULL;
> diff --git a/migration/migration.h b/migration/migration.h
> index 852eb3c4e9..b9efbe9168 100644
> --- a/migration/migration.h
> +++ b/migration/migration.h
> @@ -116,7 +116,6 @@ struct MigrationState
>      DeviceState parent_obj;
>  
>      /*< public >*/
> -    size_t bytes_xfer;
>      QemuThread thread;
>      QEMUBH *cleanup_bh;
>      QEMUFile *to_dst_file;
> -- 
> 2.19.1
> 
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

