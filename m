Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F632C689F
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 16:21:09 +0100 (CET)
Received: from localhost ([::1]:52168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kifYa-0000YO-Kt
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 10:21:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kifCX-0008K2-Gn
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 09:58:21 -0500
Received: from mx2.suse.de ([195.135.220.15]:57862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kifCS-0007Rp-EZ
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 09:58:21 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B0626AC55;
 Fri, 27 Nov 2020 14:58:14 +0000 (UTC)
Subject: Re: [PATCH v2 2/6] accel: accel_available() function
To: Markus Armbruster <armbru@redhat.com>
References: <20201125205636.3305257-1-ehabkost@redhat.com>
 <20201125205636.3305257-3-ehabkost@redhat.com>
 <12f82771-9db9-8fcd-ea25-736428d2650a@suse.de>
 <20201126133645.GG2271382@habkost.net>
 <8d90d611-6545-a478-1316-542dc5424b92@suse.de>
 <f4f64154-9fbb-36fa-d9cb-e49c8ed06537@redhat.com>
 <7df7713c-5125-9e41-3572-a476cad2946b@suse.de>
 <20201126214810.GR2271382@habkost.net>
 <55ed249f-9fd3-fe3d-c63a-8d74803a72ca@suse.de>
 <87y2imq2ni.fsf@dusky.pond.sub.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <573ed53e-fe9e-895b-bb15-3058089d9b5f@suse.de>
Date: Fri, 27 Nov 2020 15:58:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <87y2imq2ni.fsf@dusky.pond.sub.org>
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/27/20 3:45 PM, Markus Armbruster wrote:
> Claudio Fontana <cfontana@suse.de> writes:
> 
>> On 11/26/20 10:48 PM, Eduardo Habkost wrote:
>>> On Thu, Nov 26, 2020 at 10:06:03PM +0100, Claudio Fontana wrote:
>>>> On 11/26/20 3:25 PM, Paolo Bonzini wrote:
>>>>> On 26/11/20 15:13, Claudio Fontana wrote:
>>>>>> One option I see is simply to document the behavior where
>>>>>> accel_available() is declared in accel.h (ie do not use in fast
>>>>>> path), as well as in accel_find() actually, so that both accel_find()
>>>>>> and accel_available() are avoided in fast path and avoid being called
>>>>>> frequently at runtime.
>>>>>>
>>>>>> Another option could be to remove the allocation completely, and use
>>>>>> for example accel_find(ACCEL_CLASS_NAME("tcg")), or another option
>>>>>> again would be to remove the allocation and use either a fixed buffer
>>>>>> + snprintf, or alloca -like builtin code to use the stack, ...
>>>>>>
>>>>>> Not a big deal, but with a general utility and short name like
>>>>>> accel_available(name) it might be tempting to use this more in the
>>>>>> future?
>>>>>
>>>>> I think it's just that the usecase is not that common.  "Is this 
>>>>> accelerator compiled in the binary" is not something you need after 
>>>>> startup (or if querying the monitor).
>>>>>
>>>>> Paolo
>>>>>
>>>>>
>>>>
>>>> A script that repeatedly uses the QMP interface to query for
>>>> the status could generate fragmentation this way I think.
>>>
>>> Is this a problem?  Today, execution of a "query-kvm" command
>>> calls g_malloc() 37 times.
>>>
>>
>> Not ideal in my view, but not the end of the world either.
> 
> QMP's appetite for malloc is roughly comparable to a pig's for truffles.
> 

:-)

Btw, do we have limits on the maximum size of these objects? I mean, a single QMP command,
a single QEMU object type name, etc?

In this case we could do some overall improvement there, and might even avoid some problems down the road..

Ciao,

Claudio

