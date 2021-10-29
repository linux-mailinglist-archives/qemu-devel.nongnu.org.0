Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B4343F89C
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 10:11:09 +0200 (CEST)
Received: from localhost ([::1]:56714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgMyi-00027a-Gq
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 04:11:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mgMwb-0001Sy-FV
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 04:08:57 -0400
Received: from mga14.intel.com ([192.55.52.115]:16521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mgMwX-0002ey-L1
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 04:08:56 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10151"; a="230882352"
X-IronPort-AV: E=Sophos;i="5.87,191,1631602800"; d="scan'208";a="230882352"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2021 01:08:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,191,1631602800"; d="scan'208";a="530326482"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga001.jf.intel.com with ESMTP; 29 Oct 2021 01:08:46 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 29 Oct 2021 01:08:45 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 29 Oct 2021 01:08:45 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Fri, 29 Oct 2021 01:08:45 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.44) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Fri, 29 Oct 2021 01:08:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SRYK11xO14i88J+LQqXCgqfY7s8OKJWo9nu/jIwOoIieRqUaZt6XfLM4l9e3VGCbCKa/Hrk4zgXAmpqVAK/pUnFUN/7pCQLvAdpQ/DH+b/keu3ZUhSbwbH8yGPRoKF38pFrLuIjUcEDHHkcwEF4MOsGHrsPbtRk3/ano//Dvlr42yZSomOS6DN/vkq/NXjWw1LqnxlzwFRbYQXkyu5jseY+7MuaY57ItvBSzPbCwJDY+JR47nvtcAv7Yrw+rQLyWumT/4DsVNkMfVuHoNzAuHNS5YbJ/DwQ7eI8PyWNbq3krMnIMNAvnljBYXkXJe/SB7Ld/rDCP011HD+2Ez7yHuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5FlecpHMMvUvAu4Q1upj8nqY3aC6fzlyhE8DepdWdsA=;
 b=QpL/nqsOHJxA+Uw9uOD24wib+Qt/jPdPw+6G+aJZkjEfAYi2Sg82vozpZSokZD1VunyMH1H0+W3FleM+f7dNgJdBmjeh5eqY9thSDHxPH4E8JaysBNL8foDUXjsLUnpjVx2vlsKE+GBo46/YgOXa2P37EujgUfmYpFVX3RZHqTOfQpri9hMPBW6uJt3PVYI+Cv1a9dstdbdJ68bYZZEXfwh1K7NXxYXVW6kN37GbHRrjRiKs06JOeM7ewtx+p4O+awFJV3j1gZ8c6LunAgq5AkCrESBgWCCkn61dXOe42Eui7GtCwE4sjLxksbSjy5dJRzz6FTRfsgYrA4sSGxSA8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5FlecpHMMvUvAu4Q1upj8nqY3aC6fzlyhE8DepdWdsA=;
 b=vXzz1f0nf3PLlNc+DQTk9X1tQ1M83R7pi4Mjm3NtDASlWrqPJ+mBFyZIflP3GnbkisMrejMhHOCsmgknyQkokAPOnDdkftSq9Sdv6J0MdME9lUXDKamLMTNvU/FuIBjL/Mr1qwC89UbbygR27vp+FQ5Qt2MFP9zVnH0Rvg+DRZs=
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by MWHPR1101MB2368.namprd11.prod.outlook.com (2603:10b6:300:7a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.20; Fri, 29 Oct
 2021 08:08:43 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::359f:549e:18bf:fa8b]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::359f:549e:18bf:fa8b%4]) with mapi id 15.20.4649.015; Fri, 29 Oct 2021
 08:08:43 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>
Subject: RE: [PATCH V5 1/3] net/filter: Optimize transfer protocol for
 filter-mirror/redirector
Thread-Topic: [PATCH V5 1/3] net/filter: Optimize transfer protocol for
 filter-mirror/redirector
Thread-Index: AQHXy9x7gE+VGPrLuEuUpJeh4vPmyavpTZSAgABPWuA=
Date: Fri, 29 Oct 2021 08:08:43 +0000
Message-ID: <MWHPR11MB0031A0311824C3DF060B64E39B879@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20211028090556.3168043-1-chen.zhang@intel.com>
 <20211028090556.3168043-2-chen.zhang@intel.com>
 <c603b048-1cee-1396-811d-8be857aa932b@redhat.com>
In-Reply-To: <c603b048-1cee-1396-811d-8be857aa932b@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.200.16
dlp-reaction: no-action
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8b5846f7-b1b1-478b-ad57-08d99ab3535f
x-ms-traffictypediagnostic: MWHPR1101MB2368:
x-microsoft-antispam-prvs: <MWHPR1101MB2368D1DB1818DFCE93FE0B039B879@MWHPR1101MB2368.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1201;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: I0J9pYFXAQz27kmQ+Kz/qWsW3o+M4U263hDPe8vqpvSSI5+t217ZZI5XnErZBewFzDZrsjf/gzaEZ7WuQXOIQ46FDYVlIBgxO4i5pmS1YNZDEmLcOIJFSXcHcUsRX/SP2cP4tkYtw6R9ajSBdmqSrFhbEoLrTXADLYQU+xqzVoX36wFOATvXfhqPJp4HEwh4QDc3SlFdl/vmHi8G+GZeo3ZJx/dAJOxNEWuqijCOdqoCubNhks4l5Dmz17Sh1NE54z9c+GiUG9Mr8X/SEYoxtdhNXgagF7T/Cb7zymBPNPw4r3iCm2v5W94KGqwfRdI77ugmf4Wo9hSb4l6DA0Orn/V/Y0JXapq4HPdmZv+5qvWFg0FMJ0rJwrvB2t8Z6Tjxtaj6dZNpfUuPmNDmKCvmtotjRvwj0NfdCF0JsRFFzhCnFh5zh/zdJulD+EI1xD9tXN3TdZsxVxoEbWy5uNQ6Jahb20q8RQu3S2/3YB1il20GMVk6fbOgYUUBphqCqOFadNRaNX3LVX8MJ5xkkEg2XD5DnlVYCyOJwH9mqgQcIGZDiI3fKExSY2Kf16m0Rgojyy4iF3U/aKBzhpCxnLy2FcLXdylM+7r4Ii/eItm8yBvMr8sYWTKrnZuU70rkzYQDmNtw0xkn8uPT4ijFz3WuO5MhAh+csJZzPLZ43IPx5b2KWnB9sZ6t8ENwnfAgFv8dVU/1HE24PN5kuykAVMZLPQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(8936002)(55016002)(82960400001)(4326008)(9686003)(33656002)(66446008)(6916009)(316002)(122000001)(2906002)(26005)(54906003)(86362001)(6506007)(66946007)(71200400001)(186003)(76116006)(508600001)(66556008)(66476007)(38100700002)(5660300002)(8676002)(7696005)(83380400001)(52536014)(53546011)(38070700005)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-2022-jp?B?RzNITE9NWlNNRkljQ3RnTDBxUnJvOXJGWUlXOHQza2hkclFDYnp6azQ5?=
 =?iso-2022-jp?B?VGJNQkVrMjlQNWVKbkN6ckRpOForUzBmek42Y1labmh5RE5oYUVwaWhx?=
 =?iso-2022-jp?B?WkRyZ1liUmtWQXVObWJCUTlXUlB5NHZYMzZ6VVZaRE9LUDFZbHNKcVB3?=
 =?iso-2022-jp?B?MXVkN25ubkUzZHJEK2Z1UTRZU3lvYlNOMW5LcEdCMzZYeW5pT3IvaTl4?=
 =?iso-2022-jp?B?MHlQOFg2dmMvanlOamRQZzRyUkRzbWlUeGwvWEk4QWF1cDdQTnRLeHQ1?=
 =?iso-2022-jp?B?MVc1R1JRZUkxUGNGak9nbzNWSnp1WGJHWnJzTHg5UTFFRVBRMHAydTgw?=
 =?iso-2022-jp?B?MDVoS2J1c2hmSG1kck1UMUUzRXVFYjNqVkxsZk1obXlBUGRMMHo2MHN4?=
 =?iso-2022-jp?B?NktHOUF1SDgrZXhTRE1veVhET1dZdFpsN2s2VUlHK01mWWNMa1VPWnpv?=
 =?iso-2022-jp?B?UFlZbjltWUE3a2pwcHpNUmtDdnc2WnlnMk5rS2NBbzJxbUJsbUt3K1Iw?=
 =?iso-2022-jp?B?OEwzQ0E1T01NREt5b2xIWUp2TVA4SmNZOGNkTjZZUmNMRUs1Q2FOQ09J?=
 =?iso-2022-jp?B?cEowc0c2ZWNlRWZxcjBlZ0NoWHhmaHk5cmRHSnB1RUV6dVRiVEtNVHZi?=
 =?iso-2022-jp?B?UldkbmRCRTBxQmZDMnh0SUxGbjJEakowdG9OZnF6RHk4c3pwMWVQNEM5?=
 =?iso-2022-jp?B?cTIvdzVXcFlmaHZtKzdlN1MrWjhTcldybWxrT1VWeUx3dTJUMWZ6NFRh?=
 =?iso-2022-jp?B?RC81bFFtcVIweXRlTXBxM01SVU5WaUpQNnRDbjh0aDRISm1rN2xtL080?=
 =?iso-2022-jp?B?aWlXZVhUeHpLVGlUT2ZtRDlHSjU5Q21KUDdoSmdHWDk1S2FnS0FWcENK?=
 =?iso-2022-jp?B?MHluZmRtakFUZWN2RkU1R0REUm5Zc05JdGJnOUFyeHFTNk0vN28wWUtM?=
 =?iso-2022-jp?B?TUo4MXU1bkF2dEMxOEJTVmRpMldwTFNsMlRiRXVhQzNHY3V0YU9XWkVn?=
 =?iso-2022-jp?B?aG5Ycm1CMkRyZFQyckJPV21xKzhhTkpFeVZWWlB0dlVqUmYvdFBjV0ZJ?=
 =?iso-2022-jp?B?UzJBRU1NMUlOWXIzSzNQVzdoN0U1NEFJNVI0SE9ETmVQaXBPeFRldisv?=
 =?iso-2022-jp?B?QlJEY3p0YjluZ0xFVU1CeTFHdU9IeXJIQktNUy8wTW03QUNlSkkraENI?=
 =?iso-2022-jp?B?Y2d0dFRBMWdaRFIwKzJsQldNWVRZdUw3cno3Wnhmeis4aDh0YWE1Ymc3?=
 =?iso-2022-jp?B?YTMvMFZEaCs5NzA5S0QzV0tjc3ZRcUhRVFFSdnZMdHZ5UWJrSVV4UnR2?=
 =?iso-2022-jp?B?ZG4ydkMvdlA2SVh5ejhVd1VOb0JpemI1ZVNXcENMQTBZcjdpOU0vWmkr?=
 =?iso-2022-jp?B?ckRYSHA5cDFuNXdDVHR4ZEd4Y3plL2JGdmJuUlFVbXZtZHZIcHN1UXNN?=
 =?iso-2022-jp?B?TGhpWnpzSUFVTnNXVjJrRXFXaTVkQndjMiswN2VpSXR3QjQvVWRmVU5a?=
 =?iso-2022-jp?B?MVFyOFV3eS9LQTdGKzNnc0swQU5lMlc1UUdZZm41N2ozTnViTlZZVXlh?=
 =?iso-2022-jp?B?SUtaWFRDaVZLbTYzNWk2YmUyVWFxRFNvZW5Cc09MSENRZVQ0c1dVRFBX?=
 =?iso-2022-jp?B?VDUzcFVjVGxscnZuVTN6bmZHdEJxbjdUVUN5cVhjMzEwcFY0cE9DRWlP?=
 =?iso-2022-jp?B?RkRJSUh2YjhYekRpZmpyc2FQdDJOdjRwa3l1Yndzd25KcTZLQ3RqZDJP?=
 =?iso-2022-jp?B?WXpSMjRqck9ObUkrMkhGVU1tbXY0WmlaS3dOQkQxTXkyZXN5aTIvYjZV?=
 =?iso-2022-jp?B?bGoxamVIczFUOVVBSXhadjZxVkRsS1d0M0RJLzduVmUvamxWL0lvdVg2?=
 =?iso-2022-jp?B?VGV6ZURCUmh1SStQcmFqUm9PQUlyN3lqd1pNZXl1SVNJWjE2aGJ3bDlF?=
 =?iso-2022-jp?B?THdkVjRpUGh4Z0g5VmYycFY3bWVOTzlBQzBjbG9GbEV4MEtMY21mVkl1?=
 =?iso-2022-jp?B?NlB2TzI3YWFvREY4RW9qVlprZnJlSU00bllSMHBEcElWbTZhMEJYa1ds?=
 =?iso-2022-jp?B?aWFrTGQybUEvWDlGaUNaVWJtYUFhRUFlMnExMGRTakNLWklDN1RYWjhH?=
 =?iso-2022-jp?B?eGx6YVhsNTBwR2hxR1psaWFJbXk4Sk9nc0l6M3RITHBFZmxkTzlKY2lh?=
 =?iso-2022-jp?B?RzhzTTRkM1ViZENIU2tTbWJqWHh0NDI4dWR3U1NLOW43eFh4SXRHcXVU?=
 =?iso-2022-jp?B?WGVKMFlaWXVqREh1V1BXc25WTndMS1hEWnJWU1hZZzFPdFBHc0pzVVcz?=
 =?iso-2022-jp?B?SG5TcXMzYmh4eGh6djBIekNvUCt0WXJIWmhPWXg2RXhWc0FBZHJUTmFD?=
 =?iso-2022-jp?B?K255aWc9?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b5846f7-b1b1-478b-ad57-08d99ab3535f
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2021 08:08:43.7219 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VrWXxHoW0M2fSFsGKf1RT/Ge6WzQ+AmmKSaQPbIgfeXl6sZiHG1yT8Uoh4LWYJXGXU3PIVTGQpowtuoz+UloYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2368
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.115; envelope-from=chen.zhang@intel.com;
 helo=mga14.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-dev <qemu-devel@nongnu.org>, Li Zhijian <lizhijian@cn.fujitsu.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Jason Wang <jasowang@redhat.com>
> Sent: Friday, October 29, 2021 11:11 AM
> To: Zhang, Chen <chen.zhang@intel.com>
> Cc: qemu-dev <qemu-devel@nongnu.org>; Markus Armbruster
> <armbru@redhat.com>; Li Zhijian <lizhijian@cn.fujitsu.com>
> Subject: Re: [PATCH V5 1/3] net/filter: Optimize transfer protocol for fi=
lter-
> mirror/redirector
>=20
>=20
> =1B$B:_=1B(B 2021/10/28 =1B$B2<8a=1B(B5:05, Zhang Chen =1B$B<LF;=1B(B:
> > Make the vnet header a necessary part of filter transfer protocol.
> > It make other modules(like another filter-redirector,colo-compare...)
> > know how to parse net packet correctly. If local device is not the
> > virtio-net-pci, vnet_hdr_len will be 0.
> >
> > Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> > ---
> >   net/filter-mirror.c | 34 ++++++++++++++++------------------
> >   1 file changed, 16 insertions(+), 18 deletions(-)
> >
> > diff --git a/net/filter-mirror.c b/net/filter-mirror.c index
> > f20240cc9f..24d3e498e9 100644
> > --- a/net/filter-mirror.c
> > +++ b/net/filter-mirror.c
> > @@ -39,6 +39,7 @@ struct MirrorState {
> >       CharBackend chr_in;
> >       CharBackend chr_out;
> >       SocketReadState rs;
> > +    /* Keep compatibility for the management layer */
> >       bool vnet_hdr;
> >   };
> >
> > @@ -48,7 +49,7 @@ static int filter_send(MirrorState *s,
> >   {
> >       NetFilterState *nf =3D NETFILTER(s);
> >       int ret =3D 0;
> > -    ssize_t size =3D 0;
> > +    ssize_t size =3D 0, vnet_hdr_len =3D 0;
> >       uint32_t len =3D 0;
> >       char *buf;
> >
> > @@ -63,21 +64,18 @@ static int filter_send(MirrorState *s,
> >           goto err;
> >       }
> >
> > -    if (s->vnet_hdr) {
> > -        /*
> > -         * If vnet_hdr =3D on, we send vnet header len to make other
> > -         * module(like colo-compare) know how to parse net
> > -         * packet correctly.
> > -         */
> > -        ssize_t vnet_hdr_len;
> > -
> > -        vnet_hdr_len =3D nf->netdev->vnet_hdr_len;
> > +    /*
> > +     * The vnet header is the necessary part of filter transfer protoc=
ol.
> > +     * It make other module(like colo-compare) know how to parse net
> > +     * packet correctly. If device is not the virtio-net-pci,
> > +     * vnet_hdr_len will be 0.
> > +     */
> > +    vnet_hdr_len =3D nf->netdev->vnet_hdr_len;
> >
> > -        len =3D htonl(vnet_hdr_len);
> > -        ret =3D qemu_chr_fe_write_all(&s->chr_out, (uint8_t *)&len,
> sizeof(len));
> > -        if (ret !=3D sizeof(len)) {
> > -            goto err;
> > -        }
> > +    len =3D htonl(vnet_hdr_len);
> > +    ret =3D qemu_chr_fe_write_all(&s->chr_out, (uint8_t *)&len,
> > + sizeof(len));
>=20
>=20
> I wonder if we need to introduce new parameter, e.g force_vnet_hdr here,
> then we can always send vnet_hdr when it is enabled.
>=20
> Otherwise the "vnet_hdr_support" seems meaningless.

Yes, Current "vnet_hdr_support"  default enabled, and vnet_hdr_len already =
forced from attached nf->netdev.
Maybe we can introduce a new parameter "force_no_vnet_hdr" here to make the=
 vnet_hdr_len always keep 0.
If you think OK, I will update it in next version.

Thanks
Chen

>=20
> Thanks
>=20
>=20
> > +    if (ret !=3D sizeof(len)) {
> > +        goto err;
> >       }
> >
> >       buf =3D g_malloc(size);
> > @@ -252,7 +250,7 @@ static void filter_redirector_setup(NetFilterState
> *nf, Error **errp)
> >           }
> >       }
> >
> > -    net_socket_rs_init(&s->rs, redirector_rs_finalize, s->vnet_hdr);
> > +    net_socket_rs_init(&s->rs, redirector_rs_finalize, true);
> >
> >       if (s->indev) {
> >           chr =3D qemu_chr_find(s->indev); @@ -406,14 +404,14 @@ static
> > void filter_mirror_init(Object *obj)
> >   {
> >       MirrorState *s =3D FILTER_MIRROR(obj);
> >
> > -    s->vnet_hdr =3D false;
> > +    s->vnet_hdr =3D true;
> >   }
> >
> >   static void filter_redirector_init(Object *obj)
> >   {
> >       MirrorState *s =3D FILTER_REDIRECTOR(obj);
> >
> > -    s->vnet_hdr =3D false;
> > +    s->vnet_hdr =3D true;
> >   }
> >
> >   static void filter_mirror_fini(Object *obj)


