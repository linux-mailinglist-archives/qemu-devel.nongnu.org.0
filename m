Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D38032DAE82
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 15:07:02 +0100 (CET)
Received: from localhost ([::1]:50846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpAyj-0002YS-EI
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 09:07:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpAww-0001wz-8v
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 09:05:10 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:41137)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpAwr-0004PS-0G
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 09:05:09 -0500
Received: by mail-oi1-x243.google.com with SMTP id 15so23405576oix.8
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 06:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Y8yeH+jXTaCBkTJCCU64nYwn4M9wbUN+h4XkjE75t68=;
 b=z2l/6Q1ykrxv+vhtgXHmivqkSSNnGhAdmTlm+JbE4JLmuT039umrkGp4wsLXoTwaV+
 v+s1beDk+OvQz8BoY5qK1MiYQdOtyzkQ+FxqegeH/hkbWA/VTTCu6fMrGkvj1J4EAGfG
 YF4c+LG6wcsH1zsflfEFdvZ0Ycuwfp1DPRs88TKIzE1aptebiTAVreY4H97yVuSDjRwM
 JgePdu/zRYeP3jYItCp8A5hYQ7WHibtQnXXZpjZuYkRX9vqo4TdH15S3Tx7wf8IiF3fm
 V/JiPrNIARypqPI1KKQRUbPRYMAlR4rDD6LjkoNGNqcVY6K3VMgS0zF02J42lgPxvBpu
 bC8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Y8yeH+jXTaCBkTJCCU64nYwn4M9wbUN+h4XkjE75t68=;
 b=SiBjtEksRXpS6x6y1SmvMp56rpv1fOGhi6UP38SXogsi5PiXRXmE3eZyotJyMCx5DP
 KEZY4/XEzSHFRDdh7aDZIrx+Zos8BwoR+OcrAjdUpv/w+7NPL+2H0fx2TQzE3aH6MqOy
 VYTH6czBVBjX89jnKlW4RPIRWAr151cGJcfEEHsW5ZBNC9eCLzWQvhP1feg5QHdSMkSF
 phbFlzOpI7sRSDDtcARtTtDrdawXnOEcbms2VD7pQ0sl3JyEQfNfTYGVJyzwyUEmHIg6
 rXj/vx0Uz42ODHwO22hWcnefeZtCd4iHdUZIf3tsQpE/hZY3NjjozpqFR+WQbPHjV0zx
 jbCw==
X-Gm-Message-State: AOAM5325grb32RzBlmj01Upcu9kd48aGhFMnW/XfDF35Rof6JAqxK7Wi
 C7usxiiyw45n7OhmhF9ffwprpw==
X-Google-Smtp-Source: ABdhPJxO29/jJJrxT8BZXutVSPPof3IMB5h1SnATOv+AQ+1Wkh1XB59/KBe1oWS2sqFaiT3su89XDQ==
X-Received: by 2002:aca:2418:: with SMTP id n24mr20543063oic.62.1608041102840; 
 Tue, 15 Dec 2020 06:05:02 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id o17sm427518otp.30.2020.12.15.06.05.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Dec 2020 06:05:02 -0800 (PST)
Subject: Re: [PATCH v2 01/16] target/mips: Inline cpu_state_reset() in
 mips_cpu_reset()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201214183739.500368-1-f4bug@amsat.org>
 <20201214183739.500368-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2d0dc83d-19a7-b64a-f0ee-99192a2bb051@linaro.org>
Date: Tue, 15 Dec 2020 08:04:59 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201214183739.500368-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x243.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>, Laurent Vivier <laurent@vivier.eu>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/14/20 12:37 PM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/cpu.c | 26 +++++++++-----------------
>  1 file changed, 9 insertions(+), 17 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

