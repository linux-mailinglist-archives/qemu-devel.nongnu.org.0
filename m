Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBC9381F3B
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 16:20:22 +0200 (CEST)
Received: from localhost ([::1]:32934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liHcz-0004jl-Ky
	for lists+qemu-devel@lfdr.de; Sun, 16 May 2021 10:20:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1liHVg-0007GQ-Bh; Sun, 16 May 2021 10:12:48 -0400
Received: from mail.csgraf.de ([85.25.223.15]:45062 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1liHVa-0000Vz-1a; Sun, 16 May 2021 10:12:46 -0400
Received: from MacBook-Air.alex.local
 (dynamic-077-002-111-216.77.2.pool.telefonica.de [77.2.111.216])
 by csgraf.de (Postfix) with ESMTPSA id 3353360803C7;
 Sun, 16 May 2021 16:12:38 +0200 (CEST)
Subject: Re: [PATCH v6 03/11] hvf: Move common code out
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210120224444.71840-1-agraf@csgraf.de>
 <20210120224444.71840-4-agraf@csgraf.de>
 <e1054d19-f047-bbaf-0d4d-20b8df97db44@redhat.com>
From: Alexander Graf <agraf@csgraf.de>
Message-ID: <c74882ac-7a60-d320-840d-eec26c4972af@csgraf.de>
Date: Sun, 16 May 2021 16:12:37 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <e1054d19-f047-bbaf-0d4d-20b8df97db44@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Collingbourne <pcc@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 21.01.21 08:26, Philippe Mathieu-Daudé wrote:
> Hi Alexander,
>
> On 1/20/21 11:44 PM, Alexander Graf wrote:
>> Until now, Hypervisor.framework has only been available on x86_64 systems.
>> With Apple Silicon shipping now, it extends its reach to aarch64. To
>> prepare for support for multiple architectures, let's move common code out
>> into its own accel directory.
>>
>> Signed-off-by: Alexander Graf <agraf@csgraf.de>
>> Reviewed-by: Roman Bolshakov <r.bolshakov@yadro.com>
>> Tested-by: Roman Bolshakov <r.bolshakov@yadro.com>
>>
>> ---
>>
>> v3 -> v4:
>>
>>   - Use hv.h instead of Hypervisor.h for 10.15 compat
>>   - Remove manual inclusion of Hypervisor.h in common .c files
>> ---
>>  MAINTAINERS                 |   8 +
>>  accel/hvf/hvf-all.c         |  54 +++++
>>  accel/hvf/hvf-cpus.c        | 462 ++++++++++++++++++++++++++++++++++++
>>  accel/hvf/meson.build       |   7 +
>>  accel/meson.build           |   1 +
>>  include/sysemu/hvf_int.h    |  54 +++++
>>  target/i386/hvf/hvf-cpus.c  | 131 ----------
>>  target/i386/hvf/hvf-cpus.h  |  25 --
>>  target/i386/hvf/hvf-i386.h  |  33 +--
>>  target/i386/hvf/hvf.c       | 360 +---------------------------
>>  target/i386/hvf/meson.build |   1 -
>>  target/i386/hvf/x86hvf.c    |  11 +-
>>  target/i386/hvf/x86hvf.h    |   2 -
>>  13 files changed, 596 insertions(+), 553 deletions(-)
>>  create mode 100644 accel/hvf/hvf-all.c
>>  create mode 100644 accel/hvf/hvf-cpus.c
>>  create mode 100644 accel/hvf/meson.build
>>  create mode 100644 include/sysemu/hvf_int.h
>>  delete mode 100644 target/i386/hvf/hvf-cpus.c
>>  delete mode 100644 target/i386/hvf/hvf-cpus.h
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 3216387521..e589ec02e0 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -448,7 +448,15 @@ M: Roman Bolshakov <r.bolshakov@yadro.com>
>>  W: https://wiki.qemu.org/Features/HVF
>>  S: Maintained
>>  F: target/i386/hvf/
>> +
>> +HVF
>> +M: Cameron Esfahani <dirty@apple.com>
>> +M: Roman Bolshakov <r.bolshakov@yadro.com>
>> +W: https://wiki.qemu.org/Features/HVF
>> +S: Maintained
>> +F: accel/hvf/
>>  F: include/sysemu/hvf.h
>> +F: include/sysemu/hvf_int.h
>>  
>>  WHPX CPUs
>>  M: Sunil Muthuswamy <sunilmut@microsoft.com>
>> diff --git a/accel/hvf/hvf-all.c b/accel/hvf/hvf-all.c
>> new file mode 100644
>> index 0000000000..5b415eb0ed
>> --- /dev/null
>> +++ b/accel/hvf/hvf-all.c
>> @@ -0,0 +1,54 @@
>> +/*
>> + * QEMU Hypervisor.framework support
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2.  See
>> + * the COPYING file in the top-level directory.
>> + *
>> + * Contributions after 2012-01-13 are licensed under the terms of the
>> + * GNU GPL, version 2 or (at your option) any later version.
> Maybe start with GPLv2+ directly?


I'd prefer to leave the license clause in here, because I'm not touching
any of the code, only moving it.


>
>> diff --git a/include/sysemu/hvf_int.h b/include/sysemu/hvf_int.h
>> new file mode 100644
>> index 0000000000..69de46db7d
>> --- /dev/null
>> +++ b/include/sysemu/hvf_int.h
>> @@ -0,0 +1,54 @@
>> +/*
>> + * QEMU Hypervisor.framework (HVF) support
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
>> + * See the COPYING file in the top-level directory.
>> + *
>> + */
>> +
>> +/* header to be included in HVF-specific code */
> Can we have this header local to accel/hvf/ ?


At the end of the patch set, the list of files using the header is not
limited to accel/hvf:

MacBook-Air:qemu alex$ git grep hvf_int.h
MAINTAINERS:F: include/sysemu/hvf_int.h
accel/hvf/hvf-accel-ops.c:#include "sysemu/hvf_int.h"
accel/hvf/hvf-all.c:#include "sysemu/hvf_int.h"
target/arm/hvf/hvf.c:#include "sysemu/hvf_int.h"
target/i386/hvf/hvf-i386.h:#include "sysemu/hvf_int.h"
target/i386/hvf/hvf.c:#include "sysemu/hvf_int.h"
target/i386/hvf/vmx.h:#include "sysemu/hvf_int.h"

It also aligns with KVM's use of kvm_int.h, no? Overall, I'm not sure
putting it into the accel directory will buy us too much, I'm happy to
be convinced otherwise though.


> Otherwise:
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


Thanks :)


Alex



