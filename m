Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D38756954D0
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 00:32:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRiId-0001LH-6V; Mon, 13 Feb 2023 18:31:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pRiIa-0001Kl-Ug
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 18:31:52 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pRiIY-0004iu-W6
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 18:31:52 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 a8-20020a17090a6d8800b002336b48f653so12488628pjk.3
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 15:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=x1aZwUb8jJBR0FNipYIljpUgRQflNxZaYzlM139YbQI=;
 b=UPP+BsYbLG5rI85mJn7jRPq/gegHe7Lh/cL1mNJ+FYHy9C2xfe6iZsWjL3phzNbJoM
 qh1suE4wOLxKCIKC1MzgP0UHpYdz3WA1qovfFRFYCfiPc8T2nOXC9RYyb1w4wFRS7wWX
 fuWDKveKzBedZGGsNmANYljYXARPR+fOKc2KrSxLWXJnjid9ZIhmFW6amujrbnA/JuHn
 Ke8NY5tKCgTeHlAHnK1zcR0XQi8KUXqxsV43KEKnrhWYVT7l57VKR/iD/wNky7tDMIEK
 e70Ohf07hcGpxweQ+uixE+ItDq5qR+pIsAwlUIxPyuV7zliH3+iSY16jXVmzJGN9Gs/7
 A4Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=x1aZwUb8jJBR0FNipYIljpUgRQflNxZaYzlM139YbQI=;
 b=HXfe7ipH+hgtGwEOB5qYMyyADNjvV8N2rYgZQxI52CHja3AkB/8DhI/VnYpKruJd+h
 xjaLinwnvkmXjcJXBkMMMkzZ6esj9sV8dtZA45U+p4NUGaWTlhHxixeTLA927IvmnuWq
 UwFIp2a0807QUs7rxEUAbqyZB0xoDjVaL6bQUR17ssNqJKGT8CD8t33MRok7N1HNVTsh
 JGLv6RH2AD58OtqrDuftocN6Di48y3JLaeIRXI3pyvo74JuYSmRxnQBk+r1AY1z7yvPk
 7BlDvOVSz5nqB67VFyYHglW/dd744+BUBOcIlAU/Xp6oy2ZomaXWVPbd0cI8cP/d96b+
 zTLA==
X-Gm-Message-State: AO0yUKXvhZ4mQ8syoPM2sHmE9ByHQbxCeacHq6ggGN2OJlkZNYK+ReiA
 tq4Al9kqHR/FYnXhTzcwd3CBzg==
X-Google-Smtp-Source: AK7set9uG/ceAVdjVYGV9yGgC5ph8pMGYelH8un0ER4o7wanVRsRmzzWwgeBED/ricD/SGajNYsAGw==
X-Received: by 2002:a17:90a:190f:b0:230:8c1e:a146 with SMTP id
 15-20020a17090a190f00b002308c1ea146mr234140pjg.25.1676331109347; 
 Mon, 13 Feb 2023 15:31:49 -0800 (PST)
Received: from [192.168.145.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 s23-20020a17090a075700b0023377b98c7csm6529932pje.38.2023.02.13.15.31.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 15:31:48 -0800 (PST)
Message-ID: <ceb9b83c-fe81-df38-15e8-4658720fb214@linaro.org>
Date: Mon, 13 Feb 2023 13:31:45 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 4/4] qdev-monitor: Use qdev_get_parent_bus() in
 bus_print_dev()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Eduardo Habkost <eduardo@habkost.net>, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
References: <20230212224730.51438-1-philmd@linaro.org>
 <20230212224730.51438-5-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230212224730.51438-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.345,
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

On 2/12/23 12:47, Philippe Mathieu-Daudé wrote:
> No need to pass 'dev' and 'dev->parent_bus' when we can
> retrieve 'parent_bus' with qdev_get_parent_bus().
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   softmmu/qdev-monitor.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

> 
> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
> index 820e7f52ad..12e4899f0d 100644
> --- a/softmmu/qdev-monitor.c
> +++ b/softmmu/qdev-monitor.c
> @@ -770,9 +770,9 @@ static void qdev_print_props(Monitor *mon, DeviceState *dev, Property *props,
>       }
>   }
>   
> -static void bus_print_dev(BusState *bus, Monitor *mon, DeviceState *dev, int indent)
> +static void bus_print_dev(Monitor *mon, DeviceState *dev, int indent)
>   {
> -    BusClass *bc = BUS_GET_CLASS(bus);
> +    BusClass *bc = BUS_GET_CLASS(qdev_get_parent_bus(dev));
>   
>       if (bc->print_dev) {
>           bc->print_dev(mon, dev, indent);
> @@ -811,7 +811,7 @@ static void qdev_print(Monitor *mon, DeviceState *dev, int indent)
>           qdev_print_props(mon, dev, DEVICE_CLASS(class)->props_, indent);
>           class = object_class_get_parent(class);
>       } while (class != object_class_by_name(TYPE_DEVICE));
> -    bus_print_dev(dev->parent_bus, mon, dev, indent);
> +    bus_print_dev(mon, dev, indent);
>       QLIST_FOREACH(child, &dev->child_bus, sibling) {
>           qbus_print(mon, child, indent);
>       }


