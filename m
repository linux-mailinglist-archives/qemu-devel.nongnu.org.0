Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4949522810
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 02:02:27 +0200 (CEST)
Received: from localhost ([::1]:39314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noZoA-0000nW-PR
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 20:02:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1noZkg-0006BG-GB
 for qemu-devel@nongnu.org; Tue, 10 May 2022 19:58:50 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:40481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1noZke-0008IR-M1
 for qemu-devel@nongnu.org; Tue, 10 May 2022 19:58:50 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 iq2-20020a17090afb4200b001d93cf33ae9so3320968pjb.5
 for <qemu-devel@nongnu.org>; Tue, 10 May 2022 16:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=z4KACPlpgR07lxNJpLe3JGeTzl+o26N4R6Hv/mxRcgs=;
 b=LIEvYZ9Bc2/ZfdONd8qGBkQqlh0kVX7acsakkG2X4Q8i0SzdIbiGMV/U+6X+0ETAQw
 RYWf2eMOOHXYYFjVvjy/jcOSAzCChKoXpYy5V2oPXieLi+xHx0hlIrTfp+euRFYX8voI
 3iSCJHUf8PcOW3gESHHLH2xQUd4ZddbBplsQvcoJ6uoi00e2lA95qRIdSDgKnvKkAdWl
 tv+br3bzqaHq+nyBbnw8tjXEl3krNAc3JdSrM4AQGhmQiRjCceIPrbK+EdNhy7R9I1Sn
 PFtJ3J4S+ff9No1TlKEw4kWhR8H6IKY1JOWaD50wmo5hB3IlFlT+USFAUHvgMcHElRim
 ZVVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=z4KACPlpgR07lxNJpLe3JGeTzl+o26N4R6Hv/mxRcgs=;
 b=oaVQ0H1TVoPLthQatv5C82RZ0hW6Jgn0oLWs4v+y23wYaoT9L6HUsehpYY3NABL4up
 tjiMkVGxEbKMTeNj4ughBbQ/jWIKZbXnuejYBHxc952T8kv/45x43lT6cBf1dASLoULa
 mHIQtMzxIrIQW06Gnui1qQR/HfgEaQ8/T5d8S7nMZBwf0inteFm0hq5JSs+LhbCd65xb
 6m95XdkHYg8ybU/6e40yu6dhpQKtWCz0cxILuBXyf6FhtIvgKXOb5gLWsCT63jnWzI1k
 vtzhQaoeJqNGDNhroOlH6Mo47i891jj/ZS2fMYWDgpDxi7NAMGGD4I9LEnroQGbAFvXy
 Pklw==
X-Gm-Message-State: AOAM531uKJ6CTVrXxCMLbycLMlBgrcM6ER4t+6BxuubKNX/AJOl5c5Uo
 Yv8ysbVmZ0M9k2t6z+QML/20ew==
X-Google-Smtp-Source: ABdhPJxC4jQnkQ8SaaTA35BVQ4CMRz47m6KZU408cX8dd+4VJfQrBhHnTUOaZjffoKM6v/VFb6nzzg==
X-Received: by 2002:a17:90b:4d01:b0:1dc:9314:869f with SMTP id
 mw1-20020a17090b4d0100b001dc9314869fmr2347877pjb.140.1652227127413; 
 Tue, 10 May 2022 16:58:47 -0700 (PDT)
Received: from ?IPV6:2607:fb90:806a:923e:f0df:3e3a:c73f:64e4?
 ([2607:fb90:806a:923e:f0df:3e3a:c73f:64e4])
 by smtp.gmail.com with ESMTPSA id
 n8-20020a170903110800b0015e8d4eb286sm188722plh.208.2022.05.10.16.58.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 May 2022 16:58:46 -0700 (PDT)
Message-ID: <af1900c9-8adb-a033-58e5-ed2cd5d45127@linaro.org>
Date: Tue, 10 May 2022 16:58:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 3/3] target/ppc: Rename sfprf to sfifprf where it's
 also used as set fi flag
Content-Language: en-US
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org
References: <20220510204610.100867-1-victor.colombo@eldorado.org.br>
 <20220510204610.100867-4-victor.colombo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220510204610.100867-4-victor.colombo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 5/10/22 13:46, Víctor Colombo wrote:
> The bit FI fix used the sfprf flag as a flag for the set_fi parameter
> in do_float_check_status where applicable. Now, this patch rename this
> flag to sfifprf to state this dual usage.
> 
> Signed-off-by: Víctor Colombo<victor.colombo@eldorado.org.br>
> 
> ---
> 
> v2: Add this patch
> ---
>   target/ppc/fpu_helper.c | 112 ++++++++++++++++++++--------------------
>   1 file changed, 56 insertions(+), 56 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

