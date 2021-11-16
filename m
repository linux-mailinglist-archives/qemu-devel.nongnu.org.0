Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F37DA4531CF
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 13:07:51 +0100 (CET)
Received: from localhost ([::1]:34504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmxFe-0005Bm-PV
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 07:07:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmxDf-0004GE-7a
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 07:05:48 -0500
Received: from [2a00:1450:4864:20::334] (port=53865
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmxDc-0005PB-0P
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 07:05:46 -0500
Received: by mail-wm1-x334.google.com with SMTP id y196so16672696wmc.3
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 04:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hfWeSX3OYdmcw3ifJOdIf2IEw4FcjkcH9kbDNkiyH7Y=;
 b=XJ0JdTOMs4qmN27XONJFFh6E7AQAx/vJyr35o2nFPBSeU1A1r+r2Zu4l24eUS1m4wj
 sIi6sqkVQd5aKlfaczXFmqCXNq2tL4QOnm1u9/ZAx6rs2jxlP8ijL1Ozt/21st+8o/AR
 yrXojqeHevu6wvJPAjViajddqltttMJNO2qI7jfPkyGMNKvnLd2kW5mSq1y+PRdbmlnE
 +KCcSJ+1CERk+5nfMInNtryc9eNkC0O+/EtLSKDeUSQbt+Ok68UuPNZHpg/BgwzxboGQ
 2fv5jUV6RzoxjkH0Z/3qefQnqP3rWv4Q0Xds0MYWUzqDPn+PKHANmS7fiSKZTfYKsZhf
 uSrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hfWeSX3OYdmcw3ifJOdIf2IEw4FcjkcH9kbDNkiyH7Y=;
 b=PgFcUEfrRJgprDFKRGRY/0C7o4vXfXbhBR2FbPakvaeJZ1J/b01jMA6pBZ7ezanmpS
 rVXGUdAQ+78byR6ecZXL6OD8IrDk4jglNUP+QJvdLtl1bPevS6b047yimcrhb2VMfs4l
 BjKWbRa30aE+QwAC0+gDVIG94+3P7W3xD+30F1JcnEEAIAM0OVsF8rjx+RsXK47j/09b
 Ql6/DfDbn2yyaS2bdssevyFv+nrltKAR2pDLgpPMkU9amAtxggZIt9K0hZpwRqF/PPk9
 6Rea2OefYF0RzXfNiB9VA26fmINUoaJNRdQncoElxFjxrA0yJB1DDwh5SsQKIASHNzQs
 2KbA==
X-Gm-Message-State: AOAM532OYyubdQpuVbydwuvcVTdMnXi3f4pd164zuJnAGh3xcugGstsI
 uK8gS9KMesl8Z40uCw/FvLrL5A==
X-Google-Smtp-Source: ABdhPJwv/kUezSLsFML4/4T/TmtPy74ThOTWmqYvGx6mhmxYLjJkBi5O7rUdcHKsqewPVjNEAbEtng==
X-Received: by 2002:a1c:1c8:: with SMTP id 191mr6992812wmb.90.1637064341353;
 Tue, 16 Nov 2021 04:05:41 -0800 (PST)
Received: from [192.168.8.105] (145.red-37-158-173.dynamicip.rima-tde.net.
 [37.158.173.145])
 by smtp.gmail.com with ESMTPSA id q8sm16990947wrx.71.2021.11.16.04.05.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Nov 2021 04:05:40 -0800 (PST)
Subject: Re: [PATCH-for-7.0 v4 04/11] tests/unit/test-smp-parse: Pass machine
 type as argument to tests
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211115145900.2531865-1-philmd@redhat.com>
 <20211115145900.2531865-5-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b325e891-24eb-1d9e-27de-d5b4baa645c1@linaro.org>
Date: Tue, 16 Nov 2021 13:05:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211115145900.2531865-5-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.446,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Yanan Wang <wangyanan55@huawei.com>, Andrew Jones <drjones@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/15/21 3:58 PM, Philippe Mathieu-Daudé wrote:
> Use g_test_add_data_func() instead of g_test_add_func() so we can
> pass the machine type to the tests (we will soon have different
> machine types).
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> ---
>   tests/unit/test-smp-parse.c | 18 ++++++++++++------
>   1 file changed, 12 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

