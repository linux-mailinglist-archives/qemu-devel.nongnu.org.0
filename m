Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D062473E37
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 09:26:03 +0100 (CET)
Received: from localhost ([::1]:33964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx38M-0001Bd-7F
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 03:26:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mx36T-0006E7-Jm
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 03:24:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34391)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mx36Q-00030p-2g
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 03:24:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639470240;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=7WuNE7njJQb3wQ9goKrur6YaQ+dwv6ORkDCDzZCUovg=;
 b=NMegn7YcgMLfvoh3Xpg0ac8hE6ii1AIB9rtEzehfbMrvo1WMXhyHmfT8u3XA1yyjgoMW99
 9HnBAF4HFk0C2YW87RBbME1RHFy8Pr9ChxNVIfaIgVShN+yVzhuaGrQRIK+tO7WePZeugb
 iDrZgswAsIfrj/g2Rchjv3UaYLAeR4Q=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-96-HdodEtZ8M6WDCxsKFCK-Rw-1; Tue, 14 Dec 2021 03:23:54 -0500
X-MC-Unique: HdodEtZ8M6WDCxsKFCK-Rw-1
Received: by mail-wm1-f71.google.com with SMTP id
 j20-20020a05600c1c1400b00343ad0c4c40so905175wms.0
 for <qemu-devel@nongnu.org>; Tue, 14 Dec 2021 00:23:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=7WuNE7njJQb3wQ9goKrur6YaQ+dwv6ORkDCDzZCUovg=;
 b=qhasJEfLPFOWv67/ehBp4h3IzJGtG0s2TmA2aQYmyR/pnpCI9tRgVbBt1sgw0Xb6nd
 mxTbh8U39u14cqwkKRemQzcAEUXLv6/64WqeUwRyFu2AkmFZF2KorOtD6049zuJHmKpa
 rO+Bja/aA2la4rzMVv3yJ9YtvKy1BzcW4MTwAYAAcUDPXz+SwqogRoQqnc9Ywd38X+oO
 zE7Tx4LttVkVC8SRzqjKekBeN2tuo/qjy2A2lq07qGxZIsNJKZOOaJFUdBppQOUaNkIb
 NR1TYvRh2arP6Qbj6jlHV9TZcPLqVCP9d7R/wtFkwpU/gUqIkPGOCHnj+vdwkKBLTRof
 KL4w==
X-Gm-Message-State: AOAM531AV1r6vL/VD+CMlnO8pqDG7KSjXegUTrKsde9ukI3eMDvN6UFF
 qvLruq283IZWiQ6n6kfXgFSjhvpfXAM7YtTcYjCJrK7mKkEh93n84j41Bc60EtbDOWqxrW9LE4T
 +lhXLegf4kuA5rV0=
X-Received: by 2002:adf:dc44:: with SMTP id m4mr4192306wrj.550.1639470233015; 
 Tue, 14 Dec 2021 00:23:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyVzN+tovHy3aGw4uZltKki/pibZ9xs5ZWLE0v6ZutodM2tsAyhhvF3oaPNMEaUM75SWcqU0A==
X-Received: by 2002:adf:dc44:: with SMTP id m4mr4192286wrj.550.1639470232848; 
 Tue, 14 Dec 2021 00:23:52 -0800 (PST)
Received: from localhost (static-174-144-85-188.ipcom.comunitel.net.
 [188.85.144.174])
 by smtp.gmail.com with ESMTPSA id l3sm1460665wmq.46.2021.12.14.00.23.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 00:23:52 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: "Rao, Lei" <lei.rao@intel.com>
Subject: Re: [PATCH v2] COLO: Move some trace code behind
 qemu_mutex_unlock_iothread()
In-Reply-To: <20211214171945.217843-1-lei.rao@intel.com> (Lei Rao's message of
 "Wed, 15 Dec 2021 01:19:45 +0800")
References: <20211214171945.217843-1-lei.rao@intel.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Tue, 14 Dec 2021 09:23:51 +0100
Message-ID: <87czlz7fxk.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Cc: chen.zhang@intel.com, dgilbert@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Rao, Lei" <lei.rao@intel.com> wrote:
> There is no need to put some trace code in the critical section.
> So, moving it behind qemu_mutex_unlock_iothread() can reduce the
> lock time.
>
> Signed-off-by: Lei Rao <lei.rao@intel.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

queued for 7.0

> ---
>  migration/colo.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/migration/colo.c b/migration/colo.c
> index 2415325262..3ccacb29c8 100644
> --- a/migration/colo.c
> +++ b/migration/colo.c
> @@ -683,8 +683,8 @@ static void colo_incoming_process_checkpoint(MigrationIncomingState *mis,
>  
>      qemu_mutex_lock_iothread();
>      vm_stop_force_state(RUN_STATE_COLO);
> -    trace_colo_vm_state_change("run", "stop");
>      qemu_mutex_unlock_iothread();
> +    trace_colo_vm_state_change("run", "stop");
>  
>      /* FIXME: This is unnecessary for periodic checkpoint mode */
>      colo_send_message(mis->to_src_file, COLO_MESSAGE_CHECKPOINT_REPLY,
> @@ -786,8 +786,8 @@ static void colo_incoming_process_checkpoint(MigrationIncomingState *mis,
>  
>      vmstate_loading = false;
>      vm_start();
> -    trace_colo_vm_state_change("stop", "run");
>      qemu_mutex_unlock_iothread();
> +    trace_colo_vm_state_change("stop", "run");
>  
>      if (failover_get_state() == FAILOVER_STATUS_RELAUNCH) {
>          return;
> @@ -870,8 +870,8 @@ void *colo_process_incoming_thread(void *opaque)
>          abort();
>  #endif
>      vm_start();
> -    trace_colo_vm_state_change("stop", "run");
>      qemu_mutex_unlock_iothread();
> +    trace_colo_vm_state_change("stop", "run");
>  
>      colo_send_message(mis->to_src_file, COLO_MESSAGE_CHECKPOINT_READY,
>                        &local_err);


