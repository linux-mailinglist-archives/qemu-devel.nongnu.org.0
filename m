Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C973A13A1
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 14:00:09 +0200 (CEST)
Received: from localhost ([::1]:34710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqwsT-0007KM-26
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 08:00:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lqwrI-0006S7-QM
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 07:58:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lqwrG-0004rP-SK
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 07:58:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623239934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V8tyxxcAYpa83qpatDMd0uJjULBtRmwb7HYcI1mWBF0=;
 b=G9X3sOM7+GGTP4pssr9sVpr1H0jtLdaDZuUigRKx/DJm2hza1W1J7O82lcD6wSjC3Qqge7
 U77GQuaCSUMh7D+787+LR4V/qrpBtUshAuSgXzc0VBD2z68nb5W0t7NTHh4x4uV+Ai+xKG
 BYyAUvy+m3ere7qsUrcBKPZe5kOeCvE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-ESST1H32ODK8kvHx0vIXhw-1; Wed, 09 Jun 2021 07:58:53 -0400
X-MC-Unique: ESST1H32ODK8kvHx0vIXhw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F1FBF1922023;
 Wed,  9 Jun 2021 11:58:51 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-222.ams2.redhat.com
 [10.36.112.222])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9BCF9620DE;
 Wed,  9 Jun 2021 11:58:51 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 37B42113865F; Wed,  9 Jun 2021 13:58:50 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v8 02/12] accel: Introduce 'query-accels' QMP command
References: <20210526170432.343588-1-philmd@redhat.com>
 <20210526170432.343588-3-philmd@redhat.com>
 <af5b2b3a-e223-c8dd-91eb-51f9813d82ae@redhat.com>
 <9613547f-2e68-1bb9-5be8-c77f8c5c148f@redhat.com>
Date: Wed, 09 Jun 2021 13:58:50 +0200
In-Reply-To: <9613547f-2e68-1bb9-5be8-c77f8c5c148f@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 8 Jun 2021 15:38:32
 +0200")
Message-ID: <87mtrzp7ut.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> On 6/8/21 3:27 PM, Thomas Huth wrote:
>> On 26/05/2021 19.04, Philippe Mathieu-Daud=C3=A9 wrote:
>>> Introduce the 'query-accels' QMP command which returns a list
>>> of built-in accelerator names.
>>>
>>> - Accelerator is a QAPI enum of all existing accelerators,
>>>
>>> - AcceleratorInfo is a QAPI structure providing accelerator
>>> =C2=A0=C2=A0 specific information. Currently the common structure base
>>> =C2=A0=C2=A0 provides the name of the accelerator, while the specific
>>> =C2=A0=C2=A0 part is empty, but each accelerator can expand it.
>>>
>>> - 'query-accels' QMP command returns a list of @AcceleratorInfo
>>>
>>> For example on a KVM-only build we get:
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0 { "execute": "query-accels" }
>>> =C2=A0=C2=A0=C2=A0=C2=A0 {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "return": [
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 "name": "qtest"
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 },
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 "name": "kvm"
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 }
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ]
>>> =C2=A0=C2=A0=C2=A0=C2=A0 }
>>>
>>> Reviewed-by: Eric Blake <eblake@redhat.com>
>>> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>> Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>>> ---
>>> v8:
>>> - Include code snippet from Markus adding to machine-target.json
>>> =C2=A0=C2=A0 to be able to use enum values or union branches conditiona=
l.
>>> - Use accel_find() on enum to be sure the accelerator is enabled
>>> =C2=A0=C2=A0 at runtime (chat with jsnow / eblake).
>>>
>>> Cc: Eric Blake <eblake@redhat.com>
>>> Cc: John Snow <jsnow@redhat.com>
>>> Cc: Markus Armbruster <armbru@redhat.com>
>>> ---
>>> =C2=A0 qapi/machine-target.json | 54 ++++++++++++++++++++++++++++++++++=
++++++
>>> =C2=A0 accel/accel-qmp.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 32=
 ++++++++++++++++++++++++
>>> =C2=A0 accel/meson.build=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 2 +-
>>> =C2=A0 3 files changed, 87 insertions(+), 1 deletion(-)
>>> =C2=A0 create mode 100644 accel/accel-qmp.c
>>>
>>> diff --git a/qapi/machine-target.json b/qapi/machine-target.json
>>> index e7811654b72..586a61b5d99 100644
>>> --- a/qapi/machine-target.json
>>> +++ b/qapi/machine-target.json
>>> @@ -329,3 +329,57 @@
>>> =C2=A0 ##
>>> =C2=A0 { 'command': 'query-cpu-definitions', 'returns': ['CpuDefinition=
Info'],
>>> =C2=A0=C2=A0=C2=A0 'if': 'defined(TARGET_PPC) || defined(TARGET_ARM) ||
>>> defined(TARGET_I386) || defined(TARGET_S390X) || defined(TARGET_MIPS)' =
}
>>> +
>>> +##
>>> +# @Accelerator:
>>> +#
>>> +# An enumeration of accelerator names.
>>> +#
>>> +# Since: 6.1
>>> +##
>>> +{ 'enum': 'Accelerator',
>>> +=C2=A0 'data': [
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { 'name': 'hax', 'if': 'defined(CONFIG_=
HAX)' },
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { 'name': 'hvf', 'if': 'defined(CONFIG_=
HVF)' },
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { 'name': 'kvm', 'if': 'defined(CONFIG_=
KVM)' },
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { 'name': 'qtest' },
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { 'name': 'tcg', 'if': 'defined(CONFIG_=
TCG)' },
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { 'name': 'whpx', 'if': 'defined(CONFIG=
_WHPX)' },
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { 'name': 'xen', 'if': 'defined(CONFIG_=
XEN_BACKEND)' } ] }
>>> +
>>> +##
>>> +# @AcceleratorInfo:
>>> +#
>>> +# Accelerator information.
>>> +#
>>> +# @name: The accelerator name.
>>> +#
>>> +# Since: 6.1
>>> +##
>>> +{ 'struct': 'AcceleratorInfo',
>>> +=C2=A0 'data': { 'name': 'Accelerator' } }
>>> +
>>> +##
>>> +# @query-accels:
>>> +#
>>> +# Get a list of AcceleratorInfo for all built-in accelerators.
>>> +#
>>> +# Returns: a list of @AcceleratorInfo describing each accelerator.
>>> +#
>>> +# Since: 6.1
>>> +#
>>> +# Example:
>>> +#
>>> +# -> { "execute": "query-accels" }
>>> +# <- { "return": [
>>> +#=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
>>> +#=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "n=
ame": "qtest"
>>> +#=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>>> +#=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
>>> +#=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "n=
ame": "kvm"
>>> +#=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> +#=C2=A0=C2=A0=C2=A0 ] }
>>> +#
>>> +##
>>> +{ 'command': 'query-accels',
>>> +=C2=A0 'returns': ['AcceleratorInfo'] }
>>=20
>> What about Markus' comment here:
>>=20
>> =C2=A0https://lore.kernel.org/qemu-devel/87mtsoieyz.fsf@dusky.pond.sub.o=
rg/
>>=20
>> ?
>>=20
>> If I've got him right, you don't need the command at all, the Accelerato=
r
>> enum should be sufficient?
>
> Yes, this is the part jsnow said "we are waiting for Markus to comment"
> on the other thread ;) We'd like to only have enums, but QAPI doesn't
> seem to allow a "leaf without branch", we need a command or struct to
> use the enum else it is elided.

Correct; query-qmp-schema shows only the stuff used by commands and
events.

>                                 Or maybe we didn't understood Markus
> idea.


