Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FCF5AD730
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 18:13:50 +0200 (CEST)
Received: from localhost ([::1]:39954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVEjM-0001sl-KT
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 12:13:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVEdE-0000Ki-7B
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 12:07:29 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:37392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVEdC-0006n2-77
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 12:07:27 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 c131-20020a1c3589000000b003a84b160addso7345020wma.2
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 09:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=ZBe//bqOmLHU0d6eI7b73avSTUjq9xArYaltVOtR2sc=;
 b=xNCRkzdq8D8+ivCMZ8Ds2zEPrPuZ/G5FJjP98ZB6+u1wrEPM04wTC9sdH5AYtLht6a
 u5XcwQfK/mJFQWD2OqPiodksWrB1gzmCyr5/q9t+ztqVMpD5BPndaWEd/qtu3UQLR3dd
 V1k9a6cExq+ZyFkGlkv86J1GkL8YUxnWe0ZHPcukm80doYTrDmAMZ4aKp4ALIQriXeEz
 uJcLTF+hvSorHRZ20xJ+GPK1VrGbvUfNDCu0v0hBwOMOmDWsxCykRD7WfeAsbFWaq3aR
 qKB7pgUSWo5OnXQHl0u6itHj5dZ3hllqAICXQhkqtFGyKZzegF5vCiCHn2cAmrmGieQ6
 Dejg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=ZBe//bqOmLHU0d6eI7b73avSTUjq9xArYaltVOtR2sc=;
 b=h8Go2bQhNieAAOKCJ2Pm1YaVRNi9Flm0DOY6lFY2CUOHvJA5EHr39Y01/EuaCyrsWf
 cyAQbg3Z7jDKFl5XZWCzMAzrzkID5dJZyu2VaX4JbV8wOkNekW++rBtIhaZwCqM1Fpdh
 vG5IIcsAbfPfIbjQJwwe4bL0qbL0eTtt5pC3rlu6JFzFR1M5Mz96Mmqp79MayrDlV2xT
 EELUWMekl3esud0+uGJWlOOs8+nF9AxSK2NXEdN+QjN5eJnqe+QT2A4unEvR8o5VVcOd
 D037hFOAr4kC4y4F8BR599ngzcArHM9L9ewi0nUZdW8pYZvtdQpqhOWDiXUVPplyfbTh
 znUw==
X-Gm-Message-State: ACgBeo3rfUmuVMlUWP+y+q6wV48fHpbS6Y12XhXaESNeAtU07vJThXmu
 cogF+yyYJtb9AGsmjGsqa9zynA==
X-Google-Smtp-Source: AA6agR6c8FAMna4URtCidQgHF/pUohVoSkxhy2V00MCfV7qq9rZzhlkaQuRFX5X48FOqqkoQaFMoRw==
X-Received: by 2002:a1c:f20d:0:b0:3a8:4176:139b with SMTP id
 s13-20020a1cf20d000000b003a84176139bmr10799773wmc.177.1662394044538; 
 Mon, 05 Sep 2022 09:07:24 -0700 (PDT)
Received: from ?IPV6:2a02:8084:a5c0:5a80:d0ad:82b5:d7a4:c0a9?
 ([2a02:8084:a5c0:5a80:d0ad:82b5:d7a4:c0a9])
 by smtp.gmail.com with ESMTPSA id
 bs30-20020a056000071e00b002287513f169sm4218482wrb.55.2022.09.05.09.07.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 09:07:23 -0700 (PDT)
Message-ID: <4975855c-a4bd-ec9c-2a2c-755cd7cea0a6@linaro.org>
Date: Mon, 5 Sep 2022 17:07:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] accel: print an error message and exit if plugin not
 loaded
Content-Language: en-US
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, dinechin@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20220905101332.1986-1-cfontana@suse.de>
 <5d922305-a559-bfdc-7038-ec1560ae0e00@linaro.org>
 <9bb31e44-e43d-b51a-712a-87e46279a0b5@suse.de>
 <879a973a-c5b0-2a23-bb24-92bf5500f63f@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <879a973a-c5b0-2a23-bb24-92bf5500f63f@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.716,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/5/22 16:43, Claudio Fontana wrote:
> You might think 'mayfail' can be called by other code as true in some cases, but no, it's always false.
> I wonder why this "mayfail" argument exists and is propagated at all, when it cannot be anything else than false.
> I tried to remove the "mayfail" parameter completely and things seem just fine.
> 
> In any case, the only thing that "mayfail" seems to control, is in module_load_file, and is a single printf:
> 
>      g_module = g_module_open(fname, flags);
>      if (!g_module) {
>          if (!mayfail) {
>              fprintf(stderr, "Failed to open module: %s\n",
>                      g_module_error());
>          }
>          ret = -EINVAL;
>          goto out;
>      }
> 
> 
> Weird.. Is someone building proprietary modules on top of QEMU? Is this what this is currently trying to address?
> But then, the result is just a printf...

I thought it was for things like vga_interface_available, which probes for the vga 
modules, but then gracefully handles an error.

There's definitely something wrong with the plumbing here.


r~

