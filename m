Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA47F269E6A
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Sep 2020 08:26:14 +0200 (CEST)
Received: from localhost ([::1]:35330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kI4Ps-0004CA-Kz
	for lists+qemu-devel@lfdr.de; Tue, 15 Sep 2020 02:26:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kI4OH-0003Z9-Hz
 for qemu-devel@nongnu.org; Tue, 15 Sep 2020 02:24:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kI4OF-0005HH-IV
 for qemu-devel@nongnu.org; Tue, 15 Sep 2020 02:24:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600151071;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+XhwcOG+5QtjbNiJoNWdIrh8/0hDLrHMffqPgdMxxb0=;
 b=QRmvqj8pmkqAmlKYPkXrk27pQKny+1x6QGzkgjIAB+6+k/KFrIITtHj9Y/gIk42zK3DI8Q
 413yIjDEjP8/c/LgA5/YFJQZ4kTYurxExKXwt03r3LxPO6bicvqFzILlWeW4xhxGreX4g2
 q+f7J0nhVtcjFl9gClti05zgbkJsoWA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-479-NtLRkGfGMc-8RPL9PCSNwg-1; Tue, 15 Sep 2020 02:24:27 -0400
X-MC-Unique: NtLRkGfGMc-8RPL9PCSNwg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3FBA41091065;
 Tue, 15 Sep 2020 06:24:26 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-66.ams2.redhat.com
 [10.36.114.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 39D1F5DC17;
 Tue, 15 Sep 2020 06:24:23 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C3D48113864A; Tue, 15 Sep 2020 08:24:21 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v5 3/8] qapi: Restrict balloon-related commands to
 machine code
References: <b9401e89-2598-74f7-5e92-885c522b7599@redhat.com>
 <CD01CCE8-2E17-4234-82E8-37DE94E62DD3@redhat.com>
 <87lfhcppsx.fsf@dusky.pond.sub.org>
 <d446f5a6-2547-b32b-75dd-f38410effc57@redhat.com>
Date: Tue, 15 Sep 2020 08:24:21 +0200
In-Reply-To: <d446f5a6-2547-b32b-75dd-f38410effc57@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Mon, 14 Sep 2020 14:15:17
 +0200")
Message-ID: <87v9gfimlm.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/15 02:10:32
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.792,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> On 9/14/20 1:21 PM, Markus Armbruster wrote:
>> David Hildenbrand <david@redhat.com> writes:
>>=20
>>>> Am 14.09.2020 um 11:42 schrieb Philippe Mathieu-Daud=C3=A9 <philmd@red=
hat.com>:
>>>>
>>>> =EF=BB=BF+Laurent and David
>>>>
>>>>> On 9/14/20 11:16 AM, Markus Armbruster wrote:
>>>>> Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:
>>>>>
>>>>>> Only qemu-system-FOO and qemu-storage-daemon provide QMP
>>>>>> monitors, therefore such declarations and definitions are
>>>>>> irrelevant for user-mode emulation.
>>>>>>
>>>>>> Restricting the balloon-related commands to machine.json
>>>>>> allows pulling less declarations/definitions to user-mode.
>>>>>
>>>>> How this affects user mode is not obvious to (ignorant) me.  Can you
>>>>> provide a clue?
>>>>
>>>> I guess this was discussed with David at some point.
>>>>
>>>> Maybe the QMP commands are not exposed via HMP, making this
>>>> code unreachable?
>>>>
>>>> Anyhow user-mode binaries don't use the memory ballooning feature,
>>>> this is specific to system-mode emulation.
>>>>
>>>> Laurent/David, do you have some more trivial explanation?
>>>
>>> Agreed.
>>>
>>> No memory ballooning device -> no memory ballooning :)
>>=20
>> I understand why user mode doesn't need device models.  What I don't
>> understand offhand is how balloon-related stuff in misc.json ends up
>> pulling "declarations/definitions to user-mode".  What exactly is being
>> pulled where before the series, and no more afterwards?
>>=20
>> Is it just the code generated for the QAPI stuff you move, or is it
>> more?
>
> As of this series, this is only QAPI generated code.
> (code which pulls in unwanted declarations/definitions
> that should be poisoned, but we can't because of this).
>
> I didn't feel the need to enumerate what is removed from
> user-mode, because from the diff (and no link failure)
> I thought it was obvious. I can do, but that would be
> simply copy/pasting the QAPI changes.

Suggest to replace "pulling less declarations/definitions to user-mode"
by "pulling less QAPI-generated code into user-mode" in all the commit
messages.

> Part 3 start to remove things, but I kept that separated.

That's okay.


