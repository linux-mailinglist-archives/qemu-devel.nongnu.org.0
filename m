Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2EE5F0D14
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 16:07:34 +0200 (CEST)
Received: from localhost ([::1]:49898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeGft-0002bK-Vk
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 10:07:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oeGU1-0000U6-2F
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 09:55:18 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:50910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oeGTt-0001hE-IQ
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 09:55:12 -0400
Received: by mail-pj1-x1030.google.com with SMTP id lx7so4372971pjb.0
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 06:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=T2hLIct7jbuA3JjBZNxMIoiVUnwk90GRWJ2E97Intic=;
 b=LhovwF+JdMRO1NNlis2ZnHk47IMT2qbiJxB6jk7lVBgTICX9BsonEHbeTT3BISaUx/
 gUBBh0kXksh8SwG9gUWOfdq9sgL64e+kXh7IuyKzHxy+oWr1lPJl0xbUSwRGhgX2jqsD
 q2fJJ4/niMQ0C7xIg944KZhL1xtaBrKwNZcZ3szICgr6Xo/8E2sWlfwMO1HAHN/Yo4Ca
 B3oSNeSq04BgyPX6fP4OsZT+id7PoUJs8fHKcNpmB9Qye55um6p3VSPOSTmnkBuPvxTa
 4obaPi2CpcO2iKGDYYmtQPHUrv4h1VCM+e6UpvpPQNePlM/ebNBc64u6QH7zqg1XIhB9
 cNXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=T2hLIct7jbuA3JjBZNxMIoiVUnwk90GRWJ2E97Intic=;
 b=mtrjpEylC3JXLGiXWPtYA+9qOyWlh6MNIDMgYHkN8AThvCXvc4yCRfeu1SIpx2ec82
 5Aw+9nityYm4cmRVm8EPeUwII6qlM76Mb/ynMgrXgNsL5xwiPBnSCKnmeKXdqGn7is8S
 zQJSzHMqlbFsFS6twwvAIUSrYbjWVY3s+i6jLX50gE9nFz5pfBxzjJeTSrFJfzP5FxNV
 poVp7ROZsKbEBKlDmQXNL/oySvL7Mbpa809pGcgzltxcXBOZ1fhmr9xDZPzdb0V1zFBK
 qDNwPmHP/Oo+Ry5t7ir5JNfmBYDCAB4t85Q82JMHEoelPeeIoeU2sYdxuIRrUv4SiKmW
 Lnmw==
X-Gm-Message-State: ACrzQf2+NwXh3SiJRzaGH7LFECVgG8V0dR38cDHacPj15z+tFxEjKncX
 guD05bTSnZKyOHSrKRd8kLzaag==
X-Google-Smtp-Source: AMsMyM4ctiVCYh7R8wUSg3ST4JUD9E03BpyanKWjNREP9g4Y/6D6IVq0JT2xVaw7peN8a6i0GF/c8Q==
X-Received: by 2002:a17:903:489:b0:17c:b4b9:6606 with SMTP id
 jj9-20020a170903048900b0017cb4b96606mr2121877plb.30.1664546107559; 
 Fri, 30 Sep 2022 06:55:07 -0700 (PDT)
Received: from [192.168.74.154] ([50.200.230.211])
 by smtp.gmail.com with ESMTPSA id
 m23-20020a17090a159700b002037a4e913bsm5324219pja.44.2022.09.30.06.55.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Sep 2022 06:55:06 -0700 (PDT)
Message-ID: <4eb75c49-23a2-de8e-81c5-eaa0644923e2@linaro.org>
Date: Fri, 30 Sep 2022 06:55:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] win32: set threads name
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
Cc: qemu-devel@nongnu.org, bin.meng@windriver.com, Stefan Weil <sw@weilnetz.de>
References: <20220929134150.1377690-1-marcandre.lureau@redhat.com>
 <5d7e7c01-7739-9a04-9a4a-becb3c550885@linaro.org>
 <CAJ+F1CLNzwTOB2-wxbnJw9VaCVBFUkgC5c-nYaczL14RLVwaCg@mail.gmail.com>
 <2a7907c0-752a-e262-7088-83958ede1916@linaro.org>
 <CAJ+F1CLDCNm_Wv6POaAexzd=2Bsebt-2y6RMEX_3+j5mJDAmUA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAJ+F1CLDCNm_Wv6POaAexzd=2Bsebt-2y6RMEX_3+j5mJDAmUA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.583,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/30/22 06:45, Marc-André Lureau wrote:
> So you suggest simply setting "name_threads" to false when loading the function failed?

Yes.


r~

