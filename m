Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C788C3AE9ED
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 15:20:59 +0200 (CEST)
Received: from localhost ([::1]:59770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvJrF-0005Dn-N4
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 09:20:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fam@euphon.net>)
 id 1lvJpY-0004Jx-7t; Mon, 21 Jun 2021 09:19:13 -0400
Received: from sender2-op-o12.zoho.com.cn ([163.53.93.243]:17657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fam@euphon.net>)
 id 1lvJpT-00033p-79; Mon, 21 Jun 2021 09:19:12 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1624281524; cv=none; d=zoho.com.cn; s=zohoarc; 
 b=mJkVo/TFdENzvwgnRrPQYImfEoxmuywYub7cGoP5Vxx6bOVU9JaA4duWuLCmu5YtzZ85ziwkB7KZfOz/dUq0uIQxw5xONSc5RaB0RzkIGZMFHWVBe4mkuxlLWDR3I8LdLm1302OWr6o0ullRr4HPL9UnpSgEOBgD+1k5pFiY8EU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn;
 s=zohoarc; t=1624281524;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=RZoJaFXAOioO76Qy1HIb9n2ybt99QS97bFIwGizQ350=; 
 b=IoURVV1SoiscjqnZocZFHLT+KiNIyXCjAdAce2dyvA4Y5Sjcfmk5PlxKWLHuqEJTqVnDpm0/9EvGGRalQqqK8Pw4/43GoDuwjH0X4XrjThxKiHl54U1w1oqk3WfFskCIxVc9cGl91H5KEoeb70I8mTnG+JiMdVrnHmlLi22f5VI=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
 dkim=pass  header.i=euphon.net;
 spf=pass  smtp.mailfrom=fam@euphon.net;
 dmarc=pass header.from=<fam@euphon.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1624281524; 
 s=zoho; d=euphon.net; i=fam@euphon.net;
 h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:To;
 bh=RZoJaFXAOioO76Qy1HIb9n2ybt99QS97bFIwGizQ350=;
 b=Bh43SiTcaI5CS2p+rlrucmLoEMQKSlXBuMgjTDVbXvWhfeoPmF1R+VJutZFTJqJ8
 +0qqMwvQiOaHokBvnO3zToJAyvcZCpBQtrHcBbSXCn6zXQcyo4fRvUXaE1epLrlm4BL
 R6Yfxq0lHva9IvBM/O1Rfkv7P8WPSxBBdUisU/wY=
Received: from n200-111-076.byted.org
 (ec2-3-67-219-253.eu-central-1.compute.amazonaws.com [3.67.219.253]) by
 mx.zoho.com.cn with SMTPS id 1624281521020500.35932498282386;
 Mon, 21 Jun 2021 21:18:41 +0800 (CST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.7\))
Subject: Re: [PATCH v2] block/nvme: Fix VFIO_MAP_DMA failed: No space left on
 device
From: Fam Zheng <fam@euphon.net>
In-Reply-To: <20210621093240.4170701-1-philmd@redhat.com>
Date: Mon, 21 Jun 2021 14:18:31 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <9A674DF3-041E-4E7C-BB49-481AA77B1F7B@euphon.net>
References: <20210621093240.4170701-1-philmd@redhat.com>
To: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@redhat.com>
X-Mailer: Apple Mail (2.3608.120.23.2.7)
X-ZohoCNMailClient: External
Received-SPF: pass client-ip=163.53.93.243; envelope-from=fam@euphon.net;
 helo=sender2-op-o12.zoho.com.cn
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 =?utf-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>,
 qemu-stable@nongnu.org, qemu-devel@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On 21 Jun 2021, at 10:32, Philippe Mathieu-Daud=C3=A9 =
<philmd@redhat.com> wrote:
>=20
> When the NVMe block driver was introduced (see commit bdd6a90a9e5,
> January 2018), Linux VFIO_IOMMU_MAP_DMA ioctl was only returning
> -ENOMEM in case of error. The driver was correctly handling the
> error path to recycle its volatile IOVA mappings.
>=20
> To fix CVE-2019-3882, Linux commit 492855939bdb ("vfio/type1: Limit
> DMA mappings per container", April 2019) added the -ENOSPC error to
> signal the user exhausted the DMA mappings available for a container.
>=20
> The block driver started to mis-behave:
>=20
>  qemu-system-x86_64: VFIO_MAP_DMA failed: No space left on device
>  (qemu)
>  (qemu) info status
>  VM status: paused (io-error)
>  (qemu) c
>  VFIO_MAP_DMA failed: No space left on device
>  qemu-system-x86_64: block/block-backend.c:1968: blk_get_aio_context: =
Assertion `ctx =3D=3D blk->ctx' failed.

Hi Phil,
=20

The diff looks good to me, but I=E2=80=99m not sure what exactly caused =
the assertion failure. There is `if (r) { goto fail; }` that handles =
-ENOSPC before, so it should be treated as a general case. What am I =
missing?

Reviewed-by: Fam Zheng <fam@euphon.net>

>=20
> Fix by handling the new -ENOSPC error (when DMA mappings are
> exhausted) without any distinction to the current -ENOMEM error,
> so we don't change the behavior on old kernels where the CVE-2019-3882
> fix is not present.
>=20
> An easy way to reproduce this bug is to restrict the DMA mapping
> limit (65535 by default) when loading the VFIO IOMMU module:
>=20
>  # modprobe vfio_iommu_type1 dma_entry_limit=3D666
>=20
> Cc: qemu-stable@nongnu.org
> Reported-by: Michal Pr=C3=ADvozn=C3=ADk <mprivozn@redhat.com>
> Fixes: bdd6a90a9e5 ("block: Add VFIO based NVMe driver")
> Buglink: https://bugs.launchpad.net/qemu/+bug/1863333
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/65
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> v2: KISS checking both errors undistinguishedly (Maxim)
> ---
> block/nvme.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/block/nvme.c b/block/nvme.c
> index 2b5421e7aa6..c3d2a49866c 100644
> --- a/block/nvme.c
> +++ b/block/nvme.c
> @@ -1030,7 +1030,7 @@ try_map:
>         r =3D qemu_vfio_dma_map(s->vfio,
>                               qiov->iov[i].iov_base,
>                               len, true, &iova);
> -        if (r =3D=3D -ENOMEM && retry) {
> +        if ((r =3D=3D -ENOMEM || r =3D=3D -ENOSPC) && retry) {
>             retry =3D false;
>             trace_nvme_dma_flush_queue_wait(s);
>             if (s->dma_map_count) {
> --=20
> 2.31.1
>=20
>=20


