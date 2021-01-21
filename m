Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D66C02FE247
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 07:07:37 +0100 (CET)
Received: from localhost ([::1]:54882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2T84-0001Na-Nv
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 01:07:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l2T7J-0000xD-1i
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 01:06:49 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:44348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l2T7H-0002ux-8z
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 01:06:48 -0500
Received: by mail-pl1-x62a.google.com with SMTP id r4so667644pls.11
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 22:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hsbDJ81D6ERxmcah81TETHd2genBie0zVhfU8lRH0TU=;
 b=EvaSeLe5dyn+Rny1vARQRTFpVjRhQVXkiroJU4xoRPHhWlzdm+iEUs7HjPHDUNmnoL
 /3ChMzA/l1e17GIvupuYdhlWI45om3Q97MexDEwHdL6JCHU9UuQ2yfh4DInybTBSbKR8
 g0ejKZlK4I+otWFJrqLQqYnh83T+Xahgmeji9Uza6nJLjn2AHOjT415A0ChvnUrAWN3Z
 PtSR0CSCfj1JziXVrFXVv446RSpeF9PpL/L/uNmen4MbZ+jE8vr96iDhU1nunibL6HKv
 2dRzEGbSCHEoW/tQe9W2M7I0uFzYZnMswWN0D+y47/GgvKHzthFqh5zUP2qLKRWgCZeg
 p6TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hsbDJ81D6ERxmcah81TETHd2genBie0zVhfU8lRH0TU=;
 b=Q0b8fnjMcsi9HVGnEkNdnkKvY/ze4aGbDbn/HqVLs4CUmf8gB6SJuN/tEpfnov7wIK
 XtJ7CTASLcWGTT5Z4zpVtXDecqidlRYq0V5E0nEGdRShFoh/ORYcmumWdoA0q9LU3M6V
 pFQFeAHbmHEsfnvvaWulMMl6MsfSum4filCnufjIgn5411pDEqrA3tNZGo2nb+C5XM0+
 R+QDULwI6I+7/CPWZpkt4k+/Lk4P9cLVN38VsaVmLGkrb33Yq2pDch3/Vrpw2bjB6RZW
 MqBIQfbYh5xg5i+XEeOnKOviYECWsY9REXobYrsN7E+lnTtgOGOP0+RNftT9zATPV2Dt
 WHeA==
X-Gm-Message-State: AOAM532Jcs4zvrifadxqnDNhZgMDIAQFdI5ct4GpRB6osUQYJ6Ld2H/W
 qwmctBISjPEKvU6HCGm7Tn3J6w==
X-Google-Smtp-Source: ABdhPJw6uPFVWB7WYR1alK1r9L+znGRNcEPnSsE+c+Sm8w1cnItU1LSl+HXvYiKrVzsJFGKYc0PdBg==
X-Received: by 2002:a17:90a:c68d:: with SMTP id
 n13mr10076230pjt.71.1611209205560; 
 Wed, 20 Jan 2021 22:06:45 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-75-72-126.hawaii.res.rr.com.
 [66.75.72.126])
 by smtp.gmail.com with ESMTPSA id me5sm4023313pjb.19.2021.01.20.22.06.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Jan 2021 22:06:44 -0800 (PST)
Subject: Re: [PATCH 3/6] accel/tcg: Restrict tb_gen_code() from other
 accelerators
To: Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210117164813.4101761-1-f4bug@amsat.org>
 <20210117164813.4101761-4-f4bug@amsat.org>
 <7359d7bd-ed7d-71ad-3610-b839c9c99fd5@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d9e691d9-9e87-6a47-c06d-ce2376f370f8@linaro.org>
Date: Wed, 20 Jan 2021 20:06:33 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <7359d7bd-ed7d-71ad-3610-b839c9c99fd5@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/17/21 11:12 PM, Claudio Fontana wrote:
> On 1/17/21 5:48 PM, Philippe Mathieu-Daudé wrote:
>> tb_gen_code() is only called within TCG accelerator,
>> declare it locally.
> 
> Is this used only in accel/tcg/cpu-exec.c ? Should it be a static function there?

Possibly, but there's a *lot* of code that would have to be moved.  For now,
queuing a slightly modified version of the patch.

>> --- a/accel/tcg/user-exec.c
>> +++ b/accel/tcg/user-exec.c
>> @@ -28,6 +28,7 @@
>>  #include "qemu/atomic128.h"
>>  #include "trace/trace-root.h"
>>  #include "trace/mem.h"
>> +#include "internal.h"

Not needed by this patch.


r~

