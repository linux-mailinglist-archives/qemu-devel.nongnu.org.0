Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D130440398D
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 14:13:59 +0200 (CEST)
Received: from localhost ([::1]:38538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNwSk-0007af-UX
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 08:13:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mNwQ3-0004Sx-Hd
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 08:11:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mNwPy-0007Mv-FC
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 08:11:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631103065;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SlYkcfcVoIPhsfDxDu4bvj144/+v55bY6WT/P18PWoI=;
 b=NJf2U4ZBhQ6hY25bTXncCQ8hs73CFogpbz+Cl5/zGCTxdhPa0ZdsOckV//O7Rr54i/Y3vW
 +oNEkIYPNRE28jzJsalw9OCu1JCXylXr3h1P9cj50oLD/y1GcOdCTa9xZhLgeixBkZI601
 r6ScCtaZ2DHrswlCBywg3EPTon8BujA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-ixEDMlLxPuiyP_AxST86Lw-1; Wed, 08 Sep 2021 08:11:02 -0400
X-MC-Unique: ixEDMlLxPuiyP_AxST86Lw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 32DD51835AC8
 for <qemu-devel@nongnu.org>; Wed,  8 Sep 2021 12:11:02 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-13.ams2.redhat.com
 [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BC85860CD1;
 Wed,  8 Sep 2021 12:10:52 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4BF941138606; Wed,  8 Sep 2021 14:10:51 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [RFC v3 03/32] scripts/qapi: teach c_param_type() to return
 const argument type
References: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
 <20210907121943.3498701-4-marcandre.lureau@redhat.com>
Date: Wed, 08 Sep 2021 14:10:51 +0200
In-Reply-To: <20210907121943.3498701-4-marcandre.lureau@redhat.com> (marcandre
 lureau's message of "Tue, 7 Sep 2021 16:19:14 +0400")
Message-ID: <87v93bw9mc.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: pbonzini@redhat.com, berrange@redhat.com, qemu-devel@nongnu.org,
 stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

marcandre.lureau@redhat.com writes:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> The argument isn't owned by the callee, so it better be const.
> But a lot of code in QEMU rely on non-const arguments to tweak it (steal
> values etc).
>
> Since Rust types / bindings are derived from the C version, we have to
> be more accurate there to do correct ownership in the bindings.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  scripts/qapi/schema.py | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
> index 3d72c7dfc9..1f6301c394 100644
> --- a/scripts/qapi/schema.py
> +++ b/scripts/qapi/schema.py
> @@ -226,8 +226,15 @@ def c_type(self):
>          pass
> =20
>      # Return the C type to be used in a parameter list.
> -    def c_param_type(self):
> -        return self.c_type()
> +    #
> +    # The argument should be considered const, since no ownership is giv=
en to
> +    # the callee, but qemu C code frequently tweaks it. Set const=3DTrue=
 for a
> +    # stricter declaration.

This comment makes sense only if you're familiar with Rust, where "may
change" is actually tied to ownership.

However, I can't see a use of .c_param_type(True).  Sure you need this
patch in this series?

> +    def c_param_type(self, const: bool =3D False):
> +        c_type =3D self.c_type()
> +        if const and c_type.endswith(POINTER_SUFFIX):
> +            c_type =3D 'const ' + c_type
> +        return c_type
> =20
>      # Return the C type to be used where we suppress boxing.
>      def c_unboxed_type(self):
> @@ -280,10 +287,10 @@ def c_name(self):
>      def c_type(self):
>          return self._c_type_name
> =20
> -    def c_param_type(self):
> +    def c_param_type(self, const: bool =3D False):
>          if self.name =3D=3D 'str':
>              return 'const ' + self._c_type_name
> -        return self._c_type_name
> +        return super().c_param_type(const)

Would

       def c_param_type(self, const: bool =3D False):
           return super().c_param_type(const or self.name =3D=3D 'str')

do?

> =20
>      def json_type(self):
>          return self._json_type_name


