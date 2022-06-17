Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37ADC54F9B0
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 16:55:58 +0200 (CEST)
Received: from localhost ([::1]:44640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2DO9-00026s-8i
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 10:55:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o2DHY-0003ce-Hm
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 10:49:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o2DHU-0008Bv-Q8
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 10:49:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655477343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=iWpUHNSXbxalC5E2vLPhWjNbGzzje7KGx/Bg+RnlvHY=;
 b=FNT4hwDvI3/BOHhtowgxlqYijPSMO3lYcGqzS74+hwCkaDhJZGOG4+GPd7F1LAGOFns6pZ
 tBZwkkxqzKIWc9MT1LsRcs6NrDkfWH/1fLEZug+g/wTihenYJqpu7tzE39H7q0UYmWE/8h
 ou49MXEO9Nfvr1QqrR0B8H+OSASUZEw=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-669-FGfJIK5KOniFu1FvPzNnlA-1; Fri, 17 Jun 2022 10:49:02 -0400
X-MC-Unique: FGfJIK5KOniFu1FvPzNnlA-1
Received: by mail-io1-f70.google.com with SMTP id
 z137-20020a6bc98f000000b00669b0a179c7so2637210iof.6
 for <qemu-devel@nongnu.org>; Fri, 17 Jun 2022 07:49:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iWpUHNSXbxalC5E2vLPhWjNbGzzje7KGx/Bg+RnlvHY=;
 b=03ygbund/lB35oriel2gg9oT2ZdV0pdVWJUz6hD93tsAWxpUvg+6gbzwgXY2c3mK3l
 mH8pqwRW4GYEbvQH2gRIg33OybdPeHKf9XcWu/D4DpEylZdztoizTxZ2qKteX4GzDhTP
 48oFGflE01GvLm7Hd/oAbfCgQgbrEBMZ1h4DvmqjqpVpXyihFSY+84sZJbKd4Rk+Ia3r
 fmc+sgNjDzxyo81kQF/Y1E/Qk5DHQNRjEHdPlIgWzyPutZj4hkMrCcNCJ+WqFJB7J+Qc
 YnkFcYnJTaxKeCI+X6fb+14xFG/WgoYg6hjzZxEaRqQmCSDqn3MitoROatorzAUwvBU2
 RUyA==
X-Gm-Message-State: AJIora8NY6NR1OwuUcy5oFZJmxwGA5fx8d176deP8C9dMSMHBjYXZMsY
 wELzIZVQiQgs8gQpv+0kTAto6Xcr7UYtK7879NoqWU5iKfra9nZa99kYWIiXOz5V+RfiElLloR0
 9x86X8Y3A56gOa0OHiiWKPbpZk8E3R6pw0yChWgQsCRgotpsSHdR/hZLlDuhusJys
X-Received: by 2002:a05:6638:4988:b0:333:f06b:39b6 with SMTP id
 cv8-20020a056638498800b00333f06b39b6mr5780674jab.45.1655477340536; 
 Fri, 17 Jun 2022 07:49:00 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uG41DeFtMJmfSMbeeOfh45Zu+Ai1d8HvYIbUKLoEvvfWiyUlseUKqeM0QPHddwb7KgUmB8+g==
X-Received: by 2002:a05:6638:4988:b0:333:f06b:39b6 with SMTP id
 cv8-20020a056638498800b00333f06b39b6mr5780648jab.45.1655477340193; 
 Fri, 17 Jun 2022 07:49:00 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 n24-20020a02cc18000000b0032e168fa56fsm2294838jap.83.2022.06.17.07.48.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 17 Jun 2022 07:48:59 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>,
 Sean Christopherson <seanjc@google.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>, peterx@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>
Subject: [PATCH 0/5] CPU: Detect put cpu register errors for migrations
Date: Fri, 17 Jun 2022 10:48:52 -0400
Message-Id: <20220617144857.34189-1-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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

rfc->v1:
- Rebase to master, drop RFC tag.

This series teaches QEMU to detect errors when e.g. putting registers from
QEMU to KVM, and fail migrations properly.

For the rational of this series and why it was posted, please refer to the
bug report here:

https://lore.kernel.org/all/YppVupW+IWsm7Osr@xz-m1.local/

But I'd rather not go into that if the reviewer doesn't have that context,
because we don't really need that complexity..  It can be simple as we
should fail migration early when we see issues happening already, so:

  1) We fail explicitly, rather than afterward with some weird guest
     errors.  In my bug report, it was a guest double fault.  There's
     another bug report that Sean mentioned in the thread from Mike Tancsa
     that can have other sympotons rather than double fault, but anyway
     they'll be hard to diagnose since the processor state can be corrupted
     (please refer to kvm_arch_put_registers() where we stop putting more
     registers to KVM when we see any error).

  2) For precopy, with this early failure the VM won't crash itself since
     we still have a chance to keep running it on src host, while if
     without this patch we will fail later, and it can crash the VM.

In this specific case, when KVM_SET_XSAVE ioctl failed on dest host before
start running the VM there, we should fail the migration already.

After the patchset applied, the above "double fault" issue will become
migration failures, and...

For precopy, we can see some error dumped for precopy on dest, then the VM
will be kept running on src host:

2022-06-07T22:48:48.804234Z qemu-system-x86_64: kvm_arch_put_registers() failed with retval=-22
2022-06-07T22:48:48.804588Z qemu-system-x86_64: load of migration failed: Invalid argument

For postcopy, currently we'll pause the VM immediately for admin to decide
what to do:

2022-06-07T22:47:49.448192Z qemu-system-x86_64: kvm_arch_put_registers() failed with retval=-22
13072@1654642069.518993:runstate_set current_run_state 1 (inmigrate) new_state 4 (paused)

If something like this series is welcomed, we could do better in the future
by telling the src host about this issue and keep running, because
put-register happens right at the switch-over, so we actually have this
chance (no dirty page on dest host yet).

Comments welcomed.  Thanks,

Peter Xu (5):
  cpus-common: Introduce run_on_cpu_func2 which allows error returns
  cpus-common: Add run_on_cpu2()
  accel: Allow synchronize_post_init() to take an Error**
  cpu: Allow cpu_synchronize_all_post_init() to take an errp
  KVM: Hook kvm_arch_put_registers() errors to the caller

 accel/hvf/hvf-accel-ops.c     |  2 +-
 accel/kvm/kvm-all.c           | 15 +++++++---
 accel/kvm/kvm-cpus.h          |  2 +-
 cpus-common.c                 | 55 +++++++++++++++++++++++++++++++++--
 hw/core/machine.c             |  2 +-
 include/hw/core/cpu.h         | 28 ++++++++++++++++++
 include/sysemu/accel-ops.h    |  2 +-
 include/sysemu/cpus.h         |  2 +-
 include/sysemu/hw_accel.h     |  1 +
 migration/savevm.c            | 20 +++++++++++--
 softmmu/cpus.c                | 23 ++++++++++++---
 stubs/cpu-synchronize-state.c |  3 ++
 target/i386/hax/hax-all.c     |  2 +-
 target/i386/nvmm/nvmm-all.c   |  2 +-
 target/i386/whpx/whpx-all.c   |  2 +-
 15 files changed, 139 insertions(+), 22 deletions(-)

-- 
2.32.0


