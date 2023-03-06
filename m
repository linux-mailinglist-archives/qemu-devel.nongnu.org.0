Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D66706AC9B1
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 18:21:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZEWc-0005WG-CK; Mon, 06 Mar 2023 12:21:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fan.ni@samsung.com>)
 id 1pZEWY-0005Sf-KJ
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 12:21:22 -0500
Received: from mailout2.w2.samsung.com ([211.189.100.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fan.ni@samsung.com>)
 id 1pZEWV-0007PO-9V
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 12:21:22 -0500
Received: from uscas1p2.samsung.com (unknown [182.198.245.207])
 by mailout2.w2.samsung.com (KnoxPortal) with ESMTP id
 20230306172109usoutp0251895ee01d9b0cf9281588d21039974a~J5DkJMBLz2817428174usoutp02I;
 Mon,  6 Mar 2023 17:21:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w2.samsung.com
 20230306172109usoutp0251895ee01d9b0cf9281588d21039974a~J5DkJMBLz2817428174usoutp02I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1678123269;
 bh=oVrGyqj5fruilJyCpeScSd9tmcC7TsReUrLbABiMFlI=;
 h=From:To:CC:Subject:Date:In-Reply-To:References:From;
 b=WjT1i72K9Q/YmoW1LVQF5OWcLqouv/hdED6CUFKusvDg+yLkhwfG5l/YxgEZdzlaA
 KCtzAlT9/diH81I9wj3q1Kgrj8sHJtqu34sUH5GNrKQmpAzUZZCyY6FV5I6Ts6Twtb
 zyAm1VhlhPTixFgQZjXwnvefi0QEz9M4pY0OQHw0=
Received: from ussmges1new.samsung.com (u109.gpu85.samsung.co.kr
 [203.254.195.109]) by uscas1p1.samsung.com (KnoxPortal) with ESMTP id
 20230306172109uscas1p1721118a231b265150e2135f4e246a540~J5Dj3KhrQ1907519075uscas1p1b;
 Mon,  6 Mar 2023 17:21:09 +0000 (GMT)
Received: from uscas1p2.samsung.com ( [182.198.245.207]) by
 ussmges1new.samsung.com (USCPEMTA) with SMTP id 82.29.06976.50126046; Mon, 
 6 Mar 2023 12:21:09 -0500 (EST)
Received: from ussmgxs2new.samsung.com (u91.gpu85.samsung.co.kr
 [203.254.195.91]) by uscas1p1.samsung.com (KnoxPortal) with ESMTP id
 20230306172108uscas1p1b96bacd10b120f3fd93c3309ac2b8880~J5DjRY8Kt1845618456uscas1p1f;
 Mon,  6 Mar 2023 17:21:08 +0000 (GMT)
X-AuditID: cbfec36d-afdff70000011b40-02-64062105abcb
Received: from SSI-EX1.ssi.samsung.com ( [105.128.2.145]) by
 ussmgxs2new.samsung.com (USCPEXMTA) with SMTP id 53.92.17110.40126046; Mon, 
 6 Mar 2023 12:21:08 -0500 (EST)
Received: from SSI-EX2.ssi.samsung.com (105.128.2.227) by
 SSI-EX1.ssi.samsung.com (105.128.2.226) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.2375.24; Mon, 6 Mar 2023 09:21:08 -0800
Received: from SSI-EX2.ssi.samsung.com ([105.128.2.227]) by
 SSI-EX2.ssi.samsung.com ([105.128.2.227]) with mapi id 15.01.2375.024; Mon,
 6 Mar 2023 09:21:08 -0800
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
Subject: Re: [RESEND PATCH v6 1/8] hw/pci/aer: Implement PCI_ERR_UNCOR_MASK
 register
Thread-Topic: [RESEND PATCH v6 1/8] hw/pci/aer: Implement PCI_ERR_UNCOR_MASK
 register
Thread-Index: AQHZTQws9oQ7hG/g40Ctl8icpS23qa7ujBMA
Date: Mon, 6 Mar 2023 17:21:07 +0000
Message-ID: <20230306172056.GA1489326@bgt-140510-bm03>
In-Reply-To: <20230302133709.30373-2-Jonathan.Cameron@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [105.128.2.176]
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <79B00DC6DA063B4C97E7E4AAD827A869@ssi.samsung.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Brightmail-Tracker: H4sIAAAAAAAAA01SbUxTZxjde7+41DR5LQyewZyhMfuhswIx2w0gkUyTu5gYSCZuRjOb9gaU
 lpoWhhqW8DGYFDFC3CZlS2FqRSwyQVl1FQa0qFcXvxipla5dgLBufAyNguPD2V7I+HfO85xz
 nvMmL0sqhuk49kB+gWDMV+uUjIzq7H9+byOdwGgTX3TGcb7h+wxnbfVT3Pi4neBuPS5luNqJ
 NprrHh2juJamQYa7ZxEpru/yXYJrrPyK5uz+Xpqbax0muFf//vWaNkdxN2scFHehP20r5ise
 LjD8NYsvgv/SNUHzZ5xBgh8adDL8yGAHwU91/cbwz9rfyWT3yNK0gu7A54JxU/p+WW678zlz
 6CI+fPzn+0wJurLKjCJZwJuh9fIkY0YyVoEvILgWtJMSqSDA/KArYlllC/gjpEUrgs4p+xKZ
 RuAP1IdVCnwOwaNzySHM4AToMv/EhHA0ToZJTx0KGUjspGH6tDVsiMLZUBaYJSTRbvCN95HL
 hovOxjCm8DpoPi2G9XL8PvSXPaDNiGUjcQZUVbKhMcIxMCPawzEkjgXviJWQWq+GHxqcpIRj
 YPH6H4yEE8A/E4yQ9CrwfH2KCUWSOB1+te2TxhvA1vQ3KV1dDbfrRyjJ+hb0NHuo0FMAt0VC
 c6136dY2mHU/pSUcDws+GxHKBKyBlmmZNNaB9eyVpZxUaJpvI06idZYVrS0rGln+b2RZ0ciy
 olEjoltQbKHJpM8RTEn5QpHKpNabCvNzVBqDvh29/od3Fvv0DuTwTqt6EcGiXgQsqYyWH52j
 tQq5Vn3kqGA0fGYs1AmmXhTPUspYedKW2xoFzlEXCHmCcEgwLm8JNjKuhCiJ/+IT1UJmV3K6
 zlAq97+nHMrz8mOZ1J20G9nv7j2sGSxPPL9jLMDUGPMGxLptua4s0efNfjb3aUzOy9SnmaeU
 BSdEg7b4RJM645+MKlfxdzsdv+xq+biy5o2bR6pSXuzrmTf+PuG2lD0kZ5UvlUVV+oGrhoOO
 XEOxLbl8+56NWXerOYVGIQ64fuyv1k81fFC24HGgg0/csgZxTcfi9bPfBNkbUR1i6ofb96+d
 4V5t+ShvVSI1+fjNwJqeRzgqbXNHIEteeqvIcQa7n4zurC2Xj9WtrbZuWjw2X3F1g8/pOrZj
 b/23AwWe8yd3d899n1L0dvB499ahUXwpZXYm+k+ZW0mZctVJ60mjSf0fheYylfYDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa1BMYRjHvefW2djx2kqvXNLWTKOmTQmHqWjG5ZihyQwaGVOrPbZS29ot
 uX1I47rjtsRwMlOJpLboNpVWWFS6KCKrJKM1zdJKiEajdOwYffs9z/N7/u/z4aVxyRjhRser
 UjiNSp4opRyJ+HRM70d4UIqFHSUypqevnWKyi3sJZmDAgDGNrw9RjN52i2TufegnmMLcTopp
 45sI5mFpC8bkHD1GMoZeE8mMFvdhzPivjxNlgRPTcKqaYG7WB6+E7JHnvym2hu9xYA8/spFs
 ntGKsW86jRRr6SzH2MG6lxT7rWxeBB3lGKzgEuP3cBr/0BjHuDLjMKUugntP1rZT6aBiqg6I
 aASDUP67XgeBJbAIoK7xMB1wnOAhgFqHBwn74DpALXnzBaagB6rTVVECO8NA9Nl8DggLOLxD
 or7r/X+TnOAWlPFuBNMBekKKRKPHw/75RcYcXGACeqGCS01/dTFcguoznpGCLoFp6OuJGAFF
 MAydOEoLBoAz0c8mAyYwDl1RlyUbs58P0TVjG25nF2TtGyPt7IF6f1od7L4MmS9kUkIkDkNR
 a/52e9sX5ed+wu0HzEBPLlsI++os9KDATJwFiJ/0Gj8pif+fxE9K4icl5QCyELimarVJyr3a
 QBWXJtPKk7SpKqUsNjmpDEx8keaxh9uqQXfXkMwEMBqYAKJxqbN4/yipkIgV8n37OU1ytCY1
 kdOawGyakLqKrVH6aAlUylO4XRyn5jT/phgtckvHWO/CJuOVWtmUuS/F01an3tvE3nwlD+nI
 GFyXcCbAEi452LAjpHZ8jdo/oCS3/8WFiPPzpci7fKftbNagW/OV/jrzgCHY5JOleORON698
 HhLpTpzZUe/fcsgwJ8IzNJD3+r6mKvvq+5rbUUqXGz5Hiqs+Vnp/qOA2RlRULmtY7xLduijh
 1fj9zItL1xfp3duCdA0/atTrYpM9RTOG/aXDJervK5SNQwUj1mwru/WxDQuPtFG7rXMOtFf7
 7Sx97728u5E1vP315bTPdH6zxVVvUi1LcaIXbF5l9nuzxGmTV7ko7emD0biriwc6AltvVy/I
 U0VuuNuTJ1+dsG+EXsRvzFrrKyW0cfIAH1yjlf8BpsZfd5EDAAA=
X-CMS-MailID: 20230306172108uscas1p1b96bacd10b120f3fd93c3309ac2b8880
CMS-TYPE: 301P
X-CMS-RootMailID: 20230306172108uscas1p1b96bacd10b120f3fd93c3309ac2b8880
References: <20230302133709.30373-1-Jonathan.Cameron@huawei.com>
 <20230302133709.30373-2-Jonathan.Cameron@huawei.com>
 <CGME20230306172108uscas1p1b96bacd10b120f3fd93c3309ac2b8880@uscas1p1.samsung.com>
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

On Thu, Mar 02, 2023 at 01:37:02PM +0000, Jonathan Cameron wrote:
> This register in AER should be both writeable and should
> have a default value with a couple of the errors masked
> including the Uncorrectable Internal Error used by CXL for
> it's error reporting.
>=20
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by: Dave Jiang <dave.jiang@intel.com>
> ---

Reviewed-by: Fan Ni <fan.ni@samsung.com>

>  hw/pci/pcie_aer.c          | 4 ++++
>  include/hw/pci/pcie_regs.h | 3 +++
>  2 files changed, 7 insertions(+)
>=20
> diff --git a/hw/pci/pcie_aer.c b/hw/pci/pcie_aer.c
> index 9a19be44ae..909e027d99 100644
> --- a/hw/pci/pcie_aer.c
> +++ b/hw/pci/pcie_aer.c
> @@ -112,6 +112,10 @@ int pcie_aer_init(PCIDevice *dev, uint8_t cap_ver, u=
int16_t offset,
> =20
>      pci_set_long(dev->w1cmask + offset + PCI_ERR_UNCOR_STATUS,
>                   PCI_ERR_UNC_SUPPORTED);
> +    pci_set_long(dev->config + offset + PCI_ERR_UNCOR_MASK,
> +                 PCI_ERR_UNC_MASK_DEFAULT);
> +    pci_set_long(dev->wmask + offset + PCI_ERR_UNCOR_MASK,
> +                 PCI_ERR_UNC_SUPPORTED);
> =20
>      pci_set_long(dev->config + offset + PCI_ERR_UNCOR_SEVER,
>                   PCI_ERR_UNC_SEVERITY_DEFAULT);
> diff --git a/include/hw/pci/pcie_regs.h b/include/hw/pci/pcie_regs.h
> index 963dc2e170..6ec4785448 100644
> --- a/include/hw/pci/pcie_regs.h
> +++ b/include/hw/pci/pcie_regs.h
> @@ -155,6 +155,9 @@ typedef enum PCIExpLinkWidth {
>                                           PCI_ERR_UNC_ATOP_EBLOCKED |    =
\
>                                           PCI_ERR_UNC_TLP_PRF_BLOCKED)
> =20
> +#define PCI_ERR_UNC_MASK_DEFAULT        (PCI_ERR_UNC_INTN | \
> +                                         PCI_ERR_UNC_TLP_PRF_BLOCKED)
> +
>  #define PCI_ERR_UNC_SEVERITY_DEFAULT    (PCI_ERR_UNC_DLP |              =
\
>                                           PCI_ERR_UNC_SDN |              =
\
>                                           PCI_ERR_UNC_FCP |              =
\
> --=20
> 2.37.2
>=20
> =

