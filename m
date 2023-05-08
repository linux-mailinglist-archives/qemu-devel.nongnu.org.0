Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6249A6FB342
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 16:51:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw2C8-0002kt-Du; Mon, 08 May 2023 10:50:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <m.ynddal@samsung.com>)
 id 1pw0lQ-0007Gm-L0
 for qemu-devel@nongnu.org; Mon, 08 May 2023 09:18:52 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <m.ynddal@samsung.com>)
 id 1pw0lN-0003tZ-BP
 for qemu-devel@nongnu.org; Mon, 08 May 2023 09:18:52 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20230508131842euoutp023aacd5496af4876e4c0415c25307ad21~dLY3LF3rm3124931249euoutp02y
 for <qemu-devel@nongnu.org>; Mon,  8 May 2023 13:18:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20230508131842euoutp023aacd5496af4876e4c0415c25307ad21~dLY3LF3rm3124931249euoutp02y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1683551922;
 bh=mKAdeSRSESKSZ9pe/qPFiWykKd7CVGFMiv4sQuhwN4A=;
 h=From:To:CC:Subject:Date:In-Reply-To:References:From;
 b=O7hyQWIlVSxf5TReWkBU/Y+10XMsB/TUJ98awUriXaTk8YcGMS3KKmXcHGOMRbptg
 tKQxoZyBD5x26jD9e6e/SSpZeuqGmrg9E9hHkfWyNIogQmO6sywKn6u4eKCD1576C8
 r7Nm693Vzios6VyOnjgSoc49MXuj9RDmxcwVa2uI=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20230508131842eucas1p25c17f38cace342c4a93819fa53ccd6d1~dLY2-TBRg2777227772eucas1p2l;
 Mon,  8 May 2023 13:18:42 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 4B.AB.42423.2B6F8546; Mon,  8
 May 2023 14:18:42 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20230508131842eucas1p298d5b0311b58f1c34277140edb657acc~dLY2h9saI2001420014eucas1p2P;
 Mon,  8 May 2023 13:18:42 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20230508131842eusmtrp2447a7700652e64d13a470785ba5db915~dLY2hdg0C2381123811eusmtrp2z;
 Mon,  8 May 2023 13:18:42 +0000 (GMT)
X-AuditID: cbfec7f2-a51ff7000002a5b7-55-6458f6b2dee5
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 03.39.10549.1B6F8546; Mon,  8
 May 2023 14:18:41 +0100 (BST)
Received: from CAMSVWEXC01.scsc.local (unknown [106.1.227.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20230508131841eusmtip183c480e4467c5c7b755a68ea2ff92446~dLY2Xpd3A0821108211eusmtip1d;
 Mon,  8 May 2023 13:18:41 +0000 (GMT)
Received: from CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348) by
 CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Mon, 8 May 2023 14:18:41 +0100
Received: from CAMSVWEXC02.scsc.local ([::1]) by CAMSVWEXC02.scsc.local
 ([fe80::3c08:6c51:fa0a:6384%13]) with mapi id 15.00.1497.012; Mon, 8 May
 2023 14:18:41 +0100
From: Mads Ynddal <m.ynddal@samsung.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
CC: Mads Ynddal <mads@ynddal.dk>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>, John Snow
 <jsnow@redhat.com>
Subject: Re: [PATCH v2 01/12] simpletrace: Improve parsing of sys.argv; fix
 files never closed.
Thread-Topic: [PATCH v2 01/12] simpletrace: Improve parsing of sys.argv; fix
 files never closed.
Thread-Index: AQHZfNfpDLjoQC54XkqGZ64EXKjdyK9KWv4AgAX5uAA=
Date: Mon, 8 May 2023 13:18:40 +0000
Message-ID: <0713AFC1-299C-47A2-8746-49AD8C70185D@samsung.com>
In-Reply-To: <20230504180326.GB581920@fedora>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [106.110.32.101]
Content-ID: <99A3E1048AAAF34EA55A12B6E971EDE6@scsc.local>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGKsWRmVeSWpSXmKPExsWy7djPc7qbvkWkGNy9L2kxd/U5Fot9zdYW
 j9oPMFsc793BYvF60n9WB1aPJ9c2M3m833eVzeP42s/MAcxRXDYpqTmZZalF+nYJXBk31s1j
 K1jOXnF3x0PGBsbfrF2MHBwSAiYSu2fUdzFycggJrGCUODinuouRC8j+wihx9EALI0TiM6PE
 j5flIDZI/fUb69khipYzSnRvfA7lABWd2D6DEcI5zShx/vVkFggHaO7WjwdYQPrZBDQkWnbO
 ZQHZLSKgKXGjWxCkhllgMqPEgzsTwGqEBRIl1t0+xApiiwgkSRzZcZoJwraS6HjyGqyGRUBF
 4vG8zcwgNq+AncTFJ1fZQWxOAV2JO3umg9mMArISXxpXg9UwC4hL3HoynwniB0GJRbP3MEPY
 YhL/dj1kg7B1JM5ef8IIYRtIbF26jwXCVpL4/3EjE8QcS4n1l04zQtjaEssWvoa6QVDi5Mwn
 UPW7OSXmNcZC2C4SW86uYoewhSVeHd8CZctI/N85n2kCo84sJOfNQrJiFpIVs5CsmAUMOmZg
 0K3fpb+AkXUVo3hqaXFuemqxYV5quV5xYm5xaV66XnJ+7iZGYNI5/e/4px2Mc1991DvEyMTB
 eIhRgoNZSYR3VUJYihBvSmJlVWpRfnxRaU5q8SFGaQ4WJXFebduTyUIC6YklqdmpqQWpRTBZ
 Jg5OqQYmvpB9K8WVDsSekYq5md/O2pASuWu5rsQh+XhN+dL0gq+ZWcwLptRNPHA9+8BaQXtV
 wexGdrcP9XnnZolNZpjPKxSksaTTpCiTzUTd+JyNo99cZf9dCesvxT+c/1Hq+se6LDuRK/NX
 CTaWfnX+Etpdr3jt7/p1Rmpv1vs+W3t20SvHwIqDamf/rwp58/LqdW7eS4I3DSvyzp9L3mra
 tj7TautMS7arnU0u0dOlZGdVvvCM05HqldwhsjfcYN2bj8dPfy7ldNwVVx9Qc6qCO9fev2dq
 uMoz+8vyXcwih77uXPSj/OCeec51HHynzRgO5a13n/lN+nlBtUXAf1G1ZX88849U268w7YmZ
 OWG6jr8SS3FGoqEWc1FxIgD71ZWsqQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrEKsWRmVeSWpSXmKPExsVy+t/xu7obv0WkGBzabG0xd/U5Fot9zdYW
 j9oPMFsc793BYvF60n9WB1aPJ9c2M3m833eVzeP42s/MAcxRejZF+aUlqQoZ+cUltkrRhhZG
 eoaWFnpGJpZ6hsbmsVZGpkr6djYpqTmZZalF+nYJehnHX79kKehhr/gyvYOlgfEBaxcjJ4eE
 gInE9Rvr2UFsIYGljBLrjwhCxGUkNn65ClUjLPHnWhdbFyMXUM1HRonrX3+xQDinGSXO/vvC
 CuGsYJT483AvWAubgIZEy865QFUcHCICmhI3ugVBapgFJjNKPLgzgQWkRlggUWLd7UNg9SIC
 SRIrZ/xkgbCtJDqevAazWQRUJB7P28wMYvMK2ElcfHKVHWLZFUaJFyePsIEkOAV0Je7smQ72
 A6OArMSXxtVgDcwC4hK3nsxngvhBQGLJnvPMELaoxMvH/6B+05E4e/0JI4RtILF16T4WCFtJ
 4v/HjUwQc3QkFuz+xAZhW0qsv3SaEcLWlli28DXUcYISJ2c+YZnAKDMLyepZSNpnIWmfhaR9
 FpL2BYysqxhFUkuLc9Nziw31ihNzi0vz0vWS83M3MQITy7ZjPzfvYJz36qPeIUYmDsZDjBIc
 zEoivKsSwlKEeFMSK6tSi/Lji0pzUosPMZoCA28is5Rocj4wteWVxBuaGZgamphZGphamhkr
 ifN6FnQkCgmkJ5akZqemFqQWwfQxcXBKNTDZfDG4dfpJ//u3U3/zhty3m7B8b8itif/WOa06
 4So0a+WvWMklV82W3xfktjVwFbis3Cb1j1k4ONf4j1D+f55bp/Kcv6VUC9SdOv4kUf1ot1Pn
 h8aAq5m87JyndiwUYWmZzj617Jnbgb57nS9Xul58vm+hs1fgXPuNSQUWs95I5xq/eO2yq421
 Nsu96Tr7D5miGQKn1vptvJ4bN1UoctmNC/Ea0dU7986rWvdh+Sc7wTeb2NsdgvZG8m8R/2vc
 ++i49AT9eHfDLyH/LVmnuPKG63EKTdeUPPjrYBbL8xuWDz6s5/2XX/qx+NIcDjufSSc/uiZJ
 HKhL5u1O5tTUy3rE53jpnUofS93WwL//V+gpsRRnJBpqMRcVJwIAx82RdbUDAAA=
X-CMS-MailID: 20230508131842eucas1p298d5b0311b58f1c34277140edb657acc
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20230504180335eucas1p21ffccd4ab7097deb326e3053c10cef01
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230504180335eucas1p21ffccd4ab7097deb326e3053c10cef01
References: <20230502092339.27341-1-mads@ynddal.dk>
 <20230502092339.27341-2-mads@ynddal.dk>
 <CGME20230504180335eucas1p21ffccd4ab7097deb326e3053c10cef01@eucas1p2.samsung.com>
 <20230504180326.GB581920@fedora>
Received-SPF: pass client-ip=210.118.77.12; envelope-from=m.ynddal@samsung.com;
 helo=mailout2.w1.samsung.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_BAD_THREAD_QP_64=1, RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 08 May 2023 10:50:17 -0400
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

> simpletrace.py is both a command-line tool and a Python module. The
> Python module has a public API that people's scripts may rely on. Let's
> avoid breaking API changes unless necessary so that existing scripts
> that import simpletrace continue to work.
>=20
> It's not very clear what is a public API in simpletrace.py, the file
> should really have __all__ =3D =5B'Analyzer', 'process', 'run'=5D.
> Nevertheless, Analyzer's doc comments mention process() and the
> process() function itself also has doc comments, so it's a public API.
>=20
> Please drop this change to avoid breaking the public API.

I agree, I'll revert the changes. I can add an =60__all__=60 too.

I'd like to avoid having the same =60open=60, =60read_trace_header=60 and =
=60read_events=60
multiple places. Would it be acceptable to let =60process=60 be more of a s=
tub and
move the logic to an internal =60_process=60 function maybe?

