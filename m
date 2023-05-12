Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BE1701169
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 23:36:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxaPY-0000Jj-Lr; Fri, 12 May 2023 17:34:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bcain@quicinc.com>) id 1pxaPW-0000Ja-NI
 for qemu-devel@nongnu.org; Fri, 12 May 2023 17:34:46 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bcain@quicinc.com>) id 1pxaPU-0003Yg-0q
 for qemu-devel@nongnu.org; Fri, 12 May 2023 17:34:46 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34CDFFpi028762; Fri, 12 May 2023 21:34:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=JSJgn1vnhlRhEz73ERQlLkexiNgrHih+qC5WAn9DRbY=;
 b=AbpuBIdE0/LyP/MlG9STmlH/ogIWKd+FPrGEJYv1PvVT3Alghdq8jdRni1Ola2xojEtt
 tZFyKsiVZyl1t3jM4UgOqbUFA2Z/20TmhtCagIKs3EBykk0UXvt8+JN78/et0eMfC5j7
 VKXB/M//EHJ1VCj/gtaKlYSelpuaoWfasa8FiQGbx9Ba1PukNGcqz3hDBtErqUmPzFTu
 jbSxu5Kb915NI+AU9Rt6EjDLdPOiwu+gcxZ8tryhZPeysIwSrMLVdIfgT3qYS6nU3R4z
 tdQ2giLG1lHGvcLHQOZz1OKIVemw3PVe+JrcSk2W+iz7/B5VPBq4xNl12xSXgM1ZKKSP 5A== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2176.outbound.protection.outlook.com [104.47.59.176])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qhfww1wnn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 May 2023 21:34:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kvs+UUwCmRXt3G64qQ1Vytr3yvh+2FM5oNuBUbcNmwaS86iLRWtjC4Thb7GwXQIRENy1nsUDzPl4Gxein/WFbP3pe6H4do7k12L1lnvgHTTpj+4hFutgV6kKSzFr1ZKyGH+LL276k+qTfZiqZCESyIhG7mRVaOQsl2Tc7ADNw4J6x/sEhR9FRccZC5ZdeTgdFyQVv0nSdb1BIpjYfVnRj8dNik7qIPQ9FeZ+rruiEZmQC1d0eTFNIn8PZ/tjs9OquRmrtEwPdpe6+W+2uD9YfAx8EIY1YzMiUV0YZJ7g6IdXp4BwlqXsqEOjxg6ECPv8ffw6P8fW4hMfXK7X5PR1ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JSJgn1vnhlRhEz73ERQlLkexiNgrHih+qC5WAn9DRbY=;
 b=gEkpc4Q292K67Q7ttqiMHJEsMUKyHWbwzupvwTAdS1P3xdXYyii70/2SagEt75BabgK6J6SlBBOuL43Lumm5g4sxDbk9g/BVmKSMucv6UM14MMAUNP/Ut2YfmUnh9cWrDIUeKRPRmLxc83CjME8nFevx7hNTUfeR8UJ2DVqu0jcZh+5Ng4HGRlRCI8yZOqDbZJmY+v/gpV6HygbrKkqyIxujHqx1kn12m6Iw6wVtvPmvuDWt19HbseJOLNMwDcdTSNCCY4CTbZHbWYWK+Xmazwv/7zKCWLjWjxPvdd5dGrYqpX5Pb/fVUbIghO8jRPIScqCrb2XsooUmN6QbqPgFVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN6PR02MB4205.namprd02.prod.outlook.com (2603:10b6:805:35::17)
 by CH0PR02MB8106.namprd02.prod.outlook.com (2603:10b6:610:10b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.24; Fri, 12 May
 2023 21:34:27 +0000
Received: from SN6PR02MB4205.namprd02.prod.outlook.com
 ([fe80::3474:4ff3:5083:443b]) by SN6PR02MB4205.namprd02.prod.outlook.com
 ([fe80::3474:4ff3:5083:443b%6]) with mapi id 15.20.6363.032; Fri, 12 May 2023
 21:34:27 +0000
From: Brian Cain <bcain@quicinc.com>
To: "Matheus Bernardino (QUIC)" <quic_mathbern@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "alex.bennee@linaro.org" <alex.bennee@linaro.org>, "f4bug@amsat.org"
 <f4bug@amsat.org>, "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 Taylor Simpson <tsimpson@quicinc.com>, "philmd@linaro.org"
 <philmd@linaro.org>, "richard.henderson@linaro.org"
 <richard.henderson@linaro.org>, Laurent Vivier <laurent@vivier.eu>
Subject: RE: [PATCH v3 5/6] Hexagon (gdbstub): add HVX support
Thread-Topic: [PATCH v3 5/6] Hexagon (gdbstub): add HVX support
Thread-Index: AQHZfp5fE5n9+6bIDkuFj6sAdTUU/q9XNYvw
Date: Fri, 12 May 2023 21:34:26 +0000
Message-ID: <SN6PR02MB4205C85B46BCCF5A5773DDC0B8759@SN6PR02MB4205.namprd02.prod.outlook.com>
References: <cover.1683214375.git.quic_mathbern@quicinc.com>
 <17cb32f34d469f705c3cc066a3583935352ee048.1683214375.git.quic_mathbern@quicinc.com>
In-Reply-To: <17cb32f34d469f705c3cc066a3583935352ee048.1683214375.git.quic_mathbern@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4205:EE_|CH0PR02MB8106:EE_
x-ms-office365-filtering-correlation-id: 94d1ccec-d906-4bff-d8c9-08db5330a91e
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JC7QdZpNkpXbcaSwk91c9uzZ16Hgyl6tTOPRH8LAl31Q0fU7CdNf78+C6uyTbZnnUquF5t1zI9NlDFrfuFsSeD5dm0XOV/PGXA8bTs+ydshpkPFb72e4VWEUd6uWMg8W5xpMLNya/XuDxJ/p8Uj+aQsfbJ5zZ9Hgxkh7uAk8YNhsUt+E4nfFfBe3oM/HetGnQolnDx1k7bgfvWserX5BsPwAC6gia6hxfkMj2kAfPtojuFrFlynJUoI7aHTZchlaFM0aYZG4ZDkHWNmlx+WpDK7+k/y4i7UxQrg7J4HerxoCbIx7J5JcKfF3EOX3yEDcui0mgj02tTfitLHAT9bosm7uoQ/oROx1T/zATTASs4p/bK2B+kUZUZP0UJ0q0qtPOIRATO5CDKm/AUeYHRgUMcYP/G280G/cNVy2aJ8/hAPzlg+rNOlrC3Tbza0NS/CYrpZyrxrWmiX6m4dhRYi1JSqZ1n/TxkVUtO60AsMi5jdL2X4SLQoq+DmPWlHHl3hsY8UoZRD/GjLnH9AfSzQosweWmAJL73oaw7ijBCJ/9ApHGEhIfvIxOpwQfZPPSs3N2Ccl7+tLEmh8Pu0GBJDRL0JKTjl13y3EN4o+F1RwbhQ0edWg6ct7/EzzkuGgejSV
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR02MB4205.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(39860400002)(346002)(376002)(136003)(396003)(451199021)(86362001)(33656002)(54906003)(110136005)(316002)(66556008)(66446008)(66946007)(66476007)(64756008)(76116006)(4326008)(7696005)(478600001)(41300700001)(55016003)(5660300002)(8936002)(8676002)(52536014)(2906002)(71200400001)(38070700005)(38100700002)(122000001)(186003)(6506007)(53546011)(9686003)(83380400001)(19607625013);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mxZOd0pakcX1GiXD0MjoRW+K/yW9TZF9WVNAU0UXhlsAuGNVyEVrBpciQD54?=
 =?us-ascii?Q?WV5WBWaUi9RcSi39B7OKyocxX19bExl4i0wAX3sKx16snXm79PEOdmw2SJcE?=
 =?us-ascii?Q?WJhuoJjKKhwkB5mlVJ638r43egfbCWUs91ct/zjWdDm6PDWoI0R0oHCGi5Lt?=
 =?us-ascii?Q?JtsUUNvpXwK1LL7uUsQED3rquwuvrT6epqT+U+9ipVYhx/Jz1AQOyJ3QPKuQ?=
 =?us-ascii?Q?mLAbcNkkboBYbFaJSlVG6FMcCQJ0DWdkz+KNPDb2p1Lh+qBxxOqRbC/ySj0A?=
 =?us-ascii?Q?LnrOt25kRnf4T28i6BZ7WyBvAUf+SoFloeBwwselPuHS8rmvtLR79Q6Y1jgx?=
 =?us-ascii?Q?EmX1kRVLjUGXeaJcmMnAALXcXZ7lmxvM73MMQU2IWaTFQEnIBPqAPYlagxwL?=
 =?us-ascii?Q?xVG+fz9ojMUxx+9AbhM3g3tI4Ioil0hNEvu8xJkSpS8FP0B9FsEpb0rVkaQg?=
 =?us-ascii?Q?17fnsZ1RhGXsUJwMfAEsKxSpLqIgkiot1rG3mVXzIKAqsWxmY/Gl6DqXuoBX?=
 =?us-ascii?Q?Un0ZOJsMX4F+ylG/yj3Gy9fELQ5+8QpJyE5bvnDlxzpguO0ehNk5eVa9JcSe?=
 =?us-ascii?Q?FNBHd7pSlN7SWbs9vCMuo+NWPyhszOE+eGBhLD/ry2MAUcytIdWoG3Hy99oe?=
 =?us-ascii?Q?Wl1oZDRe7UXTdUPfjXfhsSj912Ob++xuGgqgFatpWy1sZorYjg58WPgr1F0P?=
 =?us-ascii?Q?wH+z0tLfDtY2/TRjw0WC86VAf3XHqjvvrKlxHgZcPrn62l9FrGa+VZrAHH9L?=
 =?us-ascii?Q?lg2aWwUwRIRzfjdR4udBqOEu7SazDJYlVCUyKFj1/UdHjCLnpF5rxi7aZa7P?=
 =?us-ascii?Q?/P5/+KItobBBT5dypQAOvuHrshY4NH8W9IpSYcdbnLWChH/2FRRNOQqWq2Cv?=
 =?us-ascii?Q?DqZoR6W4VwUHpQxwxSLWfDE4wyAcTwyWUz5THnz0oj/pYuMqSKXdU4EHM4tt?=
 =?us-ascii?Q?Ze/3t218ETM+wR2DinjAqjg6jyKQCWoRfXlCK5VoYq7NNMIfhrqz5syIZDh0?=
 =?us-ascii?Q?L0z8r7ocPwWIqEJV+lakExGDdM0jZR/YAirHZwPIaXvFjmP5Bm72RRe8G7eO?=
 =?us-ascii?Q?SM3hPjwAfKdDpQ/2D5by8ojYixS19RzErOZoyWXFZ3ddHyrPOjPc9V+RWaYh?=
 =?us-ascii?Q?bvnQKNnCbtcmUTYHU09icrYWYewak1RUr/u8WsIoWjNuwHzarsLdcf4ywS6j?=
 =?us-ascii?Q?1N2H82FyibyI0o/3OZcFdqklI1SMb0Irz8PKjpRfVmz12i3lejovxZYzV6Px?=
 =?us-ascii?Q?y1jKA7Q2sjGH1CAEVjuC/OgNrwxnPKVbK8Cg416s5Og21L3zZCemS9Rgdybn?=
 =?us-ascii?Q?jf/J60wMif6cEd96slcM+iv26U2ZnSxecq9Jd+nrAykYpjST6DWr2vZGiLtp?=
 =?us-ascii?Q?kuBgF06HAl1v1/u2zU6eWrEA3LB/MPRo5hrnj22Grx5TEXYWpUIk8FftS414?=
 =?us-ascii?Q?m6YPMDAVHdFHrDHaoufF2vtaB92YxQoNCu5lbA/QoQfhoTmZtX56VGzrkoy6?=
 =?us-ascii?Q?94XILWOXroLtqGW20YrIdTDebkmATescYGbRj2fDUJNAz6bBrFGiPLx4P4fz?=
 =?us-ascii?Q?/jHgJ+J7auARuUSth/uVcKS9CW3NC4PjYCbzta5HkE5T41PTjJJbLTPEIaxN?=
 =?us-ascii?Q?yURlN9np8Es5ESzjcPN7qcc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 5nrxxiHpjMpU03k/HZifGobe79hcOi4sjtyg1fk3r+zuNK5ScSHMf+3JixJ33J4FDrc4xw+M8LPQnwz6dGDRFcmGCILolhoFHNP46rCu1Wda2s/nAXVhPwTHMdX2StweQ6EbNB/TcT66Z6M5FaUO8IPOEeFq7kwPdbbjZYqXI21VuE3FNHqGIFOwNbzthFxNsqjoilZtxhdY9Kv0g4L3LBTdM1Ra12HXagCua0qH1ywdIpWiJVhlbBK1d8Ca/YO+YLm1+FareCUrC/LXs8juCqPBCPJWB67K3ppjMsA2dOonp0cX/HmnYm0pqrZp6I5kWZSIrjZDxsNENGvwC3z4RGGItCaKIWIMooKkybnCg5xQCbG2vHlVJ59e9NTy3mE06f4SqOr266ugzwidNQc1HjoUmum8GVlevc8h68Ni255uxTDcpTHuoiXCMCttkIcEKyJRqKnQS0CO9pEq3ZZShCz/Cvec7bV6kEeT0VhEAAJDr6HSSwkX3EZX1kYoLtpfR0KTayUMcalqJQvT5R4Y79HpHmm89PQWiCVNtg4+ZTTp7oIWnf6nQmaDCuBHbd/ev3v7g0leyr8GW41ERvlUxnx4khOtjzEHOMmx+EhRlFrCvmBCjNOi9NHuZs4is7w32rY4An+vnUemdIKkKL4B4y+hYF3flagsNNUleoxdF1mF4sZzBo2kX6WvNHjLBkOe3RigDAAwRYDzCvO3PhTfTzhJ7fEvvcUHVp3iENtUF2EWTfJ+ryyeztF/JIqa6hIur7+wwfGrWRpqML2HKRj2jogshlf/zSoWKTCvJvcHcnfUWALDT5v/DoSvrO/tdxUJRvd4XJGpQd/XE+IjGnPOkV11dGC7rclAy5+1uDPdO84=
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4205.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94d1ccec-d906-4bff-d8c9-08db5330a91e
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2023 21:34:26.3575 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 69k8Gac3toZJ/5HtVdQz3wsfcAdvxcFb73VlGdiEt44YnjoWVKQQHfYZIfYx8K74DWs22HyaRp019Ywx0WkK6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR02MB8106
X-Proofpoint-ORIG-GUID: _exEAw8YccM-syWAstIm4mMUF96FoXQ3
X-Proofpoint-GUID: _exEAw8YccM-syWAstIm4mMUF96FoXQ3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-12_14,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=814 malwarescore=0
 spamscore=0 clxscore=1011 adultscore=0 mlxscore=0 phishscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305120182
Received-SPF: pass client-ip=205.220.168.131; envelope-from=bcain@quicinc.com;
 helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
> From: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
> Sent: Thursday, May 4, 2023 10:38 AM
> To: qemu-devel@nongnu.org
> Cc: alex.bennee@linaro.org; Brian Cain <bcain@quicinc.com>;
> f4bug@amsat.org; peter.maydell@linaro.org; Taylor Simpson
> <tsimpson@quicinc.com>; philmd@linaro.org; richard.henderson@linaro.org;
> Laurent Vivier <laurent@vivier.eu>
> Subject: [PATCH v3 5/6] Hexagon (gdbstub): add HVX support
>=20
> From: Taylor Simpson <tsimpson@quicinc.com>
>=20
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> Co-authored-by: Brian Cain <bcain@quicinc.com>
> Signed-off-by: Brian Cain <bcain@quicinc.com>
> Co-authored-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
> Signed-off-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
> ---
>  configs/targets/hexagon-linux-user.mak |  2 +-
>  target/hexagon/internal.h              |  2 +
>  target/hexagon/cpu.c                   |  6 ++
>  target/hexagon/gdbstub.c               | 68 ++++++++++++++++++
>  gdb-xml/hexagon-hvx.xml                | 96 ++++++++++++++++++++++++++
>  5 files changed, 173 insertions(+), 1 deletion(-)
>  create mode 100644 gdb-xml/hexagon-hvx.xml
>=20
> diff --git a/configs/targets/hexagon-linux-user.mak b/configs/targets/hex=
agon-
> linux-user.mak
> index fd5e222d4f..2765a4c563 100644
> --- a/configs/targets/hexagon-linux-user.mak
> +++ b/configs/targets/hexagon-linux-user.mak
> @@ -1,2 +1,2 @@
>  TARGET_ARCH=3Dhexagon
> -TARGET_XML_FILES=3Dgdb-xml/hexagon-core.xml
> +TARGET_XML_FILES=3Dgdb-xml/hexagon-core.xml gdb-xml/hexagon-hvx.xml
> diff --git a/target/hexagon/internal.h b/target/hexagon/internal.h
> index b1bfadc3f5..d732b6bb3c 100644
> --- a/target/hexagon/internal.h
> +++ b/target/hexagon/internal.h
> @@ -33,6 +33,8 @@
>=20
>  int hexagon_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
>  int hexagon_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
> +int hexagon_hvx_gdb_read_register(CPUHexagonState *env, GByteArray
> *mem_buf, int n);
> +int hexagon_hvx_gdb_write_register(CPUHexagonState *env, uint8_t
> *mem_buf, int n);
>=20
>  void hexagon_debug_vreg(CPUHexagonState *env, int regnum);
>  void hexagon_debug_qreg(CPUHexagonState *env, int regnum);
> diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
> index a59d964574..2e36903d9d 100644
> --- a/target/hexagon/cpu.c
> +++ b/target/hexagon/cpu.c
> @@ -24,6 +24,7 @@
>  #include "hw/qdev-properties.h"
>  #include "fpu/softfloat-helpers.h"
>  #include "tcg/tcg.h"
> +#include "exec/gdbstub.h"
>=20
>  static void hexagon_v67_cpu_init(Object *obj)
>  {
> @@ -315,6 +316,11 @@ static void hexagon_cpu_realize(DeviceState *dev,
> Error **errp)
>          return;
>      }
>=20
> +    gdb_register_coprocessor(cs, hexagon_hvx_gdb_read_register,
> +                             hexagon_hvx_gdb_write_register,
> +                             NUM_VREGS + NUM_QREGS,
> +                             "hexagon-hvx.xml", 0);
> +
>      qemu_init_vcpu(cs);
>      cpu_reset(cs);
>=20
> diff --git a/target/hexagon/gdbstub.c b/target/hexagon/gdbstub.c
> index a06fed9f18..54d37e006e 100644
> --- a/target/hexagon/gdbstub.c
> +++ b/target/hexagon/gdbstub.c
> @@ -60,3 +60,71 @@ int hexagon_gdb_write_register(CPUState *cs, uint8_t
> *mem_buf, int n)
>=20
>      g_assert_not_reached();
>  }
> +
> +static int gdb_get_vreg(CPUHexagonState *env, GByteArray *mem_buf, int n=
)
> +{
> +    int total =3D 0;
> +    int i;
> +    for (i =3D 0; i < ARRAY_SIZE(env->VRegs[n].uw); i++) {
> +        total +=3D gdb_get_regl(mem_buf, env->VRegs[n].uw[i]);
> +    }
> +    return total;
> +}
> +
> +static int gdb_get_qreg(CPUHexagonState *env, GByteArray *mem_buf, int n=
)
> +{
> +    int total =3D 0;
> +    int i;
> +    for (i =3D 0; i < ARRAY_SIZE(env->QRegs[n].uw); i++) {
> +        total +=3D gdb_get_regl(mem_buf, env->QRegs[n].uw[i]);
> +    }
> +    return total;
> +}
> +
> +int hexagon_hvx_gdb_read_register(CPUHexagonState *env, GByteArray
> *mem_buf, int n)
> +{
> +    if (n < NUM_VREGS) {
> +        return gdb_get_vreg(env, mem_buf, n);
> +    }
> +    n -=3D NUM_VREGS;
> +
> +    if (n < NUM_QREGS) {
> +        return gdb_get_qreg(env, mem_buf, n);
> +    }
> +
> +    g_assert_not_reached();
> +}
> +
> +static int gdb_put_vreg(CPUHexagonState *env, uint8_t *mem_buf, int n)
> +{
> +    int i;
> +    for (i =3D 0; i < ARRAY_SIZE(env->VRegs[n].uw); i++) {
> +        env->VRegs[n].uw[i] =3D ldtul_p(mem_buf);
> +        mem_buf +=3D 4;
> +    }
> +    return MAX_VEC_SIZE_BYTES;
> +}
> +
> +static int gdb_put_qreg(CPUHexagonState *env, uint8_t *mem_buf, int n)
> +{
> +    int i;
> +    for (i =3D 0; i < ARRAY_SIZE(env->QRegs[n].uw); i++) {
> +        env->QRegs[n].uw[i] =3D ldtul_p(mem_buf);
> +        mem_buf +=3D 4;
> +    }
> +    return MAX_VEC_SIZE_BYTES / 8;
> +}
> +
> +int hexagon_hvx_gdb_write_register(CPUHexagonState *env, uint8_t
> *mem_buf, int n)
> +{
> +   if (n < NUM_VREGS) {
> +        return gdb_put_vreg(env, mem_buf, n);
> +    }
> +    n -=3D NUM_VREGS;
> +
> +    if (n < NUM_QREGS) {
> +        return gdb_put_qreg(env, mem_buf, n);
> +    }
> +
> +    g_assert_not_reached();
> +}
> diff --git a/gdb-xml/hexagon-hvx.xml b/gdb-xml/hexagon-hvx.xml
> new file mode 100644
> index 0000000000..5f2e220733
> --- /dev/null
> +++ b/gdb-xml/hexagon-hvx.xml
> @@ -0,0 +1,96 @@
> +<?xml version=3D"1.0"?>
> +<!--
> +  Copyright(c) 2023 Qualcomm Innovation Center, Inc. All Rights Reserved=
.
> +
> +  This work is licensed under the terms of the GNU GPL, version 2 or
> +  (at your option) any later version. See the COPYING file in the
> +  top-level directory.
> +
> +  Note: this file is intended to be use with LLDB, so it contains fields
> +  that may be unknown to GDB. For more information on such fields, pleas=
e
> +  see:
> +  https://github.com/llvm/llvm-
> project/blob/287aa6c4536408413b860e61fca0318a27214cf3/lldb/docs/lldb-
> gdb-remote.txt#L738-L860
> +  https://github.com/llvm/llvm-
> project/blob/287aa6c4536408413b860e61fca0318a27214cf3/lldb/source/Plug
> ins/Process/gdb-remote/ProcessGDBRemote.cpp#L4275-L4335
> +-->
> +
> +<!DOCTYPE feature SYSTEM "gdb-target.dtd">
> +<feature name=3D"org.gnu.gdb.hexagon.hvx">
> +
> +  <vector id=3D"vud" type=3D"uint64" count=3D"16"/>
> +  <vector id=3D"vd" type=3D"int64" count=3D"16"/>
> +  <vector id=3D"vuw" type=3D"uint32" count=3D"32"/>
> +  <vector id=3D"vw" type=3D"int32" count=3D"32"/>
> +  <vector id=3D"vuh" type=3D"uint16" count=3D"64"/>
> +  <vector id=3D"vh" type=3D"int16" count=3D"64"/>
> +  <vector id=3D"vub" type=3D"uint8" count=3D"128"/>
> +  <vector id=3D"vb" type=3D"int8" count=3D"128"/>
> +  <union id=3D"hex_vec">
> +    <field name=3D"ud" type=3D"vud"/>
> +    <field name=3D"d" type=3D"vd"/>
> +    <field name=3D"uw" type=3D"vuw"/>
> +    <field name=3D"w" type=3D"vw"/>
> +    <field name=3D"uh" type=3D"vuh"/>
> +    <field name=3D"h" type=3D"vh"/>
> +    <field name=3D"ub" type=3D"vub"/>
> +    <field name=3D"b" type=3D"vb"/>
> +  </union>
> +
> +  <flags id=3D"ui2" size=3D"1">
> +    <field name=3D"0" start=3D"0" end=3D"0"/>
> +    <field name=3D"1" start=3D"1" end=3D"1"/>
> +  </flags>
> +  <flags id=3D"ui4" size=3D"1">
> +    <field name=3D"0" start=3D"0" end=3D"0"/>
> +    <field name=3D"1" start=3D"1" end=3D"1"/>
> +    <field name=3D"2" start=3D"2" end=3D"2"/>
> +    <field name=3D"3" start=3D"3" end=3D"3"/>
> +  </flags>
> +  <vector id=3D"vpd" type=3D"uint8" count=3D"16"/>
> +  <vector id=3D"vpw" type=3D"ui4" count=3D"32"/>
> +  <vector id=3D"vph" type=3D"ui2" count=3D"64"/>
> +  <vector id=3D"vpb" type=3D"bool" count=3D"128"/>
> +  <union id=3D"hex_vec_pred">
> +    <field name=3D"d" type=3D"vpd"/>
> +    <field name=3D"w" type=3D"vpw"/>
> +    <field name=3D"h" type=3D"vph"/>
> +    <field name=3D"b" type=3D"vpb"/>
> +  </union>
> +
> +  <reg name=3D"v0"  bitsize=3D"1024" offset=3D"256"  encoding=3D"vector"
> format=3D"hex" group=3D"HVX Vector Registers" dwarf_regnum=3D"88"/>
> +  <reg name=3D"v1"  bitsize=3D"1024" offset=3D"384"  encoding=3D"vector"
> format=3D"hex" group=3D"HVX Vector Registers" dwarf_regnum=3D"89"/>
> +  <reg name=3D"v2"  bitsize=3D"1024" offset=3D"512"  encoding=3D"vector"
> format=3D"hex" group=3D"HVX Vector Registers" dwarf_regnum=3D"90"/>
> +  <reg name=3D"v3"  bitsize=3D"1024" offset=3D"640"  encoding=3D"vector"
> format=3D"hex" group=3D"HVX Vector Registers" dwarf_regnum=3D"91"/>
> +  <reg name=3D"v4"  bitsize=3D"1024" offset=3D"768"  encoding=3D"vector"
> format=3D"hex" group=3D"HVX Vector Registers" dwarf_regnum=3D"92"/>
> +  <reg name=3D"v5"  bitsize=3D"1024" offset=3D"896"  encoding=3D"vector"
> format=3D"hex" group=3D"HVX Vector Registers" dwarf_regnum=3D"93"/>
> +  <reg name=3D"v6"  bitsize=3D"1024" offset=3D"1024" encoding=3D"vector"
> format=3D"hex" group=3D"HVX Vector Registers" dwarf_regnum=3D"94"/>
> +  <reg name=3D"v7"  bitsize=3D"1024" offset=3D"1152" encoding=3D"vector"
> format=3D"hex" group=3D"HVX Vector Registers" dwarf_regnum=3D"95"/>
> +  <reg name=3D"v8"  bitsize=3D"1024" offset=3D"1280" encoding=3D"vector"
> format=3D"hex" group=3D"HVX Vector Registers" dwarf_regnum=3D"96"/>
> +  <reg name=3D"v9"  bitsize=3D"1024" offset=3D"1408" encoding=3D"vector"
> format=3D"hex" group=3D"HVX Vector Registers" dwarf_regnum=3D"97"/>
> +  <reg name=3D"v10" bitsize=3D"1024" offset=3D"1536" encoding=3D"vector"
> format=3D"hex" group=3D"HVX Vector Registers" dwarf_regnum=3D"98"/>
> +  <reg name=3D"v11" bitsize=3D"1024" offset=3D"1664" encoding=3D"vector"
> format=3D"hex" group=3D"HVX Vector Registers" dwarf_regnum=3D"99"/>
> +  <reg name=3D"v12" bitsize=3D"1024" offset=3D"1792" encoding=3D"vector"
> format=3D"hex" group=3D"HVX Vector Registers" dwarf_regnum=3D"100"/>
> +  <reg name=3D"v13" bitsize=3D"1024" offset=3D"1920" encoding=3D"vector"
> format=3D"hex" group=3D"HVX Vector Registers" dwarf_regnum=3D"101"/>
> +  <reg name=3D"v14" bitsize=3D"1024" offset=3D"2048" encoding=3D"vector"
> format=3D"hex" group=3D"HVX Vector Registers" dwarf_regnum=3D"102"/>
> +  <reg name=3D"v15" bitsize=3D"1024" offset=3D"2176" encoding=3D"vector"
> format=3D"hex" group=3D"HVX Vector Registers" dwarf_regnum=3D"103"/>
> +  <reg name=3D"v16" bitsize=3D"1024" offset=3D"2304" encoding=3D"vector"
> format=3D"hex" group=3D"HVX Vector Registers" dwarf_regnum=3D"104"/>
> +  <reg name=3D"v17" bitsize=3D"1024" offset=3D"2432" encoding=3D"vector"
> format=3D"hex" group=3D"HVX Vector Registers" dwarf_regnum=3D"105"/>
> +  <reg name=3D"v18" bitsize=3D"1024" offset=3D"2560" encoding=3D"vector"
> format=3D"hex" group=3D"HVX Vector Registers" dwarf_regnum=3D"106"/>
> +  <reg name=3D"v19" bitsize=3D"1024" offset=3D"2688" encoding=3D"vector"
> format=3D"hex" group=3D"HVX Vector Registers" dwarf_regnum=3D"107"/>
> +  <reg name=3D"v20" bitsize=3D"1024" offset=3D"2816" encoding=3D"vector"
> format=3D"hex" group=3D"HVX Vector Registers" dwarf_regnum=3D"108"/>
> +  <reg name=3D"v21" bitsize=3D"1024" offset=3D"2944" encoding=3D"vector"
> format=3D"hex" group=3D"HVX Vector Registers" dwarf_regnum=3D"109"/>
> +  <reg name=3D"v22" bitsize=3D"1024" offset=3D"3072" encoding=3D"vector"
> format=3D"hex" group=3D"HVX Vector Registers" dwarf_regnum=3D"110"/>
> +  <reg name=3D"v23" bitsize=3D"1024" offset=3D"3200" encoding=3D"vector"
> format=3D"hex" group=3D"HVX Vector Registers" dwarf_regnum=3D"111"/>
> +  <reg name=3D"v24" bitsize=3D"1024" offset=3D"3328" encoding=3D"vector"
> format=3D"hex" group=3D"HVX Vector Registers" dwarf_regnum=3D"112"/>
> +  <reg name=3D"v25" bitsize=3D"1024" offset=3D"3456" encoding=3D"vector"
> format=3D"hex" group=3D"HVX Vector Registers" dwarf_regnum=3D"113"/>
> +  <reg name=3D"v26" bitsize=3D"1024" offset=3D"3584" encoding=3D"vector"
> format=3D"hex" group=3D"HVX Vector Registers" dwarf_regnum=3D"114"/>
> +  <reg name=3D"v27" bitsize=3D"1024" offset=3D"3712" encoding=3D"vector"
> format=3D"hex" group=3D"HVX Vector Registers" dwarf_regnum=3D"115"/>
> +  <reg name=3D"v28" bitsize=3D"1024" offset=3D"3840" encoding=3D"vector"
> format=3D"hex" group=3D"HVX Vector Registers" dwarf_regnum=3D"116"/>
> +  <reg name=3D"v29" bitsize=3D"1024" offset=3D"3968" encoding=3D"vector"
> format=3D"hex" group=3D"HVX Vector Registers" dwarf_regnum=3D"117"/>
> +  <reg name=3D"v30" bitsize=3D"1024" offset=3D"4096" encoding=3D"vector"
> format=3D"hex" group=3D"HVX Vector Registers" dwarf_regnum=3D"118"/>
> +  <reg name=3D"v31" bitsize=3D"1024" offset=3D"4224" encoding=3D"vector"
> format=3D"hex" group=3D"HVX Vector Registers" dwarf_regnum=3D"119"/>
> +  <reg name=3D"q0"  bitsize=3D"128"  offset=3D"4352" encoding=3D"vector"
> format=3D"hex" group=3D"HVX Vector Registers" dwarf_regnum=3D"120"/>
> +  <reg name=3D"q1"  bitsize=3D"128"  offset=3D"4368" encoding=3D"vector"
> format=3D"hex" group=3D"HVX Vector Registers" dwarf_regnum=3D"121"/>
> +  <reg name=3D"q2"  bitsize=3D"128"  offset=3D"4384" encoding=3D"vector"
> format=3D"hex" group=3D"HVX Vector Registers" dwarf_regnum=3D"122"/>
> +  <reg name=3D"q3"  bitsize=3D"128"  offset=3D"4400" encoding=3D"vector"
> format=3D"hex" group=3D"HVX Vector Registers" dwarf_regnum=3D"123"/>
> +
> +</feature>
> --
> 2.37.2

Reviewed-by: Brian Cain <bcain@quicinc.com>

