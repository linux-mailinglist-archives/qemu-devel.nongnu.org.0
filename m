Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E84192933
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Mar 2020 14:07:24 +0100 (CET)
Received: from localhost ([::1]:35904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jH5kh-0003PG-IJ
	for lists+qemu-devel@lfdr.de; Wed, 25 Mar 2020 09:07:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51704)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mrezanin@redhat.com>) id 1jH5jx-0002of-Cv
 for qemu-devel@nongnu.org; Wed, 25 Mar 2020 09:06:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mrezanin@redhat.com>) id 1jH5jw-0004EX-73
 for qemu-devel@nongnu.org; Wed, 25 Mar 2020 09:06:37 -0400
Received: from 212-4-128-36.cust.selfnet.cz ([212.4.128.36]:39696
 helo=workimage.localdomain) by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <mrezanin@redhat.com>)
 id 1jH5jw-00049l-01; Wed, 25 Mar 2020 09:06:36 -0400
Received: by workimage.localdomain (Postfix, from userid 1000)
 id 4EEE21AE442; Wed, 25 Mar 2020 13:56:33 +0100 (CET)
Date: Wed, 25 Mar 2020 13:56:33 +0100
From: Miroslav Rezanina <mrezanin@redhat.com>
To: Chen Qun <kuhn.chenqun@huawei.com>
Subject: Re: [PATCH 1/3] gdbstub: prevent uninitialized warning
Message-ID: <20200325125633.kuot6un2rbujwdvv@lws.brq.redhat.com>
References: <20200325092137.24020-1-kuhn.chenqun@huawei.com>
 <20200325092137.24020-2-kuhn.chenqun@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200325092137.24020-2-kuhn.chenqun@huawei.com>
User-Agent: NeoMutt/20180716
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.4.128.36
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
Cc: zhang.zhanghailiang@huawei.com, qemu-trivial@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>, laurent@vivier.eu,
 qemu-devel@nongnu.org, Euler Robot <euler.robot@huawei.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 25, 2020 at 05:21:35PM +0800, Chen Qun wrote:
> According to the glib function requirements, we need initialise
>      the variable. Otherwise there will be compilation warnings:
>=20
> qemu/gdbstub.c: In function =E2=80=98handle_query_thread_extra=E2=80=99=
:
> /usr/include/glib-2.0/glib/glib-autocleanups.h:28:3: warning:
>  =E2=80=98cpu_name=E2=80=99 may be used uninitialized in this function =
[-Wmaybe-uninitialized]
>    g_free (*pp);
>    ^~~~~~~~~~~~
>=20
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
> ---
> Cc: "Alex Benn=C3=A9e" <alex.bennee@linaro.org>
> Cc: "Philippe Mathieu-Daud=C3=A9" <philmd@redhat.com>
> ---
>  gdbstub.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/gdbstub.c b/gdbstub.c
> index 013fb1ac0f..171e150950 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -2060,8 +2060,8 @@ static void handle_query_thread_extra(GdbCmdConte=
xt *gdb_ctx, void *user_ctx)
>          /* Print the CPU model and name in multiprocess mode */
>          ObjectClass *oc =3D object_get_class(OBJECT(cpu));
>          const char *cpu_model =3D object_class_get_name(oc);
> -        g_autofree char *cpu_name;
> -        cpu_name  =3D object_get_canonical_path_component(OBJECT(cpu))=
;
> +        g_autofree char *cpu_name =3D
> +            object_get_canonical_path_component(OBJECT(cpu));
>          g_string_printf(rs, "%s %s [%s]", cpu_model, cpu_name,
>                          cpu->halted ? "halted " : "running");
>      } else {
> --=20
> 2.23.0
>=20
>=20
>

Fixing broken build with -Wall.

Reviewed-by: Miroslav Rezanina <mrezanin@redhat.com>=20

