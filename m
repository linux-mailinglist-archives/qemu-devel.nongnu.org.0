Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E71BD50FBA4
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 13:01:26 +0200 (CEST)
Received: from localhost ([::1]:38506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njIwg-00015Z-11
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 07:01:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin.tian@intel.com>)
 id 1njId6-0005eh-6f
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 06:41:16 -0400
Received: from mga02.intel.com ([134.134.136.20]:46240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin.tian@intel.com>)
 id 1njId3-0000h7-4U
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 06:41:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650969669; x=1682505669;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cQUGms4drkRm9z9+PPZ8fVi5lulublOgsmc8xKumHiM=;
 b=iiqyE791Lg1e3k5MbOVOkeKD9RSTmpsijwjBfhSGkeCL1JpMrLdY9W9x
 ZAhsgzEPYyMzyU3pL//TO+SygKYEKEmdiSObEVvBB6bYD2zKoQ/b8P0K7
 EKu7XIk5woAgws3shFILDAoJpQBtcxPw636h0GIGjgKWAEP4ygcAh8tyv
 xWwlT9kWrO6kQls39z6UI8oSay/8Lk2Zptd18ZllvZzvMu9nYuedqZPOZ
 cEFVknWq5cSURMqpSjXfZPSXYNtvo6/AN9zCQxvtWH5zk9oqwJmmQEIrc
 4dM3mxXV4R5kfU0DFMoWh2wyzKfSxiw2XCCQod2N2O+zkAQhDSv9HOFpg A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10328"; a="252911030"
X-IronPort-AV: E=Sophos;i="5.90,290,1643702400"; d="scan'208";a="252911030"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 03:41:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,290,1643702400"; d="scan'208";a="807464805"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga006.fm.intel.com with ESMTP; 26 Apr 2022 03:41:05 -0700
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 26 Apr 2022 03:41:05 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 26 Apr 2022 03:41:05 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 26 Apr 2022 03:41:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eV5eKfKLs6bSI8oRsLxRWpittStQGmVcUjuZSvIgB7ZEq+QpALCgeAicLQjWK1rYwJGDRYyRSG2pXLxny7bXZk4Tw5/Hywbd7YitrFpsDSibhUc1fkmtKUOorSQqpaS0ybVFdNQjPOpfBmYZ7XcnMplBYbY+sKAxYZgqISvPVmTpBsTACO0GTAnSd8w1vKJHPqfzfeRzx/ambXFprwhmxrQORSfb2fTHuW2l1c6W6IH0fM24uWEAeQveMI2YEunPolsTeF9lXdvTMc9dn9cKYxRxdkN1fo/jKO4KxLGbnqHleWroNXmLVq6x/hXT0oTkkcPy/HFl17s2XKHJoUOr/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cQUGms4drkRm9z9+PPZ8fVi5lulublOgsmc8xKumHiM=;
 b=cz1asY0SXxaxvDKw+WHYG5tg0kosn/HpAhNfSkUQH/fPebsd8syWBVwEvs0Lx1IWd9Sjf8Sji1MAXfSwaatdXmZstdKUsiq+hSAPj5JUroGmvf6nC/XaGeaAFItUGDeI4QYnbqYtT4Ukjt8NlcBUGruNj/x/LXi/GE0UaGEtRyY/0ogcXXrbxiHDqiYZIxT/Yj6T5NJzAB3I5pAuwRDhFxF0gffXdxe5jAb0Bn/DG/544l63dsEvjk6TdM3bCBE7wpjpcvCiDKzUGtjPlsa3H1/sAnzIkHwcN5LTT8/GCqXn2BKZ8wSJnVFopYITIAeVETL7GxUzupscrNantjIrAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by LV2PR11MB5997.namprd11.prod.outlook.com (2603:10b6:408:17f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Tue, 26 Apr
 2022 10:41:01 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::24dd:37c2:3778:1adb]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::24dd:37c2:3778:1adb%2]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 10:41:01 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Liu, Yi L" <yi.l.liu@intel.com>, Jason Gunthorpe <jgg@nvidia.com>
Subject: RE: [RFC 15/18] vfio/iommufd: Implement iommufd backend
Thread-Topic: [RFC 15/18] vfio/iommufd: Implement iommufd backend
Thread-Index: AQHYT+0I7hcz8abDXkW457D8FQTw3az8Eu+AgAX0vICAAAfWoA==
Date: Tue, 26 Apr 2022 10:41:01 +0000
Message-ID: <BN9PR11MB5276AD0B0DAA59A44ED705618CFB9@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220414104710.28534-1-yi.l.liu@intel.com>
 <20220414104710.28534-16-yi.l.liu@intel.com>
 <20220422145815.GK2120790@nvidia.com>
 <3576770b-e4c2-cf11-da0c-821c55ab9902@intel.com>
In-Reply-To: <3576770b-e4c2-cf11-da0c-821c55ab9902@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e8591f4e-89e8-4b5b-21c1-08da277141ab
x-ms-traffictypediagnostic: LV2PR11MB5997:EE_
x-microsoft-antispam-prvs: <LV2PR11MB59971F3243976B0ABE673FCE8CFB9@LV2PR11MB5997.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7VjbrTrMshciF5PoXNC4B23CndRBjPSTcZdNUWcg46Sr55T504zHqo942qqCrCkq5KoDNPTldmT7oC9Am+n1OgG+O4pj/vXCYOyM/qIulWAFScByE+5FSgkoipggmsBpOlX0POglB0ly0QpG97lyH08jZBacmCdOi31MxmMboG/Kxhb7iPR6YP5a+U6Kgvsfm0JqfGllhALNONZYaV2QLYCLCoF7zf+FWg/ojMd/roEtHTsAVVmVWYwVDULuiecF+UMEISpoxU10FyOlq5pg8I7s+1TgBZ7sEgrfG58mBrOF02HhLb5tK9q2cxJbao4eMvxk6A45yf00MQIt+MVROw83kFOt65e4vwys3dezGYGhzL6RRWWc/Uq6ZHoL+NO1wL7bXXl0/cgqGF9YlurT6riBtbNMsz7gSxGYdQ2qtanoN0wZLfDaAlAaBeRfMdeNhmphpnhd1JvThYE6QgIwi2yfqFGwxiwzs4XXIL67SzEFldNvFRTlo28cBiiVnSBMXWL9ydfAOCcnJGpxNIBpp9J/xjEbMju08gz9yM0igPWRuWFFxKrO9xZdRBEcHH4H88qDxEUF5Qsr2urBR9EaMb2rO99N5EETZ1tInKReHz8MOb735WaVuX7uFmHjswxtHxDoA8ZmVVHznnHrEaLuJQHs07ChZbDb/4B+dUvAF8GU2ByEpdJjBV18Zq6uFvp8lM/OyYGg7Z8szAYZjrqpNw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6506007)(66556008)(66946007)(76116006)(66446008)(8676002)(64756008)(5660300002)(7416002)(4326008)(86362001)(66476007)(508600001)(2906002)(7696005)(53546011)(8936002)(52536014)(186003)(26005)(83380400001)(33656002)(316002)(71200400001)(110136005)(54906003)(55016003)(82960400001)(38100700002)(122000001)(38070700005)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a05Va3hlczhzQVBoSUo0Y20zcUR0T3FzVEhkODY0L3pVMnZoeFVNRnJkaHpX?=
 =?utf-8?B?YTdmMW16a1BVdnVmbnc3dnpEM2tURkdaMlNWTXdTWGdmRGRmMi9sWGNvcFZJ?=
 =?utf-8?B?WmZkZ3RlM0UySzFrczFBaUZLZFRJSWxPZXAzMDlPdzc5TklUdFlRTW9KSHpa?=
 =?utf-8?B?OVVjOEJZV214R3RFd0JnNHhJKzhJcitZaVFZVWI0bjNmaWhpYzFKLzlWUG9y?=
 =?utf-8?B?YnRjcTZsM0swMDJUalA2K0FTWTZYWjV2YnZwWXR2ejA0Rlo1WlFYcFgrbWM0?=
 =?utf-8?B?ajhXbk1ERmgvYmlNeFNKVGF3VnVqSFhCWDcrVzJYYnkxYzlFYnhlQm1tZnB3?=
 =?utf-8?B?ZFVhU0dHWW5KM1hHQUFzNUNUTVQrUVRxNDljc2pFMFZCMDd3ZlcyZ3dwNDJk?=
 =?utf-8?B?ZENqR3dOZlE4SlRnUit0d25HcDUvcU1qTERFT2Zhb3l1Z2EzV0JXQjRJZ01a?=
 =?utf-8?B?ZzRSV1RMdHVFZGhaOU1KRjdkSkprSVNnbVc1a3BDUWpQMHRuS1JWOHVqV3ZF?=
 =?utf-8?B?RTlYYjByV2pZMkJ5S3FpcjJrR0sxSzFjanIwVTBnRkVOYlhTeWo4Wi92NVE4?=
 =?utf-8?B?alArUExBTXo4M2E0dFpaa29LVldrcXdlYVJDK1VZQzR5ZTl4ZDNoUkxHUnYr?=
 =?utf-8?B?a1ZQMEhwV01rVUJVZjFTYUtiT1ZEQUpPZGV6Q1hqZktScE5pNVdScElQZE1q?=
 =?utf-8?B?M3c3MHR3NTQwakJxSzZLMkVwaDF0cHNjNkVWdzNMNkNZdFphRzBoRGpsZzhY?=
 =?utf-8?B?NW9FWlUvbC9WRVl2TDUrclZCU1hxWHhpWVJuNVFGYzBPaHkrdzRIMmwxY3Vq?=
 =?utf-8?B?VUZ3eDBVbEhRVjE3WWQ4d2xHS2RzSHMyM1lXOFcxL3NPREpiQlVZSEhRTkdH?=
 =?utf-8?B?WFpnOFFRV2RUR0dZazdKVWlmZE50d1J4cEJ5cmtVM245VjM3ZjgxekQ2Ri90?=
 =?utf-8?B?aTEzcGF2YjRBMlJkc2V5UDRZYXpsVEVkaS96MUttTGMzV3o1SExqK1hKR1pV?=
 =?utf-8?B?M0xCNlBRVnRIeVI2UTl4bk1RUEJ4cUZJT3NGWEc5WnBiUVcwZVlsSW05Z2xm?=
 =?utf-8?B?UWNBRDQ3VkJhTGg2bkpKMWVjVUlaVWUrMzNWTG5oNXlKL2ZZSkNFU1NSL2pO?=
 =?utf-8?B?ZWRWYUFNUlh1SmVvMFROZnVxSWw3aDRvakdYQmFCeSt4OGxiS04wNDZCVHBY?=
 =?utf-8?B?ZlNDS3Fwd3dRSmt1bXdOUFR6bkk3K2tyQXoxUjZ4cWI3Y2EyZ1ZqMlFSWmdv?=
 =?utf-8?B?dURjNmlqMVhFSHJSSXdsN3ZhZWtNR2U5YTRuMXc1bjdyUE41UFlhYUpacG9v?=
 =?utf-8?B?NEVkZ0xCVEVsTzdkZWphNVN5RFVkWU04MGJhc2VoSlBQb1JadE44eVNZU1Ev?=
 =?utf-8?B?aExVT0RiUWFxUDl2eW1ZVEM4ZHVvanZLRm9UYzJUY2ZDSGN2c0xqZjl4SmR3?=
 =?utf-8?B?ck42aXVUc3pPOWV5N3RtQ2VCQ3lTVFhsalpqamxyd3pOeHE2dDlHYmxaT1Fk?=
 =?utf-8?B?TFNha3B0M0Z3WnRhVG1oMmRjYzlDS3lOWE1ZZGNUeXFwcHdJMDQ4ZjNmajYr?=
 =?utf-8?B?Y0huRm9qSVgyZkVUSGFkNlc1OHlJMlZYaUhiZ2tSZi9mU05yclp5YmdBWFhm?=
 =?utf-8?B?TWtSNHhNNWN1ZzVhMVBVRUxmQWoyV0pYakRCTVdsa2FMTVBOVXpBYnhsRjBN?=
 =?utf-8?B?MS9iOXJyWjgrUktVU1RVampQZ2ZtbTRJNEs0MmJETkhiRVlsOHI2R3I2QnNw?=
 =?utf-8?B?U2V6VlZXdVVaUW1zNDQ2a3VWK2RIeW1tVlBLajRJcFB1U1ZOWTQ5dXJraFha?=
 =?utf-8?B?UnNiSC95UkFnbUNnRXZOaXZ0eG9reEdZM1pkVGhBQlNBdUpIblYxa29hOXBJ?=
 =?utf-8?B?MFBmaGFGYkN4TUpVSWZRbU9DSW10OEpNbmVvTGpjZzR3MkdiaVZyVFlSWFll?=
 =?utf-8?B?NVRKNkRiSDFtU2NibmQrdUxybWhZZ055MlJpYUp2cEZjT1JVcCt6RElIanJn?=
 =?utf-8?B?R3BzRERzZDNTN1ZxcEYxZ1l3M0Fod2s5TGhIVXBBb0pNWVozMTRtWDgyeU83?=
 =?utf-8?B?ZGo2cFRQS3RHUzJncjZHRUUwVzVmcEEydnlZaDRoYkxubnYrK0lydDcrZFZo?=
 =?utf-8?B?UWtBYnU4QkFibU14UWFGNmZIeDRWenlFM0YvOWJodmpLVWZOREpwWFl3V2Y2?=
 =?utf-8?B?WmNDMzRBMDZ1bjBRWXdRcElxaVRSaHpXcWVnUHNiNFBieFNWRC9jaVNKSXZY?=
 =?utf-8?B?K0JDa1ViUkVJMlF5OHM1RzRDKzQ4dFZyQ3d2ZlNvQUVkU24vZDdHWnFrV29X?=
 =?utf-8?B?ZnN6Rkh5RUp3QU5WSUpTc1ByTk5lV3ZZSWFXWGRKck02OThXM0lzZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8591f4e-89e8-4b5b-21c1-08da277141ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2022 10:41:01.2399 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /VmWi065cNMYS3qngL/xS7WzJciiXw9ceBliI1vlOKDy9NzO8O2RLfmRgvD2dpGL0JCM/sxxGL70SneWdl+AWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB5997
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.20; envelope-from=kevin.tian@intel.com;
 helo=mga02.intel.com
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
Cc: "akrowiak@linux.ibm.com" <akrowiak@linux.ibm.com>,
 "jjherne@linux.ibm.com" <jjherne@linux.ibm.com>,
 "thuth@redhat.com" <thuth@redhat.com>, "Peng, Chao P" <chao.p.peng@intel.com>,
 "Alex
 Williamson \(alex.williamson@redhat.com\)" <alex.williamson@redhat.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 "farman@linux.ibm.com" <farman@linux.ibm.com>,
 "peterx@redhat.com" <peterx@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>, "Sun, Yi
 Y" <yi.y.sun@intel.com>, "nicolinc@nvidia.com" <nicolinc@nvidia.com>,
 "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
 "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PiBGcm9tOiBMaXUsIFlpIEwgPHlpLmwubGl1QGludGVsLmNvbT4NCj4gU2VudDogVHVlc2RheSwg
QXByaWwgMjYsIDIwMjIgNTo1NSBQTQ0KPiBPbiAyMDIyLzQvMjIgMjI6NTgsIEphc29uIEd1bnRo
b3JwZSB3cm90ZToNCj4gPiBPbiBUaHUsIEFwciAxNCwgMjAyMiBhdCAwMzo0NzowN0FNIC0wNzAw
LCBZaSBMaXUgd3JvdGU6DQo+ID4NCj4gPj4gKw0KPiA+PiArICAgIC8qIHRyeSB0byBhdHRhY2gg
dG8gYW4gZXhpc3RpbmcgY29udGFpbmVyIGluIHRoaXMgc3BhY2UgKi8NCj4gPj4gKyAgICBRTElT
VF9GT1JFQUNIKGJjb250YWluZXIsICZzcGFjZS0+Y29udGFpbmVycywgbmV4dCkgew0KPiA+PiAr
ICAgICAgICBpZiAoIW9iamVjdF9keW5hbWljX2Nhc3QoT0JKRUNUKGJjb250YWluZXIpLA0KPiA+
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgVFlQRV9WRklPX0lPTU1VRkRfQ09O
VEFJTkVSKSkgew0KPiA+PiArICAgICAgICAgICAgY29udGludWU7DQo+ID4+ICsgICAgICAgIH0N
Cj4gPj4gKyAgICAgICAgY29udGFpbmVyID0gY29udGFpbmVyX29mKGJjb250YWluZXIsIFZGSU9J
T01NVUZEQ29udGFpbmVyLCBvYmopOw0KPiA+PiArICAgICAgICBpZiAodmZpb19kZXZpY2VfYXR0
YWNoX2NvbnRhaW5lcih2YmFzZWRldiwgY29udGFpbmVyLCAmZXJyKSkgew0KPiA+PiArICAgICAg
ICAgICAgY29uc3QgY2hhciAqbXNnID0gZXJyb3JfZ2V0X3ByZXR0eShlcnIpOw0KPiA+PiArDQo+
ID4+ICsgICAgICAgICAgICB0cmFjZV92ZmlvX2lvbW11ZmRfZmFpbF9hdHRhY2hfZXhpc3Rpbmdf
Y29udGFpbmVyKG1zZyk7DQo+ID4+ICsgICAgICAgICAgICBlcnJvcl9mcmVlKGVycik7DQo+ID4+
ICsgICAgICAgICAgICBlcnIgPSBOVUxMOw0KPiA+PiArICAgICAgICB9IGVsc2Ugew0KPiA+PiAr
ICAgICAgICAgICAgcmV0ID0gdmZpb19yYW1fYmxvY2tfZGlzY2FyZF9kaXNhYmxlKHRydWUpOw0K
PiA+PiArICAgICAgICAgICAgaWYgKHJldCkgew0KPiA+PiArICAgICAgICAgICAgICAgIHZmaW9f
ZGV2aWNlX2RldGFjaF9jb250YWluZXIodmJhc2VkZXYsIGNvbnRhaW5lciwgJmVycik7DQo+ID4+
ICsgICAgICAgICAgICAgICAgZXJyb3JfcHJvcGFnYXRlKGVycnAsIGVycik7DQo+ID4+ICsgICAg
ICAgICAgICAgICAgdmZpb19wdXRfYWRkcmVzc19zcGFjZShzcGFjZSk7DQo+ID4+ICsgICAgICAg
ICAgICAgICAgY2xvc2UodmJhc2VkZXYtPmZkKTsNCj4gPj4gKyAgICAgICAgICAgICAgICBlcnJv
cl9wcmVwZW5kKGVycnAsDQo+ID4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiQ2Fu
bm90IHNldCBkaXNjYXJkaW5nIG9mIFJBTSBicm9rZW4gKCVkKSIsIHJldCk7DQo+ID4+ICsgICAg
ICAgICAgICAgICAgcmV0dXJuIHJldDsNCj4gPj4gKyAgICAgICAgICAgIH0NCj4gPj4gKyAgICAg
ICAgICAgIGdvdG8gb3V0Ow0KPiA+PiArICAgICAgICB9DQo+ID4+ICsgICAgfQ0KPiA+DQo+ID4g
Pz8gdGhpcyBsb2dpYyBzaG91bGRuJ3QgYmUgbmVjZXNzYXJ5LCBhIHNpbmdsZSBpb2FzIGFsd2F5
cyBzdXBwb3J0cw0KPiA+IGFsbCBkZXZpY2VzLCB1c2Vyc3BhY2Ugc2hvdWxkIG5ldmVyIG5lZWQg
dG8ganVnZ2xlIG11bHRpcGxlIGlvYXMncw0KPiA+IHVubGVzcyBpdCB3YW50cyB0byBoYXZlIGRp
ZmZlcmVudCBhZGRyZXNzIG1hcHMuDQo+IA0KPiBsZWdhY3kgdmZpbyBjb250YWluZXIgbmVlZHMg
dG8gYWxsb2NhdGUgbXVsdGlwbGUgY29udGFpbmVycyBpbiBzb21lIGNhc2VzLg0KPiBTYXkgYSBk
ZXZpY2UgaXMgYXR0YWNoZWQgdG8gYSBjb250YWluZXIgYW5kIHNvbWUgaW92YSB3ZXJlIG1hcHBl
ZCBvbiB0aGlzDQo+IGNvbnRhaW5lci4gV2hlbiB0cnlpbmcgdG8gYXR0YWNoIGFub3RoZXIgZGV2
aWNlIHRvIHRoaXMgY29udGFpbmVyLCBpdCB3aWxsDQo+IGJlIGZhaWxlZCBpbiBjYXNlIG9mIGNv
bmZsaWN0cyBiZXR3ZWVuIHRoZSBtYXBwZWQgRE1BIG1hcHBpbmdzIGFuZCB0aGUNCj4gcmVzZXJ2
ZWQgaW92YXMgb2YgdGhlIGFub3RoZXIgZGV2aWNlLiBGb3Igc3VjaCBjYXNlLCBsZWdhY3kgdmZp
byBjaG9vc2VzIHRvDQo+IGNyZWF0ZSBhIG5ldyBjb250YWluZXIgYW5kIGF0dGFjaCB0aGUgZ3Jv
dXAgdG8gdGhpcyBuZXcgY29udGFpbmVyLiBIb3RscGx1Zw0KPiBpcyBhIHR5cGljYWwgY2FzZSBv
ZiBzdWNoIHNjZW5hcmlvLg0KPiANCg0KQWxleCBwcm92aWRlZCBhIGNsZWFyIHJhdGlvbmFsZSB3
aGVuIHdlIGNoYXR0ZWQgd2l0aCBoaW0gb24gdGhlDQpzYW1lIHRvcGljLiBJIHNpbXBseSBjb3Bp
ZWQgaXQgaGVyZSBpbnN0ZWFkIG9mIHRyeWluZyB0byBmdXJ0aGVyDQp0cmFuc2xhdGU6IChBbGV4
LCBwbGVhc2UgY2hpbWUgaW4gaWYgeW91IHdhbnQgdG8gYWRkIG1vcmUgd29yZHMuIPCfmIopDQoN
ClE6DQpXaHkgZXhpc3RpbmcgVkZJT0FkZHJlc3NTcGFjZSBoYXMgYSBWRklPQ29udGFpbmVyIGxp
c3Q/IGlzIGl0IGJlY2F1c2UNCm9uZSBkZXZpY2Ugd2l0aCB0eXBlMSBhbmQgYW5vdGhlciB3aXRo
IG5vX2lvbW11Pw0KDQpBOg0KVGhhdCdzIG9uZSBjYXNlIG9mIGluY29tcGF0aWJpbGl0eSwgYnV0
IHRoZSBJT01NVSBhdHRhY2ggZ3JvdXAgY2FsbGJhY2sNCmNhbiBmYWlsIGluIGEgdmFyaWV0eSBv
ZiB3YXlzLiAgT25lIHRoYXQgd2UndmUgc2VlbiB0aGF0IGlzIG5vdA0KdW5jb21tb24gaXMgdGhh
dCB3ZSBtaWdodCBoYXZlIGFuIG1kZXYgY29udGFpbmVyIHdpdGggdmFyaW91cyAgbWFwcGluZ3Mg
IA0KdG8gb3RoZXIgZGV2aWNlcy4gIE5vbmUgb2YgdGhvc2UgbWFwcGluZ3MgYXJlIHZhbGlkYXRl
ZCB1bnRpbCB0aGUgbWRldg0KZHJpdmVyIHRyaWVzIHRvIHBpbiBzb21ldGhpbmcsIHdoZXJlIGl0
J3MgZ2VuZXJhbGx5IHVubGlrZWx5IHRoYXQNCnRoZXknZCBwaW4gdGhvc2UgcGFydGljdWxhciBt
YXBwaW5ncy4gIFRoZW4gUUVNVSBob3QtYWRkcyBhIHJlZ3VsYXINCklPTU1VIGJhY2tlZCBkZXZp
Y2UsIHdlIGFsbG9jYXRlIGEgZG9tYWluIGZvciB0aGUgZGV2aWNlIGFuZCByZXBsYXkgdGhlDQpt
YXBwaW5ncyBmcm9tIHRoZSBjb250YWluZXIsIGJ1dCBub3cgdGhleSBnZXQgdmFsaWRhdGVkIGFu
ZCBwb3RlbnRpYWxseQ0KZmFpbC4gIFRoZSBrZXJuZWwgcmV0dXJucyBhIGZhaWx1cmUgZm9yIHRo
ZSBTRVRfSU9NTVUgaW9jdGwsIFFFTVUNCmNyZWF0ZXMgYSBuZXcgY29udGFpbmVyIGFuZCBmaWxs
cyBpdCBmcm9tIHRoZSBzYW1lIEFkZHJlc3NTcGFjZSwgd2hlcmUNCm5vdyBRRU1VIGNhbiBkZXRl
cm1pbmUgd2hpY2ggbWFwcGluZ3MgY2FuIGJlIHNhZmVseSBza2lwcGVkLiAgDQoNClE6DQpJIGRp
ZG4ndCBnZXQgd2h5IHNvbWUgbWFwcGluZ3MgYXJlIHZhbGlkIGZvciBvbmUgZGV2aWNlIHdoaWxl
IGNhbg0KYmUgc2tpcHBlZCBmb3IgYW5vdGhlciBkZXZpY2UgdW5kZXIgdGhlIHNhbWUgYWRkcmVz
cyBzcGFjZS4gQ2FuIHlvdQ0KZWxhYm9yYXRlIGEgYml0PyBJZiB0aGUgc2tpcHBlZCBtYXBwaW5n
cyBhcmUgcmVkdW5kYW50IGFuZCB3b24ndA0KYmUgdXNlZCBmb3IgZG1hIHdoeSBkb2VzIHVzZXJz
cGFjZSByZXF1ZXN0IGl0IGluIHRoZSBmaXJzdCBwbGFjZT8gSSdtDQphIGJpdCBsb3N0IGhlcmUu
Li4NCg0KQTogDQpRRU1VIHNldHMgdXAgYSBNZW1vcnlMaXN0ZW5lciBmb3IgdGhlIGRldmljZSBB
ZGRyZXNzU3BhY2UgYW5kIGF0dGVtcHRzDQp0byBtYXAgYW55dGhpbmcgdGhhdCB0cmlnZ2VycyB0
aGF0IGxpc3RlbmVyLCB3aGljaCBpbmNsdWRlcyBub3Qgb25seSBWTQ0KUkFNIHdoaWNoIGlzIG91
ciBwcmltYXJ5IG1hcHBpbmcgZ29hbCwgYnV0IGFsc28gbWlzY2VsbGFuZW91cyBkZXZpY2VzLA0K
dW5hbGlnbmVkIHJlZ2lvbnMsIGFuZCBvdGhlciBkZXZpY2UgcmVnaW9ucywgZXguIEJBUnMuICBT
b21lIG9mIHRoZXNlDQp3ZSBmaWx0ZXIgb3V0IGluIFFFTVUgd2l0aCBicm9hZCBnZW5lcmFsaXph
dGlvbnMgdGhhdCB1bmFsaWduZWQgcmFuZ2VzDQphcmVuJ3QgYW55dGhpbmcgd2UgY2FuIGRlYWwg
d2l0aCwgYnV0IG90aGVyIGRldmljZSByZWdpb25zIGNvdmVycw0KYW55dGhpbmcgdGhhdCdzIG1t
YXAnZCBpbiBRRU1VLCBpZS4gaXQgaGFzIGFuIGFzc29jaWF0ZWQgS1ZNIG1lbW9yeQ0Kc2xvdC4g
IElJUkMsIGluIHRoZSBjYXNlIEknbSB0aGlua2luZyBvZiwgdGhlIG1hcHBpbmcgdGhhdCB0cmln
Z2VyZWQNCnRoZSByZXBsYXkgZmFpbHVyZSB3YXMgdGhlIEJBUiBmb3IgYW4gbWRldiBkZXZpY2Uu
ICBObyBhdHRlbXB0IHdhcyBtYWRlDQp0byB1c2UgZ3VwIG9yIFBGTk1BUCB0byByZXNvbHZlIHRo
ZSBtYXBwaW5nIHdoZW4gb25seSB0aGUgbWRldiBkZXZpY2UNCndhcyBwcmVzZW50IGFuZCB0aGUg
bWRldiBob3N0IGRyaXZlciBkaWRuJ3QgYXR0ZW1wdCB0byBwaW4gcGFnZXMgd2l0aGluDQppdHMg
b3duIEJBUiwgYnV0IG5laXRoZXIgb2YgdGhlc2UgbWV0aG9kcyB3b3JrZWQgZm9yIHRoZSByZXBs
YXkgKEkNCmRvbid0IHJlY2FsbCBmdXJ0aGVyIHNwZWNpZmljcykuIA0KDQpRRU1VIGFsd2F5cyBh
dHRlbXB0cyB0byBjcmVhdGUgcDJwIG1hcHBpbmdzIGZvciBkZXZpY2VzLCBidXQgdGhpcyBpcyBh
DQpjYXNlIHdoZXJlIHdlIGRvbid0IGhhbHQgdGhlIFZNIGlmIHN1Y2ggYSBtYXBwaW5nIGNhbm5v
dCBiZSBjcmVhdGVkLCBzbw0KYSBuZXcgY29udGFpbmVyIHdvdWxkIHJlcGxheSB0aGUgQWRkcmVz
c1NwYWNlLCBzZWUgdGhlIGZhdWx0LCBhbmQgc2tpcA0KdGhlIHJlZ2lvbi4NCg0KUToNCklmIHRo
ZXJlIGlzIGNvbmZsaWN0IGJldHdlZW4gcmVzZXJ2ZWQgcmVnaW9ucyBvZiBhIG5ld2x5LXBsdWdn
ZWQgZGV2aWNlDQphbmQgZXhpc3RpbmcgbWFwcGluZ3Mgb2YgVkZJT0FkZHJlc3NTcGFjZSwgdGhl
IGRldmljZSBzaG91bGQgc2ltcGx5DQpiZSByZWplY3RlZCBmcm9tIGF0dGFjaGluZyB0byB0aGUg
YWRkcmVzcyBzcGFjZSBpbnN0ZWFkIG9mIGNyZWF0aW5nIA0KYW5vdGhlciBjb250YWluZXIgdW5k
ZXIgdGhhdCBhZGRyZXNzIHNwYWNlLg0KDQpBOg0KRnJvbSBhIGtlcm5lbCBwZXJzcGVjdGl2ZSwg
eWVzLCBhbmQgdGhhdCdzIHdoYXQgd2UgZG8uICBUaGF0IGRvZXNuJ3QNCnByZWNsdWRlIHRoZSB1
c2VyIGZyb20gaW5zdGFudGlhdGluZyBhIG5ldyBjb250YWluZXIgYW5kIGRldGVybWluaW5nDQpm
b3IgdGhlbXNlbHZlcyB3aGV0aGVyIHRoZSByZXNlcnZlZCByZWdpb24gY29uZmxpY3QgaXMgY3Jp
dGljYWwuICBOb3RlDQp0aGF0IGp1c3QgYmVjYXVzZSBjb250YWluZXJzIGFyZSBpbiB0aGUgc2Ft
ZSBBZGRyZXNzU3BhY2UgZG9lc24ndCBtZWFuDQp0aGF0IHRoZXJlIGFyZW4ndCBydWxlcyB0byBh
bGxvdyBjZXJ0YWluIG1hcHBpbmdzIGZhaWx1cmVzIHRvIGJlDQpub24tZmF0YWwuDQoNClRoYW5r
cw0KS2V2aW4NCg==

