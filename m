Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0376949D3DF
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 21:53:40 +0100 (CET)
Received: from localhost ([::1]:60866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCpIQ-0006oE-Lm
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 15:53:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nCpG9-0005oP-Hu
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 15:51:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nCpG6-0002t7-8U
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 15:51:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643230272;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=cn/iV6Mq6YnouZje/MQPeKpn5NDZtk7jfS5mPux/v5k=;
 b=hhPZN2n+ZbDo46f9GlvqKWYEZN45280ocff3IL6EcIVj44OBko1t2XWz2BjLiShniy9xlB
 9nOQF9ZdcpqZy2KIKAxjkDsUPa07tsTm+DsYwrlBuiM68jhQz2TLdBWJRjJfm6qWTTwe1n
 s77JzQW1+QC1LnWSygRkUyJhbjRtsY8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-349-TyOqYZg6PhukG7yCKG89GQ-1; Wed, 26 Jan 2022 15:51:09 -0500
X-MC-Unique: TyOqYZg6PhukG7yCKG89GQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 n7-20020a1c7207000000b0034ec3d8ce0aso443099wmc.8
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 12:51:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=cn/iV6Mq6YnouZje/MQPeKpn5NDZtk7jfS5mPux/v5k=;
 b=cBIAegAL2yIOXqoFyN6SC/xYzGbPGpzsmifCfW0qvMWj6zm04Iqu7KE4XmQsYJKo5O
 43pVpk3PlxU4QDCx3Cxujev2gr2d0B5cbk9pOjTikdhCApznOl7KQYu9y8CylRdVYRju
 p/Ds0K7tSnFPktpeh3FAUyjRdRGJxuJN0bvSet7YNB19hJPNeOMLH6JrRt+dYadqjhU/
 pnxb7u+TeOzkbRx6D6VSo1vQnDhLqc68J8r0W0RqFZ9V1HoU6kGjW+VOddu433KzWCcc
 xYp1o96A0tfWd6+vFb4lq9cLLVd1B890J8fXJ5SOxDrgxVIZbdsDkaiiJcBJ+T/NJrbR
 F5RQ==
X-Gm-Message-State: AOAM532QjDyIdtRgdU7NkouicFz/xjc6/ZaVQU5xHkr+rTC8UDRgn+ou
 Bd/X087A/2UN9mJAyYaLAMNRWJHrSUUrVvf8RTiGXlExogbin5L/cJvUh8KZJJsD4tS7CYgEZRm
 khvV7ljCoyQ69yl8=
X-Received: by 2002:a1c:f404:: with SMTP id z4mr8984961wma.165.1643230268043; 
 Wed, 26 Jan 2022 12:51:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw6u5s0vWFYESxiaN69AtfS2OFvSC312y69X+aspV9WIJMKTPVAKDt4gEgWudsbYZ4U5vJK5g==
X-Received: by 2002:a1c:f404:: with SMTP id z4mr8984946wma.165.1643230267860; 
 Wed, 26 Jan 2022 12:51:07 -0800 (PST)
Received: from localhost ([47.61.17.76])
 by smtp.gmail.com with ESMTPSA id t16sm288901wmq.21.2022.01.26.12.51.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 12:51:07 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Rao Lei <lei.rao@intel.com>
Subject: Re: [PATCH] migration/colo.c: Add missed return in error handling
In-Reply-To: <20211228073517.88193-1-lei.rao@intel.com> (Rao Lei's message of
 "Tue, 28 Dec 2021 15:35:17 +0800")
References: <20211228073517.88193-1-lei.rao@intel.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Wed, 26 Jan 2022 21:51:06 +0100
Message-ID: <87r18unrut.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.155,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: chen.zhang@intel.com, zhanghailiang@xfusion.com, dgilbert@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rao Lei <lei.rao@intel.com> wrote:
> When doing failover and checkpoint, some returns are missed in error
> handling. Let's add it.
>
> Signed-off-by: Lei Rao <lei.rao@intel.com>
> ---
>  migration/colo.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/migration/colo.c b/migration/colo.c
> index 5f7071b3cd..014d3cba01 100644
> --- a/migration/colo.c
> +++ b/migration/colo.c
> @@ -94,12 +94,15 @@ static void secondary_vm_do_failover(void)
>      if (local_err) {
>          error_report_err(local_err);
>          local_err = NULL;
> +        return;

Assign a local variable before a return is a NOP, so remove the assignmenent?

>      }
>  
>      /* Notify all filters of all NIC to do checkpoint */
>      colo_notify_filters_event(COLO_EVENT_FAILOVER, &local_err);
>      if (local_err) {
>          error_report_err(local_err);
> +        local_err = NULL;
> +        return;

Same here.

>      }
>  
>      if (!autostart) {
> @@ -178,6 +181,7 @@ static void primary_vm_do_failover(void)
>      if (local_err) {
>          error_report_err(local_err);
>          local_err = NULL;
> +        return;

And here.

>      }
>  
>      /* Notify COLO thread that failover work is finished */
> @@ -507,12 +511,11 @@ static int colo_do_checkpoint_transaction(MigrationState *s,
>          goto out;
>      }
>  
> -    ret = 0;
> -
>      qemu_mutex_lock_iothread();
>      vm_start();
>      qemu_mutex_unlock_iothread();
>      trace_colo_vm_state_change("stop", "run");
> +    return 0;
>  
>  out:
>      if (local_err) {

This is really a NOP, but it is one line less, so I will not complain.

But ther, it is better to just rename the label from "out" to "error" or
something like that.

Later, Juan.


