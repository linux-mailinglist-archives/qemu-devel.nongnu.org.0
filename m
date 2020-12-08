Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1D22D3655
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 23:35:33 +0100 (CET)
Received: from localhost ([::1]:52736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmla0-00087q-09
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 17:35:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmlSY-0003Ot-Kz
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 17:27:50 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:33540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmlSM-0002dr-FV
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 17:27:50 -0500
Received: by mail-oi1-x244.google.com with SMTP id d27so309420oic.0
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 14:27:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PpdHVvN0917X0EkRatA5q7S42TNEsvXRuKK3u2DR4V8=;
 b=fWsXa5jWNH9c0FhcbpUah3BECEsh9RGuSwtM4I1HyHNvbt3DSRed/E8S83S74ezLtO
 onf6R5T8h3t8ND74Z7McSA4hDKiOKswqrMvPF2uO+cReYTnho6d1ZCIleqXDtAea2nbN
 lJyqj1PgoGv999Q0VQ29z7pQNrhFOz71Q8BXF0B6AZpR/R5t1CxzpgtsgBNxGD/XxoVb
 wwFjPZWBVRN2EJWBa+lnKcGmICzkPaXTFlapTzHyl/aJRfLHwVCms0fk7rbyZjdXGbIX
 QE9xJL81fA0rZ/i4HW9+H1NcdtKiSpdabfX0Qn1Q8yDFDbc1+5W1Vch0yrnLqpsnA/1B
 UC6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PpdHVvN0917X0EkRatA5q7S42TNEsvXRuKK3u2DR4V8=;
 b=lwhLEPRHgaUUUrFTtEcAtltN30+xYTiB8qBl2r1etr55xPjzYI4/ViLMPz5NeIbjde
 iT77UqKD0YUOL0Kp3mYI2kUH4reP960RJ63uiQe/tGB4LMDgmZtaN9BYW2ZJDkBnzaXo
 VCcMtuSBOmg0XUGdyjmka6Xa9vFdrqR2QEK+xoBc22LLJAtRcyjdq0fdwWEG0xmac5FY
 brRPT+oninw2sZWF0e/4md02nCZXgZ0JDfxblpJBlawZlZXrMqPgIyjj1tj5wXcSNgSg
 9JIKvjOKqWBEWHab7jtTvDncWJLyaiZsOOm9vFsegu0LLtH1wDV37TpfvBnHljlo9Cu1
 v1+A==
X-Gm-Message-State: AOAM533Yu5A2GEynEl6+BkWfGjAB6EFnVthuIZfpIWd4gWxACSZHn4CH
 U6c2xjOIujzBWrjQUzIRrh+DVA==
X-Google-Smtp-Source: ABdhPJz8JSX+vMl1+W7sDBkNvPc52zfUwgDw3SlUzJZMmpacciWOtZ1VuUuhwDG+uz2cpS5szphF6Q==
X-Received: by 2002:aca:c7d4:: with SMTP id x203mr54089oif.21.1607466456126;
 Tue, 08 Dec 2020 14:27:36 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id s139sm37123oih.10.2020.12.08.14.27.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Dec 2020 14:27:35 -0800 (PST)
Subject: Re: [PATCH 16/19] target/mips: Inline cpu_mips_realize_env() in
 mips_cpu_realizefn()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201206233949.3783184-1-f4bug@amsat.org>
 <20201206233949.3783184-17-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <188bc845-e9ea-b7f1-79e0-6749055bfa15@linaro.org>
Date: Tue, 8 Dec 2020 16:27:32 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201206233949.3783184-17-f4bug@amsat.org>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Paul Burton <paulburton@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/6/20 5:39 PM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/cpu.c | 20 ++++++++------------
>  1 file changed, 8 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

