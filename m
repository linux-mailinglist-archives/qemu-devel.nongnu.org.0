Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A6B365A47
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 15:37:44 +0200 (CEST)
Received: from localhost ([::1]:35662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYqZS-0003yO-Sm
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 09:37:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lYqXc-00034A-Rh; Tue, 20 Apr 2021 09:35:48 -0400
Received: from mx2.suse.de ([195.135.220.15]:33190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lYqXZ-0006yh-Ot; Tue, 20 Apr 2021 09:35:48 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 93361AFCB;
 Tue, 20 Apr 2021 13:35:42 +0000 (UTC)
Subject: Re: [RFC v2 04/13] target/s390x: remove tcg-stub.c
To: David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20210420103616.32731-1-cfontana@suse.de>
 <20210420103616.32731-5-cfontana@suse.de>
 <f40727a3-9687-6821-804b-d35fa2bd5d23@redhat.com>
 <3f7d3cda-9319-9004-7568-55459bc05c78@suse.de>
 <96f7ed07-137b-f337-4a00-77785d8e3bcc@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <3218a4eb-c0f3-4cb6-3eae-78a1f9e1c393@suse.de>
Date: Tue, 20 Apr 2021 15:35:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <96f7ed07-137b-f337-4a00-77785d8e3bcc@redhat.com>
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
Cc: Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/20/21 3:04 PM, David Hildenbrand wrote:
> On 20.04.21 15:00, Claudio Fontana wrote:
>> On 4/20/21 2:54 PM, David Hildenbrand wrote:
>>> On 20.04.21 12:36, Claudio Fontana wrote:
>>>> now that we protect all calls to the tcg-specific functions
>>>> with if (tcg_enabled()), we do not need the TCG stub anymore.
>>>
>>> You need compile-time checks, not runtime checks. Any calls have to be
>>> protected by #ifdef, otherwise the compiler might bail out.
>>
>> This is not true though, tcg_enabled() is #defined as 0 if tcg is not enabled.
>>
>> #define kvm_enabled()           (0)
>>
>> Compiler will elide the code if after the preprocessor pass the code is:
>>
>> if (0) {
>> }
>>
> 
> Just that we are talking about the same thing:
> 
> The following will fail to compile
> 
> void main(void)
> {
>          if (0) {
>                  return hello("Test");
>          }
> }
> 
> You at least need the prototypes. But I guess we still keep them and 
> really only remove the stubs -- which works because the linker will 
> never stumble over them.

Yes, thjs is what I am saying.

We have all the prototypes in sight, so we are good, no need to keep the stubs.

Ciao,

Claudio

