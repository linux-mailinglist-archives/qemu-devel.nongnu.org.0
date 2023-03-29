Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 121DE6CEF9F
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 18:40:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phYqC-0006bA-VZ; Wed, 29 Mar 2023 12:40:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1phYq6-0006ax-Ii
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 12:39:58 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1phYq3-0003hf-E3
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 12:39:57 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32TEOwRu018062; Wed, 29 Mar 2023 16:39:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=jrq5GHa3ExN7Oy4FjnwLTWkzy9fK6JhHaj1U6PWqgZ8=;
 b=eQI9PZAsWHCasDhyfuXUWQo6V89ZW8p2ClsH++cJFtpOT/n65woaIaNXtS5UFLcpCgzg
 hhoTcU9XL1J4yrOEsZuhBegNWlbJ3alkvo5PnHlM8NMiZpnuVLmozMBmlsSLjHXpnyn/
 lbqEwiUAZfLbtKZGfWhglF77oSEHP2mmW/5gWJCeY/kBj/aoO+VJWWYes0cJg3If5MA/
 JncwOQVJ1jupdSmnoVmJb5he02elV3IXhjyKoRJPFZmunqPsuTlGQbddIdtGr4apu7PT
 4kUhj07zc/TmkmE2LSSbq+GxkFIS0LD4O1ApTQ1BQSQgeKpQoJvRR1sL5D3f2w/7Mr+m Mw== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2106.outbound.protection.outlook.com [104.47.70.106])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pmq1wrdcr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Mar 2023 16:39:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VL60cSAduA01dJIZjFF5vS/nqJskXNwNKytywLrxboJleHeamf9SOcfMVfi7lzuIcALnMDiu2qr+ukbrRPixR3XyN5Hq7hUmx4twAsoXzwuTnOtlkSpA7jSrgYkMQdzGwQvREDIBFkjarFoWCFSSXvqoqV2PuuFcHHMX4c7ZOifQkVZVXmpvqH0eqFph0JqSGPM5VHHyID+0Fp+sEgbivTAXO25O5MJkytwoGVv1wuHa3yKVKw/4eIgX94NMEaPVeghrTu9WkZl+Fm1JFcfA8q/bl5hWAJ5ccIQ0pEpmFF45aewcgevz3hoqoXiA/C5aGlNYFWqi4S/m1AxuGdMAjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jrq5GHa3ExN7Oy4FjnwLTWkzy9fK6JhHaj1U6PWqgZ8=;
 b=i8AaBdc//W5shhJIoNub2nQkalnXUzMjveT11s1KXF0lk9mDL/Le7KVn0JUXN9UZaT/gEGKVCxN9bw6amiCbqsraM8OlTSWlUJ2LrqJr3aidqOLKC+rsMwsBeZaGV4Ec6POqiYfSQvCQwonDpEBHP8GWdu8U49D0XahlryhGA5L6EAdtZf2V8SkuhBi5IPvyBTKMBKx6NHtukH0nxwMqGGeqMpfmcK4nxquefCbbR8rhZycdGKDV5g2xnZPyREHLz0a/A0h1Vx8TWJDHWeDfTGB7YHkRvJg3NA7sqiuian2ZwrW1KURpDNns9ynUvNoEoMtdYO80lxeJKaLkiDMc/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by SA0PR02MB7372.namprd02.prod.outlook.com
 (2603:10b6:806:eb::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.31; Wed, 29 Mar
 2023 16:39:48 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::eb63:d1c0:28de:72f5]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::eb63:d1c0:28de:72f5%8]) with mapi id 15.20.6222.035; Wed, 29 Mar 2023
 16:39:48 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: =?utf-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, "Marco Liebel
 (QUIC)" <quic_mliebel@quicinc.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Brian Cain
 <bcain@quicinc.com>,
 "Matheus Bernardino (QUIC)" <quic_mathbern@quicinc.com>
Subject: RE: [PATCH] Use hexagon toolchain version 16.0.0
Thread-Topic: [PATCH] Use hexagon toolchain version 16.0.0
Thread-Index: AQHZYknUENibOd2BqUaJj+r/j0WWwK8R8+0AgAABDyA=
Date: Wed, 29 Mar 2023 16:39:47 +0000
Message-ID: <SN4PR0201MB88081861438C9226DA21B96EDE899@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20230329142108.1199509-1-quic_mliebel@quicinc.com>
 <87fs9nqzyf.fsf@linaro.org>
In-Reply-To: <87fs9nqzyf.fsf@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|SA0PR02MB7372:EE_
x-ms-office365-filtering-correlation-id: 07171061-44ee-4ec9-95aa-08db307435ce
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7I0SZjHGuTsIGDNaEmOXX/NeIKXfaVFnTaSzrZjAhYlHeiTMMlR2V+TZaDvSSAgOan08CBpihfiNpbqKHMfcegBUoWEthlIFQJ7FOlj+lDaKMRzZqy20+KYd0ccdfOguL2Ewd6883FZH/fhqCzvpQqtmzvYhPfTF6Rq6NDP6Sy8JwzrlHnkVy3w8o5kK6Rc85/M6102Y2Ss3ajTF2TD7YXLklfLjgXTgumxzwlUdqOpF/LH2gmsJV9wvhxFRat4eRLrz/LWY36dGCsW/YtzGaZdc10IQ0BiVr0wAlgblpjcPFaQ95LtZnrPrWedt793MEeSe6dpZW9W8SAPPnSJN3SiKPuRhCV1MoJ7WJuN2QKXh+S3uP+6SH0bpuZV7eQs0zEY3cLA486Pump4sDF65HG4HWcwHx/g1kBqlZZqaBn9ENmD9YpF9hTcVM4dv5EWpenpTiVGOgxlVq0YS6LezXaOPuVH8iQw0CTx9D1m+8mbSbD/7vKiEByC3cTBlrceRbLHcL+9KyPyCB0Sexs5OFC0qR7BzHHT+eGSPS35LRLAwN+5ZlSbr9mEOy1Bo7BpycPc+NbEGwk4xhsngP3B8WGo0Mes3/53esQHH2n3lqnM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(346002)(366004)(136003)(396003)(376002)(451199021)(478600001)(107886003)(5660300002)(66476007)(64756008)(66946007)(76116006)(66556008)(66446008)(4326008)(186003)(316002)(26005)(52536014)(122000001)(41300700001)(8936002)(54906003)(83380400001)(7696005)(8676002)(53546011)(66574015)(966005)(6636002)(9686003)(110136005)(71200400001)(6506007)(55016003)(38070700005)(33656002)(38100700002)(86362001)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dzJ3MjdBQ0M3eTVtc05qckJhNVJwK0p0T1pmOW5ma1VibnlYOFhwRmEyUmJ5?=
 =?utf-8?B?NmdUV2kvTmMxTDhQbE9TR3lDOFhJTzVOSzR4RjUxSCs2S3YrTnluODlIK3dX?=
 =?utf-8?B?cWsvcjJBS2p5Z0dTS2NxUlIwcGhZSmpDNTFPSzdHK2FYRWhTdTZ6My9ESWY3?=
 =?utf-8?B?bmhac0xXS25ua2QyMjcwWGs5OElJbHN3c2FTNVVOaXhDOGJwY3VEVHRFTnhw?=
 =?utf-8?B?S2pqVGVYN3JqeHBjT3FyQXFVRDNuaXlHdnR2TGIzZHZzWG1udm45WVlHQUJx?=
 =?utf-8?B?WS91bDlObmN1UVdtVlFLamlGQ0p5c2V1cVhrS3NiNysvdVBLSWxqQ2JSMEQv?=
 =?utf-8?B?M3g1QTE0RmJ6ZUJETk1JUjlVYkttcmNWRnN2aGZXNlpUSklsSTVMSnVqdGZG?=
 =?utf-8?B?bWZkaCtMNG5PWHJXNGdZN2oyUXBqZ3dTS0VhdmZ4bnM1YkRtS3NNODh1UU9S?=
 =?utf-8?B?MU96TkdLY0x2TnVjckpRZVVkWjF2N24wRGJBcTlHRDU3ZXJNNTRwYVJRTXBU?=
 =?utf-8?B?eTQwanhGLy9iTm9odUxVRDVMZWNsNjlTdEJCS3I4UXhCOE5yVWlueTc0clEr?=
 =?utf-8?B?SnNFMktILzdNMi9UeEZ5aTdJTjdVM2tsMlI3RWthbEVzZ0J0T1VjTWhEdFFP?=
 =?utf-8?B?R0ZuaXVrZHhDQ3hlLzJIMlYrZkVCWFM4eEh2RGRCT2VtWm5rampUVmxCOFJJ?=
 =?utf-8?B?U01nNkt1K3pRUkJRMW5MWW1TMXNwQmJhOUdiWHAxMnZ4Rm10Tm94azFFZ1Rl?=
 =?utf-8?B?eDRCTHJMV1B5WmpkZXFycDcxNzQrOXdQNDBxZkdPL2hNa3djU002OEVoTEc5?=
 =?utf-8?B?S1YrdG5VcGxnQXdjQ01oUnh6ZWl0eG9GeUpHSHdVN2NBUWpjbzQ3TGZwM0Mv?=
 =?utf-8?B?RzUweXRpalRGRjJPUC9LQUF0QjFtYmp4NWpkZGJUWkFJVzlEdERXTUJGTXp1?=
 =?utf-8?B?UVJjcDdxdEtxcjVEVTBrRWJFWmU2aS9qNkdHMEJVTTQ2WTFnd1dLKytFeDRk?=
 =?utf-8?B?UTJxV1BQY2VQQkNvcG12RFVXVmNld2VqME9lUzB0bnE2aFdhQ2p5QzZYc1JD?=
 =?utf-8?B?ZzJPSTRRbXRaMWdBODBEek9ralljdzBrMWVnUUtDaHR0eHk5NnpNMFFiWDVC?=
 =?utf-8?B?ZDVkNjVxZU80NzA2V04rTm9mN2ZLS3ZQbGQwSk04djBsY1RCTDRaTUg2WjFO?=
 =?utf-8?B?M1BJVTRPbUVEWEQrdDc3M1E2OUd6TUt1LzlkZ1ZBcUs2TTk4NVc2aWZyMUVH?=
 =?utf-8?B?LzB6ZGNEVEhOaTZJZGFCOTNZVGVMeGtPVXgvaXNJdXFDMkQvTFRCZ2lMVDQv?=
 =?utf-8?B?cEpuUWdZb2hXWVMydE9DeEpkeXp5djA0UC8rK0pRZ2RRcFM1dVBYRWtTT2tD?=
 =?utf-8?B?dUZpQVg5UGVleHpVZ3NtVDhzRGR2dE9DZEVpUkw0bFkvLzVBUnhaQkJTTElQ?=
 =?utf-8?B?SHI2QUVzN29uYWdUTnR0elpyNEtqMDY3MWsraGpQc1dJRG5uUEtveWNmNHBX?=
 =?utf-8?B?dC9mNWF2a05pNitOcy9sdGJaN1FBTzlrTnh2RXFIZzlIdDdETHRONTU4OXF0?=
 =?utf-8?B?S2xiQVNrMVgrQjhDMnAvK3g4NlNubFZmaEYvRlNsbXZUT2xLNGZ0WDZYeXVm?=
 =?utf-8?B?eXRLck11Z2pneEMxcHcwY1QwRWNVTTFTWk9ocU1PMDYvSFFZLzREZFU0T2Rz?=
 =?utf-8?B?a3c5RlVSQTlEQ3RrNVBjVlNrVllabHBJYzhRb0dJNmprTjJqTmFGSFR5VUpp?=
 =?utf-8?B?eEw2Qzg0anpuM1BOMEg3Rlk3T0tPZUZvRU5ZYUJ3ZERyTFBaQTNaZGJkbkx3?=
 =?utf-8?B?VzFIY3lUMWlZSmZnRVFzZlZFbkVrQXo2SWVveExXdjNwbUdEZk9OdFQrSXMx?=
 =?utf-8?B?L3kvMjZOaVNBdmdNSkhXSXluSVh5QjhTcmd1TlBjQ2hqUjNCdWdHMkFNTHl0?=
 =?utf-8?B?dEc2T2JrcSt1SVhJRWh6ZWpJbG05VUFxU2ZKc2NPR0Vja3dpYkhaT1k1eWFs?=
 =?utf-8?B?ZlA3YTZUYmtuZk9OUWZIdzBLT3BodFd0ekhpNGQwRUpEenRRSnBWT25JRjhp?=
 =?utf-8?B?MFVSaFN5ZXZKNlh2TmVFSkNrSytxamNoTkRrOElXbzZ2SDdzaUpjWmkrSWxM?=
 =?utf-8?Q?EAIs1p+SH4W+zB+tTq2qLKC9w?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: WU4uJPgnH4H2bChoY1EfUnAjB4xeXWSs3nePSXJ6yc598hSA7jyTPsZgakMQMJerNqmVUsXvEpK35AA1bEwX46QbYfJnoCH6tzKgQ1I3rXMxhfXOrfu+qm19n/dfVoVLCMQnRUYaFgwvR/utR2UaytR/jIjTUhjvgVejpW8eTxCSP6U52aOqiL8XezMIVs6p6hL6BXy/hzQKdMsVs5dX2SMyETwZHmGcEQPn/zk1a7DJSInK7k50J9aczBil/sxXVG8h6ZqXGeepNYeH2QAmQy1ArCQfY3qpvBf6A2zjubXlwzUxgliXO0Jn7qbM06eSp0W4r5Xc4qDO7eN1kgx18lS15KQ5j0v3qA+K9GJnAYc4iVvNhWr2bgvZrXIfz6sEV1Xrr4vwrM7nJGTD8gzzRja8bqPn4uLWYFLfL98Fjmd3Ul+I4XivdSYB5GYIp89dQoKW4TDFR1Qd0EgFj5qSTBNCnP9YwF5ZWbcMselzJh7soAqsILUEfESJdz/0WrHooyigW/FxhIFHnm7p51w44cF3kn59lwZgN14sKk0eCU0cp4cGO/jzeVloefl9pan3s22bvTr5btZ86gaGphsrDnUtwBNnlOmwTAgs39LmtzqFN/aGr8wWS9Lj4b9sB9nAWpeO9doXiXqjbJLkPmBJ9Vvv6rWddAMzvN085vlV1Fd+KFwY2pJQXRsiwAfb+pQ6QV2xgEgltU+w1R/O4Aoomf96iwWS5tNWL9NG1abs99ci95ujLW/uhTEF9v5hIALBuyTohremJT/hCsoCAPAhHLdYg51UpG6sSlkb8BUTc18=
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07171061-44ee-4ec9-95aa-08db307435ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2023 16:39:47.9699 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wBztNfYaEdcngTd1BhJrAYETGAaO45rDdetgrnBJMAqxcL7c8hwn4HtJgmOV1QptUT0UJ0LEb6XsNsH10aI/FA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR02MB7372
X-Proofpoint-ORIG-GUID: bS1ILIJVepqYTnqrMjK2WYS_sSpvKskW
X-Proofpoint-GUID: bS1ILIJVepqYTnqrMjK2WYS_sSpvKskW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-29_10,2023-03-28_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 suspectscore=0 mlxscore=0 mlxlogscore=999 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303290129
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQWxleCBCZW5uw6llIDxh
bGV4LmJlbm5lZUBsaW5hcm8ub3JnPg0KPiBTZW50OiBXZWRuZXNkYXksIE1hcmNoIDI5LCAyMDIz
IDEwOjM0IEFNDQo+IFRvOiBNYXJjbyBMaWViZWwgKFFVSUMpIDxxdWljX21saWViZWxAcXVpY2lu
Yy5jb20+DQo+IENjOiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2luYy5jb20+OyBxZW11
LWRldmVsQG5vbmdudS5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gVXNlIGhleGFnb24gdG9v
bGNoYWluIHZlcnNpb24gMTYuMC4wDQo+IA0KPiBNYXJjbyBMaWViZWwgPHF1aWNfbWxpZWJlbEBx
dWljaW5jLmNvbT4gd3JpdGVzOg0KPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBNYXJjbyBMaWViZWwg
PHF1aWNfbWxpZWJlbEBxdWljaW5jLmNvbT4NCj4gPiAtLS0NCj4gPiAgdGVzdHMvZG9ja2VyL2Rv
Y2tlcmZpbGVzL2RlYmlhbi1oZXhhZ29uLWNyb3NzLmRvY2tlciB8IDIgKy0NCj4gPiAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4NCj4gPiBkaWZmIC0t
Z2l0IGEvdGVzdHMvZG9ja2VyL2RvY2tlcmZpbGVzL2RlYmlhbi1oZXhhZ29uLWNyb3NzLmRvY2tl
cg0KPiA+IGIvdGVzdHMvZG9ja2VyL2RvY2tlcmZpbGVzL2RlYmlhbi1oZXhhZ29uLWNyb3NzLmRv
Y2tlcg0KPiA+IGluZGV4IDUzMDhjY2I4ZmUuLmI5OWQ5OWY5NDMgMTAwNjQ0DQo+ID4gLS0tIGEv
dGVzdHMvZG9ja2VyL2RvY2tlcmZpbGVzL2RlYmlhbi1oZXhhZ29uLWNyb3NzLmRvY2tlcg0KPiA+
ICsrKyBiL3Rlc3RzL2RvY2tlci9kb2NrZXJmaWxlcy9kZWJpYW4taGV4YWdvbi1jcm9zcy5kb2Nr
ZXINCj4gPiBAQCAtMjcsNyArMjcsNyBAQCBSVU4gYXB0LWdldCB1cGRhdGUgJiYgXA0KPiA+DQo+
ID4NCj4gPiAgRU5WIFRPT0xDSEFJTl9JTlNUQUxMIC9vcHQNCj4gPiAtRU5WIFRPT0xDSEFJTl9S
RUxFQVNFIDE1LjAuMw0KPiA+ICtFTlYgVE9PTENIQUlOX1JFTEVBU0UgMTYuMC4wDQo+ID4gIEVO
ViBUT09MQ0hBSU5fQkFTRU5BTUUgImNsYW5nK2xsdm0tJHtUT09MQ0hBSU5fUkVMRUFTRX0tY3Jv
c3MtDQo+IGhleGFnb24tdW5rbm93bi1saW51eC1tdXNsIg0KPiA+ICBFTlYgVE9PTENIQUlOX1VS
TA0KPiA+IGh0dHBzOi8vY29kZWxpbmFyby5qZnJvZy5pby9hcnRpZmFjdG9yeS9jb2RlbGluYXJv
LXRvb2xjaGFpbi1mb3ItDQo+IGhleGFnb24vdiR7VE9PTENIQUlOX1JFTEVBU0V9LyR7VE9PTENI
QUlOX0JBU0VOQU1FfS50YXIueHoNCj4gDQo+IFF1ZXVlZCB0byBmb3ItOC4wL21vcmUtbWlzYy1m
aXhlcywgdGhhbmtzLg0KDQpUaGFua3MgQWxleCENCg0KVGhpcyB0b29sY2hhaW4gc3VwcG9ydHMg
dXAgdG8gSGV4YWdvbiB2ZXJzaW9uIHY3NS4gIEknbGwgc3RhcnQgcHJlcGFyaW5nIHBhdGNoZXMg
dG8gYWRkIHN1cHBvcnQgZm9yIHRoZSBuZXcgaW5zdHJ1Y3Rpb25zIHRvIHRhcmdldC9oZXhhZ29u
Lg0KDQpUYXlsb3INCg0K

