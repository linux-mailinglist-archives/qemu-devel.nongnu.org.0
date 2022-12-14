Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4362364CB5A
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 14:32:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5Rqg-0005uz-PB; Wed, 14 Dec 2022 08:31:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p5Rqe-0005sh-Ed
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 08:31:00 -0500
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p5Rqc-0001ww-OV
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 08:31:00 -0500
Received: by mail-oi1-x22f.google.com with SMTP id r11so2544944oie.13
 for <qemu-devel@nongnu.org>; Wed, 14 Dec 2022 05:30:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=I5hCx5YqyROgzUFMuWghH1iYlafefklbfG0RHpfL5lQ=;
 b=AI6bHWn66bo5wI0LqX5ip005svohbt6DEMKVoYZpsuivsVVY725QSuLSqy+rGqgiEu
 45tCnqSkAMZWbtAgrk2N+q9s4jDPIywIk6iutvYRlaq65b3C56F+GXnuWbnV0jtiY5QQ
 Xj/6rMHhq6SWVeSwPWkhMAx3cgISVUqOKUAaUU1h3k9xNfESHbXExy9UjXSjEQpASkFL
 p05BQfYgUxXiYl3foTJxfCz6wb8+MRsb4DtLJZ5J8teidbpBnTToNJmr/3hoGm1YCiIG
 h78QGK+aiihOUaQ8gdeXkwolUisq9IseJswYU8j1Xd6zzyE2U2aDDOrZV/hCp7OpsDbw
 /R/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I5hCx5YqyROgzUFMuWghH1iYlafefklbfG0RHpfL5lQ=;
 b=RHrYG5BydlNZfuFoyvhbfT3ew4WP/NwGvg1ZwiIH3ElBwy4rrRxGV8+Nec6FV3gfd8
 gtdPf9LqxEW4mVzejQeh0J6og6YDMJJkSBnu/C92+l1xVmA31Xqq7gkcsUthkrpAx2zG
 WmV6xnJ1We8W00DhLI7nM48KtZRfFs123vVamktU3MaBMUSOawwq/fcjzrO39SIWvbTL
 F8/Ke77LO0KDCCE/9wK5lWs5ZatS6xWjDsLoOxHMjmOPTDKfsKtC04izFETkG2ZLYAsY
 6mv9dW51xZkQn1vZHXZ75cJJkLWLTD/RproVq5K6dOZU6Cgkv5mslXlZqmCp1lDBTDvV
 RP5A==
X-Gm-Message-State: ANoB5pnRO3yB96laCDaPwqZWE0rPjN5XkDesDSOjszxrUtMPFguOiY+w
 9detq7Bf5cOOJBIg7s/VTt75gA==
X-Google-Smtp-Source: AA0mqf7CCEwZYZR8uPbkJh7irOXeC/stiQApxTQ2nkV8/0NAiKedcBRCXEdY8DQmAYzMYiCxoD0OOw==
X-Received: by 2002:a54:4818:0:b0:35c:eae3:8c40 with SMTP id
 j24-20020a544818000000b0035ceae38c40mr10005877oij.21.1671024657208; 
 Wed, 14 Dec 2022 05:30:57 -0800 (PST)
Received: from ?IPV6:2806:102e:18:2efc:2f7e:778a:5d07:f03c?
 ([2806:102e:18:2efc:2f7e:778a:5d07:f03c])
 by smtp.gmail.com with ESMTPSA id
 b25-20020aca1b19000000b00342eade43d4sm5609324oib.13.2022.12.14.05.30.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Dec 2022 05:30:56 -0800 (PST)
Message-ID: <e0eb93dc-f805-5500-3732-7d4930bb42da@linaro.org>
Date: Wed, 14 Dec 2022 07:30:52 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] configure: Fix check-tcg not executing any tests
Content-Language: en-US
To: Mukilan Thiyagarajan <quic_mthiyaga@quicinc.com>, qemu-devel@nongnu.org,
 bcain@quicinc.com, quic_mathbern@quicinc.com,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20221207082309.9966-1-quic_mthiyaga@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221207082309.9966-1-quic_mthiyaga@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22f.google.com
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

On 12/7/22 02:23, Mukilan Thiyagarajan wrote:
> After configuring with --target-list=hexagon-linux-user
> running `make check-tcg` just prints the following:
> 
> ```
> make: Nothing to be done for 'check-tcg'
> ```
> 
> In the probe_target_compiler function, the 'break'
> command is used incorrectly. There are no lexically
> enclosing loops associated with that break command which
> is an unspecfied behaviour in the POSIX standard.
> 
> The dash shell implementation aborts the currently executing
> loop, in this case, causing the rest of the logic for the loop
> in line 2490 to be skipped, which means no Makefiles are
> generated for the tcg target tests.
> 
> Fixes: c3b570b5a9a24d25 (configure: don't enable
> cross compilers unless in target_list)
> 
> Signed-off-by: Mukilan Thiyagarajan <quic_mthiyaga@quicinc.com>
> ---
>   configure | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


> 
> diff --git a/configure b/configure
> index 26c7bc5154..7a804fb657 100755
> --- a/configure
> +++ b/configure
> @@ -1881,9 +1881,7 @@ probe_target_compiler() {
>     # We shall skip configuring the target compiler if the user didn't
>     # bother enabling an appropriate guest. This avoids building
>     # extraneous firmware images and tests.
> -  if test "${target_list#*$1}" != "$1"; then
> -      break;
> -  else
> +  if test "${target_list#*$1}" = "$1"; then
>         return 1
>     fi
>   


