Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 572D232B5EC
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 09:26:45 +0100 (CET)
Received: from localhost ([::1]:37278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHMqC-0002Jg-CW
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 03:26:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lHMpK-0001uN-3H
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 03:25:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lHMpG-0000MB-LH
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 03:25:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614759944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O44j5F1frsL46W3nBloYlxRkpNHWMZvbdptQVyV+DdA=;
 b=fyL9KIeen4PEtLlZCHo8j/JmuUIpH0A3sQKxMWGd5xcjbiPKHaTpr6X5fV9os2Wgy6q2RB
 N+a60wfijKQ4ONp80lFa0x5xisMpJ7HU6v2s9ym+dg1m20Tlwb6eTdLbGllrcjaC9Sc3iR
 0vMUswuGvN03WM4btGLedpqTyNiiVvI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-us6Umdl_NZWC1MDd8gxAxA-1; Wed, 03 Mar 2021 03:25:41 -0500
X-MC-Unique: us6Umdl_NZWC1MDd8gxAxA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D78DD801984
 for <qemu-devel@nongnu.org>; Wed,  3 Mar 2021 08:25:40 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-79.ams2.redhat.com
 [10.36.115.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AEABE10013C1;
 Wed,  3 Mar 2021 08:25:39 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2D288113860F; Wed,  3 Mar 2021 09:25:38 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] chardev: add nodelay option
References: <20210302110444.39084-1-pbonzini@redhat.com>
 <YD4j3ajydE61gT7N@redhat.com>
 <50613db7-c8bf-ad75-ee31-c0754c70d7fd@redhat.com>
Date: Wed, 03 Mar 2021 09:25:36 +0100
In-Reply-To: <50613db7-c8bf-ad75-ee31-c0754c70d7fd@redhat.com> (Paolo
 Bonzini's message of "Tue, 2 Mar 2021 13:10:11 +0100")
Message-ID: <87pn0glk3j.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 02/03/21 12:39, Daniel P. Berrang=C3=A9 wrote:
>> On Tue, Mar 02, 2021 at 12:04:44PM +0100, Paolo Bonzini wrote:
>>> The "delay" option was introduced as a way to enable Nagle's algorithm
>>> with ",nodelay".  Since the short form for boolean options has now been
>>> deprecated, introduce a more properly named "nodelay" option.  The "del=
ay"
>>> option remains as an undocumented option.
>>>
>>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>>> ---
>>>   chardev/char-socket.c |  9 +++++++--
>>>   gdbstub.c             |  2 +-
>>>   qemu-options.hx       | 14 +++++++-------
>>>   3 files changed, 15 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/chardev/char-socket.c b/chardev/char-socket.c
>>> index 06a37c0cc8..73a7afe5a0 100644
>>> --- a/chardev/char-socket.c
>>> +++ b/chardev/char-socket.c
>>> @@ -1472,8 +1472,13 @@ static void qemu_chr_parse_socket(QemuOpts *opts=
, ChardevBackend *backend,
>>>       sock =3D backend->u.socket.data =3D g_new0(ChardevSocket, 1);
>>>       qemu_chr_parse_common(opts, qapi_ChardevSocket_base(sock));
>>>  =20
>>> -    sock->has_nodelay =3D qemu_opt_get(opts, "delay");
>>> -    sock->nodelay =3D !qemu_opt_get_bool(opts, "delay", true);
>>> +    sock->has_nodelay =3D
>>> +        qemu_opt_get(opts, "delay") ||
>>> +        qemu_opt_get(opts, "nodelay");
>>> +    sock->nodelay =3D
>>> +        !qemu_opt_get_bool(opts, "delay", true) ||
>>> +        qemu_opt_get_bool(opts, "nodelay", false);
>>=20
>> We should raise an explicit error if both options are present,
>> otherwise you get into a debate about prioritization with nonsense
>> such as
>>=20
>>     -chardev socket,.....,delay=3Don,nodelay=3Don

We then reject the phrasing

    delay=3Don,...,nodelay=3Don

while accepting the phrasings

    delay=3Don,...,delay=3Doff
    nodelay=3Doff,...,nodelay=3Don

The two clashing setting can be further apart, e.g.

    -readconfig vm1.cfg -set chardev.chr0.nodelay=3Don

where vm.cfg contains

    [chardev "chr0"]
        backend =3D "socket"
        delay =3D "on"

We may choose to declare that a feature.  Please spell it out in the
commit message then.

> Good point, we can squash this in:
>
> diff --git a/chardev/char-socket.c b/chardev/char-socket.c
> index 73a7afe5a0..c8bced76b7 100644
> --- a/chardev/char-socket.c
> +++ b/chardev/char-socket.c
> @@ -1472,6 +1472,10 @@ static void qemu_chr_parse_socket(QemuOpts *opts,=
=20
> ChardevBackend *backend,
>       sock =3D backend->u.socket.data =3D g_new0(ChardevSocket, 1);
>       qemu_chr_parse_common(opts, qapi_ChardevSocket_base(sock));
>
> +    if (qemu_opt_get(opts, "delay") && qemu_opt_get(opts, "nodelay")) {
> +        error_setg(errp, "'delay' and 'nodelay' are mutually exclusive")=
;
> +        return;
> +    }
>       sock->has_nodelay =3D
>           qemu_opt_get(opts, "delay") ||
>           qemu_opt_get(opts, "nodelay");
>
> Paolo

Please repost with a suitably tweaked commit message to get my R-by.


