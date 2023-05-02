Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8F86F3E8D
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 09:50:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptkkY-00036j-8c; Tue, 02 May 2023 03:48:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ptkkW-00036S-Kd
 for qemu-devel@nongnu.org; Tue, 02 May 2023 03:48:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ptkkU-000325-TQ
 for qemu-devel@nongnu.org; Tue, 02 May 2023 03:48:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683013713;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4Xnh6V51wt5oihTxz1YqlFP1IIegCrZZG0qLIVW8NBQ=;
 b=Vo10GiH0KXbZNjWmzyzcKC2selVxcok9COVMDlkNvt7UYoKSE3fzbVCtFIY9/UjXFtGuXl
 IcPF9N/1MZtbT1P6z02/v6N64IyyJy9tzVum3zs0sbpAcEJ8llr+9AsJ6Eb2U3oiUOfwBb
 64KVvK9Vws0YV8IvAhZq3au7bnpsCv8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-592-wwWYrqRwNNezAiFxANRSLQ-1; Tue, 02 May 2023 03:48:32 -0400
X-MC-Unique: wwWYrqRwNNezAiFxANRSLQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f17b8d24bbso20781135e9.2
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 00:48:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683013711; x=1685605711;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4Xnh6V51wt5oihTxz1YqlFP1IIegCrZZG0qLIVW8NBQ=;
 b=TPw29WD5zIrRheU1gJRHsD7YuFCeNvXBRTji1D8LeZe7GBEjrNziT88sdPKbgadL8P
 p1MRTS0P2Xs9c4s+TSlHOXEf5p/qY368/LtXe+KkOWqUHoR5QQxkFZYJa1BwXJ39O4cl
 QM0++UOAEqLAflYf30Dkiw3Gc+7MM7jz1dCLhZBCQ5HFI3dyen0FsBR2NWx1CwFM/3Wm
 a1lv9P6dIb5QhfVzupzOjuJz0BcIlq914Nvr17Ir0S8sebmKIQGUw71pxm/gdS4fhMV3
 4+YoTVoP2fqECtzG+209wwt3QOkrDLtvDzn6ahNNz3qI92TQh0iLs6sOL5Fx28Ulr5dX
 7Kcw==
X-Gm-Message-State: AC+VfDweLCLfzn/DnMs7ejFOzoF9v3mLLu1DahbEvVby34U+lXmjecGs
 KHA0l0XrQI+Ue2zVzR2UMNJQO6czkUDlq7ie1rAuJzQAhud0G/Nv73lZtC03QW6vEmpj82kHpcR
 KiTKj07JR9/4SIjg=
X-Received: by 2002:a1c:4c0e:0:b0:3f1:9527:8e8a with SMTP id
 z14-20020a1c4c0e000000b003f195278e8amr11169428wmf.21.1683013711174; 
 Tue, 02 May 2023 00:48:31 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4VB2+GAJc0XOe0rdE2lGVFwSWj+idB1uSpK7/obn9E9cn2HhlSRhOxtgp/dQm3Sd5EXR330g==
X-Received: by 2002:a1c:4c0e:0:b0:3f1:9527:8e8a with SMTP id
 z14-20020a1c4c0e000000b003f195278e8amr11169409wmf.21.1683013710854; 
 Tue, 02 May 2023 00:48:30 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-179-91.web.vodafone.de.
 [109.43.179.91]) by smtp.gmail.com with ESMTPSA id
 y4-20020adffa44000000b002f013fb708fsm30569339wrr.4.2023.05.02.00.48.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 May 2023 00:48:30 -0700 (PDT)
Message-ID: <52984020-f336-08ad-426c-ebf9da9d0597@redhat.com>
Date: Tue, 2 May 2023 09:48:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] async: avoid use-after-free on re-entrancy guard
Content-Language: en-US
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
Cc: Darren Kenny <darren.kenny@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 "open list:Block I/O path" <qemu-block@nongnu.org>
References: <20230501141956.3444868-1-alxndr@bu.edu>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230501141956.3444868-1-alxndr@bu.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.422, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 01/05/2023 16.19, Alexander Bulekov wrote:
> A BH callback can free the BH, causing a use-after-free in aio_bh_call.
> Fix that by keeping a local copy of the re-entrancy guard pointer.
> 
> Buglink: https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=58513
> Fixes: 9c86c97f12 ("async: Add an optional reentrancy guard to the BH API")
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> ---
>   util/async.c | 14 ++++++++------
>   1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/util/async.c b/util/async.c
> index 9df7674b4e..055070ffbd 100644
> --- a/util/async.c
> +++ b/util/async.c
> @@ -156,18 +156,20 @@ void aio_bh_call(QEMUBH *bh)
>   {
>       bool last_engaged_in_io = false;
>   
> -    if (bh->reentrancy_guard) {
> -        last_engaged_in_io = bh->reentrancy_guard->engaged_in_io;
> -        if (bh->reentrancy_guard->engaged_in_io) {
> +    /* Make a copy of the guard-pointer as cb may free the bh */
> +    MemReentrancyGuard *reentrancy_guard = bh->reentrancy_guard;
> +    if (reentrancy_guard) {
> +        last_engaged_in_io = reentrancy_guard->engaged_in_io;
> +        if (reentrancy_guard->engaged_in_io) {
>               trace_reentrant_aio(bh->ctx, bh->name);
>           }
> -        bh->reentrancy_guard->engaged_in_io = true;
> +        reentrancy_guard->engaged_in_io = true;
>       }
>   
>       bh->cb(bh->opaque);
>   
> -    if (bh->reentrancy_guard) {
> -        bh->reentrancy_guard->engaged_in_io = last_engaged_in_io;
> +    if (reentrancy_guard) {
> +        reentrancy_guard->engaged_in_io = last_engaged_in_io;
>       }
>   }

Reviewed-by: Thomas Huth <thuth@redhat.com>

I'll assemble a pull request with this later today, to avoid that people run 
into this regression.

  Thomas


