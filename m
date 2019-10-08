Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9473ED002A
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Oct 2019 19:50:29 +0200 (CEST)
Received: from localhost ([::1]:59488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iHtcy-0001MD-D3
	for lists+qemu-devel@lfdr.de; Tue, 08 Oct 2019 13:50:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51814)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iHtRR-0000nO-4h
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 13:38:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iHtRP-0007Aq-85
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 13:38:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41868)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iHtRP-0007AZ-2D
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 13:38:31 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1002B2026F;
 Tue,  8 Oct 2019 17:38:30 +0000 (UTC)
Received: from work-vm (ovpn-116-59.ams2.redhat.com [10.36.116.59])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CC1BD600CE;
 Tue,  8 Oct 2019 17:38:27 +0000 (UTC)
Date: Tue, 8 Oct 2019 18:38:25 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Subject: Re: [PATCH 1/4] migration/ram: only possible bit set in
 invalid_flags is RAM_SAVE_FLAG_COMPRESS_PAGE
Message-ID: <20191008173825.GI3441@work-vm>
References: <20191005220517.24029-1-richardw.yang@linux.intel.com>
 <20191005220517.24029-2-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191005220517.24029-2-richardw.yang@linux.intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Tue, 08 Oct 2019 17:38:30 +0000 (UTC)
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
> The only possible bit set in invalid_flags is
> RAM_SAVE_FLAG_COMPRESS_PAGE at the beginning of function
> ram_load_precopy(), which means it is not necessary to do
> another check for RAM_SAVE_FLAG_COMPRESS_PAGE bit.
> 
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
> ---
>  migration/ram.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/migration/ram.c b/migration/ram.c
> index 31051935c8..769d3f6454 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -4263,10 +4263,7 @@ static int ram_load_precopy(QEMUFile *f)
>          addr &= TARGET_PAGE_MASK;
>  
>          if (flags & invalid_flags) {
> -            if (flags & invalid_flags & RAM_SAVE_FLAG_COMPRESS_PAGE) {
> -                error_report("Received an unexpected compressed page");
> -            }
> -
> +            error_report("Received an unexpected compressed page");
>              ret = -EINVAL;

I'd rather keep this one; I think Juan's idea is that we might make
other flags illegal here and then it's easy to add to invalid_flags at
the top.

Dave
>              break;
>          }
> -- 
> 2.17.1
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

