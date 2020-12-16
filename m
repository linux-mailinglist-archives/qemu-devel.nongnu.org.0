Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 997B32DBCD7
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 09:45:31 +0100 (CET)
Received: from localhost ([::1]:42924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpSR8-0008QB-NU
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 03:45:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kpSQ0-0007z7-O9
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 03:44:20 -0500
Received: from mx2.suse.de ([195.135.220.15]:36926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kpSPz-0006hN-5Q
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 03:44:20 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2D057AC91;
 Wed, 16 Dec 2020 08:44:16 +0000 (UTC)
Subject: Re: [PATCH v12 16/23] cpu: Move synchronize_from_tb() to tcg_ops
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20201212155530.23098-1-cfontana@suse.de>
 <20201212155530.23098-17-cfontana@suse.de>
 <20201214191029.GO1289986@habkost.net>
 <e72e2d6b-ef99-5590-fe18-9cb6d4092e23@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <53e65297-3226-4432-9dfe-e0750333463b@suse.de>
Date: Wed, 16 Dec 2020 09:44:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <e72e2d6b-ef99-5590-fe18-9cb6d4092e23@redhat.com>
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
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Emilio G . Cota" <cota@braap.org>, Paul Durrant <paul@xen.org>,
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Dario Faggioli <dfaggioli@suse.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Cameron Esfahani <dirty@apple.com>, haxm-team@intel.com,
 Wenchao Wang <wenchao.wang@intel.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Sunil Muthuswamy <sunilmut@microsoft.com>,
 Bruce Rogers <brogers@suse.com>, Olaf Hering <ohering@suse.de>,
 Colin Xu <colin.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/14/20 10:56 PM, Philippe Mathieu-Daudé wrote:
> Hi Claudio, Eduardo.
> 
> On 12/14/20 8:10 PM, Eduardo Habkost wrote:
>> On Sat, Dec 12, 2020 at 04:55:23PM +0100, Claudio Fontana wrote:
>>> From: Eduardo Habkost <ehabkost@redhat.com>
>>>
>>> since tcg_cpu_ops.h is only included in cpu.h,
>>> and as a standalone header it is not really useful,
>>> as tcg_cpu_ops.h starts requiring cpu.h defines,
>>> enums, etc, as well as (later on in the series),
>>> additional definitions coming from memattr.h.
>>>
>>> Therefore rename it to tcg_cpu_ops.h.inc, to warn
>>> any potential user that this file is not a standalone
>>> header, but rather a partition of cpu.h that is
>>> included conditionally if CONFIG_TCG is true.
>>
>> What's the benefit of moving definitions to a separate file, if
>> the new file is not a standalone header?
> 

the benefit is avoiding a 100 line ifdef CONFIG_TCG, and already separating out what is tcg-specific and what isn't,
but if this is a problem we can avoid that, and revisit later on.


> Claudio, I haven't been following every respin. If you did that
> change just to please me then the circular dependency remarked by
> Richard, then if it simplify the series I'm OK if you have to
> remove the includes.

Richard, From the answer of Philippe and Eduardo I think they are not ok with .h.inc,
I think the option of just putting everything in cpu.h was ok with you,
should I go with that?

Thanks,

Claudio


> 
> Eduardo, if you are happy with patches 1-8 (x86 specific), maybe
> you can queue them already. The rest is more TCG generic and
> will likely go via Richard/Paolo trees IMO.
> 
>>
>> If moving the definitions to a separate header is going to
>> require too much work, it's completely OK to keep them in cpu.h
>> by now, and try to move them later.
>>
>> I'm worried that the scope of this series is growing too much,
>> and discussion/review of additional changes in each new version
>> is preventing us from merging the original changes where we
>> already had some consensus.
> 


