Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6C84C2AC3
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 12:21:58 +0100 (CET)
Received: from localhost ([::1]:42888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNCC5-0000ky-35
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 06:21:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1nNCAE-0007xw-Cc
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 06:20:03 -0500
Received: from mga09.intel.com ([134.134.136.24]:46791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1nNCAA-0001q6-UZ
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 06:20:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645701598; x=1677237598;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=q9OuJ8rEN6N1gQQA8Je37iCxOPLrSbBR/XTeffnfn9U=;
 b=NaJ73mqNhLuMjJ+4rX/29z6v7H5QVGaY72pMGZEfdB7gInAD74pl0Gyr
 4f1wUHWSlKbHGS75j8zdp6MaUW0zAE/Y5ax6M+ybS8RsUZura2qD0Mc2+
 Sma34MwLTF1Q9SMRWNaNIWeBQQEw/L6KwrFvyOBaSGdxnDkb2PE/N7x9B
 +fbrm9qqhOA3rQuEmM/DKhQFmqBdBRhl3mvQg5duYvPb87Uk+VMk+Yycx
 wDnmYlR8iJIR/KwT4L6e1ri/cL9QFoYwMjykvuWyfX69Jc3B5jPXdWzcQ
 dekK2WlDI0z6ilW0OhNny0yXDveriPZy2Q2atNrJakH+RibNtBDIlh424 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10267"; a="251944991"
X-IronPort-AV: E=Sophos;i="5.88,393,1635231600"; d="scan'208";a="251944991"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 03:19:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,393,1635231600"; d="scan'208";a="777021155"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP; 24 Feb 2022 03:19:54 -0800
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Thu, 24 Feb 2022 03:19:54 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Thu, 24 Feb 2022 03:19:54 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 24 Feb 2022 03:19:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BVgk7WtDHLmQCY+8BJqP2CptgDSnvgHJLWl3RR/xqE28HOhVjTyxYUlfaZs+SS8YX9YlJ6FwTzTE6aggYOvRfokK+BWTG+zu9l1lE1HrPSPgvp6iRcsCpG29y74Gx/gwsoBNYUkIFk3NawnVWYZU1RZ2xu8rhEzJYVY7Q46L0kD8DzP04Myr4o4ydlk1j7VewKEjLy3JQF514czWjDOzANXiPXZkXCO+v8jISyREWXh/DOiv6n34JUw21PDBbb3pBazjDzFVYiXuA/LsRVvAo8PoX+JMRaQkaWZigxgU+2/LuNCrdWsHi0xcAa3i12zzn2ToyYptiCVO81WDUP6XZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q9OuJ8rEN6N1gQQA8Je37iCxOPLrSbBR/XTeffnfn9U=;
 b=AwV10BWl9OQi6howUpWO9z7TqK9ddx84NmxWMbaGlRIOAQZA9MktZ/X58SvKrGpm0+hnLJZLhYhhJHbNyN7JXD6tyzCe2nrERxBck3oDH72dN1tSif9UXaY/hb3f4CiXRMjZYurwBPpGBHWqS4wtZSzmcjJ7+GcbI2blF/cgvPkZwetnpCqC6OYLncS2Vw53ofGN/cMfNPCzx/s/JkIBOIS4heWjODmdkQul4/HwL80DZ5BlF0e7h3k4urWuvrZIzkNTKzSuMZmbimeZbQmv7bl2wT/KU8F8viGZJwqlZRD7oWME5LsmA07xSAjLtUqADyjkYQ864JTbhQ+IMDhh5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR1101MB2110.namprd11.prod.outlook.com
 (2603:10b6:301:4f::15) by BN6PR11MB4084.namprd11.prod.outlook.com
 (2603:10b6:405:7f::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Thu, 24 Feb
 2022 11:19:34 +0000
Received: from MWHPR1101MB2110.namprd11.prod.outlook.com
 ([fe80::d0fe:d86c:4200:3d6a]) by MWHPR1101MB2110.namprd11.prod.outlook.com
 ([fe80::d0fe:d86c:4200:3d6a%7]) with mapi id 15.20.4995.027; Thu, 24 Feb 2022
 11:19:34 +0000
From: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>
To: =?utf-8?B?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?= <berrange@redhat.com>, "Peter
 Krempa" <pkrempa@redhat.com>
Subject: RE: [PATCH] vl: transform QemuOpts device to JSON syntax device
Thread-Topic: [PATCH] vl: transform QemuOpts device to JSON syntax device
Thread-Index: AQHYKV1XmTCU9di3Nk2hu4XbrU5baqyiacGAgAABJYCAACDNUA==
Date: Thu, 24 Feb 2022 11:19:34 +0000
Message-ID: <MWHPR1101MB211058266ED0599A2EFAB7C7923D9@MWHPR1101MB2110.namprd11.prod.outlook.com>
References: <20220224060653.74229-1-zhenzhong.duan@intel.com>
 <YhdJik/u1TOUCXsU@redhat.com> <YhdLT7gtPNjYfB6C@angien.pipo.sk>
 <YhdMRTUvz6PpkIG2@redhat.com>
In-Reply-To: <YhdMRTUvz6PpkIG2@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.200.16
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6dda9708-1acf-49c1-bb81-08d9f787892f
x-ms-traffictypediagnostic: BN6PR11MB4084:EE_
x-microsoft-antispam-prvs: <BN6PR11MB40842B78F3F753CC29E88B95923D9@BN6PR11MB4084.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UJPVU2sH5dOvVIfF3udTXDD66MYWWJuNjBeir/ABuEpUX3erv1tv1XopqiggNWx7t0Y7QgwKzpH9AgiqANY8yoeaV+rGzDj9eMZsNmFEns4K9/auWldTbQbRz26TiETcgQB7RZM09W5ED4bQldf2RepNhDxCSQXlbcW6jcERFEQqI7hNvgOg8IjfQ1K9xs6uRm149iddx9Hj2NNWiubFDcL5GzcLX/cKuJOQa4z6DyBssMvGRvUYtB7jwbCqK9+eUwmQ2eUkfuL4pB2fJSkRDlp/6cO861jBBTtNgb1YER7udPyiiEDPGQhCBC7tpOZ8CgkLm7IPy3aOwuRs+tzDkdujQLUaplqLdFQOpEdm5uVw3B1PLvz59foW1noCjKnZWKQzqNO/23+IiQ57aiLNYzThf8HPaPon+8NVENz6VAC4Yw0mQOCRnyZUoG+q7w5KBlJqyi3/CEZE0xXAHQD+17OTplb863l41nU31JUwM58JKSHjBEgK6fBL0eTflTd3nYZkIMGCfOFpMKE7kC9Hyn7dVcWdMbNRNaVgVxjjzRgw+bN8WlsHzaAPRIt8JRx7lUja0QxVXqbGpbVRFJf39+E8pOqTvO8FsH+lrlVi3ivJx9sh1kyrvS/6YowOSE5lIuXAOk1v6KpuEHmYaj0WNHkzCiejrbDYpJb2vv2iixh2LH7gFX7VQ8X5NTd2tmK/J0W6jKaQ25OZ7hX1tMQVScv0gUY7F960w15HkipxJlJASHPKvlCQ/RQXpjgtWTSR0GL3TVYAKUlT4gkH9Iznbos2aQejluaTlixnMqfVGV4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2110.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(83380400001)(7696005)(122000001)(26005)(5660300002)(33656002)(38100700002)(71200400001)(6506007)(53546011)(9686003)(52536014)(186003)(86362001)(4326008)(55016003)(66946007)(76116006)(38070700005)(2906002)(316002)(8936002)(966005)(82960400001)(66476007)(66556008)(66446008)(508600001)(110136005)(54906003)(64756008)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SXZ1NHBVQk16dzRtQTZDNEZWajBSakJjRmYyWkdJeWZnc0Jtci9BdnJocllH?=
 =?utf-8?B?L3FGN0lsbEtYMk9MQlJHOVpjT2w1MVFzTXQ3Ni9tMkpCUWhLNFBEUS9NNitx?=
 =?utf-8?B?SXVlN1A5QUEyZDBKWXZQYlFWVVg5Z0tqWjVuRjk1OTI5SkhBNDUxaXhKM0NU?=
 =?utf-8?B?Q0N0ZkxCSlArOEVHQWp2elZUT2wyWXRBSm5OQWN6OUdocm0vcVlQQjMxM3lT?=
 =?utf-8?B?azI1Qm1QRm5NMEdZY3JjUkI5QytsZjJMcU8yZ0E4TkZ5WXhiNFlzWTJ2VzJu?=
 =?utf-8?B?RUlLenpIbkM4N3Nja0ZqenFxV3VnK0RrMzJ1djVWb1ZyZkFESWU2Ym9vUG4v?=
 =?utf-8?B?Q1RmWGVuWm5pWkNHSGExamRDOTMvNTROZU1nYVpCWUFMaXRSR1hOVURkVGky?=
 =?utf-8?B?eDdtNnAvY0FzKzhEV3FlODNKYnV2cVdYRWZwOWc1OXpuVkFYNmJOZWJjRTJj?=
 =?utf-8?B?MFZaL3N0aytGQnJrN0ZRaDVua1JZdWEzUlYxSWVEUHBBNUJqSFVPaS9TYytt?=
 =?utf-8?B?dTZIdWZTRTBFRHJPQW8rWHVhcVhTVDR3MTFnUTcva1RDYzZib1BKcWk3dzRO?=
 =?utf-8?B?cEY1YVQzQWFQdjRsd20vZXJmQWk5Q0RpLzhueGVwaHd4VDZ2YTdVYnZmcWE3?=
 =?utf-8?B?TnlpczBVcDdnc1JOTUljV0hGM0RSTktHeE5nNlNTajNhMHpTb0N2VGE2dUhz?=
 =?utf-8?B?UnQyOUVkY0Uza0plVFRoT21xUm9SZjRBeWNiS3FwVVVmWmNxVE14cXJCRzFa?=
 =?utf-8?B?ZU1PMWJFUDJ1NE9JRWNkd09RK3ZFaUo4d2NSZFgvNWlTQ1NjbVQwcGdieTdy?=
 =?utf-8?B?YnZzUnJUczFrMTNXVzdPT0RRaVVyVmhIaEpKTklCUi9oSlJzZTBUdHl0N0U5?=
 =?utf-8?B?SnpuWnZJalRLUWEweVl6Qko3NEVobFJZZmtXY0h0TnlNV1YvYy9oaTJwM3ZN?=
 =?utf-8?B?WktWbCtndE5KM2ozaUpvSEhLcWc4eUFoZllwaFZ1T1lrRFBMcVlqYnVZUzIx?=
 =?utf-8?B?bkFjYURKdFcyR1RHVHhtbnlZZENCRUpkTDVTVDJCbHlIV0ZqRC9uMTV6c1Fw?=
 =?utf-8?B?TkRXVWZRWFBMQy9zZldxZEVKRlRWeTJPbjBJTWdFc1EzdUZ4L1VDRUt2UHMw?=
 =?utf-8?B?cnlWMTAxSzIrYVhDUWxVa1JrcFZIQjZiVDBjc244K3FOTEV1Y3ZoTzZleWY2?=
 =?utf-8?B?bm9nZzZHbjZpQzhqT29iN1J0Qi91S2ZESjFNQ1UyQnVpeGw2bUJqS0pZbldk?=
 =?utf-8?B?VTJCUUVMQ0lIMkZBSEtvdHRiTitLb3hKSTY4dVlwMGt3V3hna2dZM2szSkVn?=
 =?utf-8?B?QmQxeThMQ3JIemp5ZFlvejVTd0dzNmxiV1pmejBxZEdSSmEvdVZ5THdmYXlK?=
 =?utf-8?B?Uk8zRndDUEFid2EyQ3p4K1NQdkFIbGFTdS9RRkczZlRZM2xGTVVkcG82MGgx?=
 =?utf-8?B?RmRoQnFMN2FuM1RlWGM3aC94TzVsZ1ZWR0lUMXo2dktORGVmV2lTWjRybFF0?=
 =?utf-8?B?ZHlQU3AzeDlyK3pqUHU5SzJLaWhUdHFTNnAvZHd6ZURUWkh6QlpBajA0ekEr?=
 =?utf-8?B?VUR1QkxIbnF0YWtLUkJiaEtURGxUVnd2eXZaczVzVDhuTWdOdmdiVm5YTUJm?=
 =?utf-8?B?Y3M3NUI0eTlhdERES1JtRUdlMXNuNS85YzFNdElSNy9xK3cyM0ZmV1lwMCt1?=
 =?utf-8?B?SUg4UnY1WUw5QmMyaGEyaElSMTZGejVzZzVOUGI3eTBxcGtja2VMa1BXdFpJ?=
 =?utf-8?B?QTFaNlQxb2lDcTkrWnNtZU9reWE2Mis0RWZsWlNBMTFKU3Z4QTRhODUyOEpH?=
 =?utf-8?B?Z2NsTjlFZXIreXFQQVZnckJNbVJMajZBVU5oYVNIM1FHUkkwYmllTjl0MHpr?=
 =?utf-8?B?QXUrdTZBblRUWnh0N2tOZndDa0s4K2tkdS9oYXJMKy9JUnJaWTA0L3p4eWs3?=
 =?utf-8?B?aGFhVUdVWDNXTlVNdk5uYnJncU4zdjRIYUZOVFRob0RRU3NQWlZyUko3bHlO?=
 =?utf-8?B?Nmx1WURzcTQxUEJNaElEaGpYRmtlaWs1RllnRnpqTVppVnJsakNtajh5SHox?=
 =?utf-8?B?OERLUldFcVpudnBGTzU2aEtSQkFLcHdMVlNCeU9pL1pFdmp3WEczYTB2WDVQ?=
 =?utf-8?B?M2RNU0JrU09UR2lQaFFDZkhPZ2QzdDluZks4WFNHdmFEVTNZWkxUYU9pOXZ6?=
 =?utf-8?B?Vmprb2lRRXM1c0VtNjJQUjBOQU1PS0ltekVUWkhveWtMSHcyV0lKSnhPNlN6?=
 =?utf-8?B?SUZZM05NczFrZjlVeDREK25wUFh3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2110.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dda9708-1acf-49c1-bb81-08d9f787892f
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2022 11:19:34.3419 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5MZgsLIrLlNquvTHbHv2h0V0oHTqW+hM0vS0dctUi5NzhXOV54oYghd5+F/CXN9ez3z/A62c+6GttSIIc4S9OE2YA0BhItpgIWpD8AK2Cvo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4084
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.24;
 envelope-from=zhenzhong.duan@intel.com; helo=mga09.intel.com
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
Cc: "kwolf@redhat.com" <kwolf@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
 "eblake@redhat.com" <eblake@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "lersek@redhat.com" <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IERhbmllbCBQLiBCZXJyYW5n
w6kgPGJlcnJhbmdlQHJlZGhhdC5jb20+DQo+U2VudDogVGh1cnNkYXksIEZlYnJ1YXJ5IDI0LCAy
MDIyIDU6MTQgUE0NCj5UbzogUGV0ZXIgS3JlbXBhIDxwa3JlbXBhQHJlZGhhdC5jb20+DQo+Q2M6
IER1YW4sIFpoZW56aG9uZyA8emhlbnpob25nLmR1YW5AaW50ZWwuY29tPjsgcWVtdS0NCj5kZXZl
bEBub25nbnUub3JnOyBrd29sZkByZWRoYXQuY29tOyBtc3RAcmVkaGF0LmNvbTsNCj5sZXJzZWtA
cmVkaGF0LmNvbTsgcGJvbnppbmlAcmVkaGF0LmNvbTsgZWJsYWtlQHJlZGhhdC5jb20NCj5TdWJq
ZWN0OiBSZTogW1BBVENIXSB2bDogdHJhbnNmb3JtIFFlbXVPcHRzIGRldmljZSB0byBKU09OIHN5
bnRheCBkZXZpY2UNCj4NCj5PbiBUaHUsIEZlYiAyNCwgMjAyMiBhdCAxMDowOTozNUFNICswMTAw
LCBQZXRlciBLcmVtcGEgd3JvdGU6DQo+PiBPbiBUaHUsIEZlYiAyNCwgMjAyMiBhdCAwOTowMjow
MiArMDAwMCwgRGFuaWVsIFAuIEJlcnJhbmfDqSB3cm90ZToNCj4+ID4gT24gVGh1LCBGZWIgMjQs
IDIwMjIgYXQgMDI6MDY6NTNQTSArMDgwMCwgWmhlbnpob25nIER1YW4gd3JvdGU6DQo+PiA+ID4g
V2hpbGUgdGhlcmUgYXJlIG1peGVkIHVzZSBvZiB0cmFkaXRpb25hbCAtZGV2aWNlIG9wdGlvbiBh
bmQgSlNPTg0KPj4gPiA+IHN5bnRheCBvcHRpb24sIFFFTVUgcmVwb3J0cyBjb25mbGljdCwgZS54
Og0KPj4gPiA+DQo+PiA+ID4gL3Vzci9saWJleGVjL3FlbXUta3ZtIC1ub2RlZmF1bHRzIFwNCj4+
ID4gPiAgIC1kZXZpY2UgJ3siZHJpdmVyIjoidmlydGlvLXNjc2ktDQo+cGNpIiwiaWQiOiJzY3Np
MCIsImJ1cyI6InBjaS4wIiwiYWRkciI6IjB4MDIuMCJ9JyBcDQo+PiA+ID4gICAtZGV2aWNlIHZp
cnRpby1zY3NpLXBjaSxpZD1zY3NpMSxidXM9cGNpLjANCj4+ID4NCj4+ID4gV2h5IGFyZSB5b3Ug
YXR0ZW1wdGluZyB0byBtaXggSlNPTiBhbmQgbm9uLUpTT04gc3ludGF4IGF0IHRoZSBzYW1lDQo+
PiA+IHRpbWUgPyBUaGUgZXhwZWN0YXRpb24gaXMgdGhhdCBhbnkgbWdtdCBhcHAgYWRvcHRpbmcg
SlNPTiBzeW50YXgNCj4+ID4gd2lsbCBkbyBzbyB1bml2ZXJzYWxseSBhbmQgbm90IG1peCBvbGQg
YW5kIG5ldyBzeW50YXguIFNvIGluDQo+PiA+IHByYWN0aWNlIHRoZSBzY2VuYXJpbyBhYm92ZSBp
cyBub3Qgb25lIHRoYXQgUUVNVSBldmVyIGludGVuZGVkIHRvDQo+PiA+IGhhdmUgdXNlZCBieSBh
cHBzLg0KPj4NCj4+IEJhc2VkIG9uIHRoZSBwcmV2aW91cyBwb3N0IHRoZXkgYXJlIHVzaW5nIHNv
bWUgJ3FlbXU6Y29tbWFuZGxpbmUnDQo+PiBvdmVycmlkZXMgd2l0aCB0aGUgbGVnYWN5IHN5bnRh
eCB3aXRoIG5ldyBsaWJ2aXJ0IHdoaWNoIHVzZXMgSlNPTg0KPj4gc3ludGF4Og0KPj4NCj4+IDxx
ZW11OmNvbW1hbmRsaW5lPg0KPj4gICA8cWVtdTphcmcgdmFsdWU9Jy1uZXRkZXYnLz4NCj4+ICAg
ICA8cWVtdTphcmcgdmFsdWU9J3VzZXIsaWQ9bXluZXQwLGhvc3Rmd2Q9dGNwOjo0NDQ4My06MjIn
Lz4NCj4+ICAgICA8cWVtdTphcmcgdmFsdWU9Jy1kZXZpY2UnLz4NCj4+ICAgPHFlbXU6YXJnDQo+
PiB2YWx1ZT0ndmlydGlvLW5ldC1wY2ksbmV0ZGV2PW15bmV0MCxtYWM9MDA6MTY6M0U6Njg6MDA6
MTAscm9tZmlsZT0nLz4NCj4+IDwvcWVtdTpjb21tYW5kbGluZT4NCj4+DQo+PiBJIHN1Z2dlc3Rl
ZCB0aGF0IHRoZXkgc2hvdWxkIGFkZCB0aGUgcmVxdWlyZWQgZnVuY3Rpb25hbGl0eSB0byBsaWJ2
aXJ0DQo+PiBpbnN0ZWFkIG9mIHRyeWluZyB0byBoYWNrIHFlbXU6DQo+Pg0KPj4gaHR0cHM6Ly9s
aXN0cy5nbnUub3JnL2FyY2hpdmUvaHRtbC9xZW11LWRldmVsLzIwMjItMDIvbXNnMDUwNjguaHRt
bA0KPg0KPk9yIHRoZSBvdGhlciBhbnN3ZXIgaXMgdG8gc3dpdGNoIHRvIHVzZSBKU09OIHN5bnRh
eCBpbiB0aGUgYWJvdmUgY29tbWFuZA0KPmxpbmUgcGFzc3Rocm91Z2ggY29uZmlnLg0KPg0KPk9y
IHRvIHNwZWNpZnkgdGhlIFBDSSBhZGRyZXNzIHNvIGl0IGRvZXNuJ3QgY2xhc2ggd2l0aCBvdGhl
ciBkZXZpY2VzIGFscmVhZHkNCj5wcmVzZW50Lg0KDQpUaGFua3MgRGFuaWVsIGFuZCBQZXRlciBm
b3IgY29tbWVudHMuDQpDbGVhciBvbiBteSBzaWRlLiBJJ2xsIHN5bmNocm9uaXplIHlvdXIgc3Vn
Z2VzdGlvbnMgdG8gbXkgY29sbGVhZ3VlLg0KDQpSZWdhcmRzDQpaaGVuemhvbmcNCg==

