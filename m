Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D775D6066B6
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 19:07:47 +0200 (CEST)
Received: from localhost ([::1]:50170 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olZ0y-0006Al-Ji
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 13:07:30 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olYpD-0007bz-9s
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 12:55:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yishaih@nvidia.com>)
 id 1olWyS-0003cX-Et; Thu, 20 Oct 2022 10:56:52 -0400
Received: from mail-mw2nam12on2041.outbound.protection.outlook.com
 ([40.107.244.41]:1457 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yishaih@nvidia.com>)
 id 1olWyQ-0007vf-95; Thu, 20 Oct 2022 10:56:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RPA1nhfbhDDqw63BiSjfKdxd+nmv27uvN8vXKQF8wFgBZ2+9vzQGjO+CP5/5RtRyIiEtm8VDqAnzOo8Ku2mwYt4mrxmydQ8Xwhd5T5oHIbyQx4M4iMohm4RxiZrK6FVeVoB9D8o+PglnO0OVs+wxlyTlxFibrm0q9YAB8rjP6DF8JKQPY/KrZ0fN+YrfY5/7IbCjqyDCK6w4v8NERqM1s19HmT6sseauH+orc3PChr4ER71u4pcWt/tHVqx6Hys+FxWaeECZBoTryU1TaC5ZYPwfZV88Es0bhxR6dQSy4580Neqd6xuDHkZdv9xYM9iWEBgv4IollxbWle6szC9opw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f7Bsg19dNylAbPVrilIqDajGQBRWRI4aJOdIcS8Q0jc=;
 b=PuoCZG49AqH6jGZbBpHgkvaGvWRVCUiTD8dn8RLTnf3yb2uTTH3KAXnQIdAq0DylfzrYyGoCEOQuWbw++EqJGhPGK9f/vesS5zJt+9huwoYnqqQUXbgbsNoeL7baxEe0zFg4zvcLYkRxeuPDAfqmYn/ZOfPRJrp2KNw1seTKRnHQa52ReXZQqyFiFGe84xcYodoqb6/UrD2VsQz/8qDfkzJr92Nu98hsPOcl59hEnMuy+5WgohS11YyTwy4aC9SPDrymV0yIVSUC7ZO096wAZu6jam/KcCok0S0L4IAmTlVhCnJ3ob4ijl8Y+XbvrKmT1KLdYk6EYv3XtgDaPIruMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f7Bsg19dNylAbPVrilIqDajGQBRWRI4aJOdIcS8Q0jc=;
 b=Mns1uKQTGDsSxJG2LI/wziK78DOmLkV7wCnbkE6toQJFZhJSOjhtUAd2RhefTtwxKlDT1+QJtDiJD/3pqNbadyP1xlcDzfnTadQ0kQmFGPV8GJ/2R4V+NPBjVJy5bkbTapbHWNBP9gTjqyJb6jbWjaQnoPkspBrCyUnGo2GBMWkCS3irAcSAfVfrQsGeJIQFdonfK5Y4qJ7ynLmtohwfAEallZPHxd7jD0OO0LjGyUro1jcaW3knIYQsug6iHcHxMNY5yhx0EwbGdKD3onPvHLZNVenSto4zC3P0qVVtqBnaJlKPBWiQuPlO0fqMrFYFANZaRug1OOtnRX8I+mM1Ig==
Received: from DM8PR12MB5478.namprd12.prod.outlook.com (2603:10b6:8:29::12) by
 PH7PR12MB7018.namprd12.prod.outlook.com (2603:10b6:510:1b8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Thu, 20 Oct
 2022 14:56:36 +0000
Received: from DM8PR12MB5478.namprd12.prod.outlook.com
 ([fe80::69ed:cde8:b5d9:a994]) by DM8PR12MB5478.namprd12.prod.outlook.com
 ([fe80::69ed:cde8:b5d9:a994%6]) with mapi id 15.20.5723.035; Thu, 20 Oct 2022
 14:56:36 +0000
From: Yishai Hadas <yishaih@nvidia.com>
To: Juan Quintela <quintela@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: Alex Williamson <alex.williamson@redhat.com>, Eric Blake
 <eblake@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng
 <fam@euphon.net>, "qemu-s390x@nongnu.org" <qemu-s390x@nongnu.org>, Cornelia
 Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>, Vladimir
 Sementsov-Ogievskiy <vsementsov@yandex-team.ru>, Laurent Vivier
 <lvivier@redhat.com>, John Snow <jsnow@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>, Eric Farman
 <farman@linux.ibm.com>, Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>, Maor
 Gottlieb <maorg@nvidia.com>, Avihai Horon <avihaih@nvidia.com>
Subject: RE: [RFC 0/7] migration patches for VFIO
Thread-Topic: [RFC 0/7] migration patches for VFIO
Thread-Index: AQHY1taUg3ebQh4fFECLMOyQt4dtOa4XdfPA
Date: Thu, 20 Oct 2022 14:56:36 +0000
Message-ID: <DM8PR12MB5478AFD67295D0C04070F7EFC32A9@DM8PR12MB5478.namprd12.prod.outlook.com>
References: <20221003031600.20084-1-quintela@redhat.com>
In-Reply-To: <20221003031600.20084-1-quintela@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR12MB5478:EE_|PH7PR12MB7018:EE_
x-ms-office365-filtering-correlation-id: 2c348a47-3a41-4bc2-7166-08dab2ab495d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5hqoEj1OTLc+0es8nt08Z/A+p5LpwykaUc8KA/BkQMp5ZJuRFT0J1fkjzBwQoRW3V64tYgSJyEYKUBpbJMVNKYNeobAIr8j4SRgA8qsaTDbCbFuVQLaBmoGRj01odP2bXgA4GwYS6LIgN32eldgEQCBDCKzBHxn+Aa015PHSdx0Skpl0ZpKLQzLjQM1RfZZ94dTAWTem/iGqFkcp73hukDfhp79EFnRmWsKZffUAi5Gaw/GPPE8TfXyAHVQ0DBDbAeW1Ks2NTdpCFTd4RCquvyo7qoGQHfD8jdn5YYNVVdwX95NzqI1VGCg5Uanm17vwTPKFHZTVoSoPoSdfuQ0dPgyf+ybu4zvcgh+P8kUIIsvx/4xQTK21XfyKsc0Cva1s/oGmiXNfKVFE2mwFDM6ZqawJi0vl9aH4P2tXtiUuhI/JQLbl2NJV9x6fdDYATasbFL+FcLNwky65Skm7Zh7ffTE8M96hR+C9SuleGphUX2yfT3A2931TzE2Qc9eSjmUs0A/zH29kh9F53qGTC2NPpEF8jyxterMRdbwamhgK52HVGh4ekrIb3Emg8Kya3YMhgIFEoXwaxBsqrJXxfcKjz9/1g1BVg1inwhqJxQtwRWsn2JtfRH53M0WRiB6l4RnVUez/k+vixhFLZNiVcbUxlrXFdFXPAwE0V/9/puD/kebOxpFtkxZ/KYs6hBvsWXflvptuz8RlBxAYI1n7oj1Fw1Ef8uwhhpfazU+FZI4FEfGgxbnfnzweYUIMQTinnb8javrbNaTzTbOxri22zKUJrirZXvSJvGdNnUfIM9GaJ2w=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR12MB5478.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(396003)(346002)(366004)(136003)(39860400002)(451199015)(83380400001)(186003)(33656002)(2906002)(26005)(6506007)(86362001)(8676002)(66446008)(64756008)(4326008)(41300700001)(53546011)(7696005)(76116006)(38070700005)(5660300002)(66556008)(316002)(38100700002)(54906003)(66476007)(966005)(122000001)(8936002)(110136005)(52536014)(9686003)(7416002)(71200400001)(107886003)(478600001)(66946007)(55016003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TXpOMEdxclhGczh6OFVUVmpwSVFkQnlQVGFLZG1GbllNWXBScnpHS0VWLzNn?=
 =?utf-8?B?WnFidWZDMWtOZkU0T1ZaUVVHQi93WTBvdVVzajlDdFhhU29Kb3M0M05oNkRt?=
 =?utf-8?B?VERlYWFZNVEremVwMlp4VXh3NEZTdTNwUHBkNENxaEFuVEVNWmRpQVpjMjhj?=
 =?utf-8?B?cGh1WDlVb2dJTE81TjNvbGxGRHdZYjZ4d2M2SHlzWk9ib0FMSkZmai9VZGtD?=
 =?utf-8?B?cUJOZXRBN3ZSS0UwdjVYVFgvMVRWK3YyZWtVSGsvb3NxcjVMWnhid050TzhE?=
 =?utf-8?B?ME85Y0pSZlJrOWhnbTFJeC8wNWJ2ZzRWaHcxakFQQVlKckpuZGdCRGFwNDBF?=
 =?utf-8?B?SzJ5SWlCZWhPRU81bXFnL0tBWGF4d21JSHBCRU5ueXhuQm9RcXg1NkxnaWVm?=
 =?utf-8?B?ZVloQTh1cEdqUlFYZm55a0N4YXY3MG9qQURTTHg0RXlVamIwS29hcGJDR0tv?=
 =?utf-8?B?dlhwYTFMZ1FvcWdVRVJZSEgvcStXcmh1QlNaMVA3V0Y2bCtyZGdYanEzaHlV?=
 =?utf-8?B?aUg0L2RoQXdBLzdSM3JoMWtrQWdCeHI3RWNOeEg2NnI4MVN0MnZ4cmhQM2pr?=
 =?utf-8?B?aE5na2NRdi8zWnVRdVVnMEs0SDZTRTlPYmdIYTdhVjJQVVhqT24yRi8rNjRJ?=
 =?utf-8?B?TVNPYTRSY01hbUk2KzZUeHBYMXpsOERwZ2VQbERSc3RCSURnQThIbjJkVndF?=
 =?utf-8?B?a3dVRkZQbml2QjJsNFdzbFEvNXZUT29TbU10clU1clROYUxqQVhISnRFZmhi?=
 =?utf-8?B?eGFkYkpzYnJzanlTZ1BMMDdFbW5aNmYxSGsxTFpkUkF4NFJ4aXRTdGRSRWdj?=
 =?utf-8?B?MU1nTzk3THYrQmZMRkJIS0NVTXhqeXRQM1RxY0RWWWtkanhRQ01rOEJJMWZ0?=
 =?utf-8?B?VWxpMElpcVc3dWxyTElNZVo0R3dYVlZWdEZTWEY0cFN3OENaOTBUdkhyOG9O?=
 =?utf-8?B?RllIYndBS3FXRVNWNTJCT2F2ekpHU2gzTTFvaVZsWVBxMlZqdFNORkR4V1pU?=
 =?utf-8?B?cVNWUlM1SkVvVUxPZ1hubTFXcXpaNlIvNjVMbzl5YU5xODg3MFVERENpNzRX?=
 =?utf-8?B?YWdvaFV4azlmRFJoZG83QW1xSkF5UkhTVmxnSGNZQmtJQ01RNzBpeVRrK0Fi?=
 =?utf-8?B?V2R3UlI3ZXoxWE1rQ1IwVlY1aWJXY0ViTHJTSjZDZk9FU0M0L1g3ckRXTy9w?=
 =?utf-8?B?cFh6UlhyMkIzU05lWm94SnBxc2xFYkZDTSt2ZjlwOThGS0VsamE3bk80Tm5E?=
 =?utf-8?B?YnNESE12VTFSbVZnZ292VVo3bWtFYTBjNFRCVzJyaWhsaWJMT1R3SG9naHFM?=
 =?utf-8?B?N3lwMEkzNC9nR3hBTVlYTGpTL3BNRk5EWjdyS0g2WWRsQUQrSFNwVzRaL1FD?=
 =?utf-8?B?NjdPdUJEMHZQYmRvbmdiUVVFdDRlR3RnNUlKUFFlRms5UTh2czRiUXpncEJV?=
 =?utf-8?B?UGU0dlFZVXRvRUxJWGN3bEZsbnVXMXBhNFlqTXk2eGx3NTJRVUE1MDVVb2hu?=
 =?utf-8?B?WElNZEJDTWxqWHBUdER3Q0FFSDYzNWEweEZlODRUa2tHRk5hNnZFNGU2OCs1?=
 =?utf-8?B?bWg4RjlPb0xlRXJ3dXRyd25uS3Y5M1k1L1JvVnE4ZTV3NFR2b216QWhBc3lB?=
 =?utf-8?B?bGlLK1FIdU5RcXBjekNPYmJoT1JVT3RsNjFySUJNQlJPUE14MVJkdWJCZWVh?=
 =?utf-8?B?Ujc5M0RZNlZocnVNMzVscVlQeXFoK3kxM3Y4VWkvaW9CRUtyeGtBaG5vK1FG?=
 =?utf-8?B?OXVJTXo4N3ptUkVSWFJremY3YWJwSTZYNWFuWXNuYm9vMzNWRUF5WkNHazBL?=
 =?utf-8?B?ZWF3V1diTURvMFFoZjg3Y2lLUVFzQlFUM0pueTNEVVMzQ0RidGZIRVE3Qmsx?=
 =?utf-8?B?QlFPK2JMTzU3U0pwR3NGWE9vODBsYmgvL1VKdGNVMS9LNzdNeThuMTBOU2Z2?=
 =?utf-8?B?YmNtS2U5ZkEzdURXNVVRVFJVU1RScUxkVDF2NFc3WDhoWWY4Ry8vR3FNd25W?=
 =?utf-8?B?N0RXVG9hYk14d2gwRkR6cFdmZ2hieGN5RXB0SXlRODVnU1ZMOU5PUVRHOG9V?=
 =?utf-8?B?ZVVGWm42N3BKNGNlTXZGQkQrQXNSa1Z6Skh4aUU1R0VOZlhsTXREZ2IxcmUw?=
 =?utf-8?Q?7O5E14ZIhGTfO6vLClsZuDEtN?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5478.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c348a47-3a41-4bc2-7166-08dab2ab495d
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2022 14:56:36.5734 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R/W/2Vj+ipmkzjO3DTKVvVWXUsdvBfk8mJnXEJalrMp7mTfwoXxV/fjgHBM+8h/3sJZPriHnja37p3qnA7G2xA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7018
Received-SPF: none client-ip=40.107.244.41; envelope-from=yishaih@nvidia.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FORGED_SPF_HELO=1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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

PiBGcm9tOiBRZW11LWRldmVsIDxxZW11LWRldmVsLQ0KPiBib3VuY2VzK3lpc2hhaWg9bnZpZGlh
LmNvbUBub25nbnUub3JnPiBPbiBCZWhhbGYgT2YgSnVhbiBRdWludGVsYQ0KPiBTZW50OiBNb25k
YXksIDMgT2N0b2JlciAyMDIyIDY6MTYNCj4gVG86IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZw0KPiBD
YzogQWxleCBXaWxsaWFtc29uIDxhbGV4LndpbGxpYW1zb25AcmVkaGF0LmNvbT47IEVyaWMgQmxh
a2UNCj4gPGVibGFrZUByZWRoYXQuY29tPjsgU3RlZmFuIEhham5vY3ppIDxzdGVmYW5oYUByZWRo
YXQuY29tPjsgRmFtDQo+IFpoZW5nIDxmYW1AZXVwaG9uLm5ldD47IHFlbXUtczM5MHhAbm9uZ251
Lm9yZzsgQ29ybmVsaWEgSHVjaw0KPiA8Y29odWNrQHJlZGhhdC5jb20+OyBUaG9tYXMgSHV0aCA8
dGh1dGhAcmVkaGF0LmNvbT47IFZsYWRpbWlyDQo+IFNlbWVudHNvdi1PZ2lldnNraXkgPHZzZW1l
bnRzb3ZAeWFuZGV4LXRlYW0ucnU+OyBMYXVyZW50IFZpdmllcg0KPiA8bHZpdmllckByZWRoYXQu
Y29tPjsgSm9obiBTbm93IDxqc25vd0ByZWRoYXQuY29tPjsgRHIuIERhdmlkIEFsYW4NCj4gR2ls
YmVydCA8ZGdpbGJlcnRAcmVkaGF0LmNvbT47IENocmlzdGlhbiBCb3JudHJhZWdlcg0KPiA8Ym9y
bnRyYWVnZXJAbGludXguaWJtLmNvbT47IEhhbGlsIFBhc2ljIDxwYXNpY0BsaW51eC5pYm0uY29t
PjsgSnVhbg0KPiBRdWludGVsYSA8cXVpbnRlbGFAcmVkaGF0LmNvbT47IFBhb2xvIEJvbnppbmkg
PHBib256aW5pQHJlZGhhdC5jb20+Ow0KPiBxZW11LWJsb2NrQG5vbmdudS5vcmc7IEVyaWMgRmFy
bWFuIDxmYXJtYW5AbGludXguaWJtLmNvbT47IFJpY2hhcmQNCj4gSGVuZGVyc29uIDxyaWNoYXJk
LmhlbmRlcnNvbkBsaW5hcm8ub3JnPjsgRGF2aWQgSGlsZGVuYnJhbmQNCj4gPGRhdmlkQHJlZGhh
dC5jb20+DQo+IFN1YmplY3Q6IFtSRkMgMC83XSBtaWdyYXRpb24gcGF0Y2hlcyBmb3IgVkZJTw0K
PiANCj4gSGkNCj4gDQo+IFZGSU8gbWlncmF0aW9uIGhhcyBzZXZlcmFsIHJlcXVpcmVtZW50czoN
Cj4gLSB0aGUgc2l6ZSBvZiB0aGUgc3RhdGUgaXMgb25seSBrbm93biB3aGVuIHRoZSBndWVzdCBp
cyBzdG9wcGVkDQoNCkFzIHdhcyBkaXNjdXNzZWQgaW4gdGhlIGNvbmZlcmVuY2UgY2FsbCwgSSBq
dXN0IHNlbnQgYSBwYXRjaCB0byB0aGUga2VybmVsIG1haWxpbmcgbGlzdCB0byBiZSBhYmxlIHRv
IGdldCB0aGUgc3RhdGUgc2l6ZSBpbiBlYWNoIHN0YXRlLg0KDQpTZWU6DQpodHRwczovL3BhdGNo
d29yay5rZXJuZWwub3JnL3Byb2plY3Qva3ZtL3BhdGNoLzIwMjIxMDIwMTMyMTA5LjExMjcwOC0x
LXlpc2hhaWhAbnZpZGlhLmNvbS8NCg0KVGhpcyBjYW4gZHJvcCB0aGUgbmVlZCB0byBzdG9wIHRo
ZSBndWVzdCBhbmQgYXNrIGZvciB0aGF0IGRhdGEuDQoNClNvLCBJIGFzc3VtZSB0aGF0IHlvdSBj
YW4gZHJvcCBzb21lIGNvbXBsZXhpdHkgYW5kIGhhY2tzIGZyb20geW91ciBSRkMgb25jZSB5b3Un
bGwgc2VuZCB0aGUgbmV4dCBzZXJpZXMuDQoNClNwZWNpZmljYWxseSwNCk5vIG5lZWQgdG8gc3Rv
cCB0aGUgVk0gYW5kIHJlLXN0YXJ0IGl0IGluIGNhc2UgdGhlIFNMQSBjYW4ndCBtZWV0LCBqdXN0
IHJlYWQgdXBvbiBSVU5OSU5HIHRoZSBlc3RpbWF0ZWQgZGF0YSBsZW5ndGggdGhhdCB3aWxsIGJl
IHJlcXVpcmVkIHRvIGNvbXBsZXRlIFNUT1BfQ09QWSBhbmQgdXNlIGl0Lg0KDQpZaXNoYWkNCg0K
PiAtIHRoZXkgbmVlZCB0byBzZW5kIHBvc3NpYmxlIGxvdHMgb2YgZGF0YS4NCj4gDQo+IHRoaXMg
c2VyaWVzIG9ubHkgYWRkcmVzcyB0aGUgMXN0IHNldCBvZiBwcm9ibGVtcy4NCj4gDQo+IFdoYXQg
dGhleSBkbzoNCj4gLSByZXNfY29tcGF0aWJsZSBwYXJhbWV0ZXIgd2FzIG5vdCB1c2VkIGFueXdo
ZXJlLCBqdXN0IGFkZCB0aGF0DQo+IGluZm9ybWF0aW9uIHRvIHJlc19wb3N0Y29weS4NCj4gLSBS
ZW1vdmUgUUVNVUZJTEUgcGFyYW1ldGVyIGZyb20gc2F2ZV9saXZlX3BlbmRpbmcNCj4gLSBTcGxp
dCBzYXZlX2xpdmVfcGVuZGluZyBpbnRvDQo+ICAgKiBzYXZlX3BlbmRpbmdfZXN0aW1hdGUoKTog
dGhlIHBlbmRpbmcgc3RhdGUgc2l6ZSB3aXRob3V0IHRyeWluZyB0b28gaGFyZA0KPiAgICogc2F2
ZV9wZW5kaW5nX2V4YWN0KCk6IHRoZSByZWFsIHBlbmRpbmcgc3RhdGUgc2l6ZSwgaXQgaXMgY2Fs
bGVkIHdpdGggdGhlDQo+IGd1ZXN0IHN0b3BwZWQuDQo+IC0gTm93IHNhdmVfcGVuZGluZ18qIGRv
bid0IG5lZWQgdGhlIHRocmVzaG9sZCBwYXJhbWV0ZXINCj4gLSBIQUNLIGEgd2F5IHRvIHN0b3Ag
dGhlIGd1ZXN0IGJlZm9yZSBtb3ZpbmcgdGhlcmUuDQo+IA0KPiBUb0RvOg0KPiAtIGF1dG9jb252
ZXJnZSB0ZXN0IGlzIGJyb2tlbiwgbm8gcmVhbCBjbHVlIHdoeSwgYnV0IGl0IGlzIHBvc3NpYmxl
IHRoYXQgdGhlIHRlc3QNCj4gaXMgd3JvbmcuDQo+IA0KPiAtIE1ha2UgYW4gYXJ0aWZhY3QgdG8g
YmUgYWJsZSB0byBzZW5kIG1hc3NpdmUgYW1vdW50IG9mIGRhdGEgaW4gdGhlIHNhdmUNCj4gc3Rh
dGUgc3RhZ2UgKHByb2JhYmx5IG1vcmUgbXVsdGlmZCBjaGFubmVscykuDQo+IA0KPiAtIEJlIGFi
bGUgdG8gbm90IGhhdmluZyB0byBzdGFydCB0aGUgZ3Vlc3QgYmV0d2VlbiBjaGVraW5nIHRoZSBz
dGF0ZSBwZW5kaW5nDQo+IHNpemUgYW5kIG1pZ3JhdGlvbl9jb21wbGV0aW9uKCkuDQo+IA0KPiBQ
bGVhc2UgcmV2aWV3Lg0KPiANCj4gVGhhbmtzLCBKdWFuLg0KPiANCj4gSnVhbiBRdWludGVsYSAo
Nyk6DQo+ICAgbWlncmF0aW9uOiBSZW1vdmUgcmVzX2NvbXBhdGlibGUgcGFyYW1ldGVyDQo+ICAg
bWlncmF0aW9uOiBObyBzYXZlX2xpdmVfcGVuZGluZygpIG1ldGhvZCB1c2VzIHRoZSBRRU1VRmls
ZSBwYXJhbWV0ZXINCj4gICBtaWdyYXRpb246IEJsb2NrIG1pZ3JhdGlvbiBjb21tZW50IG9yIGNv
ZGUgaXMgd3JvbmcNCj4gICBtaWdyYXRpb246IFNwbGl0IHNhdmVfbGl2ZV9wZW5kaW5nKCkgaW50
byBzdGF0ZV9wZW5kaW5nXyoNCj4gICBtaWdyYXRpb246IFJlbW92ZSB1bnVzZWQgdGhyZXNob2xk
X3NpemUgcGFyYW1ldGVyDQo+ICAgbWlncmF0aW9uOiBzaW1wbGlmeSBtaWdyYXRpb25faXRlcmF0
aW9uX3J1bigpDQo+ICAgbWlncmF0aW9uOiBjYWxsIHFlbXVfc2F2ZXZtX3N0YXRlX3BlbmRpbmdf
ZXhhY3QoKSB3aXRoIHRoZSBndWVzdA0KPiAgICAgc3RvcHBlZA0KPiANCj4gIGRvY3MvZGV2ZWwv
bWlncmF0aW9uLnJzdCAgICAgICB8IDE4ICsrKysrKy0tLS0tLQ0KPiAgZG9jcy9kZXZlbC92Zmlv
LW1pZ3JhdGlvbi5yc3QgIHwgIDQgKy0tDQo+ICBpbmNsdWRlL21pZ3JhdGlvbi9yZWdpc3Rlci5o
ICAgfCAyOSArKysrKysrKysrLS0tLS0tLS0tDQo+ICBtaWdyYXRpb24vc2F2ZXZtLmggICAgICAg
ICAgICAgfCAgOCArKystLS0NCj4gIGh3L3MzOTB4L3MzOTAtc3RhdHRyaWIuYyAgICAgICB8IDEx
ICsrKystLS0NCj4gIGh3L3ZmaW8vbWlncmF0aW9uLmMgICAgICAgICAgICB8IDE3ICsrKysrLS0t
LS0tDQo+ICBtaWdyYXRpb24vYmxvY2stZGlydHktYml0bWFwLmMgfCAxNCArKysrLS0tLS0NCj4g
IG1pZ3JhdGlvbi9ibG9jay5jICAgICAgICAgICAgICB8IDE3ICsrKysrKy0tLS0tDQo+ICBtaWdy
YXRpb24vbWlncmF0aW9uLmMgICAgICAgICAgfCA1MiArKysrKysrKysrKysrKysrKysrKysrLS0t
LS0tLS0tLS0tDQo+ICBtaWdyYXRpb24vcmFtLmMgICAgICAgICAgICAgICAgfCAzNSArKysrKysr
KysrKysrKysrLS0tLS0tLQ0KPiAgbWlncmF0aW9uL3NhdmV2bS5jICAgICAgICAgICAgIHwgMzcg
KysrKysrKysrKysrKysrKystLS0tLS0tDQo+ICB0ZXN0cy9xdGVzdC9taWdyYXRpb24tdGVzdC5j
ICAgfCAgMyArLQ0KPiAgaHcvdmZpby90cmFjZS1ldmVudHMgICAgICAgICAgIHwgIDIgKy0NCj4g
IG1pZ3JhdGlvbi90cmFjZS1ldmVudHMgICAgICAgICB8ICA3ICsrKy0tDQo+ICAxNCBmaWxlcyBj
aGFuZ2VkLCAxNDggaW5zZXJ0aW9ucygrKSwgMTA2IGRlbGV0aW9ucygtKQ0KPiANCj4gLS0NCj4g
Mi4zNy4yDQo+IA0KDQo=

