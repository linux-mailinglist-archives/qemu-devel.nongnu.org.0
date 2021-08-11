Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC5B3E972C
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 19:57:34 +0200 (CEST)
Received: from localhost ([::1]:33668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDsTs-0000tr-M6
	for lists+qemu-devel@lfdr.de; Wed, 11 Aug 2021 13:57:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDsT4-00007p-Ur
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 13:56:42 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:42894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDsT3-0001Gu-8q
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 13:56:42 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 mq2-20020a17090b3802b0290178911d298bso6356920pjb.1
 for <qemu-devel@nongnu.org>; Wed, 11 Aug 2021 10:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sd275UudlJh/yTNdYqfp4jI6iZzjUwOym27lPZaPAnM=;
 b=RnaT7E9b4MOyMqD1gyR31fcWV57wd3SpsjAS3HCxrGgck1aw/cLlInKHlXeQVvp78K
 lBgBScZ1od9ePeu3fzKopB7i3i/Nvv64dhPSfvyzFEyhwQLXlZFgr7IPQvBqe+DNmi3F
 qGMhC+yHC7SbFvR/SUB8Q4nJrRSh1M0AoH4UNt+4NGjsqTvjpDIyypoQXAr7LxXU0X2O
 JRJuElEYLsERlyNOA55m5CkrcCPgvDITwAHKONmce/oJ12qCQsZtR/dMSCJ97u28WOW6
 LValr6JjW5jLHZB5OCW425ApqMA2EIesKvFzm9ZkkhN1cMz69XtMblAAmkGdEWzjBtcL
 UcQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sd275UudlJh/yTNdYqfp4jI6iZzjUwOym27lPZaPAnM=;
 b=Sn+bU6T6T41zL3PXkWlC9hqC2I7EI7k5xPTYsq9zjIfOIqPB9xEqToVGYV3UfhD4tH
 R5nBy/qiv9SkigyADSSNqFC//02mdqNi1gcPQO5c+69s/P4GGWLznW+sAgYtg6+ygf5g
 9w7UztJ7pif3OqIInwsj2QhaPwVdFSL2wMAINUUlEgxwIIo+rokW6OV4QGhq3dlazWVD
 7Vhzz+o7dmC/DLKj/wElwt+MfVNnEFhQ2eUFvjBCKYVVE6Ux8Y01DhggQUcaS7QCntlR
 9owxTqllg+I+vLynmfG/g6FucMmK7O9ATjYD5MMUqPJ36C6+2OgiQimglHQ7X9ByCe08
 36Wg==
X-Gm-Message-State: AOAM5333vjfuOa7pyVbDwRTtXO/pvuozRRJCI2n/j2B4O/BdFlhuOJAT
 v0+ehLbLEQo8qMsQp/Woxj12Hg==
X-Google-Smtp-Source: ABdhPJzR/jK9eMyLJfNPKgdCmEFrJ8Tn4QDFbVMMUoo5ax94YCGDOTRlTJy4E0BjMQI/Q0IG6rItqg==
X-Received: by 2002:a17:90b:a12:: with SMTP id
 gg18mr11456387pjb.78.1628704598961; 
 Wed, 11 Aug 2021 10:56:38 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id t26sm156408pfq.75.2021.08.11.10.56.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Aug 2021 10:56:37 -0700 (PDT)
Subject: Re: [RFC PATCH 02/13] target/riscv: Support UXL32 for branch
 instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20210805025312.15720-1-zhiwei_liu@c-sky.com>
 <20210805025312.15720-3-zhiwei_liu@c-sky.com>
 <840d76cc-fd1c-6324-19cc-a6ec0075d032@linaro.org>
 <5ae8f7a7-7659-aeee-9b4b-3521e19f4c75@c-sky.com>
 <249ce5f9-333a-7186-36bb-a2ecadb19254@linaro.org>
 <538f3928-f681-cb9e-7850-48469ea4ccd5@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <15f69497-3baf-abf1-ba9e-91ac1e883d63@linaro.org>
Date: Wed, 11 Aug 2021 07:56:32 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <538f3928-f681-cb9e-7850-48469ea4ccd5@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: palmer@dabbelt.com, bin.meng@windriver.com, Alistair.Francis@wdc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/11/21 4:57 AM, LIU Zhiwei wrote:
> I  still don't know why the value written sign-extended.  If that's the the rule of final 
> specification, I will try to obey it although our Linux will not depend on the high part.

The text that I'm looking at is

https://github.com/riscv/riscv-isa-manual/releases/download/Ratified-IMFDQC-and-Priv-v1.11/riscv-privileged-20190608.pdf

3.1.6.2 Base ISA Control in mstatus Register

In the fifth paragraph, the requirement for sign-extension is detailed.


r~

