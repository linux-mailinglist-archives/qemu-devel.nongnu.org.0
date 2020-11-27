Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E71762C6408
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 12:42:56 +0100 (CET)
Received: from localhost ([::1]:39940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kic9Q-0003Dg-26
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 06:42:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kic8K-0002lA-80
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 06:41:48 -0500
Received: from mx2.suse.de ([195.135.220.15]:36730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kic8I-0003lb-J5
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 06:41:47 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BF837AC23;
 Fri, 27 Nov 2020 11:41:44 +0000 (UTC)
Subject: Re: [RFC v6 10/11] accel: introduce AccelCPUClass extending CPUClass
From: Claudio Fontana <cfontana@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20201126223218.31480-1-cfontana@suse.de>
 <20201126223218.31480-11-cfontana@suse.de>
 <6cbd508c-b24b-3219-3302-196dfefaa8f7@redhat.com>
 <d43db8fc-ae7f-0f5f-2e3c-5aad1930f732@suse.de>
 <b5da5096-da08-0856-a69a-12db19c40f67@suse.de>
Message-ID: <925030fe-4a98-cfb2-ead6-b4b5dbe581ca@suse.de>
Date: Fri, 27 Nov 2020 12:41:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <b5da5096-da08-0856-a69a-12db19c40f67@suse.de>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Paul Durrant <paul@xen.org>, Jason Wang <jasowang@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Dario Faggioli <dfaggioli@suse.com>,
 "Emilio G . Cota" <cota@braap.org>, haxm-team@intel.com,
 Cameron Esfahani <dirty@apple.com>, Anthony Perard <anthony.perard@citrix.com>,
 Bruce Rogers <brogers@suse.com>, Olaf Hering <ohering@suse.de>,
 Colin Xu <colin.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/27/20 12:22 PM, Claudio Fontana wrote:
> On 11/27/20 9:59 AM, Claudio Fontana wrote:
>> On 11/27/20 7:21 AM, Paolo Bonzini wrote:
>>> On 26/11/20 23:32, Claudio Fontana wrote:
>>>> +    if (acc) {
>>>> +        object_class_foreach(accel_init_cpu_int_aux, cpu_type, false, acc);
>>>> +    }
>>>
>>> Any reason to do it for cpu_type only, rather than for all subclasses of 
>>> CPU_RESOLVING_TYPE?  This would remove the cpu_type argument to 
>>> accel_init_cpu_interfaces and accel_init_interfaces.
>>>
>>> Otherwise I haven't done a careful review yet but it looks very nice, 
>>> thanks!
>>>
>>> Paolo
>>>
>>
>> Hi Paolo,
>>
>> yes, I thought to pass cpu_type in order to set the interface only for the cpu that is actually used,
>> instead of looping over all cpu models, just to be a bit quicker, but both things should work.
>>
>> Ciao,
>>
>> Claudio
>>
> 
> Note that this actually creates a bug that is caught _ONLY_ by
> 
> acceptance-system-centos.
> 
> The gist of it is that cpu_type (or current_machine->default_cpu_type) is _not_ guaranteed to be set,
> the code there is a bit misleading I think.
> 
> I'll look into it, but just wanted to warn early about it.
> 
> Ciao,
> 
> Claudio
> 

This seems to be due to "-machine none", is machine none supposed to have no default cpu_type?
Is it expected that for machine none current_machine->cpu_type is NULL, or is it a bug?

Thanks,

Claudio







