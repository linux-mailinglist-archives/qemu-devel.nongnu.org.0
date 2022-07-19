Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE735796AF
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 11:51:14 +0200 (CEST)
Received: from localhost ([::1]:56310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDjsm-0003tZ-Ab
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 05:51:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oDjqA-0001xy-N6
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 05:48:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oDjq8-0002zw-GP
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 05:48:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658224107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l7WWsyuERWVMcMo5bJGg2qaqV77pj+zdsoj9DSNOB+Q=;
 b=CNPKsTPH96tzc+QzO/BQ+T/CuJBJCQVH9ibgpAZiYWi/hheLf9qBHyc+7ha1r7oHWGoUiz
 ckPfSIlhmcc0sDJagDQXluhZ8fYpVwjF73IzVWL771qxawXG0GgCR1XduTqSUcm7YV4vBl
 ElazvpDJIGBFFxb04nBzjCGJ6CKfAAg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-82-e0qQVLTkNpmDjUVtQdiTfA-1; Tue, 19 Jul 2022 05:48:24 -0400
X-MC-Unique: e0qQVLTkNpmDjUVtQdiTfA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0292B3C025C1;
 Tue, 19 Jul 2022 09:48:24 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.194.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CD7042166B26;
 Tue, 19 Jul 2022 09:48:23 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9B28021E690D; Tue, 19 Jul 2022 11:48:22 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Het Gala <het.gala@nutanix.com>
Cc: qemu-devel@nongnu.org,  quintela@redhat.com,  dgilbert@redhat.com,
 pbonzini@redhat.com,  berrange@redhat.com,  eblake@redhat.com,  Manish
 Mishra <manish.mishra@nutanix.com>
Subject: Re: [PATCH 1/4] Modifying =?utf-8?B?4oCYbWlncmF0ZeKAmQ==?= qmp
 command to add multi-FD
 socket on particular source and destination pair
References: <20220609073305.142515-1-het.gala@nutanix.com>
 <20220609073305.142515-2-het.gala@nutanix.com>
 <87h73ees2r.fsf@pond.sub.org>
 <06e02954-f94d-0508-90f1-a8610e1a09cf@nutanix.com>
 <877d4a7ang.fsf@pond.sub.org>
 <c3792d65-b24c-be02-f988-fa1c0e27d490@nutanix.com>
 <8735ex1t01.fsf@pond.sub.org>
 <57b8de99-fcf9-e015-eeb5-cdc14544d721@nutanix.com>
Date: Tue, 19 Jul 2022 11:48:22 +0200
In-Reply-To: <57b8de99-fcf9-e015-eeb5-cdc14544d721@nutanix.com> (Het Gala's
 message of "Tue, 19 Jul 2022 13:21:34 +0530")
Message-ID: <87r12hxwk9.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Het Gala <het.gala@nutanix.com> writes:

> On 19/07/22 12:36 pm, Markus Armbruster wrote:
>> Het Gala <het.gala@nutanix.com> writes:
>>
>>> On 18/07/22 8:03 pm, Markus Armbruster wrote:
>>>> Het Gala <het.gala@nutanix.com> writes:
>>>>
>>>>> On 18/07/22 2:05 pm, Markus Armbruster wrote:
>>>>>> Het Gala <het.gala@nutanix.com> writes:
>>>>>>
>>>>>>> i) Modified the format of the qemu monitor command : 'migrate' by a=
dding a list,
>>>>>>>       each element in the list consists of multi-FD connection para=
meters: source
>>>>>>>       and destination uris and of the number of multi-fd channels b=
etween each pair.
>>>>>>>
>>>>>>> ii) Information of all multi-FD connection parameters=E2=80=99 list=
, length of the list
>>>>>>>        and total number of multi-fd channels for all the connection=
s together is
>>>>>>>        stored in =E2=80=98OutgoingArgs=E2=80=99 struct.
>>>>>>>
>>>>>>> Suggested-by: Manish Mishra <manish.mishra@nutanix.com>
>>>>>>> Signed-off-by: Het Gala <het.gala@nutanix.com>
>>>>>>> ---
>> [...]
>>
>>>>>>> diff --git a/migration/socket.c b/migration/socket.c
>>>>>>> index 4fd5e85f50..7ca6af8cca 100644
>>>>>>> --- a/migration/socket.c
>>>>>>> +++ b/migration/socket.c
>>>>>>> @@ -32,6 +32,17 @@ struct SocketOutgoingArgs {
>>>>>>>         SocketAddress *saddr;
>>>>>>>     } outgoing_args;
>>>>>>>
>>>>>>> +struct SocketArgs {
>>>>>>> +    struct SrcDestAddr data;
>>>>>>> +    uint8_t multifd_channels;
>>>>>>> +};
>>>>>>> +
>>>>>>> +struct OutgoingMigrateParams {
>>>>>>> +    struct SocketArgs *socket_args;
>>>>>>> +    size_t length;
>>>>>> Length of what?
>>>>> length of the socket_args[] array. Thanks for pointing it out. I will
>>>>> be more specific for this variable in the v2 patchset series.
>>>>>
>>>>>>> +    uint64_t total_multifd_channel;
>>>>>> @total_multifd_channels appears to be the sum of the
>>>>>> socket_args[*].multifd_channels.  Correct?
>>>>> Yes Markus, you are correct.
>>>> Sure you need to keep the sum separately?
>>> So earlier, the idea behind this was that, we had this intention to dep=
reciate the migrate_multifd_channels() API from the live migration
>>> process. We made total_multifd_channels() function, where it used to ca=
lculate total number of multifd channels every time, for whichever
>>> function called was computation internsive so we replaced it by returni=
ng sum of socket_args[*].multifd_channels i.e.
>>> total_multifd_channel in the later patches.
>>>
>>>  =C2=A0But now in the v2 patchset onwards, Thanks to inputs from Dr. Da=
vid and Daniel, we are not depricating migrate_multifd_channels() API but
>>> the value from the API will be cross-referenced with sum of socket_args=
[*].multifd_channels i.e. total_multifd_channel, and error if
>>> they are not equal.
>> I'm afraid I don't understand.  I'm not sure I have to.  Let me loop
>> back to my question.
>>
>> If @total_multifd_channel is always the sum of the
>> socket_args[*].multifd_channels, then you can always compute it on the
>> fly.
>>
>> I.e. you can replace @total_multifd_channel by a function that returns
>> the sum.
>>
>> Precomputing it instead is more complex, because then you need to
>> document that the two are the same.  Also, bug oppertunity: letting them
>> deviate somehow.  I figure that's worthwhile only if computing on the
>> fly is too expensive.
>> Okay, I understand your concern. I am okay with your approach too, but t=
hese things are not expected to change out of qmp command context.=20
>
> So is keeping @total_multifd_channel variable should be fine? or making a=
 function is better?

I recommend making it a function unless we need a variable for
performance.

[...]


