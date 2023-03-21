Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 353ED6C3C30
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 21:50:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peiv1-0008NC-M4; Tue, 21 Mar 2023 16:49:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1peiun-0008Gz-UA
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 16:49:06 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1peium-0000N5-Bp
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 16:49:05 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32LGEYth029257; Tue, 21 Mar 2023 20:49:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=17Ya/0Q9Qf3RFuEtf9fYtecLopJxk+4JWjjWqc/7WxU=;
 b=Bap/U1/myLvFEz8p7ps86vBoZmALOKTRh5eGnHXvuOICr+jNEZhiLb7c5p1u399U4owv
 4dJ+7H7UXNAHi2GdzOpjDtWPbKeP3YbYtNcHzUI//e0icH1DjD/3aSe83S39cIMdtvOy
 AUSvQpZdm5N+u+v/Z0PZD4NCVHCm9jskCgxbdk2C9FmR7F5NFmguxH5/Z9CLdyZfzKl8
 GvbtgJ6+SqT4Qxx0Jaeatv5ez/Tq4H087EwOkluTnYXL7UOp6iKRLbnGcCczozeG6DPS
 J+fPeLxUXJtEl2Se6lUNx2B3O/kr/4ErjdJn6tO8vIz8Nh+S10LCQKWWwmyd9PvVQYIA ww== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2106.outbound.protection.outlook.com [104.47.70.106])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pfbjy9kk6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Mar 2023 20:49:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nkbe04t8LzxsI9khikEqU+VzvRb6f1dlsd/F8DZOR7DVIfJcPVrqONS1RFZeAQ9pMl7zUyWU5AnqbJ/asDQJFmbpo69hrJvjJZ1IOfKf9QPdcdc3fj5+02hJfUetejWgEC0ZAM19I4PVsyP8wkHoZZJTT0Jd+29oyNtdZZWTSZU1PQTgxgtwgbwm2HPMjueTAUTDqtMJ9SE1zvSVtMwS04EQj+qpivt2m4otxmPyYN3dQTqunnuaz04uVSQ2UXFGO3/VFStHSvsnG24ZfLqTHZCV+mPDMyLLhvXRVAKWeEKTTvvWYb5FTJOgE8948dnXaSgCEQInoPFqBCHMlHiEUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=17Ya/0Q9Qf3RFuEtf9fYtecLopJxk+4JWjjWqc/7WxU=;
 b=L7Mas408sCeVC+9cgW11ZYrSHKwo+EbgC2XnhVq8kiSutTSkD3l8/WphJcztOehiqQzFKFz7kkf6NfBiwXw+7CueCHLIWPXnke9ki1kqeyy1FJnddXCTsfcpAbdlH5KOTX0maEhN66XsYMmIi8GUxAPIbZnjNcBkCUQ1sHV6+bnaTvXxjDiHz0Sp/LAu77uVoQSSw7jwIVymKiclYgnkjkYaVQfaj/2NQx5Thmi/b+8oIzzyCq8L+jpQKVON9pGbIcSuTn4kDQYLbc3zZkVXpoEaqKQEmYY5oqtfnc7kFwSFk+zyA9hY1m+dPaZSoQimbDdNewSXF5dWkmOBNzMmfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by BN0PR02MB8269.namprd02.prod.outlook.com
 (2603:10b6:408:158::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 20:48:59 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::3e12:c026:afdc:beda]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::3e12:c026:afdc:beda%5]) with mapi id 15.20.6178.036; Tue, 21 Mar 2023
 20:48:59 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: "Marco Liebel (QUIC)" <quic_mliebel@quicinc.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: =?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>, Markus
 Armbruster <armbru@redhat.com>, =?iso-8859-1?Q?Daniel_P_=2E_Berrang=E9?=
 <berrange@redhat.com>
Subject: RE: [PATCH v3 2/2] Use black code style for python scripts
Thread-Topic: [PATCH v3 2/2] Use black code style for python scripts
Thread-Index: AQHZWw5bSxy3gnU1EEutql5DHNh5J68Fpg0g
Date: Tue, 21 Mar 2023 20:48:59 +0000
Message-ID: <SN4PR0201MB8808C07EA583CF690497B7C0DE819@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20230320092533.2859433-1-quic_mliebel@quicinc.com>
 <20230320092533.2859433-3-quic_mliebel@quicinc.com>
In-Reply-To: <20230320092533.2859433-3-quic_mliebel@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|BN0PR02MB8269:EE_
x-ms-office365-filtering-correlation-id: 04f06de7-1087-4ac1-b5c2-08db2a4db22c
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ho7AcV51FLVJWOMem1UfVksDXrxVUAe5plntIHkgh6ORDbBGA4YyEo+GBgnti93D6erMs57EY1HILQicPDZdpCRNNB2ndHQyBVqJNRPzNvjrgT9c08NU3kgRN5EGChYxZ7ye0Tvjxc47/eknl9Gvb3dw22swDf14d4I6g6C6bMyEWHzECUpqeuL+c3bn1ns0KYtrS5FouxIVzSFykzIkHvP9VpO/UVaHn3nYULCTotmcqT2n2kv/CkHd3CKkFVdxfTDBaGpjQlOXs74FXCb4vClqvg8xZbAOUmG4zFQ+QfzVDjZFfUA5yNgwNXTvjpf5Wn7XjCAT5K8Dr95rrAkP5ki+dC4ZIJiTBASNxWryiMcuN0n8g3Hp/xxhlghWn9ohwOUOV3nnvwSa8fNJFLi8YHgexIpnsis2TlMCY8+Do6UOvY/EgFJvaJhDrT5FJYRXh8U19g4AMKumQjw46Zo0IjtbZ4mcQfxkw2QfQcRq+QUg5IaNI1wZSrfZvXpcU3cuuJiSWL6pjm/jKxW5wwxKvJy6X9s1nmko/Ij207Ql2vl3lZ0oxnOTfJcbaD+6ZVoAqyfXP21Hj+26cI1ivMTUXwmQ0mDHG9DhD54DVtvxLk87I3hXG7yaRL4FXFmLUTJt5naa5YzO1GFBOdLlQUh+DKImy0NfZtLEdXVowlBRbXZAD286WvxrgeqrA4yoqqm0
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(136003)(366004)(396003)(39860400002)(376002)(451199018)(7696005)(83380400001)(54906003)(86362001)(38100700002)(38070700005)(55016003)(122000001)(110136005)(8936002)(64756008)(66476007)(66556008)(66446008)(8676002)(4326008)(2906002)(66946007)(52536014)(76116006)(41300700001)(71200400001)(5660300002)(9686003)(6506007)(53546011)(33656002)(26005)(478600001)(316002)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?+mdU3m9PKHR38q9JExzte6C4rTbIRIA71frVGggOUm3xt56T7q6vDxO/T5?=
 =?iso-8859-1?Q?hLfDnzK4ikPNhJ200Q+x3oM4wcF6YRXWTQyTE5LaAeAk6/oRuf7W2OjuDR?=
 =?iso-8859-1?Q?vWTZjefZZzR0MExXIxfGoAj/S188roM8uNYdr9N6/gkVEqkkikH2BdDyxo?=
 =?iso-8859-1?Q?rNj67RJC01g0dtAOOWRFoFtbJt9rUPJKJa1rlZpALp2AnxAo7r7MHPdwXL?=
 =?iso-8859-1?Q?pLjLZoB1MP//r9g1PtdmLbOSIo1fTFy9zIq2Xb6lX/HG/0ZGH1A/FwT+7R?=
 =?iso-8859-1?Q?ZnV3TWi4SqSDPDcMBEPgxg6PRMsG9Vjr7hjMQrkzPYc+ZEKJqo+6BRPAhv?=
 =?iso-8859-1?Q?D8XSLPXQhLA1lDfL6Xkh8jDKFEDsIDzurx3+cVk106joG1zrKrHHxIbvq5?=
 =?iso-8859-1?Q?VfWgBdEKtDr5+vOKljDAF09Ng+zTNpyCDUQVCEnrYrTImLAOz0Fbwd8iEq?=
 =?iso-8859-1?Q?mKuWmerBTriZhxCY6neTZQN55wyWmBonzJOaSRSfMP/Ddj3OaBfUKAWBp7?=
 =?iso-8859-1?Q?CWtdBHBULOZ3TlGe9D4koTZVhxGtkUq5aLe9u2xk+iPKbfFZV7k6jwUUsg?=
 =?iso-8859-1?Q?LZBRjR7Pr4UdNcDDtaTH+h6kEaIe39ma1ITuyrqKuFWPXy+QETxg9DZtnN?=
 =?iso-8859-1?Q?fIp9eyTAGHVIsyHfqal3XXrEhwCv8sbSEG7mev4fdDByDPptHhM7rotSab?=
 =?iso-8859-1?Q?MT3HycfpWz9I5gBDYtLpXUdBJtqsiSRetBrQ3vPFfxiWPc4I4wtT1kfB0n?=
 =?iso-8859-1?Q?Dt6492KVoMTHBxmo4tZPzEw0mT/iabcGhX5BFM7Knui4hY7d72gyD9tqbr?=
 =?iso-8859-1?Q?SmdyuZOsM7cncImFwWvQWTkD2QXBEqV1y8vqDP2c6Jp3T+PcYx5DpzpnsU?=
 =?iso-8859-1?Q?v21Q2H0kDeztHJ3Q9jRUZorYa2+U+zFv89x475/3XcYHPGNYu4516uKK0n?=
 =?iso-8859-1?Q?YBIk7KCQTvr89B0KfQFELluvVm71+qRRFVehHG6ZuVcCmhREUf2pQCoSjV?=
 =?iso-8859-1?Q?QffGTowuX+uuVn/lQMa2Yb9ehbG8LnNjM1hs8tsYitaCN3VFkNQkQxK341?=
 =?iso-8859-1?Q?i7LsCMwg7+m/58kJ1FTSceVQnZVW4+g1EowjGbfUwCz9T2vAAo/T8k4zPG?=
 =?iso-8859-1?Q?KRLuqrsRaEXLrU6vQWQmjw1X3wLEoLFCeZJ8+t95ALYslR2/+0r88NwrMW?=
 =?iso-8859-1?Q?glvqNGNV86fee405zyeAT01o5kykR/giwh/NhTK6mhHPjuYCQyhlgAlcQ3?=
 =?iso-8859-1?Q?amlBnqCifk1B/I4cvYxpgUP+I9rXq6V9PP/6ChOC4SmGJ/S4ualHkqRacV?=
 =?iso-8859-1?Q?8l5YxTxawAWpgZDbkQnTIOKXbpX86bzdnlHYApPs7bYZPp/AFrLLxFlBrq?=
 =?iso-8859-1?Q?eYIeA/HcFmit5r4VrlaY2+J7CsDhx/5qv1ukwILxY4jR+phk2xNFkTMCR/?=
 =?iso-8859-1?Q?OInkZN/a2w0nxKPQ16FNBE93cCHiGDCqE/5Pbj0skpwvxUrwdhBbDSnQNR?=
 =?iso-8859-1?Q?6IbYGdItgagEl6QdSmFKscAd+MzqtlV8KKYZnjFyqS9ysl+FNouXgly5/z?=
 =?iso-8859-1?Q?jK1sTZlIZLpL0I6D8Fcz1EIG+a5Y7F25I1AjJRMSg2CoEmkh5iPrAmqBb4?=
 =?iso-8859-1?Q?VJ/MZ9kq53nDXTjCp1+85uqi0W+j7jFR9i?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: qU1Af0THRj0NGJzYvK6q1JyIxqRyCmjQP8H4jhKNwq7IdNKl49GntKghtEOIYfqaqyMPmrY1wdv67EOv/q7ipH9WsnR3Dl4d4U+/uSUO37ErK5rPxiDTc+i1isD+l9cMlh62ftNgPFus7JY1OjQH6pR3C8jXIZ8xEn7IGcT4mGs8bDMhppgbaIkkmpePzVuNb3V74rpR80ce2CrcUIi8OvNLmRdRshtuSPt3Gvf63Gn045eIUIzvRkgwyx9rSMl2qXweqBXut/0ELtopST0mtvDBGnv7aNpPOKrRhA5R0c9JPxoIxur4SwJh9kgYmPpZwO04WqP+tw84Qm/hSgR1WnAfL1XyiFJRoRIhDT6C437ITnJPvpG0sqt5uM4RRKne8V+otCOjgY6sQZUaP/RFyt23220CcDLscRxBe7NRIt0k2nJrWtUJLfjR6pQ4IXSjzh8R7r+xVxJ89ePkCEyXqbVYSRRwHXlEsj6TwL85/9WA3SE1wTSQBFVj5aqOQgUXiGcP12JKUAfvCod/VdU6PUE203EiPzvMX5Bx/SWct0NVJm65QUWmRSgDHT5YJf2zVn08aYiQ2obwMXj96UPqDzZjtoNiH8NpFFhnQmPV69WucZ9WqI7Nhd8J1YdVYrf4nBJRkmrHeaRrQyL4eSVEaTatoCsOB0u1ndORGZXCYci8k+4JmHhSiBmaL95Ty7Cr6N3zsTkcn2XlkyCnjaHLPw5qSm4GzioRBfc1MOx1MO8oA7xXreZoC3DOIyYT8XQ28r3xEMyeytrmPmYB/C4l1tObFiLM3TdhSe48LOT/vo8pmt5sAzxSNJHG5J1SKmmEjKAOfEQx/ObKOj3FDSwuAQ==
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04f06de7-1087-4ac1-b5c2-08db2a4db22c
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2023 20:48:59.3023 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HCneE11kDTaeC2r4/JQPUnVPPd+2jvPrtm4kL8mG7/HdRGQhEWUiw9piWwcQU+GRfO9AqcdeXomN+3SN0a5Auw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR02MB8269
X-Proofpoint-GUID: hKvH5t90qV7v0eKff4ehPhfyWGrySbSp
X-Proofpoint-ORIG-GUID: hKvH5t90qV7v0eKff4ehPhfyWGrySbSp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-21_11,2023-03-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 mlxlogscore=806 spamscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303210165
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
> Sent: Monday, March 20, 2023 3:26 AM
> To: qemu-devel@nongnu.org
> Cc: Taylor Simpson <tsimpson@quicinc.com>; Philippe Mathieu-Daud=E9
> <philmd@linaro.org>; Markus Armbruster <armbru@redhat.com>; Daniel P .
> Berrang=E9 <berrange@redhat.com>; Marco Liebel (QUIC)
> <quic_mliebel@quicinc.com>
> Subject: [PATCH v3 2/2] Use black code style for python scripts
>=20
> Signed-off-by: Marco Liebel <quic_mliebel@quicinc.com>
> ---
>  target/hexagon/dectree.py               | 396 ++++++++-------
>  target/hexagon/gen_analyze_funcs.py     | 135 +++---
>  target/hexagon/gen_helper_funcs.py      | 338 +++++++------
>  target/hexagon/gen_helper_protos.py     | 165 ++++---
>  target/hexagon/gen_idef_parser_funcs.py |  75 +--
>  target/hexagon/gen_op_attribs.py        |  10 +-
>  target/hexagon/gen_op_regs.py           |  77 +--
>  target/hexagon/gen_opcodes_def.py       |   4 +-
>  target/hexagon/gen_printinsn.py         |  80 +--
>  target/hexagon/gen_shortcode.py         |  17 +-
>  target/hexagon/gen_tcg_func_table.py    |  14 +-
>  target/hexagon/gen_tcg_funcs.py         | 614 +++++++++++++-----------
>  target/hexagon/hex_common.py            | 177 ++++---
>  13 files changed, 1191 insertions(+), 911 deletions(-)

Acked-by: Taylor Simpson <tsimpson@quicinc.com>
Tested-by: Taylor Simpson <tsimpson@quicinc.com>


