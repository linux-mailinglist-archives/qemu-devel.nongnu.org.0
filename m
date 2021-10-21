Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D634364C8
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 16:51:27 +0200 (CEST)
Received: from localhost ([::1]:36644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdZPh-00030F-6U
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 10:51:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mdZMv-0001KI-RH
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 10:48:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mdZMq-00069o-6r
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 10:48:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634827706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/30n6FzWouTq3vTyM7a5C1u2jGShyBvKIXk03n/PnVU=;
 b=H7yQoDTQmRq+uBYSatE4jgD0NHABBoGhycpFmG/zAutc5i5XKf/Ugr6lENqWstSho2RcEZ
 R2x/XS5F6fRv3xXhLdyOOp7rsLkzaCtvnUZmIWezhIfC3iHYXLMyXvs+TPNXXzdtlGSO68
 Sio3BIchDYWGJ+u1BI4J+AEU3VzCstA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-jvXwudw-Msaou25Jd4dojA-1; Thu, 21 Oct 2021 10:48:23 -0400
X-MC-Unique: jvXwudw-Msaou25Jd4dojA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 04942809CD6;
 Thu, 21 Oct 2021 14:48:18 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 00801794DA;
 Thu, 21 Oct 2021 14:47:44 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7FC7211380A7; Thu, 21 Oct 2021 16:47:43 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [RFC PATCH 02/10] accel: Use qemu_security_policy_taint(), mark
 KVM and Xen as safe
References: <20210908232024.2399215-1-philmd@redhat.com>
 <20210908232024.2399215-3-philmd@redhat.com>
 <YTnj2M+lygKzdsgO@redhat.com>
Date: Thu, 21 Oct 2021 16:47:43 +0200
In-Reply-To: <YTnj2M+lygKzdsgO@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Thu, 9 Sep 2021 11:37:12 +0100")
Message-ID: <87k0i6a0z4.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Prasad J Pandit <pjp@fedoraproject.org>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Eric Blake <eblake@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 xen-devel@lists.xenproject.org, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's been a while...

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Thu, Sep 09, 2021 at 01:20:16AM +0200, Philippe Mathieu-Daud=C3=A9 wro=
te:
>> Add the AccelClass::secure_policy_supported field to classify
>> safe (within security boundary) vs unsafe accelerators.
>>=20
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>> ---
>>  include/qemu/accel.h | 5 +++++
>>  accel/kvm/kvm-all.c  | 1 +
>>  accel/xen/xen-all.c  | 1 +
>>  softmmu/vl.c         | 3 +++
>>  4 files changed, 10 insertions(+)
>>=20
>> diff --git a/include/qemu/accel.h b/include/qemu/accel.h
>> index 4f4c283f6fc..895e30be0de 100644
>> --- a/include/qemu/accel.h
>> +++ b/include/qemu/accel.h
>> @@ -44,6 +44,11 @@ typedef struct AccelClass {
>>                         hwaddr start_addr, hwaddr size);
>>  #endif
>>      bool *allowed;
>> +    /*
>> +     * Whether the accelerator is withing QEMU security policy boundary=
.
>> +     * See: https://www.qemu.org/contribute/security-process/
>> +     */
>> +    bool secure_policy_supported;
>
> The security handling policy is a high level concept that is
> open to variation over time and also by downstream distro
> vendors.

Moreover, the concept of "tainting" isn't limited to "because
security".

> At a code level we should be dealing in a more fundamental
> concept. At an accelerator level we should really jsut
> declare whether or not the accelerator impl is considered
> to be secure against malicious guest code.
>
> eg
>
>     /* Whether this accelerator is secure against execution
>      * of malciious guest machine code */
>     bool secure;

What I'd like to see is a separation of "assertions", like "not meant to
serve as security boundary", and policy.  Yes, this is vague.  Take it
as food for thought.

>>      /*
>>       * Array of global properties that would be applied when specific
>>       * accelerator is chosen. It works like MachineClass.compat_props
>> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
>> index 0125c17edb8..eb6b9e44df2 100644
>> --- a/accel/kvm/kvm-all.c
>> +++ b/accel/kvm/kvm-all.c
>> @@ -3623,6 +3623,7 @@ static void kvm_accel_class_init(ObjectClass *oc, =
void *data)
>>      ac->init_machine =3D kvm_init;
>>      ac->has_memory =3D kvm_accel_has_memory;
>>      ac->allowed =3D &kvm_allowed;
>> +    ac->secure_policy_supported =3D true;
>> =20
>>      object_class_property_add(oc, "kernel-irqchip", "on|off|split",
>>          NULL, kvm_set_kernel_irqchip,
>> diff --git a/accel/xen/xen-all.c b/accel/xen/xen-all.c
>> index 69aa7d018b2..57867af5faf 100644
>> --- a/accel/xen/xen-all.c
>> +++ b/accel/xen/xen-all.c
>> @@ -198,6 +198,7 @@ static void xen_accel_class_init(ObjectClass *oc, vo=
id *data)
>>      ac->setup_post =3D xen_setup_post;
>>      ac->allowed =3D &xen_allowed;
>>      ac->compat_props =3D g_ptr_array_new();
>> +    ac->secure_policy_supported =3D true;
>> =20
>>      compat_props_add(ac->compat_props, compat, G_N_ELEMENTS(compat));
>> =20
>> diff --git a/softmmu/vl.c b/softmmu/vl.c
>> index 92c05ac97ee..e4f94e159c3 100644
>> --- a/softmmu/vl.c
>> +++ b/softmmu/vl.c
>> @@ -2388,6 +2388,9 @@ static int do_configure_accelerator(void *opaque, =
QemuOpts *opts, Error **errp)
>>          return 0;
>>      }
>> =20
>> +    qemu_security_policy_taint(!ac->secure_policy_supported,
>> +                               "%s accelerator", acc);
>
> We need this information to be introspectable, becuase stuff printed
> to stderr is essentially opaque to libvirt and mgmt apps above.
>
> We don't have a convenient "query-accel" command but I think this
> could possibly fit into 'query-target'. ie the TargetInfo struct
> gain a field:
> =20
>
>   ##
>   # @TargetInfo:
>   #
>   # Information describing the QEMU target.
>   #
>   # @arch: the target architecture
>   # @secure: Whether the currently active accelerator for this target
>   #          is secure against execution of malicous guest code
>   #
>   # Since: 1.2
>   ##
>   { 'struct': 'TargetInfo',
>     'data': { 'arch': 'SysEmuTarget',
>               'secure': 'bool'} }

My preferred means of introspection is QAPI schema introspection.  For
QMP, that's query-qmp-schema.  For CLI, it doesn't exist, yet.

If it did, then it would tell us that (QAPIfied) -accel takes an
argument @accel of a certain enumeration type.  We could then tack
suitable feature flags to the enumeration type's values.

If we make the feature flags "special", i.e. known to QAPI, we can then
tie them to policy, like special feature flag 'deprecated' is tied to
policy configured with -compat deprecated-{input,output}=3D...

Alternatively, leave policy to the management application.

QAPI schema feature flags plus policy are is not a *complete* solution,
just like feature flag 'deprecated' and -compat are not a complete
solution for handling use of deprecated interfaces: we can and do
deprecate usage that isn't tied to a syntactic element in the QAPI
schema.  Example: commit a9b305ba291 deprecated use of socket chardev
option wait together with server=3Dtrue.

It is, however, a solution for a sizable part of the problem with useful
properties:

* In QEMU, the code is generic (handling of feature flags, policy), and
  the non-generic stuff is declarative (feature flags in the QAPI
  schema).

* No new introspection mechanism: feature flags already exist in QAPI
  schema introspection.


