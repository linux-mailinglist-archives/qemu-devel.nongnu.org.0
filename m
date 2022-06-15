Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D7954CF60
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 19:08:16 +0200 (CEST)
Received: from localhost ([::1]:47222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1WV3-0006Xf-Ln
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 13:08:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eddie.dong@intel.com>)
 id 1o1WJr-0003de-IJ
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 12:56:41 -0400
Received: from mga05.intel.com ([192.55.52.43]:56107)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eddie.dong@intel.com>)
 id 1o1WJo-0003MP-MG
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 12:56:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655312196; x=1686848196;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=h3adYc6tJleVkm1fAh/hVAc0eP75JGqnNVN0Yol1q4M=;
 b=Y0ZilVT27F+Axn5zoMm/HbAHte+6lksosPSXhIrC412RTYoU7mGWC6wH
 f8E8Yq6UssUtxyQsRW2QchYa8OdXY7a5DIE0By3dZdBGVqTDGB7uYWKke
 IiB3IX0Mmmf6kuRA3rAQKdquCiGsha0OvqUjURjsgpH51zdjLjFXTL++t
 WCcWKAHRUrdqrrx9gV+jd4OZ5E0L5wLEuFeynhh1MbTzF+M4dxVQPy6Bh
 sMOTQk6Gu55euBGivZtjoADG7InHrsN1If/gKfuQXN0bna5Zeio1ZBDx7
 Rq/I9awWa17o7eCPNGnoNLNAkbAaQYIaGp8GkYAy7c1VqTZXSyqOqcwrb A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10379"; a="365381142"
X-IronPort-AV: E=Sophos;i="5.91,302,1647327600"; d="scan'208";a="365381142"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2022 09:56:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,302,1647327600"; d="scan'208";a="674603757"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP; 15 Jun 2022 09:56:32 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 15 Jun 2022 09:56:32 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 15 Jun 2022 09:56:32 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 15 Jun 2022 09:56:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FrMffLyaf+AUg69oCwCIiXkSQK9t21nhcA+SLejA3xCfI6WZVw3P24/iL9XRmETyGCWZ2SGhSJNkATtLP6MvP4d/51O4Evk7+p7IGAQv+Mz7cRm25Rh+NRPKOBB/VrmfvoGpfNn1heesSMD98HM65I6ZlykWqVF9MlAX6FB5QMCI4n/BAYpsmSa7r+y6+zqXcVgZQzkEEPZ8YdEzqeIma8eLr3qE0G4a1FeLvHUFptRI4SOSDslDuYwaSmVLGTlGe8xrxH2KBEHXTi+1Z3PTRpZL5zAAWnAFUsFY1wOBlyFwiitoZ1nSh+NkY+95VG+rSWSbPubQzu4AJ8TN6b+1xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h3adYc6tJleVkm1fAh/hVAc0eP75JGqnNVN0Yol1q4M=;
 b=oF/5DzZDPJTPTu3HnDjOziu6iA2hw0YhitczowqjRbZsxWgXURrio2lQWVXIOBoMMwVhqivTLcJgCJ2SEbU7aWL/vCbYus1n1ZdrD+kHYK70u3n5FiUQ3hgz6D2We3bLi0pGzJbfXA2wnUY+rREkLlaQL8CDwfCpI90XCiYhv8qpSNhEAGgymUlxj8TE37p0F6pKZuHuG98W0IWkDn6O9TUeeZWDkFfJEM+y4RUDvD9z7qeOHqz9mssKCbmoQvufCfmoTb3xvdqhwzomtlThqN7ZPwn9hEWMznKmMwa8Tl+IlRoHSiour/LsU3nV4vDkjAIRRMexjM/xyKF7rxzKSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL0PR11MB3042.namprd11.prod.outlook.com (2603:10b6:208:78::17)
 by PH0PR11MB4775.namprd11.prod.outlook.com (2603:10b6:510:34::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Wed, 15 Jun
 2022 16:56:30 +0000
Received: from BL0PR11MB3042.namprd11.prod.outlook.com
 ([fe80::f8f7:ef02:6185:285c]) by BL0PR11MB3042.namprd11.prod.outlook.com
 ([fe80::f8f7:ef02:6185:285c%7]) with mapi id 15.20.5353.015; Wed, 15 Jun 2022
 16:56:30 +0000
From: "Dong, Eddie" <eddie.dong@intel.com>
To: Yajun Wu <yajunw@nvidia.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "mst@redhat.com" <mst@redhat.com>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>
CC: Parav Pandit <parav@nvidia.com>
Subject: RE: [PATCH] virtio/vhost-user: Fix wrong vhost notifier GPtrArray size
Thread-Topic: [PATCH] virtio/vhost-user: Fix wrong vhost notifier GPtrArray
 size
Thread-Index: AQHYgNja906rIhR/QUSHTINJ9hv9FQ==
Date: Wed, 15 Jun 2022 16:56:30 +0000
Message-ID: <BL0PR11MB3042DF9BBF6878B83DCAE3788AAD9@BL0PR11MB3042.namprd11.prod.outlook.com>
References: <20220526034851.683258-1-yajunw@nvidia.com>
In-Reply-To: <20220526034851.683258-1-yajunw@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.500.17
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6490081c-94e5-4b17-6210-08da4eeffe9e
x-ms-traffictypediagnostic: PH0PR11MB4775:EE_
x-microsoft-antispam-prvs: <PH0PR11MB47756E526D1FADF7D4300DF68AAD9@PH0PR11MB4775.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vjOrEiN4nYTy9q3wsMNu5qBSSU2uR3xRPmC1bPDFeWhIeySGyUyz/PDXQ7+Q3jnBRAE+wK4J1URf/rs4bwMG53vKlmgQAOj8WWlsumTS5qRuza71M0iPuuIJrfVq/jEgEBLN6YwhQG+6vPp83pdaZQM26PktMNzWSRziRHcrZ9rIeOquotRzuAEKBNr0OOktCnFfHqXZJ8DUDjBhgtK/+Uhc7NDo1A3R7tXiROGT4RIelsKaDx3aWScXH2gts3fOxbACIrnTWx7Qauk2dyMDOI2veF+pLi3HLqAEO0cjtIabVqqyOMktH6+OkVh7GoW4zDMVr7Xj2cRCqGkkD5GAjKa2NorNZO7ZO4IEBHQ8UEog2udDrbg5yqZ5RosovWDmRNb9fcjCWKxr1bqvyhUafQJQK7sk12fVB3vr7FcZeYWhArQ8fYOu0IVRmX1N4goI+7LkO16kJn1CKxNbebkcd+5b1Rq7zBgDp4aWbUJcFiNAoDIiZFxbjHdoBm2ud5nSIGUD/2g0Pzm99pz6X1jGFj8VWMr/5NcXlMyfCitIU7P4J+MSbyhdCh3Xgq/tNLULQxvoF+gpZAkQReWRi7qXtL0VpmJT+ef9lDlCZvhLygWI3XbOWyeIs2k9p67t0iFUBsl58iDHBq0SAoQOFvhd4yrqRRGtSvBvcK2BpKDwnKYx5AN8zgw5BDmtKIW1E0YvgzcXggVHVWHc1fQ1HRGL5w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR11MB3042.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(64756008)(66446008)(316002)(5660300002)(2906002)(66476007)(8676002)(52536014)(83380400001)(110136005)(33656002)(4326008)(66946007)(76116006)(66556008)(8936002)(55016003)(508600001)(71200400001)(38070700005)(9686003)(86362001)(26005)(53546011)(186003)(82960400001)(38100700002)(122000001)(7696005)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OHRRSHdvRG9FRFNOdi9sZEZWTno4eFdrMUlDV3pVY2h0d3cvcDF3aUxEWjg5?=
 =?utf-8?B?QXZpNmJFaFVtUWtUOUZRUy8yUllTNjBHTmJWVVFHTkpLd0tlL2V6dkxNZmpC?=
 =?utf-8?B?RjROSjh6ZzhuTDlTc0FCZ1F4QXBuWUJYbi82dHh2eEtpT2xxYVlYZ1E2MjZD?=
 =?utf-8?B?cFFQenlNUG1uTGJVeitzOExMWDFGUXBFK050SXd1bzJkOHRma1RNckI1WitT?=
 =?utf-8?B?YXAzT3VzOVVVcCtsQjl0WUhiRGp2V1NWZWZDZzlXVXd0SjgvaTFka3plQXh6?=
 =?utf-8?B?ejh2OTdNMGFUTFArQzFyNEphMEUvLzhEMlYwaFlHUXFvVkN4NG1VYXpQUEVE?=
 =?utf-8?B?YmgyNzFDd09TWWY0TmNEWUJFL2dnbXJyMGpMWmZ6VVJCMGFOeTRmcSthRTRG?=
 =?utf-8?B?bXM5Y2Erc3JkQWt5UjNOcURha0k5aUtGM3pKam9mTFhHSC9LSHEyTFdNV2Ur?=
 =?utf-8?B?Q2NMejZ6bVdCZTJVQUp1a2dhTmlhTkI4OG9kejNkL3JOaGZpbzkvRU9VanNZ?=
 =?utf-8?B?bkNVMkxqL0pWVzdtODdqUnFGTStuTm4xV0tOM3ZWMGJicmFKRWN1SWg5NFg1?=
 =?utf-8?B?OXM3L0plNG5qSDBUTUxlRXpEQUllM3NVZzJ6b01tMTdSZU9CUFdLb0p2TkNu?=
 =?utf-8?B?aHh4Kzk0akdGVkV5NnExZzNQZVBibGNvZHcvbHlJN1hGNzdkWFBJS0RoRWdq?=
 =?utf-8?B?OEw4Y0VhVHc0V1VMRm5EaHJzcmJHb05qRnZEL3AydE1WVU43L1IzdmlxOXlK?=
 =?utf-8?B?QUszcGRUR3h5c2J6MzFGS0E0ZzNyeDlPK0ZYREhNT2RmSVE1SmMwcUxYMngw?=
 =?utf-8?B?b1JUMjBGc2Zuc0RjNjVDajgxUEZkMFR0YUpqeC9tUng3MlZMRW5rSlEzTDRo?=
 =?utf-8?B?clUxamhKVW1zeEl0blFONElUL1BtVEtDbC9RY2ZwMGtoejdYUUlpZnU3ZUlM?=
 =?utf-8?B?ckwyMEtmOHFzT3J4RmZRWCtqWUxaYjRTbjRZTnhBODRLZFEyaUUyZElxRys0?=
 =?utf-8?B?VnVROGsxQ1BUT0JlUWxSQUxBZndOcWxhVEE2NFZtcEdwUUY1RVl0MTRxeWU5?=
 =?utf-8?B?TFczbkpHQVFEcE1UOURnT3YzVFErZ01LRXZ2c3ZkOG1lMTNHK0Z0YWNVSlgw?=
 =?utf-8?B?S3RKczV4NSt3MlZ5M29Lb2xvRWlpWnlWeFdDN3FYUGxTck1WQmlyVkRoSlp4?=
 =?utf-8?B?eWZXaGRYZjRNUU5KcWt2WkJrekprWkxGcDB6ZFZUZ3ZXYk9BODdLNlFTbThh?=
 =?utf-8?B?Wnc5Zm56NGI5bUYySHpGMi9IN0VsU3V6eEljT3JXQjdCVFNTYlJ3L3F0VUhs?=
 =?utf-8?B?RUpueUkwamNPYmQxZXV2WVBXSmdoSnBNVDM1a0crRnFaYTlaVzJhMEdhVzlU?=
 =?utf-8?B?WWdLVXdmYzNMWldpUUZqdnFFamFXbzFZbW8zTWhIQ2NFanRyN2U5UmY0b2hv?=
 =?utf-8?B?YjJuQnRGZm9mSlU2bkljRFJqTHBFV2lKTHRDdWJ6YVFFcCtiaFJkUjN0UGp6?=
 =?utf-8?B?SUc1MytRbENaRHR2M3lZSEl4S2hnZEZYM3JmS2RjTXdtRGxUQ01iR1BoOUtU?=
 =?utf-8?B?SDhYVGtnYW56YnJuQmZzR3hjUFo2d2tVM0F6YlRZNTYxOWV2ZVIxYzFXWFA5?=
 =?utf-8?B?dkR4dEhNMlBXSllnZWpLbWsyUUppWTYrOFFqYzRyUGJtN0o1bnhmMU9VeUQr?=
 =?utf-8?B?alI2UG1WRzFVWjBESFN3eXRtZm1WUXBkZGhYWUJScTJ2aFd1VU43VmVtYVBv?=
 =?utf-8?B?NEJmY2hXNnAwZ0FNR1YzODNlSHNQVXJsNlRmTEppdjZPOGlSZnVxRmZjaUhp?=
 =?utf-8?B?bFA5YnNzU0pDWG9tZjZ0eW1WMGlERndCdzU5NUFEQm1NNU94MEQ0cFR2aTB3?=
 =?utf-8?B?SFpGcVhRN1lmbGp3ZGVnU256SFhQcEpOR0svd1h5VnJweCtqL2ExOEwwVHV6?=
 =?utf-8?B?aUVFUGtKdUFKdSt4YWkvNUxoMmZvQy83djV1RjFVV0hpYmx1VkRaQ0grR0Js?=
 =?utf-8?B?ZWZmYi8reHZzbEE2U0tGcW02d2JXZzFzTEdjY1ZsUktZSE85WVFKdW1IQ1A1?=
 =?utf-8?B?LzBiM3A1ZWxoc29TckViN1o4YVl1SFNRNEU5M1FZcGNBb1hwcTR6VnpzVEpw?=
 =?utf-8?B?aUd4dDZxQWVhWWFFQjhrWUkvbjVmYUxwQ0lmbGlFQzcyR0Ftb0xybFlZZWtM?=
 =?utf-8?B?ckx1VHg1RHF5MlA1aW4rRXFRNU15SUlzMHozZHNzbVNTOVhPVDRCOW4yRnZE?=
 =?utf-8?B?ek9FSy93alkwaWg4dnoySVpEUFc1VGVwdFdlSXZLRHVObnlxa0RXTVdnWkVP?=
 =?utf-8?B?U1lrcUtGcHpYYWcrYW00NGVFMUxEK0lmZ1dYRHFENzEya2taM0xMZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3042.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6490081c-94e5-4b17-6210-08da4eeffe9e
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2022 16:56:30.1820 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5sF2Z/L4xWpYc3p1OZlGGbA3RpXL9HXHVziOJSfXz3xWpJGbZO6IXe+/m2RdrNrCBt0WS0wC/42GSfmIZNpr5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4775
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.43; envelope-from=eddie.dong@intel.com;
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

UmV2aWV3ZWQtYnk6IEVkZGllIERvbmcgPGVkZGllLmRvbmdAaW50ZWwuY29tPg0KDQo+IC0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFFlbXUtZGV2ZWwgPHFlbXUtZGV2ZWwtDQo+
IGJvdW5jZXMrZWRkaWUuZG9uZz1pbnRlbC5jb21Abm9uZ251Lm9yZz4gT24gQmVoYWxmIE9mIFlh
anVuIFd1DQo+IFNlbnQ6IFdlZG5lc2RheSwgTWF5IDI1LCAyMDIyIDg6NDkgUE0NCj4gVG86IHFl
bXUtZGV2ZWxAbm9uZ251Lm9yZzsgbXN0QHJlZGhhdC5jb207IGFsZXguYmVubmVlQGxpbmFyby5v
cmc7DQo+IHlhanVud0BudmlkaWEuY29tDQo+IENjOiBQYXJhdiBQYW5kaXQgPHBhcmF2QG52aWRp
YS5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSF0gdmlydGlvL3Zob3N0LXVzZXI6IEZpeCB3cm9uZyB2
aG9zdCBub3RpZmllciBHUHRyQXJyYXkgc2l6ZQ0KPiANCj4gSW4gZmV0Y2hfb3JfY3JlYXRlX25v
dGlmaWVyLCBpZHggYmVnaW5zIHdpdGggMC4gU28gdGhlIEdQdHJBcnJheSBzaXplIHNob3VsZA0K
PiBiZSBpZHggKyAxIGFuZCBnX3B0cl9hcnJheV9zZXRfc2l6ZSBzaG91bGQgYmUgY2FsbGVkIHdp
dGggaWR4ICsgMS4NCj4gDQo+IFRoaXMgd3JvbmcgR1B0ckFycmF5IHNpemUgY2F1c2VzIGZldGNo
X29yX2NyZWF0ZV9ub3RpZmllciByZXR1cm4gYW4gaW52YWxpZA0KPiBhZGRyZXNzLiBQYXNzaW5n
IHRoaXMgaW52YWxpZCBwb2ludGVyIHRvIHZob3N0X3VzZXJfaG9zdF9ub3RpZmllcl9yZW1vdmUN
Cj4gY2F1c2VzIGFzc2VydCBmYWlsOg0KPiANCj4gICAgIHFlbXUvaW5jbHVkZS9xZW11L2ludDEy
OC5oOjI3OiBpbnQxMjhfZ2V0NjQ6IEFzc2VydGlvbiBgciA9PSBhJyBmYWlsZWQuDQo+IAlzaHV0
dGluZyBkb3duLCByZWFzb249Y3Jhc2hlZA0KPiANCj4gQmFja2VuZHMgbGlrZSBkcGRrLXZkcGEg
d2hpY2ggc2VuZHMgb3V0IHZob3N0IG5vdGlmaWVyIHJlcXVlc3RzIGFsbW9zdA0KPiBhbHdheXMg
aGl0IHFlbXUgY3Jhc2guDQo+IA0KPiBGaXhlczogNTAzZTM1NTQ2NSAoInZpcnRpby92aG9zdC11
c2VyOiBkeW5hbWljYWxseSBhc3NpZ24NCj4gVmhvc3RVc2VySG9zdE5vdGlmaWVycyIpDQo+IFNp
Z25lZC1vZmYtYnk6IFlhanVuIFd1IDx5YWp1bndAbnZpZGlhLmNvbT4NCj4gQWNrZWQtYnk6IFBh
cmF2IFBhbmRpdCA8cGFyYXZAbnZpZGlhLmNvbT4NCj4gQ2hhbmdlLUlkOiBJODdlMGY3NTkxY2E5
YTU5ZDIxMDg3OWIyNjA3MDRhMmQ5ZTlkNmJjZA0KPiAtLS0NCj4gIGh3L3ZpcnRpby92aG9zdC11
c2VyLmMgfCAyICstDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9ody92aXJ0aW8vdmhvc3QtdXNlci5jIGIvaHcvdmly
dGlvL3Zob3N0LXVzZXIuYyBpbmRleA0KPiBiMDQwYzFhZDJiLi5kYmM2OTBkMTZjIDEwMDY0NA0K
PiAtLS0gYS9ody92aXJ0aW8vdmhvc3QtdXNlci5jDQo+ICsrKyBiL2h3L3ZpcnRpby92aG9zdC11
c2VyLmMNCj4gQEAgLTE1MjUsNyArMTUyNSw3IEBAIHN0YXRpYyBWaG9zdFVzZXJIb3N0Tm90aWZp
ZXINCj4gKmZldGNoX29yX2NyZWF0ZV9ub3RpZmllcihWaG9zdFVzZXJTdGF0ZSAqdSwgIHsNCj4g
ICAgICBWaG9zdFVzZXJIb3N0Tm90aWZpZXIgKm4gPSBOVUxMOw0KPiAgICAgIGlmIChpZHggPj0g
dS0+bm90aWZpZXJzLT5sZW4pIHsNCj4gLSAgICAgICAgZ19wdHJfYXJyYXlfc2V0X3NpemUodS0+
bm90aWZpZXJzLCBpZHgpOw0KPiArICAgICAgICBnX3B0cl9hcnJheV9zZXRfc2l6ZSh1LT5ub3Rp
ZmllcnMsIGlkeCArIDEpOw0KPiAgICAgIH0NCj4gDQo+ICAgICAgbiA9IGdfcHRyX2FycmF5X2lu
ZGV4KHUtPm5vdGlmaWVycywgaWR4KTsNCj4gLS0NCj4gMi4zNi4wDQo+IA0KDQo=

