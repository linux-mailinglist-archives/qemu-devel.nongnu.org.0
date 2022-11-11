Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B8F6258AC
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 11:49:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otRaW-0007Yb-B5; Fri, 11 Nov 2022 05:48:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1otRaP-0007Wm-D9
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 05:48:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.145.221.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1otRaL-0007RG-89
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 05:48:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668163711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4xZXYzX//SCthjxfoxPXs7VbypzGHRDY565s7tRX7fI=;
 b=IyPV51sg6cpPms1II6zA8Zwz14fJg+xDklH1al44QL04iqYn4+1vPUliG2UeehEpz475nL
 M3Qa07e6cWAEq4GRgSL6e70NOxl7f9Hcq7EkhhvgBqp0FMcMeljPcFDjyPIvh51zPcFjsC
 MjKnubo3jx2DDq6/zS4yXMNr64ef+FE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-2-4xYpfRJHPo2DWp6TE7XN6A-1; Fri, 11 Nov 2022 05:48:30 -0500
X-MC-Unique: 4xYpfRJHPo2DWp6TE7XN6A-1
Received: by mail-wm1-f70.google.com with SMTP id
 i82-20020a1c3b55000000b003cf9bd60855so2388281wma.6
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 02:48:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4xZXYzX//SCthjxfoxPXs7VbypzGHRDY565s7tRX7fI=;
 b=X98VxM1CXskAZckFq2gA0IjjslRAKY9iFdD8eNRPndWznANHNPuP37HfSZNf0qBbla
 LggA3rcaGiTtW/RBkfdZt70D9Cq9cM7RiXblOUIxalY90Yz1E706cBkb70EK2jetWweh
 Rik3zchdQZ9TKTx0K9d4UY0xdhDteu+bwGxSzbYMOB575K02EozkHqPu793oF1ok3SUK
 x1zxxpAOAwXfD4Cz8VMC/et8ftvg6HABcI4y4yhc8nh6UK2fM+2N+3sMBcGCi73zqKbz
 tv/IgxUssoc1SIr6Q5602GHkrCXohfkhKpRmXKvYJ8L7Na2rWi/+CaffFgRdXfoDQqGa
 DSPA==
X-Gm-Message-State: ANoB5pm4iXHWH4qTe5CJJ3PSwbi6qSJJ3kIqeG3LFdu9ixSbpKSq4Yg+
 PEINzaUpIijAMTuS7FKGebNz4hN2KDLAEPo3LDnA9vgjVFfMUJXOYAXCtB7bgt4LVn7cgLL6Gom
 0uQUxs+rMVdVZdLA=
X-Received: by 2002:a5d:4c82:0:b0:236:56a6:823e with SMTP id
 z2-20020a5d4c82000000b0023656a6823emr870610wrs.495.1668163709071; 
 Fri, 11 Nov 2022 02:48:29 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6UIf/FE35s97C3qgAJi8XmxKJI7BAtYamrbZSPQ2i8PaD7UqbY+0IJoMS/ROo9EGxDaDyUSA==
X-Received: by 2002:a5d:4c82:0:b0:236:56a6:823e with SMTP id
 z2-20020a5d4c82000000b0023656a6823emr870595wrs.495.1668163708800; 
 Fri, 11 Nov 2022 02:48:28 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.googlemail.com with ESMTPSA id
 bj19-20020a0560001e1300b0022cdb687bf9sm1319651wrb.0.2022.11.11.02.48.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Nov 2022 02:48:28 -0800 (PST)
Message-ID: <9e6288e1-0c51-bd3f-5cee-c71049ffa684@redhat.com>
Date: Fri, 11 Nov 2022 11:48:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v2 1/3] accel: introduce accelerator blocker API
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, kvm@vger.kernel.org
References: <20221110164807.1306076-1-eesposit@redhat.com>
 <20221110164807.1306076-2-eesposit@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20221110164807.1306076-2-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: permerror client-ip=216.145.221.124;
 envelope-from=pbonzini@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_FAIL=0.001,
 SPF_HELO_NONE=0.001 autolearn=no autolearn_force=no
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

On 11/10/22 17:48, Emanuele Giuseppe Esposito wrote:
> +/*
> + * QEMU accel blocker class

"Lock to inhibit accelerator ioctls"

> + *
> + * Copyright (c) 2014 Red Hat Inc.

2022, you can also add an Author line.

> +static int accel_in_ioctls(void)

Return bool (and return early if ret becomes true).

> +void accel_ioctl_inhibit_begin(void)
> +{
> +    CPUState *cpu;
> +
> +    /*
> +     * We allow to inhibit only when holding the BQL, so we can identify
> +     * when an inhibitor wants to issue an ioctl easily.
> +     */
> +    g_assert(qemu_mutex_iothread_locked());
> +
> +    /* Block further invocations of the ioctls outside the BQL.  */
> +    CPU_FOREACH(cpu) {
> +        qemu_lockcnt_lock(&cpu->in_ioctl_lock);
> +    }
> +    qemu_lockcnt_lock(&accel_in_ioctl_lock);
> +
> +    /* Keep waiting until there are running ioctls */
> +    while (accel_in_ioctls()) {
> +        /* Reset event to FREE. */
> +        qemu_event_reset(&accel_in_ioctl_event);
> +
> +        if (accel_in_ioctls()) {
> +
> +            CPU_FOREACH(cpu) {
> +                /* exit the ioctl */
> +                qemu_cpu_kick(cpu);

Only kick if the lockcnt count is > 0? (this is not racy; if it is == 0, 
it cannot ever become > 0 again while the lock is taken)

> diff --git a/include/sysemu/accel-blocker.h b/include/sysemu/accel-blocker.h
> new file mode 100644
> index 0000000000..135ebea566
> --- /dev/null
> +++ b/include/sysemu/accel-blocker.h
> @@ -0,0 +1,45 @@
> +/*
> + * Accelerator blocking API, to prevent new ioctls from starting and wait the
> + * running ones finish.
> + * This mechanism differs from pause/resume_all_vcpus() in that it does not
> + * release the BQL.
> + *
> + *  Copyright (c) 2014 Red Hat Inc.

2022, you can also add an Author line here too.

> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +#ifndef ACCEL_BLOCKER_H
> +#define ACCEL_BLOCKER_H
> +
> +#include "qemu/osdep.h"
> +#include "qemu/accel.h"

qemu/accel.h not needed?

> +#include "sysemu/cpus.h"
> +
> +extern void accel_blocker_init(void);
> +
> +/*
> + * accel_set_in_ioctl/accel_cpu_set_in_ioctl:
> + * Mark when ioctl is about to run or just finished.
> + * If @in_ioctl is true, then mark it is beginning. Otherwise marks that it is
> + * ending.
> + *
> + * These functions will block after accel_ioctl_inhibit_begin() is called,
> + * preventing new ioctls to run. They will continue only after
> + * accel_ioctl_inibith_end().
> + */
> +extern void accel_set_in_ioctl(bool in_ioctl);
> +extern void accel_cpu_set_in_ioctl(CPUState *cpu, bool in_ioctl);

Why not just

extern void accel_ioctl_begin(void);
extern void accel_ioctl_end(void);
extern void accel_cpu_ioctl_begin(CPUState *cpu);
extern void accel_cpu_ioctl_end(CPUState *cpu);

?

Otherwise it's very nice.

Paolo


