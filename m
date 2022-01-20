Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FD0494F05
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 14:29:38 +0100 (CET)
Received: from localhost ([::1]:56616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAXVR-0004gY-AZ
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 08:29:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christophe.leroy@csgroup.eu>)
 id 1nAUqP-0006a6-UB; Thu, 20 Jan 2022 05:39:05 -0500
Received: from [2a01:111:f400:7e18::60e] (port=49153
 helo=FRA01-PR2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christophe.leroy@csgroup.eu>)
 id 1nAUqO-00080o-69; Thu, 20 Jan 2022 05:39:05 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EfcekGr5ui3NLOVmykC50zbEzgg+DhnX4uWcNoUZoLBCzUu9uNRLa4sKcekCwHDO5XycbJ4tqy8KLiAfdg4DqDDTTG3NAxGoy3f4FEwld1TsSGLPmxqL+Rl3rcfojO/bVGx7oG7GwUO+CU9lPe53hhwynuVcd2Xs9OIgtxtwpruiuQ0sk7E+pJIG0y8LCjTG+YHFjEti7npZDglKpVjPNz/QwVWbC3VIHko2l9M+Z5j5A1mlb7B8s2Ybh3SiOBXBCCoe1yPV9vXdPOvWl0vsfh3H3ONlWHXYxAvAFCSXGP+9Yr6CFa+au6GZ6uXppecdBUn2/h5wFfS9QYotgI4gFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8LukxuWsiE6fCATZfliACV4ngBwCiJR7ycJWY/enUoU=;
 b=InHXI0PEcESFChxttaiRN47+Otrpm+F8nhc9c9qd/BIku87Moy1Dd/gfU08TpWyfmBZNrNyYnC2vwJL2EIit+w6Y+pbWJPsZ6zCZ34QR1S2KTaNCmcEUhYBiAMVGIKc64j+WkB2zlAFniRcQF3dAm/S7C3sblGNgnOgPZ3TH2TDMeMKVgaMSHcnkJOdJsufNbop7Y1dHOEOucIaWtHQ091f//M+AhNqw0JmTcjQR6SE4G831pW2BHnEVSSykwZgL8ImVS6+sYZ6rxwSFwqJSNWnLCnC1yBLY+XZJO976rJtkPcNhAAJYSgx/f5/uPoO2NXx1niNgrUmH87BpVuDvDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2664.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1d3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Thu, 20 Jan
 2022 10:39:00 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5%5]) with mapi id 15.20.4909.008; Thu, 20 Jan 2022
 10:39:00 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: [PATCH] target/ppc: 603: fix restore of GPRs 0-3 on rfi
Thread-Topic: [PATCH] target/ppc: 603: fix restore of GPRs 0-3 on rfi
Thread-Index: AQHYDenvjOZs1+m/NkuATF2bcXlrWA==
Date: Thu, 20 Jan 2022 10:39:00 +0000
Message-ID: <20220120103824.239573-1-christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b611f8a7-9300-4129-6ed3-08d9dc0111ea
x-ms-traffictypediagnostic: PR0P264MB2664:EE_
x-microsoft-antispam-prvs: <PR0P264MB266405EF1AA125B4FA84A53FED5A9@PR0P264MB2664.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TISEaWevl5JlaTzDT78jRl3iCV7QVdPahcKdIOsLzjKStBobdwZZ9f7XNjAl6Sr7hHgOZyAMLixuZ7Gh5heZljACgUKGCZgZf2MYUkfJZakavu3AuLhoSmF/hFJW5Zf+NP1uZqCv2quI5vfN9U76ch1IShhVyYP3dntpqmRM+mFMkst2qhJ3ynNApKVEkLqJFHvWWajMUTR9p+VOArSFHJ+PTFuAMC6KDIV0Hm81MTyDK2Ctlr/D/AiyfjtEG5BrKScbfH9BabLjMAu8cnJiFCqozZz6uYysymryby4Nn7VlBmmqwo0veJrA5blBHXjiAnughylHaHGvOfAYVrXjmKu9frTxIiVNVvfWz762zesGNJxuWXcQvwK+qvaatRVPgTKGcAu7c9bAaAQ782yLDfyfv+7a0ixl2QxfcjXR2PuCW4gpyUKow/AeF5H5uGZlez6Lo/ZO2q6j8fFtlaNDhpZiV/AJdzN5Z2DfmqKfEfUZHetyx0Urgy3/ckaVNm2aIrusQka0oNoP9nJIEU4rsXKyDo4uBqRJKWn3xUiBUrKZnQ4AqnFQJNAwwn2X+AypMeO36EPsox+y4V/qGD6hCxi45y4OZAQ+qo5gOJiBMOY0pZJkFD/0+AfY8vbm0yKI4rVNgldAMHH/7o2HkIUJIdHh0dOiqgspDv85MgP11jqbHdYBuEna5S3SgEk5Ro8zrIDaVErVO39FhsdisGyREg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(76116006)(91956017)(36756003)(44832011)(66476007)(4326008)(6506007)(86362001)(66556008)(508600001)(66446008)(6486002)(186003)(38070700005)(8936002)(316002)(6512007)(2906002)(8676002)(83380400001)(54906003)(71200400001)(2616005)(38100700002)(110136005)(122000001)(66946007)(64756008)(26005)(5660300002)(1076003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OXJBQ3BvNUNyYjhLdXYrdGcxWUNMNmVHUytDRUVYWXJRVE1tWmh2bU5OUlZO?=
 =?utf-8?B?U01TZzhKYjJUVHl4NWhERHQ0VS9TWHRUVCtJM1A3R2xiTEhnMS9tTDF0VW1p?=
 =?utf-8?B?cGs1WDJtRlRkUDdKUkdIN1F5VzBuQXNrNFN1aE5WMnhEWXUrWDd2Szk2ZEgv?=
 =?utf-8?B?ZHVJbDZjY0RsSHNJR1R3OW15VDIvYkx2aGN3TXF6cExlM1NiWXZGQUErRHZ1?=
 =?utf-8?B?U04zNFdlV3NGR2pFNElJQXIzTHBLdlpPVDhtWkZMUkJ2NDFVdUpzNDVqd0Y0?=
 =?utf-8?B?L1lncldaVCt3WFAycXlCTXlIaWJLNkNZRUtOVUQyR0Vzc1diRjJOTFcxbVp5?=
 =?utf-8?B?UktKUk9QU2xhaU1OQWNYOHNYRDhCQTYyazVaUEVmQ3diS01BT0dYcXJuampX?=
 =?utf-8?B?a3ZUV0pnMyt3amdXN3huaGpFQzBVT3FFc1BYZGorYmpxK2wyY3dDZEVMdWFz?=
 =?utf-8?B?WVltLzVlSE55cEYzbXROY3VwQmJNZkk3TUtiamJGZXdjWm9rOEhFL1dwcGxJ?=
 =?utf-8?B?c2dFTERUalFUVE4rdzkrckVkZWZTdjcrTDF4R09UekJMZUpxSmFpSGV0dVdO?=
 =?utf-8?B?UDZMWDBjUWZDSTZZUDI4Nm9vWkUxUG92R2p6Z1pJTVQyOUt3THBHcVB1SE9h?=
 =?utf-8?B?cnptQWE4VStKQzhiMlVLRW1VZ0duOXhZMmpGeTVVSnRNdGNaNHNyaTB2TEZX?=
 =?utf-8?B?ZGlvV2p6MTEreTFrV1dBZTQ5V1hlYXAxQWdHbFJtdGZJaTlteHhGblZpZGw0?=
 =?utf-8?B?S0swa1FyY2x1ZlJOc3hidDRJUXJTZFoxSHhqaUdNK0xGVGd2aVlsWWRCdGNs?=
 =?utf-8?B?emVENEt3aS9QVWVXN2dyREZCT0JYSGgvLzQ0L2N6Ykp4d1d5aGZqNHlWQncy?=
 =?utf-8?B?NzRqcVFyaFFtQjNDUWdkUGpGZnc1ZDgyRnB4eG1qZmdBcEljYWVGUytCakNI?=
 =?utf-8?B?STgyQTArN1kyZnhyOC9ucElYRFlaVmVISlhrV3UwbU1Dc3pSMGd4NXlxVHVx?=
 =?utf-8?B?bEc3ajU2ZVZzNjVma0lIbkZZMjI5d1h3WkVTb3JhTVMrdEd0dFBWRGF3SHFE?=
 =?utf-8?B?ZlJ1VFZjWC9wbXJ2WVFReUpwWXprNzI5SC9xS1lEZW9oUHk5NHVQMCtyb1dD?=
 =?utf-8?B?WTFReG5uWDdaeVM0SDdEKzlPeFpFcUd4a0w3OTgyT0hYSm5OT1hpa3ErZ1ZP?=
 =?utf-8?B?MzdDS1ZGTXpCMlY3blprSk5zeitFVXhIdFRUWVRwWlhxeEZpbUIvT3JXNzlk?=
 =?utf-8?B?NjNUZEdEajF3MWEwdDZraW50NHpVMjc1YUFBV1Jack1EaDh6dkFxeXlDc0k5?=
 =?utf-8?B?Y0J3bjJCM0U0M25nS3hXMG9pRW5udFZpVStMRnptY1VrVW94WTdlblRmeEd6?=
 =?utf-8?B?UmNiTEl5WEZCV24yRHJnY0JTK0YxL1pRVCtOYTM2aklXWXBqQk11Q1d3TXF1?=
 =?utf-8?B?VTY2RVgvMzNqaFN4Wk15S1VIQlcyQnNKajg0VWRqTk03aTVmSUFWMGNhN3lX?=
 =?utf-8?B?Q0MrTnE4YTZCVkVRU2hmNC83UU9yQUF2cksvZkRRU2V0Qktzc1hPVVhRVEJQ?=
 =?utf-8?B?MHZLK2xDRVpZa011dWxVcGVaNXp6bzkzVXN5R3NqTU8raUwweUhDa2ZyUEc3?=
 =?utf-8?B?QkttM2RYMURDQTFjYnJUbytDMGljblhqYUN6WThJQ0lBYTV3L0huVk1zcG9Z?=
 =?utf-8?B?Nk9xdkg2UndSR3ZLNXdhRlpLckM1T3FSbWtvME9CVFRpNThJaUF5cDNsVXNh?=
 =?utf-8?B?RHhKUWd3SzMxU0tlakp1YWxlV2lKZGV6b2x4dmxEWWtxQ1FGL1lkSEFyS2ZV?=
 =?utf-8?B?NzNjM25nTWdrUHgyNVBUbHkwaFJQa3Z2UUw1L2d3dysreFFJTTNkVXplOGZH?=
 =?utf-8?B?cHd6WmJaZDFIaUpxQ0RySjQwNFBwL2pubElDVEp2UmVsaTYwSXlEeDhQUWZy?=
 =?utf-8?B?d2ZMaDdZTTZWOEpFcEZRSWNaaWJ5dGpDWmRab3ZnZ3IwVDlMbzlYVUhaWGlU?=
 =?utf-8?B?MHpBZTFaYnUwOUltVEhrSkVjTXpMV1diWEFvVFRoMjFuVU1RR0NQWXNVVnM4?=
 =?utf-8?B?eUVYQjVOOEdTeXkvSTB1WnFFR3ZqVDBSdm4xdWhVYktHb2N3TEMwWXZmenZ2?=
 =?utf-8?B?SFNYMitLcldxbTh0dDNtamR3RWVtZy94UHcyK1JNcXVvRE1KbHZVVjBnOUps?=
 =?utf-8?B?bkZMbW5sdktuNlJvcHFseW1IOFp2b0J2ZkFrRS9WVDhRZDc2M25nNEdpWnM2?=
 =?utf-8?Q?uXsc2ZO+tdB6T3aPZ220M0fxjw8OTMtMPTRuMdtL04=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BD47950A5D6CB24E94EDC7200FFCA4E8@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b611f8a7-9300-4129-6ed3-08d9dc0111ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2022 10:39:00.2665 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jVUJn1+PPAwXqtuM6hab4KFD33NhNvlavq0p3oAAF3+Acg7nv4yfuGAvKG39cJldjpx07oYpFLaBf2Ewv7eDuTC578lql1bZPpPC6Zaizo4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2664
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7e18::60e
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7e18::60e;
 envelope-from=christophe.leroy@csgroup.eu;
 helo=FRA01-PR2-obe.outbound.protection.outlook.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.001,
 RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Cedric Le Goater <clg@kaod.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QWZ0ZXIgYSBUTEIgbWlzcyBleGNlcHRpb24sIEdQUnMgMC0zIG11c3QgYmUgcmVzdG9yZWQgb24g
cmZpLg0KDQpUaGlzIGlzIG1hbmFnZWQgYnkgaHJlZ19zdG9yZV9tc3IoKSB3aGljaCBpcyBjYWxs
ZWQgYnkgZG9fcmZpKCkNCg0KSG93ZXZlciwgaHJlZ19zdG9yZV9tc3IoKSBkb2VzIGl0IGlmIE1T
UltUR1BSXSBpcyB1bnNldCBpbiB0aGUNCnBhc3NlZCBNU1IgdmFsdWUuDQoNClRoZSBwcm9ibGVt
IGlzIHRoYXQgZG9fcmZpKCkgaXMgZ2l2ZW4gdGhlIGNvbnRlbnQgb2YgU1JSMSBhcw0KdGhlIHZh
bHVlIHRvIGJlIHNldCBpbiBNU1IsIGJ1dCBUR1BSIGJpdCBpcyBub3QgcGFydCBvZiBTUlIxDQph
bmQgdGhhdCBiaXQgaXMgdXNlZCBmb3Igc29tZXRoaW5nIGVsc2UgYW5kIGlzIHNvbWV0aW1lcyBz
ZXQNCnRvIDEsIGxlYWRpbmcgdG8gaHJlZ19zdG9yZV9tc3IoKSBub3QgcmVzdG9yaW5nIEdQUnMu
DQoNClNvLCBkbyB0aGUgc2FtZSB3YXkgYXMgZm9yIFBPVyBiaXQsIGZvcmNlIGNsZWFyaW5nIGl0
Lg0KDQpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGNz
Z3JvdXAuZXU+DQpDYzogQ2VkcmljIExlIEdvYXRlciA8Y2xnQGthb2Qub3JnPg0KQ2M6IEZhYmlh
bm8gUm9zYXMgPGZhcm9zYXNAbGludXguaWJtLmNvbT4NCi0tLQ0KIHRhcmdldC9wcGMvZXhjcF9o
ZWxwZXIuYyB8IDQgKysrKw0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykNCg0KZGlm
ZiAtLWdpdCBhL3RhcmdldC9wcGMvZXhjcF9oZWxwZXIuYyBiL3RhcmdldC9wcGMvZXhjcF9oZWxw
ZXIuYw0KaW5kZXggYmM2NDZjNjdhMC4uOTgwZjYyZmQ3OSAxMDA2NDQNCi0tLSBhL3RhcmdldC9w
cGMvZXhjcF9oZWxwZXIuYw0KKysrIGIvdGFyZ2V0L3BwYy9leGNwX2hlbHBlci5jDQpAQCAtMTE2
NCw2ICsxMTY0LDEwIEBAIHN0YXRpYyB2b2lkIGRvX3JmaShDUFVQUENTdGF0ZSAqZW52LCB0YXJn
ZXRfdWxvbmcgbmlwLCB0YXJnZXRfdWxvbmcgbXNyKQ0KICAgICAvKiBNU1I6UE9XIGNhbm5vdCBi
ZSBzZXQgYnkgYW55IGZvcm0gb2YgcmZpICovDQogICAgIG1zciAmPSB+KDFVTEwgPDwgTVNSX1BP
Vyk7DQogDQorICAgIC8qIE1TUjpUR1BSIGNhbm5vdCBiZSBzZXQgYnkgYW55IGZvcm0gb2YgcmZp
ICovDQorICAgIGlmIChlbnYtPmZsYWdzICYgUE9XRVJQQ19GTEFHX1RHUFIpDQorICAgICAgICBt
c3IgJj0gfigxVUxMIDw8IE1TUl9UR1BSKTsNCisNCiAjaWYgZGVmaW5lZChUQVJHRVRfUFBDNjQp
DQogICAgIC8qIFN3aXRjaGluZyB0byAzMi1iaXQgPyBDcm9wIHRoZSBuaXAgKi8NCiAgICAgaWYg
KCFtc3JfaXNfNjRiaXQoZW52LCBtc3IpKSB7DQotLSANCjIuMzMuMQ0K

