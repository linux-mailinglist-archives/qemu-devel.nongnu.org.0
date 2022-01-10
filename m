Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9434893C2
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 09:39:59 +0100 (CET)
Received: from localhost ([::1]:54592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6qDe-0004w5-5g
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 03:39:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin.tian@intel.com>)
 id 1n6qCA-0003ly-7W
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 03:38:26 -0500
Received: from mga05.intel.com ([192.55.52.43]:47711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin.tian@intel.com>)
 id 1n6qC8-0005Bb-E2
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 03:38:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641803904; x=1673339904;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eoix0FmLeyt0Axx3dP9xC3FPJNgwohppcjy2PgPaReQ=;
 b=ff2JYw47yuvMPeBPVieqJIOoTz5cMUJP1e69fNBJOZbnmUwbr+taOeYB
 r+h+OsrxlsINr74XmfTBfIIs/JQKDeu1nISOjRAjt7iR6wlwk7EcDjYJ2
 Cw3KSVCZFBLY5Qfbvhz1MXPUcsOr+147SMPwJF0di3r7BSkJqmBKawkyp
 p1pAmPOtwFREt5uD88YOwCmrukNOXVcjYD5HzY0gsL33txq45xdtJSb1X
 AmdPI2LRljbnsIjFISAAAsJqrd6aTu7uitN/D931UsA9mkY+ncoFBQHcd
 I2cOWR/vvLmeKpDYxq06KImZIvASOe1TB2jUC8FRHh06bj63SLS6JO8x1 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10222"; a="329523730"
X-IronPort-AV: E=Sophos;i="5.88,276,1635231600"; d="scan'208";a="329523730"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2022 00:38:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,276,1635231600"; d="scan'208";a="514599892"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP; 10 Jan 2022 00:38:22 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 10 Jan 2022 00:38:21 -0800
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 10 Jan 2022 00:38:21 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Mon, 10 Jan 2022 00:38:21 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Mon, 10 Jan 2022 00:38:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HODPuHO2TVHpkdYdkQctSslPkpJHxJqt4uEVem+9ss65h/sviXiXzZ/a0YBqalCPRKF3WHI3K5q6D/BD6b1DPK87UhU1C3iaK45gEhBUxA0ocUvY3yWezUPkn0LAuoCxI0DcWuno8FD2Yl+kqknJBocNeJQIRMyCEhTpPhqKcp2EmkIpbMvHYCHcVXpUjrh8ME0JkJriexPoli2Z+eiH9bkC0h+phEDngnrS/IrhtLr/S5RkPkFzdI3zbsGXHRPsgJcpUxU0obe6KAemPTLIuQj7GRBmGy9/JCP9jgQLkgShJyVRl23QoRRiNs5jhvOH8qMFcU2/ornBvI+UJgHrYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UOs4KDACPDqQlzGa/h3tDQ2IQZWEaYKs6+LH8TVG6/o=;
 b=Ch3pzbv4F62vfh/Mze7nXWf1oZeosgJd29wAmlTg+5KXWvGV2wxfYywdS0qbNo6gLWDKmQXKCEipG2qTmgnt7V0aPGI663QFBmEZ4yIlnrUMwdeLpINnfDoJ27+5KWJku3r+v6bhA1+DVsdadNE+UV3mtvUO5S1CZzyiJA6mvLHNt7v+fskrMpzv8wTGy6paSyzIjdtRCmfn1eQQ0FkKJMhaCeYcO1Esu13R/dYJvzgyUyFFTwvfGc2rqYsK/rHORpuhhMl/wQ00C5T38krTBKsJMxZHHDZI1Q1R/u/hzt4C3veTf850HxfwgeHH5f4/41KRWbsGucWYnaCzaJw69w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by BN7PR11MB2644.namprd11.prod.outlook.com (2603:10b6:406:ac::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Mon, 10 Jan
 2022 08:38:18 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::5c8a:9266:d416:3e04]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::5c8a:9266:d416:3e04%2]) with mapi id 15.20.4867.012; Mon, 10 Jan 2022
 08:38:18 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Zhong, Yang" <yang.zhong@intel.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [RFC PATCH 4/7] x86: Add XFD faulting bit for state components
Thread-Topic: [RFC PATCH 4/7] x86: Add XFD faulting bit for state components
Thread-Index: AQHYA6ltxWPOo+cvMUGiCLPWRxx/46xb8wQA
Date: Mon, 10 Jan 2022 08:38:18 +0000
Message-ID: <BN9PR11MB527604A587F7F84B9DF5F1238C509@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220107093134.136441-1-yang.zhong@intel.com>
 <20220107093134.136441-5-yang.zhong@intel.com>
In-Reply-To: <20220107093134.136441-5-yang.zhong@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.200.16
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 39f2c7f8-c113-4274-ef93-08d9d4148d19
x-ms-traffictypediagnostic: BN7PR11MB2644:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BN7PR11MB2644585F0B13BFEDD9E6001D8C509@BN7PR11MB2644.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ezt1yDxP365ktzrQPM2mjgbH6bW4l+EjfSCip4DKiBshH34HPmFj/GcznEkHJq0q2T/8VOFOt0DM22eVmvDkpJojP1F2qy1U2w3G2I/bn1GMK+bDIMPVOoWr5+K77xts08Xa0dtEaHPTahJbQDe4zlA0CHj+2DjAw5EHPXz485lcNCfQjJScPCLo9WNblmX2OMZU7TtkUhY52utxVhvamIip0v8L+YeR74Eek4HR3ycWdZsRFnXiTEi0h4nNYdW1sHKOKzM5c6I/K+DB1Yl8YfZyDqzPMrZrSWAmW/Y3W7T3URE6zYZumfSEMJGUWH8feXpksysLJ7gRIpyl9/Q9RGt1jYsa8g9v5R07dmOBiD5XdRM6Cjvi+jKuv8s3f6y9sj5Fe3rdaE92WL5hWtIrbxE/dcy4818d03klfcnEHOPpJpUudlQLvS2m19Rz98RE9iPFiKcGWKZGms6hBOFTK8rljAO0Ck2nfDffp4/TVF1Prj2yyKYQPSQdQc+ieGUbtI+LdivtVkoPr2L5gSb/Kd40ug5m5J6sPwdipGtIffqJxnv4s6lutWRf7iU7/k/N3UMBppanFzk4BnEmMvkmrerGIZF9kdYmtbYufXVGvC+kASmxmMkl1XrBpqqtdPfORxlPtFrySFgWUL582HMzTsK+oInnIsk/SZ+QJ2TFm3nvwWgvmoN4x3w7u05C01ZxnfZKmPhxYy0PlS7gj08nGg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(110136005)(54906003)(508600001)(26005)(9686003)(38070700005)(8676002)(5660300002)(83380400001)(4326008)(7696005)(52536014)(86362001)(8936002)(186003)(66946007)(316002)(76116006)(55016003)(66476007)(2906002)(64756008)(66446008)(122000001)(66556008)(38100700002)(82960400001)(33656002)(6506007)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Vowy3t+0KWHV5rdkv/W54BAlm/k3aWxE6Y08RN5d5GOSL5JIOGQg1rwxcPxE?=
 =?us-ascii?Q?ixXE4cNSMUfJK1jRD+dPLjJKReccGmKXwF5C6UmSPHyR8s+dh+ctpnUuM+2D?=
 =?us-ascii?Q?jmMfhkhpdW/Vu63bZn+N9JJU1wr13oSXIc/meoZIkcyIXT9aryJQpCMzBlm2?=
 =?us-ascii?Q?3HDLTLWx/vD6CwGvJek2TA+TW1+B5Lkw1O1Wu+HyV8lT4wQQf5Rr0OhbPBwl?=
 =?us-ascii?Q?xGd7q2j4BUNSO2a4r35Od4BhYfyGnOIzWUFJeSKm5XX/6s5Llvbhyh3xGaF8?=
 =?us-ascii?Q?ZjBoW7ns89YhCxbvOLUm9DMFGPa8q4Wi+ScZIPdWaT/AckzIwyAPhFluuGcX?=
 =?us-ascii?Q?nIc72fRQ9682U0Cg6yOMaGKUnVCGGVe+8NdL0vQRaoluEJlxsNRE82qPKai3?=
 =?us-ascii?Q?UccJV/ebroNswLd+hQWud8qDTOTOc/fgbAF2p0e8Fftt1t4Ex4nuCMmPYzcS?=
 =?us-ascii?Q?F+LBQQe9WG2bxQ+zuX8/qCuotNMAw49MgfRlombMrhDYbINllK1HdmU6NAcJ?=
 =?us-ascii?Q?h/eQsaud1Eu0acfH8aSOFXWX81eIPWrjSZjlV9Lk+9wqDZwwR2XO09fIA76Q?=
 =?us-ascii?Q?cVUqMqiTyf7prlG2CNL+hItrmzi2ENj/HuZekzNyr2+MWKoIzbpj3yjIVY53?=
 =?us-ascii?Q?fNZ4UytoLVxYGvLm/xlSL/asK56u76rciWrywoExRvI+tgyTXKSLHR+2b86u?=
 =?us-ascii?Q?LM/FLRA2lpS+jHgUv//EgrSs+kRE0X7womuK74VWj4hFOOJy0wuwBekoxV3B?=
 =?us-ascii?Q?fCTyz73R1la9eAG4cJMHQJaE2W+62a/R33gd1kWwFZgpdyL4TFEed8COKi/E?=
 =?us-ascii?Q?lw10yM/qVJUieM5txCN/3MYejrUDWUhuHhVW+JN/bZdwE2ZVUzSv1kWIiKXX?=
 =?us-ascii?Q?emnS8gWIISsI/5ap8XpgGTu6Z0HypgY6+DHEDyCXGurJtKLR0jUrvWJHrCJi?=
 =?us-ascii?Q?rkx1TYDEbkfmm0oXElFnQssPZQbE1vbWBhdNWF4FkRAXHUyxbOrBHYLhStro?=
 =?us-ascii?Q?VVTFe0GjQw6cIctjB+zyBmo9NZSJBxs+X0LV33w9AceKgQBZsxsCn4jIYOeI?=
 =?us-ascii?Q?EWCpMk/GkFkjvhPVWgJcplKNUojnT2xMWrw6qxX0fQ8kycYurr4fPlpxaDdH?=
 =?us-ascii?Q?kP3hGu0aUmpyrl7i4FTKCd/i7ESH3o2LckK3+Mv8WYHgKgLNh5lN5qvn4Bgn?=
 =?us-ascii?Q?72WEX0w5RgQ2eklnLTnLwv313Zk1hWgMRFGCm2v8e3m/AHYUvZEn8ufev6Wq?=
 =?us-ascii?Q?lVHHjAT/k5H11DOJO28rxS9x/XJp4NJIurgxGDedhGoIL280LAMtL69+CICh?=
 =?us-ascii?Q?yDGNZHen31UNRf1TxGqQKvi8sKaXpEuHTaiW2lNKGa3+jT4sBMGlMOYCWG2H?=
 =?us-ascii?Q?VmDFN/2Eo+p+lHer/T6SOpu2Jkumf4qNUBPVk/R0FsfNnt1qxS0iJrVjP6wT?=
 =?us-ascii?Q?uj1Lkwlip+RTquA9ZpCnu88RbSEts07KC0rR3cBL22UPgsqbVt4GfGnC9jzi?=
 =?us-ascii?Q?lDNgyUqQVaX2/2kzZ4kWYi8PX9G04N/NcshY+lnL0mnMds/bxmhd/xojS2NW?=
 =?us-ascii?Q?7aJkbyf9tQJaCdqIeGnJ/T0GPDDoEXKc4YJoKocmxas9kSjuYiiM9typkNoN?=
 =?us-ascii?Q?lDQGW4/OXLI/gZni4EvWEBM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39f2c7f8-c113-4274-ef93-08d9d4148d19
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2022 08:38:18.0899 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pk0aAXA7geCzFnP72y+4jlzh4+6b2B33Zsc35Ge7WpnFHX5riCP0fMA54ZeiOPxwkeR4eZctcBc8xoktE7DJlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2644
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.43; envelope-from=kevin.tian@intel.com;
 helo=mga05.intel.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
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
Cc: "pbonzini@redhat.com" <pbonzini@redhat.com>, "Wang,
 Wei W" <wei.w.wang@intel.com>,
 "jing2.liu@linux.intel.com" <jing2.liu@linux.intel.com>, "Zeng,
 Guang" <guang.zeng@intel.com>, "Christopherson, , Sean" <seanjc@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> From: Zhong, Yang <yang.zhong@intel.com>
> Sent: Friday, January 7, 2022 5:32 PM
>=20
> From: Jing Liu <jing2.liu@intel.com>
>=20
> Intel introduces XFD faulting mechanism for extended
> XSAVE features to dynamically enable the features in
> runtime. If CPUID (EAX=3D0Dh, ECX=3Dn, n>1).ECX[2] is set
> as 1, it indicates support for XFD faulting of this
> state component.
>=20
> Signed-off-by: Jing Liu <jing2.liu@intel.com>
> Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> ---
>  target/i386/cpu.h         | 2 +-
>  target/i386/cpu.c         | 2 +-
>  target/i386/kvm/kvm-cpu.c | 1 +
>  3 files changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index 79023fe723..22f7ff40a6 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -1375,7 +1375,7 @@
> QEMU_BUILD_BUG_ON(sizeof(XSaveXTILE_DATA) !=3D 0x2000);
>  typedef struct ExtSaveArea {
>      uint32_t feature, bits;
>      uint32_t offset, size;
> -    uint32_t need_align;
> +    uint32_t need_align, support_xfd;

why each flag be a 32-bit field?

also it's more natural to have them in separate lines, though I'm not
sure why existing fields are put this way (possibly due to short names?).

>  } ExtSaveArea;
>=20
>  #define XSAVE_STATE_AREA_COUNT (XSTATE_XTILE_DATA_BIT + 1)
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index dd2c919c33..1adc3f0f99 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -5495,7 +5495,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t
> index, uint32_t count,
>                  const ExtSaveArea *esa =3D &x86_ext_save_areas[count];
>                  *eax =3D esa->size;
>                  *ebx =3D esa->offset;
> -                *ecx =3D esa->need_align << 1;
> +                *ecx =3D (esa->need_align << 1) | (esa->support_xfd << 2=
);
>              }
>          }
>          break;
> diff --git a/target/i386/kvm/kvm-cpu.c b/target/i386/kvm/kvm-cpu.c
> index 6c4c1c6f9d..3b3c203f11 100644
> --- a/target/i386/kvm/kvm-cpu.c
> +++ b/target/i386/kvm/kvm-cpu.c
> @@ -108,6 +108,7 @@ static void kvm_cpu_xsave_init(void)
>=20
>              uint32_t ecx =3D kvm_arch_get_supported_cpuid(s, 0xd, i, R_E=
CX);
>              esa->need_align =3D ecx & (1u << 1) ? 1 : 0;
> +            esa->support_xfd =3D ecx & (1u << 2) ? 1 : 0;
>          }
>      }
>  }

