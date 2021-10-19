Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95384433FC8
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 22:26:48 +0200 (CEST)
Received: from localhost ([::1]:38130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcvh9-0001fp-5B
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 16:26:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcvfX-0000xr-Uh
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 16:25:08 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:45873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcvfV-0000NY-7g
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 16:25:07 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 ls14-20020a17090b350e00b001a00e2251c8so790144pjb.4
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 13:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0NPyVwfuUYZT6TuVock5zHOQeP0UZDNfOsniJxSP98I=;
 b=HjG6CMtmLTMeH2YUQpfGvNS7MhdtTrL68mCMMDCr4FhzP9tU6t8vxtfck2P2GtlUKD
 Sm83eWMtRVPAjUqYmMQ5fOVmS08osbbZjqIPaxuxg8B/WTZd4++EXrwxrFTy0UgAcCyR
 276lM4bRwpv2uQZJZ0V7Wo7iqn5SVN6+Ya6VR/1ScyLV9EHQ1Rr02pz/lpu6ymhnauyf
 2Y5SbFSSu5bi0cY/odAvFxtkvHW4hEljnjFvEvfNJ1Hs/A8/KPCeyXi8qbzD1pLyp+X8
 aH+lldtBOxN5NZ+D8syjKB0AzsTVzUTKZ67YXFu/oCgUgstu0oGB5ykBVN9zfd3peTnN
 bZ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0NPyVwfuUYZT6TuVock5zHOQeP0UZDNfOsniJxSP98I=;
 b=AYMj6GDkH33iBAW5sV10j1K/QbnPmIRfA1f/1zl9iYUoaYSQvuPBs5SV9eOvEzTXUf
 hZnDkuIWEJbYuD3OnsYA2na1XFGXs6kbsi6aANqaYNMUdn2cQUyXbNwhCAymbOaWTpbo
 r8pdwCrORo1S8L1VcEu8Lp9Rb8HKWvqANuQqf8TWNqEwgjM8wJ3A29+q+24rZCFc2ZgV
 dNizTFuA6s/HEHQP0GmzjNJzHvljHIXQJmSV3xCUXXmp3PRHam8+/pGdzsqgKixYxU4q
 uvJY4+7QIjPgmfspq9VHvQjd2/91Is0mp1M9XN4tM4kgjm9QtbRj7Tm7hpCyyu0oh9PF
 /p0Q==
X-Gm-Message-State: AOAM531XACZdYIO7KXWxhWJcd+VspP043U+lC0J1DIr4iWbRNNn/Cy4N
 Liv8ekYH/Or/U9EJoPWgC+lNGg==
X-Google-Smtp-Source: ABdhPJxFysJO1OlzsUFa00Xd4yfDON+clxay27FIj2XisfJJ1KkDzLudOVD9ezGRIN5AVwZgrtfm5g==
X-Received: by 2002:a17:90a:eac1:: with SMTP id
 ev1mr2330572pjb.16.1634675103558; 
 Tue, 19 Oct 2021 13:25:03 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id c13sm92326pfj.78.2021.10.19.13.25.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Oct 2021 13:25:03 -0700 (PDT)
Subject: Re: [PATCH 05/31] target/loongarch: Implement
 qmp_query_cpu_definitions()
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <1634628917-10031-1-git-send-email-yangxiaojuan@loongson.cn>
 <1634628917-10031-6-git-send-email-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <14e7ef01-28ab-917b-f8ff-8270c4d5bce9@linaro.org>
Date: Tue, 19 Oct 2021 13:25:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1634628917-10031-6-git-send-email-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.074,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@loongson.cn,
 mst@redhat.com, philmd@redhat.com, mark.cave-ayland@ilande.co.uk,
 laurent@vivier.eu, peterx@redhat.com, f4bug@amsat.org,
 alistair.francis@wdc.com, maobibo@loongson.cn, gaosong@loongson.cn,
 pbonzini@redhat.com, bmeng.cn@gmail.com, alex.bennee@linaro.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/19/21 12:34 AM, Xiaojuan Yang wrote:
> This patch introduce qmp_query_cpu_definitions interface.
> 
> Signed-off-by: Xiaojuan Yang<yangxiaojuan@loongson.cn>
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> ---
>   qapi/machine-target.json |  6 ++++--
>   target/loongarch/cpu.c   | 28 ++++++++++++++++++++++++++++
>   2 files changed, 32 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

