Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8C21F1550
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Jun 2020 11:20:41 +0200 (CEST)
Received: from localhost ([::1]:45596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jiDxQ-0003d4-9p
	for lists+qemu-devel@lfdr.de; Mon, 08 Jun 2020 05:20:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jiDsf-0000F7-Ep
 for qemu-devel@nongnu.org; Mon, 08 Jun 2020 05:15:45 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:49945
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jiDse-0006k4-LV
 for qemu-devel@nongnu.org; Mon, 08 Jun 2020 05:15:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591607742;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G7ulp+rX88EJ5Xv4a/aYi7fb2lufDjo+gUvH7YpnZc0=;
 b=Mr37GIChmoidXkfpPLDeenEJ7PujCvpXiLqd1xGloGM11dOiQF5JSwLU11MAegoxIL+yEN
 xZKYmlMeFxvBPYDP2KsYZdeSGsSv3H5cY6XZE0xwNi49XWpPdDte3fDBbFlcYFoM4JpeVU
 2ukFpJoVx030Dtov1tCHt5ysIW9+HgA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-450-yBPukRNNPEmrLZj3EepWiw-1; Mon, 08 Jun 2020 05:15:38 -0400
X-MC-Unique: yBPukRNNPEmrLZj3EepWiw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AFADF1854C49;
 Mon,  8 Jun 2020 09:15:37 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3AF3D5D9C9;
 Mon,  8 Jun 2020 09:15:33 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C0A6F11386A6; Mon,  8 Jun 2020 11:15:31 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH] or1k: Fix compilation hiccup
References: <20200526185132.1652355-1-eblake@redhat.com>
 <m1d06msod9.fsf@redhat.com>
 <CAFEAcA9Huery0AeUFsLVrcK4bUGibg1f-m8gMuMiJgnr+Hj7CA@mail.gmail.com>
 <87eeqx9alv.fsf@dusky.pond.sub.org>
 <873676ksbb.fsf@dusky.pond.sub.org>
 <09123e95-b1c1-be7b-1aa8-f68f99417b28@redhat.com>
Date: Mon, 08 Jun 2020 11:15:31 +0200
In-Reply-To: <09123e95-b1c1-be7b-1aa8-f68f99417b28@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Mon, 8 Jun 2020 08:22:17
 +0200")
Message-ID: <87tuzlj4uk.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.61; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/08 01:20:45
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jia Liu <proljc@gmail.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Christophe de Dinechin <dinechin@redhat.com>,
 Stafford Horne <shorne@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> On 6/8/20 8:03 AM, Markus Armbruster wrote:
>> Markus Armbruster <armbru@redhat.com> writes:
>>=20
>>> Peter Maydell <peter.maydell@linaro.org> writes:
>>>
>>>> On Fri, 29 May 2020 at 17:23, Christophe de Dinechin
>>>> <dinechin@redhat.com> wrote:
>>>>> On 2020-05-26 at 20:51 CEST, Eric Blake wrote...
>>>>>> diff --git a/hw/openrisc/openrisc_sim.c b/hw/openrisc/openrisc_sim.c
>>>>>> index d08ce6181199..95011a8015b4 100644
>>>>>> --- a/hw/openrisc/openrisc_sim.c
>>>>>> +++ b/hw/openrisc/openrisc_sim.c
>>>>>> @@ -129,7 +129,7 @@ static void openrisc_sim_init(MachineState *mach=
ine)
>>>>>>      const char *kernel_filename =3D machine->kernel_filename;
>>>>>>      OpenRISCCPU *cpu =3D NULL;
>>>>>>      MemoryRegion *ram;
>>>>>> -    qemu_irq *cpu_irqs[2];
>>>>>> +    qemu_irq *cpu_irqs[2] =3D {};
>>>>>
>>>>> Why is the value [2] correct here? The loop that initializes loops ov=
er
>>>>> machine->smp.cpus. Is it always less than 2 on this machine?
>>>>
>>>> Yes: openrisc_sim_machine_init() sets mc->max_cpus =3D 2.
>>>> My suggestion of adding an assert() is essentially telling the
>>>> compiler that indeed smp_cpus must always be in the range [1,2],
>>>> which we can tell but it can't.
>>>
>>> Do we have a proper patch for this on the list?
>>=20
>> Apparently not.
>>=20
>> Philippe did try Peter's suggestion, found it works, but then posted it
>> only to Launchpad.  Philippe, please post to the list, so we can finally
>> get this fixed.
>
> Sorry since it was Eric finding, I didn't understood I had to post it.
> Will do.

You didn't *have* to, but it'll help if you do :)


