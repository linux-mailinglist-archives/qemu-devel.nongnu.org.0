Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 563C530DD46
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 15:53:34 +0100 (CET)
Received: from localhost ([::1]:36194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7JXB-0003Sz-DM
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 09:53:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7JVc-00028m-Fh
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 09:51:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25241)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7JVZ-0004ku-Ih
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 09:51:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612363913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X3uAhg0GMc6s7DlD4mofxWRASu9CWPROKaK1dxCZDjw=;
 b=QIco2mE9phrcedx6jdEnCM10Vol+heKgTy5fmOiZ9KOlp0ExshQ0a/gDV7AFPoON1EoXyK
 UnBncd9ThxC8TkKJYRhN+F5YGGZ18WKS9HEkVG27/3JfMQ8kdsWS5+wMYYHlVu5m+UJucE
 4JmUuOuFqjvMZlcKIArikCAOPtwKqFI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509--QrnnmxzMLmwW4qs0AqBQw-1; Wed, 03 Feb 2021 09:51:51 -0500
X-MC-Unique: -QrnnmxzMLmwW4qs0AqBQw-1
Received: by mail-ed1-f71.google.com with SMTP id f4so11678407eds.5
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 06:51:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=X3uAhg0GMc6s7DlD4mofxWRASu9CWPROKaK1dxCZDjw=;
 b=Pnjsi380bSMOsk/z+9NS6GI14oPS0KWPbfe238vNqxHn/eI7C0ebziHhdGfjg+x2/d
 jj9BBy4MOUKxVaGafai7KJDXxJK3dbJGBrK3N0XKOROGrFfedG7IT64SpxLTwspZw+s6
 yGCY3/nL9pnr7npYVM7UBYa4Ajjb7Urmxjdz8/M39MzYcJlBCpewveY8zV57hdfrCBo4
 tvj59xcE/4Hiw1Ev4sTeM7ylsZ5KAY6KMDJubHtQvjmJJZwUllQtJOQ6ncPfat24fYEL
 xaiXgXoKgiNiKDZhmbasIO9DDvMFvW8Vw3nNRhK5q/NANMMj+B3Rt6kcnzAOMScYb0+k
 QLxA==
X-Gm-Message-State: AOAM532x7Cvs5MJPa33WgN/Ed/Qpe4QqoParMHTNdf7tQw/GpT19ucht
 5A5x9UaZi/HimLX1+GRbvRk9+QnRQ6ileQRU6172pFpuld4x0FwL+2BEw4dT4438VQof3eHwvhr
 fF0B9xyTZbCfW2wP7BXDTrZc2M3Fj93yyF+CevnnNoI3R++5tkblXD2xNcXKv2dpR
X-Received: by 2002:a05:6402:d:: with SMTP id
 d13mr3317117edu.274.1612363909970; 
 Wed, 03 Feb 2021 06:51:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxUsBZfd2hNSBd/1krGFqpjqyeZBwRFCKtJPuzmzfUvS9rkLaonoJgzd46GyA/F815F+PPb5g==
X-Received: by 2002:a05:6402:d:: with SMTP id
 d13mr3317095edu.274.1612363909799; 
 Wed, 03 Feb 2021 06:51:49 -0800 (PST)
Received: from [192.168.1.36] (107.red-83-59-163.dynamicip.rima-tde.net.
 [83.59.163.107])
 by smtp.gmail.com with ESMTPSA id f6sm967667edv.83.2021.02.03.06.51.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Feb 2021 06:51:49 -0800 (PST)
Subject: Re: [PATCH v15 18/23] accel: introduce AccelCPUClass extending
 CPUClass
To: Claudio Fontana <cfontana@suse.de>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210201100903.17309-1-cfontana@suse.de>
 <20210201100903.17309-19-cfontana@suse.de>
 <efc3d892-027d-a480-363d-7aae6a8f8543@redhat.com>
 <1adffa3e-ec17-9c67-7355-0ec5a107c065@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <aaa5f60d-e4c3-282c-3e12-98f8bb87ee76@redhat.com>
Date: Wed, 3 Feb 2021 15:51:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1adffa3e-ec17-9c67-7355-0ec5a107c065@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.178, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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

On 2/3/21 3:49 PM, Claudio Fontana wrote:
> On 2/3/21 3:27 PM, Philippe Mathieu-Daudé wrote:
>> On 2/1/21 11:08 AM, Claudio Fontana wrote:
>>> add a new optional interface to CPUClass, which allows accelerators
>>> to extend the CPUClass with additional accelerator-specific
>>> initializations.
>>>
>>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>>> ---
>>>  include/hw/core/accel-cpu.h | 35 +++++++++++++++++++++++++++++
>>>  include/hw/core/cpu.h       |  1 +
>>>  accel/accel-common.c        | 44 +++++++++++++++++++++++++++++++++++++
>>>  MAINTAINERS                 |  1 +
>>>  4 files changed, 81 insertions(+)
>>>  create mode 100644 include/hw/core/accel-cpu.h
>>>
>>> diff --git a/include/hw/core/accel-cpu.h b/include/hw/core/accel-cpu.h
>>> new file mode 100644
>>> index 0000000000..c7c137dc9a
>>> --- /dev/null
>>> +++ b/include/hw/core/accel-cpu.h
>>> @@ -0,0 +1,35 @@
>>> +/*
>>> + * Accelerator interface, specializes CPUClass
>>> + *
>>> + * Copyright 2021 SUSE LLC
>>> + *
>>> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
>>> + * See the COPYING file in the top-level directory.
>>> + */
>>> +
>>> +#ifndef ACCEL_CPU_H
>>> +#define ACCEL_CPU_H
>>> +
>>> +/*
>>> + * these defines cannot be in cpu.h, because we are using
>>> + * CPU_RESOLVING_TYPE here.
>>> + * Use this header to define your accelerator-specific
>>> + * cpu-specific accelerator interfaces.
>>> + */
>>> +
>>> +#define TYPE_ACCEL_CPU "accel-" CPU_RESOLVING_TYPE
>>> +#define ACCEL_CPU_NAME(name) (name "-" TYPE_ACCEL_CPU)
>>> +typedef struct AccelCPUClass AccelCPUClass;
>>> +DECLARE_CLASS_CHECKERS(AccelCPUClass, ACCEL_CPU, TYPE_ACCEL_CPU)
>>> +
>>> +typedef struct AccelCPUClass {
>>> +    /*< private >*/
>>> +    ObjectClass parent_class;
>>> +    /*< public >*/
>>> +
>>> +    void (*cpu_class_init)(CPUClass *cc);
>>> +    void (*cpu_instance_init)(CPUState *cpu);
>>> +    void (*cpu_realizefn)(CPUState *cpu, Error **errp);
>>> +} AccelCPUClass;
>>
>> This header only makes sense if you forward-declare CPUClass
>> in "qemu/typedefs.h", so accelerators don't have to include
>> "hw/core/cpu.h".
>>
> 
> Can you clarify what you mean? I don't see how it follows that this header only makes sense if I forward-declare CPUClass.
> 
> This is necessary for the accel-specific target-specific code that needs to extend cpu classes with Accel CPU interfaces,
> in this series f.e.:
> 
> target/i386/kvm/kvm-cpu.c
> target/i386/hvf/hvf-cpu.c
> target/i386/tcg/tcg-cpu.c

Why not keep theses declarations in "hw/core/cpu.h", rather than
adding a new header? What is the point of the new header?


