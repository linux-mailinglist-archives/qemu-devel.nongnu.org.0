Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7F4309D08
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Jan 2021 15:42:11 +0100 (CET)
Received: from localhost ([::1]:41552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6DvW-0001ey-06
	for lists+qemu-devel@lfdr.de; Sun, 31 Jan 2021 09:42:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1l6Dte-0000kw-W5; Sun, 31 Jan 2021 09:40:15 -0500
Received: from mx2.suse.de ([195.135.220.15]:58140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1l6Dtc-0008Ru-Td; Sun, 31 Jan 2021 09:40:14 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A668DAD2B;
 Sun, 31 Jan 2021 14:40:10 +0000 (UTC)
Subject: Re: [PATCH v6 00/11] Support disabling TCG on ARM (part 2)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210131115022.242570-1-f4bug@amsat.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <9924223e-3aeb-5200-c7fa-f120a7ae30fe@suse.de>
Date: Sun, 31 Jan 2021 15:40:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210131115022.242570-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.079,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, kvm@vger.kernel.org, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/31/21 12:50 PM, Philippe Mathieu-Daudé wrote:
> Cover from Samuel Ortiz from (part 1) [1]:
> 
>   This patchset allows for building and running ARM targets with TCG
>   disabled. [...]
> 
>   The rationale behind this work comes from the NEMU project where
>   we're trying to only support x86 and ARM 64-bit architectures,
>   without including the TCG code base. We can only do so if we can
>   build and run ARM binaries with TCG disabled.
> 
> Peter mentioned in v5 [6] that since 32-bit host has been removed,
> we have to remove v7 targets. This is not done in this series, as
> linking succeeds, and there is enough material to review (no need
> to spend time on that extra patch if the current approach is not
> accepted).
> 
> CI: https://gitlab.com/philmd/qemu/-/pipelines/249272441
> 
> v6:
> - rebased on "target/arm/Kconfig" series
> - introduce/use tcg_builtin() for realview machines
> 
> v5:
> - addressed Paolo/Richard/Thomas review comments from v4 [5].
> 
> v4 almost 2 years later... [2]:
> - Rebased on Meson
> - Addressed Richard review comments
> - Addressed Claudio review comments
> 
> v3 almost 18 months later [3]:
> - Rebased
> - Addressed Thomas review comments
> - Added Travis-CI job to keep building --disable-tcg on ARM
> 
> v2 [4]:
> - Addressed review comments from Richard and Thomas from v1 [1]
> 
> Regards,
> 
> Phil.
> 
> [1]: https://lists.gnu.org/archive/html/qemu-devel/2018-11/msg02451.html
> [2]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg689168.html
> [3]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg641796.html
> [4]: https://lists.gnu.org/archive/html/qemu-devel/2019-08/msg05003.html
> [5]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg746041.html
> [6]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg777669.html
> 
> Based-on: <20210131111316.232778-1-f4bug@amsat.org>
>           "target: Provide target-specific Kconfig"
> 
> Philippe Mathieu-Daudé (9):
>   sysemu/tcg: Introduce tcg_builtin() helper
>   exec: Restrict TCG specific headers
>   target/arm: Restrict ARMv4 cpus to TCG accel
>   target/arm: Restrict ARMv5 cpus to TCG accel
>   target/arm: Restrict ARMv6 cpus to TCG accel
>   target/arm: Restrict ARMv7 R-profile cpus to TCG accel
>   target/arm: Restrict ARMv7 M-profile cpus to TCG accel
>   target/arm: Reorder meson.build rules
>   .travis.yml: Add a KVM-only Aarch64 job
> 
> Samuel Ortiz (1):
>   target/arm: Do not build TCG objects when TCG is off
> 
> Thomas Huth (1):
>   target/arm: Make m_helper.c optional via CONFIG_ARM_V7M
> 
>  default-configs/devices/aarch64-softmmu.mak |  1 -
>  default-configs/devices/arm-softmmu.mak     | 27 --------
>  include/exec/helper-proto.h                 |  2 +
>  include/sysemu/tcg.h                        |  2 +
>  target/arm/cpu.h                            | 12 ----
>  hw/arm/realview.c                           |  7 +-
>  target/arm/cpu_tcg.c                        |  4 +-
>  target/arm/helper.c                         |  7 --
>  target/arm/m_helper-stub.c                  | 73 +++++++++++++++++++++
>  tests/qtest/cdrom-test.c                    |  6 +-
>  .travis.yml                                 | 32 +++++++++
>  hw/arm/Kconfig                              | 38 +++++++++++
>  target/arm/Kconfig                          | 17 +++++
>  target/arm/meson.build                      | 28 +++++---
>  14 files changed, 196 insertions(+), 60 deletions(-)
>  create mode 100644 target/arm/m_helper-stub.c
> 

Looking at this series, just my 2 cents on how I would suggest to go forward:
I could again split my series in two parts, with only the TCG Ops in the first part.

Then this series could be merged, enabling --disable-tcg for ARM,

then I could extend the second part of my series to include ARM as well.

Wdyt? (Probably Richard?)

Thanks,

Claudio





