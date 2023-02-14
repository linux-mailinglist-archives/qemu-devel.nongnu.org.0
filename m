Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F63695694
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 03:18:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRktW-0000X9-UB; Mon, 13 Feb 2023 21:18:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dapeng1.mi@intel.com>)
 id 1pRktS-0000X1-5x
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 21:18:06 -0500
Received: from mga09.intel.com ([134.134.136.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dapeng1.mi@intel.com>)
 id 1pRktN-0002NI-H2
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 21:18:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676341081; x=1707877081;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=T03d5YNffR20oh1Xr2dfAO5sQWs5RkSaKQgUyxISlsw=;
 b=OLN+dGZhQcQAQFBO1S/LMLmCkYz7aYlLk+8+MqsDgLNuA8fBy1h8HrFK
 Ntf3KyouPQ2uf0ZRi7TNeXQgc+hBLH3YTDTAN0Z+gyLVX+C+E4m/8F4vp
 HcGm2rzQsrt3VX5tJUTQkvS9LPYcrv3okA/O15UbpLjm/Fe9G7gIf02tu
 y8S6vCYYw0cE2m35EtGH02cvgVx3vJC5JoyOcrJjEW1MydeeyY1rS5QGO
 k8z4Zh6CE9YRc35ZN7sH/4v9dbSG9CBIGH4igug4zAkBTB1nmZT/89jG9
 2Y3ZKHLPrK2crL8TwdNaGf0Evlu+8gnPCfurXmN8SjEGjof3TQ8xxL92P g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="332369140"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; d="scan'208";a="332369140"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 18:17:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="997910778"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; d="scan'208";a="997910778"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP; 13 Feb 2023 18:17:52 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 13 Feb 2023 18:17:51 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 13 Feb 2023 18:17:51 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.105)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 13 Feb 2023 18:17:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RNq1SvDjte5BSew3AXli0Ff0WxJYjhOAbiLx6+uIVy1R5vIskO3SeRHGrNAMbooVwf0DGpi3LJOWXL1Vx/xc+Ir/H/hdr7n0RF6AQZrXshMQg/sXqI2Qg5Fpcj3EgMtEi4+zr1CdTQNUMjXwXW+nkJ9UamFLQ0hU+TONpWRiYy7cbcqvyFQ9TOVCxZpwbIo77Y6WGfcO3ru2V7FSYJhb6GS11CLao+Usy7Mmnhs1DlIRZHgB2vpmw9LtydRS5pAaTvqozPhLHfaE7xSI7F98HelZ+x+EPrj6jacYucMG8yq0BjuQDzG0CiNzoYCZLUyXPhbbgFt9/o8kGWwIqgeVRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=efJz9aO7610aCOmwVQSV1FNmKDX0ocHCPN5EHO/9f5w=;
 b=VKuiaSE0wL6gUqKGOiK4o+bVi/Fu8vlIA51XEBB0jpl0hMcGdV5iQm22cs5MN7H7OS+dvPXKBfgpxRfU2/nt1Fuh0tmSjTJ9mZyX89eoeIrzyJiG83iUmv4jcdswk/6pge27rVUlsUymZcjxqHCk/8/Adw1oSG5olikeE3mgZMdanaHm1OD6gWtMGJn3MIXswyjbyK5CXuGSYWTjRmJwCe0Blxh6eB3QghcRXuj2EV1IMARKgGzbcgc7Gy9+4y8uTlRM8vTuEdJW5z+leApE9ZNdEwoFyoKGNEk8lA3tY9CyiV/RUsxpJvWuV1n+BZWWaAZFxO8Gd8wCSxDPihlPCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB4824.namprd11.prod.outlook.com (2603:10b6:510:38::13)
 by PH8PR11MB7094.namprd11.prod.outlook.com (2603:10b6:510:216::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.23; Tue, 14 Feb
 2023 02:17:45 +0000
Received: from PH0PR11MB4824.namprd11.prod.outlook.com
 ([fe80::6b21:a6a4:3b0c:8aa0]) by PH0PR11MB4824.namprd11.prod.outlook.com
 ([fe80::6b21:a6a4:3b0c:8aa0%9]) with mapi id 15.20.6086.024; Tue, 14 Feb 2023
 02:17:45 +0000
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
 <zhao1.liu@intel.com>, "Meng, Bin" <bin.meng@windriver.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alistair Francis <alistair.francis@wdc.com>, "Vijai
 Kumar K" <vijai@behindbytes.com>
Subject: RE: [RFC 22/52] riscv: Replace MachineState.smp access with topology
 helpers
Thread-Topic: [RFC 22/52] riscv: Replace MachineState.smp access with topology
 helpers
Thread-Index: AQHZP4/JfHmMzvxa/E+jRm261cRvZK7NtK4w
Date: Tue, 14 Feb 2023 02:17:45 +0000
Message-ID: <PH0PR11MB4824634746AFB4E54381D02CCDA29@PH0PR11MB4824.namprd11.prod.outlook.com>
References: <20230213095035.158240-1-zhao1.liu@linux.intel.com>
 <20230213095035.158240-23-zhao1.liu@linux.intel.com>
In-Reply-To: <20230213095035.158240-23-zhao1.liu@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB4824:EE_|PH8PR11MB7094:EE_
x-ms-office365-filtering-correlation-id: cb47333e-58dc-429c-c084-08db0e31a91e
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: c0TiFk5PYQkptrQzA9YPcKu7oF2XIuaK7HDfuE6vWF+H/hNfb7/2WlJMZbDHmAmmSHrsc1SyxoPAqyh4QTa8MWbVtyzKs3Srcw5TJ5peY5bCpRQOKqM/VqDslRF+G3fuQszUnEebf1jmGA3t3VcQnZVUXMXnW/0P6BacH04JXDF49IeQycCWoztnUrPLnPMuXrNVWu3DuzTrcxvegAsBKldFypDfEzxYMQIf+Fj/d2pPDN+u1wmlilvbVgjZ82MxK50EZPNOieX0LmH+Y5AsGmvM0AKk9zjlsuFakAbNjsg/wPLdUq3UaiYVIOMJCefOcg/f7cO38N/6WZf/3o8G+DXlfgMH8lx1/yV2RPCmamzXJjvMWyKIMV540XoEYx63A0UEns1CnOovA0Z6QWd03P4mUikiS43bF9Ow+qcTwc9LSAtg6kCDs73raUZikmmdZKDUzR5rMSSeiXDxn6nkRb+BKsEd/gNjELg3DsxF03DwGG02vGZA14G3jVttrPZJUhtN+269A/HrhFO01y4XPHK/l02YhgAPhlHru5u5oUoCq+xoR0XsqPPFaxbj/YPMCt4fqR7LY6+2RuI9ImobDPObq837B8afQugreBhr5r/lVIhlMpuKgEFkBmc0JwZrIrKFtngj5mFpHDYmxhdQUSJ2CB/AMan5pRcd1UwnjwCsvTdzaOSUHGuOC2y+VfwotVX5Dfr8OGdM++TbYhAkdKojmSOtfRkT4eJnkCjAHLw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB4824.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(396003)(346002)(376002)(366004)(136003)(451199018)(9686003)(26005)(186003)(6506007)(7696005)(71200400001)(54906003)(4326008)(64756008)(8676002)(53546011)(478600001)(76116006)(66446008)(66476007)(66946007)(110136005)(316002)(52536014)(8936002)(41300700001)(5660300002)(83380400001)(66556008)(2906002)(30864003)(7416002)(38070700005)(38100700002)(82960400001)(122000001)(921005)(86362001)(55016003)(33656002)(579004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?OZ48XAMO1oDsVLXYWvTEDpXuRlVoiJj+Q9372QVZPt27CLrQaFpJG5Q5cL?=
 =?iso-8859-1?Q?BCcAx1cNXbQXhRWzLQ9LfktHhizIPMz0Td30WqqT3vsVFQGWw2Z186CjGk?=
 =?iso-8859-1?Q?78mQtortuF1qFkYgIGETxvPUJZraw1tkpkS5uiURmVmD8FQF6jEqUvvqP6?=
 =?iso-8859-1?Q?XOZzIHchnSNDc6e8ZlZebMfW6/uGC1XdyznDRbr9Gc2nftwJ8LecACzurT?=
 =?iso-8859-1?Q?TdNMG47RIqruNxp68ZhfZfgB9S7X4RHTvPSD5h0M/UGuBVnmPhydezeWVH?=
 =?iso-8859-1?Q?Mx7f5g25e3eoWNSe7Afpt7ULBp/CXf7wB0s+xXIDIwIvfH/4DaMGQrxOPe?=
 =?iso-8859-1?Q?oTEegLN+78Lp1PBQcRarYLhO0j5UlYNT8u+pdN9dVLiQQYgoBxx9l70R4U?=
 =?iso-8859-1?Q?yYzO5wkaV/sK/H2L10rePVSFNluxb3Y0OETKfc6BsGevV9JzomYySrGs06?=
 =?iso-8859-1?Q?sAJ6aUrheJWD1zIKEFbUcaPGljykyBFEBSIP/ap1gqGavg3eh583rhCP1k?=
 =?iso-8859-1?Q?xPLMduyVApxfnVIqbVMZyrb7lTooh9OcNLW7dfzit2ZOJnxDJtx9OQ07d9?=
 =?iso-8859-1?Q?y1jfz6ch1GqiOLELuFgTNOTZNrREHapv02BHx6DxJZg3Dhx78WzIcNcg1o?=
 =?iso-8859-1?Q?WpqSTX08tnSIubRYCaQCKKuDCxxOb56h1ZgfyW0AqOBrFq7WwEFaZotDqz?=
 =?iso-8859-1?Q?ePkzEaP7eNXkdwXqJxY0g0ZS9R/lTtKp8LIJ/ja+5OTG97gSpxlLapTjOK?=
 =?iso-8859-1?Q?+v6Eh4ydWNxRcOnSonO4Kny50gcai0ircTjGUKLJqZxCmZNiQA8bShWqaB?=
 =?iso-8859-1?Q?k4EDf8VjwEqskZY01JWztX79EdGV70h8x3p0mFv34RmamWSud81eASZZpe?=
 =?iso-8859-1?Q?8p49CgsC6sbk8gXTKF6EpfvU8kqG9TVJk1JYJOO4VsPav0lbxWPl5D6AfF?=
 =?iso-8859-1?Q?zhjaXV5RGGJ5yH0LYcqZqGVN3g/oL28YI+p8eZXQwTbWkEX9eCQ6O3vEoz?=
 =?iso-8859-1?Q?NdlBFcSKeNu6BKwiX9vYZX8KMZxVd/danl263ImgII1F3tYMWWhNzUGpaN?=
 =?iso-8859-1?Q?XN97dgZUXXHG3UGSmVSeBjTn33kV+plZzPb/VRV8uK9pLrqHV/O++rnh+j?=
 =?iso-8859-1?Q?RZIVKhcwghV2zZ9PVu4ftYW1AD3j4MACv7GFwN3nHvOO246OaIvkJa919/?=
 =?iso-8859-1?Q?OKip0eNVG0840XNAMeSqV8hNhxHjsHkQvVjOWRKABFD6dU41oZn1zyYa5D?=
 =?iso-8859-1?Q?sKvt01JMUObt3uHRi6VoCTkX7YFj3NgWN7AB+rEN44NMvKMI+UxPfkhnsS?=
 =?iso-8859-1?Q?onPvU32HiFYs+VJxtr1KClIzbGudMHVwsdnEAR6bOcOQtw5zYz0j0XlMOY?=
 =?iso-8859-1?Q?ldBDTz10h+KO7c4f5ibTdpDTx18hgK7GKEwTemLWbbaYFroGxdnzZKUdZf?=
 =?iso-8859-1?Q?Vsf8bvrNbLF1bInCi7eOZP/ZiPHBz0rrb+5QfacJ6qP7elrzWJtuYQQ1kH?=
 =?iso-8859-1?Q?xQrGqrkrLtx0FwU5CaDz97lFXXnEjsB3t8/Axe2Ji4rYwm5YANG1y3ZXA3?=
 =?iso-8859-1?Q?dk6fW5OfeXnmwAc7mnvZfVayhrc1U6R1pdThk3c36zQ6ceXw5Tbt6fkjIK?=
 =?iso-8859-1?Q?HW6rQYi7RYCZMeHFjSPnqQ5UPsJ//UsnRX?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb47333e-58dc-429c-c084-08db0e31a91e
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2023 02:17:45.6452 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RsXU3JCLLF9CNVrB2rZPXMt4lGddYiF6s8GNdgKPqHpjdsnFkseXVXbY6CHMgdYXctwhlXI70PYl/vtDJtoCvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7094
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.24; envelope-from=dapeng1.mi@intel.com;
 helo=mga09.intel.com
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
> <like.xu.linux@gmail.com>; Liu, Zhao1 <zhao1.liu@intel.com>; Meng, Bin
> <bin.meng@windriver.com>; Palmer Dabbelt <palmer@dabbelt.com>; Alistair
> Francis <alistair.francis@wdc.com>; Vijai Kumar K <vijai@behindbytes.com>
> Subject: [RFC 22/52] riscv: Replace MachineState.smp access with topology
> helpers
>=20
> From: Zhao Liu <zhao1.liu@intel.com>
>=20
> When MachineState.topo is introduced, the topology related structures
> become complicated. So we wrapped the access to topology fields of
> MachineState.topo into some helpers, and we are using these helpers
> to replace the use of MachineState.smp.
>=20
> In the codes of riscv, it's straightforward to replace topology access
> with wrapped generic interfaces.
>=20
> Cc: Bin Meng <bin.meng@windriver.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Alistair Francis <alistair.francis@wdc.com>
> CC: Vijai Kumar K <vijai@behindbytes.com>
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> ---
>  hw/riscv/microchip_pfsoc.c | 11 ++++++-----
>  hw/riscv/numa.c            | 21 +++++++++++----------
>  hw/riscv/opentitan.c       |  8 ++++----
>  hw/riscv/shakti_c.c        |  2 +-
>  hw/riscv/sifive_e.c        | 10 ++++++----
>  hw/riscv/sifive_u.c        | 28 ++++++++++++++--------------
>  hw/riscv/virt.c            | 24 +++++++++++++-----------
>  7 files changed, 55 insertions(+), 49 deletions(-)
>=20
> diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
> index 2b91e49561f1..30295cce17e7 100644
> --- a/hw/riscv/microchip_pfsoc.c
> +++ b/hw/riscv/microchip_pfsoc.c
> @@ -164,7 +164,8 @@ static void microchip_pfsoc_soc_instance_init(Object
> *obj)
>=20
>      object_initialize_child(OBJECT(&s->u_cluster), "u-cpus", &s->u_cpus,
>                              TYPE_RISCV_HART_ARRAY);
> -    qdev_prop_set_uint32(DEVICE(&s->u_cpus), "num-harts", ms->smp.cpus -=
 1);
> +    qdev_prop_set_uint32(DEVICE(&s->u_cpus), "num-harts",
> +                         machine_topo_get_cpus(ms) - 1);
>      qdev_prop_set_uint32(DEVICE(&s->u_cpus), "hartid-base", 1);
>      qdev_prop_set_string(DEVICE(&s->u_cpus), "cpu-type",
>                           TYPE_RISCV_CPU_SIFIVE_U54);
> @@ -249,10 +250,10 @@ static void microchip_pfsoc_soc_realize(DeviceState
> *dev, Error **errp)
>=20
>      /* CLINT */
>      riscv_aclint_swi_create(memmap[MICROCHIP_PFSOC_CLINT].base,
> -        0, ms->smp.cpus, false);
> +        0, machine_topo_get_cpus(ms), false);
>      riscv_aclint_mtimer_create(
>          memmap[MICROCHIP_PFSOC_CLINT].base + RISCV_ACLINT_SWI_SIZE,
> -        RISCV_ACLINT_DEFAULT_MTIMER_SIZE, 0, ms->smp.cpus,
> +        RISCV_ACLINT_DEFAULT_MTIMER_SIZE, 0, machine_topo_get_cpus(ms),
>          RISCV_ACLINT_DEFAULT_MTIMECMP, RISCV_ACLINT_DEFAULT_MTIME,
>          CLINT_TIMEBASE_FREQ, false);
>=20
> @@ -276,11 +277,11 @@ static void microchip_pfsoc_soc_realize(DeviceState
> *dev, Error **errp)
>                                  l2lim_mem);
>=20
>      /* create PLIC hart topology configuration string */
> -    plic_hart_config =3D riscv_plic_hart_config_string(ms->smp.cpus);
> +    plic_hart_config =3D
> riscv_plic_hart_config_string(machine_topo_get_cpus(ms));
>=20
>      /* PLIC */
>      s->plic =3D sifive_plic_create(memmap[MICROCHIP_PFSOC_PLIC].base,
> -        plic_hart_config, ms->smp.cpus, 0,
> +        plic_hart_config, machine_topo_get_cpus(ms), 0,
>          MICROCHIP_PFSOC_PLIC_NUM_SOURCES,
>          MICROCHIP_PFSOC_PLIC_NUM_PRIORITIES,
>          MICROCHIP_PFSOC_PLIC_PRIORITY_BASE,
> diff --git a/hw/riscv/numa.c b/hw/riscv/numa.c
> index 472010256183..1fabdc42e767 100644
> --- a/hw/riscv/numa.c
> +++ b/hw/riscv/numa.c
> @@ -37,13 +37,14 @@ int riscv_socket_count(const MachineState *ms)
>=20
>  int riscv_socket_first_hartid(const MachineState *ms, int socket_id)
>  {
> -    int i, first_hartid =3D ms->smp.cpus;
> +    int i, first_hartid, cpus =3D machine_topo_get_cpus(ms);
>=20
> +    first_hartid =3D cpus;
>      if (!numa_enabled(ms)) {
>          return (!socket_id) ? 0 : -1;
>      }
>=20
> -    for (i =3D 0; i < ms->smp.cpus; i++) {
> +    for (i =3D 0; i < cpus; i++) {
>          if (ms->possible_cpus->cpus[i].props.node_id !=3D socket_id) {
>              continue;
>          }
> @@ -52,18 +53,18 @@ int riscv_socket_first_hartid(const MachineState *ms,
> int socket_id)
>          }
>      }
>=20
> -    return (first_hartid < ms->smp.cpus) ? first_hartid : -1;
> +    return (first_hartid < cpus) ? first_hartid : -1;
>  }
>=20
>  int riscv_socket_last_hartid(const MachineState *ms, int socket_id)
>  {
> -    int i, last_hartid =3D -1;
> +    int i, last_hartid =3D -1, cpus =3D machine_topo_get_cpus(ms);
>=20
>      if (!numa_enabled(ms)) {
> -        return (!socket_id) ? ms->smp.cpus - 1 : -1;
> +        return (!socket_id) ? cpus - 1 : -1;
>      }
>=20
> -    for (i =3D 0; i < ms->smp.cpus; i++) {
> +    for (i =3D 0; i < cpus; i++) {
>          if (ms->possible_cpus->cpus[i].props.node_id !=3D socket_id) {
>              continue;
>          }
> @@ -72,7 +73,7 @@ int riscv_socket_last_hartid(const MachineState *ms, in=
t
> socket_id)
>          }
>      }
>=20
> -    return (last_hartid < ms->smp.cpus) ? last_hartid : -1;
> +    return (last_hartid < cpus) ? last_hartid : -1;
>  }
>=20
>  int riscv_socket_hart_count(const MachineState *ms, int socket_id)
> @@ -80,7 +81,7 @@ int riscv_socket_hart_count(const MachineState *ms, int
> socket_id)
>      int first_hartid, last_hartid;
>=20
>      if (!numa_enabled(ms)) {
> -        return (!socket_id) ? ms->smp.cpus : -1;
> +        return (!socket_id) ? machine_topo_get_cpus(ms) : -1;
>      }
>=20
>      first_hartid =3D riscv_socket_first_hartid(ms, socket_id);
> @@ -208,7 +209,7 @@ int64_t riscv_numa_get_default_cpu_node_id(const
> MachineState *ms, int idx)
>      int64_t nidx =3D 0;
>=20
>      if (ms->numa_state->num_nodes) {
> -        nidx =3D idx / (ms->smp.cpus / ms->numa_state->num_nodes);
> +        nidx =3D idx / (machine_topo_get_cpus(ms) / ms->numa_state->num_=
nodes);
>          if (ms->numa_state->num_nodes <=3D nidx) {
>              nidx =3D ms->numa_state->num_nodes - 1;
>          }
> @@ -220,7 +221,7 @@ int64_t riscv_numa_get_default_cpu_node_id(const
> MachineState *ms, int idx)
>  const CPUArchIdList *riscv_numa_possible_cpu_arch_ids(MachineState *ms)
>  {
>      int n;
> -    unsigned int max_cpus =3D ms->smp.max_cpus;
> +    unsigned int max_cpus =3D machine_topo_get_max_cpus(ms);
>=20
>      if (ms->possible_cpus) {
>          assert(ms->possible_cpus->len =3D=3D max_cpus);
> diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
> index 353f030d80c1..fb59c43dcc08 100644
> --- a/hw/riscv/opentitan.c
> +++ b/hw/riscv/opentitan.c
> @@ -143,11 +143,11 @@ static void lowrisc_ibex_soc_realize(DeviceState
> *dev_soc, Error **errp)
>      MachineState *ms =3D MACHINE(qdev_get_machine());
>      LowRISCIbexSoCState *s =3D RISCV_IBEX_SOC(dev_soc);
>      MemoryRegion *sys_mem =3D get_system_memory();
> -    int i;
> +    int i, cpus =3D machine_topo_get_cpus(ms);
>=20
>      object_property_set_str(OBJECT(&s->cpus), "cpu-type", ms->cpu_type,
>                              &error_abort);
> -    object_property_set_int(OBJECT(&s->cpus), "num-harts", ms->smp.cpus,
> +    object_property_set_int(OBJECT(&s->cpus), "num-harts", cpus,
>                              &error_abort);
>      object_property_set_int(OBJECT(&s->cpus), "resetvec", s->resetvec,
>                              &error_abort);
> @@ -186,10 +186,10 @@ static void lowrisc_ibex_soc_realize(DeviceState
> *dev_soc, Error **errp)
>      }
>      sysbus_mmio_map(SYS_BUS_DEVICE(&s->plic), 0,
> memmap[IBEX_DEV_PLIC].base);
>=20
> -    for (i =3D 0; i < ms->smp.cpus; i++) {
> +    for (i =3D 0; i < cpus; i++) {
>          CPUState *cpu =3D qemu_get_cpu(i);
>=20
> -        qdev_connect_gpio_out(DEVICE(&s->plic), ms->smp.cpus + i,
> +        qdev_connect_gpio_out(DEVICE(&s->plic), cpus + i,
>                                qdev_get_gpio_in(DEVICE(cpu), IRQ_M_EXT));
>      }
>=20
> diff --git a/hw/riscv/shakti_c.c b/hw/riscv/shakti_c.c
> index e43cc9445cb1..34499510e2f0 100644
> --- a/hw/riscv/shakti_c.c
> +++ b/hw/riscv/shakti_c.c
> @@ -110,7 +110,7 @@ static void shakti_c_soc_state_realize(DeviceState *d=
ev,
> Error **errp)
>      sysbus_realize(SYS_BUS_DEVICE(&sss->cpus), &error_abort);
>=20
>      sss->plic =3D sifive_plic_create(shakti_c_memmap[SHAKTI_C_PLIC].base=
,
> -        (char *)SHAKTI_C_PLIC_HART_CONFIG, ms->smp.cpus, 0,
> +        (char *)SHAKTI_C_PLIC_HART_CONFIG, machine_topo_get_cpus(ms), 0,
>          SHAKTI_C_PLIC_NUM_SOURCES,
>          SHAKTI_C_PLIC_NUM_PRIORITIES,
>          SHAKTI_C_PLIC_PRIORITY_BASE,
> diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
> index 3e3f4b0088ca..ca3a7a0877cd 100644
> --- a/hw/riscv/sifive_e.c
> +++ b/hw/riscv/sifive_e.c
> @@ -178,7 +178,8 @@ static void sifive_e_soc_init(Object *obj)
>      SiFiveESoCState *s =3D RISCV_E_SOC(obj);
>=20
>      object_initialize_child(obj, "cpus", &s->cpus, TYPE_RISCV_HART_ARRAY=
);
> -    object_property_set_int(OBJECT(&s->cpus), "num-harts", ms->smp.cpus,
> +    object_property_set_int(OBJECT(&s->cpus), "num-harts",
> +                            machine_topo_get_cpus(ms),
>                              &error_abort);

With this change, we don't need to start a new line for '&error_abort);', j=
ust move
it to previous line.

>      object_property_set_int(OBJECT(&s->cpus), "resetvec", 0x1004,
> &error_abort);
>      object_initialize_child(obj, "riscv.sifive.e.gpio0", &s->gpio,
> @@ -191,6 +192,7 @@ static void sifive_e_soc_realize(DeviceState *dev, Er=
ror
> **errp)
>      const MemMapEntry *memmap =3D sifive_e_memmap;
>      SiFiveESoCState *s =3D RISCV_E_SOC(dev);
>      MemoryRegion *sys_mem =3D get_system_memory();
> +    unsigned int cpus =3D machine_topo_get_cpus(ms);
>=20
>      object_property_set_str(OBJECT(&s->cpus), "cpu-type", ms->cpu_type,
>                              &error_abort);
> @@ -204,7 +206,7 @@ static void sifive_e_soc_realize(DeviceState *dev, Er=
ror
> **errp)
>=20
>      /* MMIO */
>      s->plic =3D sifive_plic_create(memmap[SIFIVE_E_DEV_PLIC].base,
> -        (char *)SIFIVE_E_PLIC_HART_CONFIG, ms->smp.cpus, 0,
> +        (char *)SIFIVE_E_PLIC_HART_CONFIG, cpus, 0,
>          SIFIVE_E_PLIC_NUM_SOURCES,
>          SIFIVE_E_PLIC_NUM_PRIORITIES,
>          SIFIVE_E_PLIC_PRIORITY_BASE,
> @@ -215,10 +217,10 @@ static void sifive_e_soc_realize(DeviceState *dev,
> Error **errp)
>          SIFIVE_E_PLIC_CONTEXT_STRIDE,
>          memmap[SIFIVE_E_DEV_PLIC].size);
>      riscv_aclint_swi_create(memmap[SIFIVE_E_DEV_CLINT].base,
> -        0, ms->smp.cpus, false);
> +        0, cpus, false);
>      riscv_aclint_mtimer_create(memmap[SIFIVE_E_DEV_CLINT].base +
>              RISCV_ACLINT_SWI_SIZE,
> -        RISCV_ACLINT_DEFAULT_MTIMER_SIZE, 0, ms->smp.cpus,
> +        RISCV_ACLINT_DEFAULT_MTIMER_SIZE, 0, cpus,
>          RISCV_ACLINT_DEFAULT_MTIMECMP, RISCV_ACLINT_DEFAULT_MTIME,
>          RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ, false);
>      create_unimplemented_device("riscv.sifive.e.aon",
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index d3ab7a9cda5d..c7f969510209 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -99,7 +99,7 @@ static void create_fdt(SiFiveUState *s, const
> MemMapEntry *memmap,
>      MachineState *ms =3D MACHINE(s);
>      uint64_t mem_size =3D ms->ram_size;
>      void *fdt;
> -    int cpu, fdt_size;
> +    int cpu, fdt_size, num_cpus =3D machine_topo_get_cpus(ms);
>      uint32_t *cells;
>      char *nodename;
>      uint32_t plic_phandle, prci_phandle, gpio_phandle, phandle =3D 1;
> @@ -175,7 +175,7 @@ static void create_fdt(SiFiveUState *s, const
> MemMapEntry *memmap,
>      qemu_fdt_setprop_cell(fdt, "/cpus", "#size-cells", 0x0);
>      qemu_fdt_setprop_cell(fdt, "/cpus", "#address-cells", 0x1);
>=20
> -    for (cpu =3D ms->smp.cpus - 1; cpu >=3D 0; cpu--) {
> +    for (cpu =3D num_cpus - 1; cpu >=3D 0; cpu--) {
>          int cpu_phandle =3D phandle++;
>          nodename =3D g_strdup_printf("/cpus/cpu@%d", cpu);
>          char *intc =3D g_strdup_printf("/cpus/cpu@%d/interrupt-controlle=
r", cpu);
> @@ -207,8 +207,8 @@ static void create_fdt(SiFiveUState *s, const
> MemMapEntry *memmap,
>          g_free(nodename);
>      }
>=20
> -    cells =3D  g_new0(uint32_t, ms->smp.cpus * 4);
> -    for (cpu =3D 0; cpu < ms->smp.cpus; cpu++) {
> +    cells =3D  g_new0(uint32_t, num_cpus * 4);
> +    for (cpu =3D 0; cpu < num_cpus; cpu++) {
>          nodename =3D
>              g_strdup_printf("/cpus/cpu@%d/interrupt-controller", cpu);
>          uint32_t intc_phandle =3D qemu_fdt_get_phandle(fdt, nodename);
> @@ -227,7 +227,7 @@ static void create_fdt(SiFiveUState *s, const
> MemMapEntry *memmap,
>          0x0, memmap[SIFIVE_U_DEV_CLINT].base,
>          0x0, memmap[SIFIVE_U_DEV_CLINT].size);
>      qemu_fdt_setprop(fdt, nodename, "interrupts-extended",
> -        cells, ms->smp.cpus * sizeof(uint32_t) * 4);
> +        cells, num_cpus * sizeof(uint32_t) * 4);
>      g_free(cells);
>      g_free(nodename);
>=20
> @@ -258,8 +258,8 @@ static void create_fdt(SiFiveUState *s, const
> MemMapEntry *memmap,
>      g_free(nodename);
>=20
>      plic_phandle =3D phandle++;
> -    cells =3D  g_new0(uint32_t, ms->smp.cpus * 4 - 2);
> -    for (cpu =3D 0; cpu < ms->smp.cpus; cpu++) {
> +    cells =3D  g_new0(uint32_t, machine_topo_get_cpus(ms) * 4 - 2);
> +    for (cpu =3D 0; cpu < machine_topo_get_cpus(ms); cpu++) {
>          nodename =3D
>              g_strdup_printf("/cpus/cpu@%d/interrupt-controller", cpu);
>          uint32_t intc_phandle =3D qemu_fdt_get_phandle(fdt, nodename);
> @@ -283,7 +283,7 @@ static void create_fdt(SiFiveUState *s, const
> MemMapEntry *memmap,
>          (char **)&plic_compat, ARRAY_SIZE(plic_compat));
>      qemu_fdt_setprop(fdt, nodename, "interrupt-controller", NULL, 0);
>      qemu_fdt_setprop(fdt, nodename, "interrupts-extended",
> -        cells, (ms->smp.cpus * 4 - 2) * sizeof(uint32_t));
> +        cells, (machine_topo_get_cpus(ms) * 4 - 2) * sizeof(uint32_t));
>      qemu_fdt_setprop_cells(fdt, nodename, "reg",
>          0x0, memmap[SIFIVE_U_DEV_PLIC].base,
>          0x0, memmap[SIFIVE_U_DEV_PLIC].size);
> @@ -797,10 +797,10 @@ static void sifive_u_soc_realize(DeviceState *dev,
> Error **errp)
>      MemoryRegion *mask_rom =3D g_new(MemoryRegion, 1);
>      MemoryRegion *l2lim_mem =3D g_new(MemoryRegion, 1);
>      char *plic_hart_config;
> -    int i, j;
> +    int i, j, cpus =3D machine_topo_get_cpus(ms);
>      NICInfo *nd =3D &nd_table[0];
>=20
> -    qdev_prop_set_uint32(DEVICE(&s->u_cpus), "num-harts", ms->smp.cpus -=
 1);
> +    qdev_prop_set_uint32(DEVICE(&s->u_cpus), "num-harts", cpus - 1);
>      qdev_prop_set_uint32(DEVICE(&s->u_cpus), "hartid-base", 1);
>      qdev_prop_set_string(DEVICE(&s->u_cpus), "cpu-type", s->cpu_type);
>      qdev_prop_set_uint64(DEVICE(&s->u_cpus), "resetvec", 0x1004);
> @@ -837,11 +837,11 @@ static void sifive_u_soc_realize(DeviceState *dev,
> Error **errp)
>                                  l2lim_mem);
>=20
>      /* create PLIC hart topology configuration string */
> -    plic_hart_config =3D riscv_plic_hart_config_string(ms->smp.cpus);
> +    plic_hart_config =3D riscv_plic_hart_config_string(cpus);
>=20
>      /* MMIO */
>      s->plic =3D sifive_plic_create(memmap[SIFIVE_U_DEV_PLIC].base,
> -        plic_hart_config, ms->smp.cpus, 0,
> +        plic_hart_config, cpus, 0,
>          SIFIVE_U_PLIC_NUM_SOURCES,
>          SIFIVE_U_PLIC_NUM_PRIORITIES,
>          SIFIVE_U_PLIC_PRIORITY_BASE,
> @@ -857,10 +857,10 @@ static void sifive_u_soc_realize(DeviceState *dev,
> Error **errp)
>      sifive_uart_create(system_memory, memmap[SIFIVE_U_DEV_UART1].base,
>          serial_hd(1), qdev_get_gpio_in(DEVICE(s->plic), SIFIVE_U_UART1_I=
RQ));
>      riscv_aclint_swi_create(memmap[SIFIVE_U_DEV_CLINT].base, 0,
> -        ms->smp.cpus, false);
> +        cpus, false);
>      riscv_aclint_mtimer_create(memmap[SIFIVE_U_DEV_CLINT].base +
>              RISCV_ACLINT_SWI_SIZE,
> -        RISCV_ACLINT_DEFAULT_MTIMER_SIZE, 0, ms->smp.cpus,
> +        RISCV_ACLINT_DEFAULT_MTIMER_SIZE, 0, cpus,
>          RISCV_ACLINT_DEFAULT_MTIMECMP, RISCV_ACLINT_DEFAULT_MTIME,
>          CLINT_TIMEBASE_FREQ, false);
>=20
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index b81081c70b1c..4b0a3dab5ec1 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -506,16 +506,17 @@ static void create_fdt_imsic(RISCVVirtState *s, con=
st
> MemMapEntry *memmap,
>      char *imsic_name;
>      MachineState *ms =3D MACHINE(s);
>      int socket_count =3D riscv_socket_count(ms);
> -    uint32_t imsic_max_hart_per_socket, imsic_guest_bits;
> +    uint32_t imsic_max_hart_per_socket, imsic_guest_bits, cpus;
>      uint32_t *imsic_cells, *imsic_regs, imsic_addr, imsic_size;
>=20
> +    cpus =3D machine_topo_get_cpus(ms);
>      *msi_m_phandle =3D (*phandle)++;
>      *msi_s_phandle =3D (*phandle)++;
> -    imsic_cells =3D g_new0(uint32_t, ms->smp.cpus * 2);
> +    imsic_cells =3D g_new0(uint32_t, cpus * 2);
>      imsic_regs =3D g_new0(uint32_t, socket_count * 4);
>=20
>      /* M-level IMSIC node */
> -    for (cpu =3D 0; cpu < ms->smp.cpus; cpu++) {
> +    for (cpu =3D 0; cpu < cpus; cpu++) {
>          imsic_cells[cpu * 2 + 0] =3D cpu_to_be32(intc_phandles[cpu]);
>          imsic_cells[cpu * 2 + 1] =3D cpu_to_be32(IRQ_M_EXT);
>      }
> @@ -544,7 +545,7 @@ static void create_fdt_imsic(RISCVVirtState *s, const
> MemMapEntry *memmap,
>      qemu_fdt_setprop(ms->fdt, imsic_name, "msi-controller",
>          NULL, 0);
>      qemu_fdt_setprop(ms->fdt, imsic_name, "interrupts-extended",
> -        imsic_cells, ms->smp.cpus * sizeof(uint32_t) * 2);
> +        imsic_cells, cpus * sizeof(uint32_t) * 2);
>      qemu_fdt_setprop(ms->fdt, imsic_name, "reg", imsic_regs,
>          socket_count * sizeof(uint32_t) * 4);
>      qemu_fdt_setprop_cell(ms->fdt, imsic_name, "riscv,num-ids",
> @@ -562,7 +563,7 @@ static void create_fdt_imsic(RISCVVirtState *s, const
> MemMapEntry *memmap,
>      g_free(imsic_name);
>=20
>      /* S-level IMSIC node */
> -    for (cpu =3D 0; cpu < ms->smp.cpus; cpu++) {
> +    for (cpu =3D 0; cpu < cpus; cpu++) {
>          imsic_cells[cpu * 2 + 0] =3D cpu_to_be32(intc_phandles[cpu]);
>          imsic_cells[cpu * 2 + 1] =3D cpu_to_be32(IRQ_S_EXT);
>      }
> @@ -593,7 +594,7 @@ static void create_fdt_imsic(RISCVVirtState *s, const
> MemMapEntry *memmap,
>      qemu_fdt_setprop(ms->fdt, imsic_name, "msi-controller",
>          NULL, 0);
>      qemu_fdt_setprop(ms->fdt, imsic_name, "interrupts-extended",
> -        imsic_cells, ms->smp.cpus * sizeof(uint32_t) * 2);
> +        imsic_cells, cpus * sizeof(uint32_t) * 2);
>      qemu_fdt_setprop(ms->fdt, imsic_name, "reg", imsic_regs,
>          socket_count * sizeof(uint32_t) * 4);
>      qemu_fdt_setprop_cell(ms->fdt, imsic_name, "riscv,num-ids",
> @@ -732,7 +733,7 @@ static void create_fdt_sockets(RISCVVirtState *s, con=
st
> MemMapEntry *memmap,
>      char *clust_name;
>      int socket, phandle_pos;
>      MachineState *ms =3D MACHINE(s);
> -    uint32_t msi_m_phandle =3D 0, msi_s_phandle =3D 0;
> +    uint32_t msi_m_phandle =3D 0, msi_s_phandle =3D 0, cpus;
>      uint32_t *intc_phandles, xplic_phandles[MAX_NODES];
>      int socket_count =3D riscv_socket_count(ms);
>=20
> @@ -743,9 +744,10 @@ static void create_fdt_sockets(RISCVVirtState *s, co=
nst
> MemMapEntry *memmap,
>      qemu_fdt_setprop_cell(ms->fdt, "/cpus", "#address-cells", 0x1);
>      qemu_fdt_add_subnode(ms->fdt, "/cpus/cpu-map");
>=20
> -    intc_phandles =3D g_new0(uint32_t, ms->smp.cpus);
> +    cpus =3D machine_topo_get_cpus(ms);
> +    intc_phandles =3D g_new0(uint32_t, cpus);
>=20
> -    phandle_pos =3D ms->smp.cpus;
> +    phandle_pos =3D cpus;
>      for (socket =3D (socket_count - 1); socket >=3D 0; socket--) {
>          phandle_pos -=3D s->soc[socket].num_harts;
>=20
> @@ -776,7 +778,7 @@ static void create_fdt_sockets(RISCVVirtState *s, con=
st
> MemMapEntry *memmap,
>          *msi_pcie_phandle =3D msi_s_phandle;
>      }
>=20
> -    phandle_pos =3D ms->smp.cpus;
> +    phandle_pos =3D cpus;
>      for (socket =3D (socket_count - 1); socket >=3D 0; socket--) {
>          phandle_pos -=3D s->soc[socket].num_harts;
>=20
> @@ -1113,7 +1115,7 @@ static FWCfgState *create_fw_cfg(const
> MachineState *ms)
>=20
>      fw_cfg =3D fw_cfg_init_mem_wide(base + 8, base, 8, base + 16,
>                                    &address_space_memory);
> -    fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, (uint16_t)ms->smp.cpus);
> +    fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS,
> (uint16_t)machine_topo_get_cpus(ms));
>=20
>      return fw_cfg;
>  }
> --
> 2.34.1


