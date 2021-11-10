Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 793F144BA5A
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 03:33:40 +0100 (CET)
Received: from localhost ([::1]:59584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkdQh-00020O-4v
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 21:33:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mkdPD-0001Ip-1A
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 21:32:07 -0500
Received: from mga14.intel.com ([192.55.52.115]:17600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mkdP9-0007V2-NN
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 21:32:06 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10163"; a="232827241"
X-IronPort-AV: E=Sophos;i="5.87,222,1631602800"; d="scan'208";a="232827241"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2021 18:31:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,222,1631602800"; d="scan'208";a="500982739"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by fmsmga007.fm.intel.com with ESMTP; 09 Nov 2021 18:31:26 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 9 Nov 2021 18:31:26 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 9 Nov 2021 18:31:25 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Tue, 9 Nov 2021 18:31:25 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Tue, 9 Nov 2021 18:31:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F/QnR81lr6xns28Hf0R4co/ka22hWbL3Lu8j/6eM9MIqljzGQcfO78FhXCrgcQSVMaDDVfNXWA25vgkm1Zkel7OKYmT3lco3YLU7LEJQqxOFyoikd+A9ZrJH7AM/vvCF/m6LCWHuhg+QOxAfwq859gdT1Ivq8Z6AXAB84SbDc4B4QaxJhJHBZFxcA8A7amBfGZQ/hEdeXB2n9Re7zSUaskAdUJlBoANeD1K7df1+8fkoe5XcwLdwGpQMImL9+Lqh+3N1V+Dayu1ulnVHU2F0wtaTQYE/4yfcNKRd8HQuSv7FjIkwTey2aVySs0XAyw4ecbRMJdpXv8YRkCa8rL9cLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nVeQ78SZvDm5Z0OeO9Infnyi6z1LM5WYrpig8vlywj4=;
 b=Y0B5lsNKJIccbMxz5WA1V98yY+3Z7QQjVpQXSkJQkr7Sl5uHNqx5BUDDGiYuWb46mX+3Ht0uL1Ek7Ru6g4qKojHeXSwB2Rl93D5sP5Sd+wC8YtdEyo5S5eExsANyKkeqAlcaEKz/M6Qc9l0y1XScZax75GtP8K/37jU3hyooKH5qyWg6gdjvWPBOoARqCFRIRASfFurgaePhIOACfwmxtuuZhbTKe/Ul8cK1eu3uevZWm5CkqXmdc0AmZBmFaV4cSYLv2kSdoCu0nZziBwSt2cWykKNzEgMDmdo33qHwRXhH6MmF6yN2UQE7o0WiIImZyiDSenu21Evlge8RlXuSGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nVeQ78SZvDm5Z0OeO9Infnyi6z1LM5WYrpig8vlywj4=;
 b=pZFBg0r/8NGIpe9Ys9ZtAG6/eDkuQpmg01vZ0uBQnPYAD4xWupDk67j9d5uRK7l+ZsJ3GVZguebi7BLIjHhCsLs3IjJoshxsSnHOiJ9ptqUN0VZQKMQ3wPdWjCqzTeI46p17MqdJhLhjj+gfbFezu7sw45zv+MBBVKD4YhKXfnk=
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by CO1PR11MB5041.namprd11.prod.outlook.com (2603:10b6:303:90::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.15; Wed, 10 Nov
 2021 02:31:25 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::3827:2f36:f344:e814]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::3827:2f36:f344:e814%3]) with mapi id 15.20.4669.016; Wed, 10 Nov 2021
 02:31:24 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>
Subject: RE: [PATCH V5 1/3] net/filter: Optimize transfer protocol for
 filter-mirror/redirector
Thread-Topic: [PATCH V5 1/3] net/filter: Optimize transfer protocol for
 filter-mirror/redirector
Thread-Index: AQHXy9x7gE+VGPrLuEuUpJeh4vPmyavpTZSAgABPWuCABHFUgIAAMzPwgAShnTCAAWxkAIAAAISAgAAMYICAABYMEIAANIUAgAACC2CABFOtAIAAAGiwgAHVFICAAAg10IABQRgg
Date: Wed, 10 Nov 2021 02:31:23 +0000
Message-ID: <MWHPR11MB003109ADF1EF0F29E5A163289B939@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20211028090556.3168043-1-chen.zhang@intel.com>
 <20211028090556.3168043-2-chen.zhang@intel.com>
 <c603b048-1cee-1396-811d-8be857aa932b@redhat.com>
 <MWHPR11MB0031A0311824C3DF060B64E39B879@MWHPR11MB0031.namprd11.prod.outlook.com>
 <CACGkMEsjn0nz4N+O4s9Y0m0gEYXu9WKstP9LHE4F=m5mOR3dcA@mail.gmail.com>
 <MWHPR11MB00315CFF0E7854146B5C9AE69B8A9@MWHPR11MB0031.namprd11.prod.outlook.com>
 <MWHPR11MB0031B626425E7815EB78A9E49B8D9@MWHPR11MB0031.namprd11.prod.outlook.com>
 <94f96089-f8a8-d3d4-18c3-26917952fc14@redhat.com>
 <DM5PR11MB00276DF408F0DBC3C6EFADB89B8E9@DM5PR11MB0027.namprd11.prod.outlook.com>
 <CACGkMEvuXhuzSiTebOQqvriD5UnaiPzaY37AOR8bihTC4FTa4Q@mail.gmail.com>
 <DM5PR11MB002701BF07DCC15BF968A1749B8E9@DM5PR11MB0027.namprd11.prod.outlook.com>
 <CACGkMEs5q4E3yK_ZjUQsvJ=Ojd6hmTVEwQeh1N0QDPNaPoM7Dw@mail.gmail.com>
 <MWHPR11MB0031EBF5ACACF7455EA9F4779B8E9@MWHPR11MB0031.namprd11.prod.outlook.com>
 <CACGkMEsLF6VUDNgnUngrE4LePkM8pFe3fYrPd2W6O8RUpcprNQ@mail.gmail.com>
 <MWHPR11MB00315078A1A7329E96FAA8F79B919@MWHPR11MB0031.namprd11.prod.outlook.com>
 <CACGkMEsu-1ENupe8xMyKNNpbNjt1aGr5Unr_-4xDwx7OiA0ttQ@mail.gmail.com>
 <MWHPR11MB0031DA3889B2E94DDF5948229B929@MWHPR11MB0031.namprd11.prod.outlook.com>
In-Reply-To: <MWHPR11MB0031DA3889B2E94DDF5948229B929@MWHPR11MB0031.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.200.16
dlp-reaction: no-action
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: addd4e01-2eac-48a0-a472-08d9a3f230b9
x-ms-traffictypediagnostic: CO1PR11MB5041:
x-microsoft-antispam-prvs: <CO1PR11MB50411F5F42F3357F9E0952459B939@CO1PR11MB5041.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GESodXbD+O5FTEJ3S7gpu7+aCK8RuLOts7MyS38yhNdjYY7OamZa0gNWqPJjatbpoWxfr7LrHbbiwzIGwlaS3yVMt3/OF/n3yw2Lm9glxY2XMDTruXvTLbPGUtVYPgcN3bQ7IrTpkIdwUepfGZRDeoCYDI7HSDnWWogLLlW1F/MoNM5FFknthMATmCKTNHZrpYAZ7OzH3uJhoNayix5Y+PBaib6k9gej1WEh+ZZID5A15UpeMIaCQeR9A0D2J1+eFS4TNYRzqFOCQRn1MUotd7ftjtou8mXQ17mgnuleb7LF6/aMN4SIkE+YyzPtheN05rDqJs8Im/465WkreVtCLPOPXENbo2L/g7utnNwLdNv9j/Hw7isi1HgHcHXUO0/PAB83Cu3sXKJKKTuo9tz7XUcd4QHcb1uZrYIlu2KINhKucuAOs+Tt449yS9iyIhC47z+neD2d8OKN1izDAVNt31UnoH2iXxNXWYtF9jyf8ncAw3a1ScqVyq5N5dEPEZxsM41RUCZ7bOxOLUwF+0N3JxfOtaD2rUi7TxHYl48ZozoYsdXq+GmZQCHBTMzCzhXXhBXo+bT9BB980Ld1ceFYEqggnwtA7VTwOuvkdbCaRQgKkKUW55JNbF0ON7L0ON/CfiqpYmanJjpeEye701XSy79VOktL7Y3YeKubijS+rcNAnIOD9d37cgQXhAAKDA2o2/YFWjABULb94i/NkU09+w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(122000001)(508600001)(33656002)(38100700002)(82960400001)(52536014)(2906002)(55016002)(9686003)(6506007)(71200400001)(8676002)(4326008)(66476007)(8936002)(5660300002)(86362001)(66946007)(316002)(186003)(76116006)(7696005)(66446008)(54906003)(38070700005)(64756008)(26005)(66556008)(6916009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dExkQzhkYzFjRW5Ma3l4TkQxNHVqSWl0QTBubnN1clQ3djlkNjJLUEcxR09w?=
 =?utf-8?B?ZndVM0lUN3diWUNvcnZWeWFNYVd1UVl6U1NMdHoxaGJoT0R0N2x5VkpkdlBJ?=
 =?utf-8?B?cVdFWUNxeEk1V1FvUlk3V1h2M0xOajVQR2thcGcyUlZLelJFRXNvU1JEbEM5?=
 =?utf-8?B?NUp3TDBPZ1NxeXRKQm1MNTFqb3pacStUM1RBSnprNG5TNTJPNGFYMmxKRXk2?=
 =?utf-8?B?aWxQczNuSjEwK0M4SE1wZFVqUm5remp5ZmREeDBMdStKMUJiTUttNUM5cVNz?=
 =?utf-8?B?RUcyeUk0WFYxQk5mZkF5ZktpaVNXdWRHVlRVUUZ0djBscHArQ1lKVXNnSVYv?=
 =?utf-8?B?eE5DRmVlRGpKeHIvWGJMTTRPbHpaY0daVnoySk9maUhIMW5TWnV6RHBsTHJ3?=
 =?utf-8?B?VHNlVDA2SjVaaU1QQzVJaS9JUDBsQnU4QUVqd2xjWWVRZzZyUjY5djBxckRY?=
 =?utf-8?B?Z3RRREVNQk1BVmwyREJLeDlLMVgzUUl4L2RNdGxGRm52T29sdktuWTFvcGRr?=
 =?utf-8?B?c0JGOXhFSVlYYjFhb2M4NGROaExQNkNIQ3loeEVKeDJNeEF6Z3V2cHZhQk5o?=
 =?utf-8?B?MU5JNnpoM2h3aFI5MC9SOVFjZ1QvVjNYYno3RVhYMkpGb25VSVRkTFEvTXZv?=
 =?utf-8?B?U3kyWUt5L2JKczdIcmRybE5jbWx4Qnp6NzFoZGQ5czBmQmtxQllrK2g1S1NE?=
 =?utf-8?B?UWdwRncwYS9Oa3F1UWNTY1lmaTI3SVlWV1NSeStjMjhpekVxTFl5WWhJZExF?=
 =?utf-8?B?ZUR4UG1WZDhna2VqVjJ0c1ZNQWxYZVJYOE14aWplUjVraXBIVUs5TWllV0NX?=
 =?utf-8?B?ZG9rdEFnVmphZVMzdUtBMXpkeGI5Z0tpNnVZUC85aHRBeXdFd3dFYnZldUxR?=
 =?utf-8?B?alQ1THY1WVMyM042ditYcmJVNk83cm12SEFnRXNSbVl6Wk8yaEV1ZE5HVC9l?=
 =?utf-8?B?OGI2eVpLN3lMaFBwSUN1T1FmL3hhbXowR3BkU1N1NStaWmV3UzBFNWpoRHhz?=
 =?utf-8?B?cTJzQXY5VzFaZC8xeTFTbFpsY3AvV2dMRXF3WS92T3lJSXZVV0h1ay9DUWVu?=
 =?utf-8?B?ZVJ1WElMeFNKTlVidUJyUXhRZ2c0QmhJdWJWZ0Z5VE9YTktockZLdC9wWGdG?=
 =?utf-8?B?ZjAra2VNWEZ5R254TlI2eW50MnlKczFPUkwveU1vVXgyeTZUcS9CWFBsNzhp?=
 =?utf-8?B?SHZIbEE2ZG8vNHdVYjNNeFVQQzFxOHp2RFRsMHl1ZEtZOWU5clJXeDZwMUtK?=
 =?utf-8?B?UVYwSlV5cFk5amlGb21tblUrTDFTMXVtVnFYZUZWNGIwZTVPVXVXdjB2QVJu?=
 =?utf-8?B?MDRETVB0VUEwd3lGWnJzS0xYMWwzYXlDSkNGV1V0MFZ6eDA0MU9YaDd0K1E4?=
 =?utf-8?B?M2xTRVJhMmU0ZmlNTjdJYng1SVVpZnlOT09neWhVTU1TajhUblB4VC9rM1ZJ?=
 =?utf-8?B?RHlxYWp4Q3dHc2xZdmtjay8zWDFUOEczbFBaY1BSaVhDSGJ5aHA3NVRaVlIr?=
 =?utf-8?B?ajV4bHdtMHk0TjdqUGZkOVdWcUcwcDMrS1lvZEFrVjQxQkJRSjY5bGRRMU93?=
 =?utf-8?B?bWRwTXljdkN4OWV6UG0zT0hHRTlhWitEMjVJVW03NzZtRlNjVDhzdHl0S0Zo?=
 =?utf-8?B?WHRsQXhVT3RVdGVZaEY5TkMxWFJTejk2RWozTTlMY0xhVHFtaWV6ZVY0b3Ro?=
 =?utf-8?B?YmZzcHNUNXB4N1poczE5TTJ4bXZsZE9FRWI0U280NUtONWNtei94Wi91UWla?=
 =?utf-8?B?emxOdjhxSE52akNzeWt4ZjBxZHpOYjFnTDE0eXQwZXgrWkU4V25iOWJ6UFVx?=
 =?utf-8?B?VTh1UllJaXd0dm5La25DTkY0QzU4S2ptcGpiUWFUSnlXUlFHVzdqZUM4RlZt?=
 =?utf-8?B?dCtoTEkzSjI3QlB2eEowRDBCQ3RZN3o5WHcvWlhWNDN5Zm4xQStBL2ZtSzVF?=
 =?utf-8?B?RDNoSmR3ZlIrT3FMUk9aRGY3RmpEcnlCb1Nvd3BkZ2Q1OTFZVjcxVWM2dDNX?=
 =?utf-8?B?Sy9SaFV6QjBaT0NUVFNJbmhKc3dHeFFodVBjSkQ3WDZKclkvUm1TWkhQWkhE?=
 =?utf-8?B?QkdHSFg2RFZRU0FOZWI5WXBsVzB5QjNyUkVRZVlYdUwxb1diNE5Ba3FqV0dI?=
 =?utf-8?B?Z3k1akhPQndoaUlJYmwrUGM5aDIrWWFkOXY5d1ZpcnhQa3U1bnp3MFFGNjc2?=
 =?utf-8?Q?27jWD3U/YUR1lsBYA0TkZ6Q=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: addd4e01-2eac-48a0-a472-08d9a3f230b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2021 02:31:24.3702 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ITwpeqJF6S6Rx/dbxfRQRQSQjVyPx+vfSlVXIuE38OU00O5eRm7Y/YDurs1JTPMsyvH834sBft1Od3kEgolgWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5041
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.115; envelope-from=chen.zhang@intel.com;
 helo=mga14.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Cc: Markus Armbruster <armbru@redhat.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, qemu-dev <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IElmIHdlIGNhbiBkbyB0aGF0LCBpc24ndCBpdCBtdWNo
IG1vcmUgc2ltcGxlciB0byBtYWtlDQo+ID4gPiA+ID4gPiB2bmV0X2hkcl9zdXBwb3J0IGJ5IGRl
ZmF1bHQ/DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBZZXMsIEZvciBjb21wYXRpYmlsaXR5IGZpbHRl
cnMgYW5kIENPTE8gc3RpbGwgd29yayB3aXRoIHRoZQ0KPiA+ID4gPiA+IG9yaWdpbmFsDQo+ID4g
PiA+ICJ2bmV0X2hkcl9zdXBwb3J0Ii4NCj4gPiA+ID4gPiBGb3IgbmV3IHVzZXJzLCB0aGV5IGNh
biBlbmFibGUgdGhlIG5ldyAiYXV0b192bmV0X2hkciIgdG8gYXZvaWQNCj4gPiA+ID4gPiBzb21l
DQo+ID4gPiA+IGlzc3Vlcy4NCj4gPiA+ID4NCj4gPiA+ID4gUXVlc3Rpb24gc3RpbGwsIHNvIHdl
IGhhdmUNCj4gPiA+ID4NCj4gPiA+ID4gMSkgZW5hYmxlIHZuZXRfaGRyX3N1cHBvcnQgYnkgZGVm
YXVsdA0KPiA+ID4gPiAyKSBhZGQgYXV0b192bmV0X2hkciBhbmQgZW5hYmxlIGl0IGJ5IGRlZmF1
bHQNCj4gPiA+ID4NCj4gPiA+ID4gVXNpbmcgMSkgc2VlbXMgbXVjaCBtb3JlIHNpbXBsZXIgYW5k
IGNhbiBzb2x2ZSB0aGlzIGlzc3VlLiBJZiB3ZQ0KPiA+ID4gPiBkZXBlbmRzIG9uIHRoZSBkZWZh
dWx0IGJlaGF2aW91ciwgaXQgc2hvdWxkIGJlIGFsbW9zdCB0aGUgc2FtZS4gSWYNCj4gPiA+ID4g
d2Ugd2FudCB0byB0ZWFjaCB0aGUgbWdtdCwgYm90aCBzaG91bGQgd29yay4gQW55IG90aGVyIGFk
dmFudGFnZXMNCj4gPiA+ID4gb2YNCj4gPiAyKT8NCj4gPiA+DQo+ID4gPiBVc2luZyAxKSB3ZSBj
YW4ndCBlbnN1cmUgdXNlciBjb25maWd1cmUgcGFydHMgb2YgbW9kdWxlIGJ5IGl0c2VsZi4NCj4g
PiAodm5ldF9oZHJfc3VwcG9ydCA9IG9mZikuDQo+ID4gPiBJbiB0aGlzIGNhc2UsIGZpbHRlciBk
YXRhIGFscmVhZHkgd3JvbmcgYW5kIHRoZSBmaWx0ZXJzIGNhbid0IHJlcG9ydA0KPiA+ID4gYW55
DQo+ID4gdHJhbnNmZXIgZXJyb3IgaGVyZS4NCj4gPg0KPiA+IFNvIEkgdGhpbmsgdGhlIHBvaW50
IGlzIHdlIGNhbid0IGVuc3VyZSB0aGUgdXNlciBjb25maWd1cmUgcGFydHMgb2YNCj4gPiBtb2R1
bGUgaW4gYW55IGNhc2UgZXZlbiBpZiBhdXRvX3ZuZXRfaGRyIGlzIGludHJvZHVjZWQuIEUuZyB1
c2VyIGNhbg0KPiA+IGNob29zZSB0byBkaXNhYmxlIGl0IG1hbnVhbGx5LiBUaGF0J3Mgd2h5IEkg
dGhpbmsgaXQgc2hvdWxkIG5vdCBkaWZmZXINCj4gPiB0b28gbXVjaCBmcm9tIG1ha2luZyB2bmV0
X2hkcl9zdXBwb3J0IGVuYWJsZWQgYnkgZGVmYXVsdC4NCj4gDQoNClJldGhpbmsgYWJvdXQgaXQu
IFVzaW5nIDEpIG1ha2UgdGhpbmdzIG11Y2ggbW9yZSBzaW1wbGVyIGV4Y2VwdCB0aGUgdXNlciBj
b25maWcgaXQgbWFudWFsbHkuDQpJIHdpbGwgZm9sbG93IHlvdXIgY29tbWVudHMgbWFrZSBWNiB0
byAxKS4NCg0KVGhhbmtzDQpDaGVuDQoNCj4gDQoNCg==

