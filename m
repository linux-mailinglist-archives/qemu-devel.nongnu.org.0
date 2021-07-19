Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A03D53CEB34
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 20:59:36 +0200 (CEST)
Received: from localhost ([::1]:51528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5YUJ-0004Zp-DY
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 14:59:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1m5YSt-0002lZ-4b
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 14:58:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1m5YSo-0005mw-EB
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 14:58:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626721081;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Cj3ar4LcZ4nh/bRHE49ojcvYhdWA/K743g8c2txT1qU=;
 b=KzueQ9kecjxHuoigJNSKIg9jwqC9B28pgnR/3kCohbE/2dWCQTLTyG0YhFrfNMm3W0Ps9a
 89AwULavZQHUUYv9sQtWZ91uhetfkap88mw/zAs7GxYXJ/VNu3lj0FoS/O6aSzU4MksV7l
 6LZIfPxfwhijLzIYtxhQit1x7ef1ooI=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-GKlCfk59PGqxwGbelvlyEw-1; Mon, 19 Jul 2021 14:57:59 -0400
X-MC-Unique: GKlCfk59PGqxwGbelvlyEw-1
Received: by mail-io1-f71.google.com with SMTP id
 s203-20020a6b2cd40000b0290528db19d5b3so11966470ios.5
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 11:57:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Cj3ar4LcZ4nh/bRHE49ojcvYhdWA/K743g8c2txT1qU=;
 b=IsfDbUcNigqXuqi96z9OHuTknIbylAVqei7Pi9Auw5bz8N/xr1gDJaAxzApZ+k36ml
 9/Ll//cAwBNajhfDNHMKUITiSJ6QRabONBlKrWDqsDvJJvTdKJ/mAj/oCwCNSd4I8Llj
 EoXqrcyYEqMdNq9gItNLXc7E00eQ+CEbjpwE3m8ZYDFv1f4KImRLM7xtBgEwqWxml/ZZ
 THNJFZSDJTfvUGuhsExMlJ7BHMkl6cL1E8LWQTi/8BnguhYmour91PbxKKtpIthSNCvo
 z2uMrNiFCnZo9aBFe4SXEhq0R5D86brFTt/bZyMXIoOiDzSxsdisZq96HSCA5IhOK3T5
 OnOg==
X-Gm-Message-State: AOAM532T9Ji5h+ItWddAqqNrtrdWDuQia53fA3fb82dKSzKXgwzKmeAA
 r6LyRvbS8bBzL36GI5zNDR2mkxIjBcu3jT5DoU02Qil6EUm3NgbkabhmB2+1OYCyM/WXAF/mWDa
 QG5h4hkollKDVVZ4=
X-Received: by 2002:a6b:ba02:: with SMTP id k2mr15570535iof.164.1626721078547; 
 Mon, 19 Jul 2021 11:57:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwEq3SSm6aUIQgD3J1tpzJqOzwQuzX7KuGQ/uiLHGbB+l33TQOihguPYuEpmdYxpyaxLdsKsA==
X-Received: by 2002:a6b:ba02:: with SMTP id k2mr15570503iof.164.1626721078020; 
 Mon, 19 Jul 2021 11:57:58 -0700 (PDT)
Received: from gator ([140.82.166.162])
 by smtp.gmail.com with ESMTPSA id j13sm5644384ila.38.2021.07.19.11.57.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 11:57:57 -0700 (PDT)
Date: Mon, 19 Jul 2021 20:57:55 +0200
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH for-6.2 v2 11/11] tests/unit: Add a unit test for smp
 parsing
Message-ID: <20210719185755.56r72aiqfuygqhcc@gator>
References: <20210719032043.25416-1-wangyanan55@huawei.com>
 <20210719032043.25416-12-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210719032043.25416-12-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.469,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 wanghaibin.wang@huawei.com, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>,
 Halil Pasic <pasic@linux.ibm.com>, Igor Mammedov <imammedo@redhat.com>,
 yuzenghui@huawei.com, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 19, 2021 at 11:20:43AM +0800, Yanan Wang wrote:
> Add a QEMU unit test for the parsing of given SMP configuration.
> Since all the parsing logic is in generic function smp_parse(),
> this test passes diffenent SMP configurations to the function
> and compare the parsing result with what is expected.
> 
> In the test, all possible collections of the topology parameters
> and the corressponding expected results are listed, including the
> valid and invalid ones.
> 
> The preference of sockets over cores and the preference of cores
> over sockets, and the support of multi-dies are also considered.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  MAINTAINERS                 |    1 +
>  tests/unit/meson.build      |    1 +
>  tests/unit/test-smp-parse.c | 1117 +++++++++++++++++++++++++++++++++++
>  3 files changed, 1119 insertions(+)
>  create mode 100644 tests/unit/test-smp-parse.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 70633e3bf4..160dba2e57 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1636,6 +1636,7 @@ F: include/hw/boards.h
>  F: include/hw/core/cpu.h
>  F: include/hw/cpu/cluster.h
>  F: include/sysemu/numa.h
> +F: tests/unit/test-smp-parse.c
>  T: git https://gitlab.com/ehabkost/qemu.git machine-next
>  
>  Xtensa Machines
> diff --git a/tests/unit/meson.build b/tests/unit/meson.build
> index 3e0504dd21..694a924627 100644
> --- a/tests/unit/meson.build
> +++ b/tests/unit/meson.build
> @@ -44,6 +44,7 @@ tests = {
>    'test-uuid': [],
>    'ptimer-test': ['ptimer-test-stubs.c', meson.source_root() / 'hw/core/ptimer.c'],
>    'test-qapi-util': [],
> +  'test-smp-parse': [qom, meson.source_root() / 'hw/core/machine-smp.c'],
>  }
>  
>  if have_system or have_tools
> diff --git a/tests/unit/test-smp-parse.c b/tests/unit/test-smp-parse.c
> new file mode 100644
> index 0000000000..bc1d324c3d
> --- /dev/null
> +++ b/tests/unit/test-smp-parse.c
> @@ -0,0 +1,1117 @@
> +/*
> + * SMP parsing unit-tests
> + *
> + * Copyright (C) 2021, Huawei, Inc.
> + *
> + * Authors:
> + *  Yanan Wang <wangyanan55@huawei.com>
> + *
> + * This work is licensed under the terms of the GNU LGPL, version 2.1 or later.
> + * See the COPYING.LIB file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qom/object.h"
> +#include "qemu/module.h"
> +#include "qapi/error.h"
> +
> +#include "hw/boards.h"
> +
> +#define T true
> +#define F false
> +
> +/**
> + * SMPTestData:
> + * @config - the given SMP configuration for parsing
> + * @should_be_valid - whether the given configuration is supposed to be valid
> + * @expect - the CPU topology info expected to be parsed out
> + */
> +typedef struct SMPTestData {
> +    SMPConfiguration config;
> +    bool should_be_valid;

Long way to say 'valid'.

> +    CpuTopology expect;
> +} SMPTestData;
> +
> +/* the specific machine type info for this test */
> +static const TypeInfo smp_machine_info = {
> +    .name = TYPE_MACHINE,
> +    .parent = TYPE_OBJECT,
> +    .class_size = sizeof(MachineClass),
> +    .instance_size = sizeof(MachineState),
> +};
> +
> +/*
> + * prefer sockets over cores over threads before 6.2.
> + * all possible SMP configurations and the corressponding expected outputs

corresponding (please run spell check on your commit messages)


> + * are listed for testing, including the valid and invalid ones.
> + */
> +static struct SMPTestData prefer_sockets[] = {
> +    {
> +        /* config: no smp configuration provided
> +         * expect: cpus=1,sockets=1,dies=1,cores=1,threads=1,maxcpus=1 */
> +        .config = (SMPConfiguration) { F, 0, F, 0, F, 0, F, 0, F, 0, F, 0 },

SMPConfiguration and CpuTopology have named fields so we could drop the
'expect: ...' comment line and instead do

 {
  /* no configuration provided */ 
  .config = { .has_cpus = F, .has_maxcpus = F, ... },
  .valid = T,
  .expect = { .sockets = 1, .cores = 1, ... },
 }, {
  ...
 }

which may be easier to maintain. OTOH, the concise form this approach has
is also nice. I don't think you should need the casts in the assignments
though.

> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 1, 1, 1, 1, 1, 1 },
> +    }, {
> +        /* config: -smp 8
> +         * expect: cpus=8,sockets=8,dies=1,cores=1,threads=1,maxcpus=8 */
> +        .config = (SMPConfiguration) { T, 8, F, 0, F, 0, F, 0, F, 0, F, 0 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 8, 8, 1, 1, 1, 8 },
> +    }, {
> +        /* config: -smp sockets=2
> +         * expect: cpus=2,sockets=2,dies=1,cores=1,threads=1,maxcpus=2 */
> +        .config = (SMPConfiguration) { F, 0, T, 2, F, 0, F, 0, F, 0, F, 0 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 2, 2, 1, 1, 1, 2 },
> +    }, {
> +        /* config: -smp cores=4
> +         * expect: cpus=4,sockets=1,dies=1,cores=4,threads=1,maxcpus=4 */
> +        .config = (SMPConfiguration) { F, 0, F, 0, F, 0, T, 4, F, 0, F, 0 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 4, 1, 1, 4, 1, 4 },
> +    }, {
> +        /* config: -smp threads=2
> +         * expect: cpus=2,sockets=1,dies=1,cores=1,threads=2,maxcpus=2 */
> +        .config = (SMPConfiguration) { F, 0, F, 0, F, 0, F, 0, T, 2, F, 0 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 2, 1, 1, 1, 2, 2 },
> +    }, {
> +        /* config: -smp maxcpus=16
> +         * expect: cpus=16,sockets=16,dies=1,cores=1,threads=1,maxcpus=16 */
> +        .config = (SMPConfiguration) { F, 0, F, 0, F, 0, F, 0, F, 0, T, 16 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 16, 16, 1, 1, 1, 16 },
> +    }, {
> +        /* config: -smp 8,sockets=2
> +         * expect: cpus=8,sockets=2,dies=1,cores=4,threads=1,maxcpus=8 */
> +        .config = (SMPConfiguration) { T, 8, T, 2, F, 0, F, 0, F, 0, F, 0 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 8, 2, 1, 4, 1, 8 },
> +    }, {
> +        /* config: -smp 8,cores=4
> +         * expect: cpus=8,sockets=2,dies=1,cores=4,threads=1,maxcpus=8 */
> +        .config = (SMPConfiguration) { T, 8, F, 0, F, 0, T, 4, F, 0, F, 0 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 8, 2, 1, 4, 1, 8 },
> +    }, {
> +        /* config: -smp 8,threads=2
> +         * expect: cpus=8,sockets=4,dies=1,cores=1,threads=2,maxcpus=8 */
> +        .config = (SMPConfiguration) { T, 8, F, 0, F, 0, F, 0, T, 2, F, 0 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 8, 4, 1, 1, 2, 8 },
> +    }, {
> +        /* config: -smp 8,maxcpus=16
> +         * expect: cpus=8,sockets=16,dies=1,cores=1,threads=1,maxcpus=16 */
> +        .config = (SMPConfiguration) { T, 8, F, 0, F, 0, F, 0, F, 0, T, 16 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 8, 16, 1, 1, 1, 16 },
> +    }, {
> +        /* config: -smp sockets=2,cores=4
> +         * expect: cpus=8,sockets=2,dies=1,cores=4,threads=1,maxcpus=8 */
> +        .config = (SMPConfiguration) { F, 0, T, 2, F, 0, T, 4, F, 0, F, 0 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 8, 2, 1, 4, 1, 8 },
> +    }, {
> +        /* config: -smp sockets=2,threads=2
> +         * expect: cpus=4,sockets=2,dies=1,cores=1,threads=2,maxcpus=4 */
> +        .config = (SMPConfiguration) { F, 0, T, 2, F, 0, F, 0, T, 2, F, 0 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 4, 2, 1, 1, 2, 4 },
> +    }, {
> +        /* config: -smp sockets=2,maxcpus=16
> +         * expect: cpus=16,sockets=2,dies=1,cores=8,threads=1,maxcpus=16 */
> +        .config = (SMPConfiguration) { F, 0, T, 2, F, 0, F, 0, F, 0, T, 16 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 16, 2, 1, 8, 1, 16 },
> +    }, {
> +        /* config: -smp cores=4,threads=2
> +         * expect: cpus=8,sockets=1,dies=1,cores=4,threads=2,maxcpus=8 */
> +        .config = (SMPConfiguration) { F, 0, F, 0, F, 0, T, 4, T, 2, F, 0 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 8, 1, 1, 4, 2, 8 },
> +    }, {
> +        /* config: -smp cores=4,maxcpus=16
> +         * expect: cpus=16,sockets=4,dies=1,cores=4,threads=1,maxcpus=16 */
> +        .config = (SMPConfiguration) { F, 0, F, 0, F, 0, T, 4, F, 0, T, 16 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 16, 4, 1, 4, 1, 16 },
> +    }, {
> +        /* config: -smp threads=2,maxcpus=16
> +         * expect: cpus=16,sockets=8,dies=1,cores=1,threads=2,maxcpus=16 */
> +        .config = (SMPConfiguration) { F, 0, F, 0, F, 0, F, 0, T, 2, T, 16 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 16, 8, 1, 1, 2, 16 },
> +    }, {
> +        /* config: -smp 8,sockets=2,cores=4
> +         * expect: cpus=8,sockets=2,dies=1,cores=4,threads=1,maxcpus=8 */
> +        .config = (SMPConfiguration) { T, 8, T, 2, F, 0, T, 4, F, 0, F, 0 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 8, 2, 1, 4, 1, 8 },
> +    }, {
> +        /* config: -smp 8,sockets=2,threads=2
> +         * expect: cpus=8,sockets=2,dies=1,cores=2,threads=2,maxcpus=8 */
> +        .config = (SMPConfiguration) { T, 8, T, 2, F, 0, F, 0, T, 2, F, 0 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 8, 2, 1, 2, 2, 8 },
> +    }, {
> +        /* config: -smp 8,sockets=2,maxcpus=16
> +         * expect: cpus=8,sockets=2,dies=1,cores=8,threads=1,maxcpus=16 */
> +        .config = (SMPConfiguration) { T, 8, T, 2, F, 0, F, 0, F, 0, T, 16 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 8, 2, 1, 8, 1, 16 },
> +    }, {
> +        /* config: -smp 8,cores=4,threads=2
> +         * expect: cpus=8,sockets=1,dies=1,cores=4,threads=2,maxcpus=8 */
> +        .config = (SMPConfiguration) { T, 8, F, 0, F, 0, T, 4, T, 2, F, 0 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 8, 1, 1, 4, 2, 8 },
> +    }, {
> +        /* config: -smp 8,cores=4,maxcpus=16
> +         * expect: cpus=8,sockets=4,dies=1,cores=4,threads=1,maxcpus=16 */
> +        .config = (SMPConfiguration) { T, 8, F, 0, F, 0, T, 4, F, 0, T, 16 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 8, 4, 1, 4, 1, 16 },
> +    }, {
> +        /* config: -smp 8,threads=2,maxcpus=16
> +         * expect: cpus=8,sockets=8,dies=1,cores=1,threads=2,maxcpus=16 */
> +        .config = (SMPConfiguration) { T, 8, F, 0, F, 0, F, 0, T, 2, T, 16 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 8, 8, 1, 1, 2, 16 },
> +    }, {
> +        /* config: -smp sockets=2,cores=4,threads=2
> +         * expect: cpus=16,sockets=2,dies=1,cores=4,threads=2,maxcpus=16 */
> +        .config = (SMPConfiguration) { F, 0, T, 2, F, 0, T, 4, T, 2, F, 0 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 16, 2, 1, 4, 2, 16 },
> +    }, {
> +        /* config: -smp sockets=2,cores=4,maxcpus=16
> +         * expect: cpus=16,sockets=2,dies=1,cores=4,threads=2,maxcpus=16 */
> +        .config = (SMPConfiguration) { F, 0, T, 2, F, 0, T, 4, F, 0, T, 16 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 16, 2, 1, 4, 2, 16 },
> +    }, {
> +        /* config: -smp sockets=2,threads=2,maxcpus=16
> +         * expect: cpus=16,sockets=2,dies=1,cores=4,threads=2,maxcpus=16 */
> +        .config = (SMPConfiguration) { F, 0, T, 2, F, 0, F, 0, T, 2, T, 16 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 16, 2, 1, 4, 2, 16 },
> +    }, {
> +        /* config: -smp cores=4,threads=2,maxcpus=16
> +         * expect: cpus=16,sockets=2,dies=1,cores=4,threads=2,maxcpus=16 */
> +        .config = (SMPConfiguration) { F, 0, F, 0, F, 0, T, 4, T, 2, T, 16 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 16, 2, 1, 4, 2, 16 },
> +    }, {
> +        /* config: -smp 8,sockets=2,cores=4,threads=1
> +         * expect: cpus=8,sockets=2,dies=1,cores=4,threads=1,maxcpus=8 */
> +        .config = (SMPConfiguration) { T, 8, T, 2, F, 0, T, 4, T, 1, F, 0 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 8, 2, 1, 4, 1, 8 },
> +    }, {
> +        /* config: -smp 8,sockets=2,cores=4,maxcpus=16
> +         * expect: cpus=8,sockets=2,dies=1,cores=4,threads=2,maxcpus=16 */
> +        .config = (SMPConfiguration) { T, 8, T, 2, F, 0, T, 4, F, 0, T, 16 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 8, 2, 1, 4, 2, 16 },
> +    }, {
> +        /* config: -smp 8,sockets=2,threads=2,maxcpus=16
> +         * expect: cpus=8,sockets=2,dies=1,cores=4,threads=2,maxcpus=16 */
> +        .config = (SMPConfiguration) { T, 8, T, 2, F, 0, F, 0, T, 2, T, 16 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 8, 2, 1, 4, 2, 16 },
> +    }, {
> +        /* config: -smp 8,cores=4,threads=2,maxcpus=16
> +         * expect: cpus=8,sockets=2,dies=1,cores=4,threads=2,maxcpus=16 */
> +        .config = (SMPConfiguration) { T, 8, F, 0, F, 0, T, 4, T, 2, T, 16 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 8, 2, 1, 4, 2, 16 },
> +    }, {
> +        /* config: -smp sockets=2,cores=4,threads=2,maxcpus=16
> +         * expect: -smp 16,sockets=2,dies=1,cores=4,threads=2,maxcpus=16 */
> +        .config = (SMPConfiguration) { F, 0, T, 2, F, 0, T, 4, T, 2, T, 16 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 16, 2, 1, 4, 2, 16 },
> +    }, {
> +        /* config: -smp 8,sockets=2,cores=4,threads=2,maxcpus=16
> +         * expect: cpus=8,sockets=2,dies=1,cores=4,threads=2,maxcpus=16 */
> +        .config = (SMPConfiguration) { T, 8, T, 2, F, 0, T, 4, T, 2, T, 16 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 8, 2, 1, 4, 2, 16 },
> +    }, {
> +        /* config: -smp 8,sockets=2,dies=1,cores=4,threads=2,maxcpus=16
> +         * expect: cpus=8,sockets=2,dies=1,cores=4,threads=2,maxcpus=16 */
> +        .config = (SMPConfiguration) { T, 8, T, 2, T, 1, T, 4, T, 2, T, 16 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 8, 2, 1, 4, 2, 16 },
> +    }, {
> +        /* config: -smp 0
> +         * expect: error, "anything=0" is not allowed */
> +        .config = (SMPConfiguration) { T, 0, F, 0, F, 0, F, 0, F, 0, F, 0 },
> +        .should_be_valid = false,
> +    }, {
> +        /* config: -smp 8,sockets=0
> +         * expect: error, "anything=0" is not allowed */
> +        .config = (SMPConfiguration) { T, 8, T, 0, F, 0, F, 0, F, 0, F, 0 },
> +        .should_be_valid = false,
> +    }, {
> +        /* config: -smp 8,sockets=2,dies=0
> +         * expect: error, "anything=0" is not allowed */
> +        .config = (SMPConfiguration) { T, 0, T, 2, T, 0, F, 0, F, 0, F, 0 },
> +        .should_be_valid = false,
> +    }, {
> +        /* config: -smp 8,sockets=2,dies=1,cores=0
> +         * expect: error, "anything=0" is not allowed */
> +        .config = (SMPConfiguration) { T, 8, T, 2, T, 1, T, 0, F, 0, F, 0 },
> +        .should_be_valid = false,
> +    }, {
> +        /* config: -smp 8,sockets=2,dies=1,cores=4,threads=0
> +         * expect: error, "anything=0" is not allowed */
> +        .config = (SMPConfiguration) { T, 8, T, 2, T, 1, T, 4, T, 0, F, 0 },
> +        .should_be_valid = false,
> +    }, {
> +        /* config: -smp 8,sockets=2,dies=1,cores=4,threads=2,maxcpus=0
> +         * expect: error, "anything=0" is not allowed */
> +        .config = (SMPConfiguration) { T, 8, T, 2, T, 1, T, 4, T, 2, T, 0 },
> +        .should_be_valid = false,
> +    }, {
> +        /* config: -smp 8,dies=2
> +         * expect: error, multi-dies not supported */
> +        .config = (SMPConfiguration) { T, 8, F, 0, T, 2, F, 0, F, 0, F, 0 },
> +        .should_be_valid = false,
> +    }, {
> +        /* config: -smp 8,sockets=2,cores=8
> +         * expect: error, sum (16) != max_cpus (8) */
> +        .config = (SMPConfiguration) { T, 8, T, 2, F, 0, T, 4, T, 2, F, 0 },
> +        .should_be_valid = false,
> +    }, {
> +        /* config: -smp 8,sockets=2,cores=5,threads=2,maxcpus=16
> +         * expect: error, sum (20) != max_cpus (16) */
> +        .config = (SMPConfiguration) { F, 0, T, 3, F, 0, T, 5, T, 1, T, 16 },
> +        .should_be_valid = false,
> +    }, {
> +        /* config: -smp 16,maxcpus=12
> +         * expect: error, sum (12) < smp_cpus (16) */
> +        .config = (SMPConfiguration) { T, 16, F, 0, F, 0, F, 0, F, 0, T, 12 },
> +        .should_be_valid = false,
> +    },
> +};
> +
> +static struct SMPTestData prefer_sockets_support_dies[] = {
> +    {
> +        /* config: -smp dies=2
> +         * expect: cpus=2,sockets=1,dies=2,cores=1,threads=1,maxcpus=2 */
> +        .config = (SMPConfiguration) { F, 0, F, 0, T, 2, F, 0, F, 0, F, 0 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 2, 1, 2, 1, 1, 2 },
> +    }, {
> +        /* config: -smp 16,dies=2
> +         * expect: cpus=16,sockets=8,dies=2,cores=1,threads=1,maxcpus=16 */
> +        .config = (SMPConfiguration) { T, 16, F, 0, T, 2, F, 0, F, 0, F, 0 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 16, 8, 2, 1, 1, 16 },
> +    }, {
> +        /* config: -smp sockets=2,dies=2
> +         * expect: cpus=4,sockets=2,dies=2,cores=1,threads=1,maxcpus=4 */
> +        .config = (SMPConfiguration) { F, 0, T, 2, T, 2, F, 0, F, 0, F, 0 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 4, 2, 2, 1, 1, 4 },
> +    }, {
> +        /* config: -smp dies=2,cores=4
> +         * expect: cpus=8,sockets=1,dies=2,cores=4,threads=1,maxcpus=8 */
> +        .config = (SMPConfiguration) { F, 0, F, 0, T, 2, T, 4, F, 0, F, 0 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 8, 1, 2, 4, 1, 8 },
> +    }, {
> +        /* config: -smp dies=2,threads=2
> +         * expect: cpus=4,sockets=1,dies=2,cores=1,threads=2,maxcpus=4 */
> +        .config = (SMPConfiguration) { F, 0, F, 0, T, 2, F, 0, T, 2, F, 0 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 4, 1, 2, 1, 2, 4 },
> +    }, {
> +        /* config: -smp dies=2,maxcpus=32
> +         * expect: cpus=32,sockets=16,dies=2,cores=1,threads=1,maxcpus=32 */
> +        .config = (SMPConfiguration) { F, 0, F, 0, T, 2, F, 0, F, 0, T, 32 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 32, 16, 2, 1, 1, 32 },
> +    }, {
> +        /* config: -smp 16,sockets=2,dies=2
> +         * expect: cpus=16,sockets=2,dies=2,cores=4,threads=1,maxcpus=16 */
> +        .config = (SMPConfiguration) { T, 16, T, 2, T, 2, F, 0, F, 0, F, 0 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 16, 2, 2, 4, 1, 16 },
> +    }, {
> +        /* config: -smp 16,dies=2,cores=4
> +         * expect: cpus=16,sockets=2,dies=2,cores=4,threads=1,maxcpus=16 */
> +        .config = (SMPConfiguration) { T, 16, F, 0, T, 2, T, 4, F, 0, F, 0 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 16, 2, 2, 4, 1, 16 },
> +    }, {
> +        /* config: -smp 16,dies=2,threads=2
> +         * expect: cpus=16,sockets=4,dies=2,cores=1,threads=2,maxcpus=16 */
> +        .config = (SMPConfiguration) { T, 16, F, 0, T, 2, F, 0, T, 2, F, 0 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 16, 4, 2, 1, 2, 16 },
> +    }, {
> +        /* config: -smp 16,dies=2,maxcpus=32
> +         * expect: cpus=16,sockets=16,dies=2,cores=1,threads=1,maxcpus=32 */
> +        .config = (SMPConfiguration) { T, 16, F, 0, T, 2, F, 0, F, 0, T, 32 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 16, 16, 2, 1, 1, 32 },
> +    }, {
> +        /* config: -smp sockets=2,dies=2,cores=4
> +         * expect: cpus=16,sockets=2,dies=2,cores=4,threads=1,maxcpus=16 */
> +        .config = (SMPConfiguration) { F, 0, T, 2, T, 2, T, 4, F, 0, F, 0 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 16, 2, 2, 4, 1, 16 },
> +    }, {
> +        /* config: -smp sockets=2,dies=2,threads=2
> +         * expect: cpus=8,sockets=2,dies=2,cores=1,threads=2,maxcpus=8 */
> +        .config = (SMPConfiguration) { F, 0, T, 2, T, 2, F, 0, T, 2, F, 0 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 8, 2, 2, 1, 2, 8 },
> +    }, {
> +        /* config: -smp sockets=2,dies=2,maxcpus=32
> +         * expect: cpus=32,sockets=2,dies=2,cores=8,threads=1,maxcpus=32 */
> +        .config = (SMPConfiguration) { F, 0, T, 2, T, 2, F, 0, F, 0, T, 32 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 32, 2, 2, 8, 1, 32 },
> +    }, {
> +        /* config: -smp dies=2,cores=4,threads=2
> +         * expect: cpus=16,sockets=1,dies=2,cores=4,threads=2,maxcpus=16 */
> +        .config = (SMPConfiguration) { F, 0, F, 0, T, 2, T, 4, T, 2, F, 0 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 16, 1, 2, 4, 2, 16 },
> +    }, {
> +        /* config: -smp dies=2,cores=4,maxcpus=32
> +         * expect: cpus=32,sockets=4,dies=2,cores=4,threads=1,maxcpus=32 */
> +        .config = (SMPConfiguration) { F, 0, F, 0, T, 2, T, 4, F, 0, T, 32 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 32, 4, 2, 4, 1, 32 },
> +    }, {
> +        /* config: -smp dies=2,threads=2,maxcpus=32
> +         * expect: cpus=32,sockets=8,dies=2,cores=1,threads=2,maxcpus=32 */
> +        .config = (SMPConfiguration) { F, 0, F, 0, T, 2, F, 0, T, 2, T, 32 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 32, 8, 2, 1, 2, 32 },
> +    }, {
> +        /* config: -smp 16,sockets=2,dies=2,cores=4
> +         * expect: cpus=16,sockets=2,dies=2,cores=4,threads=1,maxcpus=16 */
> +        .config = (SMPConfiguration) { T, 16, T, 2, T, 2, T, 4, F, 0, F, 0 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 16, 2, 2, 4, 1, 16 },
> +    }, {
> +        /* config: -smp 16,sockets=2,dies=2,threads=2
> +         * expect: cpus=16,sockets=2,dies=2,cores=2,threads=2,maxcpus=16 */
> +        .config = (SMPConfiguration) { T, 16, T, 2, T, 2, F, 0, T, 2, F, 0 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 16, 2, 2, 2, 2, 16 },
> +    }, {
> +        /* config: -smp 16,sockets=2,dies=2,maxcpus=32
> +         * expect: cpus=16,sockets=2,dies=2,cores=8,threads=1,maxcpus=32 */
> +        .config = (SMPConfiguration) { T, 16, T, 2, T, 2, F, 0, F, 0, T, 32 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 16, 2, 2, 8, 1, 32 },
> +    }, {
> +        /* config: -smp 16,dies=2,cores=4,threads=2
> +         * expect: cpus=16,sockets=1,dies=2,cores=4,threads=2,maxcpus=16 */
> +        .config = (SMPConfiguration) { T, 16, F, 0, T, 2, T, 4, T, 2, F, 0 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 16, 1, 2, 4, 2, 16 },
> +    }, {
> +        /* config: -smp 16,dies=2,cores=4,maxcpus=32
> +         * expect: cpus=16,sockets=4,dies=2,cores=4,threads=1,maxcpus=32 */
> +        .config = (SMPConfiguration) { T, 16, F, 0, T, 2, T, 4, F, 0, T, 32 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 16, 4, 2, 4, 1, 32 },
> +    }, {
> +        /* config: -smp 16,dies=2,threads=2,maxcpus=32
> +         * expect: cpus=16,sockets=8,dies=2,cores=1,threads=2,maxcpus=32 */
> +        .config = (SMPConfiguration) { T, 16, F, 0, T, 2, F, 0, T, 2, T, 32 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 16, 8, 2, 1, 2, 32 },
> +    }, {
> +        /* config: -smp sockets=2,dies=2,cores=4,threads=2
> +         * expect: cpus=32,sockets=2,dies=2,cores=4,threads=2,maxcpus=32 */
> +        .config = (SMPConfiguration) { F, 0, T, 2, T, 2, T, 4, T, 2, F, 0 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 32, 2, 2, 4, 2, 32 },
> +    }, {
> +        /* config: -smp sockets=2,dies=2,cores=4,maxcpus=32
> +         * expect: cpus=32,sockets=2,dies=2,cores=4,threads=2,maxcpus=32 */
> +        .config = (SMPConfiguration) { F, 0, T, 2, T, 2, T, 4, F, 0, T, 32 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 32, 2, 2, 4, 2, 32 },
> +    }, {
> +        /* config: -smp sockets=2,dies=2,threads=2,maxcpus=32
> +         * expect: cpus=32,sockets=2,dies=2,cores=4,threads=2,maxcpus=32 */
> +        .config = (SMPConfiguration) { F, 0, T, 2, T, 2, F, 0, T, 2, T, 32 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 32, 2, 2, 4, 2, 32 },
> +    }, {
> +        /* config: -smp dies=2,cores=4,threads=2,maxcpus=32
> +         * expect: cpus=32,sockets=2,dies=2,cores=4,threads=2,maxcpus=32 */
> +        .config = (SMPConfiguration) { F, 0, F, 0, T, 2, T, 4, T, 2, T, 32 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 32, 2, 2, 4, 2, 32 },
> +    }, {
> +        /* config: -smp 16,sockets=2,dies=2,cores=4,threads=1
> +         * expect: cpus=16,sockets=2,dies=2,cores=4,threads=1,maxcpus=16 */
> +        .config = (SMPConfiguration) { T, 16, T, 2, T, 2, T, 4, T, 1, F, 0 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 16, 2, 2, 4, 1, 16 },
> +    }, {
> +        /* config: -smp 16,sockets=2,dies=2,cores=4,maxcpus=32
> +         * expect: cpus=16,sockets=2,dies=2,cores=4,threads=2,maxcpus=32 */
> +        .config = (SMPConfiguration) { T, 16, T, 2, T, 2, T, 4, F, 0, T, 32 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 16, 2, 2, 4, 2, 32 },
> +    }, {
> +        /* config: -smp 16,sockets=2,dies=2,threads=2,maxcpus=32
> +         * expect: cpus=16,sockets=2,dies=2,cores=4,threads=2,maxcpus=32 */
> +        .config = (SMPConfiguration) { T, 16, T, 2, T, 2, F, 0, T, 2, T, 32 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 16, 2, 2, 4, 2, 32 },
> +    }, {
> +        /* config: -smp 16,dies=2,cores=4,threads=2,maxcpus=32
> +         * expect: cpus=16,sockets=2,dies=2,cores=4,threads=2,maxcpus=32 */
> +        .config = (SMPConfiguration) { T, 16, F, 0, T, 2, T, 4, T, 2, T, 32 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 16, 2, 2, 4, 2, 32 },
> +    }, {
> +        /* config: -smp sockets=2,dies=2,cores=4,threads=2,maxcpus=32
> +         * expect: -smp 32,sockets=2,dies=2,cores=4,threads=2,maxcpus=32 */
> +        .config = (SMPConfiguration) { F, 0, T, 2, T, 2, T, 4, T, 2, T, 32 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 32, 2, 2, 4, 2, 32 },
> +    }, {
> +        /* config: -smp 16,sockets=2,dies=2,cores=4,threads=2,maxcpus=32
> +         * expect: cpus=16,sockets=2,dies=2,cores=4,threads=2,maxcpus=32 */
> +        .config = (SMPConfiguration) { T, 16, T, 2, T, 2, T, 4, T, 2, T, 32 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 16, 2, 2, 4, 2, 32 },
> +    },
> +};
> +
> +/*
> + * prefer cores over sockets over threads since 6.2.
> + * all possible SMP configurations and the corressponding expected outputs
> + * are listed for testing, including the valid and invalid ones.
> + */
> +static struct SMPTestData prefer_cores[] = {
> +    {
> +        /* config: no smp configuration
> +         * expect: cpus=1,sockets=1,dies=1,cores=1,threads=1,maxcpus=1 */
> +        .config = (SMPConfiguration) { F, 0, F, 0, F, 0, F, 0, F, 0, F, 0 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 1, 1, 1, 1, 1, 1 },
> +    }, {
> +        /* config: -smp 8
> +         * expect: cpus=8,sockets=1,dies=1,cores=8,threads=1,maxcpus=8 */
> +        .config = (SMPConfiguration) { T, 8, F, 0, F, 0, F, 0, F, 0, F, 0 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 8, 1, 1, 8, 1, 8 },
> +    }, {
> +        /* config: -smp sockets=2
> +         * expect: cpus=2,sockets=2,dies=1,cores=1,threads=1,maxcpus=2 */
> +        .config = (SMPConfiguration) { F, 0, T, 2, F, 0, F, 0, F, 0, F, 0 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 2, 2, 1, 1, 1, 2 },
> +    }, {
> +        /* config: -smp cores=4
> +         * expect: cpus=4,sockets=1,dies=1,cores=4,threads=1,maxcpus=4 */
> +        .config = (SMPConfiguration) { F, 0, F, 0, F, 0, T, 4, F, 0, F, 0 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 4, 1, 1, 4, 1, 4 },
> +    }, {
> +        /* config: -smp threads=2
> +         * expect: cpus=2,sockets=1,dies=1,cores=1,threads=2,maxcpus=2 */
> +        .config = (SMPConfiguration) { F, 0, F, 0, F, 0, F, 0, T, 2, F, 0 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 2, 1, 1, 1, 2, 2 },
> +    }, {
> +        /* config: -smp maxcpus=16
> +         * expect: cpus=16,sockets=1,dies=1,cores=16,threads=1,maxcpus=16 */
> +        .config = (SMPConfiguration) { F, 0, F, 0, F, 0, F, 0, F, 0, T, 16 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 16, 1, 1, 16, 1, 16 },
> +    }, {
> +        /* config: -smp 8,sockets=2
> +         * expect: cpus=8,sockets=2,dies=1,cores=4,threads=1,maxcpus=8 */
> +        .config = (SMPConfiguration) { T, 8, T, 2, F, 0, F, 0, F, 0, F, 0 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 8, 2, 1, 4, 1, 8 },
> +    }, {
> +        /* config: -smp 8,cores=4
> +         * expect: cpus=8,sockets=2,dies=1,cores=4,threads=1,maxcpus=8 */
> +        .config = (SMPConfiguration) { T, 8, F, 0, F, 0, T, 4, F, 0, F, 0 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 8, 2, 1, 4, 1, 8 },
> +    }, {
> +        /* config: -smp 8,threads=2
> +         * expect: cpus=8,sockets=1,dies=1,cores=4,threads=2,maxcpus=8 */
> +        .config = (SMPConfiguration) { T, 8, F, 0, F, 0, F, 0, T, 2, F, 0 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 8, 1, 1, 4, 2, 8 },
> +    }, {
> +        /* config: -smp 8,maxcpus=16
> +         * expect: cpus=8,sockets=1,dies=1,cores=16,threads=1,maxcpus=16 */
> +        .config = (SMPConfiguration) { T, 8, F, 0, F, 0, F, 0, F, 0, T, 16 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 8, 1, 1, 16, 1, 16 },
> +    }, {
> +        /* config: -smp sockets=2,cores=4
> +         * expect: cpus=8,sockets=2,dies=1,cores=4,threads=1,maxcpus=8 */
> +        .config = (SMPConfiguration) { F, 0, T, 2, F, 0, T, 4, F, 0, F, 0 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 8, 2, 1, 4, 1, 8 },
> +    }, {
> +        /* config: -smp sockets=2,threads=2
> +         * expect: cpus=4,sockets=2,dies=1,cores=1,threads=2,maxcpus=4 */
> +        .config = (SMPConfiguration) { F, 0, T, 2, F, 0, F, 0, T, 2, F, 0 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 4, 2, 1, 1, 2, 4 },
> +    }, {
> +        /* config: -smp sockets=2,maxcpus=16
> +         * expect: cpus=16,sockets=2,dies=1,cores=8,threads=1,maxcpus=16 */
> +        .config = (SMPConfiguration) { F, 0, T, 2, F, 0, F, 0, F, 0, T, 16 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 16, 2, 1, 8, 1, 16 },
> +    }, {
> +        /* config: -smp cores=4,threads=2
> +         * expect: cpus=8,sockets=1,dies=1,cores=4,threads=2,maxcpus=8 */
> +        .config = (SMPConfiguration) { F, 0, F, 0, F, 0, T, 4, T, 2, F, 0 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 8, 1, 1, 4, 2, 8 },
> +    }, {
> +        /* config: -smp cores=4,maxcpus=16
> +         * expect: cpus=16,sockets=4,dies=1,cores=4,threads=1,maxcpus=16 */
> +        .config = (SMPConfiguration) { F, 0, F, 0, F, 0, T, 4, F, 0, T, 16 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 16, 4, 1, 4, 1, 16 },
> +    }, {
> +        /* config: -smp threads=2,maxcpus=16
> +         * expect: cpus=16,sockets=1,dies=1,cores=8,threads=2,maxcpus=16 */
> +        .config = (SMPConfiguration) { F, 0, F, 0, F, 0, F, 0, T, 2, T, 16 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 16, 1, 1, 8, 2, 16 },
> +    }, {
> +        /* config: -smp 8,sockets=2,cores=4
> +         * expect: cpus=8,sockets=2,dies=1,cores=4,threads=1,maxcpus=8 */
> +        .config = (SMPConfiguration) { T, 8, T, 2, F, 0, T, 4, F, 0, F, 0 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 8, 2, 1, 4, 1, 8 },
> +    }, {
> +        /* config: -smp 8,sockets=2,threads=2
> +         * expect: cpus=8,sockets=2,dies=1,cores=2,threads=2,maxcpus=8 */
> +        .config = (SMPConfiguration) { T, 8, T, 2, F, 0, F, 0, T, 2, F, 0 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 8, 2, 1, 2, 2, 8 },
> +    }, {
> +        /* config: -smp 8,sockets=2,maxcpus=16
> +         * expect: cpus=8,sockets=2,dies=1,cores=8,threads=1,maxcpus=16 */
> +        .config = (SMPConfiguration) { T, 8, T, 2, F, 0, F, 0, F, 0, T, 16 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 8, 2, 1, 8, 1, 16 },
> +    }, {
> +        /* config: -smp 8,cores=4,threads=2
> +         * expect: cpus=8,sockets=1,dies=1,cores=4,threads=2,maxcpus=8 */
> +        .config = (SMPConfiguration) { T, 8, F, 0, F, 0, T, 4, T, 2, F, 0 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 8, 1, 1, 4, 2, 8 },
> +    }, {
> +        /* config: -smp 8,cores=4,maxcpus=16
> +         * expect: cpus=8,sockets=4,dies=1,cores=4,threads=1,maxcpus=16 */
> +        .config = (SMPConfiguration) { T, 8, F, 0, F, 0, T, 4, F, 0, T, 16 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 8, 4, 1, 4, 1, 16 },
> +    }, {
> +        /* config: -smp 8,threads=2,maxcpus=16
> +         * expect: cpus=8,sockets=1,dies=1,cores=8,threads=2,maxcpus=16 */
> +        .config = (SMPConfiguration) { T, 8, F, 0, F, 0, F, 0, T, 2, T, 16 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 8, 1, 1, 8, 2, 16 },
> +    }, {
> +        /* config: -smp sockets=2,cores=4,threads=2
> +         * expect: cpus=16,sockets=2,dies=1,cores=4,threads=2,maxcpus=16 */
> +        .config = (SMPConfiguration) { F, 0, T, 2, F, 0, T, 4, T, 2, F, 0 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 16, 2, 1, 4, 2, 16 },
> +    }, {
> +        /* config: -smp sockets=2,cores=4,maxcpus=16
> +         * expect: cpus=16,sockets=2,dies=1,cores=4,threads=2,maxcpus=16 */
> +        .config = (SMPConfiguration) { F, 0, T, 2, F, 0, T, 4, F, 0, T, 16 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 16, 2, 1, 4, 2, 16 },
> +    }, {
> +        /* config: -smp sockets=2,threads=2,maxcpus=16
> +         * expect: cpus=16,sockets=2,dies=1,cores=4,threads=2,maxcpus=16 */
> +        .config = (SMPConfiguration) { F, 0, T, 2, F, 0, F, 0, T, 2, T, 16 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 16, 2, 1, 4, 2, 16 },
> +    }, {
> +        /* config: -smp cores=4,threads=2,maxcpus=16
> +         * expect: cpus=16,sockets=2,dies=1,cores=4,threads=2,maxcpus=16 */
> +        .config = (SMPConfiguration) { F, 0, F, 0, F, 0, T, 4, T, 2, T, 16 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 16, 2, 1, 4, 2, 16 },
> +    }, {
> +        /* config: -smp 8,sockets=2,cores=4,threads=1
> +         * expect: cpus=8,sockets=2,dies=1,cores=4,threads=1,maxcpus=8 */
> +        .config = (SMPConfiguration) { T, 8, T, 2, F, 0, T, 4, T, 1, F, 0 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 8, 2, 1, 4, 1, 8 },
> +    }, {
> +        /* config: -smp 8,sockets=2,cores=4,maxcpus=16
> +         * expect: cpus=8,sockets=2,dies=1,cores=4,threads=2,maxcpus=16 */
> +        .config = (SMPConfiguration) { T, 8, T, 2, F, 0, T, 4, F, 0, T, 16 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 8, 2, 1, 4, 2, 16 },
> +    }, {
> +        /* config: -smp 8,sockets=2,threads=2,maxcpus=16
> +         * expect: cpus=8,sockets=2,dies=1,cores=4,threads=2,maxcpus=16 */
> +        .config = (SMPConfiguration) { T, 8, T, 2, F, 0, F, 0, T, 2, T, 16 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 8, 2, 1, 4, 2, 16 },
> +    }, {
> +        /* config: -smp 8,cores=4,threads=2,maxcpus=16
> +         * expect: cpus=8,sockets=2,dies=1,cores=4,threads=2,maxcpus=16 */
> +        .config = (SMPConfiguration) { T, 8, F, 0, F, 0, T, 4, T, 2, T, 16 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 8, 2, 1, 4, 2, 16 },
> +    }, {
> +        /* config: -smp sockets=2,cores=4,threads=2,maxcpus=16
> +         * expect: -smp 16,sockets=2,dies=1,cores=4,threads=2,maxcpus=16 */
> +        .config = (SMPConfiguration) { F, 0, T, 2, F, 0, T, 4, T, 2, T, 16 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 16, 2, 1, 4, 2, 16 },
> +    }, {
> +        /* config: -smp 8,sockets=2,cores=4,threads=2,maxcpus=16
> +         * expect: cpus=8,sockets=2,dies=1,cores=4,threads=2,maxcpus=16 */
> +        .config = (SMPConfiguration) { T, 8, T, 2, F, 0, T, 4, T, 2, T, 16 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 8, 2, 1, 4, 2, 16 },
> +    }, {
> +        /* config: -smp 8,sockets=2,dies=1,cores=4,threads=2,maxcpus=16
> +         * expect: cpus=8,sockets=2,dies=1,cores=4,threads=2,maxcpus=16 */
> +        .config = (SMPConfiguration) { T, 8, T, 2, T, 1, T, 4, T, 2, T, 16 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 8, 2, 1, 4, 2, 16 },
> +    }, {
> +        /* config: -smp 0
> +         * expect: error, "anything=0" is not allowed */
> +        .config = (SMPConfiguration) { T, 0, F, 0, F, 0, F, 0, F, 0, F, 0 },
> +        .should_be_valid = false,
> +    }, {
> +        /* config: -smp 8,sockets=0
> +         * expect: error, "anything=0" is not allowed */
> +        .config = (SMPConfiguration) { T, 8, T, 0, F, 0, F, 0, F, 0, F, 0 },
> +        .should_be_valid = false,
> +    }, {
> +        /* config: -smp 8,sockets=2,dies=0
> +         * expect: error, "anything=0" is not allowed */
> +        .config = (SMPConfiguration) { T, 0, T, 2, T, 0, F, 0, F, 0, F, 0 },
> +        .should_be_valid = false,
> +    }, {
> +        /* config: -smp 8,sockets=2,dies=1,cores=0
> +         * expect: error, "anything=0" is not allowed */
> +        .config = (SMPConfiguration) { T, 8, T, 2, T, 1, T, 0, F, 0, F, 0 },
> +        .should_be_valid = false,
> +    }, {
> +        /* config: -smp 8,sockets=2,dies=1,cores=4,threads=0
> +         * expect: error, "anything=0" is not allowed */
> +        .config = (SMPConfiguration) { T, 8, T, 2, T, 1, T, 4, T, 0, F, 0 },
> +        .should_be_valid = false,
> +    }, {
> +        /* config: -smp 8,sockets=2,dies=1,cores=4,threads=2,maxcpus=0
> +         * expect: error, "anything=0" is not allowed */
> +        .config = (SMPConfiguration) { T, 8, T, 2, T, 1, T, 4, T, 2, T, 0 },
> +        .should_be_valid = false,
> +    }, {
> +        /* config: -smp 8,dies=2
> +         * expect: error, multi-dies not supported */
> +        .config = (SMPConfiguration) { T, 8, F, 0, T, 2, F, 0, F, 0, F, 0 },
> +        .should_be_valid = false,
> +    }, {
> +        /* config: -smp 8,sockets=2,cores=8
> +         * expect: error, sum (16) != max_cpus (8) */
> +        .config = (SMPConfiguration) { T, 8, T, 2, F, 0, T, 4, T, 2, F, 0 },
> +        .should_be_valid = false,
> +    }, {
> +        /* config: -smp 8,sockets=2,cores=5,threads=2,maxcpus=16
> +         * expect: error, sum (20) != max_cpus (16) */
> +        .config = (SMPConfiguration) { F, 0, T, 3, F, 0, T, 5, T, 1, T, 16 },
> +        .should_be_valid = false,
> +    }, {
> +        /* config: -smp 16,maxcpus=12
> +         * expect: error, sum (12) < smp_cpus (16) */
> +        .config = (SMPConfiguration) { T, 16, F, 0, F, 0, F, 0, F, 0, T, 12 },
> +        .should_be_valid = false,
> +    },
> +};
> +
> +static struct SMPTestData prefer_cores_support_dies[] = {
> +    {
> +        /* config: -smp dies=2
> +         * expect: cpus=2,sockets=1,dies=2,cores=1,threads=1,maxcpus=2 */
> +        .config = (SMPConfiguration) { F, 0, F, 0, T, 2, F, 0, F, 0, F, 0 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 2, 1, 2, 1, 1, 2 },
> +    }, {
> +        /* config: -smp 16,dies=2
> +         * expect: cpus=16,sockets=1,dies=2,cores=8,threads=1,maxcpus=16 */
> +        .config = (SMPConfiguration) { T, 16, F, 0, T, 2, F, 0, F, 0, F, 0 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 16, 1, 2, 8, 1, 16 },
> +    }, {
> +        /* config: -smp sockets=2,dies=2
> +         * expect: cpus=4,sockets=2,dies=2,cores=1,threads=1,maxcpus=4 */
> +        .config = (SMPConfiguration) { F, 0, T, 2, T, 2, F, 0, F, 0, F, 0 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 4, 2, 2, 1, 1, 4 },
> +    }, {
> +        /* config: -smp dies=2,cores=4
> +         * expect: cpus=8,sockets=1,dies=2,cores=4,threads=1,maxcpus=8 */
> +        .config = (SMPConfiguration) { F, 0, F, 0, T, 2, T, 4, F, 0, F, 0 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 8, 1, 2, 4, 1, 8 },
> +    }, {
> +        /* config: -smp dies=2,threads=2
> +         * expect: cpus=4,sockets=1,dies=2,cores=1,threads=2,maxcpus=4 */
> +        .config = (SMPConfiguration) { F, 0, F, 0, T, 2, F, 0, T, 2, F, 0 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 4, 1, 2, 1, 2, 4 },
> +    }, {
> +        /* config: -smp dies=2,maxcpus=32
> +         * expect: cpus=32,sockets=1,dies=2,cores=16,threads=1,maxcpus=32 */
> +        .config = (SMPConfiguration) { F, 0, F, 0, T, 2, F, 0, F, 0, T, 32 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 32, 1, 2, 16, 1, 32 },
> +    }, {
> +        /* config: -smp 16,sockets=2,dies=2
> +         * expect: cpus=16,sockets=2,dies=2,cores=4,threads=1,maxcpus=16 */
> +        .config = (SMPConfiguration) { T, 16, T, 2, T, 2, F, 0, F, 0, F, 0 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 16, 2, 2, 4, 1, 16 },
> +    }, {
> +        /* config: -smp 16,dies=2,cores=4
> +         * expect: cpus=16,sockets=2,dies=2,cores=4,threads=1,maxcpus=16 */
> +        .config = (SMPConfiguration) { T, 16, F, 0, T, 2, T, 4, F, 0, F, 0 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 16, 2, 2, 4, 1, 16 },
> +    }, {
> +        /* config: -smp 16,dies=2,threads=2
> +         * expect: cpus=16,sockets=1,dies=2,cores=4,threads=2,maxcpus=16 */
> +        .config = (SMPConfiguration) { T, 16, F, 0, T, 2, F, 0, T, 2, F, 0 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 16, 1, 2, 4, 2, 16 },
> +    }, {
> +        /* config: -smp 16,dies=2,maxcpus=32
> +         * expect: cpus=16,sockets=1,dies=2,cores=16,threads=1,maxcpus=32 */
> +        .config = (SMPConfiguration) { T, 16, F, 0, T, 2, F, 0, F, 0, T, 32 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 16, 1, 2, 16, 1, 32 },
> +    }, {
> +        /* config: -smp sockets=2,dies=2,cores=4
> +         * expect: cpus=16,sockets=2,dies=2,cores=4,threads=1,maxcpus=16 */
> +        .config = (SMPConfiguration) { F, 0, T, 2, T, 2, T, 4, F, 0, F, 0 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 16, 2, 2, 4, 1, 16 },
> +    }, {
> +        /* config: -smp sockets=2,dies=2,threads=2
> +         * expect: cpus=8,sockets=2,dies=2,cores=1,threads=2,maxcpus=8 */
> +        .config = (SMPConfiguration) { F, 0, T, 2, T, 2, F, 0, T, 2, F, 0 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 8, 2, 2, 1, 2, 8 },
> +    }, {
> +        /* config: -smp sockets=2,dies=2,maxcpus=32
> +         * expect: cpus=32,sockets=2,dies=2,cores=8,threads=1,maxcpus=32 */
> +        .config = (SMPConfiguration) { F, 0, T, 2, T, 2, F, 0, F, 0, T, 32 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 32, 2, 2, 8, 1, 32 },
> +    }, {
> +        /* config: -smp dies=2,cores=4,threads=2
> +         * expect: cpus=16,sockets=1,dies=2,cores=4,threads=2,maxcpus=16 */
> +        .config = (SMPConfiguration) { F, 0, F, 0, T, 2, T, 4, T, 2, F, 0 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 16, 1, 2, 4, 2, 16 },
> +    }, {
> +        /* config: -smp dies=2,cores=4,maxcpus=32
> +         * expect: cpus=32,sockets=4,dies=2,cores=4,threads=1,maxcpus=32 */
> +        .config = (SMPConfiguration) { F, 0, F, 0, T, 2, T, 4, F, 0, T, 32 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 32, 4, 2, 4, 1, 32 },
> +    }, {
> +        /* config: -smp dies=2,threads=2,maxcpus=32
> +         * expect: cpus=32,sockets=1,dies=2,cores=8,threads=2,maxcpus=32 */
> +        .config = (SMPConfiguration) { F, 0, F, 0, T, 2, F, 0, T, 2, T, 32 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 32, 1, 2, 8, 2, 32 },
> +    }, {
> +        /* config: -smp 16,sockets=2,dies=2,cores=4
> +         * expect: cpus=16,sockets=2,dies=2,cores=4,threads=1,maxcpus=16 */
> +        .config = (SMPConfiguration) { T, 16, T, 2, T, 2, T, 4, F, 0, F, 0 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 16, 2, 2, 4, 1, 16 },
> +    }, {
> +        /* config: -smp 16,sockets=2,dies=2,threads=2
> +         * expect: cpus=16,sockets=2,dies=2,cores=2,threads=2,maxcpus=16 */
> +        .config = (SMPConfiguration) { T, 16, T, 2, T, 2, F, 0, T, 2, F, 0 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 16, 2, 2, 2, 2, 16 },
> +    }, {
> +        /* config: -smp 16,sockets=2,dies=2,maxcpus=32
> +         * expect: cpus=16,sockets=2,dies=2,cores=8,threads=1,maxcpus=32 */
> +        .config = (SMPConfiguration) { T, 16, T, 2, T, 2, F, 0, F, 0, T, 32 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 16, 2, 2, 8, 1, 32 },
> +    }, {
> +        /* config: -smp 16,dies=2,cores=4,threads=2
> +         * expect: cpus=16,sockets=1,dies=2,cores=4,threads=2,maxcpus=16 */
> +        .config = (SMPConfiguration) { T, 16, F, 0, T, 2, T, 4, T, 2, F, 0 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 16, 1, 2, 4, 2, 16 },
> +    }, {
> +        /* config: -smp 16,dies=2,cores=4,maxcpus=32
> +         * expect: cpus=16,sockets=4,dies=2,cores=4,threads=1,maxcpus=32 */
> +        .config = (SMPConfiguration) { T, 16, F, 0, T, 2, T, 4, F, 0, T, 32 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 16, 4, 2, 4, 1, 32 },
> +    }, {
> +        /* config: -smp 16,dies=2,threads=2,maxcpus=32
> +         * expect: cpus=16,sockets=1,dies=2,cores=8,threads=2,maxcpus=32 */
> +        .config = (SMPConfiguration) { T, 16, F, 0, T, 2, F, 0, T, 2, T, 32 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 16, 1, 2, 8, 2, 32 },
> +    }, {
> +        /* config: -smp sockets=2,dies=2,cores=4,threads=2
> +         * expect: cpus=32,sockets=2,dies=2,cores=4,threads=2,maxcpus=32 */
> +        .config = (SMPConfiguration) { F, 0, T, 2, T, 2, T, 4, T, 2, F, 0 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 32, 2, 2, 4, 2, 32 },
> +    }, {
> +        /* config: -smp sockets=2,dies=2,cores=4,maxcpus=32
> +         * expect: cpus=32,sockets=2,dies=2,cores=4,threads=2,maxcpus=32 */
> +        .config = (SMPConfiguration) { F, 0, T, 2, T, 2, T, 4, F, 0, T, 32 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 32, 2, 2, 4, 2, 32 },
> +    }, {
> +        /* config: -smp sockets=2,dies=2,threads=2,maxcpus=32
> +         * expect: cpus=32,sockets=2,dies=2,cores=4,threads=2,maxcpus=32 */
> +        .config = (SMPConfiguration) { F, 0, T, 2, T, 2, F, 0, T, 2, T, 32 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 32, 2, 2, 4, 2, 32 },
> +    }, {
> +        /* config: -smp dies=2,cores=4,threads=2,maxcpus=32
> +         * expect: cpus=32,sockets=2,dies=2,cores=4,threads=2,maxcpus=32 */
> +        .config = (SMPConfiguration) { F, 0, F, 0, T, 2, T, 4, T, 2, T, 32 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 32, 2, 2, 4, 2, 32 },
> +    }, {
> +        /* config: -smp 16,sockets=2,dies=2,cores=4,threads=1
> +         * expect: cpus=16,sockets=2,dies=2,cores=4,threads=1,maxcpus=16 */
> +        .config = (SMPConfiguration) { T, 16, T, 2, T, 2, T, 4, T, 1, F, 0 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 16, 2, 2, 4, 1, 16 },
> +    }, {
> +        /* config: -smp 16,sockets=2,dies=2,cores=4,maxcpus=32
> +         * expect: cpus=16,sockets=2,dies=2,cores=4,threads=2,maxcpus=32 */
> +        .config = (SMPConfiguration) { T, 16, T, 2, T, 2, T, 4, F, 0, T, 32 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 16, 2, 2, 4, 2, 32 },
> +    }, {
> +        /* config: -smp 16,sockets=2,dies=2,threads=2,maxcpus=32
> +         * expect: cpus=16,sockets=2,dies=2,cores=4,threads=2,maxcpus=32 */
> +        .config = (SMPConfiguration) { T, 16, T, 2, T, 2, F, 0, T, 2, T, 32 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 16, 2, 2, 4, 2, 32 },
> +    }, {
> +        /* config: -smp 16,dies=2,cores=4,threads=2,maxcpus=32
> +         * expect: cpus=16,sockets=2,dies=2,cores=4,threads=2,maxcpus=32 */
> +        .config = (SMPConfiguration) { T, 16, F, 0, T, 2, T, 4, T, 2, T, 32 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 16, 2, 2, 4, 2, 32 },
> +    }, {
> +        /* config: -smp sockets=2,dies=2,cores=4,threads=2,maxcpus=32
> +         * expect: -smp 32,sockets=2,dies=2,cores=4,threads=2,maxcpus=32 */
> +        .config = (SMPConfiguration) { F, 0, T, 2, T, 2, T, 4, T, 2, T, 32 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 32, 2, 2, 4, 2, 32 },
> +    }, {
> +        /* config: -smp 16,sockets=2,dies=2,cores=4,threads=2,maxcpus=32
> +         * expect: cpus=16,sockets=2,dies=2,cores=4,threads=2,maxcpus=32 */
> +        .config = (SMPConfiguration) { T, 16, T, 2, T, 2, T, 4, T, 2, T, 32 },
> +        .should_be_valid = true,
> +        .expect = (CpuTopology) { 16, 2, 2, 4, 2, 32 },
> +    },
> +};
> +
> +static char *get_config_info(SMPConfiguration *config)
> +{
> +    return g_strdup_printf(
> +        "(SMPConfiguration) {\n"
> +        "    .has_cpus    = %5s, cpus    = %ld,\n"
> +        "    .has_sockets = %5s, sockets = %ld,\n"
> +        "    .has_dies    = %5s, dies    = %ld,\n"
> +        "    .has_cores   = %5s, cores   = %ld,\n"
> +        "    .has_threads = %5s, threads = %ld,\n"
> +        "    .has_maxcpus = %5s, maxcpus = %ld,\n"
> +        "}",
> +        config->has_cpus ? "true" : "false", config->cpus,
> +        config->has_sockets ? "true" : "false", config->sockets,
> +        config->has_dies ? "true" : "false", config->dies,
> +        config->has_cores ? "true" : "false", config->cores,
> +        config->has_threads ? "true" : "false", config->threads,
> +        config->has_maxcpus ? "true" : "false", config->maxcpus);
> +}
> +
> +static char *get_topo_info(CpuTopology *topo)
> +{
> +    return g_strdup_printf(
> +        "(CpuTopology) {\n"
> +        "    .cpus     = %u,\n"
> +        "    .sockets  = %u,\n"
> +        "    .dies     = %u,\n"
> +        "    .cores    = %u,\n"
> +        "    .threads  = %u,\n"
> +        "    .max_cpus = %u,\n"
> +        "}",
> +        topo->cpus, topo->sockets, topo->dies,
> +        topo->cores, topo->threads, topo->max_cpus);
> +}
> +
> +static void check_smp_parse(MachineState *ms, SMPTestData *data)
> +{
> +    SMPConfiguration *config = &data->config;
> +    CpuTopology *expect = &data->expect;
> +    g_autofree char *config_info = NULL;
> +    g_autofree char *expect_info = NULL;
> +    g_autofree char *result_info = NULL;
> +    Error *err = NULL;
> +
> +    /* call the generic parser smp_parse() in hw/core/machine-smp.c */
> +    smp_parse(ms, config, &err);
> +
> +    if (data->should_be_valid) {
> +        if ((err == NULL) &&
> +            (ms->smp.cpus == expect->cpus) &&
> +            (ms->smp.sockets == expect->sockets) &&
> +            (ms->smp.dies == expect->dies) &&
> +            (ms->smp.cores == expect->cores) &&
> +            (ms->smp.threads == expect->threads) &&
> +            (ms->smp.max_cpus == expect->max_cpus)) {
> +            return;
> +        }
> +
> +        config_info = get_config_info(config);
> +        expect_info = get_topo_info(expect);
> +
> +        if (err != NULL) {
> +            g_printerr("Check smp_parse failed:\n"
> +                       "config: %s\n"
> +                       "expect: %s\n"
> +                       "should_be_valid: yes\n\n"
> +                       "result_is_valid: no\n"
> +                       "error_msg: %s\n",
> +                       config_info, expect_info, error_get_pretty(err));
> +            error_free(err);
> +        } else {
> +            result_info = get_topo_info(&ms->smp);
> +            g_printerr("Check smp_parse failed:\n"
> +                       "config: %s\n"
> +                       "expect: %s\n"
> +                       "should_be_valid: yes\n\n"
> +                       "result_is_valid: yes\n"
> +                       "result: %s\n",
> +                       config_info, expect_info, result_info);
> +        }
> +    } else {
> +        if (err != NULL) {
> +            error_free(err);
> +            return;
> +        }
> +
> +        config_info = get_config_info(config);
> +        result_info = get_topo_info(&ms->smp);
> +
> +        g_printerr("Check smp_parse failed:\n"
> +                   "config: %s\n"
> +                   "should_be_valid: no\n\n"
> +                   "result_is_valid: yes\n"
> +                   "result: %s\n",
> +                   config_info, result_info);
> +    }
> +
> +    abort();
> +}
> +
> +static void smp_prefer_sockets_test(void)
> +{
> +    Object *obj = object_new(TYPE_MACHINE);
> +    MachineState *ms = MACHINE(obj);
> +    MachineClass *mc = MACHINE_GET_CLASS(obj);
> +    int i;
> +
> +    /* make sure that we have created the object */
> +    g_assert_nonnull(ms);
> +    g_assert_nonnull(mc);
> +
> +    mc->smp_prefer_sockets = true;
> +
> +    /* test cases when multi-dies are not supported */
> +    mc->smp_dies_supported = false;
> +    for (i = 0; i < ARRAY_SIZE(prefer_sockets); i++) {
> +        check_smp_parse(ms, &prefer_sockets[i]);
> +    }
> +
> +    /* test cases when multi-dies are supported */
> +    mc->smp_dies_supported = true;
> +    for (i = 0; i < ARRAY_SIZE(prefer_sockets_support_dies); i++) {
> +        check_smp_parse(ms, &prefer_sockets_support_dies[i]);
> +    }
> +
> +    object_unref(obj);
> +}
> +
> +static void smp_prefer_cores_test(void)
> +{
> +    Object *obj = object_new(TYPE_MACHINE);
> +    MachineState *ms = MACHINE(obj);
> +    MachineClass *mc = MACHINE_GET_CLASS(obj);
> +    int i;
> +
> +    /* make sure that we have created the object */
> +    g_assert_nonnull(ms);
> +    g_assert_nonnull(mc);
> +
> +    mc->smp_prefer_sockets = false;
> +
> +    /* test cases when multi-dies are not supported */
> +    mc->smp_dies_supported = false;
> +    for (i = 0; i < ARRAY_SIZE(prefer_cores); i++) {
> +        check_smp_parse(ms, &prefer_cores[i]);
> +    }
> +
> +    /* test cases when multi-dies are supported */
> +    mc->smp_dies_supported = true;
> +    for (i = 0; i < ARRAY_SIZE(prefer_cores_support_dies); i++) {
> +        check_smp_parse(ms, &prefer_cores_support_dies[i]);
> +    }
> +
> +    object_unref(obj);
> +}
> +
> +int main(int argc, char *argv[])
> +{
> +    g_test_init(&argc, &argv, NULL);
> +
> +    module_call_init(MODULE_INIT_QOM);
> +    type_register_static(&smp_machine_info);
> +
> +    g_test_add_func("/test-smp-parse/prefer_sockets", smp_prefer_sockets_test);
> +    g_test_add_func("/test-smp-parse/prefer_cores", smp_prefer_cores_test);
> +
> +    g_test_run();
> +
> +    return 0;
> +}
> -- 
> 2.19.1
>

Besides the nits, it looks good to me.

Reviewed-by: Andrew Jones <drjones@redhat.com>


