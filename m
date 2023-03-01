Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6106A77AD
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 00:33:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXVvD-0005br-E8; Wed, 01 Mar 2023 18:31:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fan.ni@samsung.com>)
 id 1pXVvB-0005bj-9P
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 18:31:41 -0500
Received: from mailout1.w2.samsung.com ([211.189.100.11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fan.ni@samsung.com>)
 id 1pXVv7-0001x5-NR
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 18:31:41 -0500
Received: from uscas1p2.samsung.com (unknown [182.198.245.207])
 by mailout1.w2.samsung.com (KnoxPortal) with ESMTP id
 20230301233131usoutp019cb1494582ac4a438eaca387be728cb9~Ib4ggj2FY2229222292usoutp012;
 Wed,  1 Mar 2023 23:31:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w2.samsung.com
 20230301233131usoutp019cb1494582ac4a438eaca387be728cb9~Ib4ggj2FY2229222292usoutp012
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1677713491;
 bh=h765QhC8FCEZrNawIIXY+S1pXUl6tkWkze+8yvBwe1o=;
 h=From:To:CC:Subject:Date:In-Reply-To:References:From;
 b=C6GVgtMREdA7KgF6c48qVEVCUaOriOJwj4Su3Ygqup1hW0BsQCmFgV6qxUBZzcLKA
 WFT4tQVimQpJGQ90C6IMn9/uzfJIedgDn3ZcnJ+YpS7LYoQpDk7xf5sQ9iMhozcQaG
 ugWBwTGS/MdmCS0/DGa8XyuRCDvKZ5eUfD6+1+iA=
Received: from ussmges2new.samsung.com (u111.gpu85.samsung.co.kr
 [203.254.195.111]) by uscas1p1.samsung.com (KnoxPortal) with ESMTP id
 20230301233131uscas1p10794ae973bc770f40aeff89ae21a1b8e~Ib4gXvRtM1405614056uscas1p1D;
 Wed,  1 Mar 2023 23:31:31 +0000 (GMT)
Received: from uscas1p1.samsung.com ( [182.198.245.206]) by
 ussmges2new.samsung.com (USCPEMTA) with SMTP id DC.FE.49129.350EFF36; Wed, 
 1 Mar 2023 18:31:31 -0500 (EST)
Received: from ussmgxs2new.samsung.com (u91.gpu85.samsung.co.kr
 [203.254.195.91]) by uscas1p1.samsung.com (KnoxPortal) with ESMTP id
 20230301233131uscas1p1bb4ea930c66fd4a9e355c8bb830db3f9~Ib4f7MTZ42935229352uscas1p1n;
 Wed,  1 Mar 2023 23:31:31 +0000 (GMT)
X-AuditID: cbfec36f-167fe7000001bfe9-6c-63ffe053a4cd
Received: from SSI-EX1.ssi.samsung.com ( [105.128.2.145]) by
 ussmgxs2new.samsung.com (USCPEXMTA) with SMTP id D2.DE.17110.250EFF36; Wed, 
 1 Mar 2023 18:31:30 -0500 (EST)
Received: from SSI-EX2.ssi.samsung.com (105.128.2.227) by
 SSI-EX1.ssi.samsung.com (105.128.2.226) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.2375.24; Wed, 1 Mar 2023 15:31:30 -0800
Received: from SSI-EX2.ssi.samsung.com ([105.128.2.227]) by
 SSI-EX2.ssi.samsung.com ([105.128.2.227]) with mapi id 15.01.2375.024; Wed,
 1 Mar 2023 15:31:30 -0800
From: Fan Ni <fan.ni@samsung.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Michael Tsirkin
 <mst@redhat.com>, "linux-cxl@vger.kernel.org" <linux-cxl@vger.kernel.org>,
 "linuxarm@huawei.com" <linuxarm@huawei.com>, Ira Weiny
 <ira.weiny@intel.com>, =?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?=
 <philmd@linaro.org>, Dave Jiang <dave.jiang@intel.com>
Subject: Re: [PATCH v2 3/6] bswap: Add the ability to store to an unaligned
 24 bit field
Thread-Topic: [PATCH v2 3/6] bswap: Add the ability to store to an unaligned
 24 bit field
Thread-Index: AQHZSs2ZilSdKpsGkUmfFTHAPmMwEK7nHGaA
Date: Wed, 1 Mar 2023 23:31:30 +0000
Message-ID: <20230301233129.GB1429848@bgt-140510-bm03>
In-Reply-To: <20230227170311.20054-4-Jonathan.Cameron@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [105.128.2.176]
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <87F3AE79F942B34699B3DD5837CFC99E@ssi.samsung.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa1BMYRjH5z3n7HF2m+W0Gz1KjB0fxNgK1XEJjds2fHBLJmNY25GmrdYe
 uV8KfbBDuYSsqC0aRVJSyVpjhUrIjtqUEtY0m6nsYHKrZZ0y++33Ps///76/Dy+FS0oFPlRc
 4nZWm6hUy0gRUfH42/NpqzudqsBHjcDUvk4lmfsfuwimyNBMMi/09QTzsLQBY5w/uwXM9atS
 5snxKmIBpThS0yNQ5BvtmOJNs5FU2JpvYYo+UxOp+FI2fgUZLZobw6rjdrDagHmbRFuz7CGa
 POmunouFKAWZR+qQkAJ6JlwrHhDokIiS0IUIsk7n4PwhDQNbt04wnOp4Pki4WEIXI3hWOIMP
 ORB8uHcK4xdXEFRX+riYpCeCSVdJutiLng69LaeQq4DTjzGwX276d6uUjoZLlnsEH1oPqTrn
 /4Iz+8bfOUUR9CTo/OjpGovpEDjZehZ3sZAOh5dHjiEXI3oM9Ndf/+eA097QasvBeGlPyLtg
 xHkeA4PV70ieJ8LbfvsIPi+HljOZJM/zwHi4l+B5KhQYPuH8u55Qd95G8N2x8OBqyxDbKOg5
 H87zIrh9OAPx7AsD7QWYSx9oFRQ5RPxYDTmXy4eqc8DwuwQ7gSbp3az1bkZ6NyO9m5HezSgX
 CYqQdzLHJcSy3PREdqecUyZwyYmxclVSQhn6+6ueDj5MqkLWVofcjDAKmRFQuMxLbGj7rZKI
 Y5S797DapI3aZDXLmZEvRci8xUFhdSoJHavczsazrIbVDm8xSuiTgnFLJ3ssTduVpbTmRd6c
 YGGOT72N91aY96lorSa+Y+0xa8mMyMajD2a/9RN7rG83qZLz00eZo5/URflFBaR+j+/QWRZz
 49IPeGVeuuvPDKTG+0uFHJP+ptpqml27Zv7CwKyq0B/nSjJyTA0RB0fXiNID0KJDn+/7xoX4
 3OnmXm1oGKetGhts2PgCyZZ7BDeGTvYrnpVviV01aO9r87/ZS1re63UrTyzpo8vScvdWjF9C
 LQv5FaSM0Wjqgwsy14WZKzUe2d/VLxc2BeorjTVCkXPtNvh6y9G1OePTptz8aqHVUS7oyhZE
 BMfsrxioJUIj902DUqt3ubRGHtW2ZVlgkozgtiqDpuBaTvkHvEIrTMQDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrAIsWRmVeSWpSXmKPExsWS2cA0UTfowf9kg4u3zSxO3Gxks9j/9DmL
 xaqF19gszs86xWJxeOMZJov/v16xWqxZIWxxvHcHiwOHR8uRt6wei/e8ZPK4c20Pm8eTa5uZ
 PN7vu8rm8XmTXABbFJdNSmpOZllqkb5dAlfGjJdmBYuEK97OXcnYwHiIr4uRk0NCwETi3rl/
 LF2MXBxCAqsZJd60v2WDcD4ySuxfvQHKWcoo0bXxASNIC5uAosS+ru1sILaIgJHEuxuTwOLM
 AseYJPY8Meti5OAQFoiS+DTLGqIkWmLKp0uMMOX/56xjASlhEVCRePBUECTMK2AmMfHWNGYQ
 W0igXGLT+k0sIDangKPExZYesFZGATGJ76fWMEFsEpe49WQ+E8QDAhJL9pxnhrBFJV4+/scK
 YStK3P/+kh2iXk/ixtQpbBC2ncSe5ncsELa2xLKFr5khbhCUODnzCQtEr6TEwRU3WCYwSsxC
 sm4WklGzkIyahWTULCSjFjCyrmIULy0uzk2vKDbKSy3XK07MLS7NS9dLzs/dxAiM9NP/Dkfv
 YLx966PeIUYmDsZDjBIczEoivAtv/0kW4k1JrKxKLcqPLyrNSS0+xCjNwaIkzvsyamK8kEB6
 YklqdmpqQWoRTJaJg1OqgWne5rOv2brmnFrF3BQ1yf9k0ms2Y+uJy2/Ne2t0X+H5mRePzJ//
 ZpuWKNh3Q74y6/WMhSvrxQ+nx82PP3OCq+9ViUvb9aw1Whvvfgzq/+lZyJF/O/OeuJjzhWf2
 32IUM9adeTpBLTit40bqYTGjWyttqt7MyM+RazTktJ43Yb3R4aJ4WfO4hMbPN3ICrjP5Xc4Q
 ceXQ+dYh77Yl9sKTPTM91JiyRAwYbUIe/ptyMP2a+ILzTwXmpMQ9Z3rl9vRaS+BDN6H/d29/
 q3iQqF6X8vRpdePHX06pkXyykerXtiSdW9Y1Z7+DlPPnj1O4E3792/248dOf1l+av3+vEZvT
 p6hTxOqSyZj+XyX9zzp3Z3UlluKMREMt5qLiRACAr393YwMAAA==
X-CMS-MailID: 20230301233131uscas1p1bb4ea930c66fd4a9e355c8bb830db3f9
CMS-TYPE: 301P
X-CMS-RootMailID: 20230301233131uscas1p1bb4ea930c66fd4a9e355c8bb830db3f9
References: <20230227170311.20054-1-Jonathan.Cameron@huawei.com>
 <20230227170311.20054-4-Jonathan.Cameron@huawei.com>
 <CGME20230301233131uscas1p1bb4ea930c66fd4a9e355c8bb830db3f9@uscas1p1.samsung.com>
Received-SPF: pass client-ip=211.189.100.11; envelope-from=fan.ni@samsung.com;
 helo=mailout1.w2.samsung.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Mon, Feb 27, 2023 at 05:03:08PM +0000, Jonathan Cameron wrote:
> From: Ira Weiny <ira.weiny@intel.com>
>=20
> CXL has 24 bit unaligned fields which need to be stored to.  CXL is
> specified as little endian.
>=20
> Define st24_le_p() and the supporting functions to store such a field
> from a 32 bit host native value.
>=20
> The use of b, w, l, q as the size specifier is limiting.  So "24" was
> used for the size part of the function name.
>=20
> Signed-off-by: Ira Weiny <ira.weiny@intel.com>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>=20

Reviewed-by: Fan Ni <fan.ni@samsung.com>

> ---
> v7:
>   - Pulled this patch out of the CXL events series as Ira pointed
>     out it can be used to simplify this series.
> ---
>  include/qemu/bswap.h | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>=20
> diff --git a/include/qemu/bswap.h b/include/qemu/bswap.h
> index 15a78c0db5..ee71cbeaaa 100644
> --- a/include/qemu/bswap.h
> +++ b/include/qemu/bswap.h
> @@ -8,11 +8,23 @@
>  #undef  bswap64
>  #define bswap64(_x) __builtin_bswap64(_x)
> =20
> +static inline uint32_t bswap24(uint32_t x)
> +{
> +    return (((x & 0x000000ffU) << 16) |
> +            ((x & 0x0000ff00U) <<  0) |
> +            ((x & 0x00ff0000U) >> 16));
> +}
> +
>  static inline void bswap16s(uint16_t *s)
>  {
>      *s =3D __builtin_bswap16(*s);
>  }
> =20
> +static inline void bswap24s(uint32_t *s)
> +{
> +    *s =3D bswap24(*s);
> +}
> +
>  static inline void bswap32s(uint32_t *s)
>  {
>      *s =3D __builtin_bswap32(*s);
> @@ -176,6 +188,7 @@ CPU_CONVERT(le, 64, uint64_t)
>   * size is:
>   *   b: 8 bits
>   *   w: 16 bits
> + *   24: 24 bits
>   *   l: 32 bits
>   *   q: 64 bits
>   *
> @@ -248,6 +261,11 @@ static inline void stw_he_p(void *ptr, uint16_t v)
>      __builtin_memcpy(ptr, &v, sizeof(v));
>  }
> =20
> +static inline void st24_he_p(void *ptr, uint32_t v)
> +{
> +    __builtin_memcpy(ptr, &v, 3);
> +}
> +
>  static inline int ldl_he_p(const void *ptr)
>  {
>      int32_t r;
> @@ -297,6 +315,11 @@ static inline void stw_le_p(void *ptr, uint16_t v)
>      stw_he_p(ptr, le_bswap(v, 16));
>  }
> =20
> +static inline void st24_le_p(void *ptr, uint32_t v)
> +{
> +    st24_he_p(ptr, le_bswap(v, 24));
> +}
> +
>  static inline void stl_le_p(void *ptr, uint32_t v)
>  {
>      stl_he_p(ptr, le_bswap(v, 32));
> --=20
> 2.37.2
>=20
> =

