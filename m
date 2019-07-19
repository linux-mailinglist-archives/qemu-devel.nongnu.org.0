Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E87F96E99E
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Jul 2019 18:49:28 +0200 (CEST)
Received: from localhost ([::1]:47116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hoW4W-0002of-3d
	for lists+qemu-devel@lfdr.de; Fri, 19 Jul 2019 12:49:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47236)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgilbert@redhat.com>) id 1hoW4J-0002NI-W0
 for qemu-devel@nongnu.org; Fri, 19 Jul 2019 12:49:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1hoW4I-0007eW-1S
 for qemu-devel@nongnu.org; Fri, 19 Jul 2019 12:49:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:1631)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1hoW4H-0006mS-6q
 for qemu-devel@nongnu.org; Fri, 19 Jul 2019 12:49:13 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0C2EF81E0F;
 Fri, 19 Jul 2019 16:48:03 +0000 (UTC)
Received: from work-vm (ovpn-117-245.ams2.redhat.com [10.36.117.245])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 30B8E1001B12;
 Fri, 19 Jul 2019 16:48:02 +0000 (UTC)
Date: Fri, 19 Jul 2019 17:47:59 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Message-ID: <20190719164759.GF3000@work-vm>
References: <20190709140924.13291-1-richardw.yang@linux.intel.com>
 <20190709140924.13291-2-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190709140924.13291-2-richardw.yang@linux.intel.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Fri, 19 Jul 2019 16:48:03 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 1/3] migration/savevm: flush file for
 iterable_only case
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
> It would be proper to flush file even for iterable_only case.
> 
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>

OK, I don't think this is actually necessary; but it's safe.
We only really need the flush at the end of the file, and in the
non-iterable-only case it's not the end of the file.

Since it makes your next change simpler,

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/savevm.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/migration/savevm.c b/migration/savevm.c
> index c0e557b4c2..becedcc1c6 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -1292,7 +1292,7 @@ int qemu_savevm_state_complete_precopy(QEMUFile *f, bool iterable_only,
>      }
>  
>      if (iterable_only) {
> -        return 0;
> +        goto flush;
>      }
>  
>      vmdesc = qjson_new();
> @@ -1353,6 +1353,7 @@ int qemu_savevm_state_complete_precopy(QEMUFile *f, bool iterable_only,
>      }
>      qjson_destroy(vmdesc);
>  
> +flush:
>      qemu_fflush(f);
>      return 0;
>  }
> -- 
> 2.17.1
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

