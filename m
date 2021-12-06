Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED481469196
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 09:37:09 +0100 (CET)
Received: from localhost ([::1]:49244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mu9Uj-00008G-2t
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 03:37:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mu9Tu-0007pu-I0
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 03:36:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mu9Ts-0006bR-Ro
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 03:36:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638779775;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7VbHiTbw102W9TykSCnvC2BGSeSwLzD7DZD13bpUcOY=;
 b=Y9gt+FavdufruAM73HZ/LR69wOhDeTBoO8/qFf7MTyWWyjDvpWmxOqfKSrYRLbM0h/biEB
 HPpNbVU+/xHKo6hfy1XGmjyJIBDVmUg68y0fY2CKKpDnqrakKigqVxxSuKLF0d6KD0G9o7
 O8qDSsRZt9vM5qVnGgnI+UBdHqNw/pc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-396-gMoW6PkyNy6mO-1qJMyAYw-1; Mon, 06 Dec 2021 03:36:12 -0500
X-MC-Unique: gMoW6PkyNy6mO-1qJMyAYw-1
Received: by mail-wr1-f71.google.com with SMTP id
 h13-20020adfa4cd000000b001883fd029e8so1781129wrb.11
 for <qemu-devel@nongnu.org>; Mon, 06 Dec 2021 00:36:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=7VbHiTbw102W9TykSCnvC2BGSeSwLzD7DZD13bpUcOY=;
 b=A7/Mv7QA6hsbE0gi2Uh7xKUl2zDVx/FdS1Q3zjPwiup4QgBQOM4ZLlIDPvR7uYhm6/
 uTSmCke0uKnuq+YGJpCpXTiYqX2VRlabgj3uWq/PziyP+4R9U4oY6MerZEeFYdXFxYrH
 sx+pwzpcMywPvzozjOXY/C8Ax1d1Ks6h6xXF+jO3VO93zYVH5SUJB+yd2dXtAP0UKcNK
 6IAxtZMvF7kV3MFUE61d5geZ33DfhD4xBeoy0IyU4cTROgmcsI8/DwbM2u73CSg4yl68
 RgmeTGdmfl5ujKoX5Jy05zDQSJNl0KYSGQ8l6IVa8Hf58yMCLywzJjbGZ7uai92Gl8zb
 0iZA==
X-Gm-Message-State: AOAM533JmjtUnq494++iu3gt/9q30lwRngCCJWIv24SS2AOwgdycLLqt
 LFaNCZJRhWASfBqIm20dfvlfy6DI8PSsR2qoQO/T+CvEEK84S+spn9Q3qzztWhoMsLBSCiwEcQg
 JsH0KC9TINnDw1QY=
X-Received: by 2002:a05:600c:2948:: with SMTP id
 n8mr36792673wmd.170.1638779771150; 
 Mon, 06 Dec 2021 00:36:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyp4PRUfIUpUnELoH+l3J8eH6y2IU2uOeuijM9eByPrq2iqCKBVodbTRdmh8INkZQV2ty3DCg==
X-Received: by 2002:a05:600c:2948:: with SMTP id
 n8mr36792635wmd.170.1638779770792; 
 Mon, 06 Dec 2021 00:36:10 -0800 (PST)
Received: from xz-m1.local ([85.203.46.183])
 by smtp.gmail.com with ESMTPSA id u2sm11777222wrs.17.2021.12.06.00.36.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 00:36:10 -0800 (PST)
Date: Mon, 6 Dec 2021 16:36:03 +0800
From: Peter Xu <peterx@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [PATCH v9 3/3] cpus-common: implement dirty page limit on vCPU
Message-ID: <Ya3Lc4g/I0LnXK9/@xz-m1.local>
References: <cover.1638495274.git.huangy81@chinatelecom.cn>
 <9cc3cc5377e4330cbe0e87e89f452889516a4c09.1638495274.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <9cc3cc5377e4330cbe0e87e89f452889516a4c09.1638495274.git.huangy81@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, Markus ArmBruster <armbru@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Dec 03, 2021 at 09:39:47AM +0800, huangy81@chinatelecom.cn wrote:
> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> 
> Implement dirtyrate calculation periodically basing on
> dirty-ring and throttle vCPU until it reachs the quota
> dirty page rate given by user.
> 
> Introduce qmp commands "vcpu-dirty-limit", "query-vcpu-dirty-limit"
> to enable, disable, query dirty page limit for virtual CPU.
> 
> Meanwhile, introduce corresponding hmp commands "vcpu_dirty_limit",
> "info vcpu_dirty_limit" so developers can play with them easier.

Thanks.  Even if I start to use qmp-shell more recently but still in some case
where only hmp is specified this could still be handy.

> +void qmp_vcpu_dirty_limit(int64_t cpu_index,
> +                          bool enable,
> +                          uint64_t dirty_rate,
> +                          Error **errp)
> +{
> +    if (!kvm_enabled() || !kvm_dirty_ring_enabled()) {
> +        error_setg(errp, "dirty page limit feature requires KVM with"
> +                   " accelerator property 'dirty-ring-size' set'");
> +        return;
> +    }
> +
> +    if (!dirtylimit_is_vcpu_index_valid(cpu_index)) {
> +        error_setg(errp, "cpu index out of range");
> +        return;
> +    }
> +
> +    if (enable) {
> +        dirtylimit_calc();
> +        dirtylimit_vcpu(cpu_index, dirty_rate);
> +    } else {
> +        if (!dirtylimit_enabled(cpu_index)) {
> +            error_setg(errp, "dirty page limit for CPU %ld not set",
> +                       cpu_index);
> +            return;
> +        }

We don't need to fail the user for enable=off even if vcpu is not throttled,
imho.

> +
> +        if (!dirtylimit_cancel_vcpu(cpu_index)) {
> +            dirtylimit_calc_quit();
> +        }
> +    }
> +}

[...]

> +struct DirtyLimitInfoList *qmp_query_vcpu_dirty_limit(bool has_cpu_index,
> +                                                      int64_t cpu_index,
> +                                                      Error **errp)
> +{
> +    DirtyLimitInfo *info = NULL;
> +    DirtyLimitInfoList *head = NULL, **tail = &head;
> +
> +    if (has_cpu_index &&
> +        (!dirtylimit_is_vcpu_index_valid(cpu_index))) {
> +        error_setg(errp, "cpu index out of range");
> +        return NULL;
> +    }
> +
> +    if (has_cpu_index) {
> +        info = dirtylimit_query_vcpu(cpu_index);
> +        QAPI_LIST_APPEND(tail, info);
> +    } else {
> +        CPUState *cpu;
> +        CPU_FOREACH(cpu) {
> +            if (!cpu->unplug) {
> +                info = dirtylimit_query_vcpu(cpu->cpu_index);
> +                QAPI_LIST_APPEND(tail, info);
> +            }

There're special handling for unplug in a few places.  Could you explain why?
E.g. if the vcpu is unplugged then dirty rate is zero, then it seems fine to
even keep it there?

> +        }
> +    }
> +
> +    return head;
> +}

-- 
Peter Xu


