Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9353A24A09D
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Aug 2020 15:51:42 +0200 (CEST)
Received: from localhost ([::1]:39854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k8OVB-0005on-N6
	for lists+qemu-devel@lfdr.de; Wed, 19 Aug 2020 09:51:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1k8OTc-0003zI-Tu
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 09:50:04 -0400
Received: from mx2.suse.de ([195.135.220.15]:34540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1k8OTZ-0003IF-GH
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 09:50:04 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6B3A6B1CC;
 Wed, 19 Aug 2020 13:50:26 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
Subject: Re: [PATCH v5 03/14] cpus: extract out TCG-specific code to accel/tcg
To: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>
References: <20200812183250.9221-1-cfontana@suse.de>
 <20200812183250.9221-4-cfontana@suse.de>
 <6d14d386-231a-f3b5-8802-167c8979aa03@linaro.org>
Message-ID: <ac7ebd7f-d988-d767-a5ec-c19eda4d3f45@suse.de>
Date: Wed, 19 Aug 2020 15:49:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <6d14d386-231a-f3b5-8802-167c8979aa03@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/18 22:55:57
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Eduardo Habkost <ehabkost@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Pavel Dovgalyuk <dovgaluk@ispras.ru>, Wenchao Wang <wenchao.wang@intel.com>,
 haxm-team@intel.com, Sunil Muthuswamy <sunilmut@microsoft.com>,
 Richard Henderson <rth@twiddle.net>, Colin Xu <colin.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/14/20 10:39 PM, Richard Henderson wrote:
> On 8/12/20 11:32 AM, Claudio Fontana wrote:
>> +static int64_t tcg_get_virtual_clock(void)
>> +{
>> +    if (icount_enabled()) {
>> +        return icount_get();
>> +    }
>> +    return cpu_get_clock();
>> +}
>> +
>> +static int64_t tcg_get_elapsed_ticks(void)
>> +{
>> +    if (icount_enabled()) {
>> +        return icount_get();
>> +    }
>> +    return cpu_get_ticks();
>> +}
>> +
>> +CpusAccel tcg_cpus = {
>> +    .create_vcpu_thread = tcg_start_vcpu_thread,
>> +    .kick_vcpu_thread = tcg_kick_vcpu_thread,
>> +    .get_virtual_clock = tcg_get_virtual_clock,
>> +    .get_elapsed_ticks = tcg_get_elapsed_ticks,
>> +};
> 
> I think this variable should be const.  Which of course means that the previous
> patch needs to add const annotations.

Will add.

> 
> I think you should actually have multiple dispatch variables: with icount and
> without, with mttcg and without.  That way these methods don't have to check
> icount_enabled() or qemu_tcg_mttcg_enabled() at runtime, only at startup.

I gave it a try, it would work, however it is basically a refactoring of the existing qemu_tcg_init_vcpu ,

I'd do it in a separate series if possible (with some help from Alex?)

Claudio

> 
> 
> r~
> 


