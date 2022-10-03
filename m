Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3DF5F30AF
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 15:08:41 +0200 (CEST)
Received: from localhost ([::1]:60984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofLBX-0000Rk-M5
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 09:08:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1ofKpn-0007yw-5X
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 08:46:25 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:38889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1ofKpj-0001MM-Uc
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 08:46:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=nsDbrWPIQJhAU4dSBB2FCtnixWsxFC4IIhIqIiIF2ZU=; b=wyAkfwNuI5N4exXYff2WXp42Fv
 SMAfaVnG1aknq2bEHz0d9rVlHpU4mk5mxKCjgS7kE5ppV2TUOCE1CdINYBwGFQB124f4fNGfHFbvO
 BI+7Ftz+t9nL+vajr7xL42AYrqOCwYaGvEN9ZMTpLbBa3lYdqXHQI15gGdWqfySTYm3+bJdJ9+OeW
 SMVG0VeT+9vYPRIpdeP5BxFGxNhpZ6CrgsQ0hfLhNtIe4qeOQzXXgFyKO/OdqIdCtvlCXqEhHYjCa
 qTkILyCi69PiOGDnnPk6SngKZ4KHDP/EseRn4Eh1Y+EXbGbMIsgXeZQXyyTzF8E751A5pIWN2Qy7B
 O2Hqx4z0R3cAxER2hQaxgzZFV8wZanbYh6fL/L91T1wE8JGZHwuN6o4jiYwxtD8f619X/G9HuI/hx
 uuoxRlKaVQbfPCLQsCD/Z3nmd3Xw6kxpnmf9Yc8I87yr8jepLqlE4B24dK97c5UTCGCxEbgQgskDs
 ed+3eUwdObsIxA3lxbFpPfwasOnm+wugvLfamiQp+tIBjGB+DwcMwtR0mb92u7jNBh997GBEfp5LN
 Yokr0grbSraUqZYR+thlJkmlvIgvXWuyFickxFoUzt5mKuKA20QFJNGVhKYHInEtsyMRtqvXqnYyw
 AOe1d+YgKhVzFB8GjW45gY23//whz1lzD32DOtrE0=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: =?ISO-8859-1?Q?Marc=2DAndr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Daniel =?ISO-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH] net: improve error message for missing netdev backend
Date: Mon, 03 Oct 2022 14:46:04 +0200
Message-ID: <2257290.J6gMhxssjS@silver>
In-Reply-To: <20221003100612.596845-1-berrange@redhat.com>
References: <20221003100612.596845-1-berrange@redhat.com>
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

On Montag, 3. Oktober 2022 12:06:12 CEST Daniel P. Berrang=E9 wrote:
> The current message when using '-net user...' with SLIRP disabled at
> compile time is:
>=20
>   qemu-system-x86_64: -net user: Parameter 'type' expects a net backend t=
ype
> (maybe it is not compiled into this binary)

Is this intended as alternative to Marc-Andr=E9's previous patch? If yes, t=
hen=20
same applies here: what about people not passing any networking arg to QEMU=
?=20
They would not get any error message at all, right?

https://lore.kernel.org/all/2973900.g0HVWOepMQ@silver/

> An observation is that we're using the 'netdev->type' field here which
> is an enum value, produced after QAPI has converted from its string
> form.
>=20
> IOW, at this point in the code, we know that the user's specified
> type name was a valid network backend. The only possible scenario that
> can make the backend init function be NULL, is if support for that
> backend was disabled at build time. Given this, we don't need to caveat
> our error message with a 'maybe' hint, we can be totally explicit.
>=20
> The use of QERR_INVALID_PARAMETER_VALUE doesn't really lend itself to
> user friendly error message text. Since this is not used to set a
> specific QAPI error class, we can simply stop using this pre-formatted
> error text and provide something better.
>=20
> Thus the new message is:
>=20
>   qemu-system-x86_64: -net user: network backend 'user' is not compiled i=
nto
> this binary

And why not naming the child, i.e. that QEMU was built without slirp?

> The case of passing 'hubport' for -net is also given a message reminding
> people they should have used -netdev/-nic instead, as this backend type
> is only valid for the modern syntax.
>=20
> Signed-off-by: Daniel P. Berrang=E9 <berrange@redhat.com>
> ---
>=20
> NB, this does not make any difference to people who were relying on the
> QEMU built-in default hub that was created if you don't list any -net /
> -netdev / -nic argument, only those using explicit args.
>=20
>  net/net.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
>=20
> diff --git a/net/net.c b/net/net.c
> index 2db160e063..8ddafacf13 100644
> --- a/net/net.c
> +++ b/net/net.c
> @@ -1036,19 +1036,23 @@ static int net_client_init1(const Netdev *netdev,
> bool is_netdev, Error **errp) if (is_netdev) {
>          if (netdev->type =3D=3D NET_CLIENT_DRIVER_NIC ||
>              !net_client_init_fun[netdev->type]) {
> -            error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "type",
> -                       "a netdev backend type");
> +            error_setg(errp, "network backend '%s' is not compiled into
> this binary", +                       NetClientDriver_str(netdev->type));
>              return -1;
>          }
>      } else {
>          if (netdev->type =3D=3D NET_CLIENT_DRIVER_NONE) {
>              return 0; /* nothing to do */
>          }
> -        if (netdev->type =3D=3D NET_CLIENT_DRIVER_HUBPORT ||
> -            !net_client_init_fun[netdev->type]) {
> -            error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "type",
> -                       "a net backend type (maybe it is not compiled "
> -                       "into this binary)");
> +        if (netdev->type =3D=3D NET_CLIENT_DRIVER_HUBPORT) {
> +            error_setg(errp, "network backend '%s' is only supported with
> -netdev/-nic", +                       NetClientDriver_str(netdev->type));
> +            return -1;
> +        }
> +
> +        if (!net_client_init_fun[netdev->type]) {
> +            error_setg(errp, "network backend '%s' is not compiled into
> this binary", +                       NetClientDriver_str(netdev->type));
>              return -1;
>          }




