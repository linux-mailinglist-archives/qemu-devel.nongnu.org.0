Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D11DA2CFB53
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Dec 2020 13:48:38 +0100 (CET)
Received: from localhost ([::1]:45636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klWzN-00018M-Uz
	for lists+qemu-devel@lfdr.de; Sat, 05 Dec 2020 07:48:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1klWww-0008RM-3w
 for qemu-devel@nongnu.org; Sat, 05 Dec 2020 07:46:06 -0500
Received: from mail-oo1-xc41.google.com ([2607:f8b0:4864:20::c41]:39283)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1klWwu-0005NC-JV
 for qemu-devel@nongnu.org; Sat, 05 Dec 2020 07:46:05 -0500
Received: by mail-oo1-xc41.google.com with SMTP id l10so2080212oom.6
 for <qemu-devel@nongnu.org>; Sat, 05 Dec 2020 04:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9IsfdIjFimgTASaoEYrYzbBL1NGFPt1y7Sd6YBjA43E=;
 b=wuGO4YTC+kWREOy1d4sUSKgZkZkxpcGpyMeeaMkRQR65jHTo8HBt52Sll8PgX0e5Ex
 NU4ajyMEmCfPlR2O3bbMEBWt5bVAsoE+hWdSa2p12tiR1d/3OrubGXipf3ZDsv2oarl4
 p0/dXqWrJA6rgzYhQ1UspuiUuheUw5tx8XgLG/2qqHXzzcX3hF6rPVT7s7GKtEHwR8ox
 OLYoTJPu6x4Yyd8nn8Whjk1EYkGhRTYRtH6rq8awP005mqnN0ak88XSudPqk0WWTAPOi
 ZC1Zo/Yz4w9qfsY+qrz/xOdvE6pa8nyVA42pIvE2w9XU+l1LJKUArXCf7k0DQFzUOyDq
 4kJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9IsfdIjFimgTASaoEYrYzbBL1NGFPt1y7Sd6YBjA43E=;
 b=k6rZVKKHAB/wuOAI7IIsKbI/M9W03o3MGzVzfl2KtjWqCiSSXG0PNBYe2pcn8H/cW2
 uAbhiEVTb1aZ07ETRFwTwu2T3uekRqHV3JltEpzP7jFFNV0qGVMRVrgmoJSlhrFhsHeZ
 TVf9s7/S8s/d+tjnjQCuj334UnvwOCghDRJa0GqLLw/f2LZDTj3q2bEJsJioWWyTOazD
 lNtPu0mDqV36AgdN9nA1pC+/QJAgGo3VafmND0Vn+DL+minmYZPwOw7zwlJpCZUGgRHE
 8spTyzl3Hr2n2VShaLsPwT6/0wNWdzJpnjJBrn4K+d0DFhAaWApXJRjIU6lzV0GAAVfN
 tsCQ==
X-Gm-Message-State: AOAM532GQ7WxaSJa7g09nGC58XuoxlTtp6qyxwU0Nz+K2j68icrG4ouK
 ZnWgQlCPD2UCKkwmWIhqkXjnKg==
X-Google-Smtp-Source: ABdhPJzsUdE6/jQtqRRXmdJdORXzCA0oeWcK2d/AlbkLS+gDFmR0L553O+PjWxTcCq9I7fL7lLrMEg==
X-Received: by 2002:a4a:a444:: with SMTP id w4mr6784530ool.5.1607172363452;
 Sat, 05 Dec 2020 04:46:03 -0800 (PST)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id 2sm1384668oir.40.2020.12.05.04.46.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Dec 2020 04:46:02 -0800 (PST)
Subject: Re: [PATCH 9/9] target/mips: Explode gen_msa_branch() as
 gen_msa_BxZ_V/BxZ()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201202184415.1434484-1-f4bug@amsat.org>
 <20201202184415.1434484-10-f4bug@amsat.org>
 <42cae1ae-46aa-1207-dac7-1076b3422a7f@linaro.org>
 <c314aed2-9f39-89f7-c4f7-6b3e7c094996@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <27bbd279-b8be-4f82-5100-930caf142f4b@linaro.org>
Date: Sat, 5 Dec 2020 06:46:00 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <c314aed2-9f39-89f7-c4f7-6b3e7c094996@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c41;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc41.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, kvm@vger.kernel.org,
 Huacai Chen <chenhc@lemote.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/4/20 4:53 PM, Philippe Mathieu-Daudé wrote:
> Yes, will follow. I'm tempted to inline gen_check_zero_element (actually
> move gen_msa_BxZ as gen_check_zero_element prologue/epilogue). Not sure
> gen_check_zero_element() can be reused later though.

The other thing that could happen is that gen_check_zero_element could grow a
TCGCond argument (or boolean) for the setcond at the end, so that we generate
the correct sense of the test in the first place.


r~

