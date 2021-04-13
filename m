Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0BB35DE91
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 14:22:23 +0200 (CEST)
Received: from localhost ([::1]:58466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWI3i-0001oT-Bk
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 08:22:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lWHxl-0006c7-Nb
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 08:16:16 -0400
Received: from mx2.suse.de ([195.135.220.15]:35790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lWHxh-0000UE-85
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 08:16:13 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 290E6AC79;
 Tue, 13 Apr 2021 12:16:06 +0000 (UTC)
Subject: Re: [RFC v12 60/65] target/arm: cpu-pauth: new module for ARMv8.3
 Pointer Authentication
To: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210326193701.5981-1-cfontana@suse.de>
 <20210326193701.5981-61-cfontana@suse.de>
 <a1a32cde-2eb0-9990-05c0-8c2efecf7fc5@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <8982d7c9-391e-af97-8274-676fa3f684f6@suse.de>
Date: Tue, 13 Apr 2021 14:16:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <a1a32cde-2eb0-9990-05c0-8c2efecf7fc5@linaro.org>
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

On 3/28/21 9:05 PM, Richard Henderson wrote:
> On 3/26/21 1:36 PM, Claudio Fontana wrote:
>> Pointer Authentication is an AARCH64-only ARMv8.3 optional
>> extension, whose cpu properties can be separated out in its own module.
>>
>> Signed-off-by: Claudio Fontana<cfontana@suse.de>
>> ---
>>   target/arm/cpu.h           |  3 --
>>   target/arm/tcg/cpu-pauth.h | 34 ++++++++++++++++++++
>>   target/arm/cpu.c           |  4 +--
>>   target/arm/cpu64.c         | 35 ++------------------
>>   target/arm/tcg/cpu-pauth.c | 66 ++++++++++++++++++++++++++++++++++++++
>>   target/arm/tcg/meson.build |  1 +
>>   6 files changed, 105 insertions(+), 38 deletions(-)
>>   create mode 100644 target/arm/tcg/cpu-pauth.h
>>   create mode 100644 target/arm/tcg/cpu-pauth.c
> 
> No move + rename at once.
> 
> Also, you've started using tcg_sve_* and I think that might as well apply to 
> these, in that second step.
> 
> r~
> 

The idea for tcg_sve_* was in contrast to cpu_sve_*, which contains the common parts of cpu_sve.

So the idea for SVE is:

cpu-sve.c     : CPU SVE module, contains the common functions.
tcg/tcg-sve.c : TCG-specific parts of cpu-sve
kvm/kvm-sve.c : KVM-specific parts of cpu-sve

Now for PAuth we only have a TCG implementation,
so that is the reason that this patch uses the more general name.

If still tcg/tcg-pauth.c seems better we can go for it, but it just seems not very logical without a corresponding general cpu-pauth.c

Ciao,

Claudio


