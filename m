Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C94524DC04C
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 08:41:33 +0100 (CET)
Received: from localhost ([::1]:34426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUklI-0004kH-TD
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 03:41:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nUkk2-0003c3-N3
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 03:40:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nUkjz-0007GS-Gg
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 03:40:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647502810;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=runtF+D7iFcVMEdUoMtlJO9Sro3hp9WW1GYXfS/6U08=;
 b=e8EARldZUElMRyyUOIBthCI3NojZq5G+5FurKXKYRvPuEBPFbSxdr3WPd9yZu+paQp2213
 +cjnvZ1y9ZMldOwMiQVRnZkai/rmU5QEF3SGqQrUnyQzA0UrU8tDdBTCw7lNEC8GN+oFHz
 FoL6xEQyLUM4tO4RpmJ07UD9RiKCAQQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-641-Fn16V-ASOnaignnZMIelNw-1; Thu, 17 Mar 2022 03:40:07 -0400
X-MC-Unique: Fn16V-ASOnaignnZMIelNw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CBD93811E75;
 Thu, 17 Mar 2022 07:40:06 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A555C40CFD05;
 Thu, 17 Mar 2022 07:40:06 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6B7CC21E66D2; Thu, 17 Mar 2022 08:40:05 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 2/3] hw/display: Allow vga_common_init() to return errors
References: <20220316132402.1190346-1-thuth@redhat.com>
 <20220316132402.1190346-3-thuth@redhat.com>
 <64353530-4488-8820-c58c-a5e104e93b4b@gmail.com>
 <e5e03938-d602-c928-07ef-da6486fb99b0@redhat.com>
 <87bky6ugmx.fsf@pond.sub.org>
 <8e608283-b5d2-91d9-26b3-372c57422a30@redhat.com>
Date: Thu, 17 Mar 2022 08:40:05 +0100
In-Reply-To: <8e608283-b5d2-91d9-26b3-372c57422a30@redhat.com> (Thomas Huth's
 message of "Wed, 16 Mar 2022 18:05:10 +0100")
Message-ID: <87o825qb6y.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thomas Huth <thuth@redhat.com> writes:

> On 16/03/2022 15.16, Markus Armbruster wrote:
>> Thomas Huth <thuth@redhat.com> writes:
>>=20
>>> On 16/03/2022 14.32, Philippe Mathieu-Daud=C3=A9 wrote:
>>>> On 16/3/22 14:24, Thomas Huth wrote:
>>>>> The vga_common_init() function currently cannot report errors to its
>>>>> caller. But in the following patch, we'd need this possibility, so
>>>>> let's change it to take an "Error **" as parameter for this.
>>>>>
>>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>>>> ---
>>>>>  =C2=A0 hw/display/ati.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 7 ++++++-
>>>>>  =C2=A0 hw/display/cirrus_vga.c=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 7 +++=
+++-
>>>>>  =C2=A0 hw/display/cirrus_vga_isa.c |=C2=A0 7 ++++++-
>>>>>  =C2=A0 hw/display/qxl.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 6 +++++-
>>>>>  =C2=A0 hw/display/vga-isa.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 9 ++++++++-
>>>>>  =C2=A0 hw/display/vga-mmio.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 8 +++++++-
>>>>>  =C2=A0 hw/display/vga-pci.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 15 +++++++++++++--
>>>>>  =C2=A0 hw/display/vga.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 9 +++++++--
>>>>>  =C2=A0 hw/display/vga_int.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 2 +-
>>>>>  =C2=A0 hw/display/virtio-vga.c=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 7 +++=
+++-
>>>>>  =C2=A0 hw/display/vmware_vga.c=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
>>>>>  =C2=A0 11 files changed, 66 insertions(+), 13 deletions(-)
>>>>
>>>> Please setup scripts/git.orderfile :)
>>>>
>>>>> diff --git a/hw/display/vga_int.h b/hw/display/vga_int.h
>>>>> index 847e784ca6..3e8892df28 100644
>>>>> --- a/hw/display/vga_int.h
>>>>> +++ b/hw/display/vga_int.h
>>>>> @@ -156,7 +156,7 @@ static inline int c6_to_8(int v)
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return (v << 2) | (b << 1) | b;
>>>>>  =C2=A0 }
>>>>> -void vga_common_init(VGACommonState *s, Object *obj);
>>>>> +void vga_common_init(VGACommonState *s, Object *obj, Error **errp);
>>>>
>>>> Can we also return a boolean value? IIUC Markus recommended to check
>>>> a boolean return value rather than Error* handle.
>>>
>>> Really? A very quick grep shows something different:
>>>
>>> $ grep -r ^void.*Error include/ | wc -l
>>> 94
>>> $ grep -r ^bool.*Error include/ | wc -l
>>> 46
>>
>> Historical reasons.  We deviated from GLib here only to find out that
>> the deviation leads to awkward code.  I flipped the guidance in commit
>> e3fe3988d7 "error: Document Error API usage rules" (2020-07-10).  A lot
>> of old code remains.
>
> Hmm, you should add some BiteSizeTasks to our issue tracker then to
> get this fixed, otherwise people like me will copy-n-paste the bad
> code examples that are all over the place!

I'm not sure the issue tracker is a good fit here.  An issue tracker
works best when you use it to track units of work that can be completed
in one go.  An issue then tracks progress of its unit of work.

This isn't a unit, it's more like a class of units.

I added an item to https://wiki.qemu.org/ToDo/CodeTransitions for now.


