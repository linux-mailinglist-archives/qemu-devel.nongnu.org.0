Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2BC7394CE1
	for <lists+qemu-devel@lfdr.de>; Sat, 29 May 2021 17:22:43 +0200 (CEST)
Received: from localhost ([::1]:44350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ln0nS-000151-HK
	for lists+qemu-devel@lfdr.de; Sat, 29 May 2021 11:22:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ln0mE-0000JY-L9
 for qemu-devel@nongnu.org; Sat, 29 May 2021 11:21:26 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:40685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ln0mC-0006T3-Ix
 for qemu-devel@nongnu.org; Sat, 29 May 2021 11:21:26 -0400
Received: by mail-pg1-x52e.google.com with SMTP id j12so4839755pgh.7
 for <qemu-devel@nongnu.org>; Sat, 29 May 2021 08:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hnPJimmtElNEw+nJONxHKQKFJTs3jXwjUlM3ML/8H4I=;
 b=hEaXVOsGxQqyc7wFQ8m76uDJWQu+UTGFgV0ljXRDo3CHA08m2Y0rxkPy3RlvGVJYxM
 u7CNDVU3ds8fk8951Xdn0Bz5erzXENJWXF+GYDeflHYZSxA/nf7KkatUOrilLIugYKL7
 b74u7AMNHxA/I/eIw9MdoZwhN5f42DK9Ii1bM5fxyGpWwH2tXEtqRlNwIiR4EVX5jCk+
 0P/HJaZJyVm+eWSVjdTDW7aWou/PtJXE5wKjbAXVWDbo5XX0FgW+USL0vCYU8AUVJE/t
 G7ly+xSL7r064e2SWukwtWZ3DkUjRYjEsTGBcdVwat3f131zqL7ZQL+vUpF50aUTt7vZ
 5FDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hnPJimmtElNEw+nJONxHKQKFJTs3jXwjUlM3ML/8H4I=;
 b=KQ9ZadMmb0axzkP1nJP7xCSg0bPNhYfAPQi2UecG0jYuZ03KgLeBNL1hQZ6mVBOZNq
 mRu39+N52SfCGCKA03fi5DoN3HW8oZad4CaISyFLihVdydvmmjVoB6HJMUSnnwc7dQkU
 MWteb2wgjPdrMqj0818RGFidvgmONqQOadBWg5TSnL0nSeHsbULF2+Uy+PgU2jBjT/hP
 s8o0vgcNiI1qriogQmFXWYNfNhvSHLPhFC+o7iIel/0dGSIOjUuh3NOUnlwEkNUcDUQQ
 O7SWkGc8gfyZXoR/wgF78KP5ObuXnH0tVP4UbTerx1+9dgHCXoijXUMOikLSunvZOXQ0
 tQdg==
X-Gm-Message-State: AOAM531AsaBblsYzVK1Yx3z9TFIACkixN/8rhAUIodzoQLqhbDYWAsfv
 1PMmZVffvEZDzum0G+TvqvjsEg==
X-Google-Smtp-Source: ABdhPJyZ/2qTV9fwHcobpc7Zcr8YY5LmTtCq58PoE2jjOC0Ve6uaBCnobcMPaH2sxco0FZJRqvO/aA==
X-Received: by 2002:a65:4d03:: with SMTP id i3mr14392055pgt.422.1622301682386; 
 Sat, 29 May 2021 08:21:22 -0700 (PDT)
Received: from [192.168.172.34] (50-78-183-178-static.hfc.comcastbusiness.net.
 [50.78.183.178])
 by smtp.gmail.com with ESMTPSA id y24sm6900740pfn.81.2021.05.29.08.21.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 May 2021 08:21:22 -0700 (PDT)
Subject: Re: [PATCH 03/11] softfloat: Introduce float_flag_inorm_denormal
To: Michael Morrell <mmorrell@tachyum.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20210527041405.391567-1-richard.henderson@linaro.org>
 <20210527041405.391567-4-richard.henderson@linaro.org>
 <44a76e8c6504461cbd4dc5752f0d443b@tachyum.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c46f86e5-ab9e-1f64-f01d-7ec98413f1c5@linaro.org>
Date: Sat, 29 May 2021 08:21:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <44a76e8c6504461cbd4dc5752f0d443b@tachyum.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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
Cc: "alex.bennee@linaro.org" <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/28/21 10:41 AM, Michael Morrell wrote:
> I'm probably missing something, but why do we need both "float_flag_inorm_denormal" and "float_flag_iflush_denormal"?
> 
> Couldn't the code that sets these flags set just a single flag for all denormal inputs and the code that checks these flags check that single flag
> combined with the "flush_inputs_to_zero" flag to accomplish what the two separate "input denormal" flags do?

The thing that you're missing is that many guests leave the accumulated 
softfloat exceptions in the float_status structure until the guest FPSCR 
register is read. Unless the guest needs to raise an exception immediately, 
there's no reason to do otherwise.

With this setup, you have no temporal connection between "any denormal" and 
"flush-to-zero is set", thus two flags.


r~

