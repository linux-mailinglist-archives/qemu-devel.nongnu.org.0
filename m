Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9240D67F27B
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 00:54:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLYXA-0006RO-6P; Fri, 27 Jan 2023 18:53:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pLYX8-0006R7-I6
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 18:53:26 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pLYX7-0007GG-6E
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 18:53:26 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 l41-20020a05600c1d2900b003daf986faaeso4622218wms.3
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 15:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yMONXYb5V/R8DCiMFP5kw5SLHBobDiDjEVQiWb/1RlA=;
 b=NkWZsQjASzHtr0MKsqepZreqCTvFnV02usyGdwbr9Thjfg7VGPdvZNfXUW6eBhbKPL
 lKGHY89uVholNvHNDMxMQ3EYEzWqrLIxLnCG+w+ovEH0RMBCmvrzL1s0FM3IlZKBPPUa
 /ZXxsd3z43b5pWqVaSNI857eB928ERDUQq10lVnF9EOYCjZVRHCW5wei5z8nozSZSJdY
 HEmAz4sxaes4akwrPDk8+4LnVkb0+N0pci67LSfO5mmOJDr8SkozUghXZ4B75JyuhAIb
 WABEyjKLjPPH2pqD+JrS2Lvhm7i2QawhJcGeVTNAV5G9H9L++2RqMfNJtW6PfVEVoYBE
 c6/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yMONXYb5V/R8DCiMFP5kw5SLHBobDiDjEVQiWb/1RlA=;
 b=YsKs86ucFjiZwuwYU+apXnGWCaRGRvGMpfsgpRYxu+hg4GDhh5ezU4+c2U5rrJ1x7Z
 RxlExuFXKWdCEgZrtbNp2c9yJaBYau2nS2/D42IOLW6P2evgBBfCvfH8lYKRFgwn1GS3
 DIE+wDdt3cwpEG60sYkWZ0/sC9srcbL8Ck7YBKVGc3oN1rGlj1Js2qXGxiQ+x81NQYUV
 sAjkRmHy1vZJeFtxZ8Gy3EPOVgbA8va/33lWwDW3wdu9m+oiBxo9fvKJWDWYiUnz6oqD
 vWcVDWPMN7emOAEHr+HwY40rk6TfhbkBUWqUVvQeOXf3xgnTSxNBpZD1AkZsV8rxYif5
 jlVQ==
X-Gm-Message-State: AFqh2kqdHq+THTRLUKN5CUW5vxhIWdw1IAClojOnQQ4l0cbAxLTCK2HI
 Q1d+85u8DFkC57za4olPPhozHg==
X-Google-Smtp-Source: AMrXdXsp3bhw1ErbejnlqCzh9uOwC8oh3j4KwOTmU4Q8xvopVfHPMD9l9n3XqHWTVpZtWh/3r8DuqQ==
X-Received: by 2002:a05:600c:cc8:b0:3cf:497c:c59e with SMTP id
 fk8-20020a05600c0cc800b003cf497cc59emr39143199wmb.6.1674863603517; 
 Fri, 27 Jan 2023 15:53:23 -0800 (PST)
Received: from [192.168.0.114] ([196.77.14.77])
 by smtp.gmail.com with ESMTPSA id
 a19-20020a05600c349300b003cfa622a18asm9463896wmq.3.2023.01.27.15.53.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 15:53:23 -0800 (PST)
Message-ID: <109f9f75-4dc1-d438-1542-99dbd9dc8704@linaro.org>
Date: Sat, 28 Jan 2023 00:53:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 5/7] hw/i386/pc_{q35, piix}: Reuse MachineClass::desc as
 SMB product name
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini
 <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org
References: <20230127164718.98156-1-shentey@gmail.com>
 <20230127164718.98156-6-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230127164718.98156-6-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 27/1/23 17:47, Bernhard Beschow wrote:
> No need to repeat the descriptions.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/i386/pc_piix.c | 2 +-
>   hw/i386/pc_q35.c  | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


