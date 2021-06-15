Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 198193A8647
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 18:20:27 +0200 (CEST)
Received: from localhost ([::1]:55016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltBne-0006I6-2K
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 12:20:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1ltBlc-0003fW-9y
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 12:18:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1ltBlZ-0008Qa-M6
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 12:18:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623773896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j3Sk9+2hGtN+P0EK1OSvv7VrDHKrNq2qW8fpppllQxA=;
 b=VOQT4D6XxHJLK8nVkTPaFcTtEMZst3jkUCjSxrOz2tzQDpxYWJjmX1GuJxYTgmuGxWT0IL
 7GE5eEgcIqGkeISFzGkavKKFHjO5kUmvZbGx7t9S7zgYSI56ALKQM8XHqw7WMS7hhnNdc9
 d8Bl8jddRUplgAl4mgSdk8SEb5/OSak=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-lDaD7BxPNa2ergRai4Ieug-1; Tue, 15 Jun 2021 12:18:15 -0400
X-MC-Unique: lDaD7BxPNa2ergRai4Ieug-1
Received: by mail-ej1-f69.google.com with SMTP id
 q7-20020a1709063607b02903f57f85ac45so4763477ejb.15
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 09:18:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=j3Sk9+2hGtN+P0EK1OSvv7VrDHKrNq2qW8fpppllQxA=;
 b=n/P/Qcl/EWNEa0k73zIgsJ/dEBwf3K1I8iBxffZEwZ/pIofG3or6TxTsP2ch3/Txbg
 m63EOAtMUFJckmXUKCWbbOoswK1oAm1dZApHPeOBDnsb394dp4r4eKMIHolvWrvHnexV
 j5+ZSrvKDlM3j3eJEQn724zRFA5cI3yjtPMJYBFYfaB8AcwqcOaPgjDtNAstVFAVSQQ9
 23R9as3UMBBVF3nJTpFk92mluR9SFuBwnn/zq6tFmLVB5zN63eRkHB4w8Gjk4pXpgWVs
 cVBouAhIY/LQVNyejRedllh5f/mW4nUzxKjwodmz7ramkAQLUfASKrlOvZVrhCOwoKWZ
 nLAw==
X-Gm-Message-State: AOAM530FTQ3zA8AhxBAswuJt6W95C7pCSBsQQyjsU6dVB5QV64P340Ar
 Cj9CrCn7kms2JWkrmKenMvF3Jkn3V2SOEvGis6jBZQJR2PwmBm9V1/3rjrnkADYnCpQ0Y2JBbo8
 iqVDTXEEVGb9SYX0=
X-Received: by 2002:a05:6402:b76:: with SMTP id
 cb22mr313678edb.112.1623773893930; 
 Tue, 15 Jun 2021 09:18:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyDd7fHBp/MS5FPmFkJf9R5MC80a8GEQ24r3Alp1/tA7pWPhX35Rw6H2LKcZZ3BWEb1lsc2Jw==
X-Received: by 2002:a05:6402:b76:: with SMTP id
 cb22mr313657edb.112.1623773893763; 
 Tue, 15 Jun 2021 09:18:13 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 a24sm12295202edt.96.2021.06.15.09.18.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jun 2021 09:18:13 -0700 (PDT)
Subject: Re: [PATCH v3 3/7] block: add max_hw_transfer to BlockLimits
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210603133722.218465-1-pbonzini@redhat.com>
 <20210603133722.218465-4-pbonzini@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <cb030dc0-ee6f-4c0b-723d-4197c51f8a61@redhat.com>
Date: Tue, 15 Jun 2021 18:18:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210603133722.218465-4-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.095, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03.06.21 15:37, Paolo Bonzini wrote:
> For block host devices, I/O can happen through either the kernel file
> descriptor I/O system calls (preadv/pwritev, io_submit, io_uring)
> or the SCSI passthrough ioctl SG_IO.
>
> In the latter case, the size of each transfer can be limited by the
> HBA, while for file descriptor I/O the kernel is able to split and
> merge I/O in smaller pieces as needed.  Applying the HBA limits to
> file descriptor I/O results in more system calls and suboptimal
> performance, so this patch splits the max_transfer limit in two:
> max_transfer remains valid and is used in general, while max_hw_transfer
> is limited to the maximum hardware size.  max_hw_transfer can then be
> included by the scsi-generic driver in the block limits page, to ensure
> that the stricter hardware limit is used.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   block/block-backend.c          | 12 ++++++++++++
>   block/file-posix.c             |  2 +-
>   block/io.c                     |  1 +
>   hw/scsi/scsi-generic.c         |  2 +-
>   include/block/block_int.h      |  7 +++++++
>   include/sysemu/block-backend.h |  1 +
>   6 files changed, 23 insertions(+), 2 deletions(-)
>
> diff --git a/block/block-backend.c b/block/block-backend.c
> index 15f1ea4288..2ea1412a54 100644
> --- a/block/block-backend.c
> +++ b/block/block-backend.c
> @@ -1953,6 +1953,18 @@ uint32_t blk_get_request_alignment(BlockBackend *blk)
>       return bs ? bs->bl.request_alignment : BDRV_SECTOR_SIZE;
>   }
>   
> +/* Returns the maximum hardware transfer length, in bytes; guaranteed nonzero */
> +uint64_t blk_get_max_hw_transfer(BlockBackend *blk)
> +{
> +    BlockDriverState *bs = blk_bs(blk);
> +    uint64_t max = INT_MAX;
> +
> +    if (bs) {
> +        max = MIN_NON_ZERO(bs->bl.max_hw_transfer, bs->bl.max_transfer);
> +    }
> +    return max;

Both `max_hw_transfer` and `max_transfer` can be 0, so this could return 
0, contrary to what the comment above promises.

Should `max` be initialized to 0 with a `MIN_NON_ZERO(max, INT_MAX)` 
here (like `blk_get_max_transfer()` does it)?

(As for the rest, I think aligning to the request alignment makes sense, 
but then again we don’t do that for max_transfer either, so... this at 
least wouldn’t be a new bug.

Regarding the comment, checkpatch complains about it, so it should be 
fixed so that /* is on its own line.

Speaking of checkpatch, now that I ran it, it also complains about the 
new line in bdrv_merge_limits() exceeding 80 characters, so that should 
be fixed, too.)

Max


