Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0FC4DB2FD
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 15:22:39 +0100 (CET)
Received: from localhost ([::1]:38396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUUXu-0003py-Uy
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 10:22:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nUUSG-00076z-AH
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 10:16:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nUUSD-000593-F8
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 10:16:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647440204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lzpIgvaDhXTl9Z8/ABXw3fAyCjFmOJhPMPHLxe+5cJo=;
 b=Dt5SBdjiBTqEHt0r/f13xK+7oZ4tspPJLmLC5AbkHp9Z1prV2Akkp/AOr1brCdr9SKv6Ms
 2r4QKQDRPd1wepHdh7SiYMThNZcWECn+fDnoZOCy+Zhxye9O+8mqd4vbCOTA7itzI7NvGm
 4mxBGR7zU5x1NeGvHRdQEaG7qnHxQkM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584-mDlmBIP0P8Sm80sUZoTF8A-1; Wed, 16 Mar 2022 10:16:39 -0400
X-MC-Unique: mDlmBIP0P8Sm80sUZoTF8A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7A876106655C;
 Wed, 16 Mar 2022 14:16:39 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 39263C4C7A4;
 Wed, 16 Mar 2022 14:16:39 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1921A21E66CE; Wed, 16 Mar 2022 15:16:38 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 2/3] hw/display: Allow vga_common_init() to return errors
References: <20220316132402.1190346-1-thuth@redhat.com>
 <20220316132402.1190346-3-thuth@redhat.com>
 <64353530-4488-8820-c58c-a5e104e93b4b@gmail.com>
 <e5e03938-d602-c928-07ef-da6486fb99b0@redhat.com>
Date: Wed, 16 Mar 2022 15:16:38 +0100
In-Reply-To: <e5e03938-d602-c928-07ef-da6486fb99b0@redhat.com> (Thomas Huth's
 message of "Wed, 16 Mar 2022 14:39:54 +0100")
Message-ID: <87bky6ugmx.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

> On 16/03/2022 14.32, Philippe Mathieu-Daud=C3=A9 wrote:
>> On 16/3/22 14:24, Thomas Huth wrote:
>>> The vga_common_init() function currently cannot report errors to its
>>> caller. But in the following patch, we'd need this possibility, so
>>> let's change it to take an "Error **" as parameter for this.
>>>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>> =C2=A0 hw/display/ati.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 7 ++++++-
>>> =C2=A0 hw/display/cirrus_vga.c=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 7 ++++++=
-
>>> =C2=A0 hw/display/cirrus_vga_isa.c |=C2=A0 7 ++++++-
>>> =C2=A0 hw/display/qxl.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 6 +++++-
>>> =C2=A0 hw/display/vga-isa.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 9 ++++++++-
>>> =C2=A0 hw/display/vga-mmio.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 8 +++++++-
>>> =C2=A0 hw/display/vga-pci.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
 15 +++++++++++++--
>>> =C2=A0 hw/display/vga.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 9 +++++++--
>>> =C2=A0 hw/display/vga_int.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 2 +-
>>> =C2=A0 hw/display/virtio-vga.c=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 7 ++++++=
-
>>> =C2=A0 hw/display/vmware_vga.c=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
>>> =C2=A0 11 files changed, 66 insertions(+), 13 deletions(-)
>>
>> Please setup scripts/git.orderfile :)
>>=20
>>> diff --git a/hw/display/vga_int.h b/hw/display/vga_int.h
>>> index 847e784ca6..3e8892df28 100644
>>> --- a/hw/display/vga_int.h
>>> +++ b/hw/display/vga_int.h
>>> @@ -156,7 +156,7 @@ static inline int c6_to_8(int v)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return (v << 2) | (b << 1) | b;
>>> =C2=A0 }
>>> -void vga_common_init(VGACommonState *s, Object *obj);
>>> +void vga_common_init(VGACommonState *s, Object *obj, Error **errp);
>>=20
>> Can we also return a boolean value? IIUC Markus recommended to check
>> a boolean return value rather than Error* handle.
>
> Really? A very quick grep shows something different:
>
> $ grep -r ^void.*Error include/ | wc -l
> 94
> $ grep -r ^bool.*Error include/ | wc -l
> 46

Historical reasons.  We deviated from GLib here only to find out that
the deviation leads to awkward code.  I flipped the guidance in commit
e3fe3988d7 "error: Document Error API usage rules" (2020-07-10).  A lot
of old code remains.

> I also can't see that recommendation in docs/devel/style.rst. I think you=
=20
> either got that wrong, or the coding style needs an update first.

It's in include/qapi/error.h:

/*
 * Error reporting system loosely patterned after Glib's GError.
 *
 * =3D Rules =3D

[...]

 * - Whenever practical, also return a value that indicates success /
 *   failure.  This can make the error checking more concise, and can
 *   avoid useless error object creation and destruction.  Note that
 *   we still have many functions returning void.  We recommend
 *   =E2=80=A2 bool-valued functions return true on success / false on fail=
ure,
 *   =E2=80=A2 pointer-valued functions return non-null / null pointer, and
 *   =E2=80=A2 integer-valued functions return non-negative / negative.

[...]

 * Call a function, receive an error from it, and pass it to the caller
 * - when the function returns a value that indicates failure, say
 *   false:
 *     if (!foo(arg, errp)) {
 *         handle the error...
 *     }
 * - when it does not, say because it is a void function:
 *     ERRP_GUARD();
 *     foo(arg, errp);
 *     if (*errp) {
 *         handle the error...
 *     }
 * More on ERRP_GUARD() below.

[...]

 * Receive an error, and handle it locally
 * - when the function returns a value that indicates failure, say
 *   false:
 *     Error *err =3D NULL;
 *     if (!foo(arg, &err)) {
 *         handle the error...
 *     }
 * - when it does not, say because it is a void function:
 *     Error *err =3D NULL;
 *     foo(arg, &err);
 *     if (err) {
 *         handle the error...
 *     }

Note that error.h's big comment I abbreviated here has some 200
non-blank lines.  It's too long and detailed for style.rst (which has
some 500 non-blank lines).  Instead style.rst points to error.h under
QEMU Specific Idioms / Error handling and reporting / Propagating
errors.


