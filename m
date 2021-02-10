Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C544331726C
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 22:36:21 +0100 (CET)
Received: from localhost ([::1]:43348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9x9o-0006PB-Cb
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 16:36:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1l9x8B-0005jI-Mr; Wed, 10 Feb 2021 16:34:39 -0500
Received: from mail.csgraf.de ([85.25.223.15]:40444 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1l9x89-0005uQ-LE; Wed, 10 Feb 2021 16:34:39 -0500
Received: from Alexanders-Mac-mini.local (unknown [188.138.100.120])
 by csgraf.de (Postfix) with UTF8SMTPSA id 4973C60803D4;
 Wed, 10 Feb 2021 22:34:31 +0100 (CET)
Message-ID: <e8c23d05-e9de-ffc5-baa5-d985740271b5@csgraf.de>
Date: Wed, 10 Feb 2021 22:34:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:86.0)
 Gecko/20100101 Thunderbird/86.0
Subject: Re: [PATCH v6 06/11] hvf: Simplify post reset/init/loadvm hooks
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210120224444.71840-1-agraf@csgraf.de>
 <20210120224444.71840-7-agraf@csgraf.de>
 <CAFEAcA8Tm2d+Wmd0X7RddfBHPez_Tjk71YFgXNOo2gycxq32JQ@mail.gmail.com>
From: Alexander Graf <agraf@csgraf.de>
In-Reply-To: <CAFEAcA8Tm2d+Wmd0X7RddfBHPez_Tjk71YFgXNOo2gycxq32JQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.211,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Collingbourne <pcc@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 28.01.21 16:28, Peter Maydell wrote:
> On Wed, 20 Jan 2021 at 22:44, Alexander Graf <agraf@csgraf.de> wrote:
>> The hooks we have that call us after reset, init and loadvm really all
>> just want to say "The reference of all register state is in the QEMU
>> vcpu struct, please push it".
>>
>> We already have a working pushing mechanism though called cpu->vcpu_dirty,
>> so we can just reuse that for all of the above, syncing state properly the
>> next time we actually execute a vCPU.
>>
>> This fixes PSCI resets on ARM, as they modify CPU state even after the
>> post init call has completed, but before we execute the vCPU again.
>>
>> To also make the scheme work for x86, we have to make sure we don't
>> move stale eflags into our env when the vcpu state is dirty.
>>
>> Signed-off-by: Alexander Graf <agraf@csgraf.de>
>> Reviewed-by: Roman Bolshakov <r.bolshakov@yadro.com>
>> Tested-by: Roman Bolshakov <r.bolshakov@yadro.com>
> What's the difference between HVF and KVM that means this code
> doesn't have the same structure the KVM code does here?


The main reason is that with KVM, responsibility of register reset is 
shared between kernel and user space. With HVF, user space has 
everything under full control, so all we need to say is "user space is 
your reference now". While with KVM, we may need to still say "KVM state 
is your reference, because it will do the register reset on behalf of us".

Alex



