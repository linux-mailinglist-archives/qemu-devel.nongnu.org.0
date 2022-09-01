Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 153905A9EEE
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 20:29:17 +0200 (CEST)
Received: from localhost ([::1]:46140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTowG-00051a-8d
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 14:29:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTorq-0007Xg-Ks
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 14:24:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTorj-0008Ff-Da
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 14:24:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662056674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:  content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=mO2ZnIQsRmqRuzQEB68odkO86r9FJNU/V6ZdxcARjpE=;
 b=BVHOf0WuGb59LoDFATrm4WRrX/2+J7nqgU7hAUL3L8UYiEPHBjwd9YTMmO79wu1reLYA9d
 GiGXP1/EdiDvKj1NNBvuxze9ZbTPQlTqPTyla7QWpEwP5eqZF10MA2xN3kZIRXkdPIvV3u
 sjet/FCJwjctp/NLq0xi8AapxOJo/18=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-588--D6I1FLqOlKyXVt5wwtq1w-1; Thu, 01 Sep 2022 14:24:32 -0400
X-MC-Unique: -D6I1FLqOlKyXVt5wwtq1w-1
Received: by mail-ej1-f71.google.com with SMTP id
 sh44-20020a1709076eac00b00741a01e2aafso6059853ejc.22
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 11:24:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date;
 bh=mO2ZnIQsRmqRuzQEB68odkO86r9FJNU/V6ZdxcARjpE=;
 b=1s4CvISb08zmXhUK2TX/syOMOA7Jl5LOnR1Ahtg/kokLPfZbOCv0tGdWXgnr1Oh8Ds
 I9a+gZGYO+/L4spRP4plEZm07PWtdP9RIY4+d3YTYeEtjV5Od4oYYImqnhIO25DJuyZs
 50/qGYSab+DJneEfcTo2J/7sa8Y5bcH2x6OHld8n6pQ7WousM4wh81fTk6f+PK+HwtgH
 jFAusaXHSw6b5JwRnQZDh2zF1VkauKpEWZbQANYTJ4telZHL79/iq1aXtUq3c1SpgVYb
 AdyfLROJJ4vULoWwDtilo6icoFV+bngtzcA6jK+IN+tDM6SOeMW2F5+hQG3xi9XSOfMV
 81hg==
X-Gm-Message-State: ACgBeo3MeUxo0WNH+I1WsJZODtX1BULXKfTvJAyrNEfi0qy9l044fMFU
 d7bYILYwK87pXt3mPeniuEcKHj25Rg3RhskP8fXW/jdZd1v9ZBu7AVkCyiFLB7t3/aZMjUjTuLV
 DWAZnmD/gsBR4v9o9fPYbM9M1+QiBj9yaMyiKC15Sk1SR4kMTJdL4UwAaIEE/HWnll04=
X-Received: by 2002:a17:907:94d6:b0:741:67a6:dcde with SMTP id
 dn22-20020a17090794d600b0074167a6dcdemr16492418ejc.529.1662056671065; 
 Thu, 01 Sep 2022 11:24:31 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7oZLp/Rs12gQtWIAiIYjTYh4ga6vYEeMccYPD55H7ahbGikixnr7Xx0NdG+qu+99j8ehFjFA==
X-Received: by 2002:a17:907:94d6:b0:741:67a6:dcde with SMTP id
 dn22-20020a17090794d600b0074167a6dcdemr16492403ejc.529.1662056670639; 
 Thu, 01 Sep 2022 11:24:30 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 y7-20020a50bb07000000b0044790836307sm1779978ede.85.2022.09.01.11.24.29
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 11:24:29 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/39] i386, SCSI, build system changes for 2022-09-01
Date: Thu,  1 Sep 2022 20:23:50 +0200
Message-Id: <20220901182429.93533-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

The following changes since commit e93ded1bf6c94ab95015b33e188bc8b0b0c32670:

  Merge tag 'testing-pull-request-2022-08-30' of https://gitlab.com/thuth/qemu into staging (2022-08-31 18:19:03 -0400)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to a64fc269198e09d422da0e89e606f6f12b40af1f:

  target/i386: AVX+AES helpers prep (2022-09-01 20:16:33 +0200)

----------------------------------------------------------------
* SCSI fixes for Mac OS 9
* Fix CPU reset for x86/KVM nested virtualization state
* remove feature_not_found() from the configure script
* Meson cleanups from muon
* improved i386 TCG tests for BMI and SSE
* SSE bugfixes

----------------------------------------------------------------
Anton Kochkov (1):
      meson: be strict for boolean options

John Millikin (3):
      esp: Handle CMD_BUSRESET by resetting the SCSI bus
      scsi: Add buf_len parameter to scsi_req_new()
      scsi: Reject commands if the CDB length exceeds buf_len

Paolo Bonzini (15):
      configure: improve error for ucontext coroutine backend
      meson: remove dead code
      meson: remove dead assignments
      KVM: dirty ring: add missing memory barrier
      tests/tcg: x86_64: improve consistency with i386
      tests/tcg: i386: extend BMI test
      target/i386: fix PHSUB* instructions with dest=src
      target/i386: DPPS rounding fix
      target/i386: do not use MOVL to move data between SSE registers
      target/i386: formatting fixes
      target/i386: check SSE table flags instead of hardcoding opcodes
      target/i386: isolate MMX code more
      target/i386: Add size suffix to vector FP helpers
      target/i386: do not cast gen_helper_* function pointers
      target/i386: rewrite destructive 3DNow operations

Paul Brook (18):
      tests/tcg: i386: add SSE tests
      target/i386: Add ZMM_OFFSET macro
      target/i386: Rework sse_op_table1
      target/i386: Rework sse_op_table6/7
      target/i386: Move 3DNOW decoder
      target/i386: Add CHECK_NO_VEX
      target/i386: Rewrite vector shift helper
      target/i386: Rewrite simple integer vector helpers
      target/i386: Misc integer AVX helper prep
      target/i386: Destructive vector helpers for AVX
      target/i386: Floating point arithmetic helper AVX prep
      target/i386: reimplement AVX comparison helpers
      target/i386: Dot product AVX helper prep
      target/i386: Destructive FP helpers for AVX
      target/i386: Misc AVX helper prep
      target/i386: Rewrite blendv helpers
      target/i386: AVX pclmulqdq prep
      target/i386: AVX+AES helpers prep

Vitaly Kuznetsov (2):
      i386: reset KVM nested state upon CPU reset
      i386: do kvm_put_msr_feature_control() first thing when vCPU is reset

 accel/kvm/kvm-all.c              |    6 +-
 configure                        |   11 +-
 docs/devel/build-system.rst      |    5 -
 hw/scsi/esp.c                    |    8 +-
 hw/scsi/lsi53c895a.c             |    2 +-
 hw/scsi/megasas.c                |   10 +-
 hw/scsi/mptsas.c                 |    3 +-
 hw/scsi/scsi-bus.c               |   29 +-
 hw/scsi/scsi-disk.c              |    7 +-
 hw/scsi/scsi-generic.c           |    5 +-
 hw/scsi/spapr_vscsi.c            |    3 +-
 hw/scsi/virtio-scsi.c            |    5 +-
 hw/scsi/vmw_pvscsi.c             |    2 +-
 hw/usb/dev-storage.c             |    2 +-
 hw/usb/dev-uas.c                 |    5 +-
 include/hw/scsi/scsi.h           |   11 +-
 meson.build                      |    2 -
 meson_options.txt                |    4 +-
 pc-bios/keymaps/meson.build      |    1 -
 plugins/meson.build              |    2 +-
 qapi/meson.build                 |   15 -
 target/i386/kvm/kvm.c            |   54 +-
 target/i386/ops_sse.h            | 1819 +++++++--------
 target/i386/ops_sse_header.h     |   68 +-
 target/i386/tcg/translate.c      |  831 ++++---
 target/riscv/meson.build         |    2 -
 tests/fp/meson.build             |    2 +-
 tests/qapi-schema/meson.build    |   24 +-
 tests/tcg/Makefile.target        |    2 +-
 tests/tcg/i386/Makefile.target   |   12 +-
 tests/tcg/i386/README            |    9 +
 tests/tcg/i386/test-avx.c        |  330 +++
 tests/tcg/i386/test-avx.py       |  351 +++
 tests/tcg/i386/test-i386-bmi2.c  |  169 +-
 tests/tcg/i386/x86.csv           | 4658 ++++++++++++++++++++++++++++++++++++++
 tests/tcg/x86_64/Makefile.target |    5 +-
 36 files changed, 7059 insertions(+), 1415 deletions(-)
 create mode 100644 tests/tcg/i386/test-avx.c
 create mode 100755 tests/tcg/i386/test-avx.py
 create mode 100644 tests/tcg/i386/x86.csv
-- 
2.37.2


