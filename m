Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5A06EB52
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Jul 2019 21:46:47 +0200 (CEST)
Received: from localhost ([::1]:47644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hoYgT-0007a3-C7
	for lists+qemu-devel@lfdr.de; Fri, 19 Jul 2019 15:36:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42641)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgilbert@redhat.com>) id 1hoYgF-0007BN-QY
 for qemu-devel@nongnu.org; Fri, 19 Jul 2019 15:36:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1hoYgE-0007zU-E0
 for qemu-devel@nongnu.org; Fri, 19 Jul 2019 15:36:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47854)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1hoYgD-0007uB-Qu
 for qemu-devel@nongnu.org; Fri, 19 Jul 2019 15:36:34 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C8DB18F91B;
 Fri, 19 Jul 2019 18:41:31 +0000 (UTC)
Received: from work-vm (ovpn-117-245.ams2.redhat.com [10.36.117.245])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F044D4FFDF;
 Fri, 19 Jul 2019 18:41:30 +0000 (UTC)
Date: Fri, 19 Jul 2019 19:41:28 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Message-ID: <20190719184128.GO3000@work-vm>
References: <20190718064257.29218-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190718064257.29218-1-richardw.yang@linux.intel.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Fri, 19 Jul 2019 18:41:31 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] migration: equation is more proper than
 and to check LOADVM_QUIT
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
> LOADVM_QUIT allows a command to quit all layers of nested loadvm loops,
> while current return value check is not that proper even it works now.
> 
> Current return value check "ret & LOADVM_QUIT" would return true if
> bit[0] is 1. This would be true when ret is -1 which is used to indicate
> an error of handling a command.
> 
> Since there is only one place return LOADVM_QUIT and no other
> combination of return value, use "ret == LOADVM_QUIT" would be more
> proper.

Yes, when I first wrote this it was more complex with a few flags, and
they all got removed.

> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/savevm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/migration/savevm.c b/migration/savevm.c
> index 1a9b1f411e..25fe7ea05a 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -2429,7 +2429,7 @@ retry:
>          case QEMU_VM_COMMAND:
>              ret = loadvm_process_command(f);
>              trace_qemu_loadvm_state_section_command(ret);
> -            if ((ret < 0) || (ret & LOADVM_QUIT)) {
> +            if ((ret < 0) || (ret == LOADVM_QUIT)) {
>                  goto out;
>              }
>              break;
> -- 
> 2.17.1
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

