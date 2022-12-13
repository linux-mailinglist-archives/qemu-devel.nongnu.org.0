Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5A564B95E
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 17:15:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p57v1-0002cc-1k; Tue, 13 Dec 2022 11:14:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p57uz-0002Z0-7U
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 11:14:09 -0500
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p57uw-00027R-EG
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 11:14:08 -0500
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-1433ef3b61fso13098849fac.10
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 08:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bx3gvvxquDG0WETn4rNxwFl2aDUBFfAaazwHUoEDsJY=;
 b=G0UqSb76a7VwjTy/kL1NJj45higodz0AgUD3qFzPa3gy4dr5k+ox60yQqziqZs1Id3
 Qh7HbvDZ7SLiHysWKHFISIp9/eL7QqjpXwH/vCpxaX2lw8C98h+j2X0bRJj9m4NpH6yd
 qKQdX2FiT39f9tB81Lgn88gJyhC0JVAxSu5KdzQbmwjJH1VyEnyGMXNAFtzqRUyA8fn6
 7jzpOaef+jquMYTPQ3pNaGoJWUHKDT5vBBsgsAqyp1xoWXu3P16bUtmJip+MxDCCpVcu
 nmHWQl9GtGl4kGOZFxgdXVs66P7UXnPOEQkHBiDXviasXPHu7EbWK8mWN2E+XLx4GvlQ
 OCcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bx3gvvxquDG0WETn4rNxwFl2aDUBFfAaazwHUoEDsJY=;
 b=wJsHkB7YB+TrALHePauTsunKJlYkmdW7V+tLvL5XLBcABkhBp5gy44gWu2Y+seUzuB
 WWGNc6v3yvDUOefXfi692+diZQQmGloHWU9i6E940++efHZZM4+2uTbdLIFEsTNypHGf
 2fJ6t6cKm/5efL0BSiuee4wC+tgfwdG9qVVv2ZM0dIKBhcWFAwmGeIqxcUFpDRpSwwtt
 pQxEMQfkloqUIC2CVh0W4Rkq+SNiK0sPEEIzy6YTMq6CG/cby9eJZhj3/L6m9MooxVH8
 OzCphaaPmj3MWDEk0QuxhSAlhTUlAoUPTtXXGJwSZQ0l18T6Hcrv4cld5mFz/YKSglX7
 zSrw==
X-Gm-Message-State: ANoB5pmujTQ+tdShy4OlscmJejKXhsvJBiMvp8bN2Rv2zS+fAr64RSz1
 /eiWTeFFa7mB8xc2nL10CVl8hg==
X-Google-Smtp-Source: AA0mqf4NmvumqoYQuJygyaXz4rofq7vh2BUE6JLG8DTzr0P09Tg3awssyVkCH0l1MSliw8j/cT/3TQ==
X-Received: by 2002:a05:6870:f604:b0:148:6592:a6d with SMTP id
 ek4-20020a056870f60400b0014865920a6dmr3279919oab.4.1670948044782; 
 Tue, 13 Dec 2022 08:14:04 -0800 (PST)
Received: from ?IPV6:2806:102e:18:2efc:c63:85ed:4256:8ad0?
 ([2806:102e:18:2efc:c63:85ed:4256:8ad0])
 by smtp.gmail.com with ESMTPSA id
 eq37-20020a056870a92500b0010d7242b623sm1599784oab.21.2022.12.13.08.14.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Dec 2022 08:14:04 -0800 (PST)
Message-ID: <a1f4b5a6-0a8a-5a04-8ab6-f3f08b9d36aa@linaro.org>
Date: Tue, 13 Dec 2022 10:14:01 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH-for-8.0 1/3] hw/ppc: Replace tswap32() by const_le32()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Alistair Francis <alistair@alistair23.me>,
 David Gibson <david@gibson.dropbear.id.au>, Jason Wang
 <jasowang@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc@nongnu.org
References: <20221213125218.39868-1-philmd@linaro.org>
 <20221213125218.39868-2-philmd@linaro.org>
 <8d47b826-2011-3203-c682-aa32a76b8dc2@linaro.org>
 <d73fe725-565e-7fcb-e7d3-846189459545@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <d73fe725-565e-7fcb-e7d3-846189459545@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 12/13/22 10:10, Philippe Mathieu-Daudé wrote:
> On 13/12/22 17:00, Richard Henderson wrote:
>> On 12/13/22 06:52, Philippe Mathieu-Daudé wrote:
>>> Assuming the developers of commits 2c50e26efd ("powerpc: Add
>>> a virtex5 ml507 refdesign board") and 4b387f9ee1 ("ppc: Add
>>> aCube Sam460ex board") were testing on a little-endian setup,
>>> they meant to use const_le32() instead of tswap32() here,
>>> since tswap32() depends on the host endianness.
>>
>> tswap depends on target endianness.
> 
> Yes, it depends on both host/target endianness. What I meant
> is we shouldn't have system code depending on host endianness.

It compares host vs target endianness, to determine if a swap is needed.  But the real 
dependency is target endianness.


r~

