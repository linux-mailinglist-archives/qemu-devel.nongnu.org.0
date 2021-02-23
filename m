Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E82322FB6
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 18:36:18 +0100 (CET)
Received: from localhost ([::1]:55030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEbbd-0001OQ-7G
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 12:36:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lEbap-0000t4-5I; Tue, 23 Feb 2021 12:35:27 -0500
Received: from mail-bn7nam10on2061.outbound.protection.outlook.com
 ([40.107.92.61]:32001 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lEbam-0002Fz-47; Tue, 23 Feb 2021 12:35:26 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OQg8onVScSMOs1qZN2QsWzkt/eROUB456Q0xaDnTWpKEcI65U6BNXBk9y8Ww8S5VccTnggWpDQB5Ba840Zw/ZIg4NpC9NWyxB0dI1KmnxxAygfg36Kp91EauOVu2/M2YakfmCfwyL2rH6nvzVx49HX7uzmxoiBLqkn/AaQx2r4sEiw4q6WEFwZscXJoL22PcMdT5zMVrI3HiW5LOoW1HSzwFhJHvMH3dCYVxnm5rG3P3LHt2FfwF3SU8ydVmHYcG7rjmOpx9hrCLrJtMRq04gW4JCY5AFPj0FiJXOAhTUH6KyowDLY+ZBT1wOMrOkg32XOLjCDV/KEtwp7IQm/X21w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9oEDK6qBlPuq/F0o/3ESD/DUh7hU6cGRXDxz3Lidz4k=;
 b=ZD/HmNnWXOt7V+dog64Aij0ScacBe2SOhYQtU+Z0CkIxCJc1W3ZHFD1ObumBtBHEnA0/whmL6GVGPLWD55EijnOBy5rEyDj0vSbSJVdtHel1Zm/9Ih5IboPIofEeXea+z0uTROOjtYOivIKiszvGDayvpEETVoSPVX2jv8ODeSlv1/OMSvlQ7+HgBGG+D1c3xIENVtA0XkgJOR3QYmSTbd9xaxYHYjZk7x+plKyD2DBsW3Z5LEjI0xIFljjjlqVyN4KMp4Mh/6A0sJZ9FPx3ljhFf935wLhaDD827sF06N/B3nezXV8aYaqv1UqWqG614bSDzjmru38nqZfdLs+sHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9oEDK6qBlPuq/F0o/3ESD/DUh7hU6cGRXDxz3Lidz4k=;
 b=eTFhg1x1HWXsIWcThUBigmO3cFx4n8p8wz+QQ+GiMxPZzHnNCBSehWb8I9f2P3S+cKcuhYbN2fiV2FsNMm2H7znOMyVJsGoCK+6j98yx2sMqOCUrfIA396SwDX+dmAGjrKQ66TjNQs9JbHT33Q12YF6suw2AvpAnTvWOWtRauN4=
Received: from BY5PR02MB6772.namprd02.prod.outlook.com (2603:10b6:a03:206::11)
 by BYAPR02MB5654.namprd02.prod.outlook.com (2603:10b6:a03:9f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.28; Tue, 23 Feb
 2021 17:35:20 +0000
Received: from BY5PR02MB6772.namprd02.prod.outlook.com
 ([fe80::c18e:1693:fd4e:7fdf]) by BY5PR02MB6772.namprd02.prod.outlook.com
 ([fe80::c18e:1693:fd4e:7fdf%5]) with mapi id 15.20.3868.033; Tue, 23 Feb 2021
 17:35:20 +0000
From: Sai Pavan Boddu <saipava@xilinx.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>, Markus
 Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>, Max Reitz
 <mreitz@redhat.com>, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, 
 Eric Blake <eblake@redhat.com>, Joel Stanley <joel@jms.id.au>,
 =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>, Vincent Palatin
 <vpalatin@chromium.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, Peter
 Maydell <peter.maydell@linaro.org>, Alistair Francis
 <alistair.francis@wdc.com>, Edgar Iglesias <edgari@xilinx.com>, Luc Michel
 <luc.michel@greensocs.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: RE: [PATCH v2 01/22] block: add eMMC block device type
Thread-Topic: [PATCH v2 01/22] block: add eMMC block device type
Thread-Index: AQHXCPMCc9P7MYpy7UqlbMux6TiW26pkE7eAgAHtmfA=
Date: Tue, 23 Feb 2021 17:35:20 +0000
Message-ID: <BY5PR02MB6772EEE95845BAD093CAC972CA809@BY5PR02MB6772.namprd02.prod.outlook.com>
References: <1613982039-13861-1-git-send-email-sai.pavan.boddu@xilinx.com>
 <1613982039-13861-2-git-send-email-sai.pavan.boddu@xilinx.com>
 <3c229241-fdc5-a445-d96e-ca16a5c0106b@redhat.com>
In-Reply-To: <3c229241-fdc5-a445-d96e-ca16a5c0106b@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=xilinx.com;
x-originating-ip: [149.199.50.128]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: cc83eaf6-be94-4ce2-8661-08d8d8216462
x-ms-traffictypediagnostic: BYAPR02MB5654:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR02MB565427494A6F9881562E99E8CA809@BYAPR02MB5654.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2399;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Uh3iMVDT/7MEyN/QMxHuzhf1Cx7yk87E+BA9mSEicAm/fiGV1nbUi3YInrHH9oImJsl/kUG4p3DFew0B3N48wiJnArcuLbRkaAwm3E5UgLCxSwJg6PtPb0vkITLpSmyTJf/buDgJNHlWsdGHrTduZ0lAeplfnG4xF7EsnSO5ARTbOUB5PCYPTZAS5ltRWUElVWJ1DiIRjP9hqbfd2kxBHB6OWYLexfwcW8uUlBQjZVnINO0caxsDNXQOTiRAyBRSCvyVkZfpJDUHy9zlgTrhZr871l8a3qQM4hoZR8JKR9B5zcLwXAuM9VFt7OkaT5x9JEjMX2qjrIDLiPpsdavOdfLATC79hcl0O+nKRZexMz+lBdstz2nm4iMLpVAjEgwKmHsw9aukH8GlK6h8y/ItZg02BLV0wKxR9/jc8DGeEB4t8pLnNISv3MipO/pgsv7Y5fgUQlXB9ySKN+uxyWywKU37FnI72ACU9Ah9FpPtH9PBAI/ysJrYP/vpCP6kngJJuiABoYIHKzTQ4laS4nJ3QdSNqBIO1P3UMkogmDHqVp7Jm62hNadSmznLO4Wp/SxE
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR02MB6772.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39840400004)(376002)(136003)(346002)(366004)(83380400001)(54906003)(8676002)(7416002)(110136005)(33656002)(86362001)(5660300002)(71200400001)(478600001)(76116006)(186003)(7696005)(55016002)(316002)(66946007)(66476007)(66556008)(64756008)(66446008)(2906002)(921005)(26005)(6506007)(52536014)(9686003)(4326008)(53546011)(8936002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?MDFXRXFSK2RWMEhWR3BTaEgyVjg1bjBsYVdObGlUMmYzRHByOXRDUXpYSUoy?=
 =?utf-8?B?YkYwQkhSejEyY2ZoNlZsRWNsSThocGEwTk5JV3dIekgyQkNYM1RWaUlQUVE2?=
 =?utf-8?B?NGtObTB0WS9PU2d1eDRRWm9DWm8vOSthYVVBWkhJUXFKZEE0b0xpVDVrcGxY?=
 =?utf-8?B?K0ZkZmRWVjh1ajFpV2pHSGNZVUFvUGtXM1RWck1EUXI2TWY2dlhrNWhUcEFh?=
 =?utf-8?B?ZS92ZXR0TGlhYlFFV0xaRzY2QzR3dE1pYlZqZndXc05TZHRtbGVsMHFHTTI1?=
 =?utf-8?B?NGQ4MlZKOVNzYU11Z2VuSStVeW1lQ3h4QlVmRjJ5V2x4eklCSXBwbkVtNzBy?=
 =?utf-8?B?djZvVDNDY0FiRjZ4YVZTZSticDNmUHkrNHUrZitYYnE4dEhXd3R1WEVFTzIr?=
 =?utf-8?B?OUYzTmFjckJINEw5YkQxMXFFL2hBZHgvdkpTd0ZMdDRjOFdqNnJtR0lEbG5E?=
 =?utf-8?B?QmE1MHNoTFVpR0pzS2hnalBUYU4vMXRaLzBhR1hEMVVxRE4xTlhhOVpoV1Fq?=
 =?utf-8?B?NzQ0R1FrMFdUZGpSbTBGbUhnU2VZUVd4aXgwMlc0dDVBWm9lMnJmdzRFTmNx?=
 =?utf-8?B?R3J6U1RBRktHdGN5QThOZzd4WExrQnZXb0ZOOXJQeXg2M2h0dW5OM0EzM3BY?=
 =?utf-8?B?d1U0V2Z5d2EzNVllc2VrQ05ueDYzbktxNzBwUS84R3BqemtOclpUMlZ2NkJs?=
 =?utf-8?B?OHVXaDN5aVJSWTR3ZUJtb1FpelVsT1BoSkpkQ2F0K1kzdnhvY1ZZUHJmZzdt?=
 =?utf-8?B?a1kyL3hpTE82S1ZsK0FJdWo4dWtBWHBSS1pVKy93Mm5uNG8yaFViNG0zZWZy?=
 =?utf-8?B?VStZaEdCMW54NS9HdW0yTnpscmVzRTEveS9udUV6cmdadFhJWkxaMWh5Q2Yv?=
 =?utf-8?B?VTVMdXZMWXBpY2N4SnV4YzFIYTNEeHRONCtIc1ZENkp3YllEZFRhVkl5ODRy?=
 =?utf-8?B?L2kwYWJtbVh1d0o0UjAyU2FxVXBEdGlKaHpHUmpGclovUXB4bk4vQ29yRVhu?=
 =?utf-8?B?VHdKaVpTRlZCdG5IRDV1Rk9rTlhZZm9zajFwSjVVNGJocHJSSFdjVE5teFBy?=
 =?utf-8?B?UlUzQTFzSEhUK08rZG5tcWtpeSs1U0c4TDZHc1VCeDNsenNldnFVbkY0aFRH?=
 =?utf-8?B?eVZSZnJDbWZOS1lVNTdEWGVkbk0xR3NiZmdmMFE1bCtoQTdDM2dNb1M3bnBy?=
 =?utf-8?B?S09FdFN2TUhJRi92TUNOVGVZWTc3QTFIYjNCNGJsTWcwZ2dEcnpwRlhnbW8z?=
 =?utf-8?B?dyt3UDJ5ZHl3ZzByTUlMNm5Remk1ZFRsbDIrdnlnbnNFbU8wK1kvaEc3ZzY5?=
 =?utf-8?B?eDRJZldDZU90c0JDdkpOcE5qMmRpQUIxSS96Yk5aMEgwdEltQ0h1c3Ixdkhn?=
 =?utf-8?B?UVJ6ZFd1TSs3aERhWTdxQzV1amtkakV4Q2NKcy8vRXBaV1p6Q0g4UzhlaHkz?=
 =?utf-8?B?R0JoNU5HaVBpTjdGWHRQb2M3czU5WFBaQnJzcnpiSG5kZzQ4dGt4dk1lUFhm?=
 =?utf-8?B?S28xVnR2T0VOM1BzazBkc1haU3daTHRYVHN4NnhsUEpWNUV5T3d6ekdlbHlG?=
 =?utf-8?B?Y1FGYmVNS3VlUDdSaDNYQnFRM0VSVkZqTWc2RS94aDY5ekg3ekQvTHVvWnM2?=
 =?utf-8?B?RFV1NkhpSlZxNVkwNUxxck5WSjhtamlxbGNlWVJaWDBhRHY0QnBMbmFFV3Rs?=
 =?utf-8?B?b3NybUxMWkZIVDlIakY5QTFyNXJyaXQ3YUVNWldhOWhLS3kzUitkZTJaMkNn?=
 =?utf-8?Q?vJ3XyncJsXc+6uNCPgJOSuXaEx0DJGqL85fnMAu?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR02MB6772.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc83eaf6-be94-4ce2-8661-08d8d8216462
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2021 17:35:20.1737 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vWliw+gpE1qOM+Zi44QrpMzf3565mlMOAfpYrQB9Fk1rnqeVR9w0XU4ee3A8NnZ6S5PTjwi2EFTQssmuaihZuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5654
Received-SPF: pass client-ip=40.107.92.61; envelope-from=saipava@xilinx.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SGkgUGhpbGlwcGUsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGhp
bGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEByZWRoYXQuY29tPg0KPiBTZW50OiBNb25kYXks
IEZlYnJ1YXJ5IDIyLCAyMDIxIDU6MzQgUE0NCj4gVG86IFNhaSBQYXZhbiBCb2RkdSA8c2FpcGF2
YUB4aWxpbnguY29tPjsgTWFya3VzIEFybWJydXN0ZXINCj4gPGFybWJydUByZWRoYXQuY29tPjsg
S2V2aW4gV29sZiA8a3dvbGZAcmVkaGF0LmNvbT47IE1heCBSZWl0eg0KPiA8bXJlaXR6QHJlZGhh
dC5jb20+OyBWbGFkaW1pciBTZW1lbnRzb3YtT2dpZXZza2l5DQo+IDx2c2VtZW50c292QHZpcnR1
b3p6by5jb20+OyBFcmljIEJsYWtlIDxlYmxha2VAcmVkaGF0LmNvbT47IEpvZWwgU3RhbmxleQ0K
PiA8am9lbEBqbXMuaWQuYXU+OyBDw6lkcmljIExlIEdvYXRlciA8Y2xnQGthb2Qub3JnPjsgVmlu
Y2VudCBQYWxhdGluDQo+IDx2cGFsYXRpbkBjaHJvbWl1bS5vcmc+OyBEci4gRGF2aWQgQWxhbiBH
aWxiZXJ0IDxkZ2lsYmVydEByZWRoYXQuY29tPjsNCj4gVGhvbWFzIEh1dGggPHRodXRoQHJlZGhh
dC5jb20+OyBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJlZGhhdC5jb20+Ow0KPiBQZXRlciBN
YXlkZWxsIDxwZXRlci5tYXlkZWxsQGxpbmFyby5vcmc+OyBBbGlzdGFpciBGcmFuY2lzDQo+IDxh
bGlzdGFpci5mcmFuY2lzQHdkYy5jb20+OyBFZGdhciBJZ2xlc2lhcyA8ZWRnYXJpQHhpbGlueC5j
b20+OyBMdWMgTWljaGVsDQo+IDxsdWMubWljaGVsQGdyZWVuc29jcy5jb20+OyBQYW9sbyBCb256
aW5pIDxwYm9uemluaUByZWRoYXQuY29tPg0KPiBDYzogU2FpIFBhdmFuIEJvZGR1IDxzYWlwYXZh
QHhpbGlueC5jb20+OyBxZW11LWRldmVsQG5vbmdudS5vcmc7IHFlbXUtDQo+IGJsb2NrQG5vbmdu
dS5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAwMS8yMl0gYmxvY2s6IGFkZCBlTU1DIGJs
b2NrIGRldmljZSB0eXBlDQo+IA0KPiBPbiAyLzIyLzIxIDk6MjAgQU0sIFNhaSBQYXZhbiBCb2Rk
dSB3cm90ZToNCj4gPiBGcm9tOiBWaW5jZW50IFBhbGF0aW4gPHZwYWxhdGluQGNocm9taXVtLm9y
Zz4NCj4gPg0KPiA+IEFkZCBuZXcgYmxvY2sgZGV2aWNlIHR5cGUuDQo+ID4NCj4gPiBTaWduZWQt
b2ZmLWJ5OiBWaW5jZW50IFBhbGF0aW4gPHZwYWxhdGluQGNocm9taXVtLm9yZz4NCj4gPiBbU1BC
OiBSZWJhc2VkIG92ZXIgNS4xIHZlcnNpb25dDQo+ID4gU2lnbmVkLW9mZi1ieTogU2FpIFBhdmFu
IEJvZGR1IDxzYWkucGF2YW4uYm9kZHVAeGlsaW54LmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBK
b2VsIFN0YW5sZXkgPGpvZWxAam1zLmlkLmF1Pg0KPiA+IFNpZ25lZC1vZmYtYnk6IEPDqWRyaWMg
TGUgR29hdGVyIDxjbGdAa2FvZC5vcmc+DQo+ID4gUmV2aWV3ZWQtYnk6IEFsaXN0YWlyIEZyYW5j
aXMgPGFsaXN0YWlyLmZyYW5jaXNAd2RjLmNvbT4NCj4gPiAtLS0NCj4gPiAgaW5jbHVkZS9zeXNl
bXUvYmxvY2tkZXYuaCB8IDEgKw0KPiA+ICBibG9ja2Rldi5jICAgICAgICAgICAgICAgIHwgMSAr
DQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0t
Z2l0IGEvaW5jbHVkZS9zeXNlbXUvYmxvY2tkZXYuaCBiL2luY2x1ZGUvc3lzZW11L2Jsb2NrZGV2
LmgNCj4gPiBpbmRleCAzYjVmY2RhLi5lZWZhZTlmIDEwMDY0NA0KPiA+IC0tLSBhL2luY2x1ZGUv
c3lzZW11L2Jsb2NrZGV2LmgNCj4gPiArKysgYi9pbmNsdWRlL3N5c2VtdS9ibG9ja2Rldi5oDQo+
ID4gQEAgLTI0LDYgKzI0LDcgQEAgdHlwZWRlZiBlbnVtIHsNCj4gPiAgICAgICAqLw0KPiA+ICAg
ICAgSUZfTk9ORSA9IDAsDQo+ID4gICAgICBJRl9JREUsIElGX1NDU0ksIElGX0ZMT1BQWSwgSUZf
UEZMQVNILCBJRl9NVEQsIElGX1NELCBJRl9WSVJUSU8sDQo+ID4gSUZfWEVOLA0KPiA+ICsgICAg
SUZfRU1NQywNCj4gPiAgICAgIElGX0NPVU5UDQo+ID4gIH0gQmxvY2tJbnRlcmZhY2VUeXBlOw0K
PiA+DQo+ID4gZGlmZiAtLWdpdCBhL2Jsb2NrZGV2LmMgYi9ibG9ja2Rldi5jDQo+ID4gaW5kZXgg
Y2Q0MzhlNi4uMzkwZDQzYyAxMDA2NDQNCj4gPiAtLS0gYS9ibG9ja2Rldi5jDQo+ID4gKysrIGIv
YmxvY2tkZXYuYw0KPiA+IEBAIC04Myw2ICs4Myw3IEBAIHN0YXRpYyBjb25zdCBjaGFyICpjb25z
dCBpZl9uYW1lW0lGX0NPVU5UXSA9IHsNCj4gPiAgICAgIFtJRl9TRF0gPSAic2QiLA0KPiA+ICAg
ICAgW0lGX1ZJUlRJT10gPSAidmlydGlvIiwNCj4gPiAgICAgIFtJRl9YRU5dID0gInhlbiIsDQo+
ID4gKyAgICBbSUZfRU1NQ10gPSAiZW1tYyIsDQo+ID4gIH07DQo+IA0KPiBXZSBkb24ndCBuZWVk
IHRvIGludHJvZHVjZSBzdXBwb3J0IGZvciB0aGUgbGVnYWN5IC1kcml2ZSBtYWdpYy4NCj4gDQo+
IC1kZXZpY2Ugc2hvdWxkIGJlIGVub3VnaCBmb3IgdGhpcyBkZXZpY2UsIHJpZ2h0Pw0KW1NhaSBQ
YXZhbiBCb2RkdV0gSSB3YXMgc2VlaW5nIHRvIHVzZSAtZGV2aWNlIGZvciBlbW1jLiBCdXQgSSBz
ZWUgd2UgYW55d2F5IG5lZWQgYmxvY2tkZXYgc3VwcG9ydCBmb3IgdGhpcywgd2hpY2ggd291bGQg
cmVxdWlyZSB1cyB0aGUgdXNlIC1kcml2ZS4NCg0KQ2FuIHlvdSBnaXZlIHNvbWUgcG9pbnRlcnMs
IGhvdyB0byBhcHByb2FjaCB0aGlzID8NCg0KUmVnYXJkcywNClNhaSBQYXZhbg0KDQo=

