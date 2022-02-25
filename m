Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FCA4C4FAE
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 21:30:56 +0100 (CET)
Received: from localhost ([::1]:40652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNhEt-0001rh-H4
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 15:30:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNhCq-0000Bo-Bo
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 15:28:48 -0500
Received: from [2607:f8b0:4864:20::431] (port=33662
 helo=mail-pf1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNhCo-00034D-7w
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 15:28:47 -0500
Received: by mail-pf1-x431.google.com with SMTP id d17so5695532pfl.0
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 12:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=NChnn+4Amo1qgFZ+aQxhrrmRPNlhrd57+HF0SmLbSRw=;
 b=ws7VnXjEaXv9dNjls9OOfC4XV890D7Z1Wh9AhccRY9Z1fqMKD5HtQ2efpgsR6rP2KP
 eYD1XuaeaEa8upy4f7G8zB29z3wEqsGhijnK8ZwfaPIkXBimN481EobGl7xTHW6jFmZY
 fHiMALlxGPxNZFZiTRdbVAOsHmGNjd4y8ZRES/mtjuIMlf4Z57bwiDYU71SsVG7dBVU5
 NRQ8xOW+Elmmkv45b5kGpMDBbXxPvdd/wGsyg9gGynK29IfeAanGjxNYM3U+HooSmhRw
 vN4He5mBGb71aJuzyTD1zMTXo2BRlCCYZ5ylVhVmyRZlkNIX5ol6WS9jnAwbvSMZ+DGn
 jBPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NChnn+4Amo1qgFZ+aQxhrrmRPNlhrd57+HF0SmLbSRw=;
 b=QZBcH1NoN3qF0Al9Vsm6a+nMF512Jr1JX/BQACdoxVQLes9sGmjknpqxWVIyf8JQ5V
 Eu/ofUiyuD98TdeaGhCLg1Z6JE8TrGa0RV+HtjfM49yvezkf/X+Lps5ken757q1VqAk/
 7P0UiqOHofWqb2OKMrq9ohU4f6uxkOewbz9iUGUTsNnKrRHL+IIpSWD+abFWy3xNh4mV
 E5uA+qcV11niiYp8zYOWEqrj2oPaWHpISUf+jkNsK4OE8Q18GNCOfPUgPd50cUwQU4I8
 zcs0Y5VVMHlXa7o1c5ayNBFwkdIJjo8B7Cr2b9SpvqWiwA8EOjr90DJMp4VWfNxNeovU
 ukbQ==
X-Gm-Message-State: AOAM531LijY89Fb6nP83JIp+U77XuY82ZBUNRoI4scLwlVlmp87HiA/c
 i5B63hGnvfnywAvr1+8nCCthJrHLOr2D+w==
X-Google-Smtp-Source: ABdhPJwEb3gsrCH2SM/ER+hmp4evpR/NUDAr7Y/S0oV8iltuV21A+IScGFG5eEaRtplS+VAzY8MMYA==
X-Received: by 2002:a05:6a00:2348:b0:4f3:bfcd:8365 with SMTP id
 j8-20020a056a00234800b004f3bfcd8365mr8743452pfj.38.1645820924674; 
 Fri, 25 Feb 2022 12:28:44 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 c18-20020a056a000ad200b004cdccd3da08sm4123676pfl.44.2022.02.25.12.28.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Feb 2022 12:28:44 -0800 (PST)
Message-ID: <5254e7a4-c95b-86eb-103d-3c46f5364185@linaro.org>
Date: Fri, 25 Feb 2022 10:28:41 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 15/18] gitlab: upgrade the job definition for s390x to
 20.04
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220225172021.3493923-1-alex.bennee@linaro.org>
 <20220225172021.3493923-16-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220225172021.3493923-16-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::431
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/25/22 07:20, Alex Bennée wrote:
> The new s390x machine has more of everything including the OS. As
> 18.04 will soon be going we might as well get onto something moderately
> modern.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Acked-by: Christian Borntraeger<borntraeger@de.ibm.com>
> Reviewed-by: Thomas Huth<thuth@redhat.com>
> Acked-by: Cornelia Huck<cohuck@redhat.com>
> Reviewed-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> Cc: Peter Maydell<peter.maydell@linaro.org>
> ---
>   .gitlab-ci.d/custom-runners.yml               |  2 +-
>   ...18.04-s390x.yml => ubuntu-20.04-s390x.yml} | 28 +++++++++----------
>   2 files changed, 15 insertions(+), 15 deletions(-)
>   rename .gitlab-ci.d/custom-runners/{ubuntu-18.04-s390x.yml => ubuntu-20.04-s390x.yml} (87%)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

