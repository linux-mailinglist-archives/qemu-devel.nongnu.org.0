Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 867664B445A
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 09:37:19 +0100 (CET)
Received: from localhost ([::1]:39136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJWrG-0004iD-9Z
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 03:37:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nJWb7-0001rK-C8
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 03:20:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nJWb3-0001XY-UF
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 03:20:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644826832;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pESJdCq4+57H18iaKUReLi6KShaSen5hfJ4ns0dW7vg=;
 b=Q4t8lgqVXtz++nD/Je13P9Aq04XZuh1wjWi724meERIwxHsZQRScZIMMJm/Yowp4t15yJe
 J4wxRcFYBfbTC5qMBJlFnLrEPKGqth7KwaaFHoClY5liZ1JdFaRtfFoQeNdFGEMsckT/9k
 z9HM3bjtXgvD56Qz//Gh539RluYMp64=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-596-73HItLa6NqqoZA-nJ05xsQ-1; Mon, 14 Feb 2022 03:20:31 -0500
X-MC-Unique: 73HItLa6NqqoZA-nJ05xsQ-1
Received: by mail-pj1-f71.google.com with SMTP id
 y10-20020a17090a134a00b001b8b7e5983bso10448374pjf.6
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 00:20:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pESJdCq4+57H18iaKUReLi6KShaSen5hfJ4ns0dW7vg=;
 b=YCSIoOT+AvcHQxhI1EmxX38L6eG49IW34sPHdSyU82EbJqNh5b34Davnp/5kH/BChk
 QUUq52ZQkDJuJZfzlel2mRCY8fO61uDYKTOLRpo1MbociO/yiBq+rD8wogXApeD7vS5W
 O0HfmGdzRyORLgpBozQa0gbZz9OJv1wBP7YHvT6qMLlFBuvlykXjt9/aJC+JZbLA95Zq
 9hBIk4IaGMjx9yeGxzxDM6oGI8tuxKn+bVQu5jI3osivaDlw3lZClw2i35v+hgRek+J4
 OxCfSzMdG/fNNs4RbhKbuBuvhscwG2L1DjFZ+fSDaJSTzM5qqZK95c/tIrPxfsDSPcuW
 Xq7g==
X-Gm-Message-State: AOAM530F6bB8IwSyHzbIE+gvlQLCzSrQyegh48uLDlLTUFdFt96ZzisG
 IrKSWtnNsZ6PFyu+XksMgW0FGcMN5dsi+iX7F2w/lFvofkYee3/lsdiehkGuVsqOUfMiu6jrmSB
 LN8HcWcBYxxhe7ps=
X-Received: by 2002:a05:6a00:793:: with SMTP id
 g19mr13357031pfu.21.1644826829713; 
 Mon, 14 Feb 2022 00:20:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwy6eUtRx6O4EFMAI/x/v1o3C5tSBJZLCP+2KRyJpnnQ/JqYEEtAFL/jfXvj8P4iJBz+2Sivg==
X-Received: by 2002:a05:6a00:793:: with SMTP id
 g19mr13357016pfu.21.1644826829423; 
 Mon, 14 Feb 2022 00:20:29 -0800 (PST)
Received: from xz-m1.local ([94.177.118.137])
 by smtp.gmail.com with ESMTPSA id e30sm25458300pge.34.2022.02.14.00.20.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 00:20:29 -0800 (PST)
Date: Mon, 14 Feb 2022 16:20:21 +0800
From: Peter Xu <peterx@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [PATCH v14 6/7] softmmu/dirtylimit: Implement virtual CPU throttle
Message-ID: <YgoQxbzrNleQT9TH@xz-m1.local>
References: <cover.1644509582.git.huangy81@chinatelecom.cn>
 <ad0a6e05b5bec2c2c8dd3a7663e39e3cf9af71a3.1644509582.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <ad0a6e05b5bec2c2c8dd3a7663e39e3cf9af71a3.1644509582.git.huangy81@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, David Hildenbrand <david@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Markus ArmBruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 11, 2022 at 12:17:40AM +0800, huangy81@chinatelecom.cn wrote:
> @@ -2964,8 +2971,13 @@ int kvm_cpu_exec(CPUState *cpu)
>               */
>              trace_kvm_dirty_ring_full(cpu->cpu_index);
>              qemu_mutex_lock_iothread();
> -            kvm_dirty_ring_reap(kvm_state, NULL);
> +            if (dirtylimit_in_service()) {
> +                kvm_dirty_ring_reap(kvm_state, cpu);
> +            } else {
> +                kvm_dirty_ring_reap(kvm_state, NULL);
> +            }

Could you add some comment here on why the cpu pointer is conditionally passed
into the reaping routine?  Even if we know it now, it's not immediately obvious
to all the readers.

[...]

> +struct {
> +    VcpuDirtyLimitState *states;
> +    /* Max cpus number configured by user */
> +    int max_cpus;
> +    /* Number of vcpu under dirtylimit */
> +    int limited_nvcpu;
> +    /* Function to implement throttle set up */
> +    DirtyLimitFunc setup;

"setup" normally is used only at startup of something, but not per interval.
Perhaps "process" or "adjust"?  Same across other "setup" namings across the
patch.

Again, I'd rather call the function directly..

[...]

> +static void dirtylimit_adjust_throttle(CPUState *cpu)
> +{
> +    uint64_t quota = 0;
> +    uint64_t current = 0;
> +    int cpu_index = cpu->cpu_index;
> +
> +    quota = dirtylimit_vcpu_get_state(cpu_index)->quota;
> +    current = vcpu_dirty_rate_get(cpu_index);
> +
> +    if (current == 0) {
> +        cpu->throttle_us_per_full = 0;
> +        goto end;

Can be dropped?

> +    } else if (dirtylimit_done(quota, current)) {
> +        goto end;

Same here.  Dropping it wholely and:

       } else if (!dirtylimit_done(quota, current)) {
           dirtylimit_set_throttle(cpu, quota, current);
       }

Would work?

> +    } else {
> +        dirtylimit_set_throttle(cpu, quota, current);
> +    }
> +end:

Can be dropped?

> +    trace_dirtylimit_adjust_throttle(cpu_index,
> +                                     quota, current,
> +                                     cpu->throttle_us_per_full);
> +    return;
> +}
> +
> +void dirtylimit_setup(void)
> +{
> +    CPUState *cpu;
> +
> +    if (!qatomic_read(&dirtylimit_quit)) {
> +        dirtylimit_state_lock();
> +
> +        if (!dirtylimit_in_service()) {
> +            dirtylimit_state_unlock();

Need to return?

> +        }
> +
> +        CPU_FOREACH(cpu) {
> +            if (!dirtylimit_vcpu_get_state(cpu->cpu_index)->enabled) {
> +                continue;
> +            }
> +            dirtylimit_adjust_throttle(cpu);
> +        }
> +        dirtylimit_state_unlock();
> +    }
> +}

[...]

> +void dirtylimit_set_vcpu(int cpu_index,
> +                         uint64_t quota,
> +                         bool enable)
> +{
> +    dirtylimit_vcpu_set_quota(cpu_index, quota, enable);
> +    trace_dirtylimit_set_vcpu(cpu_index, quota);
> +}

This helper is not "help"ful..  How about wrapping the trace into
dirtylimit_vcpu_set_quota, then drop it?

Thanks,

-- 
Peter Xu


