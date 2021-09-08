Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D7A4039A5
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 14:22:00 +0200 (CEST)
Received: from localhost ([::1]:50316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNwaV-0008OE-76
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 08:21:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mNwVg-00048L-7S
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 08:17:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mNwVc-0003Pe-5g
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 08:16:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631103415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TBO7CyLwsPT+tOsyFnCosuq4RhZvWwzWnt7NzFhe2h4=;
 b=EXsVv0M61gwbRXPmLEbxnRshlqNdFHr0YBUra53j1eiIN1/+kbO+wXiJEm3cnGnNUJ3a60
 u7eKib5i0i/Djodzf+PeXIY4C5dvEMqguuNwlP0Z794uKOlbgKyZqeWjezc/W591Hi8iFy
 44pq93pwJ0XZKcP9EXgHhh+3Hrms7ek=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-461-K_cRaFndP6aZ-nqLl3Eh3g-1; Wed, 08 Sep 2021 08:16:54 -0400
X-MC-Unique: K_cRaFndP6aZ-nqLl3Eh3g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 454B01018721
 for <qemu-devel@nongnu.org>; Wed,  8 Sep 2021 12:16:53 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-13.ams2.redhat.com
 [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 13E9E6A8E4;
 Wed,  8 Sep 2021 12:16:52 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6C32D1138606; Wed,  8 Sep 2021 14:16:51 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [RFC v3 04/32] glib-compat: add G_SIZEOF_MEMBER
References: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
 <20210907121943.3498701-5-marcandre.lureau@redhat.com>
Date: Wed, 08 Sep 2021 14:16:51 +0200
In-Reply-To: <20210907121943.3498701-5-marcandre.lureau@redhat.com> (marcandre
 lureau's message of "Tue, 7 Sep 2021 16:19:15 +0400")
Message-ID: <87r1dzw9cc.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
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
> The macro was introduced in 2.64. Let's redefine it, to allow its usage
> with older versions and silence the deprecation warning.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  include/glib-compat.h | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/include/glib-compat.h b/include/glib-compat.h
> index 9e95c888f5..e278e09d1d 100644
> --- a/include/glib-compat.h
> +++ b/include/glib-compat.h
> @@ -110,4 +110,11 @@ qemu_g_test_slow(void)
> =20
>  #pragma GCC diagnostic pop
> =20
> +/* introduced in 2.64 */
> +#ifdef G_SIZEOF_MEMBER
> +#undef G_SIZEOF_MEMBER
> +#endif
> +
> +#define G_SIZEOF_MEMBER(type, member) sizeof(((type *)0)->member)
> +
>  #endif

What's wrong with

   #if !GLIB_VERSION(2, 64, 0)
   #define G_SIZEOF_MEMBER(type, member) sizeof(((type *)0)->member)
   #endif

?


