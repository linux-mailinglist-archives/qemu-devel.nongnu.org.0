Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C0635A1CD
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 17:16:26 +0200 (CEST)
Received: from localhost ([::1]:36964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUsrw-0003GQ-Ss
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 11:16:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1lUsn8-0007gN-0P
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 11:11:26 -0400
Received: from mail.weilnetz.de ([37.120.169.71]:35760
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1lUsn0-0007Yo-If
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 11:11:25 -0400
Received: from edv-macbook-pro.fritz.box (p5b1511bf.dip0.t-ipconnect.de
 [91.21.17.191])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id B2271DA02BE;
 Fri,  9 Apr 2021 17:11:13 +0200 (CEST)
To: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
References: <20210409100627.451573-1-groug@kaod.org>
From: Stefan Weil <sw@weilnetz.de>
Subject: Re: [PATCH] virtiofsd: Fix side-effect in assert()
Message-ID: <daa895d8-7fbc-e4f5-3cfe-29cae4cd193a@weilnetz.de>
Date: Fri, 9 Apr 2021 17:11:13 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210409100627.451573-1-groug@kaod.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: virtio-fs@redhat.com, misono.tomohiro@jp.fujitsu.com,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 09.04.21 um 12:06 schrieb Greg Kurz:

> It is bad practice to put an expression with a side-effect in
> assert() because the side-effect won't happen if the code is
> compiled with -DNDEBUG.
>
> Use an intermediate variable. Consolidate this in an macro to
> have proper line numbers when the assertion is hit.
>
> virtiofsd: ../../tools/virtiofsd/passthrough_ll.c:2797: lo_getxattr:
>   Assertion `fchdir_res =3D=3D 0' failed.
> Aborted
>
>    2796          /* fchdir should not fail here */
> =3D>2797          FCHDIR_NOFAIL(lo->proc_self_fd);
>    2798          ret =3D getxattr(procname, name, value, size);
>    2799          FCHDIR_NOFAIL(lo->root.fd);
>
> Fixes: bdfd66788349 ("virtiofsd: Fix xattr operations")
> Cc: misono.tomohiro@jp.fujitsu.com
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>   tools/virtiofsd/passthrough_ll.c | 21 +++++++++++++--------
>   1 file changed, 13 insertions(+), 8 deletions(-)
>
> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthr=
ough_ll.c
> index 1553d2ef454f..6592f96f685e 100644
> --- a/tools/virtiofsd/passthrough_ll.c
> +++ b/tools/virtiofsd/passthrough_ll.c
> @@ -2723,6 +2723,11 @@ static int xattr_map_server(const struct lo_data=20
*lo, const char *server_name,
>       return -ENODATA;
>   }
>  =20
> +#define FCHDIR_NOFAIL(fd) do {                         \
> +        int fchdir_res =3D fchdir(fd);                   \
> +        assert(fchdir_res =3D=3D 0);                       \
> +    } while (0)
> +
>   static void lo_getxattr(fuse_req_t req, fuse_ino_t ino, const char *i=
n_name,
>  =20


I am afraid that this will raise a compiler warning (or error with=20
-Werror) when NDEBUG is defined because the variable is unused in that=20
case ([-Wunused-variable]).

I suggest to use different implementations of the macro depending on NDEB=
UG.

Stefan




