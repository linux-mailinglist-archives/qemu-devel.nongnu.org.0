Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 891BA56AF74
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 02:42:05 +0200 (CEST)
Received: from localhost ([::1]:39228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9c4K-0007ov-4K
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 20:42:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shirley.zhao@intel.com>)
 id 1o9c2o-00071t-4H
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 20:40:30 -0400
Received: from mga06b.intel.com ([134.134.136.31]:30404 helo=mga06.intel.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shirley.zhao@intel.com>)
 id 1o9c2k-0002os-RV
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 20:40:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657240827; x=1688776827;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xXwIsXoH4s35xZqsvfhQbOh+r1SuMzRNEwrlkSqXjuU=;
 b=cgJhKxO+0c+Vjb0+k0bB+Fuft0yymbIvTTeSiZiuev4499AblHSn3DHM
 IRwXfAZdNLMNOg9lLZc+8z8MD+rk6M7z4ohCtGvldnAr9fbWwjhPHoibI
 ZY/kHKzC2MPNcsJIOIvfxykMvgIKONPB7EeL5PQi8GX6d4Eu1lIWbfaXP
 OrPh+0IFG29Ak4MqibVET3K7yqABNSEwbWDOV/DEHqupBfb99V7vfNVEJ
 k2uTAl11QHe4uKDMDlKQ+MA4QPb7OHbFzcSbXBcOm6Zs5L4EZYZUj61/2
 C2bKUv8tK0CZoG1R6cc8R1vlEMqs4gv3ELGRg3C8Hd8limQzTUZnSP+0y w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10401"; a="345842280"
X-IronPort-AV: E=Sophos;i="5.92,253,1650956400"; d="scan'208";a="345842280"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2022 17:40:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,253,1650956400"; d="scan'208";a="593932745"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga002.jf.intel.com with ESMTP; 07 Jul 2022 17:40:14 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 7 Jul 2022 17:40:13 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 7 Jul 2022 17:40:13 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.102)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 7 Jul 2022 17:40:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iSEe/DwF493qCaiT/8Ja8VVtZGhUxuk1AssFQ0an3UoLq1eRKoAmLZ/h95sLx9WGIjDqkzwqIMH/7UI6nItMNYjPiKV/zWhdUloWhele0yQpGUgWupZlkMv7g6re/qqMdo/jG+Ce64lZc0k9KtofAIM/4hRVHCqx6qcuokDSlmaTzdjCOhko6RJYiqtW7utcCjrMlYocPTXNJstZZAzTy8OuYayplLU20vpO8/5vIY17KSq9Tby1fuLhc3lTcXxIIE+N8ImQ0Qy2sgZ5LV9sTy0vL9EfZen1HLwPOSGIin8U+4L9aZhnaW+ylbCfj7nIJD2gdKXktON/qil5K/OjEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xXwIsXoH4s35xZqsvfhQbOh+r1SuMzRNEwrlkSqXjuU=;
 b=TsEw2M0ndUsKteJy9vSlxHC7Ihp8tzGZ+hqsHapcsXrBJPMVXAh+IgCg7G+wgirSYnkE9XW8vKFWdXMNv6ZRrATqLa+yk2RcJYNcFASSnllIozDKEGnNiOYP0DUjbNVer7a1fYxky3PUvGdv2vPFd+qCXFTLVzwsKja557kDbD/2yxtcQkJmPfoBSvhYYmvfA54akFY29QG6dqFUuddAsvPVrfSHCzXZdplyObeqXdUVot+9VIMUb2ly0Tf6tI3Evw6G4xCsmIP5mg7WHJ7gs4UBh4auVy0q2NSpuoGsl1e2fGjqFoWV6YAhO3fUiZXZAGqEPIYJnTM9gcbFBMShjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4291.namprd11.prod.outlook.com (2603:10b6:a03:1c2::12)
 by DS7PR11MB6199.namprd11.prod.outlook.com (2603:10b6:8:99::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.20; Fri, 8 Jul 2022 00:40:06 +0000
Received: from BY5PR11MB4291.namprd11.prod.outlook.com
 ([fe80::1d37:60c1:cfd1:b192]) by BY5PR11MB4291.namprd11.prod.outlook.com
 ([fe80::1d37:60c1:cfd1:b192%4]) with mapi id 15.20.5417.016; Fri, 8 Jul 2022
 00:40:06 +0000
From: "Zhao, Shirley" <shirley.zhao@intel.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
CC: Thomas Huth <thuth@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "virtio-fs@redhat.com" <virtio-fs@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: RE: [Qemu] how to use viriofs in qemu without NUMA
Thread-Topic: [Qemu] how to use viriofs in qemu without NUMA
Thread-Index: AdiQCpaHJJlwUwhPRyeyoMxZnaNd+wAOQjsAAACJ1oAAAdWNIAABaX0AAIQUiAA=
Date: Fri, 8 Jul 2022 00:40:06 +0000
Message-ID: <BY5PR11MB4291BCA40054FB484003D4278D829@BY5PR11MB4291.namprd11.prod.outlook.com>
References: <BY5PR11MB42911D5BF55D9FAF501F64F68D819@BY5PR11MB4291.namprd11.prod.outlook.com>
 <3b6c8e16-3712-3402-3ab2-17bf53ec64a8@redhat.com> <YsPwbbiuxtkD6HSp@work-vm>
 <BY5PR11MB42912BFEA77F94B5B20D6F258D819@BY5PR11MB4291.namprd11.prod.outlook.com>
 <YsQGNk5hLv8b6DJS@work-vm>
In-Reply-To: <YsQGNk5hLv8b6DJS@work-vm>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.6.500.17
dlp-product: dlpe-windows
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 37d15ea2-057c-4bce-b5cf-08da607a678d
x-ms-traffictypediagnostic: DS7PR11MB6199:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yZtQks/PXq4FBfLJpESr0TauuolXBG+VsstuV7M8EvRU14STEumvqszdaAr053NBPCvnXyfdptPg50yJt2SMF7/gMPyh6KOGyd26ukyDdgTbNwBqIEKLP+RJ3wdW9aq+OnR2zVLI3odiFHtYxa6aA5SSND9n2Q++oMMBmtXAtSpEDg7fZS86q0as2J5gNv5oHlKdInmGsRdIagMXXChLVxoYExbmwtJ80PLRYh6vHbWiyMpAWu9jzBDzWY3xmxHKR3q7Wd3SCM34hHj/CV5K93hD7VjV5gvV1+bjdCeJEt1BWkZLHubprmwBQlyjbGvvFXH4V/UjZpUMEDbFAzBL2OzXQEDyH0scv0hPJNDQow3KI1QPe6wS96LK5sstfClyCQspeF4X8fkffHOdsmllT6GnbM5w6bMDJr9Gi5AXrqQLPW5kZOpIL7hXFMm8FA+RKJpmYL4xy72BQLaCEEyRzyce6S5xZPCidgVUGru4oODJzZZPT9X08LQFB0Z72kM8GW80KQjAcCVwQ0mqDtlrpmEfpsaMGWSljNCIUItfXbvwyxikUPI9HzJEwmnl9GvQbz6xYnu9SQ3E/Pz+ll5TVE4mq9i4wFoeV312IQ8qzB7HlY/IE/zHvK/twSYEUk82hbf6psxhvWFDkKipabNEHwwao2oYCmwk1EKV4vLNRXYZOGN4gnQl8Qadgmp/NwktrCw9xav/qte0b+foNBfZ3eiXT8QMQu1h39gbdHr0gqHXmbKLARY4+98xf53Lg/zSmBbMkmo7VgpG9IuhMhhuSQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4291.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(39860400002)(376002)(396003)(366004)(136003)(33656002)(41300700001)(966005)(478600001)(86362001)(38100700002)(6506007)(6916009)(7696005)(53546011)(71200400001)(2906002)(55016003)(316002)(122000001)(54906003)(82960400001)(8676002)(4326008)(66946007)(26005)(9686003)(5660300002)(66556008)(66476007)(66446008)(64756008)(186003)(52536014)(8936002)(38070700005)(83380400001)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d24wbERwRHE1NmhSTzZFb2JqM202aU1hTW1zSEtMR0xRVHIrdTBWRkozcExB?=
 =?utf-8?B?ZndzZUY2cm8vNXZ1Q3k0YVdPWCs3bk1PcVpHYUZZRHJSWjFPUWJqTlVlRUFW?=
 =?utf-8?B?Z1FLVm83NUVvSlVsV0dKVTFZU2xaaWVhaTZXUDUwcW1YbFpTZ0dIS0t3Mi9o?=
 =?utf-8?B?Lzc0bjVtMkNGNkFrZDVkZXBoYWVlUW5OcnF4UE1OblVrYk9Jb29md0FzQmpG?=
 =?utf-8?B?VWRaTHM3ZVZRWnZSbk52RDhaS3ByS2x3YWliQXlobnBHcFc5Nlo5RUhOUUhz?=
 =?utf-8?B?Qkp0dzdRcHFLZGkwaG1FSzE0ZUZsTFNPTmxkVmszL1FyaG9PK0hMRVFTM2lJ?=
 =?utf-8?B?Y3k0VmlXZTdONXFaQ0RLRTZjT1VkT0w2dUY1QlkyVmltYzZZNkt1RHBDM2Zy?=
 =?utf-8?B?YWQwUnZVZkJtZ1BFSHVJVEk2K1RMWnQvWWgwTm9NY3I4aVdnVXkvVnlTcnRa?=
 =?utf-8?B?SHE3TW9zZTNHVkJOWjB2eEJ4cloveG1Hc0IvWno5TTNFK1c0Nzlwa3dVZ3l6?=
 =?utf-8?B?cFFtTEg4djZqKzEra0VpY2JTVnlVRlJRWWE3N1VCMFZxa0xHNUxyWTd1Sm82?=
 =?utf-8?B?alVuNElnTi9WeUpMbERNczdNR29acE9iN3RzTHloWU8yNkZRSzIvbTdoOXBO?=
 =?utf-8?B?QWVyU2hMeWx1OERtVWRLTXFvQkxNdWlkK25jTU1ETnVyak9NbXJBMG5rOUln?=
 =?utf-8?B?K3F4b0owQ1hGbTdRRnozMDB6NEpFS2FaclJ1VGxwck9FWHJlNU14SEJYUlI4?=
 =?utf-8?B?am5iTFdIYnl4cVFhb1pxNTZYamx1MmdMUHZMY3JEVFNOTW5uVFRoc2xuQXFZ?=
 =?utf-8?B?elN2czUxbDBqRDhnUDdxYXdwTUlGbEVnZW5PckwwaTIyNmVtNG4zV1JGSTRy?=
 =?utf-8?B?eUJiejdqaXlsbWhsejdydSttOGRJdFVMbnZVaDFoWnIvTE9ZTzFMenAvai90?=
 =?utf-8?B?WUVkWWlYc09ycWVvblNMUFB1cTdUUlFmQjZrcEZldXdxdmhxL2JlTWV3dThB?=
 =?utf-8?B?bmJxek1Hakt0cnFHc3BXZVJJSmlaRXVTUDFjY0l4QVRTVDFuWkpPUE5sdFl1?=
 =?utf-8?B?ZjJjbS9JekxNWmJQWnI5amhpWGsrbVZSeUR4S3pGVHM1Y0lmRmk1MUNaOERu?=
 =?utf-8?B?bTZyVXFtZmdvb0tOR29uWUtkOWw2dVhHOHozaTlXZDVUcnp6MDNTaC9sYmgz?=
 =?utf-8?B?bldJYW5acUFJRFJNeVpGZjl6NUZhOUI2Tm5yMHVScDVNdk13amh4ZHpkU1lr?=
 =?utf-8?B?ajd0Tm1KNmNtZ1NXcjV5K2pvQVJEQ1FlaWdodnlDN2FDL1RzVHlmSWtvNVQr?=
 =?utf-8?B?aFBVS0FSdFJKV1h0Sy95WlA0aW82c2ZVZnNiTVlSUWNzR2FkekdOSWMxNDhZ?=
 =?utf-8?B?THg0RDlZb3lyWDJBblFNWlBIZE9teDlTN0lMWnUwM1dvRnc3OFhZdXlXK3I0?=
 =?utf-8?B?RlowaURWNlNmZmVDZVJ6SFd5bkJKWUJNZllVb1BaTjA2b1U2anIrbjZIa2sz?=
 =?utf-8?B?Y2ovYWlWWW1aNHpGbkNZOUE5MmVUTU1BYjVHWjIrMG5uMklnRFBYZmp3L2U0?=
 =?utf-8?B?UXpMYVVMMERZRXVtajk1UEJPcmhNbGxvdTI0UEFneFlOL2tiSWxwSmMwODJm?=
 =?utf-8?B?TStTVkVWbitnSytBQ0JuYTV4eitmYW1hYklWUlhMQzhOWGJ3VVB3K2IwbTdR?=
 =?utf-8?B?clhEQWZ1UmtJdVhLN1FoaUpIT3FLODA0VU5LSW40QTdqWHZCL3N3NjNubVB4?=
 =?utf-8?B?WFJENlRuZkJyald3ZGZ1SnlJck4zdVJUSytPM3JuWDBCQjFNZlJwWU5aYVdz?=
 =?utf-8?B?R1EyTW1rYnVGMnBjS1ExYVRwR0tQS0lDcGZVaGl3Q3d2dTRjRXZlWFU5M3Ji?=
 =?utf-8?B?WDFoWVBiQURNVGF2QjVERllzUndzdGlQTVFKbVFlcGZ0cGVNSUdZNHk3VFhn?=
 =?utf-8?B?UFhrWjJvQWdzd2ZRSlhZdG5DK2xBck9EUW52OWNXcHlKdDZQNStobG8xRCsy?=
 =?utf-8?B?QTFPWTRXK04yMzZmWjhPbWNOT1g2NC9zT2MyQVZWWFl1UnRQU1JvN241alA4?=
 =?utf-8?B?N3lPcjgzenJmYlQ0NWRVQnJvRkFBc2ZxUTZYa3ova0dlcVI1WjdjeExQaUZ1?=
 =?utf-8?Q?C2pV795Eszb4mPLDx9UInTaun?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4291.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37d15ea2-057c-4bce-b5cf-08da607a678d
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2022 00:40:06.5807 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gSOmemsK9DQyFPFA1rOafWeRXGVodq2gDmSP5slbnQHgoxd4tifNECym/C6H7DvkO2Jags+xESGLX1Wu4forLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6199
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.31;
 envelope-from=shirley.zhao@intel.com; helo=mga06.intel.com
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

WWVzLCB0aGUgcWVtdSB2ZXJzaW9uIGlzIHRvbyBvbGQuIA0KTXkgcHJldmlvdXMgcWVtdSB2ZXJz
aW9uIGlzIDQuMiwgYW5kIEkgdXBncmFkZWQgaXQgaW50byA2LjAsIGFuZCBpdCB3b3JrZWQgbm93
LiANClRoYW5rcyBhIGxvdC4gDQoNCi0gU2hpcmxleSANCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCkZyb206IERyLiBEYXZpZCBBbGFuIEdpbGJlcnQgPGRnaWxiZXJ0QHJlZGhhdC5jb20+
IA0KU2VudDogVHVlc2RheSwgSnVseSA1LCAyMDIyIDU6MzcgUE0NClRvOiBaaGFvLCBTaGlybGV5
IDxzaGlybGV5LnpoYW9AaW50ZWwuY29tPg0KQ2M6IFRob21hcyBIdXRoIDx0aHV0aEByZWRoYXQu
Y29tPjsgcWVtdS1kZXZlbEBub25nbnUub3JnOyB2aXJ0aW8tZnNAcmVkaGF0LmNvbTsgU3RlZmFu
IEhham5vY3ppIDxzdGVmYW5oYUByZWRoYXQuY29tPg0KU3ViamVjdDogUmU6IFtRZW11XSBob3cg
dG8gdXNlIHZpcmlvZnMgaW4gcWVtdSB3aXRob3V0IE5VTUENCg0KKiBaaGFvLCBTaGlybGV5IChz
aGlybGV5LnpoYW9AaW50ZWwuY29tKSB3cm90ZToNCj4gVGhhbmtzIGZvciB0aGUgaW5mb3JtYXRp
b24uIA0KPiBZZXMsIEkgYWxzbyBmb3VuZCB0aGUgbWVtb3J5IGJhY2tlbmQgb3B0aW9ucyBvbiBz
MzkweCwgYW5kIGFsc28gY29weSB0aGUgY29tbWFuZCB0byB4ODYsIGJ1dCBmYWlsZWQuIA0KPiAN
Cj4gVGhlIGZvbGxvd2luZyBpcyB0aGUgY29tbWFuZCB1c2VkIHRvIHN0YXJ0IHFlbXUgKyB2aXJ0
aW9mcyArIHVidW50dSAyMC4wNC4gDQo+IE9uZSBpcyB3b3JrZWQgd2VsbCB1c2luZyBOVU1BLCBh
bm90aGVyIG9uZSBpcyBmYWlsZWQgd2l0aG91dCBOVU1BLiANCj4gSXMgdGhlcmUgYW55dGhpbmcg
d3Jvbmc/IA0KPiANCj4gVGhlIHdvcmtlZCBvbmUgd2l0aCBOVU1BIG9wdGlvbnM6IA0KPiANCj4g
cWVtdS1zeXN0ZW0teDg2XzY0IC1NIHBjIC1jcHUgaG9zdCAtLWVuYWJsZS1rdm0gLXNtcCAyIC1t
IDRHIC1vYmplY3QgDQo+IG1lbW9yeS1iYWNrZW5kLWZpbGUsaWQ9bWVtLHNpemU9NEcsbWVtLXBh
dGg9L2Rldi9zaG0sc2hhcmU9b24gLW51bWEgDQo+IG5vZGUsbWVtZGV2PW1lbSAtY2hhcmRldiBz
b2NrZXQsaWQ9Y2hhcjAscGF0aD0vdG1wL3Zmc2Quc29jayAtZGV2aWNlIA0KPiB2aG9zdC11c2Vy
LWZzLXBjaSxxdWV1ZS1zaXplPTEwMjQsY2hhcmRldj1jaGFyMCx0YWc9bXlmcyAtY2hhcmRldiAN
Cj4gc3RkaW8sbXV4PW9uLGlkPW1vbiAtbW9uIGNoYXJkZXY9bW9uLG1vZGU9cmVhZGxpbmUgLWRl
dmljZSANCj4gdmlydGlvLXNlcmlhbC1wY2kgLWRldmljZSB2aXJ0Y29uc29sZSxjaGFyZGV2PW1v
biAtdmdhIG5vbmUgLWRpc3BsYXkgDQo+IG5vbmUgLWRyaXZlIGlmPXZpcnRpbyxmaWxlPXVidW50
dS5pbWcNCj4gDQo+IFRoZSBmYWlsZWQgb25lIHdpdGhvdXQgTlVNQSBvcHRpb25zOiANCj4gDQo+
IHFlbXUtc3lzdGVtLXg4Nl82NCAtTSBwYyAtY3B1IGhvc3QgLS1lbmFibGUta3ZtIC1zbXAgMiAt
bSA0RyAtb2JqZWN0IA0KPiBtZW1vcnktYmFja2VuZC1maWxlLGlkPW1lbSxzaXplPTRHLG1lbS1w
YXRoPS9kZXYvc2htLHNoYXJlPW9uIC1tYWNoaW5lIA0KPiBxMzUsbWVtb3J5LWJhY2tlbmQ9bWVt
IC1jaGFyZGV2IHNvY2tldCxpZD1jaGFyMCxwYXRoPS90bXAvdmZzZC5zb2NrIA0KPiAtZGV2aWNl
IHZob3N0LXVzZXItZnMtcGNpLHF1ZXVlLXNpemU9MTAyNCxjaGFyZGV2PWNoYXIwLHRhZz1teWZz
IA0KPiAtY2hhcmRldiBzdGRpbyxtdXg9b24saWQ9bW9uIC1tb24gY2hhcmRldj1tb24sbW9kZT1y
ZWFkbGluZSAtZGV2aWNlIA0KPiB2aXJ0aW8tc2VyaWFsLXBjaSAtZGV2aWNlIHZpcnRjb25zb2xl
LGNoYXJkZXY9bW9uIC12Z2Egbm9uZSAtZGlzcGxheSANCj4gbm9uZSAtZHJpdmUgaWY9dmlydGlv
LGZpbGU9dWJ1bnR1LmltZw0KDQpXaGF0IGVycm9yIGRpZCBpdCBnaXZlPw0KDQoyMC4wNCBpcyBx
dWl0ZSBvbGQsIHdoYXQgcWVtdSB2ZXJzaW9uIGlzIGl0Pw0KDQpJJ2QgaGF2ZSB0byBjaGVjayB3
aGVuIHRoZSBtZW1kZXY9IHdlbnQgaW4uDQoNCkRhdmUNCg0KPiANCj4gVGhhbmtzLiANCj4gLSBT
aGlybGV5DQo+IA0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBEci4gRGF2
aWQgQWxhbiBHaWxiZXJ0IDxkZ2lsYmVydEByZWRoYXQuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBK
dWx5IDUsIDIwMjIgNDowNCBQTQ0KPiBUbzogVGhvbWFzIEh1dGggPHRodXRoQHJlZGhhdC5jb20+
DQo+IENjOiBaaGFvLCBTaGlybGV5IDxzaGlybGV5LnpoYW9AaW50ZWwuY29tPjsgcWVtdS1kZXZl
bEBub25nbnUub3JnOyANCj4gdmlydGlvLWZzQHJlZGhhdC5jb207IFN0ZWZhbiBIYWpub2N6aSA8
c3RlZmFuaGFAcmVkaGF0LmNvbT4NCj4gU3ViamVjdDogUmU6IFtRZW11XSBob3cgdG8gdXNlIHZp
cmlvZnMgaW4gcWVtdSB3aXRob3V0IE5VTUENCj4gDQo+ICogVGhvbWFzIEh1dGggKHRodXRoQHJl
ZGhhdC5jb20pIHdyb3RlOg0KPiA+IE9uIDA1LzA3LzIwMjIgMDMuMDIsIFpoYW8sIFNoaXJsZXkg
d3JvdGU6DQo+ID4gPiBIaSwgYWxsLA0KPiA+ID4gDQo+ID4gPiBJIHdhbnQgdG8gdXNlIHZpcnRp
b2ZzIHRvIHNoYXJlIGZvbGRlciBiZXR3ZWVuIGhvc3QgYW5kIGd1ZXN0Lg0KPiA+ID4gDQo+ID4g
PiAgRnJvbSB0aGUgZ3VpZGUsIGl0IG11c3Qgc2V0IHRoZSBOVU1BIG5vZGUuDQo+ID4gPiBodHRw
czovL3ZpcnRpby1mcy5naXRsYWIuaW8vaG93dG8tcWVtdS5odG1sDQo+ID4gPiANCj4gPiA+IEJ1
dCBteSBndWVzdCBkb2VzbuKAmXQgc3VwcG9ydCBOVU1BLg0KPiA+ID4gDQo+ID4gPiBJcyB0aGVy
ZSBhbnkgZ3VpZGUgdG8gdXNlIHFlbXUgKyB2aXJ0aW9mcyB3aXRob3V0IE5VTUE/DQo+ID4gPiAN
Cj4gPiA+IE9yIGRvZXMgcWVtdSBoYXZlIGFueSBwbGFuIHRvIHN1cHBvcnQgaXQ/DQo+ID4gDQo+
ID4gIEhpIQ0KPiA+IA0KPiA+IEF0IGxlYXN0IG9uIHMzOTB4LCB5b3UgY2FuIGFsc28gc3BlY2lm
eSB0aGUgbWVtb3J5IGJhY2tlbmQgdmlhIHRoZSANCj4gPiAtbWFjaGluZSBvcHRpb24gaW5zdGVh
ZCBvZiB1c2luZyB0aGUgLW51bWEgb3B0aW9uLCBlLmcuOg0KPiA+IA0KPiA+ICBxZW11LXN5c3Rl
bS1zMzkweCAtbWFjaGluZSBtZW1vcnktYmFja2VuZD1tZW0gXA0KPiA+ICAgLW9iamVjdCBtZW1v
cnktYmFja2VuZC1maWxlLGlkPW1lbSwuLi4NCj4gPiANCj4gPiBOb3Qgc3VyZSB3aGV0aGVyIHRo
YXQgd29ya3Mgb24gb3RoZXIgYXJjaGl0ZWN0dXJlcywgdG9vLCB0aG91Z2guIA0KPiA+IFN0ZWZh
biwgRGF2aWQsIGRvIHlvdSBrbm93Pw0KPiANCj4gUmlnaHQsIHRoYXQncyB0aGUgd2F5IEkgZG8g
aXQgb24geDg2Lg0KPiBXZSB3cm90ZSB2aXJ0aW9mcyBiZWZvcmUgdGhlIG1lbW9yeS1iYWNrZW5k
IG9wdGlvbiBleGlzdGVkLCB3aGljaCBpcyB3aHkgdGhlIG9sZCBkb2NzIHRhbGsgYWJvdXQgdXNp
bmcgdGhlIE5VTUEgc3R1ZmYuDQo+IA0KPiBEYXZlDQo+IA0KPiA+ICBUaG9tYXMNCj4gPiANCj4g
LS0NCj4gRHIuIERhdmlkIEFsYW4gR2lsYmVydCAvIGRnaWxiZXJ0QHJlZGhhdC5jb20gLyBNYW5j
aGVzdGVyLCBVSw0KPiANCi0tDQpEci4gRGF2aWQgQWxhbiBHaWxiZXJ0IC8gZGdpbGJlcnRAcmVk
aGF0LmNvbSAvIE1hbmNoZXN0ZXIsIFVLDQoNCg==

