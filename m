Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FEE53AAB89
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 08:00:40 +0200 (CEST)
Received: from localhost ([::1]:59326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltl4x-0000if-7G
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 02:00:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ltl3f-0008DW-31
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 01:59:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ltl3c-0001v4-GW
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 01:59:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623909555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BFTGZn0ek/5Z6u6z6tgNx0xG3Cw2wj2C9CT0SfGC+fg=;
 b=gr2iYclMdEDI1P9aI9v3mr9K9I6Zyd/ZiSclmjH508FeeeXiv2gvqK8YnLvVCTgvu5rSR8
 +HAtKTZd1VgFdIp/zNsJuuzDTgazNodC7P8e59lYQlVMuYQ2RtlqYK6Ko8qCYaqSx0CL+U
 gklqfJUPkpaUoclUAotO2Sh+8Q5JT1c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-WiibgDVePQOQ4DGLbJekCw-1; Thu, 17 Jun 2021 01:59:11 -0400
X-MC-Unique: WiibgDVePQOQ4DGLbJekCw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E519A801FCD;
 Thu, 17 Jun 2021 05:59:09 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-104.ams2.redhat.com
 [10.36.112.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D8245D9E2;
 Thu, 17 Jun 2021 05:59:09 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id CD933113865F; Thu, 17 Jun 2021 07:59:07 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v2 1/2] qapi/machine.json: add DEVICE_UNPLUG_ERROR QAPI
 event
References: <20210604200353.1206897-1-danielhb413@gmail.com>
 <20210604200353.1206897-2-danielhb413@gmail.com>
 <875yykr45c.fsf@dusky.pond.sub.org>
 <ef085ae4-be21-46aa-728b-9377fe48deee@gmail.com>
Date: Thu, 17 Jun 2021 07:59:07 +0200
In-Reply-To: <ef085ae4-be21-46aa-728b-9377fe48deee@gmail.com> (Daniel Henrique
 Barboza's message of "Wed, 16 Jun 2021 13:41:47 -0300")
Message-ID: <8735th6nh0.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: david@gibson.dropbear.id.au, qemu-ppc@nongnu.org, groug@kaod.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel Henrique Barboza <danielhb413@gmail.com> writes:

> On 6/11/21 9:12 AM, Markus Armbruster wrote:
>> Daniel Henrique Barboza <danielhb413@gmail.com> writes:
>> 
>>> At this moment we only provide one event to report a hotunplug error,
>>> MEM_UNPLUG_ERROR. As of Linux kernel 5.12 and QEMU 6.0.0, the pseries
>>> machine is now able to report unplug errors for other device types, such
>>> as CPUs.
>>>
>>> Instead of creating a (device_type)_UNPLUG_ERROR for each new device,
>>> create a generic DEVICE_UNPLUG_ERROR event that can be used by all
>>> unplug errors in the future.
>>>
>>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>>> ---
>>>   qapi/machine.json | 23 +++++++++++++++++++++++
>>>   1 file changed, 23 insertions(+)
>>>
>>> diff --git a/qapi/machine.json b/qapi/machine.json
>>> index 58a9c86b36..f0c7e56be0 100644
>>> --- a/qapi/machine.json
>>> +++ b/qapi/machine.json
>>> @@ -1274,3 +1274,26 @@
>>>   ##
>>>   { 'event': 'MEM_UNPLUG_ERROR',
>>>     'data': { 'device': 'str', 'msg': 'str' } }
>>> +
>>> +##
>>> +# @DEVICE_UNPLUG_ERROR:
>>> +#
>>> +# Emitted when a device hot unplug error occurs.
>>> +#
>>> +# @device: device name
>>> +#
>>> +# @msg: Informative message
>>> +#
>>> +# Since: 6.1
>>> +#
>>> +# Example:
>>> +#
>>> +# <- { "event": "DEVICE_UNPLUG_ERROR"
>>> +#      "data": { "device": "dimm1",
>>> +#                "msg": "Memory hotunplug rejected by the guest for device dimm1"
>>> +#      },
>>> +#      "timestamp": { "seconds": 1615570772, "microseconds": 202844 } }
>>> +#
>>> +##
>>> +{ 'event': 'DEVICE_UNPLUG_ERROR',
>>> +  'data': { 'device': 'str', 'msg': 'str' } }
>> 
>> Missing: update of device_add's doc comment in qdev.json:
>> 
>>      # Notes: When this command completes, the device may not be removed from the
>>      #        guest.  Hot removal is an operation that requires guest cooperation.
>>      #        This command merely requests that the guest begin the hot removal
>>      #        process.  Completion of the device removal process is signaled with a
>>      #        DEVICE_DELETED event. Guest reset will automatically complete removal
>>      #        for all devices.
>
> Ok
>
>> 
>> This sure could use some polish.
>> 
>> If I understand things correctly, we're aiming for the following device
>> unplug protocol:
>
> One thing to note is that DEVICE_UNPLUG_ERROR isn't guaranteed to be send for
> every hotunplug error. The event depends on machine/architecture support to
> detect a guest side error.

Yes.  I tried to provide for that in my description of the protocol.

>> 
>>     Unplug the device with device_del (or possibly equivalent)
>> 
>>     If we know we can't unplug the device, fail immediately.  Also emit
>>     DEVICE_UNPLUG_ERROR.
>
>
> I haven't predicted to use this event in those cases as well, although it
> seems reasonable to do so now that you mentioned it.

I think this is a matter of taste.  For what it's worth, we do emit
DEVICE_DELETED on immediate success (see next paragraph).

Emitting DEVICE_DELETED always lets QMP clients track device deletion
even when it's triggered by something else.  Feature.

No such tracking is needed for unplug failure.

>>     If possible, unplug the device synchronously and succeed.  Also emit
>>     DEVICE_DELETED.
>> 
>>     Else, initiate unplug and succeed.
>> 
>>     When unplug finishes, emit either DEVICE_DELETED or
>>     DEVICE_UNPLUG_ERROR.
>
> Since there's no 100% guarantee that DEVICE_UNPLUG_ERROR will be emitted for
> guest side errors, the wording here would be
>
> "When unplug finishes, emit DEVICE_DELETED. A DEVICE_UNPLUG_ERROR can be
> emitted if a guest side error was detected"

My assumption is that QEMU can detect asynchronous success reliably, but
not asynchronous failure.

From QEMU's point of view, "asynchronous unplug has not finished" is
indistinguishable from "asynchronous unplug finished unsuccessfully, but
we can't detect it".  So I lumped these two cases together in the next
paragraph:

>>     For some machines and devices, unplug may never finish.

My goal is a clear description of the state machine as it can be
observed in QMP.

>> Correct?
>> 
>> Any particular reason for not putting event DEVICE_UNPLUG_ERROR next to
>> DEVICE_DELETED in qdev.json?
>
>
> Not really. I looked where MEM_UNPLUG_ERROR was declared and put it right
> after it. I can change it to qdev.json near DEVICE_DELETED.

Yes, please.


