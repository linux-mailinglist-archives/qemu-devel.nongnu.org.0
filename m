Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8EE686FC0
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 21:38:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNJrU-0003pB-7A; Wed, 01 Feb 2023 15:37:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pNJrS-0003on-AD
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 15:37:42 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pNJrQ-0005Fe-O4
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 15:37:42 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 e8-20020a17090a9a8800b0022c387f0f93so3462448pjp.3
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 12:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cDzWbs+/epwF7rZFKE/wWrv0mAzxNOpRbMVuscyizeM=;
 b=WgMMcaHxmAmWlLnLlIxmDGTbpa2T7HT1tVbnrphVKoZZ6H4ACJsYVlGm1q9PaoLRrO
 R+ZXXEmJiGeD4xPQm7KvH3VZDAdlgpy6o6lrORdKe5aPF/k4VEsQh8E7IWvomzFTyid1
 ZlkH3NHn6EHEqTuww+9gBCbHX8oNe/DvPKW23ukDauN5vpQkrwQkZbhsE+hjuK1D9pXK
 GUYR9wKgU7qivLR0ZJUqw88untMjDuArufweIzsevzt7Xu+jiCEJUiHACeYoWgp2SPKz
 BQK6FKv3jn+xCA1BHIJsux2q8ItflnhR4vGl0OqTDDmpW815/WsF9Rh5Em1OwLjrYTd+
 xB9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cDzWbs+/epwF7rZFKE/wWrv0mAzxNOpRbMVuscyizeM=;
 b=dNu+fdOLWcGrYDSopSeoPYDilT7XezADT487J3bsO8pLlOQgBkqMOUk9QnuAw1u/me
 hsopW2CCjX3mLtdPN45WJg7WSKpChSgTM9znKivZlAVwWDkFlt8Mel7srPQHW/vswVhL
 vRrvnF1WqpuSSXLC9o2TwKNPGh4W/OC3c42XIdYVY4tyiqAuhjHH7xf0Qc1J3RqEx22b
 dvU1E72dhMJv/v8JaALqlyZAIXEyU3INvui8KsfZfaz8KkZR7tBqsAVsvM7TzPjJXpw+
 64yo8mCBZm6QHN+KOAvIhSLK9HVsmcItpirVi7fdCE/3AVgK8O+gzzKDfoFF9oMc6zrg
 NsHQ==
X-Gm-Message-State: AO0yUKXDOln/fK3C+Ntrxo4ahVscnUoF9DZfw+2rVLodM5508uEsTNTi
 OIw3s/XVhwH4eXeVT6359yk/Mg==
X-Google-Smtp-Source: AK7set/jrGvUgpN9laxBlkgIneSAKCDTUGRSlq0r//MkHnuxup0RcDXv1ASoF//7ClSG0q9cNuMFFA==
X-Received: by 2002:a17:90a:e7c5:b0:22c:18ce:a91b with SMTP id
 kb5-20020a17090ae7c500b0022c18cea91bmr3322300pjb.33.1675283859177; 
 Wed, 01 Feb 2023 12:37:39 -0800 (PST)
Received: from [192.168.50.50] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 l71-20020a63884a000000b004e28be19d1csm8616167pgd.32.2023.02.01.12.37.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Feb 2023 12:37:38 -0800 (PST)
Message-ID: <211b40bc-2bbb-63be-191a-42e03e049b98@linaro.org>
Date: Wed, 1 Feb 2023 10:37:35 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] accel/tcg: Complete cpu initialization before registration
Content-Language: en-US
To: Eric Auger <eauger@redhat.com>
Cc: iii@linux.ibm.com, qemu-devel@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20221031054105.3552-1-richard.henderson@linaro.org>
 <d91ccc02-a963-946d-169a-fd4da2610861@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <d91ccc02-a963-946d-169a-fd4da2610861@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 2/1/23 04:20, Eric Auger wrote:
> What I fail to understand is why this code is called with a kvm
> accelerated qemu (the test runs by default with kvm).
...
> #2  0x000002aaab1500f0 in vmsa_ttbr_write
> (env=0x2aaac393850, ri=0x2aaac3c90e0, value=2154950976315703518) at
> ../target/arm/helper.c:3784
> #3  0x000002aaab14e5a8 in write_raw_cp_reg
> (env=env@entry=0x2aaac393850, ri=ri@entry=0x2aaac3c90e0,
> v=v@entry=2154950976315703518)

This is indeed very curious -- vmsa_ttbr_write is supposed to be the "cooked" .writefn, 
not the .raw_writefn.  We're not supposed to arrive here at all.


r~


