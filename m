Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F14324735
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 23:57:14 +0100 (CET)
Received: from localhost ([::1]:45406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lF35l-0004iX-Sn
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 17:57:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lF334-0002uC-Fz
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 17:54:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lF332-0000m3-Ip
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 17:54:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614207263;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/qHoZFIsUlzpxt6U9d0YKI1/FrOMYa8TJPZXO+OIqnY=;
 b=Go5Pyd1lkoPxk3I3cSpYZd1LKqpPMhVMqUY2MlH2UgiaggWTpx6kW6/aVazSjniHp1AfpT
 nbqoMuyhen8GA3qpfbIItdfWU8JhXz/11Haj2qFaEEhkym8zl7TnctST+2bLxmNQVt04JJ
 t2AbxLzSJXxYzESrmF1CbeiVy7UzZAs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-twSQxhBoPYSaSPG4cz4Ucg-1; Wed, 24 Feb 2021 17:54:21 -0500
X-MC-Unique: twSQxhBoPYSaSPG4cz4Ucg-1
Received: by mail-wm1-f69.google.com with SMTP id s192so1142789wme.6
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 14:54:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/qHoZFIsUlzpxt6U9d0YKI1/FrOMYa8TJPZXO+OIqnY=;
 b=TVrv4cqLpXwkDXExMwwVQQSvm0VftB3R3gUqsuCDgRQtOtblpUj0RNnO8co7UEKBKD
 JRrltUJlIuPgRwS68n5MzM1T/uU0VN+WTLXzHyygS0gMNXjAMj0/sHdi7snie4vARjqr
 QrG6XnbySg8Q4NJb8rcsUtjD4q99/lYBdSsYgK6yDlIH/y9vJbrhFiNSJbGM+vrLPmxk
 DjojcCKbwDV3x6FCuSMZx9c3ekuxZt/m0G5VvNbsNRcnqmeykDWNdho2v9wTEe6z0Y5O
 R7hA1XbUKdUb6APXFtlUkgFjF4uV3DzM7pDX+tVTRLuylU57Hjr96x3/iJwot0cxWl6I
 5cug==
X-Gm-Message-State: AOAM530Vl8e+90YePzSSdkuVq8H6o0r0gMVtEEBSSO7JkTh2X9rvzbnp
 9UjHqXxlT8nanU3a9khbpQkfMVRGU/3lM+guRNyaK+ebbSwQZqYs6u+TirUPSNaHo+1IgOugtyd
 R0kNhz5jJfkiW6w0n7NG/KTIkV0/2oGhvitrGGulxr+F116Mpe/x1lm3dCLpRgqgZ
X-Received: by 2002:adf:8b0d:: with SMTP id n13mr320356wra.94.1614207259906;
 Wed, 24 Feb 2021 14:54:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwacuxROgxpC7YtlaQU4LZenUYSiWuR+gJ4FsuoajxJ/0JTIe7LYZ1Ak5MaeZxoN+8kul2cSg==
X-Received: by 2002:adf:8b0d:: with SMTP id n13mr320334wra.94.1614207259706;
 Wed, 24 Feb 2021 14:54:19 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id u4sm5551550wrr.37.2021.02.24.14.54.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Feb 2021 14:54:19 -0800 (PST)
Subject: Re: [PATCH v22 00/17] i386 cleanup PART 2
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210224133428.14071-1-cfontana@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <3a1111a0-5089-9865-cb36-4247faa68b51@redhat.com>
Date: Wed, 24 Feb 2021 23:54:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210224133428.14071-1-cfontana@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/21 2:34 PM, Claudio Fontana wrote:

> Claudio Fontana (17):
>   i386: split cpu accelerators from cpu.c, using AccelCPUClass
>   cpu: call AccelCPUClass::cpu_realizefn in cpu_exec_realizefn
>   accel: introduce new accessor functions
>   target/i386: fix host_cpu_adjust_phys_bits error handling
>   accel-cpu: make cpu_realizefn return a bool
>   meson: add target_user_arch
>   i386: split off sysemu-only functionality in tcg-cpu
>   i386: split smm helper (sysemu)
>   i386: split tcg excp_helper into sysemu and user parts
>   i386: move TCG btp_helper into sysemu/
>   i386: split misc helper into user and sysemu parts
>   i386: separate fpu_helper into user and sysemu parts
>   i386: split svm_helper into sysemu and stub-only user
>   i386: split seg_helper into user-only and sysemu parts
>   i386: split off sysemu part of cpu.c
>   i386: gdbstub: only write CR0/CR2/CR3/EFER for SOFTMMU
>   i386: move cpu_load_efer into sysemu-only section of cpu.h
> 
>  meson.build                               |   5 +
>  include/hw/core/accel-cpu.h               |   2 +-
>  include/qemu/accel.h                      |  13 +
>  target/i386/cpu-internal.h                |  70 ++
>  target/i386/cpu.h                         |  54 +-
>  target/i386/helper.h                      |  11 +
>  target/i386/host-cpu.h                    |  19 +
>  target/i386/kvm/kvm-cpu.h                 |  41 ++
>  target/i386/tcg/helper-tcg.h              |   8 +
>  target/i386/tcg/seg_helper.h              |  66 ++
>  target/i386/tcg/tcg-cpu.h                 |  21 +-
>  accel/accel-common.c                      |  19 +
>  cpu.c                                     |   5 +-
>  hw/i386/pc_piix.c                         |   1 +
>  target/i386/cpu-softmmu.c                 | 352 ++++++++++
>  target/i386/cpu.c                         | 780 ++--------------------
>  target/i386/gdbstub.c                     |  16 +
>  target/i386/host-cpu.c                    | 204 ++++++
>  target/i386/hvf/hvf-cpu.c                 |  68 ++
>  target/i386/kvm/kvm-cpu.c                 | 151 +++++
>  target/i386/kvm/kvm.c                     |   3 +-
>  target/i386/tcg/bpt_helper.c              | 276 --------
>  target/i386/tcg/excp_helper.c             | 572 ----------------
>  target/i386/tcg/fpu_helper.c              |  65 +-
>  target/i386/tcg/misc_helper.c             | 463 -------------
>  target/i386/tcg/seg_helper.c              | 237 +------
>  target/i386/tcg/sysemu/bpt_helper.c       | 293 ++++++++
>  target/i386/tcg/sysemu/excp_helper.c      | 581 ++++++++++++++++
>  target/i386/tcg/sysemu/fpu_helper.c       |  58 ++
>  target/i386/tcg/sysemu/misc_helper.c      | 438 ++++++++++++
>  target/i386/tcg/sysemu/seg_helper.c       | 125 ++++
>  target/i386/tcg/{ => sysemu}/smm_helper.c |  19 +-
>  target/i386/tcg/{ => sysemu}/svm_helper.c |  62 +-
>  target/i386/tcg/sysemu/tcg-cpu.c          |  83 +++
>  target/i386/tcg/tcg-cpu.c                 |  50 +-
>  target/i386/tcg/translate.c               |  13 +-
>  target/i386/tcg/user/excp_helper.c        |  39 ++
>  target/i386/tcg/user/fpu_helper.c         |  42 ++
>  target/i386/tcg/user/misc_helper.c        |  72 ++
>  target/i386/tcg/user/seg_helper.c         | 109 +++
>  target/i386/tcg/user/svm_stubs.c          |  76 +++
>  MAINTAINERS                               |   2 +-
>  target/alpha/meson.build                  |   3 +
>  target/arm/meson.build                    |   2 +
>  target/cris/meson.build                   |   3 +
>  target/hexagon/meson.build                |   3 +
>  target/hppa/meson.build                   |   3 +
>  target/i386/hvf/meson.build               |   1 +
>  target/i386/kvm/meson.build               |   7 +-
>  target/i386/meson.build                   |   9 +-
>  target/i386/tcg/meson.build               |   5 +-
>  target/i386/tcg/sysemu/meson.build        |  10 +
>  target/i386/tcg/user/meson.build          |   7 +
>  target/m68k/meson.build                   |   3 +
>  target/microblaze/meson.build             |   3 +
>  target/mips/meson.build                   |   3 +
>  target/nios2/meson.build                  |   3 +
>  target/openrisc/meson.build               |   3 +
>  target/ppc/meson.build                    |   3 +
>  target/riscv/meson.build                  |   3 +
>  target/s390x/meson.build                  |   3 +
>  target/sh4/meson.build                    |   3 +
>  target/sparc/meson.build                  |   3 +
>  target/tilegx/meson.build                 |   3 +
>  target/tricore/meson.build                |   3 +
>  target/xtensa/meson.build                 |   3 +
>  66 files changed, 3210 insertions(+), 2466 deletions(-)
>  create mode 100644 target/i386/cpu-internal.h
>  create mode 100644 target/i386/host-cpu.h
>  create mode 100644 target/i386/kvm/kvm-cpu.h
>  create mode 100644 target/i386/tcg/seg_helper.h
>  create mode 100644 target/i386/cpu-softmmu.c
>  create mode 100644 target/i386/host-cpu.c
>  create mode 100644 target/i386/hvf/hvf-cpu.c
>  create mode 100644 target/i386/kvm/kvm-cpu.c
>  create mode 100644 target/i386/tcg/sysemu/bpt_helper.c
>  create mode 100644 target/i386/tcg/sysemu/excp_helper.c
>  create mode 100644 target/i386/tcg/sysemu/fpu_helper.c
>  create mode 100644 target/i386/tcg/sysemu/misc_helper.c
>  create mode 100644 target/i386/tcg/sysemu/seg_helper.c
>  rename target/i386/tcg/{ => sysemu}/smm_helper.c (98%)
>  rename target/i386/tcg/{ => sysemu}/svm_helper.c (96%)
>  create mode 100644 target/i386/tcg/sysemu/tcg-cpu.c
>  create mode 100644 target/i386/tcg/user/excp_helper.c
>  create mode 100644 target/i386/tcg/user/fpu_helper.c
>  create mode 100644 target/i386/tcg/user/misc_helper.c
>  create mode 100644 target/i386/tcg/user/seg_helper.c
>  create mode 100644 target/i386/tcg/user/svm_stubs.c
>  create mode 100644 target/i386/tcg/sysemu/meson.build
>  create mode 100644 target/i386/tcg/user/meson.build

Series:
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>


