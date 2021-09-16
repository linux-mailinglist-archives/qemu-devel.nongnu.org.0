Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 065C240E7B5
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 19:50:05 +0200 (CEST)
Received: from localhost ([::1]:48068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQvWO-0008RA-4Q
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 13:50:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1mQvTo-0006tw-7t; Thu, 16 Sep 2021 13:47:24 -0400
Received: from mail.csgraf.de ([85.25.223.15]:51466 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1mQvTY-0000kv-3x; Thu, 16 Sep 2021 13:47:22 -0400
Received: from MacBook-Air.alex.local
 (dynamic-077-009-016-098.77.9.pool.telefonica.de [77.9.16.98])
 by csgraf.de (Postfix) with ESMTPSA id 63E5860805C8;
 Thu, 16 Sep 2021 19:47:04 +0200 (CEST)
Subject: Re: [PATCH v11 06/10] hvf: arm: Implement -cpu host
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210915181049.27597-1-agraf@csgraf.de>
 <20210915181049.27597-7-agraf@csgraf.de>
 <CAFEAcA9JZZ4nb8WAvKVYpwqxb_E5NFOVW9rKF3u7GhFqfNZgOQ@mail.gmail.com>
 <8e219cb0-8b65-faf8-f636-5c1d24471f84@csgraf.de>
 <CAFEAcA8xs3x5WCqT+FnPYip=nbQx6=UEH90Dkjq48YLboV9qAw@mail.gmail.com>
From: Alexander Graf <agraf@csgraf.de>
Message-ID: <bf2bb705-1d54-13f9-6e49-158f672cd32e@csgraf.de>
Date: Thu, 16 Sep 2021 19:47:03 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8xs3x5WCqT+FnPYip=nbQx6=UEH90Dkjq48YLboV9qAw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.488,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Peter Collingbourne <pcc@google.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Ard Biesheuvel <ardb@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 16.09.21 17:55, Peter Maydell wrote:
> On Thu, 16 Sept 2021 at 16:30, Alexander Graf <agraf@csgraf.de> wrote:
>>
>> On 16.09.21 14:24, Peter Maydell wrote:
>>> On Wed, 15 Sept 2021 at 19:10, Alexander Graf <agraf@csgraf.de> wrote:
>>>> Now that we have working system register sync, we push more target CPU
>>>> properties into the virtual machine. That might be useful in some
>>>> situations, but is not the typical case that users want.
>>>>
>>>> So let's add a -cpu host option that allows them to explicitly pass all
>>>> CPU capabilities of their host CPU into the guest.
>>>>
>>>> Signed-off-by: Alexander Graf <agraf@csgraf.de>
>>>> Acked-by: Roman Bolshakov <r.bolshakov@yadro.com>
>>>> Reviewed-by: Sergio Lopez <slp@redhat.com>
>>>>
>>>> +    /*
>>>> +     * A scratch vCPU returns SCTLR 0, so let's fill our default with the M1
>>>> +     * boot SCTLR from https://github.com/AsahiLinux/m1n1/issues/97
> Side note: SCTLR_EL1 is a 64-bit register, do you have anything that
> prints the full 64-bits to confirm that [63:32] are indeed all 0?


Yes, m1n1 prints the full 64bit value:
https://github.com/AsahiLinux/m1n1/blob/main/src/memory.c#L459

That said, I'm not sure we really have to model the guest's reset SCTLR
in EL1 to be identical to the host's reset SCTLR in EL2. I think it's a
great start, but as long as there is no spec that indicates what SCTLR
should be in EL1, we can make our own rules IMHO.


Alex


