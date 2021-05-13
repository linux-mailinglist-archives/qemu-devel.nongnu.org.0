Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18FB737F83A
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 14:55:11 +0200 (CEST)
Received: from localhost ([::1]:49720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhAru-0007Da-4A
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 08:55:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhAcG-0004mS-Dp
 for qemu-devel@nongnu.org; Thu, 13 May 2021 08:39:00 -0400
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c]:37487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhAcE-0002yx-Ob
 for qemu-devel@nongnu.org; Thu, 13 May 2021 08:39:00 -0400
Received: by mail-qt1-x82c.google.com with SMTP id g13so19583886qts.4
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 05:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HdVZT0tN/ng7LHwVrdopXJ0PgNK5QRV0FbUdrjMhaQM=;
 b=JVBFGbqpO4CNAMCviggyiitktcvnjlSAFe6mYndQttiI2Q7xfBSwHzWy2Zku2mDSdo
 tWlhvopYFMX1WKUVhVGGsrlhxNeuD2UrUJVvoH2JaKJgB9eUSdZb4Pbz9BlW80Rux5ZY
 uoTt8np2dWvd9YBG9ThfGyqnFlycZ/pgpCxFH2uMX0FEEyIGL2K6ZIF28/PiG6jbkdOu
 FJEVkplGx+SWZx9axC2IuwZw8u5yd9aZ/GVo+wJIXM5AdYuITFn/B9dTOQf8h72KScJz
 7ORx0zRtwAOGlqcWRDXcgHQC9Fe2UArccV8L7ReroX6ASzO7Ylbj2MLBSkkSvG7LG8GU
 Ovnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HdVZT0tN/ng7LHwVrdopXJ0PgNK5QRV0FbUdrjMhaQM=;
 b=uWtfo86A6MYWTneYdsvJJiahRooZSpvTc1viIkhtIC07Ix+m5B0J9romtWvKlPJrco
 +cRqv5ZTaJCfIFKIAxBdyX4gEFc1CEPAylRcUWqAqzydAJ3Wyr+ihFI1kQMFQSJmLlcI
 CkkEon2zEOSv+hpmrP4uFp/dYr50ZAamuDYywaXDIkgTl4ieiAGxNgbQpTXSy0/BsT5v
 UReuFTmxvRxWp1a7Lh6DgQYbJRGaqfkyMNfPn+fBEZa5bP0A2TmIaxuYnT9QZuiRDPaA
 KGL+x/RC45Kwf27DtYXI0RPDmDAniAEFEHmfeg9Jqnm/9ABoMtTwqa2NxFhkP0fLGXV1
 Sv5w==
X-Gm-Message-State: AOAM532G1FAdQdCElV3p4tlzLKZKUfbfKgzmZ6f6iLIxsqQ+RoROMR0g
 1fNCdFRuhWZDgedoZMy9TVBLTA==
X-Google-Smtp-Source: ABdhPJyHV49bK33KnEzV0kkHjbsKYYPLkaS1E5k+oXFmD50h6R4E7oe7bZuaAvmtCuC4IODjLCZBOg==
X-Received: by 2002:ac8:47c7:: with SMTP id d7mr2477411qtr.226.1620909537674; 
 Thu, 13 May 2021 05:38:57 -0700 (PDT)
Received: from [192.168.183.155] (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id n15sm2216453qti.51.2021.05.13.05.38.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 May 2021 05:38:57 -0700 (PDT)
Subject: Re: [PATCH 33/72] softfloat: Use uadd64_carry, usub64_borrow in
 softfloat-macros.h
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210508014802.892561-1-richard.henderson@linaro.org>
 <20210508014802.892561-34-richard.henderson@linaro.org>
 <87r1ibdk9q.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a2bd7be8-0baf-b12c-3f1d-6879afd2a186@linaro.org>
Date: Thu, 13 May 2021 07:38:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87r1ibdk9q.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82c;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82c.google.com
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
Cc: qemu-devel@nongnu.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/13/21 5:00 AM, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> Use compiler support for carry arithmetic.
> 
> Didn't we have a series that attempted to take advantage of compiler
> support for Int128? Is the compiler end up smart enough to use 128 bit
> wide ops if it can?

That was one of the iterations of this patch set, yes.  In the end it turned 
out to be easier to be able to address frac_hi and frac_lo directly.

It's likely that this choice would have been different if we didn't have to 
deal with 32-bit hosts and could rely on the compiler having the 128-bit type.


r~

