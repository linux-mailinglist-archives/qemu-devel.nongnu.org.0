Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19148485EEE
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 03:46:16 +0100 (CET)
Received: from localhost ([::1]:32924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5In9-000595-7W
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 21:46:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5ImE-0004Oq-JS
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 21:45:18 -0500
Received: from [2607:f8b0:4864:20::1034] (port=45740
 helo=mail-pj1-x1034.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5ImD-00010w-0w
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 21:45:18 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 l16-20020a17090a409000b001b2e9628c9cso1682032pjg.4
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 18:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=pY9Bf06NJv038JMTthdLrQI6cumr+tyhnWMWMCqd/uA=;
 b=Ccev9JLcWVubaN0ih3czVz000A8SiLmQomW6WMx7lFQL1avnvbgPs/ayeWR06uMTp5
 UW5vQ/gEwqvNIrrlSdWjE0LrSjk4bj8OmF5Eu0h5ruvagg6W4ahyMW07fXSUQrKN0GdX
 m0YeFHIN2AxVGO9BMXA4qCEEFIbtCLbMpCsMM31QRi2nHxBWagVlJ2nyY8XC5D0+g750
 S5ryQkUKnaUW5YtRmnVdQvwunzU7iP8QvxdL4vXbm2PUjUTgd3u1JiktCjRDpcD+2TYj
 J3v7gPBj5ThbdMp0twvn1rRYMkJApH14NAEaMJwB5ALfjcZ/VnHi+8XxwjRhx4FVrf/y
 XDOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pY9Bf06NJv038JMTthdLrQI6cumr+tyhnWMWMCqd/uA=;
 b=h5Etui71cM9zD9dXBhrIOWGtFxycP7mxDMJ9urq3BsaVyn3SxNv3sgrq2ey6oAwB4+
 jYfhQKkFLuJoZWc3Jht/et4a059CZechXWEFeV+a48uq324wucn+mBHOwi/Mq0sWS5KV
 F1zObypwaNEOZRwcwgIG1nmAHl3ZQgfFabtfL+l/sxQfJVJd48r/iE8ZMKzQqZ62bWTM
 WCdiYm2BvuFK3Oo2kUiLka9xu+MD8leHvcbbAdxGeaNZZ6Djhr5DZz/UDKeOxr0N2QAk
 Wia8xOcbOF2mWuUazNCGTG7x+AUnfUH9eOkT1rJAbNZB1X0UGHSLGl1LctxKXwkYSZM2
 FoFg==
X-Gm-Message-State: AOAM531vm/OEHjFDB49ASoHQXdcObyjl5a4RtK2cGcvYCh40D79s4wY2
 MOLC8u69cmjTYNlmzwxQU0XijhiEVEwBmw==
X-Google-Smtp-Source: ABdhPJzU5mlSxzNbztCjfG6iCAKfBEzxXNS/nA0qkMQkacj/Gq26k5L3bhNN+cENi6EXdSa5jBQntA==
X-Received: by 2002:a17:90a:b103:: with SMTP id
 z3mr7698111pjq.23.1641437115435; 
 Wed, 05 Jan 2022 18:45:15 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id gk13sm3834838pjb.43.2022.01.05.18.45.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jan 2022 18:45:14 -0800 (PST)
Subject: Re: Rational behind partial AVX support in Qemu
To: Stevie Lavern <stevie.lavern@gmail.com>, qemu-devel@nongnu.org
References: <CADV2EAtTPjHP=H7AMAdva7UjydjM5DwK=NDAm3HYM-MHeD9wyg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <49a5b6c6-8618-a9fc-2cec-ef60b8b59d62@linaro.org>
Date: Wed, 5 Jan 2022 18:45:13 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CADV2EAtTPjHP=H7AMAdva7UjydjM5DwK=NDAm3HYM-MHeD9wyg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1034
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.057,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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

On 1/5/22 9:09 AM, Stevie Lavern wrote:
> Hello,
> I'm currently testing various binaries under qemu linux user and went into a strange bug.
> 
> Here is the TLDR: is there a reason to allow VEX.L to be 1 when not supporting AVX 
> instructions?

There are some integer instructions that use vex encoding, e.g. andn, and we support some 
of those, thus any support for VEX at all.  But you're probably correct that we could 
usefully filter VEX.L = 1 early.


r~

