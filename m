Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 869A8581857
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 19:27:44 +0200 (CEST)
Received: from localhost ([::1]:39216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGOLP-0006vV-Kb
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 13:27:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1oGOHi-0002Jr-EQ
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 13:23:54 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131]:62456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1oGOHf-0000IG-RV
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 13:23:53 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26QDWsPh017227;
 Tue, 26 Jul 2022 17:23:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=7qDXEdgzdQ02DnkESM+AhJmrdp95E+HCwnDOdiZAtsQ=;
 b=nYaQuU/XJelm6Y2MjfiXz+1ms96/kzR77/t8IHKgeJpskD2xqqmzbFzivI2KoYB6ATFM
 ybkob9JwY73sNSCFGgAmNhnk2t5z6DR27J7IxEMqUN/rDM2E8xevgTjSMnuehq4BQ9R8
 yGXWUDxIkaOBFH1ZvVIIf/iLe5foSDLSyh/JHR1Fu4wmCCGLgy3nmwkEWQDaI2af5+hk
 8pqN9+usYnI4cO2vLVHB0FK85Y4NxvB7EipCErM4LT4knmuyic/j7J7aHp5wWnLzc65v
 QzJM1011C8XwIvbcsvNSmfX5DPlruErrtT59YFOTm751z+rpmkluZGf2kMfd6AacbO8v 9A== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3hj7881pbk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Jul 2022 17:23:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n0WdgsYC+sjBFgHgNNJl/ohSHaSl/xMDU87HcsE9inKbABrNU151ALD9MDczPgYgkKP5SoE3DDNAq9ooYjmGBA1zbOKVEjNaodnWHtd7DAfNRXYxQjG6mfk/brkogRxgMBD/YSDdSUMPctQzpSuvXR8bjNyOXofIOA6dBti8zzRixC/Cad3Itw0x+P1PeiyZkIRyjTA50Rj+bTHSDfoWVDTJW1R0yoN2cnf2HF/rTrx4gXDGd1QctO8/ax2M8sklNx3ByXA+bNh+dAjeyYzVyMmTyeV/LYACFo5UU/PM7+sioKT0JnidHPx/9UOa3qdwGnLKom0giLs1aKf31vg5pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7qDXEdgzdQ02DnkESM+AhJmrdp95E+HCwnDOdiZAtsQ=;
 b=HMeUYmxttomdtGLftAQAISx9on4eVERZAcQOvLRea6ppJOb03lif+LSKu5azE3Oc/blCML0YbiqXaMh+Aa79IDzcHMYN4rIEcLGfHAI9XRnRShEFlrf65/+uZOwq1kAvC68rHyrshJTgfBo2xJAoqaoaT2cq9bPP5iOawFeJ/YxLGDF35Lov4hLXwcsala7w4qng792eQNRehN4Lchthf+5eHtz5mM+LAU9WJXFrJHl6Zd/ujEi9r2qeo/g9AjMU3RA3exSMEJ+0pV2ehAW7F25EKx8PXyGU3qJzJWffTPDpujdsmd35bjPKn8nAisjW4vY8ExIwkVYpCXKJKS5wPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by SA1PR02MB8693.namprd02.prod.outlook.com
 (2603:10b6:806:1e5::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Tue, 26 Jul
 2022 17:23:45 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::7076:51c5:7c74:6171]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::7076:51c5:7c74:6171%9]) with mapi id 15.20.5458.025; Tue, 26 Jul 2022
 17:23:45 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>
CC: qemu-devel <qemu-devel@nongnu.org>
Subject: RE: hexagon docker test failure
Thread-Topic: hexagon docker test failure
Thread-Index: AQHYoQ6Qz9fI2hkxuUiIQ0meshai/a2Q2/4w
Date: Tue, 26 Jul 2022 17:23:45 +0000
Message-ID: <SN4PR0201MB880842E568E6F1BEAE5E1139DE949@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <e23e406a-bd4f-3ff0-a3f6-4f15eb18eecc@linaro.org>
In-Reply-To: <e23e406a-bd4f-3ff0-a3f6-4f15eb18eecc@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4f98a4cf-a8c3-4760-5ffe-08da6f2b983f
x-ms-traffictypediagnostic: SA1PR02MB8693:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fSywoJa30WCfNZKWxmiVmCZkd1YnKLvE/xQjXpImBFpzkiTtoMOZ+IgXKkk6usMrfTfu9V9/Rb+9THdiYAD84FBHt030hjtjDh6WZ8HEFW7uShGedGJLqxfcvPLO7KrqAB566OW/rbiPUnmFBj4c3kOnHU+97j0HY3kgzSQ/M6Lxb67qj4VEi2ggKXDdNkYyfyR/OwxcklBbpMV+8qCU5eoFoX2gGzb02ZwZLCyT6QeLj9uKE1YRQNlenEYFSkmNB/jN0HHoOBIp3oD9bblUsYmg/p0UPMxXHVmazv0bmcJtO7S6uxNbuMxZdmxsnc90Uhj9w0Xh/RTfq0vAGJdf83P8Web3tY6UKn4SxJugWohAX4ZUHNuQrFcmXes6vTaIfhIwnDmK5KWZux2QtYDYtnVzvnCUEjGMLgvc6mHE1nIszQOt4xFxgb8xhNOcNscZ/tQQFZ5rkET8S9MSp2v/TnPmt429qAWeEdz+mXctVTXO6c90JaY45F+CU1diWzUek6H+MTRKPwxVB2YcWX+dmcUS6utT/poPaVruC/XF0Fthy+7RmoYoI2793R4UThtfw+UH0RfOXH6YLttk9cAzxWquM4R9kYIHFdWNt/h4HDsXgbPT0CSnxW+1queOrbOMw54WcMm0YeZMWTD7tkmB9yDJSzI9XyvTU4HyDK8RlcZTLj6TQ0bgJm25XHCXr9PZv9ElqHX+PFf5qTLr/uUDxD5Pk8kcgyHX+E/L8tYELGVTkG/G/huTWiHp7h+7kAkF/bGTLPV2ivZ5tn2U5KwMjv9fGWI28+uJ0XvwJNLR1QsGUX3gsWLHbTvYPgCg6cPLymN1vnnsris6oEy8PDM/1Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(136003)(396003)(39860400002)(366004)(376002)(52536014)(478600001)(186003)(966005)(83380400001)(9686003)(26005)(38070700005)(55016003)(5660300002)(8936002)(6916009)(86362001)(7696005)(3480700007)(6506007)(53546011)(122000001)(2906002)(41300700001)(33656002)(66946007)(66556008)(38100700002)(316002)(4326008)(76116006)(71200400001)(8676002)(64756008)(66476007)(66446008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K2tIMnVlZTc3OWgyaVRaTS9KRWRZUy9HR0ZCUDZ5ZkUzQ0dJMjg2d0x2cVM0?=
 =?utf-8?B?dGk3Mnk2K2xiNWwzNjZNWTZzaXdQM1FBUW12d01sL3pUdldHRHo0a2JZODlK?=
 =?utf-8?B?NlYvYlRvYnpNNzZrb3JZdnZGMXNIYTUyNzFYNGcrb2RWWTVkM0tUS2pIWHpG?=
 =?utf-8?B?b3NmTmVKWGIrajJCMVk2Mzg1dlVxdlBONTdkVXMvOTJITkovbWRPVHpPZzFW?=
 =?utf-8?B?aFVRQzZHUWFwT0tWdnVqdmgzQm5EWHRQSE5yQ3MrV1oxTUlYV2tLOEdWaTB3?=
 =?utf-8?B?T3BwWjl6dHNoaUVmanNZeHR1YkptRXBFRzRyVnAxM0Y4ejRzTmpBMGQwVlBa?=
 =?utf-8?B?WDhnZlN5eGhHVm82cFFCNllGNjJaRW9GUmFXMTEyeXpiWXBqczZuZldheURX?=
 =?utf-8?B?Q095Nm9pMW1RMEw1ek9JK3NNUHpBclBFYTJZQmlSVUZWQkY1eXgvOUlDMldE?=
 =?utf-8?B?R1hPRFFLZGhQSTJvQk9DUU9WVHEyaUFYNDlOcDROSGdGVzlmWkF0ZGxpY1l6?=
 =?utf-8?B?bGZpN1V1dytOSGxiL2pvMlc2c0N6ZVJUT2VMSTVPcW1YWU50bXdsdXJUWnpT?=
 =?utf-8?B?NUc3K0tyTE56dHZibHdnbFVEanBMdDdocGVPK1hZVWVKT3pOdktzY2tmVTBS?=
 =?utf-8?B?OVl2dDZ6V014aEZETzJoRTY0bkxLTGZWTWcydWxKUW9JN0Rpa0cwbTNPcUZx?=
 =?utf-8?B?NG5lbGNzLzRiTXFPN2ZicHFjV1BWZHI4OXVwQUN3akdiUC9obkt6NEpXZUMr?=
 =?utf-8?B?ckJCUE41R1FHdEt5N0ZYMi9xTlYwckNlRjV4Z1hpTlA4aUFudlkwZ3NFSlBU?=
 =?utf-8?B?M3dJSXQ0K2NxV3dOMnhTWnoyeWZSU1lCYzZvUVdJTnp4NVhCcFJHSjhZb2tJ?=
 =?utf-8?B?eXQ0bXpLYWNPd05zSS9aalpsZ1hQdHhycUZnVm9ZVTRsRnB5Z2NMSWpzMFRL?=
 =?utf-8?B?MUc2QmpuVTcxWWVRREdLOGU0UXp6VmxnaW41MG9jcmhLUFB4cnZvb0xkM0Zq?=
 =?utf-8?B?QnZYTmoybElrMXRYTVhHZUptbWhCd3pXWWlCcDZHWFRuOU5ucEhxdnVtMjZz?=
 =?utf-8?B?MVZUTC9ZU3UwcGlZeTM2MVFaL1hVK2ZBQ1p2VmR4TmN6amp6SmtvREFVMklI?=
 =?utf-8?B?MVV2TkZHODYvczdRUWlwT0Q1bDZ6R21MMFlqTzFueE5vK0tDV3BONUtSa2w2?=
 =?utf-8?B?R0RYSThQN2padDMvSnUxZ1dHUFU3S3J6MUdnclFJUGNRRjY1RUZaaDhmQVpQ?=
 =?utf-8?B?czNCdkR6VnJYSDdpSi9nZEdMejhHUlBXZ2t4QnpXUkhNOUVDcC8zQzRnQlNt?=
 =?utf-8?B?K1hMTEJWVXpwMnBWWE5oVlJxbGFWdjVLYzRZYU1FSXdFOVhQT3ppcVB6dE9E?=
 =?utf-8?B?TXY0NzFCTmtJZWZDT1E1aUp3L3E2aTV4Uld2eEZ6Snh3R3EyZURwUTExL2NJ?=
 =?utf-8?B?SThLbFM2Qk0yelhkeU1rMFE3aGdBdjhValhTdnV1ckdLZkpRSWJ4V0toUU9v?=
 =?utf-8?B?M3NYM0xJQUNreEdncE05bmRMUEF2aUhkb3dHN0hQR2JDQjl3ZjQxZ25mVkRS?=
 =?utf-8?B?V0pPM3kzd3dwYW9tSVR4WlQraDZ1K3pzK0VKYVMxLzBPZWM5d0VKY2J2ZmVC?=
 =?utf-8?B?akFYTkZnaHBVNVVwRUZaRGk4OTFLSnlHNExHN2VVZGROam14MnNWencyekd2?=
 =?utf-8?B?UWFodmZlL2VPcldObXRMK1JhS0JJcjY4cUgyM1Q5ZnJlb3FWZTVMb3Z0RG5a?=
 =?utf-8?B?cFJUZXFuSXZUSUZ4VTdIbjlaT0hoMVpRZFVXakZwajFsdHJDQ1cxd2pVVWpG?=
 =?utf-8?B?cXZ3a2NlaUc1RE93Y1dGUGljTmhxWU1OUkNndC9KbGlRNi9yU1pPMk9QaUs5?=
 =?utf-8?B?cGxhMzVUNmdRaGxSOU9JY3ZzS0t0V1diWmloNWU2TkRUUXAwWFZOcU9teVNT?=
 =?utf-8?B?WnoyWitIcmNZTjNWNEZoNkNkUUN4b3V3NkdycEpjdGpGb24xOWdrbFNzamNO?=
 =?utf-8?B?bDNpek5qZXBJRExWWEtLOTVYSUpNQllUTEROT2pEMVNZVTBUVEtzcDFqbkNL?=
 =?utf-8?B?YzJWVS9sTENkU3pGSGxDVXJPZFV4V2FPYVd5cDF3QkZWK0ZLSU9DQUJGVjh0?=
 =?utf-8?Q?0moVmkW7i/YM1WNyh5+mRrhcy?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f98a4cf-a8c3-4760-5ffe-08da6f2b983f
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2022 17:23:45.4288 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JxyYD37d1ExFz7RjPx0CJDHsrL4vF0Qt+bwEFJrHwEbpUFLDwIAf5NO1WgsS5D0bVFCugp0uc/WiJtPHtTxQiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR02MB8693
X-Proofpoint-GUID: WSleMwbTyke5ubIRvRQzGacUFhlrIpC6
X-Proofpoint-ORIG-GUID: WSleMwbTyke5ubIRvRQzGacUFhlrIpC6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-26_05,2022-07-26_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 priorityscore=1501 phishscore=0 impostorscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 clxscore=1015
 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207260067
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

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFJpY2hhcmQgSGVuZGVyc29u
IDxyaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnPg0KPiBTZW50OiBUdWVzZGF5LCBKdWx5IDI2
LCAyMDIyIDEwOjQxIEFNDQo+IFRvOiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2luYy5j
b20+DQo+IENjOiBxZW11LWRldmVsIDxxZW11LWRldmVsQG5vbmdudS5vcmc+DQo+IFN1YmplY3Q6
IGhleGFnb24gZG9ja2VyIHRlc3QgZmFpbHVyZQ0KPiANCj4gSGkgVGF5bG9yLA0KPiANCj4gT25l
IG9mIHlvdXIgcmVjZW50IGhleGFnb24gdGVzdHN1aXRlIGNoYW5nZXMgaXMgaW5jb21wYXRpYmxl
IHdpdGggdGhlDQo+IGRvY2tlciBpbWFnZSB0aGF0IHdlJ3JlIHVzaW5nOg0KPiANCj4gdGVzdHMv
dGNnL2hleGFnb24vbXVsdGlfcmVzdWx0LmM6Nzk6MTY6IGVycm9yOiBpbnZhbGlkIGluc3RydWN0
aW9uDQo+IA0KPiAgICBhc20gdm9sYXRpbGUoIiUwLHAwID0gdm1pbnViKCUyLCAlMylcblx0Ig0K
PiANCj4gICAgICAgICAgICAgICAgIF4NCj4gDQo+IDxpbmxpbmUgYXNtPjoxOjI6IG5vdGU6IGlu
c3RhbnRpYXRlZCBpbnRvIGFzc2VtYmx5IGhlcmUNCj4gDQo+ICAgICAgICAgIHIzOjIscDAgPSB2
bWludWIocjE6MCwgcjM6MikNCj4gDQo+ICAgICAgICAgIF4NCj4gDQo+IDEgZXJyb3IgZ2VuZXJh
dGVkLg0KPiANCj4gDQo+IENhbiB3ZSB0cnkgYWdhaW4gdG8gdXBkYXRlIGRlYmlhbi1oZXhhZ29u
LWNyb3NzPyAgSSByZWNhbGwgdGhhdCBsYXN0IHRpbWUNCj4gdGhlcmUgd2FzIGEgY29tcGlsZXIg
YnVnIHRoYXQgcHJldmVudGVkIGZvcndhcmQgcHJvZ3Jlc3MuICBQZXJoYXBzIHRoYXQgaGFzDQo+
IGJlZW4gZml4ZWQgaW4gdGhlIGludGVyaW0/DQo+IA0KPiBJJ20gd2lsbGluZyB0byBhY2NlcHQg
c3VjaCBhbiB1cGRhdGUgaW4gdGhlIG5leHQgd2VlayBiZWZvcmUgcmMxLCBidXQgaWYgd2UNCj4g
Y2FuJ3QgbWFuYWdlIHRoYXQgd2UnbGwgbmVlZCB0byBkaXNhYmxlIHRoZSBmYWlsaW5nIHRlc3Qo
cz8pLiAgVGhhbmtzIGluDQo+IGFkdmFuY2UsDQo+IA0KPiANCj4gcn4NCg0KSGkgUmljaGFyZCwN
Cg0KU29tZSBvZiB0aGUgdGVzdHMgcmVxdWlyZSB0aGUgLW12NjcgZmxhZyB0byBiZSBwYXNzZWQg
dG8gdGhlIGNvbXBpbGVyIGJlY2F1c2UgdGhleSBoYXZlIGluc3RydWN0aW9ucyB0aGF0IGFyZSBu
ZXcgaW4gdjY3Lg0KDQpUaGlzIHBhdGNoDQpjb21taXQgY2QzNjJkZWZiYmQwOWNiYmMwOGIzYmI0
NjUxNDE1NDI4ODdiOGNlZg0KQXV0aG9yOiBQYW9sbyBCb256aW5pIDxwYm9uemluaUByZWRoYXQu
Y29tPg0KRGF0ZTogICBGcmkgTWF5IDI3IDE2OjM1OjQ4IDIwMjIgKzAxMDANCg0KICAgIHRlc3Rz
L3RjZzogbWVyZ2UgY29uZmlndXJlLnNoIGJhY2sgaW50byBtYWluIGNvbmZpZ3VyZSBzY3JpcHQN
Cg0KTW92ZWQgdGhpcyBsaW5lIGZyb20gdGVzdHMvdGNnL2NvbmZpZ3VyZS5zaCB0byB0aGUgbWFp
biBjb25maWd1cmUgc2NyaXB0DQo6ICR7Y3Jvc3NfY2NfY2ZsYWdzX2hleGFnb249Ii1tdjY3IC1P
MiAtc3RhdGljIn0NCg0KDQpIb3dldmVyLCB0aG9zZSBmbGFncyBhcmVuJ3QgYWN0dWFsbHkgcGFz
c2VkIHRvIHRoZSBjb21waWxlciBhbnkgbW9yZSAtIGF0IGxlYXN0IGJ5IGRlZmF1bHQuDQoNClRo
ZSBnaXRsYWIgYnVpbGRlciBpcyBwYXNzaW5nDQpodHRwczovL2dpdGxhYi5jb20vcWVtdS1wcm9q
ZWN0L3FlbXUvLS9qb2JzLzI3NzE1MjgwNjYNClNvLCB0aGVyZSBtdXN0IGJlIHNvbWV0aGluZyBp
biAkTUFLRV9DSEVDS19BUkdTDQoNCkkgdXNlIHRoZSBmb2xsb3dpbmcgd2hlbiBJIHJ1bg0KbWFr
ZSBFWFRSQV9DRkxBR1M9Jy1tdjY3IC1PMicgY2hlY2stdGNnDQoNCg0KU28sIHdlIHByb2JhYmx5
IGRvbid0IG5lZWQgYSBuZXcgZG9ja2VyIGltYWdlLiAgRG8gb3RoZXIgdGFyZ2V0cyBoYXZlIHRo
ZWlyIGNyb3NzX2NjX2NmbGFncz8gIFBsZWFzZSBhZHZpc2UuDQoNClRoYW5rcywNClRheWxvcg0K
DQo=

