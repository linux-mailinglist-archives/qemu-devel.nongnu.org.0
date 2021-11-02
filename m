Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C440442D87
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 13:07:31 +0100 (CET)
Received: from localhost ([::1]:40544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhsZe-00071F-EE
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 08:07:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrmE-0002P3-1b
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:16:26 -0400
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730]:42882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrmB-00045R-RZ
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:16:25 -0400
Received: by mail-qk1-x730.google.com with SMTP id bm28so4121126qkb.9
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 04:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6TlcMPKIxgAcOzhbpuxUmgGUV+AvJ65qkkKScJosyfM=;
 b=eCoi4wlOCgW4drQyg5Cskt1SdLIgVq8hqFP8yMCbnW4KHn7F+9TLUN1olXAX7ZXAVJ
 Kc3EVjwc4NbyuIF/wey8r+ZNpm4ZtBIj2sVpolhRkcpK9R+DCQELTYA34R8thmHeN4XB
 q1PCa/0xgm1Hn8Zq/YC2O0v6yPiQYa3wamYqyEMcmMJ1v8C+MBYZJxkgnO7bxTKuzvTG
 UuuVJGl6iHdCJ5T5qRiFDjhlTWeW/NeeEnMVnh0kBXuL0XEdp4LM08xwj3Se4cCC5kpy
 KJxjGMyFjz737VZRcyfl9/J1aetghELJf4boIl8BK9Q8CWk+jLLcE0HOvqhEa0a7OIL+
 NC9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6TlcMPKIxgAcOzhbpuxUmgGUV+AvJ65qkkKScJosyfM=;
 b=sInhawEuArx0r2TC33PRsNt6LC99P5/rtRz1+9IMh02pjYccnv94xxFKuEjRjL3pcY
 CvUAOV7dxhwwdLJ5Nmc875RfhhoQ6cPhvK4Uk1IB/mZn/62J+kF64pxmVFMLiYQ+wbFM
 qUDWRKy4iDzo+lHFBQNE9S++FOQUuPlAY2LoDKsTSF3uTRVLpLmMOIDWmrCIBTVjM+ZZ
 6AO4TOccWNNT5abirjnI8fw4O+8hwhCp0ihnfCyz9UML2T6ZFIwh0ZDiznLDRcg3B3JU
 wuoPkrGgqcWJxnHGd+vyckvoRtOse6qPKm+nYqTbviHkOZsVz/u/u2YAz2oYXbfKpVXu
 F67w==
X-Gm-Message-State: AOAM533cVu7dlVDW4ZOINhNjINg9oU86qZM5zhc8ArRW1Zsv2yn50PQH
 5uJ9DT/5+NyIq06b7q90d6g/xQ==
X-Google-Smtp-Source: ABdhPJzSgkuTZhM50UoMSFQn5YbsOfS8ryf2w+zA6pfrx+JZLoWXxE4BJWYvpQbrPHmmSI1IBAhQ9A==
X-Received: by 2002:a05:620a:2402:: with SMTP id
 d2mr28063614qkn.202.1635851781915; 
 Tue, 02 Nov 2021 04:16:21 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id h8sm8126364qkn.17.2021.11.02.04.16.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 04:16:21 -0700 (PDT)
Subject: Re: [PATCH v2 0/5] hw/arm: Add NPCM7XX Tachometer Device
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210311180855.149764-1-wuhaotsh@google.com>
 <CAFXwXrnm2yveebfyq0cPPZBAeW33_sVu0jrkpbNQNUDBRBFQUQ@mail.gmail.com>
 <CAGcCb10wR6sfZCD_1N+jV9gi6f5Vq=0q9mHzky844nDwkzb7yg@mail.gmail.com>
 <3d2a1f82-a32d-a423-ee6c-12a842bbf6c8@linaro.org>
 <CAFEAcA8VnBS=V9BUqGPHg-mXS975SPCsDXQobyJ7P=AwGLeMhQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2e957178-789f-2deb-04b9-86ca251498c5@linaro.org>
Date: Tue, 2 Nov 2021 07:16:20 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8VnBS=V9BUqGPHg-mXS975SPCsDXQobyJ7P=AwGLeMhQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::730;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x730.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.549,
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
Cc: venture@google.com, hskinnemoen@google.com, qemu-devel@nongnu.org,
 Hao Wu <wuhaotsh@google.com>, kfting@nuvoton.com, qemu-arm@nongnu.org,
 Avi.Fishman@nuvoton.com, dje@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/2/21 6:44 AM, Peter Maydell wrote:
> On Tue, 2 Nov 2021 at 10:03, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 11/1/21 1:50 PM, Hao Wu wrote:
>>> Is this reply to a wrong thread? I thought it was applied a long time ago.
>>
>> Probably.
> 
> Possibly you meant this 5-patch NPCM7xx series ?
> https://patchew.org/QEMU/20211008002628.1958285-1-wuhaotsh@google.com/
> ("[PATCH v2 0/5] hw/arm: Add MMC device for NPCM7XX boards")
> 
> which has been reviewed and is ready to go in I think.

Yep, that's the one.


r~

