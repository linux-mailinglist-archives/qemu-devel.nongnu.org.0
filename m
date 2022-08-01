Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D7F5863C2
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 07:35:49 +0200 (CEST)
Received: from localhost ([::1]:43334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIO5k-00076p-8Y
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 01:35:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1oIO2V-0005Ai-6q
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 01:32:29 -0400
Received: from mga09.intel.com ([134.134.136.24]:9058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1oIO2P-0000oL-1T
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 01:32:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659331941; x=1690867941;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dGEFjU5RDpjAE3Y8TlSevSntqYrwIYr+p5LHLv+Utv8=;
 b=m4uS5RP92+bRoP4Ksr1R85NmmNivZTohvrZMNt1QSIEXuAMhhd0gzD5v
 s7OlvoY3NL2GkFvyRMVsq6eYPEJ5/4q5SJdriJB63YbooWJyoDXQ+40WT
 4OH7fABQtlGROO816QQMe7gNX0mPp0OJhWZaVmjt9eqNjdmMhPaTK181G
 4YioS4XDZyuetrmOdoJ3KacaUcKwkQxYOh09lCZifG42SZN9BMu91NYwM
 a3U3D2Tl96XpLR8p0jN6UXmSvi8Axkk8MKlwSteeYmEk1PipPXVcGObxm
 zYNXbRTqPGOtxZsbU7W6vOCACIm2+zpACLTPi47EIuSQ1RrJFVz55amEe w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10425"; a="289837819"
X-IronPort-AV: E=Sophos;i="5.93,206,1654585200"; d="scan'208";a="289837819"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2022 22:32:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,206,1654585200"; d="scan'208";a="704849488"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by fmsmga002.fm.intel.com with ESMTP; 31 Jul 2022 22:32:12 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Sun, 31 Jul 2022 22:32:11 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Sun, 31 Jul 2022 22:32:11 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Sun, 31 Jul 2022 22:32:11 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Sun, 31 Jul 2022 22:32:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PzTIYVkQbwRozrqpNd5SL5T77jbXqtUz2QHbe1pdNLW5fWGOYTwwBRYMT3t52fytU3RwyqlbX+Ka0b0d62FixjiplbWci9YRLmGrNCT484vHJtbXnHR10/3aUldWpaq+Dhp4aljATAGxlqVfy0y+PrdHSNIHtLBM2Xx8t0FtMwJbgkRipD5wyQ4ie+xPsOqTCNQxv4vYZq96dQxhj7xhn+0/lEBFsXGBeiGFwu2OT3YQRFbY4S/upBmF0PiQ/qMbcks5VMbZly98NSZz1p8VIBJ4uDnPNuiOD1voKUHSG15+kOepbjLcKx+nRoPuhUqQ2IVgypTxycxanQaUxBMJzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dGEFjU5RDpjAE3Y8TlSevSntqYrwIYr+p5LHLv+Utv8=;
 b=D9XMjUXYSCz2kI5jryIKCeCeS9Vjpnh3OI8hQVaW5LOUiFOT14YuiuW/A8upRvwtGGgHeZbnToqbu2T2s0WpD9s3ICoc3YzlGrNMFyNfkVkx72VUwL3knUw5zn5eLgIrjW2R4pj8947tb68mfYoIhGmrCMGy/Q0whMyKHKdMhOz5lPWX2Z2qfmvTNfsWXLoWdVdDtV5kne8WV8UIl0fmsGThWRborsMMGv29vY7OIaYq4QpRPeV+jrMAuukc8nhRsnzqr82ywLebjfLRMOBqubZ3HzJ5EmGGOkHU5kIU7dCOBSICdNbVwr+W+qrlKDpeFzgQ4/oIkzkaYtST7/8JOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by PH7PR11MB6354.namprd11.prod.outlook.com (2603:10b6:510:1fe::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.12; Mon, 1 Aug
 2022 05:32:09 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::e849:1316:6e38:6eee]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::e849:1316:6e38:6eee%7]) with mapi id 15.20.5482.014; Mon, 1 Aug 2022
 05:32:09 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>, "Xu, Tao3" <tao3.xu@intel.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Li Zhijian
 <lizhijian@fujitsu.com>, Peter Maydell <peter.maydell@linaro.org>
Subject: RE: [PULL V2 25/25] net/colo.c: fix segmentation fault when packet is
 not parsed correctly
Thread-Topic: [PULL V2 25/25] net/colo.c: fix segmentation fault when packet
 is not parsed correctly
Thread-Index: AQHYnBfCkdi+rxc2eUKiKCjIliDUr62Vbj6AgAQU4gCAABSG4A==
Date: Mon, 1 Aug 2022 05:32:09 +0000
Message-ID: <MWHPR11MB00319C7AC13A3AC53693365C9B9A9@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20220720090313.55169-1-jasowang@redhat.com>
 <20220720090313.55169-26-jasowang@redhat.com>
 <CAFEAcA-LPM4LmfcM3kiHk9LWCrYRpB1izfxPijHvBrmLOfFJgQ@mail.gmail.com>
 <eaf256c7-5a3c-d850-be08-b2b18fc3f1c3@redhat.com>
In-Reply-To: <eaf256c7-5a3c-d850-be08-b2b18fc3f1c3@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3d40b979-33e7-4702-169c-08da737f2e0a
x-ms-traffictypediagnostic: PH7PR11MB6354:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WPz4gfU1UjUBGejYG69m4QBbcHe4b8PC9Q0Zaozt+jo3s2zDocjhle4TbOcDhthzkG8FoABBp3Zqx3sWZFG76DEe5SGp10BcUuPgHkOQQFbgVUSPSw122XkSiQLZaiqjRp4askd/DP5tJT2AwIUZ6DvhCC/rj3ePu1Z9iWMGOM46x8gc7Q0At6nPhMvuoqH3TKM9RN9MjF71wlTU/h5K/G9n7PlatifAPtsuZhLzaRWnbH9gsVz3C9WoGqt+dW4+DtIrSga5lbZ6DlJ5QOeNLeY+CctQhIdukpwmysV26qxamyQVEgpY24CbrdB7DlTbw4P3WbyMBr6GPQuhyx4Ni7JCuNlMT2aj1OP/SL/TwTm6y/f39LwxaIhzFYkUQnw2CyMqVMAJqjUjOn/l3T9PZfc+Vru5LNMxU57kS9RNh7odMh7szqOHMjtELdkP8d8l6nXWeaqqzcvZA3gPotTdgCk2RGXjlH9vZ8M+brOl2xVoXW1wloNWX3jZ0KXurJHu+3lEV2BUqdThnwss46P1B4crVLTRL/YCb1aE99L5I1vXrotrVafHeoEkJUrmWdiUvM0plWgkv6QfCya9cKo6nS5du33LFDDXiqTLuJpj4aznVh5++owjXqsIdyfHC58weFDiVmxmCyvcyljltOcgwLNhuXkNk9ce9letrw5HaZYz8obswivEta9gFNbKWCwOVTzDiAGUt/sfoBk3ZfzXFoiAovVbFjUZRZUJgVo20brtZGnRpTCnDqnRvujB2PFQG7quHDpNYO2FbpB2U1GZfvvjs0fyRG/6E5TkdaJrDMk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(366004)(396003)(376002)(136003)(346002)(122000001)(41300700001)(38100700002)(38070700005)(66946007)(8936002)(82960400001)(316002)(478600001)(71200400001)(83380400001)(4326008)(66556008)(66446008)(66476007)(8676002)(64756008)(76116006)(52536014)(53546011)(186003)(5660300002)(110136005)(6506007)(7696005)(54906003)(6636002)(9686003)(26005)(2906002)(33656002)(86362001)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?elVMOEFoWVZON0pZbmxVQ1B1ckFSVU90NlV4U2psa3hzcHNaVGJ5dXB6TTdT?=
 =?utf-8?B?T3FaV1EzcjlTaUxLM0xDQ2RiZzYyeEFSMkdnZHh1YU1LMGYxeXFMeDJmWWpu?=
 =?utf-8?B?UHpPTmVuQ0pIVjY3R2JwRzNwN1ZJb0pjRjRGSlM1RThOVldBK2NJc0JqV2pS?=
 =?utf-8?B?N3J2V0U0WldmN25kV1lxOW1jL29PU1c1YjRZMTJTcnhnWGtPM1hIdjVIMk9v?=
 =?utf-8?B?VWdMbU52ZWEycEZBdzF1YUZ1M3k0bFZKYzBGWVR5ZDZZL2phU0dHV2JraS85?=
 =?utf-8?B?OC9KUnJ5Q1VmTldGQTdRREFEMU1xT0grN2d5anB5aXZtQmFSSFJhMG1jU0dJ?=
 =?utf-8?B?V1Y4N2g2N2xDNXhuUDFjZTVGdTZDcm5pVHR3Vkx6d1FYWi8yeERIRElSVmRK?=
 =?utf-8?B?Ri9uaXV3K1E1SVNYMUU1UXNCQzVVM2dYUFEzMHkzWmcwZTlkY2ZDVjRkOUky?=
 =?utf-8?B?ZGNJYUY1UFQ4aGUydTBRN1VmNzdYSjlMVHcySFh1SnlkTEl0dVJVSnVQOWJh?=
 =?utf-8?B?b1UwVEJobVNBemJueVJwQmxwR21FWHlTTk13eUJJalZ3TUY3V1dmbjFhTGVE?=
 =?utf-8?B?Z2JXWDFWM2s4Vm9vcGoxbThjWURtb2dGZzhGQ1MwaURWRSsxMFU3a3RQSWVa?=
 =?utf-8?B?MEwySHF0cEJWOHB3V0tSSlljVDZCWnEwemI5SVQ3Tk9RMktLbEZ2eWRGYmxJ?=
 =?utf-8?B?R2wxTlRuWHllV28vU3VRZDVTT091NUlwMThvdWdYWkZVOFlvZ0JoZHd4VXFL?=
 =?utf-8?B?RzFuT0lVM1BZQkJGRUYxbmE0bHpiYzFZOWR1Ykpnd0FLMU1oU2pQMHpzQm5S?=
 =?utf-8?B?WnYvbmxBb25XUE1MaC9NT0liWDZjUjJGN1NBWkczZVFOUkJkZWZZUHB1VFBP?=
 =?utf-8?B?d0I4NWg1clhJSGRoVnBoVkwvaHRKc2RUL29jc1UzR1dadlp1THhLVUF1MDc3?=
 =?utf-8?B?NHI4UVhBaVFhUCtEQU5SdkUrT3VZYlpHR3d6WXpnRk1zK0krdW5pSXFQTHd2?=
 =?utf-8?B?VCttRll6MWtJeXl1N3lDNEh0SDlTSWJ6ZDNGSTE4NklJbHZyRnV3RTFRYnVw?=
 =?utf-8?B?VzZEREhyWG42YnJ6OElLMjdpc0JXQm8xTzlHaDF4cTBTam5yc2RvZGNSTjJ2?=
 =?utf-8?B?SEZGcW1YcFVKN2pha3JCZXRwT3RNV0xCQWgySGwwdkc5VER5dFh2WXpjK0M4?=
 =?utf-8?B?aEx6Vmw3WDNDTmhKTS9NWWYwZjNONi9RUDlNTDNKeDBPYTVseGYwdUVKUkpt?=
 =?utf-8?B?cHNTN3kxVlZobTJ4eStvQ3dzWVNaWmRESDZENkdZaDFoSFFFcWJkckRSQzFZ?=
 =?utf-8?B?aVBKM1lJQ2NrRERnT2dWaDJOSXJ5eThObWZwU2R1K2lQSFpxWkp4aEtnQm1U?=
 =?utf-8?B?YU4wNGxWSTJqb090MGJDUWdHQkcyamNsdUIwZk83dXpwalhVNk5BWVRZL3Q1?=
 =?utf-8?B?bWRIcmdQMkNPNENCNnVyTUZ1U0RXcVFvc1kzMWZ0Wno3Q0NYNnlRanNMK29G?=
 =?utf-8?B?R1NGWlJLZWlzSWdsQzRicFlMMk9DZVBDRTQzc3N3UURDZ296eU4yM1JUSm1a?=
 =?utf-8?B?SjY3ekI2QlF3MTNBcGpOdExPU0k1Ri81eG5UM0ZnOWxveGwwQUZTQ1JIUm5V?=
 =?utf-8?B?TC9Hc0NuWk52eVlKT3hUeWIveWVEN1ZPbzAwWmFkZnZhOHNlNWFCcCtxd0dj?=
 =?utf-8?B?Q0tZcVFCVTVLZnlHckIxbXZhMUp1eDJiTGNjNXY0RHFQMEhJbW5NQnIwajNt?=
 =?utf-8?B?eGpTWTloakErUW8zTklLRlhuZ0EvZXhiT3JkRWJhdUFTbWk0QUxlOWVjdzJN?=
 =?utf-8?B?dGZXR0dWRGRFcmhXdVAzRlowWHpIMGhubWl4UlYvcU1YTGtnUUtEbU9Ia2tv?=
 =?utf-8?B?eHladEx5TU1kSW1IelZQb3JrQWFjS0NxTDhGVngxY2QxQS9SUUlFck1OZkFu?=
 =?utf-8?B?MlN2SFZ3RmNFenBoOWNIemJ4NEFvYmVlYWNYbVVPS25VbGtSY0pVVHpsM2Zx?=
 =?utf-8?B?SGZ4L2QxVEJBSHlCaTB6WnY1VjNyeGJPeVhaZ0FtUWx0RDJ0RlIyUGZmR0Vh?=
 =?utf-8?B?VkxDamlvN1k0R3NPWEFWNlkxdHJLNHlWMXN4S0hLbGtBOTdWVlBwb0xvclNl?=
 =?utf-8?Q?lIErVAJ4qqEmZYubGZE7sts3R?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d40b979-33e7-4702-169c-08da737f2e0a
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2022 05:32:09.6331 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WlyWiRZ1rv2bvPGJBfxoGJh4kEY25juNwq8iCWsxr1i04ipWtufzIBy3MqnCBxNbzg5ye5qf59FfcPRiJsfB+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6354
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFzb24gV2FuZyA8amFz
b3dhbmdAcmVkaGF0LmNvbT4NCj4gU2VudDogTW9uZGF5LCBBdWd1c3QgMSwgMjAyMiAxMjoxOCBQ
TQ0KPiBUbzogWmhhbmcsIENoZW4gPGNoZW4uemhhbmdAaW50ZWwuY29tPjsgWHUsIFRhbzMgPHRh
bzMueHVAaW50ZWwuY29tPg0KPiBDYzogcWVtdS1kZXZlbEBub25nbnUub3JnOyBMaSBaaGlqaWFu
IDxsaXpoaWppYW5AZnVqaXRzdS5jb20+OyBQZXRlcg0KPiBNYXlkZWxsIDxwZXRlci5tYXlkZWxs
QGxpbmFyby5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbUFVMTCBWMiAyNS8yNV0gbmV0L2NvbG8uYzog
Zml4IHNlZ21lbnRhdGlvbiBmYXVsdCB3aGVuIHBhY2tldA0KPiBpcyBub3QgcGFyc2VkIGNvcnJl
Y3RseQ0KPiANCj4gDQo+IOWcqCAyMDIyLzcvMjkgMjE6NTgsIFBldGVyIE1heWRlbGwg5YaZ6YGT
Og0KPiA+IE9uIFdlZCwgMjAgSnVsIDIwMjIgYXQgMTA6MDQsIEphc29uIFdhbmcgPGphc293YW5n
QHJlZGhhdC5jb20+IHdyb3RlOg0KPiA+PiBGcm9tOiBaaGFuZyBDaGVuIDxjaGVuLnpoYW5nQGlu
dGVsLmNvbT4NCj4gPj4NCj4gPj4gV2hlbiBDT0xPIHVzZSBvbmx5IG9uZSB2bmV0X2hkcl9zdXBw
b3J0IHBhcmFtZXRlciBiZXR3ZWVuDQo+ID4+IGZpbHRlci1yZWRpcmVjdG9yIGFuZCBmaWx0ZXIt
bWlycm9yKG9yIGNvbG8tY29tcGFyZSksIENPTE8gd2lsbCBjcmFzaA0KPiA+PiB3aXRoIHNlZ21l
bnRhdGlvbiBmYXVsdC4gQmFjayB0cmFjayBhcyBmb2xsb3c6DQo+ID4+DQo+ID4+IFRocmVhZCAx
ICJxZW11LXN5c3RlbS14ODYiIHJlY2VpdmVkIHNpZ25hbCBTSUdTRUdWLCBTZWdtZW50YXRpb24N
Cj4gZmF1bHQuDQo+ID4+IDB4MDAwMDU1NTU1NWNiMjAwYiBpbiBldGhfZ2V0X2wyX2hkcl9sZW5n
dGggKHA9MHgwKQ0KPiA+PiAgICAgIGF0IC9ob21lL3Rhby9wcm9qZWN0L0NPTE8vY29sby1xZW11
L2luY2x1ZGUvbmV0L2V0aC5oOjI5Ng0KPiA+PiAyOTYgICAgICAgICB1aW50MTZfdCBwcm90byA9
IGJlMTZfdG9fY3B1KFBLVF9HRVRfRVRIX0hEUihwKS0+aF9wcm90byk7DQo+ID4+IChnZGIpIGJ0
DQo+ID4+IDAgIDB4MDAwMDU1NTU1NWNiMjAwYiBpbiBldGhfZ2V0X2wyX2hkcl9sZW5ndGggKHA9
MHgwKQ0KPiA+PiAgICAgIGF0IC9ob21lL3Rhby9wcm9qZWN0L0NPTE8vY29sby1xZW11L2luY2x1
ZGUvbmV0L2V0aC5oOjI5Ng0KPiA+PiAxICAweDAwMDA1NTU1NTVjYjIyYjQgaW4gcGFyc2VfcGFj
a2V0X2Vhcmx5IChwa3Q9MHg1NTU1NTZhNDQ4NDApIGF0DQo+ID4+IG5ldC9jb2xvLmM6NDkNCj4g
Pj4gMiAgMHgwMDAwNTU1NTU1Y2IyYjkxIGluIGlzX3RjcF9wYWNrZXQgKHBrdD0weDU1NTU1NmE0
NDg0MCkgYXQNCj4gPj4gbmV0L2ZpbHRlci1yZXdyaXRlci5jOjYzDQo+ID4+DQo+ID4+IFNvIHdy
b25nIHZuZXRfaGRyX2xlbiB3aWxsIGNhdXNlIHBrdC0+ZGF0YSBiZWNvbWUgTlVMTC4gQWRkIGNo
ZWNrIHRvDQo+ID4+IHJhaXNlIGVycm9yIGFuZCBhZGQgdHJhY2UtZXZlbnRzIHRvIHRyYWNrIHZu
ZXRfaGRyX2xlbi4NCj4gPj4NCj4gPj4gU2lnbmVkLW9mZi1ieTogVGFvIFh1IDx0YW8zLnh1QGlu
dGVsLmNvbT4NCj4gPj4gU2lnbmVkLW9mZi1ieTogWmhhbmcgQ2hlbiA8Y2hlbi56aGFuZ0BpbnRl
bC5jb20+DQo+ID4+IFJldmlld2VkLWJ5OiBMaSBaaGlqaWFuIDxsaXpoaWppYW5AZnVqaXRzdS5j
b20+DQo+ID4+IFNpZ25lZC1vZmYtYnk6IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+
DQo+ID4gSGkgLS0gQ292ZXJpdHkgcG9pbnRzIG91dCB0aGF0IHRoZXJlJ3MgYSBwcm9ibGVtIHdp
dGggdGhpcyBmaXggKENJRA0KPiA+IDE0OTA3ODYpOg0KPiA+DQo+ID4+IEBAIC00Niw3ICs0Niwx
NCBAQCBpbnQgcGFyc2VfcGFja2V0X2Vhcmx5KFBhY2tldCAqcGt0KQ0KPiA+PiAgICAgICBzdGF0
aWMgY29uc3QgdWludDhfdCB2bGFuW10gPSB7MHg4MSwgMHgwMH07DQo+ID4+ICAgICAgIHVpbnQ4
X3QgKmRhdGEgPSBwa3QtPmRhdGEgKyBwa3QtPnZuZXRfaGRyX2xlbjsNCj4gPiBkYXRhIGhlcmUg
aXMgc2V0IHRvIHBrdC0+ZGF0YSArIHBrdC0+dm5ldF9oZHJfbGVuLg0KPiA+IElmIHBrdC0+ZGF0
YSBpcyBOVUxMIHRoZW4gdGhpcyBhZGRpdGlvbiBpcyBDIHVuZGVmaW5lZCBiZWhhdmlvdXIsIGFu
ZA0KPiA+IGlmIHBrdC0+ZGF0YSBpcyBub3QgTlVMTCBidXQgdGhlIGludGVnZXIgYWRkZWQgaXMg
c3VjaCB0aGF0IHRoZQ0KPiA+IHBvaW50ZXIgZW5kcyB1cCBub3QgcG9pbnRpbmcgd2l0aGluIGRh
dGEsIHRoZW4gdGhhdCBpcyBhbHNvIEMNCj4gPiB1bmRlZmluZWQgYmVoYXZpb3VyLi4uDQo+IA0K
PiANCj4gUmlnaHQuIEFuZCBJIGRvbid0IHNlZSBob3cgcGt0LT5kYXRhIGNhbiBiZSBOVUxMLCBt
YXliZSBhIGhpbnQgb2YgYnVnDQo+IGVsc2V3aGVyZS4NCj4gDQo+IA0KPiA+DQo+ID4+ICAgICAg
IHVpbnQxNl90IGwzX3Byb3RvOw0KPiA+PiAtICAgIHNzaXplX3QgbDJoZHJfbGVuID0gZXRoX2dl
dF9sMl9oZHJfbGVuZ3RoKGRhdGEpOw0KPiA+PiArICAgIHNzaXplX3QgbDJoZHJfbGVuOw0KPiA+
PiArDQo+ID4+ICsgICAgaWYgKGRhdGEgPT0gTlVMTCkgew0KPiA+IC4uLnNvIHRoZSBjb21waWxl
ciBpcyBhbGxvd2VkIHRvIGFzc3VtZSB0aGF0IGRhdGEgY2Fubm90IGJlIE5VTEwNCj4gPiBoZXJl
LCBhbmQgdGhpcyBlbnRpcmUgZXJyb3IgY2hlY2tpbmcgY2xhdXNlIGlzIGxvZ2ljYWxseSBkZWFk
IGNvZGUuDQo+ID4NCj4gPiBJZiB5b3UncmUgdHJ5aW5nIHRvIGNoZWNrIHdoZXRoZXIgdm5ldF9o
ZHJfbGVuIGlzIHZhbGlkLCB5b3UNCj4gPiBuZWVkIHRvIGRvIHRoYXQgYXMgYW4gaW50ZWdlciBh
cml0aG1ldGljIGNoZWNrIGJlZm9yZSB5b3Ugc3RhcnQNCj4gPiB1c2luZyBpdCBmb3IgcG9pbnRl
ciBhcml0aG1ldGljLiBBbmQgeW91IHByb2JhYmx5IHdhbnQgdG8gYmUNCj4gPiBjaGVja2luZyBh
Z2FpbnN0IHNvbWUga2luZCBvZiBib3VuZCwgbm90IGp1c3QgZm9yIHdoZXRoZXIgdGhlDQo+ID4g
cmVzdWx0IGlzIGdvaW5nIHRvIGJlIE5VTEwuDQo+IA0KPiANCj4gT3Igd2UgY2FuIGxldCB0aGUg
Y2FsbGVyIHRvIHZhbGlkYXRlIHRoZSBQa3QgYmVmb3JlIGNhbGxpbmcgdGhpcyBmdW5jdGlvbi4N
Cj4gDQo+IA0KPiA+DQo+ID4gT3ZlcmFsbCB0aGlzIGxvb2tzIGtpbmRhIHNrZXRjaHkgYW5kIGNv
dWxkIHByb2JhYmx5IHVzZSBtb3JlDQo+ID4gZGV0YWlsZWQgY29kZSByZXZpZXcuIFdoZXJlIGRv
ZXMgdGhlIGJvZ3VzIHZuZXRfaGRyX2xlbiBjb21lIGZyb20gaW4NCj4gPiB0aGUgZmlyc3QgcGxh
Y2U/IElzIHRoaXMgZGF0YSBmcm9tIHRoZSBndWVzdCwgb3IgZnJvbSB0aGUgbmV0d29yaw0KPiA+
IChpZSB1bmNvbnRyb2xsZWQpPw0KPiANCj4gDQo+IElmIEkgdW5kZXJzdGFuZCBjb3JyZWN0bHkg
dGhlIHZuZXRfaGRyX2xlbiBpcyBzZXQgZHVyaW5nIGhhbmRzaGFrZQ0KPiAobmV0X2ZpbGxfcnN0
YXRlKCkpIHdoaWNoIGlzIHNlbnQgZnJvbSBhIG5ldHdvcmsgYmFja2VuZC4NCj4gDQo+IENoZW4g
b3IgWHUsIHBsZWFzZSBwb3N0IGEgZml4IGFuZCBleHBsYWluIHdoYXQgaGFwcGVucyBpbiB0aGUg
Y2hhbmdlbG9nLg0KDQpPSywgd2Ugd2lsbCBzZW5kIGEgcGF0Y2ggdG8gZml4IGl0Lg0KDQpUaGFu
a3MNCkNoZW4NCg0KPiANCj4gVGhhbmtzDQo+IA0KPiANCj4gPg0KPiA+PiArICAgICAgICB0cmFj
ZV9jb2xvX3Byb3h5X21haW5fdm5ldF9pbmZvKCJUaGlzIHBhY2tldCBpcyBub3QgcGFyc2VkDQo+
IGNvcnJlY3RseSwgIg0KPiA+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICJwa3QtPnZuZXRfaGRyX2xlbiIsIHBrdC0+dm5ldF9oZHJfbGVuKTsNCj4gPj4gKyAgICAg
ICAgcmV0dXJuIDE7DQo+ID4+ICsgICAgfQ0KPiA+IHRoYW5rcw0KPiA+IC0tIFBNTQ0KPiA+DQoN
Cg==

