Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2410F3B77E5
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 20:34:28 +0200 (CEST)
Received: from localhost ([::1]:35910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyIZ1-00071r-6y
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 14:34:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyIXk-000692-Kh
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:33:08 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:37868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyIXe-0004NK-Vf
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:33:08 -0400
Received: by mail-pg1-x52a.google.com with SMTP id t9so19318134pgn.4
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 11:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9QzL1z6vcX25s6sUIhuDHggygoMjsvQaR8I6rC665A4=;
 b=KzIyOi/RpBf6UxOFaeagwCC/Kzqq6vt2lm8UE/V62YO573k5LbeF2E9Sj/QB0R0ZwY
 1sxRwHDoQewR8+sXWBKd40dpByUAtGSMoVuBlCJ2nnvoyFr5Fcwd9pcVLbaOCD1BCuKt
 e3VYKnCIJnVoePYhyBmRFKsZ6WLMfDh1v74D8fanYVGPhpWrSJ9CdgbGDA5tibj/3n3b
 DQVZceg4/iSQm0XORUnwroKZ8ynV2cveZG5O2KFDLXxq2qNkqKghfshst1OUOFtsIUFo
 Z3Wyb27QEmEEGbWlebA4LFgPBwB9XeFmFCbRdfnCxNFSMdWWLXP95RoWf9yDBdJQB9Mn
 KBVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9QzL1z6vcX25s6sUIhuDHggygoMjsvQaR8I6rC665A4=;
 b=oWbhB2cWnoU8IUELLinHs39oW1UzpDbT0Gpc+2hrjn7GdQ8I8ZXRmxRNbTp6q4Tzco
 JHrgSbYyzIw39p6c2YzL3KjcZw04MEFQd7/yBCpMR0DNm34KVCgpu1qXU2iwFRVKbPim
 R8n/ImaUqdEyHIQKHilV2/keWao8iee9MTOzqgWb2TE73opHIbBpR7NVomVhTyYiqUao
 UY5opG/T2AslcLjFekvBQnhX81J23LHNPgivPdf93XrY4SBKB9YTvr+sVc9qzTob9ijB
 MO4wxR5/2gAjkhj1eK8joLCiz/6tWnZWeZ8RiiuGHlfypL3iCDBCUJAwNFTZ13hriGmf
 EZ/A==
X-Gm-Message-State: AOAM533yA3XUnleD6/2UT9koO5PyxLYN4xHX+Up7ZuX7cx9Qd6qNlg/L
 HMEbt8NsngUo2l89rHuziDYccA==
X-Google-Smtp-Source: ABdhPJzF1SW92qucXsxGtJecJ415ZAjSgirolzKs1D53eJZdtBZXPIl9AHcuYllQLPdupPyi1s9tfA==
X-Received: by 2002:a62:ae19:0:b029:307:403b:5d7f with SMTP id
 q25-20020a62ae190000b0290307403b5d7fmr31603695pff.5.1624991579724; 
 Tue, 29 Jun 2021 11:32:59 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j2sm18365087pfj.168.2021.06.29.11.32.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jun 2021 11:32:58 -0700 (PDT)
Subject: Re: [PATCH v2 05/23] linux-user/arm: Implement setup_sigtramp
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210618192951.125651-1-richard.henderson@linaro.org>
 <20210618192951.125651-6-richard.henderson@linaro.org>
 <CAFEAcA91p7_PKvs3aJnqe2zy9MOv=y5pn6yp-SmwRVZow92tww@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <91029900-3fe9-f252-bede-26c9cc1325d3@linaro.org>
Date: Tue, 29 Jun 2021 11:32:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA91p7_PKvs3aJnqe2zy9MOv=y5pn6yp-SmwRVZow92tww@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/29/21 7:09 AM, Peter Maydell wrote:
> On Fri, 18 Jun 2021 at 20:33, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> ARM is more complicated than the others, in that we also
>> have trampolines for using SA_RESTORER with FDPIC, and
>> we need to create trampolines for both ARM and Thumb modes.
>>
>> Cc: qemu-arm@nongnu.org
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   linux-user/arm/target_signal.h |   2 +
>>   linux-user/arm/signal.c        | 170 +++++++++++++++++++--------------
>>   2 files changed, 100 insertions(+), 72 deletions(-)
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> though I'm not 100% confident I checked all the details. Do you have
> test programs that checked all the different trampolines ?

No, I have no fdpic testcases, and wasn't keen to spend an afternoon building the toolchain.


r~

