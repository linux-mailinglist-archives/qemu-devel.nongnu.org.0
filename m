Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5282857A769
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 21:50:19 +0200 (CEST)
Received: from localhost ([::1]:60270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDtEX-0003aC-TW
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 15:50:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1oDtD8-000298-S2
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 15:48:50 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131]:42150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1oDtD6-0001Tp-Ah
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 15:48:50 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26JDx7LD018128;
 Tue, 19 Jul 2022 19:48:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=zZnm6Phtbtq+6nEPbRetlfccQoPGP0Xj9nbi/vTr70U=;
 b=RVnKMIsvqYHs20S1uYPQiLJOYnz6HUV0OCzdzoJf9HRzupMuFIoB7WK7iJks67pA1vv0
 QSpVOX+nu0kRSt+cXk+fxIAws1UVGJCdTZj0LfEn4u+8dc5mp8ScBbJ+DDMXAxCFj3JG
 4kXQacYbOOLNzXpFdeZuLi33oyuKuUwqX2FVjdz5SfQ74tcZDxiHkZYE3rrzS88Cnxk5
 n1dIL7mMEajpv3Pgz1p2cIUw3aAv1kBj50F8v3xUy4FhmAisbJK8z2VeSAAzS1DLUztm
 CfLnUM7WlTe3kydCB7VAb8iJkPXklYOYApLMaqvmaTWiCNiWuAUgFW40TMaBCQkr5r9C JA== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3hdsma9hdy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Jul 2022 19:48:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Spu0Svtfv/XqfyXu5vo9x9PyDNBJb3SK5Do+jAfNYGMGtqItCX0TarzPTAaZPLKkTLT5/V2zMXkX+3oQiiR+JtKX3+HVgbFsL07PTgzeMXYoWcIjaXtsJGv74hkKKv++NM519vyo3cWMoJTAO+uUCQ7ea48iK0Wn3rG2EbCm4YYJnBfSZX3Ia7yaESktr3in/fGpU7gJ8eH0vdKab2ZshUT8NT9k1R/EwJHPO/alPaGHukjGMzhA+TbCImgwsdJyAMGMGoCbTFqZqll36yk3rzwcuf2P0+K6uRjovau2bfHWuAU6fyR6iyEkH1vz2LPhCXgtcVD82gfdjoAujxkY1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zZnm6Phtbtq+6nEPbRetlfccQoPGP0Xj9nbi/vTr70U=;
 b=f/grmtddp3MATefdyCjlp2bKSjZEbtYNqx+40FOIyg0QPhip/91KbP1AUNgQSDDHhQv8OWtxndFDy2nx5cWZkOAhS7Bnxn6DOoChpBxfOnnY+sPK3EYEvdgOQoM7byjIKJFhYjiOSVmKBwKnw3921eJrrTCzxQijSPPnPfwq1lydJVJGxYRWv6LpjWPG1tjj4t0ZhsiTVTTCA8PGJ07MsU+AmDbjBWPMJ433e+oF8KJAYNA36spjqk2KmcC8PhB/hmcBJ9Lpy9Rvcq3mXkRCxgJCxtPCMV02r/zT+xDfx5c6rCVCihhv/L16L6oIwW9dqJPcVJvF6NN3aGSZ3gbWlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by DS0PR02MB8950.namprd02.prod.outlook.com
 (2603:10b6:8:c9::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Tue, 19 Jul
 2022 19:48:29 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::7076:51c5:7c74:6171]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::7076:51c5:7c74:6171%9]) with mapi id 15.20.5438.024; Tue, 19 Jul 2022
 19:48:29 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "f4bug@amsat.org" <f4bug@amsat.org>
Subject: RE: [PULL 0/2] Hexagon (target/hexagon) bug fixes for mem_noshuf
Thread-Topic: [PULL 0/2] Hexagon (target/hexagon) bug fixes for mem_noshuf
Thread-Index: AQHYmviXjkZvcXj1JkuzWW/7OQZKQa2FmYCAgACBYnA=
Date: Tue, 19 Jul 2022 19:48:29 +0000
Message-ID: <SN4PR0201MB88081B9D4354E311CBEC915ADE8F9@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20220718224845.19878-1-tsimpson@quicinc.com>
 <CAFEAcA_cjB6_QjZ6=X=st+h=YHPm1zYovU8C9Stcf2fy_8oDEw@mail.gmail.com>
In-Reply-To: <CAFEAcA_cjB6_QjZ6=X=st+h=YHPm1zYovU8C9Stcf2fy_8oDEw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e4ddac42-0ab1-4157-dbeb-08da69bfa743
x-ms-traffictypediagnostic: DS0PR02MB8950:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: k7CJKcLCD04+UqWbTAgTLKBx6pUmYZ25dtjt6PfIvjbAHz0X2P0dWiPybcGMuMoRQxZew8+y7LVLPBJHzrdfg6a2Ptys9je74BXoZAjWsPpkGPuQ/eSIeg8h397LDYaLtkOeBOss7Ls5pjYdc7pv9ScgFdNPwKdiqkF4dC1d5L5a+24/ZcAwcl+j92eOEuUlqoDf/VGNSvyHUwawO406ZBaLhhRd5gaoQiBnRnV/Sm17RlTgf1/j5+3soD80UdqziKVYn6kAKMNLa9mJu7IBBwGQSH8UUcbYgi6JEoMJii4+gWoNL0uQXlVlusQ1Q9N6BEaJl+Nufk+e6yRdaRJdzmsYqzuv9GY9j3oqmxwrEFOfQ34DF5lM5p9MthLSJqVmzZ5N56QVy6yKqEj3YtJZ4E1xOXbhfEoq0VUkJBd7FSSzzPTjQOvsuyEmsqqD47spLkorRD67hNzFxXu3LwXjwwFUrkVX6zWsNdCSqjnFcW0DOaWCrmzklPUYKYubkWkCracJGKyaJbw841nFCfvqZUQ2pEqZ12jlut6rav6p4EKrdppU9IGfTnMvVjvNO5J3SmQUSLFeULwR1KcUsr5PpeEKzrtlXC15R7EOh/SzM9VNno5Ty5HGt0WMooiKvlKM1OdJW/obm52j6QS8qaPK/bWJ8Mf2N3k5naMaOGJGKhcAXBQl4f8c03qymC+NCyi3k0ojmD61WUHtX63B/ZRdPPjMCORE7gNkAACVyGEKt34fAtnsT7LdJeoX3xo62BPnyFYKk/1TD8Z9LR2CFJW/gWx1DRK3IyRw8bVlg8xoPaVXafpYdxULXrPk0PU1tbQIuI1rZtdreQc+J1jPUmOhd+ln6vJqy+ZImBBpu6bOcW0jeyUoSyHBrBsEwu8F5dWH
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(366004)(136003)(346002)(396003)(376002)(71200400001)(41300700001)(966005)(66476007)(64756008)(478600001)(53546011)(186003)(9686003)(122000001)(26005)(38070700005)(83380400001)(66946007)(38100700002)(6916009)(33656002)(2906002)(66446008)(5660300002)(52536014)(6506007)(55016003)(8936002)(7696005)(76116006)(8676002)(54906003)(66556008)(316002)(86362001)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QzNzRXQ1L1BZZ2dReXdiMGV2eEM5OFNRM2NZR25jZkc0dE9Mdmo2b3E3OHVO?=
 =?utf-8?B?U21GZnczNnc1aTJFZEdiYlZ3MlQzMjRjNFVsWlFuOFhJZWtueXpwa2R3cm9B?=
 =?utf-8?B?enBIRjVrNnVCYVJrZjB5N3FsZTFDSEhwL2s3TjYwT3lyR3ZOeFYyQWlSUmFu?=
 =?utf-8?B?R2pneFl2RllUc1A5blFJQWhsbDl1VW1RRXRkRG8zUGttMWdIeTExMkN6N1Zj?=
 =?utf-8?B?NnVrNUgvODRmZElHamJwT3BPSWxXUStlVXBXK1Jnc3paOFhRbDlFdXhnd21M?=
 =?utf-8?B?U1d0ejQvYXNndUNUU0w4WjQ3RXhkdFZSWkFrWWszayt0ZDl3Y3NPRlZqb1BX?=
 =?utf-8?B?eXNpNlRKVk5FKzZKRzFxQWN6K1dDdU5vQVhFRTM0dFIxWFN1R0VYckRnMnRk?=
 =?utf-8?B?WmI0UElXN0VTcnBCaW1EVGg2a3VvN29FWXV6TUtOSXhwM0NIWHcvekQ2WTFT?=
 =?utf-8?B?TWpmWmZ4clB2NTFWNEpiditibkZ6RWw1TFl4NHBoUnpqdEJqaEtEMFdCRjV5?=
 =?utf-8?B?MHFhMHk3VHp3MVk0WWJaUjVBVEw2RklIZUthR2dYTWVpUUpORWdQbUNIYlA0?=
 =?utf-8?B?SHV2NDdQMTlHNkplK3VpN1lZSE5jbmtmc3JzcDViMks0dFErSldPcTZZWkty?=
 =?utf-8?B?aHAxTFpCVmdmWE45RUF0bVhvc2QvbDZCY1RONkJXcEx6Q2lCbWlOa05WdlFO?=
 =?utf-8?B?cG1TVWdBdTQ0bnNYOTI5ZFdrbGE2bnJvenlZMkE1ajgvOFhKdjN3OUowUVRC?=
 =?utf-8?B?dkFjY0huNDNZK3ZTQmpZenJWVUd6cmpPQlRZTlRaU1l6OW4zdkZRMG1rVnow?=
 =?utf-8?B?UmQwY2dsaStkWmNZZERlME4wd0ZvdXNwNlZySkhweXV1K0FNUkxVUnhGbW12?=
 =?utf-8?B?bEJyY2tWeHBjTEZHQ3B0cHh2TDNKeDRIUUpaYm0yRTJJQjdGUEVDcWtGL0NG?=
 =?utf-8?B?bXZlcUZ5VDhRa1lOK2dnNHBTREtLNERVRlhRS1ZOR0hQZkl0UlVXNXE0a1dS?=
 =?utf-8?B?MmRRWktsVkl1dys4VVNIWUljNUxuQ3dUS1ZLWEd2U01rLzk4NzRyUHZ3aTZY?=
 =?utf-8?B?cVZpcHdnQ0VTVElSUlI0UWpibldqWmRPcnVxL1hFblZEYVVpa2lGV3d3aTBx?=
 =?utf-8?B?RG5oczl0UHJJRXl2N0lMZ2gvYm9VclYyVGJuNHFhUDJ0NEdRbVlWR1c1K3hY?=
 =?utf-8?B?OXoremtOcFMxNnlucW5DSnZSTTFUcHErRkM0UzVySFB1dTRsdnh2VHQzMVM4?=
 =?utf-8?B?NFVUaSt3aXFqMG8xenRwTXhUTEI0ellhcmhYclN0Z2ZsNm16MDhXd0poeW9w?=
 =?utf-8?B?LzNzQ3F6OXBFSElXb0VkeTlSYXNKZmVPTGtNYmMwZ1g0aHJIOTY2YWpNTUhS?=
 =?utf-8?B?eDdBVnBlNUlVZSt4OVcvOGMwOC9TK2thTFAwbmtML3paWWZENXlOMEUySHVU?=
 =?utf-8?B?QUFLOTFHVGE2cEJHeXdwUkFnQldlTFZCS0RpdDZ5ejdGcTRXQTJFTWcvMkd2?=
 =?utf-8?B?Rk5BZWEyeXNQdGdvMTZuM20zUGZENmloWUJ5ZnhRd1oyZE9JNU1nczFER1Fz?=
 =?utf-8?B?UmRMdTNGYTQ0RkR4V01QNTNSUEtzUTVaaTVQMnVLcmtGRmEyNk9EbGxQUGJG?=
 =?utf-8?B?cHdCTThqUzh1UjlhUzFVUmo0Vytqa0grM3BlWGluNzAvdG4wUnYwMTN2ckFu?=
 =?utf-8?B?T092SUYzVFJQazI0TzJVUjJUSlNVVS9JL085M3o0YU1TbWZsL2dNdXk4M2ZT?=
 =?utf-8?B?VnZEYzV5S3lpY3FxMGMxcFd5enlwcWIyTnFNbzhRWXRlZm1UQTg1ZUdnVXEw?=
 =?utf-8?B?aENDS08rMjRkVVhaNWFNV1kxd1dRM2ZQRDBnVnZwU01vRHk4YUVWS0NKWHJI?=
 =?utf-8?B?WFB6aDY3N1VNbmh0NlAzVjBxUmxwTHZlVWNnRnVITmpQZFE1eGdoYTNTRmM2?=
 =?utf-8?B?QTlLOXRCQS9qK3lqSHR2QVNtSlR4TXVja1diQ1hVZ2hLMFpReml5b2s3Mm9i?=
 =?utf-8?B?cURpRU1VS21kQnc4akJsZWhlS09LS3ZGTnd4ck54SXYxcHlUUDAvZDdmZytp?=
 =?utf-8?B?SUlZcXVxazRDZFZNWVdCM2U4VEhQYmxHeGkrR1FTcEVVRGFhcE0zMlRLWC9F?=
 =?utf-8?Q?/k92INA/PuWgfMsI3KshY3FI6?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4ddac42-0ab1-4157-dbeb-08da69bfa743
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2022 19:48:29.1946 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2PesXfFdqOl1cRjvkN0AH23y9KXchSjD6OCyhxP6+ClrhpZ2vrEx1hesOzymxOEK/U80sMnx+4drH9DFLLe1Mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR02MB8950
X-Proofpoint-ORIG-GUID: LuWvDz4vDRfkBOkzyOHA1WJ_qbH19QA0
X-Proofpoint-GUID: LuWvDz4vDRfkBOkzyOHA1WJ_qbH19QA0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-19_08,2022-07-19_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1011
 mlxlogscore=929 mlxscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207190083
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGV0ZXIgTWF5ZGVsbCA8
cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnPg0KPiBTZW50OiBUdWVzZGF5LCBKdWx5IDE5LCAyMDIy
IDY6MDUgQU0NCj4gVG86IFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT4NCj4g
Q2M6IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZzsgcmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZzsN
Cj4gZjRidWdAYW1zYXQub3JnDQo+IFN1YmplY3Q6IFJlOiBbUFVMTCAwLzJdIEhleGFnb24gKHRh
cmdldC9oZXhhZ29uKSBidWcgZml4ZXMgZm9yIG1lbV9ub3NodWYNCj4gDQo+IE9uIE1vbiwgMTgg
SnVsIDIwMjIgYXQgMjM6NDksIFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT4N
Cj4gd3JvdGU6DQo+ID4NCj4gPiBUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0DQo+
IDI0ZjAxZDIyMGY1NmVhYjMyNjg1MzhlZjEwNjU1YjRmYjI0NTNmZGY6DQo+ID4NCj4gPiAgIE1l
cmdlIGh0dHBzOi8vZ2l0aHViLmNvbS9xZW11L3FlbXUgaW50byB0aXAgKDIwMjItMDctMTggMTE6
MTY6MzkNCj4gPiAtMDcwMCkNCj4gPg0KPiA+IGFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBv
c2l0b3J5IGF0Og0KPiA+DQo+ID4gICBodHRwczovL2dpdGh1Yi5jb20vcXVpYy9xZW11IHRhZ3Mv
cHVsbC1oZXgtMjAyMjA3MTgNCj4gPg0KPiA+IGZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0
bw0KPiBlYjkwNzI2MDI2MTdjYjQ5YzQ4OWFhZjA1OGY3MjY5NWMyZWFlZGMyOg0KPiANCj4gVGhp
cyB0YWcgaXMgYmFkbHkgYnJva2VuIGFzIGEgcHVsbCByZXF1ZXN0LCBiZWNhdXNlIGl0IGluY2x1
ZGVzIHRoaXMgY29tbWl0Og0KPiANCj4gY29tbWl0IDI0ZjAxZDIyMGY1NmVhYjMyNjg1MzhlZjEw
NjU1YjRmYjI0NTNmZGYNCj4gTWVyZ2U6IGVhZGFkNTRiZjEwIDc4MjM3ODk3MzEyDQo+IEF1dGhv
cjogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPg0KPiBEYXRlOiAgIE1vbiBK
dWwgMTggMTE6MTY6MzkgMjAyMiAtMDcwMA0KPiANCj4gICAgIE1lcmdlIGh0dHBzOi8vZ2l0aHVi
LmNvbS9xZW11L3FlbXUgaW50byB0aXANCj4gDQo+IA0KPiBOZXZlciBtZXJnZSB1cHN0cmVhbSBx
ZW11IGJhY2sgaW50byBhIGJyYW5jaCB5b3UncmUgdXNpbmcgYXMgYSBwdWxsDQo+IHJlcXVlc3Qs
IHBsZWFzZS4gSnVzdCByZWJhc2UgdGhlIHBhdGNoZXMgb24gbGF0ZXN0IG1hc3Rlci4NCj4gDQo+
IEx1Y2tpbHkgSSBub3RpY2VkIGluIHRoaXMgY2FzZSBiZWNhdXNlIGl0IGludHJvZHVjZXMgYSB3
aG9sZSBsb2FkIG9mIGdhcmJhZ2UNCj4gY2hhbmdlcyBhbmQgZG9lc24ndCBidWlsZC4NCj4gDQo+
IHRoYW5rcw0KPiAtLSBQTU0NCg0KTXkgYXBvbG9naWVzLiAgSSdsbCBmaXggdGhpcyBhbmQgcmVz
dWJtaXQuDQoNClRheWxvcg0KDQo=

