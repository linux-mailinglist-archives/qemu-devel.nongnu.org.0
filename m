Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 468F9700DC4
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 19:19:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxWPe-0007c6-9O; Fri, 12 May 2023 13:18:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pxWPc-0007bQ-TS
 for qemu-devel@nongnu.org; Fri, 12 May 2023 13:18:36 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pxWPb-0005T0-DI
 for qemu-devel@nongnu.org; Fri, 12 May 2023 13:18:36 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f41dceb9c9so52575845e9.3
 for <qemu-devel@nongnu.org>; Fri, 12 May 2023 10:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683911910; x=1686503910;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=V5xBRxPHKW+2lunBgIqBggurjCyZEOlIZ0a+n07+h4o=;
 b=HQgEEHjOPJw/F3Avd1uA9u7SICEH6UflMJtQYOYBprJDdL7VSaCMraqJFAPfrkQQRu
 O1gG0hMRFDUwp9wVUPL8UVOhqGL/OHhwSywcexXaJIvecPH2IRuVYUBGOD0Y6fqbmSFg
 e3e5O9nM3Rmdqk5ceYOAOCYrSUgF+hNHNKvil9iv75/4bcoZt83ndj+ctmkLulk/92Q1
 6lfx6oIagqJMKwUfjIlxGsaNCJsHN3S9mShQNvBSmxLMZACtya+o6fR0om7BEKjjFPNZ
 G0YagDKiywBymaHsj8XiVJtt8/b3Po12Zj3N7zXzfdqUxAwRn2U693C4wE2EU0NBpuir
 H+ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683911910; x=1686503910;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=V5xBRxPHKW+2lunBgIqBggurjCyZEOlIZ0a+n07+h4o=;
 b=ibbqaqO+fVSgakSM9Df8wck2QKzSzubDJm5qJrMJ/VNQZZ1U8mrflJt99oDKYqp5VT
 CVVXDU97kqG2O+L6HdM3ftVxLLhRmbeH55eCyP/AgY0DAGmRIxQdeI/+S1YYJ3A5fis/
 SXLPjM4madquHhpyPuOWVkoXs5d1n1gvMKncYr+muL0buDFj7jlV1nVdGDyeFEkygfiu
 7VrgFjKd4FjL8tRqdwcss9wukgyTXp5wdSFH43Uzl01dFHps1ZOvQDUXDggR4bCjPteq
 6e+EB4+CI5l04h/bbZZZmKpaoASJd8iCxOVxpiy6tk5de4Ncg5fY40K/vVgdKmoKdjuO
 gmzw==
X-Gm-Message-State: AC+VfDx/zMwW7dpPYNC0E6vRZTDHwZX4BNzCiRqHD4CYGtifA4cDoWnH
 5NJyU81dv0kKv8vyHE29z00uFDYkOkcLwhup+reLEQ==
X-Google-Smtp-Source: ACHHUZ7deNwVJ2U6dZDJ9UcTng3UwSh1VlqD863jYoO2LjIXFbuhYN/dhuhqqtsgl8PvcVG5e2Tpig==
X-Received: by 2002:a05:600c:b42:b0:3f4:f0c2:125 with SMTP id
 k2-20020a05600c0b4200b003f4f0c20125mr3471184wmr.23.1683911910245; 
 Fri, 12 May 2023 10:18:30 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.153.246])
 by smtp.gmail.com with ESMTPSA id
 k9-20020a05600c1c8900b003f4283f5c1bsm18483293wms.2.2023.05.12.10.18.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 May 2023 10:18:30 -0700 (PDT)
Message-ID: <592fe193-0bb5-4559-f5ee-5aaf1f4ec941@linaro.org>
Date: Fri, 12 May 2023 19:18:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [PATCH v2 1/3] hw/loongarch/virt: Modify ipi as percpu device
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, maobibo@loongson.cn, yangxiaojuan@loongson.cn
References: <20230512100421.1867848-1-gaosong@loongson.cn>
 <20230512100421.1867848-2-gaosong@loongson.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230512100421.1867848-2-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.845,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 12/5/23 12:04, Song Gao wrote:
> ipi is used to communicate between cpus, this patch modified
> loongarch ipi device as percpu deivce, so that there are

"device"

> 2 MemoryRegions with ipi device, rather than 2*cpus
> MemoryRegions, which may be large than QDEV_MAX_MMIO if
> more cpus are added on loongarch virt machine.
> 
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>   hw/intc/loongarch_ipi.c         | 44 ++++++++++++---------------------
>   hw/loongarch/virt.c             | 12 ++++-----
>   include/hw/intc/loongarch_ipi.h | 10 +++-----
>   include/hw/loongarch/virt.h     |  1 -
>   4 files changed, 26 insertions(+), 41 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


