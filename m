Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF77C4791E9
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 17:53:10 +0100 (CET)
Received: from localhost ([::1]:56514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myGTl-0001ac-VR
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 11:53:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christophe.leroy@csgroup.eu>)
 id 1myGR6-0006wW-Tf; Fri, 17 Dec 2021 11:50:24 -0500
Received: from [2a01:111:f400:7e19::617] (port=57419
 helo=FRA01-MR2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christophe.leroy@csgroup.eu>)
 id 1myGQy-0000Ob-D8; Fri, 17 Dec 2021 11:50:24 -0500
Received: from MRZP264MB2103.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:a::5) by
 MR1P264MB2233.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:2::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4801.14; Fri, 17 Dec 2021 16:49:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lVRvaxBkKu2Z3T0Sw/sVke8Jp6iasY1SLm0UwLljeby11dvbZeO68YSJu9c/mrkAS0ZqT2MkJERvgrNZBgFAlYNJfdiqxGICH60d/2+xeGj60T0EXTRojtXIZRiA3Tcazylu8qwLKa5AVu/DwuB0zXWSax9IBzv1zIGaoUyht6ie7TVQvcec27bqZQG+cGWaJiYnyPGDVWPW2SQTC4El+eapD4aoDEDkYokh+M+5JFbsGNyYiCgOITOxYFEupxM1k7cd5CyoWNEHjvZdu2Z/mf+zDdG2kEdnne6F9z0YktKCNcmwePRdprd1C5ramUeSF1ScphOvWuXKVpL5/qcH8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pvbj4KAnHd8+hRqBH6V++YXnOB2V7NJGSMp27Yb00/I=;
 b=cD4MXZ+PCzhX2qiTY/M1Hu8NtxqgvzFJs6hBws4/Ae3OId+SWcHPdY1XSimyObRnt92YAhpSYfHAqEibwz/vTFLeThTXWvR1ydcnlcdXi/BvrOPgxTr51p3bw+Ot92JnzfCugw4F4ie1Zc9sYdSXeiufRmSzKhdgO+S/BExw2A7OiiDbiXwW/lHVTiqVbQ2pSPdPwKzjLCxKTpprLvD6RKAQoHecfJo4p+GKTPVgwpvIa+sBQdMgP0/nVkVCaDSdA2TyrgKNetUBt9cKgFAz5wTW98EnPTSD/Z3bDpU5TcseW/hbQnnGScwq/Q6P+mwsw+mA9oD4i1wUlgYl8waDGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2103.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:a::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4778.16; Fri, 17 Dec 2021 16:36:45 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d%5]) with mapi id 15.20.4801.016; Fri, 17 Dec 2021
 16:36:45 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>, "qemu-ppc@nongnu.org"
 <qemu-ppc@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [PATCH 00/15] ppc/ppc405: decade cleanup
Thread-Topic: [PATCH 00/15] ppc/ppc405: decade cleanup
Thread-Index: AQHX6o0+yuO9Bqp0YUGwCcVcsF3oLawz0nsAgAMg9oA=
Date: Fri, 17 Dec 2021 16:36:45 +0000
Message-ID: <b3345770-21e2-39f2-8fe2-e9963886e680@csgroup.eu>
References: <20211206103712.1866296-1-clg@kaod.org>
 <880aa46a-97cb-ad79-b72e-f8276692d750@kaod.org>
In-Reply-To: <880aa46a-97cb-ad79-b72e-f8276692d750@kaod.org>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ba10e787-9d38-419b-a0f3-08d9c17b69fd
x-ms-traffictypediagnostic: MRZP264MB2103:EE_|MR1P264MB2233:EE_
x-microsoft-antispam-prvs: <MRZP264MB2103504501489327F86034A3ED789@MRZP264MB2103.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jn2+IzPwIznNN55XoVCWBWvpcajYPFXJhd+4A/bMWSwRtC0MS2cEWBRgNyiQIBgYK5x2gQSO0PRDESmFiRpt+GIQ4agW1v8SgI3ADqk9jEOH+RKwA7/rFfa9008DhA8CmxRG/fObizrUDvBg3DWVk0VvCUuXkeO+yF+6jYlpdO2OFZZz3ADXS0eNVZZkbvrShCW6brefcjcEdNDeSgz7wRKsSHsWrWOiblhSMmwRmogI6YZrIUm+1ex4WiXjNFwugckN+gQ1ea+M93SI1IRqFzeUmkfF0y/8pLdFKQ5QI8gR/hUd/wQokj3oTHh3SfurYFPgB2HPhWjVgw5Rug0UBCYNpTCyi92MYNBlnWqtWULbpXJbgRxO8wFv7plHXnZo2S3i1tWyEoiuSpSopChkmv5pOWP9pU1XWYEqhHDolgwe6FPeOjJRLoqnthZfmwVg76sNwomlP84AaxEhAHx2PDCh4dIVZBluN8ePrkONCB19VzoMWExPaUfiNegAZyRzVMo4VI1nmheXkFXKh1S0XbOZ/SH4Zaz6uqHvLa66faRFInM9JR0zR6Vwxdm7MU8SaV41S1tlMrcyoUbDd+0XZVF36oEtcO0DiZFi1e5v25gthqJPrhvEtysDz1l1bsuhFLPBrsTW34Y2wAZAnn+MgPTCkg6JYERPTsy3jmYPaBWTFdHtjXt3HxnZuLZz7XNnKWP2MYKtXfGZedahPoBJAJYNyEUQC04+jXUy/V/qvajc0r0brP9zlHmynUI+LV2i6XBkl8qf7iDkneDq7CBxwkWmebEKb9zBkE+N/ArzmXNw8JcqYN0J1MH5Robi6tH9oJA9I54yM0uLC3NPVZD5W4TgdwM+mOJlI5EQ5rWLbmQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(44832011)(2616005)(6512007)(8676002)(122000001)(31686004)(966005)(8936002)(4326008)(110136005)(316002)(38070700005)(71200400001)(54906003)(66574015)(2906002)(38100700002)(36756003)(64756008)(186003)(76116006)(31696002)(66556008)(66446008)(107886003)(66946007)(66476007)(53546011)(508600001)(6506007)(6486002)(91956017)(26005)(5660300002)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S2hmRk9TY3hEaUp6MTlWWFhIWVJkbHQxZ1RHRFhNRjBrSVNrVVp5ZzlTTGVQ?=
 =?utf-8?B?ZVk2VmoxZm01NnBuUWV1OEV3SVoyVEZvZjdCZnQrSXpPdldyNVFPc2dmMnVN?=
 =?utf-8?B?N2wxQk5rMXJEd0JXMW5FYVpzb1llYTU4ZWpGTDNDZzREOXA4OHYvQ2lTSHU4?=
 =?utf-8?B?MHZYaktUa1o3bzFxOUtIR3ByV053Y2VkNEJTdldnN3QrbndWRkRmL3R1cHhJ?=
 =?utf-8?B?ZlFRNnhNclAzRmh1a01NQzcram9lS1V2WVBUZUFkcVdOU2VWRmRlTGcwVjZN?=
 =?utf-8?B?NjdUb1VYT3hUa2swa1hzYzQ0aERDMktnVi90M0M2dUsxcC9nQkEweEUxbVRk?=
 =?utf-8?B?ZGdtRXNrclR6MEJkTDNHNzJxOGx2UUlKL1VzSnNLaW5JWXZJQ25XNWxYc0F3?=
 =?utf-8?B?U3pjeXJnTnF6aWpBU3NEWU52bVVyR1pYaDZEZWVjQVptSWk4UFByUXc0RkVw?=
 =?utf-8?B?bXJySHVnbTlaaWNSRk1HNHdiV1hsZlVwZDMyVnpSNXlCa09KazVIQWkrbmg4?=
 =?utf-8?B?MjRmNkZjbXNqSFFNcXlIUXE3VXhxR0trL3JuQUMxUzRyYW42bGtDQWI1MFBv?=
 =?utf-8?B?emk0UWJ6UisvZXZiWEFqYnZyelRsa3RmR0QyUkY1R2xiSERiNGpGd21BTDlO?=
 =?utf-8?B?UTYzUUtQc2FzTzRCL0kwS1A0V3VuNEVNTUt6MWdLa0s5QjhvOGZvVnczRHpH?=
 =?utf-8?B?M0ZFT29HV1h3b2ZWZ3paM3ZYRk0vZzVpTGR2K2NPdURFb3BVeFErYXkwRUgw?=
 =?utf-8?B?REwyYXdpWlVRZjl2K3lsVTZPRndOUWpzZW45c3ZZVDIxZ0JuM3JobGxlMmpW?=
 =?utf-8?B?TW50emc5TGtYNzJNbUM4K2xGUDBmUlVKOHZHQ3ZzQzRKWU9zZW1vazh6S2M1?=
 =?utf-8?B?Y3ZwcEZKUG1RbWxiMWJUNmRpNDhBMGN5c01DQ1ZHNnkxYzhqSDB2V0lEOGkv?=
 =?utf-8?B?cnZocHhaM1VvSjNiT2NZdlZodHZyQXdQZTBYV05mekNjVFJGVWVENVpOOVJQ?=
 =?utf-8?B?NFNCRFpQSXJ1bUt6R21XWnNJRGgyZUZjY0FZK1k5OWZVZ0pkVVpoQWtrT0FG?=
 =?utf-8?B?bzVRaUkwTW8ySUZUK0phOS82ZVRqeE55UDZjWTZGQ2EvK2FGUVVSamlxWTd0?=
 =?utf-8?B?dzZTTDZ5UWZNYjNRMm5kbElERHZQL0huZkVzYjFnZ3o4TTJYWlNWbEFncExs?=
 =?utf-8?B?c2h5U2F1dHNMTlJDV0kra2ZKbUNieStMYjhjQlhDKzl1ejVMQ3YrSGJhaDBh?=
 =?utf-8?B?SXVndlkxU21TUHJzaWt5VWdHRmlNOEVLWC9DckJpOXlQSDI2VXdaRGZxMmJ6?=
 =?utf-8?B?NFN1cS84V1hySE1iUVgxVE5sNW5meUJUa0grdzJHSFF2Q2ZSWnpMOElBYzlC?=
 =?utf-8?B?RGF0ajM1KzN6aTBTSFBROUdNVTl1bWwvR1paUnFKUXVqRXErNEtDaGVJQnR3?=
 =?utf-8?B?cmR3QzRkMjE3a3ljVTZhVDREMlFuNEZSemVuUUVvNHJPWE9QejV3bVVRQ3Vs?=
 =?utf-8?B?ZXA1d0ZVbnlSUG8rWjBFczRZenhKMDE2MytJWHVlR043b2N5SXZpT0xsSEZI?=
 =?utf-8?B?NzdXS0xWVnZLckU0M083bStjeitLa21WZXIzcFZQL2JjOGRTcFlJeC91M0pU?=
 =?utf-8?B?Q0pFUTVLRGtleEtYd2xZK2lNeXJTdG5aV3F3MmJHOElaOUVIdXZoOGZuRDhh?=
 =?utf-8?B?Vm5MamxvYlhiMEhXVFFKeDVvZFVjSU81RUZDWWgxbkdsK1RqWWhGSUw4MnA4?=
 =?utf-8?B?MEM4d3NEZFVESk9obGlwSE0ydWRFY1lNdlBnclVmQ1RSSml3SE4xWi9GT2F6?=
 =?utf-8?B?WTlsWjJwYUh0SWxwaG54VlZWUEd2QjN4alR5WWE5dXlFWjFLRW1vMUUrU0lN?=
 =?utf-8?B?T0E5Ukx4dDg4eVRERFFKR2Vzek1VQ0hlWEVybmNnQlVCRXgxRmJVZWpvMHBm?=
 =?utf-8?B?R0dRZE1xclBkaEdBbXI1cGQvemNYcWpPa0pWWTg4VWUzbTZCWHdIaVpqQ1hT?=
 =?utf-8?B?M25Obkdtb3MrZFNtTFlLWkFzVkEzUlJpWk54YWdaOFpCV3FLZ0xqUFBGQkVr?=
 =?utf-8?B?R2JQdU5Gc2hOa2E2YzIra2NUOXgvSThOZ3FDMTdIOFVrY01zbGRKVm5BaG4z?=
 =?utf-8?B?VXpOVFdhU0piWDh4dExjNndrajhiL2JGbzlBcm1NdEVCY1hqSVdRazM5c3R6?=
 =?utf-8?B?U0VLaWFKbk1majFmQWhkdWpYZi9PVnkzdVJEbkhGcHdYNFVWWkc3NktkM2tt?=
 =?utf-8?Q?DdDF5pm4KdW5oxwiifyaal6GCGDLZmw01TXJvv5ygI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2D914559DF67FD4284EB5CD23751EEF1@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ba10e787-9d38-419b-a0f3-08d9c17b69fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2021 16:36:45.2378 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v/uPPF8s66DAi8LmhGPygQDEHk0ADeNhjR+/p1DHTucLYH/XDjRUtvcBIizQhcpP54j7M6Zc45qndyfW0/JHlusQph9fq3RXehQrRJObKFY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2103
X-OriginatorOrg: csgroup.eu
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7e19::617
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7e19::617;
 envelope-from=christophe.leroy@csgroup.eu;
 helo=FRA01-MR2-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.716,
 RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCkxlIDE1LzEyLzIwMjEgw6AgMTc6NDksIEPDqWRyaWMgTGUgR29hdGVyIGEgw6ljcml0wqA6
DQo+IE9uIDEyLzYvMjEgMTE6MzYsIEPDqWRyaWMgTGUgR29hdGVyIHdyb3RlOg0KPj4gSGVsbG8s
DQo+Pg0KPj4gVGhlIGdvYWwgb2YgdGhlc2UgY2hhbmdlcyBpcyB0byByZWZyZXNoIHRoZSBRRU1V
IHJlZjQwNWVwIG1hY2hpbmUgYW5kDQo+PiBlbmFibGUgYm9vdCBmcm9tIGEgTGludXgga2VybmVs
IHdpdGhvdXQgcmVseWluZyBvbiBhIFUtQm9vdCBmaXJtd2FyZS4NCj4+IFRoZSByZWFzb24gZm9y
IGRvaW5nIHNvIGlzIHRoYXQgd2UgYXJlIHVuYWJsZSB0byBmaW5kIGEgInBwYzQwNV9yb20uYmlu
Ig0KPj4gZmlybXdhcmUgaW1hZ2Ugb3IgYSBmbGFzaCBpbWFnZSBmb3IgdGhlIDQwNUVQIG1hY2hp
bmVzLg0KPj4NCj4+IFRob21hcyBmb3VnaHQgaXMgd2F5IHRocm91Z2ggb24gYSB2MjAxNS4xMCBV
LUJvb3QgYW5kIHRhaWh1IGRlZmNvbmZpZw0KPj4gYW5kIHByb3ZpZGVkIGEgY29tcGF0aWJsZSBp
bWFnZSBhdmFpbGFibGUgaGVyZSA6DQo+Pg0KPj4gwqAgaHR0cHM6Ly9naXRsYWIuY29tL2h1dGgv
dS1ib290Ly0vdHJlZS90YWlodS8NCj4+DQo+PiBXaXRoIHRoaXMgaW1hZ2UsIFFFTVUgcmVhY2hl
cyB0aGUgVS1Cb290IHByb21wdCAod2l0aCBhIHNpbXBsZQ0KPj4gd29ya2Fyb3VuZCBpbiB0aGUg
U0RSQU0pLg0KPj4NCj4+IE9uIHRoZSBMaW51eCBzaWRlLCB0aGUgb25seSBhdmFpbGFibGUgNDA1
RVAgQ1BVIGJvYXJkIGlzIHRoZSBvbmUgZm9yDQo+PiB0aGUgRVNUZWVtIDE5NUUgKFBQQzQwNUVQ
KSBTQkMgKGhvdGZvb3QpLiBJdCB3YXMgYWRkZWQgaW4gMjAwOS4gVGhlDQo+PiBib2FyZCBpbmZv
cm1hdGlvbiBzdHJ1Y3R1cmUgaW4gTGludXgsIGluIFUtQm9vdCBhbmQgaW4gUUVNVSBhcmUgbm90
IGluDQo+PiBzeW5jIGFuZCB0aGUgaG90Zm9vdCBib2FyZCBhbHNvIGFkZHMgaXRzIG93biBmbGF2
b3IgYmVjYXVzZSB0aGUgRlcgd2FzDQo+PiBhbiBhbmNpZW50IFUtQm9vdCB3aXRob3V0IGR1YWwg
ZXRoZXJuZXQgc3VwcG9ydCBbMV0uDQo+Pg0KPj4gRm9yIHRoaXMga2VybmVsIHRvIGJlIGxvYWRl
ZCBieSB0aGUgVS1Cb290IGltYWdlIHByb3ZpZGVkIGJ5IFRob21hcywNCj4+IHdlIGVpdGhlciBu
ZWVkIHRvIG1vZGlmeSBVLUJvb3Qgb3IgTGludXguIFRoZSBzYW1lIHF1ZXN0aW9uIGFyaXNlIGZv
cg0KPj4gUUVNVSwgc2VlIHRoZSBsYXN0IHBhdGNoIG9mIHRoaXMgc2VyaWVzIHdoaWNoIGlzIGNv
bnRyb3ZlcnNpYWwuIFBsZWFzZQ0KPj4gYWR2aXNlICENCj4gDQo+IEFwcGxpZWQgcGF0Y2ggMS0x
NCB0byBwcGMtbmV4dC4NCj4gDQo+IEkga2VwdCB0aGUgaG90Zm9vdCBoYWNrIGZvciBsYXRlci4g
V2UgbmVlZCB0byBmaXggdXNlciBzcGFjZSBmaXJzdC4NCj4gDQoNCg0KRG9uJ3Qga25vdyBpZiB0
aGlzIGlzIHRoZSByZWFzb24gb2Ygb3VyIHByb2JsZW1zIGJ1dCBJIHRoaW5rIHRoZXJlIGlzIA0K
c29tZXRoaW5nIHRvIGludmVzdGlnYXRlIGFyb3VuZCB0aW1lciBpbnRlcnJ1cHRzOg0KDQoNCi8g
IyBjYXQgL3Byb2MvaW50ZXJydXB0cw0KICAgICAgICAgICAgQ1BVMA0KICAxNjogICAgICAgICA2
OCAgICAgICBVSUMgICAxIExldmVsICAgICBzZXJpYWwNCkxPQzogICAgICAgICAgMCAgIExvY2Fs
IHRpbWVyIGludGVycnVwdHMgZm9yIHRpbWVyIGV2ZW50IGRldmljZQ0KTE9DOiAgICAgICAgICAw
ICAgTG9jYWwgdGltZXIgaW50ZXJydXB0cyBmb3Igb3RoZXJzDQpTUFU6ICAgICAgICAgIDAgICBT
cHVyaW91cyBpbnRlcnJ1cHRzDQpQTUk6ICAgICAgICAgIDAgICBQZXJmb3JtYW5jZSBtb25pdG9y
aW5nIGludGVycnVwdHMNCk1DRTogICAgICAgICAgMCAgIE1hY2hpbmUgY2hlY2sgZXhjZXB0aW9u
cw0KDQpBbnkgaWRlYSB3aGF0IHRoZSBwcm9ibGVtIGNhbiBiZSA/IEhvdyBkb2VzIFFFTVUgZ2Vu
ZXJhdGVzIHRpbWVyIA0KaW50ZXJydXB0cyA/DQoNCkNocmlzdG9waGU=

