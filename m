Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 604D832D1BB
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 12:27:16 +0100 (CET)
Received: from localhost ([::1]:48190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHm8O-0002IA-Fj
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 06:27:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1lHm6G-0001X0-6z
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 06:25:00 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:40619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1lHm6D-0007GL-Uu
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 06:24:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=bAQNIe/ZzNTbV0pl21LonJp0B8BlMBD48OcZX4L4Nww=; b=swsr5T+1q78IITI/mCXc6EWsBV
 oTKSSe+PKr54fJqdmGBAMQ3srxjPWU12Ci1vpputJ01Gd5Mk2uV4Uo6afmJErVu5APpey9m1qzZVV
 OpQfsI/hwzPHrZjQkBT5eQLJszcLEtK+NHNXJuO2fYhwUE7cWrfJGLqRSJAuj18oFjtv3sbCP708A
 VLB8zzVljxFYl8WCKWZzfHr7Xwvy2/LrBZZK/0SJBRminWNRGAYoohCjO1MsP/fLDf1NCibpo0m+e
 GMifPtDM0iUAoit/hOwi2WNknq3Udt9QjMhqHam0psv9Txzk0YesATz3g+pKx8SccCyOIbAP2sDmF
 gt1FX65mx9GcDpIvo64sKhdfhwXvBorSfULV/MAHWCIrRLwRLf0OfRIt/ct0a0I+/MaOpZ0D2PeEc
 zKtoezhCQ/be/CySnxNRSeGHTA17WkcsqtnTT8B3pRkKbdDPh1yziZNn9qZk14OQzWg9aLcgGlNlv
 qAgYfJIFykT5ACbfBDNGRM+shbBKQvBEJCTAKFwmiML8jGskDp16xl7rja1IqbFaoRUVwUW19nFBS
 Thjn+q0ZW95F3sig+b8wdg780a2DKldZqy7JrO0hifCdgmQZ6lob4MEF2zpZaG7UwhvLhvy/rjS46
 netK8fDiYN2qprto1LP58uj8trI0cZmzn+7vdo0xo=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Geoffrey McRae <geoff@hostfission.com>,
 =?ISO-8859-1?Q?Jos=E9?= Pekkarinen <koalinux@gmail.com>
Subject: Re: [PATCH v2] Autoconnect jack ports by default
Date: Thu, 04 Mar 2021 12:24:44 +0100
Message-ID: <1992957.OTMv4WkKIP@silver>
In-Reply-To: <20210303071306.h6nmeoau447w4j4b@sirius.home.kraxel.org>
References: <20210224191927.19271-1-koalinux@gmail.com>
 <5436901.4e4U2xeZI5@silver>
 <20210303071306.h6nmeoau447w4j4b@sirius.home.kraxel.org>
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

On Mittwoch, 3. M=E4rz 2021 08:13:06 CET Gerd Hoffmann wrote:
>   Hi,
>=20
> > JACK clients with consumer purpose often auto connect to system ports by
> > default because their users mostly use JACK just as a consumer desktop
> > sound server. And I assume this applies to Jos=E9 as well.
>=20
> Hmm, ok.  I'd suggest to simply change the default for connect-ports
> then, that'll allow the user to easily change the behavior by setting
> connect-ports to something else (including the empty string to disable
> autoconnect).
>=20
> take care,
>   Gerd

Geoffrey, any chance to make you happy as well? E.g. either reserving "none=
"=20
as special value for "connect-ports" or an additional CL argument
"no-connect-ports" to make it appear less hackish?

Best regards,
Christian Schoenebeck



