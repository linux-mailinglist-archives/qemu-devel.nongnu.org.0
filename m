Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9056C376F
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 17:54:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pefDx-00064X-1h; Tue, 21 Mar 2023 12:52:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pefDv-00064D-E0
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 12:52:35 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pefDt-0000Rw-O2
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 12:52:35 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32LGEQpU010486
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 16:52:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=z6kt3JqksSVn+JiAqBCbuQsFytSjNSzFq3KHXPC8PlI=;
 b=TwUok7Rnq9LSb9CK/8uzgY1q6yvIE7VeknBeg7rwUFUz22yZtxDnAjOWSRDhxGdtCzvI
 PgQt9oSi6xHNf//o9EPAH2q3IIs9GqpRllYOwdAJOLyZMNtRsRjh27dhnwgSIHjh2wCW
 D0DORMN033xrbES1WbuHwbrb8rT9b+UYF392M3PHP/bmIJTaCeKO3MSvqyoLOb0EBg4v
 BneEiyHpSWhDIB9FbtUpvb9Np820Ug4z4v/tE3fYDVXYspeaf3CXWtUwH/6Je4mEZjit
 wLwAZFIvKTyRRogFk//tzftV7JqzZZ37i/SDEfOeEIFfMUMCfVY79cgYwt/1XuMm+gP2 nQ== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pfebsgeh8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 16:52:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I0p5MEtJnpevfD0HPBiLdGnWn9/1hVptGVGYgf+S6/u8AWFsi9xjQLNmn14r+Xz4o6xNcbnLP6ejhTtCOkzpiRox2yP/xMmliMwbFN62ZrIdOrEtedFgvE/RhZaudkFAxfKOth2WpCIZYguYlCn5OJbYnYdOyeGlmpEM1WVGGiufcIQsrUBAI3BtgJK8u/cFoLaoGBZzFrgZls9rWxBn1nzfQmfVi/AXYIzVItpGXNbllfGtldbSU7t8gK9ry2zcOQptsGUy1vHLvCrbpcU0YdM197Xv9qSYg8heTqcqslyroFekZLzig5MsazOfI8U6eeTHyGtyt96Vbizlis5loA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z6kt3JqksSVn+JiAqBCbuQsFytSjNSzFq3KHXPC8PlI=;
 b=a4+rGOiw9+AGalRFp1wp+rNZwKYgMkkPi6fgK1IU1PLDF+LsKLWUe/xlBHXk4Y6DobW0Q0mTKMZqZ42b03MBhNNNNZzeZXo6Jkqvdlv/SyOcVfUdSGMicbf/CXdZd4+Ug7rrh7kT5Ys2mnpVKD4f85kqgGjaOdK1FHpjQv6+I/ti/3VBH+Ua/vp+Sl2l9QtammQqIcvh7582qBQRMUdeNL0hOL9TgIWRchiXu2uNgN48ZskLsSdinVAwMONjkUEM72GICBVUQqi1FVoxqUMHTrIx7EAONV0JNZIXNk25Tfs571p2jgAX7voPLP4OcFj/iBz3gMjUVGc4K/jR5KVm/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by MN2PR02MB6925.namprd02.prod.outlook.com
 (2603:10b6:208:200::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 16:52:06 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::3e12:c026:afdc:beda]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::3e12:c026:afdc:beda%5]) with mapi id 15.20.6178.036; Tue, 21 Mar 2023
 16:52:06 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: "Marco Liebel (QUIC)" <quic_mliebel@quicinc.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: "Matheus Bernardino (QUIC)" <quic_mathbern@quicinc.com>
Subject: RE: [PATCH 2/2] Add test for storing .new vector
Thread-Topic: [PATCH 2/2] Add test for storing .new vector
Thread-Index: AQHZW/8y66XopbCDD0GuHicCoqxVqa8FVAeA
Date: Tue, 21 Mar 2023 16:52:06 +0000
Message-ID: <SN4PR0201MB8808115B6F0D265315ABFF4DDE819@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20230321141206.751719-1-quic_mliebel@quicinc.com>
 <20230321141206.751719-3-quic_mliebel@quicinc.com>
In-Reply-To: <20230321141206.751719-3-quic_mliebel@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|MN2PR02MB6925:EE_
x-ms-office365-filtering-correlation-id: 9ce5c726-9296-4280-a1cd-08db2a2c9a97
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XByN4rrUkaawfdMbmhfUDd3vxMCxrkQKGpdoN7qPR4/sumtayaxrEkGIAdJfAXpC714IXtJnRmS+EcCK2P9sfKYc+PIAlEVAg0EGWTfDuxPcUmvIdtCX2qvGJJb9cowxpalY4j2GEURdY1f7PYpb6NV/CCh5KjH+bnPylHZgB2vjBZAyuG1dpy1WeXFaiVqiZoFMM23SAvx4IqojUD+MRlwr7Btf1JMNItOjuTAXe11kJIGXs2U/bA1gfO7d7emdF1p9vG66feBmQ6KkhaqmyW4fWvmbeO7oxQQhqGpoxyDN4B3FRe6i8Q/Gd7Fpm8xjya97M10ch5pdkOzOWS5mNRSMgjlOSLsZsAhg4jtUcQP5eOoX1Yd2ojTQz4Ovn/RFOI3bEOq89z8Nluve9vH9Z/MKwUX6phHJQaYmUhlTJm4r1oA25b7nDIn0Xwliu57TRvXdKDZ94jlwlriG2Y/SVEzw1GhwxoelcdXtDK5Px0w5MnVit2wgaqzauvykeVmv9JzMA5UONH4kqwI4fdzEgCUOCKP0NvS/qLkaR038hnr8SYTgnirrDO2V0tppPJPofTFFEAvRDbJJ/fkXtDcCkw+l7IHiWHmBK3/dk8ua5IsOdrQM5iZnOKxw7L8mhqi4Nm7eXS1OETfjomBH3ZEDWJVbwTscPEgCyPpog6eMwFgwI4dvskF/o3mwfxG146EdZkWrfBQyme9XT94uJy1z5Q9FcQ45stInGbnNGvYr8NE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(396003)(376002)(136003)(346002)(39860400002)(451199018)(8936002)(5660300002)(52536014)(55016003)(33656002)(86362001)(38070700005)(38100700002)(2906002)(122000001)(4326008)(83380400001)(478600001)(71200400001)(107886003)(7696005)(41300700001)(186003)(26005)(6506007)(9686003)(53546011)(110136005)(316002)(8676002)(66446008)(66476007)(66556008)(76116006)(64756008)(66946007)(142923001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?t2IQIf9jmWmEQG/hnUz5JmFnZuTzQtv1JbOBxBMdLrBhc6oVhIMAqu7PVcQD?=
 =?us-ascii?Q?v3X8IMO30VSbugrL9rEXSNBxD4GQq5VpNDAamfCYa3iDcKy5TiXHDmmmWxfU?=
 =?us-ascii?Q?b56GF7jSO4hzPr0Os/emoCM7/flN0y/j01zUN/Np7/Ls/Ghzbirvr8MnvYkE?=
 =?us-ascii?Q?ZVTCyzfb0BM8WVLQxYfSsZLk9vNSy/FIuRsxvtZA8u0nred8ZE7P7JzBIsIa?=
 =?us-ascii?Q?7cbwxYPFT0PiOfajcXDYyVsIKHI6ekr5RzOt3IYNirHJ5yaAX6zVEXEVaC+s?=
 =?us-ascii?Q?TRc6vosqx22ccTq4jLSCBHXiWDV82rJ+vFEFGfneI7hbFo34HXuTHenuCYBP?=
 =?us-ascii?Q?G33KSX1IOcZGZzAYC6zXGRsEleiadARdxX6YMUq11/MREs8TTt9oQm/kZj1X?=
 =?us-ascii?Q?yha5L79hJGNRAzGUzqBOVfyqjNWybXRbw9bD1qEnSeyIV6/qFoEcq+eJhEb7?=
 =?us-ascii?Q?COeT92gbKhvBH7GN/nIiJ/gQb/rg62ZDRvYEnSCN89hIlHFNSscHfG2oyqMa?=
 =?us-ascii?Q?/c0J/gntuQozE1YGI5DGvtfzcw6CM4alTgzI11kbojM4akbIoAmY8CbEVEiH?=
 =?us-ascii?Q?56Ow3Vf+9kAt1BxQ5HkxVXo409Mtny3q+meXXIi3DkCQP9aRtj9pNZcjVmiD?=
 =?us-ascii?Q?ZtuGNp+yOxQawzxddW3VItEKof6fhzgRuto5yHlyrY2nx3WRcxB6SDx28N+3?=
 =?us-ascii?Q?pBwTU8Tyg06SctfUavlHJwkpqW6o4y/25117m3ZQ6Z0oXYB4dnUWo04byanE?=
 =?us-ascii?Q?XLWhsMI5DvndGoVrgCJTrkS2w9A+ZWzqtl3ajzZbWrZudA95qzTw5Ra/5Dcf?=
 =?us-ascii?Q?748HnyWZWmj8hqGtgzIuvNlTblaC83pts8C/JOwOlRAtS6pHSkWtJbZkz8wD?=
 =?us-ascii?Q?9NNus6s+zX9Edxpu3OJEu2BfcYN43HbLQAG0xFQzwOeQLkRSIETuy0wcdqrE?=
 =?us-ascii?Q?Sh1pD1u9/G05ppIEQFUgndiSsBYrGCrCfGU8ND5vICAE10jcsCS2plsuYTjT?=
 =?us-ascii?Q?EeSuJ20OIySsHfX+Je5h/vqcKMHOzYWkmH/pIFfuUhvMoWHLG3lcfMHLNW0h?=
 =?us-ascii?Q?vxrKT23P4O3LBuP9R6vKPaowr1tDxCiF8gN5lgsQfV89OioArNlw6DXkwkkq?=
 =?us-ascii?Q?XewXZY3FE1YSj9KIl4lT/JQeTtYM7Efg/BuRxJ7ep01226Oiq8mh9nldlXCd?=
 =?us-ascii?Q?K6wMH0cXV/dz1TMKWK8Vf6DiUf8AVwl14/MraPDXAw76zGZ1ziKZnMMXTNPO?=
 =?us-ascii?Q?mQ4TtF2rAGhP9rqZfwshrKueb3KLiwRUnu8Xux56D5VLOs0pQTyN0+mXjgqm?=
 =?us-ascii?Q?8Iz0LAVUlavmI0m049ANBePcin3R0yUtoQF5haE5O/geH6GdqqpvSB/sw5Mt?=
 =?us-ascii?Q?JLYuZN8JnUf+Sa8qoLKodZBZrquyyfNG+2PNWMRnISaKK1cyJP4mzL1amnYC?=
 =?us-ascii?Q?0tWlyoXNqmjQcEfX4TzOG37JoPemUnCy7TaUxYAUTYJRM97Bu7D1e23ECn5p?=
 =?us-ascii?Q?lowVYIXiIvNpdwTlNq4/nK6biDJmClF1cEAErcC6nBLqFsPkboPg1YDLmkzc?=
 =?us-ascii?Q?IFLEHncDXZPcVXhEaJ/exWZ5RQTpKoNrFI8NtEa+?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: CjAaEpAG9BsoRJMpw/0xStX4DsL8HG0oTbc5xDVXEIF+LXYZa9sfQD7xb7MSjy60mrHONMigKyFtwilkmuXPAUta+1vuyap3mLUYEXGbIJJSxVvGAv10yyKPTOBkSEvMc3RGPQ2RL2yVzgo7WutTJL0sFxPHk963QNr2MbrIj2kKPwBoHWgILQb45VzGh9dkPUt8eeoXRC/qZ1ScCiaxo5ds8Gz6NovkbZHpON1hn4+jzA8cQIFgSMCxVrGYUnfxxUsQ6VYiH9b5SssnDwWG1bC6AqD/i7cCIbJxjWQFBohd5YTUjkKK1jNFlwDB+uJl38hgrWgm38/A0tZMWq7wF8xOGE51BXls7B02THCZ5aFJO9puOjpUfcCPhVdhhLDctIP8thZ5XSto48smjaeyOmWzAJ50Chr3iLlGYdQmSN1cqtk11XlvJ0nkYe6MMQvm6o6tjbLWWYJTuwo7lr3SgD3ByKPj/NFhYOJZ5/uTHR4xtGKY3OKbX9ur5zpSjl7FVZQu8E/CcCJzb9ESq1RqwvAenLw8SjzBDuLtk2pWfSMO2qhUslvK0/Efqu0bgsvaJCv4qIqnPoq91U3TWzz8i9eGHnnOsLjd0lpnF44hS9VpE5QtW1Gq+4+jpEehjlLXudBdlt/o4lyJ95mDSQcKxKk4dJ2mIChu4KPbVrcZjA0V2aJcMMSRXPmaI/reaxYgHKD4z2FCEaZczjCKe74C7fiUcUapVOE0tucYfxEbzwheAAERvDwOpF7eBQy5h5WTKaCTXg0Kg0FtX7PtuO7pVQ==
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ce5c726-9296-4280-a1cd-08db2a2c9a97
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2023 16:52:06.3144 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FfbIumpyl5QNQcTRwWbObxcYwzulwjyzRmR9mu3lreH6k4msCXLiceFbLc+pONx+wIiyd1zFyHG0ZyIaTmjbEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6925
X-Proofpoint-GUID: UcMjBs3qE6wwveLZBx0beaLY5sJlRZwE
X-Proofpoint-ORIG-GUID: UcMjBs3qE6wwveLZBx0beaLY5sJlRZwE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-21_11,2023-03-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 mlxlogscore=781
 malwarescore=0 phishscore=0 clxscore=1015 spamscore=0 adultscore=0
 lowpriorityscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303150002 definitions=main-2303210132
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=tsimpson@quicinc.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



> -----Original Message-----
> From: Marco Liebel (QUIC) <quic_mliebel@quicinc.com>
> Sent: Tuesday, March 21, 2023 8:12 AM
> To: qemu-devel@nongnu.org
> Cc: Taylor Simpson <tsimpson@quicinc.com>; Matheus Bernardino (QUIC)
> <quic_mathbern@quicinc.com>; Marco Liebel (QUIC)
> <quic_mliebel@quicinc.com>
> Subject: [PATCH 2/2] Add test for storing .new vector
>=20
> Hexagon toolchain version 16.0.0 fixes a bug where the ecoding of storing=
 a
> .new vector was incorrect. This resulted in an incorrect valued being sto=
red.
> The test checks that the correct value is used.
>=20
> Signed-off-by: Marco Liebel <quic_mliebel@quicinc.com>
> ---
>  tests/tcg/hexagon/hvx_misc.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>=20
> diff --git a/tests/tcg/hexagon/hvx_misc.c b/tests/tcg/hexagon/hvx_misc.c
> index 53d5c9b44f..657e556dd4 100644
> --- a/tests/tcg/hexagon/hvx_misc.c
> +++ b/tests/tcg/hexagon/hvx_misc.c
> @@ -211,6 +211,34 @@ static void test_store_unaligned(void)
>      check_output_w(__LINE__, 2);
>  }
>=20
> +static void test_store_new(void)
> +{
> +    asm volatile(
> +        "r0 =3D #0x00000003\n\t"
> +        "v0 =3D vsplat(r0)\n\t"
> +        "r0 =3D #expect\n\t"
> +        "vmem(r0+#0) =3D v0\n\t"

The idiom used in this file is the inline asm stores into the output buffer=
 and there is vanilla C that writes to the expect buffer.  So, move the abo=
ve to something like this (after the inline asm).
    for (int j =3D 0; I < MAX_VEC_SIZE_BYTES / 4; j++) {
        expect[0].w[j] =3D 3;
    }

Thanks,
Taylor


