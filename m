Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 146523D64E8
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 18:58:42 +0200 (CEST)
Received: from localhost ([::1]:40828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m83w9-0007Oe-42
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 12:58:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m83uq-0006NT-5R
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 12:57:20 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:46859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m83uo-0004Ev-Kv
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 12:57:19 -0400
Received: by mail-pl1-x631.google.com with SMTP id t21so12235375plr.13
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 09:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=yX5WE8bIGK52Ocfe9CK6RougKV7AdE/rQmAUiYgnU9w=;
 b=ii72v+cFFCvJf7naj8lKCHF5pJQXEPgkvZk+qbGEon10fLo0Gy6W3oGCytQYDAqAxg
 iCInYmfXJLQ3Y5TnrVzHk9z4YQTuJyEwPiy+fu5ihMxIBX4INtX8zwMU1J5IVjHev96j
 2rGy4EvL7HegTOHzQ+uajthrQTDj2kOjPdhbmNXqakolvMG3640BwFK1+soSzhwwVfdH
 fRSBkGP65y2XiRxCbDetZlMOFAfY+0O8DatkEAm1MBsCXOOn1exio4nsPccaQvaj6IKv
 L74ehBSQFh1uaR/rxtfcXiMxOydet0X5+e5NV+1znlSHbgM37ONiCGol34jORcMvbaAt
 1qGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yX5WE8bIGK52Ocfe9CK6RougKV7AdE/rQmAUiYgnU9w=;
 b=ZRa0HRf4Y8NG9E1Bt/C0fbuMe5HA9BzTu9NKJC6N7mct6goyATdom162LOnqeKUSz6
 VmVqtdXh6yL5g+Eao7XnR5bcay3QAAVBvDZgCsSl3UJ5nOTxa4ZUukJrvSl4O1mpd/iD
 VB9bkl+hDHTLIdvURatlDE+XoNa7LlBPRf8BqN0Y8MR38BDFqRuDMoIWKmkJiuCLmtOQ
 VuNwyqalq9Qc765sP4NjWUDJ2aaktmMDUVZ2hHWuGOXgg2lqP7Ec2yQT2qU1UEeLLn5t
 Sx7O5PJh4n46+mUrrAGZvAbt9nxYYEH+LCRnTuhK2IsPbudSZo+g7UgdobQu1TFQgP63
 9+hA==
X-Gm-Message-State: AOAM530AxV6oskUtohdRbBapwSPC1AvkJaSX3HhR8l7b5sMoste0Yks2
 Qi3pZNhDdOqb5kDVUaA8tG++jQ==
X-Google-Smtp-Source: ABdhPJxU1lVbKBp8WnP6wIBhh6VQDhutg4dZGWazYt+o18oWIZfqQm0+DgvpckQJOvqjuL8uE4BVYw==
X-Received: by 2002:a17:90b:1947:: with SMTP id
 nk7mr27253482pjb.67.1627318636970; 
 Mon, 26 Jul 2021 09:57:16 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:497b:6ae4:953c:7ad1?
 (2603-800c-3202-ffa7-497b-6ae4-953c-7ad1.res6.spectrum.com.
 [2603:800c:3202:ffa7:497b:6ae4:953c:7ad1])
 by smtp.gmail.com with ESMTPSA id g12sm533324pfv.167.2021.07.26.09.57.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jul 2021 09:57:16 -0700 (PDT)
Subject: Re: [PATCH for-6.1?] bitops.h: revert db1ffc32dd ("qemu/bitops.h: add
 bitrev8 implementation")
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 peter.maydell@linaro.org, f4bug@amsat.org, laurent@vivier.eu
References: <20210725110557.3007-1-mark.cave-ayland@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5a04dc6f-ddb9-f8fd-b514-fc143406bb29@linaro.org>
Date: Mon, 26 Jul 2021 06:57:13 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210725110557.3007-1-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.438,
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

On 7/25/21 1:05 AM, Mark Cave-Ayland wrote:
> Commit db1ffc32dd ("qemu/bitops.h: add bitrev8 implementation") introduced a
> bitrev8() function to reverse the bit ordering required for storing the MAC
> address in the q800 PROM.
> 
> This function is not required since QEMU implements its own revbit8() function
> which does exactly the same thing. Remove the extraneous bitrev8() function and
> switch its only caller in hw/m68k/q800.c to use revbit8() instead.
> 
> Signed-off-by: Mark Cave-Ayland<mark.cave-ayland@ilande.co.uk>
> ---
>   hw/m68k/q800.c        |  2 +-
>   include/qemu/bitops.h | 22 ----------------------
>   2 files changed, 1 insertion(+), 23 deletions(-)
> 
> ---
> I picked this up reading the loongarch thread where I realised that QEMU
> already has a revbit8() function - I was searching for bitrev8() before
> deciding that this needed to be added since this was the name of the equivalent
> function in Linux.
> 
> I think this is a good candidate for 6.1 still because a) it only has 1 caller
> which is easy for me to test and b) it prevents anyone else coming along and
> accidentally using it later.
> 
> MCA.

Queued for 6.1.


r~

