Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BE11C975B
	for <lists+qemu-devel@lfdr.de>; Thu,  7 May 2020 19:22:55 +0200 (CEST)
Received: from localhost ([::1]:50912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jWkEY-0001aM-Ns
	for lists+qemu-devel@lfdr.de; Thu, 07 May 2020 13:22:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jWkDZ-00012H-PR
 for qemu-devel@nongnu.org; Thu, 07 May 2020 13:21:53 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:35942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jWkDY-0000s8-Ct
 for qemu-devel@nongnu.org; Thu, 07 May 2020 13:21:53 -0400
Received: by mail-pl1-x643.google.com with SMTP id f15so2328815plr.3
 for <qemu-devel@nongnu.org>; Thu, 07 May 2020 10:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ulSyMp4EIU3gDaVpU/Mkn+qgo3SasFIAm925Us26U+4=;
 b=eF+k8nJhAqmKySLocqycWPbuJV9VbxfUKJDMBvSb3IrHJnif0u1Ga+wkqbr3nh5U6+
 Rj8B+nhGMP5X4UeeYqxRCP4xT2BA5v5Vxa7GpTI9qMfFplH6GpP+N/tBZL6t7RjS5WbA
 Fj81KcrSW5EUPNGemwyFmRZZJSZjV/X2YGKShUbS5FcW4OYTLx+meTZRDD4FPJuou3re
 ulwLjBGhxpct4WIpWsFFmrXIsWkYUC07W2TEyHU43f60WIH41wJ0lgJf1n3Cl40zfcJe
 4mj2ixhp//lBethWqH9Hhx9ks1thk43ooUn+uWvXUdgPMgPi+wp4rZZkSUpyvR3LBGvE
 4Oog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ulSyMp4EIU3gDaVpU/Mkn+qgo3SasFIAm925Us26U+4=;
 b=Y+wKXe5x88DyBgVgiLOpYDz6w4QmTTzgWiByrUNY+/hydyDk8CT7irWVcEyUonbYsm
 0V3Xrsy6uIvZzYTAWOnI8Hn2n5AEGaPHUtZYmLnCR8nLVP4JF7TL+kS6Lq5N66k6zr6N
 IUntDzJeIm5KHP+mooBiT04LXYj4Q3ryKQeFEbX21EnZrsAY/ilBOPM8HjfXWeW9eB+S
 un8up/GZhy+/CNHbkC8XZvECbx8ZxCfdDqGLeAacuLKz4En3OyrTcMnhgpxvnzgquLmD
 cYSdqbKyKylOBFCDZr2VKHVE2oUVSvrbBQsCQfwpNqBQhhtEvwyja8QBP8xDAADHw0A4
 RWxA==
X-Gm-Message-State: AGi0PuYfgHuLcw/L6gEc1WS7amYQjxH6onjmZCizj4l0GLbcizIaXSp3
 4qr3dZVNq9x7CqASg4UjWtyJNQ==
X-Google-Smtp-Source: APiQypIfME1t6A1JbP2mFqNgXRbBXOePHRzez5RP+F1n/9KRHVCV3AO6vkYLrNr4OXhRfe4LfZi3gA==
X-Received: by 2002:a17:90a:930c:: with SMTP id
 p12mr1338023pjo.64.1588872110399; 
 Thu, 07 May 2020 10:21:50 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id x195sm5612826pfc.0.2020.05.07.10.21.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 May 2020 10:21:49 -0700 (PDT)
Subject: Re: tst-arm-mte bug: PSTATE.TCO is cleared on exceptions
To: Szabolcs Nagy <szabolcs.nagy@arm.com>
References: <20200420102902.GE15401@arm.com>
 <a36c670a-5cef-f8c6-ce1d-4fbb28f9488d@linaro.org>
 <ec85fd40-229b-c965-1f58-d4cbe825419c@linaro.org>
 <20200506125709.GK23080@arm.com> <20200507095902.GA30635@arm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5d0ae4c0-70a8-255c-9493-ca8b65e572fb@linaro.org>
Date: Thu, 7 May 2020 10:21:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200507095902.GA30635@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: nd@arm.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/7/20 2:59 AM, Szabolcs Nagy wrote:
> is there some recommended way to turn some form
> of tracing on in qemu before i execute the
> problematic application?

I didn't add any tracing within mte.  I can do so if we can guess what we're
looking for.

> or is it better if i try to extract a reproducer?
> (that does not use the network)

A reproducer would be most helpful.

Something that can help is saving a VM snapshot with the kernel booted and the
user logged in, just ready to run the test program.  Then you can get back to
exactly the state you want before things go wrong, even with a different qemu
build.


r~

