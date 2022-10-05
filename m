Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D405F5BD3
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Oct 2022 23:38:17 +0200 (CEST)
Received: from localhost ([::1]:38086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogC5o-0003Io-Rn
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 17:38:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogBzo-0006uc-67
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 17:32:05 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:37553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogBzm-0005x4-Dk
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 17:32:03 -0400
Received: by mail-pl1-x636.google.com with SMTP id d24so16621940pls.4
 for <qemu-devel@nongnu.org>; Wed, 05 Oct 2022 14:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=Aezgq/QB83Q2sr8V7JbCZLbaG1VG5tHQ6lHh1+M2HSg=;
 b=iIHma4A3shQ5aKqmY+EXHl1lWsVoQzIlsrC523MflsbcXdejlC0HefjuyLfTPRk6xc
 HONmg1yS0BtidhCUrqX0VhXODWhMeYn0+bRjmbbGxPl1msj6VU4sD17MRfzrB/VdABWr
 Ks6p2OSXilB4atDPKQyP17+TC0lzTZMsLqAgiPAHMc+uVfzzEWotzdIQXGxwmcZhQAnC
 t7poy1EfF9pyAyA5bbqAIjTRdD0CrV8hI1Rr+LGX/Kp5e/Tgg7ISZm2A+t7cTxzXvL+v
 o56yhA9oui3LxUKodGigi6BdfWQGVemUHaJyXVmUk/bdvT0sRVjsLA8ND9ld2MSVmjv6
 50HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=Aezgq/QB83Q2sr8V7JbCZLbaG1VG5tHQ6lHh1+M2HSg=;
 b=jNAt8+eWL5PoYHd6vPND2k4NMSaHxAPoIWmVwIAU8Y7Mnx1lMpW/bqYcVUMyfpRSPr
 T4aX1uXdGJMrEcqzer+APtNjLoQKOdcli6r+CDoghMIRxXPod5mDxAf6G50GV9Dx1C+C
 w5Z/+UFOZnCSj82OeevPbZKqqmHwgO4OMTU63SE95ujlCBw3EqL+bC0DtGZXY6dhNSoB
 rsjWosohteioOQfm3JX+Ev7xN49QtN3e8XA4m/+UCNPM6ZDWyGJ7prTps0eWi14n98+w
 ZhuVsAd2O+qzoPy0bCXyzEdeKr6ugnLcRuQYwio4rqqWffyRsedd90HOp49Q9WGbJiCa
 EIrQ==
X-Gm-Message-State: ACrzQf0H/gNl8cmf7v1qd9ilcq5f2pBP2du0XDmsSy/ue+58zIB8I0pl
 olxJdGxboBLBCrwFZG+yS2VwBw==
X-Google-Smtp-Source: AMsMyM67tELmyxbbWwKaJ4c3qfSUBX6xzQUSKHGXpefsN4cPYj5vBDtjpazEfOg+PZnFgiqi6kf/bw==
X-Received: by 2002:a17:90b:2751:b0:20a:e437:a9e8 with SMTP id
 qi17-20020a17090b275100b0020ae437a9e8mr6967701pjb.181.1665005520898; 
 Wed, 05 Oct 2022 14:32:00 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:9ad0:4307:7d39:bb61?
 ([2602:47:d49d:ec01:9ad0:4307:7d39:bb61])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a170903024c00b00176d218889esm11053558plh.228.2022.10.05.14.31.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Oct 2022 14:31:59 -0700 (PDT)
Message-ID: <bded7cf8-0d9d-e1e7-6354-37a61ddd0bc8@linaro.org>
Date: Wed, 5 Oct 2022 14:31:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 00/26] target/i386: pc-relative translation blocks
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>
References: <20221001140935.465607-1-richard.henderson@linaro.org>
 <CABgObfaCCJRSKpdYKjn4EH1Lf6JjZaBREg51USr9tLc7zvU3Mw@mail.gmail.com>
 <15240986-73b2-958c-ed7c-275e64c0659c@linaro.org>
 <CABgObfa10HE49XK0O0uzSdRSy4=e9bO5tTPR5RsS-U3+deQWDw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CABgObfa10HE49XK0O0uzSdRSy4=e9bO5tTPR5RsS-U3+deQWDw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.435,
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

On 10/5/22 14:06, Paolo Bonzini wrote:
> Great, then if you want I can merge this myself.

Yes, please.


r~

