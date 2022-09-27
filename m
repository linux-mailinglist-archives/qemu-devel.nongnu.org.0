Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D645ECFAB
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 23:59:28 +0200 (CEST)
Received: from localhost ([::1]:58288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odIbu-0000Kp-SD
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 17:59:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1odIZr-00062e-NJ
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 17:57:19 -0400
Received: from mga17.intel.com ([192.55.52.151]:39052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1odIZo-0001if-BV
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 17:57:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664315836; x=1695851836;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4KoojSjywy8ugDl4DL1Wi7EKHukhjkPYJsUtVA/IAk0=;
 b=Xw+YWWsKFnG18MJx47RcdEvtD/qGs9CyIuut5iHLKwNBMGhv0NKipeFU
 HBWTCN76eXPeQkDTKvvsxqujfywmUYKGLcEd86AhgaEfM5nbpuF3Pk5eN
 AtE0XL1kEuy1kkljKA9Mao2vsK5WonqNBKkwdAiOVVgquH/txV6uloWg1
 //jxDLmvBfMC4ef7tu7UkYz6csWhladJegmTmYRnNk5C3+sic9887vyWL
 /iECr2xaL4rFbuClY8oDpPBL6peKl7Fm6ZJNCzw/PIHnijCswM11LVeiC
 5ae6kqAMxCIIUxp4dJgfnwHOcYiS0948ikCpX6YhTy57Iy0+Owt+Kibpj g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="281812249"
X-IronPort-AV: E=Sophos;i="5.93,350,1654585200"; d="scan'208";a="281812249"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2022 14:57:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="764038382"
X-IronPort-AV: E=Sophos;i="5.93,350,1654585200"; d="scan'208";a="764038382"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga001.fm.intel.com with ESMTP; 27 Sep 2022 14:57:07 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 27 Sep 2022 14:57:07 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 27 Sep 2022 14:57:06 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 27 Sep 2022 14:57:06 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 27 Sep 2022 14:57:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ImJWQtNoLHvrFNc0lBkVniAMsZCXSFLVwgLWqIGYp0fZnIp+H5ZA8WzfjLYBN2dvpLQNvlRKk/oyrCmgHIkolk0smQqZnOupy4xlbezV6xuBb9wYmqZO8oE5+v5qM/C5ltTZ7ulK/83nLVgOPhR9ACIEejs8OJwRek80TUNdSh2hD7bCIqvrEh6fec7/y/SmWT5863ItTYVCtu/NZ2VQHJUPfr4DLM1iyjDnBj3N9xUdWXoPJ4/1G48WBMyBYB2fV/1BHmeEU9KYSTDbCxedcck5IQauoPjmWhCBEyunbCBsSSYiyokzZT5p+66wkk84usvxzLdbY3Ea9y45ZKXPVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4KoojSjywy8ugDl4DL1Wi7EKHukhjkPYJsUtVA/IAk0=;
 b=hpQ/zTiqlgsJncwSyvTRxlVv+WxIxq436YaLQuNYOrXz38peFgAjtVg5c4ND8gdhgzkiJuahZvQmLrQRnqb8PQjceRRPkqiJHk7PqRJdRYrN/LIP8YATrkUp4/ruM3+yvkrOfcR9ds28xfdzyW3AaxzemvRZBl4/rf3Ir72x+czhUJvr05sn4ketIuT5kA+RjeV8hBmXvhUxCwaNhgjQ7f5SuOBI8lmFKsxlQWorDQLS7CvbgAFvgO9hwoLrYQM4elc226x1RcqAQ0at3oSaI07zzA+n+DvfvzgIejD4LHP7maMlMNNhyMoW8gPH2gSpH8F7qXN5WiGhun5q5ga87w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:443::14)
 by BL3PR11MB6314.namprd11.prod.outlook.com (2603:10b6:208:3b1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26; Tue, 27 Sep
 2022 21:57:04 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::8f45:e207:3c54:c488]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::8f45:e207:3c54:c488%7]) with mapi id 15.20.5654.025; Tue, 27 Sep 2022
 21:57:04 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
CC: Gerd Hoffmann <kraxel@redhat.com>, Antonio Caggiano
 <antonio.caggiano@collabora.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "gert.wollny@collabora.com"
 <gert.wollny@collabora.com>, "Michael S. Tsirkin" <mst@redhat.com>
Subject: RE: [PATCH v2 4/4] virtio-gpu: Don't require udmabuf when blob
 support is enabled
Thread-Topic: [PATCH v2 4/4] virtio-gpu: Don't require udmabuf when blob
 support is enabled
Thread-Index: AQHYx181nHFXzgjqA0+0vLu+GpW3oK3tAkyAgAUbrQCAAOqfgIAAJPmAgAC5sIA=
Date: Tue, 27 Sep 2022 21:57:04 +0000
Message-ID: <IA0PR11MB7185B4E8785A79A5DC2084EDF8559@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20220913105022.81953-1-antonio.caggiano@collabora.com>
 <20220913105022.81953-5-antonio.caggiano@collabora.com>
 <20220923123219.ofn2ygm4knljo6w2@sirius.home.kraxel.org>
 <6fe0d770-1a95-3d8f-6a75-a596f26aad54@collabora.com>
 <20220927083225.gdgo6tkv4ssw73yd@sirius.home.kraxel.org>
 <63cc34e3-5244-e7a2-3605-ab60d159f853@collabora.com>
In-Reply-To: <63cc34e3-5244-e7a2-3605-ab60d159f853@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.500.17
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|BL3PR11MB6314:EE_
x-ms-office365-filtering-correlation-id: 1e652b77-deb1-4510-c4aa-08daa0d336c2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: woScmwO7k6SC9cut8wwbpigmSB6QINCYXQw8e0ERj/4L5zNVGW8HsVQGmOgJYeN2RP4QPqHgPbqN9FprjhuJxgpjFUPgMEpGOX+FSCHxKoP9+5ZUaEcm+Pw5JTn0A+b4BBkWJzigjn0hrMwchozoGNNuK4emrN7qHwAnco31C67zIcNA5PrjSICRJRrS2eikWEZXDDf+bs6fpzPkCLjF5mOuWwLPoHmQhAOcaYCUKlHzFo8bOORF7LG7wRl3Vvs7WiGtz1xoZ1y/CnfyJzDhl2hASZCFe98f5Sxqp2J+51VgcnVaFMkLjO8vjylYzfGGLjAh0mK2acBp+HotBWKWZMcfCWxsaafrd6TRQHvEYGKehHvgOgZfuKb6xB500/Wr3cGmPHahEvAljR5Ko8FLOlT+eHtkqR/9jBSbfpalxOxFzJ2z1sR89QrgVQdh/+jUv6lfyLPXk2mjsCRRv6fLg1F5cLwWlGK+ZzvFlY5cQUAFHYLjBc5REND8kSw4FFrY5PbjZXxnJmQ2+lViVP9kjiQsLdrVFnArmu7tQXnJgvf75j1b1Fxo0/R2rmBAqDXQe9q7Dmu6sAQ645RU8CNM76ut9xtlWhcodDfwP3IZt45f5hq0xUUaCgKfSu5+9g6+hxfAi2CR3yAMa2SAPC4qyR577bDtUvcdOYRAGlDMgfMhA89CP5j79C8lQO8mHN7MB2xG2IL9HhgghTALPco1JA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(39860400002)(396003)(366004)(346002)(376002)(451199015)(86362001)(2906002)(122000001)(53546011)(83380400001)(66946007)(41300700001)(7696005)(82960400001)(6506007)(76116006)(52536014)(478600001)(9686003)(5660300002)(38100700002)(8936002)(71200400001)(26005)(966005)(38070700005)(186003)(66476007)(55016003)(54906003)(33656002)(6916009)(4326008)(8676002)(66556008)(66446008)(64756008)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K2dIODBTRU5rejlXR2FPYjR1UnV3WlJHWSt1TFlkT3FYUzRKNjRwb0hKaHJp?=
 =?utf-8?B?dFczWmV5dEFKeXdvMXlDSVJHZWdMcnh0SHViUTd5d1YybnExbkFsdW9sZFlN?=
 =?utf-8?B?QWJYM3lYUVVVZG1iSG15MXhaKzRaR2l4eEpYdTJHOWVBREMzQmJnZ0FZSE1o?=
 =?utf-8?B?Y0g1WmNGWFp2UklKTzFpZ0VvalV4enQySVp2aXJ1R2pnMU1zb0N1WjlIblM4?=
 =?utf-8?B?VkhIYlhKNVU3Q1JKS1E3eFZReFF0d2IxMFhYMlB5V2I0VlRYeStvTDVVdzlD?=
 =?utf-8?B?QXlQVjV4T0t4d2h3U0FTdlQzQVJNRTVYM0sybWNmdW9CcXEvZzJETXRsSmxK?=
 =?utf-8?B?QzdGVXU2RlNCWTdOSk5UeXpPSTZWaitkcE4raVk5L1VrOGZOc0hHdWRwUTZv?=
 =?utf-8?B?SHlybmZ2U05CQlhFYlZtdGlXWVcwcmtBNzE3RWxjdXIvYStWVWhPcnVjS1dk?=
 =?utf-8?B?UC9LSmYxL1R1bm1zTjVjTllrMTVlMEUyLzFIaWhSMXN6UG10WTR4dllTb0li?=
 =?utf-8?B?Y3prZXpMZ0Vub3NQODFVVmV3N0ZEbHpPUUs0VjdrZC8rOFdGWmNFbnRnelMw?=
 =?utf-8?B?dnNsd3ZXZEJMWGYxYlV2THJUYlNWVjc3TlAxeWlGV1pIUmNuVWxualdrYkxC?=
 =?utf-8?B?bHI2WURyUWNnZmtWOW1EaVRuTGpSdXNyYmxJYzZKU0FYa1dOUjdXOFhSNlNk?=
 =?utf-8?B?RmMwZ1Uvb1JPYUQza2V2cFVaT1U0cDRyME9XTkVLMW5HNGM4bXYrbitVZ01x?=
 =?utf-8?B?T0NBN2UvcmE1aFlVbHU4OFE2OHdQcU5LQlFDRllBYVh0NGhQYXVYczNOemFx?=
 =?utf-8?B?S3JiR3ZORklrSjhKbUZSTDRZS2JpYUovbjExT0Qxc2FrM0NkcFNYbTRFTmV2?=
 =?utf-8?B?bVMzOWFGNkFkRS9BZ1crSG5zalFVL2R0dDFiQklCT3pPL244VWlMbkQzMU52?=
 =?utf-8?B?Y3hDY2dhbWJiK2J4OFRVN0l5TFk5YlV5cGdmVDUrQVBrK05VbUJrSmJoVkNr?=
 =?utf-8?B?U0o3RUh5NUdPTUxPZjVSUHJ0KzVZR3hEb2JOaHoxK0U0Y3VCbTgxK0xZY3VQ?=
 =?utf-8?B?ZXo4RDFqSEVYa3UwSDNobHBIVjl6VWNOY2lobFllMVJTK2Z2c2FUNys4SXNu?=
 =?utf-8?B?dURvZWJEUFN0UjcyTW5zaUcwVE9uZm8zZWdDMTh4TURkYWlydVY0L3J0K1lu?=
 =?utf-8?B?eC8vRFdqZWVhYUtKeHhqMDlmMWZmVDBBdDY3S0lJby84WElDa0NmUGJ3eElR?=
 =?utf-8?B?a0lBRVpWejBaY1Q5N0hFdm1RZkFaRm83ckhKdG9mNEdzTFVvMGE0SDZXa2hq?=
 =?utf-8?B?ajVyYlhaamtoV0dseEdIbnE2RnpFM2FtUHZucDZtVVd6eXBqRWp3Z3RKdEoy?=
 =?utf-8?B?Q0YxVTBqMnBNSzdYeldJQzRtMWZvZ3NHSWtWYkFoNTd1aVdLWVVqMEdmS1lk?=
 =?utf-8?B?NnpzWGxYczVlY2JNamg5dHd2UzgvT2JsTzVheTNLK3JzRnhsRVI2aktPNWxT?=
 =?utf-8?B?ek1EbTZmY1FNZm8wVUcxcDkvOWRva1pxZUhsK2p0Q2F0QWxMMlZoMFRmcWVF?=
 =?utf-8?B?cXIwMWlxYmp3M3JXMUxlN2wxNm44Wmh5SG00VUF0TWdmWjJmK1ZXenUwSkY5?=
 =?utf-8?B?bG9BQXQrYmllNitqUUtra0JMUnpUeTkwRWsyQzZpSmZKSTFmOG1wcWg3WkRZ?=
 =?utf-8?B?djZldW55elJaRWlGV1doKzMwdFMzeW5EUzk2aFJINHBBTlhHc0hFenkrcDFJ?=
 =?utf-8?B?QThOV2pEZ3dSQU1FQ1NCTkZWZktMenBPd0IzWFAxcmpId1gyaXFmNkFOeXRO?=
 =?utf-8?B?My9FMHFVV2cvMW45cHZFeGlMQkd2QUJkUjJobGY2RTY4TnZpVURzVVZlck9o?=
 =?utf-8?B?VHJEM3h2U2lTcWRTL2lKRXk4aThpaE9kVVpMaWl0dFRHMVZCM2ZhV1lvMUxE?=
 =?utf-8?B?emN4K2t0ZDBSQTQvckllSXIvZXBFNmZ2bTEweXB2VzBjU2duTm1nUjJwL2N5?=
 =?utf-8?B?R2hvaWx5bUhQODF6TlBURUswaytmQzNVZFRPNVZoTXhpcGcrVXZXVmF4anlJ?=
 =?utf-8?B?dUltekw2S2lIQlBQRlNETFRDNC9PVzBzdkx5VGthSXR1ZEtJOVpya1FJYzZ3?=
 =?utf-8?B?YVNWRTVYc2FxR1JWeWlDT045YkozVHRvZmJwd1FiTXJRRXRJU0lISWlmdy96?=
 =?utf-8?B?enc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e652b77-deb1-4510-c4aa-08daa0d336c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2022 21:57:04.3467 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U/O1omsXEDo3DWZbVwKCftzZwJopg6Ca/Cb2VgYptnsalnlN+X60anxkgOsB7xZkBnzicvpGggwYuHSKzmpdkKD8lsUD1hBa7vQ9W5XKiIw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6314
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.151;
 envelope-from=vivek.kasireddy@intel.com; helo=mga17.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

SGkgRG1pdHJ5LA0KDQo+IA0KPiBPbiA5LzI3LzIyIDExOjMyLCBHZXJkIEhvZmZtYW5uIHdyb3Rl
Og0KPiA+IE9uIE1vbiwgU2VwIDI2LCAyMDIyIGF0IDA5OjMyOjQwUE0gKzAzMDAsIERtaXRyeSBP
c2lwZW5rbyB3cm90ZToNCj4gPj4gT24gOS8yMy8yMiAxNTozMiwgR2VyZCBIb2ZmbWFubiB3cm90
ZToNCj4gPj4+IE9uIFR1ZSwgU2VwIDEzLCAyMDIyIGF0IDEyOjUwOjIyUE0gKzAyMDAsIEFudG9u
aW8gQ2FnZ2lhbm8gd3JvdGU6DQo+ID4+Pj4gRnJvbTogRG1pdHJ5IE9zaXBlbmtvIDxkbWl0cnku
b3NpcGVua29AY29sbGFib3JhLmNvbT4NCj4gPj4+Pg0KPiA+Pj4+IEhvc3QgYmxvYnMgZG9uJ3Qg
bmVlZCB1ZG1hYnVmLCBpdCdzIG9ubHkgbmVlZGVkIGJ5IGd1ZXN0IGJsb2JzLiBUaGUgaG9zdA0K
PiA+Pj4+IGJsb2JzIGFyZSB1dGlsaXplZCBieSB0aGUgTWVzYSB2aXJnbCBkcml2ZXIgd2hlbiBw
ZXJzaXN0ZW50IG1lbW9yeSBtYXBwaW5nDQo+ID4+Pj4gaXMgbmVlZGVkIGJ5IGEgR0wgYnVmZmVy
LCBvdGhlcndpc2UgdmlyZ2wgZHJpdmVyIGRvZXNuJ3QgdXNlIGJsb2JzLg0KPiA+Pj4+IFBlcnNp
c3RlbnQgbWFwcGluZyBzdXBwb3J0IGJ1bXBzIEdMIHZlcnNpb24gZnJvbSA0LjMgdG8gNC41IGlu
IGd1ZXN0Lg0KPiA+Pj4+IFJlbGF4IHRoZSB1ZG1hYnVmIHJlcXVpcmVtZW50Lg0KPiA+Pj4NCj4g
Pj4+IFdoYXQgYWJvdXQgYmxvYj1vbix2aXJnbD1vZmY/DQo+ID4+Pg0KPiA+Pj4gSW4gdGhhdCBj
YXNlIHFlbXUgbWFuYWdlcyB0aGUgcmVzb3VyY2VzIGFuZCBjb250aW51ZWQgdG8gcmVxdWlyZQ0K
PiA+Pj4gdWRtYWJ1Zi4NCj4gPj4NCj4gPj4gVGhlIHVkbWFidWYgaXMgdXNlZCBvbmx5IGJ5IHRo
ZSBibG9iIHJlc291cmNlLWNyZWF0aW9uIGNvbW1hbmQgaW4gUWVtdS4NCj4gPj4gSSBjb3VsZG4n
dCBmaW5kIHdoZW4gd2UgY291bGQgaGl0IHRoYXQgdWRtYWJ1ZiBjb2RlIHBhdGggaW4gUWVtdSBi
ZWNhdXNlDQo+ID4+IEJMT0JfTUVNX0dVRVNUIHJlc291cmNlIHR5cGUgaXMgdXNlZCBvbmx5IGJ5
IGNyb3N2bStWZW51cyB3aGVuIGNyb3N2bQ0KPiA+PiB1c2VzIGEgZGVkaWNhdGVkIHJlbmRlci1z
ZXJ2ZXIgZm9yIHZpcmdscmVuZGVyZXIuDQo+ID4NCj4gPiBSZWNlbnQgZW5vdWdoIGxpbnV4IGd1
ZXN0IGRyaXZlciB3aWxsIHVzZSBCTE9CX01FTV9HVUVTVCByZXNvdXJjZXMNCj4gPiB3aXRoIGJs
b2I9b24gKyB2aXJnbD1vZmYNCj4gDQo+IEkgcmVwcm9kdWNlZCB0aGlzIGNhc2UgdG9kYXkgdXNp
bmcgIi1kZXZpY2UNCj4gdmlydGlvLWdwdS1kZXZpY2UsYmxvYj10cnVlIi4gWW91J3JlIHJpZ2h0
LCBpdCBkb2Vzbid0IHdvcmsgd2l0aG91dCB1ZG1hYnVmLg0KPiANCj4gWyAgICA4LjM2OTMwNl0g
dmlydGlvX2dwdV9kZXF1ZXVlX2N0cmxfZnVuYzogOTAgY2FsbGJhY2tzIHN1cHByZXNzZWQNCj4g
WyAgICA4LjM2OTMxMV0gW2RybTp2aXJ0aW9fZ3B1X2RlcXVldWVfY3RybF9mdW5jXSAqRVJST1Iq
IHJlc3BvbnNlDQo+IDB4MTIwMCAoY29tbWFuZCAweDEwNSkNCj4gWyAgICA4LjM3MTg0OF0gW2Ry
bTp2aXJ0aW9fZ3B1X2RlcXVldWVfY3RybF9mdW5jXSAqRVJST1IqIHJlc3BvbnNlDQo+IDB4MTIw
NSAoY29tbWFuZCAweDEwNCkNCj4gWyAgICA4LjM3MzA4NV0gW2RybTp2aXJ0aW9fZ3B1X2RlcXVl
dWVfY3RybF9mdW5jXSAqRVJST1IqIHJlc3BvbnNlDQo+IDB4MTIwMCAoY29tbWFuZCAweDEwNSkN
Cj4gWyAgICA4LjM3NjI3M10gW2RybTp2aXJ0aW9fZ3B1X2RlcXVldWVfY3RybF9mdW5jXSAqRVJS
T1IqIHJlc3BvbnNlDQo+IDB4MTIwNSAoY29tbWFuZCAweDEwNCkNCj4gWyAgICA4LjQxNjk3Ml0g
W2RybTp2aXJ0aW9fZ3B1X2RlcXVldWVfY3RybF9mdW5jXSAqRVJST1IqIHJlc3BvbnNlDQo+IDB4
MTIwMCAoY29tbWFuZCAweDEwNSkNCj4gWyAgICA4LjQxODg0MV0gW2RybTp2aXJ0aW9fZ3B1X2Rl
cXVldWVfY3RybF9mdW5jXSAqRVJST1IqIHJlc3BvbnNlDQo+IDB4MTIwNSAoY29tbWFuZCAweDEw
NCkNCj4gDQo+IEkgc2VlIG5vdyB3aHkgeW91J3JlIHdhbnRpbmcgdG8ga2VlcCB0aGUgdWRtYWJ1
ZiByZXF1aXJlbWVudCBmb3INCj4gYmxvYj1vbix2aXJnbD1vZmYuDQo+IA0KPiANCj4gPj4gICAt
IC9kZXYvdWRtYWJ1ZiBpc24ndCBhY2Nlc3NpYmxlIGJ5IG5vcm1hbCB1c2VyDQo+ID4+ICAgLSB1
ZG1hYnVmIGRyaXZlciBpc24ndCBzaGlwcGVkIGJ5IGFsbCBvZiB0aGUgcG9wdWxhciBMaW51eCBk
aXN0cm9zLA0KPiA+PiBmb3IgZXhhbXBsZSBEZWJpYW4gZG9lc24ndCBzaGlwIGl0DQo+ID4NCj4g
PiBUaGF0J3Mgd2h5IGJsb2IgcmVzb3VyY2VzIGFyZSBvZmYgYnkgZGVmYXVsdC4NCj4gPg0KPiA+
PiBCZWNhdXNlIG9mIGFsbCBvZiB0aGUgYWJvdmUsIEkgZG9uJ3QgdGhpbmsgaXQgbWFrZXMgc2Vu
c2UgdG8NCj4gPj4gaGFyZC1yZXF1aXJlIHVkbWFidWYgYXQgdGhlIHN0YXJ0IG9mIFFlbXUuIEl0
J3MgbXVjaCBiZXR0ZXIgdG8gZmFpbA0KPiA+PiByZXNvdXJjZSBjcmVhdGlvbiBkeW5hbWljYWxs
eS4NCj4gPg0KPiA+IERpc2FncmVlLiAgV2hlbiB2aXJnbC92ZW51cyBpcyBlbmFibGVkLCB0aGVu
IHllcywgcWVtdSB3b3VsZCBsZXQNCj4gPiB2aXJnbHJlbmRlcmVyIG1hbmFnZSByZXNvdXJjZXMg
YW5kIEknbSBvayB3aXRoIHdoYXRldmVyIHJlcXVpcmVtZW50cw0KPiA+IHZpcmdscmVuZGVyZXIg
aGFzLiAgV2hlbiBxZW11IG1hbmFnZXMgcmVzb3VyY2VzIGJ5IGl0c2VsZiB1ZG1hYnVmIGlzDQo+
ID4gYSBoYXJkIHJlcXVpcmVtZW50IGZvciBibG9iIHN1cHBvcnQgdGhvdWdoLg0KPiANCj4gTGV0
J3MgdHJ5IHRvIHJlbGF4IHRoZSB1ZG1hYnVmIHJlcXVpcmVtZW50IG9ubHkgZm9yIGJsb2I9b24s
dmlyZ2w9b24uDQo+IEknbGwgdXBkYXRlIHRoaXMgcGF0Y2guDQpbS2FzaXJlZGR5LCBWaXZla10g
SW4gYWRkaXRpb24gdG8gd2hhdCBHZXJkIG1lbnRpb25lZCBhbmQgd2hhdCB5b3UgaGF2ZQ0KZGlz
Y292ZXJlZCwgSSB3YW50ZWQgdG8gYnJpZWZseSBhZGQgdGhhdCB3ZSB1c2UgVWRtYWJ1Zi9HdWVz
dCBCbG9icyBmb3INCkhlYWRsZXNzIEdQVSBwYXNzdGhyb3VnaCB1c2UtY2FzZXMgKGJsb2I9b24g
YW5kIHZpcmdsPW9mZikuIEhlcmUgYXJlIHNvbWUNCm1vcmUgZGV0YWlscyBhYm91dCBvdXIgdXNl
LWNhc2U6DQpodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvbWVzYS9tZXNhLy0vbWVyZ2Vf
cmVxdWVzdHMvOTU5MiNub3RlXzg1MTMxNA0KDQpUaGFua3MsDQpWaXZlaw0KDQo+IA0KPiBUaGFu
ayB5b3UgdmVyeSBtdWNoIGZvciB0aGUgcmV2aWV3IQ0KPiANCj4gLS0NCj4gQmVzdCByZWdhcmRz
LA0KPiBEbWl0cnkNCj4gDQoNCg==

