Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB7C318CA0
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 14:53:03 +0100 (CET)
Received: from localhost ([::1]:47320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lACP0-0006ZD-3i
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 08:53:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andreas.konopik@efs-auto.de>)
 id 1lACLb-0002Q7-II
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 08:49:31 -0500
Received: from mailin4.audi.de ([143.164.102.18]:49934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andreas.konopik@efs-auto.de>)
 id 1lACLZ-0003ge-Ap
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 08:49:31 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bADjasxCtQZYeVADv/IaNbmP7WIkgo3TaI3/cEpXAx41E8RYzoRDoU82RHNbQyUjsmcMmJqfu/9YLfgSwrI04AVfcSnRYTFZazB60i2Cg9d9flHAELF2RUv1gv6tq34/q29yj4Wsu0dyoGpq+M2htUq5Wa53VOrctMuMgc+Wv6CdDDldF6mvGzI1ozdKULAmdDa4JMGifQUacA+lnbHJo9tZ/qgKeQHYdZRcX3zcl03vxBYKUoxlU9iyxHx1uLknSlXMFaVEdIsgi8e1q3RBluxyFJHuETw6ijgq3zlV7L/5gGOQUbb1LHyFMWMyf7jZTO1lpJdhi53vAPw2guEwQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OAm/UAO4ZT3Vu9laAz1e0tYXHZrlbUgPkkEcTRh6joA=;
 b=Dye8zkkhNiWa+Dh7nGJaTVjFgOhO8xnaeXK/1/gA9INTQyPuQKXCDGwd8fLmGKyPTItau7YvafWJjb+rW98za8eAymj8MZyMHaWT4H4A2ZoIlTI8+qsG7vDyqIVLYuQN34w/2PylXPqyxVEeuZXMFYpZLis05uFbDbTejRpmsh8DvslMnlNFvIxzx4OXfEpg5skIfk9YAIVYyACGb1pPcB9rtKQJy2JtjetDduvCGG0rYJbFdBjE91xY7b2wVxpVBRsuxWExcURbVmvqjrAm7ezcur3U5JlL3qoAIl8D4iQ1zpWZZ3R7anl1/3OxHA7TsLqnha+tyX1bG11RGHMEXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efs-auto.de; dmarc=pass action=none header.from=efs-auto.de;
 dkim=pass header.d=efs-auto.de; arc=none
From: "Konopik, Andreas (EFS-GH2)" <andreas.konopik@efs-auto.de>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>, "David
 Brenken" <david.brenken@efs-auto.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v2 1/1] tricore: fixed faulty conditions for extr and imask
Thread-Topic: [PATCH v2 1/1] tricore: fixed faulty conditions for extr and
 imask
Thread-Index: AQHXAGykLN0Ym42isEOK7sP24QJHR6pS3OqAgAAA00A=
Date: Thu, 11 Feb 2021 13:49:14 +0000
Message-ID: <DB8PR05MB61074744610D1B29FDAC9F49B08C9@DB8PR05MB6107.eurprd05.prod.outlook.com>
References: <20210211115329.8984-1-david.brenken@efs-auto.org>
 <20210211115329.8984-2-david.brenken@efs-auto.org>
 <fdd6bbdb-a943-3e38-3b83-9c4af95ff6fd@amsat.org>
In-Reply-To: <fdd6bbdb-a943-3e38-3b83-9c4af95ff6fd@amsat.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_b1c9b508-7c6e-42bd-bedf-808292653d6c_Enabled=True;
 MSIP_Label_b1c9b508-7c6e-42bd-bedf-808292653d6c_SiteId=2882be50-2012-4d88-ac86-544124e120c8;
 MSIP_Label_b1c9b508-7c6e-42bd-bedf-808292653d6c_Owner=andreas.konopik@efs-auto.de;
 MSIP_Label_b1c9b508-7c6e-42bd-bedf-808292653d6c_SetDate=2021-02-11T13:49:12.1306279Z;
 MSIP_Label_b1c9b508-7c6e-42bd-bedf-808292653d6c_Name=Internal;
 MSIP_Label_b1c9b508-7c6e-42bd-bedf-808292653d6c_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_b1c9b508-7c6e-42bd-bedf-808292653d6c_ActionId=408f2c69-ef07-402d-b0bd-052586f1a0f3;
 MSIP_Label_b1c9b508-7c6e-42bd-bedf-808292653d6c_Extended_MSFT_Method=Automatic
authentication-results: amsat.org; dkim=none (message not signed)
 header.d=none;amsat.org; dmarc=none action=none header.from=efs-auto.de;
x-originating-ip: [165.225.27.151]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c41d9a72-7315-4f7d-692b-08d8ce93d1c2
x-ms-traffictypediagnostic: DB9PR05MB8316:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB9PR05MB83169DB0A8A9139249883383B08C9@DB9PR05MB8316.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Sj8Soemme2E65TNV7WszL6vIKTTKP3+OtkfYMipUEGHC2wjPAsfTobKMDPnUU8OlSO21T3K2PBtajKGZt5PgOM0d8Yg71uL6Lo7wYt/0U6YvTv9RvMPeGYR0UUwc22qX2+IfE5Pd0pwdv3r7MQKIuJEYUTq2oCpx4VEA+Lj0Rgmo+rEEVUlghWO6m3ctZ1H1/5gn0WFuFfsAkAs8dFx8XNUUsjT/dXXdremSichm9P6bDJg7aX7hHJt5aMYT/kyGQwW4MnIYMpw2Kd5rzeL6pcoNUocyo37lkZMJzLr+kEkRV/dN6p+ZUK79l0JW57bxbGT6w6Xpy7Cg8ywGHb2RIOyt8LOV7KJJD+m5VhEglLo0ku8GmqMPEvwPQAFpruU1H/V8o42BGS4oatcKS6xLnvhdxUfKkQcio/LmLCh2ffbwbT0kezYczbrsFBySJcZ5nxuXwLXDwOaUJLJ3V+ZQzOrL21MNHryV95lzCrfEnHaT+X2zAQYLCYwBQjFiYGzidCeFdzfvhle0T/PpTkBKpt9I207r2OSCxps0PtjbfCzu4wlSpytnncLORNXxUO4XKKnGoP8+ik6LeHg1tzgdVi9F8uzqi55vJ430qp+bbKo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB8PR05MB6107.eurprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(39860400002)(346002)(376002)(76116006)(66446008)(64756008)(66556008)(66476007)(66946007)(9686003)(55016002)(2906002)(966005)(4326008)(107886003)(7696005)(54906003)(8936002)(478600001)(8676002)(5660300002)(52536014)(110136005)(186003)(316002)(71200400001)(53546011)(26005)(86362001)(55236004)(6506007)(33656002)(83380400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?dlcvMlR3cTRsZ0RCSU53MEFDa21Bd1YzTnBBMjVJVGFFeHdkNDJkM3Uyc2hL?=
 =?utf-8?B?OGV5YlBoU1VIQUorMVdnby9MSWpxbEN1ME85ZElSWWFtYkh3OTU4dnRkMmR6?=
 =?utf-8?B?amYzazJBT05UQlZmdzBtbkNoRGRybWRQbGhYM2FYV2pSbmE0Qm1WZi9lSHhV?=
 =?utf-8?B?Qk1UbkVkc0NybG1DR0sySUVhQ2RWV0kwQ1FKeUZ6VzdJYTE0TUQvZkJBR01H?=
 =?utf-8?B?c0RDTWdwdUlPS1FVKy9MRWRkRFl6WXE2TFQrY244UVk5TUVQeTZNN0t0bXJU?=
 =?utf-8?B?cW9SdzhUK3ZuN0NkeE5xN1M5bDdXbHJYVDl2N2ZjcS8yMEJzZHZhTWhlQktU?=
 =?utf-8?B?dlhoR3dnMFZsNlAxaWxDdWEyVnd5Q1BHM0JxQkNQenJjYmI3dG9VNCs5ak5H?=
 =?utf-8?B?VEdJZTNTSFpTcFd4VDJSd2RQTk5zUHRhbHNqeVZ4MDhsNDhHMEU2UVc1R2lq?=
 =?utf-8?B?U3hVVFQxbXJ3eThESUZXQkJvSlVyWUJJSHlROFpaUW1tRk0yQWVzS0ZSUjBT?=
 =?utf-8?B?TmluZmpJU3dzMzRDR2dFS2RyTDd1RGIvOHRjRC9wVVVndVMzNEx6WC9lcG82?=
 =?utf-8?B?NWNVYnNVVS82bXFBRDVWY004b1hZN3I1eHVCMjg5QXFpeE1wVFZkYW9CaXg4?=
 =?utf-8?B?VkswWE11NGZhUE1GWnFPcjNvbEFrRUtlVEJId2pCQ0xSb1JKRm5BaWU3cHEx?=
 =?utf-8?B?a2c3WlNvSUh2OVhVblRQUlg1NmtBbTdwQjZ5bVg1OWZnUlVnVkNtTU9zditu?=
 =?utf-8?B?UUpWVDNaTFlkNkhLblI0UjdsNWYrTUlxZnlqdytWUmhrdW9oMEV6MmtzVFVB?=
 =?utf-8?B?azIvMVB6VktqS0d4UENCZ1AxMmhCQ2ZhWXhrVWY0U2xPeGN6T2JVNHJtSGJ6?=
 =?utf-8?B?ZDlWdkh2Z1RJNG5sODBJa3dlZC9PRVB6Z0pJTmVmMTN1UGR5RUc5aWJZKzl6?=
 =?utf-8?B?SVV1aGtxV21JREZWa0djUGJUWmVBMkVtLzRlMVJ0V1FmN3lxZzdxWE12TlRW?=
 =?utf-8?B?RmpjaVVVSkdyYzJQeVphS0U2WE1ZUlN2UkF1cUwyY3JHcXVmaCswdHltK2cy?=
 =?utf-8?B?ZHRvR0xyZitRdUIvZzZTNzk0WUlwUHRaZUMvdit1QXFGTm5CNUNhaHFiWVpv?=
 =?utf-8?B?a3RkVWswZDdmUWxPZmV2RERXa0tBTllWeHpDV2hFVWFLQUkzR2UzYmxSWWhh?=
 =?utf-8?B?UUZmQ2Y0RlV3RDFVeFZCR0JlU1l4YnNHQjFMbER4TlRXZ3pMTk11dEsrbVUz?=
 =?utf-8?B?UUo2OFpwdlVqdGdBeFA5SEJqUGF2MmN4Y01HMTJobkIwQ2tUMkNxRWl4cHA3?=
 =?utf-8?B?WSs0Y2kzVHkxRWgvR2hESXFmQXBKMklzTTdQaTZHWlhDT0FmQktxenRnRk1P?=
 =?utf-8?B?Z0k3TnFLcnpiNHk3SDU0ZnczWWF5Y1RvVTdoaU9pR1MzazlnU1NlZW5xTkRD?=
 =?utf-8?B?b3Y2SllFbElYTExHV3Z3c1A2Nk4zaWtMMm01bjJ4R25TN3F4dlh3OHlWZ2ZK?=
 =?utf-8?B?MWpNdGVZcXYwU1Rsc3pPVi9STlJTVDVEVDdwY3JMZWpjRmN4K2lqQUNxaGNG?=
 =?utf-8?B?dlJSWHM2KysvWTJJVHpoeWJ1NlExSERWR2NsN05TSE5kVVhac2YvVXQvOWl1?=
 =?utf-8?B?NmFwK2ZUYmxVck1uUGNoaGgwUDgxbHY4VWg5dTFWb2hYb2RibWNiTEJvd3l6?=
 =?utf-8?B?S3Y3VWxCL0MxNmVFMWpTbEQxVEp3eUNzUFN3bTBXQ01nWUJLUkN6UllJY0RH?=
 =?utf-8?Q?VzcI5FXOHfyZiARWedBS5ayXsizIB7+LiYSZmOW?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR05MB6107.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c41d9a72-7315-4f7d-692b-08d8ce93d1c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2021 13:49:14.6919 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2882be50-2012-4d88-ac86-544124e120c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7wLOHiq4Fnp+M7g4VRXV//g5ktkY4e8M+1gu5udmph4p/acaxxfP4W+MpmM3cm4kWTZcMxhqJqs1C9b0WI7OItklcB1YUmLR5yGHSDngk2g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR05MB8316
X-SGG-UMAMSID: 20210211134922Z46682mxmos05.wob.vw.vwg 1lACLU-000C8w-8l
X-SGG-RESULT: 20210211134922Z46682mxmos05.wob.vw.vwg C1:OK E1:OK MX1:OK BL:OK
 SPF:off CT: CM: SIP:10.186.25.209 SMF:andreas.konopik@efs-auto.de
X-SGG-MF: andreas.konopik@efs-auto.de
X-SGG-DKIM-Signing: 7af5e6687a8e0ef81b3da7a89c6afb54
X-TM-AS-GCONF: 00
Received-SPF: none client-ip=143.164.102.18;
 envelope-from=andreas.konopik@efs-auto.de; helo=mailin4.audi.de
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_SBL_CSS=3.335,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: "kbastian@mail.uni-paderborn.de" <kbastian@mail.uni-paderborn.de>, "Brenken,
 David \(EFS-GH5\)" <david.brenken@efs-auto.de>, "Hofstetter, Georg
 \(EFS-GH2\)" <georg.hofstetter@efs-auto.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SGkgUGhpbGlwcGUsDQoNCj4gRnJvbTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxpcHBl
Lm1hdGhpZXUuZGF1ZGVAZ21haWwuY29tPiBPbg0KPiBCZWhhbGYgT2YgUGhpbGlwcGUgTWF0aGll
dS1EYXVkw6kNCj4gU2VudDogVGh1cnNkYXksIEZlYnJ1YXJ5IDExLCAyMDIxIDEzOjEwDQo+IEhp
IERhdmlkIGFuZCBBbmRyZWFzLA0KPiANCj4gT24gMi8xMS8yMSAxMjo1MyBQTSwgRGF2aWQgQnJl
bmtlbiB3cm90ZToNCj4gPiBGcm9tOiBBbmRyZWFzIEtvbm9waWsgPGFuZHJlYXMua29ub3Bpa0Bl
ZnMtYXV0by5kZT4NCj4gDQo+IEhlcmUgaXMgYSBnb29kIHBsYWNlIHRvIGV4cGxhaW4gd2h5IHlv
dSBuZWVkIHRoaXMgY2hhbmdlLCBob3cgZGlkIHlvdQ0KPiBub3RpY2VkIGl0IChleGFtcGxlIG9m
IG9wY29kZSBhbmQgY29uZGl0aW9ucyByZWFjaGluZyB0aGlzIGlzc3VlKSAtIGV2ZW50dWFsbHkN
Cj4gcHJvdmlkZSBhIHJlcHJvZHVjZXIgKGFzbSBkdW1wIGNvdWxkIGJlIGVub3VnaCkgLSBhbmQg
YWxzbyBldmVudHVhbGx5IGENCj4gcmVmZXJlbmNlIHRvIHRoZSBtYW51YWwgKGNoYXB0ZXIsIHRh
YmxlKSBqdXN0aWZ5aW5nIHlvdXIgY2hhbmdlLg0KPiANCj4gU2VlIGFsc286DQo+IGh0dHBzOi8v
dGJhZ2dlcnkuY29tLzIwMDgvMDQvMTkvYS1ub3RlLWFib3V0LWdpdC1jb21taXQtbWVzc2FnZXMu
aHRtbA0KPiBodHRwczovL2NocmlzLmJlYW1zLmlvL3Bvc3RzL2dpdC1jb21taXQvI3doeS1ub3Qt
aG93DQoNCkkgYXBwcmVjaWF0ZSB5b3VyIGZlZWRiYWNrIGFuZCB3aWxsIHdyaXRlIG1vcmUgdmVy
Ym9zZSBjb21taXQgbWVzc2FnZXMgaW4NCnRoZSBmdXR1cmUuDQoNCkFjY29yZGluZyB0byB0aGUg
VEMgMS4zLjEuIEFyY2hpdGVjdHVyZSBNYW51YWwgWzE7IHBhZ2UgMTc0XSwgcmVzdWx0cyBhcmUN
CnVuZGVmaW5lZCwgaWYgcG9zICsgd2lkdGggPiAzMiBvciBpZiB3aWR0aCA9IDAuDQoNCldlIGZv
dW5kIHRoaXMgZXJyb3IgYmVjYXVzZSBvZiBhIGRpZmZlcmVudCBiZWhhdmlvciBiZXR3ZWVuIHFl
bXUtdHJpY29yZQ0KYW5kIHRoZSByZWFsIHRyaWNvcmUgcHJvY2Vzc29yLiBGb3IgcG9zICsgd2lk
dGggPSAzMiwgcWVtdS10cmljb3JlIGRpZCBub3QNCmdlbmVyYXRlIGFueSBpbnRlcm1lZGlhdGUg
Y29kZSBhbmQgcmFuIGludG8gYSBkaWZmZXJlbnQgc3RhdGUgY29tcGFyZWQgdG8NCnRoZSByZWFs
IGhhcmR3YXJlLg0KDQpJIGhvcGUgdGhpcyBoZWxwcyENCg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1i
eTogQW5kcmVhcyBLb25vcGlrIDxhbmRyZWFzLmtvbm9waWtAZWZzLWF1dG8uZGU+DQo+ID4gU2ln
bmVkLW9mZi1ieTogR2VvcmcgSG9mc3RldHRlciA8Z2VvcmcuaG9mc3RldHRlckBlZnMtYXV0by5k
ZT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBEYXZpZCBCcmVua2VuIDxkYXZpZC5icmVua2VuQGVmcy1h
dXRvLmRlPg0KPiA+IC0tLQ0KPiA+ICB0YXJnZXQvdHJpY29yZS90cmFuc2xhdGUuYyB8IDggKysr
Ky0tLS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMo
LSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS90YXJnZXQvdHJpY29yZS90cmFuc2xhdGUuYyBiL3Rh
cmdldC90cmljb3JlL3RyYW5zbGF0ZS5jDQo+ID4gaW5kZXggNzc1MjYzMGFjMS4uZWJlZGRmOGY0
YSAxMDA2NDQNCj4gPiAtLS0gYS90YXJnZXQvdHJpY29yZS90cmFuc2xhdGUuYw0KPiA+ICsrKyBi
L3RhcmdldC90cmljb3JlL3RyYW5zbGF0ZS5jDQo+ID4gQEAgLTU3NzcsOCArNTc3Nyw4IEBAIHN0
YXRpYyB2b2lkIGRlY29kZV9yY3B3X2luc2VydChEaXNhc0NvbnRleHQNCj4gKmN0eCkNCj4gPiAg
ICAgIHN3aXRjaCAob3AyKSB7DQo+ID4gICAgICBjYXNlIE9QQzJfMzJfUkNQV19JTUFTSzoNCj4g
PiAgICAgICAgICBDSEVDS19SRUdfUEFJUihyMik7DQo+ID4gLSAgICAgICAgLyogaWYgcG9zICsg
d2lkdGggPiAzMSB1bmRlZmluZWQgcmVzdWx0ICovDQo+ID4gLSAgICAgICAgaWYgKHBvcyArIHdp
ZHRoIDw9IDMxKSB7DQo+ID4gKyAgICAgICAgLyogaWYgcG9zICsgd2lkdGggPiAzMiB1bmRlZmlu
ZWQgcmVzdWx0ICovDQo+ID4gKyAgICAgICAgaWYgKHBvcyArIHdpZHRoIDw9IDMyKSB7DQo+ID4g
ICAgICAgICAgICAgIHRjZ19nZW5fbW92aV90bChjcHVfZ3ByX2RbcjIrMV0sICgoMXUgPDwgd2lk
dGgpIC0gMSkgPDwgcG9zKTsNCj4gPiAgICAgICAgICAgICAgdGNnX2dlbl9tb3ZpX3RsKGNwdV9n
cHJfZFtyMl0sIChjb25zdDQgPDwgcG9zKSk7DQo+ID4gICAgICAgICAgfQ0KPiA+IEBAIC02OTk5
LDcgKzY5OTksNyBAQCBzdGF0aWMgdm9pZA0KPiA+IGRlY29kZV9ycnB3X2V4dHJhY3RfaW5zZXJ0
KERpc2FzQ29udGV4dCAqY3R4KQ0KPiA+DQo+ID4gICAgICBzd2l0Y2ggKG9wMikgew0KPiA+ICAg
ICAgY2FzZSBPUEMyXzMyX1JSUFdfRVhUUjoNCj4gPiAtICAgICAgICBpZiAocG9zICsgd2lkdGgg
PD0gMzEpIHsNCj4gPiArICAgICAgICBpZiAocG9zICsgd2lkdGggPD0gMzIpIHsNCj4gPiAgICAg
ICAgICAgICAgLyogb3B0aW1pemUgc3BlY2lhbCBjYXNlcyAqLw0KPiA+ICAgICAgICAgICAgICBp
ZiAoKHBvcyA9PSAwKSAmJiAod2lkdGggPT0gOCkpIHsNCj4gPiAgICAgICAgICAgICAgICAgIHRj
Z19nZW5fZXh0OHNfdGwoY3B1X2dwcl9kW3IzXSwgY3B1X2dwcl9kW3IxXSk7IEBADQo+ID4gLTcw
MjEsNyArNzAyMSw3IEBAIHN0YXRpYyB2b2lkIGRlY29kZV9ycnB3X2V4dHJhY3RfaW5zZXJ0KERp
c2FzQ29udGV4dA0KPiAqY3R4KQ0KPiA+ICAgICAgICAgIGJyZWFrOw0KPiA+ICAgICAgY2FzZSBP
UEMyXzMyX1JSUFdfSU1BU0s6DQo+ID4gICAgICAgICAgQ0hFQ0tfUkVHX1BBSVIocjMpOw0KPiA+
IC0gICAgICAgIGlmIChwb3MgKyB3aWR0aCA8PSAzMSkgew0KPiA+ICsgICAgICAgIGlmIChwb3Mg
KyB3aWR0aCA8PSAzMikgew0KPiA+ICAgICAgICAgICAgICB0Y2dfZ2VuX21vdmlfdGwoY3B1X2dw
cl9kW3IzKzFdLCAoKDF1IDw8IHdpZHRoKSAtIDEpIDw8IHBvcyk7DQo+ID4gICAgICAgICAgICAg
IHRjZ19nZW5fc2hsaV90bChjcHVfZ3ByX2RbcjNdLCBjcHVfZ3ByX2RbcjJdLCBwb3MpOw0KPiA+
ICAgICAgICAgIH0NCj4gPg0KDQpbMV0gaHR0cHM6Ly93d3cuaW5maW5lb24uY29tL2RnZGwvdGNf
djEzMV9pbnN0cnVjdGlvbnNldF92MTM4LnBkZj9maWxlSWQ9ZGIzYTMwNDQxMmI0MDc5NTAxMTJi
NDA5YjZkZDAzNTINCg0KSU5URVJOQUwNCg==

