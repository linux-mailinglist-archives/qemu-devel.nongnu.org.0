Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 941D1349803
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 18:28:35 +0100 (CET)
Received: from localhost ([::1]:44806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPTmc-000437-Mb
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 13:28:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPTiE-00020c-RE
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 13:24:02 -0400
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e]:37557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPTiB-0007go-Gi
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 13:24:02 -0400
Received: by mail-oi1-x22e.google.com with SMTP id k25so2901123oic.4
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 10:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ru5PzNr2MjMlIEGAQZefHTXR7pnRnJs108TQosZ5raM=;
 b=Dz/m+1vh0HyS90DNJ1fHg+dPL/87QdJEQ5+n3nFXV+f2UT7oJYi0Ex0wPjybxBjA2g
 fGX1uNG94/WwDokLAZiGFKphXYrisqMezJWRJxxBNejCApEyuGDbKGFcv5k88+ixYMB+
 4trqmGZv1/O3KaDsnsw98Q0OxkatBLq39uYpRm+30sI1LangfiyeP/Nww2Pr9bwAq/KL
 K/jOd3TqRIwOK3TOko0CI7qA0Tq/Lb6OCr+8UaOjXZKvHXfpSt9Hp7dYRXbzmf0CBatP
 nOHWItxDXeuV4xsKpZTeGgeWVzvPU1ojQ9h2GH5Kik594yhWAGr/v7hegiBRGtgMAQdW
 1uWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ru5PzNr2MjMlIEGAQZefHTXR7pnRnJs108TQosZ5raM=;
 b=DZt/TcmI/r46xp9itKxwevqtq/WklauYB0ti8NiC6rTXHtKSXVPdg5n8u96oTrlDUs
 SiKZh83L+oJ6Y+IsuLHUj4PwhePJI4DVENYk9F0GXfhm2HtMYgMYyhx0idZjCKX2iF78
 nh8MI4e1GpnXzPm1TyBcpzsgRh55MiFSOP+ncGsW8BfpFi1TB7uWjL2E29lvqpcPopTr
 qX9m0dkWGU2ET+QP8pZPkz9wxFx5mqKStgL2XB6d3G7qndgOyuL/jDi90s9sVQgderpu
 4BxwacEukMEL0VzySNWQP+2BxECPZrhfuu20JlYZNH0v1ADCDD/SNedrLkdzPJVHDL6a
 Bp+Q==
X-Gm-Message-State: AOAM530yLU/A7zhsIMaGSKx1FsQM8Gln5v8GLsPiEaGGh2SWrnWSzCk2
 aviQmfkPKEwucWcvhANDsyrURA==
X-Google-Smtp-Source: ABdhPJwmXogs9mRGv2jlRZb23OXpZXjYiIbZO3DneWnknIYa/gnzuwIvWlJo2lVohz0CZ68O3Wgsxg==
X-Received: by 2002:a54:4703:: with SMTP id k3mr6969458oik.26.1616693038198;
 Thu, 25 Mar 2021 10:23:58 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id o64sm1182013oif.50.2021.03.25.10.23.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Mar 2021 10:23:57 -0700 (PDT)
Subject: Re: [PATCH for-6.0 0/4] Don't treat all sysbus devices as hotpluggable
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210325153310.9131-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <dbe71306-a4d9-c2a2-095b-e9d538810518@linaro.org>
Date: Thu, 25 Mar 2021 11:23:55 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210325153310.9131-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22e.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/25/21 9:33 AM, Peter Maydell wrote:
> On the two machines which have the "platform bus" (ppc e500 and arm
> virt) we currently treat all TYPE_SYS_BUS_DEVICE devices as being
> hotpluggable in the device callbacks, and try to plug those devices
> into the platform bus.  This is far too broad, because only a handful
> of devices are actually valid to plug into the platform bus.
> Moreover, if a device which is pluggable for some other reason (like
> a PCI device) happens to use a sysbus device internally as part of
> its implementation, the hotplug callback will incorrectly grab that
> sysbus device, probably resulting in an assertion failure.
> 
> Mostly PCI devices don't use sysbus devices internally, so the only
> case we've encountered so far is the not-valid-anyway
>   qemu-system-ppc64 -M ppce500 -device macio-oldworld
> but we might create more in future.
> 
> This series restricts hotpluggability of sysbus devices on these
> platforms to those devices which are on the dynamic sysbus whitelist

s/whitelist/allowlist/g ?

>    include/hw/boards.h: Document machine_class_allow_dynamic_sysbus_dev()
>    machine: Provide a function to check the dynamic sysbus whitelist
>    hw/arm/virt: Only try to add valid dynamic sysbus devices to platform
>      bus
>    hw/ppc/e500plat: Only try to add valid dynamic sysbus devices to
>      platform bus

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

