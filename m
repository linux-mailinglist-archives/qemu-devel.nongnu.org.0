Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1CD37D3FE
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 21:52:26 +0200 (CEST)
Received: from localhost ([::1]:54788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lguu9-0002zJ-7t
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 15:52:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lguLs-0005y7-OV
 for qemu-devel@nongnu.org; Wed, 12 May 2021 15:17:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lguLp-0003Wq-L0
 for qemu-devel@nongnu.org; Wed, 12 May 2021 15:17:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620847016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IDn/p+4xbfJYQ7h7tWe0cSwsfPJG2I0jFEARzoPJ29A=;
 b=arBzgq8qY4lTnfYaV7MaXgC40Jnl/HiXIC4+X+MRiWrrMmKqNdUfQOYZSDtlaKzuWV043d
 22BdQnYWRGfMLEM+ffhB8bnaqXo5ZmEfm2AI7k3UJA13qrV/VUQuSvBZdnUlxrjB3dCSOY
 Tl7QXkoogl0tl7V45m95F2o9aIH540M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-513-YiofQy4eMXqMJDhaQbwh2Q-1; Wed, 12 May 2021 15:16:53 -0400
X-MC-Unique: YiofQy4eMXqMJDhaQbwh2Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B11264159;
 Wed, 12 May 2021 19:16:52 +0000 (UTC)
Received: from work-vm (ovpn-115-17.ams2.redhat.com [10.36.115.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B72D419CB6;
 Wed, 12 May 2021 19:16:50 +0000 (UTC)
Date: Wed, 12 May 2021 20:16:47 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH] hmp: Fix loadvm to resume the VM on success instead of
 failure
Message-ID: <YJwpn+WbXx6A+Dad@work-vm>
References: <20210511163151.45167-1-kwolf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210511163151.45167-1-kwolf@redhat.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-stable@nongnu.org, berrange@redhat.com, yama@redhat.com,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Kevin Wolf (kwolf@redhat.com) wrote:
> Commit f61fe11aa6f broke hmp_loadvm() by adding an incorrect negation
> when converting from 0/-errno return values to a bool value. The result
> is that loadvm resumes the VM now if it failed and keeps it stopped if
> it failed. Fix it to restore the old behaviour and do it the other way
> around.

I think your wording is wrong there - you have two 'if it failed'

> Fixes: f61fe11aa6f7f8f0ffe4ddaa56a8108f3ab57854
> Cc: qemu-stable@nongnu.org
> Reported-by: Yanhui Ma <yama@redhat.com>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  monitor/hmp-cmds.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index 0ad5b77477..cc15d9b6ee 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -1133,7 +1133,7 @@ void hmp_loadvm(Monitor *mon, const QDict *qdict)
>  
>      vm_stop(RUN_STATE_RESTORE_VM);
>  
> -    if (!load_snapshot(name, NULL, false, NULL, &err) && saved_vm_running) {
> +    if (load_snapshot(name, NULL, false, NULL, &err) && saved_vm_running) {
>          vm_start();

So if I'm reading htat right, that gets you it restarting it if
load_snapshot returns true, and it returns true if the load_snapshot
worked; i.e. if we were running and we succesfully load a snasphot
then we carry on running.

Other than the commit message, it makes sense tome:


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

>      }

>      hmp_handle_error(mon, err);
> -- 
> 2.30.2
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


