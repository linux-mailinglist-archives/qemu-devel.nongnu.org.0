Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64530527DBD
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 08:44:38 +0200 (CEST)
Received: from localhost ([::1]:45054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqUT5-0002qY-NT
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 02:44:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1nqUMW-0000MV-Sh
 for qemu-devel@nongnu.org; Mon, 16 May 2022 02:37:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1nqUMU-0001IP-2m
 for qemu-devel@nongnu.org; Mon, 16 May 2022 02:37:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652683064;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TnwDm15htdPZxpNQdxfQLU0DE0JPEnFE8W0eoCpfWas=;
 b=bIger7nbkMbpTlFxTLCUpsFRL6yVoLtVF9Zzk+pkGdWxwBIKsINLPj8cEr318Gf+XPznU/
 XYDjr3JrpHaT2YGmBDStREtzW1D2BHyB1GvwYs9nsmYC2AH8HH6FqV6R8khcXYSNXDwxSA
 mY6gp0an7Ctr0xwvMpLz5X3kKHl/Wgs=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-257-bGM1QpSgPvakzN77NM8ebA-1; Mon, 16 May 2022 02:37:43 -0400
X-MC-Unique: bGM1QpSgPvakzN77NM8ebA-1
Received: by mail-il1-f198.google.com with SMTP id
 a3-20020a92c543000000b002d1108788a1so1002930ilj.4
 for <qemu-devel@nongnu.org>; Sun, 15 May 2022 23:37:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TnwDm15htdPZxpNQdxfQLU0DE0JPEnFE8W0eoCpfWas=;
 b=ZAjJMnIaa0rdOjzcMAB0RJ1Sj9iPBXiG126+YphVqJKyI+W+n+ZUHmphNjDzj6IUXt
 q18+DTpSe60/RLJyBHZj8JjdD3AbghaCdANEUPadhJwKSs2GMuBGMGEFsTJkQhee8wOe
 qsP75S5WX0vfUclkTtl+FPJVsGFnTofncdvx7GAXQWqYZle1tKdI10v6IFkDkg/5kT6A
 +S2j0eU4Ng3IZNH07JAP5CA29VG9A+8LMU+1nawjURqa01r4bQaP/P1OZ4f6O/pzAbuU
 OvFA9LNGIRcsWRgZirATYm5MbxaoYD/mElQh6OTHcw5HzANbiqKabR8u7W6ND/QlSPIz
 +toA==
X-Gm-Message-State: AOAM5312kgKTfYOEEr6Zko92Icb/tXG+LVtdEmZHOSxmdVN29vJdTW4D
 zLqDsDdqC3zP8GU6x+FT/Y4rFRqoXKDktw4F5tg6nSc5quCLbbhMzB0vCIj2Mzgc8MN130OVjrP
 FylhfcfN2IdNIWvtaRRL1fGAM+QENZ+s=
X-Received: by 2002:a6b:b4c6:0:b0:65b:48b5:9908 with SMTP id
 d189-20020a6bb4c6000000b0065b48b59908mr7357163iof.171.1652683062503; 
 Sun, 15 May 2022 23:37:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxumuWff73ggMZDg88g7ka91WUS7GR+8gd7GiSIfP2f01nVm73a/2cOv/yb4AZOoSV39+tD2U4uV5HbRrwNj8g=
X-Received: by 2002:a6b:b4c6:0:b0:65b:48b5:9908 with SMTP id
 d189-20020a6bb4c6000000b0065b48b59908mr7357157iof.171.1652683062285; Sun, 15
 May 2022 23:37:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220514102958.1163922-1-pbonzini@redhat.com>
In-Reply-To: <20220514102958.1163922-1-pbonzini@redhat.com>
From: Alberto Faria <afaria@redhat.com>
Date: Mon, 16 May 2022 07:37:06 +0100
Message-ID: <CAELaAXykgoFirkxxcwN1GRrBZeJXf_s5zDaWg-x4Mj+RQmMPmA@mail.gmail.com>
Subject: Re: [PATCH] block/nvme: separate nvme_get_free_req cases for
 coroutine/non-coroutine context
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, May 14, 2022 at 11:31 AM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> nvme_get_free_req has very difference semantics when called in
> coroutine context (when it waits) and in non-coroutine context
> (when it doesn't).  Split the two cases to make it clear what
> is being requested.
>
> Cc: qemu-block@nongnu.org
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block/nvme.c | 48 ++++++++++++++++++++++++++++--------------------
>  1 file changed, 28 insertions(+), 20 deletions(-)
>
> diff --git a/block/nvme.c b/block/nvme.c
> index 01fb28aa63..092c1f2f8e 100644
> --- a/block/nvme.c
> +++ b/block/nvme.c
> @@ -293,34 +293,42 @@ static void nvme_kick(NVMeQueuePair *q)
>      q->need_kick = 0;
>  }
>
> -/* Find a free request element if any, otherwise:
> - * a) if in coroutine context, try to wait for one to become available;
> - * b) if not in coroutine, return NULL;
> - */
> -static NVMeRequest *nvme_get_free_req(NVMeQueuePair *q)
> +static NVMeRequest *nvme_get_free_req_nofail_locked(NVMeQueuePair *q)
>  {
>      NVMeRequest *req;
>
> -    qemu_mutex_lock(&q->lock);
> -
> -    while (q->free_req_head == -1) {
> -        if (qemu_in_coroutine()) {
> -            trace_nvme_free_req_queue_wait(q->s, q->index);
> -            qemu_co_queue_wait(&q->free_req_queue, &q->lock);
> -        } else {
> -            qemu_mutex_unlock(&q->lock);
> -            return NULL;
> -        }
> -    }
> -
>      req = &q->reqs[q->free_req_head];
>      q->free_req_head = req->free_req_next;
>      req->free_req_next = -1;
> -
> -    qemu_mutex_unlock(&q->lock);
>      return req;
>  }
>
> +/* Return a free request element if any, otherwise return NULL.  */
> +static NVMeRequest *nvme_get_free_req_nowait(NVMeQueuePair *q)
> +{
> +    QEMU_LOCK_GUARD(&q->lock);
> +    if (q->free_req_head == -1) {
> +        return NULL;
> +    }
> +    return nvme_get_free_req_nofail_locked(q);
> +}
> +
> +/*
> + * Return a free request element if any, otherwise wait
> + * for one to become available
> + */

Might be a bit more precise as: "Wait for a free request to become
available and return it."

> +static coroutine_fn NVMeRequest *nvme_get_free_req(NVMeQueuePair *q)
> +{
> +    QEMU_LOCK_GUARD(&q->lock);
> +
> +    while (q->free_req_head == -1) {
> +       trace_nvme_free_req_queue_wait(q->s, q->index);
> +       qemu_co_queue_wait(&q->free_req_queue, &q->lock);
> +    }
> +
> +    return nvme_get_free_req_nofail_locked(q);
> +}
> +
>  /* With q->lock */
>  static void nvme_put_free_req_locked(NVMeQueuePair *q, NVMeRequest *req)
>  {
> @@ -506,7 +514,7 @@ static int nvme_admin_cmd_sync(BlockDriverState *bs, NvmeCmd *cmd)
>      AioContext *aio_context = bdrv_get_aio_context(bs);
>      NVMeRequest *req;
>      int ret = -EINPROGRESS;
> -    req = nvme_get_free_req(q);
> +    req = nvme_get_free_req_nowait(q);
>      if (!req) {
>          return -EBUSY;
>      }
> --
> 2.36.0
>
>

Reviewed-by: Alberto Faria <afaria@redhat.com>


