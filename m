Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADAF625D87
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 15:53:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otVOj-0005aR-QN; Fri, 11 Nov 2022 09:52:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1otVOi-0005Zs-Bb
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 09:52:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1otVOg-0006ju-KC
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 09:52:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668178365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PXmRF2vssYN2uZDCe/oG8i2Xy9JC/kO7icx0j+fkicU=;
 b=IgIUDSjQ/nu42c7YFpv2SJ3Rd5Z/ha8tBv+tMeG8JSDawE7atN4mNI4zSuuMpHe2q0Ud4i
 Jo3fTn4Vb6dLjR9FtNHtSmrT1HIyQWed4cOx2BKkErf4HTCQ0Sr8y5/LMIVqr4+2vR5pQy
 vK/ON7Iy2VPUSVvj6vNfl40itIwpdV8=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-316-Zy9TuYofMKykYy2FSr1HMA-1; Fri, 11 Nov 2022 09:52:44 -0500
X-MC-Unique: Zy9TuYofMKykYy2FSr1HMA-1
Received: by mail-qk1-f198.google.com with SMTP id
 x2-20020a05620a448200b006fa7dad5c1cso4914586qkp.10
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 06:52:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PXmRF2vssYN2uZDCe/oG8i2Xy9JC/kO7icx0j+fkicU=;
 b=BPpqYkIhGkIXCwetpYJivlg9XXrkgUDcOn7DJzbU7l26K0BCfQGBgHpo0+eq2J/ukL
 Z3SJpw/uCfdELl6YqM4eSrEzbvONy3UcUEEO0Eoav/qe0aDUTjxgRAIvd9LXx1gr+YuL
 tXNcCVoBO4zJEDOb3C7ti4irn4leih2SHuJI/ytnOgLGtuDC6mxFgPKr/sUavithho06
 OxZ2y6lnga6Fn13lo9BRdnTtkA8H45ACQCr1UQk3dyd5JWdx5OmGMdisaHL3vOzGqPFV
 WnbAEC010pHMt2jpu3Rycnltta3ZZYqsG9xKXJt60wELqzV9MucwLwekwMbPMOes5VTc
 RHMg==
X-Gm-Message-State: ANoB5pnV6Lzl9QjW7fXkRKn2mGK2k1FycDFgZqqJ+UmgK5TlZcfrNdbn
 XcJ+UVHZRaIAgg5ex0Rky4a2+FaiFldJ5JHQh2zP1RpoLZmeiMo8K5rhqu4HqteFShnY/8g46wp
 4Isk51f5Z8pDxPEI=
X-Received: by 2002:ac8:5381:0:b0:3a5:73b6:9184 with SMTP id
 x1-20020ac85381000000b003a573b69184mr1505832qtp.602.1668178363853; 
 Fri, 11 Nov 2022 06:52:43 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5QigCdP9CghrmOkufDV8OpJdPpLWxlWaxsmnQd5QWj6cn2mT3kRDeUMF3Jpl/sSKgFieUkDA==
X-Received: by 2002:ac8:5381:0:b0:3a5:73b6:9184 with SMTP id
 x1-20020ac85381000000b003a573b69184mr1505809qtp.602.1668178363625; 
 Fri, 11 Nov 2022 06:52:43 -0800 (PST)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 bv11-20020a05622a0a0b00b00398ed306034sm1326667qtb.81.2022.11.11.06.52.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Nov 2022 06:52:42 -0800 (PST)
Message-ID: <9b727d28-7fa2-ccd0-73b7-d5a3de9fec47@redhat.com>
Date: Fri, 11 Nov 2022 15:52:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 1/3] accel: introduce accelerator blocker API
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, kvm@vger.kernel.org
References: <20221110164807.1306076-1-eesposit@redhat.com>
 <20221110164807.1306076-2-eesposit@redhat.com>
 <9e6288e1-0c51-bd3f-5cee-c71049ffa684@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <9e6288e1-0c51-bd3f-5cee-c71049ffa684@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



Am 11/11/2022 um 11:48 schrieb Paolo Bonzini:
> On 11/10/22 17:48, Emanuele Giuseppe Esposito wrote:
>> +/*
>> + * QEMU accel blocker class
> 
> "Lock to inhibit accelerator ioctls"
> 
>> + *
>> + * Copyright (c) 2014 Red Hat Inc.
> 
> 2022, you can also add an Author line.
> 
>> +static int accel_in_ioctls(void)
> 
> Return bool (and return early if ret becomes true).
> 
>> +void accel_ioctl_inhibit_begin(void)
>> +{
>> +    CPUState *cpu;
>> +
>> +    /*
>> +     * We allow to inhibit only when holding the BQL, so we can identify
>> +     * when an inhibitor wants to issue an ioctl easily.
>> +     */
>> +    g_assert(qemu_mutex_iothread_locked());
>> +
>> +    /* Block further invocations of the ioctls outside the BQL.  */
>> +    CPU_FOREACH(cpu) {
>> +        qemu_lockcnt_lock(&cpu->in_ioctl_lock);
>> +    }
>> +    qemu_lockcnt_lock(&accel_in_ioctl_lock);
>> +
>> +    /* Keep waiting until there are running ioctls */
>> +    while (accel_in_ioctls()) {
>> +        /* Reset event to FREE. */
>> +        qemu_event_reset(&accel_in_ioctl_event);
>> +
>> +        if (accel_in_ioctls()) {
>> +
>> +            CPU_FOREACH(cpu) {
>> +                /* exit the ioctl */
>> +                qemu_cpu_kick(cpu);
> 
> Only kick if the lockcnt count is > 0? (this is not racy; if it is == 0,
> it cannot ever become > 0 again while the lock is taken)

Better:

accel_has_to_wait(void)
{
    CPUState *cpu;
    bool needs_to_wait = false;

    CPU_FOREACH(cpu) {
        if (qemu_lockcnt_count(&cpu->in_ioctl_lock)) {
            qemu_cpu_kick(cpu);
            needs_to_wait = true;
        }
    }

    return needs_to_wait || qemu_lockcnt_count(&accel_in_ioctl_lock);
}

And then the loop becomes:

while (true) {
        qemu_event_reset(&accel_in_ioctl_event);

        if (accel_has_to_wait()) {
            qemu_event_wait(&accel_in_ioctl_event);
        } else {
            /* No ioctl is running */
            return;
        }
}

> 
>> diff --git a/include/sysemu/accel-blocker.h
>> b/include/sysemu/accel-blocker.h
>> new file mode 100644
>> index 0000000000..135ebea566
>> --- /dev/null
>> +++ b/include/sysemu/accel-blocker.h
>> @@ -0,0 +1,45 @@
>> +/*
>> + * Accelerator blocking API, to prevent new ioctls from starting and
>> wait the
>> + * running ones finish.
>> + * This mechanism differs from pause/resume_all_vcpus() in that it
>> does not
>> + * release the BQL.
>> + *
>> + *  Copyright (c) 2014 Red Hat Inc.
> 
> 2022, you can also add an Author line here too.
> 
>> + * This work is licensed under the terms of the GNU GPL, version 2 or
>> later.
>> + * See the COPYING file in the top-level directory.
>> + */
>> +#ifndef ACCEL_BLOCKER_H
>> +#define ACCEL_BLOCKER_H
>> +
>> +#include "qemu/osdep.h"
>> +#include "qemu/accel.h"
> 
> qemu/accel.h not needed?
> 
>> +#include "sysemu/cpus.h"
>> +
>> +extern void accel_blocker_init(void);
>> +
>> +/*
>> + * accel_set_in_ioctl/accel_cpu_set_in_ioctl:
>> + * Mark when ioctl is about to run or just finished.
>> + * If @in_ioctl is true, then mark it is beginning. Otherwise marks
>> that it is
>> + * ending.
>> + *
>> + * These functions will block after accel_ioctl_inhibit_begin() is
>> called,
>> + * preventing new ioctls to run. They will continue only after
>> + * accel_ioctl_inibith_end().
>> + */
>> +extern void accel_set_in_ioctl(bool in_ioctl);
>> +extern void accel_cpu_set_in_ioctl(CPUState *cpu, bool in_ioctl);
> 
> Why not just
> 
> extern void accel_ioctl_begin(void);
> extern void accel_ioctl_end(void);
> extern void accel_cpu_ioctl_begin(CPUState *cpu);
> extern void accel_cpu_ioctl_end(CPUState *cpu);
> 
> ?

Ok, makes sense.

Thank you,
Emanuele

> 
> Otherwise it's very nice.
> 
> Paolo
> 


