Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A653C6D4DDA
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 18:31:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjN5S-0002zE-W1; Mon, 03 Apr 2023 12:31:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fan.ni@samsung.com>)
 id 1pjN5P-0002b4-Aa
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 12:31:15 -0400
Received: from mailout2.w2.samsung.com ([211.189.100.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fan.ni@samsung.com>)
 id 1pjN5K-00088w-UL
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 12:31:15 -0400
Received: from uscas1p2.samsung.com (unknown [182.198.245.207])
 by mailout2.w2.samsung.com (KnoxPortal) with ESMTP id
 20230403163106usoutp0219ecf8cba1293f5553c8a55c4cba348b~Seb2h4hE70044100441usoutp02R;
 Mon,  3 Apr 2023 16:31:06 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w2.samsung.com
 20230403163106usoutp0219ecf8cba1293f5553c8a55c4cba348b~Seb2h4hE70044100441usoutp02R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1680539466;
 bh=StgQQ5Vgj4Mk1qdyAqtelHDAGgF7WHA65W6iZFEK6Nk=;
 h=From:To:CC:Subject:Date:In-Reply-To:References:From;
 b=gN5SZtBycoRXD6sEsisx9DfHUyTqC7JxUq9SStbWDz2BZrYBP9C+vOAncjTEwbxIR
 kz0GxSXIaPB/pXf7arCleH2m3My1NbAWyDK1hdrxPHIgZ8teNNWvzizQShUrhET2mp
 F8KEjaHW9E9dB2fhSHqCGOnJC4LsDakYEkyStnTM=
Received: from ussmges2new.samsung.com (u111.gpu85.samsung.co.kr
 [203.254.195.111]) by uscas1p2.samsung.com (KnoxPortal) with ESMTP id
 20230403163106uscas1p29d84d0b15332e7d0fb8ab84a20cf4c48~Seb2O4Vcf1825018250uscas1p23;
 Mon,  3 Apr 2023 16:31:06 +0000 (GMT)
Received: from uscas1p1.samsung.com ( [182.198.245.206]) by
 ussmges2new.samsung.com (USCPEMTA) with SMTP id B3.B2.09670.94FFA246; Mon, 
 3 Apr 2023 12:31:05 -0400 (EDT)
Received: from ussmgxs2new.samsung.com (u91.gpu85.samsung.co.kr
 [203.254.195.91]) by uscas1p2.samsung.com (KnoxPortal) with ESMTP id
 20230403163105uscas1p24552618ba98d38845478fdc4e0ddf712~Seb1-JPHZ1825018250uscas1p22;
 Mon,  3 Apr 2023 16:31:05 +0000 (GMT)
X-AuditID: cbfec36f-6f9ff700000025c6-2a-642aff499109
Received: from SSI-EX2.ssi.samsung.com ( [105.128.2.145]) by
 ussmgxs2new.samsung.com (USCPEXMTA) with SMTP id 54.73.09579.94FFA246; Mon, 
 3 Apr 2023 12:31:05 -0400 (EDT)
Received: from SSI-EX2.ssi.samsung.com (105.128.2.227) by
 SSI-EX2.ssi.samsung.com (105.128.2.227) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.2375.24; Mon, 3 Apr 2023 09:31:04 -0700
Received: from SSI-EX2.ssi.samsung.com ([105.128.2.227]) by
 SSI-EX2.ssi.samsung.com ([105.128.2.227]) with mapi id 15.01.2375.024; Mon,
 3 Apr 2023 09:31:04 -0700
From: Fan Ni <fan.ni@samsung.com>
To: zenghao <zenghao@kylinos.cn>
CC: "jonathan.cameron@huawei.com" <jonathan.cameron@huawei.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "xieming@kylinos.cn"
 <xieming@kylinos.cn>
Subject: Re: [PATCH] Subject:[PATCH] cxl-cdat:Fix open file not closed in
 ct3_load_cdat
Thread-Topic: [PATCH] Subject:[PATCH] cxl-cdat:Fix open file not closed in
 ct3_load_cdat
Thread-Index: AQHZZghVxkgYeob4P0SonblZ8/3R868aPKKA
Date: Mon, 3 Apr 2023 16:31:04 +0000
Message-ID: <20230403163056.GA1766078@bgt-140510-bm03>
In-Reply-To: <20230403084245.54861-1-zenghao@kylinos.cn>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [105.128.2.176]
Content-Type: text/plain; charset="us-ascii"
Content-ID: <76F66AECB6D34744800A906AD4BD1FDD@ssi.samsung.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprIKsWRmVeSWpSXmKPExsWy7djXc7qe/7VSDGY9trRYtfAam8Xx3h0s
 Fl/afzJa7NjYxeTA4tFy5C2rx5bWf8weT65tZgpgjuKySUnNySxLLdK3S+DK2H3/IGPBXPaK
 d/fyGhivs3YxcnBICJhIbDvi28XIxSEksJJR4lz3ShYIp5VJ4tD7XexdjJxgRa2Hz7BCJNYy
 Slxfco4FJCEk8JFR4tZ0Lwh7KaPEi08mIDabgKLEvq7tbCC2iICCxN8/p5hAmpkF5jNKbP79
 C2yqsECkxJPmTSwQRVESB5/dY4ewjSSuP9rPDGKzCKhIfD34FayGV8BMouXJajCbU8BC4t35
 5awgNqOAmMT3U2uYQGxmAXGJW0/mM0FcLSixaPYeZghbTOLfrodsELaixP3vL9kh6nUkFuz+
 xAZh20nMubSTFcLWlli28DUzxF5BiZMzn7BA9EpKHFxxAxxEEgJbOCSu7VrKCJFwkZiwdzU0
 uKQl/t5dxgQJ32SJVR+5IMI5EvOXbIGaYy2x8M96pgmMKrOQnD0LyUmzkJw0C8lJs5CctICR
 dRWjeGlxcW56arFRXmq5XnFibnFpXrpecn7uJkZgqjn973D+Dsbrtz7qHWJk4mA8xCjBwawk
 wqvapZUixJuSWFmVWpQfX1Sak1p8iFGag0VJnNfQ9mSykEB6YklqdmpqQWoRTJaJg1Oqganb
 SdZy65pnvPaf16lWRs5ut1r7+NjJ420Hwv4smbJ8iTm7aj938n1f+7O1Z84+DuWOZ566seCw
 UsisBeLaXjGZi9cuL14QMenpjpqAU1YyJ5m8pZ/VnvweHqyjyJaydqfQIo8vi/58dIr888f6
 Vhnfl5t/ulgr7H64NmnG7ZOqbbz6tnPzyZt9F1punWO0yfW8Z7ZGOabU+M/2acUi7JkRR68a
 +VYdtVTa8kdBZNlm7gD38k/p0m3uz30DzP6v8l6U+enNu7xF0QIbrbXWTUqQP3KgsP63TU3d
 Mqv2zR/k1ln7FEffiN7N/aR5ypRTy74f3Gx9yWJpE9NtLXOF+8VPlnvNkvhR5fDg8T2THjUl
 luKMREMt5qLiRAAwA8L3pAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEIsWRmVeSWpSXmKPExsWS2cA0Udfzv1aKwd0VmharFl5jszjeu4PF
 4kv7T0aLHRu7mBxYPFqOvGX12NL6j9njybXNTAHMUVw2Kak5mWWpRfp2CVwZu+8fZCyYy17x
 7l5eA+N11i5GTg4JAROJ1sNngGwuDiGB1YwS09Z8Y4dwPjJKLL7bCJVZyihx6MFRZpAWNgFF
 iX1d29lAbBEBBYm/f04xgRQxC8xnlNj8+xc7SEJYIFLiSfMmFoiiKIl3PQehGowkrj/aDzaI
 RUBF4uvBr2A1vAJmEi1PVoPZQgLdjBKXb3GB2JwCFhLvzi8Hu5VRQEzi+6k1TCA2s4C4xK0n
 85kgfhCQWLLnPDOELSrx8vE/qN8UJe5/f8kOUa8jsWD3JzYI205izqWdrBC2tsSyha+ZIW4Q
 lDg58wkLRK+kxMEVN1gmMErMQrJuFpJRs5CMmoVk1CwkoxYwsq5iFC8tLs5Nryg2ykst1ytO
 zC0uzUvXS87P3cQIjNbT/w5H72C8feuj3iFGJg7GQ4wSHMxKIryqXVopQrwpiZVVqUX58UWl
 OanFhxilOViUxHlfRk2MFxJITyxJzU5NLUgtgskycXBKNTCZzFe4e/Mkq2n4h8uSIueXx3XX
 Zjv6XbYO5Pt0Qc5mgve0fTXTuXSPSMcWXs/TcJc+2rFk5o2cBdMCi4N8jmXMPLx9Xfb+WVIv
 VOZ4pE2yTXoyR3HFfecE1/AvpgJlkyM5GldevruNf3fO9UTmY1Mrr5u9mLZ725XPZnsatE0S
 fD717pDYeCvA+pSp+rkntVmKQlK+v12OXfKcXT4lIvBAnSqvxl6b51Xmaqxrtj6pfCM+9/Pn
 ktapWZddlq9T3S/Zv08mLY3vK++jyvrCc19mM7GIflfNurRpXkFiXNkOL3mnR/XZBvcfLSvb
 GcSub/fpTPrvDaVruJ0tGVbNnCHKl3pdy/XyWoWTs6rbF2YqsRRnJBpqMRcVJwIAtHtqVEUD
 AAA=
X-CMS-MailID: 20230403163105uscas1p24552618ba98d38845478fdc4e0ddf712
CMS-TYPE: 301P
X-CMS-RootMailID: 20230403084252uscas1p1e72205f95e72557e2c8bc872b46a24df
References: <CGME20230403084252uscas1p1e72205f95e72557e2c8bc872b46a24df@uscas1p1.samsung.com>
 <20230403084245.54861-1-zenghao@kylinos.cn>
Received-SPF: pass client-ip=211.189.100.12; envelope-from=fan.ni@samsung.com;
 helo=mailout2.w2.samsung.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Mon, Apr 03, 2023 at 04:42:45PM +0800, zenghao wrote:
> opened file processor not closed,May cause file processor leaks
>=20
> Fixes:aba578bdace5303a441f8a37aad781b5cb06f38c
>=20
> Signed-off-by: Zeng Hao <zenghao@kylinos.cn>
> Suggested-by: Xie Ming <xieming@kylinos.cn>
> ---
>  hw/cxl/cxl-cdat.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/hw/cxl/cxl-cdat.c b/hw/cxl/cxl-cdat.c
> index 137abd0992..ba7ed1aafd 100644
> --- a/hw/cxl/cxl-cdat.c
> +++ b/hw/cxl/cxl-cdat.c
> @@ -128,6 +128,7 @@ static void ct3_load_cdat(CDATObject *cdat, Error **e=
rrp)
> =20
>      if (fread(cdat->buf, file_size, 1, fp) =3D=3D 0) {
>          error_setg(errp, "CDAT: File read failed");
> +        fclose(fp);
>          return;
>      }
> =20
Good catch.

Reviewed-by: Fan Ni <fan.ni@samsung.com>

> --=20
> 2.37.2
>=20
>=20
> No virus found
> 		Checked by Hillstone Network AntiVirus=

