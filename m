Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8128035872D
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 16:29:39 +0200 (CEST)
Received: from localhost ([::1]:53682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUVf8-0006ry-Ka
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 10:29:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lUVdw-0006RU-4W
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 10:28:29 -0400
Received: from mx2.suse.de ([195.135.220.15]:51436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lUVdt-0003OF-UU
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 10:28:23 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 63620B032;
 Thu,  8 Apr 2021 14:28:19 +0000 (UTC)
Subject: Re: [RFC v12 51/65] target/arm: cpu-sve: split TCG and KVM
 functionality
To: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210326193701.5981-1-cfontana@suse.de>
 <20210326193701.5981-52-cfontana@suse.de>
 <573a18c3-dc67-12f9-9cdb-826cf3c9ec00@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <f14daa25-72a8-b9c0-7085-0dfe45167eb3@suse.de>
Date: Thu, 8 Apr 2021 16:28:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <573a18c3-dc67-12f9-9cdb-826cf3c9ec00@linaro.org>
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/28/21 8:21 PM, Richard Henderson wrote:
> On 3/26/21 1:36 PM, Claudio Fontana wrote:
>> +++ b/target/arm/kvm/kvm-sve.h
>> @@ -0,0 +1,30 @@
>> +/*
>> + * QEMU AArch64 CPU SVE KVM interface
>> + *
>> + * Copyright 2021 SUSE LLC
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
>> + * See the COPYING file in the top-level directory.
>> + */
>> +
>> +#ifndef KVM_SVE_H
>> +#define KVM_SVE_H
>> +
>> +/* note: SVE is an AARCH64-only option, only include this for TARGET_AARCH64 */
> 
> A pointless comment given that kvm itself is aarch64-only.
> 
>> -void cpu_sve_finalize_features(ARMCPU *cpu, Error **errp)
>> +bool cpu_sve_finalize_features(ARMCPU *cpu, Error **errp)
> 
> The commit message does not mention the interface change here.


Ok, would need the two-steps here too.


> 
> I'm not sure about the rest of this patch.  It saves a miniscule amount of code 
> in a kvm-only build, but I don't know that it clarifies things at all.


I would say that it does, if only by making the code flow easier to follow.


> 
> As yet, the other arm hw accelerators do not support SVE, but I assume that's 
> only a matter of time.  The ARM Neoverse cpus support SVE, and will require Xen 
> to have an answer soon.  (Apple will do whatever Apple does, given that it fabs 
> its own ARM cpus, but I expect they won't delay SVE forever.)
> 
> It's not clear to me what bits of the kvm code here is really kvm specific, or 
> if we'll have to move it back.
> 
> I'm tempted to leave it alone for now.


But fair enough, if nobody speaks up and finds them useful other than me, I would drop this from the series.


> 
> 
> r~
> 


