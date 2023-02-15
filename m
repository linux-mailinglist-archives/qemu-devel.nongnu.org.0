Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 037136974A0
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 04:00:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pS81i-0002kg-JA; Tue, 14 Feb 2023 22:00:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1pS81g-0002kW-S2
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 22:00:08 -0500
Received: from mga03.intel.com ([134.134.136.65])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1pS81d-0002rH-9K
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 22:00:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676430005; x=1707966005;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=oFx0emNm65TWQuyCmh67CEWHnKcl3QGuyAi593HTWII=;
 b=HyzpmCSLLimyiofvBPsjFB6b6yvtvtXrkE6DO9jN8euJW10hIS3UYdec
 imrR3eS+NQS9MIgStUZMUjaxPlPhZ/HnW/nZbH3OeQt2hV+KQ7P2lVzuN
 W8dPJXuxiZxFV/HJotGHH2/E7AX6jMrwmzqkJv/DGeLQr9g7eFdFEJO7j
 lRhDA+uslv5jVk7zjtlwMdmjuiegUb+PlYwjIMliNDIgeFWKwKtRZkBb+
 cRYyDzard5TDUY6FfIiW/d6x/xY7rukyWZnALTRkzIqWL1eH+j7nXXkRc
 z/wFxAw+1F9j1m2loEECMPvBPTvk7ai6Q/CXjbiqv4Q04mPQbbuLbzxci w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="333468613"
X-IronPort-AV: E=Sophos;i="5.97,298,1669104000"; d="scan'208";a="333468613"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 18:59:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="758237966"
X-IronPort-AV: E=Sophos;i="5.97,298,1669104000"; d="scan'208";a="758237966"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP; 14 Feb 2023 18:59:51 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 14 Feb 2023 18:59:50 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 14 Feb 2023 18:59:50 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 14 Feb 2023 18:59:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a4uL/U+UU9O1Fr1D1vb0YOsqwfVBi4DWVRnfArpy9DI23Iju3o8l97VaJ9ABW5aihTwhBcIb/RaN3UIj0OVtQojE92Pv3Megf2nDWYM6UJT+Z7mEW8lQA8unnpl0PGfg9Saqcv3aJFUwWUooe+E1VgftaayAPOyGm01a0CYq3FmGEI5xS7gIVOLe+qbcw8nOMmifityQLLwDSduHL45oI82WoFJHbfh9aS5jhktDpkVhBHPEignLNaxWo4l8Nuxyv09ewrM6J/3X1G2Bcbxg/X8Lj5mQhnpytAZr13zL2WHlvlnPkDQBuMTs2zF+IDAPsPZLjQaPSHnggboeO11g9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oFx0emNm65TWQuyCmh67CEWHnKcl3QGuyAi593HTWII=;
 b=NiKPURr3RnOHPTAXNxOEC7jnEHjNKpfcXMGK/CsyaskSKJ8J1zzHAa3kelJ/C+6bBfQ9HqPeDxa3UkbHC7tI1ILC9VgjtTxIdi/FqbWjsOTJHSdIOks0EVww9xXG7yjIxClaSPiv6XVG1/Kf8J7/ElXHNYPf5AO5q1jODeU1I17WiHc0UXjoBXNUZjGomwA84SShnsQnI2wW675xxuna++/0II0LQLpHfklh/ahLghORAzzteaBdSv1YvzQ9gBNJwtB11cytUXxrnSad7UAHlsZ6poA1HikoaVdkIDY1XpMkfDkIK1ysbrp1Frx6dFfJAOSDiHbahr5Zz/qNGJZoVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB6744.namprd11.prod.outlook.com (2603:10b6:a03:47d::10)
 by BL1PR11MB5956.namprd11.prod.outlook.com (2603:10b6:208:387::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Wed, 15 Feb
 2023 02:59:43 +0000
Received: from SJ0PR11MB6744.namprd11.prod.outlook.com
 ([fe80::f42a:63d9:2c7:356a]) by SJ0PR11MB6744.namprd11.prod.outlook.com
 ([fe80::f42a:63d9:2c7:356a%4]) with mapi id 15.20.6086.026; Wed, 15 Feb 2023
 02:59:43 +0000
From: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>
To: Peter Xu <peterx@redhat.com>
CC: Jason Wang <jasowang@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "mst@redhat.com" <mst@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>, "richard.henderson@linaro.org"
 <richard.henderson@linaro.org>, "eduardo@habkost.net" <eduardo@habkost.net>,
 "marcel.apfelbaum@gmail.com" <marcel.apfelbaum@gmail.com>, "david@redhat.com"
 <david@redhat.com>, "philmd@linaro.org" <philmd@linaro.org>
Subject: RE: [PATCH] memory: Optimize replay of guest mapping
Thread-Topic: [PATCH] memory: Optimize replay of guest mapping
Thread-Index: AQHZQCZutfT/VxSah0G4zWGZxxF26a7N+ekAgAAChtCAALcLAIAAnwqA
Date: Wed, 15 Feb 2023 02:59:42 +0000
Message-ID: <SJ0PR11MB67445C9C70542C6FDCCCD7C992A39@SJ0PR11MB6744.namprd11.prod.outlook.com>
References: <20230214034211.683203-1-zhenzhong.duan@intel.com>
 <CACGkMEse_BFRaTV0NkvsGD_ptsTzrBGKLBZg59NtSCR_Z-=V1w@mail.gmail.com>
 <SJ0PR11MB6744F710B0E621272A35060892A29@SJ0PR11MB6744.namprd11.prod.outlook.com>
 <Y+vE+ICe2zycdlqX@x1n>
In-Reply-To: <Y+vE+ICe2zycdlqX@x1n>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB6744:EE_|BL1PR11MB5956:EE_
x-ms-office365-filtering-correlation-id: 29d1d8fb-d4f2-4a16-5d25-08db0f00afd9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hwwXSbKNQe4GssLhZ7awkaMoa/dD5P8huaDKUEjT3T8qVUTrLe1MIo1uO7sCAiiYRrN7v0KlDjm4I81gkVm8GY9Zz+KERhnIhMBE6rdp4KdsXj1tzJHl3etLHo/qk/vakH/CeqzrfxFR21Ed5blPHclfcoBbeQQvB3mK6Hj58tyn4zGISR+GM+xbY/WGJzVqc9UYNaWIImdLSlCCrPxb34wcY5cVEK9PhUIq2Vjss+EA4l/CiflEo6C266HKFBmyD3/Hb8XN8QB52vpU0ZjfYlIW51VAEO4MkyRRXl2yaWo9K3edMHaEZCCc+79ba+gOdSWQ0grz1ykDs4gFTLXFFxu5LCVQl1tgIBZsuVJtkXCSfct7wFh2AJ7wRcQab6mEnGTEz1CgM4baw9bgSAQ7jWzW8/Kjrl+qVnjMF2JFI79J0swyLXe7/lT6yPgRhNCzJ0ulA84uIroc43B9MGRlpgPskQZX3sqC2O+mnm1Xy6RczFqVguogbCrQRhGjH+d2mh83qhKUbv8GW7YQK9y8HSEwyHfM2+aSxPU7FyU/P1sLey3FTlnLBIFV4Lv0v0nCOG5XhCAzNMAndfHsfpbDMhnphxnMhHEmpxRE0GcRY1lA56u7AZq0BvHOSJoojH9gndmqbPhoxIN2cYeb5UphMadflc71qWadWS8gMV3NZ7+Q4tK7eL204yCDk9mrh6tabn1xwG3pYf8JVoH9Wvgb9jl5IUOI7blfJj2D9+HuiMI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB6744.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(39860400002)(346002)(376002)(136003)(396003)(451199018)(7416002)(5660300002)(41300700001)(52536014)(2906002)(66476007)(8936002)(66556008)(64756008)(66946007)(6916009)(76116006)(4326008)(66446008)(8676002)(55016003)(316002)(6506007)(54906003)(478600001)(7696005)(26005)(186003)(9686003)(71200400001)(86362001)(122000001)(38100700002)(33656002)(83380400001)(82960400001)(38070700005)(13296009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S1pNTk9yNUtTUi9jRDRQQjFEMDk4NmFNR2FpN2c4SjZDaGIxcnlMMU5WTmJJ?=
 =?utf-8?B?dGhHYVFWcGFLbUZ5czJvbDQrRnFOZTVQcnUxcW5oUjlpUC9IQ0plT2gzVHNx?=
 =?utf-8?B?eG51QW9yVUI1VGY1QTBPdXVVK2RvZVpKWWw5eVBGT1U1bEljSGRoYkVtWXc3?=
 =?utf-8?B?aWxyb3RwcnpuZDhrVmUxUHNBbVRWaCtJUUFYeVJJQ0hReUhsdnpsc1lCL1Fa?=
 =?utf-8?B?QXdoTTlBNGJYRHh3U0ZCVFZGSFo3SUpJNjF4YkJ6Y2hvWkJpOS9aZVN5TU44?=
 =?utf-8?B?c01NU01OazFOekxNZzlLV0JnYU9zZXBRNWtPYzZHb1VjaWNGbFZPSlY1ejJa?=
 =?utf-8?B?MGxKTVI1NDVlVHFVMUxwVHJLWnk2RnhUWW8zWjRzdS9jc0VOMkxaKzRIbXov?=
 =?utf-8?B?WENERXlPaG9TRkFtWkNwMTZlQ2lKV0RLUThxNEd4Zm1yS2Y4K1pQZW5TaVlW?=
 =?utf-8?B?LzhFNmRGNmdDSlFSS0w1cFJjQmhTR2Z6TlhWVWVLMkpDSURWM3Z1dWt1YXRZ?=
 =?utf-8?B?TGRGK2lFdDE0S0hPa3FJREJBbCtHZ3VhRlJnMW5aMi95K2V4KzBEL2dmZjg2?=
 =?utf-8?B?S3RXaGU4c2lJRUlLemxIMHZ5dnRxS21QMVdtNGQ2R2FGekVIVGNDUTlMTjlR?=
 =?utf-8?B?cGlqZFV4UjUvbTFDbFg3cHU5U3RsV2Q1Q3o5OUNsNW1Xdk41T1pLNVNNRjlD?=
 =?utf-8?B?WHY3OXF6OHA3QllSS2VaR1k0OW1TMlZDSit5cnJHOWl4cHN2eE5lU0JFaDVU?=
 =?utf-8?B?eHhxN05sclNSaW90NXhWQ0JycWM1VW1KTGUxRnh2YkpHaTludjRza1hIY3Fy?=
 =?utf-8?B?M3FyTC9sZnRRZWlQL0p0VjliWkwxaFdVWTY5SU04Y2hYVjVLK25xNVc2Vlcr?=
 =?utf-8?B?Q3k0ckZHRXRSbU56M3F6WXRDY1JrNHE3VGhKaFBqcXI0K3h6TS8ra2w4U1RD?=
 =?utf-8?B?bkRqLzJaS1IwdEs3VXpCdWlleTN1L2c1WUMyV1ErREVpU2hlWmtyUVRkaUhP?=
 =?utf-8?B?RGltS2RCanZUOWM3UFBXZElnWXJDNmQ0Z1c4Q1hVM0RCUGtDazBEKzZsTXdk?=
 =?utf-8?B?N3lsYUpaZWhuN1ppUkF5anlmQ2VPSzR5bDkrcFVxTnluYnpGdVlwdjF0ZDZq?=
 =?utf-8?B?MzI4N012cm0xcURqL2VUb3d1MENtdzQ3bTVpeEZzZG41UkJnZ25uRDNGUWQ0?=
 =?utf-8?B?UnAvWi9va2UyWFRPNGZwRWlodUliWU92b0tiekFYRDZhTkROeWU1cGdMQ3V4?=
 =?utf-8?B?NDBVUHRlM3VWT1Q3dW1jWDdFUGx2eHBRR0VId1JrRXNBelFGVnZ4TmtnUERu?=
 =?utf-8?B?NFU3ZHhYZFBxbjVCSmN2S2pWWTFXUlRnZzRwV29Vb0Y0eDlyV2dXUFJyUVRM?=
 =?utf-8?B?OE9wTXFSVDVjdzRQN0FDdkFneG9IYWZENW1iNHFwU3oxbWwreW5QQkw2YUhl?=
 =?utf-8?B?MUJpNWNoeXNiUURQS3h2c3lwNzN1Q2RYTlBQb3FkRlE2MitPWnVrWGtBUXFx?=
 =?utf-8?B?bkdiNURlT21LbzhDdHBSTnkvdjZ5TXFaUVJGZzNwNXZpNFh4MG5kS2hsdkRp?=
 =?utf-8?B?VTVuSEc0VXpxalBpQ0lDdlVsR20zTlFWay9vZ0pMZjFaVjRDUW9PN1ZOcVcr?=
 =?utf-8?B?MTRyY2VodmwxMHVuNjM3SFNFc3dGTW84REtTUXp5VWViVkpKb3puK0p2Smgy?=
 =?utf-8?B?bDByS2hyM1lFalZTU1dkRjNadDRvY1d1b0taRmkweDNjblVaYzZwRnU0bDEw?=
 =?utf-8?B?ZElZTHF0TXJCZHM0empzNy9sK290SS8wKzJ4ZGt4akV5TWJ0djdRZU1lVVRw?=
 =?utf-8?B?WUxhZXVwYWw0Rjl6ck5ZR1ZmVEJ3d25qdi8vdmdraCtNWVM2S0FOazdXclVQ?=
 =?utf-8?B?cXZzNEVrUEUxMWZuTytkcEgyN1BuU211NThxekIwa21jMXp5Q0syM1lMbHpF?=
 =?utf-8?B?d0V4NU5jQWYwSVdXdmZtbzFqWkJsRlN1TmFIVzVxR2Zza0Y3ZitCVC9UQktm?=
 =?utf-8?B?ZENFRWJFN1EzUi9nNnBZbFptdjdPRFd2cThuQ0UrbElDWGlFb25jWmR0Rm1T?=
 =?utf-8?B?TkJ1djhZMnRHaVZhOGpKTlh1NGZOdG40aGQwdW5DRVV2eTBqWHNYaG5KRW1K?=
 =?utf-8?Q?V5DOgODgKFC1KfX8AhAPssqPA?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB6744.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29d1d8fb-d4f2-4a16-5d25-08db0f00afd9
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2023 02:59:42.7263 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SXfAdgALVqVPYp10L34W90cepzQL6HkMNTAnD4i+tgIGjGMRe1vRUTcad7EVSujWs8eSoogxu5XA77CaWeeNUWtp4j4jRdcbio/KH2KpVcc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5956
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.65;
 envelope-from=zhenzhong.duan@intel.com; helo=mga03.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IFBldGVyIFh1IDxwZXRlcnhA
cmVkaGF0LmNvbT4NCj5TZW50OiBXZWRuZXNkYXksIEZlYnJ1YXJ5IDE1LCAyMDIzIDE6MjkgQU0N
Cj5UbzogRHVhbiwgWmhlbnpob25nIDx6aGVuemhvbmcuZHVhbkBpbnRlbC5jb20+DQo+Q2M6IEph
c29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+OyBxZW11LWRldmVsQG5vbmdudS5vcmc7DQo+
bXN0QHJlZGhhdC5jb207IHBib256aW5pQHJlZGhhdC5jb207IHJpY2hhcmQuaGVuZGVyc29uQGxp
bmFyby5vcmc7DQo+ZWR1YXJkb0BoYWJrb3N0Lm5ldDsgbWFyY2VsLmFwZmVsYmF1bUBnbWFpbC5j
b207IGRhdmlkQHJlZGhhdC5jb207DQo+cGhpbG1kQGxpbmFyby5vcmcNCj5TdWJqZWN0OiBSZTog
W1BBVENIXSBtZW1vcnk6IE9wdGltaXplIHJlcGxheSBvZiBndWVzdCBtYXBwaW5nDQo+DQo+T24g
VHVlLCBGZWIgMTQsIDIwMjMgYXQgMDc6MDQ6NTZBTSArMDAwMCwgRHVhbiwgWmhlbnpob25nIHdy
b3RlOg0KPj4gPj4gQEAgLTE5MzYsNyArMTkzNSw3IEBAIHZvaWQNCj4+ID4+IG1lbW9yeV9yZWdp
b25faW9tbXVfcmVwbGF5KElPTU1VTWVtb3J5UmVnaW9uICppb21tdV9tciwNCj4+ID5JT01NVU5v
dGlmaWVyDQo+PiA+PiAqbikNCj4+ID4+DQo+PiA+PiAgICAgIGdyYW51bGFyaXR5ID0gbWVtb3J5
X3JlZ2lvbl9pb21tdV9nZXRfbWluX3BhZ2Vfc2l6ZShpb21tdV9tcik7DQo+PiA+Pg0KPj4gPj4g
LSAgICBmb3IgKGFkZHIgPSAwOyBhZGRyIDwgbWVtb3J5X3JlZ2lvbl9zaXplKG1yKTsgYWRkciAr
PSBncmFudWxhcml0eSkgew0KPj4gPj4gKyAgICBmb3IgKGFkZHIgPSBuLT5zdGFydDsgYWRkciA8
IG4tPmVuZDsgYWRkciArPSBncmFudWxhcml0eSkgew0KPj4gPg0KPj4gPklzIFtuLT5zdGFydCwg
bi0+ZW5kXSBndWFyYW50ZWVkIHRvIGJlIHRoZSBzdWJzZXQgb2YNCj5tZW1vcnlfcmVnaW9uX3Np
emUobXIpPw0KPj4NCj4+IEluIGN1cnJlbnQgaW1wbGVtZW50YXRpb24gaXQgaXMuDQo+PiBbbi0+
c3RhcnQsIG4tPmVuZF0gb2Ygbm90aWZpZXIgaXMgZGVyaXZlZCBmcm9tIGlvbW11IG1lbW9yeSBy
ZWdpb24ncw0KPj4gc2VjdGlvbiB3aGljaCBpcyBhIHN1YnNldCBvZiBpb21tdSBtZW1vcnkgcmVn
aW9uIGl0c2VsZi4NCj4NCj5ZZXMsIGN1cnJlbnRseSBpdCBzZWVtcyB0byBiZSBndWFyYW50ZWVk
IGJ5IHRoZSBjYWxsZXJzIGFzc3VtaW5nIHRoZXkncmUNCj5hbHdheXMgZG9pbmcgdGhlIHJpZ2h0
IHRoaW5nLg0KPg0KPk1heWJlIGl0J2xsIHdvcnRoIGl0IHRvIGhhdmUgbWVtb3J5X3JlZ2lvbl9y
ZWdpc3Rlcl9pb21tdV9ub3RpZmllcigpIGFzc2VydA0KPnByb3Blcmx5IHRvIG1ha2Ugc3VyZSBp
dCBhbHdheXMgaG9sZCB0cnVlPw0KDQpZZWEsIGdvb2Qgc3VnZ2VzdGlvbiwgd2lsbCBkbyBpbiB2
Mi4NCg0KVGhhbmtzDQpaaGVuemhvbmcNCg==

