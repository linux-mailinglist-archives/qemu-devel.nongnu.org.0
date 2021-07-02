Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE32A3B9CE7
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 09:27:01 +0200 (CEST)
Received: from localhost ([::1]:49472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzDZk-0001zN-Gf
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 03:27:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1lzDXs-0008GR-JZ
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 03:25:04 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.111.102]:55409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1lzDXn-000631-AU
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 03:25:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1625210695;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=crWpo3K0BM5BJS6gD5R2JNwl8JjilmYHokCeGUOOObg=;
 b=Qabh5pOU7CVqIY7972le5INfg8HAnZO3ymqKmb6JrGuwA6sQmVnymOLSLIaf23FX0r/wqP
 T+wyL5pcvCNVQrd9/ewwvx6wyzwSLxisE9zfdBgs0Az877z1WdM5Mb/O6LitVBYPCsPYT/
 D5QniwN3jqbr9mFWfZO9vZwCwsl/XV4=
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2050.outbound.protection.outlook.com [104.47.2.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-6-b9L2bCAhP36Y3EvD_yPuog-1;
 Fri, 02 Jul 2021 09:24:54 +0200
X-MC-Unique: b9L2bCAhP36Y3EvD_yPuog-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JYXMrv9NuM2u6FOw36i20Nr9co0ly/TMpGBmW/4gHHzS9J0bVdCN2Ji2Vp553osv8eWUH3yt8+fZdiBA7nGkMz7oS8+Dbm89aR/mD9JUMi29yEGFEcBwI1Jv8D+qMI//etMEMtR5Z2PB6fpgUxn/50+hBPn/Gy37inQ2xLfJQn93U2XCeHX/4DZRdBvaM0ZTsFQAc1q0qmjOIGIf4sauwLDZbCjcM74v3Cew3GdCFVpaPf1riTjXnZuZl3MSH0+Tl9EHANXgl9SLVEMPyCgEKp7hUuuhRy0JgOE7V8Ex/qX/5insR6ICj/WIxiWusO+4DJwrexo2cYs80IhJdgE/7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=crWpo3K0BM5BJS6gD5R2JNwl8JjilmYHokCeGUOOObg=;
 b=CFM5inS2oy9EQgcpRDKBNWnhV55wkbWFkXK82xR/K6eJEFMankWFbQQDzGaRbEq3lKKS0qNIK7GPIBPPZrq2WjD0iv2xcrqxJ/vzMCx5Z810yHpsXigR2mEmhV4LTezZq40Hu9/eqmPmSzfiOLxRqIxpTf5ArnSE8ZdT1VvlMEEFrbeb1rJwD13NMyJnLT5dTQkurfqpyHYD4/yuYRIhsJiKlym6pdgfv5iwTNDjbJYJTiyjJ43diMjtFxFJd8/ycH2vwR3Qm4nuFDPhoYjs5WXUhJhSu4NXmT4TzkL4Jkd1GnusxHEGvoxPbKP0UQWNxkY+ohbdAlQSICnpAo7BYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25) by VI1PR04MB7007.eurprd04.prod.outlook.com
 (2603:10a6:803:13e::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Fri, 2 Jul
 2021 07:24:52 +0000
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::4c1c:b538:59b8:30f]) by VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::4c1c:b538:59b8:30f%5]) with mapi id 15.20.4287.022; Fri, 2 Jul 2021
 07:24:52 +0000
From: Al Cho <ACho@suse.com>
To: "thuth@redhat.com" <thuth@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "qemu-s390x@nongnu.org" <qemu-s390x@nongnu.org>
CC: "david@redhat.com" <david@redhat.com>, Claudio Fontana
 <Claudio.Fontana@suse.com>, "cohuck@redhat.com" <cohuck@redhat.com>,
 =?utf-8?B?Sm9zw6kgUmljYXJkbyBaaXZpYW5p?= <jose.ziviani@suse.com>,
 "cfontana@suse.de" <cfontana@suse.de>
Subject: Re: [RFC v6 06/13] target/s390x: start moving TCG-only code to tcg/
Thread-Topic: [RFC v6 06/13] target/s390x: start moving TCG-only code to tcg/
Thread-Index: AQHXbPHgrgWeRi5xh0GKP577V6OUVKst9BKAgAFYuQA=
Date: Fri, 2 Jul 2021 07:24:52 +0000
Message-ID: <6ed3cdb12231f1683d908160b2b7dd2f847e891b.camel@suse.com>
References: <20210629141931.4489-1-acho@suse.com>
 <20210629141931.4489-7-acho@suse.com>
 <9595a82d-b4a2-8aa7-a733-939bba4e5f34@redhat.com>
In-Reply-To: <9595a82d-b4a2-8aa7-a733-939bba4e5f34@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.2 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=suse.com;
x-originating-ip: [1.169.23.205]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fb9aa00c-5904-47f8-c8ec-08d93d2a7bbe
x-ms-traffictypediagnostic: VI1PR04MB7007:
x-ld-processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB70074A5B1C5057E1F0BA6F78A01F9@VI1PR04MB7007.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: abci3Geh7c62OiS7oM62dOi1NhLnGGp15ucV8JkkM/FKHBCbTZiWJbWt6MYtPutLuHGaStlcIThcdFgvCW1djR2nfHMLMVYZhlX5gXNGem/BEUH4+r7BcWrLfeRAVBzksmgiBjhWAf1jP6zrAFkdrTdB7391zuCMbmlr9RidldC0Z+XT42b4rJEo18fhR9b9tbEk+aM3U5Wmlx5vZRWtOhJQm3/uFvKtYH40KZU48p5KGcRyw7E9A+eRv0uhA50pAOCYJRHVwL5hlsMX+mQlBnhs87MPfD2ABERHdUPzToqnwoLOb0SOzYT1kbGwZvzHhXvpcP+CbAR/eocrL1XJGmInUqrhKinvaQkPJK4C8Et4nPlsq4iBBMCFF3gtnbYrpX8p/2GzCNNftOsx1o/BCMsbEwxe+6+W97WdziyroWlzM+kNUL1Asme8nNa+3HnqPP9B0AZ0NFV4rk5XjdY6CAEYfCFfm3LBoNGdhCydcPdTiz2pFbyqVGgKUIFRj2D8rVPDtjE1IFhLINLncRb5inwvoAIKccecM4afQVgWThNhQJrzQ7LaGfLcaWVScrDPPcIESMpoqoO0tOkKXCSo3LJG2QFb1Quen6XytmhySUb3vILo41nNoKEO5EJgsUvQMZJxnJKX9/1etQj25i64yw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3744.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39850400004)(376002)(396003)(366004)(346002)(136003)(2616005)(110136005)(64756008)(66446008)(36756003)(26005)(478600001)(5660300002)(54906003)(186003)(66556008)(6512007)(66476007)(6486002)(8936002)(71200400001)(316002)(66946007)(2906002)(76116006)(83380400001)(6506007)(122000001)(4326008)(86362001)(91956017)(8676002)(38100700002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a28rc1daSFNPUTlYckJWaDVob3Z3bDBSbEZUNHhJS1Y0dXd6Q1QvRDZMTWhX?=
 =?utf-8?B?NUxFTHlnQUVxQXFEdjRodGMxbXI1bEpwNE1OQ2YzWnVEYm03Y3RHVlVlbURC?=
 =?utf-8?B?Vkt6ZmovdXdJWjBSKy9PU0hyc1JodTErRlMrQzEwc3A0eTFFTm1UTmhqMU1P?=
 =?utf-8?B?WmZLZitLcURmTS82VHVTejNTRnpUK1Q0UDlLV29iYWczNWFIVWJzek55dXdE?=
 =?utf-8?B?cVFodXdXeGkyeWRxemNrdnl5WDhwRnMzeDgxVFZNNlZ4eFo1UFQ2UVRLakNh?=
 =?utf-8?B?ZlVYR2Y0a290QnBQT3p1bS9wZGJMMGUrazJnN2h5L29HYTNSQmx0M29ldjVT?=
 =?utf-8?B?azRqZXRHV3Bhb0EraXhyWWNyd3FRVHhkM0piREdEblluOExiQlk2RkFIelJV?=
 =?utf-8?B?UVVZK3d0aGdCclp3MDE5TnhPWk42M1l1RWpZL0FPWkw4eWkzSklYSWJmSHJP?=
 =?utf-8?B?aWw2S0dXZHFDSWJlREh1NVNNQ3dhODRmRmNKMXVXbmF2WFF1My9RbHFkVzhh?=
 =?utf-8?B?TU01RVNwWmVhTG9neitvVEU0WDdwMDViOGdHdlNvQzUxa3F3Lysyc2RoUjk4?=
 =?utf-8?B?d0tzZk9LQXBoU2d6ekhMZ1FiYURJQW9mM2Yxamc5SDh2UGc0NjBnYWc1SlRG?=
 =?utf-8?B?dmUxRUJwSFNiVThNNDV5VDFNbnVSS1Z5TzRaOGovZmRtdG1wMjFhUTRnWGJr?=
 =?utf-8?B?SFE0N2ZnQUl5WHlvY0lDZ3RVMXFkUGdZZ1ZReTBoM29QUmplQXhpakNkMUVt?=
 =?utf-8?B?RzUzN25iYXZrN3dSYmZwdzYvK1IvUEpGR01VclQ3RFJoQTNrenE3bUtxeTF4?=
 =?utf-8?B?NFM0bWZOK2EzKytpZ2tyeEJFa2pVWE85dWFlVU1DekowZG9Ed3ZhWUQxSXFM?=
 =?utf-8?B?bHQ5dzNuWWlBSGRnUGxQNWlZcTJpWVpaMjlXMG5uY3RVUGx4Zys0V2lhS21s?=
 =?utf-8?B?Sll5dzNteWR6blRxWkFQVEt0SkJYTW1EazY0VGtKUFI0cnY3d3hkdUFpRjJa?=
 =?utf-8?B?RWlxaG9DMEh3cnZBa3R1Y3ZNejRCV2FTd2NqU1RwcW9qaHRPYTVNK2xUL05C?=
 =?utf-8?B?RUZGVFROS1p6NDVXcVVYMFY4NGd5Tmo3VWwwNkdDeDVBaDM4THFOVU1XMmVH?=
 =?utf-8?B?UHZJSXk1b1V3RXhjMzZ5cW52NzhoRWw1TmhQSFRicnZnWVZ1anZBdkVLWEpu?=
 =?utf-8?B?c0JYNU03RXpxTU9IRFdYR1RwMGMzYWkzdHl2RFdSTGtOeDFYL0prWnRJSWN5?=
 =?utf-8?B?MkpuRGhKWk1QN1FURE9KZkVDRnV5MHA0NUhucXBabGtVelQveE5Da0lSOTFs?=
 =?utf-8?B?TXUxZ2R1MDZZTStFVTZEK1F3TWVuRkFKdHZPZU4zR3R0MVhmdUZQZG85NHlJ?=
 =?utf-8?B?bWFBekQ3ZkpIOHYyMkp2UkxrcDBRRFFOOFZ3eUNCNE1SRXp6VWREUmpvWnFS?=
 =?utf-8?B?NEZQLyt3QXVkYnpJS1pWT0pUYjFneDJvQ1MrYkt4YVROeXdJNGk5RlBtTDZk?=
 =?utf-8?B?VGtaR252eXlwQTJvemhTdWtuZXJBRHpjNVhTM1RBdTBuazF5TkpLMWFhenNE?=
 =?utf-8?B?cFJxNHdOL3YwZHEyMDRuRUVDZXBtSG45K2p2aDZyZVl6MDArM3lsekRjSWdG?=
 =?utf-8?B?MGN5MmV0dGNKSm1XVTVSSDZnS04xRnJjeEpiaTVKcElOWjhkR1VyK3N5ckVU?=
 =?utf-8?B?VFA4VHE2NjJjalZETWNieFlpOUdndVFDaW9raU0xbkVwbEVnTTZ4MjNjQnRv?=
 =?utf-8?Q?y3DVyO+8mLCrTwZUg39d528JRlw0alXRe2TcgKK?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <852061FF49DABC48B168B265752E6291@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3744.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb9aa00c-5904-47f8-c8ec-08d93d2a7bbe
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2021 07:24:52.2248 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 56kEwvx6QSURKwDcEtnAZoO4/usdiey2CwwbRiUD2x0IrM5E/7wIGK26HKdKPOUy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7007
Received-SPF: pass client-ip=194.104.111.102; envelope-from=acho@suse.com;
 helo=de-smtp-delivery-102.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gVGh1LCAyMDIxLTA3LTAxIGF0IDEyOjUxICswMjAwLCBUaG9tYXMgSHV0aCB3cm90ZToNCj4g
T24gMjkvMDYvMjAyMSAxNi4xOSwgQ2hvLCBZdS1DaGVuIHdyb3RlOg0KPiA+IG1vdmUgZXZlcnl0
aGluZyByZWxhdGVkIHRvIHRyYW5zbGF0ZSwgYXMgd2VsbCBhcyBIRUxQRVIgY29kZSBpbiB0Y2cv
DQo+ID4gDQo+ID4gbW11X2hlbHBlci5jIHN0YXlzIHB1dCBmb3Igbm93LCBhcyBpdCBjb250YWlu
cyBib3RoIFRDRyBhbmQgS1ZNIGNvZGUuDQo+ID4gDQo+ID4gVGhlIGludGVybmFsLmggZmlsZSBp
cyByZW5hbWVkIHRvIHMzOTB4LWludGVybmFsLmgsIGJlY2F1c2Ugb2YgdGhlDQo+ID4gcmlzayBv
ZiBjb2xsaXNpb24gd2l0aCBvdGhlciBmaWxlcyB3aXRoIHRoZSBzYW1lIG5hbWUuDQo+IA0KPiBJ
TUhPIHRoZSByZW5hbWluZyBmcm9tIGludGVybmFsLmggdG8gczM5MHgtaW50ZXJuYWwuaCBzaG91
bGQgYmUgZG9uZSBpbg0KPiBhIA0KPiBzZXBhcmF0ZSBwYXRjaCwgc2luY2UgaXQncyBub3QgZGly
ZWN0bHkgcmVsYXRlZCB0byB0aGUgbW92ZW1lbnQgb2YgdGhlDQo+IG90aGVyIA0KPiBmaWxlcy4N
Cj4gDQoNCkluZGVlZCwgdGhpcyBwYXRjaCBzaG91bGQgbm90IGluY2x1ZGUgdGhpcy4gVGhlIHJl
bmFtaW5nIGZyb20NCmludGVybmFsLmggdG8gczM5MHgtaW50ZXJuYWwuaCB3b3VsZCBiZSBkb25l
IGluIGEgc2VwYXJhdGUgcGF0Y2guDQoNCg0KPiBbLi4uXQ0KPiA+IGRpZmYgLS1naXQgYS90YXJn
ZXQvczM5MHgvaW50ZXJuYWwuaCBiL3RhcmdldC9zMzkweC9zMzkweC0NCj4gPiBpbnRlcm5hbC5o
DQo+ID4gc2ltaWxhcml0eSBpbmRleCA5OCUNCj4gPiByZW5hbWUgZnJvbSB0YXJnZXQvczM5MHgv
aW50ZXJuYWwuaA0KPiA+IHJlbmFtZSB0byB0YXJnZXQvczM5MHgvczM5MHgtaW50ZXJuYWwuaA0K
PiA+IGluZGV4IDkyNTYyNzUzNzYuLjE3ZWRkNGQxM2IgMTAwNjQ0DQo+ID4gLS0tIGEvdGFyZ2V0
L3MzOTB4L2ludGVybmFsLmgNCj4gPiArKysgYi90YXJnZXQvczM5MHgvczM5MHgtaW50ZXJuYWwu
aA0KPiA+IEBAIC0yNDAsNiArMjQwLDEyIEBAIHVpbnQzMl90IGNhbGNfY2MoQ1BVUzM5MFhTdGF0
ZSAqZW52LCB1aW50MzJfdA0KPiA+IGNjX29wLCB1aW50NjRfdCBzcmMsIHVpbnQ2NF90IGRzdCwN
Cj4gPiDCoCAjaWZuZGVmIENPTkZJR19VU0VSX09OTFkNCj4gPiDCoCB1bnNpZ25lZCBpbnQgczM5
MF9jcHVfaGFsdChTMzkwQ1BVICpjcHUpOw0KPiA+IMKgIHZvaWQgczM5MF9jcHVfdW5oYWx0KFMz
OTBDUFUgKmNwdSk7DQo+ID4gK3ZvaWQgczM5MF9jcHVfaW5pdF9zeXNlbXUoT2JqZWN0ICpvYmop
Ow0KPiA+ICtib29sIHMzOTBfY3B1X3JlYWxpemVfc3lzZW11KERldmljZVN0YXRlICpkZXYsIEVy
cm9yICoqZXJycCk7DQo+ID4gK3ZvaWQgczM5MF9jcHVfZmluYWxpemUoT2JqZWN0ICpvYmopOw0K
PiA+ICt2b2lkIHMzOTBfY3B1X2NsYXNzX2luaXRfc3lzZW11KENQVUNsYXNzICpjYyk7DQo+ID4g
K3ZvaWQgczM5MF9jcHVfbWFjaGluZV9yZXNldF9jYih2b2lkICpvcGFxdWUpOw0KPiANCj4gVGhp
cyBodW5rIHJhdGhlciBiZWxvbmdzIGludG8gdGhlIG5leHQgcGF0Y2ggaW5zdGVhZC4NCj4gDQoN
ClRydWUsIHRoaXMgcGFydCBpbiAwNyB3b3VsZCBiZSBiZXR0ZXIsIEkgd2lsbCBtb3ZlIHRoaXMg
dG8gMDcuDQoNClRoYW5rcywgQUwNCg==


