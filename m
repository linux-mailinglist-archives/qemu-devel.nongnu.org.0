Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3691B520811
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 00:56:51 +0200 (CEST)
Received: from localhost ([::1]:50108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noCJ7-0006Dl-PC
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 18:56:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1noCHo-0005DP-8L; Mon, 09 May 2022 18:55:28 -0400
Received: from esa8.fujitsucc.c3s2.iphmx.com ([68.232.159.88]:7019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1noCHl-00048N-Sf; Mon, 09 May 2022 18:55:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1652136926; x=1683672926;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JOTIDU/iJFv0Yerbq5X5Te0L/k3MjvIVKLTOk6foT7A=;
 b=XCVenAKw2qKEpvaWmjnI+72JZxFoXMe/FxRhC/FCInabNVnoNg2wBFmz
 9blGSfkUokjffI6FDC8Q9H2k/ahnp8XHjNTwfbC00LnKCOAJeZVnuLksU
 ujcVW3c/x/ycNNZeV/AO12BmEFQrUTymPmqniLQybQcum1HbnAjX4Qgac
 UEKIT3AEmG1IPPNF4cac71dcEEhY9KZJ5jsE/KotcUeA420ToWU0fr82j
 nmL7idXcpS6VKzBZKxVmtUF0hYsLmaP5X0HRhdJ0bN6RUlmvEJLls3GhK
 8Z9hjIVZGf3uUGgkTVDfTsaUwWJtTle5eIKgoHcw1BrdoiGoQdxJyFOAQ Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="55397887"
X-IronPort-AV: E=Sophos;i="5.91,212,1647270000"; d="scan'208";a="55397887"
Received: from mail-os0jpn01lp2107.outbound.protection.outlook.com (HELO
 JPN01-OS0-obe.outbound.protection.outlook.com) ([104.47.23.107])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 07:55:20 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=THyzKI1Yu7N7mB1nyre95K0p2GJaqdWhYbNswQK99Lad1OO5S8DCe9Yeiqt2TQs6DM+S2slSquAEPyzgGUZFTt5FUArN4W+h1yfWe+0vWF9EjubnKoyhR5tYuUJcB9aX1GICtSw2ZToUV/JEBO2NR2b+kvSz/rCzcNGvbpdF3VdKVhijNVbFHcPFH25En+8PjRzBaUqR6eHMkhXxgpQ2HuYhVt9GOlLLACdCE2MYATMwyYwpVL/S25DLFiuhDYFEUVKafjOnF8Y1WI0ZHaz4kKrXA3xwP8M1DR7qyoRey70QPazWZTRgeJtbIV2MJ/K3b2B9jqiFgzSZRJbcZkVKpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JOTIDU/iJFv0Yerbq5X5Te0L/k3MjvIVKLTOk6foT7A=;
 b=YmsSeaeFCH9tkMIXFBY9sWPZzft1K5mTVg9dOCxur4ruxw5Rwk8EQY6Ggx9kP1E9HzYqwo/ztdrWbRJr9Lvw5eZ6ibO+kBI081OXTzOJ2mL96B0NiLPdiS6M1n+dToUGvs1lSelR3idAxGOvye7g/XamDozZf1yiVf8dOj75fk1ruLxwY0gGoZi0q9uGYQZC0r3BzcJk7co6VyLZlZy3xlcbxgmF/mxRprESo1fKnL8N+re6+r4NYVSomuraNAqPvai8/5XMBUimtwdHh/NZWfmYqxV30Mtxu8MldvIE7HaXppIlTDq0K4oYp8trsADiOJyFzJnlqDzjL2c0L3RzKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JOTIDU/iJFv0Yerbq5X5Te0L/k3MjvIVKLTOk6foT7A=;
 b=PFW8ZbZo8/ipXRt5YdKnywGrq6vESitGNkhtjat3bsG05j/SK1eGghEJH0GDUimbPXqUjddFGQxjgNoRzom7CYnzjRQkDvLLkMo+gEZ9ll6b7IZwKdngzNH/o4t8N0A0SF9v5qw4bg6XaHF2j95YpR3h2G3HIonj1QVbTkgKdbk=
Received: from TYCPR01MB6160.jpnprd01.prod.outlook.com (2603:1096:400:4f::8)
 by TYWPR01MB8725.jpnprd01.prod.outlook.com (2603:1096:400:167::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23; Mon, 9 May
 2022 22:55:16 +0000
Received: from TYCPR01MB6160.jpnprd01.prod.outlook.com
 ([fe80::3dd7:93e7:e5e6:24b9]) by TYCPR01MB6160.jpnprd01.prod.outlook.com
 ([fe80::3dd7:93e7:e5e6:24b9%7]) with mapi id 15.20.5227.023; Mon, 9 May 2022
 22:55:16 +0000
From: "ishii.shuuichir@fujitsu.com" <ishii.shuuichir@fujitsu.com>
To: 'Peter Maydell' <peter.maydell@linaro.org>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: Itaru Kitayama <itaru.kitayama@gmail.com>, "ishii.shuuichir@fujitsu.com"
 <ishii.shuuichir@fujitsu.com>
Subject: RE: [PATCH 4/5] hw/intc/arm_gicv3: Use correct number of priority
 bits for the CPU
Thread-Topic: [PATCH 4/5] hw/intc/arm_gicv3: Use correct number of priority
 bits for the CPU
Thread-Index: AQHYYWcpIvxCWN1O6U2eaQA+60CRe60V9AMw
Date: Mon, 9 May 2022 22:55:16 +0000
Message-ID: <TYCPR01MB6160896C1CCE56DEDD44393DE9C69@TYCPR01MB6160.jpnprd01.prod.outlook.com>
References: <20220506162129.2896966-1-peter.maydell@linaro.org>
 <20220506162129.2896966-5-peter.maydell@linaro.org>
 <CAFEAcA8bT_LzFTuuciWOUEVnozpOqySrpr1pkZ76MGEk4NK2RA@mail.gmail.com>
In-Reply-To: <CAFEAcA8bT_LzFTuuciWOUEVnozpOqySrpr1pkZ76MGEk4NK2RA@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7e330c16-563b-432b-1255-08da320efbd5
x-ms-traffictypediagnostic: TYWPR01MB8725:EE_
x-microsoft-antispam-prvs: <TYWPR01MB87259441AE36CCFBD143CF12E9C69@TYWPR01MB8725.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Pfz8OrUz/EtmsdTwrVvVlPI3zRkNZxIAuV00XEbKnl6HHerVlVpxb5+48eSmvInhtddz9zO4TzWD5qLEF5kYOJLw0OsU5lcRtT3uOLSxTpeIEYP8/dQfLpax7H5TS0JSCBD66klHcroxMqVWKf3W8JwMNE/E10c2Ts2Y4bdDYZshxorVHpkpWfvLF/0ugH/WNoEhhUfWBP5KkHkokBxi+EpI9bothGNdDS+5d5fIxTF0twGICIR4Qrw15mZFpkpQ9CD+ibGuHHkz2msEcuhA+xSTaI043X1tsyYSpxWnvVFZJydKowvdlbIDdyfJLrcaTuT6Vz1SasrrsPRNLy/flCz2xg78n4/d+coqUO/PrSVLKr1+IBb6ahBLMq5RXry+S9xcEH3VPMxEubqgnBDPeUV/cX4UC11a+A0lVZPGB42sZeoCrxcoTAWJbd5im87IaM9cARHYPOXT0oE84rsVPDTo+/Bk8nWR7Pfq2y1lHaIQwq7QAbukmU/5fjMLjzME3XBsn6Eyk0r6oxeNulYobOBPybHaIh7sFSXLkEhGNVlltXH83ehWRGENJWVfay8bCk3kK5h93bXi5fS8TZ7zgkjZxCdo1SFdSMwR24aOzDzL7QbbaJK0yA+qLquAiKQYZCf9BKO/9ariztgwSxKD2WnTgaCiDKPuk8Q4dm5f3BsMRdxIP7eFamrap9NXpLhWyr8jNxtn7i+sYyowOCTYwQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6160.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(82960400001)(38100700002)(71200400001)(508600001)(9686003)(38070700005)(86362001)(8936002)(5660300002)(122000001)(53546011)(6506007)(316002)(66946007)(66446008)(76116006)(66476007)(64756008)(66556008)(54906003)(8676002)(4326008)(52536014)(7696005)(110136005)(33656002)(83380400001)(186003)(55016003)(85182001)(2906002)(26005)(107886003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cS8vLzFOaVB2UW5WYmVUK1hydURzR3pYVjUvcldJT3VaaXZnbWRyMGh4b0ZU?=
 =?utf-8?B?Ykp5bkgyL0txc2NxalNJUUVsRG9DeUR4MkNzTVR5VFhjWUc5YUROdTN0VGtQ?=
 =?utf-8?B?QTA0YTFTQkNrOWdyOHMrZVFiQ3BGd09FdU5mQjU2aXo3VzFzd3hpZ1dKQjY1?=
 =?utf-8?B?aElEd0ZjcWFub0ZZOHR3cmNKLzk1NUVKRnA5MzdHL2dhU1BPVVFCQVNlWVdx?=
 =?utf-8?B?Wm5xVkdxVWxmeU9uZkdnaEZBT0RRZVhhcDU1WUUwVVlHZlJvQzZzRlNQSzFC?=
 =?utf-8?B?c2pNZzVDYWo1N0VhT0NXaU9zSHJkOVZIZGk2VHY4TngzdHdOeG54VDVybkxw?=
 =?utf-8?B?dytaWkhsWWZJaE1xUzJWakkyRG1XR21xYVVSZ21KUkZWN051M0ZLLzZzWE9W?=
 =?utf-8?B?UlVyOEtLaTdvUWdETlNaRnNieHpxOTFnZEhvYXh4V0J2bnl1a0VDU3FlSUNY?=
 =?utf-8?B?Z0Rucm0ra1RtTE9lcWp3VTRLUURDM214UzhxY3ROYVJxakxKSjZLNCt5YWp4?=
 =?utf-8?B?YldxZzVsVFowVTUvNThGQU14RU5xaC9lSFoyeDJtVmpkd3RQVE5yNXNQR0pW?=
 =?utf-8?B?NkpIcXJuOHRqbU9jbmlMbm9mOXcyRDd2ZHJQRlVRNFFMRVB2UmlzOTVibW53?=
 =?utf-8?B?ZEhqbzU3cHBsdVN5SHdxM29ZNExvNFFXeklmYStlbzlvcEVWMXB1VllUb0w3?=
 =?utf-8?B?dEFuUW1KdjU3bjVSQm5qb1NOME9RQjZId200QTNlRndwSTlvcGpsSmNLdTg2?=
 =?utf-8?B?eDZMbDIyZWpmL25MOEZQRDdjbnpFV3hXaDVPcnRCcWZMaGljS1BsSk4ra0Q2?=
 =?utf-8?B?LzRUMHZSUitVekhwSUtSTkt5NWtnam11Ukg0ZGd6OHZ1czlSNXpyZU1BdHp4?=
 =?utf-8?B?VUVhYlBSekgwVmRFdzZWMXJSR2E5d1V3UHpnSUx2bEJYdlREYWU0UFBRNDBM?=
 =?utf-8?B?cWk5MUJPTXJMR3lNbEwxMk1PLzlzRUlrQVpscE1VM2sveHJ0NnR2alRBZkRU?=
 =?utf-8?B?K1NLMjgrQ0lFdjZhWGhDMDkvbU9pSlV3TThrb2hIREttaE5IWjg3dVZHajJj?=
 =?utf-8?B?WGZiallZd1ArSjREM1JXT1FSazZYTzN6VmhjTFFvTnFEbGVSU2hLbG15ZXBV?=
 =?utf-8?B?L3R5SSsvUUVISTBWMXRxY1RLZDNnZ0tZc1NDcUVyZ1lDYndYT05TZWg4c1h0?=
 =?utf-8?B?VVRkcTlsTFRsbWYzYTRQekJxTUNFYURwT0hubW5TN2VXRkhzUFczMXZmSmp1?=
 =?utf-8?B?ZENEOXBESDhTNG51aTZNdGR2N2ZOeXo4bFg3VCtwTGhDUkN1Rm50N3BLcG5x?=
 =?utf-8?B?ZXJBdWQyQkh5YzlFTFV0emNiUFlyOEJpTnJBVlZQNkVGTVdyU0RPZkRQaUFK?=
 =?utf-8?B?L0FmdEttTjVXbFNuMSsyRis0RXlHdUoyTS80czEvcUZvRldOTTJYRERoQ0Z3?=
 =?utf-8?B?TUdLZE9mdmF2ZG80L1M4elVjK1lhWmJvV21tS0hFVUt2MHZjVE5xRkpJL01t?=
 =?utf-8?B?WWNyOXkycVhuS1d3cmI2RVptVW9WcEdsalFaTFhDbDNYOGlyOStnT2U5cnQ1?=
 =?utf-8?B?RWpnM2NzTWxKV3dmQjVoOWYzQ1pmN3lhMHBxU1VzL25Hd3JPU2QxMUpVcjVK?=
 =?utf-8?B?RUxJby8xajVNd1JGUHl0dG9UYS8zTjhMbkFJM20zNnZ4TnRibDRTVmVEbWJU?=
 =?utf-8?B?L2E3ZDJhWjJiZGdSMzU3aGVvZXdyYWhoeGpscHZRa2drL2FzNTNtSVJxZ1pt?=
 =?utf-8?B?S0NpSnBQMk5JYXhSdXhmbU13c3AyRjdJanhHS2JXWFd0dW41N3B2VGpHckdT?=
 =?utf-8?B?Q1ZRZlVDTDdEZk12OFY2eGlVMkRQVzN1RGxuUlpONHc2M3BzcUZ1TldOS0sx?=
 =?utf-8?B?QzhhSXpzbC9ER1o1RWcyZmw2SW9pcmtjTXRmRmlPK20wOW5uWW5jalJiY2JW?=
 =?utf-8?B?UEtJR1VZcFNqdE44Y21nenF4RHZPaE5YbWxab3ZOVmM3MGp2VDdRTE8xNmo1?=
 =?utf-8?B?ak9HY2JaeWVDNjBQYmRVTnRDaHh2c1IvVjdrb3ZMbzJ3NVA1VEtPODNhcGky?=
 =?utf-8?B?ZkV4VWc2cDRoVUdaSVF0bGYyL0VoUHF0bkFBTEJ5SHNqVjlNY0NDeDZVZFlZ?=
 =?utf-8?B?MTdkMllQeWlQVjJZZ3VDVE56UXJ4L1MxNkc1QXpUQ2NTMmpLVzdBZUlsQStU?=
 =?utf-8?B?V3NScmdMT0doNzZ4MUZrRGlERkNUVmd5Mzh3Y3k2VFVySnRHVmJyRXhhQTA3?=
 =?utf-8?B?dE9NaUhVZXM4OEN3ZEtMTHNVUmUzcWRyTEZvVFdqSDdIWFp2Z2lURjJ1eCs0?=
 =?utf-8?B?NFRieXNBYk92VnErM014NWZXb2gxWXEzMlhUeWgvSHNJOFJHODlGOTNMeEFT?=
 =?utf-8?Q?gYHNGaNMrorRgwkE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6160.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e330c16-563b-432b-1255-08da320efbd5
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2022 22:55:16.2010 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kihSVE55q6bxWNbfzl6ZRI4yWbV9T9pJWeu2H5Wn1kmxgzPxpKtGuZlctUTyum6fIFqTlYEuIZPbwgYl7g50q1K9hR6B18NUT7kXcXaysDU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8725
Received-SPF: pass client-ip=68.232.159.88;
 envelope-from=ishii.shuuichir@fujitsu.com; helo=esa8.fujitsucc.c3s2.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

SGksIFBldGVyLg0KDQo+IFNodXVpY2hpcm91LCBJdGFydTogZG8gZWl0aGVyIG9mIHlvdSBrbm93
IHRoZSByaWdodCBzZXR0aW5nIGZvciB0aGUgQTY0RlggZm9yIHRoaXM/IElmDQo+IHlvdSBjYW4g
ZmluZCB3aGF0IHRoZSBoYXJkd2FyZSB2YWx1ZSBvZiB0aGUgSUNDX0NUTFJfRUwzIG9yIElDQ19D
VExSX0VMMQ0KPiByZWdpc3RlciBpcyAobW9yZSBzcGVjaWZpY2FsbHksIHRoZSBQUklCaXRzIHN1
YmZpZWxkKSB0aGF0IHNob3VsZCBiZSBlbm91Z2ggdG8gdGVsbA0KPiB1cy4NCg0KVGhlIHZhbHVl
IG9mIHRoZSBQUkliaXRzIGZpZWxkIGluIHRoZSBBNjRGWCBpcyAweDQuDQpUaGVyZWZvcmUsIHRo
ZSBmb2xsb3dpbmcgdmFsdWVzIGlzIGZpbmUuDQoNCj4gPiArICAgIGNwdS0+Z2ljX3ByaWJpdHMg
PSA1Ow0KDQpCZXN0IHJlZ2FyZHMsDQpTaHV1aWNoaXJvdS4NCg0KUC5TLg0KSXRhcnUsIHRoYW5r
IHlvdSBmb3IgdGhlIGZvbGxvdy11cC4NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiBGcm9tOiBQZXRlciBNYXlkZWxsIDxwZXRlci5tYXlkZWxsQGxpbmFyby5vcmc+DQo+IFNlbnQ6
IFNhdHVyZGF5LCBNYXkgNywgMjAyMiAxOjM0IEFNDQo+IFRvOiBxZW11LWFybUBub25nbnUub3Jn
OyBxZW11LWRldmVsQG5vbmdudS5vcmcNCj4gQ2M6IElzaGlpLCBTaHV1aWNoaXJvdS/nn7PkupUg
5ZGo5LiA6YOOIDxpc2hpaS5zaHV1aWNoaXJAZnVqaXRzdS5jb20+OyBJdGFydSBLaXRheWFtYQ0K
PiA8aXRhcnUua2l0YXlhbWFAZ21haWwuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDQvNV0g
aHcvaW50Yy9hcm1fZ2ljdjM6IFVzZSBjb3JyZWN0IG51bWJlciBvZiBwcmlvcml0eSBiaXRzDQo+
IGZvciB0aGUgQ1BVDQo+IA0KPiBPbiBGcmksIDYgTWF5IDIwMjIgYXQgMTc6MjEsIFBldGVyIE1h
eWRlbGwgPHBldGVyLm1heWRlbGxAbGluYXJvLm9yZz4gd3JvdGU6DQo+ID4NCj4gPiBNYWtlIHRo
ZSBHSUN2MyBzZXQgaXRzIG51bWJlciBvZiBiaXRzIG9mIHBoeXNpY2FsIHByaW9yaXR5IGZyb20g
dGhlDQo+ID4gaW1wbGVtZW50YXRpb24tc3BlY2lmaWMgdmFsdWUgcHJvdmlkZWQgaW4gdGhlIENQ
VSBzdGF0ZSBzdHJ1Y3QsIGluIHRoZQ0KPiA+IHNhbWUgd2F5IHdlIGFscmVhZHkgZG8gZm9yIHZp
cnR1YWwgcHJpb3JpdHkgYml0cy4gIEJlY2F1c2UgdGhpcyB3b3VsZA0KPiA+IGJlIGEgbWlncmF0
aW9uIGNvbXBhdGliaWxpdHkgYnJlYWssIHdlIHByb3ZpZGUgYSBwcm9wZXJ0eQ0KPiA+IGZvcmNl
LTgtYml0LXByaW8gd2hpY2ggaXMgZW5hYmxlZCBmb3IgNy4wIGFuZCBlYXJsaWVyIHZlcnNpb25l
ZCBib2FyZA0KPiA+IG1vZGVscyB0byByZXRhaW4gdGhlIGxlZ2FjeSAiYWx3YXlzIHVzZSA4IGJp
dHMiIGJlaGF2aW91ci4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFBldGVyIE1heWRlbGwgPHBl
dGVyLm1heWRlbGxAbGluYXJvLm9yZz4NCj4gPiAtLS0NCj4gPiBJIGhhdmUgZ3Vlc3NlZCBhdCB0
aGUgcmlnaHQgdmFsdWUgZm9yIHRoZSBBNjRGWCwgYnV0IGlmIHdlIGNhbiBmaW5kDQo+ID4gdGhl
IGNvcnJlY3QgSUNDX0NUTFJfRUwxIHZhbHVlIHRoYXQgd291bGQgYmUgYmV0dGVyLg0KPiANCj4g
U2h1dWljaGlyb3UsIEl0YXJ1OiBkbyBlaXRoZXIgb2YgeW91IGtub3cgdGhlIHJpZ2h0IHNldHRp
bmcgZm9yIHRoZSBBNjRGWCBmb3IgdGhpcz8gSWYNCj4geW91IGNhbiBmaW5kIHdoYXQgdGhlIGhh
cmR3YXJlIHZhbHVlIG9mIHRoZSBJQ0NfQ1RMUl9FTDMgb3IgSUNDX0NUTFJfRUwxDQo+IHJlZ2lz
dGVyIGlzIChtb3JlIHNwZWNpZmljYWxseSwgdGhlIFBSSUJpdHMgc3ViZmllbGQpIHRoYXQgc2hv
dWxkIGJlIGVub3VnaCB0byB0ZWxsDQo+IHVzLg0KPiANCj4gPiBAQCAtOTYxLDYgKzk2NCwxMiBA
QCBzdGF0aWMgdm9pZCBhYXJjaDY0X2E2NGZ4X2luaXRmbihPYmplY3QgKm9iaikNCj4gPiAgICAg
IGNwdS0+Z2ljX251bV9scnMgPSA0Ow0KPiA+ICAgICAgY3B1LT5naWNfdnByaWJpdHMgPSA1Ow0K
PiA+ICAgICAgY3B1LT5naWNfdnByZWJpdHMgPSA1Ow0KPiA+ICsgICAgLyoNCj4gPiArICAgICAq
IFRPRE86IFdoYXQgZG9lcyB0aGUgcmVhbCBBNjRGWCBHSUN2MyBwcm92aWRlID8NCj4gPiArICAg
ICAqIFRoaXMgaXMgYSBndWVzcyBiYXNlZCBvbiB3aGF0IG90aGVyIEFybSBDUFVzIGRvOyB0byBm
aW5kIHRoZSBjb3JyZWN0DQo+ID4gKyAgICAgKiBhbnN3ZXIgd2UgbmVlZCB0aGUgdmFsdWUgb2Yg
dGhlIEE2NEZYJ3MgSUNDX0NUTFJfRUwxIHJlZ2lzdGVyLg0KPiA+ICsgICAgICovDQo+ID4gKyAg
ICBjcHUtPmdpY19wcmliaXRzID0gNTsNCj4gPg0KPiA+ICAgICAgLyogU3VwcHBvcnQgb2YgQTY0
RlgncyB2ZWN0b3IgbGVuZ3RoIGFyZSAxMjgsMjU2IGFuZCA1MTJiaXQgb25seSAqLw0KPiA+ICAg
ICAgYWFyY2g2NF9hZGRfc3ZlX3Byb3BlcnRpZXMob2JqKTsNCj4gPiAtLQ0KPiA+IDIuMjUuMQ0K
PiANCj4gdGhhbmtzDQo+IC0tIFBNTQ0K

