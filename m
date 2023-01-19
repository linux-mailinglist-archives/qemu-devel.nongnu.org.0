Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 272016741E1
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 20:00:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIa8x-00056u-I1; Thu, 19 Jan 2023 14:00:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIa8v-000558-Cv
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 14:00:09 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIa8t-00088v-6N
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 14:00:09 -0500
Received: by mail-pf1-x42b.google.com with SMTP id 200so2232349pfx.7
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 11:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=p5zUFaH7Aq2zvSi5Nmn4CWYsKtJskudIcvLHlbSeWok=;
 b=wslYWQK1ByyRHOqBXHnUEN+6/nbXdv8DSEHSWYvkjIjaQ1D++O++wzSaZnNePEGqHQ
 LM2/ayDRmTN4hN7D+F06mW6VXLEQuWYdhFCpQlbkG/n7T0+I/yAm8CN70Cm4zgFp0gnD
 ZYzK4DWxac9nJymCKpNsOvciOIA2p6uBC1O1qro0XkadIo/6AAgGJD6mJaidmS3tS9L/
 Zd6dLg9ZF6poKY8hju85tddkxt2fUdkfXyBnaAKQnDslq/d+62T+yVQJnf5QffIMmL+l
 wY12Ep/T8qLIFn+z1cjNUB0Dj5jEuEOaPpkFU10oHl4ghaVmCKkNFGKhd4zJ56vHEttM
 Ux9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=p5zUFaH7Aq2zvSi5Nmn4CWYsKtJskudIcvLHlbSeWok=;
 b=sU4oW9d4UbcwA3bQ28SV+wtl8WocXPNiMXfiIGbLdfKjbYYlbhd4TyGin/gQOKR8Kv
 ju9zUPBK4DbP1CyPr6m+r/sKYZumkGthXrOyeJ+A39BNu9AaCN02C/ZoEXkkAgAS9vFo
 DlDSU9uI73DryWNC9367xnbwE1FFkSKpTfXE2RIwndwVue0Ujmj1nQn3z3z1Q4d8y9Ki
 7de6sefJ25zrw71s9xW8w1REE839oRiuns9yMt3ED5C3ZHC+gdm4uwyFm4nJcE5v3Zo1
 C58mw7FnfsBPbEv7WoKpXQLSiSl/qkJ4UG+akC8RA6GP6mPqVISpKc4nOM5Equ69mtA/
 QQ2A==
X-Gm-Message-State: AFqh2koClvwMmuj4B0cbNICT2caORCOQPvMqsvSmT6K6nM/sDUoCAzEN
 LQFts573FZHFS6eWNmuvLxOviw==
X-Google-Smtp-Source: AMrXdXsgc1TVK7WR0cVMIdH5ODqOPT7oBe473BY6TcMAcfvO+dzI3QaRTCF7QDIAO/L0+cVwf7AjhQ==
X-Received: by 2002:a05:6a00:124d:b0:58d:ee7c:6cca with SMTP id
 u13-20020a056a00124d00b0058dee7c6ccamr7499682pfi.1.1674154805667; 
 Thu, 19 Jan 2023 11:00:05 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 i70-20020a628749000000b005815837164fsm8944331pfe.59.2023.01.19.11.00.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 11:00:05 -0800 (PST)
Message-ID: <f014a262-1bb3-c08d-c0f0-ed3be8167789@linaro.org>
Date: Thu, 19 Jan 2023 09:00:00 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH v4 07/15] tests/qtest: Adjust qom-test to always set a
 -cpu option
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
References: <20230119135424.5417-1-farosas@suse.de>
 <20230119135424.5417-8-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230119135424.5417-8-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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

On 1/19/23 03:54, Fabiano Rosas wrote:
> Start using the qtest_get_machine_args function, which explicitly
> sets the -cpu option according to the machine default.
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   tests/qtest/qom-test.c | 19 +++++++++++++++++--
>   1 file changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/qtest/qom-test.c b/tests/qtest/qom-test.c
> index d380261f8f..462e3c4281 100644
> --- a/tests/qtest/qom-test.c
> +++ b/tests/qtest/qom-test.c
> @@ -78,14 +78,28 @@ static void test_properties(QTestState *qts, const char *path, bool recurse)
>       qobject_unref(response);
>   }
>   
> +static const char *arch_get_cpu(const char *machine)
> +{
> +    const char *arch = qtest_get_arch();
> +
> +    if (g_str_equal(arch, "aarch64")) {
> +        if (!strncmp(machine, "virt", 4)) {
> +            return "cortex-a57";

I'm not keen on hard-coding cortex-a57 instead of max, even if they happen to evaluate to 
mostly the same thing currently for -accel qtest.

Nor am I keen on replicating this N times across N qtest files.
Better perhaps in libqtest.c, or something?
Or even directly in qtest_get_machine_args()?


r~

