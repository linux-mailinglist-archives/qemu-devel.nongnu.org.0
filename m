Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FFA6803D1
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 03:26:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMJre-0003e5-OG; Sun, 29 Jan 2023 21:25:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1pMJrR-0003dm-M4
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 21:25:33 -0500
Received: from mga02.intel.com ([134.134.136.20])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1pMJrP-0007iW-6F
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 21:25:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675045531; x=1706581531;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=l73ALH0shF3B48JxBtfcZyvAFZC11PZW3zRrEY3OxKs=;
 b=NV5sU9IZ2gFll6W+S0wVIQ1y4lQCgnMDECbutyi5M9Ml7HfTtd1ZBo/8
 KrVia34VH/wVwAhFwmo5PGSv2z3g8pdduoUWHzuhDovL/Xe+MNXhCbHcq
 FqPwX2IZjSleUewPLi3+gMyx6btBmA3H0MnlWXivrVedkI6ozR6K4ip5K
 ZvVFIn+23l40ZGmxWeS6rBULIXDK3dU//3ACx2ZQBFjN/ENPGoNjkTEB1
 Yo1+8TvcRufzt1Te3V56CzfimgDb9fTE8p646ChmyGjyN4Hy14m7ZawJ+
 hxuYwfByq5llEJF36ZZxOnRfHadFO0fD/j8p8m4OhdsTOrgCseUqjPpwj g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="315420028"
X-IronPort-AV: E=Sophos;i="5.97,256,1669104000"; d="scan'208";a="315420028"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2023 18:24:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="663941131"
X-IronPort-AV: E=Sophos;i="5.97,256,1669104000"; d="scan'208";a="663941131"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga002.jf.intel.com with ESMTP; 29 Jan 2023 18:24:19 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Sun, 29 Jan 2023 18:24:19 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Sun, 29 Jan 2023 18:24:18 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Sun, 29 Jan 2023 18:24:18 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Sun, 29 Jan 2023 18:24:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CBwD4e+DWBVcrunGvFM8Wqlj2srlkJTrUOlOzdumMTDfn2/i2RBlP10mDy52Sk+WXDfLMUskqJgPyeiASfEyBn5DlhUHkuxGeGFqrF/9EgCivGPLZ7ITWI2nBif73DrGQERBDMhNBcH4a/pd4bsnVoY3VFgWA+WSZ6K6yb9e86QZVJTgJoNkz+S4pNsIzUfMcMLr1HB2nlFRc96b3xC3IU0t6X8DZDibJ5mKlVJ+TzjYvu2g8TSslXXKX58La85mAFf5M0e9/7x15NhZBpNZCzE2imGQ1SgB7oPU47c8lABPF7701WMXddRmuAuRScM7uqG8jNgaTGJcLEUnJMpLcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l73ALH0shF3B48JxBtfcZyvAFZC11PZW3zRrEY3OxKs=;
 b=Z44ALDudjk93Lek0y41p0Qa485J1Y8appwBfWjnIgUOkrSjbnnLUOtLqC4Y4/nLW8VW0q8xWZJE4SdTviGbj/vTMq5Tc0uPHg3CrhQh8QvWxM0quozMRbwzNc+LVz2kYuFzkaNV1YSXcqRRMNkgX+abfwIjnBt3zKCpdm/PnbDi5ShvdSuycpi23zp8r2VXEMpbS0zt8dkaC0kDWkayOu6zBn02xWDpBFhUsDvXTB0AG+N27CbgyiMleNqp7xe8+qk3IKuMnGA+cm5CBNYYJiOS9XgdD81pA7vC+q8oG5tTbEXTJ0xuRG+EMXiDlTh5U0xuTndiw8hlRf5hJAhAmbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:443::14)
 by PH7PR11MB6857.namprd11.prod.outlook.com (2603:10b6:510:1ed::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.25; Mon, 30 Jan
 2023 02:24:16 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::6385:771:1bc4:2f6]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::6385:771:1bc4:2f6%5]) with mapi id 15.20.6043.033; Mon, 30 Jan 2023
 02:24:15 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Frediano Ziglio <freddy77@gmail.com>
CC: Gerd Hoffmann <kraxel@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, =?utf-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?=
 <marcandre.lureau@redhat.com>, "Kim, Dongwon" <dongwon.kim@intel.com>
Subject: RE: [RFC v2 2/2] spice: Add an option to forward the dmabuf directly
 to the encoder (v2)
Thread-Topic: [RFC v2 2/2] spice: Add an option to forward the dmabuf directly
 to the encoder (v2)
Thread-Index: AQHZLwi/ohMFZLve1U+7V6+NDJjAF66rxsUAgACavbCAApuqAIAFt5yA
Date: Mon, 30 Jan 2023 02:24:14 +0000
Message-ID: <IA0PR11MB718583DF694440C67744C534F8D39@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20230123083755.1038286-1-vivek.kasireddy@intel.com>
 <20230123083755.1038286-3-vivek.kasireddy@intel.com>
 <20230123100654.bqiauwjbkkqroq7f@sirius.home.kraxel.org>
 <IA0PR11MB71852AF9DF58977B578C2F43F8C99@IA0PR11MB7185.namprd11.prod.outlook.com>
 <CAHt6W4fvhv7TUT2hSYn9Vh4LgucMiRhQoaz92S4mGwdsyPxVhQ@mail.gmail.com>
In-Reply-To: <CAHt6W4fvhv7TUT2hSYn9Vh4LgucMiRhQoaz92S4mGwdsyPxVhQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|PH7PR11MB6857:EE_
x-ms-office365-filtering-correlation-id: 012930c2-29ab-4555-a107-08db026914cb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Cr2URRRO45CaMxsp8Aq6NboQ8EAOq9P6uYNvY6/yvWSPGUQdKv6In9U+NEZOrnjjEAst6aLPKlCBpRUcBTiGD2czfgMY/J1TI5MCkbyS2uVXfuiD+hOGb50W3p7WicDBkc310Ag5cEXaTyzzVXvIYNbrTh+LaJXP8ceFtuiaPsO5Thkh2zHyepfnPlim4K3lCME39V3J/7IN97sGxgzAbOGsN5uEp9HgJUrazU3sai0aP4zn4okr1A8u1XrwJ4Qw4XGKaMEcueqYf/zRHrT7n1iov86XPjMWoJ7611b4XyBgjapnUHC4lfli/bOwpAHbL4Om8h6lw3HkMJX9uGdkquSs3PnWSSjDFZJ3Vz9I/2DECDPJgHYl+VZRETGPxtvNACSNdcPe2CwrVyS1qwvY9NLpUIAQBk83XQjRqsOgYgALhGZB06JeK7o0+BEmso8YHT0IydPT2v0fllWhzR8e9PLcHxwVUY3ebMOg1ztJmPFh2vt+tU5uPQhkeXVTbEXuEmMY1Eq25FwxnVRGhMoRMpe7MlWwt9rQZA5qNmW1jDB9duOmPM/u01joT6ffhqereVpPb1ohU1lJL7rnRBAcHcRd7GPGb3+uaSuqy8sQYZJUmLKoCtSalgYvf9Atu54a4EJkICxbcQvv4c8C0GaVaQO/5gS055I0su4muUALfSbl0N/FB2WBIN+UaquXmuDvm3x8YsUJoXklEWn+9Un8mw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(39860400002)(366004)(346002)(376002)(396003)(451199018)(66899018)(71200400001)(9686003)(26005)(7696005)(186003)(107886003)(478600001)(2906002)(6506007)(54906003)(66476007)(83380400001)(4326008)(66446008)(316002)(66556008)(64756008)(8676002)(76116006)(66946007)(6916009)(52536014)(41300700001)(8936002)(5660300002)(82960400001)(38100700002)(122000001)(86362001)(55016003)(38070700005)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bVVMUlMzSXg5UHo1dDRLSmc2SXdIQVQrNlZyZEJpd015QkNSZEpRUnBDZjJW?=
 =?utf-8?B?cUw2NXAwdUxZSld3ci9yVy82NGxOQ3l1dG83cGZxWFczdWRXRXlrMExQV3FU?=
 =?utf-8?B?UGkzRWRIZkVqQkc4c2puQS9sVzhmN2Q2YXNEMll1b1cxaGVqbGJnQ1p2SVJz?=
 =?utf-8?B?RDMwOWcxWGlpd1N0M2NOSXVZai82eDc0N3dRWkY2R0dHNjVqN3duVnZ2dVM0?=
 =?utf-8?B?QkNXKzJSSGNnbWM5ODA4MDFVU0llV2o0bE8vcjN3R1pQNTFDRnowSWxYWnlD?=
 =?utf-8?B?WDAyYlNnTCt2RWNIMi9KbzZ2OVNDcUxqVDVIUjJuanVMNEp2WmJUSUZTR1RI?=
 =?utf-8?B?U21KNS9zUzRESVFNWnJ3aGp3SFhtcUFkdzNnRDByU0wxc1R0QnIrZkpTRlVJ?=
 =?utf-8?B?TXlYVXBCK0Q2RVZ1T0VFSjFtbFVlK011MktKZW9KQ09nYlQyWmV3U1hPd1Y1?=
 =?utf-8?B?YXlqb2hqWDBkUnh5UXRDeUt1UnhLTGtKT0ZzOEF3RDAvK0dDRHFQcXZUMjd2?=
 =?utf-8?B?dzNkNkU0VVdERGl1U2pXWERZam0wRGM4SXEwcWNWMDJBbEhVZUEzNWNoU1d0?=
 =?utf-8?B?cHAwVk9DbmY1OTFQL2V3dTVDbTJ3UCswQlI1WXZBQlhzTlJZWGc4T0lVYkhq?=
 =?utf-8?B?K3gzT1o4ZTNnNzEvMFdCY2RTc1lOVi84eUtRR1EvdUJ1bENzTXVkQkprbi9X?=
 =?utf-8?B?d0t2blc0S2hsZzRYMUFLaEI2QTlYeXY2STY2YTh0ek9sSHZDVlVyUWU5aUdY?=
 =?utf-8?B?RUtTaFE3dkNRd3p3NGN0RVg1NFUyLzlwTWZCalZURTEzMVNiZWdWRm5jMFpm?=
 =?utf-8?B?dTNGN201eEtad2tuMTN6bFQ5WEROUjl3UVBqUnhEKzg4SmRlTFFqK0FiSGdq?=
 =?utf-8?B?N1NYM1NhRStmeGZENWFhZkYvMmEzNnB1NXVpN1E0SnJoZW9jTFd2RUViNFZF?=
 =?utf-8?B?NGk3dkhHNUlxTTMxVkFVOHIwM1RObUoxZ2kxOStEM2pJWUE4ZEo5ak55WTRP?=
 =?utf-8?B?QVB6bGozQmZIV0ViRDhlRHFyOXJSY0VhdWlHNERycDNpalI3eFlEVmY0Q3dD?=
 =?utf-8?B?TG13VUtiTmlqbmhETXhNSzZ3NlNjZ3g1S1JYa2NIYXdVd04waHJqYjNibFpE?=
 =?utf-8?B?NHRXaCtyVWM0aGpKeEtEcVhzN2JXcnF2eC9DYTk2SnZoWkVrTmlpV01zL3Bh?=
 =?utf-8?B?SlJXN0RqZXZTK1lHcVlBVHBsTmsrMFZSMHorUnBXaGxTdG52MllEM3BETzBK?=
 =?utf-8?B?WlIwaHc4WmtoTTJVRnFHdVh6L2I0WWhteEtpZjFHLzJ4K20xS2ZvZi9pSDZ6?=
 =?utf-8?B?WEZTKzUrZUNGM2F3VWE3Y1RIS0NiWGhXU3hZNzNNRzdlVytQYitzUzBNNEdQ?=
 =?utf-8?B?eVFvZHg4MzFTS01YNXRWMlREdUlBaVRQNldhd1cxbTRQTG90SUpLQTM0eVlm?=
 =?utf-8?B?Rkh3YkxWbjJrOHNlR3B4UFFuREozTUJjT2ttQ1l2QThteXZGbXB6OE1qMG9Z?=
 =?utf-8?B?Y3lETGcyejAydmpvMTJtbElEZHMzZm5mMS8wcjhRaDdVQlZQaUpZNUMxKy9T?=
 =?utf-8?B?L1hJOGNvdFVPcUNkbU5SaWVrSHpoN1hBcU9jY0EvSnZBczZPamUva2RyeVYy?=
 =?utf-8?B?dGdzNmhmK1ZEa2Qwbk9HeWNuZkdNVWkzUU5GOVd1OXRQcDRTL1FyczhuajhM?=
 =?utf-8?B?dGZia0JnM0l5eVorRXgwdXNnN1ozb0g1amJCS3ZqRzhCdi9vajBxZ25vN1BZ?=
 =?utf-8?B?dXpsWWViNjQ4VFpxZjh3VWJ4SFJJUUorYW9GanY4YTFEMTFOV0N2OGdBL3Js?=
 =?utf-8?B?dFVqSUVjUTZSNllTOGdkNTVwNHdoWHRtdnZDb3RkT2hZd1dNT2E4eXV4MWFI?=
 =?utf-8?B?MGhvRkRGK3VNdU9qeXRtOE5BVE1YVHRDbTZRYVBkZmJ5SlU3UE1xOVZuV0NG?=
 =?utf-8?B?V1Babjl6L1VQcytiMnBiVGdGS3dxUnBLMDJUaUFNYndJUmlqdkZxTmMwdHIz?=
 =?utf-8?B?QXViQm9TMExvYWtrTDltKzN4dGdDQ2U0QUtyT0pkM240bUNRdzVVd2gySm5Y?=
 =?utf-8?B?aUVhWlczQTVEeExLUEs1Q0lqamMxT3JJQW9paFFiWXI4cHA4YkRqYVBoaUZq?=
 =?utf-8?Q?va8RttjcdVA9aJEZnlE0E/WT7?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 012930c2-29ab-4555-a107-08db026914cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2023 02:24:14.6455 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WqKkrUUAxWzfUhtfKTzaQ/B2Vnq3pe9qJ/497hkdrnx5oJmvwh2Wc7vKhz0jQDRdAJESzcgq2pih8EY9U38MAcWhrCbEazAb3Mn4rQU3aVE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6857
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.20;
 envelope-from=vivek.kasireddy@intel.com; helo=mga02.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

SGkgRnJlZGlhbm8sIEdlcmQsDQoNCj4gDQo+IElsIGdpb3JubyBtYXIgMjQgZ2VuIDIwMjMgYWxs
ZSBvcmUgMDY6NDEgS2FzaXJlZGR5LCBWaXZlaw0KPiA8dml2ZWsua2FzaXJlZGR5QGludGVsLmNv
bT4gaGEgc2NyaXR0bzoNCj4gPg0KPiA+ICsgRnJlZGlhbm8NCj4gPg0KPiA+IEhpIEdlcmQsDQo+
ID4NCj4gPiA+DQo+ID4gPiAgIEhpLA0KPiA+ID4NCj4gPiA+ID4gSGVyZSBpcyB0aGUgZmxvdyBv
ZiB0aGluZ3MgZnJvbSB0aGUgUWVtdSBzaWRlOg0KPiA+ID4gPiAtIENhbGwgZ2xfc2Nhbm91dCAo
dG8gdXBkYXRlIHRoZSBmZCkgYW5kIGdsX2RyYXdfYXN5bmMganVzdCBsaWtlDQo+ID4gPiA+ICAg
aW4gdGhlIGxvY2FsIGRpc3BsYXkgY2FzZS4NCj4gPiA+DQo+ID4gPiBPay4NCj4gPiA+DQo+ID4g
PiA+IC0gQWRkaXRpb25hbGx5LCBjcmVhdGUgYW4gdXBkYXRlIHdpdGggdGhlIGNtZCBzZXQgdG8g
UVhMX0NNRF9EUkFXDQo+ID4gPiA+ICAgdG8gdHJpZ2dlciB0aGUgY3JlYXRpb24gb2YgYSBuZXcg
ZHJhd2FibGUgKGFzc29jaWF0ZWQgd2l0aCB0aGUgZmQpDQo+ID4gPiA+ICAgYnkgdGhlIFNwaWNl
IHNlcnZlci4NCj4gPiA+ID4gLSBXYWl0IChvciBibG9jaykgdW50aWwgdGhlIEVuY29kZXIgaXMg
ZG9uZSBlbmNvZGluZyB0aGUgY29udGVudC4NCj4gPiA+ID4gLSBVbmJsb2NrIHRoZSBwaXBlbGlu
ZSBvbmNlIHRoZSBhc3luYyBjb21wbGV0aW9uIGNvb2tpZSBpcyByZWNlaXZlZC4NCj4gPiA+DQo+
ID4gPiBDYXJlIHRvIGV4cGxhaW4/ICBGb3IgcWVtdSBpdCBzaG91bGQgbWFrZSBhIGRpZmZlcmVu
Y2Ugd2hhdCBzcGljZS1zZXJ2ZXINCj4gPiA+IGRvZXMgd2l0aCB0aGUgZG1hLWJ1ZnMgcGFzc2Vk
IChsb2NhbCBkaXNwbGF5IC8gZW5jb2RlIHZpZGVvICsgc2VuZCB0bw0KPiA+ID4gcmVtb3RlKS4N
Cj4gPiBbS2FzaXJlZGR5LCBWaXZla10gSSBhZ3JlZSB0aGF0IFFlbXUgc2hvdWxkbid0IGNhcmUg
d2hhdCB0aGUgc3BpY2Utc2VydmVyIGRvZXMNCj4gPiB3aXRoIHRoZSBkbWFidWYgZmRzIGJ1dCBz
b21laG93IGEgZHJhd2FibGUgaGFzIHRvIGJlIGNyZWF0ZWQgaW4gdGhlIHJlbW90ZQ0KPiBjbGll
bnQNCj4gPiBjYXNlLiBUaGlzIGlzIG5lZWRlZCBhcyBtb3N0IG9mIHRoZSBjb3JlIGZ1bmN0aW9u
cyBpbiB0aGUgc2VydmVyIChhc3NvY2lhdGVkIHdpdGgNCj4gPiBkaXNwbGF5LWNoYW5uZWwsIHZp
ZGVvLXN0cmVhbSwgZW5jb2RlciwgZXRjKSBvcGVyYXRlIG9uIGRyYXdhYmxlcy4gVGhlcmVmb3Jl
LCBJDQo+ID4gZmlndXJlZCBzaW5jZSBRZW11IGFscmVhZHkgdGVsbHMgdGhlIHNlcnZlciB0byBj
cmVhdGUgYSBkcmF3YWJsZSBpbiB0aGUgbm9uLWdsDQo+IGNhc2UNCj4gPiAoYnkgY3JlYXRpbmcg
YW4gdXBkYXRlIHRoYXQgaW5jbHVkZXMgYSBRWExfQ01EX0RSQVcgY21kKSwgdGhlIHNhbWUgdGhp
bmcNCj4gPiBjYW4gYmUgZG9uZSBpbiB0aGUgZ2wgKyByZW1vdGUgY2xpZW50IGNhc2UgYXMgd2Vs
bC4NCj4gPg0KPiANCj4gVGhpcyBpcyBhIGhhY2suIEl0J3MgY29tYmluaW5nIGFuIGludmFsaWQg
Y29tbWFuZCBpbiBvcmRlciB0byBjYXVzZQ0KPiBzb21lIHNpZGUgZWZmZWN0cyBvbiBzcGljZSBz
ZXJ2ZXIgYnV0IGl0IGFsc28gbmVlZHMgYSBjaGFuZ2UgaW4gc3BpY2UNCj4gc2VydmVyIHRvIGRl
dGVjdCBhbmQgaGFuZGxlIHRoaXMgaGFjay4gUVhMX0NNRF9EUkFXIGlzIG1haW5seSBib3VuZCB0
bw0KPiAyRCBjb21tYW5kcyBhbmQgc2hvdWxkIGNvbWUgd2l0aCB2YWxpZCBiaXRtYXAgZGF0YS4N
Cj4gDQo+ID4gQWx0ZXJuYXRpdmVseSwgd2UgY291bGQgbWFrZSB0aGUgc2VydmVyIGNyZWF0ZSBh
IGRyYXdhYmxlIGFzIGEgcmVzcG9uc2UgdG8NCj4gZ2xfc2Nhbm91dCwNCj4gPiB3aGVuIGl0IGRl
dGVjdHMgYSByZW1vdGUgY2xpZW50LiBJSVVDLCBJIHRoaW5rIHRoaXMgY2FuIGJlIGRvbmUgYnV0
IHNlZW1zIHJhdGhlcg0KPiBtZXNzeQ0KPiA+IGdpdmVuIHRoYXQgY3VycmVudGx5LCB0aGUgc2Vy
dmVyIG9ubHkgY3JlYXRlcyBhIGRyYXdhYmxlIChpbnNpZGUNCj4gcmVkX3Byb2Nlc3NfZGlzcGxh
eSkNCj4gPiBpbiB0aGUgY2FzZSBvZiBRWExfQ01EX0RSQVcgc2VudCBieSBRZW11L2FwcGxpY2F0
aW9uczoNCj4gPiAgICAgICAgIHN3aXRjaCAoZXh0X2NtZC5jbWQudHlwZSkgew0KPiA+ICAgICAg
ICAgY2FzZSBRWExfQ01EX0RSQVc6IHsNCj4gPiAgICAgICAgICAgICBhdXRvIHJlZF9kcmF3YWJs
ZSA9IHJlZF9kcmF3YWJsZV9uZXcod29ya2VyLT5xeGwsICZ3b3JrZXItDQo+ID5tZW1fc2xvdHMs
DQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGV4
dF9jbWQuZ3JvdXBfaWQsIGV4dF9jbWQuY21kLmRhdGEsDQo+ID4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGV4dF9jbWQuZmxhZ3MpOyAvLyByZXR1cm5z
IHdpdGggMSByZWYNCj4gPg0KPiA+ICAgICAgICAgICAgIGlmIChyZWRfZHJhd2FibGUpIHsNCj4g
PiAgICAgICAgICAgICAgICAgZGlzcGxheV9jaGFubmVsX3Byb2Nlc3NfZHJhdyh3b3JrZXItPmRp
c3BsYXlfY2hhbm5lbCwNCj4gc3RkOjptb3ZlKHJlZF9kcmF3YWJsZSksDQo+ID4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgd29ya2VyLT5wcm9jZXNzX2Rpc3Bs
YXlfZ2VuZXJhdGlvbik7DQo+ID4gICAgICAgICAgICAgfQ0KPiA+DQo+IA0KPiBZZXMsIGl0IHNv
dW5kcyBhIGJpdCBsb25nIGJ1dCBzdXJlbHkgYmV0dGVyIHRoYW4gaGFja2luZyBRZW11LCBzcGlj
ZQ0KPiBzZXJ2ZXIgYW5kIGRlZmluaW5nIGEgbmV3IGhhY2t5IEFCSSB0aGF0IHdpbGwgYmUgaGFy
ZCB0byBtYWludGFpbiBhbmQNCj4gdW5kZXJzdGFuZC4NCj4gDQo+ID4gVGhlIG90aGVyIG9wdGlv
biBJIGNhbiB0aGluayBvZiBpcyB0byBqdXN0IG5vdCBkZWFsIHdpdGggZHJhd2FibGVzIGF0IGFs
bCBhbmQNCj4gc29tZWhvdw0KPiA+IGRpcmVjdGx5IHNoYXJlIHRoZSBkbWFidWYgZmQgd2l0aCB0
aGUgRW5jb2Rlci4gVGhpcyBzb2x1dGlvbiBhbHNvIHNlZW1zIHZlcnkNCj4gbWVzc3kNCj4gPiBh
bmQgaW52YXNpdmUgdG8gbWUgYXMgd2UnZCBub3QgYmUgYWJsZSB0byBsZXZlcmFnZSB0aGUgZXhp
c3RpbmcgQVBJcyAoaW4gZGlzcGxheS0NCj4gY2hhbm5lbCwNCj4gPiB2aWRlby1zdHJlYW0sIGV0
YykgdGhhdCBjcmVhdGUgYW5kIG1hbmFnZSBzdHJlYW1zIGVmZmljaWVudGx5Lg0KPiA+DQo+IA0K
PiBZZXMsIHRoYXQgY3VycmVudGx5IHNlZW1zIHByZXR0eSBsb25nIGFzIGEgY2hhbmdlIGJ1dCBw
b3NzaWJseSB0aGUNCj4gbW9zdCBjbGVhbiBpbiBmdXR1cmUsIGl0J3MgdXAgdG8gc29tZSByZWZh
Y3RvcnkuIFRoZSBFbmNvZGVyIGRvZXMgbm90DQo+IGVpdGhlciBuZWVkIHRlY2huaWNhbGx5IGEg
UmVkRHJhd2FibGUsIERyYXdhYmxlIGJ1dCBmcmFtZSBkYXRhIGVuY29kZWQNCj4gaW4gYSBmb3Jt
YXQgaXQgY2FuIG1hbmFnZSAoZWl0aGVyIHJhdyBtZW1vcnkgZGF0YSBvciBkbWFidWYgYXQgdGhl
DQo+IG1vbWVudCkuDQpbS2FzaXJlZGR5LCBWaXZla10gT2ssIEknbGwgd29yayBvbiByZWZhY3Rv
cmluZyBTcGljZSBzZXJ2ZXIgY29kZSB0byBwYXNzDQp0aGUgZG1hYnVmIGZkIGRpcmVjdGx5IHRv
IHRoZSBFbmNvZGVyIHdpdGhvdXQgaGF2aW5nIHRvIGNyZWF0aW5nIGRyYXdhYmxlcy4NCg0KVGhh
bmtzLA0KVml2ZWsgDQoNCj4gDQo+ID4gPg0KPiA+ID4gPiAgI2lmZGVmIEhBVkVfU1BJQ0VfR0wN
Cj4gPiA+ID4gKyAgICAgICAgfSBlbHNlIGlmIChzcGljZV9kbWFidWZfZW5jb2RlKSB7DQo+ID4g
PiA+ICsgICAgICAgICAgICBpZiAoZ19zdHJjbXAwKHByZWZlcnJlZF9jb2RlYywgImdzdHJlYW1l
cjpoMjY0IikpIHsNCj4gPiA+ID4gKyAgICAgICAgICAgICAgICBlcnJvcl9yZXBvcnQoImRtYWJ1
Zi1lbmNvZGU9b24gY3VycmVudGx5IG9ubHkgd29ya3MgYW5kIHRlc3RlZCINCj4gPiA+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIndpdGggZ3N0cmVhbWVyOmgyNjQiKTsNCj4gPiA+
ID4gKyAgICAgICAgICAgICAgICBleGl0KDEpOw0KPiA+ID4gPiArICAgICAgICAgICAgfQ0KPiA+
ID4NCj4gPiA+IElNSE8gd2Ugc2hvdWxkIG5vdCBoYXJkLWNvZGUgdG9kYXlzIHNwaWNlLXNlcnZl
ciBjYXBhYmlsaXRpZXMgbGlrZSB0aGlzLg0KPiA+ID4gRm9yIHN0YXJ0ZXJzIHRoaXMgaXNuJ3Qg
dHJ1ZSBmb3Igc3BpY2Utc2VydmVyIHZlcnNpb25zIHdoaWNoIGRvbid0ICh5ZXQpDQo+ID4gPiBo
YXZlIHlvdXIgcGF0Y2hlcy4gIEFsc28gdGhlIGNhcGFiaWxpdHkgbWlnaHQgZGVwZW5kIG9uIGhh
cmR3YXJlDQo+ID4gPiBzdXBwb3J0LiAgSU1ITyB3ZSBuZWVkIHNvbWUgZmVhdHVyZSBuZWdvdGlh
dGlvbiBiZXR3ZWVuIHFlbXUgYW5kIHNwaWNlDQo+ID4gPiBoZXJlLg0KPiA+IFtLYXNpcmVkZHks
IFZpdmVrXSBPaywgSSBjYW4gZ2V0IHJpZCBvZiB0aGlzIGNodW5rIGluIHYzLiBIb3dldmVyLCBn
aXZlbiB0aGUNCj4gbnVtZXJvdXMNCj4gPiBmZWF0dXJlcyBzdXBwb3J0ZWQgYnkgdGhlIFNwaWNl
IHNlcnZlciwgSSBzdXNwZWN0IGltcGxlbWVudGluZyBmZWF0dXJlDQo+IG5lZ290aWF0aW9uDQo+
ID4gbWlnaHQgZ2V0IHJlYWxseSBjaGFsbGVuZ2luZy4gSXMgdGhlcmUgYW55IG90aGVyIHdheSBh
cm91bmQgdGhpcyB0aGF0IHlvdSBjYW4NCj4gdGhpbmsgb2Y/DQo+ID4NCj4gPiBUaGFua3MsDQo+
ID4gVml2ZWsNCj4gPg0KPiA+ID4NCj4gPiA+IHRha2UgY2FyZSwNCj4gPiA+ICAgR2VyZA0KPiA+
DQo+IA0KPiBGcmVkaWFubw0K

