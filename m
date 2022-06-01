Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C87A8539A92
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 03:00:21 +0200 (CEST)
Received: from localhost ([::1]:33800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwCii-0003h7-24
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 21:00:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changpeng.liu@intel.com>)
 id 1nwCh3-0002UM-0B
 for qemu-devel@nongnu.org; Tue, 31 May 2022 20:58:37 -0400
Received: from mga04.intel.com ([192.55.52.120]:33471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changpeng.liu@intel.com>)
 id 1nwCgy-0008WV-0b
 for qemu-devel@nongnu.org; Tue, 31 May 2022 20:58:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654045112; x=1685581112;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lgYHewUj9BjfSc1C4eRIPCKQnowJYv8ZiitxRZ7oN1g=;
 b=mPPovP6kQowHR4q4NIoxTo45nSiS1JOaHi2kPtzVqtHb7BVpDkBxlkO4
 LN+BCgqiTVIohjoYWlFXMA5u3SCkJNwjBhWZ4wUQ1VrwCvRM0vwizT7c+
 QLIVyNonmaiEdA2+oBetuN4sQijdwsJJ+DB8v2m9wQCmh6xOv8PeHG8VD
 jFMfmYOhznkmc+/L+BOpcAIsTLaHhCZX8UsqeK9DDVA05Smasq4Hut/fU
 OSIdcCKbgZR0J/AoS/bhMbSo+NfPGCgayknPY7yR7XsFC8crnWcCh4O6+
 t7nSfwd/A9ZuT6ZZPm7if0OkwvfQTlpAWSaGvAGb8PuqmNbvK2eJoUbCa w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10364"; a="274234492"
X-IronPort-AV: E=Sophos;i="5.91,266,1647327600"; d="scan'208";a="274234492"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2022 17:58:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,266,1647327600"; d="scan'208";a="562568245"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by orsmga002.jf.intel.com with ESMTP; 31 May 2022 17:58:23 -0700
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 31 May 2022 17:58:22 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 31 May 2022 17:58:22 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 31 May 2022 17:58:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Weya+LjmTHYTq283nuh+mY/ep0w77Sxyddq/Dv1NqOrOxI9dEP2cuhIWhf3dQUuSBjIAJD8/OME/YNa3MrwuiES2FDlF6drDkkij9fVru83FH+KQZ2BhFyFdwzBkNwvvxtRBFz07+1HEvCfqLw69HWFtqC0yX3axlat+el7hSGQBFtRfEf+LS6HQxYiotTLTWLW8pfdtzp3v5CtrEUal5o0XXzm3JXpffRTcKNYOzpT+LC6xp+QNq0UZGFeGoPUZloJ77e2RYNuPeYp8GKSFYhsH4yppVtBqUWfOzP/LUwwgNYE4gILUNOEBHqgYl28DCnu17D2kn2osw/VUgR3K0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lgYHewUj9BjfSc1C4eRIPCKQnowJYv8ZiitxRZ7oN1g=;
 b=PWgBLgw0WScAzzoc0odyqMLkl/7Jbyx4u2qpKuuvJ1WKgyiUZVY6EXLpmpWq9ZKpnWz0tWmZCJnnr8k/2p/KZgRonOfn18vY4+EpkpCbqChF/hRvuR7bYj7jIuMd/4apHrnjl7VVPs8JZ2QGYbIikufHBNJaDc4W9mNeD4LV2VmnxKorMzdsZm/sPPeFDRI0n64XGvuHdWd2nWDrVywc+ii0UVXhiqqTUGsEH5yZHZJPVDKk9Bj4wX52Ijty5to4VH6Sr2PfIkCroJop7CwrAK/7nFGTAjRadR2HEuQkJFqepUBUqql7Ge7Xufv2g6d0UnHbEx/sj+6W8FKmVfVLgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5093.namprd11.prod.outlook.com (2603:10b6:510:3e::23)
 by MWHPR11MB1773.namprd11.prod.outlook.com (2603:10b6:300:10f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Wed, 1 Jun
 2022 00:58:21 +0000
Received: from PH0PR11MB5093.namprd11.prod.outlook.com
 ([fe80::6c9a:d1d3:8b6a:a0eb]) by PH0PR11MB5093.namprd11.prod.outlook.com
 ([fe80::6c9a:d1d3:8b6a:a0eb%7]) with mapi id 15.20.5314.012; Wed, 1 Jun 2022
 00:58:21 +0000
From: "Liu, Changpeng" <changpeng.liu@intel.com>
To: =?utf-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH 1/2] hw/virtio/vhost-user: don't use uninitialized variable
Thread-Topic: [PATCH 1/2] hw/virtio/vhost-user: don't use uninitialized
 variable
Thread-Index: AQHYcDbGW+TzxxB8F0ejnDSwP4GA5605GdiAgACoUTA=
Date: Wed, 1 Jun 2022 00:58:21 +0000
Message-ID: <PH0PR11MB50934D0391B918A38DD2488EEEDF9@PH0PR11MB5093.namprd11.prod.outlook.com>
References: <20220525125540.50979-1-changpeng.liu@intel.com>
 <87ee09wyh0.fsf@linaro.org>
In-Reply-To: <87ee09wyh0.fsf@linaro.org>
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
x-ms-office365-filtering-correlation-id: aa29e8e5-1334-4649-1847-08da4369d2b6
x-ms-traffictypediagnostic: MWHPR11MB1773:EE_
x-microsoft-antispam-prvs: <MWHPR11MB17733CE210EEB35FB927479BEEDF9@MWHPR11MB1773.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Hi1hkaZFQuCS7TVdGQLlLCbYRanQFPsUitZCwEU7p2dIgq1XqIiwcPG4nSwPtkxXvWHwNm4tScML2xKs4L7PY32jewXvlZNv9xoLizgrvFU3JOOXQvGNLSRmNNANjpFOcdcwnKuwiRbsjrk/Koj9RPsJkHCZAnkM0LCeyWHFxazF5x5Udc0V2OztWOHJowdhFPsu+c3V5604br7jyJe+bj+4266/kaGARPf/DVWWe5n4ZKUtGvI+GnuGHpIcfFXaO7agNd9KdKdSRr6c9kTs+ZgJzCjTFbWMbdCzmQ+mkASnWi1/eWpbeWEtUJ4zE8UboAIj8ooRrCGpo9jZDwY3xwX5OfSDE+9ax5x3nRp9RSMvypVswvtvsi4T+pq5BPdSVRhtGQREkGjEcAPhUAj935AF76LCb0QLKvpu+40ds1E8TVFp/JXAAViWu/+t6qgTA/+JzlU2W+yIFikOdwAq7OpwP8sfVahCJ++KPY2dJTi7LmXtb3/IpU8cxBk0Oa/ddpSjv4PkR9uCvdJdknqYTjdcHRhML/dJLopFrjcwyM+tDOED2UKwLF4PjP8vnEztmy32XzGMjcPECkvZkCqUZfSz3gy+L6mt7S0ATZFlyx6kx3jDUY7p+adgjABEtlJVYcEOLelCH8DCaejE/46R+DiZOwZUzCeHHpX6ExQbFKzULRcuKApAicIb3F6Y7/Bza4ifP2yxEKkyUtlKTyblng==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5093.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(86362001)(5660300002)(38100700002)(64756008)(66556008)(66476007)(76116006)(8676002)(66446008)(4326008)(8936002)(52536014)(66946007)(186003)(508600001)(33656002)(71200400001)(26005)(7696005)(6916009)(9686003)(53546011)(316002)(2906002)(6506007)(82960400001)(55016003)(83380400001)(122000001)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZTJGMEhDWFBGaElKbE1mNXMrUll1TUlHd3QyaVN5ZFBpeXp4azB2V1B0TlFB?=
 =?utf-8?B?RmFtNWdXNTZ4cFROTTBnM2htMVBkcXg1RUlCZE1OQXkxMitraGVFa3QxVDVu?=
 =?utf-8?B?N0hnTmh3UnNTQ1JYdTFZM0hqVkcvd2wwZzdGcTc4aFhaTWplNkdMcjA2eVBP?=
 =?utf-8?B?OG9jQXB0WCtndVI2dU9laUpLQyswQU04Z2dFcjltbzJuTnNZVUZhbGJaLzFl?=
 =?utf-8?B?dFRyQ3dUZ2gyOXN5enJSUzhma3ZyR0NnU1dpNGV6Q28xQTZNbEE4bWtwdHkz?=
 =?utf-8?B?cjdsUU1UNEdEeDlBbFlPOHJ1SGk3cHRJeFVaUE9zTERBUlhEZmR0cVZkaGp6?=
 =?utf-8?B?NGpsR21la2tiZ1dFMFBrd0o2cFBHcE52U3R1Z3JFamMzYlhCazJNL29vWHk5?=
 =?utf-8?B?UHNCTUQyejdCdk56NlM0bHdBeVBaMHNwS3JlV0QwVE02NUdQUTJGckdNdlBk?=
 =?utf-8?B?bEg4dGtuejNPQlU2VXJmMktMRXdKWDdtRDQzc3BsU1NxNlBYeUxyd0RMbGE5?=
 =?utf-8?B?R3pvaGxXcnZMUFIrUWQreWhOOUlxSVZIZ2VoL1B0dXM1Siszd1VEU085Uy84?=
 =?utf-8?B?TVRUd05wQkt5SHRhOXUxZk5mNzFHOXovaEZuU0tZQThZaWprcE5PY20xYkJz?=
 =?utf-8?B?WFg2OVcrS2RsVCtCLzBCaVlDZWtDbDF0c3o1dkNqZlhiRFF4UnQzWjdleGtL?=
 =?utf-8?B?VlJGWEFJa3RFeUVPY2ZMdkVEcTEvUU5FblNkeXluNmtRSFlpYktRc2JWZ3Nu?=
 =?utf-8?B?anNOTjZNOUpTNG4xcnFUc2hkR1RRUnlUaEQrV2lUcGtvS0hKc1pUN04xV0lp?=
 =?utf-8?B?cGd3VVlXQm9SQUNmUVpTQjJ5aG5JQjlxZHdOUmtPa3pZMWdNbWZhR093Wnph?=
 =?utf-8?B?L3h3WnNqMTBORmFMc0FrWDEvTENPOXVHbFZQWC9rMHkzdTlUMndXeHg0bDZm?=
 =?utf-8?B?VStoaExzV2tic1haVjZqRS8wa092dGsreUNGTVlxTXNsS3BqZWRqamIyaXg5?=
 =?utf-8?B?K3BsU0JSRW1JOU1Mb2RhcVVUVTc3S1lsS3Fwdmo5Y1dNbndZVFFaL0NBY0o0?=
 =?utf-8?B?STM3a3owVjh4NGk3SEJCMjd0bXNFc3RmL0YzdGdmeEFUVjJPZTd5a2V1UTdO?=
 =?utf-8?B?czBkZS9JSjc5YXpjalhNZU9RVjl0cWcyYVBoWXVvenRxMHVDQTZNaGJjMGd3?=
 =?utf-8?B?T2VLWEl1ZzRuWEhDaTlaWi84Zm9DZ1h1dmFlZ3BycmhuT09rSWxJWnB6TUE0?=
 =?utf-8?B?TkRmcGtuRXoxdE4zdThySnZUNExhWDVTQm54eHpKYVBYcG54bW9LY2NPdjRW?=
 =?utf-8?B?bzhEWTRiekYydVgzS2tOdkRZRXM5SlgxY2p4TytPbmRQM1hOZFJUMkNyZGpL?=
 =?utf-8?B?Qnp1UkxHclBhVTNicU5RV3NQV25JU1FOaHpxdTIxOFdzeU9tVHYzeWNrY1ha?=
 =?utf-8?B?aFhHaXQ0NEFJbTRRcmFuRFNudGdBMmRtM2pzRExzQXJXNitPSXYvU1duTUpX?=
 =?utf-8?B?dnloQzZ0RmRDQjFndFhUSGlqaGhmWHIrM0NmVm80a2F4Q0U5ZFdtVGZ2SGpT?=
 =?utf-8?B?Y2lFd1QyUGs2bklaYlZLc21uc3JEdEFwNEJNNlorTjNxL2Q1ZjcycVJtZTNt?=
 =?utf-8?B?bW8yRklxQVhHa1ZVeExBY2xaZzBkeFBwMStKNUk3QTZuSzFMOW00VERobVFa?=
 =?utf-8?B?SThqeVRGOGg3azRHYk45Vkw5Y0RkOWRzdkR6T1lpazhxaE1sbHhTSWhaNHpy?=
 =?utf-8?B?Z2pzUDFQSG45TGFZQjlNRHFXWUJjNnlGdWc3S2NXY1BaWndtMVQ2cFp2a1dh?=
 =?utf-8?B?cXJ6d0VtS0s5RXI0cDBBa0hIcGxmSUlJb2VQK0ZwVmZNT3V6SWZ6QkxGRFVE?=
 =?utf-8?B?c3h3TnRHOVFsTVB3V3BSZ2F2YVlDUXdGcmNjS2VmNWJpL1ZWQkoxQkxKN3VT?=
 =?utf-8?B?eGNTUVc4ejV5bkpTZEk0QmVMZXpvOFR2K0lrelgxaWRuRlovSlJLTEVHQmtQ?=
 =?utf-8?B?SmZwSmF2S3kyNGZLT2VYK0FBNFhJMzc4N05vL01rTmJRc3hiTmhMckZkMDFh?=
 =?utf-8?B?SnBEbFBTaEo5cTh2YVpmUXh3aDlwSXB0Z0E3UUgrL2NZVUJFbFZxb3FVSVZY?=
 =?utf-8?B?OENPd0NSSzdENWMvazJobGo1TGl6NFlKWlE1TElxN1lHN0tZQWl5L2VJNU5B?=
 =?utf-8?B?bmsrZytKV2pqNjhwZjYrOE9BTlEzNUVMRUZTZXBGZG4zUTlVaThVRDJ0SmtT?=
 =?utf-8?B?RTE1Z0thUS9Gc1Z3aWlnVS92Nm95VWZOTkpveExtVHFlOE9HMjlGMS9pdEQ4?=
 =?utf-8?B?emRVbURKQ011Y0Uvckp6bWFRc3NtVGhGSUZRbjgrQkVCQk9md3ptUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5093.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa29e8e5-1334-4649-1847-08da4369d2b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2022 00:58:21.1580 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yKlBulfh0jWoJxjd+Cc0kVMF17hAO9xqLBPDUQwsvdCTckRR7ozq+MDS7nSOboxQW50x/YZmWCvkRxNDHUuKzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1773
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.120;
 envelope-from=changpeng.liu@intel.com; helo=mga04.intel.com
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQWxleCBCZW5uw6llIDxh
bGV4LmJlbm5lZUBsaW5hcm8ub3JnPg0KPiBTZW50OiBUdWVzZGF5LCBNYXkgMzEsIDIwMjIgMTA6
NDYgUE0NCj4gVG86IExpdSwgQ2hhbmdwZW5nIDxjaGFuZ3BlbmcubGl1QGludGVsLmNvbT4NCj4g
Q2M6IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDEvMl0gaHcv
dmlydGlvL3Zob3N0LXVzZXI6IGRvbid0IHVzZSB1bmluaXRpYWxpemVkIHZhcmlhYmxlDQo+IA0K
PiANCj4gQ2hhbmdwZW5nIExpdSA8Y2hhbmdwZW5nLmxpdUBpbnRlbC5jb20+IHdyaXRlczoNCj4g
DQo+ID4gVmFyaWFibGUgYHZkZXZgIGluIGBzdHJ1Y3Qgdmhvc3RfZGV2YCB3aWxsIG5vdCBiZSBy
ZWFkeQ0KPiA+IHVudGlsIHN0YXJ0IHRoZSBkZXZpY2UsIHNvIGxldCdzIG5vdCB1c2UgaXQgZm9y
IHRoZSBlcnJvcg0KPiA+IG91dHB1dCBoZXJlLg0KPiANCj4gVGhpcyBzZWVtcyB0byBiZSBvbmUg
b2YgdGhlIGFyZWFzIHdoZXJlIHZob3N0X3VzZXJfYmFja2VuZF9kZXZfaW5pdCBhbmQNCj4gdmhv
c3RfZGV2X2luaXQgZG8gdGhpbmdzIGRpZmZlcmVudGx5LiBJcyB0aGVyZSBhbnkgcGFydGljdWxh
ciByZWFzb24gd2h5DQo+IHdlIGNvdWxkbid0IGluaXRpYWxpc2UgaGRldi0+dmRldiBjb25zaXN0
ZW50bHkgYXQgaW5pdCB0aW1lPw0Kdmhvc3RfZGV2X2luaXQoKSBzZXQgaGRldi0+dmRldiB0byBO
VUxMLCBhbmQgdmhvc3RfZGV2X3N0YXJ0KCkgc2V0IGl0IHRvIFZpcnRJT0RldmljZSwNCml0J3Mg
Y29uc2lzdGVudCwgdGhleSBhcmUgY29tbW9uIEFQSXMgZGVzaWduZWQgZm9yIHZob3N0LWtlcm5l
bCBhbmQgdmhvc3QtdXNlci4NCj4gDQo+ID4NCj4gPiBGaXhlczogNTY1MzQ5MyAoImh3L3ZpcnRp
by92aG9zdC11c2VyOiBkb24ndCBzdXBwcmVzcyBGX0NPTkZJRyB3aGVuDQo+IHN1cHBvcnRlZCIp
DQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBDaGFuZ3BlbmcgTGl1IDxjaGFuZ3BlbmcubGl1QGlu
dGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAgaHcvdmlydGlvL3Zob3N0LXVzZXIuYyB8IDggKysrLS0t
LS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkN
Cj4gPg0KPiA+IGRpZmYgLS1naXQgYS9ody92aXJ0aW8vdmhvc3QtdXNlci5jIGIvaHcvdmlydGlv
L3Zob3N0LXVzZXIuYw0KPiA+IGluZGV4IGIwNDBjMWFkMmIuLjA1OTQxNzgyMjQgMTAwNjQ0DQo+
ID4gLS0tIGEvaHcvdmlydGlvL3Zob3N0LXVzZXIuYw0KPiA+ICsrKyBiL2h3L3ZpcnRpby92aG9z
dC11c2VyLmMNCj4gPiBAQCAtMjAzMSwxOCArMjAzMSwxNiBAQCBzdGF0aWMgaW50IHZob3N0X3Vz
ZXJfYmFja2VuZF9pbml0KHN0cnVjdA0KPiB2aG9zdF9kZXYgKmRldiwgdm9pZCAqb3BhcXVlLA0K
PiA+ICAgICAgICAgIGlmIChzdXBwb3J0c19mX2NvbmZpZykgew0KPiA+ICAgICAgICAgICAgICBp
ZiAoIXZpcnRpb19oYXNfZmVhdHVyZShwcm90b2NvbF9mZWF0dXJlcywNCj4gPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgVkhPU1RfVVNFUl9QUk9UT0NPTF9GX0NPTkZJRykp
IHsNCj4gPiAtICAgICAgICAgICAgICAgIGVycm9yX3NldGcoZXJycCwgInZob3N0LXVzZXIgZGV2
aWNlICVzIGV4cGVjdGluZyAiDQo+ID4gKyAgICAgICAgICAgICAgICBlcnJvcl9zZXRnKGVycnAs
ICJ2aG9zdC11c2VyIGRldmljZSBleHBlY3RpbmcgIg0KPiA+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAiVkhPU1RfVVNFUl9QUk9UT0NPTF9GX0NPTkZJRyBidXQgdGhlIHZob3N0LXVzZXIN
Cj4gYmFja2VuZCBkb2VzICINCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgIm5vdCBz
dXBwb3J0IGl0LiIsIGRldi0+dmRldi0+bmFtZSk7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICJub3Qgc3VwcG9ydCBpdC4iKTsNCj4gPiAgICAgICAgICAgICAgICAgIHJldHVybiAt
RVBST1RPOw0KPiA+ICAgICAgICAgICAgICB9DQo+ID4gICAgICAgICAgfSBlbHNlIHsNCj4gPiAg
ICAgICAgICAgICAgaWYgKHZpcnRpb19oYXNfZmVhdHVyZShwcm90b2NvbF9mZWF0dXJlcywNCj4g
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBWSE9TVF9VU0VSX1BST1RPQ09M
X0ZfQ09ORklHKSkgew0KPiA+ICAgICAgICAgICAgICAgICAgd2Fybl9yZXBvcnRmX2VycigqZXJy
cCwgInZob3N0LXVzZXIgYmFja2VuZCBzdXBwb3J0cyAiDQo+ID4gLSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICJWSE9TVF9VU0VSX1BST1RPQ09MX0ZfQ09ORklHIGZvciAiDQo+ID4g
LSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJkZXZpY2UgJXMgYnV0IFFFTVUgZG9l
cyBub3QuIiwNCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZGV2LT52ZGV2
LT5uYW1lKTsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIlZIT1NUX1VT
RVJfUFJPVE9DT0xfRl9DT05GSUcgYnV0IFFFTVUgZG9lcyBub3QuIik7DQo+ID4gICAgICAgICAg
ICAgICAgICBwcm90b2NvbF9mZWF0dXJlcyAmPSB+KDFVTEwgPDwgVkhPU1RfVVNFUl9QUk9UT0NP
TF9GX0NPTkZJRyk7DQo+ID4gICAgICAgICAgICAgIH0NCj4gPiAgICAgICAgICB9DQo+IA0KPiAN
Cj4gLS0NCj4gQWxleCBCZW5uw6llDQo=

