Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5A634925F
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 13:48:04 +0100 (CET)
Received: from localhost ([::1]:40268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPPP9-0007s7-Pm
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 08:48:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPPNL-0007MJ-6J
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 08:46:11 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334]:39634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPPNH-0007wV-Va
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 08:46:10 -0400
Received: by mail-ot1-x334.google.com with SMTP id
 h6-20020a0568300346b02901b71a850ab4so1777142ote.6
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 05:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LL4SJ44Xo/qf8X7fMVVcCb8+F3bbLXOetINDLk9v0Ek=;
 b=idsW/zeMMVfKyywI1ydKOU1LID1c+gw056Hp3JI6vuVDDcoej1DX/GRQgMnxfAmWsz
 piOAmq5dqYnJ4CK+hdfs0dXgEE4+egRgrJSz6+AAMBv8sU6tOzSiPOqllMeHc65LMRm/
 alPXnBnfB+Pgbg0bF8KcUTQAudjZVdjHsuGx7DUWoRdRJNdRRQjuKvW70h1qazCXCeTP
 0etXWk4JbnPVJuTIrEK0DwKcYfQkf3mAblFirb7WMRH2MsgWYBw/NozieT1zgnnmkk2r
 TSea6FYgiopKHOTncJecEInUoSl9UcdMMId4d0B21AAGgdW66251NC7Vr1gexw/2NLJu
 59Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LL4SJ44Xo/qf8X7fMVVcCb8+F3bbLXOetINDLk9v0Ek=;
 b=VhZZt6ePjadobChBX99dU9TH2vpsHp3jWSVOaW/u5M/VoZuq/cVYTpxxvDWQrptfMn
 2xxZu+TOM68qS2dU5iTOvxCuLlaKGMf//v2xZWQyCtAAaXCapWv1reVW1kHqmRS0ZeqF
 lKf45O65PINLYKOY1HkVGp8PBYdnWm3barI5ESU0c65+16aPS7uUVV0C0KEC3BVfmKth
 55RU0vyKMNt1HWFmSo8rgaDEhahzlRyKCQYQlojZXuEnJB6JL4bupR+ECpdJq18TKNoE
 ABIKMAs2cHCHc7390pyGAOWxdvQVoYbVT0UFe7YozXB45XIRSLzzFQXnyYlJ1pB9c/8R
 WLbQ==
X-Gm-Message-State: AOAM530bMsdY1VlqCX++HLM4kUZI/8MsQTR0KyprjKgBEzmq9MloUHzh
 qWRWfm09jPDssxhxvXMOAUlZqA==
X-Google-Smtp-Source: ABdhPJx3Xu5I09IbvleELzzZ7stM6dRaY96DJjA1VQ4SVniqgMMen74f8JvKCk7jJs5hI0mRPfZ3Yg==
X-Received: by 2002:a05:6830:1513:: with SMTP id
 k19mr7185872otp.51.1616676366598; 
 Thu, 25 Mar 2021 05:46:06 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id 64sm1209604oob.12.2021.03.25.05.46.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Mar 2021 05:46:06 -0700 (PDT)
Subject: Re: [PATCH v3] linux-user/s390x: Use the guest pointer for the
 sigreturn stub
To: Andreas Krebbel <krebbel@linux.ibm.com>, qemu-devel@nongnu.org
References: <20210324185128.63971-1-krebbel@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <62161be8-2c92-8b51-284b-3e39af255b0f@linaro.org>
Date: Thu, 25 Mar 2021 06:46:03 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210324185128.63971-1-krebbel@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x334.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-s390x@nongnu.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/24/21 12:51 PM, Andreas Krebbel wrote:
> When setting up the pointer for the sigreturn stub in the return
> address register (r14) we currently use the host frame address instead
> of the guest frame address.
> 
> Note: This only caused problems if Qemu has been built with
> --disable-pie (as it is in distros nowadays). Otherwise guest_base
> defaults to 0 hiding the actual problem.
> 
> Signed-off-by: Andreas Krebbel<krebbel@linux.ibm.com>
> ---
>   linux-user/s390x/signal.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


