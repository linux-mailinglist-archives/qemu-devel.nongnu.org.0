Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1A44B9B5E
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 09:45:37 +0100 (CET)
Received: from localhost ([::1]:35000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKcPw-0007cw-Qm
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 03:45:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nKbmh-000267-UL
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 03:05:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nKbmf-0006fN-Qs
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 03:05:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645085094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=shAqLFk08GGhzY9e2pCu0ttGCMndFcJfO8j5zj1oYyA=;
 b=CDnnHA/jew/5j56cgRF+E7xBjqWjj8hDfOeniaYUP3hAQQCM1aCTYE3wtu7kv9Xg6NTGGL
 VRwI+TXcW20vXgS1SNqdqjCt+t9Bo9lyP77A/Te1ozTKzUbHiGhe4ReFOBL/Th1Jboa04D
 ekoC+WhaHEZhPqk2ZU1pd7rWCB4HYWk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-481-bR0oVo42P4Oh8_XqywSI-A-1; Thu, 17 Feb 2022 03:04:51 -0500
X-MC-Unique: bR0oVo42P4Oh8_XqywSI-A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B27E61006AA8;
 Thu, 17 Feb 2022 08:04:49 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 112554F851;
 Thu, 17 Feb 2022 08:04:43 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9047F21A408E; Thu, 17 Feb 2022 09:04:41 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: dgilbert@redhat.com
Subject: Re: [PATCH v8 3/3] qapi/monitor: allow VNC display id in
 set/expire_password
References: <20220204101220.343526-1-f.ebner@proxmox.com>
 <20220204101220.343526-4-f.ebner@proxmox.com>
 <875ypogmkt.fsf@pond.sub.org>
 <988fcea0-b231-6a23-5c2b-e384ddaf7ef4@proxmox.com>
Date: Thu, 17 Feb 2022 09:04:41 +0100
In-Reply-To: <988fcea0-b231-6a23-5c2b-e384ddaf7ef4@proxmox.com> (Fabian
 Ebner's message of "Thu, 17 Feb 2022 08:42:29 +0100")
Message-ID: <87wnhtvrza.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: w.bumiller@proxmox.com, berrange@redhat.com, qemu-devel@nongnu.org,
 marcandre.lureau@gmail.com, kraxel@redhat.com, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, Fabian Ebner <f.ebner@proxmox.com>,
 eblake@redhat.com, t.lamprecht@proxmox.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fabian Ebner <f.ebner@proxmox.com> writes:

> Am 09.02.22 um 15:07 schrieb Markus Armbruster:
>> Fabian Ebner <f.ebner@proxmox.com> writes:
>>=20
>>> From: Stefan Reiter <s.reiter@proxmox.com>
>>>
>>> It is possible to specify more than one VNC server on the command line,
>>> either with an explicit ID or the auto-generated ones =C3=A0 la "defaul=
t",
>>> "vnc2", "vnc3", ...
>>>
>>> It is not possible to change the password on one of these extra VNC
>>> displays though. Fix this by adding a "display" parameter to the
>>> "set_password" and "expire_password" QMP and HMP commands.
>>>
>>> For HMP, the display is specified using the "-d" value flag.
>>>
>>> For QMP, the schema is updated to explicitly express the supported
>>> variants of the commands with protocol-discriminated unions.

[...]

>>> diff --git a/hmp-commands.hx b/hmp-commands.hx
>>> index 70a9136ac2..cc2f4bdeba 100644
>>> --- a/hmp-commands.hx
>>> +++ b/hmp-commands.hx
>>> @@ -1514,33 +1514,35 @@ ERST
>>> =20
>>>      {
>>>          .name       =3D "set_password",
>>> -        .args_type  =3D "protocol:s,password:s,connected:s?",
>>> -        .params     =3D "protocol password action-if-connected",
>>> +        .args_type  =3D "protocol:s,password:s,display:-dV,connected:s=
?",
>>> +        .params     =3D "protocol password [-d display] [action-if-con=
nected]",
>>>          .help       =3D "set spice/vnc password",
>>>          .cmd        =3D hmp_set_password,
>>>      },
>>> =20
>>>  SRST
>>> -``set_password [ vnc | spice ] password [ action-if-connected ]``
>>> -  Change spice/vnc password.  *action-if-connected* specifies what
>>> -  should happen in case a connection is established: *fail* makes the
>>> -  password change fail.  *disconnect* changes the password and
>>> +``set_password [ vnc | spice ] password [ -d display ] [ action-if-con=
nected ]``
>>=20
>> This is the first flag with an argument in HMP.  The alternative is
>> another optional argument.
>>=20
>> PRO optional argument: no need for PATCH 1.
>>=20
>> PRO flag with argument: can specify the display without
>> action-if-connected.
>>=20
>> Dave, this is your call to make.
>>=20
>
> I'll go ahead with v9 once the decision is made.

Dave?

[...]


