Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3AD4EBC4E
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 10:05:43 +0200 (CEST)
Received: from localhost ([::1]:34800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZTKn-0006Wu-WE
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 04:05:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin.tian@intel.com>)
 id 1nZTFa-00058K-5A
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 04:00:18 -0400
Received: from mga12.intel.com ([192.55.52.136]:63203)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin.tian@intel.com>)
 id 1nZTFW-0003zq-LU
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 04:00:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648627214; x=1680163214;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+d+yItup/yPQt1m3zCI6fcbXDJyo0zLSJ80EFEs2rhs=;
 b=cHsY1oRhy4sd2ZyeJ54YN98OLmOosFM2Up9BL2aB9wbT/4seeR2fpG5K
 gjALFFNkU6HHp1NItSLPgRZd7nQbF+3r7OZ41KnoTWCMxT1gf2JJeEo3W
 mSXWxpwvx8ab/uJe8j2k5pMniP1VdZQO0QcQFrktUckqtTOaurqDUtSA9
 6pavYSZa5RcB5TWP1lrwe0BowXqjmiE7xkH1a5Hq/8yiKFjuNC7T9ilg9
 2jZ7B2XQQn3YbMWgJZ5iY3jOLQA/ULZSUvaJf2/HLK0MI63aR6f4/xC4I
 wWs3JZ1Ipv1YQdBYmxmstLNWtRRW93JH/tettSwuNqlylzx2Bfy9NOulV A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="239408413"
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; d="scan'208";a="239408413"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 01:00:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; d="scan'208";a="519565584"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga002.jf.intel.com with ESMTP; 30 Mar 2022 01:00:07 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 30 Mar 2022 01:00:07 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 30 Mar 2022 01:00:06 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 30 Mar 2022 01:00:06 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Wed, 30 Mar 2022 01:00:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GtHKLkv+9PnhFbTxcDQkWi/+NE7vWm0hZbrxj/Dj/bZLyrDej9w75LOBZRyE1qYrYsGhK0VwvhNC14MxvNOw6rgQlaQwUd3A+p3QbG9XvDrZlNMnvU5K88yUvWJlGpGeaZHYoblHZzSQAb8YPnomBmLFNV85CW2VlLMRB9JhlUpLVJv5tV8bt7jREGfJU9syWEhxAk/XeOgXRK7qLDoC/EZPE2Sx2fry+g5UqLTZBXkVzwDPkVcHAEgZUVdeamfhe8cA/QrvpmhdLrm166wDn9NzpjNsWRcFYM5fAum9DDD+6/tRIvNvfm908QzFvKPAtPX3r3UwU9JLz9d/yHyFCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+d+yItup/yPQt1m3zCI6fcbXDJyo0zLSJ80EFEs2rhs=;
 b=QXp8CDwivleDfFFeWy3prgXJmV7g8VUMxbZyWlP7v6mFcAvEZnoKOoGMnCqS65tshbCGiAZFXY4inmrZPJpz+e42guKTwUR/1bp5yJI9by1IUZifOQ/sOXVKbMmSTiwdZp2o7XmZLO8Vp/MH+IdO7eDF873TdrsifHPOl9Z35kMOcQXvMxXZk9XzjjoXhlKRQYmMJn2fyJkmVoES08+sjoAdvPSS703IwyfzHedevNlDPDjHXt/Uspj+JqC9cWYVK4YtiLEv23lin/U9/1zt4sRAvVjuZ27tml4GxI2pgp+4AJPyYRaEwiGCOgnYmYZ+zAMK/XFv7oxMWNoAepILjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by DM5PR1101MB2153.namprd11.prod.outlook.com (2603:10b6:4:56::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.19; Wed, 30 Mar
 2022 08:00:04 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::4df7:2fc6:c7cf:ffa0]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::4df7:2fc6:c7cf:ffa0%4]) with mapi id 15.20.5102.023; Wed, 30 Mar 2022
 08:00:04 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Wang <jasowang@redhat.com>
Subject: RE: [PATCH V2 4/4] intel-iommu: PASID support
Thread-Topic: [PATCH V2 4/4] intel-iommu: PASID support
Thread-Index: AQHYPOjLkFETw43vekSHA4amP0dz7KzOPTaQgAXgw4CAAD9wkIABeLQAgAHB1vA=
Date: Wed, 30 Mar 2022 08:00:04 +0000
Message-ID: <BN9PR11MB52765ACF64CE589365DD7F778C1F9@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220321055429.10260-1-jasowang@redhat.com>
 <20220321055429.10260-5-jasowang@redhat.com>
 <BN9PR11MB52762D1CDE8F5417370762CE8C199@BN9PR11MB5276.namprd11.prod.outlook.com>
 <CACGkMEtr5byTaRFQT-ut6=ziyOTKBgne_Xa2qu4Nu9Z7sDDmBg@mail.gmail.com>
 <BN9PR11MB52767EA8BF5EA39488D149408C1D9@BN9PR11MB5276.namprd11.prod.outlook.com>
 <CACGkMEtCAra8SbubYbqMVO8E6MUwNUaJLM5bVJ32rA31uemVAA@mail.gmail.com>
In-Reply-To: <CACGkMEtCAra8SbubYbqMVO8E6MUwNUaJLM5bVJ32rA31uemVAA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d57c3a2f-86d1-4f8f-8a60-08da12234c79
x-ms-traffictypediagnostic: DM5PR1101MB2153:EE_
x-microsoft-antispam-prvs: <DM5PR1101MB215317B132A54C3BB470E9688C1F9@DM5PR1101MB2153.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cq04EQ/YOyXCYMH/ELeFHoCSOOyiKKrdp+4E6M6DqfgPRTrxfE/Hh2lE7Ex5O4I6/vrfjwfc5mA9lqKjV/5kOEmdaYU0yrx5lS2Pf3Rvcpn1MBv2IWNqjH5vOqBMD5ZmyolMdQf1a5/7RLu4VbbLxkZn3IuoB9fu2TDXv439FHFVO4GEWCCNkpgrV97Q4OdO1fM7nqF2xVv+RZ1xcPa6Lr+Q2TfpZEdtiArnLB0k0y1VlhNjhkH6ZsnAb7ygAYf6cnxpxVY9zP+J0UJBg+7mukpZdSJmSPJeQv6rhE+KXi3yWUVsKX214SNJYjv7yNQrwcUyL3i/9WI7E0bu7OZFPdGuPtpeDpeQVmT8JCBk9ymt1vFF/DFnroxT0wprddzgTYE3r1LDgzNNModLEbT0Gkj5P+W/foTw8gldR7JjVF2mbsRr/k8Q1/onYrnQNuFIrR/VEjbCl7VhQLkuSxJl/DbZhxT77LfJj3tXUQb7ld/+7V9d6nLXvG2jRLCk/a1x6RQGFm/l5U7QPK0Jog8v7pxeQPLAzN3wggwGQIKdmaMslLtEdoxO2bjsQDJXf+pgea1ye+bzDGQnZ6AXRyhC5Wbf7wkYoMy8SGtROqIGcIKbzr/0GVp7WvV0IEgCSSBRZPlLThTqAem7S2BIDb4jVZE6PhsQSdd7PKTD887uOmr2p9U2ikch5PvtkjOFpMuO1Pzd8qhJ/AU4qtZqCCjyHQGaISihY2SP0Bd5YwSQSCAtgXw7oeu15a/7oGbSqDapHzYOGlNB7EldJj9Shj88NrWz8CJeQXvcpPAI30BJVgo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(7696005)(26005)(71200400001)(6916009)(8936002)(52536014)(5660300002)(966005)(9686003)(508600001)(54906003)(6506007)(38100700002)(33656002)(2906002)(66446008)(316002)(64756008)(66946007)(186003)(8676002)(55016003)(86362001)(53546011)(4326008)(122000001)(66476007)(38070700005)(82960400001)(76116006)(66556008)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZFR3dCtrOUM2VWpzK2JIejhvazhEeElORStCbXNqbm9YRGdtM2JtUWNkNi9v?=
 =?utf-8?B?RUNLdzZia2w5OU5RREJtWk1qTEJhcjlScDdoaFRIM3drOFRrcGh6WHc1cnlJ?=
 =?utf-8?B?QW5LbXNmL29VV1A2RVF3dnlick9JRXF2RE8yK0ZadlhBT0JQdDVvcWVoaGN0?=
 =?utf-8?B?NUduaFpHUitKcDlDdGhqQ2NZbmQwV3l1ZnJsT1NyNytKbUp3RGhEWDE3emtJ?=
 =?utf-8?B?K0VzN3lSVVRTajVtM0dLTFNOVXFKWk03NDdCYWFWb054eEZsS2dDSjg3MWx4?=
 =?utf-8?B?cXgzaG1ZZkFHRXZUaWwvUVlTQVNCb1p1R0ZZUjFtNEgrSFllVzZPOE5sWkJu?=
 =?utf-8?B?ek1WVFlhdlB4ZjQ5dXhrWGdETnFTcitOalRSNFBhZUoxS2JIVDhLVCtQOThG?=
 =?utf-8?B?SGVDZGE0UWFvMW56WnhkRjVOV015RDBWVjZYclVGTmNMTTEwcXlQOUlTR09p?=
 =?utf-8?B?TS9GWjh3ZUM3bVV3cU1oVGpCN05VQ2tEM2NpM0RITnlUQWEyVitHMlFBWXZM?=
 =?utf-8?B?QndqUjIyd3h3b2VDeEVFcWVweGoxaVl2Qzk4VmNBOXRTZzl5VzZjVWtLajFy?=
 =?utf-8?B?Mk1jL2dOaUZXS1d6Z2w5aGtKODVvRCt6VWVOOUI3allZMjlJeFB4OVNzSktj?=
 =?utf-8?B?NmRpV3ZwM0ViQko4MVFlWm5wOEhwdE1XRFd6QzNvMlJzV0lIWEh0b0lFYnNT?=
 =?utf-8?B?Zlhrekw3eC9zbFlHcitjWTVRRG5ZZDMyc3I3Z2lOM0N2VW5xMnBGWHVPK08r?=
 =?utf-8?B?dGFUaHJCZDV3ZmtaNWI5V2VrNzdlbFRSWWM0UlNtekdNbWxKUWY2S0IwUEFP?=
 =?utf-8?B?MjN6YVV6Nm04ZUZnalZXRnlqSE5uZmkzQ3k5TW1KSWNIdC9nWk9zaWxrUVNp?=
 =?utf-8?B?YklJOEVIMWh3c3Rjb2R5Sk9PQUdmTks0TEpvdWw0bmVwdzVYR0RQdUIzVFhj?=
 =?utf-8?B?VDVXVTJva2V4azhMRk5GaXE5UkxudE1ER0VJZi9VSGF2WlgvNFBGYXU0dCtU?=
 =?utf-8?B?U0pWZ1l4OUJFZUIwdnlPdzZ5K2phY2RXU3FWSjNsNm94bnRHTlBCSVk3K2ky?=
 =?utf-8?B?c2hwVEo1OW1tN0psSU5WUHNVSXdyUXplUHZNUjhFUklnci9YMjlrdGREZEU1?=
 =?utf-8?B?TlNoSUZQU1A5Tlg3dVBWMk4ySHRzQ3kvNThIbFhOV1cvZTRLUzV1bERqNWRi?=
 =?utf-8?B?VmtJOGtPamJoYXlWaHRtUnN6L05WUnhMNHVXTXpwVHRqZStrei81Q1JpamFq?=
 =?utf-8?B?UjBRWitZNWJQTWhmK1lueEQxRU54NGwwbXJQZTVTR1JXUHJIcU1wRzRLOG4y?=
 =?utf-8?B?ZS9CdmMrWTFZb0RKMG5Ca0lFam5RRzlHQ25xUlpEeHcrS0tpMWtDMkRUWWh6?=
 =?utf-8?B?dW9BeWxVemJKN1h3L20zT3ZieTNXZVNnQmQweVZJd1NlNmdTUmllRVRRMTFz?=
 =?utf-8?B?Z0RreE9RckJZZXdNWGNsZyt1c2txQUxDZVJOK05SVG1WelVmRmpDY1ZhQ3FI?=
 =?utf-8?B?WW0zSU0rNnJvbGoreG9RNTNJMFZ0blJXM2VRQ254OHhEdzN5VmdtYVBHeHhl?=
 =?utf-8?B?cWo0VzFiaWdJekRkNWxoTWlhci9va3VBa3l0S2loU0VMNXg1OVhqTEhuQ0JK?=
 =?utf-8?B?ekhFUjNJSjFCOWwycUtSMWRteUtKTjczcThCdWw1Z1VZUFo2V21La3c3YUw4?=
 =?utf-8?B?WGM2Rk9iYmJrYStyNmZ2ZGYveGFMTXlONk1BUFJVMXY0YU5JWCt6R0orcTF1?=
 =?utf-8?B?eGxDMWJhNDMzU3BWcCtFdlkwS2RhVjMwU21sRVdlRW9UUFNQSkxzMXp3OTVF?=
 =?utf-8?B?T1k3OWtGZTVuSjBjSmlJS29yelU4dVRFbmo0dkNOL3hGMmZEMk5kVFlSWUsx?=
 =?utf-8?B?R2hGakptb20zWXlYY2JHRnJaS3p5ckNZcjR0MFh6SUswT1U1RHBMRFlFamtl?=
 =?utf-8?B?OWhTU2FWR1d4VVNPWUwxbUxKbUtVZFRXQVc1NEVvanhxdUJqM05GNjhMNFBQ?=
 =?utf-8?B?UGsvdDhwMjY4djI3MDEzeGlENmtCeHJnWTJzQk1vSUd6dU40WDBKZHhYUStG?=
 =?utf-8?B?S0dNQWFRWjNmWlJTK2w0Z0VLdE43Vk43MGlSTVhCNTdkdjY4RXBVRE5idTBr?=
 =?utf-8?B?Sm1ac0FXT1dFMVNadzN5YitJTlYrYnpLQk81bUpxZTFWVUZ5M1Z3Q1V0Z2JB?=
 =?utf-8?B?ZmFqZFhtNG12MXpHaWx3dTJUVHplOFQ2ZXN6QzVIV0JzWm5oZVFHK2JoNFlV?=
 =?utf-8?B?UUhIWjJCeE10N1FNTjEyVU81MjJqZkZPb1JKNEtaa2hITDAwbGNwd1V3d0Fo?=
 =?utf-8?B?di9QYjZTWHRjTzFwejlEaVRZMXJTR1N3Z2FXcjlWMi8wbUcrWmdXUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d57c3a2f-86d1-4f8f-8a60-08da12234c79
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2022 08:00:04.1447 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SO5hiZ2fC5c0gQLswe8RHxz+5E0kwCECL6gfAAT6Pr1DVfbBWsQzNarReYHAqbCvE7nEKNDix/RlsR1Vmy5UWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2153
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.136; envelope-from=kevin.tian@intel.com;
 helo=mga12.intel.com
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
Cc: "Liu, Yi L" <yi.l.liu@intel.com>,
 "yi.y.sun@linux.intel.com" <yi.y.sun@linux.intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "peterx@redhat.com" <peterx@redhat.com>, "mst@redhat.com" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PiBGcm9tOiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPg0KPiBTZW50OiBUdWVzZGF5
LCBNYXJjaCAyOSwgMjAyMiAxMjo0NyBQTQ0KPiANCj4gT24gTW9uLCBNYXIgMjgsIDIwMjIgYXQg
Mjo0NyBQTSBUaWFuLCBLZXZpbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+IHdyb3RlOg0KPiA+DQo+
ID4gPiBGcm9tOiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPg0KPiA+ID4gU2VudDog
TW9uZGF5LCBNYXJjaCAyOCwgMjAyMiAxMDozMSBBTQ0KPiA+ID4NCj4gPiA+IE9uIFRodSwgTWFy
IDI0LCAyMDIyIGF0IDQ6NTQgUE0gVGlhbiwgS2V2aW4gPGtldmluLnRpYW5AaW50ZWwuY29tPg0K
PiB3cm90ZToNCj4gPiA+ID4NCj4gPiA+ID4gPiBGcm9tOiBKYXNvbiBXYW5nDQo+ID4gPiA+ID4g
U2VudDogTW9uZGF5LCBNYXJjaCAyMSwgMjAyMiAxOjU0IFBNDQo+ID4gPiA+ID4NCj4gPiA+ID4g
PiBUaGlzIHBhdGNoIGludHJvZHVjZSBFQ0FQX1BBU0lEIHZpYSAieC1wYXNpZC1tb2RlIi4gQmFz
ZWQgb24gdGhlDQo+ID4gPiA+ID4gZXhpc3Rpbmcgc3VwcG9ydCBmb3Igc2NhbGFibGUgbW9kZSwg
d2UgbmVlZCB0byBpbXBsZW1lbnQgdGhlDQo+IGZvbGxvd2luZw0KPiA+ID4gPiA+IG1pc3Npbmcg
cGFydHM6DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiAxKSB0YWcgVlREQWRkcmVzc1NwYWNlIHdpdGgg
UEFTSUQgYW5kIHN1cHBvcnQgSU9NTVUvRE1BDQo+ID4gPiB0cmFuc2xhdGlvbg0KPiA+ID4gPiA+
ICAgIHdpdGggUEFTSUQNCj4gPiA+ID4gPiAyKSB0YWcgSU9UTEIgd2l0aCBQQVNJRA0KPiA+ID4g
Pg0KPiA+ID4gPiBhbmQgaW52YWxpZGF0ZSBkZXNjIHRvIGZsdXNoIFBBU0lEIGlvdGxiLCB3aGlj
aCBzZWVtcyBtaXNzaW5nIGluIHRoaXMNCj4gcGF0Y2guDQo+ID4gPg0KPiA+ID4gSXQgZXhpc3Rl
ZCBpbiB0aGUgcHJldmlvdXMgdmVyc2lvbiwgYnV0IGl0IGxvb2tzIGxpa2UgaXQgd2lsbCBiZSB1
c2VkDQo+ID4gPiBvbmx5IGZvciB0aGUgZmlyc3QgbGV2ZWwgcGFnZSB0YWJsZSB3aGljaCBpcyBu
b3Qgc3VwcG9ydGVkIHJpZ2h0IG5vdy4NCj4gPiA+IFNvIEkgZGVsZXRlZCB0aGUgY29kZXMuDQo+
ID4NCj4gPiBZb3UgYXJlIHJpZ2h0LiBCdXQgdGhlcmUgaXMgYWxzbyBQQVNJRC1iYXNlZCBkZXZp
Y2UgVExCIGludmFsaWRhdGUgZGVzY3JpcHRvcg0KPiA+IHdoaWNoIGlzIG9ydGhvZ29uYWwgdG8g
MXN0IHZzLiAybmQgbGV2ZWwgdGhpbmcuIElmIHdlIGRvbid0IHdhbnQgdG8gYnJlYWsgdGhlDQo+
ID4gc3BlYyB3aXRoIHRoaXMgc2VyaWVzIHRoZW4gdGhlcmUgd2lsbCBuZWVkIGEgd2F5IHRvIHBy
ZXZlbnQgdGhlIHVzZXIgZnJvbQ0KPiA+IHNldHRpbmcgYm90aCAiZGV2aWNlLWlvdGxiIiBhbmQg
IngtcGFzaWQtbW9kZSIgdG9nZXRoZXIuDQo+IA0KPiBSaWdodCwgbGV0IG1lIGRvIGl0IGluIHRo
ZSBuZXh0IHZlcnNpb24uDQo+IA0KPiANCj4gPg0KPiA+ID4NCj4gPiA+ID4NCj4gPiA+ID4gPiAz
KSBQQVNJRCBjYWNoZSBhbmQgaXRzIGZsdXNoDQo+ID4gPiA+ID4gNCkgRmF1bHQgcmVjb3JkaW5n
IHdpdGggUEFTSUQNCj4gPiA+ID4gPg0KPiA+ID4gPiA+IEZvciBzaW1wbGljaXR5Og0KPiA+ID4g
PiA+DQo+ID4gPiA+ID4gMSkgUEFTSUQgY2FjaGUgaXMgbm90IGltcGxlbWVudGVkIHNvIHdlIGNh
biBzaW1wbHkgaW1wbGVtZW50IHRoZQ0KPiBQQVNJRA0KPiA+ID4gPiA+IGNhY2hlIGZsdXNoIGFz
IGEgbm9wLg0KPiA+ID4gPiA+IDIpIEZhdWx0IHJlY29yZGluZyB3aXRoIFBBU0lEIGlzIG5vdCBz
dXBwb3J0ZWQsIE5GUiBpcyBub3QgY2hhbmdlZC4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IEFsbCBv
ZiB0aGUgYWJvdmUgaXMgbm90IG1hbmRhdG9yeSBhbmQgY291bGQgYmUgaW1wbGVtZW50ZWQgaW4g
dGhlDQo+ID4gPiA+ID4gZnV0dXJlLg0KPiA+ID4gPg0KPiA+ID4gPiBQQVNJRCBjYWNoZSBpcyBv
cHRpb25hbCwgYnV0IGZhdWx0IHJlY29yZGluZyB3aXRoIFBBU0lEIGlzIHJlcXVpcmVkLg0KPiA+
ID4NCj4gPiA+IEFueSBwb2ludGVyIGluIHRoZSBzcGVjIHRvIHNheSBzb21ldGhpbmcgbGlrZSB0
aGlzPyBJIHRoaW5rIHN0aWNraW5nDQo+ID4gPiB0byB0aGUgTkZSIHdvdWxkIGJlIHN1ZmZpY2ll
bnQuDQo+ID4NCj4gPiBJIGRpZG4ndCByZW1lbWJlciBhbnkgcGxhY2UgaW4gc3BlYyBzYXlpbmcg
dGhhdCBmYXVsdCByZWNvcmRpbmcgd2l0aCBQQVNJRA0KPiBpcw0KPiA+IG5vdCByZXF1aXJlZCB3
aGVuIFBBU0lEIGNhcGFiaWxpdHkgaXMgZXhwb3NlZC4NCj4gDQo+IE9rLCBidXQgYXMgYSBzcGVj
IGl0IG5lZWRzIHRvIGNsYXJpZnkgd2hhdCBpcyByZXF1aXJlZCBmb3IgZWFjaCBjYXBhYmlsaXR5
Lg0KDQpJdCBpcyBjbGFyaWZpZWQgaW4gMTAuNC4xNCBGYXVsdCBSZWNvcmRpbmcgUmVnaXN0ZXJz
Og0KDQogICJQVjogUEFTSUQgVmFsdWUiOiBQQVNJRCB2YWx1ZSB1c2VkIGJ5IHRoZSBmYXVsdGVk
IHJlcXVlc3QuDQogIEZvciByZXF1ZXN0cyB3aXRoIFBBU0lELCB0aGlzIGZpZWxkIHJlcG9ydHMg
dGhlIFBBU0lEIHZhbHVlIHRoYXQNCiAgY2FtZSB3aXRoIHRoZSByZXF1ZXN0LiBIYXJkd2FyZSBp
bXBsZW1lbnRhdGlvbnMgbm90IHN1cHBvcnRpbmcNCiAgUEFTSUQgKFBBU0lEIGZpZWxkIENsZWFy
IGluIEV4dGVuZGVkIENhcGFiaWxpdHkgcmVnaXN0ZXIpIGFuZCBub3QNCiAgc3VwcG9ydGluZyBS
SURfUEFTSUQgKFJQUyBmaWVsZCBDbGVhciBpbiBFeHRlbmRlZCBDYXBhYmlsaXR5DQogIFJlZ2lz
dGVyKSBpbXBsZW1lbnQgdGhpcyBmaWVsZCBhcyBSc3ZkWi4NCg0KQWJvdmUgcmVmbGVjdHMgdGhh
dCB3aGVuIFBBU0lEIGNhcGFiaWxpdHkgaXMgZW5hYmxlZCB0aGUgUFYgZmllbGQNCnNob3VsZCBp
bmNsdWRlIFBBU0lEIHZhbHVlIGZvciB0aGUgZmF1bHRlZCByZXF1ZXN0Lg0KDQpTaW1pbGFyIGRl
c2NyaXB0aW9uIGNhbiBiZSBmb3VuZCBpbiBhbm90aGVyIGZpZWxkICJQUDogUEFTSUQgUHJlc2Vu
dCINCg0KPiANCj4gPiBJZiB0aGVyZSBpcyBjZXJ0YWluIGZhdWx0DQo+ID4gdHJpZ2dlcmVkIGJ5
IGEgcmVxdWVzdCB3aXRoIFBBU0lELCB3ZSBkbyB3YW50IHRvIHJlcG9ydCB0aGlzIGluZm9ybWF0
aW9uDQo+ID4gdXB3YXJkLg0KPiANCj4gSSB0ZW5kIHRvIGRvIGl0IGluY3JlYXNpbmdseSBvbiB0
b3Agb2YgdGhpcyBzZXJpZXMgKGFueWhvdyBhdCBsZWFzdA0KPiBSSUQyUEFTSUQgaXMgaW50cm9k
dWNlZCBiZWZvcmUgdGhpcyBzZXJpZXMpDQoNClllcywgUklEMlBBU0lEIHNob3VsZCBoYXZlIGJl
ZW4gcmVjb3JkZWQgdG9vIGJ1dCBpdCdzIG5vdCBkb25lIGNvcnJlY3RseS4NCg0KSWYgeW91IGRv
IGl0IGluIHNlcGFyYXRlIHNlcmllcywgaXQgaW1wbGllcyB0aGF0IHlvdSB3aWxsIGludHJvZHVj
ZSBhbm90aGVyDQoieC1wYXNpZC1mYXVsdCcgdG8gZ3VhcmQgdGhlIG5ldyBsb2dpYyByZWxhdGVk
IHRvIFBBU0lEIGZhdWx0IHJlY29yZGluZz8NCg0KPiANCj4gPg0KPiA+IGJ0dyBjYW4geW91IGVs
YWJvcmF0ZSB3aHkgTkZSIG1hdHRlcnMgdG8gUEFTSUQ/IEl0IGlzIGp1c3QgYWJvdXQgdGhlDQo+
ID4gbnVtYmVyIG9mIGZhdWx0IHJlY29yZGluZyByZWdpc3Rlci4uLg0KPiANCj4gSSBtaWdodCBi
ZSB3cm9uZywgYnV0IEkgdGhvdWdodCB3aXRob3V0IGluY3JlYXNpbmcgTkZSIHdlIG1heSBsYWNr
DQo+IHN1ZmZpY2llbnQgcm9vbSBmb3IgcmVwb3J0aW5nIFBBU0lELg0KDQpJIHRoaW5rIHRoZXkg
YXJlIG9ydGhvZ29uYWwgdGhpbmdzLg0KDQo+IA0KPiA+DQo+ID4gPg0KPiA+ID4gPiBJJ20gZmlu
ZSB3aXRoIGFkZGluZyBpdCBpbmNyZW1lbnRhbGx5IGJ1dCB3YW50IHRvIGNsYXJpZnkgdGhlIGNv
bmNlcHQgZmlyc3QuDQo+ID4gPg0KPiA+ID4gWWVzLCB0aGF0J3MgdGhlIHBsYW4uDQo+ID4gPg0K
PiA+DQo+ID4gSSBoYXZlIG9uZSBvcGVuIHdoaWNoIHJlcXVpcmVzIHlvdXIgaW5wdXQuDQo+ID4N
Cj4gPiBXaGlsZSBpbmNyZW1lbnRhbGx5IGVuYWJsaW5nIHRoaW5ncyBkb2VzIGJlIGEgY29tbW9u
IHByYWN0aWNlLCBvbmUgd29ycnkNCj4gPiBpcyB3aGV0aGVyIHdlIHdhbnQgdG8gY3JlYXRlIHRv
byBtYW55IGNvbnRyb2wga25vYnMgaW4gdGhlIHN0YWdpbmcgcHJvY2Vzcw0KPiA+IHRvIGNhdXNl
IGNvbmZ1c2lvbiB0byB0aGUgZW5kIHVzZXIuDQo+IA0KPiBJdCBzaG91bGQgYmUgZmluZSBhcyBs
b25nIGFzIHdlIHVzZSB0aGUgIngtIiBwcmVmaXggd2hpY2ggd2lsbCBiZQ0KPiBmaW5hbGx5IHJl
bW92ZWQuDQoNCkdvb2QgdG8gbGVhcm4uDQoNCj4gDQo+ID4NCj4gPiBFYXJsaWVyIHdoZW4gWWkg
cHJvcG9zZWQgUWVtdSBjaGFuZ2VzIGZvciBndWVzdCBTVkEgWzFdIGhlIGFpbWVkIGZvciBhDQo+
ID4gY29hcnNlLWdyYWluZWQga25vYiBkZXNpZ246DQo+ID4gLS0NCj4gPiAgIEludGVsIFZULWQg
My4wIGludHJvZHVjZXMgc2NhbGFibGUgbW9kZSwgYW5kIGl0IGhhcyBhIGJ1bmNoIG9mIGNhcGFi
aWxpdGllcw0KPiA+ICAgcmVsYXRlZCB0byBzY2FsYWJsZSBtb2RlIHRyYW5zbGF0aW9uLCB0aHVz
IHRoZXJlIGFyZSBtdWx0aXBsZSBjb21iaW5hdGlvbnMuDQo+ID4gICBXaGlsZSB0aGlzIHZJT01N
VSBpbXBsZW1lbnRhdGlvbiB3YW50cyBzaW1wbGlmeSBpdCBmb3IgdXNlciBieSBwcm92aWRpbmcN
Cj4gPiAgIHR5cGljYWwgY29tYmluYXRpb25zLiBVc2VyIGNvdWxkIGNvbmZpZyBpdCBieSAieC1z
Y2FsYWJsZS1tb2RlIiBvcHRpb24uDQo+IFRoZQ0KPiA+ICAgdXNhZ2UgaXMgYXMgYmVsb3c6DQo+
ID4gICAgICItZGV2aWNlIGludGVsLWlvbW11LHgtc2NhbGFibGUtbW9kZT1bImxlZ2FjeSJ8Im1v
ZGVybiJdIg0KPiA+DQo+ID4gICAgIC0gImxlZ2FjeSI6IGdpdmVzIHN1cHBvcnQgZm9yIFNMIHBh
Z2UgdGFibGUNCj4gPiAgICAgLSAibW9kZXJuIjogZ2l2ZXMgc3VwcG9ydCBmb3IgRkwgcGFnZSB0
YWJsZSwgcGFzaWQsIHZpcnR1YWwgY29tbWFuZA0KPiA+ICAgICAtICBpZiBub3QgY29uZmlndXJl
ZCwgbWVhbnMgbm8gc2NhbGFibGUgbW9kZSBzdXBwb3J0LCBpZiBub3QgcHJvcGVyDQo+ID4gICAg
ICAgIGNvbmZpZ3VyZWQsIHdpbGwgdGhyb3cgZXJyb3INCj4gPiAtLQ0KPiA+DQo+ID4gV2hpY2gg
d2F5IGRvIHlvdSBwcmVmZXIgdG8/DQo+ID4NCj4gPiBbMV0gaHR0cHM6Ly9saXN0cy5nbnUub3Jn
L2FyY2hpdmUvaHRtbC9xZW11LWRldmVsLzIwMjAtMDIvbXNnMDI4MDUuaHRtbA0KPiANCj4gTXkg
dW5kZXJzdGFuZGluZyBpcyB0aGF0LCBpZiB3ZSB3YW50IHRvIGRlcGxveSBRZW11IGluIGEgcHJv
ZHVjdGlvbg0KPiBlbnZpcm9ubWVudCwgd2UgY2FuJ3QgdXNlIHRoZSAieC0iIHByZWZpeC4gV2Ug
bmVlZCBhIGZ1bGwNCj4gaW1wbGVtZW50YXRpb24gb2YgZWFjaCBjYXAuDQo+IA0KPiBFLmcNCj4g
LWRldmljZSBpbnRlbC1pb21tdSxmaXJzdC1sZXZlbD1vbixzY2FsYWJsZS1tb2RlPW9uIGV0Yy4N
Cj4gDQoNCllvdSBtZWFudCBlYWNoIGNhcCB3aWxsIGdldCBhIHNlcGFyYXRlIGNvbnRyb2wgb3B0
aW9uPw0KDQpCdXQgdGhhdCB3YXkgcmVxdWlyZXMgdGhlIG1hbmFnZW1lbnQgc3RhY2sgb3IgYWRt
aW4gdG8gaGF2ZSBkZWVwDQprbm93bGVkZ2UgYWJvdXQgaG93IGNvbWJpbmF0aW9ucyBvZiBkaWZm
ZXJlbnQgY2FwYWJpbGl0aWVzIHdvcmssIGUuZy4NCmlmIGp1c3QgdHVybmluZyBvbiBzY2FsYWJs
ZSBtb2RlIHcvbyBmaXJzdC1sZXZlbCBjYW5ub3Qgc3VwcG9ydCB2U1ZBDQpvbiBhc3NpZ25lZCBk
ZXZpY2VzLiBJcyB0aGlzIGEgY29tbW9uIHByYWN0aWNlIHdoZW4gZGVmaW5pbmcgUWVtdQ0KcGFy
YW1ldGVycz8gDQoNClRoYW5rcw0KS2V2aW4NCg==

