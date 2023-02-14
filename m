Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 203F6695789
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 04:42:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRmBY-0004ep-Ay; Mon, 13 Feb 2023 22:40:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dapeng1.mi@intel.com>)
 id 1pRmBW-0004ed-JC
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 22:40:50 -0500
Received: from mga02.intel.com ([134.134.136.20])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dapeng1.mi@intel.com>)
 id 1pRmBT-0002he-Qy
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 22:40:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676346047; x=1707882047;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BliWVdfqhjtu6TY5mey5qOtVYFcqVSwwjLbYsy8Zh9M=;
 b=T5eN8Q80hC6b05YEdpNnFWAfqto8wv7jlMnTLe1GQ/V7U2i+EAA5Yjck
 FO0izySUmVJKQwReJHm+9+U6z8a2CSXy73BoikGBi1A5PH7uWmT71LyoD
 TZVZbXas3iZi9L6GMLiWiQHeNuIAeM0R2DptEfbo/WjgVCiJZJ1JbrMj+
 RBrPuoKLbgdbUMO2cH0ZbyHKU8brYH9coQ4Q8L0wkXbyzEdskNNfQ8/m3
 YZzr1HojFXgzObfiE9PHfMncyQPZoGQvKIcZ2moZJBaTp2HJ8MNqc54uW
 zhff3hVnRT+IugMdDCCouucslAG4IH4CcMj8NR1IuIfFuwDONDplA3JS9 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="319099543"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; d="scan'208";a="319099543"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 19:40:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="792966212"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; d="scan'208";a="792966212"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP; 13 Feb 2023 19:40:29 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 13 Feb 2023 19:40:23 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 13 Feb 2023 19:40:23 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 13 Feb 2023 19:40:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lRXPlVJDlPuhg8RvLek1gKi+8G3+ND2HnbpEnQFm6vcon8E9U8NiRPA4MeW3k8IxyrFg0uHsqZmHC0d3eSDuxEki/bCs8IluvpfWdlRVkoOkQzmF/FW1Nw24zaMXPtwP3SkpZtQcORzGa3VyMiFMTKpMRuM/nTd3p2tQDorOjWzy+5TLpwNze/yMLtwCSrEHrpOfrJndHc4b9kqaeF/bLUwrzOeiKk7xfTjsIB3kpU1RD/zvdaLJHk50gDMNAw6VYbFoUogeyFINIiRvGrFkO1ct5+perp+/Uam+3cWjFW/vtWs6iKp62ApmYCGmD2xby1d5bbj29gN+9INVb++OyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tpzj/MNiP0FjmNzdjf6AeToWs/KfowmMlcuDfG5la+E=;
 b=Kr1+V1uWUFJwGAA0QJgsw08se3WIKGchOgnxuPB60N6yV3jVHxwKTScFRggVa4hir69GChw9CObjB6/XiyO7KlMgUDyxdExCGjl+AhC5nVGs1jxdWGgAIDAW7PJ0kmxCeQ+RfQBVnb0zNlm3Yf7nDA63XcgZLLPxLYq+DivQULNbbPAtqEJwz6ZyY7guxvy+cIgdrMq0pg+socQxNgmUPHci6/2UgdpnkJiiVQq5TJEaOAhhMfNMOWby720PmBD3iBAx1kDgn1/eHJhSD8Mlqfc9ia3Xsr4Ndvsm1hdKABbdos+pGpcHEZRmQrPR5EtOrFMQ5Y4jEfNLyPNNTmhx/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB4824.namprd11.prod.outlook.com (2603:10b6:510:38::13)
 by DS7PR11MB7930.namprd11.prod.outlook.com (2603:10b6:8:e5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Tue, 14 Feb
 2023 03:40:14 +0000
Received: from PH0PR11MB4824.namprd11.prod.outlook.com
 ([fe80::6b21:a6a4:3b0c:8aa0]) by PH0PR11MB4824.namprd11.prod.outlook.com
 ([fe80::6b21:a6a4:3b0c:8aa0%9]) with mapi id 15.20.6086.024; Tue, 14 Feb 2023
 03:40:14 +0000
From: "Mi, Dapeng1" <dapeng1.mi@intel.com>
To: Zhao Liu <zhao1.liu@linux.intel.com>, Eduardo Habkost
 <eduardo@habkost.net>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>, Yanan Wang
 <wangyanan55@huawei.com>, "Michael S . Tsirkin" <mst@redhat.com>, "Richard
 Henderson" <richard.henderson@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>, Markus Armbruster
 <armbru@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Wang, Zhenyu Z"
 <zhenyu.z.wang@intel.com>, "Ding, Zhuocheng" <zhuocheng.ding@intel.com>,
 Robert Hoo <robert.hu@linux.intel.com>, "Christopherson,, Sean"
 <seanjc@google.com>, Like Xu <like.xu.linux@gmail.com>, "Liu, Zhao1"
 <zhao1.liu@intel.com>, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Subject: RE: [RFC 25/52] mips: Replace MachineState.smp access with topology
 helpers
Thread-Topic: [RFC 25/52] mips: Replace MachineState.smp access with topology
 helpers
Thread-Index: AQHZP4/RqwwKZ85YQkKBBpcRD3hSn67NzMDw
Date: Tue, 14 Feb 2023 03:40:14 +0000
Message-ID: <PH0PR11MB48245BADED1B1F1BC34F5F53CDA29@PH0PR11MB4824.namprd11.prod.outlook.com>
References: <20230213095035.158240-1-zhao1.liu@linux.intel.com>
 <20230213095035.158240-26-zhao1.liu@linux.intel.com>
In-Reply-To: <20230213095035.158240-26-zhao1.liu@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB4824:EE_|DS7PR11MB7930:EE_
x-ms-office365-filtering-correlation-id: ff4068e1-5710-4b5f-7dfb-08db0e3d2efc
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: V+2NejXwbLZkGqbu9z5p8uz0OprnVy0Jg8Nszlymg4b4s2BiWSL03V+J5WPML/mUZ2YORt71iqoP8IPabFJ2ZPo3+5g5yqSH4FLMOs0KzFZIT1Gc3PvAHkG0c5NxiyX9VV6ulHtX+F+Laa4ms3B5/ZfZalUHDDG9zM28qcjNangwCVIBpe/fDPzX0gV9dyVTl8MaJg27LQf1CKWFy3g2vRhHPRXfqNptVQ3B3ke5eCMyVzYThaPnVrgKKL7TxOncZPhgF7bbFVT0CnsqE8RulkkuxxankK+7H3/OZhrqa/oGQwT4Sc0HLbGU530y3KzhbUx3hjnWhPXcTi6Wngy4N6DVlHj1Gd28QWAFrQBoFwXVaUKsYtL/ZNHAkF3PdpzzY4JMBSDMo6+Nl6hcLqMyISSCQ+0SWOv4pKTJkECzYLgv6YKiTkCttKD/3lOGEwGnwkeOzdfPBIJdzSvh8oc/lsOdU5t3b6IcIl5d7QotkqaWhuLx7F0h2kR7TTDnW964AqNGl/zo7zhdGeFEaV/KLviuyUwp7VvN0/fbxbnH7OSFn0EMPKhIABfUXHyfa0zSt8b+hFN05/ApcMePZ9J39itOHB5g+tvFambmTmTob4ntFvcE1lPLGSXCioWRmxsT4OKCRVYty/iaHn+yTsqzl1UBzSnDMk7cMaCiWPGsxTQEMCKauRdVwQvRZ5U/Y3xlfCN+3ixUS/me0PlSlfHEDvbJNTuyLYUs/GO/gyGFUks=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB4824.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(39860400002)(376002)(346002)(396003)(136003)(451199018)(76116006)(33656002)(54906003)(66446008)(4326008)(66946007)(478600001)(64756008)(7696005)(66556008)(66476007)(8676002)(82960400001)(38070700005)(921005)(86362001)(316002)(6506007)(9686003)(55016003)(186003)(53546011)(26005)(8936002)(41300700001)(52536014)(71200400001)(110136005)(83380400001)(5660300002)(122000001)(38100700002)(2906002)(7416002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?y7zRFxpWa/4bR4ZeHCqukF5qss+DJwrxxSDS6YYThdQeEbzdEoGh7jJSMk?=
 =?iso-8859-1?Q?ez5YKDH9K0DM4VI5MvAXSX/XkQxw8sK8LWleWEyVeKPKn7udfLP5QPhzZp?=
 =?iso-8859-1?Q?g9o4I+BA34gW+ngZ5l7574DrQnX3ghtDvcul362PbbhBmCB8mBxd9DEJ+Q?=
 =?iso-8859-1?Q?6EbrJqBbV1yq+b/9xWfvDSFdKA3Ske3Re6bswWDFIl8nEi9A7Kgn6NEaCd?=
 =?iso-8859-1?Q?Kasxm2/HZVvqWJxlX14Y/qhuikseqgBwyfXMoh67GEbPBbGsvcRtAehCO4?=
 =?iso-8859-1?Q?1cU5OzeEDYnwsMQ6jkXhsTo0V2vC+SHgxHlvr1suI0/ieStgeG0yIFLE8d?=
 =?iso-8859-1?Q?uui170wj+ByKj4ycmedTgfIsXDGnpQi7F59ItFBol7HTkiopP5b0sBsIil?=
 =?iso-8859-1?Q?FiDc7FtoAgO7Zj28UAYLqCfs4hSskigCs4ytNPa7vrAHEgMhacbPF/sPGu?=
 =?iso-8859-1?Q?3zlEHd1eTr6XifogmthyCaDm5r9XmzAnoznJZkEvPacYwGddX/gknEoVwQ?=
 =?iso-8859-1?Q?KLuyOpL1sExiugSXOgJoL6+/5nSc3ZrgHuiWDqnWnLDM83kKo+W9jNI37h?=
 =?iso-8859-1?Q?PiP6hhPXTO1b2SjNeFMBq9TUG53tCwX7kFl6otSwca5iZc9g553DnlQn+L?=
 =?iso-8859-1?Q?rhS7FjF7nIXlqaRPwp1q6M9mHuNy9X2wZIElNb8IouIu0ELgvW02XFMVRR?=
 =?iso-8859-1?Q?/zhHNNjNW1V+XvoWr/6gjfZqNvOOqtNBS2VT9ykg+GDwHs8o67voLha+0P?=
 =?iso-8859-1?Q?OHfk3bHBDe9Q29euNKPMrcxHI6zGZPbXVjQ5hvXL2tZsDS0X6GtS119Pmf?=
 =?iso-8859-1?Q?7jjRNDxjq6MpwmnnCUEyQlmKazqQbZA8g+5IYdHIPuWui6bukqQ6fPw9J3?=
 =?iso-8859-1?Q?jAw5RUx/2iDSDvCH0UJGWHQt3NDZF8KCy/as0kXS4vmv6af+JT0AhU8exZ?=
 =?iso-8859-1?Q?/in+moMWvqaCvUF/jsaUPctebV1Br3Wtt0gxglY9HIcqZaDP9lItNYeYUf?=
 =?iso-8859-1?Q?fFxcVZkHf/Tyhy1amgKrYTVs2ZuHzIY5XMNpYh6fLS5IwzDSXYGeYkn+IL?=
 =?iso-8859-1?Q?CR8dBAIzabMbPPCPLeqspNnSqz0LpEQYTNtjUS2nF+oTOKSyCGhn4srCKX?=
 =?iso-8859-1?Q?dEM9jXXaXlcL6+v7+M7n3k1FoZOWy1ZSzzbLCX7wpVAbKkCYysUgI/ltaq?=
 =?iso-8859-1?Q?hgx9HT0bHgi97BBcqoOlUWc2ojjV4bNYMUuY/ZdCkG4ZUTsyFcCOEtkjqQ?=
 =?iso-8859-1?Q?jDMHVYlQeGmrKuYCfM0Qvoz/L4Dr1dEZVZ8N5+JhucWvom/OHFkeKayA5O?=
 =?iso-8859-1?Q?ZC+ZKDtAD4jRbzDVx5cMrDMQaWgq/dSQGUTvemWUfaIxCfsnkk7DkIwrCR?=
 =?iso-8859-1?Q?pgj7YPC5j9tkqTHYdWnZ3PFZ07Tj2VCs8CJ1p9PFRGeCSJ2mD2IxogQR0G?=
 =?iso-8859-1?Q?Rm7LdkfKoA754tmDpisAZjsEu2CGZ0bQlxhuiKkcd+AgOuyQ2Zk+LdKBey?=
 =?iso-8859-1?Q?/WvSfstSBpOwPbdHVTAI7GhI1/5vTGOPlG0E4nH3EA3FFcbpfzf5QuqAMk?=
 =?iso-8859-1?Q?traxqXIxkHjtcRrY3xk57r0h6rNBnIQnHv4lRLk+QOkuEVHfsD5VPRxRO7?=
 =?iso-8859-1?Q?iuhwYmUaV+gvIIHsumDA3Lv0qOEnFiXtZB?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff4068e1-5710-4b5f-7dfb-08db0e3d2efc
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2023 03:40:14.6994 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P4NbtRzHQkd5H2FjBImL86qroZhZhhXDeVh7OobpcrgvwXze45ilYuM6h4rI6R9r6+E9ns/m20C81J21KxCVig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7930
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.20; envelope-from=dapeng1.mi@intel.com;
 helo=mga02.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

> From: Zhao Liu <zhao1.liu@linux.intel.com>
> Sent: Monday, February 13, 2023 5:50 PM
> To: Eduardo Habkost <eduardo@habkost.net>; Marcel Apfelbaum
> <marcel.apfelbaum@gmail.com>; Philippe Mathieu-Daud=E9 <philmd@linaro.org=
>;
> Yanan Wang <wangyanan55@huawei.com>; Michael S . Tsirkin
> <mst@redhat.com>; Richard Henderson <richard.henderson@linaro.org>; Paolo
> Bonzini <pbonzini@redhat.com>; Eric Blake <eblake@redhat.com>; Markus
> Armbruster <armbru@redhat.com>
> Cc: qemu-devel@nongnu.org; Wang, Zhenyu Z <zhenyu.z.wang@intel.com>; Mi,
> Dapeng1 <dapeng1.mi@intel.com>; Ding, Zhuocheng
> <zhuocheng.ding@intel.com>; Robert Hoo <robert.hu@linux.intel.com>;
> Christopherson,, Sean <seanjc@google.com>; Like Xu
> <like.xu.linux@gmail.com>; Liu, Zhao1 <zhao1.liu@intel.com>; Aleksandar
> Rikalo <aleksandar.rikalo@syrmia.com>; Huacai Chen
> <chenhuacai@kernel.org>; Jiaxun Yang <jiaxun.yang@flygoat.com>; Aurelien
> Jarno <aurelien@aurel32.net>
> Subject: [RFC 25/52] mips: Replace MachineState.smp access with topology
> helpers
>=20
> From: Zhao Liu <zhao1.liu@intel.com>
>=20
> When MachineState.topo is introduced, the topology related structures
> become complicated. So we wrapped the access to topology fields of
> MachineState.topo into some helpers, and we are using these helpers
> to replace the use of MachineState.smp.
>=20
> For mips, it's straightforward to replace topology access with wrapped
> generic interfaces.
>=20
> Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
> Cc: Huacai Chen <chenhuacai@kernel.org>
> Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Cc: Aurelien Jarno <aurelien@aurel32.net>
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> ---
>  hw/mips/boston.c          |  8 +++++---
>  hw/mips/loongson3_bootp.c |  7 ++++---
>  hw/mips/loongson3_virt.c  |  8 +++++---
>  hw/mips/malta.c           | 10 ++++++----
>  4 files changed, 20 insertions(+), 13 deletions(-)
>=20
> diff --git a/hw/mips/boston.c b/hw/mips/boston.c
> index a9d87f34378f..d02c88d769d4 100644
> --- a/hw/mips/boston.c
> +++ b/hw/mips/boston.c
> @@ -514,7 +514,7 @@ static const void *create_fdt(BostonState *s,
>                                const MemMapEntry *memmap, int *dt_size)
>  {
>      void *fdt;
> -    int cpu;
> +    int cpu, smp_cpus;
>      MachineState *ms =3D s->mach;
>      uint32_t platreg_ph, gic_ph, clk_ph;
>      char *name, *gic_name, *platreg_name, *stdout_name;
> @@ -542,7 +542,8 @@ static const void *create_fdt(BostonState *s,
>      qemu_fdt_setprop_cell(fdt, "/cpus", "#size-cells", 0x0);
>      qemu_fdt_setprop_cell(fdt, "/cpus", "#address-cells", 0x1);
>=20
> -    for (cpu =3D 0; cpu < ms->smp.cpus; cpu++) {
> +    smp_cpus =3D machine_topo_get_cpus(ms);
> +    for (cpu =3D 0; cpu < smp_cpus; cpu++) {
>          name =3D g_strdup_printf("/cpus/cpu@%d", cpu);
>          qemu_fdt_add_subnode(fdt, name);
>          qemu_fdt_setprop_string(fdt, name, "compatible", "img,mips");
> @@ -702,7 +703,8 @@ static void boston_mach_init(MachineState *machine)
>      object_initialize_child(OBJECT(machine), "cps", &s->cps, TYPE_MIPS_C=
PS);
>      object_property_set_str(OBJECT(&s->cps), "cpu-type", machine->cpu_ty=
pe,
>                              &error_fatal);
> -    object_property_set_int(OBJECT(&s->cps), "num-vp", machine->smp.cpus=
,
> +    object_property_set_int(OBJECT(&s->cps), "num-vp",
> +                            machine_topo_get_cpus(machine),
>                              &error_fatal);

It's better move "&error_fatal);" to previous line.

>      qdev_connect_clock_in(DEVICE(&s->cps), "clk-in",
>                            qdev_get_clock_out(dev, "cpu-refclk"));
> diff --git a/hw/mips/loongson3_bootp.c b/hw/mips/loongson3_bootp.c
> index f99af229327a..d9a92825ceae 100644
> --- a/hw/mips/loongson3_bootp.c
> +++ b/hw/mips/loongson3_bootp.c
> @@ -40,9 +40,10 @@ static void init_cpu_info(void *g_cpuinfo, uint64_t
> cpu_freq)
>      }
>=20
>      c->cpu_startup_core_id =3D cpu_to_le16(0);
> -    c->nr_cpus =3D cpu_to_le32(current_machine->smp.cpus);
> -    c->total_node =3D cpu_to_le32(DIV_ROUND_UP(current_machine->smp.cpus=
,
> -                                             LOONGSON3_CORE_PER_NODE));
> +    c->nr_cpus =3D cpu_to_le32(machine_topo_get_cpus(current_machine));
> +    c->total_node =3D
> +        cpu_to_le32(DIV_ROUND_UP(machine_topo_get_cpus(current_machine),
> +                                 LOONGSON3_CORE_PER_NODE));
>  }
>=20
>  static void init_memory_map(void *g_map, uint64_t ram_size)
> diff --git a/hw/mips/loongson3_virt.c b/hw/mips/loongson3_virt.c
> index 25534288dd81..c972bb43a1f7 100644
> --- a/hw/mips/loongson3_virt.c
> +++ b/hw/mips/loongson3_virt.c
> @@ -271,8 +271,10 @@ static void fw_conf_init(unsigned long ram_size)
>      hwaddr cfg_addr =3D virt_memmap[VIRT_FW_CFG].base;
>=20
>      fw_cfg =3D fw_cfg_init_mem_wide(cfg_addr, cfg_addr + 8, 8, 0, NULL);
> -    fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, (uint16_t)current_machine-
> >smp.cpus);
> -    fw_cfg_add_i16(fw_cfg, FW_CFG_MAX_CPUS, (uint16_t)current_machine-
> >smp.max_cpus);
> +    fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS,
> +                   (uint16_t)machine_topo_get_cpus(current_machine));
> +    fw_cfg_add_i16(fw_cfg, FW_CFG_MAX_CPUS,
> +                   (uint16_t)machine_topo_get_max_cpus(current_machine))=
;
>      fw_cfg_add_i64(fw_cfg, FW_CFG_RAM_SIZE, (uint64_t)ram_size);
>      fw_cfg_add_i32(fw_cfg, FW_CFG_MACHINE_VERSION, 1);
>      fw_cfg_add_i64(fw_cfg, FW_CFG_CPU_FREQ, get_cpu_freq_hz());
> @@ -528,7 +530,7 @@ static void mips_loongson3_virt_init(MachineState
> *machine)
>      cpuclk =3D clock_new(OBJECT(machine), "cpu-refclk");
>      clock_set_hz(cpuclk, DEF_LOONGSON3_FREQ);
>=20
> -    for (i =3D 0; i < machine->smp.cpus; i++) {
> +    for (i =3D 0; i < machine_topo_get_cpus(machine); i++) {
>          int ip;
>=20
>          /* init CPUs */
> diff --git a/hw/mips/malta.c b/hw/mips/malta.c
> index ec172b111ae4..b3322f74baf5 100644
> --- a/hw/mips/malta.c
> +++ b/hw/mips/malta.c
> @@ -981,7 +981,7 @@ static uint64_t load_kernel(void)
>  static void malta_mips_config(MIPSCPU *cpu)
>  {
>      MachineState *ms =3D MACHINE(qdev_get_machine());
> -    unsigned int smp_cpus =3D ms->smp.cpus;
> +    unsigned int smp_cpus =3D machine_topo_get_cpus(ms);
>      CPUMIPSState *env =3D &cpu->env;
>      CPUState *cs =3D CPU(cpu);
>=20
> @@ -1045,7 +1045,7 @@ static void create_cpu_without_cps(MachineState
> *ms, MaltaState *s,
>      MIPSCPU *cpu;
>      int i;
>=20
> -    for (i =3D 0; i < ms->smp.cpus; i++) {
> +    for (i =3D 0; i < machine_topo_get_cpus(ms); i++) {
>          cpu =3D mips_cpu_create_with_clock(ms->cpu_type, s->cpuclk);
>=20
>          /* Init internal devices */
> @@ -1066,7 +1066,8 @@ static void create_cps(MachineState *ms, MaltaState
> *s,
>      object_initialize_child(OBJECT(s), "cps", &s->cps, TYPE_MIPS_CPS);
>      object_property_set_str(OBJECT(&s->cps), "cpu-type", ms->cpu_type,
>                              &error_fatal);
> -    object_property_set_int(OBJECT(&s->cps), "num-vp", ms->smp.cpus,
> +    object_property_set_int(OBJECT(&s->cps), "num-vp",
> +                            machine_topo_get_cpus(ms),
>                              &error_fatal);
>      qdev_connect_clock_in(DEVICE(&s->cps), "clk-in", s->cpuclk);
>      sysbus_realize(SYS_BUS_DEVICE(&s->cps), &error_fatal);
> @@ -1080,7 +1081,8 @@ static void create_cps(MachineState *ms, MaltaState
> *s,
>  static void mips_create_cpu(MachineState *ms, MaltaState *s,
>                              qemu_irq *cbus_irq, qemu_irq *i8259_irq)
>  {
> -    if ((ms->smp.cpus > 1) && cpu_type_supports_cps_smp(ms->cpu_type)) {
> +    if ((machine_topo_get_cpus(ms) > 1) &&
> +        cpu_type_supports_cps_smp(ms->cpu_type)) {
>          create_cps(ms, s, cbus_irq, i8259_irq);
>      } else {
>          create_cpu_without_cps(ms, s, cbus_irq, i8259_irq);
> --
> 2.34.1


