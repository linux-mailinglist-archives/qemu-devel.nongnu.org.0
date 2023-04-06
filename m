Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6A66DA26E
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 22:16:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkW0j-0005Lp-Vf; Thu, 06 Apr 2023 16:15:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pkW0f-0005LW-Lj
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 16:15:05 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pkW0b-0004K8-De
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 16:15:03 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 336IMixm027204; Thu, 6 Apr 2023 20:14:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=9C7YkC9ZIr2UiMJxiRloANNj482wIwsuIiyPoS/CzuI=;
 b=lSc7Q9npXFsY2wuPUgjnVeKJ3I5eBXeN53Ouv9lfZlBQbC+7uIEEq/61CJuqAa7wQOr0
 ZUvFq9m8U4jpxHOHukGc7/P57PLEtb32awRVhQsMfs1cJ21w4htWk1ONrlD8vmggvBd1
 ZM2J8mVTRAzUPSSeOoDUKrn5439b/Bu7Z97iNtv7Pm5OfiJboMdbTMb7JrD/o5V3zfzE
 8Ouqk9V6J1n0I06iA+Sjp9HNF+M4h2Kur8LiOKmldCBLFndEsuPOANz84GCKhCIIrYyt
 eaS9x23rCKCBp5uQ0UFSrSqiXipbzSaqrVliu66BmBZhKMCcniOi0YetGWitUqxhPm2P 8g== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2103.outbound.protection.outlook.com [104.47.70.103])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3psgehjub1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Apr 2023 20:14:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XzMQWtx1wA5miEaE1DUlph6Nc2IAkcSXhqBnVXf1qzB7jC0Ajw/tcMkFPJkdxa57i6nQDOlTRIaarYyqV84VcPBtYlhaqiHSsD4GH6+K3giHbeUhQgrGgaVSgy+8lF88rgG+thhQpCBG1Qh1qQQg+/FCWod/drjGSRmyvHD8HvuewVLryHuROpCOoAKSYF5jNbRQyET58V4AcSR45PnXiGEeYdr2hRdJZ2+xnCU+lWpw11ARJfv2W4krvgLT+c/xFAGXwTR5GZlYf6OiuEBNCl4LT4FLduxxKzXvyBEw/cJmXzrVE9kS0dNHL5ZW8MrEa+zd4a6e/jNo3kgb/H1ghA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9C7YkC9ZIr2UiMJxiRloANNj482wIwsuIiyPoS/CzuI=;
 b=V6i3+Y+K2Dk6l/yYA3XcCj8Y/3yXWcORH1jXOacXMnmQdPSrS8I3im7OAO5ai0IbHQkegktHcME/p9L4sne8gKNVk0IaoxhE6UOoW3+ZivsyEhaQbKONmaFVwA8NocQiKdUUM0ZNgdx8/XQkePBGCEkYCiCngw3984s1rOg5lCmDh+0KyyAgtproLQSQqwgcmGh9S//9v20CZny7BRprhkumcrxr6e71wEUgbAbYLtt2opLI3U8gLLp2AOGPzEtZuw7/9s7cZUrQaua1Od23nx1lMKfZ3ESVcqh2z5O4jAcVcfaMLIxeFJFdnPcH1VDfGyhFkEDriM7gzzV48ah7bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by DM6PR02MB6842.namprd02.prod.outlook.com
 (2603:10b6:5:223::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Thu, 6 Apr
 2023 20:14:51 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::eb63:d1c0:28de:72f5]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::eb63:d1c0:28de:72f5%8]) with mapi id 15.20.6254.035; Thu, 6 Apr 2023
 20:14:51 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: "Matheus Bernardino (QUIC)" <quic_mathbern@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: Brian Cain <bcain@quicinc.com>, "alex.bennee@linaro.org"
 <alex.bennee@linaro.org>, "f4bug@amsat.org" <f4bug@amsat.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>, Sid Manning
 <sidneym@quicinc.com>
Subject: RE: [PATCH 5/7] Hexagon (gdbstub): fix p3:0 read and write via stub
Thread-Topic: [PATCH 5/7] Hexagon (gdbstub): fix p3:0 read and write via stub
Thread-Index: AQHZaL5IpwIKC/yq4EyxRnNgcO1ptq8etynQ
Date: Thu, 6 Apr 2023 20:14:50 +0000
Message-ID: <SN4PR0201MB8808917802FE46248C0762FBDE919@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <cover.1680808943.git.quic_mathbern@quicinc.com>
 <7ea9a493960213e35b61906f86001bb9aade2b99.1680808943.git.quic_mathbern@quicinc.com>
In-Reply-To: <7ea9a493960213e35b61906f86001bb9aade2b99.1680808943.git.quic_mathbern@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|DM6PR02MB6842:EE_
x-ms-office365-filtering-correlation-id: 3b815502-a8a1-4a8a-0d46-08db36db93d0
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: K2+YjvW/HpfrENA8ZHV1UXrtNnFjmmzXUpJDdGiKQ6ZMJIH63qe/wYzCk9G0a2lVtp1Tb3GtPfxfn+EOeh6Ztucx7E2aXyjXWTzm5wUDbcjuqWuaYZ9GeEsVSN7QmhqfgKdOmhJNThyjhj5Rc6lns2+u7UqeQ8cnaEIL7bMj2N0xpZVd+cv3BwulO3UZw06F+T7/0q35uuN0iHqLXZ/BiBIxECGnEKjHRy53LNeACTw70S4ay/XDTDOW8Wl67k0wv84hgu47gYyE6TbIyjMXLNbAiHLpfasSrgJ99EdNk4mEJBOyQisURfu6MX/MkC75N0n3PKatvilB9vI7tSSEyOIRUWf5OATiCAjTWl2o+FbsVFFfKwjgjkY5G2RQ6oyT0KBIWSDZgsyjknZ5xa+ycO1PeDFTwFnVNWQM6EFgosPXgnWBaIHGVPHtLHdI9zgFuAJvhGwySfdt0Z3sBIxcqGbmSLsDP686a3mv1S/ESCigS2Y4AbeOACGf00bwQSZqtmQuh6/f2VUQVnEBvvr9FfVDj4qSxoiAp6AJlqJ371UtdVcIT9y9A4kFxX4zbpPD+TXSwnTdyhBEndFN+aq3EeP9WNlRtb74Ljs32vqjdZOdz7qd4G2/JZ9d9XGNSvqf
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(39860400002)(136003)(396003)(346002)(366004)(451199021)(186003)(53546011)(107886003)(55016003)(2906002)(38070700005)(9686003)(8936002)(5660300002)(86362001)(66446008)(316002)(478600001)(110136005)(33656002)(64756008)(54906003)(83380400001)(66946007)(6506007)(66476007)(122000001)(4326008)(7696005)(52536014)(76116006)(71200400001)(66556008)(38100700002)(41300700001)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JT5YNoMUrZip9zC114usMLIky/WmfyN3KMx7y1KeoMsrgANsdisnjEQiMH5C?=
 =?us-ascii?Q?XSIDt8pp/DH7lamSrhoBzA3u7nhMEiQzysJaYhJPkto9WuzVrUx9p6Tp2Kq8?=
 =?us-ascii?Q?Ri5Tzn9HeM9dQotbCpWQmGWQ5GvAIX5STiMfhiOtH37IZzfadi6qGshsdSwe?=
 =?us-ascii?Q?Y5Tz7huJNz7Imic9PgxGi8QERWveAYnmcEXKadsd6hYEnTAZqFHdmYe9RbYX?=
 =?us-ascii?Q?bfOkABcjeuKNsxsd+8iLxRgO9LMvB/CnxkbDEqJtRsMCpTxkICnri5/PYsz7?=
 =?us-ascii?Q?vVfEu2JX2oRgDJa/1PsfqcZf/C2KnHiu9y0CKrCt95TosnLAi3+StgYfrwYP?=
 =?us-ascii?Q?XVnweacbhmfV57SbXXOxcf23Kwl5j+ops1RsGO7WafNd6WbFTkXmFzEuEBqN?=
 =?us-ascii?Q?obeJUB1ae1TFfulYnbVU4SIuXXZZ9IW35bLHXS6hKiKvkdcDEep/rFcH8622?=
 =?us-ascii?Q?64ZCCYlBhbmYQMPTzkcVjP6J75HjTgY8RDPvKNnizlbNpH8d6UMz3mWkyHDg?=
 =?us-ascii?Q?9ZXuAnemb44ZmojrR16IJT2Fx6oaOiwOo5rDsQ9dgPKmQGHQR2T/FbsJvxQk?=
 =?us-ascii?Q?G+PRourX0Ab+54zRQTxuj1G6geFPHY4+Eze+kjZgYwmIai9yHr1DYcL8nHrs?=
 =?us-ascii?Q?H8iEnY7UTT/aSLe0VaRqNzQgKCQKF05pqZ9ztSCJaw7JHugs8w7j4WJdnrya?=
 =?us-ascii?Q?jdtTGhzulePubd+BfmS0jIAavu17ilLrvFdk7EmR3hZexrcvpWwOeM00JrJW?=
 =?us-ascii?Q?faDExoGDSrMfrf88qbST+WrRJ43t2DubtiZNd+w673luRZJSruxB54IbiitO?=
 =?us-ascii?Q?VDEOIJU+dghWIUIw0O/MqSCpA20sdoPLesn3AA4hedMM6UIeuSKon6Zxohqp?=
 =?us-ascii?Q?G1gnwwzk6c7yCntj2+wKZPt8GzwMsB4NkxW+bMcMxWi3NTYzg5jhggNsIPf4?=
 =?us-ascii?Q?ccv1dgdMUjWw11gG9BP8ME6RtF7d9OOnh69yx1XkUnDQr3+YYeiLfFSjVNnv?=
 =?us-ascii?Q?Pfa69Cj0+Z1zUaCkCEdAdMfP3ZUCkhBqZ9Qy42lnUqEpMRuynl+frwgSS5wY?=
 =?us-ascii?Q?YyhAU56odnzgFightpJfwaYvmqOT7CrdqFIHHbNlaB+GJF2d1WiggpmgjndG?=
 =?us-ascii?Q?juKfuFQ3f2OF3QQXC7Mgi6ThL/ARDRZ6xHyVhsiujQZxX6rIiM1CZbY/E1rn?=
 =?us-ascii?Q?Owmp7WWbcdFTdHuRYvRd8bjBGoSAIUdt6i+oC8J1DzoZ9H6jDfB9GK2CiHa+?=
 =?us-ascii?Q?SPSEGzYTBqikTBzOCAAGq/xUYkCut9jg5+4WVAIFwHx6Lc/usrSYAHa3BoQT?=
 =?us-ascii?Q?oYV6KM388w1mOhXet0c+T4cigSigg8WSJdXY4M7JM3yRbCIEOiaYhg9zeML6?=
 =?us-ascii?Q?+vurwswZff/1WmtqUcj08PD4n+cbXl/o1bvNSeQVADPeYe1rgkgM9MIITFdi?=
 =?us-ascii?Q?zdtHsJm5FEKTl/91Loseif8N0nQ5F9efLu17I8nD+gv5TElYoFq6+jV5JBlD?=
 =?us-ascii?Q?VG40YYrA7iJj4cMT5Bsibb5KQ+8r4UmLoYg3ive8q4i3c8KyYhSWTJVDVRWN?=
 =?us-ascii?Q?Hu2heiaAgQ6F/pAzkP0skzo1jx7H7s/ZpSNfYME82kZmSQRa37NaTr8u2iXR?=
 =?us-ascii?Q?6ZctMuMhrYZM8foqGzhYrB4MUknd3WTG5eKuuHMqJClK?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: AhR2YwcRENCGMPgm5dFUAP2KGuKIuBQx0SjBbzoiQSBYDRizk14T/VVa9i9Z16DTI0y2iMHq91Df+kxJOVqhtQoQLLDgkdZ8pmke+zU5MLpK7kS86lJk1S1weiooM32wWOcuzQt0TRwePQC2+gRCf7EC1cN7TKxmemb33jsYnr4uDTLt43SH2sM6f6jQlhP1EaIEcBYMNVE62CaWfnullqr44m/3/wOL2PweboOnTwG0UHV3M9kAx2DBveYqEh2jSQyn+OnVnPfq7uokYVVRPwC5majbwpAoovbehc1tsrzqdO2NnSArQccXEl1eeZ5DjicYA2RtjXsaTeZprg5uLJYaiqA1ZjIR+Yas/dOceYJaqC5Tx5mwCvwdkOpG1Xbd1t3tF6rib5TvjH0Q4lg7a8SlkqN2ASMbFkQjk0h0q5tnsJWUIVunhi5GDhP3cejuaek8EokNnRqx4A9HgpNfgR3gZQC7jIqonWBrmy+2WPQIeY8J0X9WwCSW2uWJmKobRpN4n6LXyudKHPjREXvZwBO9cvSxqph59XaK8IQB+AFXz096571qP8s95uOtpoyL2sHhByTRcyiwzeRb/HkahSXIt1fOvZG2acXsPdJFmfeBDLZdT97cM9ePLNpvN3APJWzY+8TsGaQImOajkvSQjIxGOKX+C7SPcExxGe7DXg/kguIEbg7LYOqvTmoP3Y4jCMoIjAKhAhmNOVsuMY8nbmTQtY6Ae+65bmUAqUUOAEYVoAttPp74Nz8LCX/Y4JgGuSfG5M8BSg4u/7PYNrBoNjtvW3foaNukiZVun1Hg3xp5JqRHC2BaVWVgqw6nXvFD
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b815502-a8a1-4a8a-0d46-08db36db93d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2023 20:14:50.8534 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X6TmQa/NkFW/7tSq8ZmCKgJe7V/8CjOQnyD6YT9bWn3mpM8wNBdUnMvIaFL3d1B8FV0oAQYxuqevjZ1bP8i2YQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6842
X-Proofpoint-GUID: e4kQZOZyLLMSjMW63ZMovFxpQBEBBpmy
X-Proofpoint-ORIG-GUID: e4kQZOZyLLMSjMW63ZMovFxpQBEBBpmy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-06_11,2023-04-06_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 clxscore=1011 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 mlxlogscore=768 phishscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304060179
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
> From: Matheus Bernardino (QUIC) <quic_mathbern@quicinc.com>
> Sent: Thursday, April 6, 2023 2:30 PM
> To: qemu-devel@nongnu.org
> Cc: Brian Cain <bcain@quicinc.com>; Taylor Simpson
> <tsimpson@quicinc.com>; alex.bennee@linaro.org; f4bug@amsat.org;
> peter.maydell@linaro.org; Sid Manning <sidneym@quicinc.com>
> Subject: [PATCH 5/7] Hexagon (gdbstub): fix p3:0 read and write via stub
>=20
> From: Brian Cain <bcain@quicinc.com>
>=20
> Co-authored-by: Sid Manning <sidneym@quicinc.com>
> Signed-off-by: Sid Manning <sidneym@quicinc.com>
> Signed-off-by: Brian Cain <bcain@quicinc.com>
> Co-authored-by: Matheus Tavares Bernardino
> <quic_mathbern@quicinc.com>
> Signed-off-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
> ---
>  target/hexagon/gdbstub.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>=20
> diff --git a/target/hexagon/gdbstub.c b/target/hexagon/gdbstub.c index
> 46083da620..a06fed9f18 100644
> --- a/target/hexagon/gdbstub.c
> +++ b/target/hexagon/gdbstub.c
> @@ -25,6 +25,14 @@ int hexagon_gdb_read_register(CPUState *cs,
> GByteArray *mem_buf, int n)
>      HexagonCPU *cpu =3D HEXAGON_CPU(cs);
>      CPUHexagonState *env =3D &cpu->env;
>=20
> +    if (n =3D=3D HEX_REG_P3_0_ALIASED) {
> +        uint32_t p3_0 =3D 0;
> +        for (int i =3D 0; i < NUM_PREGS; i++) {
> +            p3_0 =3D deposit32(p3_0, i * 8, 8, env->pred[i]);
> +        }
> +        return gdb_get_regl(mem_buf, p3_0);
> +    }
> +
>      if (n < TOTAL_PER_THREAD_REGS) {
>          return gdb_get_regl(mem_buf, env->gpr[n]);
>      }
> @@ -37,6 +45,14 @@ int hexagon_gdb_write_register(CPUState *cs, uint8_t
> *mem_buf, int n)
>      HexagonCPU *cpu =3D HEXAGON_CPU(cs);
>      CPUHexagonState *env =3D &cpu->env;
>=20
> +    if (n =3D=3D HEX_REG_P3_0_ALIASED) {
> +        uint32_t p3_0 =3D ldtul_p(mem_buf);
> +        for (int i =3D 0; i < NUM_PREGS; i++) {
> +            env->pred[i] =3D extract32(p3_0, i * 8, 8);
> +        }
> +        return sizeof(target_ulong);
> +    }
> +
>      if (n < TOTAL_PER_THREAD_REGS) {
>          env->gpr[n] =3D ldtul_p(mem_buf);
>          return sizeof(target_ulong);

Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>


