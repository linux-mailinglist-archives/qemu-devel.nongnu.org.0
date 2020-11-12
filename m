Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B182B0FC8
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 22:08:21 +0100 (CET)
Received: from localhost ([::1]:41678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdJpM-0003aU-Aa
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 16:08:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kdJnp-0002Z4-6g
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 16:06:45 -0500
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:33333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kdJnn-0006xw-M4
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 16:06:44 -0500
Received: by mail-pf1-x443.google.com with SMTP id q10so5720321pfn.0
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 13:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=WBu5ezajdLHCcxAsl3xvHR3TXtpQKXadyctzV+y1MH0=;
 b=sn9RAIISmnYWK5VALJRrYS2wP6kW0188hBhQbzfTV83BqEYq5T9C9oTa6zlg13WH60
 ASe+lpFFhdXWSlXhZhflKxKt/OjAe4mXxwx2mdIO0jrJUVhfIYHLELYks9mCVHSCtFm+
 1jIXXC+8EckCFGv0x2ZqaSK3PRaoBe4fIDJry2yFohVqpZAUYn5oJY4j3cTySLtbQ3D6
 IQT9xhtu5R9PZA96CKmzrrR37JY3LpH3oHY9nwQPQleb/1vhGncMPkw0Agmwlpy7zKtB
 NFB5W0VkQe3LLvbHA3LocDniAm35WfMoSd7cFaRFGnt1pfIqd6MveWeTtLGdfMvfNvpd
 jT9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WBu5ezajdLHCcxAsl3xvHR3TXtpQKXadyctzV+y1MH0=;
 b=BYXIAo8VJ5WjTmQKA6ulrdPrGZWmAV/fMWsGtcM4B3+iIixJ6WIFxj7UYAiU37UagD
 wkO/vFyQ1ejvgVNSQinQkysn4430ENOiuwg33syt4M1kogKApHXG35+FZ4/dAqbx0g7K
 so41zx7dO++usq/Eqvg0CMSAvGZJK4slNM5i/ZzJE55oBPmCMdjHGKvLgWuyIL06R+0g
 kzV5mdsMm+0EhrCD5EISxoIdGQxZcqzp2RnBwHdbuJGQYDfHG2bW5aTchgkc/f5ZxVhC
 0dI7qM7tk9fM1g+G3RrJBeInO5G/Y/h7TEGGgkSPwuzLRQA0xHvoObo3RTBwPwuYEeua
 +9HQ==
X-Gm-Message-State: AOAM530SNbg0iud1/rbvoAIjS9xJdsv2DFmuaDWogkFIAEeIHwrcCc2Y
 6EJC/HkA1K6zBNa2Bx7KIIgyg2r8rLWNhQ==
X-Google-Smtp-Source: ABdhPJxrnsNOVlREbcGPRIy9oGGmSW7bMGR59+h97QxpljSBwe4vtYyVghE2nX0QXnG4UedvId/pAA==
X-Received: by 2002:a17:90a:609:: with SMTP id
 j9mr1086461pjj.121.1605215198708; 
 Thu, 12 Nov 2020 13:06:38 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id b17sm6763350pgb.94.2020.11.12.13.06.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Nov 2020 13:06:37 -0800 (PST)
Subject: Re: [PATCH v3 00/81] target/arm: Implement SVE2
To: Stephen Long <steplong@quicinc.com>, qemu-devel@nongnu.org
References: <20200918183751.2787647-1-richard.henderson@linaro.org>
 <20201110195513.340-1-steplong@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fa160fc0-c146-f673-eda5-a6cb41f53bd1@linaro.org>
Date: Thu, 12 Nov 2020 13:06:35 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201110195513.340-1-steplong@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/10/20 11:55 AM, Stephen Long wrote:
> Hi Richard, what's the plan to get this patch series into master?

It still needs to be reviewed.  In the end there wasn't time to get this into 5.2.


r~

