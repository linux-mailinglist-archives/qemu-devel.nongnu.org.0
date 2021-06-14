Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23FC63A6ED9
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 21:22:47 +0200 (CEST)
Received: from localhost ([::1]:55088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lssAY-00017R-5e
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 15:22:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lss8u-0007ll-If
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 15:21:04 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:45920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lss8s-00065f-R0
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 15:21:04 -0400
Received: by mail-pf1-x42f.google.com with SMTP id k6so29273pfk.12
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 12:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=SNdXnr1gFQuDYNXy35VNpIVS6LJ2vn/tLdKps1dm1Uw=;
 b=vzvFZBp1CErX+EcQOc5/Nuwm2a0+T0yp9j3OPw7zqN1ckl5jvkSspIkZqsEkQcBb9D
 fN20VU40ASPwk/mIvZ2GvzXcw5bmHXDIa1/Gbc4/99w5OrJdCe3NeQVkAfLoFWFzDcF7
 Q2moRPEs/1cLV18KfYWi3hBxMYOh7fwvMzGvTj2ExU1fNSiRopjCkg6uhizwR60p9+Y5
 LbcjJ+GOyrui5fDG6JL6w7+raTpyLpjKlpjWF1ybAmueebl1Tz6UO4At1QHjKwsJH/RE
 MAypM+FkkeRaJsbtTa8FmFVPRZp8hx8xcWbCd3sEHgk+moYVqXJQgVOBFFwJaBrASTcX
 OkNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SNdXnr1gFQuDYNXy35VNpIVS6LJ2vn/tLdKps1dm1Uw=;
 b=OcCW8pIe/7AExgxxCkxZn7ajim42+JJ4m1OLmH64GaRR7rda+dB3IwG1tlBW8bqyBH
 3ZjG5NI46fUMjHPAgit2tq+ZT72iLuQqxK4Dqfe78ep0HGZowRJ5ElK2cwmdpfzOEvn4
 VNefeaETItisAIaXZWevFugWVYQfZBuRwdX7cYybT45LwN2u08HHDNZnCD45ZYcdlWtX
 1kHtmQBOGcSF/Or/lT8735+qb1VHrvvHsAbrNxw3JJtXk2njq4zvgwmKgI5RFRTTi5xY
 3RO3PfpQiqhUu/etPwLJH88bfvUQIaOqvdZM3KLNwgCDfoH2s3jhGHwfyETfDdAJMQRZ
 EguA==
X-Gm-Message-State: AOAM531PiMlolJttd5n0tNWl9Mqb2WeK9omwYnNDC5FseD4Xgm8NpOO1
 E02otMn4UH17CSkvsD5Y/kU770hCidnOHA==
X-Google-Smtp-Source: ABdhPJybzqY2H+C53oTXASX6zeoGvMju8da32G3O1e2mWCP/+4lj0qF68Df7yaOW4dyU6E+OsGsOFg==
X-Received: by 2002:a65:47ca:: with SMTP id f10mr10749983pgs.94.1623698461213; 
 Mon, 14 Jun 2021 12:21:01 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 v8sm276103pff.34.2021.06.14.12.21.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 12:21:01 -0700 (PDT)
Subject: Re: [PATCH v2 07/57] target/arm: Implement MVE WLSTP insn
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210614151007.4545-1-peter.maydell@linaro.org>
 <20210614151007.4545-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1d66f483-cc5c-9e75-a469-d933a1e601c2@linaro.org>
Date: Mon, 14 Jun 2021 12:20:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210614151007.4545-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.489,
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

On 6/14/21 8:09 AM, Peter Maydell wrote:
> Implement the MVE WLSTP insn; this is like the existing WLS insn,
> except that it specifies a size value which is used to set
> FPSCR.LTPSIZE.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> v1->v2: swapped LE/WLS lines in t32.decode; added missing return
> ---
>   target/arm/t32.decode  |  8 ++++++--
>   target/arm/translate.c | 37 ++++++++++++++++++++++++++++++++++++-
>   2 files changed, 42 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

