Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B48469370
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 11:22:02 +0100 (CET)
Received: from localhost ([::1]:53336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muB8C-0004ER-Th
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 05:22:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1muB5H-0002vs-9y
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 05:18:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1muB5E-0007ee-8C
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 05:18:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638785932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=g0RQISgPVAsJyfp3zHzD4Iwm7AFjzdQ/HHSKryWupJs=;
 b=Q0sX/5kjOBfSiqCVi0Z9iPKZ3B+9kNBIxNv7CQBnOpFIh3A5sLkNgKcRbViIvKRL2VVb3A
 BhDisx69DU/IbKfsJt6MftuJEgF5VE8bQkIuwqgdmOehesN2oYHhC2Xl1D/hniW8KjYcy4
 wm+wZi2FdMPXI6xnoPtnJHInM1jViFo=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-360-1KwhAmOHOCGB8uQ8i1AoiQ-1; Mon, 06 Dec 2021 05:18:44 -0500
X-MC-Unique: 1KwhAmOHOCGB8uQ8i1AoiQ-1
Received: by mail-pj1-f71.google.com with SMTP id
 d3-20020a17090a6a4300b001a70e45f34cso4486048pjm.0
 for <qemu-devel@nongnu.org>; Mon, 06 Dec 2021 02:18:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=g0RQISgPVAsJyfp3zHzD4Iwm7AFjzdQ/HHSKryWupJs=;
 b=ZBkbTmcm0l79TGhdrJRa9mXQJu0/WH0GadUk9xRfkB6bW6jxVha0cF0YQgmk4cp0Jq
 6YPOHqkbrbCLnbwybRpEiJoQeYTIZQXOdjs/28XzFcfGfX4pXdQLh88XwmUbFnWgdN3u
 brNJERnH9mI8mvSfvuBXt1KLrnI3RRtAIvjqi1nIwGquOdnzUr3X0/HpleL+wiy/mHZM
 CsGHsIrHV1mtN5sS5ZQTWWRIz3Z7AFK6UBDdxavq5jQz2kokRgbOufBEQ/ljzlMVqU1V
 t0ycl2S5HeROU5AIn9n8ympzHG7pgAifUoB8P0HSD56SxlYan30DedMFD+7sANHmIKz1
 QqdQ==
X-Gm-Message-State: AOAM530IsFALmxYykX2O0W3lDeMJ9c9P7Uy6r3wvN3qZNfrJab2qPM6q
 C2Utb9eCuR7XtBXnHX+gL+5uUBdTe6mYxdzeaKAdBZkDBu24UWrHlMD8Oa8YJ+tzXwHohKRVfUm
 H0ZsNFS5U2a4BXYY=
X-Received: by 2002:aa7:8d0a:0:b0:4a2:82d7:1695 with SMTP id
 j10-20020aa78d0a000000b004a282d71695mr36391181pfe.86.1638785923168; 
 Mon, 06 Dec 2021 02:18:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyjCUPPCLgRFuU35K2QXRVwOnQCgUlijHT3UFjqOkBoon54MAcV+I7WhiwQG1H7e3d6XauS1A==
X-Received: by 2002:aa7:8d0a:0:b0:4a2:82d7:1695 with SMTP id
 j10-20020aa78d0a000000b004a282d71695mr36391165pfe.86.1638785922896; 
 Mon, 06 Dec 2021 02:18:42 -0800 (PST)
Received: from xz-m1.local ([223.72.74.110])
 by smtp.gmail.com with ESMTPSA id m11sm1165885pfk.27.2021.12.06.02.18.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 02:18:42 -0800 (PST)
Date: Mon, 6 Dec 2021 18:18:35 +0800
From: Peter Xu <peterx@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [PATCH v9 1/3] migration/dirtyrate: implement vCPU dirtyrate
 calculation periodically
Message-ID: <Ya3je9/6ff89adp4@xz-m1.local>
References: <cover.1638495274.git.huangy81@chinatelecom.cn>
 <db19021e4c0ef3d253723a299f8e626f09a1b121.1638495274.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <db19021e4c0ef3d253723a299f8e626f09a1b121.1638495274.git.huangy81@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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

On Fri, Dec 03, 2021 at 09:39:45AM +0800, huangy81@chinatelecom.cn wrote:
> +static void dirtylimit_calc_func(void)
> +{
> +    CPUState *cpu;
> +    DirtyPageRecord *dirty_pages;
> +    int64_t start_time, end_time, calc_time;
> +    DirtyRateVcpu rate;
> +    int i = 0;
> +
> +    dirty_pages = g_malloc0(sizeof(*dirty_pages) *
> +        dirtylimit_calc_state->data.nvcpu);
> +
> +    CPU_FOREACH(cpu) {
> +        record_dirtypages(dirty_pages, cpu, true);
> +    }
> +
> +    start_time = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
> +    g_usleep(DIRTYLIMIT_CALC_TIME_MS * 1000);
> +    end_time = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
> +    calc_time = end_time - start_time;
> +
> +    qemu_mutex_lock_iothread();
> +    memory_global_dirty_log_sync();
> +    qemu_mutex_unlock_iothread();
> +
> +    CPU_FOREACH(cpu) {
> +        record_dirtypages(dirty_pages, cpu, false);
> +    }
> +
> +    for (i = 0; i < dirtylimit_calc_state->data.nvcpu; i++) {
> +        uint64_t increased_dirty_pages =
> +            dirty_pages[i].end_pages - dirty_pages[i].start_pages;
> +        uint64_t memory_size_MB =
> +            (increased_dirty_pages * TARGET_PAGE_SIZE) >> 20;
> +        int64_t dirtyrate = (memory_size_MB * 1000) / calc_time;
> +
> +        rate.id = i;
> +        rate.dirty_rate  = dirtyrate;
> +        dirtylimit_calc_state->data.rates[i] = rate;
> +
> +        trace_dirtyrate_do_calculate_vcpu(i,
> +            dirtylimit_calc_state->data.rates[i].dirty_rate);
> +    }
> +}

This looks so like the calc-dirty-rate code already.

I think adding a new resion (GLOBAL_DIRTY_LIMIT) is fine, however still, any
chance to merge the code?

-- 
Peter Xu


