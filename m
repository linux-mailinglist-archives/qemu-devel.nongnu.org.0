Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3A943C35C
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 08:56:00 +0200 (CEST)
Received: from localhost ([::1]:56190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfcqt-0000gC-Gl
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 02:55:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mfclc-0003vx-BC
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 02:50:34 -0400
Received: from mga17.intel.com ([192.55.52.151]:30796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mfclY-0008HG-GF
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 02:50:31 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10149"; a="210868431"
X-IronPort-AV: E=Sophos;i="5.87,186,1631602800"; d="scan'208";a="210868431"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 23:50:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,186,1631602800"; d="scan'208";a="537416433"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP; 26 Oct 2021 23:50:25 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 26 Oct 2021 23:50:25 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 26 Oct 2021 23:50:25 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Tue, 26 Oct 2021 23:50:25 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.49) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Tue, 26 Oct 2021 23:50:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=csdg+E4Ycc0/ihUUtsyyAjdg3ZTl+Nyc0tHwLwrWnOvbIRc8BPvKpOrTtkrEb2vr1usDCVx3uF5KzwPNjofYKCOVTh5ziGAdiQg4nLnTeXfVBrHjBfWKe+JIN4+TV2E+aevc3NHdZwkDPixsgiuz5jqwE+nGAMLdv8gHGOZen28TXvoyKP+6H1DMTfkluSwX7SisXN3wGvBFzXBQk/LESCYNTRtmpV0T3SR8jmg5UGFdbZ5/xXsRPe97WDUqD6Is1sP8q/Npy3jgKwupcU69C+IG7PuplNWa/jjjH2PKr1ER6v/K7Kjpbi26VzMnRmRrTWHvV5Pekbg7I/GEjty9CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4bIrSKgX0lZaFDX0riAcg4jcbDSh13RLJ7gFma0zer0=;
 b=EsJr23M+WB5X4qn/39pvibHj6Qm/An8OfG2lEzE+t/6jtI0LpAd333pVpW0jlaGnVUIvVaYwohvnNQ4igPRMNnDmgViUoMbKfeEYzJ8ZXlKSdmjuCgCNeoZ14wkgTum7uXbA5y7lyxMNtTt8/MEm8qDz+yy8IlyQ4oP6liGk17nAc7nZkZqZHCLSIkR3kYVVYngJqkv32fe+ED/2PTts4f8BR9mmJlIi1jtZI3YcKA+KSE+ZH+VS5EbPqiuoaE7PqNBOAusBlmkE25n85VeXGwHnO65Q4XJ5vJfsThgQHHoRvJj4fU81UA7Mhl9UKUlBkdAO93Q+HyOPhwD1HP/w6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4bIrSKgX0lZaFDX0riAcg4jcbDSh13RLJ7gFma0zer0=;
 b=PliGdGbbWiUOPhC970YGLKqOCNe4RusDkhrlq7CzpIZYaeEkKLfKKwsJcZE1vScLygdknN/bRT7RhAawaH01pab6awtxIpKUn1EcKy++pf8M8yPas0FwNsIGb+15FXoE9ZGvSp+sstiG3OmxTIaulvUBeWbycBsJtoXm2e6RTEU=
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by MWHPR11MB1997.namprd11.prod.outlook.com (2603:10b6:300:2a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Wed, 27 Oct
 2021 06:50:23 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::359f:549e:18bf:fa8b]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::359f:549e:18bf:fa8b%4]) with mapi id 15.20.4649.014; Wed, 27 Oct 2021
 06:50:23 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>
Subject: RE: [PATCH V4 1/3] net/filter: Remove vnet_hdr from filter-mirror and
 filter-redirector
Thread-Topic: [PATCH V4 1/3] net/filter: Remove vnet_hdr from filter-mirror
 and filter-redirector
Thread-Index: AQHXypcSY+VezyZ8uk2tgxJJmOPSWKvmRcYAgAAJBdCAABKVgIAAAJXAgAAFUQCAAACgkA==
Date: Wed, 27 Oct 2021 06:50:23 +0000
Message-ID: <MWHPR11MB00312DCF0710007DA371604A9B859@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20211026181730.3102184-1-chen.zhang@intel.com>
 <20211026181730.3102184-2-chen.zhang@intel.com>
 <8948cdd0-7f4c-9b77-a02f-582b4fe96adf@redhat.com>
 <MWHPR11MB0031AA6B818E9BBE4B1D78589B859@MWHPR11MB0031.namprd11.prod.outlook.com>
 <fbdf6a0d-739f-9949-abf1-35b7ed1a29da@redhat.com>
 <MWHPR11MB003173BB1E208D240823E8D39B859@MWHPR11MB0031.namprd11.prod.outlook.com>
 <CACGkMEvQ638LTT-YsLmGNONDCiBJFJ9JOVrDTeH_ktLp6D7gbg@mail.gmail.com>
In-Reply-To: <CACGkMEvQ638LTT-YsLmGNONDCiBJFJ9JOVrDTeH_ktLp6D7gbg@mail.gmail.com>
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
x-ms-office365-filtering-correlation-id: f3c47c8c-693e-41e8-e4ce-08d999160d0b
x-ms-traffictypediagnostic: MWHPR11MB1997:
x-microsoft-antispam-prvs: <MWHPR11MB1997ED9B75529C36E3D5C95D9B859@MWHPR11MB1997.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uwHoe7Zw1qnYM7vJD+54qSGiOKULSOCH+2/uGOEXxvlXzY/l2iTozeYGrrULowGsdGr9N/uY41gRFIkT8cgKaWZZcyTPKZ4GS2tpuhJodMb1J8EXEJl9nU24BAOGYrRtlwglB7clfqdoZKL/w67Jzil6xEDFTT8IqQ5oMU3ftvZBBvKKSkEdSH1me3gohOGD+wBWcHd6YYj/3uRGGO2NGYTboTc11nkNV7yufVjT9/5wV57H2Kc/QDdHYunQ7GsejI1aUTgDRSWxbS7WWVeQkDCrsZWVprowXyZd7mnp4Hn1F6IvVgX4ydq+Jquy+H2EIkySw3AszEac6Y+OGeh0rNzYWqlO9Kn3AEwkqYTWZCMQMADC44QcEWrBImqzs3E7O70SeNrgU5B2sQ0J9dgkcmC8N69hKM9DcHOVemHV0W02TUcgaWFIuYm3cV1BB422mR2c/ER8UMw7VAyTkcLQQIaqLW40eFRxfflC6UOoWyWXnOi4w58s/cuZtxbQ4T/PknZFS9jxgjqWG5D8L5fJay9U6iLADMc5ZDXGsk22L5YM4UjnsJNSXbtLtnMl/zRaqbEWqa3Og5nwmGoaBvxw3OJmWIRqhRtD5/TF0wVjwlVgG1L6YpC/rTq83ZRFSRXON48+IUBNmVA1G7SiFszczhNlQnOuIV8uQG8bv6y6RlRV9ODvV5GBSqCSOMkWtl16MzEjS1gi9sWIME8mx+ozJA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(64756008)(38070700005)(33656002)(82960400001)(76116006)(66446008)(83380400001)(5660300002)(26005)(7696005)(186003)(316002)(4326008)(71200400001)(66476007)(66556008)(6916009)(55016002)(54906003)(8936002)(66946007)(8676002)(9686003)(86362001)(53546011)(6506007)(52536014)(38100700002)(508600001)(122000001)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K2hrZXRFVE9FczdrZHB5SHVoOFVjMXZHUERUSGh2MFI5SFp6YWFibWxqQVpq?=
 =?utf-8?B?eitSbWxOdjNMdXpESW1ZY0NxMXNRaGZ1L1QvUXMvTEtNNDFDNUxqVHRtZklD?=
 =?utf-8?B?UmJpa2NwWFA5eHQwek5RLzUzRmpST0NGTTAxZ2oxVkRPaUhyT1NsVmI0SFFV?=
 =?utf-8?B?MUxiazVUWWRZTUJBVUIwRXRuQk0vNXBRa0orR1ZhTGhRQ01ETzMvQmZjV3NP?=
 =?utf-8?B?RkNJTkN3Wk4yVjNKN0V4cjlHN0VZZTBpck16MlpYS2tGajFXSmljRkNWNFVC?=
 =?utf-8?B?UWxqS1RDdmdOMjFHUVVKdlF3a0IrOVZnb0F2YUlJbFF2azFUbXNqOUlwaldW?=
 =?utf-8?B?dDkweFdmSm1IMEpSOXZXN0c5QmVVcEVZREtuM3B3V01xTHJGVTd5MFZZcEZj?=
 =?utf-8?B?aEVFeEZJL25zLzZIYWF5c1BzRy93cllHR3M1ZGRDNWh1c1JmWW1qcTRmZ2Fp?=
 =?utf-8?B?WnJMblhUYVpOdTgxbVd1Wk9ndGRicUFVU3J6TVBwNUU0SzhQMDJEZEdlclNN?=
 =?utf-8?B?K1ZHK2RtL1RsaW1GLzdKTTlENitJQS9tbHNZZU16STg0dGRpNlhYcnNxak9x?=
 =?utf-8?B?dEYyZ2dPcnRqU3FWNUdwSnN5U1M3NWNDOGtOR25wNlRBU0FmYzdRUzJQZTBQ?=
 =?utf-8?B?UjArZlFMOU1ZQ2Fhd1hHcklRaWRIV0pPdU14OWdNbWRRVXpxUWlsWEN6V3Y5?=
 =?utf-8?B?U1FpU3Z0Q1RNVGdrTS83YktqVmZMNEgyb3dpSHVicHMxUDQxYkJraHduOVFY?=
 =?utf-8?B?ZFVONElPc1J4U2RjdGxVRkYzYWl2MStFaWFOa25BcC9QMlRmVm0xRWwwdGV5?=
 =?utf-8?B?MklkS2pla3hYMmxtSDJRMzFxQnFWdGZOQ0N1cDVraEloWmNKeUdvZ2YweVBu?=
 =?utf-8?B?UTA1U0lGMkJxTTY2QWQ4dUVONyt5aFFmbS9vamt2ZzMrSytzc2lVMUV3bTFm?=
 =?utf-8?B?d2hlUU0vcTJyTitPeXRBRklxZHloamRTZHRuMi9IT0xhWjhFMXV1YUp4bXRG?=
 =?utf-8?B?bnBpai9sa1ZwQjlKa2dFKzNIVi8vR0FxQUc1eDZHaDgxdXRGeWNSZUVySTJI?=
 =?utf-8?B?cCtFdW9zK3FnTnlBdU1NSnZpTTVQaHd1L2hhVEJlR1ZpVDk5L08xaHRxOHZz?=
 =?utf-8?B?azhGS1JPeUpmY3poVWd2YmJDY3h2NFVPQzFZbXlBaWwrd2EwbXZ6ZlI0Qkc5?=
 =?utf-8?B?T1pnelMvUVFpcGJuMjE2T3FHL3k2UkdhMFBBUDBQVHhFQ1NpWmd5VnU1d05D?=
 =?utf-8?B?N1VYc1R2NDljamVPVkFBbXBZUGYza25oZ2hVQzlsVFlsY1JBQjJmVXJ6dmRC?=
 =?utf-8?B?Rm9lK3hmUDNxNlBFYkVtR2ZkVlhtOEdveTJadEdFcmZzRDFiUzVYUGJDWjY1?=
 =?utf-8?B?VnBBNkJ6MDhIenNFQkVScUQrbytaSnpKVzhjQ2N0U0xBNFh5TUJOV21qUUtj?=
 =?utf-8?B?ZDB2ckxwSTFmVmxLRXpMUE4ydlQwa2diQW5GV25BNHFaSnE0SE1BT09yNnhV?=
 =?utf-8?B?Qi9wS1dyWHBBcXJoc0RYNk1wUDlDT3NvYTJYKzNmY3BUYzNYV3MvS1pzYXJ0?=
 =?utf-8?B?UmFURXhoYUtZRUhSYVYwZFdJSlNEd0xFQzVPMExQS0U5T2xIM04wNHFyL0dO?=
 =?utf-8?B?cnk4cjVxeGcwSUJqcVpPaTJYbEh5aHh5NHh4L2lHUUtscldacFpEN0pJUTZR?=
 =?utf-8?B?UUY1TWlIa3pwNEpWYjhvYTdBam5yTWkvY0JPSXZMREJyakhYUERJWnpCLy9z?=
 =?utf-8?B?NER5OGlrbVVINWR0aXU3b0hjbFF1cm1kUTJ6RUtvM1IrTEhMNGpFWEtBTHlI?=
 =?utf-8?B?bWkzQVBYUmx6QXpqamp5S0lIRWkzY0s2YmRLR0JvT0U2UTlNeVYyT2ZUNXcy?=
 =?utf-8?B?U0l5TGh1Qm5zdWs2OW1IODc3NnFTUzAzWlNIMjFsWlhPU25sdzNvSXFJaHBQ?=
 =?utf-8?B?Q0h1TzM0L01EZjJVbUE3NUhKaW5PRlpVZE83OXVXTnBNd1gzUXNDQlZQWElF?=
 =?utf-8?B?SmQ3SldJVGwrdmVzV1VPWjlVNXJWVFVjY3h2dU44Ulk0YzhPNTRkK0lITHc0?=
 =?utf-8?B?T2FyMXB2MHVrZU04Zi94QktOV3Q1emlNdmJQdDM3YXJQY1dvSktvcmxaSlpD?=
 =?utf-8?B?LzR6UktIMWc1SmJvekpjVnF4T0REbFVxbEs4bU9ESGhsVUFDQXBEZjMvVzcz?=
 =?utf-8?Q?dz9drn9a2nW6oC2ihYyWCnw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3c47c8c-693e-41e8-e4ce-08d999160d0b
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2021 06:50:23.6479 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZBKJOwQCebriKjW9MHK/VdMsb/Pe75vC7hScuvTHpAd7PmC+jOFs3I71CIDONVoQ9QGswUZp7S6avw46I+WIqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1997
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.151; envelope-from=chen.zhang@intel.com;
 helo=mga17.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: qemu-dev <qemu-devel@nongnu.org>, Li Zhijian <lizhijian@cn.fujitsu.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFzb24gV2FuZyA8amFz
b3dhbmdAcmVkaGF0LmNvbT4NCj4gU2VudDogV2VkbmVzZGF5LCBPY3RvYmVyIDI3LCAyMDIxIDI6
NDUgUE0NCj4gVG86IFpoYW5nLCBDaGVuIDxjaGVuLnpoYW5nQGludGVsLmNvbT4NCj4gQ2M6IHFl
bXUtZGV2IDxxZW11LWRldmVsQG5vbmdudS5vcmc+OyBNYXJrdXMgQXJtYnJ1c3Rlcg0KPiA8YXJt
YnJ1QHJlZGhhdC5jb20+OyBMaSBaaGlqaWFuIDxsaXpoaWppYW5AY24uZnVqaXRzdS5jb20+DQo+
IFN1YmplY3Q6IFJlOiBbUEFUQ0ggVjQgMS8zXSBuZXQvZmlsdGVyOiBSZW1vdmUgdm5ldF9oZHIg
ZnJvbSBmaWx0ZXItbWlycm9yDQo+IGFuZCBmaWx0ZXItcmVkaXJlY3Rvcg0KPiANCj4gT24gV2Vk
LCBPY3QgMjcsIDIwMjEgYXQgMjo0MCBQTSBaaGFuZywgQ2hlbiA8Y2hlbi56aGFuZ0BpbnRlbC5j
b20+DQo+IHdyb3RlOg0KPiA+DQo+ID4NCj4gPg0KPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCj4gPiA+IEZyb206IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+DQo+ID4g
PiBTZW50OiBXZWRuZXNkYXksIE9jdG9iZXIgMjcsIDIwMjEgMjoyNCBQTQ0KPiA+ID4gVG86IFpo
YW5nLCBDaGVuIDxjaGVuLnpoYW5nQGludGVsLmNvbT4NCj4gPiA+IENjOiBxZW11LWRldiA8cWVt
dS1kZXZlbEBub25nbnUub3JnPjsgTWFya3VzIEFybWJydXN0ZXINCj4gPiA+IDxhcm1icnVAcmVk
aGF0LmNvbT47IExpIFpoaWppYW4gPGxpemhpamlhbkBjbi5mdWppdHN1LmNvbT4NCj4gPiA+IFN1
YmplY3Q6IFJlOiBbUEFUQ0ggVjQgMS8zXSBuZXQvZmlsdGVyOiBSZW1vdmUgdm5ldF9oZHIgZnJv
bQ0KPiA+ID4gZmlsdGVyLW1pcnJvciBhbmQgZmlsdGVyLXJlZGlyZWN0b3INCj4gPiA+DQo+ID4g
Pg0KPiA+ID4g5ZyoIDIwMjEvMTAvMjcg5LiL5Y2IMjoxOSwgWmhhbmcsIENoZW4g5YaZ6YGTOg0K
PiA+ID4gPj4NCj4gPiA+IG1pcnJvcixpZD1pZCxuZXRkZXY9bmV0ZGV2aWQsb3V0ZGV2PWNoYXJk
ZXZpZCxxdWV1ZT1hbGx8cnh8dHhbLHZuZXRfDQo+ID4gPiBoDQo+ID4gPiA+PiBkcg0KPiA+ID4g
Pj4gX3N1cHBvcnRdWyxwb3NpdGlvbj1oZWFkfHRhaWx8aWQ9PGlkPl1bLGluc2VydD1iZWhpbmR8
YmVmb3JlXWBgDQo+ID4gPiA+Pj4gKyAgICBgYC1vYmplY3QNCj4gPiA+ID4+PiArIGZpbHRlci1t
aXJyb3IsaWQ9aWQsbmV0ZGV2PW5ldGRldmlkLG91dGRldj1jaGFyZGV2aWQscXVldWU9YWxsDQo+
ID4gPiA+Pj4gKyB8cnh8IHR4IFsscG9zaXRpb249aGVhZHx0YWlsfGlkPTxpZD5dWyxpbnNlcnQ9
YmVoaW5kfGJlZm9yZV1gYA0KPiA+ID4gPj4gSSB3b25kZXIgaWYgd2UgYnJlYWsgbWFuYWdlbWVu
dCBsYXllci4gSWYgeWVzLCBtYXliZSBpdCdzIGJldHRlcg0KPiA+ID4gPj4gdG8ga2VlcCB0aGUg
dm5ldF9oZHJfc3VwcG9ydCBoZXJlLg0KPiA+ID4gPiBZZXMgYW5kIG5vLCAgIFdpdGggdGhpcyBz
ZXJpZXMgb2YgcGF0Y2hlcywgZmlsdGVycyBoYXZlIGFiaWxpdHkgdG8NCj4gYXV0b21hdGljYWxs
eQ0KPiA+ID4gPiBDb25maWd1cmUgdGhlIGFwcHJvcHJpYXRlIHZuZXRfaGRyX3N1cHBvcnQgZmxh
ZyBhY2NvcmRpbmcgdG8gdGhlDQo+ID4gPiA+IGN1cnJlbnQNCj4gPiA+IGVudmlyb25tZW50Lg0K
PiA+ID4gPiBBbmQgY2FuIHJlcG9ydCBlcnJvciB3aGVuIGNhbid0IGZpeGluZyB0aGUgdm5ldF9o
ZHIoVGhlIHVzZXINCj4gPiA+ID4gY2Fubm90IGZpeCBpdA0KPiA+ID4gZnJvbSB0aGUgcHJldmlv
dXMgd2F5ICkuDQo+ID4gPiA+IFNvIEkgdGhpbmsgbm8gbmVlZCBmb3IgdGhlIHVzZXIgdG8gY29u
ZmlndXJlIHRoaXMgb3B0aW9uLCBzb21lDQo+ID4gPiA+IHJlbGV2YW50DQo+ID4gPiBiYWNrZ3Jv
dW5kIGtub3dsZWRnZSByZXF1aXJlZC4NCj4gPiA+ID4NCj4gPiA+ID4gRm9yIHRoZSBtYW5hZ2Vt
ZW50IGxheWVyLCBrZWVwIHRoZSB2bmV0X2hkcl9zdXBwb3J0IG1heSBiZQ0KPiA+ID4gbWVhbmlu
Z2xlc3MgZXhjZXB0IGZvciBjb21wYXRpYmlsaXR5Lg0KPiA+ID4gPiBJbiB0aGlzIHNpdHVhdGlv
biwgRG8geW91IHRoaW5rIHdlIHN0aWxsIG5lZWQgdG8ga2VlcCB0aGUNCj4gPiA+ID4gdm5ldF9o
ZHJfc3VwcG9ydA0KPiA+ID4gZm9yIG1hbmFnZW1lbnQgbGF5ZXI/DQo+ID4gPg0KPiA+ID4NCj4g
PiA+IFNvIGl0IGRlcGVuZHMgb24gd2hldGhlciBtYW5hZ2VtZW50IGxheWVyIGxpa2UgbGlidmly
dCBoYXMgYWxyZWFkeQ0KPiA+ID4gc3VwcG9ydGVkIHRoaXMuIElmIHllcywgd2UgbWF5IGdldCBl
cnJvcnMgdXNpbmcgbmV3IHFlbXUgd2l0aCBvbGQgbGlidmlydD8NCj4gPg0KPiA+IEFzIGZhciBh
cyBJIGtub3csIEN1cnJlbnQgbWFuYWdlbWVudCBsYXllciBsaWtlIHVwc3RyZWFtIGxpYnZpcnQg
aXMgbm8gQ09MTw0KPiBvZmZpY2lhbCBzdXBwb3J0IHlldC4NCj4gPiBBbmQgc29tZSByZWFsIENT
UHMgdXNlIGxpYnZpcnQgcGFzc3Rocm91Z2ggcW1wIGNvbW1hbmQgdG8gUWVtdSBmb3INCj4gbWFu
YWdlIENPTE8gVk0uDQo+IA0KPiBTbyB0aGUgcXVlc3Rpb24gc3RpbGwsIGl0IGxvb2tzIHRvIG1l
IGl0IHJlcXVpcmVzIHRoZSBtb2RpZmljYXRpb24gb2YgdGhlIGxheWVycw0KPiBvbiB0b3Agb2Yg
bGlidmlydD8gSWYgdGhlIGFuc3dlciBpcyB5ZXMsIHdlJ2QgYmV0dGVyIGtlZXAgdGhhdCBjb21w
YXRpYmlsaXR5Lg0KPiANCg0KWWVzLCBJIHdpbGwga2VlcCB0aGUgdm5ldF9oZHJfc3VwcG9ydCBh
bmQgYWRkIHNvbWUgY29tbWVudHMgdG8gdXBkYXRlIGl0IGluIG5leHQgdmVyc2lvbi4NCg0KVGhh
bmtzDQpDaGVuDQoNCj4gPiBJdCBpcyBubyBoYXJtIHRvIHVzZXJzIHRvIHJlZHVjZSBzb21lIHVu
bmVjZXNzYXJ5IHBhcmFtZXRlcnMuIEJ1dCBpZg0KPiA+IHlvdSB0aGluayBjb21wYXRpYmlsaXR5
IGlzIG1vcmUgaW1wb3J0YW50LCBJIHdpbGwgcmVzdG9yZSB0aGlzIHBhcmFtZXRlciBpbg0KPiBu
ZXh0IHZlcnNpb24uDQo+IA0KPiBUaGFua3MNCj4gDQo+ID4NCj4gPiBUaGFua3MNCj4gPiBDaGVu
DQo+ID4NCj4gPg0KPiA+DQo+ID4NCj4gPiA+DQo+ID4gPiBUaGFua3MNCj4gPiA+DQo+ID4gPiA+
IEVuYWJsZS9kaXNhYmxlIGl0IGRvIHRoZSBzYW1lIHRoaW5ncyBmb3IgZmlsdGVycy4NCj4gPiA+
ID4NCj4gPiA+ID4gVGhhbmtzDQo+ID4gPiA+IENoZW4NCj4gPiA+ID4NCj4gPg0KDQo=

