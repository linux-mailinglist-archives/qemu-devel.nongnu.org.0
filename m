Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A56F5333224
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 01:02:33 +0100 (CET)
Received: from localhost ([::1]:40836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJmJ6-0001hE-6H
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 19:02:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJmEt-0006z2-4O; Tue, 09 Mar 2021 18:58:13 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:33563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJmEr-00041v-NN; Tue, 09 Mar 2021 18:58:10 -0500
Received: by mail-ed1-x52e.google.com with SMTP id x9so24110770edd.0;
 Tue, 09 Mar 2021 15:58:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BAeoxk8WtwXA84724n/YU1LojmuwurWf8oFjYdUc+rc=;
 b=IUczFDdIOpSMqDEC7u2uwAipEhjFUr3ERl6A5VlcIbfOQcDjpPGZkEmP/2mq72X04Z
 bQUG+ngv3XxscQLaClnEDbeVxeYSBRMyV6jNCtNtrEGlVQotj7hB0smWmRMl+FdEUw4b
 V6US1TaeofLvK+ILPXSw95KBs+HQIyergkDYBpKVMzp2Ti091TaN9FmzBwb9HjFDNXYk
 I1VBjl4NiQi4JF6nIRtqO086ejv+0Da6/MNsYv8D1UkKzjX3efC7dyRAggtiIm5KQ+R1
 R6W8KhjPjipMx7POCAeTqVPHmQfZW7C7Ec1QcouUec7VodM0WvckevojXozNulJl8BrP
 14LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BAeoxk8WtwXA84724n/YU1LojmuwurWf8oFjYdUc+rc=;
 b=Eyw3Z7BH9AtFMdYpHj6BYIrtwsfIWf2KFyN+zq55xla3JlT0TTYbZoiXHtO78J9K/n
 zuMKgW1nffO4EqXF3gXv1aGGcVik2BKVHKs2/DT8g6HhGC8uJLVsZHME8aenaevDPEFT
 v9VZWe9PIy+/jecfRaDDzX4Rtf7+rC5X3VfKukSpX7ngfiQEPctAAMhfiWcRJairEkYV
 Vg1JSyOGpA70Iil90BBvRWc/k8aYlHo2pkIZbCh475NttJFebhwFGqVpP+O88vUpwS75
 weZ1CAuVbkgbLPYfXrrXH/tP9zMbu7vM+pZ5KjJy2+W0D0mYBjuwYItOzfgitPSz5Tqv
 SCuw==
X-Gm-Message-State: AOAM533gKoD7cXHK5Fkj26krpkVEt03EHnk9UeEVzHvRPWS475mIyUTs
 eerTDt+7CvDgfgWzTZqOWm4=
X-Google-Smtp-Source: ABdhPJwXOeUxyeNl5+kDZSud6DffJ7AiHRWE9XUaZGL3ZnugU+Ba8cs/YAhQSXzp5nMd/fMSFXbDuA==
X-Received: by 2002:a05:6402:1103:: with SMTP id
 u3mr175923edv.205.1615334287708; 
 Tue, 09 Mar 2021 15:58:07 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id u16sm10094192edq.4.2021.03.09.15.58.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Mar 2021 15:58:07 -0800 (PST)
Subject: Re: [PATCH v6 2/8] vt82c686: QOM-ify superio related functionality
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <cover.1615321729.git.balaton@eik.bme.hu>
 <80bbf52721592742e7ca8ac5d4eea3ddd0c125b6.1615321729.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <4657f73d-570a-77df-6272-704a1cc128cd@amsat.org>
Date: Wed, 10 Mar 2021 00:58:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <80bbf52721592742e7ca8ac5d4eea3ddd0c125b6.1615321729.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52e.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/9/21 9:28 PM, BALATON Zoltan wrote:
> Collect superio functionality and its controlling config registers
> handling in an abstract VIA_SUPERIO class that is a subclass of
> ISA_SUPERIO and put vt82c686b specific parts in a subclass of this
> abstract class.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/isa/vt82c686.c         | 240 ++++++++++++++++++++++++--------------
>  include/hw/isa/vt82c686.h |   1 -
>  2 files changed, 150 insertions(+), 91 deletions(-)

>  static MemoryRegion *find_subregion(ISADevice *d, MemoryRegion *parent,
>                                      int offs)
> @@ -270,10 +279,76 @@ static MemoryRegion *find_subregion(ISADevice *d, MemoryRegion *parent,
>      return mr;
>  }
>  
> -static void superio_cfg_write(void *opaque, hwaddr addr, uint64_t data,
> -                              unsigned size)
> +static void via_superio_realize(DeviceState *d, Error **errp)
> +{
> +    ViaSuperIOState *s = VIA_SUPERIO(d);
> +    ISASuperIOClass *ic = ISA_SUPERIO_GET_CLASS(s);
> +    int i;
> +
> +    assert(s->io_ops);
> +    ic->parent_realize(d, errp);
> +    if (*errp) {

Unfortunately this doesn't work because errp can be NULL...
This is described in "qapi/error.h". You have to use a local_err.

> +        return;
> +    }

