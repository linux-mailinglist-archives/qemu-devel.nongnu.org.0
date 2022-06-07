Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E084541F8D
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 01:44:12 +0200 (CEST)
Received: from localhost ([::1]:36504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyirr-0005Sp-8v
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 19:44:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nyiHo-0007UM-Hh
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 19:06:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nyiHk-0005FM-MF
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 19:06:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654643210;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/nsVzLqKpD8/hwbcooIPoQU7v9mpGX6uZpbH2P3/PzU=;
 b=FgA+OEmiq7R+RvS+xAHPCP6eft2QDIr0zTlbr/fHHMWOJ6sb4LKB43bDP9P3NNcjDkfeM+
 u9mXvNFog0u4hrB571FworZGgPE7m4zsoejA0pnIcICXi73qlLi8xhv/T1ttt2r4qS3vca
 e1KTNj/wf5N9Giv6Er+azBtkV95amwM=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-518-fM0vcGTxMKWLohw31UQ91g-1; Tue, 07 Jun 2022 19:06:49 -0400
X-MC-Unique: fM0vcGTxMKWLohw31UQ91g-1
Received: by mail-io1-f70.google.com with SMTP id
 n19-20020a056602341300b0066850b49e09so8810347ioz.12
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 16:06:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/nsVzLqKpD8/hwbcooIPoQU7v9mpGX6uZpbH2P3/PzU=;
 b=WPrk0CW5CvXvhhusvYt+ElvU2APk5HsGiLLattfrj3hqYhOWN8k8HyfaWQUNAe1Ayb
 YC67Hxzf+HplEIW4/jRLu0CEoZyorDjrlax6d1j6Im1tIvl0tTqdfFMl3HooJq8/B2y2
 szaG+kuXs4SX38VgfTXRktwDyhsN24yZ10cLWPMt9G3hvZFJXPaU2VzSy1dmZMWIghWl
 Y3GKkHme4bVSuYcsJAlsbLw+LaD8zSWztDUM5eaYCnXF2LOiUhEILVqMD0k40+lG0P6P
 TedYdcyvLgFkLeQ4MiCnGsidrpG85Q+qKf3V/5ggIfbKcuP4Uu1wUEfzmL8RMQHUQFGf
 V0bQ==
X-Gm-Message-State: AOAM530kMLja0wY1k1QzI6QXxlLKjrDJrG8HSpTxW91MRiN1d+5ToVat
 wynC+S0ah1reuS4iRg9ozmZoL/N0I7N+ezGmO7vd8PrE1PDQZsIFyfiD0UPJZSRDOP2ssnEYqAp
 xCv19/+S3BRTw9jxs0ocjgtsb1lT9q3qDRr4buEdUQ08qtjnH0/hfXogXSAQw/IdM
X-Received: by 2002:a05:6638:d4b:b0:330:f5f8:2521 with SMTP id
 d11-20020a0566380d4b00b00330f5f82521mr17342814jak.149.1654643208854; 
 Tue, 07 Jun 2022 16:06:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJygfdJq6wUxWuc+mqb89gljdmvPi7oK2XSmeWlCcq0JLp6FMR7SoKodYVORYGqJSatAaXnymA==
X-Received: by 2002:a05:6638:d4b:b0:330:f5f8:2521 with SMTP id
 d11-20020a0566380d4b00b00330f5f82521mr17342798jak.149.1654643208525; 
 Tue, 07 Jun 2022 16:06:48 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a056602038600b00665862d12bbsm7035375iov.46.2022.06.07.16.06.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 07 Jun 2022 16:06:47 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>,
 Sean Christopherson <seanjc@google.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Igor Mammedov <imammedo@redhat.com>, peterx@redhat.com
Subject: [PATCH RFC 0/5] CPU: Detect put cpu register errors for migrations
Date: Tue,  7 Jun 2022 19:06:40 -0400
Message-Id: <20220607230645.53950-1-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

[Marking this as RFC]

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


