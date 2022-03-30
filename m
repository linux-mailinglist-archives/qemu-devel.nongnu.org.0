Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47EE24EBCFF
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 10:54:42 +0200 (CEST)
Received: from localhost ([::1]:45138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZU6D-0003iq-DW
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 04:54:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin.tian@intel.com>)
 id 1nZTVB-0002KC-Tv
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 04:16:27 -0400
Received: from mga09.intel.com ([134.134.136.24]:41294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin.tian@intel.com>)
 id 1nZTV9-0006mF-1W
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 04:16:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648628183; x=1680164183;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=oVhNC5uH7cxFiF0Fc6MXVlnI9ZnKGyQVqvrwUONpn8w=;
 b=D3jLZxCx6+8EhceQ2Pf91tvBYQ59pFDURy/5McckuIoPeusqsrnxd5Bg
 g9ueY+UFtwT79jPH+ebUw9RKAGib8zPDpxDS/L42XCy1PhXG9BaI4fCEf
 +tlyhCG1oeD3UDu0KlHyOWYdyspFABUcAVgyKErIBbR3gl0MUiMAPx9z8
 tBeXuq1OCX+xXG8DPEiFbs3eV7JBz0xHUFio3JGiuwrTTClNo0kcbj9q2
 qO7JZjQZnXkSmBmtVP3BozkcQVHL4FlQgRJ1U4MuOc0uioFUIE5AoTXSr
 bAfpJBtzJKiOzJPhDexLJgXQqHL1Swl6cj1Uu4cpfixD4opMM+kE50Gl0 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="259196694"
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; d="scan'208";a="259196694"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 01:16:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; d="scan'208";a="546763023"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by orsmga007.jf.intel.com with ESMTP; 30 Mar 2022 01:16:20 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 30 Mar 2022 01:16:20 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 30 Mar 2022 01:16:20 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.106)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Wed, 30 Mar 2022 01:16:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nCwFlUyYIcGSQsPgdurrCKsTUOi8lRCJN320y3mC3OWMmPqUdJKogWw1EZNCcKFOa57eff/Jl+2OpXGGCAvtPW6zbp/K6uq/nPeDGgYx7y69go9w7ZXT7uSX3QJFiC+5VoK+s4Bof6OD0PzwGw0Vmms1JVjXO6ORhEqtKU3vbORnVeaIxXdd3bqsAVvRHU7+1yQjJwceP58Z99yE7CRoJssQlaU9XvJPXivKbsc0NbkOGCH+Mj9H77xdnsvWCd1EmM3ECvtxdy0Loyf6k4gUxaL2AmnHmTKhvJjioGIi7RuBS3DTwBzLeKzB4Rv8dSJJyAn/rkva5y3HrqJ9/+AJNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oVhNC5uH7cxFiF0Fc6MXVlnI9ZnKGyQVqvrwUONpn8w=;
 b=G3QkV8ku7XmrDGebN6Or/Wt2GRP/3hFUtyvkSUNpGdPa+eQGvCel1gy10kADp2r2CkPvrAuZw8EoWQBdyFULn9feWqYp6ZN5yqvOwsXcLhmEdErC/4GWzy7rx6gsqpAtgJAwDN1wOefH0yfZMsWH0ZGb7ok/gOzP59CSja/zYM9uB+d1mzyTfw+I+6RAGAeml+oNiG094lfhQGTd9jNkd1TAUhMDkRX/0f69bcCccONv/nNRHXie4l2T2meXO/o6jw7UeENtH7wCkuuGcRcvm99aQoG51rg2MnkJPDiol83OTFnAmITBvJdl4n1PAu/uZFWDl+aWEYCzF7JUXFIb1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by BN6PR11MB4082.namprd11.prod.outlook.com (2603:10b6:405:7d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.16; Wed, 30 Mar
 2022 08:16:17 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::4df7:2fc6:c7cf:ffa0]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::4df7:2fc6:c7cf:ffa0%4]) with mapi id 15.20.5102.023; Wed, 30 Mar 2022
 08:16:17 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Wang <jasowang@redhat.com>, "Liu, Yi L" <yi.l.liu@intel.com>
Subject: RE: [PATCH V2 1/4] intel-iommu: don't warn guest errors when getting
 rid2pasid entry
Thread-Topic: [PATCH V2 1/4] intel-iommu: don't warn guest errors when getting
 rid2pasid entry
Thread-Index: AQHYPOo/2I7lnnOXbUWYdLsoevjaqqzOM3AAgAXpV4CAAGv2gIABTusAgAHHivA=
Date: Wed, 30 Mar 2022 08:16:17 +0000
Message-ID: <BN9PR11MB5276C1513B8DD829CC87EE898C1F9@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220321055429.10260-1-jasowang@redhat.com>
 <20220321055429.10260-2-jasowang@redhat.com>
 <BN9PR11MB52769DCA64DCF7B107FD244B8C199@BN9PR11MB5276.namprd11.prod.outlook.com>
 <CACGkMEsKJjnBb0qPM8oZvSHt326pMF8JCN8Fu1Qqjeu5pmdfMg@mail.gmail.com>
 <c5a0a8e8-b000-9efa-b334-93637724f49d@intel.com>
 <d04f5de3-9e66-9bdb-b268-b7b64c8489bd@redhat.com>
In-Reply-To: <d04f5de3-9e66-9bdb-b268-b7b64c8489bd@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ae57f613-b92b-4a12-f641-08da12259080
x-ms-traffictypediagnostic: BN6PR11MB4082:EE_
x-microsoft-antispam-prvs: <BN6PR11MB40820018C347AB02C512936C8C1F9@BN6PR11MB4082.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Y0klMhUXCmc5wb5jS/yfiMzzSLmp+ZE2O+/Xm44WmUh7eGacc6EE8Z8+CEoZvseE8R5NjVWJNDlqw47JCMyPDYKCKfN5rTc8qYG1rNMmzzqjsYceimHe8dCXObT6f+8lLN6kFNtHOB87IQaNHkDV2+LKeq3K+q96gMtnefXYsV/EnjGZx/AM50Rx6sbkakoZkuwwpoPJPbo/LHTleK4aFDOIkbTZ1Km6UIG9yW+bleOq10QEuOA0k6ksIjNV3BCvGY1gYIMJHa+VxJpN8FNYluyr10w5pTD2iLdX2XBjogKt/T8sbV70URX+/21Ebx+j5LBKgdno1SYr8FWn9gc0kmpwuSlY58SgnYCKycCYiTkh6fRJSOWEHzdyOn/K/UBeS2HVj3OMoiGyjV2HesE3hhgxHwAR6vlETlxIOwuJ1tWZ4sCuxVmYMa5feu1WrQD79JJHZ9XoukLUJ8eJkRu8uXMNj/PNTR9BPIMkH2Tck2HLeaHl4JnS3ewq+HbAKV6JykUM6ymSJlH3vFRL8BCBHhcrDHb8zLJEiF97ni4nrzMB1ef6JFueqcO8ZPGILMKQAuNWXJkA7YiblZhYDA0JiwkHMsvt5xqfBnwnC1V6HaCx2bRazHMFWdz8WwWEt8pS993gjSseh3/GosUnHkV3Trm2wgYfQHqwuraI46hRII68gD55FWRo0uKLxQuznUc5f/hWCw26CdsEBmQDVQ11+g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2906002)(4326008)(64756008)(8676002)(33656002)(55016003)(122000001)(71200400001)(66556008)(66476007)(5660300002)(26005)(66446008)(186003)(66946007)(6636002)(38100700002)(7696005)(86362001)(6506007)(52536014)(316002)(83380400001)(82960400001)(8936002)(54906003)(110136005)(38070700005)(76116006)(9686003)(508600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bDNVYmdjY2ZVUUlBRlk1aGRreTYrcENkUUt3d0ljaVpTL240blpFcEZaVFpP?=
 =?utf-8?B?R3pYNXo2WG4wNHo2N0psald0WHZ2cU02MTZIZTFHOGVOblh4VWhUbmdlR2ls?=
 =?utf-8?B?QW8yVy84ME90SDFFU2dSNlAzSm93UEFtMEZlcUlETlhTcGNVcmVBa1Vxb1cz?=
 =?utf-8?B?clo1TDRLNVFvSktFTHlFbXFyZ05Xa2p6NzVzNloxZ05seHZ1ZmZxQ1lxaTBF?=
 =?utf-8?B?V1Y1elZjWnAyeDBYay9KeTJOTzlFRnF6N2U3b2VGTFppc0VUUC9WcmNKOXBS?=
 =?utf-8?B?WVQ5eUR6VHVuWHBnRTA2Ykw0ZVo0Qy83M0h6blg2dHJZeHlLVE9zMTBpbFM2?=
 =?utf-8?B?UkVmM21kcm4reDg0dmk4VWZrTkFkODNRNlh1RkllNWx1bkhpR05PR1p5QVlo?=
 =?utf-8?B?eVpqN2FXeENhTm1MNTM3T09DRlB3aTlwNi9sdWRuQ0FVOHRCV01rN1hDSkVX?=
 =?utf-8?B?VlYzOERYVjczU1QyTTlreFF4elhIaW5rbHJIQmJQL2lOcHh2dFJFUld4Nm9k?=
 =?utf-8?B?dmxDakIzbk5JOTFBaWQrdFh2VnpUMzRIWHBWU3hHYjV6T1Iyc3RRbUxnNngr?=
 =?utf-8?B?dGRIbVJlMG0wNDhyWE13RUhSVGFkVnVtbnZaV0ZEdkUxdlN0aHJFTGpRU1Ra?=
 =?utf-8?B?YWdCbDVYcHVWRHpNaEY2N0NaZGxQYmVoeDJKNVp1VHRSWnVjKy82aU95V0ho?=
 =?utf-8?B?OFdySGxZaDFmRUZ5NVFzWEJYdVRDRFRyeFptdHFqb2hzaE81NldUa24rZkFy?=
 =?utf-8?B?SmhNdnFvb0cwZG52WTVFWklvaDhMQTBvZktZTndQMzBPU0VPUjV6Y0tQN0JX?=
 =?utf-8?B?bGdkRFdYMHJGcFFLRUo0VUIzOEtjeUI5VE1KMnJ6STdVOG0yZUZqWHFQUlNS?=
 =?utf-8?B?Wjlqa29ZdGcyd21aaUtvVTdyL1BWaGtQRGlkRVJwUmNQZFlpbkhicjhXYVIr?=
 =?utf-8?B?WHpaeWc3U1p3TUE2NXJVVnhCUmVjN2tINTY1bElETzNGSUtiNmhlNDhGTGdK?=
 =?utf-8?B?eG40Q1k3bDNZUHhKUVBBYUZ6a3J4ZEdSNzVKM1RLTGZCalhuVG9LakNpcTJs?=
 =?utf-8?B?UWM4cGNCNE5uTC9hTmFCZVZuZXNsdHVxYzVOVHlGT2NYTE1EVTVYMWgxSktN?=
 =?utf-8?B?UWlEalJtTW5DV3poblRkK0ErcERmd3AydlpEcFlEeTB6VFFhY1g5TnpyZnFJ?=
 =?utf-8?B?UzRuZDZJRWcySWNhT0M0MFRrVmtNVVhORVhJUjIrOWJYZVZwc0IwcWdXTWRy?=
 =?utf-8?B?bjRhMHZHSnErVmpqeDhVdkp3a2ZJOW9OeDlhUnZ6cis0YUJZYTYxQzdKRjZN?=
 =?utf-8?B?K2VEamYvcUJYeW1kSTJLM1VneCt6MHZsNnF5MEdiYngvcysrTnp1Rnloc0ZK?=
 =?utf-8?B?aHZ3b3JRK2ZDM3ZWTkkrc0RNM2daSmxWczJmcVRFc001b21EMm1aNjRhSS9V?=
 =?utf-8?B?azFJNEQxTkpmZTh3QlY2VlFub3pseTB1aVVWK3JYa2IzUnhndlZhVXYwcGJU?=
 =?utf-8?B?QXNhL1pTdXE0bzVBaTYyTVBya2UxWlFmU2xKK0NuNGUyV2RCWndleXo5aFlG?=
 =?utf-8?B?aEQ1d3RYWWtWTjJpZWFnaGtEZDBTaFNzVmtObkxrc0dlcUZIaGEzWDdIemM5?=
 =?utf-8?B?RnFaRmVxVzU1ODIwcWp3NGx6OTZiQXRXZnhVcUJjTk9YWkx4N083NysvM0FO?=
 =?utf-8?B?YmtYM0pBaG1hVmtTMkJ6VlplZkdTQzFIajY5MU9tMWpDMlNHQUFkYWdtZHRk?=
 =?utf-8?B?WkVDN0YwczIzQnY5Q0w1VURQVFVHRnBKanN3OWMxb3FqV3J0NUJjN0lQUXFQ?=
 =?utf-8?B?QU54MzVDalJoUE1OdkhaRXMxdWJWOFNsMllQdkt0QUM5cjZndk5tcGR6VVJR?=
 =?utf-8?B?YVlxK1hCSUllalFFN3ZZaGRocDBQc3IxbkJCblJhRlFTakhFbDh2MG5JV3VN?=
 =?utf-8?B?cVMvNmovWW5vaWVUWUVrSHMwYXNVTU9yeFZIWUFWS2xtOVd2WUtzUUduOEpz?=
 =?utf-8?B?QXBTSVNTSmpiWGVHR1VSTmVUNWZqbUliWG80akhjRjQwS0J0cXR2clNpR2Uw?=
 =?utf-8?B?K1VuTlEzcU01OXNKUGh1d1hWVkN4OGt6cjU1UEFJbEpTS2FRSG1hNzMxUEZZ?=
 =?utf-8?B?M04raFBTV0VYMUl1T3piU0ZJYnVsMHdPWU0rN3huQjIyQk1nV1BLV2ZVQ0Va?=
 =?utf-8?B?cVlDbitXakdqbE5lTWRTeWIzTmlPUTZuNW8yVUlsR3I2L2VLcFZHbkVXQUdp?=
 =?utf-8?B?R3l2MittTTVJSnNSZGNQTjI4NVJlMDliaFdOT2xieE5qYVV6MUxvZTB0OFpy?=
 =?utf-8?B?Ykhkd0FXWXJndTZ5TUpxcE1tVUpUbjJTNFgxSlkvZERhbk9UNk9rUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae57f613-b92b-4a12-f641-08da12259080
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2022 08:16:17.3026 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jqLMHFSDSwNQxqz0I/NChowI1WUPxsVk5h+WavRu1goGokMN/WKfV0S9ANG+4M4mm9aZFzPatzKCNBZpKnZh1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4082
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.24; envelope-from=kevin.tian@intel.com;
 helo=mga09.intel.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "yi.y.sun@linux.intel.com" <yi.y.sun@linux.intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "peterx@redhat.com" <peterx@redhat.com>, "mst@redhat.com" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PiBGcm9tOiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPg0KPiBTZW50OiBUdWVzZGF5
LCBNYXJjaCAyOSwgMjAyMiAxMjo1MiBQTQ0KPiA+DQo+ID4+Pg0KPiA+Pj4gQ3VycmVudGx5IHRo
ZSBpbXBsZW1lbnRhdGlvbiBvZiB2dGRfY2VfZ2V0X3JpZDJwYXNpZF9lbnRyeSgpIGlzIGFsc28N
Cj4gPj4+IHByb2JsZW1hdGljLiBBY2NvcmRpbmcgdG8gVlQtZCBzcGVjLCBSSUQyUEFTSUQgZmll
bGQgaXMgZWZmZWN0aXZlIG9ubHkNCj4gPj4+IHdoZW4gZWNhcC5ycHMgaXMgdHJ1ZSBvdGhlcndp
c2UgUEFTSUQjMCBpcyB1c2VkIGZvciBSSUQyUEFTSUQuIEkgZGlkbid0DQo+ID4+PiBzZWUgZWNh
cC5ycHMgaXMgc2V0LCBuZWl0aGVyIGlzIGl0IGNoZWNrZWQgaW4gdGhhdCBmdW5jdGlvbi4gSXQN
Cj4gPj4+IHdvcmtzIHBvc3NpYmx5DQo+ID4+PiBqdXN0IGJlY2F1c2UgTGludXggY3VycmVudGx5
IHByb2dyYW1zIDAgdG8gUklEMlBBU0lELi4uDQo+ID4+DQo+ID4+IFRoaXMgc2VlbXMgdG8gYmUg
YW5vdGhlciBpc3N1ZSBzaW5jZSB0aGUgaW50cm9kdWN0aW9uIG9mIHNjYWxhYmxlIG1vZGUuDQo+
ID4NCj4gPiB5ZXMuIHRoaXMgaXMgbm90IGludHJvZHVjZWQgaW4gdGhpcyBzZXJpZXMuIFRoZSBj
dXJyZW50IHNjYWxhYmxlIG1vZGUNCj4gPiB2SU9NTVUgc3VwcG9ydCB3YXMgZm9sbG93aW5nIDMu
MCBzcGVjLCB3aGlsZSBSUFMgaXMgYWRkZWQgaW4gMy4xLiBOZWVkcw0KPiA+IHRvIGJlIGZpeGVk
Lg0KPiANCj4gDQo+IEludGVyZXN0aW5nLCBzbyB0aGlzIGlzIG1vcmUgY29tcGxpY2F0ZWQgd2hl
biBkZWFsaW5nIHdpdGggbWlncmF0aW9uDQo+IGNvbXBhdGliaWxpdHkuIFNvIHdoYXQgSSBzdWdn
ZXN0IGlzIHByb2JhYmx5IHNvbWV0aGluZyBsaWtlOg0KPiANCj4gLWRldmljZSBpbnRlbC1pb21t
dSx2ZXJzaW9uPSR2ZXJzaW9uDQo+IA0KPiBUaGVuIHdlIGNhbiBtYWludGFpbiBtaWdyYXRpb24g
Y29tcGF0aWJpbGl0eSBjb3JyZWN0bHkuIEZvciAzLjAgd2UgY2FuDQo+IGdvIHdpdGhvdXQgUlBT
IGFuZCAzLjEgYW5kIGFib3ZlIHdlIG5lZWQgdG8gaW1wbGVtZW50IFJQUy4NCg0KVGhpcyBpcyBz
ZW5zaWJsZS4gUHJvYmFibHkgYSBuZXcgdmVyc2lvbiBudW1iZXIgaXMgY3JlYXRlZCBvbmx5IHdo
ZW4NCml0IGJyZWFrcyBjb21wYXRpYmlsaXR5IHdpdGggYW4gb2xkIHZlcnNpb24sIGkuZS4gbm90
IG5lY2Vzc2FyaWx5IHRvIGZvbGxvdw0KZXZlcnkgcmVsZWFzZSBmcm9tIFZULWQgc3BlYy4gSW4g
dGhpcyBjYXNlIHdlIGRlZmluaXRlbHkgbmVlZCBvbmUgZnJvbQ0KMy4wIHRvIDMuMSsgZ2l2ZW4g
UklEMlBBU0lEIHdvcmtpbmcgb24gYSAzLjAgaW1wbGVtZW50YXRpb24gd2lsbCANCnRyaWdnZXIg
YSByZXNlcnZlZCBmYXVsdCBkdWUgdG8gUlBTIG5vdCBzZXQgb24gYSAzLjEgaW1wbGVtZW50YXRp
b24uDQoNCj4gDQo+IFNpbmNlIG1vc3Qgb2YgdGhlIGFkdmFuY2VkIGZlYXR1cmVzIGhhcyBub3Qg
YmVlbiBpbXBsZW1lbnRlZCwgd2UgbWF5DQo+IHByb2JhYmx5IHN0YXJ0IGp1c3QgZnJvbSAzLjQg
KGFzc3VtaW5nIGl0J3MgdGhlIGxhdGVzdCB2ZXJzaW9uKS4gQW5kIGFsbA0KPiBvZiB0aGUgZm9s
bG93aW5nIGVmZm9ydCBzaG91bGQgYmUgZG9uZSBmb3IgMy40IGluIG9yZGVyIHRvIHByb2R1Y3Rp
emUgaXQuDQo+IA0KDQpBZ3JlZS4gYnR3IGluIHlvdXIgdW5kZXJzdGFuZGluZyBpcyBpbnRlbC1p
b21tdSBpbiBhIHByb2R1Y3Rpb24gcXVhbGl0eQ0Kbm93PyBJZiBub3QsIGRvIHdlIHdhbnQgdG8g
YXBwbHkgdGhpcyB2ZXJzaW9uIHNjaGVtZSBvbmx5IHdoZW4gaXQNCnJlYWNoZXMgdGhlIHByb2R1
Y3Rpb24gcXVhbGl0eSBvciBhbHNvIGluIHRoZSBleHBlcmltZW50YWwgcGhhc2U/DQoNClRoYW5r
cw0KS2V2aW4NCg==

