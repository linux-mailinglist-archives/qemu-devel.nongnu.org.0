Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 113EFBC55D
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Sep 2019 12:04:58 +0200 (CEST)
Received: from localhost ([::1]:43504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iChgm-0002tN-R8
	for lists+qemu-devel@lfdr.de; Tue, 24 Sep 2019 06:04:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59230)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iCheG-0001sY-CP
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 06:02:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iCheC-00031b-Dy
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 06:02:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36387)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iCheA-00030y-9k
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 06:02:15 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D8B51309E5B5;
 Tue, 24 Sep 2019 10:02:11 +0000 (UTC)
Received: from work-vm (ovpn-117-225.ams2.redhat.com [10.36.117.225])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D719460852;
 Tue, 24 Sep 2019 10:02:10 +0000 (UTC)
Date: Tue, 24 Sep 2019 11:02:08 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Subject: Re: [PATCH 1/3] migration/postcopy: not necessary to do discard when
 canonicalizing bitmap
Message-ID: <20190924100208.GA2725@work-vm>
References: <20190819061843.28642-1-richardw.yang@linux.intel.com>
 <20190819061843.28642-2-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190819061843.28642-2-richardw.yang@linux.intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Tue, 24 Sep 2019 10:02:11 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Wei Yang (richardw.yang@linux.intel.com) wrote:
> All pages, either partially sent or partially dirty, will be discarded in
> postcopy_send_discard_bm_ram(), since we update the unsentmap to be
> unsentmap = unsentmap | dirty in ram_postcopy_send_discard_bitmap().
> 
> This is not necessary to do discard when canonicalizing bitmap. And by
> doing so, we separate the page discard into two individual steps:
> 
>   * canonicalize bitmap
>   * discard page
> 
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>

Yes, I think when I originally wrote it, the set of pages that was
discarded was different; I think it was actually the set of 
!unsent & dirty - i.e. only pages that had been sent and then redirtied;
it later got reworked to include unsent pages as well - so this lot can
be simplified.



Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/ram.c | 14 +-------------
>  1 file changed, 1 insertion(+), 13 deletions(-)
> 
> diff --git a/migration/ram.c b/migration/ram.c
> index 35552c090b..075ddc468c 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -2928,7 +2928,7 @@ static int postcopy_each_ram_send_discard(MigrationState *ms)
>  }
>  
>  /**
> - * postcopy_chunk_hostpages_pass: canocalize bitmap in hostpages
> + * postcopy_chunk_hostpages_pass: canonicalize bitmap in hostpages
>   *
>   * Helper for postcopy_chunk_hostpages; it's called twice to
>   * canonicalize the two bitmaps, that are similar, but one is
> @@ -2991,18 +2991,6 @@ static void postcopy_chunk_hostpages_pass(MigrationState *ms, bool unsent_pass,
>                                                               host_ratio);
>              run_start = QEMU_ALIGN_UP(run_start, host_ratio);
>  
> -            /* Tell the destination to discard this page */
> -            if (unsent_pass || !test_bit(fixup_start_addr, unsentmap)) {
> -                /* For the unsent_pass we:
> -                 *     discard partially sent pages
> -                 * For the !unsent_pass (dirty) we:
> -                 *     discard partially dirty pages that were sent
> -                 *     (any partially sent pages were already discarded
> -                 *     by the previous unsent_pass)
> -                 */
> -                postcopy_discard_send_range(ms, fixup_start_addr, host_ratio);
> -            }
> -
>              /* Clean up the bitmap */
>              for (page = fixup_start_addr;
>                   page < fixup_start_addr + host_ratio; page++) {
> -- 
> 2.17.1
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

