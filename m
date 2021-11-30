Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B38D0463518
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Nov 2021 14:06:38 +0100 (CET)
Received: from localhost ([::1]:59020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ms2qD-0006lX-Dn
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 08:06:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ms2oT-0005ZT-4P
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 08:04:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ms2oQ-0004bE-8b
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 08:04:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638277485;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FyFaSX03r7A8PJFy+sv+Z//WueP7ln72QDWOCv+q0sM=;
 b=M+bx9Sg4r9I4D0RDa4gxW4X2EbpXwNDfdcUwUmBQI8PXI3fqOnEeVgdHw2GnrbPSbZKFSD
 AZM0fWOVqAkiWkonpzxnrKIkt73KeMptJvpNged1603eLvvv8rEAO7+hOpZB3rHFOHH+LN
 AfiHbyruAnmfbOwjeIT907eq1vrbQRk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-104-e2c-UoFyMvKu7k1aYdRtiQ-1; Tue, 30 Nov 2021 08:04:44 -0500
X-MC-Unique: e2c-UoFyMvKu7k1aYdRtiQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 a64-20020a1c7f43000000b003335e5dc26bso10379045wmd.8
 for <qemu-devel@nongnu.org>; Tue, 30 Nov 2021 05:04:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FyFaSX03r7A8PJFy+sv+Z//WueP7ln72QDWOCv+q0sM=;
 b=u/4jBRYOSPFIyzByP85E0CztQTiCFoCr4iTRipjGL8d6hEKtVX5Y0g7dEZ/b2k5jZw
 cSnmaML95ex9FO6qYk/QmdH8yoNQljsKma7sACrJBp0wqLSy7c0TqXyVIe6cyHSbhFIC
 a7D1OgOr+y2VXOHn3srAkmLBeC3xa1c7KeM1epjX3e26PqX2ElWOLDUACmskUalbqphS
 5UTJQ+YaEP7C5fG/IQzs/BZ1w9IDifvhuuNLgqC8y3XxaHzDnPmLo4YM709OmrrVB+aB
 REzotP6fj97UCTd8sH9EXYwlAuADkRxK32BTL92JlqKXBMg5pFi56zbWOp32BiKcz71G
 ejBQ==
X-Gm-Message-State: AOAM533GNG8pckPE5yFipVHRaLwUmkaDYjW/DIYRj4q+A0aNZbX4lMj0
 QcQHcpLfvTgnd5BWnYhfnjehugW/fY8hROQruGHW3Cq7V4LxNKm0GjxYzWxQsz8FGrDcnJ0kkmX
 ULAondQakFKtdPzU=
X-Received: by 2002:adf:ce0e:: with SMTP id p14mr39903979wrn.423.1638277482897; 
 Tue, 30 Nov 2021 05:04:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyxbc8RR9JOunDZbyQtYZZyYAhAKXIZrfTQh4gXMmFhWCH2nY6JP6T6XtUyVJ2Eac64dl3+FQ==
X-Received: by 2002:adf:ce0e:: with SMTP id p14mr39903947wrn.423.1638277482704; 
 Tue, 30 Nov 2021 05:04:42 -0800 (PST)
Received: from xz-m1.local ([85.203.46.194])
 by smtp.gmail.com with ESMTPSA id k13sm16247874wri.6.2021.11.30.05.04.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 05:04:42 -0800 (PST)
Date: Tue, 30 Nov 2021 21:04:36 +0800
From: Peter Xu <peterx@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [PATCH v7 1/3] migration/dirtyrate: implement vCPU dirtyrate
 calculation periodically
Message-ID: <YaYhZP7y/Q8aFv6B@xz-m1.local>
References: <cover.1638267948.git.huangy81@chinatelecom.cn>
 <d7fbcc438d315c72227da309a00f13444d0dd718.1638267948.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <d7fbcc438d315c72227da309a00f13444d0dd718.1638267948.git.huangy81@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
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

On Tue, Nov 30, 2021 at 06:28:11PM +0800, huangy81@chinatelecom.cn wrote:
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
> +    dirtylimit_global_dirty_log_start();
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
> +    dirtylimit_global_dirty_log_stop();

I haven't looked into the details, but..  I'm wondering whether we should just
keep the dirty ring enabled during the whole process of throttling.

start/stop can be expensive, especially when huge pages are used, start dirty
tracking will start to do huge page split. While right after the "stop" all the
huge pages will need to be rebuild again.

David from Google is even proposing a kernel change to eagerly splitting huge
pages when dirty tracking is enabled.

So I think we can keep the dirty tracking enabled until all the vcpu throttles
are stopped.

> +
> +    CPU_FOREACH(cpu) {
> +        record_dirtypages(dirty_pages, cpu, false);
> +    }

-- 
Peter Xu


