Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37FC42D350A
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 22:17:48 +0100 (CET)
Received: from localhost ([::1]:53608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmkMl-00029k-7E
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 16:17:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kmj9q-0006AY-36
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 15:00:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kmj9n-0004fp-Mw
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 15:00:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607457618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xDNdtkun1DBjXRjqtT+28RgsiFli2FW7W8L+Y/R2CGQ=;
 b=GKwBR3lGbShw9c30TfrngxnmjoATgT10l7VC88CanapD06pB7Wv5FcCFnV5Rc5mYyDrdTq
 S+ABP7PBxz4l0C2FLqk+bCXuwsEiL7HoFMO3Wifk/86t2P+1aLyLAXAIB/XWoJjrpwTDJL
 vlhlVVGNrhVrNuSyVnGL2mHF+QrZ6VQ=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-138-pCiaQ8v8M6615myTRK3fDQ-1; Tue, 08 Dec 2020 15:00:13 -0500
X-MC-Unique: pCiaQ8v8M6615myTRK3fDQ-1
Received: by mail-ej1-f71.google.com with SMTP id g24so1659063ejh.22
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 12:00:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xDNdtkun1DBjXRjqtT+28RgsiFli2FW7W8L+Y/R2CGQ=;
 b=FeKHTtsmiCJonjfqVIXvb20HpOv6lMTLCLM2LZWGl3F5HY3aBe0w8iK5L8jcf2rb+a
 wpcfOmGXNOx4LiMid4qlwKFd78NrIHx3bNcUDsBBO0njSijogVNaYHxjFKzWi7k7fZDf
 nAfq86HGjaHsuid9E/A1HFLVjCyfKELAATs5BsHeJChxQRPGQ80JdffwWsKFsy0VHWQ/
 Xr6TczjJ2sA0ujoqOZ5IkFUSD8vp9GhRSQApDgjmHYhGWTtKZgbEEM6Jk1pfaN2y8PB6
 ueJs//MAYaaKxUwfAxvkjL4R2317XFJ+n4DUX/8djbJnP64YliFmDJeZg+eY4AxQaTNa
 5gvw==
X-Gm-Message-State: AOAM530nHqARyfrPy5avlac4xJ+NqnaM3zkYx9N6SUXSruz5OE8Kytuy
 3qc6VYpqPzqvRPV1H8bb7FjTRpWFzO1Wl8Tq2Q8dVU2ep0UYsAt3QLUIZzvKwM8dGxubSiSf9KB
 HdLoZRUt6UZffWQw=
X-Received: by 2002:a05:6402:687:: with SMTP id
 f7mr15696975edy.314.1607457612523; 
 Tue, 08 Dec 2020 12:00:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzBGM/MOTk1KG7sDrkDrl8IC0mnziwfO24JiUZbdBDX3IBfmo8azoauqdvaSsaMWKqeJ67VJw==
X-Received: by 2002:a05:6402:687:: with SMTP id
 f7mr15696950edy.314.1607457612324; 
 Tue, 08 Dec 2020 12:00:12 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id h15sm3377619ejq.29.2020.12.08.12.00.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Dec 2020 12:00:11 -0800 (PST)
Subject: Re: [RFC v9 00/22] i386 cleanup
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>
References: <20201208194839.31305-1-cfontana@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <6395fe61-fe47-6d36-dd12-f523e66c75ec@redhat.com>
Date: Tue, 8 Dec 2020 21:00:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201208194839.31305-1-cfontana@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Dario Faggioli <dfaggioli@suse.com>, Cameron Esfahani <dirty@apple.com>,
 haxm-team@intel.com, Colin Xu <colin.xu@intel.com>,
 Anthony Perard <anthony.perard@citrix.com>, Bruce Rogers <brogers@suse.com>,
 Olaf Hering <ohering@suse.de>, "Emilio G . Cota" <cota@braap.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/8/20 8:48 PM, Claudio Fontana wrote:
> v8 -> v9: move additional methods to CPUClass->tcg_ops
> 
> do_unaligned_access, transaction_failed and do_interrupt.
> 
> do_interrupt is a bit tricky, as the same code is reused
> (albeit not usually directly) for KVM under certain odd conditions.
> 
> Change arm, as the only user of do_interrupt callback for KVM,
> to instead call the target function directly arm_do_interrupt.

Please use scripts/git.orderfile for such refactors please ;)

...

>  MAINTAINERS                           |  19 +-
>  accel/accel-common.c                  | 105 +++++
>  accel/{accel.c => accel-softmmu.c}    |  60 +--
>  accel/accel-softmmu.h                 |  15 +
>  accel/accel-user.c                    |  24 ++
>  accel/kvm/kvm-all.c                   |   2 -
>  accel/kvm/kvm-cpus.c                  |  26 +-
>  accel/kvm/kvm-cpus.h                  |   2 -
>  accel/meson.build                     |   4 +-
>  accel/qtest/qtest.c                   |  25 +-
>  accel/tcg/cpu-exec.c                  |  70 +++-
>  accel/tcg/cputlb.c                    |   6 +-
>  accel/tcg/meson.build                 |   9 +-
>  accel/tcg/tcg-all.c                   |  14 +-
>  accel/tcg/tcg-cpus-icount.c           | 138 +++++++
>  accel/tcg/tcg-cpus-icount.h           |  19 +
>  accel/tcg/tcg-cpus-mttcg.c            | 134 +++++++
>  accel/tcg/tcg-cpus-mttcg.h            |  19 +
>  accel/tcg/tcg-cpus-rr.c               | 298 ++++++++++++++
>  accel/tcg/tcg-cpus-rr.h               |  21 +
>  accel/tcg/tcg-cpus.c                  | 539 +++-----------------------
>  accel/tcg/tcg-cpus.h                  |   8 +-
>  accel/tcg/user-exec.c                 |   6 +-
>  accel/xen/xen-all.c                   |  24 +-
>  bsd-user/main.c                       |  11 +-
>  cpu.c                                 |  71 ++--
>  hw/core/cpu.c                         |  30 +-
>  hw/i386/fw_cfg.c                      |   2 +-
>  hw/i386/intel_iommu.c                 |   2 +-
>  hw/i386/kvm/apic.c                    |   2 +-
>  hw/i386/kvm/clock.c                   |   2 +-
>  hw/i386/microvm.c                     |   2 +-
>  hw/i386/pc.c                          |   2 +-
>  hw/i386/pc_piix.c                     |   1 +
>  hw/i386/x86.c                         |   2 +-
>  hw/mips/jazz.c                        |   4 +-
>  include/hw/boards.h                   |   2 +-
>  include/hw/core/accel-cpu.h           |  25 ++
>  include/hw/core/cpu.h                 |  92 ++---
>  include/hw/core/tcg-cpu-ops.h         |  75 ++++
>  include/{sysemu => qemu}/accel.h      |  16 +-
>  include/sysemu/accel-ops.h            |  45 +++
>  include/sysemu/cpus.h                 |  26 +-
>  include/sysemu/hvf.h                  |   2 +-
>  include/sysemu/kvm.h                  |   2 +-
>  include/sysemu/kvm_int.h              |   2 +-
>  linux-user/main.c                     |   7 +-
>  meson.build                           |   1 +
>  softmmu/cpus.c                        |  12 +-
>  softmmu/icount.c                      |   2 +-
>  softmmu/memory.c                      |   2 +-
>  softmmu/qtest.c                       |   2 +-
>  softmmu/vl.c                          |   8 +-
>  target/alpha/cpu.c                    |  18 +-
>  target/arm/cpu.c                      |  26 +-
>  target/arm/cpu64.c                    |   5 +-
>  target/arm/cpu_tcg.c                  |   8 +-
>  target/arm/helper.c                   |   4 +
>  target/arm/kvm64.c                    |   4 +-
>  target/avr/cpu.c                      |  13 +-
>  target/avr/helper.c                   |   4 +-
>  target/cris/cpu.c                     |  30 +-
>  target/cris/helper.c                  |   4 +-
>  target/hppa/cpu.c                     |  15 +-
>  target/i386/cpu-dump.c                | 537 +++++++++++++++++++++++++
>  target/i386/cpu.c                     | 418 ++------------------
>  target/i386/cpu.h                     | 120 +-----
>  target/i386/{ => hax}/hax-all.c       |   5 +-
>  target/i386/{ => hax}/hax-cpus.c      |  29 +-
>  target/i386/{ => hax}/hax-cpus.h      |   2 -
>  target/i386/{ => hax}/hax-i386.h      |   6 +-
>  target/i386/{ => hax}/hax-interface.h |   0
>  target/i386/{ => hax}/hax-mem.c       |   0
>  target/i386/{ => hax}/hax-posix.c     |   0
>  target/i386/{ => hax}/hax-posix.h     |   0
>  target/i386/{ => hax}/hax-windows.c   |   0
>  target/i386/{ => hax}/hax-windows.h   |   0
>  target/i386/hax/meson.build           |   7 +
>  target/i386/helper-tcg.h              | 112 ++++++
>  target/i386/helper.c                  | 539 +-------------------------
>  target/i386/host-cpu.c                | 198 ++++++++++
>  target/i386/host-cpu.h                |  19 +
>  target/i386/hvf/cpu.c                 |  65 ++++
>  target/i386/hvf/hvf-cpus.c            |  27 +-
>  target/i386/hvf/hvf-cpus.h            |   2 -
>  target/i386/hvf/hvf-i386.h            |   2 +-
>  target/i386/hvf/hvf.c                 |   3 +-
>  target/i386/hvf/meson.build           |   1 +
>  target/i386/hvf/x86_task.c            |   2 +-
>  target/i386/kvm/cpu.c                 | 148 +++++++
>  target/i386/{ => kvm}/hyperv-proto.h  |   0
>  target/i386/{ => kvm}/hyperv-stub.c   |   0
>  target/i386/{ => kvm}/hyperv.c        |   0
>  target/i386/{ => kvm}/hyperv.h        |   0
>  target/i386/kvm/kvm-cpu.h             |  41 ++
>  target/i386/{ => kvm}/kvm-stub.c      |   0
>  target/i386/{ => kvm}/kvm.c           |   3 +-
>  target/i386/{ => kvm}/kvm_i386.h      |   0
>  target/i386/kvm/meson.build           |   8 +
>  target/i386/kvm/trace-events          |   7 +
>  target/i386/kvm/trace.h               |   1 +
>  target/i386/machine.c                 |   4 +-
>  target/i386/meson.build               |  39 +-
>  target/i386/{ => tcg}/bpt_helper.c    |   1 +
>  target/i386/{ => tcg}/cc_helper.c     |   1 +
>  target/i386/tcg/cpu.c                 | 173 +++++++++
>  target/i386/{ => tcg}/excp_helper.c   |   1 +
>  target/i386/{ => tcg}/fpu_helper.c    |  33 +-
>  target/i386/{ => tcg}/int_helper.c    |   1 +
>  target/i386/{ => tcg}/mem_helper.c    |   1 +
>  target/i386/tcg/meson.build           |  14 +
>  target/i386/{ => tcg}/misc_helper.c   |   1 +
>  target/i386/{ => tcg}/mpx_helper.c    |   1 +
>  target/i386/{ => tcg}/seg_helper.c    |   1 +
>  target/i386/{ => tcg}/smm_helper.c    |   2 +
>  target/i386/{ => tcg}/svm_helper.c    |   1 +
>  target/i386/{ => tcg}/tcg-stub.c      |   0
>  target/i386/{ => tcg}/translate.c     |   1 +
>  target/i386/trace-events              |   6 -
>  target/i386/whpx/meson.build          |   4 +
>  target/i386/{ => whpx}/whp-dispatch.h |   0
>  target/i386/{ => whpx}/whpx-all.c     |   4 +-
>  target/i386/{ => whpx}/whpx-cpus.c    |  29 +-
>  target/i386/{ => whpx}/whpx-cpus.h    |   2 -
>  target/lm32/cpu.c                     |  13 +-
>  target/m68k/cpu.c                     |  12 +-
>  target/microblaze/cpu.c               |  23 +-
>  target/mips/cpu.c                     |  21 +-
>  target/moxie/cpu.c                    |  10 +-
>  target/nios2/cpu.c                    |  14 +-
>  target/openrisc/cpu.c                 |  12 +-
>  target/ppc/translate_init.c.inc       |  23 +-
>  target/riscv/cpu.c                    |  25 +-
>  target/rx/cpu.c                       |  18 +-
>  target/s390x/cpu.c                    |  15 +-
>  target/sh4/cpu.c                      |  14 +-
>  target/sparc/cpu.c                    |  18 +-
>  target/tilegx/cpu.c                   |  10 +-
>  target/tricore/cpu.c                  |   8 +-
>  target/unicore32/cpu.c                |  14 +-
>  target/xtensa/cpu.c                   |  16 +-
>  141 files changed, 3007 insertions(+), 2051 deletions(-)
...


