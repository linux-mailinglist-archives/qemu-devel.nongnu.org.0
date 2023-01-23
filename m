Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B969678C57
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 00:58:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pK6gk-00063o-JS; Mon, 23 Jan 2023 18:57:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3802d7ee7=Alistair.Francis@wdc.com>)
 id 1pK6gh-00063c-VZ
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 18:57:20 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3802d7ee7=Alistair.Francis@wdc.com>)
 id 1pK6ga-00015k-Ft
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 18:57:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1674518232; x=1706054232;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=CCwQ4nz+XL6breDjkoujE2+9cOJRUaHpHxlr1i9Dd4A=;
 b=j8NAgS5mEQ4QgHR3oljMdyz5G1k46lY4jAIXSH3oGD3TSpqwencLqsqN
 BEFEJbGZr5viZSoGmt9RToR/LE2aCvpVitLO3+W8fATOK9ef6EoqW2WIa
 vKXbK/5vNUO9Z+VEb2U40MNVFRzco3wakzN3iRHGzJEbR9TyzUUVWONqc
 2oFA/yENYx+GmGw1FKYDfM5zHQDS5FfF4asIc5HGI1CWB9PtWBTWz8BnK
 IxUCIPspTQyhDCgVmV8IF6qFYFcxj7PM015jZY15k5FsbcCj9Mq3d/byq
 a1fYNhqgsKbKi1aP8sLsMuro+ewiTpl/e3hJ+pa/3PJduzEG55NEt57Bp Q==;
X-IronPort-AV: E=Sophos;i="5.97,240,1669046400"; d="scan'208";a="325890694"
Received: from mail-co1nam11lp2173.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.173])
 by ob1.hgst.iphmx.com with ESMTP; 24 Jan 2023 07:57:00 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EnBShq0200H2X7Ljof5ghryfAHciWf4307mtYfL7plzpZmYHPdKa3E7B0bWCJgWdJu1uvwkAj7JRq8p8USwXhkAAALhHklaGD6zjXZ0U8LBXo5Y+ND0DE6JAIZkLvGy+whGEZHRor+VABFbv9Y8stvY7DNjVrf0bxcO377FxaTIgxXkNmu846fNOKDxfVqhkkuWPijm8RSEIZPo9yAn1gFkauE1kanQT+jnw2IZmxtEh0VQyYhQCcZxE67EsyAjbaZ8AnVVtJDtZ3zGrKrrANYp1AQCHFaY+WtapLq/0xUgKKmomMajN5xKM4vUFqV3pO2tGIW+ZBrWrN9T6KQojXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CCwQ4nz+XL6breDjkoujE2+9cOJRUaHpHxlr1i9Dd4A=;
 b=BZe2GZwu+r3pZqZazDHLXUb612a7NMp6MtnjyhgU4ca9aDfWdUbhmaQt4RfIc4j0GCQfUgtU1cH6KIekR6G/FJ33jKBjmnihMCThFHFVfQZNIYodFk4FNnJePL0xTyV8984oOrTG/teEStXJutPqHk1aKIVcj+quLxt0UbO2EJOAHUpxcBC3uy86UZdXIG9LvKp1EW2cikng05/VflqFeaki5VqGGxhtNWTrrqUEg3V5I5eyVRAJ6X0BZzQRW68n7wHGbXRrD7BG2S15MuiWgVe9tu+MJ98c5EpPGucf+y8iOYRWq+HPlv1Cfwp6Yn3+qfNkBoiKaIar6m5oO5AxnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CCwQ4nz+XL6breDjkoujE2+9cOJRUaHpHxlr1i9Dd4A=;
 b=hbwIXEAiE1vbXGhyrja4Jhl3fxmVNZk1FyVEzlZqqtYq2dsAIYqe3OPcSxd3zyJKT09zcmFYd+bqsBOx4iu6toaMMVFDjAlL/4gVE/0WKi9HSuthK+2Xmn0g3yvxDa/FKU8ZDw5y1v26p9lX4VsNsQPmqx7S4BtV58dst3p6Ux0=
Received: from SJ0PR04MB7872.namprd04.prod.outlook.com (2603:10b6:a03:303::20)
 by MN2PR04MB6941.namprd04.prod.outlook.com (2603:10b6:208:1e5::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.28; Mon, 23 Jan
 2023 23:56:57 +0000
Received: from SJ0PR04MB7872.namprd04.prod.outlook.com
 ([fe80::d767:b3d:a9d4:e1fa]) by SJ0PR04MB7872.namprd04.prod.outlook.com
 ([fe80::d767:b3d:a9d4:e1fa%8]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 23:56:57 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "20230123035754.75553-1-alistair.francis@opensource.wdc.com"
 <20230123035754.75553-1-alistair.francis@opensource.wdc.com>,
 "mr.bossman075@gmail.com" <mr.bossman075@gmail.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "dbarboza@ventanamicro.com" <dbarboza@ventanamicro.com>
Subject: Re: [PATCH] hw/riscv: boot: Don't use CSRs if they are disabled
Thread-Topic: [PATCH] hw/riscv: boot: Don't use CSRs if they are disabled
Thread-Index: AQHZL3gqwGqRd2uQ1kCe91wut5F5I66src4A
Date: Mon, 23 Jan 2023 23:56:57 +0000
Message-ID: <e577ccf6aa628a5a4a5083512be6486b0965de22.camel@wdc.com>
References: <56b3f55d-9178-984b-6ef4-af7309b008d4@gmail.com>
In-Reply-To: <56b3f55d-9178-984b-6ef4-af7309b008d4@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.3 (by Flathub.org) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR04MB7872:EE_|MN2PR04MB6941:EE_
x-ms-office365-filtering-correlation-id: 106a8d86-8cb1-4915-b1a1-08dafd9d831f
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sFIJ+mM/0CESj3hiiufrIlZrR9/G2t5Ot/Ux14KAu54uM0gaEUgYoHQh6S/uoa79R2zsn6fNWGOEzCOYsSDdePfufyoKXf7oL7JulTzBBhBveVDMP99Gvth4+LfreGh/XMGybrTzLagfhO2BJkJgww8rlFL/TVYQUCJkaJ1JPjIYeQUNTPXOuqwNMtsyOsa86hbHBHIr29f/yj5nAuVmHG7JYU2gcGetJS3JraM6H6e7UmIwpF4WsGskmljhPUVGqdOpiNU1n+RZhUMXiED/muWRTI7qSE3sTMN0/MRINgakjgo9VqJ9kTKakjEr8xqbHUvbr8gqH1DFpbHO07b9Qj/nCR74N2sVDCWr5Y6H70qghRBB9MSodvvtM28TFco8x7NUuUgaMwcvUeXIZrmqYN8cYWFsdXl5KGycKY9BSkR9qxptozCRfRg7ZmA9IxWx79Uh5flsIfOyGxUqSJJqKr0YyRz/+sKBhMQOywCTMus7ndgLmPBHt9+qJqi6bxK+8Os+CsOCGr7Od34HNmbdgF9aSXpx4LouiqWIxPwpIvLWsJBgAQMxjgGR5q6HVIuMb4Qk0HoWHbYpc2dgCUzDAAUXOsETDscqGYysiMYJBEr+waF6FtxfBftSLAsplWnbW5q0E6QdHeod8c6c60OqiSHB22KXHDRwLgPyZwp0nfQdNlqFOYA6TObIj5nI/TdOg/WkTtP27gwIma74h1P5ttvNAyb2jsbHkZD1iPTb6Dk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR04MB7872.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(39860400002)(376002)(136003)(396003)(366004)(451199015)(86362001)(2906002)(91956017)(4326008)(66556008)(186003)(76116006)(66476007)(6512007)(478600001)(8676002)(64756008)(2616005)(66946007)(66446008)(6486002)(71200400001)(110136005)(966005)(54906003)(6506007)(122000001)(5660300002)(8936002)(38100700002)(38070700005)(82960400001)(316002)(83380400001)(41300700001)(36756003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NzB1VTZBaGlnWDRiRFpCSkwybDU2NVZaR1YzdUNxZDNnM0JhdklJbzZmdzZt?=
 =?utf-8?B?S1JaL051RjVHdXNOOEVWMGpSNEo2aXJNei9pNXdJY0Jvc0hTTmI4ckUrc0s5?=
 =?utf-8?B?ZlJsYUhUd1N6NnJHTENkRjRzc3h2dytLWXIwT3JUWU1wekZoQW1jSUFqajZw?=
 =?utf-8?B?OUViQTNuazUxNGxUY3pUdkllRE5mMlJKYzN5SWJkYXZ4ajNmRms4Mkcxemlu?=
 =?utf-8?B?Uzk5aWJSSmRNRlhMdDdzS0R3WGEvZmFWQ0FzTi9VdC9uQ0R4d3RLSjdTZitF?=
 =?utf-8?B?cThJZHN3ZVZBVW5WdXYvaHUxRHZaQ0ttVUNwb2MxTmtycUFBMFE1Q0hkOXd2?=
 =?utf-8?B?R05SU213SEV1eGs2MWFkN2ZtR1RrNlorUS9kdGdCOFRPSXBKQ3RRTFRnTVJa?=
 =?utf-8?B?V2VFeWJYMUFkN2VlZitvTDdveGhaOXJrajVjYTFkQXdyV3ZZd0hEZVZCREcv?=
 =?utf-8?B?bC9EaFgxVkIvSkhkZVBHeEJoSkcvVFlDTXpXTFRFUWN5MlFQOGNBNGozVFN1?=
 =?utf-8?B?RjY5VndqTWlrdmpOYWJuMG16NFpSSCtFMktOU3ZGOUsxRmFmVUVENmc0TzlY?=
 =?utf-8?B?dUd3ZENJd281RXk1T01TcGhXN3pkalZCeXlDY1JmNDFjODNQS3I1SWNubDJE?=
 =?utf-8?B?ZU5MU2hTWkVZSFdFMlJKY25Cbk10RFU4WVJVbmUrSVdZSThmWExMMmpTaDh6?=
 =?utf-8?B?SUkvdHpvOUYrbDAreCtlTWFFVW5XKzZWN0VWWFdWRW9jaEl5bEx4ZkhXL0Zq?=
 =?utf-8?B?OXdKS2Y0UGJ5N1FibW9lWUx1bEp1ZjF4OXBaV1AySXVicXMvQnBLUW5MUUIr?=
 =?utf-8?B?Q25yL3dSaTI3YXMyazB5YVNPRU55UGlaenFJdFl5R0x5VVNJK09TYnhsVjZY?=
 =?utf-8?B?eUhDK1RJK3BXL0NqZ09aNjYzOURLaklIZXpXR2FVZVNYNGhJbGZQNzZ6VjBn?=
 =?utf-8?B?azNyQXVKNG01UzEwRFZhcm43WVA0NWw4Yk85dlJlL2JxQnFBRU85cFJ3Q0Nr?=
 =?utf-8?B?Qm5LQnJiU0NEV3NBRVhpdC9wTEJrYzNDQ29GQ1oxTk00MXU0aUJkZFRBMVBS?=
 =?utf-8?B?ZWFzdnhidzZEMm16RmNIbmRxZGdUV3hUeVNvRm4vQk04UkJmWnBpNElaOXlU?=
 =?utf-8?B?S016bWpYTXdTdkNrcnVrSVBGMDNYUE5SMGxXbnFNbnBVN09lc1F0ZDMwY3E1?=
 =?utf-8?B?ZUQ0MlVpeTR6R1Y1RWFUS1BtbElkWmZhc1kxQnkwaXE2bTdYZXdLWE5WQnd4?=
 =?utf-8?B?MmhsQU9zRDdnSzEzSkg2dWdqUk1RN1pHZ3ZQa21mc1lXRDgxY3ZPN3dCdnZN?=
 =?utf-8?B?cU1ic0o2K0N2SkFKak4wU1FvT3YvVElMV3oxaTlYcTh0Wk9IV2VqdDkrSzhl?=
 =?utf-8?B?Q2V2ZXJaL1ZVaFBvaUdtM1Y5YU1MUzlqQU9kWUlaa2ZkdHdEMUMreERKTEpk?=
 =?utf-8?B?WWJJMjFOa2dyKy9qZllLSmRXcW54SU5WUENzYThwVEE2K3JJbStBeElHdUs1?=
 =?utf-8?B?bGdMV0ZCTTZaUk1tWEZvb0NMQ0FKNmU5cGxxUXFtQzl0aXVqbFB5YXVRNVNO?=
 =?utf-8?B?NlJ1R2JZVzRGSzdSbENQM0tZL0xNZHY0VnNIekF3ZHQ5RmhjUmlxaW5GV28r?=
 =?utf-8?B?dytWZTVDTFM2QWNzclZMb2dieUs3ZlBYcStvS0I1RWdLNW9NRnVzZUlYQUJ4?=
 =?utf-8?B?TVdZNHdyTTdFRUJoa2MrRDdWdjh1S000MlpaMFJISFhnOTZVSzl5UW5SbStn?=
 =?utf-8?B?YmxkRVRaTkk1SzVDQjh1UWZ5eGNjR1ZzUytRUFN5Sk1WZU4wTGpUMVlQanlU?=
 =?utf-8?B?OXVvZHlDT3ZIcDJyTENySVhKV0lQbkpUMDJNVHkyd0ZTZ1l2NFR3b2ljT0t5?=
 =?utf-8?B?MktCM3dqZTRVME9vc09ES2xkaWdrTzF3Sk11b3dWWGZ4RklKTldVVHBvMklN?=
 =?utf-8?B?RWwyaGhHdnFVUk8xaXEvNDNGdlBncytkUmJpK29TamhXVXRYODA1ODQvcnhx?=
 =?utf-8?B?RDNIT1k1RDNHcXpXbk5yTmFoeElyRkJmUDhLUjJjRFpxMHFPK3lKOE8vZTZt?=
 =?utf-8?B?ZnZSdFBOenpzODNWenlvd25JbzM5STBWbnJKMTVua0xVc0I1eE1ldmZwRytH?=
 =?utf-8?B?Ri93d2F4aVY4aFVrWTB1R2J3OUY4L0JWSDhiNVRNZXJYbnFuRkw0dWl1d2Nl?=
 =?utf-8?B?OG1oMG5BVVdRSmxJeWRtYmZWd083MDNrd2RQZ3VTT29PZnlWMjZ5WW41bFpI?=
 =?utf-8?B?SFl2bGpRNlRqYnMrOHNuZEIvVk5BPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D399F78961999140B650E81160BF8089@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: OCA28IseNqvbYvQiw7kPv4579GxZgNEMlYEBu5jJBX5cxVNDM4PUn1zuCfFm4hWZq059jey8zqhWVLAsrTvRtmO6APcOWJYabjpFi54qT3IKQ2jCZRw0V3mHQrkWrygGrODc3CCdz28Ve0hb+JcvyladHgBL58H9iUBFSSDBU+Z+wJWpywsaCyBr/aMjywM1hjIMuxszXquvHKSGOD9ptTs5hyub9B5spDTfsidqYIz+D+RU5n0cz3jBP1MK3SYkrw4O2fwRJLKnmBicVUdyxjoM1qC2+C8USgF/Nb0JJQQYeZseOL50bdpwjKQvRBmQxIn6x8qaQvFNxJicnCK2V2S+NW+FSaOv8naIBRTj3Trv86In3fXB576SFx2P9xEG9NXdjKtUI2k5alSYAiOxsHdBtTKpUu+N1RHe2xeSNd82N4tZ7cNob+xe8Hmk0l1aK1ObfoljNWSLpocUT8WsFBuK+EEv+HY3bVChfcDs2/LYIavI5choEThSCWIsOCqVx/ATJKJM7cSxPzb7MxLQVelumppX/UkrriiqtFeyF+GKKFfFDbEkrRBqdJv2z/me3OZlPggIu13nWBgvk7JPkU8M6wuF94DdS/Mei14sXj/Zl56aMm6KQMkHOd+viHwzTINpAkA8lBSnPeOb0HJ/JeeAo4zxO/CsE9VQIbBfwP4ZgG1CrBjtUY51yvgbmpE1V5TC2c3OGrhRrO6Zms040zCW6uE+eCyVdZ6pMFJLAJGIfuEku+SXVTLaTkTk7IuQ5zYF9TXmGM7i3mysajwaZqlzPoEl7YbviaqJfW/gEuyCZV4Qw4B+QcNtUPMOXoQvA6ldg7NGEhRbrayYROrCBw==
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR04MB7872.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 106a8d86-8cb1-4915-b1a1-08dafd9d831f
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2023 23:56:57.7619 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6PYwoqFfQfZZlHmosPz9VAdSyGj3amBs7Baj8b6njtyn3EpjLOgaGtH2F9dlNMBMHpS4pPdyXG80+ONzBp6xVD2ywD6KlHVxhGm5mOkr/T8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6941
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=3802d7ee7=Alistair.Francis@wdc.com;
 helo=esa2.hgst.iphmx.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

T24gTW9uLCAyMDIzLTAxLTIzIGF0IDE3OjE0IC0wNTAwLCBKZXNzZSBUYXViZSB3cm90ZToNCj4g
wqA+IEZyb206IEFsaXN0YWlyIEZyYW5jaXMgPGFsaXN0YWlyLmZyYW5jaXNAd2RjLmNvbT4NCj4g
wqA+DQo+IMKgPiBJZiB0aGUgQ1NScyBhbmQgQ1NSIGluc3RydWN0aW9ucyBhcmUgZGlzYWJsZWQg
YmVjYXVzZSB0aGUgWmljc3INCj4gwqA+IGV4dGVuc2lvbiBpc24ndCBlbmFibGVkIHRoZW4gd2Ug
d2FudCB0byBtYWtlIHN1cmUgd2UgZG9uJ3QgcnVuIGFueQ0KPiBDU1INCj4gwqA+IGluc3RydWN0
aW9ucyBpbiB0aGUgYm9vdCBST00uDQo+IMKgPg0KPiDCoD4gVGhpcyBwYXRjaGVzIHJlbW92ZXMg
dGhlIENTUiBpbnN0cnVjdGlvbnMgZnJvbSB0aGUgcmVzZXQtdmVjIGlmDQo+IHRoZQ0KPiDCoD4g
ZXh0ZW5zaW9uIGlzbid0IGVuYWJsZWQuIFdlIHJlcGxhY2UgdGhlIGluc3RydWN0aW9uIHdpdGgg
YSBOT1ANCj4gaW5zdGVhZC4NCj4gwqA+DQo+IMKgPiBOb3RlIHRoYXQgd2UgZG9uJ3QgZG8gdGhp
cyBmb3IgdGhlIFNpRml2ZSBVIG1hY2hpbmUsIGFzIHdlIGFyZQ0KPiBtb2RlbGxpbmcNCj4gwqA+
IHRoZSBoYXJkd2FyZSBpbiB0aGF0IGNhc2UuDQo+IMKgPg0KPiDCoD4gUmVzb2x2ZXM6IGh0dHBz
Oi8vZ2l0bGFiLmNvbS9xZW11LXByb2plY3QvcWVtdS8tL2lzc3Vlcy8xNDQ3DQo+IMKgPiBTaWdu
ZWQtb2ZmLWJ5OiBBbGlzdGFpciBGcmFuY2lzIDxhbGlzdGFpci5mcmFuY2lzQHdkYy5jb20+DQo+
IMKgPiAtLS0NCj4gwqA+wqAgaHcvcmlzY3YvYm9vdC5jIHwgOSArKysrKysrKysNCj4gwqA+wqAg
MSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQ0KPiDCoD4NCj4gwqA+IGRpZmYgLS1naXQg
YS9ody9yaXNjdi9ib290LmMgYi9ody9yaXNjdi9ib290LmMNCj4gwqA+IGluZGV4IDI1OTQyNzYy
MjMuLmNiMjc3OThhMjUgMTAwNjQ0DQo+IMKgPiAtLS0gYS9ody9yaXNjdi9ib290LmMNCj4gwqA+
ICsrKyBiL2h3L3Jpc2N2L2Jvb3QuYw0KPiDCoD4gQEAgLTM1Niw2ICszNTYsMTUgQEAgdm9pZCBy
aXNjdl9zZXR1cF9yb21fcmVzZXRfdmVjKE1hY2hpbmVTdGF0ZSANCj4gKm1hY2hpbmUsDQo+IMKg
PiBSSVNDVkhhcnRBcnJheVN0YXRlICpoYXJ0cw0KPiDCoD7CoMKgwqDCoMKgwqDCoMKgwqAgcmVz
ZXRfdmVjWzRdID0gMHgwMTgyYjI4MzvCoMKgIC8qwqDCoMKgwqAgbGTCoMKgwqDCoCB0MCwgMjQo
dDApICovDQo+IMKgPsKgwqDCoMKgwqAgfQ0KPiDCoD4NCj4gwqA+ICvCoMKgwqAgaWYgKCFoYXJ0
cy0+aGFydHNbMF0uY2ZnLmV4dF9pY3NyKSB7DQo+IMKgPiArwqDCoMKgwqDCoMKgwqAgLyoNCj4g
wqA+ICvCoMKgwqDCoMKgwqDCoMKgICogVGhlIFppY3NyIGV4dGVuc2lvbiBoYXMgYmVlbiBkaXNh
YmxlZCwgc28gbGV0J3MgZW5zdXJlDQo+IHdlIA0KPiBkb24ndA0KPiDCoD4gK8KgwqDCoMKgwqDC
oMKgwqAgKiBydW4gdGhlIENTUiBpbnN0cnVjdGlvbi4gTGV0J3MgZmlsbCB0aGUgYWRkcmVzcyB3
aXRoIGENCj4gbm9uDQo+IMKgPiArwqDCoMKgwqDCoMKgwqDCoCAqIGNvbXByZXNzZWQgbm9wLg0K
PiDCoD4gK8KgwqDCoMKgwqDCoMKgwqAgKi8NCj4gwqA+ICvCoMKgwqDCoMKgwqDCoCByZXNldF92
ZWNbMl0gPSAweDAwMDAwMDEzO8KgwqAgLyrCoMKgwqDCoCBhZGRpwqDCoCB4MCwgeDAsIDAgKi8N
Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXNldF92ZWNbMl0gPSAweDAwMDAw
NTEzOyAvKsKgwqDCoMKgIGxpwqDCoCBhMCwgMCAqLw0KPiBTaG91bGRuJ3QgaXQgYmUgbGkgYXMg
YTAgc2hvdWxkIGNvbnRhaW4gdGhlIGNwdSBudW1iZXIuIFRoZSByZWdzIGFyZQ0KPiBpbml0aWFs
aXplZCB3aXRoIDAgc28gaXRzIG5vdCBuZWNlc3NhcnkgYnV0IG5pY2UgdG8gYmUgZXhwbGljaXQu
DQoNClNvIHdlIGNhbid0wqBqdXN0IHJ1bjoNCg0KICAgbGkgICBhMCwgeA0KDQp3aGVyZSB4IGlz
IHRoZSBoYXJ0IElEIGFzIGVhY2ggQ1BVIHJ1bnMgdGhlIHNhbWUgcmVzZXQgY29kZS4NCg0KU28g
d2UgY291bGQgcnVuOg0KDQogICAgbGkgICBhMCwgMA0KDQpUbyB6ZXJvIG91dCBhMCwgYnV0IGFz
IGEwIGlzIDAgb24gcmVzZXQgSSBkb24ndCB0aGluayB3ZSBuZWVkIHRvLg0KDQpUaGlzIGN1cnJl
bnQgaW5zdHJ1Y3Rpb24gc2hvdWxkIGJlIGRlY29kZWQgYXMgYSBOT1AsIHdoaWNoIEkgdGhpbmsg
aXMNCnNpbXBsZXIgZm9yIHVzZXJzIHRvIHVuZGVyc3RhbmQuIE90aGVyd2lzZSB3ZSB3aWxsIGhh
dmUgY29kZSBvbiBDUFUxDQp0aGF0IHNldHMgYTAgdG8gMCwgd2hpY2ggdG8gbWUgc2VlbXMgbW9y
ZSBjb25mdXNpbmcuDQoNCkFsaXN0YWlyDQoNCj4gDQo+IFRoYW5rcywNCj4gSmVzc2UgVA0KPiDC
oD4gK8KgwqDCoCB9DQo+IMKgPiArDQo+IMKgPsKgwqDCoMKgwqAgLyogY29weSBpbiB0aGUgcmVz
ZXQgdmVjdG9yIGluIGxpdHRsZV9lbmRpYW4gYnl0ZSBvcmRlciAqLw0KPiDCoD7CoMKgwqDCoMKg
IGZvciAoaSA9IDA7IGkgPCBBUlJBWV9TSVpFKHJlc2V0X3ZlYyk7IGkrKykgew0KPiDCoD7CoMKg
wqDCoMKgwqDCoMKgwqAgcmVzZXRfdmVjW2ldID0gY3B1X3RvX2xlMzIocmVzZXRfdmVjW2ldKTsN
Cj4gwqA+IC0tDQo+IMKgPiAyLjM5LjANCg0K

