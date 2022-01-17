Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FD349032F
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 08:52:07 +0100 (CET)
Received: from localhost ([::1]:39332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9MoA-0005UC-EY
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 02:52:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n9MYi-0005cu-Q9
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 02:36:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n9MYg-0003D3-5U
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 02:36:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642404965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=E7d1BK37u1Nm6y8OxyVlOqOysv1KBTRj2wHibuU7z9o=;
 b=Qft57xm06LfNRrA2HAeVXCaL3ds5LGqG/FuF6SKbMjEJA7EsdEDTEtZl09CMRCl/ECZ9Pi
 oR6THil1z0srxvhIrOThrvgjyua0akKIRKsz5tv1rwmkg29g3L1r4oZBDUytlzeiamxU9/
 xveCVE0nJ1ssjF7/5Q/pa6t8zymuvfQ=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-53--8S1UJHAMTqL3KJ0ZQa_hQ-1; Mon, 17 Jan 2022 02:36:04 -0500
X-MC-Unique: -8S1UJHAMTqL3KJ0ZQa_hQ-1
Received: by mail-pg1-f200.google.com with SMTP id
 r1-20020a639b01000000b0034243da71caso7195910pgd.7
 for <qemu-devel@nongnu.org>; Sun, 16 Jan 2022 23:36:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=E7d1BK37u1Nm6y8OxyVlOqOysv1KBTRj2wHibuU7z9o=;
 b=k/+euC0DY/g7C9wrFtQi6DQx85Ha0cwSW8QdROtPhzfHNLmPzF4sEJjYpwx9BGt34o
 LfpGOfIfb4YrHi/Xo3YHt053sz2ibCc7tSeDSV8kqYE6LahHpPh/tfbolqNX4ko7Nng5
 kMDA/B/NAWUEkKZs6ZsuKqy5slqRPhAjPAQmJj53O7lMnQ+ouTH182TpPN/+XBWA/APk
 U/fJssV8Rs3EqyBm9/JiAI0QJj5GpUiSm+2iGHMNYTSzFRSSymP05l1oKZYXSggOCEuV
 /yMXEjdyI5xRYm+McgP5zmGxT9jLEWgBQi9q7pn20lYtipzAwFBzSYhsl3WXJG4uAvjZ
 aD7A==
X-Gm-Message-State: AOAM532Dq0c7XyaJ5HOF3nTINiKjh3jnziizn7CEGSVgk1vUvNyb0tDf
 u1YkNgRKgVJAeuRYMMxBBuldZ/uxMIVenyQ6v6ch52M5c7nvkJPaAIQQVczczk3MBLMOYDixb7Z
 bA/XcL1PhPZoyBMU=
X-Received: by 2002:a17:90a:c58f:: with SMTP id
 l15mr23296152pjt.159.1642404963056; 
 Sun, 16 Jan 2022 23:36:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy1tfG2vUGMqKTCCxDnOh6CAi3fiT7LcxAx0bs9oHWh2/ZDhv8hDLAR3YA7P5dWeJ2LE3tjZw==
X-Received: by 2002:a17:90a:c58f:: with SMTP id
 l15mr23296136pjt.159.1642404962825; 
 Sun, 16 Jan 2022 23:36:02 -0800 (PST)
Received: from xz-m1.local ([191.101.132.74])
 by smtp.gmail.com with ESMTPSA id kt19sm11617401pjb.50.2022.01.16.23.35.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Jan 2022 23:36:01 -0800 (PST)
Date: Mon, 17 Jan 2022 15:35:55 +0800
From: Peter Xu <peterx@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [PATCH v11 4/4] softmmu/dirtylimit: implement dirty page rate
 limit
Message-ID: <YeUcW/6UnBu6u3Hh@xz-m1.local>
References: <cover.1641316375.git.huangy81@chinatelecom.cn>
 <3c7304f10b44919bb328a62c2fae988e2abf2a6a.1641316375.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <3c7304f10b44919bb328a62c2fae988e2abf2a6a.1641316375.git.huangy81@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, David Hildenbrand <david@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Markus ArmBruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 05, 2022 at 01:14:09AM +0800, huangy81@chinatelecom.cn wrote:
>  ##
> +# @set-vcpu-dirty-limit:
> +#
> +# Set the upper limit of dirty page rate for virtual CPU.
> +#
> +# Requires KVM with accelerator property "dirty-ring-size" set.
> +# A virtual CPU's dirty page rate is a measure of its memory load.
> +# To observe dirty page rates, use @calc-dirty-rate.
> +#
> +# @cpu-index: index of virtual CPU, default is all.
> +#
> +# @dirty-rate: upper limit of dirty page rate for virtual CPU.

Same here, we could add the unit of dirty rate (MB/s), and in all the rest of
the places around dirty rate.

> +void qmp_set_vcpu_dirty_limit(bool has_cpu_index,
> +                              uint64_t cpu_index,
> +                              uint64_t dirty_rate,
> +                              Error **errp)
> +{
> +    if (!kvm_enabled() || !kvm_dirty_ring_enabled()) {
> +        error_setg(errp, "dirty page limit feature requires KVM with"
> +                   " accelerator property 'dirty-ring-size' set'");
> +        return;
> +    }
> +
> +    if (!dirtylimit_in_service()) {
> +        vcpu_dirty_rate_stat_initialize();
> +        vcpu_dirty_rate_stat_start();
> +    }
> +
> +    if (has_cpu_index && !dirtylimit_vcpu_index_valid(cpu_index)) {
> +        error_setg(errp, "incorrect cpu index specified");
> +        return;
> +    }

This could be moved before above vcpu_dirty_rate_stat_initialize() calls.  I've
left some comments in previous patch on this; please refer to the pesudo code.

The rest looks good to me.

Thanks,

> +
> +    if (has_cpu_index) {
> +        dirtylimit_set_vcpu(cpu_index, dirty_rate, true);
> +    } else {
> +        dirtylimit_set_all(dirty_rate, true);
> +    }
> +}

-- 
Peter Xu


