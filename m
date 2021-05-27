Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8001B392435
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 03:15:42 +0200 (CEST)
Received: from localhost ([::1]:38574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm4ce-0006ku-NB
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 21:15:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm4bF-00063t-1U
 for qemu-devel@nongnu.org; Wed, 26 May 2021 21:14:13 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:50691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm4bC-0005Nb-PC
 for qemu-devel@nongnu.org; Wed, 26 May 2021 21:14:12 -0400
Received: by mail-pj1-x1032.google.com with SMTP id t11so1812051pjm.0
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 18:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ss6gCpcaLxCgdnW5/jyrl2Szdk4+ogvyk+E4nRkDW9I=;
 b=Rt11Xd2/7xKAV3Q1ueaW7CfZ5r6UFlb/XeEfN9cMM3Sz2/cc+Az6DN5bawgSjIgKQN
 nWb2sqdWf8JIruFycXeg2wuUPy6om3rh8S77s5na2SMa9rBRSYSd0lyCFjzd53IcOpIB
 25x36l+O1u+XeWvYw9fRQSxGyRXSdDlKNupR0i72upPA5RDwGwf+DxYsQca7jPRp5TCg
 2GqID2hxM31ZFsHG/VD/ejia0qo5lZ0T+P1QvRcOf0Pcw6dpGD0XRBEy5/Lot48zD5+x
 xn1z8eCvz1Tz2N+ycOV61pWq+y1TwqPn7E+MhAF0v0aQesQZE56kgBQHGfrjzlO4d47O
 ViCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ss6gCpcaLxCgdnW5/jyrl2Szdk4+ogvyk+E4nRkDW9I=;
 b=DnG/l6o3C1irsUs4U3+KDHSL4gVTExWHIqcbsda5DXLnaN84hvIQHNVc59mVz7AbHe
 ag6u5z6jGwV3XVcQ6m5rXo8/LoA/w9wcsvKEjucJ2p0KjWbjy+6a6LBhLtm2X2dfb9R7
 SaliiHCJmq/5cpIq5SSDx5wOx52zA44uTz1b+X1NzY4STG49ZIpWcT2aFCEIIEWzJR7Q
 ntkVR+VWN620+Xxaq1OzIdZZguYXQM0FOfPcLXOJdXS8ilQ8Q7CPQlByojiy3AHhfHT/
 D79WFNvv8fgbNE3d1GA7skn9zR90YhCQR8CHb7aYNyvZNmEzHZoKexwJPKhgcVYPbJrH
 LZdw==
X-Gm-Message-State: AOAM531VYeoshbAHGJdrP16N1l9+xjTJGsaz6ndEzfP88UHsVeexVabj
 dM4dQucoKiDZDcY1fjWxeWn7XoY/KxYXzw==
X-Google-Smtp-Source: ABdhPJwaNOKK4BbheLPvNLK2EpccR66rvBzAS0/TDTwYnwraQ5Ylkc/pmwh+jsjH2BkfXCuYWSLETQ==
X-Received: by 2002:a17:90b:341:: with SMTP id
 fh1mr1020092pjb.136.1622078049198; 
 Wed, 26 May 2021 18:14:09 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 ft19sm403020pjb.48.2021.05.26.18.14.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 May 2021 18:14:08 -0700 (PDT)
Subject: Re: Denormal input handling
To: Michael Morrell <mmorrell@tachyum.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <30eafc8be31446f9aecbc40f487467e1@tachyum.com>
 <CAFEAcA-BnxgejNgo0XFU_aegdXfN2mFr9E6xa5BPRxHLdfSt_A@mail.gmail.com>
 <217fbb53d6764b4a9b63726c1344f7d9@tachyum.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a891cfcd-46c3-b838-ec68-13e0e009bce5@linaro.org>
Date: Wed, 26 May 2021 18:14:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <217fbb53d6764b4a9b63726c1344f7d9@tachyum.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/26/21 2:59 PM, Michael Morrell wrote:
> First, I apologize for the duplicate thread.  I thought the first attempt didn't go through.
> 
> I agree with Richard that we need an extra flag bit.  The current behavior is not right for SSE on x86 (it looks like x87 might be different still).   For ARM, setting FPCR.FZ to 1 will result in FPSR.IDC being set for a denormal input (and that input will be flushed to 0), whereas for x86/SSE, setting MXCSR.DAZ to 0 will result in MXCSR.DE being set for a denormal input (and MXCSR.DAZ = 1 flushes that input to 0).

It seems the language for x87 is different because there is no DAZ bit for x87, 
only SSE.  Thus the x87 DE bit is set for a denormal input which will never be 
flushed to zero.

> I'm a little surprised there are no x86 test cases that cover this.

The status of x86 is fairly shakey when it comes to tcg.  Most of the work for 
x86 is all about native virtualization.

The last person to touch this code, Joseph Myers, kindly left us a big fat 
FIXME comment in update_mxcsr_from_sse_status.

> Richard, are you willing to make the change or do you want me to try?

I'll do it.  I've got some outstanding floatx80 cleanups that would be handy to 
build upon while doing this.


r~

