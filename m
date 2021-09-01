Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C5C3FE19C
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 19:58:43 +0200 (CEST)
Received: from localhost ([::1]:34812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLUVW-0002Mo-Eu
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 13:58:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mLUU3-0000LW-Cb
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 13:57:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mLUTz-00017I-Dz
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 13:57:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630519025;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HJk13/hM96f8sYfiCYDrdHcBl5w7fiV1NuUmsjsDy38=;
 b=L5YKWC09ffojhUm6HSbmN4fi9KU7x5Qko+1zRelYam9UZt3ggb04zXZ6io/DMx1CPOkECp
 Tc+XiKp6JmPkJkeMVG93gL18Q1tDaactkw0K38U3hLQWIk/BBc0+0qz6ale+g/9TclQOet
 M6eHI3lnhTM0UJnTyPRW804WSA4x4Dw=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-1ewdsgiSMrCnAOkrhMljSw-1; Wed, 01 Sep 2021 13:57:04 -0400
X-MC-Unique: 1ewdsgiSMrCnAOkrhMljSw-1
Received: by mail-qt1-f197.google.com with SMTP id
 x11-20020ac86b4b000000b00299d7592d31so369168qts.0
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 10:57:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HJk13/hM96f8sYfiCYDrdHcBl5w7fiV1NuUmsjsDy38=;
 b=bf7uCBjmC/W7dThgaR8bvfkMsK/gSixvo0YZ1uJ4VfkQgEiglKI31VfdqZcO83fQs1
 X+pEe6X//A8yUhCpFXOzQ1K2B9iJYpwGqonDUcEIpi50S8WOgl0bcnnRRLLjr4Wo3TI8
 14KJuYbrdKhEbrXdvXGKDPrXG3DCXtMgwuMP9KOxzFWbzMtQwGMmwE9XOTGpvzYMzBW7
 DGSZG5k29NlE+5JcCYfliJvkzgJxV8EToMEVUKwbHlTKrbr6fKrzX5kQnl5CBpSZ2cFM
 9V3VibIGxfPl09f7wNQ4KbaHRXlXM9xN2k6iy40hyYDjIIbITsXLDJsaOk9KHY9tYhGZ
 72fA==
X-Gm-Message-State: AOAM531Tw1fp4yevrEL+5IPboRmViQw33w4eOREyUVQNX+nuZR+weJX8
 GRgttNCvNLl9Sd4X8nDI09/0lf81klVkUJZbggovFudalyPvp5+stcBZ3yFVnwAc2FjcQj6015x
 3RfWoEVMUa6yh4/I=
X-Received: by 2002:ac8:7ca9:: with SMTP id z9mr632340qtv.187.1630519024253;
 Wed, 01 Sep 2021 10:57:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwAb+mbMWaNjwHBNnvgV8pa3EK08eoBkg/wme8HCKT+j0LM6RnKJn6XwIOd6AH2ZcixMjW8yQ==
X-Received: by 2002:ac8:7ca9:: with SMTP id z9mr632326qtv.187.1630519023994;
 Wed, 01 Sep 2021 10:57:03 -0700 (PDT)
Received: from t490s ([2607:fea8:56a3:500::ad7f])
 by smtp.gmail.com with ESMTPSA id c28sm148109qkl.69.2021.09.01.10.57.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 10:57:03 -0700 (PDT)
Date: Wed, 1 Sep 2021 13:57:02 -0400
From: Peter Xu <peterx@redhat.com>
To: Lukas Straub <lukasstraub2@web.de>
Subject: Re: [PATCH] multifd: Implement yank for multifd send side
Message-ID: <YS++7hzGpvm/aCaD@t490s>
References: <20210901175857.0858efe1@gecko.fritz.box>
MIME-Version: 1.0
In-Reply-To: <20210901175857.0858efe1@gecko.fritz.box>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 01, 2021 at 05:58:57PM +0200, Lukas Straub wrote:
> When introducing yank functionality in the migration code I forgot
> to cover the multifd send side.
> 
> Signed-off-by: Lukas Straub <lukasstraub2@web.de>
> Tested-by: Leonardo Bras <leobras@redhat.com>
> Reviewed-by: Leonardo Bras <leobras@redhat.com>
> ---
> 
> -v2:
>  -add Tested-by and Reviewed-by tags
> 
>  migration/multifd.c | 6 +++++-
>  migration/multifd.h | 2 ++
>  2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 377da78f5b..5a4f158f3c 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -546,6 +546,9 @@ void multifd_save_cleanup(void)
>          MultiFDSendParams *p = &multifd_send_state->params[i];
>          Error *local_err = NULL;
>  
> +        if (p->registered_yank) {
> +            migration_ioc_unregister_yank(p->c);
> +        }
>          socket_send_channel_destroy(p->c);
>          p->c = NULL;
>          qemu_mutex_destroy(&p->mutex);
> @@ -813,7 +816,8 @@ static bool multifd_channel_connect(MultiFDSendParams *p,
>                  return false;
>              }
>          } else {
> -            /* update for tls qio channel */
> +            migration_ioc_register_yank(ioc);
> +            p->registered_yank = true;
>              p->c = ioc;
>              qemu_thread_create(&p->thread, p->name, multifd_send_thread, p,
>                                     QEMU_THREAD_JOINABLE);
> diff --git a/migration/multifd.h b/migration/multifd.h
> index 8d6751f5ed..16c4d112d1 100644
> --- a/migration/multifd.h
> +++ b/migration/multifd.h
> @@ -85,6 +85,8 @@ typedef struct {
>      bool running;
>      /* should this thread finish */
>      bool quit;
> +    /* is the yank function registered */
> +    bool registered_yank;
>      /* thread has work to do */
>      int pending_job;
>      /* array of pages to sent */
> -- 
> 2.32.0

This is probably yet another case that I'm wondering whether we made unregister
of yank function/instance too strict so we should loose them.

Logically a remove/unregister function doesn't need to assert and crash qemu if
the entry doesn't exist at all.  Then it's just something like "makes sure XXX
is removed", and noop if lookup failed.  The extra fields do not really help us
from anything else..

Thanks,

-- 
Peter Xu


