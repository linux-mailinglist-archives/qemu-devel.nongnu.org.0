Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09434346922
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 20:33:25 +0100 (CET)
Received: from localhost ([::1]:53252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOmmK-0006yY-2Q
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 15:33:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lOmjw-0004e2-Ry
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 15:30:59 -0400
Received: from mx2.suse.de ([195.135.220.15]:44850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lOmju-0004B0-Rk
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 15:30:56 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2E70AAF17;
 Tue, 23 Mar 2021 19:30:53 +0000 (UTC)
Subject: Re: [RFC v1 0/5] s390x cleanup
To: Paolo Bonzini <pbonzini@redhat.com>
References: <20210322191551.25752-1-cfontana@suse.de>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <d06200a7-9404-e40d-8e54-690e3d805a0e@suse.de>
Date: Tue, 23 Mar 2021 20:30:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210322191551.25752-1-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/22/21 8:15 PM, Claudio Fontana wrote:
> Hi, I am starting a cleanup series for s390x,
> 
> with the goal of doing similar splits of KVM vs TCG,


One annoying thing is that it appears that the cpu accel model does not offer much in terms of refactoring
and code simplification opportunities for s390x as-is, in particular for KVM.

It is possible that with quite some rework of the cpu_models code we could gain something,
so I will give it a try still, but for now adding the accel-cpu object does not suddenly provide nice low hanging fruits in terms of simplifications.

There are instead some good opportunities in terms of SYSEMU vs USER mode splits/beautification I think.

Ciao,

Claudio

> sysemu vs user mode, as for the existing work on x86 and ARM.
> 
> S/390 target looks very good already, and seems much easier to work
> with. I hope that with some patches it will be even better.
> 
> I will pile up more patches later on, but I start sharing something
> here with these few RFC patches for your eyes,
> 
> they are based on the pre-requisite series:
> 
> https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg07461.html
> 
> Motivation and higher level steps:
> 
> https://lists.gnu.org/archive/html/qemu-devel/2020-05/msg04628.html
> 
> Comments welcome, thanks,
> 
> Claudio
> 
> Claudio Fontana (5):
>   hw/s390x: only build qemu-tod from the CONFIG_TCG build
>   target/s390x: start moving TCG-only code to tcg/
>   target/s390x: move sysemu-only code out to cpu-sysemu.c
>   target/s390x: split cpu-dump from helper.c
>   target/s390x: make helper.c sysemu-only
> 
>  include/hw/s390x/tod.h                        |   2 +-
>  target/s390x/{internal.h => s390x-internal.h} |   6 +
>  target/s390x/{ => tcg}/s390-tod.h             |   0
>  target/s390x/{ => tcg}/tcg_s390x.h            |   0
>  target/s390x/{ => tcg}/vec.h                  |   0
>  hw/s390x/tod-qemu.c                           |   2 +-
>  hw/s390x/tod.c                                |   9 +-
>  target/s390x/arch_dump.c                      |   2 +-
>  target/s390x/cpu-dump.c                       | 131 ++++++++
>  target/s390x/cpu-sysemu.c                     | 304 ++++++++++++++++++
>  target/s390x/cpu.c                            | 285 +---------------
>  target/s390x/cpu_models.c                     |   2 +-
>  target/s390x/diag.c                           |   2 +-
>  target/s390x/gdbstub.c                        |   2 +-
>  target/s390x/helper.c                         | 113 +------
>  target/s390x/interrupt.c                      |   4 +-
>  target/s390x/ioinst.c                         |   2 +-
>  target/s390x/kvm.c                            |   2 +-
>  target/s390x/machine.c                        |   4 +-
>  target/s390x/mmu_helper.c                     |   2 +-
>  target/s390x/sigp.c                           |   2 +-
>  target/s390x/tcg-stub.c                       |  30 --
>  target/s390x/{ => tcg}/cc_helper.c            |   2 +-
>  target/s390x/{ => tcg}/crypto_helper.c        |   2 +-
>  target/s390x/{ => tcg}/excp_helper.c          |   2 +-
>  target/s390x/{ => tcg}/fpu_helper.c           |   2 +-
>  target/s390x/{ => tcg}/int_helper.c           |   2 +-
>  target/s390x/{ => tcg}/mem_helper.c           |   2 +-
>  target/s390x/{ => tcg}/misc_helper.c          |   2 +-
>  target/s390x/{ => tcg}/translate.c            |   2 +-
>  target/s390x/{ => tcg}/vec_fpu_helper.c       |   2 +-
>  target/s390x/{ => tcg}/vec_helper.c           |   2 +-
>  target/s390x/{ => tcg}/vec_int_helper.c       |   0
>  target/s390x/{ => tcg}/vec_string_helper.c    |   2 +-
>  target/s390x/{ => tcg}/translate_vx.c.inc     |   0
>  hw/s390x/meson.build                          |   5 +-
>  target/s390x/meson.build                      |  21 +-
>  target/s390x/{ => tcg}/insn-data.def          |   0
>  target/s390x/{ => tcg}/insn-format.def        |   0
>  target/s390x/tcg/meson.build                  |  14 +
>  target/s390x/trace-events                     |   2 +-
>  41 files changed, 512 insertions(+), 458 deletions(-)
>  rename target/s390x/{internal.h => s390x-internal.h} (98%)
>  rename target/s390x/{ => tcg}/s390-tod.h (100%)
>  rename target/s390x/{ => tcg}/tcg_s390x.h (100%)
>  rename target/s390x/{ => tcg}/vec.h (100%)
>  create mode 100644 target/s390x/cpu-dump.c
>  create mode 100644 target/s390x/cpu-sysemu.c
>  delete mode 100644 target/s390x/tcg-stub.c
>  rename target/s390x/{ => tcg}/cc_helper.c (99%)
>  rename target/s390x/{ => tcg}/crypto_helper.c (98%)
>  rename target/s390x/{ => tcg}/excp_helper.c (99%)
>  rename target/s390x/{ => tcg}/fpu_helper.c (99%)
>  rename target/s390x/{ => tcg}/int_helper.c (99%)
>  rename target/s390x/{ => tcg}/mem_helper.c (99%)
>  rename target/s390x/{ => tcg}/misc_helper.c (99%)
>  rename target/s390x/{ => tcg}/translate.c (99%)
>  rename target/s390x/{ => tcg}/vec_fpu_helper.c (99%)
>  rename target/s390x/{ => tcg}/vec_helper.c (99%)
>  rename target/s390x/{ => tcg}/vec_int_helper.c (100%)
>  rename target/s390x/{ => tcg}/vec_string_helper.c (99%)
>  rename target/s390x/{ => tcg}/translate_vx.c.inc (100%)
>  rename target/s390x/{ => tcg}/insn-data.def (100%)
>  rename target/s390x/{ => tcg}/insn-format.def (100%)
>  create mode 100644 target/s390x/tcg/meson.build
> 


