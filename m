Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1466A76E1
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 23:39:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXV5F-0001HL-Sp; Wed, 01 Mar 2023 17:38:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pXV5D-0001HB-Nq
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 17:37:59 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pXV5C-0006Y1-0b
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 17:37:59 -0500
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 321I0xMH030134; Wed, 1 Mar 2023 22:37:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=foQ2Ht7/0stm4bm6+ZghcTgoJ75tTymoShYaFsT0D0M=;
 b=hvJIme6dzHV9bJfYDWg1w/+FD+JeRTIoo/sF+Y9goYGlidewoBj6QaasXCxyoVX97MrK
 cwpPAxat8VbJKtf4IabnoKm+zpdjHvAs3FtPIqWkgc6aHqMswrdMXJVN680zwxQhLUIy
 8e2N+ep5sb7sKTob3a137L3KBV0T+rQMrolDGVYv3J8nIMNVbXnM4p1OWWSnRtE4+oI1
 rxhOmFZ7pHBConhIyH27FOXhv9zxeQ8ffDFJXDl6bARrx1tMnsFl1oJWG+uJmWROk9Yu
 X8nqHOLwRCgxPR5NpWeJiFC8MBenXIZS2Q5hoXn5LfdYu9b0/91Gwzo0oafkz2VrNO6w vQ== 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p20j2jrm0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Mar 2023 22:37:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=krYqeq7pDQySL3SaC3AhR5Q0599ZKQNQAD1G2bm8b31p2QMcoh9ZgGJnfpeO/vDEjH9Z7VepvXIwcZ6lWmvC57yDTFE/6Wr/GMoU5tBzLBuIu5aSf9+mCCxVYxQErmUXq8d5ohLsxak3h38TMAzZhx2lGQa+8IRSvFKcZfmCGJh5ZHQUmpt+EK65d2MDHhmx03aLHhGhnv+J04s2n0oV30+dB6FwMypEgLIjDneErGmVe7AtuSAJ9oHeY1pqFOOA0o0s64hSY0l4vXy66DJa7oE/oKhmQhCS+7Q0i85KZg5ItgTUybDbabZVKbU9wGhp+RIuTcIIa7pwN8DDXXSJ8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=foQ2Ht7/0stm4bm6+ZghcTgoJ75tTymoShYaFsT0D0M=;
 b=S03BF9Hyj7RUJF1dVZrJGvq7qvBvVXxLudSzFvsSbyUqYAF/JUZFCYMzigx5T+EezuFLbTIIB0Np+HylvJXtdvzm9Ul39v7nuQEav2p24Scecs40Y1nyiRwZOElYG3D3cid8GvCMkHTpyGH/fiSI7pEEAmKSTY0BvkNhrvspjI8nOWlKeRsjYchR3yAIdxzcB7NroELVE2qcq34IzumF+GK9/IvWgyoFBz0LaXNqL1uKjIFCAk28few8+2Jna4RRnNNYCcttVsQE3T1fmBQmXmiVA4Ttzpaodu4IkGcF5L94S5L7nPqPAsklNR1RjctTObM2yo8hqIcdCCsPTS3k0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by SA0PR02MB7497.namprd02.prod.outlook.com
 (2603:10b6:806:e0::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.30; Wed, 1 Mar
 2023 22:37:52 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::3e12:c026:afdc:beda]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::3e12:c026:afdc:beda%4]) with mapi id 15.20.6134.030; Wed, 1 Mar 2023
 22:37:51 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Anton Johansson <anjo@rev.ng>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: "ale@rev.ng" <ale@rev.ng>, "richard.henderson@linaro.org"
 <richard.henderson@linaro.org>
Subject: RE: [PATCH] tcg: `reachable_code_pass()` remove empty else-branch
Thread-Topic: [PATCH] tcg: `reachable_code_pass()` remove empty else-branch
Thread-Index: AQHZTElL9AdChuPYo0aSaFmd2Bpt7a7mfpBA
Date: Wed, 1 Mar 2023 22:37:51 +0000
Message-ID: <SN4PR0201MB8808E80B0AD000E394223813DEAD9@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20230301142221.24495-1-anjo@rev.ng>
In-Reply-To: <20230301142221.24495-1-anjo@rev.ng>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|SA0PR02MB7497:EE_
x-ms-office365-filtering-correlation-id: 4ba77ee0-0149-40e9-f480-08db1aa59796
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: f3qCUenyDQInO7gvoQCHN4HbAt2fYjcAI/F4vXqkYKTHjDSeFhhXkquUbnFTtCqbEsuEvW8We9dPLm1IzDT7C95XBlmvBNn59UX1iYQ6tBHRaYBppxcp84GBi1hcrzJG+qvvwGhFXxrsmPrQ01F+hSf1lcfvtc3/jrR87WldNE6AeqvkVD4limJjUEiQIe7w/5j2J8/VMGmRz8wPJJmGsWiafqqwBtsbaW9Ymlq7LEbQgGGdGXcWr+E7zxJNXsZeXFBCnEh4hZ7h5YyNZ3aTN+zObTEi3B8XDQ43bcKYI3Npjm7ZLjyDGjW39qyO6gVH3Abo7jiyJxJhkWSTqHbprS+BAWXa1CgobRPi47O+YV8Kr2QoLMgEVIttmnU7w/KcTdlUnSD1VpR8pgw+3bBkhMddjIvaerWrNt2UICgMZ3ciQbyRO4Q6+7Isazs1d1kyuZk46+ddS7AhnLoHwS32XNb4DyeZ7pNJNlDDpJ/hKv8mvp3gnShJm1LrnqiVoJgmSupPbG4S6fu3njEMOEUaD0ZiQCHXSkvynk7dnUzUkhIubxY1wsUBG80a3U6M37IF1AFPRJeXMt5rcO6h95R7kfPQUnd0fDAtW0zjoOG/UNgQeZv5EMmjPqlQaBFpUFlcnYKcl8dF1M53imA5hQMa+XCj8pWHAW8WRdSLgHFXo67Tcj/t3J6GjLyh8+f220Jx32Ic7VvXOjceTDkkH4KRGg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(396003)(376002)(346002)(136003)(39860400002)(451199018)(122000001)(38100700002)(66446008)(64756008)(86362001)(33656002)(7696005)(52536014)(55016003)(2906002)(4326008)(5660300002)(66556008)(66946007)(66476007)(8936002)(8676002)(41300700001)(110136005)(6506007)(9686003)(186003)(26005)(76116006)(53546011)(83380400001)(316002)(54906003)(966005)(71200400001)(478600001)(38070700005)(66899018)(81973001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?A59Te/fWPk3wdACM0QiJucZyDNdGx+JeXDbiGBHPzBkzfEgYHTEVAB+vFYWv?=
 =?us-ascii?Q?fBUgu+o+shgo1NpGzRkmQfACPJvfuP+GqI4ExhfpGLflWezINLQEmQpm15Pf?=
 =?us-ascii?Q?KFe6RW075eWwYIu7IpvwqekiHnMtCgU1GbAGcb8Nht1WaPnYi2kVdeq4tuaB?=
 =?us-ascii?Q?3zr3s2rMkPmpt68Phj2NK+K60/dk2o+bLSdgC00QQi8vLzYAzKtrc5Hv+yoZ?=
 =?us-ascii?Q?65DnPZ8Nc66Jz7rZJYKfhwi98OC3opfNcjHTYwauV1H1HDVPNpUv85m9/fiD?=
 =?us-ascii?Q?W4B9BeC16xeBNAPJAJczgnc2MEDn/fDERR9QdN1Qk/t9s6wZs8MhiFeBdywH?=
 =?us-ascii?Q?FbIC/o9iPVaEy+SGJ1zYmKsqaz2umcGO5DAw2HqBRdqFkU0NTsnpndpP3wAh?=
 =?us-ascii?Q?lRHMFip8tGljfj66Z0jcULtDuMdwL160elc9uIqs7SSRjs7qq/I/PX1CUNC7?=
 =?us-ascii?Q?6uGstdS8/TrESGgDBlFPcxuxerW9D6nPoegt+XDE5CsB99s2QRKr60Gax35y?=
 =?us-ascii?Q?csOZQ8I2iTUhFmKSG0T/AO+blSo5NNa4uK0LLRxCrLzn+vr8bULhFYAcnpMO?=
 =?us-ascii?Q?E3EwoSZDJKCXF5vDOwa3dBBbYNyUybSaHnfxXWjtMx63QP16EwaUq+IL4/3q?=
 =?us-ascii?Q?tRXufwYfB06CD8cvd6ILTqXOi2Gj8fUp86jn27I6fFe6xt0BjbfIMzAowt2b?=
 =?us-ascii?Q?A8VFBKyxRZ9/H/cy/odhiUtPILBHEvMOqcAkUgAGi/rxD31EUAuVrBYKyzDU?=
 =?us-ascii?Q?H6y5Kqgc+RyMM7KmGUUW38nzEzjat2BjxNogHlEhK2oiDPSKVlFs5aDdPh05?=
 =?us-ascii?Q?6y6+sgdCtDUaqFD9V81n/ju4L0kg3cFf6VX/6bRP6DqsSik+AmDjX8TuqjiJ?=
 =?us-ascii?Q?U10+SRvbVflpKMj5mNPpTk/ut8CeKVd/D2phqjLwBrZ/V9MvDhLfotPN6stT?=
 =?us-ascii?Q?7VLrn37cjZVJ7kdr6KYjVX1ZSByU3L+K6ec13vQYRgUr/SNs8EbRpZHG8yEF?=
 =?us-ascii?Q?yvp7AUTMQOmjNrFYDolpe0Y0ACom6NHUfEpS7cra5jSgKMZ7oOantYJ8ZwyL?=
 =?us-ascii?Q?jMUxwg+jHVbELgjuvSkRIa/zSETAgErZR2VfysVPsgnWE35542H2AOhxJcKk?=
 =?us-ascii?Q?sUEFNIWzxvTGL0p4/WZQXtHp8dVubXnQPg7/ZgpwR9iAQq5NHlJmjwAcB3Us?=
 =?us-ascii?Q?vLQFWNzTbqzpbEpYbjT98Cz8opF6EzM44mND/4HIs+T2SYuS1bu+BbwyAzPH?=
 =?us-ascii?Q?WphPptfaLJV9goKKDErQkxZYowGsLN9toRV1azxnDMXNxFquwPUIiPF9zW0U?=
 =?us-ascii?Q?PiFkuROlzSD62ppV2E5dbWnL5Wg1b1mwjyr+oLypoFfuMAsRhCzf1H/kcLoL?=
 =?us-ascii?Q?db/ohfGPkfFawrKFC9oPa4+wZ6cTUUje9zRouqejAtnxgNZdbPeZwbPkpg8/?=
 =?us-ascii?Q?FuS+7pSwo15pBj/9oOmh66p7xp5YSfonJyQsFrx7k5YkoPt4tp24Ygj2UZOA?=
 =?us-ascii?Q?gUk6bM/8gSocCFWwY1Xrw8K+OWALEtX6L4TFnD/FULuR49WuaCfKAJS2ETWe?=
 =?us-ascii?Q?CByRXQ7vX8+FpVpKkXPbRXlrrosFFxqv0YY8NK7z?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: pLIsHXHCGQjSRBURT+nX3Ih0SqhBlyjmrA3v2d+X7d3F75LFVSdL2UDHqkf5vqGC03NkyTjFr9RQd05Rn1i3H1HeN7PWIlvbXQhzX7hvZUIa8sv3nCgcpeix/LXPXdiPqBN96Tflg8VCUxtibz3nvwxD4A+EhQcU6KP4VqeSP7ma+ZBfxUAhna+QmevWMpncHg5+QFyG6IRumvW+fs1Qyu0fxn0FwhAZcs4jtzF/DMcz+2TRqaJjTG0SkQ5cDjkeE3wbVUzeBQqkMWGeHtq+h4zigukLftn/p3MbWYPYaUeCpAajqYE9Bt3iaypAKRbWDVX+N7FSn6eAkvowyPjNhqZWwXxMr9Ebou4kKAhX82qnyqvvrUordaKG+nu1gmWkeqYT4vOaUcK3lb7ah+X8CgxrfrNHZRIld0EWgORfDLlGP2oHqtrwkwiBJwxjQlhkdM+MfSK3awNo9O9tF8JJCm0WX5abxY7Nr6DLy9gRwwmofOVWpv9kczgksxsrs2cbVDazPgBiFoP2sFLheg8Wqjcn6guXHWX7AARyzyxvy9FMQZRzeQDdla9brV+xDn2oo8m9cHr9zllIe6uokCC2h5Fcf+AhHtEfEbGrbC8XcUMgKbag8SC4H0ZkElys5vQldD3ILJCB+btVE8ysidydJCvq+n3dCCtTsxIzdxA8s+n6CrIUGFILcAsvDpgL13nnjzotJEvB82JBIL8ETTx4CwcQJw+s0QUZed/dcfV9zdP4+hY1/8KxSNbKsMQzpolfEzptk92AI7PtfQ5shjz/q6fgK6dXBWjHyZNMqWkmwP6jF8NFl1FLZkNdFUzGn1bD
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ba77ee0-0149-40e9-f480-08db1aa59796
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2023 22:37:51.8079 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7acwO6gi5idTcUe7FI7SO5+k49nHA7zkJuxad8wbbZ2PshsXggp51ck8Q6DVgDoUHbXCZd3hNcg3Q3FBpEWuvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR02MB7497
X-Proofpoint-ORIG-GUID: EfI2rT-Ivr13bHzovueP-hpsmXE5Wfsy
X-Proofpoint-GUID: EfI2rT-Ivr13bHzovueP-hpsmXE5Wfsy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-01_15,2023-03-01_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0
 spamscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0 mlxscore=0
 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303010180
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
> From: Anton Johansson <anjo@rev.ng>
> Sent: Wednesday, March 1, 2023 7:22 AM
> To: qemu-devel@nongnu.org
> Cc: ale@rev.ng; richard.henderson@linaro.org; Taylor Simpson
> <tsimpson@quicinc.com>
> Subject: [PATCH] tcg: `reachable_code_pass()` remove empty else-branch
>=20
> This patch extends reachable_code_pass() to also deal with empty else-
> branches of the form
>=20
>   br $L0
>   set_label $L1
>   set_label $L0
>=20
> converting them to
>=20
>   set_label $L1
>=20
> when $L0 is only referenced by the br op.  This type of empty-else branch=
 will
> be emitted by idef-parser in the Hexagon frontend once CANCEL statements
> have been ignored.
>=20
> Signed-off-by: Anton Johansson <anjo@rev.ng>
> ---
>  tcg/tcg.c | 41 ++++++++++++++++++++++++++++++-----------
>  1 file changed, 30 insertions(+), 11 deletions(-)
>=20
> diff --git a/tcg/tcg.c b/tcg/tcg.c
> index a4a3da6804..531bc74231 100644
> --- a/tcg/tcg.c
> +++ b/tcg/tcg.c
> @@ -2664,21 +2664,40 @@ static void reachable_code_pass(TCGContext *s)
>                  dead =3D false;
>                  remove =3D false;
>=20
> -                /*
> -                 * Optimization can fold conditional branches to uncondi=
tional.
> -                 * If we find a label with one reference which is preced=
ed by
> -                 * an unconditional branch to it, remove both.  This nee=
ded to
> -                 * wait until the dead code in between them was removed.
> -                 */
> -                if (label->refs =3D=3D 1) {
> -                    TCGOp *op_prev =3D QTAILQ_PREV(op, link);

Can't we just insert a while loop here to move op_prev back across labels?

    while (op_next->opc =3D=3D INDEX_op_set_label) {
        op_prev =3D QTAILQ_PREV(op, op_prev);
    }

> -                    if (op_prev->opc =3D=3D INDEX_op_br &&
> -                        label =3D=3D arg_label(op_prev->args[0])) {

Also, here is the patch that exposes the need for this optimization
https://lists.gnu.org/archive/html/qemu-devel/2023-01/msg07236.html

Thanks,
Taylor


