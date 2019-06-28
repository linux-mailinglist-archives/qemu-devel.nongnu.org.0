Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8595A11A
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jun 2019 18:38:27 +0200 (CEST)
Received: from localhost ([::1]:34198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hgttK-0000QG-Vh
	for lists+qemu-devel@lfdr.de; Fri, 28 Jun 2019 12:38:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51573)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgilbert@redhat.com>) id 1hgsVr-0006nL-PR
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 11:10:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1hgsVp-0001Df-Sc
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 11:10:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58514)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1hgsVn-0001BJ-Mp
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 11:10:03 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id BCB723E2B9;
 Fri, 28 Jun 2019 15:09:53 +0000 (UTC)
Received: from work-vm (ovpn-116-169.ams2.redhat.com [10.36.116.169])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 73AAB26561;
 Fri, 28 Jun 2019 15:09:52 +0000 (UTC)
Date: Fri, 28 Jun 2019 16:09:50 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Message-ID: <20190628150950.GG2922@work-vm>
References: <20190627020822.15485-1-richardw.yang@linux.intel.com>
 <20190627020822.15485-2-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190627020822.15485-2-richardw.yang@linux.intel.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Fri, 28 Jun 2019 15:09:53 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 1/3] migration/postcopy: the valid
 condition is one less then end
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
> If one equals end, it means we have gone through the whole bitmap.
> 
> Use a more restrict check to skip a unnecessary condition.
> 
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>

Yes, I don't think that'll break, since I think the find_next_zero_bit
will also return end, and then discard_length would be 0; still I think
it's a correct fix.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/ram.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/migration/ram.c b/migration/ram.c
> index 908517fc2b..b78169e811 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -2777,7 +2777,7 @@ static int postcopy_send_discard_bm_ram(MigrationState *ms,
>      for (current = 0; current < end; ) {
>          unsigned long one = find_next_bit(unsentmap, end, current);
>  
> -        if (one <= end) {
> +        if (one < end) {
>              unsigned long zero = find_next_zero_bit(unsentmap, end, one + 1);
>              unsigned long discard_length;
>  
> -- 
> 2.19.1
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

