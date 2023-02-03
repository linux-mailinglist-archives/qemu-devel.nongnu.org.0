Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CAF968A48F
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 22:19:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pO3SM-0004Wx-UG; Fri, 03 Feb 2023 16:18:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pO3SJ-0004WS-7A
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 16:18:47 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pO3SH-0006Pg-Bk
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 16:18:46 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 e10-20020a17090a630a00b0022bedd66e6dso10004054pjj.1
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 13:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fffsqXSjVmJrv0I8gqG/4/840WTpEaqWSekwn3GKlRA=;
 b=QKJFsi/fa9o+sSZiKvwnS5g8teZp7R5j6+5MwOuUzdCN3L5G499YOAWVX/A9fzJcBI
 2ZSGLj7xyB8P/P7W9nTn396BZv5017SPLyYQKDF6t0ahtibHaHmZ7ZubNMydrLyERskn
 8V2VtkhkVCycPGBh7EvROadyFF3AaMTmVv6KNQYNf2GWbxXl7C0AxscqlA7uU3Czl4D9
 a+5g8DcuTB7J/qIpODCCegRlQY53bc57dYfk+4uEtgYwpFIcv0J823e4p28h2EerrU8K
 5sjZ0L/XMjnMH3wXqu50nMRPRuB3177PGFBRGrlMWupN7uM1A1WZqtuxG4Kq5IWS4ZPe
 SKgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fffsqXSjVmJrv0I8gqG/4/840WTpEaqWSekwn3GKlRA=;
 b=OU42g6o+GNtRvWwRH4U29xmofYKixQwyk8tlCpFhpS4yAtv1QqEa9A6xhiD8Vm6OD7
 yjGl0yp0iFcQF8VmMU7vemyYKT0VyFNWHMAcc+lNVToXQQOXSa5FxHOh2Tv+kJaaknSX
 aVDzkgh2aTtNubjrQshiQhpIpxVh7015WYd/MKUlavmFCji3IHPnYM2dxGFK4TJwGfDO
 duEm7X7U6FI7MxtBMW3GigKXLSfjhqR6yopBBD18KJR2T3QEoopfTMgopWoYBvvnCB8T
 PSXtb7gavTkc60UFsBquLdd0/qLzK9SGaxHsoLyjW8S5/Yu8i15G7PgBXojfdAcZs8M7
 2kug==
X-Gm-Message-State: AO0yUKWnqGGk/A7zLEIb7IwkfU8BAqW0Yyly/2UJaoBy/fi54Vc7tpPy
 8qzxfXVd8dIWpoAxlQqukLekhg==
X-Google-Smtp-Source: AK7set/vBtS+9eTdExh1uFs/nx72unAxUx58wH+WDpJWHHmamLTqYNFe4lT63R0ewPUBsMCVuIGnmA==
X-Received: by 2002:a17:90b:350a:b0:22b:fb51:8c78 with SMTP id
 ls10-20020a17090b350a00b0022bfb518c78mr5959866pjb.5.1675459123871; 
 Fri, 03 Feb 2023 13:18:43 -0800 (PST)
Received: from [192.168.50.177] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 n5-20020a17090a2bc500b002263faf8431sm5385602pje.17.2023.02.03.13.18.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Feb 2023 13:18:43 -0800 (PST)
Message-ID: <18e96c58-b6e5-9837-9753-a263f3b15918@linaro.org>
Date: Fri, 3 Feb 2023 11:18:39 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: ASan reports use-after-free when running munmap-pthread
Content-Language: en-US
To: anjo@rev.ng, qemu-devel@nongnu.org
Cc: "ale@rev.ng" <ale@rev.ng>, iii@linux.ibm.com,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <b7de2f25-c6a4-d053-2e27-ed8f13996182@rev.ng>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <b7de2f25-c6a4-d053-2e27-ed8f13996182@rev.ng>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 2/2/23 09:06, Anton Johansson wrote:
> Hi,
> 
> I was running check-tcg with ASan enabled on master, and ran into
> the following use-after-free. There appears to be a race between
> jump cache invalidation and thread destruction (?)
> 
> I thought I'd post here since I noticed some previous discussion on the
> topic, and I'm not sure myself what a proper fix would look like.
> 
> Tested on arm/aarch64/x86_64-linux-user.
> 
> Here's a snippet of the ASan output:
> =================================================================
> ==187529==ERROR: AddressSanitizer: heap-use-after-free on address 0x62d000f433b0 at pc 
> 0x55cfefe00246 bp 0x7f4725f400b0 sp 0x7f4725f400a0

The fix for this was merged today:

4731f89b3b cpu: free cpu->tb_jmp_cache with RCU

I'd forgotten about this, since the pull request was pending for some time, while we 
waited for CI minutes to refresh.


r~

