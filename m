Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6DE4EFF6A
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Apr 2022 09:36:47 +0200 (CEST)
Received: from localhost ([::1]:43904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naYJS-0002eg-F0
	for lists+qemu-devel@lfdr.de; Sat, 02 Apr 2022 03:36:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin.tian@intel.com>)
 id 1naYGv-0001ha-3a
 for qemu-devel@nongnu.org; Sat, 02 Apr 2022 03:34:09 -0400
Received: from mga09.intel.com ([134.134.136.24]:46381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin.tian@intel.com>)
 id 1naYGs-0000Uk-2z
 for qemu-devel@nongnu.org; Sat, 02 Apr 2022 03:34:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648884846; x=1680420846;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=B3Jjt2iLin+Vt1rDmOVu3OjBmE3Hwlwjj2CVWejCIvM=;
 b=JvodUz+FPaEBahLq5BRPx9DqeEK1WGEf+WUj0oOpZNI1GQC1kzbAGyQv
 BB8/6Tge+xpJ+0hqHhF+Wa9pWTKUQZ4S/UfVjQyNK1lKp/JAsIW2X4wpC
 Niq08Hqd67VfJRBgknLAVBQwH8kHk68zTgtKpH9tbbzBUKdQKLaJrnqVC
 FEODqrDuxemBxfHdJwlaRjFHDcnjIDUY+Dukj5sqH/rgspcPWpKXDOg/P
 UumFEtJZT8/CuTt/xipU+jwUU90QKKZyk9AfRAFBnLTP5PIOnAI+EOlTy
 JKd3uOW50boD2/N640rkDPn3hVTGpGFGorRHjSZuMOzOzJd2Ix/vkQisI Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10304"; a="259984868"
X-IronPort-AV: E=Sophos;i="5.90,229,1643702400"; d="scan'208";a="259984868"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2022 00:34:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,229,1643702400"; d="scan'208";a="521899212"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga002.jf.intel.com with ESMTP; 02 Apr 2022 00:34:04 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Sat, 2 Apr 2022 00:34:03 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Sat, 2 Apr 2022 00:34:03 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Sat, 2 Apr 2022 00:34:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hO62Aq9Wap7nNKNNw0+TK92nD1PBhljPauF94rRCDOd26hKHm4qqCnKm3lwZFsOa6FDr95SsXr3PuGj01cPtari+wU4+wWpDc2P7wXbG9PCCRhg4DmzP0K9OYNyhArWBmG9CaX2s7Q7deCux8zPgkj6N0BQ+UUZ2yEuhbJDyjY/sJCn1xOBsO13yVIi81i2AhY/TovFs7DN+QgRehSL0Pai7FL9/e6SJCaR2N10lpwINguBrbUZnJC47JT1c79Pk83j7c9bFULSZTZ3x2Fw9pMaP+6/A61ef+a2MLNLGjac1+5st0BLpjdYjUdAeKeR5d40qbWDvYWb2+wXBgjcbXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B3Jjt2iLin+Vt1rDmOVu3OjBmE3Hwlwjj2CVWejCIvM=;
 b=mRnKe2Q1Gk2CG4DVKngucEjVeMSMQMTNNsuYdlQD5mrHEqg1g45DI+tsB0HaKUOfj0kjrchS689LQpom7Jxv6JNtn7H2FNuPv76urkjcN7h4beFUnkZDHR4dqYoq5n0oBF2UwR0OLUvsTI718Ydo6RPfvl8nX8cR++DKA0gotB7KEdNl6dGCrzoTKSz5e/QA3IBLSMn/Oh4S64bEwAej8PADa6ioPDwhnP9kQHEiKqBxs4gyo/f+Jq1J0mMe4aqtkx6XKItvo1s+8EGjZnLUDavY8Y+eGDZo9m2QYEBjAmHRLE8EbZA78lSfY1lRAcO1z0GXp1SVnFw+SpuK2fCTTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5271.namprd11.prod.outlook.com (2603:10b6:208:31a::21)
 by BN6PR1101MB2098.namprd11.prod.outlook.com (2603:10b6:405:52::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.20; Sat, 2 Apr
 2022 07:33:56 +0000
Received: from BL1PR11MB5271.namprd11.prod.outlook.com
 ([fe80::3c5c:b7a7:ca9e:88f5]) by BL1PR11MB5271.namprd11.prod.outlook.com
 ([fe80::3c5c:b7a7:ca9e:88f5%9]) with mapi id 15.20.5123.030; Sat, 2 Apr 2022
 07:33:56 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Wang <jasowang@redhat.com>
Subject: RE: [PATCH V2 1/4] intel-iommu: don't warn guest errors when getting
 rid2pasid entry
Thread-Topic: [PATCH V2 1/4] intel-iommu: don't warn guest errors when getting
 rid2pasid entry
Thread-Index: AQHYPOo/2I7lnnOXbUWYdLsoevjaqqzOM3AAgAXpV4CAAGv2gIABTusAgAHHivCAAAmCAIAEpDTw
Date: Sat, 2 Apr 2022 07:33:56 +0000
Message-ID: <BL1PR11MB5271E2D6268489B5475111E78CE39@BL1PR11MB5271.namprd11.prod.outlook.com>
References: <20220321055429.10260-1-jasowang@redhat.com>
 <20220321055429.10260-2-jasowang@redhat.com>
 <BN9PR11MB52769DCA64DCF7B107FD244B8C199@BN9PR11MB5276.namprd11.prod.outlook.com>
 <CACGkMEsKJjnBb0qPM8oZvSHt326pMF8JCN8Fu1Qqjeu5pmdfMg@mail.gmail.com>
 <c5a0a8e8-b000-9efa-b334-93637724f49d@intel.com>
 <d04f5de3-9e66-9bdb-b268-b7b64c8489bd@redhat.com>
 <BN9PR11MB5276C1513B8DD829CC87EE898C1F9@BN9PR11MB5276.namprd11.prod.outlook.com>
 <CACGkMEt9J6Jcy7+EmgFm-JTTqd82ONt_aOYRsxnTke2ZNSaA7A@mail.gmail.com>
In-Reply-To: <CACGkMEt9J6Jcy7+EmgFm-JTTqd82ONt_aOYRsxnTke2ZNSaA7A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4b4acc4a-767d-459c-ca9b-08da147b253f
x-ms-traffictypediagnostic: BN6PR1101MB2098:EE_
x-microsoft-antispam-prvs: <BN6PR1101MB2098084FF12D1498241E05CD8CE39@BN6PR1101MB2098.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DtuszPKhbc3w+vPH/JcOK08YlohVYrxltZFo/jGJXoZ2iVuAuBIbN2GqETfzL+f56xaD4srWOpO6gW0y+rv0IIw35mz2SXKmkHs1s+osrjS5Y2/GGTVyvR8qYfbeN3oU/WwQJTkZDqZh6UEvFzOb0R8l/BlQ74N9bqSxdb1Zuet/0LPx0YNG3wkzzIYXdAxVOZ7z9NEpp3otGRWXLNR5EBlKDo5ulusTMGp1xQdnUxwu8kPBeTY5qyEeH5riyxjWGw631MTLZWX+2cwYbRRILXGEJaGX2vJsvZ1G+1AJzSGwZ9b6jYBclFpu0me0kFJ6Y8HzXhkiDl2yj14Q/TRHFUnNvslpdXlqW3Plqq9rbUOTwOxRqBpiMWgHpUHS03PrkMi7Mz3ty+j7ThCvTZ8NH3H9n1C5bVCLG05Z6g9w+cloaTg8lQX0IaA0AdvNU2wasLa4TRDiN7xjCJu30DWdJq0BR5p5R9r9+pchr01qJKWDyw548h2sBTUUrThHCDbF0EOo4NYU4p8QHoZiy11i4lO+yKEGoLszinuFuaT23RNNvAEitMVsK3qPS1i+874wceyqRLRC1V/gw2plAcVQt9NfwyuN16IHkdoT35c4+q3kMyQMK/7ssP8tPJdrK/unROTYVavd6ZcY9hmrJfLbBxKDShp+XVTzMf07emPaxXBUoBdxKSsPDe2E8+T+LwHthkbAzmVV+YJ2kzgJZwn0zA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5271.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(5660300002)(82960400001)(52536014)(38100700002)(122000001)(2906002)(83380400001)(8936002)(7696005)(53546011)(86362001)(6916009)(186003)(66556008)(8676002)(64756008)(4326008)(54906003)(66446008)(66476007)(71200400001)(6506007)(76116006)(26005)(66946007)(33656002)(55016003)(316002)(508600001)(9686003)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Yk9VbVFLMFhHbmh5c00zcE1LcStMSzBGckNmY2krS2ZiT0xiUWswZnpKbk5s?=
 =?utf-8?B?VHlja1NYUG9aSmNqZTVBaHE1bVQ5aGVQc2RDMG1VZkZGcmt1OGRMczluK1dP?=
 =?utf-8?B?a0poSHFWa0toTWphUXM5RElLNGtGOWlNQ0dzRHdXTlk5V2o1MGZyV1duOHNi?=
 =?utf-8?B?Y3hmZXQ1OUlkWlZ0Qks4WXlKM2JMTDdnZkNNWmxKakp2eFlwSjdjdFIraXN0?=
 =?utf-8?B?cEpIRjdYbXB3R1RCcWlMQm5oRnBuT3BLZXo3N1FDay9oVWhCN1ZIQllwcHZC?=
 =?utf-8?B?WUlVaHY2R3RIK1NUcjZTdUsvemsxc012VFp4WUpEWVpZU3RQZkY4N3hoeGZ0?=
 =?utf-8?B?OGJzb0JkRGFSMFkrU0czM0drMzVFZFFaZFd1L25KVEl6WnhYamxkMXYrSHZK?=
 =?utf-8?B?U2wxY3l0MHViZTBlcjZod2VFa25EMWFHTVh5Z2hKVVY1WFUxbmJ3Y1ZKeitN?=
 =?utf-8?B?N0t1dW82RHUyVE8reVlCWU9NeGxvTzdiQmI3Z0VhVjEzbkN4MVhuNC9qTmRm?=
 =?utf-8?B?Sk1URURBYTdaM2hWZlNTRGlpcFNTZE0rL2dLZEgxMXJoaStpL1NkRW5FRWZm?=
 =?utf-8?B?eStFV05vUzliVG9iNWJLRVVkdlhUa2kvbWpwYnpxMStCekdwanZ3QU1USW5W?=
 =?utf-8?B?bjF2SVhBd1NaMnYybU9IaE04b2FkTFJEK2Evd3BmRnQyeDdRYVU0bU1JbXcz?=
 =?utf-8?B?TTZCQjZYWmkxakZxdTFyZlZrUUFGeXNrbWprQ2xZSHhhUGNhRWRpRm5mTHk0?=
 =?utf-8?B?M0VZMWdhRGZXdE9EODZLV0xiZlNzcUlwTjJHQTNUdlhpSE1PNXRDcjZFVkFi?=
 =?utf-8?B?SHl4UGlBenphR0tGeURseTY5bG04Rmc0RnpyMC9CYUlpRnhTbnJqbDZVYVdx?=
 =?utf-8?B?Y1pDZUNPbmExZjZWYkNQVTRqUjNYL0tEcVl5OENJRW1LSHRuOTRpWGFBZ1N4?=
 =?utf-8?B?cGl2TkZXTEduNjFGUU9UMmtZTHFDWHp4d0pvVHNLTmp3b0xNZlhFb2p5MjQx?=
 =?utf-8?B?cmgvVXBoeld2cEVadUdDS0RyYStidzd5bGxqN095UldCQi9qT3lqVjBidEwy?=
 =?utf-8?B?VTZ3UkdJSmpLVW5Pa0ZlQ24yUkVpaU9WaTlOMkRNN0tyM3lRN2Y0cDJEVDRM?=
 =?utf-8?B?WWRKbXd1SWtIaTRpL21YMmd4WWQybWo2T2p3YkRHc21HUEl1bjJpcUFUaCtn?=
 =?utf-8?B?THMxQWxTYVhIbEZlZFNYaTMxWnJ5aUJObTczWHdnQ1FWN1dLdWpjRitEaEpk?=
 =?utf-8?B?SXk2TzJpOEhPbzU2ZWhQZ3p3RFptRXJBOFBwcWhodS9RUDZ5NFA3eFZqQWJ5?=
 =?utf-8?B?YXA0KytnZFRxeUpCQXgveDhRNDN1MjN4eUFsbXJtUVlsSFFEaDV4UkNKMXBM?=
 =?utf-8?B?cDFyY0VORENLMy9aeS9jNnJVbm45VklncW9OelFlQUJ6aHUvVWtFVmRDZzd1?=
 =?utf-8?B?N1dTa3lSejBYZWt4QW9PT2JtWjlXS1NlbWZLYU9MN3RzU1JqMUI0Y2EvMTJo?=
 =?utf-8?B?SHR1cjFhQ2cyeXZQY1daRTBhQldlWG5WbHZ4K2JsZG1tL2FVQ2RZYWZyNElo?=
 =?utf-8?B?MzlGajllcGNObTA5eDQ4MmVIbDcrUzBPd0lZVVV3bHdrQkE1RDVHdXc3cHdo?=
 =?utf-8?B?OVFxaTBxMTB3TWZLbjZFVVdHek9qeVp1YW84ZTZSU240Y3crN2lzdmNkY0FD?=
 =?utf-8?B?WVZoaDBHUk5mQWk0MytBZVVlYTRTbmF4N3ZUUm1LTjBtQ1MwOWsxWmx2L3RH?=
 =?utf-8?B?eTNmQlhzd0laK2hEODVTVFJnbC82eFpQZWQ3ZXlqNk05WDFUM2VnM0lscllJ?=
 =?utf-8?B?RzVtUUJuS2RuRGpQa3U4Q2xMNFBoblNYUFppenR0OXJPTldhdnZ1UjNEaU9Q?=
 =?utf-8?B?YklSNElDTDMzdGY4SkRoWkp3SWJQdEV4cVZnNStqRjBOSmYrc2ZwRGdwT1l0?=
 =?utf-8?B?K0VaK1dCa0Y0elpZYklDcTdWZW9IbnpSdFppZ3hKbHZtbElYeFI0Sjhvczky?=
 =?utf-8?B?djZYVjlNQVBZNWxxQVpSN2JuNkE0OGhJdVh5QUFpbmJlYlNyeWloVWo4WEh2?=
 =?utf-8?B?MW1Qd2NSdTZjeXB5bWZUUmJ0S3ZRYXp2cFhuWkFiM1hQVEl4ZWJLcnB2TlR3?=
 =?utf-8?B?QjU4RHpKajUvVGd3VG0rc2VHUVdrUmw0MURGdklNOUZOZHI0cjNqVDRuTUFY?=
 =?utf-8?B?TWlYc01ieDZMVkFxeVBGaGI2RGtmL2FWWkVNVXZXaStSdDlEam5ZYkJjdHd1?=
 =?utf-8?B?UzgzQ3hOaDZTb0ZnOGFXMkRadEZYNnpOakx2dVhIeVhtbGRKMURySW03SjFm?=
 =?utf-8?B?RkwzYSs2QmI5dGRYa2o5MzNGREpIUVIybFZPeXozNlVrUXFnckxOdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5271.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b4acc4a-767d-459c-ca9b-08da147b253f
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2022 07:33:56.3723 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +hlSj/ZkeYlfQX6KuPs076AMBBwpxOK/YZnP0x6ozAKnFm0Rj0Exm1op05kllpxjdUI4U9cCyDXSWiUqXTrSGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1101MB2098
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
Cc: "Liu, Yi L" <yi.l.liu@intel.com>,
 "yi.y.sun@linux.intel.com" <yi.y.sun@linux.intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "peterx@redhat.com" <peterx@redhat.com>, "mst@redhat.com" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PiBGcm9tOiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPg0KPiBTZW50OiBXZWRuZXNk
YXksIE1hcmNoIDMwLCAyMDIyIDQ6MzcgUE0NCj4gT24gV2VkLCBNYXIgMzAsIDIwMjIgYXQgNDox
NiBQTSBUaWFuLCBLZXZpbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+IHdyb3RlOg0KPiA+DQo+ID4g
PiBGcm9tOiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPg0KPiA+ID4gU2VudDogVHVl
c2RheSwgTWFyY2ggMjksIDIwMjIgMTI6NTIgUE0NCj4gPiA+ID4NCj4gPiA+ID4+Pg0KPiA+ID4g
Pj4+IEN1cnJlbnRseSB0aGUgaW1wbGVtZW50YXRpb24gb2YgdnRkX2NlX2dldF9yaWQycGFzaWRf
ZW50cnkoKSBpcyBhbHNvDQo+ID4gPiA+Pj4gcHJvYmxlbWF0aWMuIEFjY29yZGluZyB0byBWVC1k
IHNwZWMsIFJJRDJQQVNJRCBmaWVsZCBpcyBlZmZlY3RpdmUgb25seQ0KPiA+ID4gPj4+IHdoZW4g
ZWNhcC5ycHMgaXMgdHJ1ZSBvdGhlcndpc2UgUEFTSUQjMCBpcyB1c2VkIGZvciBSSUQyUEFTSUQu
IEkNCj4gZGlkbid0DQo+ID4gPiA+Pj4gc2VlIGVjYXAucnBzIGlzIHNldCwgbmVpdGhlciBpcyBp
dCBjaGVja2VkIGluIHRoYXQgZnVuY3Rpb24uIEl0DQo+ID4gPiA+Pj4gd29ya3MgcG9zc2libHkN
Cj4gPiA+ID4+PiBqdXN0IGJlY2F1c2UgTGludXggY3VycmVudGx5IHByb2dyYW1zIDAgdG8gUklE
MlBBU0lELi4uDQo+ID4gPiA+Pg0KPiA+ID4gPj4gVGhpcyBzZWVtcyB0byBiZSBhbm90aGVyIGlz
c3VlIHNpbmNlIHRoZSBpbnRyb2R1Y3Rpb24gb2Ygc2NhbGFibGUgbW9kZS4NCj4gPiA+ID4NCj4g
PiA+ID4geWVzLiB0aGlzIGlzIG5vdCBpbnRyb2R1Y2VkIGluIHRoaXMgc2VyaWVzLiBUaGUgY3Vy
cmVudCBzY2FsYWJsZSBtb2RlDQo+ID4gPiA+IHZJT01NVSBzdXBwb3J0IHdhcyBmb2xsb3dpbmcg
My4wIHNwZWMsIHdoaWxlIFJQUyBpcyBhZGRlZCBpbiAzLjEuDQo+IE5lZWRzDQo+ID4gPiA+IHRv
IGJlIGZpeGVkLg0KPiA+ID4NCj4gPiA+DQo+ID4gPiBJbnRlcmVzdGluZywgc28gdGhpcyBpcyBt
b3JlIGNvbXBsaWNhdGVkIHdoZW4gZGVhbGluZyB3aXRoIG1pZ3JhdGlvbg0KPiA+ID4gY29tcGF0
aWJpbGl0eS4gU28gd2hhdCBJIHN1Z2dlc3QgaXMgcHJvYmFibHkgc29tZXRoaW5nIGxpa2U6DQo+
ID4gPg0KPiA+ID4gLWRldmljZSBpbnRlbC1pb21tdSx2ZXJzaW9uPSR2ZXJzaW9uDQo+ID4gPg0K
PiA+ID4gVGhlbiB3ZSBjYW4gbWFpbnRhaW4gbWlncmF0aW9uIGNvbXBhdGliaWxpdHkgY29ycmVj
dGx5LiBGb3IgMy4wIHdlIGNhbg0KPiA+ID4gZ28gd2l0aG91dCBSUFMgYW5kIDMuMSBhbmQgYWJv
dmUgd2UgbmVlZCB0byBpbXBsZW1lbnQgUlBTLg0KPiA+DQo+ID4gVGhpcyBpcyBzZW5zaWJsZS4g
UHJvYmFibHkgYSBuZXcgdmVyc2lvbiBudW1iZXIgaXMgY3JlYXRlZCBvbmx5IHdoZW4NCj4gPiBp
dCBicmVha3MgY29tcGF0aWJpbGl0eSB3aXRoIGFuIG9sZCB2ZXJzaW9uLCBpLmUuIG5vdCBuZWNl
c3NhcmlseSB0byBmb2xsb3cNCj4gPiBldmVyeSByZWxlYXNlIGZyb20gVlQtZCBzcGVjLiBJbiB0
aGlzIGNhc2Ugd2UgZGVmaW5pdGVseSBuZWVkIG9uZSBmcm9tDQo+ID4gMy4wIHRvIDMuMSsgZ2l2
ZW4gUklEMlBBU0lEIHdvcmtpbmcgb24gYSAzLjAgaW1wbGVtZW50YXRpb24gd2lsbA0KPiA+IHRy
aWdnZXIgYSByZXNlcnZlZCBmYXVsdCBkdWUgdG8gUlBTIG5vdCBzZXQgb24gYSAzLjEgaW1wbGVt
ZW50YXRpb24uDQo+IA0KPiAzLjAgc2hvdWxkIGJlIGZpbmUsIGJ1dCBJIG5lZWQgdG8gY2hlY2sg
d2hldGhlciB0aGVyZSdzIGFub3RoZXINCj4gZGlmZmVyZW5jZSBmb3IgUEFTSUQgbW9kZS4NCj4g
DQo+IEl0IHdvdWxkIGJlIGhlbHBmdWwgaWYgdGhlcmUncyBhIGNoYXB0ZXIgaW4gdGhlIHNwZWMg
dG8gZGVzY3JpYmUgdGhlDQo+IGRpZmZlcmVuY2Ugb2YgYmVoYXZpb3Vycy4NCg0KVGhlcmUgaXMg
YSBzZWN0aW9uIGNhbGxlZCAnUmV2aXNpb24gSGlzdG9yeScgaW4gdGhlIHN0YXJ0IG9mIHRoZSBW
VC1kIHNwZWMuDQpJdCB0YWxrcyBhYm91dCBjaGFuZ2VzIGluIGVhY2ggcmV2aXNpb24sIGUuZy46
DQotLQ0KICBKdW5lIDIwMTksIDMuMToNCg0KICBBZGRlZCBzdXBwb3J0IGZvciBSSUQtUEFTSUQg
Y2FwYWJpbGl0eSAoUlBTIGZpZWxkIGluIEVDQVBfUkVHKS4NCi0tDQoNCj4gDQo+ID4NCj4gPiA+
DQo+ID4gPiBTaW5jZSBtb3N0IG9mIHRoZSBhZHZhbmNlZCBmZWF0dXJlcyBoYXMgbm90IGJlZW4g
aW1wbGVtZW50ZWQsIHdlIG1heQ0KPiA+ID4gcHJvYmFibHkgc3RhcnQganVzdCBmcm9tIDMuNCAo
YXNzdW1pbmcgaXQncyB0aGUgbGF0ZXN0IHZlcnNpb24pLiBBbmQgYWxsDQo+ID4gPiBvZiB0aGUg
Zm9sbG93aW5nIGVmZm9ydCBzaG91bGQgYmUgZG9uZSBmb3IgMy40IGluIG9yZGVyIHRvIHByb2R1
Y3RpemUgaXQuDQo+ID4gPg0KPiA+DQo+ID4gQWdyZWUuIGJ0dyBpbiB5b3VyIHVuZGVyc3RhbmRp
bmcgaXMgaW50ZWwtaW9tbXUgaW4gYSBwcm9kdWN0aW9uIHF1YWxpdHkNCj4gPiBub3c/DQo+IA0K
PiBSZWQgSGF0IHN1cHBvcnRzIHZJT01NVSBmb3IgdGhlIGd1ZXN0IERQREsgcGF0aCBub3cuDQo+
IA0KPiBGb3Igc2NhbGFibGUtbW9kZSB3ZSBuZWVkIHRvIHNlZSBzb21lIHVzZSBjYXNlcyB0aGVu
IHdlIGNhbiBldmFsdWF0ZS4NCj4gdmlydGlvIFNWQSBjb3VsZCBiZSBhIHBvc3NpYmxlIHVzZSBj
YXNlLCBidXQgaXQgcmVxdWlyZXMgbW9yZSB3b3JrIGUuZw0KPiBQUlMgcXVldWUuDQoNClllcyBp
dCdzIG5vdCByZWFkeSBmb3IgZnVsbCBldmFsdWF0aW9uIHlldC4NCg0KVGhlIGN1cnJlbnQgc3Rh
dGUgYmVmb3JlIHlvdXIgY2hhbmdlIGlzIGV4YWN0bHkgZmVhdHVyZS1vbi1wYXIgd2l0aCB0aGUN
CmxlZ2FjeSBtb2RlLCBleGNlcHQgdXNpbmcgc2NhbGFibGUgZm9ybWF0IGluIGNlcnRhaW4gc3Ry
dWN0dXJlcy4gVGhhdCBhbG9uZQ0KaXMgbm90IHdvcnRoeSBvZiBhIGZvcm1hbCBldmFsdWF0aW9u
Lg0KDQo+IA0KPiA+IElmIG5vdCwgZG8gd2Ugd2FudCB0byBhcHBseSB0aGlzIHZlcnNpb24gc2No
ZW1lIG9ubHkgd2hlbiBpdA0KPiA+IHJlYWNoZXMgdGhlIHByb2R1Y3Rpb24gcXVhbGl0eSBvciBh
bHNvIGluIHRoZSBleHBlcmltZW50YWwgcGhhc2U/DQo+IA0KPiBZZXMuIEUuZyBpZiB3ZSB0aGlu
ayBzY2FsYWJsZSBtb2RlIGlzIG1hdHVyZSwgd2UgY2FuIGVuYWJsZSAzLjAuDQo+IA0KDQpOaWNl
IHRvIGtub3cuDQoNClRoYW5rcw0KS2V2aW4NCg==

