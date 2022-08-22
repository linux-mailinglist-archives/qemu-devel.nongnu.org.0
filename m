Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B2D59BD62
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 12:13:13 +0200 (CEST)
Received: from localhost ([::1]:53186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQ4Qi-0007tl-6o
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 06:13:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oQ4P2-0006OT-Bo
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 06:11:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oQ4Oz-0001cS-8G
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 06:11:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661163082;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=K6ongmSrFfTl8zaOYcR/dA8kKNeZuRXRTXjxjLf3uIE=;
 b=WbxBOX/IRo2WxvNeDHGvz6UJj3WaKsOmsngrQWMDO735oXDAlEa8/5n+fnoJ3jy1d2fU7l
 CtlWVydrpmgFVQVWcYeFCnuG9Jmj5me/KGTtjWj3re7YeXyhbBL8oRgh7CvQJuUcw0owWC
 sMaZAsWleLkJZvtdNx51cImRRXTDCOs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-501-Hq6_ayGFMXGYJis0K0sykg-1; Mon, 22 Aug 2022 06:11:18 -0400
X-MC-Unique: Hq6_ayGFMXGYJis0K0sykg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2388A848199;
 Mon, 22 Aug 2022 10:11:12 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.58])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E2D840D283B;
 Mon, 22 Aug 2022 10:11:10 +0000 (UTC)
Date: Mon, 22 Aug 2022 11:11:08 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Joelle van Dyne <j@getutm.app>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 2/3] vl: on -loadvm set run state to "restore-vm"
Message-ID: <YwNWPFKchWnUIO8f@redhat.com>
References: <20220813011031.3744-1-j@getutm.app>
 <20220813011031.3744-3-j@getutm.app>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220813011031.3744-3-j@getutm.app>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 12, 2022 at 06:10:30PM -0700, Joelle van Dyne wrote:
> This allows us to differentiate between a fresh boot and a restore boot.
> 
> Signed-off-by: Joelle van Dyne <j@getutm.app>
> ---
>  softmmu/runstate.c | 1 +
>  softmmu/vl.c       | 3 +++
>  2 files changed, 4 insertions(+)

What happens if the user launches QEMU with -S and NOT  -loadvm, and
then uses the 'loadvm' monitor command to restore the VM state ?


> diff --git a/softmmu/runstate.c b/softmmu/runstate.c
> index 1e68680b9d..fa3dd3a4ab 100644
> --- a/softmmu/runstate.c
> +++ b/softmmu/runstate.c
> @@ -76,6 +76,7 @@ typedef struct {
>  
>  static const RunStateTransition runstate_transitions_def[] = {
>      { RUN_STATE_PRELAUNCH, RUN_STATE_INMIGRATE },
> +    { RUN_STATE_PRELAUNCH, RUN_STATE_RESTORE_VM },
>  
>      { RUN_STATE_DEBUG, RUN_STATE_RUNNING },
>      { RUN_STATE_DEBUG, RUN_STATE_FINISH_MIGRATE },
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 706bd7cff7..29586d94ff 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -3131,6 +3131,9 @@ void qemu_init(int argc, char **argv, char **envp)
>                  add_device_config(DEV_DEBUGCON, optarg);
>                  break;
>              case QEMU_OPTION_loadvm:
> +                if (!loadvm) {
> +                    runstate_set(RUN_STATE_RESTORE_VM);
> +                }
>                  loadvm = optarg;
>                  break;
>              case QEMU_OPTION_full_screen:
> -- 
> 2.28.0
> 
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


