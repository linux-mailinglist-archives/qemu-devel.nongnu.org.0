Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B6A6C33E5
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 15:18:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pecnm-0006ur-G4; Tue, 21 Mar 2023 10:17:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pecnb-0006u0-Fd
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 10:17:20 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pecnZ-0002nK-3S
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 10:17:15 -0400
Received: by mail-ed1-x536.google.com with SMTP id h8so60272336ede.8
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 07:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679408231;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=84a9oQKO0yx+gjIQQA9e0gyHjUuc8edfOQkXg85dosk=;
 b=QwopQn3Dr6iV3Shm3JUrAUImK9clxINYNDBXdvsgkFp3N35fHED4oDUl776hmJ8BYV
 O2nygsxaB3lh1JNxJ466tG7zQxeu0DveCyTHycxi6S+pNs9JvoThaN6RsPkFUTBIsu1/
 QQE1aUiuiaGxC2rz6yJRkVMDqz/nBaB/u1BWdCGn1STWqNNHdWFPNnwd9CJj3zmTvO8q
 wQoQviKYGdpStVQp/43jFRIA7TMvoTEVqqz83qS7CnkTmgOqF7dCMzRbvFNSGz1VVhlA
 xkgYiK9H2h3t1ZNWQum43+pQ00m4TGkMIYxh0wepsRs0ZbxoDGyJA1/24LOp+Nvbw+vp
 q+qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679408231;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=84a9oQKO0yx+gjIQQA9e0gyHjUuc8edfOQkXg85dosk=;
 b=DryC8EReC694dHXc2cPe2IgK2VVNiDhLTVby4pNQdjZ+3qThz0y43s5Sd4T8I4elZg
 6xGRgDjnMiBZ4zwevmZboDpEU7zHt+pr/knrW/QHT+WL/uGJfFWwGpUiQEU86dVbnKRT
 hg37UH6OMFRzzlhKQk/mBuTEG1pp1RUB9fPTvQVca04MOrZk9e9uv2XS24DP7GPi33c1
 8CL8um8wC7TxLeDl4KsrCGnPJa6ebkHrHVAw09fYX2RpL03Ku3ywNbxq2qPViueCZa7W
 7Oei/DD7rym7lZwXOrbIHZx4a+QfsGWnkx/11YeNytpBpNpJ7jmG61dIfPDtiWwrlbF0
 AopQ==
X-Gm-Message-State: AO0yUKWP8Eix7qQEzohH1gAAV+kMdzhnV2wkq1MS7u4940MZc4CyzL8j
 48UnE8KSfOb+9aPVZaky+gcccA==
X-Google-Smtp-Source: AK7set9Uck/jpalaD5Bc5lnx1+uEm4brhKmR1o5EBzThr4PCaRi4Z8NqF4GcOPp0KsippU6uYBZJcg==
X-Received: by 2002:a17:906:2cd6:b0:8b1:3467:d71b with SMTP id
 r22-20020a1709062cd600b008b13467d71bmr3004875ejr.48.1679408231056; 
 Tue, 21 Mar 2023 07:17:11 -0700 (PDT)
Received: from [192.168.69.115] (did75-h03-176-184-22-219.dsl.sta.abo.bbox.fr.
 [176.184.22.219]) by smtp.gmail.com with ESMTPSA id
 ec21-20020a0564020d5500b004fc01b0aa55sm6309651edb.4.2023.03.21.07.17.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Mar 2023 07:17:10 -0700 (PDT)
Message-ID: <2578b414-65d4-af11-3ba2-543d3b330899@linaro.org>
Date: Tue, 21 Mar 2023 15:17:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH 01/10] metadata: add .git-blame-ignore-revs
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Alessandro Di Federico <ale@rev.ng>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>
References: <20230320101035.2214196-1-alex.bennee@linaro.org>
 <20230320101035.2214196-2-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230320101035.2214196-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 20/3/23 11:10, Alex Bennée wrote:
> Someone mentioned this on IRC so I thought I would try it out with a
> few commits that are pure code style fixes.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   .git-blame-ignore-revs | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
>   create mode 100644 .git-blame-ignore-revs
> 
> diff --git a/.git-blame-ignore-revs b/.git-blame-ignore-revs
> new file mode 100644
> index 0000000000..24208ece8c
> --- /dev/null
> +++ b/.git-blame-ignore-revs
> @@ -0,0 +1,18 @@
> +#
> +# List of code-formatting clean ups the git blame can ignore
> +#
> +#   git blame --ignore-revs-file .git-blame-ignore-revs
> +#
> +# or
> +#
> +#   git config blame.ignoreRevsFile .git-blame-ignore-revs
> +#
> +
> +# gdbstub: clean-up indents
> +ad9e4585b3c7425759d3eea697afbca71d2c2082
> +
> +# e1000e: fix code style
> +0eadd56bf53ab196a16d492d7dd31c62e1c24c32
> +
> +# target/riscv: coding style fixes
> +8c7feddddd9218b407792120bcfda0347ed16205

Please amend:

+# replace TABs with spaces
+48805df9c22a0700fba4b3b548fafaa21726ca68

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>

