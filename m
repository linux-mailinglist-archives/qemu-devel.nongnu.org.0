Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AAC7581450
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 15:38:53 +0200 (CEST)
Received: from localhost ([::1]:56700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGKlv-0007Fu-VZ
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 09:38:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oGKeS-0000Gi-3m
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 09:31:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oGKeL-00048d-IN
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 09:31:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658842260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=L88WJSSnKsBWTmmJENz87fQanIxm7G/LF8vKeIxlWeU=;
 b=fksLeImVeKZFpgSwpdWbdQhtQTc+tGXhqhROwue5CojZIZbxI5pXW19cSW2Br1mOWDaWSH
 b+t5o74kF5N/93aY7elyKFPjf1tSDtJ8F8lOHhJ6otloCn91gFGivycZ6f+yKCwr2olCT3
 +whMTSq98hQH29YABcVJ5F/Qo8K8k64=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-568-P1c_qFJ3NCWOXSgoZwQjOw-1; Tue, 26 Jul 2022 09:30:58 -0400
X-MC-Unique: P1c_qFJ3NCWOXSgoZwQjOw-1
Received: by mail-io1-f70.google.com with SMTP id
 130-20020a6b0188000000b0067bd829cf29so5220213iob.17
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 06:30:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=L88WJSSnKsBWTmmJENz87fQanIxm7G/LF8vKeIxlWeU=;
 b=6Z5kAp1HK2qWwIiMKSbdXZQ1Bey74j9RH9ZgNgT/gZ90jD+nIgkuOIwm8ktom9QwqT
 tbU2FBYte0f+ojMaeJ5ufg42I0OFig/JYVZPato45okoYm7Qr34FfpkiBWSJSsw4+TiP
 x1Z5BodLWELlMuwQkbpdnt4EBZrWuQtUf6ow0e7UVsJdsOSqy932/Z/stfPPqi6sSSvX
 fBeAtUau8MnmlkEJmlyQc5v3jty0D7YK+oLBl1NGQHU51nSMaeO5V5beEMJmw4cjGAdj
 fg4+6hEk/WnJ9xPa9Iy+JcB32fw+MU686hUVtleqSAx2H/LJ0zhMYjV1/3PeUINrY1Vw
 +Mug==
X-Gm-Message-State: AJIora+pjKSDFl91vA8xGeW0z0/3aCRD9PkcDrBFHWY3yMgCJk+2X1ZS
 K+DPcwDeYtIKKm4uewFE3fxi6/7R0oGKcW02JIysrZ/FiQr1HR7dK6yynYEf2mODrtdHy9QeadX
 AGop0fVj1Yu3TZ5Q=
X-Received: by 2002:a05:6602:27cd:b0:669:3d8d:4d77 with SMTP id
 l13-20020a05660227cd00b006693d8d4d77mr5929524ios.216.1658842257920; 
 Tue, 26 Jul 2022 06:30:57 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uR46Rk9gJBIQI1vJsuXLX9bebewahIdEbzWFmJYiugBOJPYn+YG1WE2KFAjEuCrfyj4B+NpQ==
X-Received: by 2002:a05:6602:27cd:b0:669:3d8d:4d77 with SMTP id
 l13-20020a05660227cd00b006693d8d4d77mr5929517ios.216.1658842257672; 
 Tue, 26 Jul 2022 06:30:57 -0700 (PDT)
Received: from xz-m1.local
 (bras-base-aurron9127w-grc-35-70-27-3-10.dsl.bell.ca. [70.27.3.10])
 by smtp.gmail.com with ESMTPSA id
 h11-20020a92d84b000000b002d90c9077a2sm5645186ilq.57.2022.07.26.06.30.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 06:30:57 -0700 (PDT)
Date: Tue, 26 Jul 2022 09:30:55 -0400
From: Peter Xu <peterx@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v1 1/1] migration: add remaining params->has_* = true in
 migration_instance_init()
Message-ID: <Yt/sj9CU35TcLAH2@xz-m1.local>
References: <20220726010235.342927-1-leobras@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220726010235.342927-1-leobras@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 25, 2022 at 10:02:35PM -0300, Leonardo Bras wrote:
> Some of params->has_* = true are missing in migration_instance_init, this
> causes migrate_params_check() to skip some tests, allowing some
> unsupported scenarios.
> 
> Fix this by adding all missing params->has_* = true in
> migration_instance_init().
> 
> Signed-off-by: Leonardo Bras <leobras@redhat.com>
> ---
>  migration/migration.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index e03f698a3c..82fbe0cf55 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -4451,6 +4451,7 @@ static void migration_instance_init(Object *obj)
>      /* Set has_* up only for parameter checks */
>      params->has_compress_level = true;
>      params->has_compress_threads = true;
> +    params->has_compress_wait_thread = true;
>      params->has_decompress_threads = true;
>      params->has_throttle_trigger_threshold = true;
>      params->has_cpu_throttle_initial = true;
> @@ -4471,6 +4472,9 @@ static void migration_instance_init(Object *obj)
>      params->has_announce_max = true;
>      params->has_announce_rounds = true;
>      params->has_announce_step = true;
> +    params->has_tls_creds = true;
> +    params->has_tls_hostname = true;
> +    params->has_tls_authz = true;
>  
>      qemu_sem_init(&ms->postcopy_pause_sem, 0);
>      qemu_sem_init(&ms->postcopy_pause_rp_sem, 0);
> -- 
> 2.37.1
> 

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


