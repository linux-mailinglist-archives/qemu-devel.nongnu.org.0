Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D18F6C2A26
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 07:04:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peV6W-00077D-9f; Tue, 21 Mar 2023 02:04:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1peV6U-000772-Ao
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 02:04:14 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1peV6S-0001xT-UQ
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 02:04:14 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 e15-20020a17090ac20f00b0023d1b009f52so19108824pjt.2
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 23:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679378651;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hzbDJl66CBQbYGOo/GigoMQScWqjIQRa1eGjJugSDn4=;
 b=iC4AvJX6nzXXuHJOTu/AwzWccQlEL8p1G7CneJ3iu7gqH391HoYdHh4PHLwC60LdB6
 mbTAAmvEFLsKzzRqIWeoIpOeHbCudmGs+yGxTQZA3jvPLUljALbcHonA7G25G3femuUx
 8/anJ2E3C/ETPYfaZM5qDns14+u3UMsdfVODvRqTy9vdbpVqrjY+2WDVlPz/3NCXet7A
 dyJv6BHO0wQER2TBi1IPhPF6zCKBgJvKEIxdSHkjsQlMV4WOOo+VuzvRjbsXMnAqQfi2
 U5mBds7XesT85mfHYD2MDTFZKARQnXp5RUQZcNDxnA7C2pq3QUINzTP7CxyPKTDnPQF5
 A00Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679378651;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hzbDJl66CBQbYGOo/GigoMQScWqjIQRa1eGjJugSDn4=;
 b=mWyMwetzAZK3fJu3ZjgOJIxTqg+4TASBmIrsGs8HX+/cvQaibzNEqqUprirkaghBwV
 T/gLLaxnxD/aiLb2g022M7bbIqZEAn+USYGJJkbcQplIeTP8/7+FQSjPAQ7tK5vJcmCP
 M+vPaeAwLQ2fmnbfA3NpD/6LkZu+mjOx1WLCU2plJGN9ybNnoI3KDNA/FZctdTIyge6X
 WoUnjflmZdCd0q5eWiJeZDvBVIWvfhlSRH8Yc+ArL2FoYeVQ9vEcehe+yLV3IRNap8cU
 2qJgmJBRa5AmwF4KtU5kJiUalyscaj5sre3cTk9AWTzkUy1ihxxVsva8mVypNbzxe8ci
 vxiQ==
X-Gm-Message-State: AO0yUKUJRR9/l4TRukpe7bvIW5ecc9wkQR9t5FED3v+ejt4668aWY+9g
 glmZdfoSl6aNPzAhfS4at039EA==
X-Google-Smtp-Source: AK7set+6QK0NdkS8OZpHcnmyD5IoBVVlAaDxFtG8TpBLqanW4W1XX4OHhGkJZ+yGycIZMhajiXD4ew==
X-Received: by 2002:a17:902:da8a:b0:19e:b38c:860b with SMTP id
 j10-20020a170902da8a00b0019eb38c860bmr1393475plx.24.1679378651324; 
 Mon, 20 Mar 2023 23:04:11 -0700 (PDT)
Received: from [192.168.149.130] (097-090-106-114.biz.spectrum.com.
 [97.90.106.114]) by smtp.gmail.com with ESMTPSA id
 f21-20020a170902ab9500b001a076568da9sm7704308plr.216.2023.03.20.23.04.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Mar 2023 23:04:10 -0700 (PDT)
Message-ID: <ce58f200-3b80-ba7e-19e1-96ca5526e400@linaro.org>
Date: Mon, 20 Mar 2023 23:04:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 08/10] accel/tcg: push i386 specific hacks into
 handle_cpu_interrupt callback
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Alessandro Di Federico <ale@rev.ng>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
References: <20230320101035.2214196-1-alex.bennee@linaro.org>
 <20230320101035.2214196-9-alex.bennee@linaro.org>
 <c49afab1-9842-e90e-7d1b-69b849b1e63e@linaro.org> <87mt47738o.fsf@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87mt47738o.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 3/20/23 10:14, Alex Bennée wrote:
>> This should be a tcg hook, not a sysemu hook, per the previous one.
>> I would very much like it to never be NULL, but instead your new
>> common_cpu_handle_interrupt function.
> 
> I was trying to figure out how to instantiate a default but ran into
> const problems eventually forcing me to give up.

You initialize it for each instance individually, not in one central place.

> Why a TCG hook? Do we not process any interrupts for KVM or HVF?

No.


r~


