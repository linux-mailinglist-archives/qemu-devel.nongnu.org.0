Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 169D6CFE99
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Oct 2019 18:12:33 +0200 (CEST)
Received: from localhost ([::1]:58174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iHs6B-0008Vc-W1
	for lists+qemu-devel@lfdr.de; Tue, 08 Oct 2019 12:12:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37035)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iHrwD-0006hw-Op
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 12:02:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iHrwB-00079O-Ma
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 12:02:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:23327)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iHrw7-00073P-MX
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 12:02:07 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D7AB130ADBBA;
 Tue,  8 Oct 2019 16:02:05 +0000 (UTC)
Received: from work-vm (ovpn-116-59.ams2.redhat.com [10.36.116.59])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0737419C7F;
 Tue,  8 Oct 2019 16:02:04 +0000 (UTC)
Date: Tue, 8 Oct 2019 17:02:02 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Subject: Re: [PATCH 2/3] migration/postcopy: not necessary to do
 postcopy_ram_incoming_cleanup when state is ADVISE
Message-ID: <20191008160202.GE3441@work-vm>
References: <20191001100122.17730-1-richardw.yang@linux.intel.com>
 <20191001100122.17730-3-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191001100122.17730-3-richardw.yang@linux.intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Tue, 08 Oct 2019 16:02:05 +0000 (UTC)
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
> postcopy_ram_incoming_cleanup() does cleanup for
> postcopy_ram_incoming_setup(), while the setup happens only after
> migration enters LISTEN state.
> 
> This means there is nothing to cleanup when migration is still ADVISE
> state.
> 
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
> ---
>  migration/migration.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index 5f7e4d15e9..34d5e66f06 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -461,7 +461,6 @@ static void process_incoming_migration_co(void *opaque)
>               * but managed to complete within the precopy period, we can use
>               * the normal exit.
>               */
> -            postcopy_ram_incoming_cleanup(mis);
>          } else if (ret >= 0) {
>              /*
>               * Postcopy was started, cleanup should happen at the end of the

I think that misses the cleanup of mlock that corresponds to the
munlockall in postcopy_ram_supported_by_host - that's called very early
on; I think in the advise stage.

Dave

> -- 
> 2.17.1
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

