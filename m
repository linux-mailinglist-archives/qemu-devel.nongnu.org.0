Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B550661E6AB
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Nov 2022 22:47:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ornTH-00071I-I5; Sun, 06 Nov 2022 16:46:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1ornTF-00070r-Oe
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 16:46:25 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1ornTD-0006qC-MG
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 16:46:25 -0500
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2A6Lg2R3031838; Sun, 6 Nov 2022 21:46:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=//n9q2TENNwuvVs5Ef7kMKGl3YpysNJGJWSUBoMResE=;
 b=cA0LSqyQ+vCe0DKuje5j/e9z2BC3DCj93gQZ9+JfBGqVMEjMCHDEyrzMtjpiiDnr7ODg
 tE4wQr2ZuBo80KyEMrJR5kvoIwSiFBzgCE/FNYKKnc4NtTDlpFYVMHc5IowRWG66a+vA
 apqRXZM/EMUE2oBsD6sw6yZVBXyaKvZ/Bmi0KqjuhRr/zVjPHasFNHG33UxOHXFdLP53
 ijbc/lb19KKjLaPQ7LvG9iyXd9Qj5ttDvBTcObaZ1jYG178OhyS7r31+T2hEAZm41gZ4
 MHltAsWf3XLgXlkeoHIzp7vTXCN4rAjEZDpkw2rHbfVUyvmfUwjxCgQzr3OJES2FFGEJ 6w== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kphfv063y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 06 Nov 2022 21:46:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CKj5tbL62Xjsa3jf5vjMb5TG5bLn0nhmRb4RGQAL69FzCq0nvCg/Da77MRbtdNPnyIyExBFArh6yqpnVug99hk9ueN07gbsJt0z7T5i4ypTmiFqWkx+cUGfgvwVVHnmmaHfhbxnioNuhX0PDZdVa98nIQWXsvFc5y4nW/N5DEN6Jhx6j1tVK6TVDFSrKZI5rN2xkHjz1HYWWWdeGo9P4PV7zQqfgy1b6byTzCvgHGCvwZh8iEfFWCJ49pBLx1YLkRQFVzc4BlkBPPRxaz4MA0UPUjHnlIlsRK3KkUmPxqxYBTkLCAOOLQ/4EojTbRQ61X4lYJT5+HZ55TxQ/Oo/XQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=//n9q2TENNwuvVs5Ef7kMKGl3YpysNJGJWSUBoMResE=;
 b=EV6lWSB4eHaaOUg0erV0Yt6u5cwkGsML8t2LboILO1nxmVLGITt4Snp+ASWnFInMtCX2BQNU1bZ8hvKc1QyCIdQ6g6YnnZt78LxUueey44RnFWIaMMdg0tr4FaQ/1Y7VKqV6WyIEwef3GRQyhI6DA4cx1Yq6QvYWJTwLZNMZMjR9OHPXEWjYCPIYBcR0PNcdqn1CV/eaXBFTjD+4oTj6c2LIPPqiPgSPiAYFyeoitUmdxVMz7VqCl3ssqc+S4+RyjMGBhUurDXslvoHVSmFIdeC5QfVSUYXqBPmOFiBcME1zimwXxznmmUX14gkCbfibpxpNbbI71WpQLF9MWTE0Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by CH0PR02MB8105.namprd02.prod.outlook.com
 (2603:10b6:610:10a::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.25; Sun, 6 Nov
 2022 21:46:15 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::caac:2d02:279d:4270]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::caac:2d02:279d:4270%9]) with mapi id 15.20.5791.025; Sun, 6 Nov 2022
 21:46:15 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: "philmd@linaro.org" <philmd@linaro.org>, "ale@rev.ng" <ale@rev.ng>,
 "anjo@rev.ng" <anjo@rev.ng>, Brian Cain <bcain@quicinc.com>, "Matheus
 Bernardino (QUIC)" <quic_mathbern@quicinc.com>
Subject: RE: [PATCH v3 10/11] Hexagon (target/hexagon) Use direct block
 chaining for direct jump/branch
Thread-Topic: [PATCH v3 10/11] Hexagon (target/hexagon) Use direct block
 chaining for direct jump/branch
Thread-Index: AQHY8INcYE/JDqqEO0qP3TG4SJrG864vjBGAgALZLMA=
Date: Sun, 6 Nov 2022 21:46:15 +0000
Message-ID: <SN4PR0201MB88083E624230CF8F24ACB47FDE3D9@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20221104192631.29434-1-tsimpson@quicinc.com>
 <20221104192631.29434-11-tsimpson@quicinc.com>
 <1a998d59-4302-06f9-c62f-aba2079a0238@linaro.org>
In-Reply-To: <1a998d59-4302-06f9-c62f-aba2079a0238@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|CH0PR02MB8105:EE_
x-ms-office365-filtering-correlation-id: a27f6d63-36e4-41de-13d6-08dac0405480
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: njrJbEaZMWvSjgdLuSAvihIatL/ZToLin9bdJewybPeo+5VD0wsV1bMZGcRhI75tzlhjH9MVOWjsiuu15dCtFp6Gbr+HK1wJkOjDMmoqG0LdLmCphjNJrs+0kIe3Etx6Xpazs5xLPiA0OZBIaW18f9EGpfsg04qotiGr7iH1zgaFEvmXNJFSM5prKzqETdU3nB2W/mqWpyGIPjdoHJJ27pVKYz4DdzmPPqQP2lb1rhNTNquZx4zJhN7N27/ZHhe23RRcCvr3rTtLSaEa8Fcb4hH3Suob4szM5BBYJ3Wx5WtTfEzF0rRIpE5zY/ZIdjEV1qvtTtSsLdfFMWxkNWCK/AJet1tqqajO0Q++eJt/0r6S3BYHmwO29S04S+Ui7PYOi7seFfMnnQcwAGidhRxgj1xqA1akNy4IoGJyHot18VDRlTqaQNgUYdl1dy6ECl5lkaG84+edEON4CzU9DbQntwDgNLwwx9aggiy9U1yuGtJD8omsSsrcDf9k99XyPo6xedvYH34X64f1rdtP8p4Zd2/rGWDtU3VgGNyArOo3TWvg5uMNomruItuMFR1ByWTAqEEkAhFcVcecM9Y9YrKbR2gboaJEp6lF6LOOnV1557o1MsHrBqTIPzB6eYZrhO++EQvEh5orf6onLOAzXzuViDeX3o8MQUNG6wNfwtAz7E/iDneZ/nB9Sdl74Mbtc7LIH3nzIxf89Yy9g0dnFUmNcw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(136003)(396003)(366004)(376002)(346002)(451199015)(53546011)(26005)(107886003)(6506007)(7696005)(186003)(9686003)(38100700002)(122000001)(83380400001)(5660300002)(2906002)(55016003)(54906003)(110136005)(478600001)(71200400001)(966005)(316002)(41300700001)(8936002)(52536014)(4326008)(8676002)(64756008)(66446008)(66476007)(66556008)(76116006)(66946007)(66899015)(33656002)(38070700005)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WGszeG5lSVZRSjNtTjU1d1FsaTV0YlFSemtOK2VXNVd1SmpuT0J0My9WQ0JP?=
 =?utf-8?B?dXVWQjhzNzJLUDRrc1g1WlgxMnlNZHZYYkxXUnA5RU9uS0oxcVZZR1dvSTQ4?=
 =?utf-8?B?UTJTK0w3ZHhEYktwWmxJMVNmQVluSUh4Z28vdUdhcGYrZkJQWDNyN3lBV2xC?=
 =?utf-8?B?aS9WSDBpazYxN2lKRXpUdUUrcHJSQmNkRWhITk1YZnFGWXNvZ1o0dTYzUVk2?=
 =?utf-8?B?TFAzTFNRVmNSeFBNUGFnMmZwODEwVjZ3eUpScHNvVlNyaHIyNi9oNS8xYUVh?=
 =?utf-8?B?MnpZbE8rZkVFcS82N0J2VXh3aGc2WnBGZGkxazFWZ3RRc1JBSm1KelFHdEx3?=
 =?utf-8?B?RE1FSTg0YU94T2JrdEhZMmRXRElKckJwQllNK0RySEp0bWJCTXMxc0c3TXRL?=
 =?utf-8?B?NDc5d1AvZG9IVTlkMDBBbFQzQnVrR1hxSWN0WFlJLzkvZXNWOEZuQ0t1NSs2?=
 =?utf-8?B?alZlQWhUZlZQQWhPT3JTOTdoWTJJaytvT3NqMksvWks5bmlmeGEybS9Cdm1M?=
 =?utf-8?B?QVpJdjR5TGM3M2FLbUx0SDM5SStIMWNVMjhMNVZ6RGdhZmI3aVdGaU5OWDZS?=
 =?utf-8?B?UEcrcUZMcWxDdUc2cHBFako2c04zbktaS3hZUWdvMnhEZ3NTMG5UaXBESHFD?=
 =?utf-8?B?ZWtsNTNMTlF4K0o5cXJxc2RjU3pkOWtHSkZnRC9LalFlaEZaMXdPTms0Z21t?=
 =?utf-8?B?RFdONWttTWdRejR1UW9YeG5pckpIQXdLcDhsc0gvVkFSQjd1eXJQQ1ZDVFNT?=
 =?utf-8?B?Uytaa3ZKRWYvaVFCY2ZnTllJbDFrUVphZStvYU55TURBc0UybGVvRTZxZ0ha?=
 =?utf-8?B?dWswM3B0MnowYkhrWTIyMEltL2NLdGJBdkRDRDNrak54Wk1INGVSK3dzbXN2?=
 =?utf-8?B?cUZwMmVEa2ROeXZzRXdmcjY2LzZHVWppbVR2NkFmazQ3SFJIeUcyekQ3VmVU?=
 =?utf-8?B?NmlwWk9GR2czdGx1M09kYzNJNEcxTSt5TlhxT3NYOEl3UXZWcWs3bFl2ckha?=
 =?utf-8?B?SkpmRWZQMTlrbEZ4UmNkYWdjV0M0WDhNRDlRWG9LT0R2K3QrS1Boby9KUHVy?=
 =?utf-8?B?dDdqSHJTUWwrSThMRmRuZG4zUExueFlocUZMbUx0ZGN5V2R2cU90Ky9OZkxP?=
 =?utf-8?B?SzZnQ3ZWQmZrWUVGOUd4dU9kdUFBa09KQWdmZHJmWkRhYnZEekhlUlJkU09h?=
 =?utf-8?B?U3hieHFmREdqTE1kWlh5UW9aSEdKei9uR2ZlS1J1RkhHeFV6NmlXQTh6dDAy?=
 =?utf-8?B?WUtnVmwyYWRTdGV0aHIvTGZTcHhuZFErUDhkbzZvYTB0NS9IbTJQODZiRDRi?=
 =?utf-8?B?MHBuTEpHWHp1dnRRUVVJZDBzTk8vQUZIRjljL2hkaWFFR1VyQXpWVm5aSHZv?=
 =?utf-8?B?aWUvNndQdjBqZXhES2RxclZFdzNmQzJWQ3B0VU40S0RjNXAxclJ1TmgwL1Bs?=
 =?utf-8?B?aTc3VGJkWi9lVmE5TzZQQXhMcEVObm1vNWtwdFRXUWZEYUMwQzhESWdqRTVU?=
 =?utf-8?B?R21Zc0J2QWJZUkdzblcvMFJaRUNIdzZDTXJPWGo2RFdzMS9rbEczdTZNVHpX?=
 =?utf-8?B?c3ZFdW9YdmsyanU4eUlONmJQTWhrVWUzRVpCSXZtUnFLV2hJSzhaVlFOYmE5?=
 =?utf-8?B?R2lvRGh2dXdKektGVTdjWUNDRjFzV1lIR3oyeXF5SWNhMFYzREpZSElWZW9S?=
 =?utf-8?B?eEdzMnFjSE84RHNPTXZ2d3EwMEc0eDZNcU9zL2NvNWZ1b0xwczZZL0RIMXNL?=
 =?utf-8?B?YWRuMUt6SHE3WlZ0YlNVVExsNkc5RWptdy9nRE1HaEROTWhSZ1plWXFJeGdS?=
 =?utf-8?B?dDNBTWdGMWM0QitlcCtYTzFuUEdQKzB1Q1NnZWNXeHFSanhUc0w0OWtVVEVm?=
 =?utf-8?B?UkxYSzNma3RUNUEvdmNzbWQ2NmdHb1gvK2NaU0hFOVZ1dzRpR2J6K1R4dWFH?=
 =?utf-8?B?M2xBREVpVWFHT1haRUhibGI4SVRtL2tVSzNYRTF1RGlPSGt4UUVFZDFmSDYz?=
 =?utf-8?B?c3M4WlB5aXdoU0d3WGZjSHJ1d3pwQnhtV1REbm11Y0lnVEI3NlM1S3Fzc1pY?=
 =?utf-8?B?TXdGeVB0NVV4NHFnNG9scFZPMTE1OXZyOG4zRENBUUVRdGltbm1LQzAwWTJk?=
 =?utf-8?Q?ZnpHP8vZLzjPZOyQe/vF42IKA?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a27f6d63-36e4-41de-13d6-08dac0405480
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2022 21:46:15.3841 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g8KDlF5g9UN58VrVe/Dv/x4dlEBmQK46i9ngcyetghXBg0wToEq/GO14eisuysnmqD4pG0tQLDK0kKmN1+AqHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR02MB8105
X-Proofpoint-ORIG-GUID: 8WnY2g_JQO8UWqey3qawipHo7KKK8oyR
X-Proofpoint-GUID: 8WnY2g_JQO8UWqey3qawipHo7KKK8oyR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-06_14,2022-11-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 phishscore=0 adultscore=0 priorityscore=1501 clxscore=1015 mlxscore=0
 malwarescore=0 mlxlogscore=999 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211060194
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=tsimpson@quicinc.com; helo=mx0b-0031df01.pphosted.com
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBIZW5kZXJz
b24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+IFNlbnQ6IEZyaWRheSwgTm92ZW1i
ZXIgNCwgMjAyMiA4OjMzIFBNDQo+IFRvOiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2lu
Yy5jb20+OyBxZW11LWRldmVsQG5vbmdudS5vcmcNCj4gQ2M6IHBoaWxtZEBsaW5hcm8ub3JnOyBh
bGVAcmV2Lm5nOyBhbmpvQHJldi5uZzsgQnJpYW4gQ2Fpbg0KPiA8YmNhaW5AcXVpY2luYy5jb20+
OyBNYXRoZXVzIEJlcm5hcmRpbm8gKFFVSUMpDQo+IDxxdWljX21hdGhiZXJuQHF1aWNpbmMuY29t
Pg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDEwLzExXSBIZXhhZ29uICh0YXJnZXQvaGV4YWdv
bikgVXNlIGRpcmVjdCBibG9jaw0KPiBjaGFpbmluZyBmb3IgZGlyZWN0IGp1bXAvYnJhbmNoDQo+
IA0KPiBPbiAxMS81LzIyIDA2OjI2LCBUYXlsb3IgU2ltcHNvbiB3cm90ZToNCj4gPiBEaXJlY3Qg
YmxvY2sgY2hhaW5pbmcgaXMgZG9jdW1lbnRlZCBoZXJlDQo+ID4gaHR0cHM6Ly9xZW11LnJlYWR0
aGVkb2NzLmlvL2VuL2xhdGVzdC9kZXZlbC90Y2cuaHRtbCNkaXJlY3QtYmxvY2stY2hhaQ0KPiA+
IG5pbmcNCj4gPg0KPiA+IFJlY2FsbCB0aGF0IEhleGFnb24gYWxsb3dzIHBhY2tldHMgd2l0aCBt
dWx0aXBsZSBqdW1wcyB3aGVyZSBvbmx5IHRoZQ0KPiA+IGZpcnN0IG9uZSB3aXRoIGEgdHJ1ZSBw
cmVkaWNhdGUgd2lsbCBhY3R1YWxseSBqdW1wLiAgU28sIHdlIGNhbiBvbmx5DQo+ID4gdXNlIGRp
cmVjdCBibG9jayBjaGFpbmluZyB3aGVuIHRoZSBwYWNrZXQgY29udGFpbnMgYSBzaW5nbGUgUEMt
cmVsYXRpdmUNCj4ganVtcC4NCj4gDQo+IE5vdCBxdWl0ZSBhY2N1cmF0ZS4NCj4gDQo+IE9ubHkg
dGhlIGZpcnN0IHR3byBkaXJlY3QgYnJhbmNoZXMgY2FuIHVzZSBkaXJlY3QgYmxvY2sgY2hhaW5p
bmcuICBPdGhlciBleGl0cw0KPiBmcm9tIHRoZSB0cmFuc2xhdGlvbiBibG9jayBjb3VsZCB1c2Ug
aW5kaXJlY3QgYmxvY2sgY2hhaW5pbmcNCj4gKHRjZ19nZW5fbG9va3VwX2FuZF9nb3RvX3B0ciku
ICBZb3UganVzdCBoYXZlIHRvIHJlbWVtYmVyIHdoaWNoIGlzDQo+IHRha2VuLg0KPiANCg0KSSds
bCB3b3JrIG9uIHRoZSB3b3JkaW5nIGluIHRoZSBjb21taXQgbWVzc2FnZS4gIFdoZW4gdGhlcmUg
aXMgYSBzaW5nbGUgUEMtcmVsYXRpdmUgYnJhbmNoIG9yIGp1bXAgaW4gdGhlIHBhY2tldCwgd2Ug
dXNlIHRjZ19nZW5fZ290b190Yi90Y2dfZ2VuX2V4aXRfdGIuICBPdGhlcndpc2UsIHdlIHVzZSB0
Y2dfZ2VuX2xvb2t1cF9hbmRfZ290b19wdHIuDQoNCg0KPiBUaGF0IHNhaWQsIHRoaXMgaXMgY2Vy
dGFpbmx5IGFuIGltcHJvdmVtZW50Lg0KPiANCj4gPiArICAgIGlmIChjdHgtPnBrdC0+cGt0X2hh
c19tdWx0aV9jb2YpIHsNCj4gPiArICAgICAgICBnZW5fd3JpdGVfbmV3X3BjX2FkZHIoY3R4LCB0
Y2dfY29uc3RhbnRfdGwoZGVzdCksIHByZWQpOw0KPiA+ICsgICAgfSBlbHNlIHsNCj4gPiArICAg
ICAgICAvKiBEZWZlciB0aGlzIGp1bXAgdG8gdGhlIGVuZCBvZiB0aGUgVEIgKi8NCj4gPiArICAg
ICAgICBnX2Fzc2VydChjdHgtPmJyYW5jaF9jb25kID09IE5VTEwpOw0KPiA+ICsgICAgICAgIGN0
eC0+aGFzX3NpbmdsZV9kaXJlY3RfYnJhbmNoID0gdHJ1ZTsNCj4gPiArICAgICAgICBpZiAocHJl
ZCAhPSBOVUxMKSB7DQo+ID4gKyAgICAgICAgICAgIGN0eC0+YnJhbmNoX2NvbmQgPSB0Y2dfdGVt
cF9sb2NhbF9uZXcoKTsNCj4gPiArICAgICAgICAgICAgdGNnX2dlbl9tb3ZfdGwoY3R4LT5icmFu
Y2hfY29uZCwgcHJlZCk7DQo+ID4gKyAgICAgICAgfQ0KPiA+ICsgICAgICAgIGN0eC0+YnJhbmNo
X2Rlc3QgPSBkZXN0Ow0KPiANCj4gUGVyaGFwcyByZS11c2UgaGV4X2JyYW5jaF90YWtlbiBhcyBi
cmFuY2hfY29uZD8NCg0KR29vZCBpZGVhLiAgVGhhdCB3aWxsIHNhdmUgdGhlIGFsbG9jYXRpb24v
ZGVhbGxvY2F0aW9uIG9mIHRoZSBUQ0d2LiAgSSdsbCBjaGFuZ2UgaXQgdG8gYSBUQ0dDb25kIHRv
IGluZGljYXRlIHRoZSBjb21wYXJpc29uIHRvIGJlIGRvbmUgKGlmIGFueSkuICBJdCB3aWxsIHdv
cmsgbmljZWx5IHdpdGggeW91ciBvdGhlciBzdWdnZXN0aW9uIHRvIHBhc3MgdGhlIGJyYW5jaCBj
b25kaXRpb24gYWxvbmcuDQoNCg0KPiANCj4gQW55d2F5LA0KPiBSZXZpZXdlZC1ieTogUmljaGFy
ZCBIZW5kZXJzb24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+IA0KPiANCj4gcn4N
Cg==

