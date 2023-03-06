Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B1F6ACAC6
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 18:38:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZEmY-0004IA-Si; Mon, 06 Mar 2023 12:37:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fan.ni@samsung.com>)
 id 1pZEmW-0004Ho-H8
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 12:37:52 -0500
Received: from mailout1.w2.samsung.com ([211.189.100.11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fan.ni@samsung.com>)
 id 1pZEmS-0004pj-QR
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 12:37:52 -0500
Received: from uscas1p1.samsung.com (unknown [182.198.245.206])
 by mailout1.w2.samsung.com (KnoxPortal) with ESMTP id
 20230306173743usoutp01ecc678f6b6de0b0b80d693e56ba7ee44~J5SB3-Om82686826868usoutp01f;
 Mon,  6 Mar 2023 17:37:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w2.samsung.com
 20230306173743usoutp01ecc678f6b6de0b0b80d693e56ba7ee44~J5SB3-Om82686826868usoutp01f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1678124263;
 bh=+DECmdPswst/XV3u5kyQ/V46jl2ssTX0GflLj7cHUeY=;
 h=From:To:CC:Subject:Date:In-Reply-To:References:From;
 b=Wd4RvUn/O7tY3AFaLtVEXx3dACsjKvldV6UKmhSjjcDGJ+LTRS8QMqII17I6s6MUu
 JktQvpaYsYbJ87OBsH/IP16nNuhO92QLJ1hY1IhCSWbRKM3xUQYgGU+RaI1pkm0jXk
 MgYZEhHIuPOnlHzjNepecSue8+oK4Kx9JvUJWIlI=
Received: from ussmges3new.samsung.com (u112.gpu85.samsung.co.kr
 [203.254.195.112]) by uscas1p2.samsung.com (KnoxPortal) with ESMTP id
 20230306173743uscas1p2405d1db3b207457287238b61ce651b2c~J5SBuCV300309903099uscas1p2A;
 Mon,  6 Mar 2023 17:37:43 +0000 (GMT)
Received: from uscas1p2.samsung.com ( [182.198.245.207]) by
 ussmges3new.samsung.com (USCPEMTA) with SMTP id 20.02.12196.7E426046; Mon, 
 6 Mar 2023 12:37:43 -0500 (EST)
Received: from ussmgxs2new.samsung.com (u91.gpu85.samsung.co.kr
 [203.254.195.91]) by uscas1p1.samsung.com (KnoxPortal) with ESMTP id
 20230306173743uscas1p1f464bb8a53859927472b90f7f9e017c9~J5SBU_6NE0248702487uscas1p1D;
 Mon,  6 Mar 2023 17:37:43 +0000 (GMT)
X-AuditID: cbfec370-5b3ff70000012fa4-44-640624e7ec58
Received: from SSI-EX2.ssi.samsung.com ( [105.128.2.145]) by
 ussmgxs2new.samsung.com (USCPEXMTA) with SMTP id F6.33.17110.6E426046; Mon, 
 6 Mar 2023 12:37:43 -0500 (EST)
Received: from SSI-EX2.ssi.samsung.com (105.128.2.227) by
 SSI-EX2.ssi.samsung.com (105.128.2.227) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.2375.24; Mon, 6 Mar 2023 09:37:42 -0800
Received: from SSI-EX2.ssi.samsung.com ([105.128.2.227]) by
 SSI-EX2.ssi.samsung.com ([105.128.2.227]) with mapi id 15.01.2375.024; Mon,
 6 Mar 2023 09:37:42 -0800
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
Subject: Re: [RESEND PATCH v6 3/8] hw/pci-bridge/cxl_root_port: Wire up AER
Thread-Topic: [RESEND PATCH v6 3/8] hw/pci-bridge/cxl_root_port: Wire up AER
Thread-Index: AQHZTQxQkYHUknmJgkm3Rob6/pEwfq7ukLgA
Date: Mon, 6 Mar 2023 17:37:42 +0000
Message-ID: <20230306173742.GC1489326@bgt-140510-bm03>
In-Reply-To: <20230302133709.30373-4-Jonathan.Cameron@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [105.128.2.176]
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <C033CFD0F72A9A44B24557E698A6C001@ssi.samsung.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrIKsWRmVeSWpSXmKPExsWy7djX87rPVdhSDGZ8k7O4+/gCm8X8tfdZ
 LN68WcNkceJmI5vFxLfrWS32P33OYrFq4TU2i/OzTrFYHN54hsliQVs7q8Wa+4dYLX6vfcxk
 8f/XKyB3hbDF8d4dLBYrj9k4CHi0XvrL5rFz1l12j5Yjb1k9Fu95yeRx59oeNo8n1zYzebzf
 d5XN4/MmuQCOKC6blNSczLLUIn27BK6MFZNfMhe0clfMP/yatYHxGUcXIweHhICJxOcf/F2M
 XBxCAisZJdoubGKHcFqZJA6c6WHrYuQEK/oyZxojRGIto8TO72dYIZyPjBK3jxxmg3CWMkq8
 +72SHaSFTUBRYl/XdrB2EQEjiXc3JoG1MwvsYZX4OGM+O8hyYQFviZ41IhA1PhKbNk1lh6mf
 tGQOI4jNIqAicaGlESzOK2Am0XfgHhtIK6eAo0T/9wCQMKOAmMT3U2uYQGxmAXGJW0/mM0Fc
 LSixaPYeZghbTOLfrodQ3yhK3P/+kh2iXk/ixtQpYCOZBewkOo4VQYS1JZYtfM0MsVVQ4uTM
 JywQrZISB1fcYAH5REJgPafEu93NbJBgdJF41m8LUSMt8ffuMiaIcLLEqo9cEOEciflLtkCN
 sZZY+Gc90wRGlVlIjp6F5KBZCAfNQnLQLCQHLWBkXcUoXlpcnJueWmycl1quV5yYW1yal66X
 nJ+7iRGYCk//O1ywg/HWrY96hxiZOBgPMUpwMCuJ8Fb9Zk0R4k1JrKxKLcqPLyrNSS0+xCjN
 waIkzmtoezJZSCA9sSQ1OzW1ILUIJsvEwSnVwORVUvHtP8fvuYvTTHiTdq4QW3VF8nd+O2/L
 lTap1/nbTvzY0svO8mKj5LaTR9svCPsLcbxiOSimOO3fgpo3KQnigcUbWWLSW5KrJ/7o+K2v
 2CXQ8NDihnRWx+d/s0y+nhdYty3UvrnwpYRF54bMwq8VR9Ttd4WaJQen7f9xMbX5Z/mminm7
 LI/JfHmyyJW7/eiMQvUJ15+8vMVR56W/emG07etF9xM97wc1RvE1/X+3a0vlKW1HFa3Pe4Lm
 PLJd/VZ6Rchsrs/hRuH72gN5TF8t16oQ1Kl6KON/OHbtn2PS91clRxvsc4lumTKL6erUh/Ha
 z75wlFaphiX/se+seBZ2tkxt5rWAkMRfm3vVTiqxFGckGmoxFxUnAgAVZyMH9AMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA02SeUwTQRjFM3t1qTaOFe2Idz2iENGi0VVRMWqoCPGKmmgQK2yAWArZWgX+
 EbRYrScgCpVYGqtWBI+q4QhWBZWKGhqjBfFoBKTWcgRRSYpn2Rj5771v3vt9M8nQuDibDKKT
 VXtYTqVQSikhkZyF5c52T6MS5lbdIJh3bQ6KMZa7CKazswxj7K+zKSa36zrJ3PvoJphSk5Ni
 Gg0NBFN38xnGlBzSkUyZq5ZkBsrbMOa37/NfaxnF1B+vJJgrj8MjoDznxU9KXmV4J5BrH3aR
 8gs1Hkz+1llDydudtzB5j+0VJe+zTlxPbxOGJ7DK5L0sN2fZTmGSJd+Dp+UMSzfWecks0EHr
 QQCN4Hz0tfgM0AMhLYZXAfqkyyd40wtQ6bVyijcXAfI6nJS/QsEpyKavGNSBMAx1N+cN1nFY
 TaK2i26BHtD0KLgWHSsL5DPRyGotEPzL55mLgV8TcBpyaLMH5yK4AJ24/36QKYb7kK2plfRj
 AuAKdLJ/vX8M4BjU31CG+TUOJail3YjxL4DIXNOI83o08rT9Ink9Bbn6PQI+H4qaC05TfiQO
 l6HDjzl+HIIumbw4f4OR6ElRO8FXx6IHlmbiFECGIdsMQ0iG/yTDEJJhCKkEkKVAolGrUxLT
 1WEqdl+oWpGi1qgSQ+NTU6zg7y95+qtueyV409IbWgswGtQCROPSQFHmAJkgFiUoMjJZLjWO
 0yhZdS0YRxNSicizLTdODBMVe9jdLJvGcv9OMTogKAvbXOy54bop06/+UbprsujBjIhH1ePr
 OiZLNR7ImQQC5uCz2N60zniHrjjkSYQttl9hnhqj7TLancbNs6xLvpFF0gqzJWbCtyO+e1FH
 JMH586pld0K0YRZfztc1YSvzppIzqw+sOpdx+M5DX99Jo7OnMcNk20hmrrPfXdJS4KiI5yb1
 zY9WNi0M7ihMr9y+a4Y3OXp/5lHM4O6OzB7YaF8u6Y5Y+n6rLt47PKbwqXi67vvA9UUfvs+6
 vKEe3xm5g4p20zErTkW1C0f0pLoWf1G+RLKSRbkjz/rGa5pum3akNLSev2RtPXhAmxRUr9ri
 iJvjNo8oDOeKNmELZc/tc6NIKaFOUsiCcU6t+AMxc5cplAMAAA==
X-CMS-MailID: 20230306173743uscas1p1f464bb8a53859927472b90f7f9e017c9
CMS-TYPE: 301P
X-CMS-RootMailID: 20230306173743uscas1p1f464bb8a53859927472b90f7f9e017c9
References: <20230302133709.30373-1-Jonathan.Cameron@huawei.com>
 <20230302133709.30373-4-Jonathan.Cameron@huawei.com>
 <CGME20230306173743uscas1p1f464bb8a53859927472b90f7f9e017c9@uscas1p1.samsung.com>
Received-SPF: pass client-ip=211.189.100.11; envelope-from=fan.ni@samsung.com;
 helo=mailout1.w2.samsung.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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

On Thu, Mar 02, 2023 at 01:37:04PM +0000, Jonathan Cameron wrote:
> We are missing necessary config write handling for AER emulation in
> the CXL root port. Add it based on pcie_root_port.c
>=20
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by: Dave Jiang <dave.jiang@intel.com>
> ---
>  hw/pci-bridge/cxl_root_port.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/hw/pci-bridge/cxl_root_port.c b/hw/pci-bridge/cxl_root_port.=
c
> index 6664783974..00195257f7 100644
> --- a/hw/pci-bridge/cxl_root_port.c
> +++ b/hw/pci-bridge/cxl_root_port.c
> @@ -187,12 +187,15 @@ static void cxl_rp_write_config(PCIDevice *d, uint3=
2_t address, uint32_t val,
>                                  int len)
>  {
>      uint16_t slt_ctl, slt_sta;
> +    uint32_t root_cmd =3D
> +        pci_get_long(d->config + d->exp.aer_cap + PCI_ERR_ROOT_COMMAND);
> =20
>      pcie_cap_slot_get(d, &slt_ctl, &slt_sta);
>      pci_bridge_write_config(d, address, val, len);
>      pcie_cap_flr_write_config(d, address, val, len);
>      pcie_cap_slot_write_config(d, slt_ctl, slt_sta, address, val, len);
>      pcie_aer_write_config(d, address, val, len);
> +    pcie_aer_root_write_config(d, address, val, len, root_cmd);
> =20
>      cxl_rp_dvsec_write_config(d, address, val, len);
>  }
> --=20
> 2.37.2
>=20
>=20

Reviewed-by: Fan Ni <fan.ni@samsung.com>

