Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB3D444438
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 16:04:07 +0100 (CET)
Received: from localhost ([::1]:39182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miHo6-0000kY-Tf
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 11:04:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuemingl@nvidia.com>)
 id 1miHe9-0003ft-TC; Wed, 03 Nov 2021 10:53:50 -0400
Received: from mail-dm3nam07on20627.outbound.protection.outlook.com
 ([2a01:111:f400:7e83::627]:35274
 helo=NAM02-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuemingl@nvidia.com>)
 id 1miHe7-0004cM-5F; Wed, 03 Nov 2021 10:53:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UT8awlYyWwIY0Taqo+b8t2BOpaj8vCsutNeu1dNFlwBD1hHKQD6+wr0MbBEBzTG1zBpQkvvUCzHC48WOuxWJSTIg3Ches6Oyod9nSw3X2RHE09VUfSyhqa1gBxQfsoXctfR70EWrPCAWAgnq/ShC+tteeHZ/8IlN3QTfWsi1NJ3trbEU4Co7otEt/BOqEk7+Udraobl09BRfmZGKaBdF3uL7VW9+6XlsNiNaUX3uxqzN9U7vtUSFCTl5ZkzA1R6Gp1kZbWESH9n4mgwF9qS471CfkdLw5XZ66cdnlcUTXx8Mp4eUHQytS3VIofu6B/BmAQNAtSbl65vxwatu4BTIFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xSIJJUH7gVUTkkQ60LISMfYMqo6BN1twXGtdIfcQVY0=;
 b=MnUf/KWgEoH8TnKrwomF/KWa/MsBtV0TrMU/FFhFfRjJ/e2Jj15Rp00apJ6e+AFFAoHHflWaUVvQ4VUGJxvlp13UkVjM302/PhMmP/A4BS4J+VYjLQtqeniVFDRqQfjGS1YqS4AlND3GWghwf7yN2/rMXvJG6C3TafoUzb2DBELWnxSnwcdSnYWHHwNPA8mgAjkherGU8lD8qxq5W8JcyMf3LQIAoFBnom4NLHQzvWxJ0elflswGLzch6NRK87TLjSSoilxuWhfyicblkiBzDXa6dKZVljFlX8U63hy16k32xJjdna9XO5S091/8Nc7X+b2JKywmoiNqrMKIzpDIew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xSIJJUH7gVUTkkQ60LISMfYMqo6BN1twXGtdIfcQVY0=;
 b=Gzbx3/u/TN+8qzLDU2Xmvl4wni+XXykaKbcX7uF5iEpzUL/W9SS7fUBF8/0A7ai5BADIqaSlIRrC4vSiCFTGBz6u8pAYtkhxgrGJjPbHu82yvDGOLJ+eKgNIAxr8omr7hGa53Q5aI50eYlpkDRstlX/Ri06Lu2lJCYihmJfZKiKqaQ/0addvJo3AjzV0OXr0cBWOoHD87bzaR1LDXCJ1nci5ZChNRu9XN6fcCVGgzWqekRPP7uT1rPEcOP+OgxyolcaFCtWx3onNlEif8oDZSDrP+U6lh4dRHaCV+ObdnWm+Mdj9V4YucGG4+Nse2s7zUxqWsiSJH47aNRbbLMVLwg==
Received: from DM4PR12MB5373.namprd12.prod.outlook.com (2603:10b6:5:39a::17)
 by DM4PR12MB5200.namprd12.prod.outlook.com (2603:10b6:5:397::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Wed, 3 Nov
 2021 14:48:41 +0000
Received: from DM4PR12MB5373.namprd12.prod.outlook.com
 ([fe80::584f:672a:653f:fe25]) by DM4PR12MB5373.namprd12.prod.outlook.com
 ([fe80::584f:672a:653f:fe25%5]) with mapi id 15.20.4649.019; Wed, 3 Nov 2021
 14:48:41 +0000
From: "Xueming(Steven) Li" <xuemingl@nvidia.com>
To: "mst@redhat.com" <mst@redhat.com>
CC: "zhangyuwei.9149@bytedance.com" <zhangyuwei.9149@bytedance.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-stable@nongnu.org"
 <qemu-stable@nongnu.org>
Subject: Re: [PATCH v6 1/2] vhost-user: remove VirtQ notifier restore
Thread-Topic: [PATCH v6 1/2] vhost-user: remove VirtQ notifier restore
Thread-Index: AQHXzvvqdEwO0IQ5t0iKSU5G4bcqHKvvKsUAgACXagCAAAtOAIACGFGA
Date: Wed, 3 Nov 2021 14:48:41 +0000
Message-ID: <87c14dc604e49b2ae85e9dcf1de4e813106fad6b.camel@nvidia.com>
References: <20211101083813.1224522-1-xuemingl@nvidia.com>
 <20211101083813.1224522-2-xuemingl@nvidia.com>
 <20211101170506-mutt-send-email-mst@kernel.org>
 <f433ca338852f0aaad9e23cb47ee39dd53061310.camel@nvidia.com>
 <20211102024742-mutt-send-email-mst@kernel.org>
In-Reply-To: <20211102024742-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5a899af1-edd2-4984-69af-08d99ed9074c
x-ms-traffictypediagnostic: DM4PR12MB5200:
x-microsoft-antispam-prvs: <DM4PR12MB5200C32D0B78DA2850EF473EA18C9@DM4PR12MB5200.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ReTCVZSam/so3JP6fbsBxFeVBUyaYNmXhEqZ0+TBuT5ZMFtRqPr3NHT1vRFTWuSzaNXixwSoebB86sXQNKH2M5ZQfTTwu8disyFhRTMdC9mZ3Ex74uAJQ1XWkVUk2+KqoLXQS1AgKG3sxcOZ0T1mL6bNhwI13AAq2Tt84RugrqTi5xxywwVY465LtnNc8U5rpUU5+eM2LqiD3C1rBlEjFPjO5ki88m11DrsO7ybQZQSKTsTAn1fYlnihQs4nlFZKs8/R2vRVS+UwIxzaTFkV0TfkMJq3XdNUoKniWGsjhiQmADbt4yRLoO9NgYvCmpiTBYBDbRvdzfeuxiDqv4W+1TZKk58jKThMUSOQQ8qrPazoCodn0x4UTPPwmC19xnHr7BFnfrCDS0Afy0ec0mgGg9tvPcESWFN71VOUyqv2xLWvCITRZ6s2C1iq4Feu0fYcU0gARjdhZJmwuL1NQQAFKAwzGvansU3Aq4PneuvbTuFhAQun7lnMLFbLbpQyUKCx37htqEZigdS+CyH96Zb4m+2e8xctcR/XpbINDBUsuRIWp04W9GtXZq9KwnvKGG8JTF3S2Et9rLfhYEThO9ONbXx7/NHFNay9purNwIdCZfV6C6aNJvtlUFUQYkEcBtjM0Ru7BqOZjbhD+KAi8SGpOZNNDTu4QJjNz/RjkCk3bTWyKrKdCV5AwZmtqBR7/OSbnDJjuPSALyoTyzWAr/qBvQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5373.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66446008)(26005)(5660300002)(186003)(8676002)(6506007)(508600001)(86362001)(6916009)(316002)(54906003)(38100700002)(36756003)(6512007)(71200400001)(122000001)(4326008)(83380400001)(2906002)(64756008)(6486002)(66476007)(8936002)(38070700005)(2616005)(76116006)(91956017)(66946007)(66556008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cWJOWW1pNFZSWlRRMGMwWnlPNUNCUFh3QXVvcCswWFlmazBGQWk0ZWlRS2xG?=
 =?utf-8?B?cDh4QlVVVjBZV0JZWVJvSEpKWGlGTitwOC9TSG9UOFhaMVBYczhmb2NYcFc4?=
 =?utf-8?B?azlPR0g4dURaMVc3ZHlSUm1IODFNbXpWUWxzeCtPOE5iaHZpN25kcmR3NW0z?=
 =?utf-8?B?dTlnbE05enQrTEJBY1dIRXZZeW1vU3kyTm56Q3N5SUdpL0tzUEhtR1FEWlRL?=
 =?utf-8?B?b2dQZXQzWml4L0dLWW56R3MvalNHdGRnRFRKTDhqZW8zNS8xZFVkTjFWNVpG?=
 =?utf-8?B?UEE1WWNleitmOU1kZXZDNXVpRjVQdVplZnFZZkFrai9rSEtSWlhXcDdRQ1Ux?=
 =?utf-8?B?aXM2SU1WZGxiTktVemdNdkxSdFE1NTlUMXpyQnFNcjJvclZKNGR0RlJJSXRQ?=
 =?utf-8?B?YUVFMlF1YTlYekExS3N6Q2c1YjErYnpPKzkzQXV4NXlmT2ZRTnFhTm5VR1I1?=
 =?utf-8?B?SW9QQk5oZmJFaXFZaHNUNmtHNUoxUVZPN2VTNEY1bkY1Zk1UYUR4djM4Vmdw?=
 =?utf-8?B?aVNLZjQvcnV5TTlRbjg4amZLNkhJTkQ0MXA5eWpBQjB3R3VuYkdLbTNQdU5i?=
 =?utf-8?B?QmJEdzAzT1ZJb0wvMWNINDJXV0FiaFVWTGFwYkhTRFkwTCt6MzlFMVZWWjdM?=
 =?utf-8?B?ZUxWelhDbElubVVpT1ZBNFFVeXZhbGc1bXcwVnBxZ3duRXFLRSs3ZzY2RTFN?=
 =?utf-8?B?YlJORTB6MEtsSEJLRiszTjVwUWxWYkZlSmJHQ1hoM0o0bldmZTFyNTJCcVFB?=
 =?utf-8?B?NWdUblpqbHF6Y0VVUldiV1VOb2wwT1B2UW83NWMzRTdhTkI2eTFuZFFzNlYw?=
 =?utf-8?B?ajlER0Z0QmR2RjNpWjJRQm9EUVY1bWRUL09sYWQxcWFtdnVGZ1JNMG5MU2Zn?=
 =?utf-8?B?b3FUUGtmYWcyRHJubVBBSnVqNENPZHhXaENlR29TU2JENUZ0L3QxN1c4Yzhw?=
 =?utf-8?B?RWk0UTFDWGd2RGRzWnpPcmd6bTUrWkFwZk4rRkRBYllVT1NaSGhWbGdLSmRJ?=
 =?utf-8?B?b2gveTAwRTJYK2p1Y3Q3UDJMaVdjOEMrcWFXVEoxVG5tQzlUT2Y3QXBvYUFJ?=
 =?utf-8?B?eDZPc2FWOWMxNVpEQkt4cjFKaGtQLzZWeFpVQkF6cXIzcDlGVTdGcVFNTVpk?=
 =?utf-8?B?Uk1QeUhRZVE0anowN2EvZlVKOHF6SDZOd3FNNGFOWEVDNnI1KzVLTis5c3ZK?=
 =?utf-8?B?ZDYwTGYrcVdzWTRueE5SWjJQZDFCakkzdnp2TXJjQkFvL1ArMWxVWjcyUy9Y?=
 =?utf-8?B?SWNOOTJuUmp4dHYxNDllM0t2ZEV6Y1NYZ1RwVlY3QWJtZzJFd2loS2xFREVT?=
 =?utf-8?B?cGkwdkhFOVNXV0VVRm9wNzQ4MjAra08xZnkvcW9Fc09YaEI0MjM5aTR3b293?=
 =?utf-8?B?OFlIb3pialhkeGpGUXlCejFwN3EvUXc3M3FUa1pwOG1lbnRpaUxZZ0J2VWNV?=
 =?utf-8?B?VEZXSDF5aURhTEIyVTRIUGQrRGJFYXBkdGNlVmZ4N0EvSUcvYTRJSTUxM0Rl?=
 =?utf-8?B?clBxVWdTL0d0cGkxaTlScmUrKzBsUkRtbGJ1WVVLbTdpT09sRjc4M212alox?=
 =?utf-8?B?SE5DOUduek9WMi9ROHR6TnQ5Z1lHajFuN1hnS3JKRVgzOXBRSys4SjNaL1N6?=
 =?utf-8?B?MFVpeTA0ZVdhSkNDbGxZN2V3RW5FQTdEb2l2citIbHpXWDRpZVZ3aGVxK2Rl?=
 =?utf-8?B?ZmRIdW02SGZlYmkzQXdaa0NuaVoraWRKUlFIZmhveStFREw2dG81ZWl0RkF5?=
 =?utf-8?B?MzYwNkZtRHFhN050NkZEOTd2alBhd2QweDUyL3pMZlYwc0RCWHMyK0RrdTl0?=
 =?utf-8?B?TGpTcGxnREJPNE9VTjFxeERQZml2MEppNmVSTE80eStCdTBGUFdpaEdzVnNK?=
 =?utf-8?B?dXZQa2Rqc3hNWXFDWlFJUmFDbnMrVTd0Rm9CNVd4bkt4REQ3TG1YK3FDcW5k?=
 =?utf-8?B?MkV3aXlreC9XZUFyeGs2WDhuNW4vU0kwd1N3RXZzS3VzNGkrOVgxc3krNlha?=
 =?utf-8?B?QkVmNk5YdVlPbDQ3Ykx4TGk0RGdlcWZTcEVJR21rVUhNZDNuMUdRR0VidFh0?=
 =?utf-8?B?TXBUUm45T2Z3elFuczV4UldnUHEwODlHZ3JOVDFta0JGaWJKRy92K1pubnNT?=
 =?utf-8?B?WXo0S0QvRkdzK3dPNWdZT0dldGIydk9CR2thQ2tKRFJ4NEZITCsyM1ZkVTJz?=
 =?utf-8?Q?FV33sd9Edm/xlOMRn23npCx7VPim3xz+VrdfUVkcsHDD?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <871F861B5DF2CB46AC595542476C09D7@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5373.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a899af1-edd2-4984-69af-08d99ed9074c
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2021 14:48:41.5841 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Cy5GqzBieBimn9Fs6w2m8QvGHOZDXnv7HTwBoYt+hNUA2R1sxZ3kFbBlp+ET7yOsFijgC+OyUX1gu7krn7qGfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5200
Received-SPF: softfail client-ip=2a01:111:f400:7e83::627;
 envelope-from=xuemingl@nvidia.com;
 helo=NAM02-DM3-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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

T24gVHVlLCAyMDIxLTExLTAyIGF0IDAyOjQ5IC0wNDAwLCBNaWNoYWVsIFMuIFRzaXJraW4gd3Jv
dGU6DQo+IE9uIFR1ZSwgTm92IDAyLCAyMDIxIGF0IDA2OjA4OjM5QU0gKzAwMDAsIFh1ZW1pbmco
U3RldmVuKSBMaSB3cm90ZToNCj4gPiBPbiBNb24sIDIwMjEtMTEtMDEgYXQgMTc6MDYgLTA0MDAs
IE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToNCj4gPiA+IE9uIE1vbiwgTm92IDAxLCAyMDIxIGF0
IDA0OjM4OjEyUE0gKzA4MDAsIFh1ZW1pbmcgTGkgd3JvdGU6DQo+ID4gPiA+IFdoZW4gdmhvc3Qt
dXNlciB2ZHBhIGNsaWVudCBzdXNwZW5kLCBiYWNrZW5kIG1heSBjbG9zZSBhbGwgcmVzb3VyY2Vz
LA0KPiA+ID4gPiBWUSBub3RpZmllciBtbWFwIGFkZHJlc3MgYmVjb21lIGludmFsaWQsIHJlc3Rv
cmUgTVIgd2hpY2ggY29udGFpbnMNCj4gPiA+ID4gdGhlIGludmFsaWQgYWRkcmVzcyBpcyB3cm9u
Zy4gdmRwYSBjbGllbnQgd2lsbCBzZXQgVlEgbm90aWZpZXIgYWZ0ZXINCj4gPiA+ID4gcmVjb25u
ZWN0Lg0KPiA+ID4gPiANCj4gPiA+ID4gVGhpcyBwYXRjaCByZW1vdmVzIFZRIG5vdGlmaWVyIHJl
c3RvcmUgYW5kIHJlbGF0ZWQgZmxhZ3MgdG8gYXZvaWQgcmV1c2luZw0KPiA+ID4gPiBpbnZhbGlk
IGFkZHJlc3MuDQo+ID4gPiA+IA0KPiA+ID4gPiBGaXhlczogNDQ4NjY1MjFiZDZlICgidmhvc3Qt
dXNlcjogc3VwcG9ydCByZWdpc3RlcmluZyBleHRlcm5hbCBob3N0IG5vdGlmaWVycyIpDQo+ID4g
PiA+IENjOiBxZW11LXN0YWJsZUBub25nbnUub3JnDQo+ID4gPiA+IENjOiBZdXdlaSBaaGFuZyA8
emhhbmd5dXdlaS45MTQ5QGJ5dGVkYW5jZS5jb20+DQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFh1
ZW1pbmcgTGkgPHh1ZW1pbmdsQG52aWRpYS5jb20+DQo+ID4gPiA+IC0tLQ0KPiA+ID4gPiAgaHcv
dmlydGlvL3Zob3N0LXVzZXIuYyAgICAgICAgIHwgMTkgKy0tLS0tLS0tLS0tLS0tLS0tLQ0KPiA+
ID4gPiAgaW5jbHVkZS9ody92aXJ0aW8vdmhvc3QtdXNlci5oIHwgIDEgLQ0KPiA+ID4gPiAgMiBm
aWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMTkgZGVsZXRpb25zKC0pDQo+ID4gPiA+IA0K
PiA+ID4gPiBkaWZmIC0tZ2l0IGEvaHcvdmlydGlvL3Zob3N0LXVzZXIuYyBiL2h3L3ZpcnRpby92
aG9zdC11c2VyLmMNCj4gPiA+ID4gaW5kZXggYmY2ZTUwMjIzYy4uYzY3MTcxOWU5YiAxMDA2NDQN
Cj4gPiA+ID4gLS0tIGEvaHcvdmlydGlvL3Zob3N0LXVzZXIuYw0KPiA+ID4gPiArKysgYi9ody92
aXJ0aW8vdmhvc3QtdXNlci5jDQo+ID4gPiA+IEBAIC0xMTQzLDE5ICsxMTQzLDYgQEAgc3RhdGlj
IGludCB2aG9zdF91c2VyX3NldF92cmluZ19udW0oc3RydWN0IHZob3N0X2RldiAqZGV2LA0KPiA+
ID4gPiAgICAgIHJldHVybiB2aG9zdF9zZXRfdnJpbmcoZGV2LCBWSE9TVF9VU0VSX1NFVF9WUklO
R19OVU0sIHJpbmcpOw0KPiA+ID4gPiAgfQ0KPiA+ID4gPiAgDQo+ID4gPiA+IC1zdGF0aWMgdm9p
ZCB2aG9zdF91c2VyX2hvc3Rfbm90aWZpZXJfcmVzdG9yZShzdHJ1Y3Qgdmhvc3RfZGV2ICpkZXYs
DQo+ID4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBp
bnQgcXVldWVfaWR4KQ0KPiA+ID4gPiAtew0KPiA+ID4gPiAtICAgIHN0cnVjdCB2aG9zdF91c2Vy
ICp1ID0gZGV2LT5vcGFxdWU7DQo+ID4gPiA+IC0gICAgVmhvc3RVc2VySG9zdE5vdGlmaWVyICpu
ID0gJnUtPnVzZXItPm5vdGlmaWVyW3F1ZXVlX2lkeF07DQo+ID4gPiA+IC0gICAgVmlydElPRGV2
aWNlICp2ZGV2ID0gZGV2LT52ZGV2Ow0KPiA+ID4gPiAtDQo+ID4gPiA+IC0gICAgaWYgKG4tPmFk
ZHIgJiYgIW4tPnNldCkgew0KPiA+ID4gPiAtICAgICAgICB2aXJ0aW9fcXVldWVfc2V0X2hvc3Rf
bm90aWZpZXJfbXIodmRldiwgcXVldWVfaWR4LCAmbi0+bXIsIHRydWUpOw0KPiA+ID4gPiAtICAg
ICAgICBuLT5zZXQgPSB0cnVlOw0KPiA+ID4gPiAtICAgIH0NCj4gPiA+ID4gLX0NCj4gPiA+ID4g
LQ0KPiA+ID4gPiAgc3RhdGljIHZvaWQgdmhvc3RfdXNlcl9ob3N0X25vdGlmaWVyX3JlbW92ZShz
dHJ1Y3Qgdmhvc3RfZGV2ICpkZXYsDQo+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGludCBxdWV1ZV9pZHgpDQo+ID4gPiA+ICB7DQo+ID4gPiA+IEBA
IC0xMTYzLDE3ICsxMTUwLDE0IEBAIHN0YXRpYyB2b2lkIHZob3N0X3VzZXJfaG9zdF9ub3RpZmll
cl9yZW1vdmUoc3RydWN0IHZob3N0X2RldiAqZGV2LA0KPiA+ID4gPiAgICAgIFZob3N0VXNlckhv
c3ROb3RpZmllciAqbiA9ICZ1LT51c2VyLT5ub3RpZmllcltxdWV1ZV9pZHhdOw0KPiA+ID4gPiAg
ICAgIFZpcnRJT0RldmljZSAqdmRldiA9IGRldi0+dmRldjsNCj4gPiA+ID4gIA0KPiA+ID4gPiAt
ICAgIGlmIChuLT5hZGRyICYmIG4tPnNldCkgew0KPiA+ID4gPiArICAgIGlmIChuLT5hZGRyKSB7
DQo+ID4gPiA+ICAgICAgICAgIHZpcnRpb19xdWV1ZV9zZXRfaG9zdF9ub3RpZmllcl9tcih2ZGV2
LCBxdWV1ZV9pZHgsICZuLT5tciwgZmFsc2UpOw0KPiA+ID4gPiAtICAgICAgICBuLT5zZXQgPSBm
YWxzZTsNCj4gPiA+ID4gICAgICB9DQo+ID4gPiA+ICB9DQo+ID4gPiA+IA0KPiA+ID4gDQo+ID4g
PiBTbyBvbiB2cSBzdG9wIHdlIHN0aWxsIHJlbW92ZSB0aGUgbm90aWZpZXIuLi4NCj4gPiA+ICAg
DQo+ID4gPiA+ICBzdGF0aWMgaW50IHZob3N0X3VzZXJfc2V0X3ZyaW5nX2Jhc2Uoc3RydWN0IHZo
b3N0X2RldiAqZGV2LA0KPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHN0cnVjdCB2aG9zdF92cmluZ19zdGF0ZSAqcmluZykNCj4gPiA+ID4gIHsNCj4gPiA+ID4g
LSAgICB2aG9zdF91c2VyX2hvc3Rfbm90aWZpZXJfcmVzdG9yZShkZXYsIHJpbmctPmluZGV4KTsN
Cj4gPiA+ID4gLQ0KPiA+ID4gPiAgICAgIHJldHVybiB2aG9zdF9zZXRfdnJpbmcoZGV2LCBWSE9T
VF9VU0VSX1NFVF9WUklOR19CQVNFLCByaW5nKTsNCj4gPiA+ID4gIH0NCj4gPiA+ID4gIA0KPiA+
ID4gDQo+ID4gPiBidXQgb24gdnEgc3RhcnQgd2UgZG8gbm90IHJlaW5zdGF0ZSBpdD8gRG9lcyB0
aGlzIG5vdCBtZWFuIHRoYXQNCj4gPiA+IG5vdGlmaWVycyB3b24ndCB3b3JrIGFmdGVyIHN0b3Ag
dGhlbiBzdGFydD8NCj4gPiANCj4gPiANCj4gPiBZZXMsIGJhY2tlbmQgaW5pdGlhbGx5IHdvcmsg
dy9vIGhvc3Qgbm90aWZpZXIsIHJlcXVlc3QgVk0gZHJpdmVyIHRvDQo+ID4gaW5zdGFsbCBub3Rp
ZmllciBpZiBuZWVkZWQgLSBjYWxsIHRoaXMgZnVuY3Rpb24gdGhyb3VnaCBzbGF2ZSBzb2NrZXQu
DQo+IA0KPiBJIHRoaW5rIGl0J3MgY2xlYW5lciBpZiBxZW11IGhhbmRsZXMgdGhpcyBpdHNlbGYg
bGlrZSBpdCBkaWQgYmVmb3JlLCBpdA0KPiBrbm93cyB2bSBpcyBzdG9wcGVkIHdpdGhvdXQgZ2V0
dGluZyBjYWxsZWQuDQoNCklmIHZob3N0IHBsYXkgYXMgc2VydmVyLCB0aGVyZSBhcmUgMiBzY2Vu
YXJpbyB0aGF0IHJlbW92ZSB0aGUgbm90aWZpZXI6DQoxLiBWTSBzdXNwZW5kOiBiYWNrZW5kIHN0
aWxsIHRoZXJlLCBpdCdzIG9rYXkgdG8ga2VlcCBtbWFwIGFkZHJlc3MuDQoyLiB2aG9zdCBiYWNr
ZW5kIHN0b3BwZWQgb3IgcHJvY2VzcyBraWxsZWQ6IHJlc291cmNlcyBmcm9tIGJhY2tlbmQNCnNo
b3VsZCBiZSByZWxlYXNlZC4gVGhhdCdzIHdoeSBwYXRjaCAyLzIgbXVubWFwIGluIG5vdGlmaWVy
IHJlbW92ZQ0KZnVuY3Rpb24uIFRoZW4gdGhlIHJlc3RvcmUgZnVuY3Rpb24gZ2V0IG5vdGhpbmcg
dG8gcmVzdG9yZSwgbWF5YmUgSQ0Kc2hvdWxkbid0IHJldmVyc2UgcGF0Y2ggb3JkZXIuDQoNCj4g
DQo+ID4gPiANCj4gPiA+IA0KPiA+ID4gPiBAQCAtMTUzOCw3ICsxNTIyLDYgQEAgc3RhdGljIGlu
dCB2aG9zdF91c2VyX3NsYXZlX2hhbmRsZV92cmluZ19ob3N0X25vdGlmaWVyKHN0cnVjdCB2aG9z
dF9kZXYgKmRldiwNCj4gPiA+ID4gICAgICB9DQo+ID4gPiA+ICANCj4gPiA+ID4gICAgICBuLT5h
ZGRyID0gYWRkcjsNCj4gPiA+ID4gLSAgICBuLT5zZXQgPSB0cnVlOw0KPiA+ID4gPiAgDQo+ID4g
PiA+ICAgICAgcmV0dXJuIDA7DQo+ID4gPiA+ICB9DQo+ID4gPiA+IGRpZmYgLS1naXQgYS9pbmNs
dWRlL2h3L3ZpcnRpby92aG9zdC11c2VyLmggYi9pbmNsdWRlL2h3L3ZpcnRpby92aG9zdC11c2Vy
LmgNCj4gPiA+ID4gaW5kZXggYTlhYmNhMzI4OC4uZjYwMTJiMjA3OCAxMDA2NDQNCj4gPiA+ID4g
LS0tIGEvaW5jbHVkZS9ody92aXJ0aW8vdmhvc3QtdXNlci5oDQo+ID4gPiA+ICsrKyBiL2luY2x1
ZGUvaHcvdmlydGlvL3Zob3N0LXVzZXIuaA0KPiA+ID4gPiBAQCAtMTQsNyArMTQsNiBAQA0KPiA+
ID4gPiAgdHlwZWRlZiBzdHJ1Y3QgVmhvc3RVc2VySG9zdE5vdGlmaWVyIHsNCj4gPiA+ID4gICAg
ICBNZW1vcnlSZWdpb24gbXI7DQo+ID4gPiA+ICAgICAgdm9pZCAqYWRkcjsNCj4gPiA+ID4gLSAg
ICBib29sIHNldDsNCj4gPiA+ID4gIH0gVmhvc3RVc2VySG9zdE5vdGlmaWVyOw0KPiA+ID4gPiAg
DQo+ID4gPiA+ICB0eXBlZGVmIHN0cnVjdCBWaG9zdFVzZXJTdGF0ZSB7DQo+ID4gPiA+IC0tIA0K
PiA+ID4gPiAyLjMzLjANCj4gPiA+IA0KPiA+IA0KPiANCg0K

