Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE6D3ECAF1
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Aug 2021 22:30:51 +0200 (CEST)
Received: from localhost ([::1]:34464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFMmQ-0005gD-QS
	for lists+qemu-devel@lfdr.de; Sun, 15 Aug 2021 16:30:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mFMkn-0004nV-Ch
 for qemu-devel@nongnu.org; Sun, 15 Aug 2021 16:29:09 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:38642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mFMkl-0004OF-Rx
 for qemu-devel@nongnu.org; Sun, 15 Aug 2021 16:29:09 -0400
Received: by mail-pl1-x62a.google.com with SMTP id a5so18534050plh.5
 for <qemu-devel@nongnu.org>; Sun, 15 Aug 2021 13:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yU7GsQRUpGYmyFZ0NPPZLysVec5A8+nuSMGoQP3df5Q=;
 b=F2Ozo/+H0K3i0hLBigwEWx5GDzm7K08qh60EI39L2EJdSM2lvI7QFM1wx7Putuvv37
 9ePfSSSBVWTFIyqLG+Uffmhq+hyRa/yvqD7Yl2wAV56zIpbOUiCDSWs7dNWOT7FV6UOQ
 3hQGAPL4aTwsYCRmsFeHMBVun5s3IMVAj1cFkxlFVYJrMGm1gakJKYK9rRnaZ7wLGVrr
 3TpFTydBULpKd1rr1WfU5PUStexwe+2Jy6L8aLxNXl12K8Ag6cwFInYPa758gqQlKds3
 hn8WXYKc9eTMhG8QEdI+Qh1LD1Vh4qpFnyaRUwS3nh2J/K7Z8Cx2Q/4mFc7d4hRysA3b
 1wvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yU7GsQRUpGYmyFZ0NPPZLysVec5A8+nuSMGoQP3df5Q=;
 b=R7vr3K1Q6EJDe/4BgzgudzlC1brchkbZ850hld8LQuAGjod7jg7MvQRC4s5MTrMc5W
 WFsMUyBFH4B9rlvSp51wMXD0/UCsXzVM+lkBBnOXRZcVBU3I5mKlTLUKfIz2NPqpNGcX
 2+LDGw0D1jNWXLgJOcHhnQ+Al7DS8oa+b4A/dzAOXfrmFUKfLALNT94/iNcikfqCMGEF
 3heAXKBGO3AfNdZWaR51a7fQlrclUgZrAJTvLtisOp4a5IblRsQrLIgKr3jH3yj0kwSn
 CqDf9weAhU1vOlGk8apkcDSOLTq6cQP0qAyj84KiqapxulZGwXU+eWXlCQM6dtG/7Sn/
 /2FQ==
X-Gm-Message-State: AOAM531ZbDsaVbhT8TgUbbBBN3f2nt0jKMAQHXK8w0+n99wdTqr9IMRm
 ZvOnRdG7h6tEMWhEc8yQz89lmG4G2zbjLA==
X-Google-Smtp-Source: ABdhPJwaBNQxUr/ia7w66Z6GeKuXnqzacSYs5GLn1eSBnqWrkkEASi+zZbzmPm+ldMj4tpM0D9xXtg==
X-Received: by 2002:a17:90a:7781:: with SMTP id
 v1mr7094196pjk.161.1629059346302; 
 Sun, 15 Aug 2021 13:29:06 -0700 (PDT)
Received: from [192.168.3.43] ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id w11sm10919287pgk.34.2021.08.15.13.29.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Aug 2021 13:29:06 -0700 (PDT)
Subject: Re: [PATCH for-6.2 7/7] linux-user/aarch64: Use force_sig_fault()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210813131809.28655-1-peter.maydell@linaro.org>
 <20210813131809.28655-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cd959c76-d0f0-5409-3ae4-9971d0d98a02@linaro.org>
Date: Sun, 15 Aug 2021 10:29:03 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210813131809.28655-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.147,
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/13/21 3:18 AM, Peter Maydell wrote:
> Use the new force_sig_fault() function instead of setting up
> a target_siginfo_t and calling queue_signal().
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   linux-user/aarch64/cpu_loop.c | 34 +++++++++-------------------------
>   1 file changed, 9 insertions(+), 25 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

