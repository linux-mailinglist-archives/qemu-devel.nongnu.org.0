Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD196E83D
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Jul 2019 17:52:39 +0200 (CEST)
Received: from localhost ([::1]:46534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hoVBX-000054-2d
	for lists+qemu-devel@lfdr.de; Fri, 19 Jul 2019 11:52:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36176)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgilbert@redhat.com>) id 1hoVBJ-00084a-8N
 for qemu-devel@nongnu.org; Fri, 19 Jul 2019 11:52:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1hoVB1-00084C-Lx
 for qemu-devel@nongnu.org; Fri, 19 Jul 2019 11:52:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48122)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1hoVAp-0006Pi-M1
 for qemu-devel@nongnu.org; Fri, 19 Jul 2019 11:51:59 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5037730BD1C7;
 Fri, 19 Jul 2019 15:48:29 +0000 (UTC)
Received: from work-vm (ovpn-117-245.ams2.redhat.com [10.36.117.245])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 778311001B14;
 Fri, 19 Jul 2019 15:48:28 +0000 (UTC)
Date: Fri, 19 Jul 2019 16:48:26 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Message-ID: <20190719154826.GD3000@work-vm>
References: <20190710050814.31344-1-richardw.yang@linux.intel.com>
 <20190710050814.31344-2-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190710050814.31344-2-richardw.yang@linux.intel.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Fri, 19 Jul 2019 15:48:29 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 1/2] migration/postcopy: reduce one
 operation to calculate fixup_start_addr
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
> Use the same way for run_end to calculate run_start, which saves one
> operation.
> 
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/ram.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/migration/ram.c b/migration/ram.c
> index 410e0f89fe..c4dc36e525 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -2884,10 +2884,12 @@ static void postcopy_chunk_hostpages_pass(MigrationState *ms, bool unsent_pass,
>          host_offset = run_start % host_ratio;
>          if (host_offset) {
>              do_fixup = true;
> -            run_start -= host_offset;
> -            fixup_start_addr = run_start;
> -            /* For the next pass */
> -            run_start = run_start + host_ratio;
> +            fixup_start_addr = run_start - host_offset;
> +            /*
> +             * This host page has gone, the next loop iteration starts
> +             * from after the fixup
> +             */
> +            run_start = fixup_start_addr + host_ratio;
>          } else {
>              /* Find the end of this run */
>              unsigned long run_end;
> -- 
> 2.17.1
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

