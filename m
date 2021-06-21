Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3DC3AF1D2
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 19:23:19 +0200 (CEST)
Received: from localhost ([::1]:42462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvNdm-0006k9-13
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 13:23:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvNUT-0000rH-HJ
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 13:13:41 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:39610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvNUQ-0000HO-9M
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 13:13:40 -0400
Received: by mail-pf1-x433.google.com with SMTP id g192so6479207pfb.6
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 10:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IhA4cSLftuCCYp/cbOl02JPYx8KmG+g5ZeFChx1n1Y8=;
 b=T35TeSGKSUlunj3tvT4XDxgFVrCjcpIHFAKq9eTyaj5A6Kz8yERIgJ3lXJequTXs6P
 UzHWqQDe8tOZXBMXHLCsgvWhUxGMEGVcrYMfGSiDUy9n2tWRMUO5cZ0tp/PjoYpcZwjb
 4AUoCOLRqt6k4UDdoK0End/S7OsQ6n+E1S/QU0QMB9QCgQkcR7uRRQN1lKUV9KNmvYuq
 YltXyRHWgj2+jQ5n4NiXzyJus2TXeAXRXU+GFe3DcdwYs1AXbZvGvlX3XOwXyr7kmkAE
 nenje3biaDADf5zKkvtkyHIoZQpxe31aO/aDK/xFC1RkyJCyNoZmBpRixywxJcz2iKla
 gEpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IhA4cSLftuCCYp/cbOl02JPYx8KmG+g5ZeFChx1n1Y8=;
 b=CUWgFmO0FeorClqmFOiyJaQ2Phzwu6u0FMpjYb1zHEeStMtD0yRoJaujh7ipAdEbJ9
 Hqyqjh0rLh9p+UUeaumF8swI4gqwA3sbuIFOldqE3MhIQXvSRsvyqjaUBrU12xrDAkWf
 SikQY4YrH7lotlHtnNAD4UppYhzNy0uZNljOdM+DPJdVLS33oj7X3Jz+m9g0QzjLsdZO
 VOqh41lE4S4Mw1Wn4rlB9NJ2dgy4ojfIhQzjaqIijMNjEUnLBbecZfp2DhRLW6dbEJ0E
 VRHE7a270vgIykHaIibwXg3LlHI2Zgjr8m6HSkymy5llN6MlWAax4YD0qUYFytt8Mdr4
 CzFQ==
X-Gm-Message-State: AOAM530t41w2pPxrmfXfXqMRxvyle2jI/I1XPGIAAlSNaMsYNtaVLklS
 5K3i97ZibOVeodekYDgXFNBOE9nsETYcGg==
X-Google-Smtp-Source: ABdhPJxKvtcmMoi8KoHRSF9BbGhSpOYpHFGiuAq+eZ9iQSZ6e+bJQ6w9hS4M0bBPxOcXSIxI3xfXsg==
X-Received: by 2002:a05:6a00:17a4:b029:304:a2d1:25a6 with SMTP id
 s36-20020a056a0017a4b0290304a2d125a6mr1780122pfg.68.1624295616932; 
 Mon, 21 Jun 2021 10:13:36 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id g13sm15454228pfv.65.2021.06.21.10.13.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 10:13:36 -0700 (PDT)
Subject: Re: [PATCH v2 00/57] target/arm: First slice of MVE implementation
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210614151007.4545-1-peter.maydell@linaro.org>
 <2ded6216-9fa3-2b39-87ac-c61d08e80fd7@linaro.org>
 <CAFEAcA9udbXc9jTJORVfTmH6jdBrSwJLaivAoaeCUom-uVGrLg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c497b5c5-c01b-470c-e7c0-dc7fe81be636@linaro.org>
Date: Mon, 21 Jun 2021 10:13:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9udbXc9jTJORVfTmH6jdBrSwJLaivAoaeCUom-uVGrLg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/21/21 9:37 AM, Peter Maydell wrote:
>> void bt(unsigned char  *x, long i) { H(x, i) = 0; }
>> void ht(unsigned short *x, long i) { H(x, i) = 0; }
>> void wt(unsigned int   *x, long i) { H(x, i) = 0; }
>> void qt(unsigned long  *x, long i) { H(x, i) = 0; }
>>
>> void bb(unsigned char  *x, long i) { H1(x, i) = 0; }
>> void hb(unsigned short *x, long i) { H1(x, i) = 0; }
>> void wb(unsigned int   *x, long i) { H1(x, i) = 0; }
>> void qb(unsigned long  *x, long i) { H1(x, i) = 0; }
> 
> What are these functions for ?

Ah, sorry, testing.  Just looking at the -S output.


r~

