Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B996C3A72
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 20:29:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pehea-0005Xl-KB; Tue, 21 Mar 2023 15:28:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fan.ni@samsung.com>)
 id 1peheY-0005OO-1a
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 15:28:14 -0400
Received: from mailout2.w2.samsung.com ([211.189.100.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fan.ni@samsung.com>)
 id 1peheV-0005fp-Er
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 15:28:13 -0400
Received: from uscas1p2.samsung.com (unknown [182.198.245.207])
 by mailout2.w2.samsung.com (KnoxPortal) with ESMTP id
 20230321192803usoutp02152e237a66f458b25815057bbd8ce1ad~OhdpI-z050177201772usoutp02h;
 Tue, 21 Mar 2023 19:28:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w2.samsung.com
 20230321192803usoutp02152e237a66f458b25815057bbd8ce1ad~OhdpI-z050177201772usoutp02h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1679426883;
 bh=wJDgUHfzLgnupTNaPv93v+3CMV+EHh/+qabCeul7890=;
 h=From:To:CC:Subject:Date:In-Reply-To:References:From;
 b=Fxk5gkLNVUkn22Q6PNF65RF1QM80qBsRvl7VjfaJobKxIiqAka9IkTCw9GnWrJsRl
 Zqv/abtgRFyST2rjtm/o4Rt2PCY8w03pFsz+vLO2zLZJ+R2223Bddc71W7AZV9mfix
 bWniNkvs0MkNdWn8ThhWyb3ac4ZS+Vnmrj83uHR0=
Received: from ussmges3new.samsung.com (u112.gpu85.samsung.co.kr
 [203.254.195.112]) by uscas1p1.samsung.com (KnoxPortal) with ESMTP id
 20230321192803uscas1p1a18cc23574537b560f0e842215d7f60a~Ohdo-TTTf1910319103uscas1p1C;
 Tue, 21 Mar 2023 19:28:03 +0000 (GMT)
Received: from uscas1p2.samsung.com ( [182.198.245.207]) by
 ussmges3new.samsung.com (USCPEMTA) with SMTP id ED.88.09547.3450A146; Tue,
 21 Mar 2023 15:28:03 -0400 (EDT)
Received: from ussmgxs1new.samsung.com (u89.gpu85.samsung.co.kr
 [203.254.195.89]) by uscas1p1.samsung.com (KnoxPortal) with ESMTP id
 20230321192803uscas1p159362a081168a51902245d16b77de92d~OhdosLeyK1838018380uscas1p1E;
 Tue, 21 Mar 2023 19:28:03 +0000 (GMT)
X-AuditID: cbfec370-79bff7000000254b-a4-641a05437e62
Received: from SSI-EX2.ssi.samsung.com ( [105.128.2.146]) by
 ussmgxs1new.samsung.com (USCPEXMTA) with SMTP id 60.E9.09541.2450A146; Tue,
 21 Mar 2023 15:28:03 -0400 (EDT)
Received: from SSI-EX2.ssi.samsung.com (105.128.2.227) by
 SSI-EX2.ssi.samsung.com (105.128.2.227) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.2375.24; Tue, 21 Mar 2023 12:28:02 -0700
Received: from SSI-EX2.ssi.samsung.com ([105.128.2.227]) by
 SSI-EX2.ssi.samsung.com ([105.128.2.227]) with mapi id 15.01.2375.024; Tue,
 21 Mar 2023 12:28:02 -0700
From: Fan Ni <fan.ni@samsung.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: Michael Tsirkin <mst@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "linuxarm@huawei.com" <linuxarm@huawei.com>, "Dave
 Jiang" <dave.jiang@intel.com>, "linux-cxl@vger.kernel.org"
 <linux-cxl@vger.kernel.org>
Subject: Re: [PATCH 1/2] hw/cxl: Fix endian handling for decoder commit.
Thread-Topic: [PATCH 1/2] hw/cxl: Fix endian handling for decoder commit.
Thread-Index: AQHZXB8PhkxCI1wsR0uQTaxcCsGRK68GE5YA
Date: Tue, 21 Mar 2023 19:28:02 +0000
Message-ID: <20230321192754.GA1621435@bgt-140510-bm03>
In-Reply-To: <20230321180012.2545-2-Jonathan.Cameron@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [105.128.2.176]
Content-Type: text/plain; charset="us-ascii"
Content-ID: <54D1F7479DB7E342919CF17AFBCF30AE@ssi.samsung.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrBKsWRmVeSWpSXmKPExsWy7djX87rOrFIpBkuPiVqcuNnIZrFq4TU2
 i/OzTrFYHN54hsni/69XrBbHe3ewOLB5tBx5y+qxeM9LJo8n1zYzebzfd5XN4/MmuQDWKC6b
 lNSczLLUIn27BK6MO5OXMxV0iFV8u/2ZpYHxoWAXIyeHhICJxNQnH5i7GLk4hARWMkqsnnOY
 BcJpZZKY++U6O0zV8Q1r2SASaxklzs6bxwrhfGKUmHb3GlRmGaPE+v4WZpAWNgFFiX1d29lA
 bBEBI4l3NyYxghQxCzxjlDjz7SATSEJYwEOi+fVqRogiT4nGxW3McA0/+1lBbBYBVYkV/w+A
 DeIVMJP4PecR2E2cAg4SFxatYgGxGQXEJL6fWgM2k1lAXOLWk/lMEHcLSiyavYcZwhaT+Lfr
 IRuErShx//tLdoh6HYkFuz+xQdh2Er+/7meEsLUlli18zQyxV1Di5MwnLBC9khIHV9wAB5KE
 wBUOiX+9h6ASLhJ3p/ZBA0xa4ur1qUDNHEB2ssSqj1wQ4RyJ+Uu2QJVbSyz8s55pAqPKLCRn
 z0Jy0iwkJ81CctIsJCctYGRdxSheWlycm55abJyXWq5XnJhbXJqXrpecn7uJEZiYTv87XLCD
 8datj3qHGJk4GA8xSnAwK4nwujFLpAjxpiRWVqUW5ccXleakFh9ilOZgURLnNbQ9mSwkkJ5Y
 kpqdmlqQWgSTZeLglGpgWnyz5qaS0lll5eM7Pb70tM+YHKDxPvT/hb3vJBaoGJRPrRF98eDY
 atUAo6X8X5s3fnGx3ld2/wK3QfxxnYcqpZq/mdvZ3BTPa+Xdcr0xea+Pyvb+6WmTb88uXNuX
 vuxXc6dqV/Vh371rd+3Y+HCxS/v/tsjJibNML3ZqJtjtl3/IeMb/t4wP21y2JJsYLgn2iq7q
 pJ57Etxv2DfNlHAtDymXF+jVC+LuexeVsqjTQ2LnjaCMSTeTTk2qX3+sntv42YytVWYn3hrW
 1O1yM9xY6POTwaSQR2Fnzzl7zYClm19xsM/Z0Cy9YfKD6OyWv/HJvkt4zudnn1zrznJzGqv6
 qUvfhA8LTz9oMOGH4PKpSizFGYmGWsxFxYkAjJADybsDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRmVeSWpSXmKPExsWS2cA0SdeZVSrFYH6JxYmbjWwWqxZeY7M4
 P+sUi8XhjWeYLP7/esVqcbx3B4sDm0fLkbesHov3vGTyeHJtM5PH+31X2Tw+b5ILYI3isklJ
 zcksSy3St0vgyrgzeTlTQYdYxbfbn1kaGB8KdjFyckgImEgc37CWrYuRi0NIYDWjxP0Z01kg
 nE+MEjNmHWeHcJYxShw99oIRpIVNQFFiX9d2NhBbRMBI4t2NSYwgRcwCzxglznw7yASSEBbw
 kGh+vZoRoshTonFxGzNcw89+VhCbRUBVYsX/A2CDeAXMJH7PecQOYgsJnGSU+N9VB2JzCjhI
 XFi0igXEZhQQk/h+ag3YfGYBcYlbT+YzQfwgILFkz3lmCFtU4uXjf6wQtqLE/e8v2SHqdSQW
 7P7EBmHbSfz+up8RwtaWWLbwNTPEDYISJ2c+YYHolZQ4uOIGywRGiVlI1s1CMmoWklGzkIya
 hWTUAkbWVYzipcXFuekVxYZ5qeV6xYm5xaV56XrJ+bmbGIExffrf4cgdjEdvfdQ7xMjEwXiI
 UYKDWUmE141ZIkWINyWxsiq1KD++qDQntfgQozQHi5I4r5DrxHghgfTEktTs1NSC1CKYLBMH
 p1QD0+VnV6+85zzw8vjCqeW8ZYWW+Urm+693bb63/M8GZ62La979SPPpPzfnyq9dEad+y5c2
 2Dy+c2yy1AqmXduuBJSuuWe68/J7LhnJLg/etdq/f78R55O4Ktrqu2j3l31irBb39X6mCpbs
 ksvl7DaLLF4Y+mHnkfnBCoFiXb0igadMy7cv03j9iXvd2aZzy/cJ+13h4PPjP3ym2vfmxt+t
 4sVP9oietr96LXn3pYmrE18q3RE54aXHoBe07s4fy/1NM1jSTS8xs9/SO/q0cBOf+NQpp5X9
 +dVCC2adlZA6Pr+t19Igbf+iMypGB/PnZQRuuM2uF1s8I+3RVuuGFR0/5Vwfp8g6yT8pqTdx
 Xp8vyabEUpyRaKjFXFScCACA5OQNWAMAAA==
X-CMS-MailID: 20230321192803uscas1p159362a081168a51902245d16b77de92d
CMS-TYPE: 301P
X-CMS-RootMailID: 20230321180043uscas1p26987d1a0d16fb69a44a0631bfc4c1eb9
References: <20230321180012.2545-1-Jonathan.Cameron@huawei.com>
 <CGME20230321180043uscas1p26987d1a0d16fb69a44a0631bfc4c1eb9@uscas1p2.samsung.com>
 <20230321180012.2545-2-Jonathan.Cameron@huawei.com>
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

On Tue, Mar 21, 2023 at 06:00:11PM +0000, Jonathan Cameron wrote:
> Not a real problem yet as all supported architectures are
> little endian, but continue to tidy these up when touching
> code for other reasons.
>=20
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Hi Jonathan,
Did you forget to send the other patch in this series by any chance?

Fan
> ---
>  hw/cxl/cxl-component-utils.c | 10 ++++------
>  hw/mem/cxl_type3.c           |  9 ++++++---
>  2 files changed, 10 insertions(+), 9 deletions(-)
>=20
> diff --git a/hw/cxl/cxl-component-utils.c b/hw/cxl/cxl-component-utils.c
> index b665d4f565..a3e6cf75cf 100644
> --- a/hw/cxl/cxl-component-utils.c
> +++ b/hw/cxl/cxl-component-utils.c
> @@ -47,14 +47,12 @@ static void dumb_hdm_handler(CXLComponentState *cxl_c=
state, hwaddr offset,
>          break;
>      }
> =20
> -    memory_region_transaction_begin();
> -    stl_le_p((uint8_t *)cache_mem + offset, value);
>      if (should_commit) {
> -        ARRAY_FIELD_DP32(cache_mem, CXL_HDM_DECODER0_CTRL, COMMIT, 0);
> -        ARRAY_FIELD_DP32(cache_mem, CXL_HDM_DECODER0_CTRL, ERR, 0);
> -        ARRAY_FIELD_DP32(cache_mem, CXL_HDM_DECODER0_CTRL, COMMITTED, 1)=
;
> +        value =3D FIELD_DP32(value, CXL_HDM_DECODER0_CTRL, COMMIT, 0);
> +        value =3D FIELD_DP32(value, CXL_HDM_DECODER0_CTRL, ERR, 0);
> +        value =3D FIELD_DP32(value, CXL_HDM_DECODER0_CTRL, COMMITTED, 1)=
;
>      }
> -    memory_region_transaction_commit();
> +    stl_le_p((uint8_t *)cache_mem + offset, value);
>  }
> =20
>  static void cxl_cache_mem_write_reg(void *opaque, hwaddr offset, uint64_=
t value,
> diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
> index abe60b362c..846089ccda 100644
> --- a/hw/mem/cxl_type3.c
> +++ b/hw/mem/cxl_type3.c
> @@ -314,14 +314,17 @@ static void hdm_decoder_commit(CXLType3Dev *ct3d, i=
nt which)
>  {
>      ComponentRegisters *cregs =3D &ct3d->cxl_cstate.crb;
>      uint32_t *cache_mem =3D cregs->cache_mem_registers;
> +    uint32_t ctrl;
> =20
>      assert(which =3D=3D 0);
> =20
> +    ctrl =3D ldl_le_p(cache_mem + R_CXL_HDM_DECODER0_CTRL);
>      /* TODO: Sanity checks that the decoder is possible */
> -    ARRAY_FIELD_DP32(cache_mem, CXL_HDM_DECODER0_CTRL, COMMIT, 0);
> -    ARRAY_FIELD_DP32(cache_mem, CXL_HDM_DECODER0_CTRL, ERR, 0);
> +    ctrl =3D FIELD_DP32(ctrl, CXL_HDM_DECODER0_CTRL, COMMIT, 0);
> +    ctrl =3D FIELD_DP32(ctrl, CXL_HDM_DECODER0_CTRL, ERR, 0);
> +    ctrl =3D FIELD_DP32(ctrl, CXL_HDM_DECODER0_CTRL, COMMITTED, 1);
> =20
> -    ARRAY_FIELD_DP32(cache_mem, CXL_HDM_DECODER0_CTRL, COMMITTED, 1);
> +    stl_le_p(cache_mem + R_CXL_HDM_DECODER0_CTRL, ctrl);
>  }
> =20
>  static int ct3d_qmp_uncor_err_to_cxl(CxlUncorErrorType qmp_err)
> --=20
> 2.37.2
> =

