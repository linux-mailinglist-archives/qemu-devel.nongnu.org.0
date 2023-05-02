Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD196F4797
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 17:50:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptsGO-0003F9-8Y; Tue, 02 May 2023 11:50:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1ptsGL-0003Ep-Go
 for qemu-devel@nongnu.org; Tue, 02 May 2023 11:49:57 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1ptsGJ-0002Eg-Bh
 for qemu-devel@nongnu.org; Tue, 02 May 2023 11:49:57 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 342BY83R025296; Tue, 2 May 2023 15:39:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=z261MbY0Q/6lbhQWKQj+mKJ4bXK9zTedBGoEWfK62IE=;
 b=TsQ7VS0UZggStXGNxjiT7G8shq+xO3jhowRYZODdqAis9QhH9ThhoOLXOYTRaZCkKNZ5
 /zZ/I0+/nAGy8XT1WEGZTvOYIre9+4SoccdTpcxuQhvumB4IJScEINjtV3mExQGUg8Bj
 gufhYT8NiGjEDT7q17MVYD0+Pyoy+ESVb2Z9r4/FQxjZ3O+7Pd0dekBMM1S/UQDDQr5Q
 7jGJmSqlpHn8o4V9l3pL5JjlmyTy9Zcntd1S9SRWvqKCiboxMvEy5eTbouw5L/04CfH8
 KzevYvMoPyQFm/KumYY3HccK2sxrh55y5tIgLEirtNg2diWLXX78EF+N/zJ4IIbh0PaN Gw== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qays510hh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 May 2023 15:39:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HFKwxq4QaM76fkTx3QoEqkAhXkFZaLW7gYW7dWo4Rv4HExWXX3hgsogOCNBmfvdedc8uDRkdEHLVCdcJjOpFeYoqxoIxfkE+6hruO91qYzWBdL1vADxArOe+IholYutTA9QhMVOEkEo0kZl4jVmenlo3S3ppn2W4cOpPYOx2jiUCHcQrJLWzLVWhlBIw1NrDkdEUmabWLr6R3LXm3kj1dHkD/bUlrrpqT7Fwq4nBYu2yQ0MIONCSQuytKpWgi2WQU4hUwV9kPNx2+1njFJUUxwEIIlwPYz+kyXrWausA/Jl/ABYKIVDvkmVU8pVlLoNdLQRddb4/l1oMndiEBZHqNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z261MbY0Q/6lbhQWKQj+mKJ4bXK9zTedBGoEWfK62IE=;
 b=Z2drr22yMYf8PRfSPOJ4in5CCkf3Y3j1lXwEWpBt5Qzpz4XkoHm6+PG2dNiyYVi3DGgF0n+MuwuSJFEulS+t2uWk2XOF+WnttBsYKhOHC1WeOlOLKmqfx4MUs7aqCrJlYd5ioUfYvoEBmhsWAOW8UX6r0nl+2IePIRLGgUOBhIrxNkyBWyA6zt1apZm4/H/j4SitZsT3sIWCOuoesDQ1nW70smw89KsoRY01V3dA1tlcNbNjrryJfSbpc+YqKwzbcgbV4ohNt1gCtetiwE9QLnJwyMMmwf9o00c/V37lfXSorLdRJYKArgnXRlZFqHn/8qJumdQ/Powqro1tiOV7yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by BL3PR02MB8115.namprd02.prod.outlook.com
 (2603:10b6:208:35e::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Tue, 2 May
 2023 15:39:32 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::eb63:d1c0:28de:72f5]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::eb63:d1c0:28de:72f5%8]) with mapi id 15.20.6340.030; Tue, 2 May 2023
 15:39:31 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: "mrolnik@gmail.com" <mrolnik@gmail.com>, "edgar.iglesias@gmail.com"
 <edgar.iglesias@gmail.com>, "ale@rev.ng" <ale@rev.ng>, "anjo@rev.ng"
 <anjo@rev.ng>, "laurent@vivier.eu" <laurent@vivier.eu>, "philmd@linaro.org"
 <philmd@linaro.org>, "jiaxun.yang@flygoat.com" <jiaxun.yang@flygoat.com>,
 "david@redhat.com" <david@redhat.com>, "iii@linux.ibm.com"
 <iii@linux.ibm.com>, "thuth@redhat.com" <thuth@redhat.com>,
 "mark.cave-ayland@ilande.co.uk" <mark.cave-ayland@ilande.co.uk>,
 "atar4qemu@gmail.com" <atar4qemu@gmail.com>, "jcmvbkbc@gmail.com"
 <jcmvbkbc@gmail.com>
Subject: RE: [PATCH 9/9] tcg: Remove compatability helpers for qemu ld/st
Thread-Topic: [PATCH 9/9] tcg: Remove compatability helpers for qemu ld/st
Thread-Index: AQHZfP4gkEWZqxqW4kyBaQHkllCrDq9HHJhA
Date: Tue, 2 May 2023 15:39:31 +0000
Message-ID: <SN4PR0201MB8808285D0AD10FD1AF9BF21ADE6F9@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20230502135741.1158035-1-richard.henderson@linaro.org>
 <20230502135741.1158035-10-richard.henderson@linaro.org>
In-Reply-To: <20230502135741.1158035-10-richard.henderson@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|BL3PR02MB8115:EE_
x-ms-office365-filtering-correlation-id: 54ab1926-0bd9-4e98-28b9-08db4b236c77
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eWNW4IIvelubq+Rc8hNKQDXJREeLExeiddLuvo/rpOZa8/wGSWzkumTTt789Jj5leodJeKGnYqLg5UghM1pnA4dxY4v6dniTRYanq6gB8J6sTgggJcbH8W44wN6VL9OZpzyr0FOV7W4Q+QxqkXSu1n1anA7pa2xM6OZwrPAG/qsiWi8GMc1SclnUUi7H2erEs694yeTbM5N1bL8GvtHZmKRVr+TnmUYQlGD6Bvm9rEgAwg8pFO203VmibWTgN6NXzDZJdoUrdqcLz1SPRZco49ni2C4+RNTNWXO8Nb+Of62n14cedcbQzsyLf7HtY3qvk1IOFQlnrqgd+g/5ZSbZ7onlz3tbP3l69bwRo6J+4VhtGZPGjnxHOK+i4QKl0tIwGYENvlfjny1ft4cSiVSpvnWedzHNxsfntlIevGcg8G5I2OGQvF992tQdGzjvwtJLphOfDfJRHWnpM1bCjZ+8rsqf7LeHb/0QdqHFx+oNBaC+K6k4CL59fEHz3lpxpkIjV91hQy9+Q3vtxDAskvfIbeH4BdIZbBeDZyDZyc8buH/8jWgyj1xaWTEpK1lkKOBD+GbmFDv7702bU92rj0VsN3MitLELmjKB1YC3tPjqp8tbrKZAtNJMao7ZLZqUh/mh
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(366004)(396003)(136003)(346002)(39860400002)(451199021)(53546011)(54906003)(83380400001)(478600001)(7696005)(66476007)(71200400001)(55016003)(26005)(6506007)(9686003)(66556008)(64756008)(66946007)(66446008)(76116006)(316002)(4326008)(110136005)(186003)(7416002)(122000001)(41300700001)(8676002)(5660300002)(52536014)(38070700005)(8936002)(38100700002)(2906002)(33656002)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jTYb8u57G/g7AlYIsa8kBu4Y83NLL4TrbuKDQWEnWhk2//5em+vOBeyyI6Qo?=
 =?us-ascii?Q?xLujRDgH4ijvgYGvtYG+s/RwE7f83uhL7lFsn7jXwuM6TEUBffZF8p/g3Bug?=
 =?us-ascii?Q?GSBxeZmSamz9PtfZJFMpR4L7iWvKZiqdFxTstr5to/C/p2Y08XTlPR88Kt1o?=
 =?us-ascii?Q?49zj5ZifRCkfdHYtPRfN4p9ecRmzZNsJr6E9TouT3xyAKJ/4PgU9Juo+j00A?=
 =?us-ascii?Q?vd+VjYB7dGQYME/lOoLmfaBcZvpjQeNwytiV8nUApJRhilOdO1q4gqxVDK1R?=
 =?us-ascii?Q?I5nK9tOZoJpqcGlelKLUv1EyjAKkCQFOLvM/R70RmigtuIwio9OWoWw7Y3a9?=
 =?us-ascii?Q?fIhh1k9OMn2Rbo1ODswmBaeah5sh9YKZTKbY0VJ4Uo8DJtoSKq5gn0lftvV2?=
 =?us-ascii?Q?leLxQvvPghrcFRk/oX+GbPaOsnGVYF0ddAUPGlFnmIQPtIl7yDNril4nxwWy?=
 =?us-ascii?Q?1ZI71Y8FioK3seZuw5JkHiBLK9bb6lBuEkqHGscYAiNg2FUiyeykz9Pn04il?=
 =?us-ascii?Q?0zvGbMrm1aPJReDZ/IyiJXAsDPIr69tGNrAZNUf+RUZR/2iHBwX3BAB1xn6a?=
 =?us-ascii?Q?QnnDe1oWDIbF8YCA7ApA+Eed4dc6T04enzAT+B3VU5CMNO4zzYu2h0NtN1QY?=
 =?us-ascii?Q?4D8vPQi8Dj8MxfgSloKLKItGMioxD6lEv5NqiimcPoSPMF45LYZLoZ8D5X+o?=
 =?us-ascii?Q?LYH4Ag+cD+xrFwJNLzAti1yAZOWDK6VpX3VrQPLiJt4/yB1SjkL9udet0KFg?=
 =?us-ascii?Q?MehpbRXiZYkBzsipCKqxlYKl9TSVyDiQ11KsaATHIvaRk+Pq4wn/3dnVI5H2?=
 =?us-ascii?Q?GuSHUHSrE42pKZHVT13VOezoFT5aAg4bCm67A9T5KKvGOADTn3UDhMkEXwUu?=
 =?us-ascii?Q?GSrOK/K4jqd1GR3R6IXAD7xg53o1bDJ6ELA4XuHtljuT7cdO5KvRKE1/LTWD?=
 =?us-ascii?Q?xoXm8X7CRivm+RR1WJ9coRBf3R/qoW8UUEL1Rj0RO6WbpAd4FyKf6V6UzjCE?=
 =?us-ascii?Q?U3QpPAoQQ9vdh8eKcN/8Ew+VQjh6cARe33bLlSfgKYyI34TbXesnK/ETlYpk?=
 =?us-ascii?Q?qGmoOrBrgO7ifYiyuGNuEO8Zyf+WRBPVy+IG+Rj1DczQgO6kpnnRYpwMP0lq?=
 =?us-ascii?Q?JVP8JQNcYb+JaanCE0w3NeKK5CgV7GHhjFn1hEOjzlwEj39BsKgWSCyYzDs3?=
 =?us-ascii?Q?Dv0NhbXggARnBzDIzu/3vC76AiO9xdzppVnYAIDwA7jEOJ+G1LYl107WtgLb?=
 =?us-ascii?Q?kCrqwL7DtA0fj2qHshsLvRkMXmbFBGG22Xhgt4U3A8lcSq0txSaT6e5b5qKe?=
 =?us-ascii?Q?DWAO8UKUQ9e6MzpnFAo5otTplz3PbwXJQIE0MhB8pusnLvBgJ+txzYGYR5jz?=
 =?us-ascii?Q?nazjOv+ZRFY2zb30wN/iakQykt1nQ8DbXU+zljzyQOpia0ZDmtJhlF2YumUx?=
 =?us-ascii?Q?7BBekmL9Lu0P65rXDF/OZuLL5kt0oeK1eTnylmqz55lA95EqCs1MFiNV2crh?=
 =?us-ascii?Q?217qwjIo+o7DXScyqZwT4JfL8ozLez86VTFFXYMfTTKdeVn21zP9072Ud1bg?=
 =?us-ascii?Q?gkYD1HeHoYaMX0HvokRjgyg/nN8kWjiW6e1bcHLV?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?us-ascii?Q?q3rtgxHB+3z3lXkkaZRjWgB7SB6up7t6zU0nVl93arX5nbrAxP14vHvm2YpH?=
 =?us-ascii?Q?d4ZZzykH4yTbXRh+e8IVL4HCUYhunz837M3lhm90waN02aW0KJCYAy0wyv0y?=
 =?us-ascii?Q?R5o82HNjKPjR52UB/f+DK1bAB5Q7r83GYsunnrkPRZ7fcPkh3214/2g8iZRT?=
 =?us-ascii?Q?DeJeMu6MrnGZSq0ZKcUVBLZaNpwMEsSd6NuQQUOQGfC+b5xZ/ap8mYd3wd9+?=
 =?us-ascii?Q?9E2vDj8Dtt4arLyg6M8hCeg3Y+4RoQLmUTAMexa1kDpWoXszVVSbPJKp/rXt?=
 =?us-ascii?Q?xLz6UYCj8aQqZc23tLbffuXBZ10+8ihBDD4BfeII3gEuZbvcyOBRTJnOJ0WW?=
 =?us-ascii?Q?JfA7zgmM8e4wmC+2L8ayEbR3WRy8+eDQ8uViLfJnO+UcrC7JV9NHt48WUOJ+?=
 =?us-ascii?Q?WfyTj3vSNY3LITVp97NIVPTcQyO7UutAnUg7Jh4gBPnF1wDCOHIW+qpRy5op?=
 =?us-ascii?Q?M7xS2VsmzFt6yyqr0mbyhBtOvMvSySWRM0wAjrXWKYtSng8Y76YVFjiD8DZy?=
 =?us-ascii?Q?TABd4YLEaa3Udiz3BIPrEBcc8G4mX6CF9HumDsKo3+jKOHgXucwavcph/1ig?=
 =?us-ascii?Q?JPPRdTda6ngG4pF296vPyazAhRCYRTWdUggJDxB1A/+OoZUk6FZMEfnD2ixa?=
 =?us-ascii?Q?4+rkIxerHH5vAU3CcYmKmTZWiHNibynvEPiFIc/vgxOJds680fvtBgxo/6UE?=
 =?us-ascii?Q?+zDtfuycnIMKxbnsKag3i5wf3Vdgv4mU6nm+jjkEoPX8O9ZXzybD2Mui/Q+B?=
 =?us-ascii?Q?9tAwTZU/OfZ86UM/3HUTvfYyPBEcUxIlrW3CqFbi6VtQu/lGaOEi82TMyxH6?=
 =?us-ascii?Q?2Guaz9TDputCk4cBUXH7LVYvK7EGk7517C27iQDiLHxisjvyQuHWXSlxihKx?=
 =?us-ascii?Q?XbIFYNfaqHpyRXWyBy989bsJ4dvNmze3dArtmN8t9flSG68z8plEMpsXtNki?=
 =?us-ascii?Q?U5QOpzkIp2I0uZuS8AvS9omYoaEXzOpb1kb192YAJWDt0d940ASN/QCD3rcm?=
 =?us-ascii?Q?hlkL?=
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54ab1926-0bd9-4e98-28b9-08db4b236c77
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 May 2023 15:39:31.8659 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 729JVCicQBrnscVeu2JsSfLDvu5EtqNcHsT19RJ27lTt66dT/mrN286Mo6kRkfoDVyDiCKZNKWWsHz8EHOlf3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR02MB8115
X-Proofpoint-GUID: JGn0kwE-jZGfcuQGVHWKnTuw-oWFMZxe
X-Proofpoint-ORIG-GUID: JGn0kwE-jZGfcuQGVHWKnTuw-oWFMZxe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-02_09,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 mlxscore=0 mlxlogscore=730 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305020131
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=tsimpson@quicinc.com; helo=mx0b-0031df01.pphosted.com
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
> From: Richard Henderson <richard.henderson@linaro.org>
> Sent: Tuesday, May 2, 2023 8:58 AM
> To: qemu-devel@nongnu.org
> Cc: mrolnik@gmail.com; edgar.iglesias@gmail.com; Taylor Simpson
> <tsimpson@quicinc.com>; ale@rev.ng; anjo@rev.ng; laurent@vivier.eu;
> philmd@linaro.org; jiaxun.yang@flygoat.com; david@redhat.com;
> iii@linux.ibm.com; thuth@redhat.com; mark.cave-ayland@ilande.co.uk;
> atar4qemu@gmail.com; jcmvbkbc@gmail.com
> Subject: [PATCH 9/9] tcg: Remove compatability helpers for qemu ld/st
>=20
> Remove the old interfaces with the implicit MemOp argument.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/tcg/tcg-op.h | 55 --------------------------------------------
>  1 file changed, 55 deletions(-)
>=20
> diff --git a/include/tcg/tcg-op.h b/include/tcg/tcg-op.h index
> dff17c7072..4401fa493c 100644
> --- a/include/tcg/tcg-op.h
> +++ b/include/tcg/tcg-op.h
> @@ -841,61 +841,6 @@ void tcg_gen_qemu_st_i64(TCGv_i64, TCGv,
> TCGArg, MemOp);  void tcg_gen_qemu_ld_i128(TCGv_i128, TCGv, TCGArg,
> MemOp);  void tcg_gen_qemu_st_i128(TCGv_i128, TCGv, TCGArg, MemOp);
>=20
> -static inline void tcg_gen_qemu_ld8u(TCGv ret, TCGv addr, int mem_index)
> -{
> -    tcg_gen_qemu_ld_tl(ret, addr, mem_index, MO_UB);
> -}
> -
> -static inline void tcg_gen_qemu_ld8s(TCGv ret, TCGv addr, int mem_index)
> -{
> -    tcg_gen_qemu_ld_tl(ret, addr, mem_index, MO_SB);
> -}
> -
> -static inline void tcg_gen_qemu_ld16u(TCGv ret, TCGv addr, int
> mem_index) -{
> -    tcg_gen_qemu_ld_tl(ret, addr, mem_index, MO_TEUW);
> -}
> -
> -static inline void tcg_gen_qemu_ld16s(TCGv ret, TCGv addr, int mem_index=
)
> -{
> -    tcg_gen_qemu_ld_tl(ret, addr, mem_index, MO_TESW);
> -}
> -
> -static inline void tcg_gen_qemu_ld32u(TCGv ret, TCGv addr, int
> mem_index) -{
> -    tcg_gen_qemu_ld_tl(ret, addr, mem_index, MO_TEUL);
> -}
> -
> -static inline void tcg_gen_qemu_ld32s(TCGv ret, TCGv addr, int mem_index=
)
> -{
> -    tcg_gen_qemu_ld_tl(ret, addr, mem_index, MO_TESL);
> -}
> -
> -static inline void tcg_gen_qemu_ld64(TCGv_i64 ret, TCGv addr, int
> mem_index) -{
> -    tcg_gen_qemu_ld_i64(ret, addr, mem_index, MO_TEUQ);
> -}
> -
> -static inline void tcg_gen_qemu_st8(TCGv arg, TCGv addr, int mem_index) =
-
> {
> -    tcg_gen_qemu_st_tl(arg, addr, mem_index, MO_UB);
> -}
> -
> -static inline void tcg_gen_qemu_st16(TCGv arg, TCGv addr, int mem_index)
> -{
> -    tcg_gen_qemu_st_tl(arg, addr, mem_index, MO_TEUW);
> -}
> -
> -static inline void tcg_gen_qemu_st32(TCGv arg, TCGv addr, int mem_index)
> -{
> -    tcg_gen_qemu_st_tl(arg, addr, mem_index, MO_TEUL);
> -}
> -
> -static inline void tcg_gen_qemu_st64(TCGv_i64 arg, TCGv addr, int
> mem_index) -{
> -    tcg_gen_qemu_st_i64(arg, addr, mem_index, MO_TEUQ);
> -}
> -
>  void tcg_gen_atomic_cmpxchg_i32(TCGv_i32, TCGv, TCGv_i32, TCGv_i32,
>                                  TCGArg, MemOp);  void
> tcg_gen_atomic_cmpxchg_i64(TCGv_i64, TCGv, TCGv_i64, TCGv_i64,


Is the intent that all loads use tcg_gen_qemu_ld_* and all stores use tcg_g=
en_qemu_st_*?

If so, there are other helpers to remove.  For example,
    tcg_gen_ld32u_i64
    tcg_gen_st8_i64

Thanks,
Taylor


