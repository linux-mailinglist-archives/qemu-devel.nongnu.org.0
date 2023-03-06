Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D866AC9B9
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 18:22:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZEX2-0006sc-HU; Mon, 06 Mar 2023 12:21:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fan.ni@samsung.com>)
 id 1pZEX0-0006oW-Gu
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 12:21:50 -0500
Received: from mailout2.w2.samsung.com ([211.189.100.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fan.ni@samsung.com>)
 id 1pZEWy-0007Zm-TA
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 12:21:50 -0500
Received: from uscas1p2.samsung.com (unknown [182.198.245.207])
 by mailout2.w2.samsung.com (KnoxPortal) with ESMTP id
 20230306172148usoutp0266fbfe25d648e97725e74ee1c4d175ed~J5EH-OAIN2801728017usoutp02h;
 Mon,  6 Mar 2023 17:21:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w2.samsung.com
 20230306172148usoutp0266fbfe25d648e97725e74ee1c4d175ed~J5EH-OAIN2801728017usoutp02h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1678123308;
 bh=H2it2XComyhed/Ktkk/8iKc/Xzxi3tX70yy9BOsk5RQ=;
 h=From:To:CC:Subject:Date:In-Reply-To:References:From;
 b=n5tOhcrErGxVCre/TwO46XbztwX1vcM/F2oO2rM0uxeO+xVnkSeTHtNXK6YrjvJ5H
 XbBPmaKMB/Y9rPAn/2v7DAjFQUX/ZnBJmxpn/mNZMn3quSFwIgMXiDgqPwOb+FvSOO
 vA1T05GS2038zNVkEaJMO7cSPjSk+/TjllMEQVSk=
Received: from ussmges1new.samsung.com (u109.gpu85.samsung.co.kr
 [203.254.195.109]) by uscas1p2.samsung.com (KnoxPortal) with ESMTP id
 20230306172148uscas1p257044c62a225c2617f0046b568e7113b~J5EHzz8Y_3131231312uscas1p2_;
 Mon,  6 Mar 2023 17:21:48 +0000 (GMT)
Received: from uscas1p2.samsung.com ( [182.198.245.207]) by
 ussmges1new.samsung.com (USCPEMTA) with SMTP id 64.39.06976.B2126046; Mon, 
 6 Mar 2023 12:21:47 -0500 (EST)
Received: from ussmgxs1new.samsung.com (u89.gpu85.samsung.co.kr
 [203.254.195.89]) by uscas1p2.samsung.com (KnoxPortal) with ESMTP id
 20230306172146uscas1p2e9446294d8b850a1bbcd0e0d4302b603~J5EGM6vNf1373213732uscas1p2B;
 Mon,  6 Mar 2023 17:21:46 +0000 (GMT)
X-AuditID: cbfec36d-afdff70000011b40-6a-6406212b6380
Received: from SSI-EX1.ssi.samsung.com ( [105.128.2.145]) by
 ussmgxs1new.samsung.com (USCPEXMTA) with SMTP id E4.D3.11378.92126046; Mon, 
 6 Mar 2023 12:21:46 -0500 (EST)
Received: from SSI-EX2.ssi.samsung.com (105.128.2.227) by
 SSI-EX1.ssi.samsung.com (105.128.2.226) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.2375.24; Mon, 6 Mar 2023 09:21:45 -0800
Received: from SSI-EX2.ssi.samsung.com ([105.128.2.227]) by
 SSI-EX2.ssi.samsung.com ([105.128.2.227]) with mapi id 15.01.2375.024; Mon,
 6 Mar 2023 09:21:45 -0800
From: Fan Ni <fan.ni@samsung.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Michael Tsirkin
 <mst@redhat.com>, "linux-cxl@vger.kernel.org" <linux-cxl@vger.kernel.org>,
 "linuxarm@huawei.com" <linuxarm@huawei.com>, Ira Weiny
 <ira.weiny@intel.com>, Alison Schofield <alison.schofield@intel.com>,
 Michael Roth <michael.roth@amd.com>,
 =?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>, Dave Jiang
 <dave.jiang@intel.com>, Markus Armbruster <armbru@redhat.com>,
 =?iso-8859-1?Q?Daniel_P_=2E_Berrang=E9?= <berrange@redhat.com>, Eric Blake
 <eblake@redhat.com>, Mike Maslenkin <mike.maslenkin@gmail.com>,
 =?iso-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>, Thomas
 Huth <thuth@redhat.com>
Subject: Re: [RESEND PATCH v6 2/8] hw/pci/aer: Add missing routing for AER
 errors
Thread-Topic: [RESEND PATCH v6 2/8] hw/pci/aer: Add missing routing for AER
 errors
Thread-Index: AQHZTQw/G6QD+/yG8UOd0ZzVQiEZ/K7ujEIA
Date: Mon, 6 Mar 2023 17:21:45 +0000
Message-ID: <20230306172144.GB1489326@bgt-140510-bm03>
In-Reply-To: <20230302133709.30373-3-Jonathan.Cameron@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [105.128.2.176]
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <3A3BC774316E5341B79BEF4DA8EA2634@ssi.samsung.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrEKsWRmVeSWpSXmKPExsWy7djX87raimwpBrObzC3uPr7AZjF/7X0W
 izdv1jBZnLjZyGYx8e16Vov9T5+zWKxaeI3N4vysUywWhzeeYbJY0NbOarHm/iFWi99rHzNZ
 /P/1CshdIWxxvHcHi8XKYzYOAh6tl/6yeeycdZfdo+XIW1aPxXteMnncubaHzePJtc1MHu/3
 XWXz+LxJLoAjissmJTUnsyy1SN8ugSvj3Ga5gh98FTsfNTI3MJ7l7mLk5JAQMJFY8HEhaxcj
 F4eQwEpGiY9717BDOK1MEvtmzGfsYuQAq/qzyRsivpZR4sjh/UwQzkdGiUkXvzGDjBISWMoo
 cb6xFsRmE1CU2Ne1nQ3EFhEwknh3YxIjSAOzwB5WiY8z5rODJIQFgiW+ffsFlGAHKgqReB4G
 U77v601GEJtFQEXi6e9HLCA2r4CZxOb1z5lAbE4BR4mv/bfAxjMKiEl8P7UGLM4sIC5x68l8
 JojPBCUWzd7DDGGLSfzb9ZANwlaUuP/9JTtEvZ7EjalT2CBsO4k3XTuh4toSyxa+ZobYKyhx
 cuYTFoheSYmDK26wgLwiIbCcU2LHs1VQCReJlqMnoJZJS1y9PpUZEnDJEqs+ckGEcyTmL9kC
 VW4tsfDPeqYJjCqzkJw9C8lJs5CcNAvJSbOQnLSAkXUVo3hpcXFuemqxYV5quV5xYm5xaV66
 XnJ+7iZGYDI8/e9w7g7GHbc+6h1iZOJgPMQowcGsJMJb9Zs1RYg3JbGyKrUoP76oNCe1+BCj
 NAeLkjivoe3JZCGB9MSS1OzU1ILUIpgsEwenVANTT9p8pcsPHBkXLTGrnrLiH1OHcKzWBMUH
 R04uq/67je20geDde48PSrI4PQxfz+jEMaUvMOL1EcnC676hZ2e4PDeqK5gVbvXi5Vcnm5SM
 P18vNImW/FS4pVc7+Yy/5J6QINHfkw2XWsS3tPd2V+3XPL718/zkIsWt7KkdF/c+VFP7ufR8
 0nPJxn8iK/mybQ7Z27D1PH2u+ev4yrfGz/+VOx5WVUg6/pvLleO7k4WGiTP/P8d1b6znflVi
 3GR1UsP6NO+clz1CtdpPPmnZiTJ4bV/LdVjNZeeFJQvtJkoEv92aa9fVKMzlvH364ysMLFb2
 nv9KFCrFrljNUH3wn010q1Yun+/rH6VrFHbMi01SYinOSDTUYi4qTgQANHFhffUDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpileLIzCtJLcpLzFFi42LJbGCaqKulyJZi8PIeh8XdxxfYLOavvc9i
 8ebNGiaLEzcb2Swmvl3ParH/6XMWi1ULr7FZnJ91isXi8MYzTBYL2tpZLdbcP8Rq8XvtYyaL
 /79eAbkrhC2O9+5gsVh5zMZBwKP10l82j52z7rJ7tBx5y+qxeM9LJo871/aweTy5tpnJ4/2+
 q2wenzfJBXBEcdmkpOZklqUW6dslcGWc2yxX8IOvYuejRuYGxrPcXYwcHBICJhJ/Nnl3MXJx
 CAmsZpT4u/kLaxcjJ5DzkVFi0lwbiMRSRolZDYeYQRJsAooS+7q2s4HYIgJGEu9uTGIEKWIW
 2MUq8Xjpc3aQhLBAsMS3b78YIYpCJB7vfgXXsO/rTbA4i4CKxNPfj1hAbF4BM4nN658zQWwu
 lzgx6QbYFZwCjhJf+2+B9TIKiEl8P7UGrIZZQFzi1pP5YLaEgIDEkj3nmSFsUYmXj/+xQtiK
 Eve/v2SHqNeTuDF1ChuEbSfxpmsnVFxbYtnC18wQNwhKnJz5hAWiV1Li4IobLBOA/kaybhaS
 UbOQjJqFZNQsJKMWMLKuYhQvLS7OTa8oNsxLLdcrTswtLs1L10vOz93ECEwmp/8djtzBePTW
 R71DjEwcjIcYJTiYlUR4q36zpgjxpiRWVqUW5ccXleakFh9ilOZgURLnFXKdGC8kkJ5Ykpqd
 mlqQWgSTZeLglGpgctu9e2KkduOB0MWxVxTXsUsq7v68TOF5efe/vVeaf+5tTp32+HOmkvC7
 /vTdTAoN7D99H16QS2K5bKrqP6mMMfw9l8rHFLF1RUtW3xew2ybaO0uR7b/xWSfmxTwc19mn
 Lqz7U6v1WLwjlPWH64n/p6P/b1o/7a5b8WOFh/azja/Ou807f3qHmFDbxa3i99SZxJ4KMoo/
 uv74g/Cd1XfY1x5f2NF/00Chf3G8102bcJWsftFlprw5KhMaM67q/7xk11nDr2vryrJzm3+Q
 aZFA8sdljNeX1IV+OvCSL+Wdm1Co4PxIu8YZh3N3vNpt67O5+R3ryY7HrzWMp3u7XnoQvCq2
 gyHXluXEBz9dnlnsSizFGYmGWsxFxYkA+uVuvJUDAAA=
X-CMS-MailID: 20230306172146uscas1p2e9446294d8b850a1bbcd0e0d4302b603
CMS-TYPE: 301P
X-CMS-RootMailID: 20230306172146uscas1p2e9446294d8b850a1bbcd0e0d4302b603
References: <20230302133709.30373-1-Jonathan.Cameron@huawei.com>
 <20230302133709.30373-3-Jonathan.Cameron@huawei.com>
 <CGME20230306172146uscas1p2e9446294d8b850a1bbcd0e0d4302b603@uscas1p2.samsung.com>
Received-SPF: pass client-ip=211.189.100.12; envelope-from=fan.ni@samsung.com;
 helo=mailout2.w2.samsung.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Mar 02, 2023 at 01:37:03PM +0000, Jonathan Cameron wrote:
> PCIe r6.0 Figure 6-3 "Pseudo Logic Diagram for Selected Error Message Con=
trol
> and Status Bits" includes a right hand branch under "All PCI Express devi=
ces"
> that allows for messages to be generated or sent onwards without SERR#
> being set as long as the appropriate per error class bit in the PCIe
> Device Control Register is set.
>=20
> Implement that branch thus enabling routing of ERR_COR, ERR_NONFATAL
> and ERR_FATAL under OSes that set these bits appropriately (e.g. Linux)
>=20
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by: Dave Jiang <dave.jiang@intel.com>
> ---

Reviewed-by: Fan Ni <fan.ni@samsung.com>

>  hw/pci/pcie_aer.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/pci/pcie_aer.c b/hw/pci/pcie_aer.c
> index 909e027d99..103667c368 100644
> --- a/hw/pci/pcie_aer.c
> +++ b/hw/pci/pcie_aer.c
> @@ -192,8 +192,16 @@ static void pcie_aer_update_uncor_status(PCIDevice *=
dev)
>  static bool
>  pcie_aer_msg_alldev(PCIDevice *dev, const PCIEAERMsg *msg)
>  {
> +    uint16_t devctl =3D pci_get_word(dev->config + dev->exp.exp_cap +
> +                                   PCI_EXP_DEVCTL);
>      if (!(pcie_aer_msg_is_uncor(msg) &&
> -          (pci_get_word(dev->config + PCI_COMMAND) & PCI_COMMAND_SERR)))=
 {
> +          (pci_get_word(dev->config + PCI_COMMAND) & PCI_COMMAND_SERR)) =
&&
> +        !((msg->severity =3D=3D PCI_ERR_ROOT_CMD_NONFATAL_EN) &&
> +          (devctl & PCI_EXP_DEVCTL_NFERE)) &&
> +        !((msg->severity =3D=3D PCI_ERR_ROOT_CMD_COR_EN) &&
> +          (devctl & PCI_EXP_DEVCTL_CERE)) &&
> +        !((msg->severity =3D=3D PCI_ERR_ROOT_CMD_FATAL_EN) &&
> +          (devctl & PCI_EXP_DEVCTL_FERE))) {
>          return false;
>      }
> =20
> --=20
> 2.37.2
>=20
> =

