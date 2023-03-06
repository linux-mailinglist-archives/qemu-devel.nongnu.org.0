Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCEF76ACB7F
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 18:55:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZF1h-0007OI-S7; Mon, 06 Mar 2023 12:53:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fan.ni@samsung.com>)
 id 1pZF1f-0007BQ-DM
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 12:53:31 -0500
Received: from mailout2.w2.samsung.com ([211.189.100.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fan.ni@samsung.com>)
 id 1pZF1d-0003E2-Mf
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 12:53:31 -0500
Received: from uscas1p1.samsung.com (unknown [182.198.245.206])
 by mailout2.w2.samsung.com (KnoxPortal) with ESMTP id
 20230306175328usoutp02a615a62c0d4b85c96d386c5859157e07~J5fxpiZF12344523445usoutp02N;
 Mon,  6 Mar 2023 17:53:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w2.samsung.com
 20230306175328usoutp02a615a62c0d4b85c96d386c5859157e07~J5fxpiZF12344523445usoutp02N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1678125208;
 bh=9X9GgHqHRXwYJkwmqid2segpwTyYcVSBs4Qglq2t1F0=;
 h=From:To:CC:Subject:Date:In-Reply-To:References:From;
 b=uvzvfZB6CUxc58c0xGW9kNsqarHQYN5EWZ0gW/2Vdu41bPbtpPkhtFYfytFUMEg8C
 4e6SyYIo6Z+8TMOQIdbBANHWJAHtEpYgSOYqtUBeczCXIJ3wquw6vnisYi44XriuTJ
 HpmUpgybr/FIYJ4Yfblbf2d0vf0hnuxAf1dUJ3Ls=
Received: from ussmges3new.samsung.com (u112.gpu85.samsung.co.kr
 [203.254.195.112]) by uscas1p1.samsung.com (KnoxPortal) with ESMTP id
 20230306175328uscas1p19e18d0001957cbbcbc177a1180766e64~J5fxepptR2738027380uscas1p13;
 Mon,  6 Mar 2023 17:53:28 +0000 (GMT)
Received: from uscas1p1.samsung.com ( [182.198.245.206]) by
 ussmges3new.samsung.com (USCPEMTA) with SMTP id FE.84.12196.89826046; Mon, 
 6 Mar 2023 12:53:28 -0500 (EST)
Received: from ussmgxs3new.samsung.com (u92.gpu85.samsung.co.kr
 [203.254.195.92]) by uscas1p1.samsung.com (KnoxPortal) with ESMTP id
 20230306175327uscas1p15622b1d859a60b2cc5d9df70182e35fe~J5fxJZvdr1854418544uscas1p1y;
 Mon,  6 Mar 2023 17:53:27 +0000 (GMT)
X-AuditID: cbfec370-5b3ff70000012fa4-ba-64062898cce0
Received: from SSI-EX1.ssi.samsung.com ( [105.128.2.145]) by
 ussmgxs3new.samsung.com (USCPEXMTA) with SMTP id 68.A7.11346.79826046; Mon, 
 6 Mar 2023 12:53:27 -0500 (EST)
Received: from SSI-EX2.ssi.samsung.com (105.128.2.227) by
 SSI-EX1.ssi.samsung.com (105.128.2.226) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.2375.24; Mon, 6 Mar 2023 09:53:27 -0800
Received: from SSI-EX2.ssi.samsung.com ([105.128.2.227]) by
 SSI-EX2.ssi.samsung.com ([105.128.2.227]) with mapi id 15.01.2375.024; Mon,
 6 Mar 2023 09:53:27 -0800
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
Subject: Re: [RESEND PATCH v6 7/8] hw/pci/aer: Make PCIE AER error injection
 facility available for other emulation to use.
Thread-Topic: [RESEND PATCH v6 7/8] hw/pci/aer: Make PCIE AER error
 injection facility available for other emulation to use.
Thread-Index: AQHZTQypFWLDKomDHUGIgneSD56y4a7ulR0A
Date: Mon, 6 Mar 2023 17:53:27 +0000
Message-ID: <20230306175326.GG1489326@bgt-140510-bm03>
In-Reply-To: <20230302133709.30373-8-Jonathan.Cameron@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [105.128.2.176]
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <A669D60850CA6047B9033D144657909A@ssi.samsung.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrCKsWRmVeSWpSXmKPExsWy7djXc7ozNNhSDGY3cVrcfXyBzWL+2vss
 Fm/erGGyOHGzkc1i4tv1rBb7nz5nsVi18BqbxflZp1gsDm88w2SxoK2d1WLN/UOsFr/XPmay
 +P/rFZC7QtjieO8OFouVx2wcBDxaL/1l89g56y67R8uRt6wei/e8ZPK4c20Pm8eTa5uZPN7v
 u8rm8XmTXABHFJdNSmpOZllqkb5dAlfGg312Bb+5K648a2FrYNzJ2cXIySEhYCLR1j2BuYuR
 i0NIYCWjxKGp/xkhnFYmiW3nFrLBVG3ftxvMFhJYyyixdaoqRNFHRol1Vz9CtS9llNiyZhMT
 SBWbgKLEvq7tYB0iAkYS725MAhvLLLCHVeLjjPnsXYwcHMICtRKtm4Uhauokmjfdhat/cKmZ
 FcRmEVCR+HegD8zmFTCTWPL/ElgNp4CjxJ5Xa8F2MQqISXw/tQbMZhYQl7j1ZD4TxNWCEotm
 72GGsMUk/u16CPWNosT97y/ZIer1JG5MncIGYdtJLFo5nQXC1pZYtvA1M8ReQYmTM5+wQPRK
 ShxccYMF5BcJgdWcEos2T2CHSLhIfP/yhhXClpaYvuYyC8iPEgLJEqs+ckGEcyTmL9kCNcda
 YuGf9UwTGFVmITl7FpKTZiE5aRaSk2YhOWkBI+sqRvHS4uLc9NRi47zUcr3ixNzi0rx0veT8
 3E2MwIR4+t/hgh2Mt2591DvEyMTBeIhRgoNZSYS36jdrihBvSmJlVWpRfnxRaU5q8SFGaQ4W
 JXFeQ9uTyUIC6YklqdmpqQWpRTBZJg5OqQamaJFqPbeQapEXXSUv7bZFS7TPLq7KEWt5XinF
 NJt9u4LWlaW7zbiO/z11591kfcHJzV49kk/EKzZdKUuQnvfQT0nHWa2GZcL1VbaOxu4BL+/k
 177W+M+WpFB4+LPYbhs9gT1cDL+q+ucHXJFVFtrkXeHppLzbrXypjlNkw6aI/V6OIX0dW1Qc
 d21lrmL5Z5w3y/fMWruI6xPfJQbcFnKz0XQUP/rFsvxuq4IB3+61DZYL5Iwe77r67sy2SYlq
 V7TtbYNmbjq1wO1p2+Ulm0T/SzL9YUksLtBd4ZZysTi0TFe1havVbfrshof913c8dJouLsbG
 uS3IpebXl5YlZ/6VzC1Zbn921ia17O3lekosxRmJhlrMRcWJABqAFtb3AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpmleLIzCtJLcpLzFFi42LJbGCaqDtdgy3FYNNPA4u7jy+wWcxfe5/F
 4s2bNUwWJ242sllMfLue1WL/0+csFqsWXmOzOD/rFIvF4Y1nmCwWtLWzWqy5f4jV4vfax0wW
 /3+9AnJXCFsc793BYrHymI2DgEfrpb9sHjtn3WX3aDnyltVj8Z6XTB53ru1h83hybTOTx/t9
 V9k8Pm+SC+CI4rJJSc3JLEst0rdL4Mp4sM+u4Dd3xZVnLWwNjDs5uxg5OSQETCS279vN1sXI
 xSEksJpR4uOzyVDOR0aJk7+fs0I4Sxkl7hx8ywbSwiagKLGvazuYLSJgJPHuxiRGkCJmgV2s
 Eo+XPmfvYuTgEBaolWjdLAxRUydxofcSI0z9g0vNrCA2i4CKxL8DfWA2r4CZxJL/l8BmCgmU
 S/w7/gAszingKLHn1VomEJtRQEzi+6k1YDazgLjErSfzmSBeEJBYsuc8M4QtKvHy8T9WCFtR
 4v73l+wQ9XoSN6ZOYYOw7SQWrZzOAmFrSyxb+JoZ4gZBiZMzn7BA9EpKHFxxg2UCo8QsJOtm
 IRk1C8moWUhGzUIyagEj6ypG8dLi4tz0imLjvNRyveLE3OLSvHS95PzcTYzAdHL63+GYHYz3
 bn3UO8TIxMF4iFGCg1lJhLfqN2uKEG9KYmVValF+fFFpTmrxIUZpDhYlcV6P2InxQgLpiSWp
 2ampBalFMFkmDk6pBiY3o8oLO1Xv1mh43Kz/H2wqJTTr640XVk9KcqLen3Q8tHNGjJP9avG4
 mTrrVB6bVU7jmzC1IUtZ80tJU47zlLsH9kZufcGfenjlxbMvSxeWa7U0OU7SzFRoehpmWpJy
 tGV135uaqHNcnRrHnugEsvpe2rb5cPO8vW/2W5of3ekfHMfHpioWbbp31Ron+/dblz5vmjvD
 /8Jpyw+mp6ovzFZ9fGLepr3/TL2vlbh+fL7pvd3Wxw2J57n+71rtP0fx7l/DxVrta3om9UXf
 P5aZzst2n2f74+UmJxTdvKcEu7G8CLzpuN5rv190Xn3JxtxVi6ap3ZxnZH/1Y9y5wweN3DfF
 ef8v2VPp+mLNZvG+ZYsKlFiKMxINtZiLihMBYrl9DZYDAAA=
X-CMS-MailID: 20230306175327uscas1p15622b1d859a60b2cc5d9df70182e35fe
CMS-TYPE: 301P
X-CMS-RootMailID: 20230306175327uscas1p15622b1d859a60b2cc5d9df70182e35fe
References: <20230302133709.30373-1-Jonathan.Cameron@huawei.com>
 <20230302133709.30373-8-Jonathan.Cameron@huawei.com>
 <CGME20230306175327uscas1p15622b1d859a60b2cc5d9df70182e35fe@uscas1p1.samsung.com>
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

On Thu, Mar 02, 2023 at 01:37:08PM +0000, Jonathan Cameron wrote:
> This infrastructure will be reused for CXL RAS error injection
> in patches that follow.
>=20
> Reviewed-by: Dave Jiang <dave.jiang@intel.com>
> Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@linaro.org>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
>  hw/pci/pci-internal.h     | 1 -
>  include/hw/pci/pcie_aer.h | 1 +
>  2 files changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/pci/pci-internal.h b/hw/pci/pci-internal.h
> index 2ea356bdf5..a7d6d8a732 100644
> --- a/hw/pci/pci-internal.h
> +++ b/hw/pci/pci-internal.h
> @@ -20,6 +20,5 @@ void pcibus_dev_print(Monitor *mon, DeviceState *dev, i=
nt indent);
> =20
>  int pcie_aer_parse_error_string(const char *error_name,
>                                  uint32_t *status, bool *correctable);
> -int pcie_aer_inject_error(PCIDevice *dev, const PCIEAERErr *err);
> =20
>  #endif
> diff --git a/include/hw/pci/pcie_aer.h b/include/hw/pci/pcie_aer.h
> index 65e71d98fe..1234fdc4e2 100644
> --- a/include/hw/pci/pcie_aer.h
> +++ b/include/hw/pci/pcie_aer.h
> @@ -100,4 +100,5 @@ void pcie_aer_root_write_config(PCIDevice *dev,
>                                  uint32_t addr, uint32_t val, int len,
>                                  uint32_t root_cmd_prev);
> =20
> +int pcie_aer_inject_error(PCIDevice *dev, const PCIEAERErr *err);
>  #endif /* QEMU_PCIE_AER_H */
> --=20
> 2.37.2
>=20
>=20

Reviewed-by: Fan Ni <fan.ni@samsung.com>

