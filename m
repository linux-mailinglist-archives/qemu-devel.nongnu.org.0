Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 582BF653397
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 16:44:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p81FS-0002lK-DN; Wed, 21 Dec 2022 10:43:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1p81FQ-0002k8-Dm
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 10:43:12 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1p81FO-0002Ru-H9
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 10:43:12 -0500
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BLCoCZS024465; Wed, 21 Dec 2022 15:43:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=a/nmrJdOvh3H18YOwZGWceIwhMnFrDhDLbkBAuJxT2g=;
 b=QyhyX4F9o87PZOwSU3a4olM805072p1LVFqx+thGJHHrP9XLe9FsD9zRQgQ6jtEplnZ4
 JcDINX7HFbqOvLRNlLxOjApsW6q7izW3YpT+zA45zCLROnyvLBevgVmo0/KZ5CMr71+n
 EnAo5hk/2txsH2KyGVruHv2i5LEcjKMQnri+eZnTV9zEQGEan5yBUgTcCu1QwKmnQjFG
 pmObrilIvkpTKXMaJjAEkDSAjw3TX50wd4t07Hn8UKLki6Ve3m+cFGjaOjPhaCvYI5ym
 EUo6yGaCogdyyG8t+FRK16BRCAdAjmRVhRpc4jsg+O03giF/y9fslYnAMAM3U4lgsM5O UA== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mm2brrcd0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Dec 2022 15:43:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nGXN3OxvsUvhhn/VzgnS7/7/Rh2iP9tgiwOQaklHoGb7MAH9VxhslXXMHPqNUx6NL4750Ce5b51t65SEbE7qXD+28fgb0j64OSK8oXIMRlP+K8kYo9TK53BmQmyohyIo6DMebRVGwmYnp9aKxPuF/t9/jgWCmixRdyzcV0/feiNxQnbzOondZXE6XO9ssyYhjy2ipotqYyRyiZgzDs/4PjyrRRG38GCw9q3MrUXTUU+oqpL/sYvJcgE5at5dvGUbIocdKyCUBXHjd3LqTyGXVq7s1ZLQ10c3SDkUPLp+IaWZ2gy1/GWCTZlqcRBLhqtDUQFHSiq2gRSjM1aU159dug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a/nmrJdOvh3H18YOwZGWceIwhMnFrDhDLbkBAuJxT2g=;
 b=jvMJaEWFNAOjGqdXilFvcj0zublMrR6GqcN2I+1+wIHBRLy6Eb3z9cTmIAsihOio2aN3vn3dkM2Unn81PqPp/NFOMs5iBTg/MbIs5GsbHqz9lq5sieq+pGvWwXzvzw2mwXKoJOwAMz0gsy7aKbRB7wAlmkk8IRWyw5wGENwZpLsLAxkEglOJh+oT35ZNO4an6xvrC/jR0cbO0Y4R2i0F+HD7IghCddBdxypOfUOPI0vHqQQnMsuo1YSYTIzzzEIFMprwBR9S987EqHde9l8cjEvOaeiMFwtQ+zB5aDZMdEnSU9LU8PrGC5NMYbdKdo1za2AfetPAt+GV6jgZT8qWhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by MN2PR02MB7024.namprd02.prod.outlook.com
 (2603:10b6:208:205::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Wed, 21 Dec
 2022 15:43:04 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::8ba2:2429:9eea:75fc]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::8ba2:2429:9eea:75fc%9]) with mapi id 15.20.5924.016; Wed, 21 Dec 2022
 15:43:04 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Alessandro Di Federico <ale@rev.ng>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: =?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>, Anton
 Johansson <anjo@rev.ng>
Subject: RE: [PATCH] target/hexagon: suppress unused variable warning
Thread-Topic: [PATCH] target/hexagon: suppress unused variable warning
Thread-Index: AQHZFSN4LpROcfCk6UKjNNCtmnvMf654epzw
Date: Wed, 21 Dec 2022 15:43:02 +0000
Message-ID: <SN4PR0201MB880819591F8CC1584B462814DEEB9@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20221221100254.1352686-1-ale@rev.ng>
In-Reply-To: <20221221100254.1352686-1-ale@rev.ng>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|MN2PR02MB7024:EE_
x-ms-office365-filtering-correlation-id: a3ea117b-5108-465f-a718-08dae36a0ca1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SCU63q9C+doU99/dp+87jfmpaQxRNWbPpJzI5zk2QiTUG3nkxlFldyRMeqV7Pjvs+ZLM4qubs3oP44JsetO144C1kT7yeBqH3fNNXSaJyDE4nFIVwzidGawC0FVisdlFRm8cdPjn+AE9E6GmUGEvGavEf4LouAHQAU20It4Az8qmZnuNtOS01CNgCumL19laVDqi8AsGAyGOKlWvJf+d9HbJLeM62vPelqdpUJP9WMHpTlo0EY/bZktv80No/AT9QwvMxfSCbes5q3QVtmVT2XjT8oERULAvKIpVH2S7yk+Nhi+wTov+681SRvp1aRsd/n92NRbgySgUE3MvUlGzfByguKH+E2D+TVS+ViLANuz0kBGMfZYp+XS/4Ihppoyyotn7aTDYI2KZWvmyoP6fzVDj/ZJERdAbqGreT5vkrMaN8zEr5rgsAABlrr6JnkdbK/ZHL0KZwWNCBn1x71PKAMJg/zC1DcQ+iTT4lq+or1VLdnaEjup5PHSlw1VJVvG6FIx8GY6XPS+qI8ysh6tKAgIk/kTbRCu1a12KiERaD4bVxXtTzCnXrnjmOihwQ3ni/eUsJxyew0Q87fNcrh2j/YMT/EaG/fpJXK5uJKtZofZOHuq5S2Fk4dN5pYvltM2rneRMIw1g1ftXeYUWFC3Udw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(136003)(39860400002)(346002)(366004)(376002)(451199015)(478600001)(83380400001)(33656002)(122000001)(66946007)(8676002)(2906002)(52536014)(66556008)(64756008)(4326008)(5660300002)(76116006)(86362001)(66476007)(66446008)(8936002)(6506007)(55016003)(110136005)(7696005)(41300700001)(26005)(9686003)(53546011)(186003)(316002)(38100700002)(71200400001)(966005)(54906003)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?S7prUle8m0r2YIqYjEVfhgn9z2/wqBFbaVPWWe1uvdQdGs2JrxTzYKXMwY?=
 =?iso-8859-1?Q?GskrNk6LQc1p22gH/kFUnKRTpGTIbbardVvVEkNvSLB0wOqL/AfyjUwmKn?=
 =?iso-8859-1?Q?eYKSpHa1FKWsV/UC21bNm5Icogxhc8xtV5eed7nMkzbnf86ytF3iAXJ9vI?=
 =?iso-8859-1?Q?TtBmo3XBUsB5a/njqckV5oX0pkrTkcbs3MhGN6PeHe3aDA+W47wqGExGym?=
 =?iso-8859-1?Q?a2nKXA4YrCz3Cj4GV/mDLpebu7iU0nokW1hI7OEl0jpSWEpThy5C1rK/5p?=
 =?iso-8859-1?Q?GJODYN3O4JD/YwTc69Cu9UFFvzQ6FuPDgLpKGMwvaDiNUGEB4F/kPiO8Pm?=
 =?iso-8859-1?Q?8/MdLfgmQ/kgK/08TTNMjl2olwCDfhEDgjF8T5PFoqU3hEquf6mbhfqYWu?=
 =?iso-8859-1?Q?sIwIxqx+2ZrHU8MFiiIwNhWAoLZfyT8k2X7Z1YiGG5G56YAdvkUR0W2+fB?=
 =?iso-8859-1?Q?vJHDZbirFSyO/8ymmHEy/x3muTdObai3b1q37aqPv/mJXRchtFwPKG181F?=
 =?iso-8859-1?Q?ZJAvzsLM3WkISbhyz5MM3Ty7pAj439KjmMWierVpwuuaQcygqZYLtlznOp?=
 =?iso-8859-1?Q?DI7SJEolOivJGcVVx8bVnr7VmmXFKlXk5UhJ6H4ZZIX+LiRbj3NesVtXy1?=
 =?iso-8859-1?Q?ht8S5RLNsF5qC0XAfvvxVnjMko2U/+qDBkggOGgVX1mrwGgpamq2U8higZ?=
 =?iso-8859-1?Q?KKtPS/taYzdiExps7OYbwCGck2iXppcI/P6DvDMCJSARlUm7r9qqPHY8Rd?=
 =?iso-8859-1?Q?iWnpwfK6EuGxU/ExeMl4b6xpwzPYgwumkUPKXszUt3dbZKpdtKDeegq9nV?=
 =?iso-8859-1?Q?sXvtYfPeFUCbLDy5IINzmn6tg5KmG3gRy2MnUG0tI76AkEgyP1dUajx/TA?=
 =?iso-8859-1?Q?zSZPkDVz9uokBaizUp79oijb479xMgOl6GPATM6DUCVQIGNaF9CLZDQM13?=
 =?iso-8859-1?Q?duwoTaa0Nkuq5VmCorgkz8jbEXbMsHt/OwYJq6tbbbgjg/mmhhzzndMQ1U?=
 =?iso-8859-1?Q?FpI0LiqgqpmwmO3d+1oYVX8nOI4C3ZKJqPXk32RKKXQhHP+FgL7SOHWtv6?=
 =?iso-8859-1?Q?wWBpH1u2h9FhLJmfHClbdU0FDkBw9Woezx7CHrUuIWc6G/LvDDVuGj5l+E?=
 =?iso-8859-1?Q?c8kW1+hA2Bf499oVRI7cp9KUs9J2aieYey62WHxvrtuCKcy0hOnE3QIEOU?=
 =?iso-8859-1?Q?4xKRmJE+Z6gkmV5ya7yCIBRDxtMq/G7UyVxRFO5Ya09oCIkdkLat3uqZQg?=
 =?iso-8859-1?Q?px3qJ8KXQgdOyrmx9yIPcGwYXVNUGz78n643ezYm+ASL5sU7vikargnfYM?=
 =?iso-8859-1?Q?ZZI3nrk0eOdoTjMvSXa8Ltw6jW1uvmxBfarN2B/hTDMmvvhsA7xMrWkzmM?=
 =?iso-8859-1?Q?8zuKioVMdL+JUKWEiPj6U984BtYSyFKDgZwZtFvGv8PhDP1y8L8xtQH8TF?=
 =?iso-8859-1?Q?n8AePMlP9PsjIGSjjIxCxsVBgXS0kUAdrgGKe1sXPVcXJiGSmiN5b5OpB8?=
 =?iso-8859-1?Q?aENmERAP6k+xaz4roEiimFdXyJQzneN67yO/2PmAnT0JRcJZkbITBgqm6w?=
 =?iso-8859-1?Q?tkIjpxJhKInj6hI5qVn5gY/oLGv7OlQWEVG3HJVeV8Fnypob1ktxvtfl2l?=
 =?iso-8859-1?Q?qU5k4xIyXPO6DS/xdoJOjwEmq8P4+KyFE7?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3ea117b-5108-465f-a718-08dae36a0ca1
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Dec 2022 15:43:04.3837 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zf1V1TVz5V+4B6KAwdiGZYqauyOjcOZunVkU8AqkMSWPcxHuVGl/kAYN5k6zwNI+PR2FZMNWJHsIwZeBp9FoPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB7024
X-Proofpoint-ORIG-GUID: FtJrWL3GLA8RkarvMzaOS6OMEyvscBj6
X-Proofpoint-GUID: FtJrWL3GLA8RkarvMzaOS6OMEyvscBj6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-21_08,2022-12-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=904 adultscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212210131
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
> From: Alessandro Di Federico <ale@rev.ng>
> Sent: Wednesday, December 21, 2022 4:03 AM
> To: qemu-devel@nongnu.org
> Cc: Philippe Mathieu-Daud=E9 <philmd@linaro.org>; Taylor Simpson
> <tsimpson@quicinc.com>; Anton Johansson <anjo@rev.ng>; Alessandro Di
> Federico <ale@rev.ng>
> Subject: [PATCH] target/hexagon: suppress unused variable warning
>=20
> This patch manually suppresses a warning for an unused variable
> (yynerrs) emitted by bison.
>=20
> This warning has been triggered for the first time by clang 15.
>=20
> This patch also disables `-Wextra`, which is not usually adopted in QEMU.
> However, clang 15 triggers the warning fixed in this patch even in absenc=
e of
> `-Wextra`.
>=20
> Signed-off-by: Alessandro Di Federico <ale@rev.ng>
> ---
>  target/hexagon/idef-parser/idef-parser.y | 2 ++
>  target/hexagon/meson.build               | 1 -
>  2 files changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/target/hexagon/idef-parser/idef-parser.y b/target/hexagon/id=
ef-
> parser/idef-parser.y
> index 8be44a0ad17..de61f48a628 100644
> --- a/target/hexagon/idef-parser/idef-parser.y
> +++ b/target/hexagon/idef-parser/idef-parser.y
> @@ -99,6 +99,8 @@
>  /* Input file containing the description of each hexagon instruction */ =
 input :
> instructions
>        {
> +          // Suppress warning about unused yynerrs
> +          (void) yynerrs;
>            YYACCEPT;
>        }
>        ;

According to this page
https://qemu-project.gitlab.io/qemu/devel/style.html#comment-style
we should avoid // comments, and the checkpatch script will warn about this=
.  However, checkpatch does not warn on this patch.

Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
Tested-by: Taylor Simpson <tsimpson@quicinc.com>


