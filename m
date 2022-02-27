Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1D94C5A1F
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 10:09:56 +0100 (CET)
Received: from localhost ([::1]:47984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOFYv-00085i-UB
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 04:09:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <amir.gonnen@neuroblade.ai>)
 id 1nOFWf-0007Mg-HG
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 04:07:33 -0500
Received: from mail-vi1eur05on2133.outbound.protection.outlook.com
 ([40.107.21.133]:5056 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <amir.gonnen@neuroblade.ai>)
 id 1nOFWd-0003Iz-Dd
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 04:07:33 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iLqxa/WgB8VRcRUekKIWUm5PRXs7CoqJxAIzQ9qbKsh1xwR1JHWzN+oG1YWP5K2QEASCZkRJUu3t9lq+GD8doLq6qYZta8cCjN39gKKXSbK9dtEuGaNHN/bHvXqTzm+xElTlQ3g7D3RRAtEXtJtupA6mtf1diy3yh4nWTuwWtoD65FNmev5dXLoRNZpXF3P5/IalhsbOlY54NFcU7DdEPpkjBqvloe9AxUEzMyAZmXqPRl5bLwx5nvZV3r6oVF7PasSXYjEH6TzYL6L4/LOF87S4yROC1cx4OVX9SSZ+kuN9VxNoLeFmSNpbf5AUHH6ie+B0m0U01sr3ZDt3aajzqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lrN+KsYyehRgGJV9GlcAr4dyCZbIEtlWWmO2AAUSlAA=;
 b=mIpZWJTg77j3QCrEtXUk4hVWT1i16jTwf2lg2Vu0/QGtTzoIR87gZBTpwkdGV/IjqEqYXtTrq4k4YpU7nBKBcaDjbJfa4w1gaxUZZTiicshdqGQNx6jMcn3v8FiQTQ+k/BBCtQVwZVzewMS6c+lRw4kZeoV+t70na3JPxF/BskGAX5eylzcShmGiaf4u2bSGgBYH1WcZt/XZM0aQg67Eo6p64+8z+sL/R/S/P3Sn2G2N3ZLw9V/XB1N4fvaGBQZHvLTQYzJi1LpslDhJIhdTU221OdwIMD5yEU7kvT4dd//jCYcGTokU5A4VTP0eeAAuqSnXpERpj/gNDv5Rq4IiHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=neuroblade.ai; dmarc=pass action=none
 header.from=neuroblade.ai; dkim=pass header.d=neuroblade.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NeuroBlade.onmicrosoft.com; s=selector2-NeuroBlade-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lrN+KsYyehRgGJV9GlcAr4dyCZbIEtlWWmO2AAUSlAA=;
 b=WVtfXMLqGJ+hTKOAFR0RyJ5fue0NZn5UdcwNtzMlQQ24Tz6/Ww8oJGKwnEIoM8QkFKgKFJ0rsRcVEL4IUKxVE0aBWK3QM5V9xIYNvUOtcD+QzB7W3rBvj153DD9oL9xgweyAwsjsavBCxgg4V6CPeiUKy3Xgv/g1n53c/P6nk8Q=
Received: from PA4PR09MB4880.eurprd09.prod.outlook.com (2603:10a6:102:e0::15)
 by AM0PR09MB2305.eurprd09.prod.outlook.com (2603:10a6:208:e0::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Sun, 27 Feb
 2022 08:46:25 +0000
Received: from PA4PR09MB4880.eurprd09.prod.outlook.com
 ([fe80::4c3d:dc4c:6ad0:6e5e]) by PA4PR09MB4880.eurprd09.prod.outlook.com
 ([fe80::4c3d:dc4c:6ad0:6e5e%6]) with mapi id 15.20.5017.026; Sun, 27 Feb 2022
 08:46:25 +0000
From: Amir Gonnen <amir.gonnen@neuroblade.ai>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: RE: [PATCH v2 4/4] hw/nios2: Machine with a Vectored Interrupt
 Controller
Thread-Topic: [PATCH v2 4/4] hw/nios2: Machine with a Vectored Interrupt
 Controller
Thread-Index: AQHYKYVpkKZ4Pgm5RUSL/6zGEKkW5KykONSAgALTpIA=
Date: Sun, 27 Feb 2022 08:46:25 +0000
Message-ID: <PA4PR09MB4880989C96EBDDDF97B82EDDEB009@PA4PR09MB4880.eurprd09.prod.outlook.com>
References: <20220224134901.500007-1-amir.gonnen@neuroblade.ai>
 <20220224134901.500007-5-amir.gonnen@neuroblade.ai>
 <CAFEAcA8ANLW1hKxKYZrOYA3d7be-12otK2H+6nDd-9R-PK=CDg@mail.gmail.com>
In-Reply-To: <CAFEAcA8ANLW1hKxKYZrOYA3d7be-12otK2H+6nDd-9R-PK=CDg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=neuroblade.ai;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6a4084d2-40fd-4b0b-f96d-08d9f9cda375
x-ms-traffictypediagnostic: AM0PR09MB2305:EE_
x-microsoft-antispam-prvs: <AM0PR09MB2305C4A40EFFB7252D311D25EB009@AM0PR09MB2305.eurprd09.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pia6FQJiUXXf9thFH9JT+x747eiBSZdkxNXrqeypPUBwvslkWa+lXARnRbbf2ypNVoEtCzE1SG0qAuuAqKTrJCl1TO1gi40B0eViEbbUlqFD68n82u4eh0qRFJMfa9klYTLGmTkxKRbwLYYs0MjTl3IwoAbg9EdLziSUSGqoS3VmB50Rtm1hwrOxqhtY3IFdOpWs+oNq1SZGoe2Xa6634StDNxLDg3UPfc3J8xac851m7ZhXxSz5rgKAYUlyQjf/fc/q8ULCo2qmBePh+UIi6cZaV/rupfzpy32wzGgS4PShJkOiIuFFuCL1gkY5o7YY8ZUtdtAXOYiE+hF56TTPVejCnrWMSl03v/LNRjxb7q1OrWYPELpyiAyH4InuMyHmEzDvBCjYKPoZ1is2rc7y1agA5DYVOMZsuuvZaaH4tygPy3invGi3tzTBcxizwBLiOkqqTxUnfgQr1gITIGsmbYVOwBH8epbzxwu0V1NNoe80psKX5IVg/Yjr1206eQ23irtq58af8AD/wQ7w5ZBNZIET13GjlQ+YNiUcAaxfq8Usqz0vIbwgfkDUcCi0qMTA4TvKaj47WwGLBo26kfWKXaJB589xiHswwFMLOa96jNs5juCLfBJmGmutkR2/Jl22znRyr94zDmK+W5Srkh5nZrabmJpBqapDhePxagICRXJdK5tHesDhXan0kwdCmKwZGBr6NeWGSJOR2X8S8QRlotYcPv5yHCfcC2H7z/Oh4LZK8w90WDoSdaT33c2hJ45nSauW6E4MXD0R64y+6xPTZnP/Lw84BtQB6IXE4LylezQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR09MB4880.eurprd09.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(71200400001)(8676002)(9686003)(7696005)(6506007)(55016003)(38070700005)(76116006)(64756008)(4326008)(5660300002)(83380400001)(122000001)(186003)(26005)(66446008)(66476007)(86362001)(8936002)(38100700002)(52536014)(44832011)(6916009)(54906003)(316002)(2906002)(66556008)(33656002)(66946007)(508600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L0FNb2Z6bVFkR3VJSmJ6cnFhYUEwaDhKZ09sd3pIdXJrNmlkUWtFQm10dFBZ?=
 =?utf-8?B?RCtFMEE2K0V5b3FsY3ZsRGt6ZzZkRmxLS1pHMTc5ZlRwVzRNSzQ0M0VJaG45?=
 =?utf-8?B?RlpiT25EaFpNYi9ZbzBNSGlxMVdaUk13eEFTSy9ucE11emRNODlhem9RRDRT?=
 =?utf-8?B?N09qMVlveUhQL3NpVnhEdkpFOWFFb0l0YUFOSEt2UWNYc2hrbE1KcDNVUysr?=
 =?utf-8?B?ZFJoY2syOCtaYms1RytPWTVpNXI5UDRub0RzL1QwR3lvamdvV0pTZWdmOGJI?=
 =?utf-8?B?ZW84NWdNQzhJdytRb3ZGZ0h6bXQrSXl0b1ZXUnR5a0pDVmFVUVZyR2NONTE0?=
 =?utf-8?B?Unk1Y0hZNSt2OW45akZOR3MyN2NvMmZwMm9OVmZCRTRJZUlpKzlKMnBUNUR2?=
 =?utf-8?B?Q0RvaUtqMnhXWHQ1SVdFVzhsQmVIdENRYm5OSUZtcWNrMzdOYmFJbGpyZVN6?=
 =?utf-8?B?Q1Bsd3piM0RpMlFaTjBWTEJFQmtkOGpDQ2p5cHhhUXpQSGl4TFU0QjBZcmlj?=
 =?utf-8?B?K1hTdXN0VHZENHVRUUFrbDR6MGprYTFVQVhhQzRZN2F4VTJZdmdYMldqSi9i?=
 =?utf-8?B?L0lJOG5Xa3Rrc3FEQXFyWllpME9XTThoOUpXY0tBTW81QUpoNURvVHJOSHhq?=
 =?utf-8?B?WktZYitGbE03TE9aK1JtVTl0ZnRYWTBZSXNZNkNhTmFFMzU0MHRYQVI5RVdN?=
 =?utf-8?B?SEg5VnBrano4cFQxQm9nWG5VOVcxU2pHeGpITXdxTXZ3YzBwTkdobndDT3Fi?=
 =?utf-8?B?NitPQmhuS2ZPMXZlYkc3NGM0bEVHc1FuSGI4VmViUmNMTXpxOS9qZ2RMaEpj?=
 =?utf-8?B?U0l6V3Z3am44UnhhQ29DRjdUdUM5d01YTXZldWlpK1gzcnRCc0MxdWFRcmtt?=
 =?utf-8?B?enhnVW5zRjhuYmgrSnhPOHR2MldtMUZkWXI4RWxaVWh6K2xtVEdNRlYwSHdt?=
 =?utf-8?B?VWZSU0ZmbzJaYjE5WEtHNzJQUytRemNTSlNQdUJaUEJCbWxlNDZTS3hMcEZy?=
 =?utf-8?B?NjJhUzJuWDQ5WlRJY01qNnhCRkhYUXlWVnh0NGx6TjFLRjloTkN3R1BvTkQ4?=
 =?utf-8?B?dFNVT0JMWXNzVkxrR3RtY0laTXVwVFY3S1Z3QzJJclJQc2JGUEVrTFozSjZt?=
 =?utf-8?B?QWU1ZlgxNUIwU0NUSFQvbUV1Vnp2eFhhV2Y2ZG5BUU51U2plMUNKVXc5SG9n?=
 =?utf-8?B?ZDBVTkY5Mkl4T3l1QzZUTXF3Y3ZJSGxPNWpNekcxaWhKb29YbWpaaldIMFBC?=
 =?utf-8?B?TWFza2VocWdPK21BTTl6ZlRaUWNXQkdmWXFmdDFrVWFPVXlDcnEvTTVhOGI5?=
 =?utf-8?B?enVGQ2ZuMGQ3cTBXeGxFTmJFeVZZbFFXb3VDMTk2YmtidGQydjNxQk0zMjNo?=
 =?utf-8?B?MFFWTEVMc0NnazdCMTVDaFJhclNPVW9lMVZ6SURjSTZTNkwybjRPVUtyMVQx?=
 =?utf-8?B?MDVRTVhVYTJUdCt2UDIxNlJXaUdXYklFUkNXcHZZdEdLQjludjYrc2xCKzdK?=
 =?utf-8?B?dWg4dFpuZVg3bXRQOGxZOTRCY2dWS0pDcmZwR0NDSDJwenVBZS9Kb1JKQWdN?=
 =?utf-8?B?czIwSk1tZUR0ZjdhcGFOcnlOVElIUmR0N3JWVldhZ2M5ZWg0aGJBOWNibFIx?=
 =?utf-8?B?bGRQY1Z3Nk8vejhRVlNnOVBybzROeUpLU08xNk8wbTYvYjZqM3Q3SmxkVjJi?=
 =?utf-8?B?SWtQZDZELzBVKy8vUlVtV0xoOTlKY2YrZzZXK25FalI3WVZNUHVNMThzckJF?=
 =?utf-8?B?R1h5cWdhR2JyZEw1bEF6VGdjNWpKdEdVc1ZsUGcwdzdBMVlGMzhHUVl3enJt?=
 =?utf-8?B?OXlreEhTVzQrOVVxU0drbEY0NXBYdEEwWGRreGg3ZGExOW5pZmRpN2E5OWd6?=
 =?utf-8?B?VjVHa1kxQWppQWQrVTIxSkppZmlwSzhzczBxK1JtUkNKdmJjQzF4ODJ2enFW?=
 =?utf-8?B?MXl1M1B1dy81VzFFY3JVZzhGbHR4QUNydVZPRVVONVA3ZEZpd09iNHg4WE5v?=
 =?utf-8?B?dGx2Ty9LaEpxbGx2em94THB6aktQWEwyYlA0UXhoamYrSnN3YjEvMGFvS1pC?=
 =?utf-8?B?OEJCOEJidXY1aXlYL3d0VEdOZDJCQ01UQXBXZG5PYlhFWHNOOXUzY2NGZWdp?=
 =?utf-8?B?ZFU4MmYyV3B6WFhOSkZ4ZzRxdXZrUDdBMUFBQWFZVlVXUVl0QVczdDBTYm00?=
 =?utf-8?B?YURlNFhJVldMSkFyM0xUS2FsR04yQnRBNGFCSGFBaEY1eWNEb0FiSy9FeWJJ?=
 =?utf-8?B?S2huTFRTNi9Nem8rdFhqVWw5MDVRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: neuroblade.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR09MB4880.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a4084d2-40fd-4b0b-f96d-08d9f9cda375
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2022 08:46:25.5041 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 63c61203-65af-4cf8-98e5-d12f35edaefa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5PKwihwRCKYZEJuj7r9MQq55yeU0rDTWuV5mzXjW7wJwOChz4mfmRgDcbkYHuS57aqybC4PA6tyQ3gxJ3sJpF4h8FPxgJz9m1FpJL/rx7iw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR09MB2305
Received-SPF: pass client-ip=40.107.21.133;
 envelope-from=amir.gonnen@neuroblade.ai;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Cc: Marek Vasut <marex@denx.de>, Chris Wulff <crwulff@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SGkgUGV0ZXIsDQoNCj4gSXMgYSBWSUMgYSBjb25maWd1cmFibGUgb3B0aW9uIG9uIHRoZSByZWFs
IGhhcmR3YXJlICh3ZWxsLCBGUEdBIGltYWdlLCBJIGd1ZXNzKSB0aGF0IHRoaXMgYm9hcmQgaXMg
bW9kZWxsaW5nID8NCj4gSSBjb3VsZG4ndCBmaW5kIGFueSBkb2NzIG9uIGl0IHdpdGggYSBxdWlj
ayBnb29nbGUuDQoNClRoaXMgc3BlY2lmaWMgZXhhbXBsZS1ib2FyZCBmcm9tIEludGVsIGRvZXMg
bm90IHByb3ZpZGUgYSBWSUMgb3B0aW9uLCBhcyBmYXIgYXMgSSBrbm93LiAgKGh0dHBzOi8vZnBn
YWNsb3VkLmludGVsLmNvbS9kZXZzdG9yZS9wbGF0Zm9ybS8xNS4xLjAvU3RhbmRhcmQvbWF4MTAt
MTBtNTAtZGV2ZWxvcG1lbnQta2l0LWdocmQtd2l0aC1uaW9zLWlpZGRyM3FzcGktZmxhc2hldGhl
cm5ldG1zZ2RtYXVhcnRhZGMtd2l0aC1saW51eC8pDQpVbmZvcnR1bmF0ZWx5LCBJIGNvdWxkbid0
IGZpbmQgYSBwdWJsaWNseSBhdmFpbGFibGUgbmlvczIgYm9hcmQgd2l0aCBhIFZJQy4gSSd2ZSBh
ZGRlZCAiMTBtNTAtZ2hyZC12aWMiIGFzIGFuIGV4YW1wbGUgdG8gZGVtb25zdHJhdGUgaG93IHRv
IHdpcmUgVklDLg0KDQpJbiBwcmFjdGljZSwgd2UgdXNlIEludGVsIHRvb2xpbmcgKFF1YXJ0dXMg
UHJpbWUpIHRvIGdlbmVyYXRlIGJvdGggdGhlIGhhcmR3YXJlIChuaW9zMiArIHZpYyArIG90aGVy
IGRldmljZXMpIGFuZCB0aGUgc29mdHdhcmUgQlNQIHRoYXQgd29ya3Mgd2l0aCBpdC4NClRoYXQg
aXMgcHJvYmFibHkgdGhlIHJlZ3VsYXIgd29ya2Zsb3cuIFNpbmNlIG5pb3MyIGlzIGEgInNvZnQi
IGNwdSBvbiBhbiBGUEdBLCBlYWNoIG9uZSBnZW5lcmF0ZXMgdGhlaXIgb3duIGN1c3RvbSAiYm9h
cmQiIHdpcmVkIHdpdGggdGhlIGRldmljZXMgdGhleSBuZWVkLCBtZW1vcmllcyBldGMuDQpJbiB0
aGUgZnV0dXJlIEkgbWF5IGJlIGFibGUgdG8gc2hhcmUgTmV1cm9ibGFkZSdzIFFFTVUgbmlvczIg
Ym9hcmQgYmVjYXVzZSBpdCBpcyBxdWl0ZSBnZW5lcmljIC0gaXQgY29uc3VtZXMgYSBkZXZpY2Ug
dHJlZSwgcGFyc2VzIGl0LCBhbmQgd2lyZXMgZGV2aWNlcyBhY2NvcmRpbmcgdG8gaXQsIHNvIGl0
IGNhbiBhdXRvbWF0aWNhbGx5IG1hdGNoIHRoZSBnZW5lcmF0ZWQgSFcuDQoNCj4gQWxzbywgSSB3
b25kZXIgaWYgd2Ugc2hvdWxkIGhhdmUgYSB2aWMgbWFjaGluZSBvcHRpb24gdG8gdGhlIG1hY2hp
bmUgcmF0aGVyIHRoYW4gY3JlYXRpbmcgYSB3aG9sZSBuZXcgbWFjaGluZSB0eXBlPw0KDQpTdXJl
LCBpZiB5b3UgdGhpbmsgaXQgbWFrZXMgbW9yZSBzZW5zZS4NCkhvdyBkbyB5b3Ugc3VnZ2VzdCBk
b2luZyB0aGF0PyBBIGNsYXNzIHByb3BlcnR5IGZvciB0aGUgbmlvczIgbWFjaGluZSBjbGFzcz8g
T3IgaXMgdGhlcmUgc29tZSBvdGhlciBzdGFuZGFyZCB3YXkgZm9yIGFkZGluZyBhIG1hY2hpbmUg
c3BlY2lmaWMgb3B0aW9uPw0KDQpUaGFua3MsDQpBbWlyDQoNCg0KVGhlIGNvbnRlbnRzIG9mIHRo
aXMgZW1haWwgbWVzc2FnZSBhbmQgYW55IGF0dGFjaG1lbnRzIGFyZSBpbnRlbmRlZCBzb2xlbHkg
Zm9yIHRoZSBhZGRyZXNzZWUocykgYW5kIG1heSBjb250YWluIGNvbmZpZGVudGlhbCBhbmQvb3Ig
cHJpdmlsZWdlZCBpbmZvcm1hdGlvbiBhbmQgbWF5IGJlIGxlZ2FsbHkgcHJvdGVjdGVkIGZyb20g
ZGlzY2xvc3VyZS4gSWYgeW91IGFyZSBub3QgdGhlIGludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlz
IG1lc3NhZ2Ugb3IgdGhlaXIgYWdlbnQsIG9yIGlmIHRoaXMgbWVzc2FnZSBoYXMgYmVlbiBhZGRy
ZXNzZWQgdG8geW91IGluIGVycm9yLCBwbGVhc2UgaW1tZWRpYXRlbHkgYWxlcnQgdGhlIHNlbmRl
ciBieSByZXBseSBlbWFpbCBhbmQgdGhlbiBkZWxldGUgdGhpcyBtZXNzYWdlIGFuZCBhbnkgYXR0
YWNobWVudHMuIElmIHlvdSBhcmUgbm90IHRoZSBpbnRlbmRlZCByZWNpcGllbnQsIHlvdSBhcmUg
aGVyZWJ5IG5vdGlmaWVkIHRoYXQgYW55IHVzZSwgZGlzc2VtaW5hdGlvbiwgY29weWluZywgb3Ig
c3RvcmFnZSBvZiB0aGlzIG1lc3NhZ2Ugb3IgaXRzIGF0dGFjaG1lbnRzIGlzIHN0cmljdGx5IHBy
b2hpYml0ZWQuDQo=

