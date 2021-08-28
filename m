Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D35D13FA6A8
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Aug 2021 18:05:43 +0200 (CEST)
Received: from localhost ([::1]:34840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mK0pw-0006wQ-OE
	for lists+qemu-devel@lfdr.de; Sat, 28 Aug 2021 12:05:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=8874121c5c=pdel@fb.com>)
 id 1mK0ku-0003Eh-5j; Sat, 28 Aug 2021 12:00:32 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:50966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=8874121c5c=pdel@fb.com>)
 id 1mK0kq-0001pv-Qj; Sat, 28 Aug 2021 12:00:27 -0400
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17SFrmkn009049; Sat, 28 Aug 2021 09:00:16 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 mime-version; s=facebook; bh=aJa3M/1qsq58gJkJlSHRagG/1ikQeyRmFERxoUTQ1wE=;
 b=cEsWwsoGBnY+1PS85j/MgpWBM637pNMozS+4oM2JuC6kaqmEaYJ6RSFo6wyVdEgYk5XL
 9wcwEujauYi6Vbqy/LTXn5nmxSz8OofVnxPpF2lI7PhWGPZjVfShmdDJE2iNfHXNWtS7
 Kp1hMAihNNp0qul46t3xt9+UsRB7s23WlsM= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 3aqjp11cnt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Sat, 28 Aug 2021 09:00:15 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.101) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Sat, 28 Aug 2021 09:00:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FXvHiJtAR/18Q0+/vRiuOlnGSfxKNCcQuPYA8DJMMt7JHzFjZEs6Ehamq9uHBX8xbKh2Jb4/tEHA9R09BGNRWpgcVZMJ1nVVxG0qI3xXksBGv5En15AjIFh16e9WOnrhNpdICZskEzREUcv02rPZU4tci4iLPxeku1OlBZp5wnueRHQdaivZv4ilQcqYtySx3Cv9IJ54fp4p0NbBODzs+fpvH3QCyxc6EtINYfFLEznBjKhtvkHfNktWMoQn13Nycqp3jOK11/ldi/eR42zcbadzb1cMP33/77hEyLQN2refhd65944IGAFBvRbX/1U6pTfR+B/qlSDUvfwK/i3ESw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aJa3M/1qsq58gJkJlSHRagG/1ikQeyRmFERxoUTQ1wE=;
 b=JBrtDkUkInh9A6e4hhIV8lu5m2fc5kjT2z1bxbB2tF51RkppT0Tv1t+XpdhyBSuAQ+1qT9bY0+wl3vsGgTSfEP62O9N4/zAlR4kVJffFs7PaKK3XOt8vi7TGavxZ6hoPresag5LBIbM7XVYU4XggbuBO9qZFBzZvYq6EneUHCWfs/OMIteFpGtCH6Ac2iE5zkRSbhC/Uo63BiWVQ3QynqL4CQb5NLNdbZ3tuZM8eZaHG3AQd8SmivDL3T1uQ885knWLGzWlr8pCXJiHBHJDaK6deUC4THg8yvRzc8ARLjagl7giAjK6TMKcjZ+r8c5xfpQ9PWaDP6IZ0Vm/AwWANaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BYAPR15MB3032.namprd15.prod.outlook.com (2603:10b6:a03:ff::11)
 by BYAPR15MB2214.namprd15.prod.outlook.com (2603:10b6:a02:8d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Sat, 28 Aug
 2021 16:00:14 +0000
Received: from BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::39cf:cf4c:885c:9368]) by BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::39cf:cf4c:885c:9368%7]) with mapi id 15.20.4436.024; Sat, 28 Aug 2021
 16:00:14 +0000
From: Peter Delevoryas <pdel@fb.com>
To: =?iso-8859-1?Q?C=E9dric_Le_Goater?= <clg@kaod.org>
CC: "joel@jms.id.au" <joel@jms.id.au>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Subject: Re: [PATCH 3/5] hw/arm/aspeed: Add fuji machine type
Thread-Topic: [PATCH 3/5] hw/arm/aspeed: Add fuji machine type
Thread-Index: AQHXm4djy02Xdrkh9Eqde0Cl/c+kM6uIll4AgAB97U4=
Date: Sat, 28 Aug 2021 16:00:14 +0000
Message-ID: <BYAPR15MB3032502C1B7CE0F8E8431C73ACC99@BYAPR15MB3032.namprd15.prod.outlook.com>
References: <20210827210417.4022054-1-pdel@fb.com>
 <20210827210417.4022054-4-pdel@fb.com>
 <5278af17-e56a-772a-21fe-8594790427d3@kaod.org>
In-Reply-To: <5278af17-e56a-772a-21fe-8594790427d3@kaod.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kaod.org; dkim=none (message not signed)
 header.d=none;kaod.org; dmarc=none action=none header.from=fb.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 46ce697d-4088-4e31-5e25-08d96a3cec2e
x-ms-traffictypediagnostic: BYAPR15MB2214:
x-microsoft-antispam-prvs: <BYAPR15MB2214FC211D2CC5A8042696DBACC99@BYAPR15MB2214.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HuGP/dYFg1T+LEdL/PHhxmCoLkRaVZkKxsUJc9ajzqbBiSncfFf9VpkcFvrWiMZjYy0U4obp905ZGKzp2u7AiWJm6m8Jovg5uLnwNoTJSFCwOFr+G1hwHM1ac4gx4LYkOG8S8dx3ui+9Fm0Ehwfap/DH+k6mXZf6GKHVGBYvC3hMyIhkmJUfKxSBbQLw3O3Ts37AeipesxkPMOYIRJ8VWaghbRfxoIfTSO3aK+I5Pb6T5Oi5FzFSV8QGvknb98td1MQ3MUr/DSH9kXJdQaG+Fg4sG2BGaN+rLzXP7YDzS+0n/RvN9Z9V/GENf2BGx2h33K3JfD+USzyxvDEfuMMy/gYqmq5KimxuWJrFKU/LSkQLvaHK0QJenPEMT/8L228Je9itSgsIRz2QrVviXeo7kPjk4t4bPafaevjtv2+s77VO02SonliKumei6uAmVVPDEKjgh/9uDEpC/v2jmHcxmBoqIR3pAd1zfkfosn39XlppqUlin0rNwIi067fzIc7jMYfojLkbND4X6A5rNVUkvp+5clcwiCuJJpF57a4Gvzju9g31/P2UVvLH6kfScyhni+kvzpTDhXA113cmig8zlIB+d01sRk82c96EXwVe15Fa+lrRRNQcvhOYBlOQk1a8GtIDb+kjROUXq99FXaiINaJ/XbdDgdMyC4AKnoA2hX0Qm9NFNi7/ngQMnxiWtcm9hCx1/MggXcr+igdv3UjWCrH8IEZCjoenzVA79kiqopRdl0V0Kq2GklEI4w7L9H37tK0r0uNDj0a214ncliQMSyGcc4SXd/UV2QrENQmOC2Q=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB3032.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(55016002)(76116006)(71200400001)(4326008)(66556008)(52536014)(38070700005)(508600001)(7696005)(8936002)(86362001)(64756008)(66476007)(66446008)(33656002)(9686003)(2906002)(5660300002)(38100700002)(316002)(122000001)(6916009)(53546011)(186003)(8676002)(66946007)(54906003)(966005)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?tVjrl6i2paOUWGpPqHuSwoC1TU98ba3vyjYN19jv8ZcvC4C37PmUhTAWK3?=
 =?iso-8859-1?Q?I3W9OcE2N30ZJtJsa77YQ4DruzQ/1dfCU3OKjCMLr/Prv4As4mQ10LipE3?=
 =?iso-8859-1?Q?Ygfrwim1hzZequ0Cz0KRn5nLRy2dJV/yqLnwvSmdxXs/UOAxZVr/FNAOoO?=
 =?iso-8859-1?Q?bvj548d0ozz5KVNpRGBb82oC9nPahiZf5ZGExH4E2hlMktQ+z2a7i58iJF?=
 =?iso-8859-1?Q?NAg6/L7l9BaFA0xQ0E4bhXBhS0+oz7oFBlKqp68aHDK/Bz4dd5y4LVqBu8?=
 =?iso-8859-1?Q?eu+jGpGxdcQSr8+eakCJzzTzFtDXQnxrKqP99IHrIrsaIP2A09eXqKdoox?=
 =?iso-8859-1?Q?dh2Vn9qckTJ+XiWKKUflUunA7EKJUawgMUgaD4mmzOU6XNREtI+/SEySI5?=
 =?iso-8859-1?Q?OdiVkqMB9Yf4ZE0lHiwPpWlFa6xZrQVIm8mx/fcODalVgR4wtfCNzlQ+m5?=
 =?iso-8859-1?Q?+YtUtlqmVrG1O67Vx8pfdS0esjH+KaIhVUO07JxdqC8VyfgxJvI2VvrZQc?=
 =?iso-8859-1?Q?66ahMc11cYsWMI5T7rlaws9kmwgcMWfELy2RTq0Z8wr15q9QYnVHcP0HUz?=
 =?iso-8859-1?Q?Al52k8FIranHrQAnQDhAN9FnQ30IJJAfaufbMQMxB3VbW4j+lDWMcA5f52?=
 =?iso-8859-1?Q?iCMlyyTXRTlqiR9C/KEPCzjEEb6eWRwsflFU9p5SZWQVYlcvlcqeKAsahY?=
 =?iso-8859-1?Q?mNqPfX11xaRggieO2zGwV2yhnJkwrZylVFzXqAzuWVUnARcQGLwleUUOw5?=
 =?iso-8859-1?Q?y1//6LsdXKBTc0vrWJJNWmr6/8lk0KdFGrVCSC1xjPFx3P8ZZ9pMBXdQAn?=
 =?iso-8859-1?Q?IMlwBMjmUay1UNWz4+3pSXvLrZcfzJ3GMPv44vTTaabqidwkXCrXpDFv/4?=
 =?iso-8859-1?Q?8EUbubYNFaDJu6RSQfSHsHOBLBdhOqVB6x/mCS0MN/1MMBFKyLWmqsr3zp?=
 =?iso-8859-1?Q?jSG1MkusqeY1TMR57BJBI4svlNcWE6Rb7Cw3hVle5zXtweR+fKoUPxMZcK?=
 =?iso-8859-1?Q?mVArqv8hfmfYKTwAgATd2S/qStXTxjxz+GQzxLP5uhVoF/jZAwI2cQQcJM?=
 =?iso-8859-1?Q?4owBrixj8lV+OIntIDuTxURiOJrBRZa6lTXCrq6xc7XpPsIW+0bplLQkk1?=
 =?iso-8859-1?Q?FINtYoVSSUFulfUDVO22l2mrvOgI8P8iwprJiFwjQ+j2LInyCGQHY/CM7J?=
 =?iso-8859-1?Q?0RGBhFX630Kp2bk6A4XuSTHmGuZeONRCEAisil0kw87YJ9lt//BzsX5cvv?=
 =?iso-8859-1?Q?8CHXHdXmp6Xao1PaIThY5yuRfw8U8VdkOPC/EgTfWfmyFrhKf++yFRCfJC?=
 =?iso-8859-1?Q?iWaNfMG1XVJ234rTAk+0qYhVf7xZpj4AGFlyk1o1fOGtRfi1F0+U/BsoPS?=
 =?iso-8859-1?Q?4yjl0/JS9toRGF2f9th9Er4IHeiyPScXzzWsmaPSG2D0DotwDKoOE=3D?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_BYAPR15MB3032502C1B7CE0F8E8431C73ACC99BYAPR15MB3032namp_"
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB3032.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46ce697d-4088-4e31-5e25-08d96a3cec2e
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2021 16:00:14.0790 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t42ohJI7Iszfv8V3av73atWSi8DY64LQS6HYN7il/Ow6/Hrvs7b7jUrBUmiRjs3x
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2214
X-OriginatorOrg: fb.com
X-Proofpoint-GUID: Ygk_es8dqdgTWVGxQiLPrxO_hDU94qVo
X-Proofpoint-ORIG-GUID: Ygk_es8dqdgTWVGxQiLPrxO_hDU94qVo
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-28_04:2021-08-27,
 2021-08-28 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 phishscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 mlxscore=0 bulkscore=0
 lowpriorityscore=0 mlxlogscore=999 suspectscore=0 clxscore=1015
 spamscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108280103
X-FB-Internal: deliver
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=8874121c5c=pdel@fb.com; helo=mx0b-00082601.pphosted.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_BYAPR15MB3032502C1B7CE0F8E8431C73ACC99BYAPR15MB3032namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Actually yes! I should have included a link to it: https://github.com/faceb=
ook/openbmc-uboot/blob/openbmc/helium/v2019.04/arch/arm/dts/aspeed-bmc-face=
book-fuji.dts

From: C=E9dric Le Goater <clg@kaod.org>
Date: Saturday, August 28, 2021 at 1:28 AM
To: Peter Delevoryas <pdel@fb.com>
Cc: joel@jms.id.au <joel@jms.id.au>, qemu-devel@nongnu.org <qemu-devel@nong=
nu.org>, qemu-arm@nongnu.org <qemu-arm@nongnu.org>
Subject: Re: [PATCH 3/5] hw/arm/aspeed: Add fuji machine type
On 8/27/21 11:04 PM, pdel@fb.com wrote:
> From: Peter Delevoryas <pdel@fb.com>
>
> Fuji uses the AST2600, so it's very similar to `ast2600-evb`, but it has
> a few slight differences, such as using UART1 for the serial console.

Do we have a public DTS for this board ?

Thanks,

C.

>
> Signed-off-by: Peter Delevoryas <pdel@fb.com>
> ---
>  hw/arm/aspeed.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index ff53d12395..d2eb516a1d 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -1029,6 +1029,15 @@ static void aspeed_machine_rainier_class_init(Obje=
ctClass *oc, void *data)
>          aspeed_soc_num_cpus(amc->soc_name);
>  };
>
> +static void aspeed_machine_fuji_class_init(ObjectClass *oc, void *data)
> +{
> +    MachineClass *mc =3D MACHINE_CLASS(oc);
> +    AspeedMachineClass *amc =3D ASPEED_MACHINE_CLASS(oc);
> +
> +    mc->desc =3D "Facebook Fuji BMC (Aspeed AST2600, Cortex-A7)";
> +    amc->serial_dev =3D ASPEED_DEV_UART1;
> +}
> +
>  static const TypeInfo aspeed_machine_types[] =3D {
>      {
>          .name          =3D MACHINE_TYPE_NAME("palmetto-bmc"),
> @@ -1078,6 +1087,10 @@ static const TypeInfo aspeed_machine_types[] =3D {
>          .name          =3D MACHINE_TYPE_NAME("rainier-bmc"),
>          .parent        =3D TYPE_ASPEED_MACHINE,
>          .class_init    =3D aspeed_machine_rainier_class_init,
> +    }, {
> +        .name          =3D MACHINE_TYPE_NAME("fuji"),
> +        .parent        =3D MACHINE_TYPE_NAME("ast2600-evb"),
> +        .class_init    =3D aspeed_machine_fuji_class_init,
>      }, {
>          .name          =3D TYPE_ASPEED_MACHINE,
>          .parent        =3D TYPE_MACHINE,
>

--_000_BYAPR15MB3032502C1B7CE0F8E8431C73ACC99BYAPR15MB3032namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Actually yes! I should have included a link to it: h=
ttps://github.com/facebook/openbmc-uboot/blob/openbmc/helium/v2019.04/arch/=
arm/dts/aspeed-bmc-facebook-fuji.dts<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><b><span style=3D"fon=
t-size:12.0pt;color:black">From:
</span></b><span style=3D"font-size:12.0pt;color:black">C=E9dric Le Goater =
&lt;clg@kaod.org&gt;<br>
<b>Date: </b>Saturday, August 28, 2021 at 1:28 AM<br>
<b>To: </b>Peter Delevoryas &lt;pdel@fb.com&gt;<br>
<b>Cc: </b>joel@jms.id.au &lt;joel@jms.id.au&gt;, qemu-devel@nongnu.org &lt=
;qemu-devel@nongnu.org&gt;, qemu-arm@nongnu.org &lt;qemu-arm@nongnu.org&gt;=
<br>
<b>Subject: </b>Re: [PATCH 3/5] hw/arm/aspeed: Add fuji machine type<o:p></=
o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">On 8/27/21 11:04 PM, =
pdel@fb.com wrote:<br>
&gt; From: Peter Delevoryas &lt;pdel@fb.com&gt;<br>
&gt; <br>
&gt; Fuji uses the AST2600, so it's very similar to `ast2600-evb`, but it h=
as<br>
&gt; a few slight differences, such as using UART1 for the serial console.<=
br>
<br>
Do we have a public DTS for this board ? <br>
<br>
Thanks,<br>
<br>
C.<br>
<br>
&gt; <br>
&gt; Signed-off-by: Peter Delevoryas &lt;pdel@fb.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; hw/arm/aspeed.c | 13 +++++++++++++<br>
&gt;&nbsp; 1 file changed, 13 insertions(+)<br>
&gt; <br>
&gt; diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c<br>
&gt; index ff53d12395..d2eb516a1d 100644<br>
&gt; --- a/hw/arm/aspeed.c<br>
&gt; +++ b/hw/arm/aspeed.c<br>
&gt; @@ -1029,6 +1029,15 @@ static void aspeed_machine_rainier_class_init(O=
bjectClass *oc, void *data)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; aspeed_soc_num_c=
pus(amc-&gt;soc_name);<br>
&gt;&nbsp; };<br>
&gt;&nbsp; <br>
&gt; +static void aspeed_machine_fuji_class_init(ObjectClass *oc, void *dat=
a)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp; MachineClass *mc =3D MACHINE_CLASS(oc);<br>
&gt; +&nbsp;&nbsp;&nbsp; AspeedMachineClass *amc =3D ASPEED_MACHINE_CLASS(o=
c);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; mc-&gt;desc =3D &quot;Facebook Fuji BMC (Aspeed AS=
T2600, Cortex-A7)&quot;;<br>
&gt; +&nbsp;&nbsp;&nbsp; amc-&gt;serial_dev =3D ASPEED_DEV_UART1;<br>
&gt; +}<br>
&gt; +<br>
&gt;&nbsp; static const TypeInfo aspeed_machine_types[] =3D {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .name&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D MACHINE_TYPE_NAME(&quot;pal=
metto-bmc&quot;),<br>
&gt; @@ -1078,6 +1087,10 @@ static const TypeInfo aspeed_machine_types[] =
=3D {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .name&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D MACHINE_TYPE_NAME(&quot;rai=
nier-bmc&quot;),<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .parent&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D TYPE_ASPEED_MACHINE,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .class_init&nbsp=
;&nbsp;&nbsp; =3D aspeed_machine_rainier_class_init,<br>
&gt; +&nbsp;&nbsp;&nbsp; }, {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .name&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D MACHINE_TYPE_NAME(&quot;fuji&quot;),<=
br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .parent&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; =3D MACHINE_TYPE_NAME(&quot;ast2600-evb&quot;),<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .class_init&nbsp;&nbsp;&nb=
sp; =3D aspeed_machine_fuji_class_init,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }, {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .name&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D TYPE_ASPEED_MACHINE,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .parent&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D TYPE_MACHINE,<br>
&gt; <o:p></o:p></p>
</div>
</div>
</body>
</html>

--_000_BYAPR15MB3032502C1B7CE0F8E8431C73ACC99BYAPR15MB3032namp_--

