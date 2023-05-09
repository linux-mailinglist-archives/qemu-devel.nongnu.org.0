Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADF36FCEFD
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 22:01:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwTW8-0001VZ-9e; Tue, 09 May 2023 16:01:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bcain@quicinc.com>) id 1pwTVz-0001Ry-3q
 for qemu-devel@nongnu.org; Tue, 09 May 2023 16:00:51 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bcain@quicinc.com>) id 1pwTVx-000680-1V
 for qemu-devel@nongnu.org; Tue, 09 May 2023 16:00:50 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 349K0Oj9013986
 for <qemu-devel@nongnu.org>; Tue, 9 May 2023 20:00:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=K34HKwwSvisp4lcOOFDEvQMbeV1VPDSVlMr8Yzngtdw=;
 b=HJuqp+BTgK3QJj+HtKNss9xoO9AoTh0dJPONcxrNmddeoZENyZb/FD3mOOzVQmtLFDAy
 UjXzK0unQuMHhqLjJOjI4dqGnzrUfIRYGW3wDfwK/zXSYrw/7rrNjCQ3+QcGH5zEyA19
 fsQO6b7OMcniL+sV0vrfU6hxyb7mXL0gwNmp69ZMVEjyAx2fjvhacERmMbFzDHaKaWIe
 WhO953phhD7WUPphriT475N8OvCyZYKv2K0O/5NSZ0H7Gk8zELauo5tN09azQEMm9bj3
 wQFgTzXTeuz9jB78aSRRZz+B8kJTb41pDiTfzKCgadrdBD1s7mdeAGbdGuF7P63fMm1K xg== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qf785aqct-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 20:00:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FnZlytrJq2QYBH4q5Xu8nPGXsUluQ0YKeBSIaruhohjzO4KpdOME5/zKbrdEQPXj+OwFwVgCebOzc1M7wIXgZh/qIEDpxXztvxKP7Jfh3rr4vij/gd+/rJNDSqwdcoFuKze5m7YK5ujffrmvBaA3buWnmemTxEiK2H+avEoEfWtDfGgE5gs9mVNQwj/9qksz67dbp/jsBoDCMlAyB+1EP728b5PtiISkj3T5uAjICMbbMqCqspvgJPokRxH6lmuG25boKFKuGnhAuYt1NH/GVJlkVE62hMrt2SITx2hr5ZrozFmwU5HT1NaWxTH/OJKfQVnTm3tVaWpGLaYvLAMtQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K34HKwwSvisp4lcOOFDEvQMbeV1VPDSVlMr8Yzngtdw=;
 b=LYwH52sBTgU94IMZ8EBovYHS61OJC3Ur6QtsKlcz6rNF0jyyah8E/sbb+47S8afBkYC08jIW8iZ/eFM7j6B4wh+jiL/aSIRDOHaXs53ljfdChbhTEPwJS7lXsYqOBDmiXwI2pBjzNXLEdad5Fb0cSH8WYIh7mG6Zcb0C7yO6The6OPeqtrXcs9bxzsjKdxB2Evg4a1XNGOke8v7309PxJgVMaqPNtaHEnFjsc00MEcphhGwb1lgxYnyz234eIdAmDyckVhi+nWaWyp3ZFSGaXmBh1kDQYO1m6s78sGMP/+eJGvBQbTJZq+a5inkjI6QMQfcr/pev7yY+hi56YufU6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN6PR02MB4205.namprd02.prod.outlook.com (2603:10b6:805:35::17)
 by DM6PR02MB6988.namprd02.prod.outlook.com (2603:10b6:5:22c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Tue, 9 May
 2023 20:00:43 +0000
Received: from SN6PR02MB4205.namprd02.prod.outlook.com
 ([fe80::3474:4ff3:5083:443b]) by SN6PR02MB4205.namprd02.prod.outlook.com
 ([fe80::3474:4ff3:5083:443b%6]) with mapi id 15.20.6363.032; Tue, 9 May 2023
 20:00:43 +0000
From: Brian Cain <bcain@quicinc.com>
To: Taylor Simpson <tsimpson@quicinc.com>, "Marco Liebel (QUIC)"
 <quic_mliebel@quicinc.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "Matheus Bernardino (QUIC)" <quic_mathbern@quicinc.com>
Subject: RE: [PATCH] Remove test_vshuff from hvx_misc tests
Thread-Topic: [PATCH] Remove test_vshuff from hvx_misc tests
Thread-Index: AQHZgqYR2xS+QA7gakCohwckRFyhDa9SU4sAgAAIy4A=
Date: Tue, 9 May 2023 20:00:43 +0000
Message-ID: <SN6PR02MB4205E963C4443B22808CC939B8769@SN6PR02MB4205.namprd02.prod.outlook.com>
References: <20230509184231.2467626-1-quic_mliebel@quicinc.com>
 <SN4PR0201MB8808DC3221D2D5FC8F6530C2DE769@SN4PR0201MB8808.namprd02.prod.outlook.com>
In-Reply-To: <SN4PR0201MB8808DC3221D2D5FC8F6530C2DE769@SN4PR0201MB8808.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4205:EE_|DM6PR02MB6988:EE_
x-ms-office365-filtering-correlation-id: 4c45a166-c5a0-471f-b00d-08db50c81262
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hzcppJYjfVLhkRmMzEWntZfT4Pu4yb15/xG8F8efbVjimlRJop5c23LIyHGYhzFAg+8SHQXyFYFGv1oFYCMOkgpeX1p0Ut9cCTxNCp3VI+n4MdnTt/be0/rJGD8FmfQL+YS26ki1gxcFNioIvBs/IcmwbpnQA7kPsuzvqr20qTuwd/P5E5aC37jf9JMztixUbv9ANwB9FQ1x4OQ6fdGNwAWmnJo7L9STYP0IqE7KSElf8AX5vJgKWo49qzfa6l2FOq+epipbqDTfv9o7PAynegETLGZSE+3iDkYy2Lq8y4t1JUGiFtZTAFU2EjO+2qUoT1wPOLRX1hDsiSoeKBFZxPbJHSo2XWexuCA3x6q7Fusa6rSJUTO7NcfzrrwIGJ60z0Dq9HInuxVfP0o6i8wxN3G3NQ2QgHGgDQVKK6IInSGDegcXsUuSUCnd1XWnsVY0N2LfX1g186xI2kmnRykacz9J44Rt9x4D9XVHrkVyFUpqqA9Sx5n6Q0AUJJW8T8EJ05Bi5dN/RCpf9LKDl3HPGoxn7bCzssEVpqQEA2jS5M6aXgYqpxcS0yKuBAUGLzaGgVPv2vuj2em38IVlwWFVtQS7aNbMwrd+kTW1LUt08j9IFSiZv++y+A3v+KL0pL5x
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR02MB4205.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(396003)(39860400002)(136003)(376002)(366004)(451199021)(83380400001)(41300700001)(7696005)(71200400001)(38070700005)(8676002)(86362001)(5660300002)(8936002)(2906002)(33656002)(186003)(26005)(107886003)(9686003)(6506007)(53546011)(52536014)(55016003)(122000001)(38100700002)(478600001)(66946007)(66556008)(66476007)(64756008)(66446008)(76116006)(110136005)(316002)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jUiNpQgcPxE6Gv70luRNuWcpv1A/AIjnXBeVZNv0PJxtjk0c2l9XNDxgN7iT?=
 =?us-ascii?Q?6cej7tSFOz+TR8uvlwvojx606wmYXElXauW+1+dih98d4pprZ9dmTwKHTb9f?=
 =?us-ascii?Q?wHaiEftR2gny5rhewL0xJb6iCbO+bj8WBRsHwldE7gfnguZ58BJlZ4R8fzYJ?=
 =?us-ascii?Q?aMMM57THBZeV71Qzl3BYuasxJlLH3A4K4aaE1Q5od4LyqBCpKFfv43N4L7dV?=
 =?us-ascii?Q?M14BVYJCY+gPD0ifenJWKP9swHZByImeL/oGjShLRTNQIVN867daTx0TFkny?=
 =?us-ascii?Q?A6YIG5wF/Ui/6BJbqKJQAsjBJtGdCv7kLCtsKtT9rCuUrQM3X3Ot8xz0dg8j?=
 =?us-ascii?Q?ndp4y8m1Oj7wUITjk6Rk8Bj6YtHAQsfr6bGP3x9Oo27vcuM1x/4C3byuEFms?=
 =?us-ascii?Q?fLVDvLwYQmZjHttypPIzPvnJMnVv/EbEPag747/kKFOy1CYfDIpr9r5FT6Ow?=
 =?us-ascii?Q?vT96DCbzzNQexhpZd61BVtfhWTYSPKOX3hSkL55wpyZ7mbzTBbRmWQ1Am89J?=
 =?us-ascii?Q?7wHG68YuwF+DHCd65MCxwxYdbQRyjZzd2/LYCvPT3Wkr1szxk8IizebB2iNX?=
 =?us-ascii?Q?afqqrzfHkYf+iLstZgk1pKcbNshO1DlaSdl0GcnFPj/BYUTgka962mKijVl4?=
 =?us-ascii?Q?khHHRyH8gfbc1hjlqwqMbhmq2LZrLiUh99PYfhpO6YMfKUOUu1INLPtQTeVZ?=
 =?us-ascii?Q?/g7ivSH/1vr01549x/6yB0q4ZtmSWPmp5ftJO3pWmNd4OZLJdB5Dv3TR/c3t?=
 =?us-ascii?Q?OdPcRp+2sfnBcuT14KWslXmlgbx+ksfgDD/9z006lT9M1xmRDzDy22I3I8dO?=
 =?us-ascii?Q?XHnJeOztKy7Pf8V5cdITB6F4Yi/XJwm3NfIDyHmL3DqKrbxEbjcqNhs2T3GN?=
 =?us-ascii?Q?028NjiQEhTEbeDlybgJib6d6KUIcOzZe2yeHq82Q2VC0S8F4k2DXeRm7v5VR?=
 =?us-ascii?Q?lUjlsvl05fIMiSnhPNLvEsg1XiSruTc6BQ/HZ9xsQjNCcevvGLPQT7MuHG7c?=
 =?us-ascii?Q?AEkz0fihk/gS244KWwjc0j5geLMyE0L6X/yZSZSnxPKg1uBhhVy0kUXVKKC8?=
 =?us-ascii?Q?9/RAJS+ecMazyQ38qfjBmRxBmuzps7C8Fyrbh4Tj/XHVLhzknNbAku7LNBui?=
 =?us-ascii?Q?dtYA3H/UqUY4n+nm76S5WppivRvN4by0/V3Lkjxu5tfjT/rFZWwXR+iD3t0i?=
 =?us-ascii?Q?hJuYne5KUy3XAUda6FXqmwCD54Eq7drkuydSGa9AIQQ8kZogJsuA+oiGNzrD?=
 =?us-ascii?Q?9wrrupl4QpRI0ThXfQyPPxdj5CMt88N5qZyupxECRy+cew8vhcR5g7PmddGO?=
 =?us-ascii?Q?B430alaMwwfznMycwQbCiAuhVtudBNq2vq6cWb0cUolw0X8SKj/UbTNo8kz+?=
 =?us-ascii?Q?gUP7zLyb5mngQWDFBrGeFelx0BkMMGIvTdJ3KuaF0QBCmJOIQP2RtSbM6nHb?=
 =?us-ascii?Q?RYG5ahkNRLrRsUv2o6MPUILtYDpBimoEt/rFF2reHr0IEBbXbbw79pH1upGK?=
 =?us-ascii?Q?Bo3B9sHl4NPoaJ/lKFw3kGKef48VDv5Lfu9qoRTh5jh54GlRn8gudWz2gVqV?=
 =?us-ascii?Q?WkddA+fqZZChYhrM0ctM1o9tXHcJZ/BjnxuAtZJd?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: /9Acltgpnqp9BVk0WyIV4B7civZPsoOUrC+s1MOuhtjgpF/GETSDvEe/lEIhcQkDWoUG2nhrqHsFOjXWZB2uy6iEGLNKLhr5KsKXXcL/QUcx6Q6Rz1AJm2XBJem7IMZ6IfmTQLaoSQhA6qzjyHeDACDoLgmnzz6eAtk3LIpZgelDwIV6AdX9KfAtd2y5ewG8po8WPFcrCodGXczvlQxefD5VGnNYpuWguIzBaJDw9NjX/LEzplXP8vk6R93a8y1unzksf24xZJ2czGzggst5gKD4LKNQDTYJa5w7nw23Y1lXmtl6XzXKuC6dagW5Kuw71md8RfEyfxG2Kv/peeeiEpd/02QcPVfcd8a+3jTPt8OZ+SnJAIDlfLt1jpfo7ixKjCfi8oTpjgxwfbjngsfo7ctmWBzDKOIliKBmn/2unB8JBoYgU0mTVL3kbjvCSr3aWpZWAI26qAMI7bZgWQ0IiQjF1Y3RIApnPRXlOUVawiVek6qvi9YgC44qIn1uR3Gb1yg0BvwOA8iPtJX7GfRMsFuTFIYgc/cBqKdXxSYd/QcyBrj1zwofDbQNB0/yoUOXY1luyhu2u6NBSZX0YWdMr8/aZC4sqF4HdAq5bXMDKKaSvF8HaTcXArQDCnzvS5Uy660cN7EpaxPpHXIV4U7UOs84QCk01dDQpVtyblemXehwe5hYFGaPSdn9gPG25Vw2XJjxmGSKTuLFeW8MP4Jj58OiKyD2dhq2Vw6DT2JKp44UiV98paK2ryFlX2DM1bFoT+BQJLojodRBgUZwdwsE8A==
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4205.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c45a166-c5a0-471f-b00d-08db50c81262
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2023 20:00:43.5098 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tnazVG6C/E/IbxdIR85oydyDsqut3HHYHM7a1X6fVYoYGBQ/c66me9gAFAasC4tyU6CKp6Ep29HkDEE/q3dEsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6988
X-Proofpoint-ORIG-GUID: 0viTKCyuob4p8TDTK4K0Go_b9rUpzytB
X-Proofpoint-GUID: 0viTKCyuob4p8TDTK4K0Go_b9rUpzytB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-09_12,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 mlxlogscore=653
 lowpriorityscore=0 malwarescore=0 mlxscore=0 impostorscore=0 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305090165
Received-SPF: pass client-ip=205.220.180.131; envelope-from=bcain@quicinc.com;
 helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
> From: Taylor Simpson <tsimpson@quicinc.com>
> Sent: Tuesday, May 9, 2023 2:28 PM
> To: Marco Liebel (QUIC) <quic_mliebel@quicinc.com>; qemu-
> devel@nongnu.org
> Cc: Brian Cain <bcain@quicinc.com>; Matheus Bernardino (QUIC)
> <quic_mathbern@quicinc.com>
> Subject: RE: [PATCH] Remove test_vshuff from hvx_misc tests
>=20
>=20
>=20
> > -----Original Message-----
> > From: Marco Liebel (QUIC) <quic_mliebel@quicinc.com>
> > Sent: Tuesday, May 9, 2023 1:43 PM
> > To: qemu-devel@nongnu.org
> > Cc: Taylor Simpson <tsimpson@quicinc.com>; Brian Cain
> > <bcain@quicinc.com>; Matheus Bernardino (QUIC)
> > <quic_mathbern@quicinc.com>; Marco Liebel (QUIC)
> > <quic_mliebel@quicinc.com>
> > Subject: [PATCH] Remove test_vshuff from hvx_misc tests
> >
> > test_vshuff checks that the vshuff instruction works correctly when bot=
h
> > vector registers are the same. Using vshuff in this way is undefined an=
d will
> > be rejected by the compiler in a future version of the toolchain.
> >
> > Signed-off-by: Marco Liebel <quic_mliebel@quicinc.com>
> > ---
> >  tests/tcg/hexagon/hvx_misc.c | 45 ------------------------------------
> >  1 file changed, 45 deletions(-)
>=20
> Let's not remove the test completely.  Just change it to use different re=
gisters.

I'm fine either way.  But IIRC we added this test particularly in order to =
verify the potentially ambiguous behavior of the same operand here.  It may=
 be well tested otherwise.

