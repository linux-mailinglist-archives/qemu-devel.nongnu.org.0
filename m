Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0EBF326EB5
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Feb 2021 20:02:23 +0100 (CET)
Received: from localhost ([::1]:60922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lG4r8-0007VL-B8
	for lists+qemu-devel@lfdr.de; Sat, 27 Feb 2021 14:02:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lG4oN-0006WI-8Y
 for qemu-devel@nongnu.org; Sat, 27 Feb 2021 13:59:31 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:46601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lG4oK-0003Ko-K9
 for qemu-devel@nongnu.org; Sat, 27 Feb 2021 13:59:31 -0500
Received: by mail-pg1-x52c.google.com with SMTP id h4so8336911pgf.13
 for <qemu-devel@nongnu.org>; Sat, 27 Feb 2021 10:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fumoWEvufGUqXz2ydHpb2ku6RD/nJbXOXTgn0QKGw0Q=;
 b=g+OO9dYyoUUDorYRWQcecLLNqn1EH9CMFDUSg9rWCmsSjN7whn1x/YYFnPUVuUcccw
 aFoSqQTPcxqfF/wS4QxmXSFY+I9wUISRu9v2viM2z/b0z9tQ0mrKCo889rOAj755Chxm
 kO5mIxf4xKKPiUPW5mEQTQHKHwSRPrpDQLU9Wrf9by1TJcKaOhtdMcjMve8mUKUcTApQ
 40ClLostH5b6XwAYkzB2BGaZA9vzQ0bp6r17sxn7PgzfYVg72XWn4M6DjYfwIOtiY4EB
 Uav1r6mozVCwK2+2TC3S42BHj407YPn4H0agNNKMDI1mhhQ/uu72W+APDayF04cl1BER
 hinw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fumoWEvufGUqXz2ydHpb2ku6RD/nJbXOXTgn0QKGw0Q=;
 b=ITa1cUPjLqqSNBr/A/GQ+33udFfYjQaJ8E3eH3CnaXPzFu+CEE0K1ADECJvcygHRfp
 0HAo249ZFjUIFL4t5EaWFhStCVH3a9VYSsv8ZFA5UsB5P4hlCK9/Z2ZsSikFUeeuL8Ax
 RUobpfN+YDTcmF3w7jgOoyeoiJean53D2zNgB9tAME2rGZEQb7UnCpcZbQTQXjAJyLxm
 YK/CwvyUudhEzMapBJYXHcIyoON6mtW4C/7/zHSUGCoUa9XY+PZG2sxkflEV9aDCwYy1
 WW/JZm4q5p4efkIpoYWFH1erVgRB1oWhL0q8wCNn+ucJmF7Vuk1kuDZC4XCiQ0nRkUJ6
 Qvww==
X-Gm-Message-State: AOAM53351x+LhEkNNlGYVVG2f/MMK4QPQnC+cAHW1xXz5xCRyoKI2KmM
 H1YkGpyGuZk4tqN88n4gftQNoA==
X-Google-Smtp-Source: ABdhPJyvNaVNSe53kCk5uJ0s3m4BeDlq7EKMbKPXl7BDoZl3wIfbtUKusGynjVh8y+Mh4G/sxUd31w==
X-Received: by 2002:a63:4e4c:: with SMTP id o12mr7711298pgl.143.1614452366715; 
 Sat, 27 Feb 2021 10:59:26 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id ep17sm12598344pjb.19.2021.02.27.10.59.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 27 Feb 2021 10:59:26 -0800 (PST)
Subject: Re: [RFC PATCH] cpu: system_ops: move to cpu-system-ops.h, keep a
 pointer in CPUClass
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210226164001.4102868-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <516603e7-d3ba-6958-41ec-ebcc52530d37@linaro.org>
Date: Sat, 27 Feb 2021 10:59:23 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210226164001.4102868-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.35,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/26/21 8:40 AM, Philippe Mathieu-Daudé wrote:
> +++ b/include/hw/core/cpu-system-ops.h
> @@ -0,0 +1,89 @@
> +/*
> + * CPU operations specific to system emulation
> + *
> + * Copyright (c) 2012 SUSE LINUX Products GmbH
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#ifndef CPU_SYSTEM_OPS_H
> +#define CPU_SYSTEM_OPS_H

I think you should create this header from the start, so that you don't have to
move the structure later.

> +/* see cpu-system-ops.h */
> +struct CPUSystemOperations;

In the beginning, you'd actually #include the new header here, and in this
final patch you'd remove the include and insert the declaration.

>      /* when system emulation is not available, this pointer is NULL */
> -    struct CPUSystemOperations system_ops;
> +    struct CPUSystemOperations *system_ops;

Insert the comment here, since the structure can't be null.  ;-)
Also, const.

>      /* when TCG is not available, this pointer is NULL */
>      struct TCGCPUOps *tcg_ops;

The only reason this one isn't const is hw/mips/jazz.  And I'm very tempted to
hack around that one.

> +static struct CPUSystemOperations arm_sysemu_ops = {
> +    .vmsd = &vmstate_arm_cpu,
> +    .get_phys_page_attrs_debug = arm_cpu_get_phys_page_attrs_debug,
> +    .asidx_from_attrs = arm_asidx_from_attrs,
> +    .virtio_is_big_endian = arm_cpu_virtio_is_big_endian,
> +    .write_elf64_note = arm_cpu_write_elf64_note,
> +    .write_elf32_note = arm_cpu_write_elf32_note,
> +};

const.


r~

