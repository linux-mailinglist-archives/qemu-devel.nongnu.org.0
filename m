Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D092B68F846
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 20:48:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPqQ1-000851-P9; Wed, 08 Feb 2023 14:47:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pPqPy-00084U-UM
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 14:47:46 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pPqPx-0001pF-Bt
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 14:47:46 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 f16-20020a17090a9b1000b0023058bbd7b2so3432830pjp.0
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 11:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WzcsBi+zbqoEGzGlDXkXktMxtzPwmjU8i2Aszo5D34w=;
 b=UftF4zoZ3o7KK1nkC2mQqq9GBHyTNk9SAWpQTFol6hObtRhRwIulEFE/lLg/MEL52Q
 bswDY+4I/iAWTXgfNukcXawZZR5WK1k18+EqWq2J3ppEiIZofpitVBNPd8ex+6jzLSKe
 5A+5W3vr1bQlv1upf4EEzsfi0z4Ahhp99qPk8mrrh1kMTF0y+LVe8+/mMu4myk7Jqc7W
 KlPq3XbSJQ9UI8dqWj6wksWauZBFoJ74cB9tZ7lzFsoJCC4JQbJX69sN2nJhgK1xVVoT
 sV1lU9jHkVLA22dadGMIHh8LwdayKwpEaS56bxh0Oc+m/vE5XLJxXVS4wvtKvWs3yRpf
 VaWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WzcsBi+zbqoEGzGlDXkXktMxtzPwmjU8i2Aszo5D34w=;
 b=uNPP3oq9hOuBi11TajiVtddHnVxlQF0vYkI779r7QVqb64VRUcUTIVVzXPlCjNCOUG
 zUMYDcPsHKjfplaqQv9yQdX/64UYlOweFIOYpl152wFVqUXb635ETjHyePQ7Ss8qP993
 zHOpR504lG8O11Rf1vtbX3sgEeDcGp+ZQy5z29xIe9CPXOGbhCY9w9tobnJp1XZIxDPo
 0QS74PlO7HVJYNahJv0Dg/7EMvmpr5FiVFNBNdWC/qt5QJ9JjrmwnpwJNmDlsRIc5odm
 EwMvnLQTNaheeEK0Ui2kf1X/iFBMVJNexe84g4D+g0CW47pkbEJFpsYDgAZ9Sdk2PTmQ
 J5pw==
X-Gm-Message-State: AO0yUKWq8GnwHM1zknVkDaIXvcYNwnxN/7glHvDRqpru12xhmYAD/gKW
 0v8ZWVlNzdBX13Ahs3tmdDs8jQ==
X-Google-Smtp-Source: AK7set/KOLWDhr7F2/Lk8dUqfC1IAEfISZ+SN9ukj1rP02DOjVHI6lJWmGF7XWU4anH0qX2tl6EGjQ==
X-Received: by 2002:a17:903:32c7:b0:199:1927:d07e with SMTP id
 i7-20020a17090332c700b001991927d07emr9631862plr.28.1675885662996; 
 Wed, 08 Feb 2023 11:47:42 -0800 (PST)
Received: from [192.168.101.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 k20-20020a170902761400b0018b025d9a40sm11356280pll.256.2023.02.08.11.47.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Feb 2023 11:47:42 -0800 (PST)
Message-ID: <8bcc1035-c9fc-762a-7a32-6b0344539345@linaro.org>
Date: Wed, 8 Feb 2023 09:47:38 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 6/7] hw/isa: Assert isa_register_portio_list() gets
 non-NULL ISA device
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: BALATON Zoltan <balaton@eik.bme.hu>, Paolo Bonzini <pbonzini@redhat.com>, 
 qemu-block@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 John Snow <jsnow@redhat.com>
References: <20230208000743.79415-1-philmd@linaro.org>
 <20230208000743.79415-7-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230208000743.79415-7-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.146,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 2/7/23 14:07, Philippe Mathieu-Daudé wrote:
> The previous commit removed the single call to
> isa_register_portio_list() with dev=NULL. To be
> sure we won't reintroduce such weird (ab)use,
> add an assertion.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

I wonder how much use of __attribute__((nonnull)) we should be making.
I realize we'd probably want to add -fno-delete-null-pointer-checks if we make too much 
use of that.


r~

