Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6606F524B
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:51:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu7Gl-0006GJ-Bz; Wed, 03 May 2023 03:51:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pu7Gh-0005wE-Pl
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:51:19 -0400
Received: from mail-vi1eur04on2103.outbound.protection.outlook.com
 ([40.107.8.103] helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pu7Gg-00071G-00
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:51:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V05qroTYR9pBrhd6wemuW+V9odg72s1FUWUKaBXBiOp0xQiAfT+h4I35yRKQQysUjs1uuB91RhMb+1vrpoFgtevZkI8GmwnQP9+mTW7H7e6tYrE/YZixykk92AuqQvihdHKygPDbkMcsdbGmffbVBhSZ/V48aWMBWnGwsSetKpIp4Ejbt2exEaNoPP4kClNejXQr+le/8vdZLr/l0pST9M/BkwhIy5n6HPTMQGu95Fvil02Mqm7wLazk2M76dv82ithqgOct7P7je7mzV8XBXUTbPCci6/X7bCMt+xLzk/KPwbBMuiDtSWUgClHNfW2ajT9Ooppl1xgzsbL7GVaZog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tiSDSsTUKXVbc1k49V75IszzNMB0ILj/YVRjyriFB6s=;
 b=AY2bAlZxR3yaCkmMIYDPX1zTjFrroGd4gf8kiR0FDuc6eu8rKVt5iIzzijS8Ij3hh9jyeHmD1/0+/26Pc3osKDQsV00zL/07ut6NNK5DdnYLF0P9vYEApvMksRv9vsC94Z7cktR2J1XX/srk3NJ6HGzGiTn/5+ooFvfWzEtC8zER5LN0csv8FjLj6HIFyw/BacshBWPbvztPBWxFz97nGuDod/sy2DW6DWOK04iBd/oXLV4OPHFSeyTU7lAtXdsqly11JOIzo99n89d15sgSVIGDvlEA6zfEJOgxW49pW5uJxY2XpjJoPjXd8VxKGgNx3y0jGxlBsRM4Sh38BTcqbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tiSDSsTUKXVbc1k49V75IszzNMB0ILj/YVRjyriFB6s=;
 b=PjFEtYSjRjirgDb02Dbrl2A1yZQmCaORcYR3XllzOdPRMreZyqBaVT5FT0B3+NMcG+AoNlO5MjFimTmRTgj1JhxJ8uGGdytba8GuWptdh50jbeyuoxOH1j+5vv7h/UdF68l32VcBrxU9y7wnxk2ERo+6pguJY9maUMi8C7autwI=
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by PAXP189MB1974.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:285::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Wed, 3 May
 2023 07:46:12 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::c697:dbef:e1d6:c2b5]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::c697:dbef:e1d6:c2b5%6]) with mapi id 15.20.6340.031; Wed, 3 May 2023
 07:46:12 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: "Tomasz Dzieciol/VIM Integration (NC) /SRPOL/Engineer/Samsung Electronics"
 <t.dzieciol@partner.samsung.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "akihiko.odaki@daynix.com"
 <akihiko.odaki@daynix.com>
CC: "jasowang@redhat.com" <jasowang@redhat.com>, "k.kwiecien@samsung.com"
 <k.kwiecien@samsung.com>, "m.sochacki@samsung.com" <m.sochacki@samsung.com>
Subject: RE: [PATCH v3 1/2] igb: RX descriptors handling cleanup
Thread-Topic: [PATCH v3 1/2] igb: RX descriptors handling cleanup
Thread-Index: AQHZePW5aviTQHUJQki/Yv0A7gREG69Dw19wgANHswCAAShSIA==
Date: Wed, 3 May 2023 07:46:12 +0000
Message-ID: <DBBP189MB1433AA631D3115FFE5D449E7956C9@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM>
References: <20230427104743.9072-1-t.dzieciol@partner.samsung.com>
 <CGME20230427104750eucas1p1158eee5a37c71cacaea021a7abbd6ace@eucas1p1.samsung.com>
 <20230427104743.9072-2-t.dzieciol@partner.samsung.com>
 <DBBP189MB14338337B5EE87A7280E553795699@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM>
 <000001d97cfe$800e79b0$802b6d10$@partner.samsung.com>
In-Reply-To: <000001d97cfe$800e79b0$802b6d10$@partner.samsung.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBBP189MB1433:EE_|PAXP189MB1974:EE_
x-ms-office365-filtering-correlation-id: a8fe4da7-db37-4312-cee1-08db4baa77b3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GaarpE+5CIP7tWlH/TIqy5+RaLmPyj624qBuPWmqNhKyDygH55Rw4F7j64CqwdSmuJ2eZ7cwvqRA05Glus5UlOKbEKdnK7fUZncAeI91AgK6dYat3UtFlM3fk/3o3SEYa+XYhoHRaXk4nUmz1pP8OfqESzAzu/vZIpJSQBjcpOQMKTcU5j7UmAlFw5dcumDYTZP57oD6M29s8VX2qx2ZM8QVjk/ZdBozxKGoKst9Cy5FOoOG0GWbklLHYYY9GGDhy3j42Z7vUk3hKXGuulW15csVwPp/O4ylvgjIldxCJ8/IhDpkvj3gJUNLFSakYiv5nYJYr7Fy+qJkMmZDFRXGacV1l8J+sAa+4n/FjRTri41QhhCOZYcCyesaV0noZOCmae+AUS7ap+ebz66HWR4cAaWFVIK8UQsENmaOVgaaF3jCxlMYKDzZHXLHm4zNZNwR/idezRQmt5yskRxJkWFFkAtUwlKEAyIlhcC6uH4HEHdrh01al30v4qpxz4DZdj0zXTrXBQPI4704ZhqBIZTn0tISQ479KYrUx8sPlA9SSPggC2dgz1FWLMRCkKIv+eJVme6d36IbJ3HQA74wYmxHZ9YaUyOzYd+tR98rKYAtMt4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(396003)(136003)(376002)(366004)(39840400004)(451199021)(71200400001)(7696005)(186003)(83380400001)(2906002)(53546011)(9686003)(6506007)(26005)(110136005)(478600001)(33656002)(54906003)(55016003)(41300700001)(122000001)(66946007)(76116006)(316002)(66556008)(86362001)(38100700002)(52536014)(5660300002)(44832011)(8936002)(8676002)(4326008)(66476007)(64756008)(66446008)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WnRxemV2UDNCZllUYktnTkhEcUtHQktmOEZHMUFWbFZWYXVENFk4MHU1RzJU?=
 =?utf-8?B?M25EOEp1RmJwdDRaandFTFFIbDR6RWtqQ2NzMjN0ZFNnZmtZU0E3UEtOOEJ1?=
 =?utf-8?B?UEtGaWczZWxSZyt5dWxtVS9RakZxMkdiVHp6N1pMYmk4STQ0UTVpQTFQQmxh?=
 =?utf-8?B?U3Z0VEJIcU9wbDgvcDY1NFJoQUtEM1RTYm51ekRYejkzR2RUb1AvaC9BZVNr?=
 =?utf-8?B?UVQ2aE54SkJGTHBDd2t5VXJBZTJIZWJSSlZVTGlKc2pXaGJCQWNlTU90akgr?=
 =?utf-8?B?UkR3OXZjTjhKUjFPei9yOU5nR2F6TW5iU0M2Q0JtTlRlQXVvMHNtUWFoelNa?=
 =?utf-8?B?ZUtmaEZLVlJIQUpwT3RqUU1QS3c5QmZ0N3FrSDAyTURWNHJaall2OU5saXdG?=
 =?utf-8?B?bXZxYkVnR3dzNTNldEVZYXhmV3h4ZEhWaG44UGIvWVF1Mk9WODhkS0pnb09S?=
 =?utf-8?B?UjB6RUlLV1NScVg0KzB4U2ZHRysyOStYbEdsN205YUcxRU54Wkg4SXU4Tm0w?=
 =?utf-8?B?TUJPMmRxbVNhWWhKcy9CK3NrTTBKbnFYTkpJU3pUaEk1dGlXNVQrVGhmUTFx?=
 =?utf-8?B?YTc3VnZYUmpQYkFuRTdiWFdMNnRVaVJJM1d4ckE2Rlp5amFLU3NucFlydXg3?=
 =?utf-8?B?MXgyaFQrUHFHUGhXcFRDK0o0d0pCVWs3VGluckg1S0xlbE1mckoyWkpMaHB3?=
 =?utf-8?B?djlHTjJWeUVUR0JwVjN1MkxaWWRSNjdYeTBvVTFYaGxWMVNSUEhrOXpacGRI?=
 =?utf-8?B?V3MxK25XdUZYaTMrRnNQR2FBYmRjdmRwWmdiYThTaDRXbjkwU0JZdU11V0U4?=
 =?utf-8?B?V0lWZHMybTMvN01mcmw2T0VPVTBxSVFUOGhydWxveEI3bndvSGlVWDY5c05T?=
 =?utf-8?B?K3pxdmtJNXo2aVB5NWFYS09XUWFyTzZKZnlnS1VRUmJuVThLWGdmellZZHlJ?=
 =?utf-8?B?SXpINmxjR2ZXZXhMRWh3ekI0eGdyd2I1cU1Yc1lMa3FLczE1ekVmYTVROHJr?=
 =?utf-8?B?a2F3WEdzS1orL2xwYXlsdUtCeDExWVRkcnJROTQ0cUhDN2J2VjcyendZSC9z?=
 =?utf-8?B?ZWhhbHVJREdDUDZ1bUhUelZTbmZON24vYkRSMW5pWnBPWWxmUjAxQVJ6YUpa?=
 =?utf-8?B?R0dLT21TdFlRZGF3OWtWdXg2V1FIeFdNN1ZaeTFjTXE4TVBaeVZBVi9UNHFi?=
 =?utf-8?B?dk5QQ1pDMGJCT2dlQy9WaVVvdUNGU2c3MlhTQ1U2dVZQTHdpclloaFVBZFFY?=
 =?utf-8?B?M1JVZ0NjT0hqTHRLTXFaTFdZemJ1N2VSZEd3d2JuVGkrQzVSbDhoZnhuMUlF?=
 =?utf-8?B?RnBRaGRXTXM4MCtuWTZCWFYxOHRnSmN6NGVnMFZPZmxoeU13eHplNGw1MHU1?=
 =?utf-8?B?RTZTT1dxVnFVNkN3Y0tONHBtd3l0SFI0dlJBakpnZVRBSlpROGxDYVk1dmlV?=
 =?utf-8?B?K0RPeWNJMkFDdnRkbjE3UUZ2MndGcFVJTUtPN2JlWXBuUUV3c2JMRDl4NzB0?=
 =?utf-8?B?bVZBcUxkWUwvVDZZTy9MUEJnbnZJckY5REVMbTQya1M3ZDFKZGNRdXViRzBi?=
 =?utf-8?B?ajJYZlRhYWZKaHJtZk1JS21IemZxNVNiUWNYZW5iRk1pUG5VN0h6OUJjUDNm?=
 =?utf-8?B?dU9ZUzNKZnF3NjdML0tUNU96Nm9JU3R5TnEzSjZwMUJCb2ZYZzJlbU54czFw?=
 =?utf-8?B?b3kzNURkc2d1UUNmT1VScGZUUFg0djY2V2NXWW9TK3V0a0hZaWVTeE1iaUU0?=
 =?utf-8?B?RnRRUG1UVFRobm0yNzV2eENTL1pBRXBkTWdGR0dhWWJMWnJrS2FmWGhTenpl?=
 =?utf-8?B?QmN5THN5YjBCa0xrU3FmVDcvdytoU3pjLzZPV0U2anlPRlM5ZEc4NWtxeHB2?=
 =?utf-8?B?TU1nbEUyckczR0VNUmV3WnR5Ym1GY0F2N3B5c1loTVl4d2IvMHg3R1diYW1Z?=
 =?utf-8?B?SUxydEI3Z1o5aFZ3R1V0ZXA3amx4RjF4bkc1QnVWZEpmVm11YlFSSzN1cDU4?=
 =?utf-8?B?M2dEaXh5dGE3SnVQSWlGWnorRmY5SVhjN3JlRytJWTQvQUloUU5iT29yY3VZ?=
 =?utf-8?B?T3VodnhMOWtEMU5GSmNpOC9oVmxDNXBVd0dLQlQwWGViZUZVdXd6OFRYSGlT?=
 =?utf-8?Q?0Cs5asY4P6Nz19dv2PWydios5?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a8fe4da7-db37-4312-cee1-08db4baa77b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2023 07:46:12.7246 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kv3zr1Sto4t/ilcPpBZe1iuIELHOu30YaTr1A/CGG7sbV+o8KBVXJCIAGfxM5ZHWxBZbUyas1On5EP9XZttjBOdhpuJ6MlhA3RDV1PrcEtY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXP189MB1974
Received-SPF: pass client-ip=40.107.8.103;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVG9tYXN6IER6aWVjaW9s
L1ZJTSBJbnRlZ3JhdGlvbiAoTkMpIC9TUlBPTC9FbmdpbmVlci9TYW1zdW5nDQo+IEVsZWN0cm9u
aWNzIDx0LmR6aWVjaW9sQHBhcnRuZXIuc2Ftc3VuZy5jb20+DQo+IFNlbnQ6IFR1ZXNkYXksIDIg
TWF5IDIwMjMgMTY6MDENCj4gVG86IFNyaXJhbSBZYWduYXJhbWFuIDxzcmlyYW0ueWFnbmFyYW1h
bkBlc3QudGVjaD47IHFlbXUtDQo+IGRldmVsQG5vbmdudS5vcmc7IGFraWhpa28ub2Rha2lAZGF5
bml4LmNvbQ0KPiBDYzogamFzb3dhbmdAcmVkaGF0LmNvbTsgay5rd2llY2llbkBzYW1zdW5nLmNv
bTsNCj4gbS5zb2NoYWNraUBzYW1zdW5nLmNvbQ0KPiBTdWJqZWN0OiBSRTogW1BBVENIIHYzIDEv
Ml0gaWdiOiBSWCBkZXNjcmlwdG9ycyBoYW5kbGluZyBjbGVhbnVwDQo+IA0KPiBOb3QgTGludXgv
RFBESy9GcmVlQlNEIGZvciBJR0IuDQo+IA0KPiBDaGFuZ2UgaGVyZSBhZGRzIGFkZGl0aW9uYWwg
Y29uZGl0aW9uIChSWENTVU0uSVBQQ1NFIHNldCkgdG8gZW5hYmxlIHB1dHRpbmcNCj4gSVAgSUQg
aW50byBkZXNjcmlwdG9yLCBiZXNpZGVzIGNsZWFyaW5nIFJYQ1NVTS5QQ1NEIChyZXF1aXJlZCBh
Y2NvcmRpbmcgdG8NCj4gSW50ZWwgODI1NzYgZGF0YXNoZWV0KSB0aGF0IHdhcyBub3QgcHJlc2Vu
dCBpbiB0aGUgZTEwMDBlIGNvZGUuDQo+IA0KDQpZZXMsIHdlIGNhbid0IGV2ZW4gdXNlIGV0aHRv
b2wgdG8gc2V0IHRoaXMgZmllbGQuDQpNeSBzdWdnZXN0aW9uIGlzIHRvIG5vdCBhZGQvbWFpbnRh
aW4gY29kZSB0aGF0IHdlIGNhbm5vdCB0ZXN0LiBJIGxlYXZlIGl0IHVwIHRvIEFraGlraG8gdG8g
ZGVjaWRlIGlmIHdlIHJlYWxseSBuZWVkIHRvIGltcGxlbWVudCBJUFBDU0UuDQpUaGUgZGVmYXVs
dCB2YWx1ZSBvZiBSWENTVU0uSVBQQ1NFIGlzIHVuc2V0LCBzbyB3ZSBjb3VsZCBhcyB3ZWxsIGln
bm9yZSB0aGlzIGZpZWxkIHVudGlsIHRoZXJlIGlzIGEgdXNlciB3aG8gc2V0cyB0aGlzLg0KDQpB
bnlob3csIEkgd2lsbCB3YWl0IHdpdGggZnV0aGVyIGNvbW1lbnRzLCB1bnRpbCB5b3UgcmVzcGlu
IHRoaXMgYWZ0ZXIgc3BsaXR0aW5nIHRoZSBjaGFuZ2VzIGFzIHJlcXVlc3RlZC4NCg==

