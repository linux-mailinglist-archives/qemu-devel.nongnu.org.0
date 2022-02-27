Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50DED4C58DB
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 02:06:37 +0100 (CET)
Received: from localhost ([::1]:49530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nO81D-0004HK-TT
	for lists+qemu-devel@lfdr.de; Sat, 26 Feb 2022 20:06:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nO80G-0003OM-FV
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 20:05:36 -0500
Received: from [2607:f8b0:4864:20::42a] (port=33541
 helo=mail-pf1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nO80E-000233-Mo
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 20:05:36 -0500
Received: by mail-pf1-x42a.google.com with SMTP id d17so7958235pfl.0
 for <qemu-devel@nongnu.org>; Sat, 26 Feb 2022 17:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=DJatXAY8Y9lm5bAzIg8aAgumTvwTY6+AEZGC/kebNdE=;
 b=IwafkjKsmLGrnaI+viVcEjcnWXTttfbDZuNoYLkHQuLMiKfiJSejup0HFhEnzaYBcr
 cv3eL7oJbdW+ooe9dccmONYZkhkFjaaHWhbmv5NdDryvZU37b2cpTi5kSFxqJsufq8po
 vg0ZcbDafp113csrpQos3xfNCeEe4PECbTDMQY9/2mQ3VoGGvDk+0d1CZtAsnC2bZNf1
 1iTkDOHIs181kbX+KhRjSIod4j1pAI7+/9Z1MDvjO8O6GdA8KBHXZEr1ahdOI7rToScS
 05YL8onMHfnMjodoWyjpDFjsn6hwetPr6WukPZoxUZBlJkgUyRDe7H+iqRrIJUnANA9J
 C+iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DJatXAY8Y9lm5bAzIg8aAgumTvwTY6+AEZGC/kebNdE=;
 b=NS/vmDvqsZJBqn5olZXa1j1JVwgJOCLtxY+YLXSy/CMQHqi9xVNbGJJfOLo1TtKrlc
 3GAddQvl/zwJgcLgEGwqS1HR/49w31+DWxDGLWPON/5Cd4eF1V/x+ZcSPtbPMVWh1yVF
 doQizl31ihJqdCi9/pDfPdaPzkoYzldVkAzep6SnDpc2G8LZjoqKjzgyfNJ3KdMM7Ry1
 lbiXAer1ArQtwuWI2VNYretgjqlNIu2aNVDmGXcAn+a7kdUUyhpm0OoOsPPgjzPuWRlR
 vSc0z0l4nxlukNO9AZiAHh0lXLlaqDqQUwY4KZ5hA3Z8u1Ncyct+lG4VRzh944dXnOVg
 o7DQ==
X-Gm-Message-State: AOAM532LrfweFUFRw1DDxF0e65l6P7gj5NEYll2NqnLiLlNN/9pv57ha
 zVCQwl5hKbOEJrtkmrhtJ1Rfrg==
X-Google-Smtp-Source: ABdhPJyAmt35Ve1J7AnjBUzhh16jYTPzVV7MXu3rZNwEENu5TrNhGmaumY02LRDUfJq8O9HV8XLwPg==
X-Received: by 2002:a05:6a00:21c7:b0:4e1:dba1:a3a6 with SMTP id
 t7-20020a056a0021c700b004e1dba1a3a6mr14827858pfj.59.1645923932647; 
 Sat, 26 Feb 2022 17:05:32 -0800 (PST)
Received: from ?IPV6:2603:800c:1201:c600:9001:d56a:9ee0:246?
 (2603-800c-1201-c600-9001-d56a-9ee0-0246.res6.spectrum.com.
 [2603:800c:1201:c600:9001:d56a:9ee0:246])
 by smtp.gmail.com with ESMTPSA id
 d11-20020a056a00198b00b004dfc6b023b2sm8193354pfl.41.2022.02.26.17.05.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Feb 2022 17:05:32 -0800 (PST)
Message-ID: <7b3c0866-d4f5-d947-107f-0da347279dec@linaro.org>
Date: Sat, 26 Feb 2022 15:05:29 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 8/9] util: Put qemu_vfree() in memalign.c
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20220226180723.1706285-1-peter.maydell@linaro.org>
 <20220226180723.1706285-9-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220226180723.1706285-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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
> qemu_vfree() is the companion free function to qemu_memalign(); put
> it in memalign.c so the allocation and free functions are together.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   util/memalign.c    | 11 +++++++++++
>   util/oslib-posix.c |  6 ------
>   util/oslib-win32.c |  6 ------
>   3 files changed, 11 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

