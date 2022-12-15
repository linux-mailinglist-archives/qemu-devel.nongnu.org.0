Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8114A64D911
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 10:53:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5ko7-0000eV-Rk; Thu, 15 Dec 2022 04:45:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wenchao.wang@intel.com>)
 id 1p5knt-0000bS-Nm
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 04:45:28 -0500
Received: from mga11.intel.com ([192.55.52.93])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wenchao.wang@intel.com>)
 id 1p5knq-0005R0-6N
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 04:45:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671097522; x=1702633522;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4woFgOXfgMY229s1NWDTHEpxv4DE7kNxl4unK3Mtgfg=;
 b=LK3JqSOhKB4+15fVe3cPM1rjvdwX60CtDulUDpdow5dafEKvsOxPshNq
 6YpWc/Z91cGO41T4JSpIcJpqKwUpWimo8sbP8GAuWGzx9eXe+zfJUD1jJ
 AR5AJVKbEpkpbe2w7YId2tNIi/WO2McM6gJDCvRkTd5A+LIUe1kcLSFCQ
 uLIRU/KSH1iloyquNfqW/eMzoMIFazwkkOfLZhJo6lg3HMvm/chtBBc3/
 V8oDzWQq/9Kd8+Cyc20jU3ilY351/GpC/u5ahgJURmpgH0mf8RtRgtJam
 jvYbqNihqxO4aTdazjYLOWAg0HvI4hZghsOFgiltWrJqoAaTmLdzVyKSe g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10561"; a="316273685"
X-IronPort-AV: E=Sophos;i="5.96,247,1665471600"; d="scan'208";a="316273685"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2022 01:45:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10561"; a="649314439"
X-IronPort-AV: E=Sophos;i="5.96,247,1665471600"; d="scan'208";a="649314439"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga002.jf.intel.com with ESMTP; 15 Dec 2022 01:45:16 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 15 Dec 2022 01:45:16 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 15 Dec 2022 01:45:15 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 15 Dec 2022 01:45:15 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 15 Dec 2022 01:45:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cEGHdR99t4etc3ZWj4LAWqlQKbmzY7n1OAjWbKjlLDPNjpSruArvxprKFANTCWRlYI/i7kKcFL/wXsMPKGh4/G7RXf79Pz9wTJ66BObjQ9+3vBBB71bZLVvR+B3iqWXDmB8cr6ijbspylW+nOC7eGDAIRGemGcmrH7Nk0voelTKqlCIA5JHnkYr29KXWlOFTwvmy+/YdGawyxHmhW6fFFKAXG/CibCU23dVINSXJ4HI51fJxZ+3jJfP6a2CGnlxJDNQ8GYbe78XvMyJUF/jGijA0sQP+vHjWNf3SKpqSeLZ/sW85BqK0B87PSn2GTNoSMZOWp3BYzmnFghGyL5mE7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4woFgOXfgMY229s1NWDTHEpxv4DE7kNxl4unK3Mtgfg=;
 b=DKjoWkjRQ0nBQMjQQV+sJy7IwWLp4YGZgJkqFEMYUwdrhl6gY0pyRc47H3SkLOsBqCyVNbz7LCG48Nqbc7dbE7rTd1HU1fpYji1gVHBNxd/Indc9kAIto8XeYR1SKfeBh20iI/XJcevagGNbjLygYVHDl71zjHlm7S+h9ZLFthbsCZHdM5okWX3ZVSxEOOI463pZPsNw7LlaTVFqIz8Fz6racFMasKJJODKeC7xl2JaYlVO4fTZOSgvojeLQE0tNoDVmItvMwzyIL6DI+WiiVzr6vVTZMLq7O5Xb7vOUy38aVS9ZbointN6kBBkdgsIHZbMmsT9bBViAigVACZct4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4090.namprd11.prod.outlook.com (2603:10b6:5:195::10)
 by DM8PR11MB5590.namprd11.prod.outlook.com (2603:10b6:8:32::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5924.14; Thu, 15 Dec 2022 09:45:14 +0000
Received: from DM6PR11MB4090.namprd11.prod.outlook.com
 ([fe80::e97c:4feb:6b7c:b7b3]) by DM6PR11MB4090.namprd11.prod.outlook.com
 ([fe80::e97c:4feb:6b7c:b7b3%5]) with mapi id 15.20.5924.011; Thu, 15 Dec 2022
 09:45:14 +0000
From: "Wang, Wenchao" <wenchao.wang@intel.com>
To: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Peter Maydell
 <peter.maydell@linaro.org>, Richard Henderson <richard.henderson@linaro.org>
Subject: RE: [PATCH] target/i386/hax: Add XCR0 support
Thread-Topic: [PATCH] target/i386/hax: Add XCR0 support
Thread-Index: AdkLtcw/di6dL/H4TWa/2VV8k407TwD6h9KAAC98J1A=
Date: Thu, 15 Dec 2022 09:45:13 +0000
Message-ID: <DM6PR11MB40908AA444148E892A0F8B0D87E19@DM6PR11MB4090.namprd11.prod.outlook.com>
References: <DM6PR11MB4090F9D06DC171C4B9C7D97587E09@DM6PR11MB4090.namprd11.prod.outlook.com>
 <073f7d3e-c7cc-084d-2848-c8a9490e6c69@redhat.com>
In-Reply-To: <073f7d3e-c7cc-084d-2848-c8a9490e6c69@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: pbonzini@redhat.com,stefanha@redhat.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4090:EE_|DM8PR11MB5590:EE_
x-ms-office365-filtering-correlation-id: 740532aa-e586-4b05-e08e-08dade8110be
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mUCR4qOzY+4vSCS448hI21AJXUXgpIym+IvTpQ9WkkA0kTGYTfb5TU9YuvSBxMIlHMbKflrK6tWBcS/DHllxuiFFGYxAItxB0/qpcT+A8YiiqXhDmIxFdMGLLPRiwX4krfkz+SyOX2gNZ7A8N8vh+28pGPPGsuNgG7rGYGAPLCGXE+cdH/FUSzkZqEVfwyPDUmS5NJjAFxmrrFl8g7uBTa9ZNjgwsoFHY2BbCAHh/rSzXSYJ5CYxiUcQC8NY1wZMaVLyBZxOanGWM7QBqXoJLrHpJwEGWlkU3E331B1FZtHaUzTjkLV6aGqj0BM43EnXNzVHEWKtzj0xErWOFB2Q350wJikEULJKjCwnCAOimUZy88NKUDXPWlsFPdU9nGESg2LWNfNAoqFB56pO8Dtr+lTZLXgPf5UPXuKpjCuqb+e9i3W9RG809/faIPqy4U1QmYOweRl4eR9e9SQRTgQK06ZRKO39XJEFX5po0mU4K5Y13AYhM61EpGdUJxcZA4u5FK2GaBt1Z+tDRXSZBl+x8kfMQvOlFed1dOzdCrvIk72Jti7qfiZ+dcyuC4zULOXe+/PyplWZWf7UO4suDGH0caE7AXMxpTDCXO44rMwsn4aEvZpQlAxeJcrKuZxJqDpm73I6OlIaXRKPbTU/I7A4ktyHFkaOpDjNVWGdNNzW2wsZH6nG8BjQ4ayWep1kps64i7CuNS5Z/yT/fUwc96ysUYD+ZlgRbx4nzc3hrMuFYbE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4090.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(366004)(346002)(396003)(39860400002)(136003)(451199015)(86362001)(66946007)(64756008)(66476007)(4326008)(8676002)(66446008)(66556008)(33656002)(316002)(54906003)(76116006)(38100700002)(122000001)(82960400001)(83380400001)(71200400001)(2906002)(966005)(53546011)(26005)(186003)(38070700005)(9686003)(110136005)(478600001)(55016003)(6506007)(7696005)(41300700001)(5660300002)(52536014)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dHhWZEJlaStMdGJYZ2tlSGl2VzE4blYwczlXU0RsSi85enNVOXpuNkU1bk13?=
 =?utf-8?B?T0g2Vk1ST2FoZnNvLzhXZHp5YzhUdStkRkw1dXRadXBPUUh2NisvTWw4Rll2?=
 =?utf-8?B?NE84RVdNVS9mSGtVRy92bjREckVvOVdOcmlCWnlvMzQwcXMwSmpjSFJJMHM0?=
 =?utf-8?B?cWlWTGh5SWZDUEovOTREam1Jb2l3LzlMT0pqdkNDNHdid2t3MWVMSi9KQ3hR?=
 =?utf-8?B?cCtUTklGcFFrWXFGUXdLNEdBbGdyWGEzVXlac0NkNW54TEpWMGM0OU03WTFB?=
 =?utf-8?B?MXMvU3hJVmN1eE13THRJRmFWSmNKQ3FNOVdtYzBSWFdmcHl3Ym12eFdRS1V2?=
 =?utf-8?B?QVdTbFJUVEx4YjA2NXBHYkc5WExYb2I1Ymx1NTNSTzBkWXpsditXU2pudkRM?=
 =?utf-8?B?UXc0L2VxZzNIVVNoSTVzNERkMmx3b1QxVFhLb3JYbi9lSnN3QTZpekNkV29V?=
 =?utf-8?B?RVBRazUvMHVtZFlPb0JpRDlvcGNkcWdHMGw0YmZEZ3Q2eG5YdURzeHZrMXBt?=
 =?utf-8?B?WmpidjJNK3h6NEVxdVZFUStZUmcvOXlPQllTTFZRWHNESDhSUkZlQ255b2t1?=
 =?utf-8?B?aDZxZU1VdmhOWWkwZ0NUeitBZGljWWV4cVVVaUl0UnF5SFlBMXFVV2N3Z0hj?=
 =?utf-8?B?MVkyTnB0c3dwOWVkWHlQZ2lBRVpVSXFROWZYall3a1k1TnBOWG9aY1hVVW1K?=
 =?utf-8?B?MU92QXJGNTU2bUtPMjBjVXExdVlhcU9iNHB3SFhxaFBqSHhrMU9HdysvYkg3?=
 =?utf-8?B?cWc1cTM5TTJJRkVKS05CZzNaRGx3cVN3TjhNRDVhREQvUlZvakllUVNtSWpL?=
 =?utf-8?B?dnNiS0h5Y0k4bTM3QmpTUTZrNUgvZ21rczJNcEljNU03U05PeUc2MXVjYzQw?=
 =?utf-8?B?c1p2UExhQkpHMzVvK01aYlBXWWJUWGRralhYR1BwdFNNNEtwdWlKZjFadzY3?=
 =?utf-8?B?SUJ4bGt0MEI0a3N0QlpyN1hGQUdwbW5JcEZwbVVZamNUTTNMUzh6ZDBlRG0v?=
 =?utf-8?B?OHZ6bnZYRmpsYzhXbm4rMk1JaE14VnBKejV4VWlvLzJEdjVNQkVsY1VOK1ls?=
 =?utf-8?B?MmxQOVQ4a1B0dXppRmlMa3BIazFzQzhjWnpRTEM0ZGdrMjg5aWFIbmZhR0R4?=
 =?utf-8?B?OFhSNmxOQWJSdDhmTytyMkFlWnNtTlVLS2kvNUw1S0JUeS9uZXZMb0s3Ly9U?=
 =?utf-8?B?dTFOc2wzTm4vNjJVT2hZVnJNZVdjOGZxSHNSSW1SbngyYWlMZmZhRUplaGxR?=
 =?utf-8?B?aXRpK1prOUVHeDZ1QUFMSkhnYTIwZlcwMzJWZ25heExaTEgrcGZwRW5Ld1pW?=
 =?utf-8?B?bTJtTldvSUNCaUZSRnRweTlGaGlZcnNWaFpiOHZQRForL3VzZkduTUxpMEZz?=
 =?utf-8?B?OXJJS3lrQ2JWNVB2cVlwMEFXQjNiYUNGK2prbXJINWhhR0U1MHZSQTR6NmxU?=
 =?utf-8?B?WnlxK21DbFErMjgxMmVmYWJCUXhZQ2V4ZGtjYkVPbVlnbWxtNHhnZnk2R0xM?=
 =?utf-8?B?dzBpTFFiZitkZUpUdFJrdkswTituUnQ5dG42NW9XelZ4bFZpTTBEb0daQVBw?=
 =?utf-8?B?YTdYRlJsU2YxUlc0TS9EV1FVOFgrVjRkMWVxTXlNS3Q4NU80YVFYK0Z4a3l6?=
 =?utf-8?B?WFBqYW84S1BPMk1FZGRLZVJpdzVjL1o0eHBJRDJpK3VRUDNkT0lDeVRCOTV2?=
 =?utf-8?B?MURKcDNYODBjOHRQMEs3b0FMTHFvT3BvSW1IQ0xLQUFNUUtUdXJ2N2tQdFgr?=
 =?utf-8?B?VnpGQXpGNmVjdVVoUXJJRllVaUJjeDhSWm53Qnpma2pUQ3lYZEovRm4yTHI3?=
 =?utf-8?B?cnhrV2l0UGYrQkhTV1dwMng1Tkk5YnRwK25FWFF0enMybTFCVGJhbExrT3hm?=
 =?utf-8?B?QnBBbTVaalhvaHQyTjZlaUI4ekVPbW42UFV5V0ZvTFc3UHpBTG5UNnc5Z1pP?=
 =?utf-8?B?cXAyUGppUGFYaDQzZmk5MkRIWUVDSE5zeGlvSC90TnFBZ25lVEw5cXMyNUQz?=
 =?utf-8?B?RUMzTmlUbnBxNFU2MWY2K3N6QWkvWkwvQjg5TUNxQWlUQVc2YjdHQ2NYYnBT?=
 =?utf-8?B?QmhmUlJRMzJlNDcyVUI5dkN6SVUxaTFwVUFyeFhyVkpaT1cyY05lUEZuenRH?=
 =?utf-8?Q?jQdQk13+btQhiW6xYpCRF1ZOB?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4090.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 740532aa-e586-4b05-e08e-08dade8110be
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2022 09:45:13.9282 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7YC4glVyXZ86Dv3pC7g3pl875cKAKQoTszYD7kSt/QthEzCLzsY04n/vXu78yIDCBCKZuqZsclfP0sb4VGMJww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5590
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.93; envelope-from=wenchao.wang@intel.com;
 helo=mga11.intel.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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

SGksIFRob21hcywNCg0KVGhhbmtzIGZvciB5b3VyIHJlcGx5LiBJIGhhdmUgYXR0ZW1wdGVkIHRv
IGZvbGxvdyB5b3Ugc3VnZ2VzdGlvbnMgYnV0IGl0IGFsd2F5cyBmYWlsZWQgb24gdGFnZ2luZyBh
IEdQRy1zaWduZWQgdGFnIGJlZm9yZSBzdWJtaXR0aW5nIHRoZSBwdWxsIHJlcXVlc3QuIEkgaGF2
ZSB1c2VkIEdQRyAyLjIuNCB0byBnZW5lcmF0ZSBhIFJTQTQwOTYgR1BHIHNlY3JldCBrZXkgYW5k
IHBhc3RlZCB0aGUgcHVibGljIGtleSBvbiBHaXRIdWIgc3VjY2Vzc2Z1bGx5Lg0KDQokIGdpdCB0
YWcgLXMgcHVsbC1yZXF1ZXN0LWhheCAtbSAndGFyZ2V0L2kzODYvaGF4OiBBZGQgWENSMCBzdXBw
b3J0Jw0KZXJyb3I6IGdwZyBmYWlsZWQgdG8gc2lnbiB0aGUgZGF0YQ0KZXJyb3I6IHVuYWJsZSB0
byBzaWduIHRoZSB0YWcNCg0KTWVhbndoaWxlLCBjb3VsZCBAUGFvbG8gQm9uemluaSBvciBAU3Rl
ZmFuIEhham5vY3ppIGhlbHAgdG8gcGljayB0aGUgcGF0Y2ggdXAgYXMgdGhlcmUgaXMgb25seSBv
bmUtbGluZSBjaGFuZ2UgZm9yIEhBWCBhbmQgd2UgaGF2ZSB2ZXJpZmllZCBpdCBmb3IgYWxsIGd1
ZXN0IGxhdW5jaGluZz8gVGhhbmtzIGEgbG90Lg0KDQoNCkJlc3QgUmVnYXJkcywNCldlbmNoYW8N
Cg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFRob21hcyBIdXRoIDx0aHV0aEBy
ZWRoYXQuY29tPiANClNlbnQ6IFdlZG5lc2RheSwgRGVjZW1iZXIgMTQsIDIwMjIgMTc6MzkNClRv
OiBXYW5nLCBXZW5jaGFvIDx3ZW5jaGFvLndhbmdAaW50ZWwuY29tPg0KQ2M6IHFlbXUtZGV2ZWxA
bm9uZ251Lm9yZzsgUGFvbG8gQm9uemluaSA8cGJvbnppbmlAcmVkaGF0LmNvbT47IFBldGVyIE1h
eWRlbGwgPHBldGVyLm1heWRlbGxAbGluYXJvLm9yZz47IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFu
aGFAcmVkaGF0LmNvbT47IFJpY2hhcmQgSGVuZGVyc29uIDxyaWNoYXJkLmhlbmRlcnNvbkBsaW5h
cm8ub3JnPg0KU3ViamVjdDogUmU6IFtQQVRDSF0gdGFyZ2V0L2kzODYvaGF4OiBBZGQgWENSMCBz
dXBwb3J0DQoNCk9uIDE0LzEyLzIwMjIgMTAuMTUsIFdhbmcsIFdlbmNoYW8gd3JvdGU6DQo+IEhp
LCBUaG9tYXMsDQo+IA0KPiBBcyBIQVhNIHY3LjguMCBpcyByZWxlYXNlZCBhbmQgaXQgYWRkZWQg
WENSMCBzdXBwb3J0LCBpdCBuZWVkcyB0aGlzIA0KPiBwYXRjaCB0byBhZGQgY29ycmVzcG9uZGlu
ZyBzdXBwb3J0IGludG8gSEFYIHVzZXIgc3BhY2Ugb2YgUUVNVS4gSSBoYXZlIA0KPiBwdXNoZWQg
dGhpcyBtZXJnZSByZXF1ZXN0IGJlZm9yZSBhbmQgUGhpbGlwcGUgaGFzIHJldmlld2VkIGl0IGFu
ZCBoZSANCj4gdGhvdWdodCB0aGUgY2hhbmdlIGlzIGNvcnJlY3QuIElmIG5vIG9uZSBlbHNlIHJh
aXNlcyBhbnkgb3RoZXIgDQo+IG9waW5pb24sIGNvdWxkIHlvdSBoZWxwIHRvIG1lcmdlIHRoaXMg
cGF0Y2ggZm9yIEhBWD8NCg0KICBIaSwNCg0Kc29ycnksIEkgZG9uJ3QgaGF2ZSBhIHN0YWtlIGlu
IHRoZSB0YXJnZXQvaTM4NiBjb2RlIC4uLiBidXQgeW91J3JlIGxpc3RlZCBhcyBtYWludGFpbmVy
IGZvciB0aGUgaGF4LyBmb2xkZXIsIHNvIGlmIG5vIG90aGVyIHg4NiBtYWludGFpbmVyIHBpY2tz
IHRoaXMgdXAsIEkgdGhpbmsgeW91IGNvdWxkIHNlbmQgYSBwdWxsIHJlcXVlc3QgZm9yIHRoaXMg
cGF0Y2ggb24geW91ciBvd24uIFNlZToNCg0KICBodHRwczovL3d3dy5xZW11Lm9yZy9kb2NzL21h
c3Rlci9kZXZlbC9zdWJtaXR0aW5nLWEtcHVsbC1yZXF1ZXN0Lmh0bWwNCg0KICBIVEgsDQogICBU
aG9tYXMNCg0KDQo+IA0KPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gDQo+
ICBGcm9tIGIxNzg5ZjI1MjNkMDY3OThiODg4MzY2NGJmYTlhOWRmNzk3YmZjY2YgTW9uIFNlcCAx
NyAwMDowMDowMCANCj4gMjAwMQ0KPiANCj4gRnJvbTogV2VuY2hhbyBXYW5nIDx3ZW5jaGFvLndh
bmdAaW50ZWwuY29tIA0KPiA8bWFpbHRvOndlbmNoYW8ud2FuZ0BpbnRlbC5jb20+Pg0KPiANCj4g
RGF0ZTogRnJpLCAyNSBOb3YgMjAyMiAxODozNzozNCArMDgwMA0KPiANCj4gU3ViamVjdDogW1BB
VENIXSB0YXJnZXQvaTM4Ni9oYXg6IEFkZCBYQ1IwIHN1cHBvcnQNCj4gDQo+IEludHJvZHVjZSBl
eHRlbmRlZCBjb250cm9sIHJlZ2lzdGVyIFhDUjAgdG8gc3VwcG9ydCBYU0FWRSBmZWF0dXJlIHNl
dC4NCj4gDQo+IE5vdGU6IFRoaXMgY2hhbmdlIHJlcXVpcmVzIGF0IGxlYXN0IEhBWE0gdjcuOC4w
IHRvIHN1cHBvcnQuDQo+IA0KPiBSZXZpZXdlZC1ieTogSGFuZyBZdWFuIDxoYW5nLnl1YW5AaW50
ZWwuY29tIA0KPiA8bWFpbHRvOmhhbmcueXVhbkBpbnRlbC5jb20+Pg0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogV2VuY2hhbyBXYW5nIDx3ZW5jaGFvLndhbmdAaW50ZWwuY29tIA0KPiA8bWFpbHRvOndl
bmNoYW8ud2FuZ0BpbnRlbC5jb20+Pg0KPiANCj4gLS0tDQo+IA0KPiB0YXJnZXQvaTM4Ni9oYXgv
aGF4LWludGVyZmFjZS5oIHwgMiArKw0KPiANCj4gMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3RhcmdldC9pMzg2L2hheC9oYXgtaW50ZXJmYWNlLmgg
DQo+IGIvdGFyZ2V0L2kzODYvaGF4L2hheC1pbnRlcmZhY2UuaCBpbmRleCA1MzdhZTA4NGU5Li4x
ZDEzYmIyMzgwIDEwMDY0NA0KPiANCj4gLS0tIGEvdGFyZ2V0L2kzODYvaGF4L2hheC1pbnRlcmZh
Y2UuaA0KPiANCj4gKysrIGIvdGFyZ2V0L2kzODYvaGF4L2hheC1pbnRlcmZhY2UuaA0KPiANCj4g
QEAgLTIwMSw2ICsyMDEsOCBAQCBzdHJ1Y3QgdmNwdV9zdGF0ZV90IHsNCj4gDQo+ICDCoMKgwqDC
oCB1aW50NjRfdCBfY3IzOw0KPiANCj4gIMKgwqDCoMKgIHVpbnQ2NF90IF9jcjQ7DQo+IA0KPiAr
wqDCoMKgIHVpbnQ2NF90IF94Y3IwOw0KPiANCj4gKw0KPiANCj4gIMKgwqDCoMKgIHVpbnQ2NF90
IF9kcjA7DQo+IA0KPiAgwqDCoMKgwqAgdWludDY0X3QgX2RyMTsNCj4gDQo+ICDCoMKgwqDCoCB1
aW50NjRfdCBfZHIyOw0KPiANCj4gLS0NCj4gDQo+IDIuMTcuMQ0KPiANCg0K

