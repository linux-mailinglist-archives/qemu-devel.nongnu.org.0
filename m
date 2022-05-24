Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A128532A87
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 14:41:54 +0200 (CEST)
Received: from localhost ([::1]:53590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntTrD-0001Ln-DW
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 08:41:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1ntTa1-0007mm-2S
 for qemu-devel@nongnu.org; Tue, 24 May 2022 08:24:05 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:38739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1ntTZx-0000q0-HD
 for qemu-devel@nongnu.org; Tue, 24 May 2022 08:24:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=0rbOav8P9s8i1EpZNOw8SPV4x190o7Qs11io9Ac5BZw=; b=K9cg8wzNGTsmRokxAtjBJKbo3P
 0Q7eKx6BUg+73aWGjU2EQJQC89x6XZOzkSEeyFa7QeGuI/plkX50AmhrKPT1TbJ28KWxOAXB3Cr7T
 XTVbxrbJ1KjGkszaBoBF3sNSAA2z/vJ4g6BofK2J9fDlavOhhgDNokUYf8ZPHviF/A71o0Nh5PQYF
 +FHwVbnah8Lyf2lmPj8IA+c7SIDW78JUaHZNFe7xB88QpFAWTCwIc2nS9FgleliwfhkP8cP7pMpbm
 XomD2JAt0htzzoajVs/O+f83UPfBC7A+CIaKuBj8RPNXf2HAY5EkCavB+4hcq+ImWl8zrRQdkiElS
 eXAS7dClxVXNTbS934ylVhABB4shM2WVzrIRb/0/CLl8FLtypDYgFBkMSyM/mZPx3cZt3JgWxfpga
 L84RpLHavV3ps+g+C5LV+i0K8cn8Ue2383AFPYEWfrteNvZKu6wP+pPzex9bbCRS3+jylRFoEvSHb
 BkWwFWdkAJr6PQ6lb4VFnlfkFJeTGwTdfoZ7KyxTqU6XXI3GftZ48VpQBAcyyx0AODnIBtXWARqUw
 WsCSIa3ddFz1IrX7JmkkBI4FL5zWY0ydX7jQgxXiXghLiFJBkHkYktiC60JeP/ehUzAyhye6DwmhY
 1vyGPYEV+7f95fyZ03qIYACMcAagas3s7ned/y+rQ=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: "Meng, Bin" <Bin.Meng@windriver.com>
Cc: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>, "Shi, Guohuai" <Guohuai.Shi@windriver.com>
Subject: Re: [PATCH 5/9] hw/9pfs: Add a 'local' file system backend driver for
 Windows
Date: Tue, 24 May 2022 14:23:27 +0200
Message-ID: <2729855.OPLsDoUTax@silver>
In-Reply-To: <MN2PR11MB4173AA315105D173BC930E20EFC89@MN2PR11MB4173.namprd11.prod.outlook.com>
References: <20220425142705.2099270-1-bmeng.cn@gmail.com>
 <20220511141853.7a53106c@bahia>
 <MN2PR11MB4173AA315105D173BC930E20EFC89@MN2PR11MB4173.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Mittwoch, 11. Mai 2022 17:57:08 CEST Shi, Guohuai wrote:
> > -----Original Message-----
> > From: Greg Kurz <groug@kaod.org>
> > Sent: 2022=E5=B9=B45=E6=9C=8811=E6=97=A5 20:19
> > To: Shi, Guohuai <Guohuai.Shi@windriver.com>
> > Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>; qemu-devel@nongnu.o=
rg;
> > Meng, Bin <Bin.Meng@windriver.com>; Bin Meng <bmeng.cn@gmail.com>
> > Subject: Re: [PATCH 5/9] hw/9pfs: Add a 'local' file system backend dri=
ver
> > for Windows
[...]
> > This would be useless because of TOCTOU : a directory could be replaced=
 by
> > a symlink between the check and the actual use of the file. O_NOFOLLOW
> > provides the atomicity needed to safely error out on symlinks. Since
> > O_NOFOLLOW only makes sense for the rightmost path element, paths from
> > the client have to be broken down into a succession of *at() syscalls,
> > one for each element.
>=20
>=20
> For Windows file system, it would be OK.
> Windows can not delete a opening file (this is different behavior between
> Windows file system driver and UNIX-like-inode-based file system). So when
> 9PFS try to open the final file, the following steps will keep it safe:=20
> 1. open the final file by Windows NT APIs and keep the open handle.
> 2. open the final file by MinGW open().
> 3. close NT handle.
>=20
> Windows file system does not allow delete/rename/move a opening file.
> Even Windows provide "FILE_SHARE_DELETE" flag in its NT API CreateFile().
> Windows allow to delete the opening file, but can not re-create same name.
> The following steps will be failure on Windows:
>=20
> 1. Open a directory by CreateFile() with "FILE_SHARE_DELETE" flag and keep
> the handle open.
> 2. Remove the directory.
> 3. Re-create same name directory/file/links.
>=20
> Windows will get failure on step #3.
>=20
> So I think checking if there is a link in filename would be safety on Win=
dow
> host.

Neither Greg nor me are working much with Windows. As this was a fundamenta=
l=20
security issue though, one way to bring this issue forward would be to back=
up=20
your claims with test case(s). Then we would also have a safety net e.g. vi=
a=20
CI cloud alerts in case behaviour on Windows changes one day.

Best regards,
Christian Schoenebeck



