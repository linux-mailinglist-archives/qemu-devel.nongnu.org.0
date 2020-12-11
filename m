Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 272122D7FBC
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 20:59:52 +0100 (CET)
Received: from localhost ([::1]:56556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knoZy-0003w7-8V
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 14:59:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1knnik-00084F-SD
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 14:04:54 -0500
Received: from mail-mw2nam12on2076.outbound.protection.outlook.com
 ([40.107.244.76]:7393 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1knniY-0007M3-5s
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 14:04:49 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AAEAZtC4fcXRqwvBC6RljwC8xYysyCpkQf2cQdnaLDyfslKp/+KztPOCWxCmraxE2dFeMAi4KFvNjCY/lWMeNUFwcO/8R0MDzGlFpblN5WtQaZ8vttY/uKxU9lklfb9fY1YzY5eITTJeENWAUyYQtQY2vSsku2gT+ycdt4I5jd8mQyzRjHVW1P6tzaGJ7d8zxHyL8x0iKtWfVb06y+BBR8sFdsAOLVFYxh/1dP1IqRnor/xoOZ8wj2K3JKxhabT1UUFZmaX8udEqbC1R2k076hACIeokmywmWEOl5xxcmUGp52u6tRcN8u/0o5Mg5GqiavwWfgzVTza3CTp4+m+uPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DpSUPnYjHKEJhBLCb5Bav1M5dhMO/HH3QOeLdIfkTIA=;
 b=mv2js0Nt5PLrIQXqesjvtqIb4qiGLGb1dVOBEtHbrmAYvmbjB5wa5jFflXpKHRJT6SpYRif5qTfJzI5DOIAdtWzpT7oXJtv+udlfAyx1bQS2VnPA97VuXshPHZhlXSHg0WoVd94c52Wt9JZtFalTrEvg0R4iBZxW5g+Ug589ehRX1cBohhu90YUJM8ccm0+g9vv8Y67YjRCuYZrsbIpm0T3/1iQPvUhA/wP5uyRegUgD8XxYPTk1YHtuJpjArVMSvz60ePiVxIGv8Emv0hYuC3uYAgUIwG8n7I75fkbu+QQQMilowcCiXXqovaA7Vfnw8DWX+Lm8pu+IQJ/KGeFc7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DpSUPnYjHKEJhBLCb5Bav1M5dhMO/HH3QOeLdIfkTIA=;
 b=kNSA72BAs/rv4jUGWzrq7EBQB+akZR5H+WR27HvoO76qJSQYF98lpcveNjva5+YDyHiwIs5sDR3Bia0nH0/S6slT/weoQcS3REsi7Ds12W4mUDd+SdE1T6X8dtqbBt+NmePf1jA/kQmZsopRe3xxvj4TvE23MEVuWRWAs4XXub0=
Received: from BY5PR02MB6772.namprd02.prod.outlook.com (2603:10b6:a03:206::11)
 by SJ0PR02MB7824.namprd02.prod.outlook.com (2603:10b6:a03:327::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Fri, 11 Dec
 2020 19:04:35 +0000
Received: from BY5PR02MB6772.namprd02.prod.outlook.com
 ([fe80::8163:86a2:8279:471c]) by BY5PR02MB6772.namprd02.prod.outlook.com
 ([fe80::8163:86a2:8279:471c%8]) with mapi id 15.20.3632.021; Fri, 11 Dec 2020
 19:04:34 +0000
From: Sai Pavan Boddu <saipava@xilinx.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: RE: [PATCH v15 0/4] Add Versal usb model
Thread-Topic: [PATCH v15 0/4] Add Versal usb model
Thread-Index: AQHWyakU1Iuit5fsw0GKEeicQIOwC6nyHMYAgAAwWcA=
Date: Fri, 11 Dec 2020 19:04:34 +0000
Message-ID: <BY5PR02MB67728414AEE431395784A35BCACA0@BY5PR02MB6772.namprd02.prod.outlook.com>
References: <1607023357-5096-1-git-send-email-sai.pavan.boddu@xilinx.com>
 <CAFEAcA8-KcdSrFKFGcuPcTQPBvgDapR3epNScaQSbW8s9E9zwg@mail.gmail.com>
In-Reply-To: <CAFEAcA8-KcdSrFKFGcuPcTQPBvgDapR3epNScaQSbW8s9E9zwg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=xilinx.com;
x-originating-ip: [149.199.50.128]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 72e615c2-13d6-4fd3-4939-08d89e07995c
x-ms-traffictypediagnostic: SJ0PR02MB7824:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SJ0PR02MB78248651D9B29EA838B01B0FCACA0@SJ0PR02MB7824.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: imzDXkIc+w0sZK1wdpGlvWSEXTwriFZ5FXFltvY+rZPn8NDYAtiKJ/JF9AeZPU20lBTkMFykNObMtAfroDs78iMcIOpdnMyFr4iq8lrf3dU2yhxOx2uUf/O2PNFZgS6BFO4uUDgAHUuAhw8KFhvmOjF/5zvB67bSWacLxHalLKpBrNIqwH8nxUQo7YJKMmJIq02Zvr5CCsjFOm3iANHP8+lCo/zIhektN1p3ttWzpvaVgSoRph9pxH9IGNr9018afCltjF9OnVDm1j21j+LhryqouIDt8kTEKbULny57np/6HT7sTwhRsumskZezaPzBhpKbuBoAAZfFLkDRBDSqCQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR02MB6772.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(136003)(376002)(54906003)(4744005)(33656002)(5660300002)(7416002)(52536014)(7696005)(6506007)(66946007)(66446008)(64756008)(4326008)(8676002)(66476007)(66556008)(2906002)(83380400001)(55016002)(9686003)(76116006)(71200400001)(53546011)(86362001)(26005)(186003)(8936002)(6916009)(508600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?OEh0bEF1V2hQQkszR1ZIQVkzb1VHUnJHMDdLbTNuWmhJaEwvWVVrajMvRTFJ?=
 =?utf-8?B?MWFXUHN1ODdYRDJISGxzS0lERmRNTXA0dmRyU3VHNEtZUE9wcGZaQ1dXbGFY?=
 =?utf-8?B?eFVuc25FYlA2QzdOR0tDVTI2MDNnZVpkemJXT2dQU0lTWVBwZkNwQ1JRMGhj?=
 =?utf-8?B?M1RDL3I1ajZkbWp0bnBkWHRPWkNITXdnckhoSWVBdFIvLzk0bDhDMG5ZdlhY?=
 =?utf-8?B?a3ZHNnNoMUI3Tk1QN005S2lZK0trSnZrZ0VNSmc1MjlueFAzVGdZN0gxQ0ZO?=
 =?utf-8?B?ajFRUmxRZi9hMFlxUGV2UkY4a1dPcCtyTkFnSGxmazR2bGp6T2JmNUF0NTZp?=
 =?utf-8?B?MkVBVnBTNTcyVkd6bFJSV1NsU0hLS1kyZk5sRm5JUTJ4OGJOdDhyYWRCVDRH?=
 =?utf-8?B?eHFLeFMyRXhLUHk1YlV4cFpnYUJYTEozRitxb04zOVN3Q1JWVGlCMlJOdFVl?=
 =?utf-8?B?UTBKQ3FUQVBjaUhGOHg5WEszbUxXS0s5bnpMRlhpdkhqMWFKYlNTZlJ6OE8r?=
 =?utf-8?B?TTJxMThsYTIwM0NKQityTFE0VG42azRlRW1QbjI3d3BiN1d5QXdYa2F6elJU?=
 =?utf-8?B?SUhxaDlXb2I1Y3lPZW96Wk5xOElPRDhJb1FJS0dMWUJaaUU0U29xaFRjbVh0?=
 =?utf-8?B?aC9ta2laMU0yNlFTZ1NpMUpMQ2dtbkhvT215ODdlY3lNbW92VmJqUWp6RG84?=
 =?utf-8?B?ek1vL2lnR2RsakVYSDVGQllyTmhSQXB2R0I1a1dobm52c2Z3bnNxZG1hUXhO?=
 =?utf-8?B?eCtsQXoyLzU5RnZ0TFV1elVmK3VQL1hUdHozUlg0eFJ4REE5TVVieHhmTTEr?=
 =?utf-8?B?YWR3RDZpMFV0Z0Nrdmp0ZUJmOGNMeGF1RDIvOG1wbDhPVFo1ejhCSlF0M3l3?=
 =?utf-8?B?WHpkK3BZb3lzQlNQbzZFbmVMOVdVbXBLVDlvTUNLMFh0aEFnMG9aN2hRalVy?=
 =?utf-8?B?bnRzY3VUQmpJYi94SWRLRHk2RkgxVFhoV1o2NHN5VU5VMGFSZVZ0RUw1MXVh?=
 =?utf-8?B?eTBSeVcxRUhDenZCeHgxVGhiUFowOGlnUmlmQ1JqYlhhWnpnTUpYcUpTWDVW?=
 =?utf-8?B?d1kxeXVUQVBJYU5KR3cya0txYTJsaVpYV2t5eVVIVmtyVEpEVXMzTng0T09S?=
 =?utf-8?B?UjBlVEtrVXkrWGt4UTI1bGtZWExRUFZTYUQxeWVnOHFZNElESEhITVloRDYw?=
 =?utf-8?B?YjREa3R6SHFJOWcxdzAzUUczVTIvSGNnbW4vSDB5V014T0oxU0gwZ2M1djM1?=
 =?utf-8?B?SFlhMnpQRFQraVZGNXhCNWZpVDdpWVR0Zkw3L044UUZTeDNzaElkTWpJRU8v?=
 =?utf-8?Q?QNnV2gMaNCkW4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR02MB6772.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72e615c2-13d6-4fd3-4939-08d89e07995c
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2020 19:04:34.6990 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: atF+KgKanRagqXd/eceYWZlSvDd5zex9A0vkzK7GK3maeq80fN8WP5U+HegXtS5WWr3ObM4dLLx7k9ju4UNFLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7824
Received-SPF: pass client-ip=40.107.244.76; envelope-from=saipava@xilinx.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
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
Cc: Francisco Eduardo Iglesias <figlesia@xilinx.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Vikram Garhwal <fnuv@xilinx.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Paul Zimmerman <pauldzim@gmail.com>, Edgar Iglesias <edgari@xilinx.com>,
 Alistair Francis <alistair.francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ying Fang <fangying1@huawei.com>,
 =?utf-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGV0ZXIgTWF5ZGVs
bCA8cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnPg0KPiBTZW50OiBGcmlkYXksIERlY2VtYmVyIDEx
LCAyMDIwIDk6NDAgUE0NCj4gVG86IFNhaSBQYXZhbiBCb2RkdSA8c2FpcGF2YUB4aWxpbnguY29t
Pg0KPiBDYzogTWFya3VzIEFybWJydXN0ZXIgPGFybWJydUByZWRoYXQuY29tPjsgTWFyYy1BbmRy
w6kgTHVyZWF1DQo+IDxtYXJjYW5kcmUubHVyZWF1QHJlZGhhdC5jb20+OyBQYW9sbyBCb256aW5p
IDxwYm9uemluaUByZWRoYXQuY29tPjsNCj4gR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5j
b20+OyBFZGdhciBJZ2xlc2lhcyA8ZWRnYXJpQHhpbGlueC5jb20+Ow0KPiBGcmFuY2lzY28gRWR1
YXJkbyBJZ2xlc2lhcyA8ZmlnbGVzaWFAeGlsaW54LmNvbT47IEFsaXN0YWlyIEZyYW5jaXMNCj4g
PGFsaXN0YWlyLmZyYW5jaXNAd2RjLmNvbT47IEVkdWFyZG8gSGFia29zdCA8ZWhhYmtvc3RAcmVk
aGF0LmNvbT47IFlpbmcNCj4gRmFuZyA8ZmFuZ3lpbmcxQGh1YXdlaS5jb20+OyBQaGlsaXBwZSBN
YXRoaWV1LURhdWTDqQ0KPiA8cGhpbG1kQHJlZGhhdC5jb20+OyBWaWtyYW0gR2FyaHdhbCA8Zm51
dkB4aWxpbnguY29tPjsgUGF1bCBaaW1tZXJtYW4NCj4gPHBhdWxkemltQGdtYWlsLmNvbT47IFNh
aSBQYXZhbiBCb2RkdSA8c2FpcGF2YUB4aWxpbnguY29tPjsgUUVNVQ0KPiBEZXZlbG9wZXJzIDxx
ZW11LWRldmVsQG5vbmdudS5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjE1IDAvNF0gQWRk
IFZlcnNhbCB1c2IgbW9kZWwNCj4gDQo+IE9uIFRodSwgMyBEZWMgMjAyMCBhdCAxOToxOCwgU2Fp
IFBhdmFuIEJvZGR1IDxzYWkucGF2YW4uYm9kZHVAeGlsaW54LmNvbT4NCj4gd3JvdGU6DQo+ID4N
Cj4gPiBUaGlzIHBhdGNoIHNlcmllcyBhZGRzIGR3YzMgdXNiIGNvbnRyb2xsZXIgdG8gdmVyc2Fs
IFNPQy4NCj4gPg0KPiANCj4gDQo+IA0KPiBBcHBsaWVkIHRvIHRhcmdldC1hcm0ubmV4dCwgdGhh
bmtzLg0KVGhhbmtzLg0KDQpSZWdhcmRzLA0KU2FpIFBhdmFuDQo+IA0KPiAtLSBQTU0NCg==

