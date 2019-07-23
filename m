Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F6971C07
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Jul 2019 17:45:07 +0200 (CEST)
Received: from localhost ([::1]:45154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hpwyQ-0000Ij-H7
	for lists+qemu-devel@lfdr.de; Tue, 23 Jul 2019 11:45:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50597)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgilbert@redhat.com>) id 1hpwyD-0008Ku-Ur
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 11:44:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1hpwyD-00032a-3q
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 11:44:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:4861)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1hpwyC-000328-UJ
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 11:44:53 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2AAA3308A958;
 Tue, 23 Jul 2019 15:44:52 +0000 (UTC)
Received: from work-vm (ovpn-117-202.ams2.redhat.com [10.36.117.202])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 50CC55C25A;
 Tue, 23 Jul 2019 15:44:51 +0000 (UTC)
Date: Tue, 23 Jul 2019 16:44:48 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Message-ID: <20190723154448.GM2719@work-vm>
References: <20190722075339.25121-1-richardw.yang@linux.intel.com>
 <20190722075339.25121-2-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190722075339.25121-2-richardw.yang@linux.intel.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Tue, 23 Jul 2019 15:44:52 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 1/2] migration: return -EINVAL directly
 when version_id mismatch
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
> It is not reasonable to continue when version_id mismatch.
> 
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
> ---
>  migration/ram.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/migration/ram.c b/migration/ram.c
> index 7e34c82a72..6bfdfae16e 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -4216,7 +4216,7 @@ static int ram_load(QEMUFile *f, void *opaque, int version_id)
>      seq_iter++;
>  
>      if (version_id != 4) {
> -        ret = -EINVAL;
> +        return -EINVAL;
>      }

Oh yes that's nice; it's before the lock gets taken so we can just
return


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

>      if (!migrate_use_compression()) {
> -- 
> 2.17.1
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

