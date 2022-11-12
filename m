Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30949626747
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Nov 2022 07:04:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otjd0-0003mK-RR; Sat, 12 Nov 2022 01:04:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otjcy-0003lu-6t
 for qemu-devel@nongnu.org; Sat, 12 Nov 2022 01:04:28 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otjcw-000834-KN
 for qemu-devel@nongnu.org; Sat, 12 Nov 2022 01:04:27 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 m14-20020a17090a3f8e00b00212dab39bcdso9484568pjc.0
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 22:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=b4usj2d3RGkGMmnnF033TDh+lwHQDGjI1Ichtiuge2o=;
 b=eA06eQpVFBfSK5KuM4KjXbo91zdREnCO0j45eWjQXHAFTN9C4hTg/HibeWG4jMBpUh
 5OSSgthByqvkxkaYSwy5X01fQzisz2DYbnWGlFdXWeogkFiG3STPWvexOI98iD7ivo2V
 kBJhsaEkfKRAZsvw8KYKqUD4gFuUfQ0ZXEqCB2evzA0e7HrD1/8ihYyOIdJ+x16d/bDD
 Ty0tm5HafQvj0/YP3YKmYLcGoE672vz7hT8rth37/zWJq0hr5vXm2dkCXeB4wwANAIki
 4RUZvlD1kZjGk/scOZYeEahE6BzhCSTregehnfLXIXfmundQceK5UdBE1ktt2PjS0utI
 eQpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=b4usj2d3RGkGMmnnF033TDh+lwHQDGjI1Ichtiuge2o=;
 b=1zdJ4KNNUUWFBIMGCOvumZuBNlthtUfShQkU9ziBXFn1yqa9fbbHWBzddZTsoEguhy
 kJnRTXsooLJ2eSOYQUkUnMe9RmSq0vX+Tn19jVkV8RU8aUJVh8epYi3AQpdQgfV2tODi
 i6A5i2Q2RaWCX0jB/E7LDFPQA5F99JbRdY0qv3VxnDhtHNHviEq2Ik8VywR7/fdnmzdX
 c7gJA0tUy4L54t13sFz4Vs0EOZH4VpWOX9OsDfwBBtXWJ0U7CqWC1CWeAAqXjXpMrHml
 Ox7UFeIpBOVmg1qpmSjhndGQ9OdDJowjLVDAmKfLQ02vXG/mBsSFVvLMqZrzMSsEHdxK
 leCQ==
X-Gm-Message-State: ANoB5pk9s2tM750qITE3R1EdJcOQSdkpd3h7tKLlBM2m3uthkRhIwp6D
 cqeyj344qg4v9bvAzrpDXiDckw==
X-Google-Smtp-Source: AA0mqf5zG3W76GnoNeA1UzMKzsm68SLujtTXblRlNFPp9XvX77M5PMGsrx9TZZr/TMQteT7DdNRkqw==
X-Received: by 2002:a17:90b:1908:b0:213:90f5:274 with SMTP id
 mp8-20020a17090b190800b0021390f50274mr5006637pjb.182.1668233064650; 
 Fri, 11 Nov 2022 22:04:24 -0800 (PST)
Received: from ?IPV6:2001:44b8:2176:c800:8228:b676:fb42:ee07?
 (2001-44b8-2176-c800-8228-b676-fb42-ee07.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:8228:b676:fb42:ee07])
 by smtp.gmail.com with ESMTPSA id
 t12-20020a1709027fcc00b0016d773aae60sm2744435plb.19.2022.11.11.22.04.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Nov 2022 22:04:23 -0800 (PST)
Message-ID: <271f4c24-cb1c-cd33-0860-dca43791935a@linaro.org>
Date: Sat, 12 Nov 2022 16:04:17 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v5 19/20] hw/isa: derive CPUState from MemTxAttrs in
 apm_ioport_writeb
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: f4bug@amsat.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20221111182535.64844-1-alex.bennee@linaro.org>
 <20221111182535.64844-20-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221111182535.64844-20-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 11/12/22 04:25, Alex Bennée wrote:
> Some of the callbacks need a CPUState so extend the interface so we
> can pass that down rather than relying on current_cpu hacks.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   include/hw/isa/apm.h |  2 +-
>   hw/acpi/ich9.c       |  1 -
>   hw/acpi/piix4.c      |  2 +-
>   hw/isa/apm.c         | 21 +++++++++++++++++----
>   hw/isa/lpc_ich9.c    |  5 ++---
>   5 files changed, 21 insertions(+), 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

