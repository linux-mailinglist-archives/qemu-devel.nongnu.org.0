Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8AFA5665FB
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 11:20:59 +0200 (CEST)
Received: from localhost ([::1]:44782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8ejp-0006CW-Iq
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 05:20:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o8ehx-0005OB-F3
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 05:19:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o8ehu-0002sa-72
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 05:19:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657012737;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R3lzotfj+kryflPvS8ybcQJJjILWlH08L8GyKgGEQB4=;
 b=LvftVRE6VEV9sDFyAgbm7J+Gi2AgENw6tJ9WhowDjnRKOaQ6OLMHe7REnSN5m8BHvRSdKt
 16sbThcTaixiBYqbt2DT/VBZ3ALbrhOhZ7JIaJ4XohkcQ5+02nSgLnAOJ9fnX2Ii6y9l3Z
 uIIlU73jR65UfVxvSzMNsIAN6a1nvw0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-467-LByCWm0vM1iltXKykLBdzQ-1; Tue, 05 Jul 2022 05:18:45 -0400
X-MC-Unique: LByCWm0vM1iltXKykLBdzQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 i9-20020a05640242c900b004373cd1c4d5so8852330edc.2
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 02:18:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=R3lzotfj+kryflPvS8ybcQJJjILWlH08L8GyKgGEQB4=;
 b=LTrLotPCGWZfawm1tDrORhH3j8RBMu5hpB9Q5I0o3XCfn/i2ic5UzVHQbno7NlgW/P
 swcI76ljdQ02tjVYcN/rowrjraIzYPGqR8L6cl+maWnvW5n3HeLeD/F0NsAPeTijqYdN
 cCbBUu5YpKI3CPYoyxI4yOda9PMhMalKEuRuFi0H7lDSFwlYeLLEwRFgIUo26D0FYWEK
 aWeybMaNxnyr5QRHDZiYkBpxhvzGteVKSeE4gstv8bOvO1nydtqOf2M9pqKIQcd3rQ4C
 u/DDHPctjPytXI1RGOXzyfSjCuxU0Z9VgXxRsBTPGYLezyw4YBEIsDIPDnxm7VAbQeme
 8Mcw==
X-Gm-Message-State: AJIora8Ae3n0UCJVmbP7mXlx3ieoHRS60zVV6/TcY4ytIbH+I+/zflb6
 PpN/PRAqy1aAmdFYPeiP7neN7Yv+Q0h6+cQnXYukP8dSXOV/SaDyqCV6ik5zLTlqDbYSvWyfklN
 /pgJHwSKHd0soAw0=
X-Received: by 2002:a50:fd93:0:b0:43a:71e2:781e with SMTP id
 o19-20020a50fd93000000b0043a71e2781emr6270629edt.396.1657012724460; 
 Tue, 05 Jul 2022 02:18:44 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t8btJgFv0alePCQV1eJKuzuqpaxXKNXIwN/NvCdEa72f/2OLCbAgIqUCcmOR0supJWgKr4mA==
X-Received: by 2002:a50:fd93:0:b0:43a:71e2:781e with SMTP id
 o19-20020a50fd93000000b0043a71e2781emr6270605edt.396.1657012724266; 
 Tue, 05 Jul 2022 02:18:44 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5056:d40:63e3:25a7:c1a1:4455?
 ([2a02:8071:5056:d40:63e3:25a7:c1a1:4455])
 by smtp.gmail.com with ESMTPSA id
 qx28-20020a170906fcdc00b00726c0e60940sm10610161ejb.100.2022.07.05.02.18.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jul 2022 02:18:43 -0700 (PDT)
Message-ID: <4f584014-8bcc-6a84-36f8-93ce595a133f@redhat.com>
Date: Tue, 5 Jul 2022 11:18:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 17/18] block: Reorganize some declarations in
 block-backend-io.h
Content-Language: en-US
To: Alberto Faria <afaria@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20220517113524.197910-1-afaria@redhat.com>
 <20220517113907.200001-6-afaria@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220517113907.200001-6-afaria@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17.05.22 13:39, Alberto Faria wrote:
> Keep generated_co_wrapper and coroutine_fn pairs together. This should
> make it clear that each I/O function has these two versions.
>
> Also move blk_co_{pread,pwrite}()'s implementations out of the header
> file for consistency.
>
> Signed-off-by: Alberto Faria <afaria@redhat.com>
> ---
>   block/block-backend.c             | 22 ++++++++
>   include/sysemu/block-backend-io.h | 87 +++++++++++++------------------
>   2 files changed, 59 insertions(+), 50 deletions(-)

[...]

> diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
> index 004493ec36..30ed979fb1 100644
> --- a/include/sysemu/block-backend-io.h
> +++ b/include/sysemu/block-backend-io.h
> @@ -88,11 +88,6 @@ uint32_t blk_get_request_alignment(BlockBackend *blk);
>   uint32_t blk_get_max_transfer(BlockBackend *blk);
>   uint64_t blk_get_max_hw_transfer(BlockBackend *blk);
>   
> -int coroutine_fn blk_co_copy_range(BlockBackend *blk_in, int64_t off_in,
> -                                   BlockBackend *blk_out, int64_t off_out,
> -                                   int64_t bytes, BdrvRequestFlags read_flags,
> -                                   BdrvRequestFlags write_flags);
> -
>   
>   /*
>    * "I/O or GS" API functions. These functions can run without

[...]

> @@ -190,4 +172,9 @@ int coroutine_fn blk_co_truncate(BlockBackend *blk, int64_t offset, bool exact,
>                                    PreallocMode prealloc, BdrvRequestFlags flags,
>                                    Error **errp);
>   
> +int coroutine_fn blk_co_copy_range(BlockBackend *blk_in, int64_t off_in,
> +                                   BlockBackend *blk_out, int64_t off_out,
> +                                   int64_t bytes, BdrvRequestFlags read_flags,
> +                                   BdrvRequestFlags write_flags);
> +
>   #endif /* BLOCK_BACKEND_IO_H */

This moves blk_co_copy_range() from the “I/O API functions” section of 
this header into the “"I/O or GS" API functions” section.  Is that intended?

The rest looks good to me, but I wonder about this one function.

Hanna


