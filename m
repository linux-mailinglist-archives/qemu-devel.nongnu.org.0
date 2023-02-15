Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2B66986BB
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 22:01:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSOso-0002JX-W9; Wed, 15 Feb 2023 16:00:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSOsm-0002J1-W4
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 16:00:05 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSOsk-0000Zc-M5
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 16:00:04 -0500
Received: by mail-pl1-x632.google.com with SMTP id e12so4020197plh.6
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 13:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kXfNLAq/lYJ0P453l5GMAA0+bIud6KHBIrzyz35BDns=;
 b=MHc8NCMtHlWNj5qwOESX1v52ps9uNXZmhjcfh9lOb4cu0uALKoJPmZRCnJGF+yKxB9
 S6zzrC5ItoFzNhDL82SWdn63Z47cMlRbyxHox4lGsZemrfkv3SmD54QVwlRkrEtmgV0t
 3NVbLIKg5Hr1DaP1xYucNmeeY+ck6otWGrY8S3BTZ3uogF2HB2KUtT56g68QR/6jBKvt
 yrSn+TCeFAIRolxDHJjVgoLv88i0dXOkusYevTMHfPhL+MXCNPEOSuvH5rm9PVvHXpuf
 lVb1F4aUkLskH+/L9RmBuItf5mEl/F341/yhWwbM/CtvrmtPBpL+V+jaYnbOYC+yGDir
 UN8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kXfNLAq/lYJ0P453l5GMAA0+bIud6KHBIrzyz35BDns=;
 b=MiNEairN5bcQN63FZAJGijzBzj4Md/SnONW4dj6Ugu03RelIp1qTmFP7BJ2S+WQUl5
 B89QUvgi7gHmDOqpDWx3sxpgtMGfgs0A0pygWYY6MyqgdaxQbIXo1mkvxSKuf71PLDqI
 my8udy0xUbPLFyor1EhrxRbCcUrjluDcyJIlKge7gjxhbzEp6bULfIr73gQ6an+P00kq
 Z+KWsjOy6VA/QICuljvTYvYbx++IRIZekvDtTpHzuWhVozda+Y8KCWK3znKuIoR/oEK1
 GR/ljgupcjvYa4K+3jJhFijJ5x0Hbz7w1XImL8G/u8Q539Gfv1AffmbcIYEtXBn7zJym
 fdLg==
X-Gm-Message-State: AO0yUKV8ntBpp+26+kuXGcCSIH0oX6hU1sw+qGR/lzV5zbKYWNLe13F4
 6PpdqE/izU8O1FdqEZWcJQmy6w==
X-Google-Smtp-Source: AK7set+Yp1QTUMuYBve9pOnpGokC7Lj7ux3WT7oc5mGnr1/PaDZEPVEoR5jIEoXkKRoqyU8xBbprxA==
X-Received: by 2002:a17:90b:1bcb:b0:234:1f57:ecb1 with SMTP id
 oa11-20020a17090b1bcb00b002341f57ecb1mr4230065pjb.40.1676494801056; 
 Wed, 15 Feb 2023 13:00:01 -0800 (PST)
Received: from [192.168.192.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 y12-20020a17090a1f4c00b00230c8484fbfsm1862913pjy.55.2023.02.15.12.59.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 13:00:00 -0800 (PST)
Message-ID: <cb2e92b7-40bb-4975-290d-6321c5574365@linaro.org>
Date: Wed, 15 Feb 2023 10:59:55 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 08/12] tests: skip the nios2 replay_kernel test
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>
References: <20230215192530.299263-1-alex.bennee@linaro.org>
 <20230215192530.299263-9-alex.bennee@linaro.org>
 <534be66c-bd70-a4e9-0e30-6892d7b0c8bd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <534be66c-bd70-a4e9-0e30-6892d7b0c8bd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2/15/23 10:47, Philippe Mathieu-Daudé wrote:
>> +    @skip("nios2 emulation is buggy under record/replay")
> 
> It will be hard to notice the flakyness got improved. What about:
> 
>         @skipUnless(os.getenv('AVOCADO_RUN_FLAKY_TESTS'), 'Flaky test')
> 
>>       def test_nios2_10m50(self):
>>           """
>>           :avocado: tags=arch:nios2

It'll be hard for there to be any improvement without an active maintainer.

Last patch from any of the listed maintainers was:

commit ebedf0f9cd46b617df331eecc857c379d574ac62
Author: Marek Vasut <marex@denx.de>
Date:   Fri Mar 17 22:06:27 2017 +0100

     nios2: iic: Convert CPU prop to qom link

It's probably time to demote "Maintained" to "Orphan".


r~

