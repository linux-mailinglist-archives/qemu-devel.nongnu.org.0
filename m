Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68DFF3076A8
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 14:04:35 +0100 (CET)
Received: from localhost ([::1]:55244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l56yQ-0000Cn-7s
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 08:04:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l56xO-0008Ba-3C
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 08:03:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l56xI-0007ir-MK
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 08:03:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611839002;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k66rmxWzoB9VS5hRWuT7meE8+fUD4m85+SfYXUPt3VY=;
 b=C3StAk9AzYR4taeykDkbfCwCDD404QvzTu+Gs9CbKnqNZdX8q9W+9mMxHUOG4eKh8TMt5g
 VaD1CoQXUEo4w9YunZnyNqu9oXMwwAtclebZeucyChzUOMOhMAN5XD05XhycOGrk33AhDn
 oaYHXFKdFHIBoxGgo1/mG89+jqJfchY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-KHdRwyCQOxacKRUb8ZPJBQ-1; Thu, 28 Jan 2021 08:03:18 -0500
X-MC-Unique: KHdRwyCQOxacKRUb8ZPJBQ-1
Received: by mail-ed1-f71.google.com with SMTP id t9so3144394edd.3
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 05:03:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=k66rmxWzoB9VS5hRWuT7meE8+fUD4m85+SfYXUPt3VY=;
 b=oW6OxZutYD0RTa/bhNK50FF+LYHpSsLsq8ADRAGBzF4RC1ygts5awEkU0WcA7ccIG3
 HGDaYazJvP14tmkxPC+LGFmyhgHffMz1290AAZrkfmTkymvSlBTrvv8+iel3PHDtF1p1
 n7fh4Z87z7fuZGJo448rbzJd9HpARSUhXEZlqPx5CYMmCdxRvu2cB1Q36GLaUoz/7Rvc
 z3JfvTPOAvREBZvV2BaVoFcRx1aDHO9mEidHy0izYboarXQYopciZe/mCBub18UJ+gV4
 nw/pb0DBdhD08bSJNeZvz+88snTgn+LtJdgmVKbu3QKe8n9b6zbc1amdpYdr2A+fdoF6
 0n3A==
X-Gm-Message-State: AOAM531QzEml16s7ErFKjKz4SfB+I1x65gTBdWHo1BZW73zoDjil2QLR
 Q9Mk3y6QObceja5H0rvTxMfoPDDizc1Hxq51cj7D4alAoNjn6MZSZ1eeRsrhs4fFa/hD6XRZYm5
 Vzyo37sQlPoqBV6kaKG6ck/4SpVWaoRJv7Y8QvrXDxgkOruGMpFtYw5PqOQc2BDQS
X-Received: by 2002:a05:6402:1155:: with SMTP id
 g21mr13919116edw.279.1611838997022; 
 Thu, 28 Jan 2021 05:03:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyh1bPquhGZcaRT5/z8m+A0TnqPyyYJcz0h8jFWQW94HMZy+g32kibIbclQprrkVoJ0r8pTFw==
X-Received: by 2002:a05:6402:1155:: with SMTP id
 g21mr13919066edw.279.1611838996732; 
 Thu, 28 Jan 2021 05:03:16 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id b26sm3028944eds.48.2021.01.28.05.03.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jan 2021 05:03:15 -0800 (PST)
Subject: Re: [PATCH v14 18/22] accel: introduce AccelCPUClass extending
 CPUClass
To: Claudio Fontana <cfontana@suse.de>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
References: <20210128092814.8676-1-cfontana@suse.de>
 <20210128092814.8676-19-cfontana@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <64d8385c-db22-b647-2402-3840b0e0e9b5@redhat.com>
Date: Thu, 28 Jan 2021 14:03:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210128092814.8676-19-cfontana@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/28/21 10:28 AM, Claudio Fontana wrote:
> add a new optional interface to CPUClass,
> which allows accelerators to extend the CPUClass
> with additional accelerator-specific initializations.
> 
> Add the field before tcg_ops, and mark tcg_ops as
> needing to be last in the struct until we rework this
> further in a later patch.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>  include/hw/core/accel-cpu.h | 35 +++++++++++++++++++++++++++++
>  include/hw/core/cpu.h       |  1 +
>  accel/accel-common.c        | 44 +++++++++++++++++++++++++++++++++++++
>  MAINTAINERS                 |  1 +
>  4 files changed, 81 insertions(+)
>  create mode 100644 include/hw/core/accel-cpu.h
> 
> diff --git a/include/hw/core/accel-cpu.h b/include/hw/core/accel-cpu.h
> new file mode 100644
> index 0000000000..246b3e2fcb
> --- /dev/null
> +++ b/include/hw/core/accel-cpu.h
> @@ -0,0 +1,35 @@
> +/*
> + * Accelerator interface, specializes CPUClass
> + *
> + * Copyright 2020 SUSE LLC

2020-2021 ;)

> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#ifndef ACCEL_CPU_H
> +#define ACCEL_CPU_H
> +
> +/*
> + * these defines cannot be in cpu.h, because we are using
> + * CPU_RESOLVING_TYPE here.
> + * Use this header to define your accelerator-specific
> + * cpu-specific accelerator interfaces.
> + */
> +
> +#define TYPE_ACCEL_CPU "accel-" CPU_RESOLVING_TYPE
> +#define ACCEL_CPU_NAME(name) (name "-" TYPE_ACCEL_CPU)
> +typedef struct AccelCPUClass AccelCPUClass;
> +DECLARE_CLASS_CHECKERS(AccelCPUClass, ACCEL_CPU, TYPE_ACCEL_CPU)
> +
> +typedef struct AccelCPUClass {
> +    /*< private >*/
> +    ObjectClass parent_class;
> +    /*< public >*/
> +
> +    void (*cpu_class_init)(CPUClass *cc);
> +    void (*cpu_instance_init)(CPUState *cpu);
> +    void (*cpu_realizefn)(CPUState *cpu, Error **errp);

If we want callers to check errp, better have the prototype return
a boolean.

> +} AccelCPUClass;


