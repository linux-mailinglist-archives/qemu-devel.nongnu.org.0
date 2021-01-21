Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E862FE2A2
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 07:22:31 +0100 (CET)
Received: from localhost ([::1]:58236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2TMT-0003kD-W0
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 01:22:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l2TLh-0003JX-U3
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 01:21:41 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:39681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l2TLe-0001H9-0N
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 01:21:40 -0500
Received: by mail-pl1-x630.google.com with SMTP id x18so707666pln.6
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 22:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/serqVZDmPOkL2q5vLvafLJdt0K7C80AiYDVfNsaoo8=;
 b=Nc2ES4XB9smYlUdvt6Xkes2MXqXlCgScWrADsWHb4RYwZjOywQr8fx85aEsZwPNBZY
 b2A1mhZfaWS7hqOK5DGNo0ZzH/qjasl9uAwPzSCqQgoT0SWg31iqp2C/pKewShyiluhQ
 egUDE2p3Q9JbaJjMcROAYEldj4JiiOqSU3X0DP/KxqC/kbMCut3aRI68l3jd5yFGhxEi
 G3qkF7TJyZymRtaV+B9U53bRaypdDStp/K8JzH9FATOZB+oTIi/ZqOC7BgFIent1eo4+
 5a5ZHTEoKEg6ChEJhzHdwEMqSULzDhqlDbNMjAxPfUNEsNoXFlhQluAhtrBBzZqxBj3H
 QiYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/serqVZDmPOkL2q5vLvafLJdt0K7C80AiYDVfNsaoo8=;
 b=hADL+T0xkcktLpBCWd2NKG/m6edMx4FoD8jDlpaeBgr6ciWDuTjNYqmlIzwFdpic2R
 ZpvudcP9SK08qWLo/+GFhW6Y1sYyp6+yQsKbFLzQNQpV3GvL+iGmfAS9SO9SCgrDH1ZH
 zN/dYM0HJdIKYtyDkshnuoH4fglHoWCIp8mFBY6hMZo+mPss4nYTCYzvhhRlvIW9urQu
 jl3OmVGveNDvRT/Bq7R3acltZfL/k+l3vZ8VdvvnJISJ4Kce58ernSW0JCxAMsBnAqtp
 YObE/qqjLzna7XB2auFzg9pD/NnvjG3DebyAZsu8bDsnZE9weoJNEcGDQ+Q+4byGUHt/
 4hXg==
X-Gm-Message-State: AOAM5335qPRcqO/ObHXHoQ2LBUfvPDTHT7C7UOjSAAjwm/fBTeVS3YZo
 5+KOCAQLxmAKTB0G+nFEqlBZhQ==
X-Google-Smtp-Source: ABdhPJy94/4uBMadOd8bpn/bQAXqlPXvofFg9xetC9btrXZUUKTwgJwmnH6uPGggpcUInTlUsgXM2A==
X-Received: by 2002:a17:90a:eb13:: with SMTP id
 j19mr9746267pjz.219.1611210096333; 
 Wed, 20 Jan 2021 22:21:36 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-75-72-126.hawaii.res.rr.com.
 [66.75.72.126])
 by smtp.gmail.com with ESMTPSA id gg6sm8917161pjb.2.2021.01.20.22.21.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Jan 2021 22:21:35 -0800 (PST)
Subject: Re: [PATCH 4/6] accel/tcg: Declare missing cpu_loop_exit*() stubs
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210117164813.4101761-1-f4bug@amsat.org>
 <20210117164813.4101761-5-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <43c60551-43e8-908e-e378-893ef1f1172b@linaro.org>
Date: Wed, 20 Jan 2021 20:21:28 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210117164813.4101761-5-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Riku Voipio <riku.voipio@iki.fi>,
 Eduardo Habkost <ehabkost@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/17/21 6:48 AM, Philippe Mathieu-Daudé wrote:
> cpu_loop_exit*() functions are declared in accel/tcg/cpu-exec-common.c,
> and are not available when TCG accelerator is not built. Add stubs so
> linking without TCG succeed.
> 
> Problematic files:
> 
> - hw/semihosting/console.c in qemu_semihosting_console_inc()
> - hw/ppc/spapr_hcall.c in h_confer()
> - hw/s390x/ipl.c in s390_ipl_reset_request()
> - hw/misc/mips_itu.c
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---

Queued to tcg-next.


r~

