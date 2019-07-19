Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2728D6E85E
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Jul 2019 18:02:15 +0200 (CEST)
Received: from localhost ([::1]:46808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hoVKn-0000QO-VA
	for lists+qemu-devel@lfdr.de; Fri, 19 Jul 2019 12:02:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37730)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgilbert@redhat.com>) id 1hoVKZ-0008Pk-H6
 for qemu-devel@nongnu.org; Fri, 19 Jul 2019 12:02:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1hoVKQ-0003pU-Ig
 for qemu-devel@nongnu.org; Fri, 19 Jul 2019 12:01:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60626)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1hoVK7-0001Om-QV
 for qemu-devel@nongnu.org; Fri, 19 Jul 2019 12:01:35 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7347730A5A6F;
 Fri, 19 Jul 2019 15:56:56 +0000 (UTC)
Received: from work-vm (ovpn-117-245.ams2.redhat.com [10.36.117.245])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9AC7417F88;
 Fri, 19 Jul 2019 15:56:55 +0000 (UTC)
Date: Fri, 19 Jul 2019 16:56:53 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Message-ID: <20190719155653.GE3000@work-vm>
References: <20190710050814.31344-1-richardw.yang@linux.intel.com>
 <20190710050814.31344-3-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190710050814.31344-3-richardw.yang@linux.intel.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Fri, 19 Jul 2019 15:56:56 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 2/2] migration/postcopy: do_fixup is true
 when host_offset is non-zero
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
> This means it is not necessary to spare an extra variable to hold this
> condition. Use host_offset directly is fine.
> 
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/ram.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/migration/ram.c b/migration/ram.c
> index c4dc36e525..b0ca0059c4 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -2873,7 +2873,6 @@ static void postcopy_chunk_hostpages_pass(MigrationState *ms, bool unsent_pass,
>      }
>  
>      while (run_start < pages) {
> -        bool do_fixup = false;
>          unsigned long fixup_start_addr;
>          unsigned long host_offset;
>  
> @@ -2883,7 +2882,6 @@ static void postcopy_chunk_hostpages_pass(MigrationState *ms, bool unsent_pass,
>           */
>          host_offset = run_start % host_ratio;
>          if (host_offset) {
> -            do_fixup = true;
>              fixup_start_addr = run_start - host_offset;
>              /*
>               * This host page has gone, the next loop iteration starts
> @@ -2905,7 +2903,6 @@ static void postcopy_chunk_hostpages_pass(MigrationState *ms, bool unsent_pass,
>               */
>              host_offset = run_end % host_ratio;
>              if (host_offset) {
> -                do_fixup = true;
>                  fixup_start_addr = run_end - host_offset;
>                  /*
>                   * This host page has gone, the next loop iteration starts
> @@ -2921,7 +2918,7 @@ static void postcopy_chunk_hostpages_pass(MigrationState *ms, bool unsent_pass,
>              }
>          }
>  
> -        if (do_fixup) {
> +        if (host_offset) {
>              unsigned long page;
>  
>              /* Tell the destination to discard this page */
> -- 
> 2.17.1
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

