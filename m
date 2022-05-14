Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B55527069
	for <lists+qemu-devel@lfdr.de>; Sat, 14 May 2022 11:57:23 +0200 (CEST)
Received: from localhost ([::1]:46576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npoWX-0003W9-VY
	for lists+qemu-devel@lfdr.de; Sat, 14 May 2022 05:57:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1npoTU-0002M4-Dj
 for qemu-devel@nongnu.org; Sat, 14 May 2022 05:54:12 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:34576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1npoTS-0001mV-Me
 for qemu-devel@nongnu.org; Sat, 14 May 2022 05:54:12 -0400
Received: by mail-wr1-x42f.google.com with SMTP id q23so14266511wra.1
 for <qemu-devel@nongnu.org>; Sat, 14 May 2022 02:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IGFKeCiMLk7QeHBCZtMsm98Co51Xaypbm+Z2C6r73KQ=;
 b=Pgm7zwBcJ7gCd/MjRG/OS2XRZ/0+zjiYprapODw34UB13gSfzubTfShu3lb8AVTStL
 LZ9/dMKlqoZ6wTYI/N7XVZrx6i7Bbh1GxAGV9ugHrV7FUkqw8+nv80qI498J1OR7TncO
 rpaI2Bt/qYgKr5KguT5kMbt0+HJG2LwnhcVPT1pWd/i4WX+jcxy4EG/+c89uECKLgBWu
 bHNzksVvg1r/uI0HoeQuA68LJs2uPvJKbIaL48AtUr8O1vV9XATcspPvOcKQPYFew3N/
 MPdJ6BO1+hs3n54/raT4x4lNa28QFBBgE3c/rLkhsh+bRediRXDkmBS0okoVrvgiY/KF
 xsOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IGFKeCiMLk7QeHBCZtMsm98Co51Xaypbm+Z2C6r73KQ=;
 b=VJ6EUgkKdjNtckA+b9QF0n/ZZPE9FONyg8yaLdu21f1lZje72PIAcPAJ7iXedPVY3m
 8JdxZoV7bIg5hjUPOO/6wdt/N4OE+IsZ30ipY7lzAf2ASY1rwXvV0F1afpHc4iUhf5Xy
 pqVSddSTJ7S6I8WKNJLQ+91YJYlS+l04ITQB/0gRKlDui2Mp/7i+APUzHwx2IpQl5Ehc
 zlpEXZXcQNeMMRA+iFIfFTxKQNbIOLxuE4WdSDwMErawJ5kvASbdIluCH6shTEMij29I
 ycQzApy43idbgHcPeS8jMP7J9REFoKeOx/SAK+ZSP3QFTunwctCLT5gWZCugxZ59k0vO
 078w==
X-Gm-Message-State: AOAM531MSLvSZKH9Oq+iL2YODBZum4ugCWr517puEldOYCjc8fSgnJxK
 vc26Sfg/NhdV5RbNy8xOfek=
X-Google-Smtp-Source: ABdhPJwzKVDq3gySMILDtO2mlgqEE5zkCipdwa9JrNZz4b5GYKw6Ip0urUQ2amG6ozVcj0qIQEArgA==
X-Received: by 2002:a05:6000:1881:b0:20c:4cfb:33d0 with SMTP id
 a1-20020a056000188100b0020c4cfb33d0mr7160427wri.264.1652522049073; 
 Sat, 14 May 2022 02:54:09 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:e3ec:5559:7c5c:1928?
 ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.googlemail.com with ESMTPSA id
 a7-20020a7bc1c7000000b0039429bfebeasm8305513wmj.2.2022.05.14.02.54.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 May 2022 02:54:08 -0700 (PDT)
Message-ID: <ab3b2d59-109c-43d4-f97b-1c8ee1ee1f2c@redhat.com>
Date: Sat, 14 May 2022 11:54:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 07/26] block: add missing coroutine_fn annotations
Content-Language: en-US
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, Alberto Campinho Faria <afaria@redhat.com>
References: <20220509103019.215041-1-pbonzini@redhat.com>
 <20220509103019.215041-8-pbonzini@redhat.com>
 <20220513212613.laydrlckh63wett4@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220513212613.laydrlckh63wett4@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 5/13/22 23:26, Eric Blake wrote:
>> +int coroutine_fn blk_pwrite_zeroes(BlockBackend *blk, int64_t offset,
>> +                                   int64_t bytes, BdrvRequestFlags flags)
> Tracking down all callers of blk_pwrite_zeroes is not as trivial as in
> the previous patches.  But the very first one I checked:
>   block.c: create_file_fallback_zero_first_sector()
> 
> is neither marked coroutine_fn, nor does it have the "if
> (qemu_in_coroutine())" guard.

That one in particular _should_ be coroutine_fn; 
bdrv_co_create_opts_simple is the only caller.  This is probably a 
limitation of the thread-safety annotations that I used to generate this 
patchset: the compiler does limited inter-procedural analysis which for 
us means missing some potential coroutine_fn additions.

But I agree that blk_pwrite_zeros shouldn't be a coroutine_fn, because 
of fuse_fallocate and block_load.  Alberto, this function is another 
candidate for adding a blk_co_pwrite_zeros + a matching 
generated_co_wrapper.

Paolo

>  And block.c is not touched in this
> patch series, per the diffstat in 0/26.  Am I missing something?

