Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A156351E36F
	for <lists+qemu-devel@lfdr.de>; Sat,  7 May 2022 04:06:02 +0200 (CEST)
Received: from localhost ([::1]:32768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nn9pW-0000V7-KW
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 22:05:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1nn9nx-0007AJ-L3
 for qemu-devel@nongnu.org; Fri, 06 May 2022 22:04:21 -0400
Received: from mga17.intel.com ([192.55.52.151]:35408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1nn9ns-0007R6-Qy
 for qemu-devel@nongnu.org; Fri, 06 May 2022 22:04:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651889056; x=1683425056;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HWiHtSKkznRzgoG6Q8MlCv/LUgp9S8121VOZjAM1Amk=;
 b=dl/zgO9Wkge523GV3oLvC0Tfi+3r5eao1ZLQleBJim9Hw8D13V0lk2fK
 S7PJiRWH4EgIfJpX3svv/5xw7ylTSE+zo+P/zegAap1Kbn5JDw0soUpLu
 zwJAHLDD+fuJ9HGFxNv12xVvVX6/tJYx6fq5/Q5vOpyHNq/+gD3fwvVYI
 B4/3FrhSxsGTnXMY+yWF575FJB87Vy5nFBV2bCgWxBtOFcPP7UHCuMZ+3
 cI9ChrT9YtUlI/247qsTUe6V0rJi6GZ1KKG7cN0SvuH+HxyHvTijOwcCg
 IWOmAnbDLXwDuBt68nzQibH1XxA+4trpmCYC8JTJLaxRDb183mebIgR7k g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10339"; a="249165690"
X-IronPort-AV: E=Sophos;i="5.91,205,1647327600"; d="scan'208";a="249165690"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 19:03:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,205,1647327600"; d="scan'208";a="600811799"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP; 06 May 2022 19:03:50 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 6 May 2022 19:03:50 -0700
Received: from orsmsx606.amr.corp.intel.com (10.22.229.19) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 6 May 2022 19:03:49 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 6 May 2022 19:03:49 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 6 May 2022 19:03:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jXdjQA1O86tJdtUoafDOSG5QqLr7XaIlzRKqiJzwtDU0Ojj5p1b/OhimyyPBjBOAq5t2H97Xi6BwpEAxoImcGH1ozqw1dOKMxiCKEiM9cJGYz77hBd1Y01PuAoLNFQSCEIBTPGqi7T6R5fXjvq2W7nGhk1DtaEQoQoMte5HdfjoYoYJkIbNvktJrecuyh81cSv3G6472fcvyTAiUJUvZyidCP/D01UkMYGJj+PpBC/NCD9egGy1LbC2MIJnV6rxU2sIGJC/3UsXK50b7hQjDX3kmFGT1UQ+VWkIVEtla7PktJTgK4g4/NYVZuHKaeCArx9je9XqRDwcpaEsLSlSHug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HWiHtSKkznRzgoG6Q8MlCv/LUgp9S8121VOZjAM1Amk=;
 b=CM1fmB5wWtTSD263CbQwzwSb34tMhSBoRPr+/XmN6W1+R/VRopqFE3mRgCD4wfmfV0QuE2xl9ZL4m6+aX0eambx8zpbD05KEO76UCMotJeKHHdKfKvtTgr6q57Pc7QWbs+xBPT1f570xco1ZWN2tV+5hZHL6sG+wgrWG+vaaS5gIA0xMvAddbQ+ayH0VQqSZN+zJWp0VbykzZbnD3zACwqcrZsztviPoOGqvcw6Euy1x2lagMYbrbhX+AQnfuw+Hu/ZD9jDgRPsPfRDfWIIFXsrGAsuCfgIF2QoWBTSRAPyi7RN+V4H7aR8JN5HhXJG/YqjX+OY+UvNBrigy3TfW7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by PH7PR11MB5766.namprd11.prod.outlook.com (2603:10b6:510:130::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.20; Sat, 7 May
 2022 02:03:48 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::84ea:da3f:8546:f002]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::84ea:da3f:8546:f002%7]) with mapi id 15.20.5186.028; Sat, 7 May 2022
 02:03:47 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
CC: Li Zhijian <lizhijian@cn.fujitsu.com>, qemu-dev <qemu-devel@nongnu.org>,
 Like Xu <like.xu@linux.intel.com>
Subject: RE: [PATCH V2 1/4] softmmu/runstate.c: add RunStateTransition support
 form COLO to PRELAUNCH
Thread-Topic: [PATCH V2 1/4] softmmu/runstate.c: add RunStateTransition
 support form COLO to PRELAUNCH
Thread-Index: AQHYRXzmizOHXYyq0ES2uHvbpCCqMa0DnnYAgAAE1MCADz4a4A==
Date: Sat, 7 May 2022 02:03:47 +0000
Message-ID: <MWHPR11MB00318C5C371743AD30AB9CE69BC49@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20220401034702.687057-1-chen.zhang@intel.com>
 <20220401034702.687057-2-chen.zhang@intel.com>
 <CACGkMEs7FeRCr4E9E68gS+GBTgdebeD=f0dYnPivyZ2G1mWmvw@mail.gmail.com>
 <MWHPR11MB0031EE757A9C70E8F506BC899BFA9@MWHPR11MB0031.namprd11.prod.outlook.com>
In-Reply-To: <MWHPR11MB0031EE757A9C70E8F506BC899BFA9@MWHPR11MB0031.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.401.20
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 68fd3e71-8ca6-4998-b3e9-08da2fcdd2af
x-ms-traffictypediagnostic: PH7PR11MB5766:EE_
x-microsoft-antispam-prvs: <PH7PR11MB57667D8E6DF2D6521D84270C9BC49@PH7PR11MB5766.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0UgrWXdpZNuZrF6uDaellLhyPqFuLMbqvE9h9ZE5RkVO3j1CJ2QwFBAdqyTJMguH19XfYvLcZxWsA4sj8RsdD85rxCQWoVRWjTMgs3qMWLODK+V915bg20f0x3+0DvRNkVWOVqsrCJlrt5k7PnoxQGf+f15rlaB6+tapWKC52zHg0PGU3VfYZMmnveKdTRQs1QbKHCgZHUR+ePTSr6ETkaYkRC/Bv0aXEvp9FDTYtGyAljyPTXgqkKp4GMF6Zny42unby9opBPZBPH8IvE0JHwb/DcHhUwX4PgdZ5qH3dJh0Da9eE3AlKnuW9NnrCkTXb0iHnfK0ZZdupq6VgKEIvZ346kUGaAKmcJASDHgj60pjwMq0JZJhtAi+glOlglyY/ne8dzFITM+DaFtge+eK7u7EQSW+NdsqCu99kOjSxltliqYtSMbQg71S31e0+WK0TB1aZnQEajZD/AExXVdrXuYYLp6+djkjUvWiSVupV8aIFK8KSGBrNPSZ4zaqyYgTX9dCViAoZTjswk7FfpI9W+PIzF63VfAomXpmDfrM8jv9E7IX60FV6uEYx4P6qEM84V3Rn6xeoqlRlQGT5HTUlGRJl0KfcIhvBafmm1Ctyk1UVtYQLAEdq0QXZpAydOHERsQlu8kPNlbC3Uw1/i32+DxG9ZpJBHIOLWEywBMo1Xm+Yqe+S3TEL/Zt3+768HgoVK9O0zDG/OldJ0euy0Wt4w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(52536014)(55016003)(71200400001)(83380400001)(38100700002)(38070700005)(508600001)(76116006)(66946007)(66556008)(6506007)(110136005)(33656002)(54906003)(8676002)(8936002)(4326008)(7696005)(86362001)(316002)(186003)(64756008)(66446008)(82960400001)(66476007)(2906002)(122000001)(5660300002)(26005)(9686003)(53546011);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NURHbkJQSDk0RFR5dzZpbUxISy9WaWUwaDlXeSs2ZzJ4S1EvVkJ0cjhRc0Iw?=
 =?utf-8?B?YjV1WDJQcWFSTXJWYnY4cFVvTGQxT0ZvcGxSQnI4eFREY1J3ZFZXM3pCMUU0?=
 =?utf-8?B?a2hiaE9ncW9oSzlydkxWWmV0cnhmYW5veXlRWXdtODRtdmxMUkNWS1FDWVBn?=
 =?utf-8?B?S3Ixdk14WDF0S20zTXliNGptWml4WFFIWk5JRGpUQ2JESS9mZVNsNittYTZ5?=
 =?utf-8?B?TWRseVRyUmNjU2gvMXY5eVBNb0dUUE0xLzVwaHhKbCtrMm5MdWdnam5oRVN2?=
 =?utf-8?B?UUdFcU5LN0RNY3c1NmlFZzdDUlVURGh4WTBVNUFCS3RrVkxvaXQ3cUJ6Z25s?=
 =?utf-8?B?WjJmdGNUQnlHd2lya0JFRUhPRHkra1BQZHdzTXlab3RHSmYzM2dnZFlrOWdt?=
 =?utf-8?B?NTJ0Wjl6eFdrdnNGamhSeUFvK0tiMHZaTFhSYUhNREV3TXUzZ2I0N2FIeHRP?=
 =?utf-8?B?MXF5TjRzNTFwNCtYa1lHVHhCYytRQ3AvY3hia3o5WWwxUmNBQkdhaWZYazFJ?=
 =?utf-8?B?cFNXTC9qRTFvOTFsc29WQVRBYWFrdDRLRzZEaUlaWHNTcHlUdUZNWXlhQ3Rs?=
 =?utf-8?B?WkJEYjEzMXp5VHZyc2Q1eE5wY3doUlJxbCsvNlVmbUVPV1VXWnVWU3lJYWFI?=
 =?utf-8?B?ZzlzRnJEYmdZWG5yaUFaNjNVaHlCa3NwZjFuSU9TUEdoRDNVaFFOMkN5dTNu?=
 =?utf-8?B?VUVXeHNzSCtYQndNdlRsS1MxbDFKQ1V0Syt3K3RlRUhHSGs0NmVMMkZNSWg1?=
 =?utf-8?B?VmZ1c094WjB6Zld2Qld5clR0SHJaMXY3TVZranI5a21laTZvZVlGRHRJMUs0?=
 =?utf-8?B?UnI3U3VjbERTM2pmbWVJMGdxMUdMN011WHkxQzQ2UUJWOVZmR0Z3aUF4bGRx?=
 =?utf-8?B?UTkwTzhCZFZSOE5hZ3plSUhxY0YzYmxNb2VwOFhMT3RkUHgxd3FuVDk0L2ZJ?=
 =?utf-8?B?YmtSNTAyNHFLdlRUL1EzSHc1V01yOGxKZ0ZYUmhUTkNzOEZoSHlSQTd2MEts?=
 =?utf-8?B?SFlBeExKcXR6c2NJMTBJUHJEaUlvWEhIOVB0dnduVVdMbjNjMWdUeHV2b0NB?=
 =?utf-8?B?Qk1YOXo5eHZ3bjRKWWNya3V1a2RiOHN5SlkrQU52L3VFRDVRbE9tckFUYmhF?=
 =?utf-8?B?L25LS3ZveFJNM3lTQWV0VGdqcWR5YWozUmNVRmkxSXU5aUdjTERnTDk2UVFW?=
 =?utf-8?B?Skk3WkNabDN4ZmJyQzFjeGk2SmlGZHZWYkYwVXRyNi9abWFYc2pvQ1hQTE1m?=
 =?utf-8?B?VlhYdFNZUVJYRDd5WUdhMWtxam5ka2szaVp3eTlBUVF3Yng0TnZWaXNXTHdD?=
 =?utf-8?B?a3VsaVRQWFpydlJOQmg4Q1ZKVngzQXNJZStsUm85N3hzRHcxcVVxd21vZjZ0?=
 =?utf-8?B?dFVuVkpTYWRGcUZIeU90Q1lNUmFZOW9YSnNBVllzd0QxR2g0T2p2ZDlicmwv?=
 =?utf-8?B?TmsvWGQ4YytZT1A3MkI1ZWVuUUhoK0w3VkxIdnhPWUtqSHc0Y2R0SnVpaTVw?=
 =?utf-8?B?THRLcU16bkRxcnVpRmMxbTNBTHVZRW1hYm03djk3NEZNRWNTZXBYUzh6RDlu?=
 =?utf-8?B?b2Y4ZGE1M3ZRZG1IMTVvVmhLSmQyaHFOaUxYeitCdlZHQm5ONFZ0MWNxdnUy?=
 =?utf-8?B?Q1BKN1lpeWRkUFgrVC9tTFk1SCtFTzZhZnBJY3hSRnRrYi90MGhOZ3ppRzA5?=
 =?utf-8?B?Um9Fc0V4ZnVFMjVSUlpBb1BocGNoRUkrQlZXYzlhakFYckZ3b244NEZZTnNW?=
 =?utf-8?B?WDlhZW5tNXFqMmkzLzV4NHQzOTN1NWx3M1RoV1RIUE5yV251WnFIa0sxcmM4?=
 =?utf-8?B?UU5CUCtCanJ6Z2FodDBwV0dSVWRyTkhBQ1BWSDcwRUhPVnJJVE00NzlSWXFt?=
 =?utf-8?B?ZUVyVnE1UG5ZeHFvZ2VlQXdsNDhzMmd2UGZ5QnJvWVhGS2dzZVAxYkZWbTAr?=
 =?utf-8?B?b01Ya1lUYXpPMmhvWWczK3c1NE90Q2YxV1pzZ3EzS1F0TFRpZWYzT3FWc1Fk?=
 =?utf-8?B?c3dMVUVDOTlsenVLVE81OWZZakxOOTdWeENwb0hhTkl4bStPMXBMV21Nc0Ur?=
 =?utf-8?B?SUJvLzZBWWxZYzhJUkVpMkZRS3p2Ujh2cDVsdHZQQy9IUE5pdVh0U1ZVaDNv?=
 =?utf-8?B?SkpMZUlLN0J2ZVNLN1VrZWhEbFNhUHhzQy9zU1JFN05JZ1ZUWWF2VW5wdEx0?=
 =?utf-8?B?WHFIRlV6c0FWendJZ2xPTm5SMS9nWjBrc3V6Mis3TFBaZ2VSK0lvNlJERlFZ?=
 =?utf-8?B?eEY0OUZ6TlQzZVF4dDlCRjRkR0ZlVjlTSW82bVFCQmNza3hhOXV1S3R0MTJQ?=
 =?utf-8?B?c2pZOGIzTmVzNVNlbjZRdmQ1WTRBYUZUb25DcWY3K2Y5dkhOTkVoUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68fd3e71-8ca6-4998-b3e9-08da2fcdd2af
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2022 02:03:47.5721 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8tpaNoLCzhS+Mw08MxHjvVhnSBqxqS3VlTD4uRRy6hWNbgpcZmxCbXfGuDUl/1Exb9PmExHzci/+/byaXtpiDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5766
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.151; envelope-from=chen.zhang@intel.com;
 helo=mga17.intel.com
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogWmhhbmcsIENoZW4NCj4g
U2VudDogV2VkbmVzZGF5LCBBcHJpbCAyNywgMjAyMiA1OjI2IFBNDQo+IFRvOiBKYXNvbiBXYW5n
IDxqYXNvd2FuZ0ByZWRoYXQuY29tPjsgUGFvbG8gQm9uemluaQ0KPiA8cGJvbnppbmlAcmVkaGF0
LmNvbT4NCj4gQ2M6IExpIFpoaWppYW4gPGxpemhpamlhbkBjbi5mdWppdHN1LmNvbT47IHFlbXUt
ZGV2IDxxZW11LQ0KPiBkZXZlbEBub25nbnUub3JnPjsgTGlrZSBYdSA8bGlrZS54dUBsaW51eC5p
bnRlbC5jb20+DQo+IFN1YmplY3Q6IFJFOiBbUEFUQ0ggVjIgMS80XSBzb2Z0bW11L3J1bnN0YXRl
LmM6IGFkZCBSdW5TdGF0ZVRyYW5zaXRpb24NCj4gc3VwcG9ydCBmb3JtIENPTE8gdG8gUFJFTEFV
TkNIDQo+IA0KPiANCj4gDQo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiBGcm9t
OiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPg0KPiA+IFNlbnQ6IFdlZG5lc2RheSwg
QXByaWwgMjcsIDIwMjIgNDo1NyBQTQ0KPiA+IFRvOiBaaGFuZywgQ2hlbiA8Y2hlbi56aGFuZ0Bp
bnRlbC5jb20+DQo+ID4gQ2M6IExpIFpoaWppYW4gPGxpemhpamlhbkBjbi5mdWppdHN1LmNvbT47
IHFlbXUtZGV2IDxxZW11LQ0KPiA+IGRldmVsQG5vbmdudS5vcmc+OyBMaWtlIFh1IDxsaWtlLnh1
QGxpbnV4LmludGVsLmNvbT4NCj4gPiBTdWJqZWN0OiBSZTogW1BBVENIIFYyIDEvNF0gc29mdG1t
dS9ydW5zdGF0ZS5jOiBhZGQgUnVuU3RhdGVUcmFuc2l0aW9uDQo+ID4gc3VwcG9ydCBmb3JtIENP
TE8gdG8gUFJFTEFVTkNIDQo+ID4NCj4gPiBPbiBGcmksIEFwciAxLCAyMDIyIGF0IDExOjU5IEFN
IFpoYW5nIENoZW4gPGNoZW4uemhhbmdAaW50ZWwuY29tPiB3cm90ZToNCj4gPiA+DQo+ID4gPiBJ
ZiB0aGUgY2hlY2twb2ludCBvY2N1cnMgd2hlbiB0aGUgZ3Vlc3QgZmluaXNoZXMgcmVzdGFydGlu
ZyBidXQgaGFzDQo+ID4gPiBub3Qgc3RhcnRlZCBydW5uaW5nLCB0aGUgcnVuc3RhdGVfc2V0KCkg
bWF5IHJlamVjdCB0aGUgdHJhbnNpdGlvbg0KPiA+ID4gZnJvbSBDT0xPIHRvIFBSRUxBVU5DSCB3
aXRoIHRoZSBjcmFzaCBsb2c6DQo+ID4gPg0KPiA+ID4geyJ0aW1lc3RhbXAiOiB7InNlY29uZHMi
OiAxNTkzNDg0NTkxLCAibWljcm9zZWNvbmRzIjogMjY2MDV9LFwNCj4gPiA+ICJldmVudCI6ICJS
RVNFVCIsICJkYXRhIjogeyJndWVzdCI6IHRydWUsICJyZWFzb24iOiAiZ3Vlc3QtcmVzZXQifX0N
Cj4gPiA+IHFlbXUtc3lzdGVtLXg4Nl82NDogaW52YWxpZCBydW5zdGF0ZSB0cmFuc2l0aW9uOiAn
Y29sbycgLT4gJ3ByZWxhdW5jaCcNCj4gPiA+DQo+ID4gPiBMb25nLXRlcm0gdGVzdGluZyBzYXlz
IHRoYXQgaXQncyBwcmV0dHkgc2FmZS4NCj4gPiA+DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBMaWtl
IFh1IDxsaWtlLnh1QGxpbnV4LmludGVsLmNvbT4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6IFpoYW5n
IENoZW4gPGNoZW4uemhhbmdAaW50ZWwuY29tPg0KPiA+DQo+ID4gSSdkIGV4cGVjdCB0aGlzIHRv
IGdldCBhY2sgZnJvbSB0aGUgcmVsZXZhbnQgbWFpbnRhaW5lcnMuDQo+ID4NCj4gDQo+IFRoZSBz
Y3JpcHRzL2dldF9tYWludGFpbmVyLnBsIGNhbid0IGZpbmQgcmVsZXZhbnQgbWFpbnRhaW5lcnMg
Zm9yIHRoaXMgcGF0Y2guDQo+IE1heWJlIFBhb2xvIGhhdmUgdGltZSB0byBjb3ZlciB0aGlzIHNp
bXBsZSBwYXRjaCByZWxhdGVkIHRvIHJ1bnN0YXRlPw0KDQpObyBuZXdzIGZvciBhIHdoaWxlLCBh
bnkgY29tbWVudHMgZm9yIHVubWFpbnRhaW5lZCBmaWxlcyBjaGFuZ2VzID8NClBpbmcuLi4NCg0K
VGhhbmtzDQpDaGVuDQoNCj4gDQo+IFRoYW5rcw0KPiBDaGVuDQo+IA0KPiA+IFRoYW5rcw0KPiA+
DQo+ID4gPiAtLS0NCj4gPiA+ICBzb2Z0bW11L3J1bnN0YXRlLmMgfCAxICsNCj4gPiA+ICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4gPiA+DQo+ID4gPiBkaWZmIC0tZ2l0IGEvc29m
dG1tdS9ydW5zdGF0ZS5jIGIvc29mdG1tdS9ydW5zdGF0ZS5jIGluZGV4DQo+ID4gPiBlMGQ4Njli
MjFhLi5jMDIxYzU2MzM4IDEwMDY0NA0KPiA+ID4gLS0tIGEvc29mdG1tdS9ydW5zdGF0ZS5jDQo+
ID4gPiArKysgYi9zb2Z0bW11L3J1bnN0YXRlLmMNCj4gPiA+IEBAIC0xMjcsNiArMTI3LDcgQEAg
c3RhdGljIGNvbnN0IFJ1blN0YXRlVHJhbnNpdGlvbg0KPiA+IHJ1bnN0YXRlX3RyYW5zaXRpb25z
X2RlZltdID0gew0KPiA+ID4gICAgICB7IFJVTl9TVEFURV9SRVNUT1JFX1ZNLCBSVU5fU1RBVEVf
UFJFTEFVTkNIIH0sDQo+ID4gPg0KPiA+ID4gICAgICB7IFJVTl9TVEFURV9DT0xPLCBSVU5fU1RB
VEVfUlVOTklORyB9LA0KPiA+ID4gKyAgICB7IFJVTl9TVEFURV9DT0xPLCBSVU5fU1RBVEVfUFJF
TEFVTkNIIH0sDQo+ID4gPiAgICAgIHsgUlVOX1NUQVRFX0NPTE8sIFJVTl9TVEFURV9TSFVURE9X
Tn0sDQo+ID4gPg0KPiA+ID4gICAgICB7IFJVTl9TVEFURV9SVU5OSU5HLCBSVU5fU1RBVEVfREVC
VUcgfSwNCj4gPiA+IC0tDQo+ID4gPiAyLjI1LjENCj4gPiA+DQoNCg==

