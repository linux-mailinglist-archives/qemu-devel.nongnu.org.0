Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4143C1A98
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 22:36:44 +0200 (CEST)
Received: from localhost ([::1]:34452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1alH-0007Tz-FM
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 16:36:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1ahB-0001Iu-J1
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 16:32:29 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:43790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1ahA-0004vb-13
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 16:32:29 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 x21-20020a17090aa395b029016e25313bfcso4730563pjp.2
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 13:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uNmBhfcTJ4s9gBDXCnM0ypHNy5R4ytZT1EaK9CjcUzU=;
 b=cBty67Dcays7DveuhKENFwWTosXmiGD5Lv7iU7TA+/Cc4BZzUHPwnXXo5Fs8B/w5/K
 ZLbDmqUElEXmzOPAHUO/5uSldNTUoC1QHHqTetuOcRjSZxoFYq9K7Oqsf18+npfU4Om1
 5fPHL7hG8zo4yyfGzvrUzuF0SIBKm31CHQEDqFdcYqIoKd0Kny4GMYnqOkKQwRd1F3xe
 73y6MA9tq8fl5UUGsg5sV5rch6jI9V0YGiwBPlNzy1OH04mZHHuEGOKKgGyuAhckIEX1
 8HRJdOVmtWq1gC3mu3jmj+DDfR+/C50M4XDjZjKtyIQ4gCAc+xbSEvNhXq5M97YdIaYi
 DdrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uNmBhfcTJ4s9gBDXCnM0ypHNy5R4ytZT1EaK9CjcUzU=;
 b=On+3R4WZBK9swmGJAS83owWR0Ok4/6Zin6AGBApZDrs0/hwGOopBiMx1/CEK82tjHs
 CTs6yIQrZinGHbBNeRSaw6wPd9cy91W03VdFLRYB06Tc4eqUXwT/sy8LiRH/se4CM0nn
 Xxauf0TpB1ultkc2XzSWgVS6iayo6Zak4zXSZI66RSkRIw54uRZ5KUcv0Lx847IguCv5
 BjiKieZ7Z+bor9aOUJ2V7FyzKjKihSLxBIjNU+jSYdJ9ZNsSoP34SSH3bUIdf1gY2sJq
 whP4gwb3+a6hf47KFaKtuKnpd79hD9Er2ZxzzD3CWmS7+a5hrSUwxzH0r27GkxC0SSQ2
 u2Gw==
X-Gm-Message-State: AOAM530m3EivnjeULuQsRZyli514aqaWjIurt0u5InyVK6s2rQubU69Q
 1ECfT1l2fmXmXHcB3ntmLTVKFg==
X-Google-Smtp-Source: ABdhPJyyN2wPC00mqAbt6gEJJgeBx1sTJ4oiHipFAa2Wrx6E04hrfYvTm6rcjollYvM0/bWoGS5rdQ==
X-Received: by 2002:a17:90b:4c41:: with SMTP id
 np1mr34767723pjb.69.1625776346278; 
 Thu, 08 Jul 2021 13:32:26 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 202sm3768630pfu.113.2021.07.08.13.32.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 13:32:25 -0700 (PDT)
Subject: Re: [PATCH v2 29/39] configure: don't allow plugins to be enabled for
 a non-TCG build
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210708190941.16980-1-alex.bennee@linaro.org>
 <20210708190941.16980-30-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c6f9e87c-92b5-9a02-fe96-bc4aa4c5ddcd@linaro.org>
Date: Thu, 8 Jul 2021 13:32:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210708190941.16980-30-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, pbonzini@redhat.com, f4bug@amsat.org,
 robhenry@microsoft.com, aaron@os.amperecomputing.com,
 mahmoudabdalghany@outlook.com, minyihh@uci.edu, cota@braap.org,
 stefanha@redhat.com, crosa@redhat.com, kuhn.chenqun@huawei.com,
 ma.mandourr@gmail.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/8/21 12:09 PM, Alex Bennée wrote:
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> 
> ---
> v2
>    - error out after all options have been processed
> ---
>   configure | 6 ++++++
>   1 file changed, 6 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

