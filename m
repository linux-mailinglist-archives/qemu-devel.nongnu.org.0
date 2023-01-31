Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56572683A94
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 00:39:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pN0DS-0004hB-Rg; Tue, 31 Jan 2023 18:39:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pN0DR-0004gn-4H
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 18:39:05 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pN0DP-0005gL-Ah
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 18:39:04 -0500
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30VNSbWu012682; Tue, 31 Jan 2023 23:38:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=7NE9YiYfqrRclPTP1GtMw5g+RU17qfrfygEKCDdkuo0=;
 b=I1FC19EY6nwlFB3SGrHIXAT/1O2qDMw9LeQiZxW8ErTQ0ekgOTUHSq8USue1W7vzFr+G
 ghvmK8tfrqXS2Pq2nr+Fsi/pB9X4I5N8oXm+Q/sqPKRjIScrVyc3gB1bvNuZRP4VtMkg
 kg7jqJRoIIwxikOwl/+tccgKsHigXeJWEIkSFPAAgL8MCQr+NGZd2FcttRsTGl+hoPV6
 4gNC/zTNFcHym26AfCpX83r68I0sA7lJCB6AsJbnB2dPDtEGDluAwXfC06p2LsRCWzDm
 jqdZFlfsmoHAbnW3Bs9SgxxDbAwHUm77o/Pzf/jgeWmDsotRElAS0J0YwK8tFv5FdafY YA== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nexb01xnd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 31 Jan 2023 23:38:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EWyryID8/Xl5hUP8B0xV/drcx8SeHQgws3/Erh+Aj2GIRiULN1T9KWmQ3+o//IrHKi2YEBwSAhlRabXMEzxetS89k/uOofkB0hDRYZBkl6a1p0IoFjGFLCDZgb6Mtxb/YBVRJxnzBxwJakez5zFbIh7+KC3uwtD/fxw65T8d0a2Xm8ybpwnLctNGF3ngFsJufpz9W6V0Sc5qxUgTTF28M9m+5H36Y046YH5zL274iNBaRkyhG8MyU/d/192AsyVT2IhH52JEuVOeI0sXt47um04VASEE9MCfav7EXuLEKPNn0uPuCjlvJzlM+EnXu9Y+hX3/KFOVT93ksPAXpfIm1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7NE9YiYfqrRclPTP1GtMw5g+RU17qfrfygEKCDdkuo0=;
 b=VR2sh8lmCri6SZAoroCUys5Z0S27v1VSk7aaTKRiedOvITBRY0ZPZoNn5zBEh/OuDQwYQfewy0RZqvaw+eTyyV5Jm1w0fMZkVH5SGTp4cBS3cCqTkifARTkm5Qj7omM8R0HfHlTmhm3fRIn3pHd/+lM9xeO7errycKrf+yX9bb0Rh8AsCpP8GBxLG+t/dRVXCBYrk7BLfkh84Wa90sRgUnMydPzdX1Iuftn+2zdDxGYAjUQtG7lDZoT3Ktqr/XqwQ5pBA1rGi6H4sX5oaCAnlf7R0a7RrQStDWPjX4MU7+GPTdlq98EH1EWmWAVsU0HtXsVp9REAQQVRSq3qZC6MEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by DS0PR02MB9600.namprd02.prod.outlook.com
 (2603:10b6:8:fc::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Tue, 31 Jan
 2023 23:38:55 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::ad4a:7f4:772b:2a86]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::ad4a:7f4:772b:2a86%9]) with mapi id 15.20.6043.038; Tue, 31 Jan 2023
 23:38:55 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Anton Johansson <anjo@rev.ng>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: "ale@rev.ng" <ale@rev.ng>, Brian Cain <bcain@quicinc.com>, Michael Lambert
 <mlambert@quicinc.com>
Subject: RE: [PATCH] target/hexagon/idef-parser: Remove unused code paths
Thread-Topic: [PATCH] target/hexagon/idef-parser: Remove unused code paths
Thread-Index: AQHZNcPQ2rxswxUsiUiRCTcTankhaq65Jabw
Date: Tue, 31 Jan 2023 23:38:55 +0000
Message-ID: <SN4PR0201MB8808DB31482C630CBEF0183ADED09@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20230131223133.8592-1-anjo@rev.ng>
In-Reply-To: <20230131223133.8592-1-anjo@rev.ng>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|DS0PR02MB9600:EE_
x-ms-office365-filtering-correlation-id: b40289e4-3151-4c6a-5593-08db03e45131
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qQHH7DPmv1Jcl7y4/C8y8/16pMhrD55Rt/IfaI/omDjfb2S8pPNDuYz1/NroXaKJmeTp73dg/puwpkva672jqckvBbFW78hTCDUthdnN1rNRdCv4rmTFNBKlKog9TQmnUZFQ6Ox9XLinLIkox5wyWbnQin5Qw0MzcDVowzWZvIosCvck9GjlZ+sTZRTgJ75+OnNLpruTc7GXOj4OgwStvnVAKUH20Rj6432RL6Yd6j/Hx64hUoGk+ZI6jpNYk60HOcGxxgsDsZK1z0yCH2qvFi4PAvNVNNezkR1/UBZ825sGwakPRP1Kci/gFqusyRbkmcTYXgPC03JfVBu/J8iAyZ0rocYvnOXVKwfuNOEmBSizuY/vSELj2jlNLK+g12QD544h4pLaOXGLLDRb1r2wiyqzEIf+wS0T9f1nIJfbnS2TyRxW7sgiqQW8F1KB4UEUMeMVqSsPe6VrImIqqsvCaYc9/LjpBVNEpuFDx3Wpoc60sDsFVw5WtMxOWKAs/ZTeJbxrG8j0y+xMzaGaKBHcPpSbfXLZZ0YGhIHIYO+Moh3o+kKcPW76AryWk+mt3eQmVibMW3agpc3fFsZy8rx6T5bKpfyrpot2SeEjflCETOtGoqVNb3gpWFZbDlYMPIHnuVep9AodxwWGeNVhht3aebtHWdLOitgMS4VAqA0Xn9AconKe8OWCdldqeRfXb9KN84Vw4+slSIJVETk77d1fmQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(39860400002)(366004)(396003)(346002)(376002)(451199018)(4744005)(2906002)(53546011)(110136005)(186003)(83380400001)(316002)(33656002)(26005)(9686003)(54906003)(66946007)(7696005)(122000001)(6506007)(71200400001)(107886003)(66446008)(76116006)(66476007)(66556008)(55016003)(86362001)(64756008)(478600001)(52536014)(5660300002)(38070700005)(41300700001)(4326008)(8936002)(38100700002)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Oi+1HqZFp9V0goswRQhFFNG3J9E7iuy7z9sTNKIQ6kfKXuQSm3Su19ArpeBD?=
 =?us-ascii?Q?t4p/5wiMDUZ2m0YY8jbGZyMbiUmT+DjRnO3eaK5VY6Kl+R27mvVDXQsG+u6I?=
 =?us-ascii?Q?gpDu9lpzn8w1sBR/gB6x2FIxBnmFx3B8MGE7KerGuyrSZzSwpw+zhgaPpAD4?=
 =?us-ascii?Q?CZb50eCypqxRMTxS6SCgkRc3iDaxblxIxCf1URCrN8FXDvEa+U0dLmKXDJKU?=
 =?us-ascii?Q?iXFsje6Jd7R9QTclscIuIlC+wBoIPWd/8P18KsMG65KoqbDFMyFnOGChMI2s?=
 =?us-ascii?Q?Zv424I2euqw7hcBv++E0EeoTiSOBtVQE+WESRD2duFWmLtmG+M24EC87OAKg?=
 =?us-ascii?Q?P7rYP1K2RSbdDsDiSzU//kJFahBa+rtDBosJJg15dAzSFswNyWzO1Lubno+U?=
 =?us-ascii?Q?KzpgOLv6wkPSq5aZDoctoTnxyetVst01FjGHRJVM/l3PfqN19nunvpYQasOx?=
 =?us-ascii?Q?zZiMh3x7ZGFZU4xBQV3LeBMIYnz9Z1TZg4/fQWBID4rgpokoA06SLZkVLJOW?=
 =?us-ascii?Q?QurgJEbIqJrj0R5FZfsDvHOAfMPhSKrWcqu9+AAG93Tozr0eoWnDSv2CQJpF?=
 =?us-ascii?Q?Y2qZsom0MWm0hdA71jNdIWo9kihI+VMygtmJitAZKZiiUykY5JpMozFoZLWG?=
 =?us-ascii?Q?zQZqfdY/blWQlri607ONkDbmgEuccGk7iZsZbRT/Y925wSja/qFXydLWRcgv?=
 =?us-ascii?Q?UCjvz4vFIF1Rf5eJ41RTT+Fp4oRp+Q4hycJJYjT/CBw5UQo86XJWiEoQ0AKx?=
 =?us-ascii?Q?TRcm3NarJheU/v9hhkSKX4N5sygZaxPfejkDaNlAf+PST0y3OjnaEdNQbQgU?=
 =?us-ascii?Q?1mFNwrutp7teDByec0KG1+eWv9ErPBEI8r3bcyeSMZtgfPhVLWLwajE7KqOj?=
 =?us-ascii?Q?MBeQdEsLBBPNskySCOfWTnD83SebPzGkkI/KiJr6Sgqt8GHV/jCkQp/oJLbU?=
 =?us-ascii?Q?WUL/qUS4AUU3a4ugB5XuRnKqmkYA7KRwF4zjQwxf6ZLBck0CsukFHso0NNyF?=
 =?us-ascii?Q?sFtSL3cZRSpALOJNdYtFj0YvZPvkHGeSTzF1jLIjSv6WDB3mKDBJJ4YDDRnm?=
 =?us-ascii?Q?N3RkOrGeH0t4nYe6PoAa4wL7gp7WFPxGSFfUwlneBO3poX4V8ouQasz+1hB/?=
 =?us-ascii?Q?C73zGp4VBu5pHmBrDyswitKLYYqgN5MvB3p5mPtz+XrcbHvSTwHjD8/JLajc?=
 =?us-ascii?Q?NlV7IuOQ72Y+gLsmlaOVFtIXPg2U6BZYcc9D3WpvlfPqGaUuUqOg8df1S7Y4?=
 =?us-ascii?Q?uc1jtdFB36+O1pmnusFkd4R5klefv/dZ8ugdSnvus1xE7fBooD9kJ2U2YGGX?=
 =?us-ascii?Q?WDV2QCnPH8Bn2mv3ksFGrF+MEUSfnqWA1qx9alRC2gkJb5MJqc//Map4aakJ?=
 =?us-ascii?Q?MdvDscQTltKTBmzeiCyK8fT9FyCqUnLiTacaKPzLNi6L7zeRlW4TaaxPouLO?=
 =?us-ascii?Q?s5ZYMOQ8acszWhs1UHaah/zA/h0V7+urYJ5L4iXwZ9ZCkClCoJwcc7CKczDq?=
 =?us-ascii?Q?czkHBsM3TbcYi08mZIwHKc3yMuVVjhXMgulmINhFsb8cT6QFuQCX0IfvvyNq?=
 =?us-ascii?Q?IJaOA474RVC80gQhKseqQ+5k0IvHpRznzvGpPjn7?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: VCImyfS+B+a1YF1M7VxZrTuSF23NMSMiTzfJTOpSpJZKBm0Cs5spI+CdblH61WKXZFJFbsoMonplXLrgA21FUEAZJkGWeILYb0gzcu0emfaLlyCzOkvXHsca5LYHYpMjuO3TDWeL21/mKUnfWOoRYL+mifXVNHMdUYLHZZGQ61LSIqXzWiu+gzXJZaSy+JX2Bf2OPNHkCKO2oSKj2L9iTDABlHc7ft+qG95BdKDwr0y+5IHn8h3H9rz6DmosrKCnQsKWqX2Y40Gn85GhomB1uPSzUcVU/ZXyHZ3bQO0UvhSb18JcWyYg9x9rnSXcGXeCtPtZZD2iA9LrlVTv7RhpSyfNvT+dszlFdboYqHxQDhG+8Ts06ZKqTr0q8WUZEFZoLgWu/Yslnjr7r9tcgGGLrAkFYVg1dze3+vTsLcGzrTQlXpGfe21PZqHyZh13uAcsSAs6ir9NUwJWhJY6rniBKmRYdmyYhbjFzl7mP9BWTzwMH1xgXN7q4bWmNPtyOqIRwcQunv3Y3BfMuR/scmBC1BDLphcIlNNlM+J/CMqGzGLe2Ep/rrDWUmaqNsomFO1iu/bktE/+AJHITI8tfzunomHT4DTY3pjneR4zUtSkHpgmXy9s8+od9qMZm+tBv5W85rda8HAA+Bb9SQns4APVh+GIgAuWwvJV/Lm7fY/QjFq2CdCiRkQsk/Tpf9qWhGWSLa3QFNeFzGXtcwgzFOPoW9wAo/HPTUg3qX19FHtzaImoDklothEh/xrDXw7U0EAKRXca72DDpVWU9rKA65V4UbiGv8FZYBd0V0iJHLX8Rg0=
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b40289e4-3151-4c6a-5593-08db03e45131
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2023 23:38:55.2515 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gFhMFMH5cp15WL910agjmthbCmr5xvcdTXJCSDAYPpWPsuNtxPoh9+5bCTxPgWeAY2wyFKCypbuk+63jgVZvdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR02MB9600
X-Proofpoint-GUID: cTIEMYmS0gNZsmNsaB95sq-qhrNJpuMo
X-Proofpoint-ORIG-GUID: cTIEMYmS0gNZsmNsaB95sq-qhrNJpuMo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-31_08,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=527
 malwarescore=0 clxscore=1015 adultscore=0 suspectscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301310202
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
> From: Anton Johansson <anjo@rev.ng>
> Sent: Tuesday, January 31, 2023 4:32 PM
> To: qemu-devel@nongnu.org
> Cc: ale@rev.ng; Taylor Simpson <tsimpson@quicinc.com>; Brian Cain
> <bcain@quicinc.com>; Michael Lambert <mlambert@quicinc.com>
> Subject: [PATCH] target/hexagon/idef-parser: Remove unused code paths
>=20
> Removes code paths used by COF instructions, which are no longer
> processed by idef-parser.
>=20
> Signed-off-by: Anton Johansson <anjo@rev.ng>
> ---
>  target/hexagon/idef-parser/idef-parser.h    |  1 -
>  target/hexagon/idef-parser/idef-parser.lex  | 27 +------------
>  target/hexagon/idef-parser/idef-parser.y    | 45 +--------------------
>  target/hexagon/idef-parser/macros.inc       | 10 -----
>  target/hexagon/idef-parser/parser-helpers.c |  3 --
>  5 files changed, 4 insertions(+), 82 deletions(-)
>=20

Tested-by: Taylor Simpson <tsimpson@quicinc.com>
Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>=20

