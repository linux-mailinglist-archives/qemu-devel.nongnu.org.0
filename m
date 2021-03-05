Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C3032EBF9
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 14:19:31 +0100 (CET)
Received: from localhost ([::1]:38322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIAMZ-0000r9-OH
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 08:19:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lIALW-0000MV-8U
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 08:18:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lIALS-0006gH-3Q
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 08:18:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614950296;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kwI9KRXfcBjrHNOplvi5fLqkFOwR2iYlSLY5v5GUjSI=;
 b=O7T2uJLOStWef76AIie6T1W44gMNLG/FyuN66SUA4ImLzVzE1rb+ydN8WliCjtl7oA7/uN
 nB7rq8Qm7Uct3DlrRAvgISOfWVbYekF4T7yFfHQFShC2oFxlet3hQS/AZLB4pjq5pHWiCv
 WV10R3GlbeJAfirQdy9bX37Wz0WFVlA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-565-qzbqcB6RMVmkLMFODE-6Eg-1; Fri, 05 Mar 2021 08:18:14 -0500
X-MC-Unique: qzbqcB6RMVmkLMFODE-6Eg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 514C680006E;
 Fri,  5 Mar 2021 13:18:13 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-83.phx2.redhat.com
 [10.3.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EAE3D5D6B1;
 Fri,  5 Mar 2021 13:18:09 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 75E001132C12; Fri,  5 Mar 2021 14:18:08 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH 3/3] qapi: provide a friendly string representation of
 QAPI classes
References: <20210302175524.1290840-1-berrange@redhat.com>
 <20210302175524.1290840-4-berrange@redhat.com>
Date: Fri, 05 Mar 2021 14:18:08 +0100
In-Reply-To: <20210302175524.1290840-4-berrange@redhat.com> ("Daniel
 P. =?utf-8?Q?Berrang=C3=A9=22's?= message of "Tue, 2 Mar 2021 17:55:24
 +0000")
Message-ID: <87lfb120z3.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> If printing a QAPI schema object for debugging we get the classname and
> a hex value for the instance. With this change we instead get the
> classname and the human friendly name of the QAPI type instance.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  scripts/qapi/schema.py | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
> index ff16578f6d..800bc5994b 100644
> --- a/scripts/qapi/schema.py
> +++ b/scripts/qapi/schema.py
> @@ -46,6 +46,9 @@ def __init__(self, name: str, info, doc, ifcond=3DNone,=
 features=3DNone):
>          self.features =3D features or []
>          self._checked =3D False
> =20
> +    def __repr__(self):
> +        return "%s<%s>" % (type(self).__name__, self.name)
> +
>      def c_name(self):
>          return c_name(self.name)

https://docs.python.org/3.6/reference/datamodel.html#object.__repr__

    Called by the repr() built-in function to compute the =E2=80=9Cofficial=
=E2=80=9D
    string representation of an object.  If at all possible, this should
    look like a valid Python expression that could be used to recreate
    an object with the same value (given an appropriate environment).

Making QAPISchemaEntity.__repr__() return "a valid Python expression
that could be used to recreate an object with the same value" is
probably more trouble than it's worth.

    If this is not possible, a string of the form <...some useful
    description...> should be returned.

I'm afraid your .__repr__() has the < in the wrong place.

                                         The return value must be a
    __repr__() is also used when an =E2=80=9Cinformal=E2=80=9D string repre=
sentation of
    instances of that class is required.

    This is typically used for debugging, so it is important that the
    representation is information-rich and unambiguous.


I guess your .__repr__() is unambiguous enough for practical purposes,
as entity names are typically unique within a schema.  *Except* for
QAPISchemaInclude, where self.name is always None.

What about self.name or id(self)?


