Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 149B758D4E5
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 09:53:58 +0200 (CEST)
Received: from localhost ([::1]:48184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLK3p-0000jH-73
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 03:53:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ling1.xu@intel.com>)
 id 1oLK1e-00062W-Ux
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 03:51:44 -0400
Received: from mga01.intel.com ([192.55.52.88]:45359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ling1.xu@intel.com>)
 id 1oLK1b-000293-6B
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 03:51:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660031499; x=1691567499;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iGO60+gtu22SoVNkOG33MhB863Uzpn8bpLg0h6vaOQw=;
 b=dptopShKjjNWm/eF34lIZZyyFGlp1F/1dxKobLrIfhnr+z9GqKj1JDZB
 thCBUP0fmbMDqQ++wnyilMQ/voFW1u3fC4nV7qoV2WYh5TKgcCkloJYrI
 ziTZBGSG2sKphd7rKKXbLwu9XHiYQtXvLaKvRHQhuUlF9sgSelRYFwYKr
 YQVkTOGLl19G5qR1oi6lqc4EDoyZwmMzILPlq4JCwu9BXjfZXzd3Kvr9I
 J6+EUcksF4Jbz4e9yyy2ftSNKTuaQ3gf449BoeJ2BDzshdVbRl3sjxkZO
 r3JzKwxpXG5e7fTMvwUNTeFrwu+zG3JDbOp3RX4ARb7kvG3ysfBfDFd5a g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10433"; a="316706217"
X-IronPort-AV: E=Sophos;i="5.93,223,1654585200"; d="scan'208";a="316706217"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2022 00:51:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,223,1654585200"; d="scan'208";a="604671267"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP; 09 Aug 2022 00:51:27 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 9 Aug 2022 00:51:27 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 9 Aug 2022 00:51:26 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Tue, 9 Aug 2022 00:51:26 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Tue, 9 Aug 2022 00:51:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NIuFZVja2tW9Qonhs676gfKQWj0fDsXT0DoTbWYgyO1SlGMtRrA4WhMNbI9SSzEamOGRvgBsvxWbe3mOToGKyUrNmnepm9LlPCpiP7SPXqANHz8SHSzL2oGyZbGApF8UFcPtNp8ORUYCwQ+/+0gU8mlkSy1+/IbhbtuUl4WIicIyxy82gbG7mb+xLmX0DzFRzMYxje2qpEwpJzP9NCfAOJWI+pUiB9dP1/ixphg0MaOKbSdGpEKVdj6NSZMDr82tT8luFEV8mFvMW/tHMP0xW3zdPqx6A3DccFuOaKKEyqIqrLPjmkvDkx/ziVDvXao8t6RZ4TWvQ7+9LPa5K9y3tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q5I8zCnuOJcIynseGyWvdRoluWyykZ0iR04oiFRvcsw=;
 b=hsW+PjsdRRXDTYmZj7CzynEuqsj42aGF5RVJ1moTwUpefJGS21sLmePC9O+G/Azn14eFVX8u1eoblOYu9NY5c1MK3xR0l5qxZ+GhLMKwarL6+m2AXwIRWjG2imIqJ2wwH5FwVH4IxEwcVpZMdDG3nqkRtRyO0bnQ0A6zUuZoEWyhZj8tiTSbeNF5Je1UOhB1Em09PL2vTVG7JSDSZ2/PxRzTW9lDSOUVuSoeN1Z3+R9GqE5C2ycuBjXfsVgG36/ZFO5oCOXSsjGr7ZVXlquygCCz2LG4mNd7ewUVLaVkH/8IP38gyBYfYQgbZI28wFSUJVzIjEbbf1vuGI9sTY8m4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5465.namprd11.prod.outlook.com (2603:10b6:408:11e::18)
 by DM4PR11MB5536.namprd11.prod.outlook.com (2603:10b6:5:39b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Tue, 9 Aug
 2022 07:51:24 +0000
Received: from BN9PR11MB5465.namprd11.prod.outlook.com
 ([fe80::e9b7:c3cd:e2d3:6d99]) by BN9PR11MB5465.namprd11.prod.outlook.com
 ([fe80::e9b7:c3cd:e2d3:6d99%3]) with mapi id 15.20.5504.020; Tue, 9 Aug 2022
 07:51:24 +0000
From: "Xu, Ling1" <ling1.xu@intel.com>
To: "quintela@redhat.com" <quintela@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "dgilbert@redhat.com"
 <dgilbert@redhat.com>, "Zhao, Zhou" <zhou.zhao@intel.com>, "Jin, Jun I"
 <jun.i.jin@intel.com>
Subject: RE: [PATCH v3 1/2] Update AVX512 support for xbzrle_encode_buffer
 function
Thread-Topic: [PATCH v3 1/2] Update AVX512 support for xbzrle_encode_buffer
 function
Thread-Index: AQHYqvtR83p2CXICBUa41v3J1Hp0xa2k+z13gAEx6xA=
Date: Tue, 9 Aug 2022 07:51:24 +0000
Message-ID: <BN9PR11MB54652B6666F9C3DA62E02D53D1629@BN9PR11MB5465.namprd11.prod.outlook.com>
References: <20220808074837.1484760-1-ling1.xu@intel.com>
 <20220808074837.1484760-2-ling1.xu@intel.com> <87r11qnakk.fsf@secure.mitica>
In-Reply-To: <87r11qnakk.fsf@secure.mitica>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.500.17
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aaedaff0-56dd-446c-2f73-08da79dbf4f8
x-ms-traffictypediagnostic: DM4PR11MB5536:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: okqmMBgQqE8IzFDiWyHpv3FCCmlfRYgdBdK3E1S4b+hra9XMvqsib2Tr+ofEqJq0MH9qs3lzLmXBOjpQPwpXDQWuderpPW7VjY1iOEY6Q1/L6fBqrJhNCb/Z6XOm725ZjfXKvZq+xQ2I2B7UZ8XrsjG2ZyfLwfub9MTflTp2/a6oHHPekckM2iYDcdVaIWW0JsODvYnwsWUhIt9bd8nISeR+VhocOblKuHswE3RCHlbEv/aWu9iZjlN8y9/7dVvdJ7Yy6Aym3w321FhySFAWPbFB5p8wf4MyMu7KtJkG1jQy59qdd/bFG3B4/RviJ1jVzsFWb676+lyNhyf8pksgxEXitj1pbm/MGnVvyMtyXv04h4hSBBV1fbqjy0aOGTAyw3DqgBRuXNLP1KbrSwC3R0ZNjlgQG8ZLmeeZtWkLZNwkFWso9c8zICyVOgMKxfJq10vquwSqGpjPDzODyr4r7pA55B5uJYnPM190XQP0GZWj0vTu//jOeOXZvqUZECd3XvKMigDtQ4NQj+nbBzm6V/c8PR9QRzO0hlXb65ebtqdjCv1Rrh4qKPFEumbkLFDMQdcp3PnNHL0CRSYAQyPX9NzTe7RRr12h+muxp4gxbSpONvNdx0i9WSbFqWwRzw2VdHedxlq0eTp7Zpar2oBkRjnUAOPNCOLdP2/3wuWUPcWZulM4HuXwdd4LXmw51v9oAH7LJ8dw5csqx7ih+lU8QHRNBXzAqXZWZ7SXhHZJHMlA22Xk9OA4HFxnDKgzpWBGvnlspfAia709hf2qttIHZ5Tgr3T7RhbOZ5FmedasOvsF3Lg8N7R4/Kz5txLLY5EC
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5465.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(396003)(366004)(136003)(376002)(39860400002)(8676002)(71200400001)(76116006)(66946007)(52536014)(64756008)(66446008)(66476007)(66556008)(30864003)(8936002)(38100700002)(122000001)(478600001)(54906003)(316002)(6916009)(41300700001)(5660300002)(2906002)(15650500001)(4326008)(186003)(53546011)(107886003)(6506007)(7696005)(9686003)(83380400001)(26005)(86362001)(38070700005)(55016003)(82960400001)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/cTZKg8P/YflI68Z5v+nBUy3WY18tMZC30l7h6BzketwtyNkBhQjDYzk3rUy?=
 =?us-ascii?Q?uLnMC8rSpq4lNA050cD2w1pTLUhUkkqPo2lbFqslHf2vH9LOnIILKJHMAxDr?=
 =?us-ascii?Q?5u1RZFttEHfZci14nwaii95hNjrqeHUy/QloHo7APJ64E7q5tlajEAFRISaJ?=
 =?us-ascii?Q?CQvoLxV2UL7lRakBRwg1nW1OnwyP56Tdv20yWCII2YzuQ8sG7iT4zuJRaFwg?=
 =?us-ascii?Q?H1l03YWdHYoOFnA7oWgEFmWxYAWUnfuidJDYDefB61xS9HuJtu1kLpz0GPon?=
 =?us-ascii?Q?Cbd9GcwUa4qpDKfpsT4u32njFzF7MsC7qvZhowLNMgIockzTqv0S8EgIS05W?=
 =?us-ascii?Q?QznGkPD7nl8FDRWrvGE28kGSJHu11hrwY2GyAO6rkmSzph8KibR7L+uU+JIk?=
 =?us-ascii?Q?H6ZJMayVhurSjyhjF2jJGvkDw9ylVizj32fgCUA8B//PKbbRNLrXjQUI3s05?=
 =?us-ascii?Q?97gCeJruL+BMd+5oWFy2WlTNRklmGOpGvpK7LBPNwYIHUsrZoVIzcL/HULCd?=
 =?us-ascii?Q?RGLPvRYqjHA+HGbmNWASUILysLVwUmgy4+kkV8HXbfyXN52ipla7UTx1iAH4?=
 =?us-ascii?Q?m94klgI37wVo3cKiAHuFDpsNzwJzDpL6ueFIAY3HWJLXLbhWeopnyo5F+4sX?=
 =?us-ascii?Q?tbzmdOF+XBAzQAv8J3ilWbEant5EiX0q2cds2AGL2fLjuW2xuh06IKJOJ+oF?=
 =?us-ascii?Q?vwmNMRaDUxh7orTMGgm/NJG7lG7qH6YX84VJl4qNBkYuZ5XJJA/aDQ6aA8Pc?=
 =?us-ascii?Q?F7hPFXO87LdeIDsvUhAO5UIrWZgc8kLpRlgBbTzJr2Pjw3QgoUBzNxeXusWC?=
 =?us-ascii?Q?UDI7zL9jbNGvgCulZ0/0VYzhZlH4s/kxJS0npeLHkP6CmbPSrkkcNDaDbOSX?=
 =?us-ascii?Q?bWMzr9f4dzQPTd5Ebr4XHbCFz7kciEC05U3DuqYZWVgw9TojHynE9smxNq9N?=
 =?us-ascii?Q?nNWWCSpJARCpUX+g234u/FhmjcbHiJx40+VrPw7ufYX4+eIPGbWBvE7vy4zT?=
 =?us-ascii?Q?vwcx/VnZWl7tw8BGbhtfafuY8Dmtujpfwg9L8hwae2UdmrI/9HtmuI+IBTRL?=
 =?us-ascii?Q?IRGyPwa1conEJpj4aPqzTfXTLXahRSh+t9GRZKlnlhClho5NeWoa+TW7agoq?=
 =?us-ascii?Q?3OnIYWflRaPC5sntxghjdD+Feq+S4xkyrpwO2y7ydMHPv33EDZlB49/HXn3t?=
 =?us-ascii?Q?9J7lMPYXBmE4k6ObIAZNxSyn2+M5TVKLcktuDkUulKx/qkHVtlaiwse6uxOy?=
 =?us-ascii?Q?QizWm2HN8R5lKc1Rp9/5lqAp4bfLk/2jLtxMMEPMmKKZv9aJE4FSIjbBND0N?=
 =?us-ascii?Q?ub0SelcLgxI4JQCBFXUZKB6z3QjlCSQ11n112Fw/77/sK2Zme4py44HAwIY2?=
 =?us-ascii?Q?DRKPwBFdmALkp8XcV5ctCdiZxyj8Cx7hQLTUstaMdQrXWq+SrCSi0qu7IzTx?=
 =?us-ascii?Q?WrxiN97XO0SVrmSRR4HzIHFgQPQrXpDAFW9/0ywPxd872TnRoHZgoEnaNoCr?=
 =?us-ascii?Q?dN+lWC24Fnfh2aw0j0o9hwttRyxdkP3qtcJQZNO8ZmbJ58G1vqMj/+LDVom/?=
 =?us-ascii?Q?JFIZ9x7mhM6DrOVnIiL4a07TA/iQoWA62uTbW5NC?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5465.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aaedaff0-56dd-446c-2f73-08da79dbf4f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2022 07:51:24.0582 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B/w2F6zKXI03Smp6hRimyNv3f2LbYw6PvkMVt4KAKz72KRExJjk9nrke5elJTGk20QWjgl6d3Q0rT3esuoFIvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5536
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.88; envelope-from=ling1.xu@intel.com;
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

Hi, Juan,=20
      Thanks for your advice. We have revised our code including: 1) change=
 "IS_CPU_SUPPORT_AVX512BW" to "is_cpu_support_avx512bw" to indicate that va=
riable isn't global variable; 2) use a function pointer to simplify code in=
 ram.c; 3) change function name "xbzrle_encode_buffer_512" to "xbzrle_encod=
e_buffer_avx512", change variable "res" to "countResidual" for better under=
standing, and replace "unsigned long long" with "uint64_t".=20
       We will submit patch v4 to fix all issues mentioned in comments.=20

Best Regard,
Ling

-----Original Message-----
From: Juan Quintela <quintela@redhat.com>=20
Sent: Monday, August 8, 2022 9:12 PM
To: Xu, Ling1 <ling1.xu@intel.com>
Cc: qemu-devel@nongnu.org; dgilbert@redhat.com; Zhao, Zhou <zhou.zhao@intel=
.com>; Jin, Jun I <jun.i.jin@intel.com>
Subject: Re: [PATCH v3 1/2] Update AVX512 support for xbzrle_encode_buffer =
function

ling xu <ling1.xu@intel.com> wrote:
> This commit update runtime check of AVX512, and implements avx512 of=20
> xbzrle_encode_buffer function to accelerate xbzrle encoding speed.
> Compared with C version of xbzrle_encode_buffer function, avx512=20
> version can achieve almost 60%-70% performance improvement on unit=20
> test provided by Qemu. In addition, we provide one more unit test=20
> called "test_encode_decode_random", in which dirty data are randomly=20
> located in 4K page, and this case can achieve almost 140% performance gai=
n.
>
> Signed-off-by: ling xu <ling1.xu@intel.com>
> Co-authored-by: Zhou Zhao <zhou.zhao@intel.com>
> Co-authored-by: Jun Jin <jun.i.jin@intel.com>
> ---
>  meson.build        |  16 ++++
>  meson_options.txt  |   2 +
>  migration/ram.c    |  41 ++++++++++
>  migration/xbzrle.c | 181 +++++++++++++++++++++++++++++++++++++++++++++
>  migration/xbzrle.h |   4 +
>  5 files changed, 244 insertions(+)
>
> diff --git a/meson.build b/meson.build index 294e9a8f32..4222b77e9f=20
> 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2262,6 +2262,22 @@ config_host_data.set('CONFIG_AVX512F_OPT', get_opt=
ion('avx512f') \
>      int main(int argc, char *argv[]) { return bar(argv[0]); }
>    '''), error_message: 'AVX512F not available').allowed())
> =20
> +config_host_data.set('CONFIG_AVX512BW_OPT', get_option('avx512bw') \
> +  .require(have_cpuid_h, error_message: 'cpuid.h not available,=20
> +cannot enable AVX512BW') \
> +  .require(cc.links('''
> +    #pragma GCC push_options
> +    #pragma GCC target("avx512bw")
> +    #include <cpuid.h>
> +    #include <immintrin.h>
> +    static int bar(void *a) {
> +
> +      __m512i x =3D *(__m512i *)a;
> +      __m512i res=3D _mm512_abs_epi8(x);
> +      return res[1];
> +    }
> +    int main(int argc, char *argv[]) { return bar(argv[0]); }  '''),=20
> + error_message: 'AVX512BW not available').allowed())
> +
>  have_pvrdma =3D get_option('pvrdma') \
>    .require(rdma.found(), error_message: 'PVRDMA requires OpenFabrics lib=
raries') \
>    .require(cc.compiles(gnu_source_prefix + '''
> diff --git a/meson_options.txt b/meson_options.txt index=20
> e58e158396..07194bf680 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -104,6 +104,8 @@ option('avx2', type: 'feature', value: 'auto',
>         description: 'AVX2 optimizations')  option('avx512f', type:=20
> 'feature', value: 'disabled',
>         description: 'AVX512F optimizations')
> +option('avx512bw', type: 'feature', value: 'auto',
> +       description: 'AVX512BW optimizations')
>  option('keyring', type: 'feature', value: 'auto',
>         description: 'Linux keyring support')
> =20

[no clue about meson, it looks ok]

> diff --git a/migration/ram.c b/migration/ram.c index=20
> dc1de9ddbc..d9c1ac2f7a 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -83,6 +83,35 @@
>  /* 0x80 is reserved in migration.h start with 0x100 next */
>  #define RAM_SAVE_FLAG_COMPRESS_PAGE    0x100
> =20
> +#if defined(CONFIG_AVX512BW_OPT)
> +static bool IS_CPU_SUPPORT_AVX512BW;

An all caps global variable?

> +#include "qemu/cpuid.h"
> +static void __attribute__((constructor)) init_cpu_flag(void) {
> +    unsigned max =3D __get_cpuid_max(0, NULL);
> +    int a, b, c, d;
> +    IS_CPU_SUPPORT_AVX512BW =3D false;
> +    if (max >=3D 1) {
> +        __cpuid(1, a, b, c, d);
> +         /* We must check that AVX is not just available, but usable.  *=
/
> +        if ((c & bit_OSXSAVE) && (c & bit_AVX) && max >=3D 7) {
> +            int bv;
> +            __asm("xgetbv" : "=3Da"(bv), "=3Dd"(d) : "c"(0));
> +            __cpuid_count(7, 0, a, b, c, d);
> +           /* 0xe6:
> +            *  XCR0[7:5] =3D 111b (OPMASK state, upper 256-bit of ZMM0-Z=
MM15
> +            *                    and ZMM16-ZMM31 state are enabled by OS=
)
> +            *  XCR0[2:1] =3D 11b (XMM state and YMM state are enabled by=
 OS)
> +            */
> +            if ((bv & 0xe6) =3D=3D 0xe6 && (b & bit_AVX512BW)) {
> +                IS_CPU_SUPPORT_AVX512BW =3D true;
> +            }
> +        }
> +    }
> +    return ;
> +}
> +#endif
> +
>  XBZRLECacheStats xbzrle_counters;
> =20
>  /* struct contains XBZRLE cache and a static page @@ -802,9 +831,21=20
> @@ static int save_xbzrle_page(RAMState *rs, uint8_t **current_data,
>      memcpy(XBZRLE.current_buf, *current_data, TARGET_PAGE_SIZE);
> =20
>      /* XBZRLE encoding (if there is no overflow) */
> +    #if defined(CONFIG_AVX512BW_OPT)
> +    if (likely(IS_CPU_SUPPORT_AVX512BW)) {

All distributions are go to have compile time support for AVX, but I am not=
 sure the percentage of machines that support avx

> +        encoded_len =3D xbzrle_encode_buffer_512(prev_cached_page, XBZRL=
E.current_buf,
> +                                               TARGET_PAGE_SIZE, XBZRLE.=
encoded_buf,
> +                                               TARGET_PAGE_SIZE);
> +    } else {
> +        encoded_len =3D xbzrle_encode_buffer(prev_cached_page, XBZRLE.cu=
rrent_buf,
> +                                           TARGET_PAGE_SIZE, XBZRLE.enco=
ded_buf,
> +                                           TARGET_PAGE_SIZE);
> +    }

the else part is the same than the #else part
> +    #else
>      encoded_len =3D xbzrle_encode_buffer(prev_cached_page, XBZRLE.curren=
t_buf,
>                                         TARGET_PAGE_SIZE, XBZRLE.encoded_=
buf,
>                                         TARGET_PAGE_SIZE);
> +    #endif

So, why don't just create a new function pointer:

int (*xbzrle_encode_buffer_func)(uint8_t *old_buf, uint8_t *new_buf, int sl=
en,
                                 uint8_t *dst, int dlen) =3D xbzrle_encode_=
buffer;


And aad into init_cpu_flag() something in the line of:

	xbzrle_encode_buffer_func =3D xbrrle_encode_buffer_512;

?


>      /*
>       * Update the cache contents, so that it corresponds to the data=20
> diff --git a/migration/xbzrle.c b/migration/xbzrle.c index=20
> 1ba482ded9..4db09fdbdb 100644
> --- a/migration/xbzrle.c
> +++ b/migration/xbzrle.c
> @@ -174,3 +174,184 @@ int xbzrle_decode_buffer(uint8_t *src, int slen,=20
> uint8_t *dst, int dlen)
> =20
>      return d;
>  }
> +
> +#if defined(CONFIG_AVX512BW_OPT)
> +#pragma GCC push_options
> +#pragma GCC target("avx512bw")
> +
> +#include <immintrin.h>
> +#include <math.h>
> +#define SET_ZERO512(r) r =3D _mm512_set1_epi32(0) int=20
> +xbzrle_encode_buffer_512(uint8_t *old_buf, uint8_t *new_buf, int slen,
> +                             uint8_t *dst, int dlen) {

This is just personal taste, but I would rename this to:

xbzrle_encode_buffer_avx512?

> +    uint32_t zrun_len =3D 0, nzrun_len =3D 0;
> +    int d =3D 0, i =3D 0, num =3D 0;
> +    uint8_t *nzrun_start =3D NULL;
> +    int count512s =3D (slen >> 6);
> +    int res =3D slen % 64;

res variable here means residual, normally we use "res" with meaning of "re=
sult" in qemu.

> +    bool never_same =3D true;
> +    while (count512s--) {
> +        if (d + 2 > dlen) {
> +            return -1;
> +        }
> +        __m512i old_data =3D _mm512_mask_loadu_epi8(old_data,
> +                               0xffffffffffffffff, old_buf + i);
> +        __m512i new_data =3D _mm512_mask_loadu_epi8(new_data,
> +                                                 0xffffffffffffffff, new=
_buf + i);
> +        /* in mask bit 1 for same, 0 for diff */
> +        __mmask64  comp =3D _mm512_cmpeq_epi8_mask(old_data, new_data);
> +
> +        int bytesToCheck =3D 64;
> +        bool is_same =3D (comp & 0x1);
> +        while (bytesToCheck) {
> +            if (is_same) {
> +                if (nzrun_len) {
> +                    d +=3D uleb128_encode_small(dst + d, nzrun_len);
> +                    if (d + nzrun_len > dlen) {
> +                        return -1;
> +                    }
> +                    nzrun_start =3D new_buf + i - nzrun_len;
> +                    memcpy(dst + d, nzrun_start, nzrun_len);
> +                    d +=3D nzrun_len;
> +                    nzrun_len =3D 0;
> +                }
> +                if (comp =3D=3D 0xffffffffffffffff) {
> +                    i +=3D 64;
> +                    zrun_len +=3D 64;
> +                    break;
> +                }
> +                never_same =3D false;
> +                num =3D __builtin_ctzl(~comp);
> +                num =3D (num < bytesToCheck) ? num : bytesToCheck;
> +                zrun_len +=3D num;
> +                bytesToCheck -=3D num;
> +                comp >>=3D num;
> +                i +=3D num;
> +                if (bytesToCheck) {
> +                    /* still has different data after same data */
> +                    d +=3D uleb128_encode_small(dst + d, zrun_len);
> +                    zrun_len =3D 0;
> +                } else {
> +                    break;
> +                }
> +            }
> +            if (never_same || zrun_len) {
> +                /*
> +                 * never_same only acts if
> +                 * data begins with diff in first count512s
> +                 */
> +                d +=3D uleb128_encode_small(dst + d, zrun_len);
> +                zrun_len =3D 0;
> +                never_same =3D false;
> +            }
> +            /* has diff */
> +            if ((bytesToCheck =3D=3D 64) && (comp =3D=3D 0x0)) {
> +                i +=3D 64;
> +                nzrun_len +=3D 64;
> +                break;
> +            }
> +            num =3D __builtin_ctzl(comp);
> +            num =3D (num < bytesToCheck) ? num : bytesToCheck;
> +            nzrun_len +=3D num;
> +            bytesToCheck -=3D num;
> +            comp >>=3D num;
> +            i +=3D num;
> +            if (bytesToCheck) {
> +                /* mask like 111000 */
> +                d +=3D uleb128_encode_small(dst + d, nzrun_len);
> +                /* overflow */
> +                if (d + nzrun_len > dlen) {
> +                    return -1;
> +                }
> +                nzrun_start =3D new_buf + i - nzrun_len;
> +                memcpy(dst + d, nzrun_start, nzrun_len);
> +                d +=3D nzrun_len;
> +                nzrun_len =3D 0;
> +                is_same =3D true;
> +            }
> +        }
> +    }
> +    if (res) {
> +        /* the number of data is less than 64 */
> +        unsigned long long mask =3D pow(2, res);

Not your fault.

21st century.  Someone still use long long in a new API, sniff.

> +        mask -=3D 1;
> +        __m512i r =3D SET_ZERO512(r);
> +        __m512i old_data =3D _mm512_mask_loadu_epi8(r, mask, old_buf + i=
);
> +        __m512i new_data =3D _mm512_mask_loadu_epi8(r, mask, new_buf + i=
);
> +        __mmask64 comp =3D _mm512_cmpeq_epi8_mask(old_data, new_data);
> +
> +        int bytesToCheck =3D res;
> +        bool is_same =3D (comp & 0x1);
> +        while (bytesToCheck) {
> +            if (is_same) {
> +                if (nzrun_len) {
> +                    d +=3D uleb128_encode_small(dst + d, nzrun_len);
> +                    if (d + nzrun_len > dlen) {
> +                        return -1;
> +                    }
> +                    nzrun_start =3D new_buf + i - nzrun_len;
> +                    memcpy(dst + d, nzrun_start, nzrun_len);
> +                    d +=3D nzrun_len;
> +                    nzrun_len =3D 0;
> +                }
> +                never_same =3D false;
> +                num =3D __builtin_ctzl(~comp);
> +                num =3D (num < bytesToCheck) ? num : bytesToCheck;
> +                zrun_len +=3D num;
> +                bytesToCheck -=3D num;
> +                comp >>=3D num;
> +                i +=3D num;
> +                if (bytesToCheck) {
> +                    /* diff after same */
> +                    d +=3D uleb128_encode_small(dst + d, zrun_len);
> +                    zrun_len =3D 0;
> +                } else {
> +                    break;
> +                }
> +            }
> +
> +            if (never_same || zrun_len) {
> +                d +=3D uleb128_encode_small(dst + d, zrun_len);
> +                zrun_len =3D 0;
> +                never_same =3D false;
> +            }
> +            /* has diff */
> +            num =3D __builtin_ctzl(comp);
> +            num =3D (num < bytesToCheck) ? num : bytesToCheck;
> +            nzrun_len +=3D num;
> +            bytesToCheck -=3D num;
> +            comp >>=3D num;
> +            i +=3D num;
> +            if (bytesToCheck) {
> +                d +=3D uleb128_encode_small(dst + d, nzrun_len);
> +                /* overflow */
> +                if (d + nzrun_len > dlen) {
> +                    return -1;
> +                }
> +                nzrun_start =3D new_buf + i - nzrun_len;
> +                memcpy(dst + d, nzrun_start, nzrun_len);
> +                d +=3D nzrun_len;
> +                nzrun_len =3D 0;
> +                is_same =3D true;
> +            }
> +        }
> +    }
> +
> +    if (zrun_len) {
> +        return (zrun_len =3D=3D slen) ? 0 : d;
> +    }
> +    if (nzrun_len !=3D 0) {
> +        d +=3D uleb128_encode_small(dst + d, nzrun_len);
> +        /* overflow */
> +        if (d + nzrun_len > dlen) {
> +            return -1;
> +        }
> +        nzrun_start =3D new_buf + i - nzrun_len;
> +        memcpy(dst + d, nzrun_start, nzrun_len);
> +        d +=3D nzrun_len;
> +    }
> +    return d;
> +}
> +#pragma GCC pop_options
> +#endif
> \ No newline at end of file
> diff --git a/migration/xbzrle.h b/migration/xbzrle.h index=20
> a0db507b9c..6247de5f00 100644
> --- a/migration/xbzrle.h
> +++ b/migration/xbzrle.h
> @@ -18,4 +18,8 @@ int xbzrle_encode_buffer(uint8_t *old_buf, uint8_t *new=
_buf, int slen,
>                           uint8_t *dst, int dlen);
> =20
>  int xbzrle_decode_buffer(uint8_t *src, int slen, uint8_t *dst, int=20
> dlen);
> +#if defined(CONFIG_AVX512BW_OPT)
> +int xbzrle_encode_buffer_512(uint8_t *old_buf, uint8_t *new_buf, int sle=
n,
> +                             uint8_t *dst, int dlen); #endif
>  #endif


