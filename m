Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B8C5515D2
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 12:28:32 +0200 (CEST)
Received: from localhost ([::1]:38026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3Edz-0004eq-5T
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 06:28:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1o3EYR-0006F7-NM
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 06:22:47 -0400
Received: from mga05.intel.com ([192.55.52.43]:34404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1o3EYN-00088c-Ur
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 06:22:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655720563; x=1687256563;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=L8kT+/358Od8eU6c5Njth3qzAn8BEzldSY/irTPOFZw=;
 b=np7bo/S3XDnQeWdOlfFScHhnNSoGO1DlkOi9ueJFeqSQvZUI7At6eQmh
 0RqbGsMfbbuVx4LtcuoYU5EoR548ZHmFv8kh8jGU58e0b3dqZQAtsF8hi
 pig2cmtA3K7AwjsYS4PSFSC3M+BW0I1KleGix3uiWBGGIIeeyiFBH7OF8
 EQPTiD69t3+CBpns766APjTVW7gCQ6zlou/8rzCGsKWMTrNdbUvrAsrVa
 xJFWya3Eh+6xGnnC3fyfPD++njH9DVzeM9Y1VHQQN/iuZzZ929ciWj1+k
 RJgRQsRrad8YQlVT+FR6TFc78JV/JSGEYtx52nYs0vaGl6eqzWeMPChf8 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="366184000"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="366184000"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2022 03:22:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="654612508"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by fmsmga004.fm.intel.com with ESMTP; 20 Jun 2022 03:22:41 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 20 Jun 2022 03:22:41 -0700
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 20 Jun 2022 03:22:40 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 20 Jun 2022 03:22:40 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.42) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 20 Jun 2022 03:22:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l8RAGpw1ik4Kvgzrnn91Cf7rneI/KO58mco8apsTyqOQuAlp7N/cx0qmewZMe38wv5SiOapxWf283M7xIlgYjs+84A2qeNVHNKaUFSYOvPCAFQQ1dPtgWmNepqvurYMXWHx0473qugvsT1nnWQQQIFAhPiAUVnISHFjVHncP5D0tQ17Pkq74beqa3o1T81KB9jg3H1fJOvdidWMj6hvn+qh+NZHeirmBHg1GyLuppzf+oZHU5O98cQEkbgFqOh3TFHEiUv5cQenC4zPdRg6x5aLQbPNYCQ/S4sueZ3bzfC08EU2ZFO0SCoJYStAuaSSxMnjEgE2QWec0I0o+TP1AiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L8kT+/358Od8eU6c5Njth3qzAn8BEzldSY/irTPOFZw=;
 b=UblJf+zIFMuAG4978sSAiUC5Td/e5C368jmReiIJ4SmJa2X98Yju6m2W+7/YlddSHNgUC4POjBdVr9am8EDAJlQHDzmqbngB76Ee3tchnKtv1j1cvmVoou/l4lbX0U6qrYy6uwZB23k3Q7MF3ZNHXZmjc2XboRHWxoTNUZ/NT2cWxrAOp/6pShZTiBgGiB779IhNSz4ZoY+mpgJjlzoEaT5tXEZ8S2Lts68gvBVW/zzzVpO1i1cLMc4ORdXa6wnt32PRayafUhrZNa/yzQD/eYeAPq85QZPd8DomQY2bDUzpNzjdfCPRoirn+WDHbQI5xRZTmdcIUznmOT5jVBfwhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by SJ0PR11MB5772.namprd11.prod.outlook.com (2603:10b6:a03:422::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Mon, 20 Jun
 2022 10:22:39 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::5908:5bb0:c7c0:85d]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::5908:5bb0:c7c0:85d%7]) with mapi id 15.20.5332.023; Mon, 20 Jun 2022
 10:22:38 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: =?utf-8?B?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?= <berrange@redhat.com>
CC: Thomas Huth <thuth@redhat.com>, Jason Wang <jasowang@redhat.com>, qemu-dev
 <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost
 <eduardo@habkost.net>, Eric Blake <eblake@redhat.com>, Markus Armbruster
 <armbru@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, Laurent Vivier
 <lvivier@redhat.com>, Yuri Benditovich <yuri.benditovich@daynix.com>, "Andrew
 Melnychenko" <andrew@daynix.com>
Subject: RE: [RFC PATCH 01/12] configure: Add iovisor/ubpf project as a
 submodule for QEMU
Thread-Topic: [RFC PATCH 01/12] configure: Add iovisor/ubpf project as a
 submodule for QEMU
Thread-Index: AQHYgh8EJk95aDHPrke2v71SXRLplK1TPbyAgASPuXCAACkNgIAACbmAgAABQNCAABNsAIAAA0Mg
Date: Mon, 20 Jun 2022 10:22:38 +0000
Message-ID: <MWHPR11MB003139EEAAD7E760AA4EF4D89BB09@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20220617073630.535914-1-chen.zhang@intel.com>
 <20220617073630.535914-2-chen.zhang@intel.com> <Yqw1wf+QjaBQ3I6M@redhat.com>
 <MWHPR11MB0031A589B82138F6E541B8BF9BB09@MWHPR11MB0031.namprd11.prod.outlook.com>
 <YrArvxwzVWQK4Hu8@redhat.com>
 <151603a7-7c5f-baa2-81b5-afb8aa30ff38@redhat.com>
 <MWHPR11MB0031AA06E7B46D66291F7E0A9BB09@MWHPR11MB0031.namprd11.prod.outlook.com>
 <YrBFPsL/y51rp4IA@redhat.com>
In-Reply-To: <YrBFPsL/y51rp4IA@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 676c2a0e-5022-4628-7725-08da52a6cd35
x-ms-traffictypediagnostic: SJ0PR11MB5772:EE_
x-microsoft-antispam-prvs: <SJ0PR11MB5772A9AE28FBC86647A3D1459BB09@SJ0PR11MB5772.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lvPXzMZxN9eVW2CROM9L9yjkdIXrb328oSC+Wydz7gvVg0k96VysGdvKiTQ3ogZM6W4nETSN6gjGydZaCvNc/h3ujPT9VMFSh5YYjpLPUpj5nx7P2KizMFCR5tCZrbZFCRKWXoX6Wul6bVA468lURqTRxtofSQbQG+vMpPxnARgyUj0uxLnou9nBc2+GLZi/X2XW6t6pzjIO01OCqZUAcD9pXNbWje3fepN1SaAJd/qI4Kxf7ubb5BQDeymTPX8gp6TN8wNbv5nvgxRWN9yGfhlFbnNHMASZIIN4TLxLCjiXLOSkAdpBMF5lepcVyc0rnvdbwTumOm+MPmm7+aV/FJd8ILlZihwW63kGfjYw8R2XRn62C5/GpsNJQBTWCvyHMVdyM03va0V/YXMoLKOqkMUTqtaHt3HjjajpIOdUB0fGsCp9S3lEQ5KktJv40zKhDCMs3g941ql2hgy+GtQI9YUddRlf1ZroV9U6cSWVT24yqEgRmKm7uAuJDPu87I5ig8a+8DE6mFQwoTJeqxbySGAnVKCa6tseYDyAoCi5SNknyp5guNO7K+P9noikwuoyodrYrd90HkHjlRSOsrkr5R/BwVtMJfga6jelkCtOPqbkVh1nkO9KqiiXSd/S4COfI5tLBPU9z+UyYv+zfjyWyDZQ/M56nYBeUD5f7Cqxdjc2xrmOMLh2hXjqC1TG6OsxEpqsZnG4m1om5XcsD1GbkNdeJECwBjzpYRX9SEaYAWEXhC1nqLuRSQ2ffRY7T9FSPzyLmux1ioYzcHo+90CP/4HAXYh2vVlFWc2U4NLUo0fkPbxuOthtPtGuUzXxKWyYs6OZxl20gfFyMAUsDCL9nw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(316002)(64756008)(2906002)(38070700005)(498600001)(86362001)(38100700002)(7416002)(4326008)(52536014)(6506007)(66476007)(66574015)(66446008)(966005)(26005)(6916009)(55016003)(54906003)(76116006)(7696005)(71200400001)(122000001)(66556008)(82960400001)(53546011)(9686003)(186003)(8676002)(83380400001)(8936002)(66946007)(5660300002)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SUpCNWdpTlVVdkJINkZTaFNPdTljVUx3RldDOFY4ajVRQkZsSFVYTkN3Mjli?=
 =?utf-8?B?Qld6djQ3cm1lYW5pY2YrNHN5L1VWbjBMMFJaNlE4RkFZLzczL0ZuTURwdDhI?=
 =?utf-8?B?Y1R6RjZLMVFBVDN1RXVPMnR5TDBQaWpEVG5CRE9aOU1TYzV6bU4yRU5YbGlO?=
 =?utf-8?B?OW1pcjFvSVlxQjIwc0lRY0sxOUVVakx0eXd6cFNrUVN5RVZjSm5mSTR6R3g1?=
 =?utf-8?B?V1hlTDdiWjhZNTdFUHBVODNNRm9aMnJIRllZeGRoQzQwWEozS0ZLaUNSVW4v?=
 =?utf-8?B?TXZpcUU1NTVUVjJYdzNZcHNmbDlhNURFOWNRTHNJS0crdUJsVjJHZFkyOTNY?=
 =?utf-8?B?QldsdVh1dFZQbEp0M0lNOFB6S3NESDZ5Wm1zUWJvYWEwNWVhaGdXOHMvK0Uw?=
 =?utf-8?B?bGpadW00Skp3RWFlT0loMUhSai9XZW5MTkpsZCtGQnQ2WUNlZzA4TW5PSkE0?=
 =?utf-8?B?QTAxVHdzRXkwY25KM2JrUTBtY0E1bnJGN0hCK29xV1hzUHBMbi96MkZNSHpM?=
 =?utf-8?B?U1RpamJvQ0UzVDQyMjRRN0dhRS9aL1JKdDhvN1RDcVJyVjJ2eTM5T29RMnZE?=
 =?utf-8?B?RG9kYlBJaHg1SkRzNnNZNXhudTlza293THQ5ZTZ4MjYzdnoybkRCQldoUk9L?=
 =?utf-8?B?V2NOVlZVT0NrQWdMb3Qrd2FvWGw4SEtVSHp0bm0xd2NHem9seWpYdXMvRk5N?=
 =?utf-8?B?OHk4K2pqWFpYOGtrQU5oS1ZyYVl1Tk5uamRhME41SE9xVlpiZE1HVlgvZWNR?=
 =?utf-8?B?OGlqS0s3WFFyOVdoS0pIeVNtOGVVeEY5OC8rL0JvQzZXc2JMRmk0OVdzZzZp?=
 =?utf-8?B?d2pWRWdDNW8zSlprbTBQREVrYUNjamVWK2g0U3pPS2VEdkJqdngrT1NhUUFy?=
 =?utf-8?B?blRhSEVGSi9QczUxT1VrKzdhTjA5cTh2V2UyK1R1Y252OFNNLzJNeHRKenlq?=
 =?utf-8?B?bWdHRnVWSDRzeVhxcisvTzJjYStqQ0xUZFc4eitiKzR6eGNud1ZxcEg0VWc2?=
 =?utf-8?B?bVlDRHdwR3lVMFMzNFBGT2tXMWZxWHRZWnJkMjNydExSUWlCaUVWeTZ2Ukhz?=
 =?utf-8?B?Qys5d0M1dmtHV1h0OUFQNExBZTRHdFF0TU9HUnFXRDkvTmNqTWlVRHVrQWxo?=
 =?utf-8?B?WWJRU1RvMHBXenN6c3E4cTNCdlhCR09rS2cyZ0xLcmxnVW5iWkVKWEI5Rzl0?=
 =?utf-8?B?QkxFQzVVa0wwcWdCZmdZMjA3R21Ja1Z3WGNBckRHb3NSUjRBN3ZTVnlxRXBZ?=
 =?utf-8?B?K0k2TjhXc2dsVzdWb3QwOGxRZkF2WlhkK20wMGgzek54REhCdWpxY1BlUHI5?=
 =?utf-8?B?b3hibHF4RGlZdS9QaVRGRU1VS2ZYOGNsNDIwVTZxS2JlczBNWXVZNll5bDBj?=
 =?utf-8?B?OURLSGwxSTAzRThhRzNlYlNJN1Jsc3dHT2F1T2lDQ2ZrWUtIVzIreU9jT2Zq?=
 =?utf-8?B?YkFSVzVZTVZaZW9GbDI2WlI1TkJhWnRuaGlwVE9GSDdJQ1R3aUIwdzVjREJT?=
 =?utf-8?B?YzF5Q0FiUGRlMGdyVmZDK1ltK0hBM1hCQTh1YVlIVkRjN0RDZU1UWlNTTklJ?=
 =?utf-8?B?UG82MWUvVGJhWmJuekFtNzViMFVMMTJ4a1pTYm5kdUZISkpqOHFTUlFvdUxV?=
 =?utf-8?B?MGt3clM4SURCbi9uaUo3VnVuL0VENVh2c2lNclFoSDIyK1k5UlJ4MmNqT0NS?=
 =?utf-8?B?aGhhS2l5cnozdlU1ZEJtQzczSmV4c2tHMyt5Y1hFbHQ3OFhuVjZmTS8vc1Rq?=
 =?utf-8?B?aTBrSXhNdGhGbWRQd2oxYUl0WDZ5YnI0V2dQMmk3UktNZVV4cmFTWGVrdWRn?=
 =?utf-8?B?Vk5hREQxU0RyTjk0VjFqSHhuYTdTaGRYWnhKajc4UW1RU0w1NXhaSm9aWFdT?=
 =?utf-8?B?STU3anpCaHl6a2JsTGxxemwxazltVzRmTzdtLzhJUFpuU3ZtN2V6NXN6S1RT?=
 =?utf-8?B?elJDUTNkRHRzYno1VDJsNllqa0t2c1U1azhUYVRvSzc3bGZLZkRGVFVhcitt?=
 =?utf-8?B?UHJMNWtzQmY2QzNLWWNOZmJtTTRlREpycExOYVh3S3BUYjg3cFhtOTc0alY1?=
 =?utf-8?B?TnorSXlUR3JjVVBTZVduU1BhdHREQlZ5NklQSjdranltcG13R2hNS1FIaWZh?=
 =?utf-8?B?R25tbFZ2QnhkQXdnUUdnL3dLR0ZYdkN4RXNldGhpeWhWY3FlNC90dHA5YmFB?=
 =?utf-8?B?eTZaYjdKS0ROQ3N6KzBzWTBQNHJVNjVDbjN0NHAxeXlEQ3ZaNE4xVlJYVnp5?=
 =?utf-8?B?MytJdWJMejVGbXdxSDkwSlh1V0RHd1o2T045L01xRHdWMDk5TTBUUjAvRW5w?=
 =?utf-8?B?SGxGYndDUVJyTEc4eFdURkkwbzZ0Yi81cDN0WGEyVUl6M3RHZFE4QT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 676c2a0e-5022-4628-7725-08da52a6cd35
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2022 10:22:38.6603 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ppasmqZm88oawxYLZDL/x2y7UB+Al7ihqFHmT2T3MO7CSP1QFUIg0Q/GT/nl2wNaYGg17IO+VdVwzuyl6MCNzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5772
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.43; envelope-from=chen.zhang@intel.com;
 helo=mga05.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRGFuaWVsIFAuIEJlcnJh
bmfDqSA8YmVycmFuZ2VAcmVkaGF0LmNvbT4NCj4gU2VudDogTW9uZGF5LCBKdW5lIDIwLCAyMDIy
IDY6MDEgUE0NCj4gVG86IFpoYW5nLCBDaGVuIDxjaGVuLnpoYW5nQGludGVsLmNvbT4NCj4gQ2M6
IFRob21hcyBIdXRoIDx0aHV0aEByZWRoYXQuY29tPjsgSmFzb24gV2FuZw0KPiA8amFzb3dhbmdA
cmVkaGF0LmNvbT47IHFlbXUtZGV2IDxxZW11LWRldmVsQG5vbmdudS5vcmc+OyBQYW9sbw0KPiBC
b256aW5pIDxwYm9uemluaUByZWRoYXQuY29tPjsgRWR1YXJkbyBIYWJrb3N0IDxlZHVhcmRvQGhh
Ymtvc3QubmV0PjsNCj4gRXJpYyBCbGFrZSA8ZWJsYWtlQHJlZGhhdC5jb20+OyBNYXJrdXMgQXJt
YnJ1c3Rlcg0KPiA8YXJtYnJ1QHJlZGhhdC5jb20+OyBQZXRlciBNYXlkZWxsIDxwZXRlci5tYXlk
ZWxsQGxpbmFyby5vcmc+OyBMYXVyZW50DQo+IFZpdmllciA8bHZpdmllckByZWRoYXQuY29tPjsg
WXVyaSBCZW5kaXRvdmljaA0KPiA8eXVyaS5iZW5kaXRvdmljaEBkYXluaXguY29tPjsgQW5kcmV3
IE1lbG55Y2hlbmtvDQo+IDxhbmRyZXdAZGF5bml4LmNvbT4NCj4gU3ViamVjdDogUmU6IFtSRkMg
UEFUQ0ggMDEvMTJdIGNvbmZpZ3VyZTogQWRkIGlvdmlzb3IvdWJwZiBwcm9qZWN0IGFzIGENCj4g
c3VibW9kdWxlIGZvciBRRU1VDQo+IA0KPiBPbiBNb24sIEp1biAyMCwgMjAyMiBhdCAwOToyOTow
NUFNICswMDAwLCBaaGFuZywgQ2hlbiB3cm90ZToNCj4gPg0KPiA+ID4NCj4gPiA+IE9uIDIwLzA2
LzIwMjIgMTAuMTEsIERhbmllbCBQLiBCZXJyYW5nw6kgd3JvdGU6DQo+ID4gPiA+IE9uIE1vbiwg
SnVuIDIwLCAyMDIyIGF0IDA1OjU5OjA2QU0gKzAwMDAsIFpoYW5nLCBDaGVuIHdyb3RlOg0KPiA+
ID4gPj4NCj4gPiA+ID4+DQo+ID4gPiA+Pj4gT24gRnJpLCBKdW4gMTcsIDIwMjIgYXQgMDM6MzY6
MTlQTSArMDgwMCwgWmhhbmcgQ2hlbiB3cm90ZToNCj4gPiA+ID4+Pj4gTWFrZSBpb3Zpc29yL3Vi
cGYgcHJvamVjdCBiZSBhIGdpdCBzdWJtb2R1bGUgZm9yIFFFTVUuDQo+ID4gPiA+Pj4+IEl0IHdp
bGwgYXV0byBjbG9uZSB1YnBmIHByb2plY3Qgd2hlbiBjb25maWd1cmUgUUVNVS4NCj4gPiA+ID4+
Pg0KPiA+ID4gPj4+IEkgZG9uJ3QgdGhpbmsgd2UgbmVlZCB0b2RvIHRoaXMuIEFzIGl0IGlzIGJy
YW5kIG5ldw0KPiA+ID4gPj4+IGZ1bmN0aW9uYWxpdHkgd2UgZG9uJ3QgaGF2ZSBhbnkgYmFjayBj
b21wYXQgaXNzdWVzLiBXZSBzaG91bGQNCj4gPiA+ID4+PiBqdXN0IGV4cGVjdCB0aGUgZGlzdHJv
cyB0byBzaGlwIHVicGYgaWYgdGhleSB3YW50IHRoZWlyIFFFTVUgYnVpbGRzIHRvDQo+IHRha2Ug
YWR2YW50YWdlIG9mIGl0Lg0KPiA+ID4gPj4+DQo+ID4gPiA+Pg0KPiA+ID4gPj4gWWVzLCBhZ3Jl
ZS4gSXQncyB0aGUgYmVzdCB3YXkgdG8gdXNlIHRoZSB1QlBGIHByb2plY3QuDQo+ID4gPiA+PiBC
dXQgY3VycmVudCBzdGF0dXMgaXMgZGlzdHJvcyh1YnVudHUsIFJIRUwuLi4pIGRvZXMgbm90IHNo
aXAgdGhlDQo+ID4gPiA+PiBpb3Zpc29yL3VicGYgbGlrZSB0aGUgaW92aXNvci9iY2MuIFNvIEkg
aGF2ZSB0byBkbyBpdC4NCj4gPiA+ID4+IE9yIGRvIHlvdSBoYXZlIGFueSBiZXR0ZXIgc3VnZ2Vz
dGlvbnM/DQo+ID4gPiA+DQo+ID4gPiA+IElmIGRpc3Ryb3Mgd2FudCB0byBzdXBwb3J0IHRoZSBm
dW5jdGlvbmFsaXR5LCB0aGV5IGNhbiBhZGQNCj4gPiA+ID4gcGFja2FnZXMgZm9yIGl0IElNSE8u
DQo+ID4gPg0KPiA+ID4gWWVzLCBsZXQncyBwbGVhc2UgYXZvaWQgbmV3IHN1Ym1vZHVsZXMuIFN1
Ym1vZHVsZXMgY2FuIHNvbWV0aW1lcyBiZQ0KPiA+ID4gYSByZWFsIFBJVEEgKGUuZy4gaWYgeW91
IGZvcmdldCB0byB1cGRhdGUgYmVmb3JlIHJzeW5jJ2luZyB5b3VyIGNvZGUNCj4gPiA+IHRvIGEg
bWFjaGluZSB0aGF0IGhhcyBsaW1pdGVkIGludGVybmV0IGFjY2VzcyksIGFuZCBpZiB1c2VycyBp
bnN0YWxsDQo+ID4gPiBRRU1VIGZyb20gc291cmNlcywgdGhleSBjYW4gYWxzbyBpbnN0YWxsIHVi
cGYgZnJvbSBzb3VyY2VzLCB0b28uDQo+ID4gPiBBbmQgaWYgZGlzdHJvcyB3YW50IHRvIHN1cHBv
cnQgdGhpcyBmZWF0dXJlLCB0aGV5IGNhbiBwYWNrYWdlIHVicGYNCj4gPiA+IG9uIHRoZWlyIG93
biwgYXMgRGFuaWVsIHNhaWQuDQo+ID4NCj4gPiBIaSBEYW5pZWwgYW5kIFRob21hcywNCj4gPg0K
PiA+IEkgZG9uJ3Qga25vdyBtdWNoIHRoZSBiYWNrZ3JvdW5kIGhpc3Rvcnkgb2YgUUVNVSBzdWJt
b2R1bGVzLCBidXQNCj4gbWVzb24NCj4gPiBidWlsZCBpcyBhIHN1Ym1vZHVsZSBmb3IgUUVNVSB0
b28uIEl0IG1lYW5zIHVzZXIgY2FuJ3QgaW5zdGFsbCBRRU1VDQo+ID4gZnJvbSBzb3VyY2VzIHdp
dGggbGltaXRlZCBpbnRlcm5ldCBhY2Nlc3MuDQo+ID4gQW5kIGJhY2sgdG8gRGFuaWVsJ3MgY29t
bWVudHMsICBZZXMsIHRoZSBiZXN0IHdheSBpcyBkaXN0cm9zIGFkZCB0aGUNCj4gPiB1YnBmIHBh
Y2thZ2VzLCBCdXQgbWF5YmUgaXQncyB0b28gbGF0ZSB0byBpbXBsZW1lbnQgbmV3IGZlYXR1cmVz
IGZvcg0KPiA+IHVzLiBXZSBjYW4gaW50cm9kdWNlIHRoZSBzdWJtb2R1bGUgbm93IGFuZCBhdXRv
IGNoYW5nZSB0byB0aGUgZGlzdHJvcydzDQo+IGxpYiB3aGVuIGRpc3Ryb3MgYWRkIGl0LiAgRm9y
IGV4YW1wbGUgUUVNVSdzIHN1Ym1vZHVsZSBTTElSUCBkbyBpdCBpbiB0aGUNCj4gc2FtZSB3YXku
DQo+ID4gSXQncyBhbHJlYWR5IGFkZGVkIGJ5IG1vc3QgZGlzdHJvcyBhbmQgc3RpbGwgYXMgYSBR
RU1VIHN1Ym1vZHVsZS4gSXQNCj4gPiBtYWtlIHVzZXIgZXhwZXJpZW5jZSB0aGUgbGF0ZXN0IHRl
Y2hub2xvZ3kgd2l0aCBubyBvdGhlciBkZXBlbmRlbmNpZXMuDQo+ID4gdUJQRiBpbmZyYXN0cnVj
dHVyZSBoYXZlIHRoZSBhYmlsaXR5IHRvIGV4dGVuZCB0aGUgY2FwYWJpbGl0aWVzDQo+ID4gd2l0
aG91dCByZXF1aXJpbmcgY2hhbmdpbmcgc291cmNlIGNvZGUuIElmIHdlIG5vdCBhbGxvdyBpdCwg
d2UgaGF2ZSB0byByZS0NCj4gaW1wbGVtZW50IGFsbCB0aGUgZUJQRiBhc3NlbWJsZXIsIGRpc2Fz
c2VtYmxlciwgaW50ZXJwcmV0ZXIsIGFuZCBKSVQNCj4gY29tcGlsZXIgbGlrZSBEUERLIHVzZXJz
cGFjZSBlQlBGIHN1cHBvcnQgKERQREsgY2FuJ3QgdXNlIHVicGYgcHJvamVjdCBieQ0KPiBsaWNl
bnNlIGlzc3VlKS4NCj4gDQo+IFNsaXJwIGlzIGEgZGlmZmVyZW50IHNjZW5hcmlvLiBUaGF0IHdh
cyBmdW5jdGlvbmFsaXR5IHRoYXQgd2FzIGhpc3RvcmljYWxseQ0KPiBpbnRlZ3JhdGVkIGludG8g
UUVNVSBhbmQgd2FzIHRoZW4gc3B1biBvdXQgaW50byBhIHN0YW5kYWxvbmUgcHJvamVjdC4gU2lu
Y2UNCj4gd2UgaGFkIGV4aXN0aW5nIHVzZXJzIG9uIGV4aXN0aW5nIGRpc3RybyByZWxlYXNlcyBk
ZXBlbmRhbnQgb24gU2xpcnAsIHdlDQo+IHdhbnRlZCB0byBnaXZlIGEgc21vb3RoIHVwZ3JhZGUg
ZXhwZXJpYW5jZSBieSBidW5kbGluZyBTbGlycC4gRXNzZW50aWFsbHkNCj4gdGhlIGdvYWwgd2Fz
IHRvIGF2b2lkIHRoZSByZWdyZXNzaW9uIGlmIHNvbWVvbmUgZGVwbG95ZWQgbmV3IFFFTVUgb24N
Cj4gZXhpc3RpbmcgZGlzdHJvcy4NCj4gDQo+IE1lc29uIGlzIGEgZmFpcmx5IHNpbWlsYXIgc2Nl
bmFyaW8uIFdlIHdhbnRlZCB0byBzd2FwIHRoZSBidWlsZCBzeXN0ZW0gaW4NCj4gUUVNVSBvdmVy
IHRvIE1lc29uLCBhbmQgdGhhdCBjaGFuZ2Ugd291bGQgYWZmZWN0IGFsbCBleGlzdGluZyB1c2Vy
cyBvZg0KPiBRRU1VLg0KPiBNYW55IGRpc3Ryb3MgZGlkbid0IGhhdmUgYSBuZXcgZW5vdWdoIG1l
c29uLCBhbmQgc28gYnVuZGxpbmcgaXQgaW4gUUVNVQ0KPiBlbmFibGVzIHVzIHRvIGdpdmUgYSBz
bW9vdGggdXBncmFkZSBwYXRoIHdpdGhvdXQgYW55IHJlZ3Jlc3Npb24gZm9yIGV4aXN0aW5nDQo+
IHVzZXJzIG9uIGV4aXN0aW5nIGRpc3Ryb3MuDQo+IA0KPiBUaGlzIHBhdGNoLCBob3dldmVyLCBp
cyBwcm9wb3NpbmcgYW4gZW50aXJlbHkgbmV3IHBpZWNlIG9mIGZ1bmN0aW9uYWxpdHkgdGhhdA0K
PiBoYXMgbm8gZXhpc3RpbmcgdXNlcnMgYW5kIGV2ZW4gb25jZSBwcmVzZW50IHdpbGwgYmUgdXNl
ZCBieSByZWxhdGl2ZWx5IGZldw0KPiB1c2VycyBjb21wYXJ0aXZlbHkgc3BlYWtpbmcuIEFzIHN1
Y2ggdGhlcmUgaXMgbm8gdXBncmFkZSBjb21wYXRpYmlsaXR5IC8NCj4gcmVncmVzc2lvbiBzY2Vu
YXJpbyB0aGF0IHdlIG5lZWQgdG8gd29ycnkgYWJvdXQuIEFueW9uZSBpbnRlcmVzdGVkIGluIHRo
ZQ0KPiBuZXcgZnVuY3Rpb25hbGl0eSBjYW4gYmUgcmVhc29uYWJseSBhc2tlZCB0byBlaXRoZXIg
d2FpdCBmb3IgdGhlIGRpc3RybyB0bw0KPiBwYWNrYWdlIGl0LCBvciBidWlsZCBpdCB0aGVtc2Vs
dmVzLg0KPiANCg0KT0ssIGdvdCB5b3VyIHBvaW50Lg0KRm9yIHRoaXMgc2VyaWVzLCBzaG91bGQg
d2UgaW50cm9kdWNlIGFuIGV4dGVybmFsIGxpYnJhcnkgImxpYnVicGYiIGluIFFFTVUgY29uZmln
dXJlPw0KSWYgdGhpcyBsaWJyYXJ5IGlzIGZvdW5kLCB0aGUgcmVsZXZhbnQgZmlsZXMgd2lsbCBi
ZSBjb21waWxlZCBhbmQgdGhlIGZlYXR1cmUgY2FuIGJlIGVuYWJsZWQgaW4gUUVNVS4NCg0KVGhh
bmtzDQpDaGVuDQoNCj4gV2l0aCByZWdhcmRzLA0KPiBEYW5pZWwNCj4gLS0NCj4gfDogaHR0cHM6
Ly9iZXJyYW5nZS5jb20gICAgICAtby0NCj4gaHR0cHM6Ly93d3cuZmxpY2tyLmNvbS9waG90b3Mv
ZGJlcnJhbmdlIDp8DQo+IHw6IGh0dHBzOi8vbGlidmlydC5vcmcgICAgICAgICAtby0gICAgICAg
ICAgICBodHRwczovL2ZzdG9wMTM4LmJlcnJhbmdlLmNvbSA6fA0KPiB8OiBodHRwczovL2VudGFu
Z2xlLXBob3RvLm9yZyAgICAtby0NCj4gaHR0cHM6Ly93d3cuaW5zdGFncmFtLmNvbS9kYmVycmFu
Z2UgOnwNCg0K

