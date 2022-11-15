Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D3A629ED4
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 17:20:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouyfC-00016c-7h; Tue, 15 Nov 2022 11:19:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ouyf3-00013y-U0
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 11:19:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ouyf1-0007aA-Kl
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 11:19:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668529182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6n/C7kK27ZgwogwF6ffQp/jPC6huuBM5l9rXbfhjnNs=;
 b=iaiB8+NUYoCuqQRE2RtjXPmv2fmx7r6Y/WQGcBYgNBA7PyBQwTQOdVLsdTc4cWJIHS0LdG
 3I+dVb8yHQ41p8+5wQU/fIKskd0BTzAMTK6WvH1HrLqO6da5SZ97J8uSU5VlkkkF0doEi8
 g4+nVwSp/w44aOnpdM7tMLszaEkzLRk=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-173-yhPpJwL1O4iMOxA981O6TQ-1; Tue, 15 Nov 2022 11:19:41 -0500
X-MC-Unique: yhPpJwL1O4iMOxA981O6TQ-1
Received: by mail-qt1-f199.google.com with SMTP id
 u31-20020a05622a199f00b003a51fa90654so10601330qtc.19
 for <qemu-devel@nongnu.org>; Tue, 15 Nov 2022 08:19:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6n/C7kK27ZgwogwF6ffQp/jPC6huuBM5l9rXbfhjnNs=;
 b=5KYDjOtXe/6TpSVjCIQ3ace/Z4v5oZBQ2g29VunNkQ1JMe7HkLBwI0yySKvzitWg6b
 zZR1qlzVBP27Y+Ga54NXOPkcQMTBIOogLsD5p6g1kAi9H22pm8VP+/RNaFZ9N2n5m6bX
 wdKUFZnLR7vaebEtolnjsASh4E7UhsWAw3V91QCNzcBjBmdpWopTF9gEKQ9l0FUr9R/l
 nCP2Phg7X3HAVTDfd5GgYXXnKP3d6a3gAA24/sK7jha8SefSoUeh7eN/t+WIYTdobysG
 G+QnXSusxhcFDrK+Kz08uPpCJQHNFIs5kHFqgP13EATlB+Li9mKvtc3mOoduFuOGeUwO
 LqTA==
X-Gm-Message-State: ANoB5pn9FgKLMZqRQDfxIEpto1epuA5DKvg9TIxKcPr2ya8FXeHW8XGN
 C14MoGMANqK339KVcXRsluaiHPf3y6dls0YST5VHBS5ldd3aqW+jsIK8kGJCSOdn5SDKMax29bG
 IN7tTI90uDyBaPGI=
X-Received: by 2002:a05:620a:470a:b0:6ec:51cd:c376 with SMTP id
 bs10-20020a05620a470a00b006ec51cdc376mr15631761qkb.300.1668529180861; 
 Tue, 15 Nov 2022 08:19:40 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6jJE9uP7Ms4aJb+wPQ1383EUE0QOAbOyGuGvzsW9hBVGHNnPtWWJ6WtxCJE2j3M5SfdiLEsg==
X-Received: by 2002:a05:620a:470a:b0:6ec:51cd:c376 with SMTP id
 bs10-20020a05620a470a00b006ec51cdc376mr15631734qkb.300.1668529180632; 
 Tue, 15 Nov 2022 08:19:40 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 t19-20020a05620a451300b006fafc111b12sm8456166qkp.83.2022.11.15.08.19.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 08:19:38 -0800 (PST)
Date: Tue, 15 Nov 2022 11:19:36 -0500
From: Peter Xu <peterx@redhat.com>
To: Alexander Bulekov <alxndr@bu.edu>
Cc: qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Jason Wang <jasowang@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Li Qiang <liq3ea@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Bandan Das <bsd@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bin Meng <bin.meng@windriver.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Jon Maloy <jmaloy@redhat.com>, Siqi Chen <coc.cyqh@gmail.com>
Subject: Re: [PATCH v3 1/7] memory: associate DMA accesses with the initiator
 Device
Message-ID: <Y3O8GAw9kRfNBmFV@x1n>
References: <20221028191648.964076-1-alxndr@bu.edu>
 <20221028191648.964076-2-alxndr@bu.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221028191648.964076-2-alxndr@bu.edu>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Oct 28, 2022 at 03:16:42PM -0400, Alexander Bulekov wrote:
> +    /* Do not allow more than one simultanous access to a device's IO Regions */
> +    if (mr->owner &&
> +            !mr->ram_device && !mr->ram && !mr->rom_device && !mr->readonly) {
> +        dev = (DeviceState *) object_dynamic_cast(mr->owner, TYPE_DEVICE);
> +        if (dev->mem_reentrancy_guard.engaged_in_io) {

Do we need to check dev being non-NULL?  Fundamentally it's about whether
the owner can be not a DeviceState, I believe it's normally true but I
can't tell; at least from memory region API it can be any Object*.

> +            trace_memory_region_reentrant_io(get_cpu_index(), mr, addr, size);
> +            return MEMTX_ERROR;
> +        }
> +        dev->mem_reentrancy_guard.engaged_in_io = true;
> +    }

-- 
Peter Xu


