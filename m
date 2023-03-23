Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 524AA6C7092
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 19:54:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfQ3M-0004OC-Fb; Thu, 23 Mar 2023 14:52:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pfQ3K-0004Nn-Fe
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 14:52:46 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pfQ3I-0005tD-Hz
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 14:52:46 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32N5irdT014006; Thu, 23 Mar 2023 18:52:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=vPewymJui0N1+u3pEVH56ehdhYlh+ZXHXWr1iy0YdzU=;
 b=RadNtMtirSZyQBZC8AIYWqgJXxB3UqLjtqmujevej6ecqjy+RdHLfBmp2olgUMMWtpwU
 SYZG3QLl0lBCL/fvjLZtlKunGn4B+BoHkURveJqaKOKErVS3m9tj9lq7tYHHQ+OZH2+k
 Nzzs1P78BlzXmAj70+4hKgfUeTVnvmtm9m9f+k6Vdqnwr5Vt2ZgeN5+b35JoWoDAH7Qr
 bzc8VCHOwPccX7+qs1Q8TG3vK7/t+mH8boHs9gh80amH9yCDxEem2+RDcTlWL7yZcIJ0
 414UBARfJ0vLk7H0cS7XfLU3fuwWzXKUqBf8JHz4wg6NS1vVBox1VifEdnR6imT+snvs 2w== 
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam02lp2048.outbound.protection.outlook.com [104.47.57.48])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pg42kunx7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Mar 2023 18:52:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CQfZIbh3lNJxWaevjcon6CmHuvvxRcHqM/frB7IujzguiCTrzIiPE5Fe587XGV0+ACxoVzxBiPKvV4N6OFOLoDDk0pPg5y5U1/oFR8PitdjcaQUa5IcUR5jW8PVKBAUq2PGf23w+Ku+rxahRQMT1lNo6SCbJAqqk8AQ2iAGg0WEL473ONkyYe5mGdESuhUl85k+YYDtvdWz6CB1Cq36nLkX2z3ajXjRs1eNKLzB+y/bnUJeLN+zBHg91SUaV2n8k9mjuYBKGaxTAMwL60CYQEDRUJVz/1sCIgCznknRoqaGZx5JM1vw94z2GeO5Fi91XZyGoZJNWF/i/8ttVLO0gSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vPewymJui0N1+u3pEVH56ehdhYlh+ZXHXWr1iy0YdzU=;
 b=GN+oAvlnMzi62pN2rJL/u0VSrx0chS6l6pYkKp/ihJzf6zICEio414GHsXcdEpBvwC4SuEpYiyJ6gmfbw3Afy1ex/UczSaiXvXnBFZBpMdHqf9IskfpNhP6wv73cvVLPqR7jU9zVb5vCc4dbiE4KITkUmPvOf/7Ei/y6n/3XRsVDUHQNVThj7cq93Y/cjvLClYhmblyFA5FfX5pyRaXiXtCiqMQ5xDx8jY9T8ZaB64yMigNdFrqrAkWovtph2BIz90nAdxynInWKaM9LMyaNWHrTcwSNbwlwFSexPmIQvmbOkjj24h+ADsDAnxZu6bTBR0AdaSEYBT32RsCWJXOL9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by SJ0PR02MB7504.namprd02.prod.outlook.com
 (2603:10b6:a03:29b::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Thu, 23 Mar
 2023 18:52:36 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::3e12:c026:afdc:beda]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::3e12:c026:afdc:beda%5]) with mapi id 15.20.6178.036; Thu, 23 Mar 2023
 18:52:36 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: "Matheus Bernardino (QUIC)" <quic_mathbern@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "anjo@rev.ng" <anjo@rev.ng>
Subject: RE: [PATCH] Hexagon (translate.c): avoid redundant PC updates on COF
Thread-Topic: [PATCH] Hexagon (translate.c): avoid redundant PC updates on COF
Thread-Index: AQHZXQOuezNZRtSa5UuUzt0AYiSutq8ItmXQ
Date: Thu, 23 Mar 2023 18:52:36 +0000
Message-ID: <SN4PR0201MB88085EFA714ACA0F30AD301EDE879@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <fc059153c3f0526d97b7f13450c02b276b0908e1.1679519341.git.quic_mathbern@quicinc.com>
In-Reply-To: <fc059153c3f0526d97b7f13450c02b276b0908e1.1679519341.git.quic_mathbern@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|SJ0PR02MB7504:EE_
x-ms-office365-filtering-correlation-id: 8a40b5ba-174e-4ae0-87b2-08db2bcfc4d8
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JRATDhtUXPHu38I5NW56/KWfEGu7oiZGIkXl5BefxWLEc2k2WYLmGkDvrstRbvJ+Azd13IsoWLBWH2/nS7ccU+gUFmYgQ5fcZmPl0DV3qZ8mgxpksyDJjMtLF9yun696pUYRhRkrZv71muWPt8hFu8iRCL0k7mlM/iYGDCdzexsyFLE3vNMRphdQHFWXXz2wTmOWmcRvYD8iXVOx1wsV8cvDorKqHHdwr3T/oTzUAiThWTmu/GL+fjfijzV/ejIUE3M/gl1SPiktyKz30C/5DEng7ymzM2BCKI1nzLsNr9uMW1DsLHBkkHdbI2u4UFEkEUdZkJb37cjBCCY9ZK0m0OrTKF2CKjco59Jqjdu5BDwKEuOOI6ZO9ydH0cy0qZVFa9bcr8q405GpjTHX2ryAwFvQWqtJzKDaRU2xNIk4uHO7E8Ux+axhV00MZOva0pholE/aKuughnDjwGrTZDANtm6zyivLz3VX187MV7S4sBUQP9USJjM1W2+rWGLQ++oyE1ne52b2H4F/TtBgvmUGfAcGqxkxlrOG86aDHXMRqwx6kwTSzDeB6lSlrI215nwp8dYyrVRIGkRyiI3XHVJmnAP9tAlwPd29vIF82VJS1YsaO7iPSxn1rqLAybJnUkDNdoem4BmJNREHEWlgoQAYxj4BqfSaQDvXfAdu+39igPW2J8fvyn9qXMxct/s4LwpvTvdjsQl6uaeksSAKsXX9gQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(396003)(376002)(136003)(366004)(39860400002)(451199018)(38070700005)(55016003)(38100700002)(2906002)(83380400001)(71200400001)(478600001)(9686003)(186003)(86362001)(33656002)(110136005)(7696005)(54906003)(64756008)(66446008)(8676002)(4326008)(66556008)(66946007)(66476007)(76116006)(52536014)(5660300002)(53546011)(8936002)(26005)(6506007)(122000001)(15650500001)(316002)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?n9Lfj9JRhz/D28aAAeNEhO9jLNMl28bPpYUCkhctu6cAqYgvn3Qfs6/z0Wu3?=
 =?us-ascii?Q?hQqE8QSTCvv64VQwbhnd9gqZl0WaAPCYQWkOtS6v4C1y/IDWhRByHi8Px4sj?=
 =?us-ascii?Q?KFLhbP57VdA1PsOtZB+8CxcqLZokNKz2VKThizRXpixDqjhlO9F4SWyYZLSG?=
 =?us-ascii?Q?OEo0GBUW3GGWMRO+3kcgHpoqzRrG+Sgujk7+faAGnPsb2p3DKQilVE3pC9R8?=
 =?us-ascii?Q?zlLv4XNLpuiBnPrucjKR2BlkQRkoqf6FNUifzv1hXGOpapAzctxYjawxi3OA?=
 =?us-ascii?Q?0qIVvFa7gJlctFZxH+DW+0QXG5Wso6+4+65GrH035ojiVbpkvWM9HrhnSv7e?=
 =?us-ascii?Q?xDyfSs6zJ03PE3ofqgODUsxGSqIuj5g/xaL/FEroUdrj8LdwQi8ySXzWLM47?=
 =?us-ascii?Q?TTm70axRJT2ZOylw9wyw2mkof2AczLYnZ8OK7B+Kzrq20yz0xEAL5rLNOkOG?=
 =?us-ascii?Q?1Ecoxipzofvd6Oi4vKrQwHq5QlDN9yBE/RW62cuJkWXcOWIt7T2PmPE71La/?=
 =?us-ascii?Q?49416CDZL8P1w+Uvv3F535+QbdfQ0wGE3aPZfMzrgRrvLS9jQaBriUL24a+D?=
 =?us-ascii?Q?Yj7ff4CJQotUn18EY0Yx4FzVruJkKrxNrIXdVT4fnHB8ybvkPhD16Nq6c9Lv?=
 =?us-ascii?Q?6/eKTydVBcPfVo+mbawPPjgdg+sgOrHAveIW3c/x9+gR/qWQlkxduNxID+NB?=
 =?us-ascii?Q?PF3PxXY0L9j/FlSinDjbbBmLG+BHGeiBcjX5MSiDaP2Io6qiaPOnS+2OOJ0B?=
 =?us-ascii?Q?qO6rUNSqmvgcgSKgGrzxwgD9M7i/DX4VwNBvH/0IIJ+e+G38MX5nkOUgwmE1?=
 =?us-ascii?Q?GN+1P6MFN0lME8avRhqyHCS2PyfQ7/UQstru8+9JXAlZO6iv1KA+p808rfxm?=
 =?us-ascii?Q?hWY6etzm54CyKrmjf8XzN4lrmah6kElBXu/ENMvvp+KKSWJ7V1mjacKAjjiv?=
 =?us-ascii?Q?1V9DZ2622btUYR1kkmQbFbM2nhMGHaDSP5f6h4SlxKbSuoZyQ8Hk8xnbvL4R?=
 =?us-ascii?Q?ZmktASfewXJn5m9BHnnSbGm47hvuO2aNJ9n1ABrfhl9ctJ+Ykd/woBlwmTbY?=
 =?us-ascii?Q?Jc6okZ/SI77gKoGvXIC4oJvnUQEM4yShBmKbwg6bHs1Nd7MxpSEPz5MjbGgm?=
 =?us-ascii?Q?z0YBP547SowTNTXGib7U2bYvmaJFfQcEu8YKRWoJ6WmNZKsxJYTc5HzSvB/g?=
 =?us-ascii?Q?giLyXSC6QhcdH0kvP4Il3SvT30bdnKgrTX7Vmvgjgl066dyMe9szQx+fglz7?=
 =?us-ascii?Q?VcfTddNsZ1S3YbSdm9aJdyu7egx4wdIISaHh0yoNQ60ktaXGhSLhKzPodAF8?=
 =?us-ascii?Q?bSJEAuDVd2mX9QBopBwrVgzZ17XDxOMIsWqjdPGFAnmmgwxHrWGjtXlHDKZY?=
 =?us-ascii?Q?w1KMcLbVsWjPTPZKBnTJTF3DrsxtcrUYPEzWSCoVKMCwoqgymCTCJh28iuAT?=
 =?us-ascii?Q?Jox7KDWCObmgBenzeGfFLlLbQVOk0WZz6qH9lHvMbvYbTG8WJbrtlGI+iRVn?=
 =?us-ascii?Q?edjbeYDDxFYWwjtyjNXEOxfawrUJnsabDQzUyc1Eu77ggS8ZI4tpfn8aCmCM?=
 =?us-ascii?Q?ChNPxDFqtW23aqRsa0KoD6a8x+VXyoF2eS+iHbFo?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: tR8DxFjb60ddWJwENx+70GVmvw+OupWD5z/JwpDP3+9w5S/bZ9vllci+K1GgpzeJJXHAk8gAcjzBIdEfTgb3O5uP1OSwtWEHC8zS1NGOQxeCc6MJYlPt2KosbhxRRTHXqE8aJtD8zhmm/pviEtNxxWnJCyAsptaqyiXGMaqOe3fKF5tC6mG+yxjR726FKgnYlnlFOWC0+Fs3F5OPj3+Zmc0QpC7D8aPJ1CJUlf8krVTfIzy/zzOmSMtHfS5vAvG7Z39lQ+56tKtR00lkjzGBw90jr1JBE0ePiqikOdWYmUlknmNSEiZPbVJgEGPpS6sIhUvqvNgHtD/h4CfaG/Reo0JJ9gp77qNNzTHgDi68P18egyOGquUr7CMoJJJ6uyiZnu93cENJBMZpetaPgilm4gktkMdIxkWg4gg/81bzM2zG/C2diVwdzPBLSEvynvWY9nqkW+doqLHDNQVeDTLMLnK1IN/D3nNOSl9UjdzO9KztOMeIzPAqLAqXjbihY8lOyZMBCtQ1EjL8+yfzhL12TEiMQrxToSsdPxb+xOpBzILSwXkVdM2q9Gnt6y91x97AvvgxD57bIBIVVNdIarFN2cXsbf6ldSXZzwCZpV3R9gBQLBhnAQAmH0/K5DrYYNzHTL+HIiDB3q5CIQ8IpDziyY5vodIjTzw6g+Qo2kVlFFJ1gltpVC74vufPWytEaq9JPnc8lzyVMcDoLyhxOJgzSDffN8vB7r9q9U1poWoYGj22W3AX6lfNPFo5AF6u0MUHw/U/8L9mo0EFpLFXitEwgXw57SK7qp7lSKSjz+RFpw3JvGyQ57PE5vzejBYt1JXw
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a40b5ba-174e-4ae0-87b2-08db2bcfc4d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2023 18:52:36.3337 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qMTGkP6vk/UIyy20dhMK7rhpuZuoSwZanL5wGvV98+x66xgjePXLUyRe6ZhSSxhvXv9hJHK8lnq547FXJ50oYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7504
X-Proofpoint-GUID: wczs75mFtahQwjeu2ZyvmDKANb7PI3Ff
X-Proofpoint-ORIG-GUID: wczs75mFtahQwjeu2ZyvmDKANb7PI3Ff
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-22_21,2023-03-23_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 adultscore=0 mlxlogscore=906 clxscore=1015 priorityscore=1501 phishscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303150002
 definitions=main-2303230136
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
> From: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
> Sent: Wednesday, March 22, 2023 3:17 PM
> To: qemu-devel@nongnu.org
> Cc: Taylor Simpson <tsimpson@quicinc.com>; richard.henderson@linaro.org;
> anjo@rev.ng
> Subject: [PATCH] Hexagon (translate.c): avoid redundant PC updates on COF
>=20
> When there is a conditional change of flow or an endloop instruction, we
> preload HEX_REG_PC with ctx->next_PC at gen_start_packet().
> Nonetheless, we still generate TCG code to do this update again at
> gen_goto_tb() when the condition for the COF is not met, thus producing
> redundant instructions. This can be seen with the following packet:
>=20
>  0x004002e4:  0x5c20d000 {       if (!P0) jump:t PC+0 }
>=20
> Which generates this TCG code:
>=20
>    ---- 004002e4
> -> mov_i32 pc,$0x4002e8
>    and_i32 loc9,p0,$0x1
>    mov_i32 branch_taken,loc9
>    add_i32 pkt_cnt,pkt_cnt,$0x2
>    add_i32 insn_cnt,insn_cnt,$0x2
>    brcond_i32 branch_taken,$0x0,ne,$L1
>    goto_tb $0x0
>    mov_i32 pc,$0x4002e4
>    exit_tb $0x7fb0c36e5200
>    set_label $L1
>    goto_tb $0x1
> -> mov_i32 pc,$0x4002e8
>    exit_tb $0x7fb0c36e5201
>    set_label $L0
>    exit_tb $0x7fb0c36e5203
>=20
> Note that even after optimizations, the redundant PC update is still
> present:
>=20
>    ---- 004002e4
> -> mov_i32 pc,$0x4002e8                     sync: 0  dead: 0 1  pref=3D0x=
ffff
>    mov_i32 branch_taken,$0x1                sync: 0  dead: 0 1  pref=3D0x=
ffff
>    add_i32 pkt_cnt,pkt_cnt,$0x2             sync: 0  dead: 0 1  pref=3D0x=
ffff
>    add_i32 insn_cnt,insn_cnt,$0x2           sync: 0  dead: 0 1 2  pref=3D=
0xffff
>    goto_tb $0x1
> -> mov_i32 pc,$0x4002e8                     sync: 0  dead: 0 1  pref=3D0x=
ffff
>    exit_tb $0x7fb0c36e5201
>    set_label $L0
>    exit_tb $0x7fb0c36e5203
>=20
> With this patch, the second redundant update is properly discarded.
>=20
> Note that we need the additional "move_to_pc" flag instead of just avoidi=
ng
> the update whenever `dest =3D=3D ctx->next_PC`, as that could potentially=
 skip
> updates from a COF with met condition, whose
> ctx->branch_dest just happens to be equal to ctx->next_PC.
>=20
> Signed-off-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
> ---
>  target/hexagon/translate.c | 21 +++++++++++++--------
>  1 file changed, 13 insertions(+), 8 deletions(-)

Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>

