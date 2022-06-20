Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 002FD5515E9
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 12:33:32 +0200 (CEST)
Received: from localhost ([::1]:48932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3Eiq-0003hC-37
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 06:33:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1o3Eg6-00011b-7h
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 06:30:42 -0400
Received: from mga09.intel.com ([134.134.136.24]:41260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1o3Eg3-0001FF-D9
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 06:30:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655721039; x=1687257039;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kHdDe9YBH8yUWfqbD6bHnVL7px9wX0T7SwW1naPxcK8=;
 b=a/kkSnU5W6CPywRpMNz9ZFEfVvTisJr3fCnUipo1zt2ktR8ljxZBHuQf
 SQ4xjotG9oBNgDzmkDFr0mdL6/Ary9KXFJA+4O1kbvD1sgNI6IiCZ9DFy
 CqfzUwBoaMuHjtfiOQgkYVd2ie4zp4IkB2qLryDkqejFpksrB1XGDi92C
 f1H6uT1wTqZd8dcPkZpAwQFfJerRVHN54Yum0rEXESGQsd/WeM4YYfenM
 K1XZqiGMLsd+gO67MCEzGuZ55MKDIhwp6jygdUjsNFhmOO8ejad2IxqCo
 hsIBVVB1Q15rhPns61xeIztU186ph9xVBGoE08j0brpcuL8UPOL++C5yv g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="280590426"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="280590426"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2022 03:29:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="537620398"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by orsmga003.jf.intel.com with ESMTP; 20 Jun 2022 03:29:22 -0700
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 20 Jun 2022 03:29:21 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 20 Jun 2022 03:29:21 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 20 Jun 2022 03:29:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HYEuH/nN3lGZ/tIPkNlxqwDlB/KQqqnAS+jIYt5X21uz3VY5suPRybm41nRaJXMzvVEzVGs1SE46bat0lMOFz4jHXW2Kmw/SHCSFb+5g5A+4Ddyff4Wy8xDgcZ6cTjKrxBO0wgRQk1epSS6v53Ku0Yvsw1Rg4uUMEn51c2YeiDnTHoVd1homHgRwEjOKBnRrzQAWiJOZCi51NLMA3GB2ARb9WmKl/5wBwvfvzeqmFQY8ZSUjEeg6CWYOSFWP9i8NHUo1Nh6wXxnDDWu6H7t6QbBHa3exDblDKFZ836KzqgbchrXAv8ukXXdXgLbZIYGdD8IuKNO6bh7Y03s7SPowig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kHdDe9YBH8yUWfqbD6bHnVL7px9wX0T7SwW1naPxcK8=;
 b=ZwR1/zMNDFsJ5Ht0wQlB7FTGyF5tR8FV7UK+Ywf5Tckfs5kg3bJyGwAL3LK+/6FGhW29LPi0EuDNTz4v27C7PoIPdpfqYgW/9g/8Ad4DLRfGDWbYMIAUK+9mKqdfnZXbasy3/lxBRwci/tMh2MpDWS2CdVJU+uBfH14cp7HaP3abt5vmVc//HMxp66yPOV2n/S4tDQjSzzwMzFoqjdAojlTvJ4seXANRKgwzABYyL+LCc1xQap2yUV2QTsAOyGDwJdJxt03/lGuRDbxGRSr0VE6Grf7igVoWaRWxsn66wLmqiY7Hmgj1d0q86MzkB++ooqfi+RSSuH4+zjKrO9QkGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (10.164.205.37) by
 MWHPR11MB2063.namprd11.prod.outlook.com (10.169.236.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5353.16; Mon, 20 Jun 2022 10:29:14 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::5908:5bb0:c7c0:85d]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::5908:5bb0:c7c0:85d%7]) with mapi id 15.20.5332.023; Mon, 20 Jun 2022
 10:29:14 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Thomas Huth <thuth@redhat.com>, =?utf-8?B?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?=
 <berrange@redhat.com>
CC: Jason Wang <jasowang@redhat.com>, qemu-dev <qemu-devel@nongnu.org>, "Paolo
 Bonzini" <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 "Eric
 Blake" <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>, "Peter
 Maydell" <peter.maydell@linaro.org>, Laurent Vivier <lvivier@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>, Andrew Melnychenko
 <andrew@daynix.com>
Subject: RE: [RFC PATCH 01/12] configure: Add iovisor/ubpf project as a
 submodule for QEMU
Thread-Topic: [RFC PATCH 01/12] configure: Add iovisor/ubpf project as a
 submodule for QEMU
Thread-Index: AQHYgh8EJk95aDHPrke2v71SXRLplK1TPbyAgASPuXCAACkNgIAACbmAgAABQNCAAA7PgIAACtVA
Date: Mon, 20 Jun 2022 10:29:14 +0000
Message-ID: <MWHPR11MB00316977F6D2A6EBE8151A1B9BB09@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20220617073630.535914-1-chen.zhang@intel.com>
 <20220617073630.535914-2-chen.zhang@intel.com> <Yqw1wf+QjaBQ3I6M@redhat.com>
 <MWHPR11MB0031A589B82138F6E541B8BF9BB09@MWHPR11MB0031.namprd11.prod.outlook.com>
 <YrArvxwzVWQK4Hu8@redhat.com>
 <151603a7-7c5f-baa2-81b5-afb8aa30ff38@redhat.com>
 <MWHPR11MB0031AA06E7B46D66291F7E0A9BB09@MWHPR11MB0031.namprd11.prod.outlook.com>
 <c4835276-c0fb-a500-8f8b-326c269ba9f9@redhat.com>
In-Reply-To: <c4835276-c0fb-a500-8f8b-326c269ba9f9@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a9472dc1-382a-4477-caf0-08da52a7b907
x-ms-traffictypediagnostic: MWHPR11MB2063:EE_
x-microsoft-antispam-prvs: <MWHPR11MB2063638AB45C9303AEFBF90D9BB09@MWHPR11MB2063.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: S6rw8OHuMZjCZChd+b4zBxaTE1l9RcapuvuNzzBQO2RTcsmc/7Kvrfmut6BtslHN9rUnJcVc27Fvkxo1oF9sye8xSk5fz7cwcQGIHLixDXBfMEhw4QWcMpcPqRO32ePb3GU9I6YIkJ0IO8XqH2ld64zsWjtvE9g1cRN9egIIERWcNTokI6mF6jN0CTDlHPRI6stz9u5PSy5+EB3RKJXBLrv7mQEcGtW8o4zx2/ckmUAa1UNjf/b+0fphpBN7kr8FiP+T+zrJhoqOGwgQADRZWxUGVOfwiMrj9cAzMJSIVtmOsIv98UVQopkkTWO9cGy+Ls98rpK6t/riQyO3qQWx/8AmHdogLXvUSTAAdYyu5ecrJuyS2HBw5yPFsbXvRaW7lkxMIbaaairU42yOgM2gebEFUAB2x580+M13Mi204J7Em++z+QUjzRyi8V0QEARYwWe/4x2GAtIDmBE2c0fPvvW72AlQsktnlqcjf57l8VlIhrHLhuPSF6eyMYqYpIZYrUcjq+Cw9bYZy7SKsU67UUTTxDISmO8zJA8M38cFvcyuOI+Ut4TVCe+mZspX4/XGKx/GBFUHer6pXegze4mJpwCYDzTjCeAcrxkSvGj3VuXY7ocaE3CuT1f04DFWIFM0Ug8zf37F2M+7SaEGNqD/UAciR1nAkVz+lKXgYnuTcgg6V4bK++gGkT6MKWi0HHu/YzNq47KrVZ7NTmhlmAXIcAy8RDC+9o7tHjZ1N7XVEEAJI1ygpr+KWxiE8umekxKaqupU6wyLbempIF1208Vy5bwHsr5X6o3ZalleXlcel0Q=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(186003)(33656002)(8676002)(66574015)(9686003)(6506007)(26005)(71200400001)(7696005)(86362001)(83380400001)(82960400001)(53546011)(2906002)(122000001)(38070700005)(54906003)(110136005)(7416002)(76116006)(8936002)(38100700002)(66446008)(52536014)(5660300002)(4326008)(66946007)(66556008)(64756008)(498600001)(966005)(66476007)(55016003)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SjQzaUZLNzBmTTNYc01OTTlUTzc0VTQ1K1FNdmRWWm94UVVqSEtUV0Q4bVN5?=
 =?utf-8?B?YTcyUy93Tm8zNUhIZHlESytEcnRBQWhGUmdCOUpFQ0dpdW5kekpibCtVQlNo?=
 =?utf-8?B?L2VRQ2hkWjZyT1RVMGdmWnRrWU9mNDdKQU12RGhGbHpTQkhjZFo4dVFGVkZY?=
 =?utf-8?B?V1dPWDVkam02MXVZWlpESGFYc253ZEdBblN2cWYrb1llSjZrTndTSGRMNFRz?=
 =?utf-8?B?NGdrSmFPTTRtNDJEWk1ROFBoeDF0eUpaRHJoSWJBK1F2N1dYdnYwcytpNjB5?=
 =?utf-8?B?QWl6Z0Z4aDlBWW5QdXhQMzhFWjFuOE0rblJQL1Q4OWcyRGs3OWZaWERZUkly?=
 =?utf-8?B?S1BBSi9aTFBkVlRWOEY5dVdzd0dUMlpLQzJiaGhmc0dkSThYWWNsVmJQUFpY?=
 =?utf-8?B?cXpLbGE4c1IwRThpeXQ0ZXR4RGhBVzhpbGpLWWtWVGlVY2VOYXJ3Yjl3VURt?=
 =?utf-8?B?MHJDTXhHSjhkdlBGSzdRSUREeDRBWkRJWC9QM0NFUnFDUU5WbWYvdXQvR2xq?=
 =?utf-8?B?emQ4OWFwNWwxOCtaZVkybzl0Q1VFSWljSnBZL3dzczB1MEVhbHhkcDdyT0tk?=
 =?utf-8?B?OEsvL1hmTS82bURHZDNkQXowcmszTkdteEpnc1UyMGlVcVIwSTAyZzJIUlA1?=
 =?utf-8?B?cnFYZVFxZHlzSTBLaFRVZXRVUnhDaS9jaUlkc3UxbHJQeUhLWndKTU1hZWpO?=
 =?utf-8?B?OHFnZWhoa0ZOb1NubVJzeThxTzNzV0dpU3J5QUZRU0lMaXljd0ZDa0lxQ2FM?=
 =?utf-8?B?azdKM2V2aUpyVDk2TVdqQ3VpTzBlMFlOQ1YwY1Y5Z0MzcVYzMFNZbmpGeW84?=
 =?utf-8?B?VTVYUG13RU9NNXFUcXhsN3g2ZWQ0NG94bVc1NHIxMzVCVGR2UmdSNW93bDcz?=
 =?utf-8?B?b0dLaUlOdXMyb1BmN05laEFLQm9SanUraURoNlppSlRQK2NUL1F3ait3MHQx?=
 =?utf-8?B?c1lLb1F1NnlobHI5eTNpNVpDQlZHZWVudUNZSStXbkRteTZicExZRnM4Z2xi?=
 =?utf-8?B?bk95RkpZN3crdm80VnhTNWJMNFh2TG9TRUpkYXRjd1lZZFNaVk1IRWlsZDBs?=
 =?utf-8?B?aStWSW1FWjNwbnVNQWE5Wnl4VDlvbkk1TnlnUS9odmFncnZmQmJya0hTblo0?=
 =?utf-8?B?NHFhL1d2TmhlZFh5RTNvK2twUTBtN3JJY1YvUGkxcGFTWEd1TGhMa1FEbzlD?=
 =?utf-8?B?WVd6STVXSmovRzEwM1ovMjExK3NQQVdhb2h6d0Z2VGhYNmwxajV3dDhyd21q?=
 =?utf-8?B?a1N5dFNyQ0ZtZ3djUUsrQzNDVmo3OVZFOXlkZldWbFRPdXhCTUJaS0NtZm53?=
 =?utf-8?B?WE5RRThEZURhakFpdzAxeEJZb2daR25MZWs0a1Z0L3R3OEErYlE5b29ObjRQ?=
 =?utf-8?B?eWhWTGJ5UGdTYnZCQi9aenNnV1h1NWZBU2Irbk8zajJLYVBMRnNVdTUwdzFN?=
 =?utf-8?B?Qmd4VjV1M01hZ0YvVGVxdXp2YWk2YWcxeUIzM3VaVGJmYnNJWjZCN0xtVE00?=
 =?utf-8?B?alVRT3V4aTBVVG1zZHVjNm5jdzA5cVN1bURKYTBiZHAxTEpWQktNQ0ZNMGFQ?=
 =?utf-8?B?NlNCaUN1R3N5NEZkWUJuL3JNMEpmM21OMlNuaVhkRG42bXh2MU5DcGZtdHFp?=
 =?utf-8?B?MFB6ZzlmYllWdjk4bzR2eDU2akpaSW5DWE82eDZNZlpOdDEzRFlmSEd2MGdZ?=
 =?utf-8?B?YnNNS3FzZExLbVYvd0FjNjYyRFFiT2ZCc3h6R0Z3MVVWSGg0SUR3WE1ObnND?=
 =?utf-8?B?Z0p0VkNxVFdEUnU2am5vNk5yendscnVML2o3eDJHL1JGVTBoRU4wVm9JTVJK?=
 =?utf-8?B?bEdBenZKT0E4bE5tTWlHc1p1M09wR0NXRmhXdVdGeWFPSjd0SGdrVFdQcFNB?=
 =?utf-8?B?dmZFSGF4Z1RMbmo2Z3dmUE9qK3QvK0VINGlYc3ExTUNiUGtnd1I2dmZWcUYy?=
 =?utf-8?B?Rmt2SGtodTdVQ2xKRTZiVEs5VnhXaWlYNFBMYnErMkZVSzdOTFc4TVhzbTVO?=
 =?utf-8?B?c0lpa3JzQitKNlI1YVBBYjdzVktYMVpWMm8vNFZkQ0Y4bFRvSnlDb0d3NGE2?=
 =?utf-8?B?ZUhSbWYvMzZkclF3dnZ0dDBUQ1dmaEplZFEzUXE5am9wVjZSaFNMdHVrdVZV?=
 =?utf-8?B?VGlONUxHd0xzZUpuR0wyKzhLLytiQmpMeDdrUE1GczFNOFBGZ3k4N2g3dTl1?=
 =?utf-8?B?eVYyVHJYWUxvWjJqekxXUUs4ZStMNzdoMU5yeHpzQVM1UlhXVE9BNmhpOFdK?=
 =?utf-8?B?b2FEQmVZaGUyejhqbHhYdTVod0trRXp0U2MzT3M1cGpTYUJLeFR2MDArR3pV?=
 =?utf-8?B?OThnc1BjUTJleTI5OXJKNXlxV09VbWRheDY1cGNlU21lSEpLbytMZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9472dc1-382a-4477-caf0-08da52a7b907
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2022 10:29:14.3189 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m1Mq26O4W3B9XWd0IVYJnbFL9RRhvVdYvOQPxTFPqaO3B1gj/5kV18LTadSIQ/fwO/djivbbXs3I/0ExZV3XlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB2063
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.24; envelope-from=chen.zhang@intel.com;
 helo=mga09.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVGhvbWFzIEh1dGggPHRo
dXRoQHJlZGhhdC5jb20+DQo+IFNlbnQ6IE1vbmRheSwgSnVuZSAyMCwgMjAyMiA1OjQ0IFBNDQo+
IFRvOiBaaGFuZywgQ2hlbiA8Y2hlbi56aGFuZ0BpbnRlbC5jb20+OyBEYW5pZWwgUC4gQmVycmFu
Z8OpDQo+IDxiZXJyYW5nZUByZWRoYXQuY29tPg0KPiBDYzogSmFzb24gV2FuZyA8amFzb3dhbmdA
cmVkaGF0LmNvbT47IHFlbXUtZGV2IDxxZW11LQ0KPiBkZXZlbEBub25nbnUub3JnPjsgUGFvbG8g
Qm9uemluaSA8cGJvbnppbmlAcmVkaGF0LmNvbT47IEVkdWFyZG8NCj4gSGFia29zdCA8ZWR1YXJk
b0BoYWJrb3N0Lm5ldD47IEVyaWMgQmxha2UgPGVibGFrZUByZWRoYXQuY29tPjsgTWFya3VzDQo+
IEFybWJydXN0ZXIgPGFybWJydUByZWRoYXQuY29tPjsgUGV0ZXIgTWF5ZGVsbA0KPiA8cGV0ZXIu
bWF5ZGVsbEBsaW5hcm8ub3JnPjsgTGF1cmVudCBWaXZpZXIgPGx2aXZpZXJAcmVkaGF0LmNvbT47
IFl1cmkNCj4gQmVuZGl0b3ZpY2ggPHl1cmkuYmVuZGl0b3ZpY2hAZGF5bml4LmNvbT47IEFuZHJl
dyBNZWxueWNoZW5rbw0KPiA8YW5kcmV3QGRheW5peC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUkZD
IFBBVENIIDAxLzEyXSBjb25maWd1cmU6IEFkZCBpb3Zpc29yL3VicGYgcHJvamVjdCBhcyBhDQo+
IHN1Ym1vZHVsZSBmb3IgUUVNVQ0KPiANCj4gT24gMjAvMDYvMjAyMiAxMS4yOSwgWmhhbmcsIENo
ZW4gd3JvdGU6DQo+ID4NCj4gPg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+
PiBGcm9tOiBUaG9tYXMgSHV0aCA8dGh1dGhAcmVkaGF0LmNvbT4NCj4gPj4gU2VudDogTW9uZGF5
LCBKdW5lIDIwLCAyMDIyIDQ6NDcgUE0NCj4gPj4gVG86IERhbmllbCBQLiBCZXJyYW5nw6kgPGJl
cnJhbmdlQHJlZGhhdC5jb20+OyBaaGFuZywgQ2hlbg0KPiA+PiA8Y2hlbi56aGFuZ0BpbnRlbC5j
b20+DQo+ID4+IENjOiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPjsgcWVtdS1kZXYg
PHFlbXUtDQo+ID4+IGRldmVsQG5vbmdudS5vcmc+OyBQYW9sbyBCb256aW5pIDxwYm9uemluaUBy
ZWRoYXQuY29tPjsgRWR1YXJkbw0KPiA+PiBIYWJrb3N0IDxlZHVhcmRvQGhhYmtvc3QubmV0Pjsg
RXJpYyBCbGFrZSA8ZWJsYWtlQHJlZGhhdC5jb20+Ow0KPiBNYXJrdXMNCj4gPj4gQXJtYnJ1c3Rl
ciA8YXJtYnJ1QHJlZGhhdC5jb20+OyBQZXRlciBNYXlkZWxsDQo+ID4+IDxwZXRlci5tYXlkZWxs
QGxpbmFyby5vcmc+OyBMYXVyZW50IFZpdmllciA8bHZpdmllckByZWRoYXQuY29tPjsgWXVyaQ0K
PiA+PiBCZW5kaXRvdmljaCA8eXVyaS5iZW5kaXRvdmljaEBkYXluaXguY29tPjsgQW5kcmV3IE1l
bG55Y2hlbmtvDQo+ID4+IDxhbmRyZXdAZGF5bml4LmNvbT4NCj4gPj4gU3ViamVjdDogUmU6IFtS
RkMgUEFUQ0ggMDEvMTJdIGNvbmZpZ3VyZTogQWRkIGlvdmlzb3IvdWJwZiBwcm9qZWN0IGFzDQo+
ID4+IGEgc3VibW9kdWxlIGZvciBRRU1VDQo+ID4+DQo+ID4+IE9uIDIwLzA2LzIwMjIgMTAuMTEs
IERhbmllbCBQLiBCZXJyYW5nw6kgd3JvdGU6DQo+ID4+PiBPbiBNb24sIEp1biAyMCwgMjAyMiBh
dCAwNTo1OTowNkFNICswMDAwLCBaaGFuZywgQ2hlbiB3cm90ZToNCj4gPj4+Pg0KPiA+Pj4+DQo+
ID4+Pj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+Pj4+IEZyb206IERhbmllbCBQ
LiBCZXJyYW5nw6kgPGJlcnJhbmdlQHJlZGhhdC5jb20+DQo+ID4+Pj4+IFNlbnQ6IEZyaWRheSwg
SnVuZSAxNywgMjAyMiA0OjA1IFBNDQo+ID4+Pj4+IFRvOiBaaGFuZywgQ2hlbiA8Y2hlbi56aGFu
Z0BpbnRlbC5jb20+DQo+ID4+Pj4+IENjOiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29t
PjsgcWVtdS1kZXYgPHFlbXUtDQo+ID4+Pj4+IGRldmVsQG5vbmdudS5vcmc+OyBQYW9sbyBCb256
aW5pIDxwYm9uemluaUByZWRoYXQuY29tPjsgRWR1YXJkbw0KPiA+Pj4+PiBIYWJrb3N0IDxlZHVh
cmRvQGhhYmtvc3QubmV0PjsgRXJpYyBCbGFrZSA8ZWJsYWtlQHJlZGhhdC5jb20+Ow0KPiA+Pj4+
PiBNYXJrdXMgQXJtYnJ1c3RlciA8YXJtYnJ1QHJlZGhhdC5jb20+OyBQZXRlciBNYXlkZWxsDQo+
ID4+Pj4+IDxwZXRlci5tYXlkZWxsQGxpbmFyby5vcmc+OyBUaG9tYXMgSHV0aCA8dGh1dGhAcmVk
aGF0LmNvbT47DQo+ID4+IExhdXJlbnQNCj4gPj4+Pj4gVml2aWVyIDxsdml2aWVyQHJlZGhhdC5j
b20+OyBZdXJpIEJlbmRpdG92aWNoDQo+ID4+Pj4+IDx5dXJpLmJlbmRpdG92aWNoQGRheW5peC5j
b20+OyBBbmRyZXcgTWVsbnljaGVua28NCj4gPj4+Pj4gPGFuZHJld0BkYXluaXguY29tPg0KPiA+
Pj4+PiBTdWJqZWN0OiBSZTogW1JGQyBQQVRDSCAwMS8xMl0gY29uZmlndXJlOiBBZGQgaW92aXNv
ci91YnBmIHByb2plY3QNCj4gPj4+Pj4gYXMgYSBzdWJtb2R1bGUgZm9yIFFFTVUNCj4gPj4+Pj4N
Cj4gPj4+Pj4gT24gRnJpLCBKdW4gMTcsIDIwMjIgYXQgMDM6MzY6MTlQTSArMDgwMCwgWmhhbmcg
Q2hlbiB3cm90ZToNCj4gPj4+Pj4+IE1ha2UgaW92aXNvci91YnBmIHByb2plY3QgYmUgYSBnaXQg
c3VibW9kdWxlIGZvciBRRU1VLg0KPiA+Pj4+Pj4gSXQgd2lsbCBhdXRvIGNsb25lIHVicGYgcHJv
amVjdCB3aGVuIGNvbmZpZ3VyZSBRRU1VLg0KPiA+Pj4+Pg0KPiA+Pj4+PiBJIGRvbid0IHRoaW5r
IHdlIG5lZWQgdG9kbyB0aGlzLiBBcyBpdCBpcyBicmFuZCBuZXcgZnVuY3Rpb25hbGl0eQ0KPiA+
Pj4+PiB3ZSBkb24ndCBoYXZlIGFueSBiYWNrIGNvbXBhdCBpc3N1ZXMuIFdlIHNob3VsZCBqdXN0
IGV4cGVjdCB0aGUNCj4gPj4+Pj4gZGlzdHJvcyB0byBzaGlwIHVicGYgaWYgdGhleSB3YW50IHRo
ZWlyIFFFTVUgYnVpbGRzIHRvIHRha2UgYWR2YW50YWdlDQo+IG9mIGl0Lg0KPiA+Pj4+Pg0KPiA+
Pj4+DQo+ID4+Pj4gWWVzLCBhZ3JlZS4gSXQncyB0aGUgYmVzdCB3YXkgdG8gdXNlIHRoZSB1QlBG
IHByb2plY3QuDQo+ID4+Pj4gQnV0IGN1cnJlbnQgc3RhdHVzIGlzIGRpc3Ryb3ModWJ1bnR1LCBS
SEVMLi4uKSBkb2VzIG5vdCBzaGlwIHRoZQ0KPiA+Pj4+IGlvdmlzb3IvdWJwZiBsaWtlIHRoZSBp
b3Zpc29yL2JjYy4gU28gSSBoYXZlIHRvIGRvIGl0Lg0KPiA+Pj4+IE9yIGRvIHlvdSBoYXZlIGFu
eSBiZXR0ZXIgc3VnZ2VzdGlvbnM/DQo+ID4+Pg0KPiA+Pj4gSWYgZGlzdHJvcyB3YW50IHRvIHN1
cHBvcnQgdGhlIGZ1bmN0aW9uYWxpdHksIHRoZXkgY2FuIGFkZCBwYWNrYWdlcw0KPiA+Pj4gZm9y
IGl0IElNSE8uDQo+ID4+DQo+ID4+IFllcywgbGV0J3MgcGxlYXNlIGF2b2lkIG5ldyBzdWJtb2R1
bGVzLiBTdWJtb2R1bGVzIGNhbiBzb21ldGltZXMgYmUgYQ0KPiA+PiByZWFsIFBJVEEgKGUuZy4g
aWYgeW91IGZvcmdldCB0byB1cGRhdGUgYmVmb3JlIHJzeW5jJ2luZyB5b3VyIGNvZGUgdG8NCj4g
Pj4gYSBtYWNoaW5lIHRoYXQgaGFzIGxpbWl0ZWQgaW50ZXJuZXQgYWNjZXNzKSwgYW5kIGlmIHVz
ZXJzIGluc3RhbGwNCj4gPj4gUUVNVSBmcm9tIHNvdXJjZXMsIHRoZXkgY2FuIGFsc28gaW5zdGFs
bCB1YnBmIGZyb20gc291cmNlcywgdG9vLg0KPiA+PiBBbmQgaWYgZGlzdHJvcyB3YW50IHRvIHN1
cHBvcnQgdGhpcyBmZWF0dXJlLCB0aGV5IGNhbiBwYWNrYWdlIHVicGYgb24NCj4gPj4gdGhlaXIg
b3duLCBhcyBEYW5pZWwgc2FpZC4NCj4gPg0KPiA+IEhpIERhbmllbCBhbmQgVGhvbWFzLA0KPiA+
DQo+ID4gSSBkb24ndCBrbm93IG11Y2ggdGhlIGJhY2tncm91bmQgaGlzdG9yeSBvZiBRRU1VIHN1
Ym1vZHVsZXMsIGJ1dA0KPiBtZXNvbg0KPiA+IGJ1aWxkIGlzIGEgc3VibW9kdWxlIGZvciBRRU1V
IHRvby4gSXQgbWVhbnMgdXNlciBjYW4ndCBpbnN0YWxsIFFFTVUNCj4gPiBmcm9tIHNvdXJjZXMg
d2l0aCBsaW1pdGVkIGludGVybmV0IGFjY2Vzcy4NCj4gDQo+IFRoZXJlIGlzIG5vIHdyaXR0ZW4g
cG9saWN5LCBidXQgSSB0aGluayB0aGUgZ2VuZXJhbCBjb25zZW5zdXMgaXMgdGhhdCB3ZSBvbmx5
DQo+IHNoaXAgY29kZSBpbiBzdWJtb2R1bGVzIGlmOg0KPiANCj4gMSkgSXQncyBub3QgYXZhaWxh
YmxlIGluIGEgcmVxdWlyZWQgdmVyc2lvbiBpbiBkaXN0cm9zIHlldA0KPiANCj4gYW5kDQo+IA0K
PiAyKSBpdCBpcyBlc3NlbnRpYWxseSByZXF1aXJlZCB0byBidWlsZCBRRU1VIChsaWtlIG1lc29u
KSBvciBpZiB0aGUgZmVhdHVyZSBoYXMNCj4gYmVlbiBwYXJ0IG9mIHRoZSBRRU1VIHNvdXJjZXMg
YmVmb3JlIGFuZCB0aGVuIG1vdmVkIHRvIGEgc2VwYXJhdGUNCj4gcmVwb3NpdG9yeSAobGlrZSBz
bGlycCkuDQo+IA0KPiBXZSBzaGlwIG1lc29uIGFzIGEgc3VibW9kdWxlIHNpbmNlIHdlIHJlcXVp
cmUgc29tZSBtZXNvbiBmZWF0dXJlcyB0aGF0DQo+IGFyZSBub3QgYXZhaWxhYmxlIHdpdGggdGhl
IG1lc29uIHZlcnNpb25zIGluIHRoZSBkaXN0cm9zIHlldC4gT25jZSB0aGUgZGlzdHJvcw0KPiBj
YXRjaCB1cCwgd2UnbGwgbGlrZWx5IHJlbW92ZSB0aGUgbWVzb24gc3VibW9kdWxlIGZyb20gUUVN
VS4NCj4gDQo+ID4gQW5kIGJhY2sgdG8gRGFuaWVsJ3MgY29tbWVudHMsICBZZXMsIHRoZSBiZXN0
IHdheSBpcyBkaXN0cm9zIGFkZCB0aGUNCj4gPiB1YnBmIHBhY2thZ2VzLCBCdXQgbWF5YmUgaXQn
cyB0b28gbGF0ZSB0byBpbXBsZW1lbnQgbmV3IGZlYXR1cmVzIGZvcg0KPiA+IHVzLiBXZSBjYW4g
aW50cm9kdWNlIHRoZSBzdWJtb2R1bGUgbm93IGFuZCBhdXRvIGNoYW5nZSB0byB0aGUgZGlzdHJv
cydzDQo+IGxpYiB3aGVuIGRpc3Ryb3MgYWRkIGl0LiAgRm9yIGV4YW1wbGUgUUVNVSdzIHN1Ym1v
ZHVsZSBTTElSUCBkbyBpdCBpbiB0aGUNCj4gc2FtZSB3YXkuDQo+IA0KPiBzbGlycCB1c2VkIHRv
IGJlIHBhcnQgb2YgdGhlIFFFTVUgcmVwb3NpdG9yeSwgYnV0IHRoZW4gaGFzIGJlZW4gbW92ZWQg
dG8gYQ0KPiBzZXBhcmF0ZSBwcm9qZWN0IGEgd2hpbGUgYWdvLiBIb3dldmVyLCBhdCB0aGF0IHBv
aW50IGluIHRpbWUgdGhlcmUgd2VyZW4ndA0KPiBhbnkgcGFja2FnZXMgaW5zIGRpc3Ryb3MgeWV0
LCBzbyB3ZSBoYWQgdG8gaW5jbHVkZSBpdCBhcyBhIHN1Ym1vZHVsZS4NCj4gDQo+IE5vdyB0aGF0
IHRoZSBkaXN0cm9zIHNoaXAgaXQsIHRvbywgd2UncmUgcGxhbm5pbmcgdG8gcmVtb3ZlIHRoZSBz
bGlycA0KPiBzdWJtb2R1bGUgZnJvbSBRRU1VIHNvb24sIHNlZToNCj4gDQo+ICAgaHR0cHM6Ly9s
aXN0cy5nbnUub3JnL2FyY2hpdmUvaHRtbC9xZW11LWRldmVsLzIwMjItMDQvbXNnMDA5NzQuaHRt
bA0KPiANCj4gPiBJdCBtYWtlIHVzZXIgZXhwZXJpZW5jZSB0aGUgbGF0ZXN0IHRlY2hub2xvZ3kg
d2l0aCBubyBvdGhlcg0KPiA+IGRlcGVuZGVuY2llcy4NCj4gDQo+IFdlbGwsIHRoYXQncyBvbmx5
IHRydWUgaWYgd2UgdXBkYXRlIHRoZSBzdWJtb2R1bGUgaW4gUUVNVSByZWd1bGFybHkuIElmIHdl
DQo+IGZvcmdldCB0byB1cGRhdGUsIHdlIGNvdWxkIGVhc2lseSBtaXNzIHNvbWUgaW1wb3J0YW50
IChtYXliZSBldmVuIHNlY3VyaXR5DQo+IHJlbGF0ZWQpIGZpeGVzIGZyb20gdGhlIHVwc3RyZWFt
IHByb2plY3RzLiBUaGlzIGNhbiBiZSBhIG5pZ2h0bWFyZSBmb3IgZGlzdHJvcywNCj4gd2hlbiB0
aGV5IHRoZW4gaGF2ZSB0byBnbyBhcm91bmQgYW5kIGxvb2sgaW50byBlYWNoIGFuZCBldmVyeSBw
cm9qZWN0cw0KPiB3aGV0aGVyIHRoZXkgZW1iZWQgYSBjZXJ0YWluIGNvZGUgbW9kdWxlIHRoYXQg
bmVlZHMgYSBDVkUgZml4LiBJdCdzIGJldHRlcg0KPiBpZiBpdCBjYW4gYmUgZml4ZWQgaW4gb25l
IGNlbnRyYWwgc3BvdCBpbnN0ZWFkLg0KPiANCj4gPiB1QlBGIGluZnJhc3RydWN0dXJlIGhhdmUg
dGhlIGFiaWxpdHkgdG8gZXh0ZW5kIHRoZSBjYXBhYmlsaXRpZXMNCj4gPiB3aXRob3V0IHJlcXVp
cmluZyBjaGFuZ2luZyBzb3VyY2UgY29kZS4gSWYgd2Ugbm90IGFsbG93IGl0LCB3ZSBoYXZlIHRv
DQo+ID4gcmUtaW1wbGVtZW50IGFsbCB0aGUgZUJQRiBhc3NlbWJsZXIsIGRpc2Fzc2VtYmxlciwg
aW50ZXJwcmV0ZXIsIGFuZCBKSVQNCj4gY29tcGlsZXIgbGlrZSBEUERLIHVzZXJzcGFjZSBlQlBG
IHN1cHBvcnQgKERQREsgY2FuJ3QgdXNlIHVicGYgcHJvamVjdCBieQ0KPiBsaWNlbnNlIGlzc3Vl
KS4NCj4gDQo+IE5vdCBzdXJlIHdoZXRoZXIgSSB1bmRlcnN0b29kIHRoYXQgc3RhdGVtZW50IHJp
Z2h0IC4uLiBub2JvZHkgc2FpZCB0aGF0DQo+IFFFTVUgc2hvdWxkIG5vdCBhbGxvdyBpdCAtIHdl
IGp1c3Qgc3VnZ2VzdGVkIHRvIHJlbHkgb24gYSBzeXN0ZW0gaW5zdGFsbGF0aW9uDQo+IG9mIHVi
cGYgaW5zdGVhZCBvZiBlbWJlZGRpbmcgdGhlIGNvZGUuIE9yIGlzIHRoYXQgbm90IHBvc3NpYmxl
Pz8gKEkgZG9uJ3QNCj4ga25vdyB0aGF0IHByb2plY3QgeWV0IC0gaXNuJ3QgaXQgcG9zc2libGUg
dG8gY29tcGlsZSBpdCBhcyBhIHNoYXJlZCBsaWJyYXJ5PykNCg0KVGhhbmtzIGZvciB5b3VyIGRl
dGFpbHMgZXhwbGFuYXRpb24uDQpJdCBsb29rcyBiZXR0ZXIgdG8gaW50cm9kdWNlIHRoZSB1QlBG
IHNoYXJlZCBsaWJyYXJ5IGZvciBRRU1VLg0KRm9yIGV4YW1wbGU6DQouL2NvbmZpZ3VyZSAtLXVi
cGYtbGliPXBhdGgNCg0KSWYgeWVzLCBJIHRoaW5rIGl0J3MgZmluZSBmb3IgbWUuDQoNClRoYW5r
cw0KQ2hlbg0KDQo+IA0KPiAgIFRob21hcw0KDQo=

