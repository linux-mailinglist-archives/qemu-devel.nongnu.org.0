Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D4A6AD323
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 01:07:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZKqg-0007aQ-L4; Mon, 06 Mar 2023 19:06:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZKqe-0007ZV-JO
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 19:06:32 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZKqa-0002zE-7w
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 19:06:32 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 j19-20020a05600c1c1300b003e9b564fae9so9402151wms.2
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 16:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678147586;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Nb+nAnUz9lZ2/jjFMrEMj1uRP0x7SOJzhWUVneScKi4=;
 b=gi7S3jebaW3SVJ+4+JHxclH+diKQeSeLqk+01zywQzXBWuVGR6sJjNmNUf1Ze1xfUC
 Bkqm4iRW6yB8iekGxB9dPh9rS9fuXczBuQZ/Ajl4JkIAP4iW/f2YkNwzvdHJH3Xqv8sP
 FKQwgGsbXPtSpoCNzH1xjxOfsKQTgSgjam+D5+C5C5mR2b0BINUA4u+ovfkjoIlj8PzZ
 FdYe8n+pym09QuXCCYC1hk0GZP0lnKjYKDmLp80JrOXDUvzNEUy3ZdReNZfYVg4V/iVs
 QPyEmy6OB9/nfUH7wk8HOdb1G3Ywhtbz3vGQo03arl1ioGdMOd0gSmHqeRmHFDXnRmcB
 JSYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678147586;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Nb+nAnUz9lZ2/jjFMrEMj1uRP0x7SOJzhWUVneScKi4=;
 b=7jB0xPlgwWTm3SQAcZKnhR7c6tTql5yt/Z4FHTFkopLXgxgFDfxBrm36Ropt9N9iqi
 s1RSh9r9dXZIT+bUoblZFzwT6JoEUSWdZDqKYzQa/dGgcNzMzEqlLoCnk4GUMkRPjXWS
 jPSwflZos9BnTZ3Da33Ortnq4+lB423/pZO3wNwCWXEnG1UlJGJ1EhlBckzL8wzCpWv5
 kvvcLnfN0SAWBxCScziiwfkHtA0tWeBoMt/Y6JQ7oKbVlapwk6FnoapQGkq3z84yloyF
 AyHhGRdmvkysHJH6zDeAvKDBrZPPZCUXYTPYoBgepkx8+ii7i8o1MeP46EKHxpqUifFQ
 MPqQ==
X-Gm-Message-State: AO0yUKUG5Zkd9BvCfg3w+a4+3YX8lf0X7/D1AublVcSzlj1fWSMRnNhd
 3eMkUyOtY/KjUxUCTlofn47MUw==
X-Google-Smtp-Source: AK7set+V5gjZxfAdnbiwdnl8xJrCMDr57588cYy9jbIQ4Px6vddqKSSljQR49oH43AaQIdJ8jd4KpQ==
X-Received: by 2002:a05:600c:1c85:b0:3ea:fc95:7bf with SMTP id
 k5-20020a05600c1c8500b003eafc9507bfmr11072206wms.30.1678147586105; 
 Mon, 06 Mar 2023 16:06:26 -0800 (PST)
Received: from [192.168.1.115] (138.red-88-29-178.dynamicip.rima-tde.net.
 [88.29.178.138]) by smtp.gmail.com with ESMTPSA id
 l36-20020a05600c08a400b003eb39e60ec9sm11040556wmp.36.2023.03.06.16.06.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 16:06:25 -0800 (PST)
Message-ID: <16684583-a3d9-1d73-cfd6-deff44379e62@linaro.org>
Date: Tue, 7 Mar 2023 01:06:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 67/70] target/xtensa: Avoid tcg_const_i32
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-68-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-68-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 27/2/23 06:42, Richard Henderson wrote:
> All remaining uses are strictly read-only.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/xtensa/translate.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


