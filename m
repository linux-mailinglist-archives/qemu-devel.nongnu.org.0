Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E203D572D97
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 07:49:55 +0200 (CEST)
Received: from localhost ([::1]:37994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBVFy-00017J-Sw
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 01:49:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shirley.zhao@intel.com>)
 id 1oBVA6-000647-O3
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 01:43:50 -0400
Received: from mga12.intel.com ([192.55.52.136]:52769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shirley.zhao@intel.com>)
 id 1oBVA3-0004Aq-G6
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 01:43:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657691027; x=1689227027;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Bbwtu2SoXY/bixuIorhCS1HuBH6dJ02IK930eJD4VTM=;
 b=lxWvpTk+R/6xglrLX051pQSh3Mc1mNCJx544JQlonrtdibkBMcSrZ265
 WWXgUEa0oKRnO3aLM6Xw2bGnvPoQlVOB+Z5DyfJ8hvcFqo7dLEdd9P/an
 xWgvKoxij/4p37RXnXUdqK3n2pbrJat6fbH9Z53WbQClb30W6aMgLz4GB
 bVPZEvCt+wZM0f0mAqJlBCLbk3Nnx3ZUoR2S2ldI0yuJSayMgUc1M90ny
 HqZ/Qmf/LZL34BbjPXIk6CHiUkbCsPaSDLdOO3tisXDggztF675/Lkf0S
 f2vZoZK46Zuj0E1nTiaZzkwMkqYPfjLt8MLX6QpmBqeLL8QrnxZql1OJN w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10406"; a="264903933"
X-IronPort-AV: E=Sophos;i="5.92,267,1650956400"; d="scan'208";a="264903933"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2022 22:43:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,267,1650956400"; d="scan'208";a="841633674"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by fmsmga006.fm.intel.com with ESMTP; 12 Jul 2022 22:43:45 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 12 Jul 2022 22:43:44 -0700
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 12 Jul 2022 22:43:44 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 12 Jul 2022 22:43:44 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 12 Jul 2022 22:43:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N2iFcZ2xj0Z/hCkbljcQUsY2tR6OB3kIXiLPxwh6UyJBDWQtgoIZQeNumcx4pQaNjyXVZdL3qJQgbsSTXBV54h0Z8Feo6PiKoCUFqto/PFsqrRbbz0Wv1sVUIGHZmgsFnty+mY5RC6mHZKEHzS9id7B1OG3tQBh6pdJsfOZxPO4vGsxVJVeos6azYKyOsIo1mVAOuHa6SwJAwZ20GFUmD6vA6oQKk4LkdkCKtuArnPQQrEViABedq4zdmPmnXOioxv1H9+tiVXR0ipmH+NMFWSYVTvCT9MLN1TkWdijxcfQcmbl92vlQOGhLD2+C8ol3Y8XaMbh7XG5R0WwFCbNn8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bbwtu2SoXY/bixuIorhCS1HuBH6dJ02IK930eJD4VTM=;
 b=QdsCheix+jEzTK7dBKpfBkMkZv8FTBTEMg4ljuO3X794mVE0Udlxw1r8fxul4ZXOfRFJR1wVxET+z84r5S3L9jpPRT4xqZH3U+GsBy5xdUMQu39xA8G4TrHnVrNUDkON03f4cEnlr3bH4C0XM3p3HL+koce40edBTISTm6SNkbjxGyo6BdA5V6UtlmIYlwyo+8O4+iPwhQcpXjYXEbQidiPYyitpWlprreTGf+2mV3fGUp96QUOstdbEyKfYHCMZ1gGwvR+hSHYb8BWY68Cw5jExEVVJpGkJRV2mWMsH0mASybmQM2nf6yn+0yoF+j4hViM4XNeBDfsn072IMXskgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4291.namprd11.prod.outlook.com (2603:10b6:a03:1c2::12)
 by SN6PR11MB3071.namprd11.prod.outlook.com (2603:10b6:805:d6::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.25; Wed, 13 Jul
 2022 05:43:37 +0000
Received: from BY5PR11MB4291.namprd11.prod.outlook.com
 ([fe80::1d37:60c1:cfd1:b192]) by BY5PR11MB4291.namprd11.prod.outlook.com
 ([fe80::1d37:60c1:cfd1:b192%4]) with mapi id 15.20.5417.026; Wed, 13 Jul 2022
 05:43:37 +0000
From: "Zhao, Shirley" <shirley.zhao@intel.com>
To: Vivek Goyal <vgoyal@redhat.com>
CC: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, "virtio-fs@redhat.com"
 <virtio-fs@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [Virtio-fs] [Qemu] how to use viriofs in qemu without NUMA
Thread-Topic: [Virtio-fs] [Qemu] how to use viriofs in qemu without NUMA
Thread-Index: AdiQCpaHJJlwUwhPRyeyoMxZnaNd+wAOQjsAAACJ1oAAAdWNIAABaX0AAIQUiAAA1liOUAALxkcAACP2qPA=
Date: Wed, 13 Jul 2022 05:43:37 +0000
Message-ID: <BY5PR11MB42915EB718B55C182CAF25BF8D899@BY5PR11MB4291.namprd11.prod.outlook.com>
References: <BY5PR11MB42911D5BF55D9FAF501F64F68D819@BY5PR11MB4291.namprd11.prod.outlook.com>
 <3b6c8e16-3712-3402-3ab2-17bf53ec64a8@redhat.com> <YsPwbbiuxtkD6HSp@work-vm>
 <BY5PR11MB42912BFEA77F94B5B20D6F258D819@BY5PR11MB4291.namprd11.prod.outlook.com>
 <YsQGNk5hLv8b6DJS@work-vm>
 <BY5PR11MB4291BCA40054FB484003D4278D829@BY5PR11MB4291.namprd11.prod.outlook.com>
 <BY5PR11MB42914FD092B4312B76417A9C8D869@BY5PR11MB4291.namprd11.prod.outlook.com>
 <Ys1qDhW/DCCt0XdS@redhat.com>
In-Reply-To: <Ys1qDhW/DCCt0XdS@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.6.500.17
dlp-product: dlpe-windows
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0843ce25-d23e-4980-ae1b-08da6492a21d
x-ms-traffictypediagnostic: SN6PR11MB3071:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Pb2scNVYKcZ0wzU1u75MTvdigqNchqK5VKl2aTlPCijhwE+6+FGq2B/mc7w6HIJwAYThUQ5qWYRmuUhKH7TuOY92pB4OGUW9/orW95X7HgE45yBsDZtYodto+kg0IpaEpizo8IufP6YDkTXx4w74styYY+Stf5ZMsoPv6a5fVoaTOkqoTD0J6hKgyy2cE09XPQCaF8BfhbixNWq8hIGOXPgyQMmd8r2DgQZodozdKPl5Et2inu+pxWFSTVoVUPsMDY36MlCTGUEWN+kaiTv/VOgyjO3tMSgK0v1aDYL2Camvr5758WUIGNiDS5frbvi5Rzj4Cr0yVSSFzDV/GE4BzSoRzz1y3amgCvX51X6EaSvRxijhAqXWbeESx2r4SZ28wvHpbMyfg5juUgRti4TpKIAaP9AgCvyTxmH5khuMoVs0FsyiYj2ra4dv1pDDNvkip9tPsa4NO0GRfSyfxnplyrCPJosnmw5TTaBzCp4YKNlTZBu7LhSSeIWoVIPc5sOjjHnL8UKK+TP+bN7SfWhRwc7dc3yp5WhkXl1S//IbwnQAa4ijSw6NahnS5VVdLKoc+Zc9Z2pupL7tqPQ/1u83iioo4r6CCRRuE43SizPp3+4Cb5htytioxrRv6BUz5/obpACLVNJFXUQ/d3zU9OZW7NKCFBlszMlKHRCJ1B7UZBLq4KC5Tx3B1odr0Jy23FLBuB1qPMlzygR7qXjaGsHOZOp9Z0ApGcz9abRAiIgY5bNZ+wF5b+FubStuSTKt80qkv/sj4KTbJPEm7tiMesxt7auDGPHbZMt5UoEQuJfQGEvNO1NMTATRWEAv6vHBzdc46sPTxq3fZCz5JaSRS0XhsYrJU95eRKYComV0fcupLYVFItXHDOJpGbF5S9DB7y1Chon9xlkfX9SOF3XT/Y55bg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4291.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(39860400002)(136003)(396003)(346002)(376002)(6506007)(66446008)(66946007)(86362001)(66556008)(38070700005)(53546011)(82960400001)(26005)(9686003)(6916009)(966005)(2906002)(66476007)(41300700001)(8676002)(76116006)(7696005)(186003)(38100700002)(64756008)(8936002)(55016003)(122000001)(4326008)(83380400001)(478600001)(5660300002)(52536014)(54906003)(316002)(71200400001)(33656002)(358055004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZWlob1hCSVhGWGxLa00xSTFmUEpKVUFMNlptNmx2Z2N1U0o3TGdvK0VBbHhY?=
 =?utf-8?B?bGh3WDNJSXpOUElCUmJzRHd5dStITUtBV1lpT2xvMnFLSFFFMHRBVmJPelhK?=
 =?utf-8?B?YytTL1U5QVRkK1VmUU1jcTZvWWd6TFJPM0xNdkU1UHFkRlFpS25MZTIrcElh?=
 =?utf-8?B?SDFjcVNDRDJJMkN5NFFhYndzOHhYNzBjTmpBOS9xbDFLWTdpL1VtM0Q3eEJV?=
 =?utf-8?B?bVI2YkRnNDNBb3IwU01TcmVYK0xEVE12QlgvdmlBNGFKZ3VZVU5FOUtZeVdG?=
 =?utf-8?B?SjJRKzd0RWcrNllUZjhtcDFpZGZ4VHFLcCtnV0xnWUszMnJBNXdiZGFqV293?=
 =?utf-8?B?cERhd1d0czR2YlVmSzZSQTRZZXJuQ0plOUlxZ0NRNGRUb3YzRDk2UGx5dHk3?=
 =?utf-8?B?b001T1dTT21SbmFlWmpFa3hzRC9TVWxRdjNMSlZJZGVFTjZ0TWFLNW9xNmpt?=
 =?utf-8?B?YktGYnJaTU9iNTJucDNlTUs2Z3NsOHlLandEQndLekU4WXZnNC92TE1UR1N2?=
 =?utf-8?B?Z0ZCdWlXMHR3SVZKc1BrZnM5MmgyNG42RFAvU01FaWo4dG0zSGYrZkN4dnhE?=
 =?utf-8?B?emZEcEdtM3c0ZS83Y2xBaWdWbGQyMEpob0NKZkZmVTJuUXdHT0hlS0JiN01D?=
 =?utf-8?B?ODFZQ2xhWWw3OXJCZzNkM2gvS1RkeTBvSnpFclJ3UnNLUUFOdkRhR1phQUNW?=
 =?utf-8?B?aVJGWnI0Z3VwNGVTa0Y5NUFpa0VoMmtUOVl5ZjFCaU5Ld3psL01lcHZOZnNI?=
 =?utf-8?B?T1Z1QkxpSkhReXVmSDJQREpQK0U3N2pXc1Y2ZnhxTVowQlVPSkg4OHBPWHJ3?=
 =?utf-8?B?clJBazlLN0VqUm16Q2ROTy9GZS9NaUZ0c2lTcExjUzVka2Y5akpxbTlUSkth?=
 =?utf-8?B?THFPejlLRHJFQmlwS3hNNVZsZStLNkd4UUVPdlRSU1AvRGs5cDJHL21DMlV5?=
 =?utf-8?B?NXpQRmZkdjRxVTJCNk9Mdk1jVFJoMEw3a1VYOEQ3WHlIalJ2V2d5NStPMzVL?=
 =?utf-8?B?TWIwSWk2OFg3cFJQSFRsWnp1VEV5cm15Q3drRmV3c0ZmeC82Uzh6OWpDVEVQ?=
 =?utf-8?B?SlgzSGJ1cWM1RjNRbjlwcXg3cS96a2dXL1RHdkhhWnNZYlJCbFBXZ3lnV3Mw?=
 =?utf-8?B?Y0QvNEltbTZqdHBiOW9UYlA3TUFvZFcyUlZHYXU3UFUrU2hkY1k1RjJIa2li?=
 =?utf-8?B?OTlJT2lnVERFbzVSZ0plTUNLbkFLSXpkNmNYWUorK3lldlZjTjk1WmJkQjRp?=
 =?utf-8?B?UFRxUjVGWDN5VzE5enBPbC9zbVYzV0piUWVZRmV5MjNVZG45SU01Sk9xeFJi?=
 =?utf-8?B?VXhxZFd5VFlneCtTbmRJMkNiamtsM1pQWVZKRGpuOXJvd0N3ampLZ3JTb1dL?=
 =?utf-8?B?My8wbmRWNWR0Zy8zYlRnL2ttU1VYemJBS2ZZcC90OUhOZEVRbjdkOThBVnFT?=
 =?utf-8?B?WHZpdTVvalhCUmE1ZEJHR3I4ZE9QZHdKYWw1QUJLTzZwbnRwK3BlNUlQamhs?=
 =?utf-8?B?bm5lSWxQaWZBbTdMOHRGV0JHRkJhMFpvY05RT2hXeHVqMmpONU5SWUZaZlVu?=
 =?utf-8?B?c2FvZ0Y0M3NheG9wUTR4eUF5bnU3Uy9uczVNVUxTb0Q1QWpPL0lUVTVNOGJ1?=
 =?utf-8?B?ekNLSDRoamNYelhremVHR0ZQYVdjK1l1REZHQzlrZytMbkV5ejlzMC9PRlBv?=
 =?utf-8?B?dHJKc3BrUStZU0ZKbk1hcldNN0Y0eFZHVjlJZHVyY0xqOURHaEkyZWsrd2xU?=
 =?utf-8?B?WmVoNXJtaXQvMGVWNG9HVXNaVWpoL2FCeFIrV1crcU1odmdMS1dYK1pCTjVE?=
 =?utf-8?B?Wkh2Qm9ydGx3MlpSRGxKYTdvWFp1OWJEZE02enQweCtNUkhnTmJ4bkVvQjhU?=
 =?utf-8?B?VFpERDc4UjdLUkwvdS82UU1jWDJaczYwYnQ5U0NBSitYY1AyWDBsS2tUMnpj?=
 =?utf-8?B?dVZwVklCYmQ5TFg3bFh5dis5QmdlZW93SHhZSlQvbEdHSVJJdWtHOTJhNDZs?=
 =?utf-8?B?Zk8rQmF3dVVnR3RDYURwbld6ZmdzbXhsNnRUVnFIMHg2bnRYSEhwNUhZd3h1?=
 =?utf-8?B?Tjc3WEkxaFZORzRKZ1hGbThsTEhPOFhmYW9BZzlZNUhqaXVCcktZWXk0NGR2?=
 =?utf-8?Q?9Cl7CffyyKep8JsB3ZizETsjm?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4291.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0843ce25-d23e-4980-ae1b-08da6492a21d
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2022 05:43:37.4047 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2Xb2vkctuzjc3JQElErovkq80kSX7aJkMdgLq+Xh3O6KCw3MBSZXJzvBHobqolcOKBTJe8GRYJN5zyVW0tPMeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3071
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.136;
 envelope-from=shirley.zhao@intel.com; helo=mga12.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

R2V0IGl0LCB0aGFua3MgZm9yIG91ciBpbmZvcm1hdGlvbi4gVml2ZWsuIA0KDQpUaGFua3MuIA0K
LSBTaGlybGV5IA0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogVml2ZWsgR295
YWwgPHZnb3lhbEByZWRoYXQuY29tPiANClNlbnQ6IFR1ZXNkYXksIEp1bHkgMTIsIDIwMjIgODoz
MyBQTQ0KVG86IFpoYW8sIFNoaXJsZXkgPHNoaXJsZXkuemhhb0BpbnRlbC5jb20+DQpDYzogRHIu
IERhdmlkIEFsYW4gR2lsYmVydCA8ZGdpbGJlcnRAcmVkaGF0LmNvbT47IHZpcnRpby1mc0ByZWRo
YXQuY29tOyBUaG9tYXMgSHV0aCA8dGh1dGhAcmVkaGF0LmNvbT47IHFlbXUtZGV2ZWxAbm9uZ251
Lm9yZw0KU3ViamVjdDogUmU6IFtWaXJ0aW8tZnNdIFtRZW11XSBob3cgdG8gdXNlIHZpcmlvZnMg
aW4gcWVtdSB3aXRob3V0IE5VTUENCg0KT24gVHVlLCBKdWwgMTIsIDIwMjIgYXQgMDc6MDY6NTBB
TSArMDAwMCwgWmhhbywgU2hpcmxleSB3cm90ZToNCj4gSGksIGFsbCwNCj4gDQo+IEkgaGF2ZSBh
bm90aGVyIHF1ZXN0aW9uIHdhbnQgdG8gY29uc3VsdCB5b3UuIA0KPiBUbyBlbmFibGUgREFYIGlu
IHZpcnRpb2ZzLCBhY2NvcmRpbmcgdG8gdGhlIG1lbXUgaHR0cHM6Ly92aXJ0aW8tZnMuZ2l0bGFi
LmlvL2hvd3RvLXFlbXUuaHRtbC4gDQo+IEkgbmVlZCB0byBhZGQgImNhY2hlLXNpemU9MkciIGFz
IGJlbG93LiANCj4gLWRldmljZSANCj4gdmhvc3QtdXNlci1mcy1wY2kscXVldWUtc2l6ZT0xMDI0
LGNoYXJkZXY9Y2hhcjAsdGFnPW15ZnMsY2FjaGUtc2l6ZT0yRw0KPiANCj4gTXkgcWVtdSBjb21t
YW5kIGlzOiANCj4gc3VkbyBxZW11LXN5c3RlbS14ODZfNjQgLU0gcGMgLWNwdSBob3N0IC0tZW5h
YmxlLWt2bSAtc21wIDIgLW0gNEcgDQo+IC1kcml2ZSBpZj12aXJ0aW8sZmlsZT11YnVudHUuaW1n
IC1vYmplY3QgDQo+IG1lbW9yeS1iYWNrZW5kLWZpbGUsaWQ9bWVtLHNpemU9NEcsbWVtLXBhdGg9
L2Rldi9zaG0sc2hhcmU9b24gLW1hY2hpbmUgDQo+IHEzNSxtZW1vcnktYmFja2VuZD1tZW0gLWNo
YXJkZXYgc29ja2V0LGlkPWNoYXIwLHBhdGg9L3RtcC92aG9zdHFlbXUgDQo+IC1kZXZpY2UgDQo+
IHZob3N0LXVzZXItZnMtcGNpLHF1ZXVlLXNpemU9MTAyNCxjaGFyZGV2PWNoYXIwLHRhZz1teWZz
X3Jvb3QsY2FjaGUtc2kNCj4gemU9MkcgLWNoYXJkZXYgc3RkaW8sbXV4PW9uLGlkPW1vbiAtbW9u
IGNoYXJkZXY9bW9uLG1vZGU9cmVhZGxpbmUgDQo+IC1kZXZpY2UgdmlydGlvLXNlcmlhbC1wY2kg
LWRldmljZSB2aXJ0Y29uc29sZSxjaGFyZGV2PW1vbiAtdmdhIG5vbmUgDQo+IC1kaXNwbGF5IG5v
bmUNCj4gDQo+IEFuZCB2aXJ0aW9mc2QgY29tbWFuZCBpczoNCj4gc3VkbyAuL3ZpcnRpb2ZzZCAt
LXNvY2tldC1wYXRoPS90bXAvdmhvc3RxZW11IC1vIA0KPiBzb3VyY2U9L2hvbWUvc2hpcmxleS90
ZXN0ZGlyIC1vIGNhY2hlPWFsd2F5cw0KPiANCj4gQnV0IHRoZXJlIGlzIG5vIG9wdGlvbiBvZiAi
Y2FjaGUtc2l6ZSIgaW4gcWVtdSA2LjAsIGxpa2UgYmVsb3cuIFNvIGhvdyB0byBlbmFibGUgaXQ/
IA0KDQpIaSBTaGlybGV5LA0KDQpEQVggc3VwcG9ydCBpbiBxZW11IGlzIG5vdCB1cHN0cmVhbSB5
ZXQuIFdlIGFyZSBjYXJyeWluZyBEQVggcGF0Y2hlcyBvdXQgb2YgdGhlIHRyZWUgb24gYSBicmFu
Y2ggaGVyZS4NCg0KaHR0cHM6Ly9naXRsYWIuY29tL3ZpcnRpby1mcy9xZW11Ly0vY29tbWl0cy92
aXJ0aW8tZnMtZGV2DQoNClRoZXJlIGFyZSBzb21lIGNoYW5nZXMgcmVxdWlyZWQgYW5kIERhdmlk
IEdpbGJlcnQgaXMgbG9va2luZyBpbnRvIG1ha2luZyB0aGVzZSBjaGFuZ2VzLiBJIGFtIGhvcGlu
ZyBhdCBzb21lIHBvaW50IG9mIHRpbWUgdGhlc2UgcGF0Y2hlcyB3aWxsIG1ha2UgaW50byB1cHN0
cmVhbS4NCg0KU28gZm9yIHRoZSB0aW1lIGJlaW5nLCB0byB0ZXN0IERBWCwgeW91IHdpbGwgaGF2
ZSB0byBmZXRjaCBhYm92ZSBicmFuY2gsIGJ1aWxkIGl0IGFuZCB1c2UgdGhhdCBxZW11Lg0KDQpU
aGFua3MNClZpdmVrDQoNCj4gcWVtdS02LjAuMCQgcWVtdS1zeXN0ZW0teDg2XzY0IC1kZXZpY2Ug
dmhvc3QtdXNlci1mcy1wY2ksaGVscCANCj4gdmhvc3QtdXNlci1mcy1wY2kgb3B0aW9uczoNCj4g
ICBhY3BpLWluZGV4PTx1aW50MzI+ICAgIC0gIChkZWZhdWx0OiAwKQ0KPiAgIGFkZHI9PGludDMy
PiAgICAgICAgICAgLSBTbG90IGFuZCBvcHRpb25hbCBmdW5jdGlvbiBudW1iZXIsIGV4YW1wbGU6
IDA2LjAgb3IgMDYgKGRlZmF1bHQ6IC0xKQ0KPiAgIGFlcj08Ym9vbD4gICAgICAgICAgICAgLSBv
bi9vZmYgKGRlZmF1bHQ6IGZhbHNlKQ0KPiAgIGFueV9sYXlvdXQ9PGJvb2w+ICAgICAgLSBvbi9v
ZmYgKGRlZmF1bHQ6IHRydWUpDQo+ICAgYXRzPTxib29sPiAgICAgICAgICAgICAtIG9uL29mZiAo
ZGVmYXVsdDogZmFsc2UpDQo+ICAgYm9vdGluZGV4PTxpbnQzMj4NCj4gICBjaGFyZGV2PTxzdHI+
ICAgICAgICAgIC0gSUQgb2YgYSBjaGFyZGV2IHRvIHVzZSBhcyBhIGJhY2tlbmQNCj4gICBldmVu
dF9pZHg9PGJvb2w+ICAgICAgIC0gb24vb2ZmIChkZWZhdWx0OiB0cnVlKQ0KPiAgIGZhaWxvdmVy
X3BhaXJfaWQ9PHN0cj4NCj4gICBpbmRpcmVjdF9kZXNjPTxib29sPiAgIC0gb24vb2ZmIChkZWZh
dWx0OiB0cnVlKQ0KPiAgIGlvbW11X3BsYXRmb3JtPTxib29sPiAgLSBvbi9vZmYgKGRlZmF1bHQ6
IGZhbHNlKQ0KPiAgIG1pZ3JhdGUtZXh0cmE9PGJvb2w+ICAgLSBvbi9vZmYgKGRlZmF1bHQ6IHRy
dWUpDQo+ICAgbW9kZXJuLXBpby1ub3RpZnk9PGJvb2w+IC0gb24vb2ZmIChkZWZhdWx0OiBmYWxz
ZSkNCj4gICBtdWx0aWZ1bmN0aW9uPTxib29sPiAgIC0gb24vb2ZmIChkZWZhdWx0OiBmYWxzZSkN
Cj4gICBub3RpZnlfb25fZW1wdHk9PGJvb2w+IC0gb24vb2ZmIChkZWZhdWx0OiB0cnVlKQ0KPiAg
IG51bS1yZXF1ZXN0LXF1ZXVlcz08dWludDE2PiAtICAoZGVmYXVsdDogMSkNCj4gICBwYWNrZWQ9
PGJvb2w+ICAgICAgICAgIC0gb24vb2ZmIChkZWZhdWx0OiBmYWxzZSkNCj4gICBwYWdlLXBlci12
cT08Ym9vbD4gICAgIC0gb24vb2ZmIChkZWZhdWx0OiBmYWxzZSkNCj4gICBxdWV1ZS1zaXplPTx1
aW50MTY+ICAgIC0gIChkZWZhdWx0OiAxMjgpDQo+ICAgcm9tYmFyPTx1aW50MzI+ICAgICAgICAt
ICAoZGVmYXVsdDogMSkNCj4gICByb21maWxlPTxzdHI+DQo+ICAgcm9tc2l6ZT08dWludDMyPiAg
ICAgICAtICAoZGVmYXVsdDogNDI5NDk2NzI5NSkNCj4gICB0YWc9PHN0cj4NCj4gICB1c2UtZGlz
YWJsZWQtZmxhZz08Ym9vbD4gLSAgKGRlZmF1bHQ6IHRydWUpDQo+ICAgdXNlLXN0YXJ0ZWQ9PGJv
b2w+ICAgICAtICAoZGVmYXVsdDogdHJ1ZSkNCj4gICB2ZWN0b3JzPTx1aW50MzI+ICAgICAgIC0g
IChkZWZhdWx0OiA0Mjk0OTY3Mjk1KQ0KPiAgIHZpcnRpby1iYWNrZW5kPTxjaGlsZDx2aG9zdC11
c2VyLWZzLWRldmljZT4+DQo+ICAgdmlydGlvLXBjaS1idXMtbWFzdGVyLWJ1Zy1taWdyYXRpb249
PGJvb2w+IC0gb24vb2ZmIChkZWZhdWx0OiBmYWxzZSkNCj4gICB4LWF0cy1wYWdlLWFsaWduZWQ9
PGJvb2w+IC0gb24vb2ZmIChkZWZhdWx0OiB0cnVlKQ0KPiAgIHgtZGlzYWJsZS1sZWdhY3ktY2hl
Y2s9PGJvb2w+IC0gIChkZWZhdWx0OiBmYWxzZSkNCj4gICB4LWRpc2FibGUtcGNpZT08Ym9vbD4g
IC0gb24vb2ZmIChkZWZhdWx0OiBmYWxzZSkNCj4gICB4LWlnbm9yZS1iYWNrZW5kLWZlYXR1cmVz
PTxib29sPiAtICAoZGVmYXVsdDogZmFsc2UpDQo+ICAgeC1wY2llLWRldmVyci1pbml0PTxib29s
PiAtIG9uL29mZiAoZGVmYXVsdDogdHJ1ZSkNCj4gICB4LXBjaWUtZXh0Y2FwLWluaXQ9PGJvb2w+
IC0gb24vb2ZmIChkZWZhdWx0OiB0cnVlKQ0KPiAgIHgtcGNpZS1mbHItaW5pdD08Ym9vbD4gLSBv
bi9vZmYgKGRlZmF1bHQ6IHRydWUpDQo+ICAgeC1wY2llLWxua2N0bC1pbml0PTxib29sPiAtIG9u
L29mZiAoZGVmYXVsdDogdHJ1ZSkNCj4gICB4LXBjaWUtbG5rc3RhLWRsbGxhPTxib29sPiAtIG9u
L29mZiAoZGVmYXVsdDogdHJ1ZSkNCj4gICB4LXBjaWUtcG0taW5pdD08Ym9vbD4gIC0gb24vb2Zm
IChkZWZhdWx0OiB0cnVlKQ0KPiANCj4gDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+
IEZyb206IFpoYW8sIFNoaXJsZXkNCj4gU2VudDogRnJpZGF5LCBKdWx5IDgsIDIwMjIgODo0MCBB
TQ0KPiBUbzogRHIuIERhdmlkIEFsYW4gR2lsYmVydCA8ZGdpbGJlcnRAcmVkaGF0LmNvbT4NCj4g
Q2M6IFRob21hcyBIdXRoIDx0aHV0aEByZWRoYXQuY29tPjsgcWVtdS1kZXZlbEBub25nbnUub3Jn
OyANCj4gdmlydGlvLWZzQHJlZGhhdC5jb207IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVk
aGF0LmNvbT4NCj4gU3ViamVjdDogUkU6IFtRZW11XSBob3cgdG8gdXNlIHZpcmlvZnMgaW4gcWVt
dSB3aXRob3V0IE5VTUENCj4gDQo+IFllcywgdGhlIHFlbXUgdmVyc2lvbiBpcyB0b28gb2xkLiAN
Cj4gTXkgcHJldmlvdXMgcWVtdSB2ZXJzaW9uIGlzIDQuMiwgYW5kIEkgdXBncmFkZWQgaXQgaW50
byA2LjAsIGFuZCBpdCB3b3JrZWQgbm93LiANCj4gVGhhbmtzIGEgbG90LiANCj4gDQo+IC0gU2hp
cmxleQ0KPiANCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRHIuIERhdmlk
IEFsYW4gR2lsYmVydCA8ZGdpbGJlcnRAcmVkaGF0LmNvbT4NCj4gU2VudDogVHVlc2RheSwgSnVs
eSA1LCAyMDIyIDU6MzcgUE0NCj4gVG86IFpoYW8sIFNoaXJsZXkgPHNoaXJsZXkuemhhb0BpbnRl
bC5jb20+DQo+IENjOiBUaG9tYXMgSHV0aCA8dGh1dGhAcmVkaGF0LmNvbT47IHFlbXUtZGV2ZWxA
bm9uZ251Lm9yZzsgDQo+IHZpcnRpby1mc0ByZWRoYXQuY29tOyBTdGVmYW4gSGFqbm9jemkgPHN0
ZWZhbmhhQHJlZGhhdC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUWVtdV0gaG93IHRvIHVzZSB2aXJp
b2ZzIGluIHFlbXUgd2l0aG91dCBOVU1BDQo+IA0KPiAqIFpoYW8sIFNoaXJsZXkgKHNoaXJsZXku
emhhb0BpbnRlbC5jb20pIHdyb3RlOg0KPiA+IFRoYW5rcyBmb3IgdGhlIGluZm9ybWF0aW9uLiAN
Cj4gPiBZZXMsIEkgYWxzbyBmb3VuZCB0aGUgbWVtb3J5IGJhY2tlbmQgb3B0aW9ucyBvbiBzMzkw
eCwgYW5kIGFsc28gY29weSB0aGUgY29tbWFuZCB0byB4ODYsIGJ1dCBmYWlsZWQuIA0KPiA+IA0K
PiA+IFRoZSBmb2xsb3dpbmcgaXMgdGhlIGNvbW1hbmQgdXNlZCB0byBzdGFydCBxZW11ICsgdmly
dGlvZnMgKyB1YnVudHUgMjAuMDQuIA0KPiA+IE9uZSBpcyB3b3JrZWQgd2VsbCB1c2luZyBOVU1B
LCBhbm90aGVyIG9uZSBpcyBmYWlsZWQgd2l0aG91dCBOVU1BLiANCj4gPiBJcyB0aGVyZSBhbnl0
aGluZyB3cm9uZz8gDQo+ID4gDQo+ID4gVGhlIHdvcmtlZCBvbmUgd2l0aCBOVU1BIG9wdGlvbnM6
IA0KPiA+IA0KPiA+IHFlbXUtc3lzdGVtLXg4Nl82NCAtTSBwYyAtY3B1IGhvc3QgLS1lbmFibGUt
a3ZtIC1zbXAgMiAtbSA0RyAtb2JqZWN0IA0KPiA+IG1lbW9yeS1iYWNrZW5kLWZpbGUsaWQ9bWVt
LHNpemU9NEcsbWVtLXBhdGg9L2Rldi9zaG0sc2hhcmU9b24gLW51bWEgDQo+ID4gbm9kZSxtZW1k
ZXY9bWVtIC1jaGFyZGV2IHNvY2tldCxpZD1jaGFyMCxwYXRoPS90bXAvdmZzZC5zb2NrIC1kZXZp
Y2UgDQo+ID4gdmhvc3QtdXNlci1mcy1wY2kscXVldWUtc2l6ZT0xMDI0LGNoYXJkZXY9Y2hhcjAs
dGFnPW15ZnMgLWNoYXJkZXYgDQo+ID4gc3RkaW8sbXV4PW9uLGlkPW1vbiAtbW9uIGNoYXJkZXY9
bW9uLG1vZGU9cmVhZGxpbmUgLWRldmljZSANCj4gPiB2aXJ0aW8tc2VyaWFsLXBjaSAtZGV2aWNl
IHZpcnRjb25zb2xlLGNoYXJkZXY9bW9uIC12Z2Egbm9uZSAtZGlzcGxheSANCj4gPiBub25lIC1k
cml2ZSBpZj12aXJ0aW8sZmlsZT11YnVudHUuaW1nDQo+ID4gDQo+ID4gVGhlIGZhaWxlZCBvbmUg
d2l0aG91dCBOVU1BIG9wdGlvbnM6IA0KPiA+IA0KPiA+IHFlbXUtc3lzdGVtLXg4Nl82NCAtTSBw
YyAtY3B1IGhvc3QgLS1lbmFibGUta3ZtIC1zbXAgMiAtbSA0RyAtb2JqZWN0IA0KPiA+IG1lbW9y
eS1iYWNrZW5kLWZpbGUsaWQ9bWVtLHNpemU9NEcsbWVtLXBhdGg9L2Rldi9zaG0sc2hhcmU9b24g
DQo+ID4gLW1hY2hpbmUgcTM1LG1lbW9yeS1iYWNrZW5kPW1lbSAtY2hhcmRldiANCj4gPiBzb2Nr
ZXQsaWQ9Y2hhcjAscGF0aD0vdG1wL3Zmc2Quc29jaw0KPiA+IC1kZXZpY2Ugdmhvc3QtdXNlci1m
cy1wY2kscXVldWUtc2l6ZT0xMDI0LGNoYXJkZXY9Y2hhcjAsdGFnPW15ZnMNCj4gPiAtY2hhcmRl
diBzdGRpbyxtdXg9b24saWQ9bW9uIC1tb24gY2hhcmRldj1tb24sbW9kZT1yZWFkbGluZSAtZGV2
aWNlIA0KPiA+IHZpcnRpby1zZXJpYWwtcGNpIC1kZXZpY2UgdmlydGNvbnNvbGUsY2hhcmRldj1t
b24gLXZnYSBub25lIC1kaXNwbGF5IA0KPiA+IG5vbmUgLWRyaXZlIGlmPXZpcnRpbyxmaWxlPXVi
dW50dS5pbWcNCj4gDQo+IFdoYXQgZXJyb3IgZGlkIGl0IGdpdmU/DQo+IA0KPiAyMC4wNCBpcyBx
dWl0ZSBvbGQsIHdoYXQgcWVtdSB2ZXJzaW9uIGlzIGl0Pw0KPiANCj4gSSdkIGhhdmUgdG8gY2hl
Y2sgd2hlbiB0aGUgbWVtZGV2PSB3ZW50IGluLg0KPiANCj4gRGF2ZQ0KPiANCj4gPiANCj4gPiBU
aGFua3MuIA0KPiA+IC0gU2hpcmxleQ0KPiA+IA0KPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tDQo+ID4gRnJvbTogRHIuIERhdmlkIEFsYW4gR2lsYmVydCA8ZGdpbGJlcnRAcmVkaGF0LmNv
bT4NCj4gPiBTZW50OiBUdWVzZGF5LCBKdWx5IDUsIDIwMjIgNDowNCBQTQ0KPiA+IFRvOiBUaG9t
YXMgSHV0aCA8dGh1dGhAcmVkaGF0LmNvbT4NCj4gPiBDYzogWmhhbywgU2hpcmxleSA8c2hpcmxl
eS56aGFvQGludGVsLmNvbT47IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZzsgDQo+ID4gdmlydGlvLWZz
QHJlZGhhdC5jb207IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4NCj4gPiBT
dWJqZWN0OiBSZTogW1FlbXVdIGhvdyB0byB1c2UgdmlyaW9mcyBpbiBxZW11IHdpdGhvdXQgTlVN
QQ0KPiA+IA0KPiA+ICogVGhvbWFzIEh1dGggKHRodXRoQHJlZGhhdC5jb20pIHdyb3RlOg0KPiA+
ID4gT24gMDUvMDcvMjAyMiAwMy4wMiwgWmhhbywgU2hpcmxleSB3cm90ZToNCj4gPiA+ID4gSGks
IGFsbCwNCj4gPiA+ID4gDQo+ID4gPiA+IEkgd2FudCB0byB1c2UgdmlydGlvZnMgdG8gc2hhcmUg
Zm9sZGVyIGJldHdlZW4gaG9zdCBhbmQgZ3Vlc3QuDQo+ID4gPiA+IA0KPiA+ID4gPiAgRnJvbSB0
aGUgZ3VpZGUsIGl0IG11c3Qgc2V0IHRoZSBOVU1BIG5vZGUuDQo+ID4gPiA+IGh0dHBzOi8vdmly
dGlvLWZzLmdpdGxhYi5pby9ob3d0by1xZW11Lmh0bWwNCj4gPiA+ID4gDQo+ID4gPiA+IEJ1dCBt
eSBndWVzdCBkb2VzbuKAmXQgc3VwcG9ydCBOVU1BLg0KPiA+ID4gPiANCj4gPiA+ID4gSXMgdGhl
cmUgYW55IGd1aWRlIHRvIHVzZSBxZW11ICsgdmlydGlvZnMgd2l0aG91dCBOVU1BPw0KPiA+ID4g
PiANCj4gPiA+ID4gT3IgZG9lcyBxZW11IGhhdmUgYW55IHBsYW4gdG8gc3VwcG9ydCBpdD8NCj4g
PiA+IA0KPiA+ID4gIEhpIQ0KPiA+ID4gDQo+ID4gPiBBdCBsZWFzdCBvbiBzMzkweCwgeW91IGNh
biBhbHNvIHNwZWNpZnkgdGhlIG1lbW9yeSBiYWNrZW5kIHZpYSB0aGUgDQo+ID4gPiAtbWFjaGlu
ZSBvcHRpb24gaW5zdGVhZCBvZiB1c2luZyB0aGUgLW51bWEgb3B0aW9uLCBlLmcuOg0KPiA+ID4g
DQo+ID4gPiAgcWVtdS1zeXN0ZW0tczM5MHggLW1hY2hpbmUgbWVtb3J5LWJhY2tlbmQ9bWVtIFwN
Cj4gPiA+ICAgLW9iamVjdCBtZW1vcnktYmFja2VuZC1maWxlLGlkPW1lbSwuLi4NCj4gPiA+IA0K
PiA+ID4gTm90IHN1cmUgd2hldGhlciB0aGF0IHdvcmtzIG9uIG90aGVyIGFyY2hpdGVjdHVyZXMs
IHRvbywgdGhvdWdoLiANCj4gPiA+IFN0ZWZhbiwgRGF2aWQsIGRvIHlvdSBrbm93Pw0KPiA+IA0K
PiA+IFJpZ2h0LCB0aGF0J3MgdGhlIHdheSBJIGRvIGl0IG9uIHg4Ni4NCj4gPiBXZSB3cm90ZSB2
aXJ0aW9mcyBiZWZvcmUgdGhlIG1lbW9yeS1iYWNrZW5kIG9wdGlvbiBleGlzdGVkLCB3aGljaCBp
cyB3aHkgdGhlIG9sZCBkb2NzIHRhbGsgYWJvdXQgdXNpbmcgdGhlIE5VTUEgc3R1ZmYuDQo+ID4g
DQo+ID4gRGF2ZQ0KPiA+IA0KPiA+ID4gIFRob21hcw0KPiA+ID4gDQo+ID4gLS0NCj4gPiBEci4g
RGF2aWQgQWxhbiBHaWxiZXJ0IC8gZGdpbGJlcnRAcmVkaGF0LmNvbSAvIE1hbmNoZXN0ZXIsIFVL
DQo+ID4gDQo+IC0tDQo+IERyLiBEYXZpZCBBbGFuIEdpbGJlcnQgLyBkZ2lsYmVydEByZWRoYXQu
Y29tIC8gTWFuY2hlc3RlciwgVUsNCj4gDQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fDQo+IFZpcnRpby1mcyBtYWlsaW5nIGxpc3QNCj4gVmlydGlvLWZz
QHJlZGhhdC5jb20NCj4gaHR0cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5m
by92aXJ0aW8tZnMNCg0K

