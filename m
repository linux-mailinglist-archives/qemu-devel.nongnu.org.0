Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2553111E6
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 21:07:00 +0100 (CET)
Received: from localhost ([::1]:46426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l87Nb-00043r-GE
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 15:06:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l87LD-0003ZP-Tu
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 15:04:31 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:45910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l87LC-0007py-6i
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 15:04:31 -0500
Received: by mail-pf1-x435.google.com with SMTP id j12so5035155pfj.12
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 12:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9mS2Ti4hP0XhLa3HI6MvMShVBE8gcLe16V2ck9/0CcY=;
 b=htzZ39FhSce0T78lo43qz2rlQLufjwtrr9764znNLSvqK0yolj0zAetYEb4x5Fyt0h
 EkqYkCjd01T0pJOEuu1v6HGbZ1ePrCsX2SUDMqIKZR0S/2pwIo+0AFkB7ngCs+/bc3/7
 CHUVWl/hkjqdhea6ISWUwW2Mo3BEr9V6oXzqityLJkJa28I+FwabmPHmg0hg26a2lkY+
 qdHg6Uw9Pt+V/MiNqzOpwdexfyz91M5dE2VRd5RK+yq8k+7NoAw1RHgFR9y3P3s1cJsH
 SzncU590mdGM7GEi3pO177gbpwNMltTdHqG0Csf441hWOY255FSO8+SbPVrDSMDxMtY9
 6QBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9mS2Ti4hP0XhLa3HI6MvMShVBE8gcLe16V2ck9/0CcY=;
 b=AVInFNQ8SHhYyxksRVFs7uBwjDtX9yUtIbJbbiRqtyqwQbFIXaLgOUB3KVE481LNMQ
 iQutau/9IqjKfTxYnBYrjQhfRhDPBtUXQe1A78XvW8eUj6kI3laymQN3gbX64EWMWn1w
 qKRu/NMpyORvYkcnFJZH5aCaR5D4nkQBLetvYeEhE7zF2i3kS5nZ9R50eIIUKPKDV9ce
 4SstN/oB0DX/py5gYSIA8OB8X1ueO+8yqoHOpkPVzbgip5BUyiM8Bl0XTIn1/Q9fH4Ww
 wVsUQUdlSemp7Ng7g7JawxmMucXqmFtROQMWbVc1aXkKGZtjWIgGetJlAqivdiSiMnoe
 fCdw==
X-Gm-Message-State: AOAM5309U2zY3FJcfxkCNqQuWkZRg2otConQ5xj74JY78+8FRETG6rrh
 WaOa5lSvOxk1UGGXInDL+JXhESvTB8kujf3W
X-Google-Smtp-Source: ABdhPJxdak2kxCSX4Zx0urRu6BJ00sYEzhKph5ptzQ3wN3wNf1WPkkHDHkwyYAs2tmKRWX3b26qptQ==
X-Received: by 2002:a65:62d3:: with SMTP id m19mr6105099pgv.180.1612555468469; 
 Fri, 05 Feb 2021 12:04:28 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id g15sm10030942pfb.30.2021.02.05.12.04.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Feb 2021 12:04:27 -0800 (PST)
Subject: Re: [PATCH v16 19/23] i386: split cpu accelerators from cpu.c, using
 AccelCPUClass
To: Claudio Fontana <cfontana@suse.de>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210204163931.7358-1-cfontana@suse.de>
 <20210204163931.7358-20-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8586d6a7-7b68-754c-11c3-39e30c27e28d@linaro.org>
Date: Fri, 5 Feb 2021 10:04:22 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210204163931.7358-20-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.33,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/4/21 6:39 AM, Claudio Fontana wrote:
> +static void hvf_cpu_accel_class_init(ObjectClass *oc, void *data)
> +{
> +    AccelCPUClass *acc = ACCEL_CPU_CLASS(oc);
> +
> +    acc->cpu_realizefn = host_cpu_realizefn;
> +    acc->cpu_instance_init = hvf_cpu_instance_init;
> +};

Watch the stray ; after functions.
Make sure there's a blank line in between functions and file-scope structure
definitions.

> +static const TypeInfo hvf_cpu_accel_type_info = {
> +    .name = ACCEL_CPU_NAME("hvf"),
> +
> +    .parent = TYPE_ACCEL_CPU,
> +    .class_init = hvf_cpu_accel_class_init,
> +    .abstract = true,
> +};
> +static void hvf_cpu_accel_register_types(void)
> +{
> +    type_register_static(&hvf_cpu_accel_type_info);
> +}

The rest looks ok, but I would like to see other i386 review.


r~

