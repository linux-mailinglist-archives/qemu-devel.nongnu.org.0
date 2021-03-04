Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87EEA32DD73
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 23:56:30 +0100 (CET)
Received: from localhost ([::1]:53068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHwtO-0006L4-2J
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 17:56:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHwrI-0004KN-NL
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 17:54:16 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:42801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHwrH-00071e-2Z
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 17:54:16 -0500
Received: by mail-wr1-x42a.google.com with SMTP id j2so16585323wrx.9
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 14:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Wlmwu11Fr9Yt0vxzdL/Gs4jS9q60D0F0ZCdulNjEGco=;
 b=PvLAyoffueljz5SvFz9CzED0Y/zavFPpBcdLNy8TWSyfjJvCqpj6y0DX+3/4E9ekXl
 5HSu0VrI4hZx2ANRKeR6tKKwRbzgU8vd1TIFt6r3LT4OSV0gbRQ2ZOp/NGVKdjMrBqQr
 rwCnE3Hne/4P3DhqgTDnZ4biEbLrRnLKDNCo6M8WFFlfTbqOpJLSp5bl1Z1y8hT2IryH
 yN4mDnCz4sQlvS/gGAAQkLkRoDNSyPDNJ1t6dvZpZDG3uByWL+N0GeB5Z9OuWVawc6z5
 8Y1lssR3clF9wIoWIv32u+EcuGRH/u5egBKecF3NvtU1aUoAP8n2NVd07Y4ePNCJs7ST
 t0uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Wlmwu11Fr9Yt0vxzdL/Gs4jS9q60D0F0ZCdulNjEGco=;
 b=PAexYMoDEaOjN7wO2wkQkdrwEpPb23wJ7+WjDo95+sLWNXBfu2wKUMdEZy8l0R8JpA
 9ayaaFIoQsbqBYsyZbDqKoYKIfbvfpvd7V6ZbhGRW+Ro6INXSDA+X6xHKL6Xn6n+tK4Q
 B9yPHBeRRyL2tbQCEgJBxJYnZWmrEXGkwG8FjCXfb3ZWrDLcPfgJ/iZ33L/Owtpgx4Tp
 k22G5kER7G4OWD9EOXMUuuPsUodZYpFyIyFtG/Po7AxEI9UrZuueGzfpWFuiMiPDW8t9
 qGBw3MUKbl4/pwGMyqj3HIjk20HsLAlKL3eEd1GOPD8V1+idfti03p23vC8q2QvpoiLc
 ihkQ==
X-Gm-Message-State: AOAM530p/BqWvxOjEDLPIXj1mj3nHJ7IKLDOVxTZ69CDD27kUbA6ethT
 5Skbt7qKeV9QoDcOJ13LXKU=
X-Google-Smtp-Source: ABdhPJyC/SIz4HvFd7n0UhATLRw0Bn0Z1YgoMmro6ZM4WaC/bZSamR8h4TDzijbL0uAwvfMQsUTRSw==
X-Received: by 2002:a5d:628c:: with SMTP id k12mr6194349wru.316.1614898453373; 
 Thu, 04 Mar 2021 14:54:13 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id w4sm1331812wmc.13.2021.03.04.14.54.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 14:54:12 -0800 (PST)
Subject: Re: [PATCH v3 2/5] intc: add goldfish-pic
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20210304220104.2574112-1-laurent@vivier.eu>
 <20210304220104.2574112-3-laurent@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <fecc4d39-51a2-5c9f-7bf7-8a543645a83d@amsat.org>
Date: Thu, 4 Mar 2021 23:54:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210304220104.2574112-3-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/4/21 11:01 PM, Laurent Vivier wrote:
> Implement the goldfish pic device as defined in
> 
> https://android.googlesource.com/platform/external/qemu/+/master/docs/GOLDFISH-VIRTUAL-HARDWARE.TXT
> 
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>  include/hw/intc/goldfish_pic.h |  33 +++++
>  hw/intc/goldfish_pic.c         | 214 +++++++++++++++++++++++++++++++++
>  hw/intc/Kconfig                |   3 +
>  hw/intc/meson.build            |   1 +
>  hw/intc/trace-events           |   8 ++
>  5 files changed, 259 insertions(+)
>  create mode 100644 include/hw/intc/goldfish_pic.h
>  create mode 100644 hw/intc/goldfish_pic.c

> +static const MemoryRegionOps goldfish_pic_ops = {
> +    .read = goldfish_pic_read,
> +    .write = goldfish_pic_write,
> +    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .valid.max_access_size = 4,

Missing:

       .impl.min_access_size = 4,

> +    .impl.max_access_size = 4,
> +};
> +
> +static void goldfish_pic_reset(DeviceState *dev)
> +{
> +    GoldfishPICState *s = GOLDFISH_PIC(dev);
> +    int i;
> +
> +    trace_goldfish_pic_reset(s, s->idx);
> +    s->pending = 0;
> +    s->enabled = 0;
> +
> +    for (i = 0; i < ARRAY_SIZE(s->stats_irq_count); i++) {
> +        s->stats_irq_count[i] = 0;
> +    }
> +}
> +
> +static void goldfish_pic_realize(DeviceState *dev, Error **errp)
> +{
> +    GoldfishPICState *s = GOLDFISH_PIC(dev);
> +    static int counter;
> +
> +    s->idx = counter++;

Isn't it a bit fragile? Aren't we better using DEFINE_PROP_UINT8()?

> +    trace_goldfish_pic_realize(s, s->idx);
> +
> +    memory_region_init_io(&s->iomem, OBJECT(s), &goldfish_pic_ops, s,
> +                          "goldfish_pic", 0x24);
> +}

Adding .impl.min_access_size:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

