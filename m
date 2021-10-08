Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A7D426594
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 10:04:55 +0200 (CEST)
Received: from localhost ([::1]:48370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYksA-0008Lq-6L
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 04:04:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuemingl@nvidia.com>)
 id 1mYkna-0004mh-59; Fri, 08 Oct 2021 04:00:10 -0400
Received: from mail-mw2nam12on2082.outbound.protection.outlook.com
 ([40.107.244.82]:38242 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuemingl@nvidia.com>)
 id 1mYknX-0001sX-No; Fri, 08 Oct 2021 04:00:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CgKunvXo6xF7pmu0I0o00WDLpiQTTEmviSGYSx88BhHnoPmiKJ2LYpLYPpcysNXoG2t4HvCw1fTNN+J6V+D0dNJ/vR1R3pyqB/+CUoia7K1mMDvDRueRax5SeP4llytg/eNbzLxz0f92gbdtVwZTpO9qiy+Eh5h2PjdZpPkQh1Y9OU77hngncrXLtOU1aeLX4jRp/EbTZ7BM5l1AyTeco74wPffZF00STl69YHtE5FKNy5Q+UFsArwKqE8ENIyv8umd3TnU79NYxXfp6oX+mDpqiMRYjsAfVM8rH0LCe2QVkewiFHL451CKHJmE4xggDTWgjl1vNUL+BmOhOxIMbgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2pTJGuB9PLAgsFAPFXv71C7ocgTOJ/ZxtJ1wxfAtmgs=;
 b=WO/ivO62/ZPlILJfexS7Yw1bANwB4qckHUrKCiQHAHB9P9z7rAMAEPeURnlGkL4EPjAjeIqGUFbKHMHeTWZWcOu3Py88XKcxaa6fKG1JzT4b6tdPZA/FL2hs7c9mexL4bRt7/z51gVMNvZesSPsoRwto1DivF/Mv/g5/Tv7B9oIOCbqZu7OdCWItxr4PoeZmRZUl2bJn1Rbxq3dmrm09cHZCTDA7t5dYC4OIW51HOEP2V6oGpkflzwDVlI1opOMgMRdvN0ehqWPC/tJFt0ty/1KpXo+JJIXUjjR9W9gVxmIOhhgztxoMATK1pI/y0SLBgVOGF85UWYf84GmLoCJTdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2pTJGuB9PLAgsFAPFXv71C7ocgTOJ/ZxtJ1wxfAtmgs=;
 b=QCgj6EQazGgQNU1QfZkWtE+ttNUgN51qeVbVP+ULWIwhQq1Qnt0awwK49l9YXFBsyaicaaRt5YkRsEj7ObiqoU91hPbWYXYc1lLQ5K5TXKkE1jxoVSylfGmN9sMyi+DS2H8env3sIuM3i0MfyIm8qbH2otSE1s8WbG2r5rOEfW5YvCkM/LC82Pv+bOBZzSbhp1H9cvmKyDrF2CnYzLvA41B1lxJ+uEkjrFc9kLD+dHtff31lf+XfEMwTz+pSOxt8CbRz7dRl0FgxsJR+9N34BBvCgu4OaPnjWQR5X4a8or4tDO5vmBkvq8LCHiAezsxhz9mW+Pi8bI5ii0aGrpO2KA==
Received: from DM4PR12MB5373.namprd12.prod.outlook.com (2603:10b6:5:39a::17)
 by DM4PR12MB5120.namprd12.prod.outlook.com (2603:10b6:5:393::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.22; Fri, 8 Oct
 2021 08:00:04 +0000
Received: from DM4PR12MB5373.namprd12.prod.outlook.com
 ([fe80::584f:672a:653f:fe25]) by DM4PR12MB5373.namprd12.prod.outlook.com
 ([fe80::584f:672a:653f:fe25%5]) with mapi id 15.20.4587.022; Fri, 8 Oct 2021
 08:00:04 +0000
From: "Xueming(Steven) Li" <xuemingl@nvidia.com>
To: "mst@redhat.com" <mst@redhat.com>
CC: "zhangyuwei.9149@bytedance.com" <zhangyuwei.9149@bytedance.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-stable@nongnu.org"
 <qemu-stable@nongnu.org>, "tiwei.bie@intel.com" <tiwei.bie@intel.com>
Subject: Re: [PATCH v2 1/2] vhost-user: fix VirtQ notifier cleanup
Thread-Topic: [PATCH v2 1/2] vhost-user: fix VirtQ notifier cleanup
Thread-Index: AQHXq79JJgNI5tCUm0WYLnc8wobQW6vEll0AgARHHgA=
Date: Fri, 8 Oct 2021 08:00:03 +0000
Message-ID: <90f5dc9ab8cbb1c70ede5e5a53d67f29816f9cb1.camel@nvidia.com>
References: <20210912162014.106704-1-xuemingl@nvidia.com>
 <20210917122616.6067-1-xuemingl@nvidia.com>
 <20210917122616.6067-2-xuemingl@nvidia.com>
 <20211005103916-mutt-send-email-mst@kernel.org>
In-Reply-To: <20211005103916-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d07c9395-c16f-4b03-cf0d-08d98a31a2f2
x-ms-traffictypediagnostic: DM4PR12MB5120:
x-microsoft-antispam-prvs: <DM4PR12MB5120505AA277A41CFC2C7694A1B29@DM4PR12MB5120.namprd12.prod.outlook.com>
x-ms-exchange-transport-forked: True
x-ms-oob-tlc-oobclassifiers: OLM:972;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QKG2OQr/bpT2UlOPFUDi9hZWAHblRq4C/jDELkyeIliyeX/9+fwePF3vjhwHmVF2zz4AnZhl/ErJa4vRV6+eNo7qWnQVuBzW04oe/pooHoh7iKdl4FVbjXDisJMlQ4EJf4jCFHTj9XVVNyCM4D2gwddTvdOTmRk4ZQu3LPdL2MWYAwAJZ6yHXGa+LaXzac3dg/RC+VHunXQIlmVy1DrWEcqWfhZUpJRM9uCXcYpJM4jf6ZyEOrLNCZxdQ64Pf7FOMvYWF0SF4GBXarDHit7c29cpFyh7iBOuk/02AHVK/eXnLqWv/1+c1GWd6DZl08Obf5CzkgPdobvcraeEwdDAaW8YlULDxsSG8SvMOf9+abd/uDoqc7ghRQ9XI0A1VcDoXGTDwpgqSNCtmSqlyHTQoRgmAcO44viXwxyvSfm6nnwT+/ynNLS6cIc3bLPDmiivWQMr0T599DSk3Z7NX3nG50AdvsdrYhHEkTsUaa0KhiLYXqlvtEWfo09jPA1VOjYr6ShhoPHjwp458ahFuFKG73bdCQBYYbD0YVM3FW1rDzMIKafeF7NpUsWqRp61vgtpmO6MDquDJ8zGLs9UAvSpMVdueHn6MCIa/5Qxn+yNKuR0qNZkvAOVCw0Qjx8fyqRImR7IcSVzJo8/puaXBGHbDgvNE6KmJ8arsBODAJq4dtRraFjTO81fCOee3gFYedC8aOTnIwg7OTyUnE2bKY3AlQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5373.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6486002)(8936002)(38070700005)(2906002)(186003)(508600001)(26005)(86362001)(71200400001)(36756003)(8676002)(6512007)(6506007)(4326008)(54906003)(6916009)(64756008)(122000001)(66476007)(316002)(66446008)(2616005)(66946007)(83380400001)(66556008)(38100700002)(5660300002)(91956017)(76116006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OFR6N1lLNTZoOStVQjU1cHV5UEd1K2s1bmlYeTFSNGRxWWk4dGVwalVhSXNz?=
 =?utf-8?B?VnYyMlJjSHRjOGo3cFdLbk10M2d0WjYwYmtENER4L2JsSGljSkY2Mmovanh3?=
 =?utf-8?B?a2ZIT2Z6bE5QTTg2aW9hN2UxZ2sybVZMeVJSSnpqcCtaMFBoRjFleFYzL3VS?=
 =?utf-8?B?QzI4UDg4WXk3Q2VhQmdwSE1iU1NMaWlyQlJXQzhwTDdIdmxTUUc0d1JtSDc4?=
 =?utf-8?B?UHEvbXJCY0NrQkpPVWE4cjB3UzlrakMwRVUwbC84RE1LSjlZYmNjMHNWd0hK?=
 =?utf-8?B?cFQ0SzNLVmlaSWFielJrZDdJVGxZMWdrSEw0Z202TW00cnVCMitzeDFaaTJG?=
 =?utf-8?B?aGZPdlA2SEo0czJMZXpMYVpIaEc0UE1XbDRPckdDZ1ErU20xL2R0akVWcERN?=
 =?utf-8?B?Z0h4Znowck9jam1SRkNKcG15WnQvU2hLLzEwMzhTQms0cm1tVFZGUGl1aVAy?=
 =?utf-8?B?dndScWd4NGFRYzk2NVNMeG52eDg3M1QxRDRaRUx6RWNBUXlMVEF6VVE4R1ZV?=
 =?utf-8?B?S2lrTTZXd0pwM3RTaUpPVVRqYWtkQ2ZQSCtvVk5JL3QxM2JvVUQ1d3BuRzgz?=
 =?utf-8?B?RmRjclJIL0hhSFZaTHJFUWNRQVN3bU52TmphYWpiM1VBaGtVZHJuL0NKOWZE?=
 =?utf-8?B?VE40V1RZWitTT1JUZGsxdzBqdzdFV0Z2WHZNZTVWRjYvaGFsWklRVmpWbHox?=
 =?utf-8?B?aGlhZFBGa2NnL2k2V0dyN2Z2U2RBYXdFc0wzclFNNU9uUTcydFBhdFpaMFg0?=
 =?utf-8?B?Y1VwQ2RwU3Judzk2Wmk3MVJCUk84QkMzV3V1MjVOZmxKMmt6V2dTRFMyTWhW?=
 =?utf-8?B?YmRCbVFxWVFQZXhUTnJnclZvbTBBQTdaeFQrL1lWSTRMTWh2RjQwR1RuT1Rz?=
 =?utf-8?B?VmFLVnhtQU9HRWJ2YldRNW1hazlmU2xlYkREOE51aDJwQ2JKUFNyeEdVSUZU?=
 =?utf-8?B?RkJnZGpySUxENHZRMmhIMlEzWmJTTEN2bXdIK3AyMWVDVlpMM3dlRFYvNGlB?=
 =?utf-8?B?ZjFhV1BETlM4UzJjMWdqUi9iMFRnYVhZSll3WmFtQTV3ZGY2Y2VIOFhJaWtp?=
 =?utf-8?B?aUVFMFk3RTRuZ0lPck0wd0pVNUYrVUlKSVp2MXBjM2pFclQ3U0tpdkU3am9B?=
 =?utf-8?B?SVVhUzJUb1FyNUpwNW5XOEtPTlh0UnFCazk1Q3BqNGd5UU1hNElYOG9xYlpS?=
 =?utf-8?B?R0h1VmR5aHV2NVBQWXg5ZVpWQzROa3M0d21VaGVEa3VwTGkxcEJyeFZLZ1Nn?=
 =?utf-8?B?dlVzRERKbnI1N1pWYTVJa0o1QzZyQWdaVFN4ZGh2TkRpV1Q4SEpkc016OE5G?=
 =?utf-8?B?RURFRjQvMGRybFRpbHJLUjUvQnFHcXEyZ0NCY0t4MHcxaEVnMXJ5OEhkTG9Y?=
 =?utf-8?B?RlZUWHJ5ek9LbGpWMkRTRzF3NzB5VFN6djBLaTZXT01KTzN6VHUvenpZb09k?=
 =?utf-8?B?S1RNMk9sTk9kNmRKenBZUkg2ZXZCR25uWnNsNzFHdER1YTI3aGZUcUt0eE1S?=
 =?utf-8?B?RU43cHdzY2d1dm14MW04ZUFwZGMyOUwvYXB3Vzd1ZjVHUkF5UXIyQXphQ0Ev?=
 =?utf-8?B?SzljZ1lKc2tYalVnUmVLMnRpWTBUb0dQdWlZS2dZZ3U2REpKUWV1MDY1cG5r?=
 =?utf-8?B?R1cxNnB5eGVNcmo5aTVVSGlRRnNNTmtaOTNsZ05iVVRPRjUxNElzWEk0eWNE?=
 =?utf-8?B?NlZTc1NJMXNZU0JmVkRoQmgwenBqQ2p0NDJMcVRwMDlUOHh3WjYzRER3dDJ2?=
 =?utf-8?B?Z1JaOUZMeis3YnBjeDdQY3U5by8vaXQyMmx6SDNsZlo5UjA2bkg4MXkvaGpU?=
 =?utf-8?B?bUZLVFJUeUgvdkgzVWZPUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5C8C261CCF5EF44AAFEF263581850E99@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5373.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d07c9395-c16f-4b03-cf0d-08d98a31a2f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2021 08:00:04.0402 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wtm74YCjBxGHpQXqY3EOW8vlIiRSF+V/voaM/VBRVWFBc7fRNm5tP3wJc65z6LSSy02BIgwTCLfesJyRSMhy7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5120
Received-SPF: softfail client-ip=40.107.244.82;
 envelope-from=xuemingl@nvidia.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

T24gVHVlLCAyMDIxLTEwLTA1IGF0IDEwOjQwIC0wNDAwLCBNaWNoYWVsIFMuIFRzaXJraW4gd3Jv
dGU6DQo+IE9uIEZyaSwgU2VwIDE3LCAyMDIxIGF0IDA4OjI2OjE1UE0gKzA4MDAsIFh1ZW1pbmcg
TGkgd3JvdGU6DQo+ID4gV2hlbiB2aG9zdC11c2VyIGRldmljZSBzdG9wIGFuZCB1bm1tYXAgbm90
aWZpZXIgYWRkcmVzcywgdkNQVSB0aHJlYWQNCj4gPiB0aGF0IHdyaXRpbmcgdGhlIG5vdGlmaWVy
IHZpYSBvbGQgZmxhdHZpZXcgZmFpbGVkIHdpdGggYWNjZXNzaW5nIGludmFsaWQNCj4gPiBhZGRy
ZXNzLg0KPiA+IA0KPiA+IFRvIGF2b2lkIHRoaXMgY29uY3VycmVudCBpc3N1ZSwgd2FpdCBtZW1v
cnkgZmxhdHZpZXcgdXBkYXRlIGJ5IGRyYWluaW5nDQo+ID4gcmN1IGNhbGxiYWNrcyBiZWZvcmUg
dW5tYXBpbmcgbm90aWZpZXJzLg0KPiA+IA0KPiA+IEZpeGVzOiA0NDg2NjUyMWJkNmUgKCJ2aG9z
dC11c2VyOiBzdXBwb3J0IHJlZ2lzdGVyaW5nIGV4dGVybmFsIGhvc3Qgbm90aWZpZXJzIikNCj4g
PiBDYzogdGl3ZWkuYmllQGludGVsLmNvbQ0KPiA+IENjOiBxZW11LXN0YWJsZUBub25nbnUub3Jn
DQo+ID4gQ2M6IFl1d2VpIFpoYW5nIDx6aGFuZ3l1d2VpLjkxNDlAYnl0ZWRhbmNlLmNvbT4NCj4g
PiBTaWduZWQtb2ZmLWJ5OiBYdWVtaW5nIExpIDx4dWVtaW5nbEBudmlkaWEuY29tPg0KPiANCj4g
DQo+IFBscyBwb3N0IHYyIGFzIGEgbmV3IHRocmVhZCwgd2l0aCBjaGFuZ2Vsb2cgaW4gdGhlIGNv
dmVyIGxldHRlci4NCg0KVGhhbmtzLCB2MyBwb3N0ZWQgd2l0aCBiZWxvdyBjb2Rpbmcgc3R5bGUg
YW5kIGNvbW1lbnQgZml4ZXMuDQoNCj4gDQo+ID4gLS0tDQo+ID4gIGh3L3ZpcnRpby92aG9zdC11
c2VyLmMgfCAyMCArKysrKysrKysrKysrLS0tLS0tLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTMg
aW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvaHcv
dmlydGlvL3Zob3N0LXVzZXIuYyBiL2h3L3ZpcnRpby92aG9zdC11c2VyLmMNCj4gPiBpbmRleCAy
Yzg1NTYyMzdmLi4wODU4MWU2NzExIDEwMDY0NA0KPiA+IC0tLSBhL2h3L3ZpcnRpby92aG9zdC11
c2VyLmMNCj4gPiArKysgYi9ody92aXJ0aW8vdmhvc3QtdXNlci5jDQo+ID4gQEAgLTExNjUsNiAr
MTE2NSwxMSBAQCBzdGF0aWMgdm9pZCB2aG9zdF91c2VyX2hvc3Rfbm90aWZpZXJfcmVtb3ZlKHN0
cnVjdCB2aG9zdF9kZXYgKmRldiwNCj4gPiAgDQo+ID4gICAgICBpZiAobi0+YWRkciAmJiBuLT5z
ZXQpIHsNCj4gPiAgICAgICAgICB2aXJ0aW9fcXVldWVfc2V0X2hvc3Rfbm90aWZpZXJfbXIodmRl
diwgcXVldWVfaWR4LCAmbi0+bXIsIGZhbHNlKTsNCj4gPiArICAgICAgICBpZiAoIXFlbXVfaW5f
dmNwdV90aHJlYWQoKSkNCj4gPiArICAgICAgICAgICAgLyogV2FpdCB2Q1BVIHRocmVhZHMgYWNj
ZXNzaW5nIG5vdGlmaWVyIHZpYSBvbGQgZmxhdHZpZXcuICovDQo+IA0KPiBXYWl0IFZNIC0gV2Fp
dCBmb3IgVk0NCj4gDQo+ID4gKyAgICAgICAgICAgIGRyYWluX2NhbGxfcmN1KCk7DQo+IA0KPiBv
a2F5Lg0KPiBidXQgdGhpcyBoYXMgYSBjb2Rpbmcgc3R5bGUgdmlvbGF0aW9uOg0KPiBzaG91bGQg
dXNlIHt9IGluIGlmLg0KPiANCj4gDQo+ID4gKyAgICAgICAgbXVubWFwKG4tPmFkZHIsIHFlbXVf
cmVhbF9ob3N0X3BhZ2Vfc2l6ZSk7DQo+ID4gKyAgICAgICAgbi0+YWRkciA9IE5VTEw7DQo+ID4g
ICAgICAgICAgbi0+c2V0ID0gZmFsc2U7DQo+ID4gICAgICB9DQo+ID4gIH0NCj4gPiBAQCAtMTUw
MiwxMiArMTUwNyw3IEBAIHN0YXRpYyBpbnQgdmhvc3RfdXNlcl9zbGF2ZV9oYW5kbGVfdnJpbmdf
aG9zdF9ub3RpZmllcihzdHJ1Y3Qgdmhvc3RfZGV2ICpkZXYsDQo+ID4gIA0KPiA+ICAgICAgbiA9
ICZ1c2VyLT5ub3RpZmllcltxdWV1ZV9pZHhdOw0KPiA+ICANCj4gPiAtICAgIGlmIChuLT5hZGRy
KSB7DQo+ID4gLSAgICAgICAgdmlydGlvX3F1ZXVlX3NldF9ob3N0X25vdGlmaWVyX21yKHZkZXYs
IHF1ZXVlX2lkeCwgJm4tPm1yLCBmYWxzZSk7DQo+ID4gLSAgICAgICAgb2JqZWN0X3VucGFyZW50
KE9CSkVDVCgmbi0+bXIpKTsNCj4gPiAtICAgICAgICBtdW5tYXAobi0+YWRkciwgcGFnZV9zaXpl
KTsNCj4gPiAtICAgICAgICBuLT5hZGRyID0gTlVMTDsNCj4gPiAtICAgIH0NCj4gPiArICAgIHZo
b3N0X3VzZXJfaG9zdF9ub3RpZmllcl9yZW1vdmUoZGV2LCBxdWV1ZV9pZHgpOw0KPiA+ICANCj4g
PiAgICAgIGlmIChhcmVhLT51NjQgJiBWSE9TVF9VU0VSX1ZSSU5HX05PRkRfTUFTSykgew0KPiA+
ICAgICAgICAgIHJldHVybiAwOw0KPiA+IEBAIC0yNDg0LDExICsyNDg0LDE3IEBAIHZvaWQgdmhv
c3RfdXNlcl9jbGVhbnVwKFZob3N0VXNlclN0YXRlICp1c2VyKQ0KPiA+ICAgICAgZm9yIChpID0g
MDsgaSA8IFZJUlRJT19RVUVVRV9NQVg7IGkrKykgew0KPiA+ICAgICAgICAgIGlmICh1c2VyLT5u
b3RpZmllcltpXS5hZGRyKSB7DQo+ID4gICAgICAgICAgICAgIG9iamVjdF91bnBhcmVudChPQkpF
Q1QoJnVzZXItPm5vdGlmaWVyW2ldLm1yKSk7DQo+ID4gKyAgICAgICAgfQ0KPiA+ICsgICAgfQ0K
PiA+ICsgICAgbWVtb3J5X3JlZ2lvbl90cmFuc2FjdGlvbl9jb21taXQoKTsNCj4gPiArICAgIC8q
IFdhaXQgVk0gdGhyZWFkcyBhY2Nlc3Npbmcgb2xkIGZsYXR2aWV3IHdoaWNoIGNvbnRhaW5zIG5v
dGlmaWVyLiAqLw0KPiANCj4gV2FpdCBWTSAtIFdhaXQgZm9yIFZNDQo+IA0KPiA+ICsgICAgZHJh
aW5fY2FsbF9yY3UoKTsNCj4gPiArICAgIGZvciAoaSA9IDA7IGkgPCBWSVJUSU9fUVVFVUVfTUFY
OyBpKyspIHsNCj4gPiArICAgICAgICBpZiAodXNlci0+bm90aWZpZXJbaV0uYWRkcikgew0KPiA+
ICAgICAgICAgICAgICBtdW5tYXAodXNlci0+bm90aWZpZXJbaV0uYWRkciwgcWVtdV9yZWFsX2hv
c3RfcGFnZV9zaXplKTsNCj4gPiAgICAgICAgICAgICAgdXNlci0+bm90aWZpZXJbaV0uYWRkciA9
IE5VTEw7DQo+ID4gICAgICAgICAgfQ0KPiA+ICAgICAgfQ0KPiA+IC0gICAgbWVtb3J5X3JlZ2lv
bl90cmFuc2FjdGlvbl9jb21taXQoKTsNCj4gPiAgICAgIHVzZXItPmNociA9IE5VTEw7DQo+ID4g
IH0NCj4gPiAgDQo+ID4gLS0gDQo+ID4gMi4zMy4wDQo+IA0KDQo=

