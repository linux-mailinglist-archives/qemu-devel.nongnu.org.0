Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 267A34C35BC
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 20:22:05 +0100 (CET)
Received: from localhost ([::1]:54452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNJgi-0001NK-8b
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 14:22:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nNJDp-0000Oi-ER
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 13:52:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nNJDY-0005bD-97
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 13:52:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645728714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FthvWchKXm9IpyhtMqLcXivvpMpOFSZ5e+6s5mJ8wlA=;
 b=RxXh57geqI0TOV4gGNib5AVOmO922C6Cqf9rqBGLU3bzr6hAhqzf/+ND7dgszepcii9+H4
 IVAk5P7R+KeDWSrs/iDMoHsPSum/WuOXqcxWL7e8ZOILs81MmK1weKrF1y2LbLz+3aMnCY
 i12wduIviiBKT63nRbSsYEcspZzB6kA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-532-m6y6ABEuNWeeL16fVSbvmQ-1; Thu, 24 Feb 2022 13:51:52 -0500
X-MC-Unique: m6y6ABEuNWeeL16fVSbvmQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 m3-20020adfa3c3000000b001ea95eb48abso279552wrb.3
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 10:51:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=FthvWchKXm9IpyhtMqLcXivvpMpOFSZ5e+6s5mJ8wlA=;
 b=s84SNBgoEKqe6RkGNd0oBLpLHWOGlGZTtbve2qK2pKbmG8kXVbAymCP3O0SQC0HfuT
 X72uVAoZj0ozXAvQlNjHEwihCLJcikHl7OjdRYpwHwzdZxMGoqtoGfJaD+Cftnf68mqB
 woCc8RhJVKbRBMKo/15POoYRU3L11gTZj7oBXj6AmgKchSwwsmvcuq+F3hm+WkGuLpT4
 MPzZdsZTtEG6ujZdq1WSwyA7zMMBiCrI2qL0iw4y0nHyJGFw9B/ioHjBZ9z7LQPto2y+
 PZnv9fekUaxP/3HXRwLj8G+ZwpyBfk/Y5YqIvj3ySWA2+F/CKQVBULwsAgxwiZnXt/Fc
 wNnw==
X-Gm-Message-State: AOAM5327hnQbDif8N0tz6+s3oswnwrI3WMtyezXUR6MNcxRRv9TYw2xi
 gE7CsBh+ooSP8tBuYqB3WFo2nNOC3kAAS+45wIuQT9dEQn8TZ1cqh4g0PoYMNXKPdO76nPoRqAq
 6WPM51Is+CCAtmoo=
X-Received: by 2002:a05:600c:3046:b0:380:d5d3:930e with SMTP id
 n6-20020a05600c304600b00380d5d3930emr11883636wmh.12.1645728711708; 
 Thu, 24 Feb 2022 10:51:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwuxn70py9Okg8cjvFddBziZqzh3xkdReOgqsqecfKRCh3tJQzAqf7ELZnsbU2BbkhoiDVN8g==
X-Received: by 2002:a05:600c:3046:b0:380:d5d3:930e with SMTP id
 n6-20020a05600c304600b00380d5d3930emr11883607wmh.12.1645728711419; 
 Thu, 24 Feb 2022 10:51:51 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 u9-20020a05600c19c900b0037c050d73dcsm3868175wmq.46.2022.02.24.10.51.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 10:51:50 -0800 (PST)
Date: Thu, 24 Feb 2022 18:51:48 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Steve Sistare <steven.sistare@oracle.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH V7 05/29] vl: start on wakeup request
Message-ID: <YhfTxBKb7IIqpsj1@work-vm>
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
 <1640199934-455149-6-git-send-email-steven.sistare@oracle.com>
MIME-Version: 1.0
In-Reply-To: <1640199934-455149-6-git-send-email-steven.sistare@oracle.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Jason Zeng <jason.zeng@linux.intel.com>,
 Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Zheng Chuan <zhengchuan@huawei.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Steve Sistare (steven.sistare@oracle.com) wrote:
> If qemu starts and loads a VM in the suspended state, then a later wakeup
> request will set the state to running, which is not sufficient to initialize
> the vm, as vm_start was never called during this invocation of qemu.  See
> qemu_system_wakeup_request().
> 
> Define the start_on_wakeup_requested() hook to cause vm_start() to be called
> when processing the wakeup request.
> 
> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> ---
>  include/sysemu/runstate.h |  1 +
>  softmmu/runstate.c        | 17 ++++++++++++++++-
>  2 files changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/include/sysemu/runstate.h b/include/sysemu/runstate.h
> index a535691..b655c7b 100644
> --- a/include/sysemu/runstate.h
> +++ b/include/sysemu/runstate.h
> @@ -51,6 +51,7 @@ void qemu_system_reset_request(ShutdownCause reason);
>  void qemu_system_suspend_request(void);
>  void qemu_register_suspend_notifier(Notifier *notifier);
>  bool qemu_wakeup_suspend_enabled(void);
> +void qemu_system_start_on_wakeup_request(void);
>  void qemu_system_wakeup_request(WakeupReason reason, Error **errp);
>  void qemu_system_wakeup_enable(WakeupReason reason, bool enabled);
>  void qemu_register_wakeup_notifier(Notifier *notifier);
> diff --git a/softmmu/runstate.c b/softmmu/runstate.c
> index 10d9b73..3d344c9 100644
> --- a/softmmu/runstate.c
> +++ b/softmmu/runstate.c
> @@ -115,6 +115,8 @@ static const RunStateTransition runstate_transitions_def[] = {
>      { RUN_STATE_PRELAUNCH, RUN_STATE_RUNNING },
>      { RUN_STATE_PRELAUNCH, RUN_STATE_FINISH_MIGRATE },
>      { RUN_STATE_PRELAUNCH, RUN_STATE_INMIGRATE },
> +    { RUN_STATE_PRELAUNCH, RUN_STATE_SUSPENDED },
> +    { RUN_STATE_PRELAUNCH, RUN_STATE_PAUSED },

This seems separate? Is this the bit that allows you to load the VM into
suspended?
But I note you're allowing PAUSED or SUSPENDED here, but the wake up
code only handles suspended - is that expected?

>      { RUN_STATE_FINISH_MIGRATE, RUN_STATE_RUNNING },
>      { RUN_STATE_FINISH_MIGRATE, RUN_STATE_PAUSED },
> @@ -335,6 +337,7 @@ void vm_state_notify(bool running, RunState state)
>      }
>  }
>  
> +static bool start_on_wakeup_requested;
>  static ShutdownCause reset_requested;
>  static ShutdownCause shutdown_requested;
>  static int shutdown_signal;
> @@ -562,6 +565,11 @@ void qemu_register_suspend_notifier(Notifier *notifier)
>      notifier_list_add(&suspend_notifiers, notifier);
>  }
>  
> +void qemu_system_start_on_wakeup_request(void)
> +{
> +    start_on_wakeup_requested = true;
> +}

Markus: Is this OK, or should this actually be another runstate
(PRELAUNCH_SUSPENDED??? or the like??) - is there an interaction here
with the commandline change ideas for a build-the-guest at runtime?

Dave

>  void qemu_system_wakeup_request(WakeupReason reason, Error **errp)
>  {
>      trace_system_wakeup_request(reason);
> @@ -574,7 +582,14 @@ void qemu_system_wakeup_request(WakeupReason reason, Error **errp)
>      if (!(wakeup_reason_mask & (1 << reason))) {
>          return;
>      }
> -    runstate_set(RUN_STATE_RUNNING);
> +
> +    if (start_on_wakeup_requested) {
> +        start_on_wakeup_requested = false;
> +        vm_start();
> +    } else {
> +        runstate_set(RUN_STATE_RUNNING);
> +    }
> +
>      wakeup_reason = reason;
>      qemu_notify_event();
>  }
> -- 
> 1.8.3.1
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


