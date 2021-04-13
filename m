Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8BE35DE45
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 14:09:37 +0200 (CEST)
Received: from localhost ([::1]:38582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWHrM-0000qu-Gb
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 08:09:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lWHnK-0007Xq-VC
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 08:05:29 -0400
Received: from mx2.suse.de ([195.135.220.15]:54162)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lWHn5-0002zM-VU
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 08:05:26 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6FB4BAE20;
 Tue, 13 Apr 2021 12:05:06 +0000 (UTC)
Subject: Re: [RFC v12 00/65] arm cleanup experiment for kvm-only build
To: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210326193701.5981-1-cfontana@suse.de>
 <a7cb8809-5016-de7d-c9cc-8f1003bc6703@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <b5ed14b1-d546-d00e-f7ae-3be8612e411a@suse.de>
Date: Tue, 13 Apr 2021 14:05:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <a7cb8809-5016-de7d-c9cc-8f1003bc6703@linaro.org>
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

On 3/28/21 9:27 PM, Richard Henderson wrote:
> On 3/26/21 1:35 PM, Claudio Fontana wrote:
>> Here a new version of the series that enables kvm-only builds.
>>
>> The goal here is to enable the KVM-only build, but there is
>> some additional cleanup too.
>>
>> In this iteration I mostly fixed existing issues, and added an attempt
>> to put more content in cpu-sve. More splitting still required
>> for both cpu-sve and cpu-auth.
>>
>> Comments welcome, thanks,
> 
> My number 1 takeaway is that I don't think we should bother trying so hard to 
> compile out aarch64-specific code.  The number of ifdefs seems to be quite high 
> in the end.
> 

Understand - it turns out to be useful in practice though to go through some effort
to improve the distinction between aarch64-specific code , aarch32-specific code,
and code that is common to both, even though we might later decide to just have basically TARGET_AARCH64 be always true (ie removing it)
in a future series.

> The cleanup that I think would be better would be to *remove* the 32-bit-only 
> qemu-system-arm and build it all into a single binary.  That would reduce the 
> number of build combinations and could in turn simplify or speed up CI.

Still, I think it is interesting for the reader of the code, and in trying to debug issues,
to be mindful about which code is 32bit-only, which code is 64-bit only, which is common.

Not that this series fixes everything in this regard.

> 
> We probably cannot remove qemu-arm for 32-bit linux-user binaries.  But my 
> guess is the amount of aarch64-specific code that would leak in is pretty 
> minimal.  The bulk of the difference is in the set of tcg helpers, which are 
> segregated already.
> 
> The tcg/kvm split is much more interesting, and that part of the patch set 
> looks pretty good.
> 
> 
> r~
> 

Thanks, I'll send a new version momentarily, we can continue from there.

Ciao,

Claudio

