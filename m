Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 525E858A5BE
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 07:59:29 +0200 (CEST)
Received: from localhost ([::1]:45684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJqMq-0007OC-3A
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 01:59:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1oJqKT-0005nm-2u
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 01:57:01 -0400
Received: from mga01.intel.com ([192.55.52.88]:50495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1oJqKP-0007aO-O6
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 01:57:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659679017; x=1691215017;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cP/SjygI3zDlHXR1nuvavSEng1yP/6IKdfBXenU5cR4=;
 b=hm3omx7QrvCzX+pm1eUWbeuZ0V0QqNtp/pIZfNSGpF/hHI8BHFGE23xL
 pqKeuUGa8+5G70wDGF7D7I0yg8UdKf/3ntMnQYa5MktZdK5gJ50RSZeQb
 B0AaKDExJ0IIErHYyJDXvvzsNIbJRMQbyVvMY7HhK5IsI20MK43HtAWyC
 N3S39G+k6CxwKQcF1/gF9jHfAlqh5lKZgbb1TZkNJMZ+b8z+7NeJXIz9q
 E+52UFamkvcMUdgz1sOMdz0xM8CYV6Dsiy37OPX6M+fm7s5aBsVaURGY0
 LBxm4rtX4PhtcHHqLirNOFcxvTEe2MDzns6rzUeoZtX3chEA+tlZ887rg w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10429"; a="316016268"
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; d="scan'208";a="316016268"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2022 22:56:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; d="scan'208";a="849231768"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP; 04 Aug 2022 22:56:52 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 4 Aug 2022 22:56:51 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 4 Aug 2022 22:56:51 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Thu, 4 Aug 2022 22:56:51 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Thu, 4 Aug 2022 22:56:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mNtTZZgQSwsttf18BjNAZrvIjnqc/1npPsKlHPGDA3WGCOqUy9ZV4SSa3MNE3UjhTPCVmFolzkGs/ggC+UxNoLLIhIPhgRBjZGrpEvbURLPpuDERWLXDGzC52Aw1uuWgARmgUwU5HkdMqci4wcpldc0J6AZIdcGu1iZtt34vkfr9yoBCyd6VkJo2Q4r2XyQ6mizFNMiVJHKh7KJJYiyidHSKFSLl1UnXIM4yp3gga+HJkt+QlSu52cfuhq4ox+8YzK4DpIRLepepk7Ju2eoVAtEB/sSZ3bwty7G0dxlkasgTXCUcI8XMTDJDMVGW5iJt42pEOSHp3Z0o6OgKOeUx4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cP/SjygI3zDlHXR1nuvavSEng1yP/6IKdfBXenU5cR4=;
 b=bMzMi2VUEvmZDTKjWj4dIz7RlrrOMCnmVxHrMnlwAeLQjmI7yPTsG+2xhks+f6uCkMWKAmNBNHy7YgLGIZE0VC+11nEHtr+isTjZcC5wCDxr/dpe7ShHwon8yaM2lxxycy6Lm/wGDX+YOp0Ad2PNISfgPRr/agYkF5IcmZA34HQaT+6bYiaIG8pVr27g2JSu4PkueCIZO7s4BNQ5WaZ432iluQCNKHMLA9jqItx6orh3hnD1aEdXENICpWbn9UgeNH+avnv+fR2XmTy1MHPhPYqGjqt8c87wcb6lrAUFsgUIFDCV6ESdaR8RVZQLuI4icLyPb2/XHgt8vnbHTjBRaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by DM6PR11MB3019.namprd11.prod.outlook.com (2603:10b6:5:67::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.12; Fri, 5 Aug
 2022 05:56:50 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::e849:1316:6e38:6eee]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::e849:1316:6e38:6eee%7]) with mapi id 15.20.5504.016; Fri, 5 Aug 2022
 05:56:49 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>
CC: Peter Maydell <peter.maydell@linaro.org>, Li Zhijian
 <lizhijian@fujitsu.com>, qemu-dev <qemu-devel@nongnu.org>
Subject: RE: [PATCH] net/colo.c: Fix the pointer issuse reported by Coverity.
Thread-Topic: [PATCH] net/colo.c: Fix the pointer issuse reported by Coverity.
Thread-Index: AQHYpklRU0QZL7ruVEObzo84ffvE1K2frz6AgAAg59A=
Date: Fri, 5 Aug 2022 05:56:49 +0000
Message-ID: <MWHPR11MB00313220A2758E74C1098E539B9E9@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20220802080948.37426-1-chen.zhang@intel.com>
 <CACGkMEs4Ypb+WcKTX-YqxrRUJW65fWokuBaMAkBp9eznXNDGTw@mail.gmail.com>
In-Reply-To: <CACGkMEs4Ypb+WcKTX-YqxrRUJW65fWokuBaMAkBp9eznXNDGTw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 42cf4597-f07a-4646-8419-08da76a749e9
x-ms-traffictypediagnostic: DM6PR11MB3019:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BV3cVQl92Yx8nWzadD7W46nq1IMbfr1lf92aI6UNFsK961BgQNHtANrCDWfsFI+TRgkMsfQ6VHVN3Y0hcptIubYGhDpNVLGogVKfXgm6mfpbfkWIrN1r3yU1XJeCLzOSldaXxjitY/fyoX7d63Qc1L76M+e8Vx3Hxt0DxVR/xvaWqU5vEtMXItVgf7EBuobZu0S8FonTWQ4o0nm7G83eLJUqb8MuhQQndif2kWtIkM7IFQs4X6QLKKTXU3IB8+MiaKo8bbA6YN39uYc/KPtqTDYoZPLynQA/R1kYUIqaYW+X4xQTYMH1e4SHxfk/CSq6117PDPClL/cUqiThqquRP7Pj3o2L80b6j/jh4cWS9JaZe+BAM487iERKLnjRzBQSAXTRD6fgWiSefCA2wilsNkF+uG7PIuYbSXzJnNi0Zn4Y6XJrsDSUcoZBbfd+JY96Hwp/X/G+K71ufL7BAWJfTfexdp22hqdp8VhwCQdAugOnHL5DrwFeUNBgxT6b5nDINH9Xt297GfO9z6ArJzeMxI5Ps54mbkwXKUsRdO7BKrG8LRutObv3DkYvkZ3oKxXo6kDTKzrWrkquHYwAizunEKv698s7OxTIJuWTJMt4ks2NeqHlBR//saYyO2LalIlK6y5DidxX616zM870lIgBLaCzyF//tl+xYePno0RB0Ns4mu6pIA4qQoOIl0xu/WWDVvBSiQFg4ynKwJLkKPuQyzUp+WatbAkEVtP9B/BLUdthTVts4tSZnVZOXImoelwog9/u4gMK9M5tMic9ObT5eQ9iSUSp4Wrxf+TNAsebm5LJNztTjlo9DPEeIXlh6rPJ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(396003)(366004)(136003)(376002)(346002)(66476007)(4326008)(8676002)(64756008)(66446008)(66556008)(66946007)(55016003)(5660300002)(76116006)(33656002)(478600001)(316002)(6916009)(54906003)(71200400001)(2906002)(38100700002)(82960400001)(38070700005)(41300700001)(7696005)(6506007)(122000001)(53546011)(86362001)(26005)(9686003)(8936002)(52536014)(186003)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VmI1dUtSK043WHN0Yk1XSlY5dlNyZllET1lsa3pKNWJISDZleXpVMDlKMmJS?=
 =?utf-8?B?SnpGUEtSUVdGVWFkeGhyYzRqZ2NmNHVPN0lCM1ZMbXBjd2FFN1ozeUVQNGRy?=
 =?utf-8?B?L3hGZTFvSEUyczMxT3oyVXlGL2V4M0JMcUQ4ZzVXQVpBRFg5WGJGcVFlU3dl?=
 =?utf-8?B?b2tGRE9YM1ZpRXI3V0pBZlVsSk5HMlZ4VmZYLzFqb3Rocjk1MERDcGtCbkQ0?=
 =?utf-8?B?TjdOUDAwQ01mN3hwZ3JlcmMyK1pDZlZPbkx3K1I4T21xR3JpeER3a3N4aW1W?=
 =?utf-8?B?REhwOHlWK29IMWpIemtWRURuQnozbzUvRXpYMVJvS3lDclFkNlRoa2hLOVNj?=
 =?utf-8?B?aGM0ZmQ1cnBsM0RsbCs2Nk5rT0d2dFVJZUdaNGgzZ1ZCK21KS1hKZDJ3YkZZ?=
 =?utf-8?B?Zmh1T2JzK01KU3NrN3VnWDlBM01MckdZTXEyQjZhMEUrcW5EZStsVnRKL1lE?=
 =?utf-8?B?T05aT0hvQlpZY2UwSVJnSldRcHpyM1p0RWRWMzdnTlZ1Q2pSWEl1TVZzS0ZS?=
 =?utf-8?B?eDV5bzl4WkRBNGVmQlNTc29vaGRSRC9jMXhZak5sTEo5WmRWNmg3endDeTZT?=
 =?utf-8?B?b2xHeWlPSjJNdm1LdXlWLytLdlBLK0JnOE9oN204WVRXYlE5TEk3aFp1S1Bu?=
 =?utf-8?B?d1NIdEl6WE1VMkRXbVNVVVdob2l6cXB1MktWYlg5YkZNMVZRSjB3Qmc3WTJi?=
 =?utf-8?B?by80S2xxYmxHSDQ1Uk9qdWdld0dsa2xWS3M3RHdvZ0kwTThrNlBhOXdnQXRE?=
 =?utf-8?B?NFZWV1NuNVROU3hOU1Q0SEcwdWJKOTFQR1ZaZkQ2Z1Z6T3Flako4MDVQWlVH?=
 =?utf-8?B?S3pNdUZCTU5Jamg4TWdKN0xHM0xGV2tkNUhNeDB0dVNtQ3dHbHZmZ25lMmJt?=
 =?utf-8?B?bCtLbUdIRm9ZUUQyemNLUlF0cjl2dXhBTTUxU2h1ZGxlaWR1eDl3ODMwQy9t?=
 =?utf-8?B?d3g0a0QzRXh2YVJCeXkzV2FKYVpLeW9JQUt2K1ZKek5DK2sreEJOL1A5dHFH?=
 =?utf-8?B?VjNVVW5lTmowSHVlTFdCbDhmWXlhU2w5Mm9IN2V6Zy9hVndPTmkra2daaTMz?=
 =?utf-8?B?Nk5MVHMzVzl4V2lvZEdxN09pTDl1RHIvTk4vdGhOZjhsaXY2ZExBaVpzb0NZ?=
 =?utf-8?B?L3RPSG5NdUlIQ1g5ZHB2TGhJZERXMk9rcXcyU09qLzhwZEF3cGJmSEFvYWxi?=
 =?utf-8?B?UGZqSVVmZ0dFZkR0VHV1S1RjWVJqMVdSbjdGZnQxZ0xvVE8vSUVlanhUc2RP?=
 =?utf-8?B?M1M5bFAwS3dETkszbW1Jc1h0Uk5WMVlqKzdnKzNLOXAxLzJmamd1VlVYREg2?=
 =?utf-8?B?dm0xd2tZd2xTYUtYZk5jK1NMSGdSM2ttQ2hwUFBkVjlYeWNMc1REamQ3RUMz?=
 =?utf-8?B?R2xkUkJ3aC9OdnJuR2hQb3VOVjNHS1RPbHpGM1VGanEzQ2Z0bm4wSStCc2FW?=
 =?utf-8?B?L2ljZlZCNjNWZUEySWNKMDJWN0xPLzlaTWpUazZjRlNZZFNHRFlWS1g0Y0ZZ?=
 =?utf-8?B?ZlNmc3Y4aWlVbkZaNEpiN2F3eUQvWDR5cWxmSitBRVlVVWZzR1VYaUhsM3o4?=
 =?utf-8?B?VWs3RTBvSUhDWnVnUmwxbkVSdFVrTDZaaHJPakluSHVNZVhUV0tVdDRLRHpV?=
 =?utf-8?B?MHV3RHdKWjRlaHBadkJFRlVndWgrVHBqMENCWDV5WHBkeHNVTmJZaFF1VXAz?=
 =?utf-8?B?Zy94UGhXOE5MSmpNY3llN1Y4THNzcjlRZ1NKQnQwQ280NzJqdGd5MWxOT1Ji?=
 =?utf-8?B?SWsyNlhyVEpFRWRZNFBRSCtoNnh4Y3pScmdieTRReUxLdWNYTllpbkpOVTQr?=
 =?utf-8?B?WlM2NjFHclBCdFU4dDVtSUFBWVpGVG9yNkZlZmZ5bE0xem92NERneCtoWWh1?=
 =?utf-8?B?Q0NHSkhiZTZHd3F4eXI3QVFWTStQTG4rNHh2a1ZVZmMreGpLeWlkUmxsOHRw?=
 =?utf-8?B?SG9peGpBTy9BRmpCUm12MjlqbHkxR3dIVk10R1VsS1EwV0k2bG1uUzFtK0Fs?=
 =?utf-8?B?UXhoS0EyLzBqZ0tzeERYMlg5aEJreXJHQnVuRTBTeGNubEZRMWVvb0crUUc4?=
 =?utf-8?B?UFBRY3NlajlWcVZIOURienhmWWpXL1pLNVEvdHhVbVlsaHN6OGxWemUwb3Fy?=
 =?utf-8?Q?GxVFwNmPaBSJc0vQZtPQ1IFdQ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42cf4597-f07a-4646-8419-08da76a749e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2022 05:56:49.7846 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n1lG2kPuvr4Dlbhndbsj9Fy+ODVRHEqiDetypQBjFBqY9QUHdoGN7jJChNKBrZbBf/KlE1I9FO8Wzoyz/RduvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3019
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.88; envelope-from=chen.zhang@intel.com;
 helo=mga01.intel.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFzb24gV2FuZyA8amFz
b3dhbmdAcmVkaGF0LmNvbT4NCj4gU2VudDogRnJpZGF5LCBBdWd1c3QgNSwgMjAyMiAxMTo0NiBB
TQ0KPiBUbzogWmhhbmcsIENoZW4gPGNoZW4uemhhbmdAaW50ZWwuY29tPg0KPiBDYzogUGV0ZXIg
TWF5ZGVsbCA8cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnPjsgTGkgWmhpamlhbg0KPiA8bGl6aGlq
aWFuQGZ1aml0c3UuY29tPjsgcWVtdS1kZXYgPHFlbXUtZGV2ZWxAbm9uZ251Lm9yZz4NCj4gU3Vi
amVjdDogUmU6IFtQQVRDSF0gbmV0L2NvbG8uYzogRml4IHRoZSBwb2ludGVyIGlzc3VzZSByZXBv
cnRlZCBieSBDb3Zlcml0eS4NCj4gDQo+IE9uIFR1ZSwgQXVnIDIsIDIwMjIgYXQgNDoyNCBQTSBa
aGFuZyBDaGVuIDxjaGVuLnpoYW5nQGludGVsLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBXaGVuIGVu
YWJsZSB0aGUgdmlydGlvLW5ldC1wY2ksIGd1ZXN0IG5ldHdvcmsgcGFja2V0IHdpbGwgbG9hZCB0
aGUNCj4gPiB2bmV0X2hkci4gSW4gQ09MTyBzdGF0dXMsIHRoZSBwcmltYXJ5IFZNJ3MgbmV0d29y
ayBwYWNrZXQgbWF5YmUNCj4gPiByZWRpcmVjdCB0byBhbm90aGVyIFZNLCBpdCBuZWVkIGZpbHRl
ci1yZWRpcmVjdCBlbmFibGUgdGhlIHZuZXRfaGRyDQo+ID4gZmxhZyBhdCB0aGUgc2FtZSB0aW1l
LCBDT0xPLXByb3h5IHdpbGwgY29ycmVjdGx5IHBhcnNlIHRoZSBvcmlnaW5hbA0KPiA+IG5ldHdv
cmsgcGFja2V0LiBJZiBoYXZlIGFueSBtaXNjb25maWd1cmF0aW9uIGhlcmUsIHRoZSB2bmV0X2hk
cl9sZW4gaXMNCj4gPiB3cm9uZyBmb3IgcGFyc2UgdGhlIHBhY2tldCwgdGhlIGRhdGErb2Zmc2V0
IHdpbGwgcG9pbnQgdG8gd3JvbmcgcGxhY2UuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBaaGFu
ZyBDaGVuIDxjaGVuLnpoYW5nQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAgbmV0L2NvbG8uYyB8
IDE2ICsrKysrKysrKystLS0tLS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMo
KyksIDYgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvbmV0L2NvbG8uYyBiL25l
dC9jb2xvLmMNCj4gPiBpbmRleCA2YjBmZjU2MmFkLi5kZmIxNWI0YzE0IDEwMDY0NA0KPiA+IC0t
LSBhL25ldC9jb2xvLmMNCj4gPiArKysgYi9uZXQvY29sby5jDQo+ID4gQEAgLTQ0LDIxICs0NCwy
NSBAQCBpbnQgcGFyc2VfcGFja2V0X2Vhcmx5KFBhY2tldCAqcGt0KSAgew0KPiA+ICAgICAgaW50
IG5ldHdvcmtfbGVuZ3RoOw0KPiA+ICAgICAgc3RhdGljIGNvbnN0IHVpbnQ4X3QgdmxhbltdID0g
ezB4ODEsIDB4MDB9Ow0KPiA+IC0gICAgdWludDhfdCAqZGF0YSA9IHBrdC0+ZGF0YSArIHBrdC0+
dm5ldF9oZHJfbGVuOw0KPiA+ICsgICAgdWludDhfdCAqZGF0YSA9IHBrdC0+ZGF0YTsNCj4gPiAg
ICAgIHVpbnQxNl90IGwzX3Byb3RvOw0KPiA+ICAgICAgc3NpemVfdCBsMmhkcl9sZW47DQo+ID4N
Cj4gPiAgICAgIGlmIChkYXRhID09IE5VTEwpIHsNCj4gDQo+IEkgd29uZGVyIHVuZGVyIHdoaWNo
IGNhc2Ugd2UgY2FuIHNlZSBkYXRhID09IE5VTEw/DQo+IA0KPiBBRkFJSywgZGF0YSBpcyBlaXRo
ZXIgZHVwIHZpYSBwYWNrZXRfbmV3KCkgb3IgYXNzaWduZWQgdG8gYSBwb2ludGVyIHRvIHRoZSBi
dWYNCj4gaW4gcGFja2V0X25ld19ub2NvcHkoKS4NCg0KWWVzLCB5b3UgYXJlIHJpZ2h0LiBJIGp1
c3QgY2hlY2tlZCBpdCBmb3IgaGludCBvZiBidWdzLg0KRG8geW91IHRoaW5rIG5vIG5lZWQgdG8g
ZG8gaXQ/DQoNClRoYW5rcw0KQ2hlbg0KDQo+IA0KPiBUaGFua3MNCj4gDQo+ID4gLSAgICAgICAg
dHJhY2VfY29sb19wcm94eV9tYWluX3ZuZXRfaW5mbygiVGhpcyBwYWNrZXQgaXMgbm90IHBhcnNl
ZCBjb3JyZWN0bHksDQo+ICINCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICJwa3QtPnZuZXRfaGRyX2xlbiIsIHBrdC0+dm5ldF9oZHJfbGVuKTsNCj4gPiArICAg
ICAgICB0cmFjZV9jb2xvX3Byb3h5X21haW4oIkNPTE8tcHJveHkgZ290IE5VTEwgZGF0YSBwYWNr
ZXQgIik7DQo+ID4gICAgICAgICAgcmV0dXJuIDE7DQo+ID4gICAgICB9DQo+ID4gLSAgICBsMmhk
cl9sZW4gPSBldGhfZ2V0X2wyX2hkcl9sZW5ndGgoZGF0YSk7DQo+ID4NCj4gPiAtICAgIGlmIChw
a3QtPnNpemUgPCBFVEhfSExFTiArIHBrdC0+dm5ldF9oZHJfbGVuKSB7DQo+ID4gLSAgICAgICAg
dHJhY2VfY29sb19wcm94eV9tYWluKCJwa3QtPnNpemUgPCBFVEhfSExFTiIpOw0KPiA+ICsgICAg
LyogQ2hlY2sgdGhlIHJlY2VpdmVkIHZuZXRfaGRyX2xlbiB0aGVuIGFkZCB0aGUgb2Zmc2V0ICov
DQo+ID4gKyAgICBpZiAocGt0LT5zaXplIDwgc2l6ZW9mKHN0cnVjdCBldGhfaGVhZGVyKSArIHNp
emVvZihzdHJ1Y3Qgdmxhbl9oZWFkZXIpDQo+ID4gKyAgICAgICAgKyBwa3QtPnZuZXRfaGRyX2xl
bikgew0KPiA+ICsgICAgICAgIHRyYWNlX2NvbG9fcHJveHlfbWFpbl92bmV0X2luZm8oIlRoaXMg
cGFja2V0IG1heSBiZSBsb2FkIHdyb25nICINCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICJwa3QtPnZuZXRfaGRyX2xlbiIsDQo+ID4gKyBwa3QtPnZuZXRfaGRy
X2xlbik7DQo+ID4gICAgICAgICAgcmV0dXJuIDE7DQo+ID4gICAgICB9DQo+ID4gKyAgICBkYXRh
ICs9IHBrdC0+dm5ldF9oZHJfbGVuOw0KPiA+ICsNCj4gPiArICAgIGwyaGRyX2xlbiA9IGV0aF9n
ZXRfbDJfaGRyX2xlbmd0aChkYXRhKTsNCj4gPg0KPiA+ICAgICAgLyoNCj4gPiAgICAgICAqIFRP
RE86IHN1cHBvcnQgdmxhbi4NCj4gPiAtLQ0KPiA+IDIuMjUuMQ0KPiA+DQoNCg==

