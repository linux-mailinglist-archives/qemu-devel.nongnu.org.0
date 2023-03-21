Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A0C6C3110
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 12:57:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peacC-00085H-39; Tue, 21 Mar 2023 07:57:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1peac9-00083j-Mu
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 07:57:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1peac7-0001iu-5l
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 07:57:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679399834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lObKuunDEd3gvGmJOVak9Idlr6EpfnvejFRjg8It/QA=;
 b=Sp3WhaNUb95HQfh5pdCMd1pdWwNc1qRHwYPK3KQ6px3gNaMGo0tOVmylc2Ty20gNiA4poZ
 CUYqq6pUsmusdHPoBqfAINGmewclYBwAtqR2Ze1OfVuHeqMuU0BfAj+88eNNXtDDrD/z3h
 eBUdMN2HF8ruOXQ2wzqg9O8ibVZOA+w=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-327-nZ07jAVnOdiAGvJSpDeyhg-1; Tue, 21 Mar 2023 07:57:13 -0400
X-MC-Unique: nZ07jAVnOdiAGvJSpDeyhg-1
Received: by mail-wm1-f69.google.com with SMTP id
 p10-20020a05600c358a00b003edf7d484d4so2326123wmq.0
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 04:57:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679399832;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lObKuunDEd3gvGmJOVak9Idlr6EpfnvejFRjg8It/QA=;
 b=Vs7Gl4E5DTadNxXmKfiz9NiQyr8V2xkkjRvkFb+zqh6Fk3vf9KU2ulrKmiU1C0whJL
 MGc6fEy4ZyLZsqYySFT3mKFIJKuxboGa99uTYby4P4I5phOZXGGkBL1s8t1B9Hv4pJ/0
 iffR36Q58k7ttX/7rX7ucUOwKwIAc/DBzxcpFMSP/X4O9pKhfvD+VhgyKRo7ZpUXZERS
 9UfvhqiPl4OGvljGSqn56PC9sRkbarFTfP+z678wev4y6lQBM08DLMbFd7V9EO2quxX8
 K0O3/5VMEw74uO648tPEhI/pdDbf2s3cExgtS+MnnyAqdpJr8udrHghmZAX3ckBbYxk4
 2D7A==
X-Gm-Message-State: AO0yUKXYHbbsTSx58y/f4LvUhF7i4lRyKaslka7tl8KAcXsWnCnywXgb
 pi8XCgaPOnxMn2CDCAq9vfV0CizSlwN2FWw/uRtumLOTxRy+JWjTIG7kXzYlhNbMafH+Nqn9Olg
 YjDqKLA7IMRxRWoU=
X-Received: by 2002:a1c:6a04:0:b0:3ee:289a:4382 with SMTP id
 f4-20020a1c6a04000000b003ee289a4382mr1896384wmc.8.1679399832099; 
 Tue, 21 Mar 2023 04:57:12 -0700 (PDT)
X-Google-Smtp-Source: AK7set+f2GYcaUvKCE2jpya7XRC8NbD7nxi5iLtTGf76mu62PKtOENtpVQNibazRlh33e+/TaC/0LA==
X-Received: by 2002:a1c:6a04:0:b0:3ee:289a:4382 with SMTP id
 f4-20020a1c6a04000000b003ee289a4382mr1896367wmc.8.1679399831756; 
 Tue, 21 Mar 2023 04:57:11 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 d9-20020adfe889000000b002d97529b3bbsm841710wrm.96.2023.03.21.04.57.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Mar 2023 04:57:10 -0700 (PDT)
Message-ID: <1dc87cd2-2f86-3580-3f29-a89de375c79d@redhat.com>
Date: Tue, 21 Mar 2023 12:57:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH for-8.0 1/3] async: Suppress GCC13 false positive in
 aio_bh_poll()
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20230321083322.663561-1-clg@kaod.org>
 <20230321083322.663561-2-clg@kaod.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230321083322.663561-2-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 3/21/23 09:33, Cédric Le Goater wrote:
> +static void aio_bh_slice_insert(AioContext *ctx, BHListSlice *slice)
> +{
> +    QSIMPLEQ_INSERT_TAIL(&ctx->bh_slice_list, slice, next);
> +}
> +
>   /* Multiple occurrences of aio_bh_poll cannot be called concurrently. */
>   int aio_bh_poll(AioContext *ctx)
>   {
> @@ -164,7 +169,13 @@ int aio_bh_poll(AioContext *ctx)
>   
>       /* Synchronizes with QSLIST_INSERT_HEAD_ATOMIC in aio_bh_enqueue().  */
>       QSLIST_MOVE_ATOMIC(&slice.bh_list, &ctx->bh_list);
> -    QSIMPLEQ_INSERT_TAIL(&ctx->bh_slice_list, &slice, next);
> +
> +    /*
> +     * GCC13 [-Werror=dangling-pointer=] complains that the local variable
> +     * 'slice' is being stored in a global list in 'ctx->bh_slice_list'.
> +     * Use a helper to silent the compiler
> +     */
> +    aio_bh_slice_insert(ctx, &slice);
>   
>       while ((s = QSIMPLEQ_FIRST(&ctx->bh_slice_list))) {
>           QEMUBH *bh;
> -- 

Sorry, but an API that has "insert" and not "remove", and where the 
argument is *expected to be* a local variable (which must be removed to 
avoid a dangling pointer---and the warning is exactly 
-Wdangling-pointer), ranks at least -7 in the bad API ranking[1].

I tried wrapping the BHListSlice and BHListSlice* into an iterator 
struct (which is also really overkill, but at least---in theory---it's 
idiomatic), but the code was hard to follow.

The fact that the workaround is so ugly, in my opinion, points even more 
strongly at the compiler being in the wrong here.

Paolo

[1] http://sweng.the-davies.net/Home/rustys-api-design-manifesto


