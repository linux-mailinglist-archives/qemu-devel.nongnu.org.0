Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E03916004A6
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 03:01:14 +0200 (CEST)
Received: from localhost ([::1]:38014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okEV6-0001N9-Bb
	for lists+qemu-devel@lfdr.de; Sun, 16 Oct 2022 21:01:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=282f36034=Dmitry.Fomichev@wdc.com>)
 id 1okEQJ-0000Y9-4K; Sun, 16 Oct 2022 20:56:07 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:62669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=282f36034=Dmitry.Fomichev@wdc.com>)
 id 1okEQH-0004m6-4H; Sun, 16 Oct 2022 20:56:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1665968165; x=1697504165;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=S10MTgyz+i2lnAZ+1WA3xVQuM3zx0E8AXhFLImiBizk=;
 b=lz3cxFvZNIujF6U44JT/gJJcCVJKkLGXxnDNmjJJCbWWNlRXx3LWzK4+
 h4uRMl1Nwt3iuf01NkaengsFhnCmjcNnpH8/pCzpAi11nZaKd2GMCDpy9
 pzfxcgEGGecJOV+1ng2wSeTpHeMQLJjHEI8Qd9YrhDmB5vSGeweYa5QaU
 1ThUixV/eCuzrWVVL31M1yKFOEuso94WCk6TOD+Sgx+SyloiEDX+IiG6H
 O+PPe5iNs2ayKFaCBSIngr0GlkKJ0hGkLl7+eK/qKnpKsM8Rn9XGna18x
 O5boDfSbcluffR2Y61vs+M1/9p09O0AdLXCABxTYXVCITVpmQLT6eWBwD A==;
X-IronPort-AV: E=Sophos;i="5.95,190,1661788800"; d="scan'208";a="219123266"
Received: from mail-bn7nam10lp2104.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.104])
 by ob1.hgst.iphmx.com with ESMTP; 17 Oct 2022 08:55:54 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fUwyElYipnnbV9aBu0sd6wnkx9NXmfsHED7H9Dmw6mHsLoGv1709NthVzzsUH8d7xRN4jLMjCz+BSt5MTS8tl4E1kYSzriLHiF/Cx11OcmoGvWSzHv70FN2humh3c7fe8bo+O2aJg+Xv50eYTGOApP3FA90GoPX4HJ/h+68eia9LdsNUJF0s9F+K9+9dY1trGfptQQcvgguT1cMmWjnLiVAeHpQC+gdMNhtHu/NP1BdN/UozJKJrcO+Yup22f7RSLftijMeDExvwnXeBR0uzmbJnf1oTwB/W4ra6yln2mtjCIWY08PnjoCSsS1BftWf77PbTuhacP8S+wmpcOwx+8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S10MTgyz+i2lnAZ+1WA3xVQuM3zx0E8AXhFLImiBizk=;
 b=RKT3SS5/vyzbQZolvZjfLWT9/G9zdILbzdzdRuPxRDBrrxyGTnecx1mtvizQhOvPT+i3K26+SOCIzJJbE4WNENCoizSaAzG7u1ycma0tNusGyNKp4Sr09jin/Hsig8hI6rcaCoJ4HX7isp/VzTMjPaZ0WUJlpUTlerOLXoI7QNApidJytjfGVyRPHIOsItA9Q3Vm+7hIqSvLvi58NFYgI8oE+CwkcKDX4clX+fVQ3AcQRAnzSsoaHcDfkRObg4a7RON1M7JEkXrEHlVm3dpxZ5aW7IC2Yw5etRNeBxtGa3/+/4HT+g+1nBmnsIMDWXR0vRTrjI5YtpCMYkJ/zRxfpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S10MTgyz+i2lnAZ+1WA3xVQuM3zx0E8AXhFLImiBizk=;
 b=gwNRhBwy7ObYubOQReJA9WI3krsBBjQ9MkHcAhHZVNVNxozeLeIHDpXJSbXrUGVjBCY1PBd1HdWWSFmOZD/t1KXoODXdJepI1EawJ7M7EXGWwAfirddfCu+1fELCUDysJm4Nq2k4Q2oull5PNr3C3FGnkgxY+YV6DkVD8ZgjeKA=
Received: from MN2PR04MB5951.namprd04.prod.outlook.com (2603:10b6:208:3f::13)
 by SJ0PR04MB7472.namprd04.prod.outlook.com (2603:10b6:a03:294::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Mon, 17 Oct
 2022 00:55:51 +0000
Received: from MN2PR04MB5951.namprd04.prod.outlook.com
 ([fe80::51df:fdd7:7c49:12ee]) by MN2PR04MB5951.namprd04.prod.outlook.com
 ([fe80::51df:fdd7:7c49:12ee%5]) with mapi id 15.20.5723.032; Mon, 17 Oct 2022
 00:55:51 +0000
From: Dmitry Fomichev <Dmitry.Fomichev@wdc.com>
To: "faithilikerun@gmail.com" <faithilikerun@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "hreitz@redhat.com" <hreitz@redhat.com>, "hare@suse.de" <hare@suse.de>,
 "armbru@redhat.com" <armbru@redhat.com>, "stefanha@redhat.com"
 <stefanha@redhat.com>, "fam@euphon.net" <fam@euphon.net>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>, "eblake@redhat.com"
 <eblake@redhat.com>, "kwolf@redhat.com" <kwolf@redhat.com>,
 "damien.lemoal@opensource.wdc.com" <damien.lemoal@opensource.wdc.com>
Subject: Re: [PATCH v12 1/7] include: add zoned device structs
Thread-Topic: [PATCH v12 1/7] include: add zoned device structs
Thread-Index: AQHY4W7N7p1cN8U/jUCS0JNe2P9m264Rw4gA
Date: Mon, 17 Oct 2022 00:55:51 +0000
Message-ID: <a6673c2e4c19cfd4531db8f60b07e22875b8a3c0.camel@wdc.com>
References: <20221016145110.171262-1-faithilikerun@gmail.com>
 <20221016145110.171262-2-faithilikerun@gmail.com>
In-Reply-To: <20221016145110.171262-2-faithilikerun@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR04MB5951:EE_|SJ0PR04MB7472:EE_
x-ms-office365-filtering-correlation-id: 3838623c-c31b-4037-9676-08daafda565c
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rMg95S67PeF/ueyFTqhC0r1+C3nukS8XnY1G3cwujWATzK2FBONXEQ18HxbYSZIRPlMBzWLcUXIeOx38uSNQ538alhpWAeEz/Ack5L5nnONG+2Bn3q0IlC4okLeUDuFVY4jZ6UJtM/I4S86f2Lp6UPRyfTvr5f7+ifWUYFV6osK2hHzA5AkKLziEXEI0ugGZ3LOp3/bytYlX/eRJv5db66sTblCC6l0rMA8Faaryn9hsUpVOsSt7PbGo/WPvUOZfqncIw28V0wtlF2Ea/Lyln4V4Y7et8CsQnzio/7XP9fbXU4C9Kx62O4UZAyf74XA9OZSnnLd0QOjd/vJHJq2x8y/9mkdJDCpb0Bb1AfbAuuHpMhN1Hd7JYFd/PkjqcvcikwYWtPSxEjjvOzPOCl3MQKvUls5fxRQbNKOpcHapBZC5ffOgGRi6XQy5Ek0Q9RFbozuumNyVGX2QF6+6x1OTnhgXyKPC01P0x+N/vaL4R20J1IA4dC3uxHPDZQoiaPZIPRACR3H1tV2eJMsRBgpFuUoMz2BP14qlVWWotFu5GGLN69SSXM2MUxtg5gk170pYMBKjXV/kiGUfaXIEORudbgh9KkWDn8lBjWg3QUakq/0H6cnQbRMazMtRZqdqYTZFrZi48rotq1P4FGccQVTrm7bz4ggqyQhQj6wbBGD8ICNuYtmkCS+XNwAynciUdRY9VH1E6qpGypr/h2gee6N3AbUCI4Nsl5eQMM6jNAlv+YkJHvafkQnImtuR0bl/ZKvBNUhOMKqPwI1tqpCc4eIa3w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR04MB5951.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(366004)(376002)(396003)(346002)(39860400002)(451199015)(38100700002)(6486002)(478600001)(71200400001)(38070700005)(122000001)(82960400001)(4001150100001)(2616005)(186003)(316002)(8676002)(4326008)(54906003)(64756008)(66446008)(66946007)(66556008)(66476007)(110136005)(76116006)(91956017)(6506007)(5660300002)(36756003)(26005)(41300700001)(6512007)(8936002)(7416002)(86362001)(2906002)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VklNZFArVUhOWmF5RHZMM01od2VrT05EdFZ1LzJhRW1HQTR2RDh3b3ZPdWtP?=
 =?utf-8?B?aFpDUFNkczlJeDN0b01KWDVHMnNZTFVqTEQweURTbThlS3JVZzdRLzcxcC9w?=
 =?utf-8?B?ZHhhVjRPV2xJR1pxNkI3Tml0dEdvUDQvSWJ0Y2dpSjRFVnIxOFc5SUp4Y0dt?=
 =?utf-8?B?UmpYUGNuOXRtd1hhczg2NkswUGNOWnR3cFNJcWxVOWZLUjlxZVA0VkdzU1lD?=
 =?utf-8?B?a1RINU00VERienhpOGt0QzdveXM4UU9sZlZXNlo2U1drWTRMa0hlZWhkM2o2?=
 =?utf-8?B?ZVFhUnNUQ0s1dkg1YlRIbzlZUHNPd0tKa3BMVjJXRmNtVHZFUGpVTE1qMFZn?=
 =?utf-8?B?VXVxN054Y25zaXNXTGRxT3hIU1VRSHg0NjZ2RjBGem1nNGZyTWI2MHFnL2c2?=
 =?utf-8?B?cWtaSlJMM2Vmam1vRXRON1VqNzYwQi92Wmw0OHlpcGl2WnA1Z2NEOXhwakJs?=
 =?utf-8?B?N2o2NUtyUFdHaTZxa0d5aEJFWUVkY21YTXRPbWFyeVQ1VWxoSW44Q2xtS1I3?=
 =?utf-8?B?NmVrKzlOV2VDY0xNalJOMmJrMWJkc010b056ZFppMGRZaWV3MmhkcDNrVkxO?=
 =?utf-8?B?T2FGL3B1MFFtYkp1RFEvd1JkQ3B5bHBPUUpYcFMxbHNrOTVFcmlaZDJ3M1oz?=
 =?utf-8?B?NE85NWIvQ1VxdkhPV1pncTBSUTZwNjZWRzhhMU92MFp4ZFRrYzlEZS93emtz?=
 =?utf-8?B?NUZ2SW1TbjR5RkNmVmdma2xFUEhYNlZzVjg5UmhiNjBjRDVkeTZ4ZjdhVjhZ?=
 =?utf-8?B?ZG9iNW9pZktrWFMwdjc1a1VXc3JYNWhkaUpremRKSVlBVW50S1YwbndsRDV4?=
 =?utf-8?B?eUtzK3owTWV5Ykh4Y0oxNStwdCtVeHlYSGNsYzVFTnhtOUw1RkJDV0RvT3Y3?=
 =?utf-8?B?VlVacjVTRGI3K2M5dTNGbkM0dUk1S2VyMEczMCtnUlR5N3ZDcHAvSWlFQ2Vi?=
 =?utf-8?B?a2tIWmk3eGhycFh5TG40Mno3TkRSeTFKV0xzdTRlZGUvUXpmQXRtc3NoVlJj?=
 =?utf-8?B?bVpBSkhqL1lzOUppNTV5T0I1SE41ZmJURWFGMkpCZFlxbytadU01TGhJU2RC?=
 =?utf-8?B?Y21sSHAxNitId28yVlRPaFBnTHdLNXVoTkxEa2pMVDRXVFVsSTgyTzFoeEJh?=
 =?utf-8?B?UGY0cEM5aTArU3BNK3RtOVJwcGljMnpKVmo5SUpDakx1SGtEUFRoaWRnaitS?=
 =?utf-8?B?L1Mrb3RSMTFiOHhqbkw4eHBHK2ZLV1VweXJqRUYzWndXczdKOXN2Y2t4eEtx?=
 =?utf-8?B?NXViZTU4Y1hkbDNYZGwxOFg3d0R2Zmx1Qm9OSkhYZW13cHQ0SW1pc3R6OFdB?=
 =?utf-8?B?bEFhUWE3Q0hqWXhqbW1xMlZ0ZDViRUZlS0FvMjY1RXN3Nkp3TEV0R0QzNXhv?=
 =?utf-8?B?dE94a3M0b05vUDluOW00N2JqNmxzRHZMNmg4QnZvV0hjMVQzRFFzN1FwQS9l?=
 =?utf-8?B?N1Z2KzI1cFRrTTdXbjRyanJmNFcwV1IrS3R6V0U3OXZWY0xMYWYvdEJpM2d1?=
 =?utf-8?B?U1pUMzVMVkJJSi9zK05PL1N2K1FOMzY1UHdYWi84ZnV5RUs4dG9Wb0xzVUp4?=
 =?utf-8?B?dG0wanhQaUliTmVtRnpHOWxYTXRsTnV2QTI4U2J4YW50MjljQUIxbW85SmVQ?=
 =?utf-8?B?dWFJWUdDWEhZeUlFdTUvZ3JGM0JKQm00aXJpZjhjTzJCMnM1SWpDVFVrTllh?=
 =?utf-8?B?RXdud016M1VNb2JNRWdFL0NrSjZaV21tU0dUQU1sWmV2WFZGQlVDMmxIaUxt?=
 =?utf-8?B?QWdwU3pPVWx5S3lmM2hWNTdUTVErT3Nka01YdkEvSXZqTThEWkpvSFVZK1lq?=
 =?utf-8?B?Rm4xMWR2UDRaSmhOZXBvaFdnZTJWREEyakFrVjlJQVlGVGFjVTQxbXNaYW9F?=
 =?utf-8?B?Z0FTNklHRkU4akYxVTRCZE9BaUlNZHFXSysrL0dBZkhvTExvRmJsWERPMDRi?=
 =?utf-8?B?QW9LeWplUnowWDJTb2NvcUlZUGhWU0FSMDlVRFNPSi9JN0hUS2hXMjl0TVhM?=
 =?utf-8?B?VkhZeEx6NVE2M2dscmI4bjN5T3RQQ094Q3FmR211RjNaaHVQSm0xb3kySzJQ?=
 =?utf-8?B?UkQ2dm1ORWlnaEdDZjVXcHMrTWY4bDgrRGNKWG5ieXJEUlNzakRkL2Z2WlBT?=
 =?utf-8?B?ZGoxWU9XYTE4TEFyU3RObHBZYjhUa2IwSk1pMFhDWWdReGErYkZLUHlQNDZM?=
 =?utf-8?B?SGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4597B722711F2D4FBE2C30A3AE6DCC62@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR04MB5951.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3838623c-c31b-4037-9676-08daafda565c
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2022 00:55:51.2361 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: byhW4xor75f90CaRTd00u4m7Flx1vpQZg8aV69F4pGji9+1OUTBg2UpTBn+ZxYpdEL5GmSy/urPKO6a2w6vTTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB7472
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=282f36034=Dmitry.Fomichev@wdc.com; helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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

T24gU3VuLCAyMDIyLTEwLTE2IGF0IDIyOjUxICswODAwLCBTYW0gTGkgd3JvdGU6DQo+IFNpZ25l
ZC1vZmYtYnk6IFNhbSBMaSA8ZmFpdGhpbGlrZXJ1bkBnbWFpbC5jb20+DQo+IFJldmlld2VkLWJ5
OiBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJlZGhhdC5jb20+DQo+IFJldmlld2VkLWJ5OiBE
YW1pZW4gTGUgTW9hbCA8ZGFtaWVuLmxlbW9hbEBvcGVuc291cmNlLndkYy5jb20+DQo+IFJldmll
d2VkLWJ5OiBIYW5uZXMgUmVpbmVja2UgPGhhcmVAc3VzZS5kZT4NCj4gLS0tDQo+IMKgaW5jbHVk
ZS9ibG9jay9ibG9jay1jb21tb24uaCB8IDQzICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKw0KPiDCoDEgZmlsZSBjaGFuZ2VkLCA0MyBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvaW5jbHVkZS9ibG9jay9ibG9jay1jb21tb24uaCBiL2luY2x1ZGUvYmxvY2svYmxv
Y2stY29tbW9uLmgNCj4gaW5kZXggZmRiNzMwNmU3OC4uMzZiZDBlNDgwZSAxMDA2NDQNCj4gLS0t
IGEvaW5jbHVkZS9ibG9jay9ibG9jay1jb21tb24uaA0KPiArKysgYi9pbmNsdWRlL2Jsb2NrL2Js
b2NrLWNvbW1vbi5oDQo+IEBAIC00OSw2ICs0OSw0OSBAQCB0eXBlZGVmIHN0cnVjdCBCbG9ja0Ry
aXZlciBCbG9ja0RyaXZlcjsNCj4gwqB0eXBlZGVmIHN0cnVjdCBCZHJ2Q2hpbGQgQmRydkNoaWxk
Ow0KPiDCoHR5cGVkZWYgc3RydWN0IEJkcnZDaGlsZENsYXNzIEJkcnZDaGlsZENsYXNzOw0KPiDC
oA0KPiArdHlwZWRlZiBlbnVtIEJsb2NrWm9uZU9wIHsNCj4gK8KgwqDCoCBCTEtfWk9fT1BFTiwN
Cj4gK8KgwqDCoCBCTEtfWk9fQ0xPU0UsDQo+ICvCoMKgwqAgQkxLX1pPX0ZJTklTSCwNCj4gK8Kg
wqDCoCBCTEtfWk9fUkVTRVQsDQo+ICt9IEJsb2NrWm9uZU9wOw0KPiArDQo+ICt0eXBlZGVmIGVu
dW0gQmxvY2tab25lTW9kZWwgew0KPiArwqDCoMKgIEJMS19aX05PTkUgPSAweDAsIC8qIFJlZ3Vs
YXIgYmxvY2sgZGV2aWNlICovDQo+ICvCoMKgwqAgQkxLX1pfSE0gPSAweDEsIC8qIEhvc3QtbWFu
YWdlZCB6b25lZCBibG9jayBkZXZpY2UgKi8NCj4gK8KgwqDCoCBCTEtfWl9IQSA9IDB4MiwgLyog
SG9zdC1hd2FyZSB6b25lZCBibG9jayBkZXZpY2UgKi8NCj4gK30gQmxvY2tab25lTW9kZWw7DQo+
ICsNCj4gK3R5cGVkZWYgZW51bSBCbG9ja1pvbmVDb25kaXRpb24gew0KPiArwqDCoMKgIEJMS19a
U19OT1RfV1AgPSAweDAsDQo+ICvCoMKgwqAgQkxLX1pTX0VNUFRZID0gMHgxLA0KPiArwqDCoMKg
IEJMS19aU19JT1BFTiA9IDB4MiwNCj4gK8KgwqDCoCBCTEtfWlNfRU9QRU4gPSAweDMsDQo+ICvC
oMKgwqAgQkxLX1pTX0NMT1NFRCA9IDB4NCwNCj4gK8KgwqDCoCBCTEtfWlNfUkRPTkxZID0gMHhE
LA0KPiArwqDCoMKgIEJMS19aU19GVUxMID0gMHhFLA0KPiArwqDCoMKgIEJMS19aU19PRkZMSU5F
ID0gMHhGLA0KPiArfSBCbG9ja1pvbmVDb25kaXRpb247DQoNClRoZSB2aXJ0aW8temJkIHNwZWNp
ZmljYXRpb24gZG9lc24ndCBkZWZpbmUgY29uZGl0aW9ucywgaXQgdXNlcyB0aGUgdGVybQ0KInN0
YXRlIiBpbnN0ZWFkLCBzaW1pbGFyIHRvIFpOUy4gUGxlYXNlIHJlbmFtZSBCbG9ja1pvbmVDb25k
aXRpb24gdG8NCkJsb2NrWm9uZVN0YXRlIHRvIGZvbGxvdyB0aGUgc3BlYyB0ZXJtaW5vbG9neS4N
Cg0KPiArDQo+ICt0eXBlZGVmIGVudW0gQmxvY2tab25lVHlwZSB7DQo+ICvCoMKgwqAgQkxLX1pU
X0NPTlYgPSAweDEsIC8qIENvbnZlbnRpb25hbCByYW5kb20gd3JpdGVzIHN1cHBvcnRlZCAqLw0K
PiArwqDCoMKgIEJMS19aVF9TV1IgPSAweDIsIC8qIFNlcXVlbnRpYWwgd3JpdGVzIHJlcXVpcmVk
ICovDQo+ICvCoMKgwqAgQkxLX1pUX1NXUCA9IDB4MywgLyogU2VxdWVudGlhbCB3cml0ZXMgcHJl
ZmVycmVkICovDQo+ICt9IEJsb2NrWm9uZVR5cGU7DQo+ICsNCj4gKy8qDQo+ICsgKiBab25lIGRl
c2NyaXB0b3IgZGF0YSBzdHJ1Y3R1cmUuDQo+ICsgKiBQcm92aWRlcyBpbmZvcm1hdGlvbiBvbiBh
IHpvbmUgd2l0aCBhbGwgcG9zaXRpb24gYW5kIHNpemUgdmFsdWVzIGluIGJ5dGVzLg0KPiArICov
DQo+ICt0eXBlZGVmIHN0cnVjdCBCbG9ja1pvbmVEZXNjcmlwdG9yIHsNCj4gK8KgwqDCoCB1aW50
NjRfdCBzdGFydDsNCj4gK8KgwqDCoCB1aW50NjRfdCBsZW5ndGg7DQo+ICvCoMKgwqAgdWludDY0
X3QgY2FwOw0KPiArwqDCoMKgIHVpbnQ2NF90IHdwOw0KPiArwqDCoMKgIEJsb2NrWm9uZVR5cGUg
dHlwZTsNCj4gK8KgwqDCoCBCbG9ja1pvbmVDb25kaXRpb24gY29uZDsNCg0KQmxvY2tab25lU3Rh
dGUgc3RhdGU7DQoNCj4gK30gQmxvY2tab25lRGVzY3JpcHRvcjsNCj4gKw0KPiDCoHR5cGVkZWYg
c3RydWN0IEJsb2NrRHJpdmVySW5mbyB7DQo+IMKgwqDCoMKgIC8qIGluIGJ5dGVzLCAwIGlmIGly
cmVsZXZhbnQgKi8NCj4gwqDCoMKgwqAgaW50IGNsdXN0ZXJfc2l6ZTsNCg0K

