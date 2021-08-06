Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE60B3E25A7
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 10:21:49 +0200 (CEST)
Received: from localhost ([::1]:42384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBv6y-0000E7-WA
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 04:21:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mBv5l-0007BK-Fz
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 04:20:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mBv5k-0007MQ-22
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 04:20:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628238031;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Kl+jAYGjCGM4bJCYGNojHZQFSi4v8L1f+2FaKqEQs2A=;
 b=JKeX5kF4bTfEILUOUKQwVSsN/dxhCM7qK6iYxPw5R4K13W/62Ky/m7txPVSBArggDrDbVm
 f02SF4q6uxL+niQmHaiSYo2W4//Xf8I1GsBGlYlz9SXXiTIfDJfXNeLaHv3/s2NUyk4T0H
 fi3s9WnNdpvtZQuPMyjtxlA0FND82tg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-55-FQTd7XcaN1q6Sx_HcOeZaw-1; Fri, 06 Aug 2021 04:20:26 -0400
X-MC-Unique: FQTd7XcaN1q6Sx_HcOeZaw-1
Received: by mail-wr1-f69.google.com with SMTP id
 f6-20020adfe9060000b0290153abe88c2dso2897163wrm.20
 for <qemu-devel@nongnu.org>; Fri, 06 Aug 2021 01:20:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Kl+jAYGjCGM4bJCYGNojHZQFSi4v8L1f+2FaKqEQs2A=;
 b=OsEAriwIuD3RrlbZmrVTeoR9q7CB14StBup0H16ob9oES5IzwlW86ugoSOmLmcC6LS
 wuxhY891VBlTS3Co8t0/mkOJd9pGyaOiOxt1CN/NPkargNO2Mi+THxYyz5YJZbbxE/Aj
 kKsGPk5j/JXy+Q28QTaCTN+afyR90pEWhsKm5xC28x3oBS0mwj/AMev5BoxOc5Cu9+e8
 SPyiJ6er6Xn0OHjpXZ5m40P0Q12GKi5rN1mYajeRrT7UVEsbxYbbkBmtORoVK07BQJMh
 h2lkraIOf5rEDs3YSwEEHndmsKM7UKYjNSUAbK2qvMTRfnz1B7oh/lAgv4vinhnDuk7M
 HD3g==
X-Gm-Message-State: AOAM531ShAVXYs9XzuKl87Pg5gMPANLrOhlj6aofdJY08sZbyE1pYEnO
 GAI6OVo/lgwKTHXpKH+7vnGZ5/iwnnYjCEBEbZ1Pr6FazBOSx/2GcgY0drLp9vY8/luWk0540E9
 JBniSEyoVDu7Yzs4=
X-Received: by 2002:adf:f789:: with SMTP id q9mr9623431wrp.380.1628238025861; 
 Fri, 06 Aug 2021 01:20:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2PmhAHnlG2AhsgOc7KnBmXXjVoyEI9xCZdgX6G2y2oqllYDUpveaEqfHTwrSjtI0yjlms9g==
X-Received: by 2002:adf:f789:: with SMTP id q9mr9623411wrp.380.1628238025677; 
 Fri, 06 Aug 2021 01:20:25 -0700 (PDT)
Received: from thuth.remote.csb
 (dynamic-046-114-147-107.46.114.pool.telefonica.de. [46.114.147.107])
 by smtp.gmail.com with ESMTPSA id h14sm8649010wrp.55.2021.08.06.01.20.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Aug 2021 01:20:25 -0700 (PDT)
Subject: Re: [PATCH v1 07/12] s390x/mmu_helper: move address validation into
 mmu_translate*()
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210805152804.100333-1-david@redhat.com>
 <20210805152804.100333-8-david@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <84ffaeae-967a-7545-fcc6-16b94720d8a9@redhat.com>
Date: Fri, 6 Aug 2021 10:20:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210805152804.100333-8-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.132, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Jason J . Herne" <jjherne@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Claudio Imbrenda <imbrenda@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/08/2021 17.27, David Hildenbrand wrote:
> Let's move address validation into mmu_translate() and
> mmu_translate_real(). This allows for checking whether an absolute
> address is valid before looking up the storage key. We can now get rid of
> the ram_size check.
> 
> Interestingly, we're already handling LOAD REAL ADDRESS wrong, because
> a) We're not supposed to touch storage keys
> b) We're not supposed to convert to an absolute address
> 
> Let's use a fake, negative MMUAccessType to teach mmu_translate() to
> fix that handling and to not perform address validation.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>   target/s390x/mmu_helper.c      | 36 ++++++++++++++++++++--------------
>   target/s390x/tcg/excp_helper.c | 13 ------------
>   target/s390x/tcg/mem_helper.c  |  2 +-
>   3 files changed, 22 insertions(+), 29 deletions(-)
> 
> diff --git a/target/s390x/mmu_helper.c b/target/s390x/mmu_helper.c
> index ca25dadb5b..36ab4e9c81 100644
> --- a/target/s390x/mmu_helper.c
> +++ b/target/s390x/mmu_helper.c
> @@ -301,14 +301,13 @@ static void mmu_handle_skey(target_ulong addr, int rw, int *flags)
>   {
>       static S390SKeysClass *skeyclass;
>       static S390SKeysState *ss;
> -    MachineState *ms = MACHINE(qdev_get_machine());
>       uint8_t key;
>       int rc;
>   
> -    if (unlikely(addr >= ms->ram_size)) {
> -        return;
> -    }
> -
> +    /*
> +     * We excpect to be called with an absolute address that has already been

s/excpect/expect/


