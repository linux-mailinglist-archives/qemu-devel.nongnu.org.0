Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E453B4BD0
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Jun 2021 03:30:09 +0200 (CEST)
Received: from localhost ([::1]:33040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwx96-0007ss-63
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 21:30:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lwx89-0007DJ-UH
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 21:29:09 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:46878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lwx85-0003ul-7z
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 21:29:09 -0400
Received: by mail-pf1-x431.google.com with SMTP id x16so8800678pfa.13
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 18:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xCtQQbdTP6T4IFQilNNgHDPf8HizOQWmTetN1la1yc4=;
 b=XzNzEYAqcOC9UjvjuVpE5NsVVwY6CH3egwqf5qTXlwDvh4sJshRjH+p9fFVL2dK6vx
 IH1hgyeHKzAcQi+Klz3CMsPkYP/3ufA2SafFiIi4Xzp7Vs9NaxSj+5lFVED5/7/CuVC1
 2JbgDTUwM1GGVioYVGdHU9V9qFEJXLN1HCK+xdl0uf8fVVQcW4eNRbl9XJ1Nd997esd0
 AE1VA9F5Xx5Gqd5FUOIHspWXfCyS/qQqoykz5e0Fei8b97qrGuoXczIotVuZ5D/R6drG
 GY6xK0kD+TINqprUAowZwjvr5pO5crhx0iOOjKCz+pZXEStiTp8FtMyy2dqIIOpcXkeh
 zHPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xCtQQbdTP6T4IFQilNNgHDPf8HizOQWmTetN1la1yc4=;
 b=S5Z8chdZS3kuLpPw7L8YJMCX4NdfucbLmov/hm6nof1xRjvlEKWmSYikwzi0zfmAef
 69otwSWIiY8YLyNgQwAKiD45yvy4Yb0ojyiU1vr9agSatUQ9IJlSfJhUoG5L7BxdJp31
 56dQy2k4SJ2GD/U2/xwTteRRTexHbhZkFIe2MoijlZffWTjvQcNjWN6T/VfeFBP/1wA6
 /bMh24z0dZct1J4OeY+zds1ayZ5fXrgPY7gKluZ6AgGrwe6c6bmpeGxJbFWXI/Knz1H6
 kOOynuGw8h4orKD80i3FXR7asxWGy4p/M8oAtxBAg67nmS1Fl+hUo2Nnj0/BVhPpkKIH
 5QlQ==
X-Gm-Message-State: AOAM531bgCKCSzf1NC5peVCaNLaBCc5kXvHq80NyewfweA2gR1ghJCWv
 VCk8KhFd3qJX3f2bZJOCPciH56SyZNwRrg==
X-Google-Smtp-Source: ABdhPJxkfKJ1YFXm5HInFEfrnkF6x/fqY1ONIBLh+Qf1VrWSKnyOVGjbQ8lVvCbUyMVHbshlikLqWw==
X-Received: by 2002:aa7:8058:0:b029:2e9:ee0e:b106 with SMTP id
 y24-20020aa780580000b02902e9ee0eb106mr13431761pfm.4.1624670943063; 
 Fri, 25 Jun 2021 18:29:03 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id w123sm6807357pfb.109.2021.06.25.18.29.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jun 2021 18:29:02 -0700 (PDT)
Subject: Re: Guidance on emulating "sparse" address spaces
To: Jason Thorpe <thorpej@me.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>
References: <B588EDAA-3A97-44A9-8CAF-B2858CBE0A93@me.com>
 <13c2d220-4000-74e2-a07b-88d6b898fb34@amsat.org>
 <4E502648-2EFD-4A0E-B161-2C2410709536@me.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3ebeed5b-22e9-fff9-3425-0f06663b7115@linaro.org>
Date: Fri, 25 Jun 2021 18:29:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <4E502648-2EFD-4A0E-B161-2C2410709536@me.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/23/21 5:53 PM, Jason Thorpe wrote:
> Thanks for the pointer!  Yes, it seems like that might be similar to what I need... create new address spaces (rather than using the "system" address space) for the PCI memory and I/O regions (I need to do this for PCI configuration space, too, FWIW...), then in my sparse ops handlers, decode the bus address and size, and then call address_space_{read,write}().  Have I got the gist of it?

Yep.  That bitband device is a good example.


r~

