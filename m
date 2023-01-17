Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE0A66E392
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 17:30:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHopx-00047T-FB; Tue, 17 Jan 2023 11:29:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHopv-00046d-Bv
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 11:29:23 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHopt-0006EZ-Qu
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 11:29:23 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 j34-20020a05600c1c2200b003da1b054057so10516828wms.5
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 08:29:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8MX19P6jeQr9byWhI+kpLj7E59PsC9QOZctgmyipVPM=;
 b=GaoaYH3gSTdsV4HZG2XrCKgwP1l3T+klcVxz0driAJUiU60Z4QVZwu4vvbBdKDQLYb
 KkUp+oiqBBUAGBRhd1CEANeNYD2c9QMCUyjXy9Dw960EHMDLoy0VEe7tF4ROiH623FHu
 MTkhUdyP/I3RHvRandhXmHHlNFYvnnHr/ZuAfQdt1E4sIdcdpg+sktZVj+OaMWI77tiG
 rzXlcSV8uF3WPBWWTJibIKcsEFJpOsMjPnCijAjSBH99xYI1VCc91bUZoC0bnuw1xCLC
 YeXoBExUnJ5+zMnx2Sienv49JY/Uy92D/wngJnWD1TRaCjv2B+kpO50j6PxvLqrsRsJx
 XsmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8MX19P6jeQr9byWhI+kpLj7E59PsC9QOZctgmyipVPM=;
 b=FcNT6WAdCAatM8krgdA/bIr9QqIWwoHX11ToAH6y4/UGebp3tU9/pD7/RQUGQxWKsF
 psMrEfB6Ng7NrxLkn+KdKqPduH8iQ0umGcFnp+k0iZ8pzcP96i5HEf69W7/DRPLXi7wh
 Vrt6Cwq0T8zJXHRmUsh4K2bUHb47ussX2/Z0jWFpr7I8IHQj4pwDo4sb6TJeOsF5qFs1
 WiPbNptXEi4hUtRetXEFFG4ILIh2tsnw8Jkp5mKGTKNVN7uR7D9olNuqxZsLJ+OcotVx
 fXForexfEaRr2OO8FUq6q6KAIK9eEZ32aE89a4Qkhp2HDLuVMOH5J9fAZJYSTGKREDJb
 Wr0w==
X-Gm-Message-State: AFqh2kr/hgTaQoFrtbzfuexjVC/qOXqaaNsgkZ5AC8RWnixwnlGmXq2o
 NCh0ii4mpDLgqbP4mXly1R+K+Q==
X-Google-Smtp-Source: AMrXdXuJ16L1R8HIlXJOrq/6kAZAI8SlYr+yyqo75aDgEAqSqnMBRe13n7Z1zAWM/+KJaT5LMhuvDw==
X-Received: by 2002:a05:600c:4a2a:b0:3d9:f37e:2acb with SMTP id
 c42-20020a05600c4a2a00b003d9f37e2acbmr12361291wmp.20.1673972960136; 
 Tue, 17 Jan 2023 08:29:20 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 j20-20020a05600c1c1400b003daf89e01d3sm8900993wms.11.2023.01.17.08.29.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 08:29:19 -0800 (PST)
Message-ID: <06ec19da-b2f6-b3bb-7796-09e3793cc1cf@linaro.org>
Date: Tue, 17 Jan 2023 17:29:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC PATCH v3 16/28] cpu-defs.h: Expose CPUTLBEntryFull to
 non-TCG code
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20230113140419.4013-1-farosas@suse.de>
 <20230113140419.4013-17-farosas@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230113140419.4013-17-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
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

On 13/1/23 15:04, Fabiano Rosas wrote:
> This struct has no dependencies on TCG code and it is being used in
> target/arm/ptw.c to simplify the passing around of page table walk
> results. Those routines can be reached by KVM code via the gdbstub
> breakpoint code, so take the structure out of CONFIG_TCG to make it
> visible when building with --disable-tcg.
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/exec/cpu-defs.h | 6 ++++++
>   1 file changed, 6 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



