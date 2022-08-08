Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1E758CF28
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 22:33:24 +0200 (CEST)
Received: from localhost ([::1]:48232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL9RD-0006Hl-6k
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 16:33:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1oL9OQ-0004gK-5U
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 16:30:30 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131]:4410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1oL9ON-0001KY-OA
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 16:30:29 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 278KOiPJ011405;
 Mon, 8 Aug 2022 20:30:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=FanIlLBpAsuxGxiNKrFja+idU1IQTFc+b+YbROzLCNs=;
 b=Fv2DbtRvyFfySCZSF624qN4w2joY+RlGgx8ufoYqa+aM0pgA5rfe/td9I+rUCyOwVra2
 +3WXId5XkXy27un6rA+lwqo2WW74z85J40RYuXALwcLTD2QdvXRfFeLpg+4OObOyglY/
 1HZWpRH4TIpEoHU1NnWK2GdzovN1nDcrwhjK71RBJZ+Cydh6CjJnVBKtdW4A20ge+bqb
 s0gikGp15rssJeGBalRtE5GJ3WRPEzT9+KzDW6USB41lHz3j7Dx7uOz/Af1poRe7itcY
 PKpCCXeIOe17B9Cy9yjcBrI7/LtOxp1gzDfUWXcDjaNd5yuR8cPoewoZVBMuYh5TN4qZ ZQ== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2104.outbound.protection.outlook.com [104.47.58.104])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3hsf8wvbq8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Aug 2022 20:30:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KY24HLiVm1DXvBKFe7dFlDri+8IMU+Vqtt8RALQ1dIWiUt8x7OEbMdhAXlAL6hfzWWjIs5VtcWR44+EjIKCllI+ocle/RRC703RdKj3gHwjksc31U+Iw08erQzfGxm+6bxH5xG9G8WRg6Hr98ZXICZPCXmUImxFpH/RUGMJANOGz847uBIJDSYGd7uAb2wOQJBWpp74pITLrC6+1UgnRMh8i8Ac7SOS0xHeJDNt1n38cfhW+l3RncOzIDE5aUxwFbJ/FQjnEFHSbqptWJJ3ZD1/YTpOA7ctFq1+dS6JQv1tV9mXmXbn5k9DoyUtA+B2wF9i1vkGYwFu043YDMQklfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FanIlLBpAsuxGxiNKrFja+idU1IQTFc+b+YbROzLCNs=;
 b=fOiEyBMjaYI3y9hn615Y2kGhicmALxi+WtWVMeeOJUFgwBIa26vD9D69xcMQp4VQ1zP9Tiu15vbiSlJ9nzUYZPkJiyaetHIbZkPipzfSlvLXIHFbt4I58iYGp9jsJNrPQ6qodftxCKyhRZprSlplRhGEGe47zkUQvjKYbqNkLftH2Bj8OXMEuamzBZ/kowY034YiMJPfWkDUItb10EY+RH3iUuK4mKAysbUEkjyWpeXUu/3S5HP6OA1XNnID7YSCPLBbfSKtJueodly7RY8vxESWwQSYuy9jIdLVdMklfo/ZjjqXgpUvi236g4oEMKGIWfzPFnmhPZ+UM5B12yLCTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by BL0PR02MB3682.namprd02.prod.outlook.com
 (2603:10b6:207:47::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Mon, 8 Aug
 2022 20:30:19 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::35d4:a77c:1fe0:53f9]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::35d4:a77c:1fe0:53f9%3]) with mapi id 15.20.5504.019; Mon, 8 Aug 2022
 20:30:19 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Anton Johansson <anjo@rev.ng>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: "ale@rev.ng" <ale@rev.ng>, "babush@rev.ng" <babush@rev.ng>, "nizzo@rev.ng"
 <nizzo@rev.ng>, Brian Cain <bcain@quicinc.com>, Michael Lambert
 <mlambert@quicinc.com>, "richard.henderson@linaro.org"
 <richard.henderson@linaro.org>, "alex.bennee@linaro.org"
 <alex.bennee@linaro.org>
Subject: RE: [PATCH v11 12/15] target/hexagon: prepare frontend for parser
Thread-Topic: [PATCH v11 12/15] target/hexagon: prepare frontend for parser
Thread-Index: AQHYp/k0e66RCIl/+E25t5HrQ73vSq2e5s2g
Date: Mon, 8 Aug 2022 20:30:19 +0000
Message-ID: <SN4PR0201MB8808499570D6567E6DC3C96BDE639@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20220804115548.13024-1-anjo@rev.ng>
 <20220804115548.13024-13-anjo@rev.ng>
In-Reply-To: <20220804115548.13024-13-anjo@rev.ng>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f35ba5ff-9913-448a-a849-08da797ccfd3
x-ms-traffictypediagnostic: BL0PR02MB3682:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VctReCqvBld8A/iJ8ga3blESyLKKz9KHzrbJdXEkVW9pc/49DdBs9AT0DkyFL64He+ntX5nYPMUm/nnURn3kaOVub/qUD7xSnnU1AiJ5qqPm9lfqqvY4dDzY8A7BXvfmOy5WAjRR7WSZz8Rrj+XK3s4lSN8XBSH8Jf3/OVsiSAUGvjI9IXRtKwg5NBwt3Rw0IPe+KURBG5wIer0quJpD3BA2HaA/ELxqrdAEHHi8zCC89WXFmBPmG5zavkn8ptWJkkAs7VtOqVzW19khlpYbKhIt3mNEBO/88SMAcQ4UAifvxPX3xwDSPdnIZAZCxVUe65aEK++zMmfyTrv7ApPiFK/H+r/QpDRWrO43kZ1kqTH8Z1MeQy21qrCQxQBeIjgoBCbo1VYZDw8MmL+npA6Kz7gAhfNWydb6g2zctQv3Z/0bVwReAKRT1C89qWtV7IPJDRut8dNtW2BNBQsSkyeesJWPUyoxYiIBIPhDXzwIeFy3JjDWNuFjore0rlFYSqjZ29ZuIStfizsQZKQ9kD85JChviPk9LTfDZxQjNgqrsPRozjuHlBMtcptKk4q632izEt3vzxNig13y2VGEzfVRAXP3hb9+iZru7blZuvxt7uAVWzHHvuwrawRFlXgxn+GHxXegI/wWTvemnV7l0sIB1KuFCAFqAWO39mGnR/ATbtyGjCSc7OFqPsbQj4rrMXSS6j8exVxQPxGaPB7oXX9XlHJSWM3XOJ6KH0ovn1PAF0Bb+m4uiGBlmID/IVec4n5YkvPwYmnPbBckTQzRiV59eqFLajiIoP3EWTm/CoSbTRHVZAOq5YzpfpTzFYTa51g5
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(346002)(366004)(39860400002)(396003)(136003)(110136005)(71200400001)(66556008)(7696005)(478600001)(4326008)(66476007)(66946007)(186003)(6506007)(66446008)(33656002)(38070700005)(76116006)(86362001)(64756008)(8676002)(83380400001)(316002)(26005)(54906003)(53546011)(52536014)(9686003)(41300700001)(122000001)(38100700002)(8936002)(55016003)(2906002)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8cKI1GobqYtmaOGUdwsZ/6T0T9yq4E/ScfNJXPLTrUBEYg+WZ7mhIZLE+zne?=
 =?us-ascii?Q?kdzyA9NyJYGlLEOSW+5spTSHHytDek7ieafXJq03Qdxt1tz3CPuSBFzg+nD5?=
 =?us-ascii?Q?yLw6qIbni2sxy51oItYN+a2Rl83O2bUjUrImlmlPmyNYLkPnrEj1rDJVqNuu?=
 =?us-ascii?Q?QMqZaC9n10U3XSmRqjwahPcPtWQltVMga72oDYS0lUPVp8DfM6VyWwfqx3Xi?=
 =?us-ascii?Q?enk5uSCEMtXmylsBduSS6XA9G1oLKiiWMzykQ1loESFQZPTTz1QWe22pqvAX?=
 =?us-ascii?Q?hRnaaOLebpDHHOgtLHTBsJNZIqs1UpUjODYM7fKVv48ef1TYE/Sx2qPy7DRt?=
 =?us-ascii?Q?iCZW+IjAOVf6T6wn2ADt5D3aVMey5nKvH8t9mQJBt6Xr2TIdBX/4623I+wsC?=
 =?us-ascii?Q?VBiQePS9ygv/lGE7JPfmONqpPbSpmDzlNjl4gbyWiodj35DscCGV7UObFMV0?=
 =?us-ascii?Q?wKjBHQSygzqlYEcpqFz6cH8s0h5OQ/e83KKAezis1nwYec+XbDG6+yN/Zqrr?=
 =?us-ascii?Q?ctanwkhsP5BVyR2B18ghTEllLH3Z77rnRXu5DLnrKoelZ+Ubuc9RmWiPe8s2?=
 =?us-ascii?Q?RPFiz055vacNQ/G2Myxx/kl/Yj0v8fWVxhff8vox4qo9KLeC5itsHQEOei7g?=
 =?us-ascii?Q?JJaQPn2uQ95P0RiB8Cvp1wCSzvtxtU/p4H6AkyL/RHtEXt5kzC9rYezenHM7?=
 =?us-ascii?Q?0eIP/IsGTWOF2B4nMVW95VQX3Vx6RLnl1124Z9gnNndrKNT2lXnJkyTkBSRo?=
 =?us-ascii?Q?C9qDmaSjeMSZ3Sj4HeZSnGB/u9xSYux2e58UNmia0ohXUHPNFoAwMm8Xjpan?=
 =?us-ascii?Q?nA1nFShXXrUc+8sn7+pJAVDxN8fjF3PCnW3Yva28UB1X9RQMkYY2t5PlCafO?=
 =?us-ascii?Q?tdzNVDEw+76t4ypuUrdEKM0gE55MEmBSRqHRNqv+Z+EXTZy7N8+Xvt2pXStH?=
 =?us-ascii?Q?PZkedFxjqVsAJ0+HY2ej3SyLzlNigKKEN41ZequIfkJM9uTLWndlhzHW5PDT?=
 =?us-ascii?Q?UfpKZOjmOHm0KDmJQf4sF0m3WohOJGoTaClX+tOj/euYQLu2m5Rgbl4elTws?=
 =?us-ascii?Q?3WolK++/VwVNN/bEMHTkmRI81A/1kThf+gF2HQm6rbhEXXo9GlNnk7/OQssF?=
 =?us-ascii?Q?J1cENi+MAA+TPU0i2N64zKOUJUmy6MjeyCeJKtW1t2iBx5eR6bAXSDNISeRt?=
 =?us-ascii?Q?RzURmXJO928FdwI2KZ4dp7EOdMK/9CugeRIFhOcKMJcllPRwhBLJNCHmabx8?=
 =?us-ascii?Q?wS8Xt5Am9AkW4AFL5S+zMdphkyh7+254KbU6zF+r2n8p6YM1f0emSRFXbHW3?=
 =?us-ascii?Q?ac9DPaLMxXsXDuAPlR4itEN2Ct7pS4wE0qR8qAVo6iJjjYPJbSZ5rHtqU8MS?=
 =?us-ascii?Q?Ml+3m/jFZJCwbX3v5gjLDwnJDgL/ZOwoRcRisRi3M/0DKgg/RnDgZnAJB2Pr?=
 =?us-ascii?Q?K1SWeob6XPXhLLNWOZpCmv01iIE+ZAlAIwAOebRYI2/4WISQ8CPy03tnTuVf?=
 =?us-ascii?Q?NQNUQzT5FojVAyO/yavIpyy5t8zPaOAnne93nr8g7KTQEed6WHLQyOPkzBEM?=
 =?us-ascii?Q?+nLNzBH6EtWF5KJyfd8xzRhY539HOlTz4kUe/5mH?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f35ba5ff-9913-448a-a849-08da797ccfd3
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2022 20:30:19.5538 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u625P6eCHaDDQ3IYw5QFX4kE5SgKy0/hZ0XWTI1GITMcEYh6wv5/YShEzmLr8rllLNM6YtABFfF+u5Am9WU/Iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB3682
X-Proofpoint-ORIG-GUID: wHwvUTNk8G6fpnuuQ3GuH8nCK41fs-ju
X-Proofpoint-GUID: wHwvUTNk8G6fpnuuQ3GuH8nCK41fs-ju
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-08_13,2022-08-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 impostorscore=0 bulkscore=0 mlxlogscore=838 suspectscore=0
 lowpriorityscore=0 mlxscore=0 adultscore=0 clxscore=1011 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2208080089
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=tsimpson@quicinc.com; helo=mx0a-0031df01.pphosted.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Anton Johansson <anjo@rev.ng>
> Sent: Thursday, August 4, 2022 5:56 AM
> To: qemu-devel@nongnu.org
> Cc: ale@rev.ng; anjo@rev.ng; babush@rev.ng; nizzo@rev.ng; Taylor Simpson
> <tsimpson@quicinc.com>; Brian Cain <bcain@quicinc.com>; Michael Lambert
> <mlambert@quicinc.com>; richard.henderson@linaro.org;
> alex.bennee@linaro.org
> Subject: [PATCH v11 12/15] target/hexagon: prepare frontend for parser
>=20
> This patch adds the necessary changes to the Hexagon frontend, required b=
y
> idef-parser to deal with a :mem_noshuf packet with a store in slot 1 and
> predicated load in slot 0.
>=20
> Signed-off-by: Anton Johansson <anjo@rev.ng>
> ---
>  target/hexagon/cpu.h       |  8 ++++++++
>  target/hexagon/translate.c | 22 ++++++++++++++++++++++
> target/hexagon/translate.h |  2 ++
>  3 files changed, 32 insertions(+)
>=20
> -git a/target/hexagon/translate.c b/target/hexagon/translate.c index
> e3e250fd4f..72bf8d591b 100644
> 494,6 +498,22 @@ void process_store(DisasContext *ctx, Packet *pkt, int
> slot_num)
>=20
>  static void process_store_log(DisasContext *ctx, Packet *pkt)  {
> +    /*
> +     * Here we deal with the special case of a :mem_noshuf packet with a
> +     * predicated load in slot 0 with a store in slot 1. If the predicat=
ed
> +     * branch wasn't taken during packet execution, then store in slot 1
> +     * will not have been executed, corresponding to hex_did_store_s1 be=
ing 0.
> +     * If this is the case, process the store here.
> +     */
> +    if (ctx->insn_is_noshuf_pload) {
> +        TCGLabel *l =3D gen_new_label();
> +        /* Reset s1_store_processed so process_store actually emits a st=
ore */
> +        ctx->s1_store_processed =3D false;
> +        tcg_gen_brcondi_tl(TCG_COND_EQ, hex_did_s1_store, 1, l);
> +        process_store(ctx, pkt, 1);
> +        gen_set_label(l);
> +    }
> +

Let's follow the convention in CHECK_NOSHUF_PRED where we branch around the=
 probe of the load when the predicate is false and always call process_stor=
e.  Then, the mem_noshuf store will always have been processed - so we don'=
t need the runtime state to tell us.

Thanks,
Taylor


