Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A43B248932B
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 09:22:32 +0100 (CET)
Received: from localhost ([::1]:33352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6pwl-0005ch-FZ
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 03:22:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin.tian@intel.com>)
 id 1n6pvA-0004lJ-QM
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 03:20:52 -0500
Received: from mga09.intel.com ([134.134.136.24]:64192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin.tian@intel.com>)
 id 1n6pv7-0002a0-Uw
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 03:20:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641802849; x=1673338849;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iTOAvq9Ia++zoztvFguKi8eq2YRi4OCTd5TLKf7nBIE=;
 b=dvt3d9m/KuErAkX1K5OGh/nEc/5mhW2RkNmHNQedtzWt1qqOM/tCRHBq
 A+x7XyKzyfYrV7sdRj3nlkil6H9NmGkb3EXmkrKCpHR8X628r7Z3Jx+Mo
 pDXI/xKP/SwGZqm+7gn+ubCa/7at8w663k4N1MfnvMi727H+DDlUkWfej
 XNolvGVXPOieSkzBC6DXtPMgyLJB+Z30E5EzMYaRJCCPbo6+O8Cp+udP3
 kc5E/jKGUq+WJEl83YNeEw5+eXRLcgCHPc3JEs7fbnPKfd82QlYIOy7s0
 ziNs4bhvigVZ12BXaS0ZTHc0Y/18hJozheFWu9bMy1cewtTgCLnwtYuvK g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10222"; a="242975641"
X-IronPort-AV: E=Sophos;i="5.88,276,1635231600"; d="scan'208";a="242975641"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2022 00:20:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,276,1635231600"; d="scan'208";a="619363319"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP; 10 Jan 2022 00:20:44 -0800
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 10 Jan 2022 00:20:44 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Mon, 10 Jan 2022 00:20:44 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.108)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Mon, 10 Jan 2022 00:20:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=koCGaLr6XcGbOeRQoH/TxHW6kZTXePLwcJhiyIyeUohrbt+PcP5yPh5RFQwH+4QVNyQaPY88aDROJKBTO/qE5fiW1qfbcZ+1wbkUV9E9PofRtWxGVToWRmgxGgFJvH8ulHFJhREfuOUaJF9zbG1AAfVmJUTeNYJ+rIqJzQIZ0ik+bAj51YPNRpSrM7jRg/VpDhdvOXRADEVETP2z85uyMaQjD5BsL5cFx/xtlzPB4G5DynPNZE6Ot2ofCXucZtAuUadhUmPcqUNAt7nxi3uCi8ALm0va3urVvnd/DZF2/M136tDCp5dwUr2j4WPZ+1AYmdQRYThTKFh12bddLFLFSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=14jcoDW1ZXostBg1MtgNCnisggan5/YaDNqXhhIkaXk=;
 b=nyy3cgCA5wDPpoAoKitBAtV5RLFAbURJzYWz+MKNZepU9l080Hkja7dt4maUveed9d1CT2iVnatRYMU0Z4Kjit9HX+DLtNbB8w78I53GdXLlHCJW24HpaiUNdNM2nOQevE3bO470pu0r95l+vA/ULb3GUccaeNA+QiXxYeFFTdKsfwJKJ8fEdZuetd84f0QC4A2/7ucZqepJvnsYu4IpXx4P6YLk9sF9hveviBoomG4a9oczEpr61r2HPbAjgFv62rns9B51fFaACZBKzVR9/6bsVsgi4Okzukz2/5Tg6Y2ikx+Wzd+QjBO63fC7WgO5uuSF8/vvrqDJ4SUdqJKFbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by BN6PR11MB1251.namprd11.prod.outlook.com (2603:10b6:404:48::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Mon, 10 Jan
 2022 08:20:41 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::5c8a:9266:d416:3e04]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::5c8a:9266:d416:3e04%2]) with mapi id 15.20.4867.012; Mon, 10 Jan 2022
 08:20:41 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Zhong, Yang" <yang.zhong@intel.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [RFC PATCH 1/7] x86: Fix the 64-byte boundary enumeration for
 extended state
Thread-Topic: [RFC PATCH 1/7] x86: Fix the 64-byte boundary enumeration for
 extended state
Thread-Index: AQHYA6lnISJR9vCeAEe/D343crWw9axb7c0w
Date: Mon, 10 Jan 2022 08:20:41 +0000
Message-ID: <BN9PR11MB5276BFF130081C9ED21F89238C509@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220107093134.136441-1-yang.zhong@intel.com>
 <20220107093134.136441-2-yang.zhong@intel.com>
In-Reply-To: <20220107093134.136441-2-yang.zhong@intel.com>
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
x-ms-office365-filtering-correlation-id: 51bb006a-d40e-4729-e5fb-08d9d4121735
x-ms-traffictypediagnostic: BN6PR11MB1251:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BN6PR11MB12515BD474D5B41FBB0FC2B78C509@BN6PR11MB1251.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:669;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XE6Ojrqjm4YOYWNwqrPgx72w5UTIUcsASSvGp5whfP2QfCSlK7GiZT95tZVXziQLljaBTiHnMqfTdBN3dhJzw69aKa4wySSx0xbTerw3E04pAr/gq/jXyNAbeClxWtV45/CWEDWl3cPQpOwuTvdYBF5HpLoPYuueC1o/2eP0de0G9t1EVp0O6lIy/5b+xMEagRQZY7vZS3be96L4O3Fgxu5MBxNQTPVsOPU4uzZGOucReI/CM0fdUy9nBtpSiLGvovNF0imK1FetVciNkWo1cuSALvzEoHJU+R6k9xdM7AR2RDdFpU1Vj1zs363PQP1vpk4/wF4v7yF+67ugPoDFms8NcIyOrEC5QHaLnNpf8MGRcrNhc+HJpQJCWU6r+xy7FqH1NYe1jd79mzh/9ATFr1XH+wt1ydpwlcZJcp2xdtJl4HAnDm7NouK4dnRvre2+aClQV8ZLJQ4q9PDdGTHugn+vlvyR4QXwOLu/CHBLSU7NeFgYOOTEftVmRWc60Ikk52EN6XiKnm+17vcMIndL1kmAXpYUEV2Yqxc7b2WjnqxXz9HpdfscLahBY4hA8zxLUNNceQtuL5+DisZu/R0RWpefkRgw5rsRhzyDRLxnbTL8mtggIz+iDAsuVgSyOyanqSFyFrUJ0w4F4co2rzR/wnzQEPbxYAFDXE5VGRt03A866kriBNAyoaIuB1pDqMSVycdkAUHW9pBuzkd/03tgiw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(508600001)(110136005)(8676002)(8936002)(26005)(7696005)(316002)(55016003)(86362001)(4326008)(9686003)(6506007)(54906003)(71200400001)(186003)(82960400001)(5660300002)(38070700005)(122000001)(66556008)(64756008)(66446008)(2906002)(52536014)(76116006)(66476007)(66946007)(38100700002)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2lzwiwlMoDWbZkbGNDyOVqaSbNdfmC+LqEOP2wp/V3ZlXHyZtEALBUPZw+/Z?=
 =?us-ascii?Q?IxN0Ur58bD8JO1Ywwsxmod911UwxqZqTDxReGQ8+oRetuQsGEeoy+vQoc3SA?=
 =?us-ascii?Q?ecs2ZnmRKJ1lw9X9EzfAy0FH+9sefcZ615FNHCa6Efta71V90tOp57RgDQEd?=
 =?us-ascii?Q?Se97yiJOEFiznXklV677bXmSpat38BBlGLdBoKg2Xyh3TZHCWVvtoeLmRfU6?=
 =?us-ascii?Q?szXGI/d60C4gZigGfySvDWSWRs4ajfvcCbTW53izgU8KPUSlH9FAaX1TigJn?=
 =?us-ascii?Q?ExoG/dbPddwYD3cOfEjU5BYCIeR/Tl1fJOO66qYEQ811qlLkvZtTjf/g6yiP?=
 =?us-ascii?Q?IRl8/8hAbXviORxihfJQVP67KPiXgWyAN14vZ0kS8PPThILer0NykBhTlJ/I?=
 =?us-ascii?Q?m6beVAkrhbn9H0SrPUXEHjZVBXWyeGouPpThwmNOErZn76b5kqHoV4UoRtgP?=
 =?us-ascii?Q?dLgaoHwSWWbhFIhNA/JS0TIkDyDHu7dzrTvdu5AD7HOobwK/mddkLQd2V7Tt?=
 =?us-ascii?Q?9ouu3QRjOtWAwuoN7mIY+UjnkhFXOp0q+65I+ZUHGtM2v7lvAMjorz7ennK/?=
 =?us-ascii?Q?43DrbEOG/Cx3GUwhW6+RIYejce+khw1GcNJU2xxRndSpEmSCS9EldVBMWm4e?=
 =?us-ascii?Q?OAwMWlfUhPmFrQ6cGrtoT1g0xWh5S2zC8lukXebVSlhe/TSM5LgiNlOqWeun?=
 =?us-ascii?Q?0kIZ5VHGRpCjbq4t6QI0HYel/MsgbkznkOwLyi45Op37HpYd0ZG7Qihvhnqe?=
 =?us-ascii?Q?65KSmrbsazuZl5YevkkVzkcSfs/sJc+TBAdLYpVioufND7TB3jPNqbhfEsNW?=
 =?us-ascii?Q?I2fr+V5AuOQmFYqRaYxzjJzwaJBHw4CrVVlsMsyGCWbdGPRKtXBI+vh8f/UA?=
 =?us-ascii?Q?0cuUXcyUeVQdJX5HfHAxDlnPwjJQal+9auU1O7EI8q3N8AUttHZHrn2WO6fD?=
 =?us-ascii?Q?iYY34Y3+Ub+j4khoFcbH6xWg37JLIZ+JCSzu48Z0L/3rcmGmF9ANTfScvgtY?=
 =?us-ascii?Q?RW4Mf3zgwqbK976qPxX2qwmQx7l9S4iPgLw5HxGuA+RQUWvL0Eqik3Bcsjzs?=
 =?us-ascii?Q?5bQWUb1GTXj4QPHU6sTNBgz/CcMSmALD3THWs2ZXqLJrWKrUQVh7cEqGZPLk?=
 =?us-ascii?Q?mpGi5b7+aabdRHDhE4P3Ry8DeflO7pXcfKB6dIafu9AIof+w8NcM9Qhq/EAl?=
 =?us-ascii?Q?Dpxv7vipRh9t0f5JyXNZ7J/cej8wg/kcZsx9ApXt2bkYc/gHErk5YBsR/x0D?=
 =?us-ascii?Q?shsRuTb2j0iCELK3USXdlkWqU6k6RanYXQmBxyH8mob5MLdeH1UzneO4cadV?=
 =?us-ascii?Q?abhnH6Te+yJMaCWrjo+eJWEWl/LGupvbX8OlsImJz9OKnkgM6BiH7MjP6O8f?=
 =?us-ascii?Q?i7dK1lod0CH8Md9eP2n4Mqw3wQRSJR3R1HwNMXWKtBw/RJvJWDYpYXkMpohk?=
 =?us-ascii?Q?Rpvu0/EtlgF/v15y5EMT+5stkQqcqwn7ORe6wZkmJ+FGV/xBEPbqDL9OP3tK?=
 =?us-ascii?Q?EjYLGiXDHmJFUI6cCYrvPzkVX+wSO1w4LT3BM3R+KICCWRJs8p5JZnBfTmh0?=
 =?us-ascii?Q?cK7Iuoi8CZ7vbXG9FPiR5sTXIb7BTpzr4KrC8uPjV03oKSYrkVu4XyTeGlIV?=
 =?us-ascii?Q?hagDrit8pM4AAaMQgpOZeq8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51bb006a-d40e-4729-e5fb-08d9d4121735
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2022 08:20:41.2508 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZBfPr8eXtuI75Rl3nynJdfqCJpZ+H2tyVtVgziWo2LqL4bBpsGp1p3fiCCjTTrufb3HYHnrkgpGWOgSLjbQkjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1251
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.24; envelope-from=kevin.tian@intel.com;
 helo=mga09.intel.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
> Sent: Friday, January 7, 2022 5:31 PM
>=20
> From: Jing Liu <jing2.liu@intel.com>
>=20
> The extended state subleaves (EAX=3D0Dh, ECX=3Dn, n>1).ECX[1]
> are all zero, while spec actually introduces that bit 01
> should indicate if the extended state component locates
> on the next 64-byte boundary following the preceding state
> component when the compacted format of an XSAVE area is
> used.

Above would read clearer if you revise to:

"The extended state subleaves (EAX=3D0Dh, ECX=3Dn, n>1).ECX[1]
indicate whether the extended state component locates
on the next 64-byte boundary following the preceding state
component when the compacted format of an XSAVE area is
used.

But ECX[1] is always cleared in current implementation."

>=20
> Fix the subleaves value according to the host supported
> cpuid. The upcoming AMX feature would be the first one
> using it.
>=20
> Signed-off-by: Jing Liu <jing2.liu@intel.com>
> Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> ---
>  target/i386/cpu.h         | 1 +
>  target/i386/cpu.c         | 1 +
>  target/i386/kvm/kvm-cpu.c | 3 +++
>  3 files changed, 5 insertions(+)
>=20
> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index 04f2b790c9..7f9700544f 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -1354,6 +1354,7 @@ QEMU_BUILD_BUG_ON(sizeof(XSavePKRU) !=3D 0x8);
>  typedef struct ExtSaveArea {
>      uint32_t feature, bits;
>      uint32_t offset, size;
> +    uint32_t need_align;
>  } ExtSaveArea;
>=20
>  #define XSAVE_STATE_AREA_COUNT (XSTATE_PKRU_BIT + 1)
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index aa9e636800..47bc4d5c1a 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -5487,6 +5487,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t
> index, uint32_t count,
>                  const ExtSaveArea *esa =3D &x86_ext_save_areas[count];
>                  *eax =3D esa->size;
>                  *ebx =3D esa->offset;
> +                *ecx =3D esa->need_align << 1;
>              }
>          }
>          break;
> diff --git a/target/i386/kvm/kvm-cpu.c b/target/i386/kvm/kvm-cpu.c
> index d95028018e..6c4c1c6f9d 100644
> --- a/target/i386/kvm/kvm-cpu.c
> +++ b/target/i386/kvm/kvm-cpu.c
> @@ -105,6 +105,9 @@ static void kvm_cpu_xsave_init(void)
>                  assert(esa->size =3D=3D sz);
>                  esa->offset =3D kvm_arch_get_supported_cpuid(s, 0xd, i, =
R_EBX);
>              }
> +
> +            uint32_t ecx =3D kvm_arch_get_supported_cpuid(s, 0xd, i, R_E=
CX);
> +            esa->need_align =3D ecx & (1u << 1) ? 1 : 0;
>          }
>      }
>  }

