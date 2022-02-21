Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8784BDACE
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 17:21:38 +0100 (CET)
Received: from localhost ([::1]:36634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMBRQ-0008Vf-Gz
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 11:21:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nMBMr-0005Wa-Pw
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 11:16:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nMBMi-0005h7-Fu
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 11:16:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645460198;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3E1n9jMIaI1HEfaM75JDhyod8j5MZ0tZfSzyReb2+0E=;
 b=ORcaH/RYhOGpzsPdygS2YgDkZNpX5tbgoWP7FgAbgJUrdLLXAtLFKrCGBTBLKS+B38SouI
 +iIbrl5eiuZ6Eaq1bQsrXKiXHa7VxMm9yDqFZUdzilgAcdv/QpBRFO54HEXzUm2Joi0Wo+
 r7qEMexcr/pDeVmJI9AKa4xjzL+pgXk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-151-nQwu72xBNSWPRXc4iWjYlw-1; Mon, 21 Feb 2022 11:16:37 -0500
X-MC-Unique: nQwu72xBNSWPRXc4iWjYlw-1
Received: by mail-wm1-f70.google.com with SMTP id
 j39-20020a05600c1c2700b0037becd18addso4580202wms.4
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 08:16:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=3E1n9jMIaI1HEfaM75JDhyod8j5MZ0tZfSzyReb2+0E=;
 b=LjGginKXb799mN6OjuuYLA3IOH5CDUPRPLrfibpOP6Ksgnusm5CazTAbMQ91WOtUG1
 QQFor/T6WeU+v8LPevWnxtTTgR81cvEW2H64ztFy9REITWpy+BBMHbv2HHDDUl7HLv3D
 hiwaL0RszOZXjebW7wZr7XAj3MGChDaLMxPt2IaTaDKCwF9rb3jyIEKbWXH/VW5KAS6c
 rqkDQS+U3N1Da8UkfMEfJmjWWvViCQykgjgJGnkts/277WZAyHJzjcmhH0got9fvoDlI
 ZBqat7yLhEz3ZQRg3nqdaOXZfxk34ol5j6A5Cpymbc2q6BSB3FJiDKHPYecSNSuQA/hE
 WWZA==
X-Gm-Message-State: AOAM531nMMZIl/ucJgYjayIRUdUGd6mKZWg0oVCTnJIIo6tln6qCixDY
 1W3aBCyt4CtfQuVdUEEao53ZHTlMFl3tR+1DHKedOBhBLtzumfrQ9cTvLa6LzL0vcTSL78ml42y
 7Qg754HwlCueZiDM=
X-Received: by 2002:a5d:6045:0:b0:1e7:aa29:89bb with SMTP id
 j5-20020a5d6045000000b001e7aa2989bbmr16527663wrt.355.1645460196091; 
 Mon, 21 Feb 2022 08:16:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwKUynaa1CjSJzl67wM1lVXcUWQCfVeiFuFCnhCydTMlqNxPe5S5ef4/x+3vV8F6d6zW6aEmA==
X-Received: by 2002:a5d:6045:0:b0:1e7:aa29:89bb with SMTP id
 j5-20020a5d6045000000b001e7aa2989bbmr16527650wrt.355.1645460195865; 
 Mon, 21 Feb 2022 08:16:35 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id c18sm48840546wro.81.2022.02.21.08.16.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 08:16:35 -0800 (PST)
Date: Mon, 21 Feb 2022 16:16:33 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 11/20] migration: postcopy_pause_fault_thread() never fails
Message-ID: <YhO64YTUN2RtTVop@work-vm>
References: <20220216062809.57179-1-peterx@redhat.com>
 <20220216062809.57179-12-peterx@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220216062809.57179-12-peterx@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> Per the title, remove the return code and simplify the callers as the errors
> will never be triggered.  No functional change intended.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/postcopy-ram.c | 25 ++++---------------------
>  1 file changed, 4 insertions(+), 21 deletions(-)
> 
> diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
> index 6be510fea4..738cc55fa6 100644
> --- a/migration/postcopy-ram.c
> +++ b/migration/postcopy-ram.c
> @@ -890,15 +890,11 @@ static void mark_postcopy_blocktime_end(uintptr_t addr)
>                                        affected_cpu);
>  }
>  
> -static bool postcopy_pause_fault_thread(MigrationIncomingState *mis)
> +static void postcopy_pause_fault_thread(MigrationIncomingState *mis)
>  {
>      trace_postcopy_pause_fault_thread();
> -
>      qemu_sem_wait(&mis->postcopy_pause_sem_fault);
> -
>      trace_postcopy_pause_fault_thread_continued();
> -
> -    return true;
>  }
>  
>  /*
> @@ -958,13 +954,7 @@ static void *postcopy_ram_fault_thread(void *opaque)
>               * broken already using the event. We should hold until
>               * the channel is rebuilt.
>               */
> -            if (postcopy_pause_fault_thread(mis)) {
> -                /* Continue to read the userfaultfd */
> -            } else {
> -                error_report("%s: paused but don't allow to continue",
> -                             __func__);
> -                break;
> -            }
> +            postcopy_pause_fault_thread(mis);
>          }
>  
>          if (pfd[1].revents) {
> @@ -1038,15 +1028,8 @@ retry:
>                                          msg.arg.pagefault.address);
>              if (ret) {
>                  /* May be network failure, try to wait for recovery */
> -                if (postcopy_pause_fault_thread(mis)) {
> -                    /* We got reconnected somehow, try to continue */
> -                    goto retry;
> -                } else {
> -                    /* This is a unavoidable fault */
> -                    error_report("%s: postcopy_request_page() get %d",
> -                                 __func__, ret);
> -                    break;
> -                }
> +                postcopy_pause_fault_thread(mis);
> +                goto retry;
>              }
>          }
>  
> -- 
> 2.32.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


