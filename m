Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBD52B948F
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 15:25:10 +0100 (CET)
Received: from localhost ([::1]:37182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfks0-0004mE-E3
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 09:25:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kfkql-0004Ki-CS
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 09:23:51 -0500
Received: from mx2.suse.de ([195.135.220.15]:34604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kfkqj-0005F2-97
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 09:23:51 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 507F9AF6F;
 Thu, 19 Nov 2020 14:22:46 +0000 (UTC)
Subject: Re: [PATCH 0/5] i386: simplify Hyper-V enlightenments enablement
To: Vitaly Kuznetsov <vkuznets@redhat.com>, qemu-devel@nongnu.org
References: <20201119103221.1665171-1-vkuznets@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <5214378f-29fd-e562-ff99-c7868493c9fe@suse.de>
Date: Thu, 19 Nov 2020 15:22:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201119103221.1665171-1-vkuznets@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/19 08:08:39
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic]
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Vitaly, I just wanted to raise awareness of

https://lists.gnu.org/archive/html/qemu-devel/2020-11/msg04597.html

because if that series work is completed, you would have already the right hook to put your code in, when it comes to your hyperv-specific code for the realizefn.

Ciao ciao,

Claudio

On 11/19/20 11:32 AM, Vitaly Kuznetsov wrote:
> This series is a part of the previously sent "[PATCH RFC v3 00/23] i386:
> KVM: expand Hyper-V features early":
> https://lists.gnu.org/archive/html/qemu-devel/2020-10/msg02443.html
> 
> We're not ready to merge the full patch set yet because the required
> KVM capability is only queued for 5.11. We can, however, extract the
> part providing 'hyperv=on' option to x86 machine types which is valuable
> on its own. Picking up four other patches from the original RFC to
> minimize the code churn in future (x86_cpu_realizefn()).
> 
> Changes since RFCv3:
> - Rename 'hyperv_features' to 'default_hyperv_features' in X86MachineClass
>   [Eduardo]
> - Move x86_cpu_hyperv_realize() invocation after x86_cpu_expand_features()/
>   x86_cpu_filter_features() as we need to reference cpu_has_vmx().
> 
> Vitaly Kuznetsov (5):
>   i386: move hyperv_vendor_id initialization to x86_cpu_realizefn()
>   i386: move hyperv_interface_id initialization to x86_cpu_realizefn()
>   i386: move hyperv_version_id initialization to x86_cpu_realizefn()
>   i386: move hyperv_limits initialization to x86_cpu_realizefn()
>   i386: provide simple 'hyperv=on' option to x86 machine types
> 
>  docs/hyperv.txt       |  8 +++++
>  hw/i386/x86.c         | 30 +++++++++++++++++++
>  include/hw/i386/x86.h |  7 +++++
>  target/i386/cpu.c     | 52 +++++++++++++++++++++++++++++++-
>  target/i386/cpu.h     |  6 +++-
>  target/i386/kvm.c     | 70 ++++++++++++++++++++++++++++---------------
>  6 files changed, 147 insertions(+), 26 deletions(-)
> 


