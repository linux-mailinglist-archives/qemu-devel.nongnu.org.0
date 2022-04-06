Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA0C4F52D7
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 05:43:30 +0200 (CEST)
Received: from localhost ([::1]:34880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbwZt-00069Z-18
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 23:43:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin.tian@intel.com>)
 id 1nbwXx-0004cd-WB
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 23:41:30 -0400
Received: from mga07.intel.com ([134.134.136.100]:21726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin.tian@intel.com>)
 id 1nbwXu-0000cS-FJ
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 23:41:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649216486; x=1680752486;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vgpJJj0uFS4iCy3MCbGV9B7QPHbKfUaorXA9YuDZZ3A=;
 b=An9htfNEJzh9QtAwwd/n4A2NFzTA2cd2wkv09eABlK0ay+WL//3ZHEwM
 VKcScInMe7EJDsljFJDyTbTzPG4hkQdd81Sj1oDN882K8RiqcdojpMKQ/
 iS2iT7RN8t4xnZEah0x6IzUwP/IDwQw5y9EWzczK3nKn/pC1UkgCIG4F5
 5LGiNm2pk7gNV3sOYYeaopuIZO9h5xtlACRVv7yWyllKB5lOu2AIptMR6
 7ixaM1kKAL4jTT7BHrvBXI7i88obPc5NFtNI9bBi4Fgneo7IZWIxDNCHn
 6LhxBpPb3nn9w8CZNqRYwhfoaSD4AUWIlQDsN4pWN5U8R89pEKvhJgYWM g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10308"; a="324111695"
X-IronPort-AV: E=Sophos;i="5.90,238,1643702400"; d="scan'208";a="324111695"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 20:41:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,238,1643702400"; d="scan'208";a="608729466"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by fmsmga008.fm.intel.com with ESMTP; 05 Apr 2022 20:41:22 -0700
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 5 Apr 2022 20:41:21 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 5 Apr 2022 20:41:21 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 5 Apr 2022 20:41:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AEbR4GuTZCxyRqmQjoLbtFX29VtIlB21jAtlNAWXVDzcwsJc/eEzRbA63oFq36ao82bVcU4fTdXk0amgKTQKlmZXY1SJxn5dYhblHkzk/GffzbZUXbqFomy4zbkqhwYHp7ZbCiqW/smy8CnueQMaXDHhBnoAYuIs8BnAc6W5PPKZF2N3pWICuK4Yby0JSkk90ITWNchVH+KQiAG3tbkwcFGUfPbG55qH4SEI+CoLMNYSZxoyWSWX4TvrVtla2dqWOcqvfMNS5r0GrFKpxIo7gHyJSX9BS0Hk3RCfuRdZwIL+K7iTWrcAaF5axWeGU8gZLzbjaUSZd0fXL1HfAXcMiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vgpJJj0uFS4iCy3MCbGV9B7QPHbKfUaorXA9YuDZZ3A=;
 b=Kqwnby9pHhmZc+w4kVYlbVuDRqDYbMKTIrdiSVZs9/1XH7cVUnARRFZ+hiLrGBsN1+B+qP6zEBiNgqz1G/tgLEACctTnXRqW7hvytegRiU+xX9S7klcrZ36rmgqJYsd7fasx2N/LgBqlQOCier4uF1s1igDx/F9xEFZ5VZY0tcqXkqVJrVqeBtRbGVz9xyQd/OUAn04QcWhoWMvEYZpnSaoZwxOjw3K2mZh/Xts3WFf9Ol+5vqSmp9awvhvH2a41lS9hFNH2Xwy7h6xOEjXDQysbNhzfJU56dFSM3Dbpk9st/3kp9s6He1U+PPY0czfHi/BcjaK8cwqVSF1lhCZQog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by SJ0PR11MB5150.namprd11.prod.outlook.com (2603:10b6:a03:2d4::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Wed, 6 Apr
 2022 03:41:14 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::c4ea:a404:b70b:e54e]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::c4ea:a404:b70b:e54e%7]) with mapi id 15.20.5123.031; Wed, 6 Apr 2022
 03:41:14 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Wang <jasowang@redhat.com>
Subject: RE: [PATCH V2 1/4] intel-iommu: don't warn guest errors when getting
 rid2pasid entry
Thread-Topic: [PATCH V2 1/4] intel-iommu: don't warn guest errors when getting
 rid2pasid entry
Thread-Index: AQHYPOo/2I7lnnOXbUWYdLsoevjaqqzOM3AAgAXpV4CAAGv2gIABTusAgAHHivCAAAmCAIAEpDTwgAYHWQCAAAGwMA==
Date: Wed, 6 Apr 2022 03:41:14 +0000
Message-ID: <BN9PR11MB5276067B9DB5F501CD4FB27B8CE79@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220321055429.10260-1-jasowang@redhat.com>
 <20220321055429.10260-2-jasowang@redhat.com>
 <BN9PR11MB52769DCA64DCF7B107FD244B8C199@BN9PR11MB5276.namprd11.prod.outlook.com>
 <CACGkMEsKJjnBb0qPM8oZvSHt326pMF8JCN8Fu1Qqjeu5pmdfMg@mail.gmail.com>
 <c5a0a8e8-b000-9efa-b334-93637724f49d@intel.com>
 <d04f5de3-9e66-9bdb-b268-b7b64c8489bd@redhat.com>
 <BN9PR11MB5276C1513B8DD829CC87EE898C1F9@BN9PR11MB5276.namprd11.prod.outlook.com>
 <CACGkMEt9J6Jcy7+EmgFm-JTTqd82ONt_aOYRsxnTke2ZNSaA7A@mail.gmail.com>
 <BL1PR11MB5271E2D6268489B5475111E78CE39@BL1PR11MB5271.namprd11.prod.outlook.com>
 <CACGkMEtVb8BPzF0T5srvznffW71CdVqyHUpVq9F1XQkcYyQWnA@mail.gmail.com>
In-Reply-To: <CACGkMEtVb8BPzF0T5srvznffW71CdVqyHUpVq9F1XQkcYyQWnA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bed7988f-2067-4893-0ab2-08da177f4ce6
x-ms-traffictypediagnostic: SJ0PR11MB5150:EE_
x-microsoft-antispam-prvs: <SJ0PR11MB5150DF73A28052B5ADE5FACA8CE79@SJ0PR11MB5150.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4AYvHw9myVYgK5TDyz/rzUOl6hjF6qfBhSij6Itf860TvV0HpcEZo9Uxdv3oEO3vCVzoWDSAT8PPBTGfWQrAcIiz6sYmQBaiRLsNaI/MVY4dozjfVZkUW6L5suHAHVRAl1EA+T+95DIqo7V2F9Ma/s9c8oPMJ8kEDbb6DYsFUIjWzp+gL/tJXzz/o2M1l0ajXZEvUSl3GiwLAdh1wwMF2OxdfdPdYTL7g4J2isuJtrZn+G7Q8uBYq0OUUzqi6YeqBVwN6Qv2nkwPvvPNn1rp46Ozmk6vF4asTCdPXFlFWzMlUtIv5t+8h2gKUZKWfWnAOzJQe2Deymn/1KHvQreX2HC8JbFhZznRpmjJ3FO7niBX1pLBDC01ESv1KJoSnvXjXZToas3e2q8g+P825HrzSxPwlPUcrh7k2UD4/DhxYOcLctRYCw6I3WEAALSZu9yxKjLMJB8nluC9iD97t83v0IQ0B64qmlXnishnEXE4k3vEEZnIcYvGW8FfQDdL5Hd/ruD8fOd7TA5pSUJ5ywTZi2UetjMAkIp8XeIkSpSOQ51RodjCCr+0ikXuT+fi6KumLN1R+M7da3X9yZexiIL4HtwyOmt5Biuq1Okol8aIH3Y3Lq4SHQP/iHzTXBR+MW1Xu9hPTb3Y2PiTheVGNTDZYXkagGVjF7CZ7lqM8djTtK/987BjERSqtqkEE0c7bT0INRQle0QSZ7SUd8MGa5e2zA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(55016003)(52536014)(8936002)(5660300002)(2906002)(33656002)(26005)(186003)(38070700005)(9686003)(122000001)(508600001)(7696005)(6506007)(76116006)(82960400001)(38100700002)(54906003)(53546011)(6916009)(71200400001)(66446008)(316002)(66946007)(66476007)(64756008)(66556008)(4326008)(86362001)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VTVOSDdVSGZsUGFBV1c0MlMzMWpIMHRLU0c5dlZyMHMzTklWTytNblhmVHpT?=
 =?utf-8?B?UXFTVzcxRTBGelVzMGlQNjVRd0luSnZrVHdlUW80TUZ4emZ1a1pDY29CVUN4?=
 =?utf-8?B?QlVFQUZvSVU3VVNLbWkwK1lOZmlQbnpUWHAzTTIzQS8xL1pYS3V4VWc2QkFU?=
 =?utf-8?B?RGY5M2xaU2pPNSsraEVjdEZRbmRoejY3SCtaWDFQWTB1a0xPN08yekozNllv?=
 =?utf-8?B?LzJlbmNXckZqVmdLSjlqZmlDNlFFV01yVk9xbVYzZnlrVTFSSitRNWh1em9H?=
 =?utf-8?B?MzB6YUowcks4OHgzTWRNRjZnb3VkQTljK0FIbXZ4VFlNYm5lMHUwWEtwUnpy?=
 =?utf-8?B?VEJITzM1Q0dUclF2SzdyLzg3ZHIwSE5VWWUyMnlFRmN1M3RwcWJ2R0JTUGUx?=
 =?utf-8?B?dEJaNklJRU1nTmNxR1g5cmswZXBsUFZDeTE3c29GbWsvZUljZGxRNnV6MG5N?=
 =?utf-8?B?aVhCSWpjcmdoYkJOd25uZnZ3MGhGZHc2QW9jOUN5eGUrQW9kUEJTa1BnWVpH?=
 =?utf-8?B?VWNyVjR2ODVnQkVOd0d5UmNFalB0V1BQV3NFcVh4NGxXay85NlJRUmFMS2lo?=
 =?utf-8?B?dUlES2dpRVdoM1JkSEVVelVFMm0wakpoVDAyN0VHb0NwdVB4QnNZTDJTbzlU?=
 =?utf-8?B?L0FXT2JsMzFzb3FFTzUzcEtpa2h1RFRxOWx4aGZSclZzMWhnSHdkK2F5SzU2?=
 =?utf-8?B?bThrbTZkMVdvc1FLSHVxZFJXV0NFRlhwaVBrazZqTDF6Nnp4U0N3aFlveE11?=
 =?utf-8?B?UVVZRDJGc1krWVNqZm5IbStPYzE1WTFlWE4xalgydWpQUVpkN3ZLWitRUCs1?=
 =?utf-8?B?N0FldUVCbGtwd1BGT0lVdjl3bnJGYVpsaFAzMW5wQlBRSEhGZEVzQXRObTlx?=
 =?utf-8?B?aGczUEZ2QVNGdHpVMzFxaEVSN21CU2FmQUJpZDhIdGc0YndmZWsrM0VySENW?=
 =?utf-8?B?ckJjMlZJMnUyTmNQRFR3QjhsazNrc3RTNUVELzJ3bnBOdUJENGNUbEhwZkRE?=
 =?utf-8?B?dnF5bCtkL1FWb0pCZlBscVVpYUFkMFdoZnE3Nm1PZHpBUnpvOVdiMWNlOFYw?=
 =?utf-8?B?UDBSZjczZklUMlgxOVNWM3BxV0pnYjVoT1hUTFFMVTFMeXJ4bzlMRWxRWmsy?=
 =?utf-8?B?TkV4Ym5qVjc0SmpTei9HMkNhMjNRKzBjMG9uVFY5MExOa1E3c09IM0kwUHE4?=
 =?utf-8?B?ODZLYTNNdUl5cXBhM0p5YllIcEozWVhPRzg2cC9GMDYySFdHNlgvRU9jQmtR?=
 =?utf-8?B?MmtKVnNmakw4d1BsYW9DRXNlMWxCRTY1ZTNoeFNPd1BHRnQwU2F1UVRmaGtl?=
 =?utf-8?B?dmZFNW1wbjJyM1JZeUxkMGpYZS9kMGdZSW5EM1BkSDMxM2JvMmxiOWlSSnRa?=
 =?utf-8?B?VG4wUDFmQlR2Y1E4NGhUZVVSdmxXWk9zYXYybXJFSWM3NkVDZ2JNc0tENmhF?=
 =?utf-8?B?N1BtZFRmd25PcFcrMkZ4SHdrS2N1bzdIYjlvSmt1Y3dreXFYZGhhVjUwN0ha?=
 =?utf-8?B?ZExST1UzNEVjVks4N0lYT3kzVEZzRGluRWNTYjNodSt1M0N1K0M5WDYzMnJv?=
 =?utf-8?B?eVczV2ppdCt5L3prMjVwRWJqaXZzVU5pOUN6bWNiYWZILzc0c1hNcCtSY1BX?=
 =?utf-8?B?cEF6aVFJVFRqRTdjSmNRT1lXQW9MRk1GM2ZxRFlPcnFESDVmaGJuOHN3SnIy?=
 =?utf-8?B?bXlmUzRDay9qY09tbVBvV0VtZ3lSSk1IM3pDWEhndHNpOW4wbHJadVVJWjJm?=
 =?utf-8?B?MUFObERlbGc0MElWM2lISlBzN0g1N2EvZzVoVDdaYUM1UHNwV1ZCQWNxWWV3?=
 =?utf-8?B?T1VDRkh1bURtN1hqNDdLekJ1TUlTMS9HL1lqbHJoUEIyWTBDOGRnb2Jma21j?=
 =?utf-8?B?Y3A5cndlSDljVnN2WmlRWmhaTmEyQ3FGZDZjSWNMeXIwUE1kUEQ1eEJTTkV6?=
 =?utf-8?B?S1dIU2t2SXM1bVFwUDVIVW5JbnhEZFNnV0E4a3Bic09HQVhUQUJNTVU5V1NJ?=
 =?utf-8?B?WGxXaEZmYWlPMGlRSlo5WW11VnQzOXVwMlQ2OGU2UkNJTnZKY1E3cFNRVmsx?=
 =?utf-8?B?RzBpQ2I5M3RkYlBDdGlheWIwQWVETmxMZHlYQVNLVGJFQnpaY1NrbWllZnZQ?=
 =?utf-8?B?RUh0TkNxQmZMSm5UTEJBWU5QKzNWcndsWWREUm1DRzdXQnRZZ3pPOHY5QlA5?=
 =?utf-8?B?QjQ3eGNNTnZwek9OOXIvVTFuRHdGcHFiYTBOaVhxQ0hqRnhtT1Y5L3ZrUkNp?=
 =?utf-8?B?SVQ0NjY3c09MZWgySkpvOTlmRVVQeE5lNnp1NWFORXZTQWpxRUVOWHh3Y0ls?=
 =?utf-8?B?QXMwUkZMT3hjRk5YQy9tWittK2laSUpZVFowRDU5Y0ltZERwTGZJQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bed7988f-2067-4893-0ab2-08da177f4ce6
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2022 03:41:14.3683 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KxMuyAKRjxiAKVtqw0nhTSe6fCZWUj7CcJc9NR/1SbR7Jg1KOoGGKHUWSUVJvHOdal6YGIBSacJTOY2UyvEJkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5150
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.100;
 envelope-from=kevin.tian@intel.com; helo=mga07.intel.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
YXksIEFwcmlsIDYsIDIwMjIgMTE6MzMgQU0NCj4gVG86IFRpYW4sIEtldmluIDxrZXZpbi50aWFu
QGludGVsLmNvbT4NCj4gQ2M6IExpdSwgWWkgTCA8eWkubC5saXVAaW50ZWwuY29tPjsgbXN0QHJl
ZGhhdC5jb207IHBldGVyeEByZWRoYXQuY29tOw0KPiB5aS55LnN1bkBsaW51eC5pbnRlbC5jb207
IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIFYyIDEvNF0gaW50
ZWwtaW9tbXU6IGRvbid0IHdhcm4gZ3Vlc3QgZXJyb3JzIHdoZW4NCj4gZ2V0dGluZyByaWQycGFz
aWQgZW50cnkNCj4gDQo+IE9uIFNhdCwgQXByIDIsIDIwMjIgYXQgMzozNCBQTSBUaWFuLCBLZXZp
biA8a2V2aW4udGlhbkBpbnRlbC5jb20+IHdyb3RlOg0KPiA+DQo+ID4gPiBGcm9tOiBKYXNvbiBX
YW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPg0KPiA+ID4gU2VudDogV2VkbmVzZGF5LCBNYXJjaCAz
MCwgMjAyMiA0OjM3IFBNDQo+ID4gPiBPbiBXZWQsIE1hciAzMCwgMjAyMiBhdCA0OjE2IFBNIFRp
YW4sIEtldmluIDxrZXZpbi50aWFuQGludGVsLmNvbT4NCj4gd3JvdGU6DQo+ID4gPiA+DQo+ID4g
PiA+ID4gRnJvbTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4NCj4gPiA+ID4gPiBT
ZW50OiBUdWVzZGF5LCBNYXJjaCAyOSwgMjAyMiAxMjo1MiBQTQ0KPiA+ID4gPiA+ID4NCj4gPiA+
ID4gPiA+Pj4NCj4gPiA+ID4gPiA+Pj4gQ3VycmVudGx5IHRoZSBpbXBsZW1lbnRhdGlvbiBvZiB2
dGRfY2VfZ2V0X3JpZDJwYXNpZF9lbnRyeSgpIGlzDQo+IGFsc28NCj4gPiA+ID4gPiA+Pj4gcHJv
YmxlbWF0aWMuIEFjY29yZGluZyB0byBWVC1kIHNwZWMsIFJJRDJQQVNJRCBmaWVsZCBpcyBlZmZl
Y3RpdmUNCj4gb25seQ0KPiA+ID4gPiA+ID4+PiB3aGVuIGVjYXAucnBzIGlzIHRydWUgb3RoZXJ3
aXNlIFBBU0lEIzAgaXMgdXNlZCBmb3IgUklEMlBBU0lELiBJDQo+ID4gPiBkaWRuJ3QNCj4gPiA+
ID4gPiA+Pj4gc2VlIGVjYXAucnBzIGlzIHNldCwgbmVpdGhlciBpcyBpdCBjaGVja2VkIGluIHRo
YXQgZnVuY3Rpb24uIEl0DQo+ID4gPiA+ID4gPj4+IHdvcmtzIHBvc3NpYmx5DQo+ID4gPiA+ID4g
Pj4+IGp1c3QgYmVjYXVzZSBMaW51eCBjdXJyZW50bHkgcHJvZ3JhbXMgMCB0byBSSUQyUEFTSUQu
Li4NCj4gPiA+ID4gPiA+Pg0KPiA+ID4gPiA+ID4+IFRoaXMgc2VlbXMgdG8gYmUgYW5vdGhlciBp
c3N1ZSBzaW5jZSB0aGUgaW50cm9kdWN0aW9uIG9mIHNjYWxhYmxlDQo+IG1vZGUuDQo+ID4gPiA+
ID4gPg0KPiA+ID4gPiA+ID4geWVzLiB0aGlzIGlzIG5vdCBpbnRyb2R1Y2VkIGluIHRoaXMgc2Vy
aWVzLiBUaGUgY3VycmVudCBzY2FsYWJsZSBtb2RlDQo+ID4gPiA+ID4gPiB2SU9NTVUgc3VwcG9y
dCB3YXMgZm9sbG93aW5nIDMuMCBzcGVjLCB3aGlsZSBSUFMgaXMgYWRkZWQgaW4gMy4xLg0KPiA+
ID4gTmVlZHMNCj4gPiA+ID4gPiA+IHRvIGJlIGZpeGVkLg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4N
Cj4gPiA+ID4gPiBJbnRlcmVzdGluZywgc28gdGhpcyBpcyBtb3JlIGNvbXBsaWNhdGVkIHdoZW4g
ZGVhbGluZyB3aXRoIG1pZ3JhdGlvbg0KPiA+ID4gPiA+IGNvbXBhdGliaWxpdHkuIFNvIHdoYXQg
SSBzdWdnZXN0IGlzIHByb2JhYmx5IHNvbWV0aGluZyBsaWtlOg0KPiA+ID4gPiA+DQo+ID4gPiA+
ID4gLWRldmljZSBpbnRlbC1pb21tdSx2ZXJzaW9uPSR2ZXJzaW9uDQo+ID4gPiA+ID4NCj4gPiA+
ID4gPiBUaGVuIHdlIGNhbiBtYWludGFpbiBtaWdyYXRpb24gY29tcGF0aWJpbGl0eSBjb3JyZWN0
bHkuIEZvciAzLjAgd2UNCj4gY2FuDQo+ID4gPiA+ID4gZ28gd2l0aG91dCBSUFMgYW5kIDMuMSBh
bmQgYWJvdmUgd2UgbmVlZCB0byBpbXBsZW1lbnQgUlBTLg0KPiA+ID4gPg0KPiA+ID4gPiBUaGlz
IGlzIHNlbnNpYmxlLiBQcm9iYWJseSBhIG5ldyB2ZXJzaW9uIG51bWJlciBpcyBjcmVhdGVkIG9u
bHkgd2hlbg0KPiA+ID4gPiBpdCBicmVha3MgY29tcGF0aWJpbGl0eSB3aXRoIGFuIG9sZCB2ZXJz
aW9uLCBpLmUuIG5vdCBuZWNlc3NhcmlseSB0byBmb2xsb3cNCj4gPiA+ID4gZXZlcnkgcmVsZWFz
ZSBmcm9tIFZULWQgc3BlYy4gSW4gdGhpcyBjYXNlIHdlIGRlZmluaXRlbHkgbmVlZCBvbmUgZnJv
bQ0KPiA+ID4gPiAzLjAgdG8gMy4xKyBnaXZlbiBSSUQyUEFTSUQgd29ya2luZyBvbiBhIDMuMCBp
bXBsZW1lbnRhdGlvbiB3aWxsDQo+ID4gPiA+IHRyaWdnZXIgYSByZXNlcnZlZCBmYXVsdCBkdWUg
dG8gUlBTIG5vdCBzZXQgb24gYSAzLjEgaW1wbGVtZW50YXRpb24uDQo+ID4gPg0KPiA+ID4gMy4w
IHNob3VsZCBiZSBmaW5lLCBidXQgSSBuZWVkIHRvIGNoZWNrIHdoZXRoZXIgdGhlcmUncyBhbm90
aGVyDQo+ID4gPiBkaWZmZXJlbmNlIGZvciBQQVNJRCBtb2RlLg0KPiA+ID4NCj4gPiA+IEl0IHdv
dWxkIGJlIGhlbHBmdWwgaWYgdGhlcmUncyBhIGNoYXB0ZXIgaW4gdGhlIHNwZWMgdG8gZGVzY3Jp
YmUgdGhlDQo+ID4gPiBkaWZmZXJlbmNlIG9mIGJlaGF2aW91cnMuDQo+ID4NCj4gPiBUaGVyZSBp
cyBhIHNlY3Rpb24gY2FsbGVkICdSZXZpc2lvbiBIaXN0b3J5JyBpbiB0aGUgc3RhcnQgb2YgdGhl
IFZULWQgc3BlYy4NCj4gPiBJdCB0YWxrcyBhYm91dCBjaGFuZ2VzIGluIGVhY2ggcmV2aXNpb24s
IGUuZy46DQo+ID4gLS0NCj4gPiAgIEp1bmUgMjAxOSwgMy4xOg0KPiA+DQo+ID4gICBBZGRlZCBz
dXBwb3J0IGZvciBSSUQtUEFTSUQgY2FwYWJpbGl0eSAoUlBTIGZpZWxkIGluIEVDQVBfUkVHKS4N
Cj4gDQo+IEdvb2QgdG8ga25vdyB0aGF0LCBkb2VzIGl0IG1lYW4sIGV4Y2VwdCBmb3IgdGhpcyBy
ZXZpc2lvbiBoaXN0b3J5LCBhbGwNCj4gdGhlIG90aGVyIHNlbWFudGljcyBrZWVwIGJhY2t3YXJk
IGNvbXBhdGliaWxpdHkgYWNyb3NzIHRoZSB2ZXJzaW9uPw0KDQpZZXMgYW5kIGlmIHlvdSBmaW5k
IGFueXRoaW5nIG5vdCBjbGFyaWZpZWQgcHJvcGVybHkgSSBjYW4gaGVscCBmb3J3YXJkDQp0byB0
aGUgc3BlYyBvd25lci4NCg0KVGhhbmtzDQpLZXZpbg0K

