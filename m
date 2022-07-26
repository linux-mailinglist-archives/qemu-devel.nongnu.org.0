Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC67581B2F
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 22:40:56 +0200 (CEST)
Received: from localhost ([::1]:46554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGRMN-0007Bp-9n
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 16:40:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oGQVe-0005k9-3n
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 15:46:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oGQVb-0005uB-HP
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 15:46:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658864782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZRjRPmwIBTJe/I+OuH6/x+Nzm34as938KEPxnhYmq50=;
 b=dhXoCgI89M4xiXNCJVilkIR4gXE8V1aPVOkY907eimn7OUw3IO5BVL1t7AerSMVNJntBoB
 97Cmhskwboj9pe7XgbWfVzJ6rYnWuNg4pFi7E4qIBeoQ8yRSIe0ufnD7hl8udvS2l7UKFc
 egEdpGmy/RomrehbFQppDyugGK73HGY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-133-xT3LorXIP2-74UpVjHtfwQ-1; Tue, 26 Jul 2022 15:46:21 -0400
X-MC-Unique: xT3LorXIP2-74UpVjHtfwQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 f21-20020a1cc915000000b003a3551598a1so2757763wmb.0
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 12:46:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc;
 bh=ZRjRPmwIBTJe/I+OuH6/x+Nzm34as938KEPxnhYmq50=;
 b=8N4b1f6dNT54rXukmz2v7xHXldLvDxUI2+ttho/9Y20dtaGCrzHzhbyke4OKoVn60t
 2ENTuMJkWT7mRso6bAuJS1NrwgNdhAAPxjj1gzfdvniJM8yJSTaZXNAa1cyaz0kjRz04
 mjDrS008EVUnf/CxdJT7ktHBMATUnHd6pnjs+OyI66ZhdnHk0cWdg0PWRcDngHOaKTKS
 nCVHPaSRB568jnm8Fm6qStEgcryyTOmpciLX4RHOdHfT2LVI0IBgoPlKy1mKrKe9UGa+
 WcJnVSsvUl3ZXuNzz2G0kobAL4r8sS7uTKIPSQPhYCJY8MikiTiY+p2PMUd7e3D7EwIc
 20dQ==
X-Gm-Message-State: AJIora8XpSiAI6tlFEkyS2FNJrmPh5hUlhoqDp7+lADqPIGFMqWbKDRj
 9TbGit7KeEjUL6vcELknvnYGCwGfgwB0kvY1+5R1KfUyjEFN/hOAX3fnVuqFGuyRC/ASHqEIrzz
 yCIBe2+sxcTgBIZk=
X-Received: by 2002:a05:600c:6002:b0:3a3:5453:bcbe with SMTP id
 az2-20020a05600c600200b003a35453bcbemr543991wmb.190.1658864780296; 
 Tue, 26 Jul 2022 12:46:20 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tTpsCgJBgPEU3MUAM7nzZCCB2GK2lIrgnVyzYbJ4uqrLque3RGmD324B+Y40wHaLxW1vWkZQ==
X-Received: by 2002:a05:600c:6002:b0:3a3:5453:bcbe with SMTP id
 az2-20020a05600c600200b003a35453bcbemr543964wmb.190.1658864779772; 
 Tue, 26 Jul 2022 12:46:19 -0700 (PDT)
Received: from redhat.com ([2a06:c701:7424:0:3d16:86dc:de54:5671])
 by smtp.gmail.com with ESMTPSA id
 d1-20020adfe2c1000000b0021e491fd250sm15690348wrj.89.2022.07.26.12.46.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 12:46:19 -0700 (PDT)
Date: Tue, 26 Jul 2022 15:46:16 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, slp@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org,
 viresh.kumar@linaro.org, mark.cave-ayland@ilande.co.uk, jasowang@redhat.com
Subject: Re: [PATCH v3 for 7.2 00/21] virtio-gpio and various virtio cleanups
Message-ID: <20220726154324-mutt-send-email-mst@kernel.org>
References: <20220726192150.2435175-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220726192150.2435175-1-alex.bennee@linaro.org>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 26, 2022 at 08:21:29PM +0100, Alex Bennée wrote:
> Hi,
> 
> After much slogging through the vhost-user code I've gotten the
> virtio-gpio device working again. The core change in pushing the
> responsibility for VHOST_USER_F_PROTOCOL_FEATURES down to the
> vhost-user layer (which knows it needs it). We still need to account
> for that in virtio-gpio because the result of the negotiating protocol
> features is the vrings start disabled so the stub needs to explicitly
> enable them. I did consider pushing this behaviour explicitly into
> vhost_dev_start but that would have required un-picking it from
> vhost-net (which is the only other device which uses protocol features
> AFAICT - but is a measure more complex in it's setup).
> 
> As last time there are a whole series of clean-ups and doc tweaks. I
> don't know if any are trivial enough to sneak into later RCs but it
> shouldn't be a problem to wait until the tree re-opens.

Right. Still I think some are fixes we should merge now.
I am thinking patches 5, 7,8,9 ? 6 if it makes backporting
much easier. WDYT? If you agree pls separate bugfixes in
series I can apply. Thanks!

> There is a remaining issue that a --enable-sanitizers build fails for
> qos-test due to leaks. It shows up as a leak from:
> 
>   Direct leak of 240 byte(s) in 1 object(s) allocated from:                                                                                                                    
>       #0 0x7fc5a3f2a037 in __interceptor_calloc ../../../../src/libsanitizer/asan/asan_malloc_linux.cpp:154                                                                    
>       #1 0x7fc5a2e5cda0 in g_malloc0 ../../../glib/gmem.c:136                                                                                                                  
>       #2 0x55ce773cc728 in virtio_device_realize ../../hw/virtio/virtio.c:3691                                                                                                 
>       #3 0x55ce7784ed7e in device_set_realized ../../hw/core/qdev.c:553                                                                                                        
>       #4 0x55ce77862d0c in property_set_bool ../../qom/object.c:2273                 
> 
> I'm not entirely sure what the allocation is because it gets inlined
> in the virtio_device_realize call. Perhaps it's the QOM object itself
> which is never gracefully torn down at the end of the test?
> 
> However when I attempted to bisect I found master was broken as well.
> For example in my arm/aarch64-softmmu build we see 5 failures:
> 
> Summary of Failures:
> 
>    3/48 qemu:qtest+qtest-aarch64 / qtest-aarch64/migration-test            ERROR          96.15s   killed by signal 6 SIGABRT
>    9/48 qemu:qtest+qtest-aarch64 / qtest-aarch64/qos-test                  ERROR          32.50s   killed by signal 6 SIGABRT
>   11/48 qemu:qtest+qtest-arm / qtest-arm/qos-test                          ERROR          26.93s   killed by signal 6 SIGABRT
>   20/48 qemu:qtest+qtest-aarch64 / qtest-aarch64/device-introspect-test    ERROR           5.17s   killed by signal 6 SIGABRT
>   45/48 qemu:qtest+qtest-arm / qtest-arm/device-introspect-test            ERROR           4.97s   killed by signal 6 SIGABRT
> 
> Of which the qos-tests are the only new ones. I suspect something must
> be preventing the other stuff being exercised in our CI system.
> 
> Alex Bennée (19):
>   include/hw/virtio: more comment for VIRTIO_F_BAD_FEATURE
>   include/hw: document vhost_dev feature life-cycle
>   hw/virtio: fix some coding style issues
>   hw/virtio: log potentially buggy guest drivers
>   block/vhost-user-blk-server: don't expose
>     VHOST_USER_F_PROTOCOL_FEATURES
>   hw/virtio: incorporate backend features in features
>   hw/virtio: gracefully handle unset vhost_dev vdev
>   hw/virtio: handle un-configured shutdown in virtio-pci
>   hw/virtio: fix vhost_user_read tracepoint
>   hw/virtio: add some vhost-user trace events
>   tests/qtest: pass stdout/stderr down to subtests
>   tests/qtest: add a timeout for subprocess_run_one_test
>   tests/qtest: use qos_printf instead of g_test_message
>   tests/qtest: catch unhandled vhost-user messages
>   tests/qtest: plain g_assert for VHOST_USER_F_PROTOCOL_FEATURES
>   tests/qtest: add assert to catch bad features
>   tests/qtest: implement stub for VHOST_USER_GET_CONFIG
>   tests/qtest: add a get_features op to vhost-user-test
>   tests/qtest: enable tests for virtio-gpio
> 
> Viresh Kumar (2):
>   hw/virtio: add boilerplate for vhost-user-gpio device
>   hw/virtio: add vhost-user-gpio-pci boilerplate
> 
>  include/hw/virtio/vhost-user-gpio.h  |  35 +++
>  include/hw/virtio/vhost.h            |   3 +
>  include/hw/virtio/virtio.h           |   7 +-
>  tests/qtest/libqos/virtio-gpio.h     |  35 +++
>  block/export/vhost-user-blk-server.c |   3 +-
>  hw/virtio/vhost-user-gpio-pci.c      |  69 +++++
>  hw/virtio/vhost-user-gpio.c          | 414 +++++++++++++++++++++++++++
>  hw/virtio/vhost-user.c               |  20 +-
>  hw/virtio/vhost.c                    |  16 +-
>  hw/virtio/virtio-pci.c               |   9 +-
>  hw/virtio/virtio.c                   |   7 +
>  tests/qtest/libqos/virtio-gpio.c     | 171 +++++++++++
>  tests/qtest/libqos/virtio.c          |   4 +-
>  tests/qtest/qos-test.c               |   8 +-
>  tests/qtest/vhost-user-test.c        | 172 +++++++++--
>  hw/virtio/Kconfig                    |   5 +
>  hw/virtio/meson.build                |   2 +
>  hw/virtio/trace-events               |   9 +
>  tests/qtest/libqos/meson.build       |   1 +
>  19 files changed, 956 insertions(+), 34 deletions(-)
>  create mode 100644 include/hw/virtio/vhost-user-gpio.h
>  create mode 100644 tests/qtest/libqos/virtio-gpio.h
>  create mode 100644 hw/virtio/vhost-user-gpio-pci.c
>  create mode 100644 hw/virtio/vhost-user-gpio.c
>  create mode 100644 tests/qtest/libqos/virtio-gpio.c
> 
> -- 
> 2.30.2


