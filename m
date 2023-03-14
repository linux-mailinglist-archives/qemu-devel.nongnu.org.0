Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6476A6B9D9D
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 18:54:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pc8qT-0006QF-4x; Tue, 14 Mar 2023 13:53:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pc8qR-0006Pj-4W
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 13:53:55 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pc8qP-00057w-Fh
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 13:53:54 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32EEaHYx015585
 for <qemu-devel@nongnu.org>; Tue, 14 Mar 2023 17:53:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=TcFqljKZdDJIsU3/mrSMznDYPvQR1fy+EFM+lIIKU80=;
 b=JrxcEdJP26LF4Uhohrsk/s8g6HZfaxiJjashMa2d9swgrGTaud9D46o4EzYxkPSwBCFP
 IR5oyp4SdSh65E69VZAgEVZZs5ElGJq3x1Y+TXxbssVqFmV/MKCPbDonp3xgL7/AdTwV
 C0iU7hfecRk78pH/nqcutaBoThWqlZS98PVg3EP0oX8IdII/qyHf/shAlNdn+JRzICuC
 bAVE87EjUfc8Qoci8lLdTA9nGTP2vBxU7ubuBxdpgx0GURlMlXzf1JZTze8+2dWZjI1N
 wuFuj5chO9z6w5qwPAFfgfW/J1XyoZ72oGnspf9uBUXOzNnFuzAHZ9bnCccR3gug7Eoo jg== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3par34s3e1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Tue, 14 Mar 2023 17:53:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ONtScHRXa/1rfZuLBJQ/19RaW7IA4XswoZrfnUbroiUCjQ8O88ndi6svlAt9SdxssoODCXWRcA+IWdLEk/nMrWvgeMJi+KwxedK8IRBvBkdgED3Ym5GttvRJJ9byoMuI9uHtJ7NiK+ct29HfUpOinjTUKAcUSGdkoj9rARP0Pv2sRiHo/gOUVcaY+ZSU9C1ZFfbX2vVVWCYFB0I+bUCGg7Yyk+NC4qejE0iNobDfko3vnmSdXRtNIzP4cmPsZwuZ+4KRQDiEKmFn3JpyF8HVpeckFzrL9AC0i9nmbcaWp3u50yNFubcJAgh2tmuGebNC2uQNeQ7XQzDBte7mSwsGug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TcFqljKZdDJIsU3/mrSMznDYPvQR1fy+EFM+lIIKU80=;
 b=mRTdi4PrcZzKjRiTxbEJ3uryzxY8W9YJslOFqMTQHvxiAm5OqJ+xiT4KdkiY2VmuU3EJG2Cucd5gOt6Tz6eMeWM0sr4cTn6m7nqrvjTTddVpixPS6MSoRPR4jELuwPIeDZ6i1P3woJBK/FEezF5NDuo5eBjD/zNupbUaoecWpg7yyJZ/xjdgoideqvCklgIBBxVlXCD78G8HcLlvj/D014yW0+6AaJY4DWmXPnOznL092143ttbxZbtTL7UKuCR4I82mdZNON3+35v1CYgeJTlBVYAY01SjF5SkS54xYoUk/T19Y1XV5+C11oTGzeL8JVwbAUWPw4gbRqGPWanUvMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by MW4PR02MB7428.namprd02.prod.outlook.com
 (2603:10b6:303:71::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Tue, 14 Mar
 2023 17:53:46 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::3e12:c026:afdc:beda]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::3e12:c026:afdc:beda%5]) with mapi id 15.20.6178.026; Tue, 14 Mar 2023
 17:53:46 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: "Marco Liebel (QUIC)" <quic_mliebel@quicinc.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH] Use f-strings in python scripts
Thread-Topic: [PATCH] Use f-strings in python scripts
Thread-Index: AQHZVdDaRknlRf8o60qckkGXKvK+6676eBRw
Date: Tue, 14 Mar 2023 17:53:46 +0000
Message-ID: <SN4PR0201MB88084D06E64FD6C029249202DEBE9@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20230313172535.2409370-1-quic_mliebel@quicinc.com>
In-Reply-To: <20230313172535.2409370-1-quic_mliebel@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|MW4PR02MB7428:EE_
x-ms-office365-filtering-correlation-id: e206440c-484b-4ff5-b991-08db24b50f20
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fJWKxVq8FC85GB8Y34XOKxnI9wXZVV1dxNe+y50wynjXH+SxhTBMZIRn438smsejerR0bjlSpXj7AxAR6IJkxcyiGPI0Lt+1md9vuklJzdtbgyp9OQlB6X4V8xtZUeayfWKipbgsxZeB/4HCdD9UYdt6BOGRN7FxEBMwpEIAHTJ/Bz6cZMadIJRB7fMj7ZhJObLaD7jQu1meemEWq9vO0TXxGE/xyRDelzHT1f5+GB1TmI4vh1iim2EHTs8dpGWsCb+0on5zA1PuziLU8JVZ5PndHhknvM5CPTUrkkAagrRXh2r6UKa75GnZTEvvqmroTBYn6c5Udyu2giCpV8hPlElgaEMGLSks4f8dQ8Ghri7VzQ3knrveIFF6MuMqv9SyWhRxlteDgBROexITvlU8xW2rWiTIE/ktyHTweKLVtedgiObTDho8V1u4l42rEJ4moaaShgdIx295y24gHCmEL3xKRq7RYR0QSmMB35xFtQJTJcG/8VgEygbV2jdRu40UlI9oK2pwM/9NVbRZLqs8kGMZjZlC3BqAbAQ6z7oZtdcr2OPZ85l/mDnm5jyMsJDmhKzHdisqLjSoZ0xMwU0rAdu5KtcFIzuOHkA1EhD4o8u/J91SjJRIpYbkL0RqUBVB6sR8UmyYnw7dPdGCJjbBDbuN+FakUvU3hjKWm7PDzvZLEFyDXYTuWa1xMqmp4puf
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(396003)(376002)(39860400002)(366004)(346002)(451199018)(86362001)(38070700005)(33656002)(55016003)(38100700002)(122000001)(110136005)(76116006)(8676002)(64756008)(66476007)(66946007)(8936002)(66556008)(52536014)(41300700001)(66446008)(478600001)(316002)(6506007)(2906002)(5660300002)(83380400001)(71200400001)(186003)(9686003)(26005)(7696005)(53546011);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?XsVg+zH/vW7+/SmE49mbLRn/cQxpMU0hyUDff9s+JGTNC1OelShIMp5SkL3G?=
 =?us-ascii?Q?nNzerWElr4i4l1AQr3FDYBx+lmymTYA3hhldP8zJZCa9FjN53nt6pSBjNY6N?=
 =?us-ascii?Q?1MtrAzw3B19SDG9nNn5XRzeXM559aVWodXg/QiXM7rjyvqVWPRByJ48xr3O6?=
 =?us-ascii?Q?IgfWxpdOuASejFxPy9aV3eJunxD4bOpQyoBgriROvtkzpiBqqFkvhB5oDsBm?=
 =?us-ascii?Q?jzmBHryLQ348OTH5MZrQVQChANF9f7AT1v6Kpk9Xmtr/X6j4d7QC4NrCC4nE?=
 =?us-ascii?Q?V5YlA8Anlvh4mgvHgyOnFlxF3b7jW5IwxYRRG5eg7agiS1mbhOg2ZCrPJJi9?=
 =?us-ascii?Q?NIJSKQjHhN1J1uyltgUh4nnN//l6anVGHH41VUdZ6qtz1oGvBp9YTMYE+7oi?=
 =?us-ascii?Q?NouArpOlznORUNPD1fcw9h8rB5C42mmz1avE7ePnbydTgMANh1GS4uYxmURD?=
 =?us-ascii?Q?pzwfMbUJmVdCeI3EmhDaGlhcKe2o97NNyKzZ2w16HRqSMlCLP5rFt5hFlpxw?=
 =?us-ascii?Q?ic5r3iv5Lq3s0yXG87qpPXsI0v4+A4N4byzFoLaT5zonEkQw+y1ULzUyLen0?=
 =?us-ascii?Q?rrFVD9GUE3z84Uym5PFhe9UvoPtSf0+UphPSuhmYpo/4VBeOTVTYo1sygjXD?=
 =?us-ascii?Q?3pz87s0Luif3FuFj17M1rH+PrfYUKzunV/JXmqktTLeZTt6VRM0k8Oj0H3ZH?=
 =?us-ascii?Q?2dPvHz2saIPhuOLwR/lSEeQZqHZx6M/dcfaqm07W2J6518FTcEWpzSdv/6Uw?=
 =?us-ascii?Q?LZdsrgeJ9ysWssyV8tPC4BdpqZMrdQLDlXHnvNQPn8HApC0oVjRYza5sV3VZ?=
 =?us-ascii?Q?1yiD3QtxDznMXoTSdQU/fYcu6JamleR+73G2hx5o2ZPkqT4vJGxe2308YpWV?=
 =?us-ascii?Q?buvCxOD6FcwhDecjhCSRHLdce1yrLaaTrWwfu4N8FdfIgZCcLcCVTsBr4499?=
 =?us-ascii?Q?zA7MzxGY+vRSFZDsvx2B2svlDgiR0uVsis0hlKoFrP6h/Ff0fYl5BOxysjIB?=
 =?us-ascii?Q?dnRj4oem7exK9q/ieXJCJoSMddoxDTHy1wSASGgdSlAH1JqizTMCveT7P92i?=
 =?us-ascii?Q?mZ4uwyeEIL937NZ1NbNsYv/AYdjeKIyBZLkbxSXX/U/sr/jB43rDXtvGSEGm?=
 =?us-ascii?Q?7V6IygzY9oEpwcLqKr8MOwKcaFIkBjcvebNe7JD6PWj1Jrg6eQvxBbCDQxVj?=
 =?us-ascii?Q?VXBV6/S9NjaWHxa50vKq+GQyLP+pHBYPFpeuvjwCY3uAD8x+01Yf6QYbEkFJ?=
 =?us-ascii?Q?HGMRBrmdLawXfeoZQzlO/4tGuKMEPllYjlFLo6TOiFomw9+sCxjrlY1yVll0?=
 =?us-ascii?Q?ZMYCv4g+dJrE1bfePUOBYfcjQCYRjKGrXNPSaumWwN3kI6O31rkM63xbFt6c?=
 =?us-ascii?Q?zWa9YWwcoMAujW4MPT8n6V+uyKUL1z5ox+0np1kZTOTRIKq9cAB+1zcQpxWV?=
 =?us-ascii?Q?28pR5txvV10DcT3Oxfyyy/pdpv1OcfmOu69bkZhA79BUPd430XjMuQ5o9j0v?=
 =?us-ascii?Q?xG4IWt4z+eTCJhWNCVe82dmr8LfqUvvKiL+Q6+gWP871JA3y1kh3fn6qg6Bu?=
 =?us-ascii?Q?7askXjFPPo7lofWeuN9wRaeyf8qK2DvTJejCBuaO?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: VG4EU/XD6Rftu4zsj7N+jbJEKaX233FM905vbUIQCjfGGxCtLNQWlzjfraEzLNUnBLRTVtiHcIZktFO9T97Uq4f/uydYQcTqx+pETFPayRUdUdivvuKwXs/+bispa6VN2DCgKTZRWH3gUFu7D6OAv8OMxT9kdGxkxMPfx2QwobYK3ONybXU493eVfiU7Al5nZFESzNv/TLFyJXXUf3nLM4lxkDwK38teQMFmfSmwbGZ179a3OhFygKaYee0cz8jQXYTThHgiSChlV2heubS8HYOO1j483Y1SjF9Fl/UdG+YklKjTsQ00yCM4JrRmzuSqeVuVvbos4iIUclJ/VwUIe4AVfuSIfcY1LsSqDorBTvil2Y9U/VCDX6WyaI2PZdWyDghxRWKyOLlgcuLq4o3cpF9gRVsPT11AVBFE+yMyIa9tDoEfPeWyKpHxDBtv9cYfSjUExHVh+2IwqX5E4U4VtbQEXx8rp2oFyqN0sUC1aSyYvHpwizU/nxF5VtwVRQ5vZezVjsY9g8x0yaB7SCWGySk+0kDdfe4C+1KQCUB3hjhVYTh07WYzHP3+uaZonQKNEzmVNXtb+1i48yvFVgqaxA1892DGWjPiLvPRpicY9SRLNOkQE5+AkH9HUf+UtUX6fLbo9Gqw2GlnaYPGbEG/5UvXEoqQylFIHszr/ozYiEdxOYVSZ78PrQ0RSm5GOs22cLxrcRMneH+E3GVh15lpq9Er5BmXZ85aqpxcazddEBWxddqLINdEm2CwDnaKI5kJceT6ZZkxis6PSeTinbYihA==
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e206440c-484b-4ff5-b991-08db24b50f20
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2023 17:53:46.3915 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7lPyJDwWOCsH43HVubiUrgxJvgzoBppQ4mJAiEdPKYJd+Ss681vUqKqShdRqY/hWRNHwCfZ7sSezlnu9ZubH8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR02MB7428
X-Proofpoint-GUID: vJUWNkzuk64a1noDCd71Tms67I0g2TWL
X-Proofpoint-ORIG-GUID: vJUWNkzuk64a1noDCd71Tms67I0g2TWL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-14_10,2023-03-14_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=692 spamscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0
 mlxscore=0 suspectscore=0 malwarescore=0 impostorscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303140146
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=tsimpson@quicinc.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
> Sent: Monday, March 13, 2023 11:26 AM
> To: qemu-devel@nongnu.org
> Cc: Taylor Simpson <tsimpson@quicinc.com>; Marco Liebel (QUIC)
> <quic_mliebel@quicinc.com>
> Subject: [PATCH] Use f-strings in python scripts
>=20
> Replace python 2 format string with f-strings
>=20
> Signed-off-by: Marco Liebel <quic_mliebel@quicinc.com>
> ---
>  target/hexagon/gen_helper_funcs.py      |  54 ++--
>  target/hexagon/gen_helper_protos.py     |  10 +-
>  target/hexagon/gen_idef_parser_funcs.py |   8 +-
>  target/hexagon/gen_op_attribs.py        |   4 +-
>  target/hexagon/gen_op_regs.py           |  10 +-
>  target/hexagon/gen_opcodes_def.py       |   2 +-
>  target/hexagon/gen_printinsn.py         |  14 +-
>  target/hexagon/gen_shortcode.py         |   2 +-
>  target/hexagon/gen_tcg_func_table.py    |   2 +-
>  target/hexagon/gen_tcg_funcs.py         | 317 +++++++++++-------------
>  target/hexagon/hex_common.py            |   4 +-
>  11 files changed, 198 insertions(+), 229 deletions(-)

Tested-by: Taylor Simpson <tsimpson@quicinc.com>
Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>

Could you also create a patch to do the same thing to target/hexagon/gen_an=
alyze_funcs.py?

Thanks,
Taylor


