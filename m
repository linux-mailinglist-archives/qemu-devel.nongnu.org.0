Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF573A7153
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 23:28:50 +0200 (CEST)
Received: from localhost ([::1]:35276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsu8X-0002GD-7B
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 17:28:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsu7h-0001OK-Qc
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 17:27:57 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:39488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsu7f-0002R7-7m
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 17:27:57 -0400
Received: by mail-pl1-x630.google.com with SMTP id v11so7324894ply.6
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 14:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=ItioTNZWw4TuKZ+hUu8tcKTes/xkFWKgxxVBN7Wn868=;
 b=iUbmkBvyN985s6dPb4NyeZKJMZKo8VZB6J5b31+IR8UvTND9X2Necy17TeUZZjq7jE
 MpfgUxwTUGbjDeku97osxlKtWc/qvrSRUEc3U/97quJT+49GBN9qS5QFjvFYN9CQ4wqv
 kQuqyg5vD0+BXKy9ARScN+KBLx/XTfChHcUAQY9ypU1kcCHwt8Q7L54/Rcy6kj6RvI0O
 oIFsunXEsMNfOBm30hq6n74kNLj7yHO4V0mkMN2feR4kkse1EwVePfVcGpCHgVl2zZpL
 Y4w5t0QIpVr+MA+J1MyMCFNlw1YKrH2Putglk2V7vm7TA/xF3gOwMqHLV0OomhGzD7Ht
 qnWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ItioTNZWw4TuKZ+hUu8tcKTes/xkFWKgxxVBN7Wn868=;
 b=ANo/5UFMUSv7v30af3E1aLKhFmlNTLim/ApJ93ZfI4/t2g6KJlEmWcKImQZpH4WXNJ
 nHW9nyBrgiO//8Vx42vvsb3MeCOjrUzGiFl56Akn4BY4lLLiIv718JY03zJ0114xp/ek
 QTl/HbPWSyr2BevQgYaWjUyuXBHsg9QnLEkLbl2drrwrf64tAAiGKO9dNqDIV+8vAnh4
 Ciacn7N2CpKPOgo0syUMoyItq6533vxTPkwObuaDF+RPDmMDpSEEDUQ8gB/RuF0v1lqT
 WFCetl3w6THJHYmWXsY5HQUxtYjEjw7nf0LWPKxmwuhhN+l5WIT2JoWJqfa55372G5Ns
 N41Q==
X-Gm-Message-State: AOAM531lrlfV2sctwzGihpbw9Tsf2PeZ3vkjr+raKi2KsB/3QryrtOgB
 gSomwDROXK+wu9ttXeJFrTLK1gaZvv45Aw==
X-Google-Smtp-Source: ABdhPJwysBU7g+HmV9ivAFJWbctecSNdZGuh7B25Nqwfc/vJ7T5sn5cAKx+QkJjvaPBcYKaeBRKRag==
X-Received: by 2002:a17:90a:a395:: with SMTP id
 x21mr21008375pjp.63.1623706073485; 
 Mon, 14 Jun 2021 14:27:53 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 w206sm13232799pff.1.2021.06.14.14.27.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 14:27:53 -0700 (PDT)
Subject: Re: [PATCH v2 34/57] target/arm: Implement MVE VRMLALDAVH, VRMLSLDAVH
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210614151007.4545-1-peter.maydell@linaro.org>
 <20210614151007.4545-35-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <05de7822-ba91-d77e-5686-e247c7452a47@linaro.org>
Date: Mon, 14 Jun 2021 14:27:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210614151007.4545-35-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
> Implement the MVE VRMLALDAVH and VRMLSLDAVH insns, which accumulate
> the results of a rounded multiply of pairs of elements into a 72-bit
> accumulator, returning the top 64 bits in a pair of general purpose
> registers.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    |  8 ++++++++
>   target/arm/mve.decode      |  7 +++++++
>   target/arm/mve_helper.c    | 37 +++++++++++++++++++++++++++++++++++++
>   target/arm/translate-mve.c | 24 ++++++++++++++++++++++++
>   4 files changed, 76 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

