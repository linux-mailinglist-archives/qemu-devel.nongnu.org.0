Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 878483320E8
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 09:42:43 +0100 (CET)
Received: from localhost ([::1]:44340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJXww-0007jj-HA
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 03:42:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lJXwE-0007KZ-NJ
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 03:41:58 -0500
Received: from mx2.suse.de ([195.135.220.15]:48234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lJXwC-0001Xu-5M
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 03:41:58 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A2600ACC6;
 Tue,  9 Mar 2021 08:41:54 +0000 (UTC)
Subject: Re: [RFC PATCH v2] meson: Only generate trace files for selected
 targets
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20210224213515.3331631-1-philmd@redhat.com>
 <YEZU4n1IW6lSQwxl@stefanha-x1.localdomain>
 <af8022d6-c729-5033-6efa-6a1ea23ebee7@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <b9b3c6ac-e7c5-2f64-cc66-5303e6b9a2c4@suse.de>
Date: Tue, 9 Mar 2021 09:41:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <af8022d6-c729-5033-6efa-6a1ea23ebee7@redhat.com>
Content-Type: text/plain; charset=windows-1252
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/8/21 6:48 PM, Philippe Mathieu-Daudé wrote:
> On 3/8/21 5:46 PM, Stefan Hajnoczi wrote:
>> On Wed, Feb 24, 2021 at 10:35:15PM +0100, Philippe Mathieu-Daudé wrote:
>>> We don't need to generate trace files for targets we
>>> are not building. Restrict the the ones selected.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>> ---
>>>  meson.build | 16 ++++++++--------
>>>  1 file changed, 8 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/meson.build b/meson.build
>>> index 05a67c20d93..8503aa1b628 100644
>>> --- a/meson.build
>>> +++ b/meson.build
>>> @@ -1826,16 +1826,16 @@
>>>    trace_events_subdirs += [
>>>      'accel/tcg',
>>>      'hw/core',
>>> -    'target/arm',
>>> -    'target/hppa',
>>> -    'target/i386',
>>>      'target/i386/kvm',
>>
>> Please add a comment explaining why an exception is needed here and the
>> rest of the target directories are handled by the loop below when you
>> send a non-RFC patch.
> 
> Better would be a recursive function that adds the directory if
> necessary. But I'm happy adding a simple comment =)
> 
>>
>> That will help people who add sub-directories in the future.
> 
> Yes. Anyhow I expect this to clash with Claudio's work in progress
> (which split target/ and add multiple subdirectories).
> 
> 

np, just the tracedirs should be easy to solve;

I personally don't see updating a simple list as difficult for the dev; does generating trace files for all require a lot of time?

In any case, I agree that just recursing all directories in target/ looking for trace.h / traceevents files could be better.

But how much time do we spare, compared with just generating all?

Ciao,

Claudio


