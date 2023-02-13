Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F36FD695161
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 21:07:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRf5v-0004cC-2e; Mon, 13 Feb 2023 15:06:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pRf5b-0004Z6-DU
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 15:06:15 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pRf5Y-0006Tc-UX
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 15:06:14 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 d13-20020a17090ad3cd00b0023127b2d602so13351462pjw.2
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 12:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SYjVUAGjmw60Y0f/eILURiqXUlRskoNI/leFM76bFMo=;
 b=A5w7IW/pkA9TpULQiw8K2128CGXzNT49bg1wtqRZk5eiOsO0QMf7wUJl4NBhPhzVdU
 iSzxlszl2TtoybgXBj4q+HyVcFCN8yu7nXUEqu8PIyhktXRUU8aZ08JFMVcz9NgXhogW
 28osEi4ufkGszN4y+DO5uG3HFKY73DRNkdxT5f7Fh4ljT+vZgg9Rp53TBCtg6mGdgCio
 dc8h+6MS7KR77tTl2ORmKhBYBGnrQHv+bHoS5kzh+9g56ap/3F3DNKD9c0RxjnFRN7yY
 TnXGnJ5AzFMcvrYwidvfowWTcnVx1vVwr0YBRFN5/vRryUyT6UXcrYYFCTQ1kyaHWTe3
 Diuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SYjVUAGjmw60Y0f/eILURiqXUlRskoNI/leFM76bFMo=;
 b=zhYu1cIcyuc8zbhvbqYxuZW1l8J7X0RtSA8T4DQcq2V936AXXt4MYTQL4Y88FW68ju
 sUGFRWVIEfrD+aNa8ireHeJEXdY2y8yDCspUJtUa/OZ6Qk4xTxSTd7ixchPeLD2bQ5rF
 2l7mIrIMw+1RSi+h6Ltlw1/v3+zL1Pvw3Jsl5tjaIUNBVjve3H1Sim8V30hkg6ZqMjxq
 jVaYRgVsIb9ltac3/6G/6CXcal4UxQb77wFa7REqok1Hz5CwD1/r1CCU56GPFF3AbBKU
 1iY+9Tdyd+D8Mi6Y/8cR1qVh7oDDjvQxoC6SPUlWfjelA0TaEdWBWFdWZpq902ekVuv7
 ZJZA==
X-Gm-Message-State: AO0yUKUh/M9+ub6AnaSR4RxIm0HxEayG8fO6ZdqT8/49zkzyBCkce8CY
 Xe7N2iiLeq6NR9suEi9USvYcqA==
X-Google-Smtp-Source: AK7set94uJDdpR3NyvI1mr8oz6QzK0296ZYAbjOQzCsTPvonkhV+2O3heYm2eCaNRLNVj35EPL25Tw==
X-Received: by 2002:a17:902:ea0e:b0:19a:96ea:3850 with SMTP id
 s14-20020a170902ea0e00b0019a96ea3850mr7312002plg.17.1676318771174; 
 Mon, 13 Feb 2023 12:06:11 -0800 (PST)
Received: from [192.168.145.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 j4-20020a170903028400b0019a256bfe96sm8589743plr.242.2023.02.13.12.06.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 12:06:10 -0800 (PST)
Message-ID: <9bcc4dea-2c68-fa9e-2667-e72e7e7da3a4@linaro.org>
Date: Mon, 13 Feb 2023 10:06:06 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 1/4] linux-user: Always exit from exclusive state in
 fork_end()
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>
References: <20230213125238.331881-1-iii@linux.ibm.com>
 <20230213125238.331881-2-iii@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230213125238.331881-2-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.345,
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

On 2/13/23 02:52, Ilya Leoshkevich wrote:
> fork()ed processes currently start with
> current_cpu->in_exclusive_context set, which is, strictly speaking, not
> correct, but does not cause problems (even assertion failures).
> 
> With one of the next patches, the code begins to rely on this value, so
> fix it by always calling end_exclusive() in fork_end().
> 
> Signed-off-by: Ilya Leoshkevich<iii@linux.ibm.com>
> ---
>   linux-user/main.c    | 10 ++++++----
>   linux-user/syscall.c |  1 +
>   2 files changed, 7 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

