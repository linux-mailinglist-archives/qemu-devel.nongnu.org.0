Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D764B2D44C6
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 15:50:34 +0100 (CET)
Received: from localhost ([::1]:45230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn0nZ-0005lk-Sr
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 09:50:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kn0d7-0005qc-Ft
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 09:39:45 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:45827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kn0d5-0007aa-LX
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 09:39:45 -0500
Received: by mail-oi1-x244.google.com with SMTP id f132so1893035oib.12
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 06:39:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OxxJd0SmKDfvbG52DmHU2vthp5iSMq7dg/56j4uNZ04=;
 b=frdWpuieDuFMtUoBArF1h9mt9wOBekTvZ8InC7hseLGz0RV7Swvn7qIcqbKWnIG9Xw
 J1FuDDiupDBX1kRKIWuV9mb+Al0AK07pdCekwsJXk0puP+2ZM8CvAEvg1fFZCVA7X9+J
 7+k7OwTkItdTjVUz8Havr+2G4N5UeedpYFIuupENBVGlODtvUyksnPyFEvuHODxZf8IV
 NNuqXduVPTJb3XQuUGFSmagE3QYbl0Pgd9NwFyj1e3iVYUZtn6xUD1IqsVbWgdXAzULF
 +ReojVcCTzlmjR7K9qgR1LVdqNGm8J0lWjdrTr6vleQI7SMeYFdtEh8qfz7BU31e4iY6
 ehzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OxxJd0SmKDfvbG52DmHU2vthp5iSMq7dg/56j4uNZ04=;
 b=En8rvBlegMDjd/U8ICqFYWSDcrmui2mSxUaylKm49/lbJLAaeyuLWAeDKcPcdi2rS8
 MIf8SnA3i1//pfKI19vo3ik/yH0sDScV3huXdPlcfOl/5twSsvlZhWfks8KYIgIIYiCj
 aTWunkOqvjsluVi3gkyk8ERLte6GFCb9k4eLs78jCtwL5eAWFxBUrE1u4AmghtBGVQAT
 ZMka2VpbCktAsv76qzo9PrzLArrsFeAvtQgtKojvVCFZFAeR84AMCJRsrE/a36JkMW9Q
 7QftXkXa2HVBybFEhG6WpcZAE9ggjNEqPfOu4O1XdfJFhNdWIzB4Mr0VlsFZ0aSthTJ0
 RmYw==
X-Gm-Message-State: AOAM530L2mys4UF9c02vcpPyGIL+u/FBjmuDfoYFbhKgRN+OQq7nAuKw
 NJ+SatY8IGylOrIWFnSomVWcFA==
X-Google-Smtp-Source: ABdhPJwrrmKBn0k3DwqsEULVuWG0WvriS3+3HP80H9uCaRkLU6UvoQtUbh1JQUumjb96L/zV5uZH9Q==
X-Received: by 2002:aca:c1d6:: with SMTP id r205mr1921384oif.37.1607524781778; 
 Wed, 09 Dec 2020 06:39:41 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id n3sm411701otj.46.2020.12.09.06.39.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Dec 2020 06:39:41 -0800 (PST)
Subject: Re: [PATCH 11/13] target/mips: Convert Rel6 LDL/LDR/SDL/SDR opcodes
 to decodetree
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201208203704.243704-1-f4bug@amsat.org>
 <20201208203704.243704-12-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f7eb9d46-a171-f020-61e4-159e93cf5a34@linaro.org>
Date: Wed, 9 Dec 2020 08:39:38 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201208203704.243704-12-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::244;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x244.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/8/20 2:37 PM, Philippe Mathieu-Daudé wrote:
> LDL/LDR/SDL/SDR opcodes have been removed from the Release 6.
> Add a single decodetree entry for the opcodes, triggering
> Reserved Instruction if ever used.
> 
> Remove unreachable check_insn_opc_removed() calls.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/isa-mips64r6.decode | 6 ++++++
>  target/mips/translate.c         | 5 +----
>  2 files changed, 7 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

