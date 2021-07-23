Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 689D33D36F6
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 10:43:54 +0200 (CEST)
Received: from localhost ([::1]:40914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6qmf-0008J3-H9
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 04:43:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m6qln-0007dp-Th
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 04:42:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m6qll-0003k8-0O
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 04:42:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627029776;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cK7B+bXVMGNqB62PDnz2JLMxK0HvWRXU11yLc1JzD5U=;
 b=eKmmdjR7iOlVbPqUy7fClrco6J+UqCgZvjdoyfzvmQ/lOWvSm6+v9sMuhnHkXKIOtH5ZRo
 BrmBXvo7fII+v1qrZRs0zQa2ALzEE1/PJpt74R8qDjAFC+oi9wa5VAAyXcqB43/17WiyYP
 dhy5qoQa14m2EmB/VLXEZfzhhHWBl9M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-uzVkB5WkN3OzMg84c7T_ZQ-1; Fri, 23 Jul 2021 04:42:54 -0400
X-MC-Unique: uzVkB5WkN3OzMg84c7T_ZQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A0DA6107BA59
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 08:42:53 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-187.ams2.redhat.com
 [10.36.114.187])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 30DD126DFB;
 Fri, 23 Jul 2021 08:42:49 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id AE44D11326B9; Fri, 23 Jul 2021 10:42:47 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 1/2] qxl: remove assert in qxl_pre_save.
References: <20210721093347.338536-1-kraxel@redhat.com>
 <20210721093347.338536-2-kraxel@redhat.com> <YPmEZnBuCMwXq98p@work-vm>
 <20210723063233.ktjex5knfgz77pbq@sirius.home.kraxel.org>
 <13c8a40f-a879-a981-12f0-36a5289b39b1@redhat.com>
 <20210723065527.glqc44gyga2lnqyc@sirius.home.kraxel.org>
 <0196b381-47ca-fb37-d809-e2a25f3c677e@redhat.com>
Date: Fri, 23 Jul 2021 10:42:47 +0200
In-Reply-To: <0196b381-47ca-fb37-d809-e2a25f3c677e@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Fri, 23 Jul 2021 09:34:49
 +0200")
Message-ID: <87im11beuw.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> On 7/23/21 8:55 AM, Gerd Hoffmann wrote:
>> On Fri, Jul 23, 2021 at 08:47:09AM +0200, Philippe Mathieu-Daud=C3=A9 wr=
ote:
>>> On 7/23/21 8:32 AM, Gerd Hoffmann wrote:
>>>> On Thu, Jul 22, 2021 at 03:44:54PM +0100, Dr. David Alan Gilbert wrote=
:
>>>>> * Gerd Hoffmann (kraxel@redhat.com) wrote:
>>>>>> Since commit 551dbd0846d2 ("migration: check pre_save return in
>>>>>> vmstate_save_state") the pre_save hook can fail.  So lets finally
>>>>>> use that to drop the guest-triggerable assert in qxl_pre_save().
>>>>>>
>>>>>> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
>>>>>> ---
>>>>>>  hw/display/qxl.c | 4 +++-
>>>>>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/hw/display/qxl.c b/hw/display/qxl.c
>>>>>> index 84f99088e0a0..3867b94fe236 100644
>>>>>> --- a/hw/display/qxl.c
>>>>>> +++ b/hw/display/qxl.c
>>>>>> @@ -2283,7 +2283,9 @@ static int qxl_pre_save(void *opaque)
>>>>>>      } else {
>>>>>>          d->last_release_offset =3D (uint8_t *)d->last_release - ram=
_start;
>>>>>>      }
>>>>>> -    assert(d->last_release_offset < d->vga.vram_size);
>>>>>> +    if (d->last_release_offset < d->vga.vram_size) {
>>>>>> +        return 1;
>>>>>
>>>>> It would be great if there was an error_report or something there
>>>>> so that we get some idea of what happened.
>>>>
>>>> Hmm.  Strictly speaking qemu_log_mask(LOG_GUEST_ERROR, "..."); would b=
e
>>>> the correct approach here, but I guess that wouldn't help much for
>>>> trouble-shooting as the message would only show up with "-d
>>>> guest_errors".  So better make that error_report("...") ?
>>>
>>> It depends who is interested in such errors.
>>=20
>> Migration fails and you want know why.
>>=20
>> Reason migration fails is the guest violates qxl specs (which doesn't
>> cause actual problems unless you want migrate the guest).
>
> Then I agree error_report() is better ("Report an error to the current
> monitor if we have one, else stderr").

No good for QMP, I'm afraid.

error_report() reports to stderr in QMP monitor context.  To get an
error to the QMP client, you need to use error_setg() and propagate all
the way to the QMP core.

Back to the patch.  If the thing we report is actually an *error*,
i.e. something that makes migration fail, then the QMP failure will
contain an error message.  That error must come from further up the call
stack.  If it's good enough, we don't need error_report() here.  Else,
we should error_setg() here.

If it's not actually an error, then error_report() is wrong.
warn_report() might be right.


