Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C947371091
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 04:39:39 +0200 (CEST)
Received: from localhost ([::1]:40980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldOUk-0005x7-9b
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 22:39:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldOTz-0005X9-22
 for qemu-devel@nongnu.org; Sun, 02 May 2021 22:38:51 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:38524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldOTx-0003Dk-DH
 for qemu-devel@nongnu.org; Sun, 02 May 2021 22:38:50 -0400
Received: by mail-pf1-x42e.google.com with SMTP id k19so198877pfu.5
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 19:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=G6oRFCEiuMfaLvX6I5bHKyvuEGvBTbWiJmXkEjABLFc=;
 b=b1f6tOfEkAav4xIz+8q38LTsC6EtPV9TIQ6RBesdQrdivMSlCjV0BW+kBYrEHLFmS6
 2AwoIX5R9Na7YTLn7JBvW3//W4QbvptzAQCV5On+e4dhRYD6buLw5nmlEdtbMqDwfJhx
 4kr08CUhS8R2n4pS2KfKCT5mjb3IUPklQo6JYLkg90Qf5mV+T2qpFK8EPqKFdCtbRnmR
 uKvjG44ThR4OFcOkdXNSK2ynagAwZ6z1o1LOGemxbIdhTO8/B6TRzXXWctbI8Gp7N5Oj
 DNQIbBCtG0aATNr92/erFLjSqN0tUwGtC6FcNvClpmifrSXprHJu0GF/yk+6S6aEnKMu
 I+Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=G6oRFCEiuMfaLvX6I5bHKyvuEGvBTbWiJmXkEjABLFc=;
 b=OhmSzI08U1McWbHC4e1l/xvd0BnFWr/KrrKIq4gS9ja8lCZK17AOGXyGF7Bvfy6EmM
 Lz1CEgZiwv1HAwcnu+e5IYLuS1tDy23hp9XCjpD7duH+pItdHgWbHv5o+wR7g1ahrN2s
 MqmFqQVAos7Ed3oywc6YdQWF9JCOWxG29ocF69FnIFs8JVvVbboULLveNm+2/WY2RuB3
 FtX77XRT9H2pdiuAmz+ovGyJstx5YdKONDHoKZDujtuZPjaAJTygiyvjcAUGqloTiAf/
 WzQzBie389ibgSGcEI4hh8rvrFxmkm7YhEkt9J90cT8BVI8R/CuHsiZkfHaqAOpnkVL1
 thJQ==
X-Gm-Message-State: AOAM533rIAkt/9WnHI6Elf3OV4RLCwPPIvfh+dLXnIGbKD+tSCC+N4KZ
 4SUf2HyXJcxyUESga+64Rfmesg==
X-Google-Smtp-Source: ABdhPJyzzEU0ophg152WpqINFpUYINU8OifBuOJnsh2v9Rr/j3ZAJ6xWV85QwWIssx6KSH4EQSEADw==
X-Received: by 2002:a62:e704:0:b029:28e:5541:7e4e with SMTP id
 s4-20020a62e7040000b029028e55417e4emr8916481pfh.17.1620009527631; 
 Sun, 02 May 2021 19:38:47 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id 134sm7845178pfy.117.2021.05.02.19.38.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 May 2021 19:38:47 -0700 (PDT)
Subject: Re: [PATCH 2/2] hw/usb: Do not build USB subsystem if not required
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210424224110.3442424-1-f4bug@amsat.org>
 <20210424224110.3442424-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5486d89f-d5ab-af60-d95c-151bdda93a56@linaro.org>
Date: Sun, 2 May 2021 19:38:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210424224110.3442424-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/24/21 3:41 PM, Philippe Mathieu-Daudé wrote:
> If the Kconfig 'USB' value is not selected, it is pointless to
> build the USB core components. Add a stub for the HMP commands
> and usbdevice_create() which is called by usb_device_add in
> softmmu/vl.c.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   stubs/usb-dev-stub.c | 25 +++++++++++++++++++++++++
>   MAINTAINERS          |  1 +
>   hw/usb/meson.build   |  9 +++------
>   stubs/meson.build    |  1 +
>   4 files changed, 30 insertions(+), 6 deletions(-)
>   create mode 100644 stubs/usb-dev-stub.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

