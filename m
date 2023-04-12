Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA23F6DF455
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 13:54:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmZ3d-00084e-QQ; Wed, 12 Apr 2023 07:54:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pmZ3Y-000842-5f
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 07:54:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pmZ3W-0004as-8c
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 07:54:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681300466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gx3ftyUlLKtf6fa5lrOEFUfezh8w/wxPvXqEFpV7fE0=;
 b=VS3JaL9erLxKEEu+FzuXaP4SJkj+KPd6sl6WEtG4XKhiwwWbGWOobYdVNLpBnlgObFGac+
 5Cf3tNDsRPN6Yy2S0mhQkoZ+AFKB3mJvNNTx+FJR485xZO88Pp9NDp4VdM3l/iaKn0cLx5
 tbltKq9lrw70fM9xykt8yFLv7k7evZQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-106-TyH0oD5POHiZAV1ev0UlJw-1; Wed, 12 Apr 2023 07:54:25 -0400
X-MC-Unique: TyH0oD5POHiZAV1ev0UlJw-1
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-50489d21c0aso1523346a12.3
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 04:54:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681300464; x=1683892464;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Gx3ftyUlLKtf6fa5lrOEFUfezh8w/wxPvXqEFpV7fE0=;
 b=YPVwBUxE68jYelq8owyllsPB0/UKhf6JYOGWBamEYAo/2nMCB28rX4R0cr0ssiIJAa
 3nwb/GNNIZJefaxhI73tSobvWfPFdjqqyc1c+e9XWdOLgjo9azV0lFqyyIc30GdlT7BU
 7lYN0FBItn0dBeHifXJXo/n/Id81KBmyak58kpDtTRDiMKDnQuhg9McbIGT0VtOVujNC
 G8HF/SAZ6Bq7odgWAHdJqC9UjjqDxYUdiVDBmd60aIOpTAUSPWsBRN7lgesKjLJ4q6N2
 DlkIGIFnLyfBuSaks29iOVxgLFd3JBwUJg8YtVENOlEDj8HOY+CQi+PE2Nyd4CYq29uB
 yCuQ==
X-Gm-Message-State: AAQBX9dUtKqA+kUhoripIJwkqiCWqMoyoPTJpKMeCJ46TgoA75tbtwAn
 9U31T7rtyAUtQGbPUGM7cpN/oNT1mI/13/7r8kSSe0HCMnLC9JZThXIpcZ86IxiAf4a2bJfX2YS
 DYWtbUXnFZh9o/qC/l8SajZU=
X-Received: by 2002:aa7:d482:0:b0:504:78aa:4f2d with SMTP id
 b2-20020aa7d482000000b0050478aa4f2dmr16520481edr.0.1681300463893; 
 Wed, 12 Apr 2023 04:54:23 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZWqnjGFqWDUj7omrUst90uQ+EfsLZV2uX2+uScojTyaZlK4Br+WUZ/uq6rlhLoebp+exMQKQ==
X-Received: by 2002:aa7:d482:0:b0:504:78aa:4f2d with SMTP id
 b2-20020aa7d482000000b0050478aa4f2dmr16520463edr.0.1681300463514; 
 Wed, 12 Apr 2023 04:54:23 -0700 (PDT)
Received: from ?IPV6:2003:cf:d735:c67f:6ed9:8c90:7a1d:e97e?
 (p200300cfd735c67f6ed98c907a1de97e.dip0.t-ipconnect.de.
 [2003:cf:d735:c67f:6ed9:8c90:7a1d:e97e])
 by smtp.gmail.com with ESMTPSA id
 cb28-20020a0564020b7c00b0050489201b81sm4460095edb.26.2023.04.12.04.54.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 04:54:22 -0700 (PDT)
Message-ID: <29c84ebf-62e6-e90a-b75e-137cb76195de@redhat.com>
Date: Wed, 12 Apr 2023 13:54:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 3/3] block-backend: delay application of request queuing
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: Fiona Ebner <f.ebner@proxmox.com>
References: <20230405161752.194727-1-pbonzini@redhat.com>
 <20230405163109.197876-1-pbonzini@redhat.com>
Content-Language: en-US
From: Hanna Czenczek <hreitz@redhat.com>
In-Reply-To: <20230405163109.197876-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.083, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 05.04.23 18:31, Paolo Bonzini wrote:
> Request queuing prevents new requests from being submitted to the
> BlockDriverState, not allowing them to start instead of just letting
> them complete before bdrv_drained_begin() returns.
>
> The reason for this was to ensure progress and avoid a livelock
> in blk_drain(), blk_drain_all_begin(), bdrv_drained_begin() or
> bdrv_drain_all_begin(), if there is an endless stream of requests to
> a BlockBackend.  However, this is prone to deadlocks.
>
> In particular, IDE TRIM wants to elevate its BB's in-flight counter for a
> "macro" operation that consists of several actual I/O operations.  Each of
> those operations is individually started and awaited.  It does this so
> that blk_drain() will drain the whole TRIM, and not just a single one
> of the many discard operations it may encompass.  When request queuing
> is enabled, this leads to a deadlock: The currently ongoing discard is
> drained, and the next one is queued, waiting for the drain to stop.
> Meanwhile, TRIM still keeps the in-flight counter elevated, waiting
> for all discards to stop -- which will never happen, because with the
> in-flight counter elevated, the BB is never considered drained, so the
> drained section does not begin and cannot end.
>
> Fixing the implementation of request queuing is hard to do in general,
> and even harder to do without adding more hacks.  As the name suggests,
> deadlocks are worse than livelocks :) so let's avoid them: turn the
> request queuing on only after the BlockBackend has quiesced, and leave
> the second functionality of bdrv_drained_begin() to the BQL or to the
> individual BlockDevOps implementations.
>
> In fact, devices such as IDE that run in the vCPU thread do not suffer
> from this livelock because they only submit requests while they are
> allowed to hold the big QEMU lock (i.e., not during bdrv_drained_begin()
> or bdrv_drain_all_begin().  Other devices can avoid it through external
> file descriptor (so that aio_disable_external() will prevent submission
> of new requests) or with a .drained_begin callback in their BlockDevOps.
>
> Note that this change does not affect the safety of bdrv_drained_begin(),
> since the patch does not completely get away with request queuing.
>
> Reported-by: Fiona Ebner <f.ebner@proxmox.com>
> Fixes: 7e5cdb345f77 ("ide: Increment BB in-flight counter for TRIM BH")
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   block/block-backend.c | 40 ++++++++++++++++++++++++++++++----------
>   1 file changed, 30 insertions(+), 10 deletions(-)
>
> diff --git a/block/block-backend.c b/block/block-backend.c
> index 10419f8be91e..acb4cb91a5ee 100644
> --- a/block/block-backend.c
> +++ b/block/block-backend.c

[...]

> @@ -2600,7 +2610,14 @@ static bool blk_root_drained_poll(BdrvChild *child)
>       if (blk->dev_ops && blk->dev_ops->drained_poll) {
>           busy = blk->dev_ops->drained_poll(blk->dev_opaque);
>       }
> -    return busy || !!blk->in_flight;
> +    if (busy || blk->in_flight) {
> +        return true;
> +    }
> +
> +    if (qatomic_read(&blk->request_queuing) == BLK_QUEUE_READY) {
> +        qatomic_set(&blk->request_queuing, BLK_QUEUE_QUIESCENT);
> +    }
> +    return false;
>   }

This implicitly relies on nobody increasing blk->in_flight (or 
dev_ops->drained_poll() returning `true` again) while the BB is starting 
to be drained, because if the function were to be called again after it 
has returned `false` once per drained section (not sure if that’s 
possible![1]), then we’d end up in the original situation, with 
in_flight elevated and queuing enabled.

Is that really strictly guaranteed somehow or is it rather a complex 
conglomerate of many cases that in the end happen to work out 
individually?  I mean, I could imagine that running 
BlockDevOps.drained_begin() is supposed to guarantee that, but it can’t, 
because only NBD seems to implement it.  The commit message talks about 
IDE being fine (by accident?) because it needs BQL availability to 
submit new requests.  But that’s very complex and I’d rather have a 
strict requirement to guarantee correctness.

[1] If the blk_root_drained_poll() isn’t called anymore after returning 
`false`, all will be good, but I assume it will be, because we have a 
quiesce_counter, not a quiesce_bool.  We could kind of emulate this by 
continuing to return `false` after blk_root_drained_poll() has returned 
`false` once, until the quiesce_counter becomes 0.

We could also have blk_root_drained_poll(), if it sees in_flight > 0 && 
request_queuing == BLK_QUEUE_QUIESCENT, revert request_queuing to 
BLK_QUEUE_READY and resume all queued requests.

But, admittedly, I’m making a lot of assumptions and leaps by this 
point.  It all hinges on whether we can guarantee that in_flight won’t 
be increased while a drained section starts.

Hanna


