Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3AF62673B
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Nov 2022 06:58:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otjWR-0000jK-Jf; Sat, 12 Nov 2022 00:57:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otjWP-0000jA-I0
 for qemu-devel@nongnu.org; Sat, 12 Nov 2022 00:57:41 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otjWN-00071U-OH
 for qemu-devel@nongnu.org; Sat, 12 Nov 2022 00:57:41 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 d13-20020a17090a3b0d00b00213519dfe4aso6362660pjc.2
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 21:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MPn5a6x5W6FEqVJuysGvsCZDulMVpGiWR/r9ViAtJHM=;
 b=kD89fmEcMLJNhhoToprrX6KzYz6R9fNP7A+RiCz8J3GablqSAEfHrA1Uy0h5WbEJsb
 N0Y0qx1wd3zB0rgv1Ce2Fz4k5LZn6DETOiZdLheGOTcM/iFt6Qqu/UWuiedur7znaILP
 RkbMIJp9T2oJonrNUaXLpbqHx0p/Lldy96icb4shNJAD16XX0oe05ndymdzR9a/feA87
 1BVP+sT+tyIJBSKloeff/mm47w6ubMohQUjlmOquPG8ajtAFJi1+7aouo5MN7rK9BHsz
 2ibT9Wlqqw6EI2fHvGo1rpG10W7axw8gwXAOi6cmR0vZWjQ0dzVNRY+m2F1+AHSHexrS
 hdOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MPn5a6x5W6FEqVJuysGvsCZDulMVpGiWR/r9ViAtJHM=;
 b=24hnGG2CaV+H1HpVxHew4BO2DzQQ9Rqy8Lu+eUZ5Q46u2Z7zjBmfsR9/oIp2c3Yy+z
 8BjBmg8KxKHMstxiBc0Cavl1tnrghC5ITLWD1FMzsFfHJqHXDcqYRKXwVJOj1glZKRt2
 JkWgfHnZUQqWW9vtqK/rJez5q4tZWV2EoYJX/6ZxlVO9sAj4RBc+8DfMbW2dbAToyuZm
 yfmHvDRb4ewqwZahnLmr0gilRM3Np+G+xexs6bCdlwZYV5ujqhdkWI3Vm5lLDvqlwv4j
 0vF3ahJmW+6m8LYiY8/xmMl1YAqpg6aMkoGGqZ+xY3YaNrYlgCmIZ5mjSjW352qcnrps
 qj+g==
X-Gm-Message-State: ANoB5pknt258748QzTb8uEA7vfRHdemMcG0W+3ycPalC+BLm3AnxHw5h
 riFlaHU7UxXoCAV1AKcWD6Ki+w==
X-Google-Smtp-Source: AA0mqf7Vz49+eUH0h2yekWtBUM2/UOPvrHRmDBnRfi96quQDNuProKKCrxGWvL41zmnGAnRQApC0Dg==
X-Received: by 2002:a17:90a:de0a:b0:20a:db08:8a8a with SMTP id
 m10-20020a17090ade0a00b0020adb088a8amr5168489pjv.141.1668232658067; 
 Fri, 11 Nov 2022 21:57:38 -0800 (PST)
Received: from ?IPV6:2001:44b8:2176:c800:8228:b676:fb42:ee07?
 (2001-44b8-2176-c800-8228-b676-fb42-ee07.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:8228:b676:fb42:ee07])
 by smtp.gmail.com with ESMTPSA id
 w18-20020a170902c79200b001754064ac31sm2681683pla.280.2022.11.11.21.57.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Nov 2022 21:57:37 -0800 (PST)
Message-ID: <bc004885-a785-b903-f4c3-03292ea66e60@linaro.org>
Date: Sat, 12 Nov 2022 15:57:30 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v5 17/20] hw/intc: properly model IOAPIC MSI messages
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: f4bug@amsat.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Xu <peterx@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20221111182535.64844-1-alex.bennee@linaro.org>
 <20221111182535.64844-18-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221111182535.64844-18-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
> On the real HW the IOAPIC is wired directly to the APIC and doesn't
> really generate memory accesses on the main bus of the system. To
> model this we can use the MTRT_MACHINE requester type and set the id
> as a magic number to represent the IOAPIC as the source.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Peter Xu <peterx@redhat.com>
> ---
>   include/hw/i386/ioapic_internal.h |  2 ++
>   hw/intc/ioapic.c                  | 35 ++++++++++++++++++++++++-------
>   2 files changed, 30 insertions(+), 7 deletions(-)
> 
> diff --git a/include/hw/i386/ioapic_internal.h b/include/hw/i386/ioapic_internal.h
> index 9880443cc7..a8c7a1418a 100644
> --- a/include/hw/i386/ioapic_internal.h
> +++ b/include/hw/i386/ioapic_internal.h
> @@ -82,6 +82,8 @@
>   
>   #define IOAPIC_VER_ENTRIES_SHIFT        16
>   
> +/* Magic number to identify IOAPIC memory transactions */
> +#define MEMTX_IOAPIC                    0xA71C

Closing in on 1337 5p34k -- sure you didn't want a '4' there to start?  ;-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

