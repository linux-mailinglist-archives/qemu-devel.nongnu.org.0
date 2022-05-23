Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE9A5314F0
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 18:28:31 +0200 (CEST)
Received: from localhost ([::1]:54848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntAv0-00076B-Qw
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 12:28:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@maciej.szmigiero.name>)
 id 1ntAtP-0005Qp-J1
 for qemu-devel@nongnu.org; Mon, 23 May 2022 12:26:51 -0400
Received: from vps-vb.mhejs.net ([37.28.154.113]:37174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@maciej.szmigiero.name>)
 id 1ntAtN-0005ag-7T
 for qemu-devel@nongnu.org; Mon, 23 May 2022 12:26:50 -0400
Received: from MUA by vps-vb.mhejs.net with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <mail@maciej.szmigiero.name>)
 id 1ntAt9-0007jE-Vj; Mon, 23 May 2022 18:26:36 +0200
Message-ID: <58e76b42-22a7-3b54-e175-a3d01579525f@maciej.szmigiero.name>
Date: Mon, 23 May 2022 18:26:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marcelo Tosatti <mtosatti@redhat.com>, kvm <kvm@vger.kernel.org>,
 qemu-devel <qemu-devel@nongnu.org>
References: <be14c1e895a2f452047451f050d269217dcee6d9.1653071510.git.maciej.szmigiero@oracle.com>
 <CABgObfZfV66MN11=xEjwH0PE944-OTcAZkSpWEcJeK=1EYWJnw@mail.gmail.com>
From: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Subject: Re: [PATCH] target/i386/kvm: Fix disabling MPX on "-cpu host" with
 MPX-capable host
In-Reply-To: <CABgObfZfV66MN11=xEjwH0PE944-OTcAZkSpWEcJeK=1EYWJnw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=37.28.154.113;
 envelope-from=mail@maciej.szmigiero.name; helo=vps-vb.mhejs.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 21.05.2022 10:54, Paolo Bonzini wrote:
> On Fri, May 20, 2022 at 8:33 PM Maciej S. Szmigiero
> <mail@maciej.szmigiero.name> wrote:
>>
>> From: "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>
>>
>> Since KVM commit 5f76f6f5ff96 ("KVM: nVMX: Do not expose MPX VMX controls when guest MPX disabled")
>> it is not possible to disable MPX on a "-cpu host" just by adding "-mpx"
>> there if the host CPU does indeed support MPX.
>> QEMU will fail to set MSR_IA32_VMX_TRUE_{EXIT,ENTRY}_CTLS MSRs in this case
>> and so trigger an assertion failure.
>>
>> Instead, besides "-mpx" one has to explicitly add also
>> "-vmx-exit-clear-bndcfgs" and "-vmx-entry-load-bndcfgs" to QEMU command
>> line to make it work, which is a bit convoluted.
>>
>> Sanitize MPX-related bits in MSR_IA32_VMX_TRUE_{EXIT,ENTRY}_CTLS after
>> setting the vCPU CPUID instead so such workarounds are no longer necessary.
> 
> Can you use feature_dependencies instead? See for example
> 
>      {
>          .from = { FEAT_7_0_EBX,             CPUID_7_0_EBX_RDSEED },
>          .to = { FEAT_VMX_SECONDARY_CTLS,    VMX_SECONDARY_EXEC_RDSEED_EXITING },
>      },

The "feature_dependencies" way seems to work fine too,
and it definitely looks neater.

Thanks for the pointer, will post v2 in a moment.

> Paolo
> 

Thanks,
Maciej

