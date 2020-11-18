Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AD82B7E82
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 14:49:13 +0100 (CET)
Received: from localhost ([::1]:54636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfNpg-00076Z-Hm
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 08:49:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kfNox-0006hI-W4
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 08:48:28 -0500
Received: from mx2.suse.de ([195.135.220.15]:45014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kfNow-0005HE-9w
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 08:48:27 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5BF55AC2E;
 Wed, 18 Nov 2020 13:48:24 +0000 (UTC)
Subject: Re: [RFC v3 8/9] module: introduce MODULE_INIT_ACCEL_CPU
To: Eduardo Habkost <ehabkost@redhat.com>
References: <20201118102936.25569-1-cfontana@suse.de>
 <20201118102936.25569-9-cfontana@suse.de>
 <20201118124845.GC1509407@habkost.net>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <6093de34-807d-3840-5402-4769385dd894@suse.de>
Date: Wed, 18 Nov 2020 14:48:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201118124845.GC1509407@habkost.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 07:38:53
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Olaf Hering <ohering@suse.de>, Jason Wang <jasowang@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Dario Faggioli <dfaggioli@suse.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Cameron Esfahani <dirty@apple.com>,
 Colin Xu <colin.xu@intel.com>, Wenchao Wang <wenchao.wang@intel.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Sunil Muthuswamy <sunilmut@microsoft.com>,
 Bruce Rogers <brogers@suse.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 haxm-team@intel.com, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/18/20 1:48 PM, Eduardo Habkost wrote:
> On Wed, Nov 18, 2020 at 11:29:35AM +0100, Claudio Fontana wrote:
>> apply this to the registration of the cpus accel interfaces,
>>
>> but this will be also in preparation for later use of this
>> new module init step to also defer the registration of the cpu models,
>> in order to make them subclasses of a per-accel cpu type.
>>
>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>> ---
> [...]
>> +    /*
>> +     * accelerator has been chosen and initialized, now it is time to
>> +     * register the cpu accel interface.
>> +     */
>> +    module_call_init(MODULE_INIT_ACCEL_CPU);
> 
> I don't get why we would use a new module initialization level

To have a clear point in time after which all accelerator interface initialization is done.
It avoids to have to hunt down the registration points spread around the code base.
I'd turn it around, why not?

> for this.  If the accelerator object was already created, we can
> just ask the existing accel object to do whatever initialization
> step is necessary.
> 
> e.g. we can add a AccelClass.cpu_accel_ops field, and call:
> 
>    cpus_register_accel(current_machine->accelerator->cpu_accel_ops);
> 

_When_ this is done is the question, in my view, where the call to the registration is placed.

After adding additonal operations that have to be done at "accelerator-chosen" time, it becomes more and more difficult to trace them around the codebase.

Thanks,

Claudio





