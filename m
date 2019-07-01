Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6545A159
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jun 2019 18:49:54 +0200 (CEST)
Received: from localhost ([::1]:34282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hgu4Q-0008TY-5X
	for lists+qemu-devel@lfdr.de; Fri, 28 Jun 2019 12:49:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53413)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgilbert@redhat.com>) id 1hgsd5-00048O-VZ
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 11:17:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1hgsd5-0007SB-1g
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 11:17:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60324)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1hgsd4-0007RR-SN
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 11:17:34 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 248EF30C1AE7;
 Fri, 28 Jun 2019 15:17:34 +0000 (UTC)
Received: from work-vm (ovpn-116-169.ams2.redhat.com [10.36.116.169])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 47F596012E;
 Fri, 28 Jun 2019 15:17:33 +0000 (UTC)
Date: Fri, 28 Jun 2019 16:17:30 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Message-ID: <20190628151730.GI2922@work-vm>
References: <20190627020822.15485-1-richardw.yang@linux.intel.com>
 <20190627020822.15485-4-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190627020822.15485-4-richardw.yang@linux.intel.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Fri, 28 Jun 2019 15:17:34 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 3/3] migration/postcopy: discard_length
 must not be 0
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
> Since we break the loop when there is no more page to discard, we are
> sure the following process would find some page to discard.
> 
> It is not necessary to check it again.
> 
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/ram.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/migration/ram.c b/migration/ram.c
> index b41b58ee54..246efe6939 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -2789,9 +2789,7 @@ static int postcopy_send_discard_bm_ram(MigrationState *ms,
>          } else {
>              discard_length = zero - one;
>          }
> -        if (discard_length) {
> -            postcopy_discard_send_range(ms, pds, one, discard_length);
> -        }
> +        postcopy_discard_send_range(ms, pds, one, discard_length);
>          current = one + discard_length;
>      }
>  
> -- 
> 2.19.1
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

