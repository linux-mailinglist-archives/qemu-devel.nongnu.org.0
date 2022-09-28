Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9241F5EE4A4
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 20:53:29 +0200 (CEST)
Received: from localhost ([::1]:40274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odcBU-0000BU-Kb
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 14:53:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1odbEJ-0000Zj-8s
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 13:52:19 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131]:28504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1odbEF-00051R-Hk
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 13:52:18 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28SCBReJ012410;
 Wed, 28 Sep 2022 17:52:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=lbhKOMpCoVLFeBJDoNxPqLOn2auFfJALJ37GZM4ti9c=;
 b=ir+oPylajdomneUNgi9KHxjtFByYjufw0KT1Wp3rUIr7rW/RjnoYO/3EisiY+VbnsfEP
 NLoS9T0kWYEo2m/JGCV4teRkMLhden8wEYVubDuex4duKTStoC9sfvNFU9ueRj8Hrugc
 hpp0LlxUTjeKHtT7yZqnQjATwSWp/nsz72JxA4L1yF0jvHt99k5U315mhx2RL8zX7FhU
 4354Sog/+/PAGl8BAXnMfl8oDHU4lC+mqlcV0LU95+/a2qx7CNC1Vo9GakKVgzxFze+8
 p13Mee1avw/UfBreT3WmRJ+0W6qZNdeaYslZFoKP8NlQ/Z9Px8PjX+096+OLd/CvNJJ8 6Q== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2109.outbound.protection.outlook.com [104.47.55.109])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jvfp3t86a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Sep 2022 17:52:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SBagva8B3Z+3Z+LwPjqlL4VeQHcDP5bAjRDrjo9i9FA5FK/llWw5gpl1yLjj0+xUll8zY4IRO5pW67tj/l4pyMKkblntTytFOjJJ35J3mUaj7lhr7zMMh3Tca6qotw1yk382fA/vIc+LgU7OiN5TNbq0mDYZNQw1bkQNfYoSnzoPkvHeJRiDPM7esZEHL82aYdFvEdOmVDZeefZt/MkB//X5QTaAZD4/1cIc7EHsJ2fJJuzalGzJ3MdzJOpbvG5SfrxbwSd85mJi75kt7jX+tfbwsC1B3OBErfbz0hzxUkp0WoL46Gg9nTamDNlftIXkxnaQExNcRJhZZfw/lpILYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lbhKOMpCoVLFeBJDoNxPqLOn2auFfJALJ37GZM4ti9c=;
 b=hPBhvazmxdoILkevMI+DRS8jGl9Ry3ayYqAV5hoSSg1D3Bv8HZ1U9URUtJ2XEFTb/YaG+3sdgPD0286xGdwAZi+G8CbULe8KLZvN6Xd5dCC8a9Sd3IZKeIrNrA+tli2J+wDIJgWih1Y4GkO1/JJYck3nNFZZIN9fPlwawxISzbOtY9gMOqwxr8fGOKanDqGieFfvJqTFZTcQPg6PWtGp/ymgyiTJLydTtlBOGHtIeIpyq/5TD2LKAJPF29e7PUfx3Kyee2re34uZePLMpAZ1nfiAjyywgqtShjN2uOI4SpupWXzlEqYpFSbQ0EPdEfuacDU3kbx3soz5ob2OqqrhvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by SJ0PR02MB7486.namprd02.prod.outlook.com
 (2603:10b6:a03:2a3::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Wed, 28 Sep
 2022 17:52:05 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::48c8:3e4b:46c1:ca87]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::48c8:3e4b:46c1:ca87%5]) with mapi id 15.20.5676.015; Wed, 28 Sep 2022
 17:52:05 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: "f4bug@amsat.org" <f4bug@amsat.org>, "ale@rev.ng" <ale@rev.ng>,
 "anjo@rev.ng" <anjo@rev.ng>, Brian Cain <bcain@quicinc.com>,
 Michael Lambert <mlambert@quicinc.com>
Subject: RE: [PATCH 3/3] Hexagon (target/hexagon) Change decision to set
 pkt_has_store_s[01]
Thread-Topic: [PATCH 3/3] Hexagon (target/hexagon) Change decision to set
 pkt_has_store_s[01]
Thread-Index: AQHYzMgWOabm9GIj8k+2W9g2cDp6G631EG2AgAAau0A=
Date: Wed, 28 Sep 2022 17:52:04 +0000
Message-ID: <SN4PR0201MB8808A6DF005D95CF89A145B7DE549@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20220920080746.26791-1-tsimpson@quicinc.com>
 <20220920080746.26791-4-tsimpson@quicinc.com>
 <bf55456b-195b-6dcb-68dd-593a2f2d9474@linaro.org>
In-Reply-To: <bf55456b-195b-6dcb-68dd-593a2f2d9474@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|SJ0PR02MB7486:EE_
x-ms-office365-filtering-correlation-id: b370b9bc-8ff1-4f69-e41a-08daa17a27b2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uB+F0UY34Qrfb0LquFyE1KEuG9UBw+l+AEZIpoXm5wcqh55N3O2oD1lL340jz7QGNwRtkc2LTxR+59Witxag03wLU10HgtDZPaeXhoUUXRJNG1ulZk2pR6uwQOigHS3Ji/HarGPFjtFcI55uJlLFkZzuAf74eqa68tzeY3dytk+l43N8qUoEt9H6a/eaJNQtc+kHUNvbFc7pEBwMYQ5xb5pUskEia/tuWUQi9fwJcmRGwRB+YW2BGH9ev8pGgnRbZ5Gw8Z/CQKYWQUkckCIxaJHzG4bbkqk+QsXT9UGGDNeC4vrpSZIF6il3pRtnLj6r8MurxoD8sMK4pb52BMkarfT9n+xZSRoT4QO70bLPHBPnyajf1wZ/weo/UvNhgIc9upWbPItotur+alKlxu5aQ6PixtDZmluV7T1TvIgj/W5up8Px+NTSVh+4+gQDCGdZ81I/sCQFZ9LXtbZYVzUdealt9gLtwp3w9dRIXE0BRAMcCD1gZm9zwpUU/5OS5zAvVb/7HWhvY61A/YfPUHY1n8GmgxK7Kb/BY6oe+7Fp7ZB6TrY8AnMPZegE9Z/WdVIsVdwt28WaqTcY2a+Ns9oO7ihQ0/eeBIoF0VDERk3JvyAuJUjq7GBRkVg9VJayd8aLJK5CHoDeYhbaERj6JrbXm6+K8F9kTBH6cJLI5G15jUCWDWssvS2kOaQNRKTOaByNgEzFdu3FTdvApyXG9TFkVCvwYRNIDYm/osmGAESL+R0jiW1W85+D8uIOt2HbYkeASqdVXvlEONmrQ4/p/7nDTg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(396003)(346002)(376002)(39860400002)(136003)(451199015)(53546011)(2906002)(71200400001)(83380400001)(33656002)(66446008)(7696005)(6506007)(478600001)(38100700002)(316002)(38070700005)(54906003)(76116006)(64756008)(66556008)(8676002)(4326008)(66946007)(41300700001)(86362001)(55016003)(52536014)(8936002)(110136005)(122000001)(5660300002)(107886003)(186003)(66476007)(9686003)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cnFWWm9HVXliRHppOTJJTFJpV1Q0Uncwb01obmhGODB1R090MWlJQS9rZmpI?=
 =?utf-8?B?aXpWTW9rdktndC9sQXdsaVBRelFJQkN0cXI2M0pYUFowWHpnUUFjMFVPUHEv?=
 =?utf-8?B?VHRwWW9DMlJZdFNzb21TMThWUENSY21ueTNOQlJJNEZJU0hVOGx0WFFCbkZp?=
 =?utf-8?B?SXZ3RnRDWWoxMGdKcHZJY0UyMmFYQWUrQUZzajJnMHZYVlRqWGRZdnhUbzVV?=
 =?utf-8?B?M1pHVTIxOWo3YXNVdi9WSi9PMytNVzFUcHZUazFCRW40ZWk0T2ZwUFhTNERr?=
 =?utf-8?B?R1h4K05OMEMvVkNBK1ZwOSs0ZWgrOXNBVVRhYzA3OCtyRXhuTE5XOWlzMzRL?=
 =?utf-8?B?L0hybUROZkRBYWxHNTV5eGZ3MjFoZFRwNGZaUlNHS20zUGNzNkE2WGpPR2lI?=
 =?utf-8?B?NU5rbit4bXlMQW1wc09xK0FyTU44YzdDdDRWTkY2Wkc0dHJpd3lpSFBGQ0RJ?=
 =?utf-8?B?Qjh0QXIvTHJyUkNaRW5NdEhVTjMvYXVEcXZXT2dxN1A0QnZ4YW44OU1EM0lP?=
 =?utf-8?B?NzJzdVVNZEd3UDd1Y29QL2RpWUlkR1Fma1ZFM3gyZVZzKzNiaHBpZWMzcytV?=
 =?utf-8?B?QldPb3Z1TXdWSElSc0p6UHE1UVA2S0NnZ3h0MVYweW4xTk5LZk1rSmNva0lo?=
 =?utf-8?B?QVNaUlNBTkNoTnZodmpSVWQ2UU1kQ294bERwR0hYdDB2ZS9OREt1R2hrdjJG?=
 =?utf-8?B?dW5YRStMNk5OaDdhWllFZU5WL2J1WXE1MjQ3OXhNNUNXaE1DSnJ0UEFmVE5s?=
 =?utf-8?B?czJxQ25PRnZ2NFlWRmx6MVpQK0RNbW1Mc0wrWFRqeHJDeWxlQjFBd3lTQ2pq?=
 =?utf-8?B?UGRuUGFHZ2l0a0xwMUVjV01UTHVLT3p3NVN4UlpQRlkralFvU0hleStBdkwy?=
 =?utf-8?B?WFN3SitaSU93N1E3ZHhqUEpLN1VMcTV1YlFEd3VqSERWMHgxeGorY1RVSWJG?=
 =?utf-8?B?ODJnOVBXTGkwNnlraWZzek1GbDYvQUpEaVRBcGgxSVZ0MXU3WUtpcUVrSlhu?=
 =?utf-8?B?SUZ1UVhiRVE0TE1JUEx3KzFLOENTQkJVTTJBRkN4ZThOVzI0SEhqTFVLQ01w?=
 =?utf-8?B?aUZyTVp4SVIxaEh5RUxtNUh4RXZDZktTMjdFV3drZjhzRXVkdkhGOGNXTGFH?=
 =?utf-8?B?QUdTWWMzUFkzeVBleklyNTQwRkFISFZIWVV3di90VE9KZWlIWHpjazQ1WVQr?=
 =?utf-8?B?Ni9maDJsTFRjUFZsV2dIT2doUDE5eldlS2FOK245cXZXMG5SU3lzeU54QnVk?=
 =?utf-8?B?Q3NkdnFKVTFaeXhCQ09qZFpMdVJiY25ndjd2cFBOajA5Sks5NytvNDc3YUZY?=
 =?utf-8?B?U1JQa1NBQ1ROTlVWeHhURFV6eTRQMFdXM1lzVEFjeVZ3MDhoQjBVY1pnYW05?=
 =?utf-8?B?bkQ0TGVLd1cwRXVpR3JiOEtWL3M2Tmx4NENsbEpmREg5em82UVhiL2IzeDV6?=
 =?utf-8?B?UlZLKytnUmcrcGZzTm90R1FQN0ZibUE1WHQ1RkhDcDJ3bHI3MEFoMm5oc0pn?=
 =?utf-8?B?ZUYxZmRMZCs2WTErcDhsZzFNWlZLT0UyeWxjODNZV3VpdDlVQVVFS2JBa09Q?=
 =?utf-8?B?MkhDWktJNWQ1d2U0d3BVNWN0WEZxTnRrR1RGMlkwZlRiT0RvcjRIQUdERm5y?=
 =?utf-8?B?bm5RNVkwOWFlNTZLaUZHYlZjZXdBN0lDcUM2dUVVYVNLRmt0R1NXdmxITUxn?=
 =?utf-8?B?YTJDUi9WQUEvNzcyaWhGMXRhdXRobFdpRVk0T0xJRG14b3RLUFBvMzdUblNv?=
 =?utf-8?B?VG82RGlURDM0UEszQkFaQ1RqOXJ4cVFhOWRJUmxXVXI5T1RNV21GZHpBeFFo?=
 =?utf-8?B?NEw4S3I5R3pyenJqa3M4VmxEK3ZiUEVXSWM4bUVyenpIR2p3c1Q3U3NGOUQr?=
 =?utf-8?B?ZXZ0K0JFbUptR1gvMHZFMHBCYklCMmpMcEZqdS9HR3JhUE5rcnVoVm55ekdT?=
 =?utf-8?B?NjdUcmVIakVXRWhobjlkdWJBU01SOXhJSWFyUytIWUJJRVBtdlFlQWoydXI5?=
 =?utf-8?B?dWNQdDZFWGwwRDdoZHU3QmN4WHlBbm8zYVB5a3BsNTEveDZWSnVodExNQjU5?=
 =?utf-8?B?ekt0MmRlYTc3cUR1NHJrZ2taZ2NPSjFuSmRSbElTY3RtRkJXMFVYMkRsMERj?=
 =?utf-8?Q?rhi/IsxgSACQMb6z/gDlR3PWF?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b370b9bc-8ff1-4f69-e41a-08daa17a27b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2022 17:52:05.0151 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Wi5LY+PeakvVTYElMfVJpGnktCIKgdtrwcI0lBOFSddBnSRRIxsWdo5sYKsDdOTiQSWYvyjhokbgnGCaM1YG7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7486
X-Proofpoint-ORIG-GUID: QCH_w4HpF9hwhMHFziWfUeHHDoFxCgoL
X-Proofpoint-GUID: QCH_w4HpF9hwhMHFziWfUeHHDoFxCgoL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-28_07,2022-09-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 mlxscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=600 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209280104
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBIZW5kZXJz
b24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+IFNlbnQ6IFdlZG5lc2RheSwgU2Vw
dGVtYmVyIDI4LCAyMDIyIDExOjEyIEFNDQo+IFRvOiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25A
cXVpY2luYy5jb20+OyBxZW11LWRldmVsQG5vbmdudS5vcmcNCj4gQ2M6IGY0YnVnQGFtc2F0Lm9y
ZzsgYWxlQHJldi5uZzsgYW5qb0ByZXYubmc7IEJyaWFuIENhaW4NCj4gPGJjYWluQHF1aWNpbmMu
Y29tPjsgTWljaGFlbCBMYW1iZXJ0IDxtbGFtYmVydEBxdWljaW5jLmNvbT4NCj4gU3ViamVjdDog
UmU6IFtQQVRDSCAzLzNdIEhleGFnb24gKHRhcmdldC9oZXhhZ29uKSBDaGFuZ2UgZGVjaXNpb24g
dG8gc2V0DQo+IHBrdF9oYXNfc3RvcmVfc1swMV0NCj4gDQo+IE9uIDkvMjAvMjIgMDE6MDcsIFRh
eWxvciBTaW1wc29uIHdyb3RlOg0KPiA+IFdlIGhhdmUgZm91bmQgY2FzZXMgd2hlcmUgcGt0X2hh
c19zdG9yZV9zWzAxXSBpcyBzZXQgaW5jb3JyZWN0bHkuDQo+ID4gVGhpcyBsZWFkcyB0byBnZW5l
cmF0aW5nIGFuIHVubmVjZXNzYXJ5IHN0b3JlIHRoYXQgaXMgbGVmdCBvdmVyIGZyb20gYQ0KPiA+
IHByZXZpb3VzIHBhY2tldC4NCj4gPg0KPiA+IEFkZCBhbiBhdHRyaWJ1dGUgdG8gZGV0ZXJtaW5l
IGlmIGFuIGluc3RydWN0aW9uIGlzIGEgc2NhbGFyIHN0b3JlIFRoZQ0KPiA+IGF0dHJpYnV0ZSBp
cyBhdHRhY2hlZCB0byB0aGUgZlNUT1JFIG1hY3JvIChoZXhfY29tbW9uLnB5KSBTaW1wbGlmeSB0
aGUNCj4gPiBsb2dpYyBpbiBkZWNvZGUuYyB0aGF0IHNldHMgcGt0X2hhc19zdG9yZV9zWzAxXQ0K
PiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMu
Y29tPg0KPiA+IC0tLQ0KPiA+ICAgdGFyZ2V0L2hleGFnb24vYXR0cmlic19kZWYuaC5pbmMgfCAg
MSArDQo+ID4gICB0YXJnZXQvaGV4YWdvbi9kZWNvZGUuYyAgICAgICAgICB8IDE3ICsrKysrKysr
KysrKy0tLS0tDQo+ID4gICB0YXJnZXQvaGV4YWdvbi90cmFuc2xhdGUuYyAgICAgICB8IDEwICsr
KysrKy0tLS0NCj4gPiAgIHRhcmdldC9oZXhhZ29uL2hleF9jb21tb24ucHkgICAgIHwgIDMgKyst
DQo+ID4gICA0IGZpbGVzIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygt
KQ0KPiA+DQo+ID4gLS1naXQgYS90YXJnZXQvaGV4YWdvbi9kZWNvZGUuYyBiL3RhcmdldC9oZXhh
Z29uL2RlY29kZS5jIGluZGV4DQo+ID4gNmYwZjI3YjRiYS4uMmJhOTRhNzdkZSAxMDA2NDQNCj4g
PiAtLS0gYS90YXJnZXQvaGV4YWdvbi9kZWNvZGUuYw0KPiA+ICsrKyBiL3RhcmdldC9oZXhhZ29u
L2RlY29kZS5jDQo+ID4gQEAgLTEsNSArMSw1IEBADQo+ID4gICAgICAgICAgIH0NCj4gPg0KPiA+
ICAgICAgICAgICBpZiAoR0VUX0FUVFJJQihvcGNvZGUsIEFfU1RPUkUpKSB7DQo+ID4gLSAgICAg
ICAgICAgIGlmIChwa3QtPmluc25baV0uc2xvdCA9PSAwKSB7DQo+ID4gLSAgICAgICAgICAgICAg
ICBwa3QtPnBrdF9oYXNfc3RvcmVfczAgPSB0cnVlOw0KPiA+IC0gICAgICAgICAgICB9IGVsc2Ug
ew0KPiA+IC0gICAgICAgICAgICAgICAgcGt0LT5wa3RfaGFzX3N0b3JlX3MxID0gdHJ1ZTsNCj4g
PiArICAgICAgICAgICAgaWYgKEdFVF9BVFRSSUIob3Bjb2RlLCBBX1NDQUxBUl9TVE9SRSkgJiYN
Cj4gPiArICAgICAgICAgICAgICAgICFHRVRfQVRUUklCKG9wY29kZSwgQV9NRU1TSVpFXzBCKSkg
ew0KPiA+ICsgICAgICAgICAgICAgICAgZ19hc3NlcnQoR0VUX0FUVFJJQihvcGNvZGUsIEFfTUVN
U0laRV8xQikgfHwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgIEdFVF9BVFRSSUIob3Bj
b2RlLCBBX01FTVNJWkVfMkIpIHx8DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICBHRVRf
QVRUUklCKG9wY29kZSwgQV9NRU1TSVpFXzRCKSB8fA0KPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgR0VUX0FUVFJJQihvcGNvZGUsIEFfTUVNU0laRV84QikpOw0KPiANCj4gV291bGQgdGhp
cyBhc3NlcnQgYmUgcmVkdW5kYW50IHdpdGggdGhlIG9uZSBJIHN1Z2dlc3RlZCB2cyBwYXRjaCAy
Pw0KPiANCj4gT3RoZXJ3aXNlLA0KPiBSZXZpZXdlZC1ieTogUmljaGFyZCBIZW5kZXJzb24gPHJp
Y2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQoNClllcywgdGhpcyB3b3VsZCBiZSByZWR1bmRh
bnQgd2l0aCB0aGUgb25lIHlvdSBzdWdnZXN0ZWQuICBGdXJ0aGVyLCB0aGUgb25lIHlvdSBzdWdn
ZXN0ZWQgaXMgYW4gaW1wcm92ZW1lbnQgYmVjYXVzZSBpdCBlbnN1cmVzIHRoYXQgZXhhY3RseSBv
bmUgb2YgdGhlIGF0dHJpYnV0ZXMgaXMgc2V0Lg0KDQpXaWxsIG1ha2UgdGhlIGNoYW5nZXMgYW5k
IGNyZWF0ZSBhIFBSLg0KDQpUaGFua3MsDQpUYXlsb3INCg==

