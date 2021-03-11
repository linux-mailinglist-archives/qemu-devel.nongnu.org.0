Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0CC33707D
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 11:51:12 +0100 (CET)
Received: from localhost ([::1]:51930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKIuN-0006n3-EW
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 05:51:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1lKIse-00069L-5W
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 05:49:24 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:53321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1lKIsb-00079s-VR
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 05:49:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=BYizOT9dUfHktlagf9MIgomr+zf4PRe15NfuDnSjGZg=; b=Frs/Bejdu4w8XsjuKrZ51fIOtp
 a7Ej00MNI/1bR4fkfQ2Ct3YOyyusu2tOS+0bSWxiaeVBRsSajirVgw47A1bRgAL9SOUVfsBFbnuTz
 UHYj0eQsYWuXkTorZzEd3eMBf2ObhLtlvJqKZz5oongkap/3RRvvUwYvlG5yaaErV7rVSZB6364p7
 7MPy8VoRVMhgPjBfjcq5qF4wa06scsXJnZRezCVslDX9PbSF8XD2/F86BoNt2L/8HyLI7DcfLoj0S
 kd/9gJ1fNZDyhjSEG+tW9JRXI+Jm1cCbLA3cT/jHT03Eq/hn/hWLwUTkZ+aJBjMmseCspBFZuDbwy
 YXh8/cXLacpIHmj/7JYhSv+6aqxJLhwJ2dA0neZCoKxwak8CJ4rEupO9NPfgK0J0+EIwigtnpxJiS
 ntW+BmZ728iJk2Tz0olm7N1Ld74fH0mB3invr/DjKBuY8E4NbytSZxN+N68aGTq6g8a/qfoIYE4ZF
 XdoKCBx0mMtT1J+BD4X21F4aK1quJTPUj/OaCpn+TiDZZJg6SwbkHh1Lw9+MjP0UOm0K1sONGBnPi
 IrY+/DVUZGkqQJjiROyAAr/kNPP9DG6vCOMxMLtwEcxYL+g9axleSU9jkKJ1jOdmiWDofHtrjviXq
 lHyX8oHLkc5SOJ8AKZy43nBHp8TLE2yJ3bjERSWp4=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>, Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH 8/9] hw/9pfs/9p-synth: Replaced qemu_mutex_lock with
 QEMU_LOCK_GUARD
Date: Thu, 11 Mar 2021 11:49:06 +0100
Message-ID: <2248579.lIZarMFqrv@silver>
In-Reply-To: <20210311031538.5325-9-ma.mandourr@gmail.com>
References: <20210311031538.5325-1-ma.mandourr@gmail.com>
 <20210311031538.5325-9-ma.mandourr@gmail.com>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Donnerstag, 11. M=E4rz 2021 04:15:37 CET Mahmoud Mandour wrote:
> Replaced a call to qemu_mutex_lock and its respective call to
> qemu_mutex_unlock and used QEMU_LOCK_GUARD macro in their place.
> This simplifies the code by removing the call required to unlock
> and also eliminates goto paths.
>=20
> Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
> ---
>  hw/9pfs/9p-synth.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
>=20
> diff --git a/hw/9pfs/9p-synth.c b/hw/9pfs/9p-synth.c
> index 7eb210ffa8..473ef914b0 100644
> --- a/hw/9pfs/9p-synth.c
> +++ b/hw/9pfs/9p-synth.c
> @@ -79,11 +79,11 @@ int qemu_v9fs_synth_mkdir(V9fsSynthNode *parent, int
> mode, if (!parent) {
>          parent =3D &synth_root;
>      }
> -    qemu_mutex_lock(&synth_mutex);
> +    QEMU_LOCK_GUARD(&synth_mutex);
>      QLIST_FOREACH(tmp, &parent->child, sibling) {
>          if (!strcmp(tmp->name, name)) {
>              ret =3D EEXIST;
> -            goto err_out;
> +            return ret;
>          }
>      }
>      /* Add the name */
> @@ -94,8 +94,6 @@ int qemu_v9fs_synth_mkdir(V9fsSynthNode *parent, int mo=
de,
> node->attr, node->attr->inode);
>      *result =3D node;
>      ret =3D 0;
> -err_out:
> -    qemu_mutex_unlock(&synth_mutex);
>      return ret;
>  }
>=20
> @@ -116,11 +114,11 @@ int qemu_v9fs_synth_add_file(V9fsSynthNode *parent,
> int mode, parent =3D &synth_root;
>      }
>=20
> -    qemu_mutex_lock(&synth_mutex);
> +    QEMU_LOCK_GUARD(&synth_mutex);
>      QLIST_FOREACH(tmp, &parent->child, sibling) {
>          if (!strcmp(tmp->name, name)) {
>              ret =3D EEXIST;
> -            goto err_out;
> +            return ret;
>          }
>      }
>      /* Add file type and remove write bits */
> @@ -136,8 +134,6 @@ int qemu_v9fs_synth_add_file(V9fsSynthNode *parent, i=
nt
> mode, pstrcpy(node->name, sizeof(node->name), name);
>      QLIST_INSERT_HEAD_RCU(&parent->child, node, sibling);
>      ret =3D 0;
> -err_out:
> -    qemu_mutex_unlock(&synth_mutex);
>      return ret;
>  }

Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>

Greg, I suggest I'll push this onto my queue as you seem to be busy.

Best regards,
Christian Schoenebeck



