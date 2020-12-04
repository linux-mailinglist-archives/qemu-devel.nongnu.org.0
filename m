Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7499E2CF5A7
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 21:28:33 +0100 (CET)
Received: from localhost ([::1]:44804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klHgu-0005Ii-HR
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 15:28:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1klFbq-0007D9-T3
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 13:15:16 -0500
Received: from mx2.suse.de ([195.135.220.15]:56418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1klFbc-0003Je-CA
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 13:15:10 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E140BACB5;
 Fri,  4 Dec 2020 18:14:51 +0000 (UTC)
Subject: Re: [RFC v7 15/22] cpu: Move tlb_fill to tcg_ops
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
References: <20201130023535.16689-1-cfontana@suse.de>
 <20201130023535.16689-16-cfontana@suse.de>
 <4c7fe436-7c2d-e55d-1139-8aa30e91965f@redhat.com>
 <20201204173703.GQ3836@habkost.net>
 <6233d4db-546a-2ec3-376d-154af8ed2cdb@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <dc731d70-cf85-0735-4335-44f685343a9b@suse.de>
Date: Fri, 4 Dec 2020 19:14:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <6233d4db-546a-2ec3-376d-154af8ed2cdb@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Emilio G . Cota" <cota@braap.org>, Paul Durrant <paul@xen.org>,
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Dario Faggioli <dfaggioli@suse.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Cameron Esfahani <dirty@apple.com>,
 haxm-team@intel.com, Wenchao Wang <wenchao.wang@intel.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Sunil Muthuswamy <sunilmut@microsoft.com>,
 Bruce Rogers <brogers@suse.com>, Olaf Hering <ohering@suse.de>,
 Colin Xu <colin.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/4/20 7:00 PM, Philippe Mathieu-Daudé wrote:
> On 12/4/20 6:37 PM, Eduardo Habkost wrote:
>> On Fri, Dec 04, 2020 at 06:14:07PM +0100, Philippe Mathieu-Daudé wrote:
>>> On 11/30/20 3:35 AM, Claudio Fontana wrote:
>>>> From: Eduardo Habkost <ehabkost@redhat.com>
>>>>
>>>> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
>>>> ---
>>>>  accel/tcg/cputlb.c              |  6 +++---
>>>>  accel/tcg/user-exec.c           |  6 +++---
>>>>  include/hw/core/cpu.h           |  9 ---------
>>>>  include/hw/core/tcg-cpu-ops.h   | 12 ++++++++++++
>>>>  target/alpha/cpu.c              |  2 +-
>>>>  target/arm/cpu.c                |  2 +-
>>>>  target/avr/cpu.c                |  2 +-
>>>>  target/cris/cpu.c               |  2 +-
>>>>  target/hppa/cpu.c               |  2 +-
>>>>  target/i386/tcg-cpu.c           |  2 +-
>>>>  target/lm32/cpu.c               |  2 +-
>>>>  target/m68k/cpu.c               |  2 +-
>>>>  target/microblaze/cpu.c         |  2 +-
>>>>  target/mips/cpu.c               |  2 +-
>>>>  target/moxie/cpu.c              |  2 +-
>>>>  target/nios2/cpu.c              |  2 +-
>>>>  target/openrisc/cpu.c           |  2 +-
>>>>  target/ppc/translate_init.c.inc |  2 +-
>>>>  target/riscv/cpu.c              |  2 +-
>>>>  target/rx/cpu.c                 |  2 +-
>>>>  target/s390x/cpu.c              |  2 +-
>>>>  target/sh4/cpu.c                |  2 +-
>>>>  target/sparc/cpu.c              |  2 +-
>>>>  target/tilegx/cpu.c             |  2 +-
>>>>  target/tricore/cpu.c            |  2 +-
>>>>  target/unicore32/cpu.c          |  2 +-
>>>>  target/xtensa/cpu.c             |  2 +-
>>>>  27 files changed, 41 insertions(+), 38 deletions(-)
>>>
>>> With cc->tcg_ops.* guarded with #ifdef CONFIG_TCG:
>>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>
>> Thanks!
>>
>> Are the #ifdefs a hard condition for your Reviewed-by?
> 
> No, as you said, this is fine as a first step, so you can
> include them.
> 
>> Even if we agree #ifdef CONFIG_TCG is the way to go, I don't
>> think this should block a series that's a step in the right
>> direction.  It can be done in a separate patch.
>>
>> (Unless the lack of #ifdef introduces regressions, of course)
> 
> I'm worried about the +system -tcg build configuration.
> 
> s390x is the only target testing for such regressions
> (see "[s390x] Clang (disable-tcg)" on Travis-CI.
> 

which exact configure options are concerned about?

--disable-tcg --enable-kvm --target="*-system"?

Or something else?

this is something I am testing (and found the issues).

I am currently testing (and a result fixing) for each patch:

--disable-tcg --enable-kvm
--enable-tcg --disable-kvm
--enable-tcg --enable-kvm --enable-hax
--disable-system

With targets (when compatible):
TARGET_LIST="x86_64-softmmu,x86_64-linux-user,arm-softmmu,arm-linux-user,aarch64-softmmu,aarch64-linux-user,s390x-softmmu,s390x-linux-user"

and yes, should offload much of this to CI..

Ciao,

Claudio


