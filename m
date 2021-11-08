Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A45E644978A
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 16:07:42 +0100 (CET)
Received: from localhost ([::1]:44640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk6FI-0005LL-Hv
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 10:07:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mk6D4-00074W-F9
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 10:05:22 -0500
Received: from [2a00:1450:4864:20::32e] (port=53767
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mk6D2-0000rb-Dy
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 10:05:22 -0500
Received: by mail-wm1-x32e.google.com with SMTP id y196so13261336wmc.3
 for <qemu-devel@nongnu.org>; Mon, 08 Nov 2021 07:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ql5fsGC2BUxNSBzDgc8T8XFScxX1pfeJjpPRVa2yXws=;
 b=p6RLzKoH5UAf6+nzghnDxSviAqaNxYJrnsUPmicNoRgLxrWMlONXQerAbIAsi020Z1
 TD8scPBG4219bIpD4e6LFtgsmp5EyJa+2IZdvAxYT7L0ZKsuWDMZHVC2MWcH7+PMfFSw
 0+DX0F1GwiniGsll9PldCMu5GOFLrEjA398OywjAifPjh0ZclM3dg8Fee4KbssA5+7+b
 ewuJEbhjDaziKP0nUkomGzTtSWdq5mnSP2seDS1j+EHBqb63OPRfknsm3yXHfeOqglwA
 PmXrvsIUKNTi+eCdSiYatTfQOTVTkvYY/yQ0kjke+PTdQzwGgyRecS60fIX0D07VI3YI
 W8Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ql5fsGC2BUxNSBzDgc8T8XFScxX1pfeJjpPRVa2yXws=;
 b=RmHnC+KKF4XnB6bHZn4TIqeGC/j+qwNWPFaavyHv4YBt6dYRGovIMgVzl/koup6mkS
 SeUhbt8knHq2Db3eu/KpszIh/syQFqg1cD1ty1V5i8s5cO/mzh8i9PeynermJ6XcZ325
 i/WsTI1x72PzUCKK9YdoDZtZNhaoQfQ9vZNC2UolmkKSA0uTMROXy31SFBZ8iAIfAJFh
 Pf+kmBL+21Gl5T27kXepBG5/Ht8P3veogkr+NSlgPhyW5pV4Eh8GP9yd3OKk89WYQ9Y+
 Wb0aljAFEzb/FnpLomi6P2qA/r8OH0ChqIGsPCtHOYhhcLqWdcjANHz50w7vHhRZbwLX
 ELVA==
X-Gm-Message-State: AOAM5321eUM99Ofu2OlC0d1+IO2dYLi245qtGGLHCj07xAh1AQ8JiEWP
 JQnJqeN9wAoNtzKvPhIxojFTnp9CT0EyhNZz7IE=
X-Google-Smtp-Source: ABdhPJzDmuu3aB9qqTq6ypitDdENtC0ezvEPG7IHyEoOUmHEwkKt91PhFaP2aZz3oCJjrxt0Ab6u3w==
X-Received: by 2002:a1c:e906:: with SMTP id q6mr53663306wmc.126.1636383559037; 
 Mon, 08 Nov 2021 06:59:19 -0800 (PST)
Received: from [192.168.8.106] (173.red-95-126-185.staticip.rima-tde.net.
 [95.126.185.173])
 by smtp.gmail.com with ESMTPSA id v191sm16347223wme.36.2021.11.08.06.59.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Nov 2021 06:59:18 -0800 (PST)
Subject: Re: [PATCH v4 00/10] target/arm: Fix insn exception priorities
To: Peter Maydell <peter.maydell@linaro.org>
References: <20211103040352.373688-1-richard.henderson@linaro.org>
 <CAFEAcA_xNteFJzgmGjmzpEZUNQnV8yiEHojL-ocsX4Zj0VamHQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <575fdd6c-b1dd-6c9d-bcb8-91755d917052@linaro.org>
Date: Mon, 8 Nov 2021 15:59:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_xNteFJzgmGjmzpEZUNQnV8yiEHojL-ocsX4Zj0VamHQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.06,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/8/21 3:16 PM, Peter Maydell wrote:
> On Wed, 3 Nov 2021 at 04:04, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Raise pc alignment faults.
>> Fix single-step and pc-align priority over breakpoints.
>> Not yet fixing insn abort priority over breakpoints.
> 
> Do you have a view on whether we should put this into 6.2
> or hold it for 7.0 ?

I think it's safe enough to go in.
But it's something that has been broken since forever, so it could also wait.


r~

