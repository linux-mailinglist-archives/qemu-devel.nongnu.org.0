Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E863A29E1
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 13:08:23 +0200 (CEST)
Received: from localhost ([::1]:38096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrIXu-0001YK-K0
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 07:08:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lrIWU-0000ep-Fr
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 07:06:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lrIWO-0008Rc-O9
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 07:06:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623323205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+BbEyH74m+6giDUAdT56wqDW979l/7DVDzy6yLaATwg=;
 b=ajAOl17TR7dWbTdoq/aZeRx8gNW7zWgOdf19cVHV5ZeR2LZ8az53sQqHkoSCHq/BcwmL2i
 jiE7yW1kKjK/RWSRkyheB6qlfKiar7SBgTRVYXuhuiDXDVRu7HYJMIpTZk9xaJ4jwnebd5
 Csg7IKmviYlR6jDrpc0/YQt3JGbWaDs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-PBAVr7W4P_eknyuDElzrag-1; Thu, 10 Jun 2021 07:06:42 -0400
X-MC-Unique: PBAVr7W4P_eknyuDElzrag-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B043E107ACF6;
 Thu, 10 Jun 2021 11:06:41 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-222.ams2.redhat.com
 [10.36.112.222])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D05DC19D7C;
 Thu, 10 Jun 2021 11:06:39 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5C1EE113865F; Thu, 10 Jun 2021 13:06:38 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [RFC PATCH v2 1/2] qapi: Inline qmp_marshal_output() functions
References: <20210609184955.1193081-1-philmd@redhat.com>
 <20210609184955.1193081-2-philmd@redhat.com>
 <20210609202952.r4nb2smrptyckvk2@redhat.com>
 <87eedadpxt.fsf@dusky.pond.sub.org>
 <4050a737-5539-c6a8-3d60-78fc9721a865@redhat.com>
Date: Thu, 10 Jun 2021 13:06:38 +0200
In-Reply-To: <4050a737-5539-c6a8-3d60-78fc9721a865@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Thu, 10 Jun 2021 12:06:50
 +0200")
Message-ID: <87r1haasht.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org, "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> On 6/10/21 11:33 AM, Markus Armbruster wrote:
>> Eric Blake <eblake@redhat.com> writes:
>>=20
>>> On Wed, Jun 09, 2021 at 08:49:54PM +0200, Philippe Mathieu-Daud=C3=A9 w=
rote:
>>>> In case we need to use QAPI types but no QAPI command / QAPI event
>>>> actually use them, the generated qmp_marshal_output() function will
>>>> trigger the compiler 'unused-function' warnings.
>>>> To prevent that, emit these functions inlined: the compiler will
>>>> ignore such unused functions.
>>>>
>>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>>>> ---
>>>> RFC: No clue about QAPI...
>>>> Tested with GCC. If the compiler is picky we could use the 'unused'
>>>> function attribute.
>>>
>>> And I have no clue if clang will warn about an unused inline function.
>>> Going with the compiler attribute seems safer and just as easy to do
>>> in the same two-line change (remember, the "unused" attribute merely
>>> means "suppress warnings if I don't use this", and not "warn me if I
>>> use it in spite of calling it unused").
>>>
>>>> ---
>>>>  scripts/qapi/commands.py | 4 ++--
>>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
>>>> index 0e13d510547..bbed776a909 100644
>>>> --- a/scripts/qapi/commands.py
>>>> +++ b/scripts/qapi/commands.py
>>>> @@ -91,8 +91,8 @@ def gen_call(name: str,
>>>>  def gen_marshal_output(ret_type: QAPISchemaType) -> str:
>>>>      return mcgen('''
>>>> =20
>>>> -static void qmp_marshal_output_%(c_name)s(%(c_type)s ret_in,
>>>> -                                QObject **ret_out, Error **errp)
>>>> +static inline void qmp_marshal_output_%(c_name)s(%(c_type)s ret_in,
>>>> +                                        QObject **ret_out, Error **er=
rp)
>>>
>>> On the other hand, the qapi generator is smart enough to only output
>>> introspection data for qapi types that were actually used by a command
>>> or event, so how is that working, and why is it not also being used to
>>> elide the generation of unused qmp_marshal_output_FOO functions?  This
>>> is where I'll have to defer to Markus.
>>=20
>> This is a QAPI generator restriction.  Let me explain.
>>=20
>> The qmp_marshal_output_T() are shared by all commands returning T.
>>=20
>> The commands may be conditional.  The user is responsible for making T's
>> 'if' the conjunction of the commands'.  See the FIXME in commands.py.
>
> Yes, I noticed the FIXME:
>
>     # FIXME: If T is a user-defined type, the user is responsible
>     # for making this work, i.e. to make T's condition the
>     # conjunction of the T-returning commands' conditions.  If T
>     # is a built-in type, this isn't possible: the
>     # qmp_marshal_output_T() will be generated unconditionally.
>
> Using inline / unused attributes don't invalidate this :)

Generating the unused attribute lets us keep types unconditional even
when the commands returning them are conditional (also takes care of the
built-in case, where we cannot make the type conditional).

However, conditional commands returning an unconditional type is a bit
of a code smell.  In this particular case, the smell seems to lead to a
(minor) issue: too much TPM code is compiled even when CONFIG_TPM is
off.  With the attribute in place, we wouldn't have learned this.

We may still find non-smelly instances of this pattern.  Until then, I'm
a bit reluctant to generate the attribute.

>> If I do this for tpm.json (appended), then tpm.h misses TpmModel when
>> CONFIG_TPM is off, and tpm_backend.h misses TpmType and TpmInfo.  I
>> suspect more TPM code needs to be guarded by CONFIG_TPM.
>
> Yes, this is what I did first, use the code below and add #ifdef'ry,
> but the code becomes ugly and harder to maintain because the enums
> are used in middle of a QOM interface structure:
>
> include/sysemu/tpm.h-37-struct TPMIfClass {
> include/sysemu/tpm.h-38-    InterfaceClass parent_class;
> include/sysemu/tpm.h-39-
> include/sysemu/tpm.h:40:    enum TpmModel model;
> include/sysemu/tpm.h-41-    void (*request_completed)(TPMIf *obj, int ret=
);
> include/sysemu/tpm.h-42-    enum TPMVersion (*get_version)(TPMIf *obj);
> include/sysemu/tpm.h-43-};
> include/sysemu/tpm.h-44-
>
> If you think using inline / unused attributes is not an option for
> QAPI, then the #ifdef'ry isn't worth it and I'd prefer use v1 which
> doesn't use conditional QAPI suggested by Marc-Andr=C3=A9.

Ignorant question: why do we want to define QOM type "tpm-if" when
CONFIG_TPM is off?

[...]


