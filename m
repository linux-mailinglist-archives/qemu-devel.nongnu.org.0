Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FFB3ECAC0
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Aug 2021 21:53:06 +0200 (CEST)
Received: from localhost ([::1]:40276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFMBs-0005HI-Lp
	for lists+qemu-devel@lfdr.de; Sun, 15 Aug 2021 15:53:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mFMAe-0004bO-G4
 for qemu-devel@nongnu.org; Sun, 15 Aug 2021 15:51:48 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:43766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mFMAd-00051e-0t
 for qemu-devel@nongnu.org; Sun, 15 Aug 2021 15:51:48 -0400
Received: by mail-pl1-x634.google.com with SMTP id e19so18466607pla.10
 for <qemu-devel@nongnu.org>; Sun, 15 Aug 2021 12:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IYiYFpq3TUz5DcxU0nAqhnfsW/GVAmXTFOBJZPxryio=;
 b=LIfJ4BgMErDwCQMIbX/oFz9BNbNnHY8YdqpWgyxoUhMvmOXUzWCRAa2iD8X4BvRebc
 LGBuccIrbdFGt6Aarr+wb7p7TD+SCAIvkyxyFdRNX7mjbM2wy3H1ZltFn6xwWrdAY9V8
 e8eZlxVf+s4PEn8GCkEaVGbzioV87FaZzCVyyj8rqWzKJj4Hqi6irP2FlUlajdZXoni8
 lPNeBsNhUJDRKnSrdQl0l98dZsBsnKZPAv4K1QfhXpe6iSVqVCri3kwGm+MNRkD6D7uB
 y3NB827mDZ+/W2Bv2GRm/ad3Z/fpAS1i4z01/66fvAGRqqXe6IbjlITtnJGA6x/9LUis
 Ri+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IYiYFpq3TUz5DcxU0nAqhnfsW/GVAmXTFOBJZPxryio=;
 b=AJp6uk7Pjh4IsTu4ko4nCp78RC6yQq8LfzIq3O8y7wSL9x3aInAePn+X1Ly1Ip6kyv
 nKydc13NGLC+ZFHewUHbp2Omcx23r8iQaO676c+kJvP39tkjq0UTHfbgVFMR6My7s/4Q
 o4uVrVBhlfNUlBEghyOX+c7S08+IP7YdebFVj3ahKqfpqOS/mePhWLFjOqTh3eoDLzNJ
 5VH8xEc3/HunB7LhORndoUEZf4+DDEBbybhnSCmYEo6WhHbpxhF89rc7iblirntUtLaG
 qsqYfrSG2t0uJCKagtt2d3rgX1dla4qOC1xmqqf+KYsffoveXQiy2DrF80ezUfdJTPDA
 vNdw==
X-Gm-Message-State: AOAM531Eu7NhwyL6+YFq4jbttDLkevfBYM082mdj0S/s1hD0JLALxl3R
 f+dGQ2hC6gzcgp4ihIhY9TX3iw==
X-Google-Smtp-Source: ABdhPJzlmNYB2nuRrCegDg0eKPhcKfb0TS8wveHTMjpkTqMFGxa42mSFmcahhFnS1D7yL1wKTqi0ZA==
X-Received: by 2002:a17:90a:1148:: with SMTP id
 d8mr13552157pje.106.1629057105029; 
 Sun, 15 Aug 2021 12:51:45 -0700 (PDT)
Received: from [192.168.3.43] ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id q4sm2053283pjd.52.2021.08.15.12.51.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Aug 2021 12:51:44 -0700 (PDT)
Subject: Re: [PATCH for-6.2 1/7] linux-user/aarch64: Set siginfo_t addr field
 for SIGTRAP signals
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210813131809.28655-1-peter.maydell@linaro.org>
 <20210813131809.28655-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2c6e41f4-07ec-5a62-9659-d5dc51a40c52@linaro.org>
Date: Sun, 15 Aug 2021 09:51:41 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210813131809.28655-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.147,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/13/21 3:18 AM, Peter Maydell wrote:
> When generating a TRAP_BRKPT SIGTRAP, set the siginfo_t addr field
> to the PC where the breakpoint/singlestep trap occurred; this is
> what the kernel does for this signal for this architecture.
> 
> Fixes: Coverity 1459154
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   linux-user/aarch64/cpu_loop.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

