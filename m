Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E172E46B125
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 03:59:18 +0100 (CET)
Received: from localhost ([::1]:55498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muQhJ-0000ND-KC
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 21:59:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1muQgB-0007ca-9H
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 21:58:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1muQg7-0003Tr-RE
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 21:58:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638845882;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5dG28bSh6pbPeVdiGN8gUatTV5/t7OoJzduF0+X6MDU=;
 b=aDHirH/Tain5PbrIz3oo5UykjA6Ef+NhFP/YDqycCNLvQQL0aaNAX+r9ylo0fNcVrf8jak
 +T4UOGIa2eC/Nxl8hZRyLb1LWdvDeFl/U/HyRgS1GwR6yzDEmmP0xHeEFGQemTqVLwG82+
 Yjz0rSLhDjyvzwvz7unWF2lrG4iNpVc=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-227-4Rrs73vpP-e64_UH9yDbMQ-1; Mon, 06 Dec 2021 21:58:01 -0500
X-MC-Unique: 4Rrs73vpP-e64_UH9yDbMQ-1
Received: by mail-pj1-f71.google.com with SMTP id
 x6-20020a17090a6c0600b001a724a5696cso1188572pjj.6
 for <qemu-devel@nongnu.org>; Mon, 06 Dec 2021 18:58:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5dG28bSh6pbPeVdiGN8gUatTV5/t7OoJzduF0+X6MDU=;
 b=4+x2iRSpWgEbEuXQcWUN8O58suBgbpxR4gi6po5k/hiX8RseK8WZC4VPWI016BZbfI
 LtkO/dxIELo38Tiuhx9+cKmSoYfkGaWLT89uNpc3cCuodWWea/93G4vHNwr92ylj5EhQ
 qpyFbc0bRdLlcT5Ig1Jky10tTcnUpdiEdnlYx4e1y7U/VKtUQQGgTTWPyeQifSIc7iFa
 Z80qVUF1TigCOfvJFieEPyXDQZByFK/hvw+4Zh1HyEWh9FAMVssalewtOH8/QHhVS4nG
 RiTFFcU4jYAHZ/ueW47T/SfXOV7DpMm7WQOpY/d062lOwQiTj2e1MKPC7BKcP45/40gq
 QC4A==
X-Gm-Message-State: AOAM530YUhpbKcxhOG6gtHRi5QzpYOEZnQjodJmeGmWvVLUFPR5uxQ8t
 427gDDkaR8nObM1drPU9BzYd9/11GULxqXWJd9lVhJuYtrmuuHhDOVjqSWtAP8MNoJGpUJUbGx3
 m+Y76mxkoZ3pV080=
X-Received: by 2002:a63:d054:: with SMTP id s20mr21578211pgi.565.1638845880035; 
 Mon, 06 Dec 2021 18:58:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz8DKKLe884pei4UCreaxTa/eLkrPDJRIOJrf4ta+enQhhmTyDNcLIfL1fwgMrrEq0qTSjynA==
X-Received: by 2002:a63:d054:: with SMTP id s20mr21578186pgi.565.1638845879748; 
 Mon, 06 Dec 2021 18:57:59 -0800 (PST)
Received: from xz-m1.local ([223.72.74.110])
 by smtp.gmail.com with ESMTPSA id j4sm8308545pgp.58.2021.12.06.18.57.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 18:57:59 -0800 (PST)
Date: Tue, 7 Dec 2021 10:57:52 +0800
From: Peter Xu <peterx@redhat.com>
To: Hyman <huangy81@chinatelecom.cn>
Subject: Re: [PATCH v9 3/3] cpus-common: implement dirty page limit on vCPU
Message-ID: <Ya7NhcagnW86DBVP@xz-m1.local>
References: <cover.1638495274.git.huangy81@chinatelecom.cn>
 <9cc3cc5377e4330cbe0e87e89f452889516a4c09.1638495274.git.huangy81@chinatelecom.cn>
 <Ya3Lc4g/I0LnXK9/@xz-m1.local>
 <51937a31-4f8e-dc80-e731-cb026e42c1c9@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <51937a31-4f8e-dc80-e731-cb026e42c1c9@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
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
Cc: Juan Quintela <quintela@redhat.com>, Markus ArmBruster <armbru@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 06, 2021 at 11:19:21PM +0800, Hyman wrote:
> > > +    if (has_cpu_index) {
> > > +        info = dirtylimit_query_vcpu(cpu_index);
> > > +        QAPI_LIST_APPEND(tail, info);
> > > +    } else {
> > > +        CPUState *cpu;
> > > +        CPU_FOREACH(cpu) {
> > > +            if (!cpu->unplug) {
> > > +                info = dirtylimit_query_vcpu(cpu->cpu_index);
> > > +                QAPI_LIST_APPEND(tail, info);
> > > +            }
> > 
> > There're special handling for unplug in a few places.  Could you explain why?
> > E.g. if the vcpu is unplugged then dirty rate is zero, then it seems fine to
> > even keep it there?
> > The dirty limit logic only allow plugged vcpu to be enabled throttle, so
> that the "dirtylimit-{cpu-index}" thread don't need to be forked and we can
> save the overhead. So in query logic we just filter the unplugged vcpu.

I've commented similarly in the other thread - please consider not using NVCPU
threads only for vcpu throttling, irrelevant of vcpu hot plug/unplug.

Per-vcpu throttle is totally not a cpu intensive workload, 1 thread should be
enough globally, imho.

A guest with hundreds of vcpus are becoming more common, we shouldn't waste OS
thread resources just for this.

> 
> Another reason is that i thought it could make user confused when we return
> the unplugged vcpu dirtylimit info. Uh, in most time of vm lifecycle,
> hotplugging vcpu may never happen.

I just think if plug/unplug does not affect the throttle logic then we should
treat them the same, it avoids unnecessary special care on those vcpus too.

-- 
Peter Xu


