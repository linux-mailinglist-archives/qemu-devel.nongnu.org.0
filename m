Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 351635F12FE
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 21:50:05 +0200 (CEST)
Received: from localhost ([::1]:46356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeM1L-00035H-Pn
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 15:50:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1oeLzN-0001d6-TS
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 15:48:02 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:51187)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1oeLzM-00083e-3y
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 15:48:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=yOj5xmBnxUZfk1Sl1vMFa/R2SEyjCWjEYJOAl3UkJHY=; b=C5Q3es9id8FfWFPfTFQMe4Ly5m
 n9vi8sa8eQjGVBrV9O7XvRa7dn8wZyYe5N6h94c8e9Kq2bxGK0nObdBL6NUCgGLmiw+OJDrimTzOn
 lvgYIowDx8J3sHtMR+iDTVd8OHBwik6rLvO4pmK0uuAI+aygxxwu0oA73TWHMPGuWqiIqW8ISo+k7
 zoEdxvYd8LZsNBwm0TVGR+bghvzVlJVz+2rDzrvnWEjgFtLhQbL728gBhTFasc7tBgEOx9rmzR0/Q
 tQzZu8FJIJbnIFCGy7ht5rjzilTK5kxGtQudDB0E31H9dBEM8Dbhe02s/kZOQYMVvLPaHytzyfKFc
 glAVKHzy0lZVrckQhIzpZPwMTVVF34V5a8zYVwUr6xKSr5DLTnNCSACAlbXp82EObQb/ykDZKhrgh
 w6jkVVGDrO6/ktumOCnUtvlJ5naRmPq5YD7hH1G8mEUHpKYFYUAPKc4WQt6VmVe1RbHny3szEihss
 i1KWZwIJlAFMXvMdGcpWvldoewxY575hUgZ6d7eqMcKHS/eQ/8L0eoAMFsktnYBrEr066sj7h7wb+
 kACrV1/X4hD+e5GgirCijXmGGgCE0Hp9i/YobUHJqoMS7W3jgCHhBPEaSKXarU120F8T/WRiQ7trc
 TV89v0EfOR9lbynAIqGjVY5NX6sior5k4pSPsTMjc=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: jb-gnumlists@wisemo.com, thuth@redhat.com, jasowang@redhat.com,
 =?ISO-8859-1?Q?Marc=2DAndr=E9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [PATCH] net: print a more actionable error when slirp is not found
Date: Fri, 30 Sep 2022 21:47:29 +0200
Message-ID: <2973900.g0HVWOepMQ@silver>
In-Reply-To: <20220929163237.1417215-1-marcandre.lureau@redhat.com>
References: <20220929163237.1417215-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Donnerstag, 29. September 2022 18:32:37 CEST Marc-Andr=E9 Lureau wrote:
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>=20
> If slirp is not found during compile-time, and not manually disabled,
> print a friendly error message, as suggested in the "If your networking
> is failing after updating to the latest git version of QEMU..." thread
> by various people.
>=20
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  meson.build |  4 ++++
>  net/net.c   | 19 +++++++++++++++++--
>  2 files changed, 21 insertions(+), 2 deletions(-)
>=20
> diff --git a/meson.build b/meson.build
> index 8dc661363f..4f69d7d0b4 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -657,6 +657,10 @@ if not get_option('slirp').auto() or have_system
>    endif
>  endif
>=20
> +if get_option('slirp').disabled()
> +  config_host_data.set('CONFIG_SLIRP_DISABLED', true)
> +endif
> +
>  vde =3D not_found
>  if not get_option('vde').auto() or have_system or have_tools
>    vde =3D cc.find_library('vdeplug', has_headers: ['libvdeplug.h'],
> diff --git a/net/net.c b/net/net.c
> index 2db160e063..e6072a5ddd 100644
> --- a/net/net.c
> +++ b/net/net.c
> @@ -990,14 +990,29 @@ static int net_init_nic(const Netdev *netdev, const
> char *name, return idx;
>  }
>=20
> +#if (defined(CONFIG_SLIRP) || !defined(CONFIG_SLIRP_DISABLED))
> +static int net_init_user(const Netdev *netdev, const char *name,
> +                         NetClientState *peer, Error **errp)
> +{
> +#ifdef CONFIG_SLIRP
> +    return net_init_slirp(netdev, name, peer, errp);
> +#else
> +    error_setg(errp,
> +               "Type 'user' is not a supported netdev backend by this QE=
MU
> build " +               "because the libslirp development files were not
> found during build " +               "of QEMU.");
> +#endif
> +    return -1;
> +}
> +#endif

I just tried this, but somehow it is not working for me. net_init_user() is=
=20
never called and therefore I don't get the error message. That should be=20
working if the user launched QEMU without any networking arg, right?

And still, I would find it better if there was also a clear build-time erro=
r=20
if there was no libslirp and slirp feature was not explicitly disabled.

>=20
>  static int (* const net_client_init_fun[NET_CLIENT_DRIVER__MAX])(
>      const Netdev *netdev,
>      const char *name,
>      NetClientState *peer, Error **errp) =3D {
>          [NET_CLIENT_DRIVER_NIC]       =3D net_init_nic,
> -#ifdef CONFIG_SLIRP
> -        [NET_CLIENT_DRIVER_USER]      =3D net_init_slirp,
> +#if (defined(CONFIG_SLIRP) || !defined(CONFIG_SLIRP_DISABLED))
> +        [NET_CLIENT_DRIVER_USER]      =3D net_init_user,
>  #endif
>          [NET_CLIENT_DRIVER_TAP]       =3D net_init_tap,
>          [NET_CLIENT_DRIVER_SOCKET]    =3D net_init_socket,





