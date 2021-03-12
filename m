Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73EE63387F7
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 09:54:24 +0100 (CET)
Received: from localhost ([::1]:54902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKdYt-0005EW-I4
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 03:54:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lKdXH-0004NF-OK; Fri, 12 Mar 2021 03:52:43 -0500
Received: from mx2.suse.de ([195.135.220.15]:35962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lKdXA-0003Ju-68; Fri, 12 Mar 2021 03:52:42 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 590F3AF47;
 Fri, 12 Mar 2021 08:52:34 +0000 (UTC)
Subject: Re: [PATCH 1/6] accel: Introduce 'query-accels' QMP command
To: Andrew Jones <drjones@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20210311231202.1536040-1-philmd@redhat.com>
 <20210311231202.1536040-2-philmd@redhat.com>
 <CAJ+F1CLu=A4CaL+KbsSuOr9A36DX_9PpkVNg7PH7-4hCzpfoFg@mail.gmail.com>
 <651baead-dcc3-c0ef-f5dd-cda36c8d6599@redhat.com>
 <20210312084816.pnenjcbdjzwu3z54@kamzik.brq.redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <b8bb7ced-36dd-aaf7-34bf-33d276f03bff@suse.de>
Date: Fri, 12 Mar 2021 09:52:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210312084816.pnenjcbdjzwu3z54@kamzik.brq.redhat.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 libvir-list@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 QEMU <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 "open list:ARM" <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/12/21 9:48 AM, Andrew Jones wrote:
> On Fri, Mar 12, 2021 at 09:11:45AM +0100, Thomas Huth wrote:
>> On 12/03/2021 08.42, Marc-André Lureau wrote:
>>>
>>>
>>> On Fri, Mar 12, 2021 at 3:14 AM Philippe Mathieu-Daudé
>>> <philmd@redhat.com <mailto:philmd@redhat.com>> wrote:
>>>
>> [...]
>>>     +##
>>>     +# @AcceleratorInfo:
>>>     +#
>>>     +# Accelerator information.
>>>     +#
>>>     +# @name: The accelerator name.
>>>     +#
>>>     +# Since: 6.0
>>>     +##
>>>     +{ 'union': 'AcceleratorInfo',
>>>     +  'base': {'name': 'Accelerator'},
>>>     +  'discriminator': 'name',
>>>     +  'data': { } }
>>>
>>>     +
>>>
>>>
>>> Making room for future details, why not.
>>
>> I think we definitely need the additional data section here: For KVM on
>> POWER, it would be good to know whether it's KVM-HV or KVM-PR, for KVM on
>> MIPS it would be good to know whether it's KVM_VM_MIPS_VZ or KVM_VM_MIPS_TE,
>> for KVM on x86 whether it's the AMD flavor or Intel, ...
> 
> Could also pre-expand all of these and list them individually.



Let us consider simplicity for the reader, and which use cases we expect for this.


> 
>>
>>>     +##
>>>     +# @query-accels:
>>>     +#
>>>     +# Get a list of AcceleratorInfo for all built-in accelerators.
>>>     +#
>>>     +# Returns: a list of @AcceleratorInfo describing each accelerator.
>>>     +#
>>>     +# Since: 6.0
>>>     +#
>>>     +# Example:
>>>     +#
>>>     +# -> { "execute": "query-accels" }
>>>     +# <- { "return": [
>>>     +#        {
>>>     +#            "type": "qtest"
>>>     +#        },
>>>     +#        {
>>>     +#            "type": "kvm"
>>>     +#        }
>>>     +#    ] }
>>>     +#
>>>     +##
>>>     +{ 'command': 'query-accels',
>>>     +  'returns': ['AcceleratorInfo'] }
>>>
>>>
>>> That's nice, but how do you know which accels are actually enabled?
>>
>> I guess we need two commands in the end, one for querying which accelerators
>> are available, and one for querying the data from the currently active
>> accelerator...?
>>
> 
> If we listed each accelerator individually, then we could use booleans
> for them, where only the active one would be true. If we can't come up
> with another need for the accelerator-specific info now, then I'd leave
> it to be added at a later time when it is needed.
> 
> Thanks,
> drew
> 


