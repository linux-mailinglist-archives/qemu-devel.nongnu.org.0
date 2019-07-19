Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C466E9B6
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Jul 2019 19:00:13 +0200 (CEST)
Received: from localhost ([::1]:47162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hoWEu-0008QS-4W
	for lists+qemu-devel@lfdr.de; Fri, 19 Jul 2019 13:00:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49351)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgilbert@redhat.com>) id 1hoWEf-000812-O5
 for qemu-devel@nongnu.org; Fri, 19 Jul 2019 12:59:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1hoWEe-0000kW-5W
 for qemu-devel@nongnu.org; Fri, 19 Jul 2019 12:59:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59226)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1hoWEd-0000jb-JS
 for qemu-devel@nongnu.org; Fri, 19 Jul 2019 12:59:55 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3D7E17FDF8;
 Fri, 19 Jul 2019 16:59:54 +0000 (UTC)
Received: from work-vm (ovpn-117-245.ams2.redhat.com [10.36.117.245])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A5565DA38;
 Fri, 19 Jul 2019 16:59:53 +0000 (UTC)
Date: Fri, 19 Jul 2019 17:59:50 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Message-ID: <20190719165950.GH3000@work-vm>
References: <20190709140924.13291-1-richardw.yang@linux.intel.com>
 <20190709140924.13291-4-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190709140924.13291-4-richardw.yang@linux.intel.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Fri, 19 Jul 2019 16:59:54 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 3/3] migration/savevm: move non
 SaveStateEntry condition check out of iteration
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
> in_postcopy and iterable_only are not SaveStateEntry specific, it would
> be more proper to check them out of iteration.
> 
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>

Worth it just to make that big if statement simpler!


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/savevm.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/migration/savevm.c b/migration/savevm.c
> index c41e13e322..8a2ada529e 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -1247,8 +1247,7 @@ void qemu_savevm_state_complete_postcopy(QEMUFile *f)
>  }
>  
>  static
> -int qemu_savevm_state_complete_precopy_iterable(QEMUFile *f, bool in_postcopy,
> -                                                bool iterable_only)
> +int qemu_savevm_state_complete_precopy_iterable(QEMUFile *f, bool in_postcopy)
>  {
>      SaveStateEntry *se;
>      int ret;
> @@ -1257,7 +1256,6 @@ int qemu_savevm_state_complete_precopy_iterable(QEMUFile *f, bool in_postcopy,
>          if (!se->ops ||
>              (in_postcopy && se->ops->has_postcopy &&
>               se->ops->has_postcopy(se->opaque)) ||
> -            (in_postcopy && !iterable_only) ||
>              !se->ops->save_live_complete_precopy) {
>              continue;
>          }
> @@ -1369,10 +1367,11 @@ int qemu_savevm_state_complete_precopy(QEMUFile *f, bool iterable_only,
>  
>      cpu_synchronize_all_states();
>  
> -    ret = qemu_savevm_state_complete_precopy_iterable(f, in_postcopy,
> -                                                      iterable_only);
> -    if (ret) {
> -        return ret;
> +    if (!in_postcopy || iterable_only) {
> +        ret = qemu_savevm_state_complete_precopy_iterable(f, in_postcopy);
> +        if (ret) {
> +            return ret;
> +        }
>      }
>  
>      if (iterable_only) {
> -- 
> 2.17.1
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

