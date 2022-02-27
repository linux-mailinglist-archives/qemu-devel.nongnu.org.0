Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8CC4C58CB
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 01:28:12 +0100 (CET)
Received: from localhost ([::1]:51544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nO7Q3-0001wb-8c
	for lists+qemu-devel@lfdr.de; Sat, 26 Feb 2022 19:28:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nO7Or-0000EJ-W7
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 19:26:58 -0500
Received: from [2607:f8b0:4864:20::634] (port=43839
 helo=mail-pl1-x634.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nO7Oq-0007dR-Ca
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 19:26:57 -0500
Received: by mail-pl1-x634.google.com with SMTP id u2so238084ple.10
 for <qemu-devel@nongnu.org>; Sat, 26 Feb 2022 16:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=9tHc9tmHQdqSLjVSfLh1C7o19/wP/F/L074wapeMIgE=;
 b=eEs5fGLPLzp3T9CErGusv7GTna+f4asrK97QE0hDnyeSUpOkEfb7Mwlt1ETNpSkwh3
 Kx0CfbZOuT7iVJg/+gPJ3JCgWXsxILZoOLsGmAccbC5Aj8oK6me/DTOeP1EG5bafA6IM
 HX72Yrvg6Fpi04pCpknMS8BQD6I36idI0I+SdgO15EopKBrz9v7ie0UwijX1VepFwyDT
 dcuxMvHmfGTjI/QG8zzOV/bWbQOr2NIPhY3Qe46gxwp+JWsPSLYhn6bXOV1GXF1GWSAA
 k2a65fAsBRzyxVhY5oSecKPCYSC2Wux7ZILhodD03Hi64GzdJzRUsse8Pz/n4h0o4m4G
 L1fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9tHc9tmHQdqSLjVSfLh1C7o19/wP/F/L074wapeMIgE=;
 b=uLla6Wp2TQmTsifJV3vevnCpY++vOVGE8hqXVk4d09MgkZj89IDG2HX1PQGJOJWtH+
 qF/O9fHdopbnyQBel0yzeZcqxzgQpoCXaP+bV0yEimcBBbhOUkWnG3O708j20sP9kKqG
 dvRALcqA0lR3DBel/3pb2CLpSdR4fiPGEMeKZlgFy+ONDdMTZTojOuTCI9VZnktXvonY
 RScE8qyKCEK8MWCBg87L4mdWmLhiq1LlaRgnXW9lyT24eqt+k5UHYTcS0LjTyOYNR0lb
 Mbk5u6Z0yhpiO6gagkr1UE1ZJ0T04ziMWJ0RsYCTywuxtx+JhsIPUFei9Ubj2CkLT2ir
 aUvg==
X-Gm-Message-State: AOAM530fWu3RfLv6r4RVgdC1rGwnKlho7/zqxB2N1jt9LiEGWnjBxNyq
 syWfajTn3Js3mFhAsvhu8t0TrA==
X-Google-Smtp-Source: ABdhPJz7GSbbyfAi7ssoH8L1KhwC9m8j4Ow6Ghugf98TizanA1wgy8E0dZA/knn37P0nSAFvykt9Ig==
X-Received: by 2002:a17:902:f549:b0:14f:a0c5:ced3 with SMTP id
 h9-20020a170902f54900b0014fa0c5ced3mr14046857plf.57.1645921614349; 
 Sat, 26 Feb 2022 16:26:54 -0800 (PST)
Received: from ?IPV6:2603:800c:1201:c600:9001:d56a:9ee0:246?
 (2603-800c-1201-c600-9001-d56a-9ee0-0246.res6.spectrum.com.
 [2603:800c:1201:c600:9001:d56a:9ee0:246])
 by smtp.gmail.com with ESMTPSA id
 67-20020a630846000000b00372782a65d0sm6836515pgi.60.2022.02.26.16.26.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Feb 2022 16:26:53 -0800 (PST)
Message-ID: <c35cdae9-b0ce-c417-a85d-5fe632bca89f@linaro.org>
Date: Sat, 26 Feb 2022 14:26:49 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/9] hw/usb/redirect.c: Stop using qemu_oom_check()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20220226180723.1706285-1-peter.maydell@linaro.org>
 <20220226180723.1706285-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220226180723.1706285-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::634
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/26/22 08:07, Peter Maydell wrote:
> qemu_oom_check() is a function which essentially says "if you pass me
> a NULL pointer then print a message then abort()".  On POSIX systems
> the message includes strerror(errno); on Windows it includes the
> GetLastError() error value printed as an integer.
> 
> Other than in the implementation of qemu_memalign(), we use this
> function only in hw/usb/redirect.c, for three checks:
> 
>   * on a call to usbredirparser_create()
>   * on a call to usberedirparser_serialize()
>   * on a call to malloc()
> 
> The usbredir library API functions make no guarantees that they will
> set errno on errors, let alone that they might set the
> Windows-specific GetLastError string.  malloc() is documented as
> setting errno, not GetLastError -- and in any case the only thing it
> might set errno to is ENOMEM.  So qemu_oom_check() isn't the right
> thing for any of these.  Replace them with straightforward
> error-checking code.  This will allow us to get rid of
> qemu_oom_check().
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> I have left all of these errors as fatal, since that's what they
> were previously. Possibly somebody with a better understanding
> of the usbredir code might be able to make them theoretically
> non-fatal, but we make malloc failures generally fatal anyway.
> ---
>   hw/usb/redirect.c | 17 ++++++++++++++---
>   1 file changed, 14 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

