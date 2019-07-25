Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A9E74BC0
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jul 2019 12:39:29 +0200 (CEST)
Received: from localhost ([::1]:58504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqb9k-0006vW-Be
	for lists+qemu-devel@lfdr.de; Thu, 25 Jul 2019 06:39:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35619)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgilbert@redhat.com>) id 1hqb9Y-0006Vi-Cb
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 06:39:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1hqb9X-0003OS-BL
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 06:39:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52930)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1hqb9X-0003NK-3Y
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 06:39:15 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id DC8C981DEE;
 Thu, 25 Jul 2019 10:39:13 +0000 (UTC)
Received: from work-vm (ovpn-117-187.ams2.redhat.com [10.36.117.187])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B96185F9C4;
 Thu, 25 Jul 2019 10:39:09 +0000 (UTC)
Date: Thu, 25 Jul 2019 11:39:07 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Message-ID: <20190725103907.GD2656@work-vm>
References: <1563261042-15974-1-git-send-email-yan.y.zhao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1563261042-15974-1-git-send-email-yan.y.zhao@intel.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Thu, 25 Jul 2019 10:39:14 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] migration: notify runstate immediately
 before vcpu stops
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
Cc: kevin.tian@intel.com, cohuck@redhat.com, quintela@redhat.com,
 crosthwaite.peter@gmail.com, qemu-devel@nongnu.org, alex.williamson@redhat.com,
 pbonzini@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Yan Zhao (yan.y.zhao@intel.com) wrote:
> for some devices to do live migration, it is needed to do something
> immediately before vcpu stops. add a notification here.
> 
> Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
> ---
>  cpus.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/cpus.c b/cpus.c
> index b09b702..d5d4abe 100644
> --- a/cpus.c
> +++ b/cpus.c
> @@ -1068,6 +1068,7 @@ static int do_vm_stop(RunState state, bool send_stop)
>      int ret = 0;
>  
>      if (runstate_is_running()) {
> +        vm_state_notify(1, state);

SO that's quite interesting in that you'll end up getting a
notificatiion like 'running=true, state=RUN_STATE_SHUTDOWN'
that might be unexpected by existing callers.

Have you checked existing callers?  Also does this cause another event
to be sent on the QMP - if so we need to chekc if this would confuse
libvirt.

Dave

>          cpu_disable_ticks();
>          pause_all_vcpus();
>          runstate_set(state);
> -- 
> 2.7.4
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

