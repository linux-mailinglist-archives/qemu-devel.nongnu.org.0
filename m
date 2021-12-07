Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2766A46C130
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 17:58:59 +0100 (CET)
Received: from localhost ([::1]:58746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mudnu-0007ie-9K
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 11:58:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1mudko-0004ln-4f; Tue, 07 Dec 2021 11:55:49 -0500
Received: from esa.hc3962-90.iphmx.com ([216.71.142.165]:22507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1mudkl-0002be-K3; Tue, 07 Dec 2021 11:55:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1638896143; x=1639500943;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pcn9xBfSuF7BnK+3omFxBH2/yLA8T3Vof3cphivYD8E=;
 b=ncswtTkg2Z5NFNq0mRWS6V+z+jFbRz7qr7H72hXIil7kf3PvYOAjrgts
 vcmNAtA152mnJUOfCzQogGP5iy/1VUt5ekvPkEb2g3cIX4lBgIPYrqBkH
 ajqt54e5QAuu1tPe8R7afQTLIjNroGnIR1d81DfE7/fi3uNmF41H+S6ea U=;
Received: from mail-sn1anam02lp2048.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.48])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 16:55:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JKQHgRNLxa3ri2BLJi2YmHZuW/QnX3aUqkK1Sp5qXZOZWogjksKUsSUYYCdeTMO/d+E2h2yxP3/TNWvrOrYmuTUOog4f5hn4+lJClrIJqqIPcEyq3LlAxRk+rAhr8k4pPYoMf6P+BvKy2TV+w8zyl9d/Yt3LfRe4bZ/HzqzgeDBD6u8YOBys7hwtQmfwYDhyd/pf4gvGBJm9WbmiWMsusR0pADiQMohv5pd0o2n5baZKJx7txr/iuglsRcGiqFLM3RMOwQ8v4O75Dc3Yg2SkQ09Y+mv9RKmmJrwnzYyOzHTXuRZ0rW7lmAwhxlfnkPG9yzPdTNEaOI6q0zMGKC8L5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pcn9xBfSuF7BnK+3omFxBH2/yLA8T3Vof3cphivYD8E=;
 b=gkcwf2RDZKxO4x2OtS9gwq6KqXovt5Mjd3XjDQN0nZEG0nfY3lWoerky+Fyr0nygFynmp3/DK8HiOIOFce7OfzZLGviLK43wjaoBS3bagNsmCbAG+zJ26/83HssI/oA9ORHxzh/GkbxkGeXAsH2/UlGjUqENHcE6fQ5nkV6JOKO5h1D6uEqfjR1VyNqAO4QweYjRz7W+s5qqhqugcsJMynsvyTS7KNtqOv+YQVe9BhPyY6uesz51F7CJAoAPbPoNX83Dx4WjyPgkxyHxiCNUaTWZK/Hjr4XE87a+vRqaD167G4cPSe7b9lN1KViSpAY/bPrRnTHxhgMoASOgDVSq1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by SN6PR02MB4894.namprd02.prod.outlook.com
 (2603:10b6:805:95::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16; Tue, 7 Dec
 2021 16:55:37 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::b858:f47d:4ad1:1a04]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::b858:f47d:4ad1:1a04%5]) with mapi id 15.20.4755.022; Tue, 7 Dec 2021
 16:55:37 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Peter Maydell <peter.maydell@linaro.org>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH for-7.0 2/4] target/hexagon/cpu.h: don't include
 qemu-common.h
Thread-Topic: [PATCH for-7.0 2/4] target/hexagon/cpu.h: don't include
 qemu-common.h
Thread-Index: AQHX5VxwwKeJFesV7k+GA5M63Vnur6wnScMg
Date: Tue, 7 Dec 2021 16:55:36 +0000
Message-ID: <SN4PR0201MB88084FDFE21708994A1F0BD8DE6E9@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20211129200510.1233037-1-peter.maydell@linaro.org>
 <20211129200510.1233037-3-peter.maydell@linaro.org>
In-Reply-To: <20211129200510.1233037-3-peter.maydell@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 292b4d14-adb0-4ed5-62ee-08d9b9a2646f
x-ms-traffictypediagnostic: SN6PR02MB4894:EE_
x-microsoft-antispam-prvs: <SN6PR02MB4894D581CF46D4F100BEE639DE6E9@SN6PR02MB4894.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4sroAlf7+zl2QoUkHzRswasabqd3O0RKAkKKZJdc4EG6bS+S1dbj1PUnN6crgqAh9Klkb7GznuENXUHwW/ovOg0qvJKDGhsBkyOuKgBObldyPzex3DuquZZ6dBe2aollMr/7jmVcK11gCaheSiiZjKLvsa6SGBTjCKh1/SxJtoA20KQneof9BAYWxQzHUv7yGpxt+0dmSU64vvSlv9pYYKRtxTTCTNewcYppbzDMjS+gjkwH2Iy/grNKUe80k/62XHyeI5aqupH+/NAxNe1lcVbYiKEb91O4IcvjxtJIDp+IsIuD7vqjrWEr0aNt/MC4FBeV9mK/iBc9tAt5VqjuoCmd9ChywPE6KiFj89TI2D0WxOQ36EiLLjd+mfLkYtKI0iBtLNJY+JP0UxqUGVYw9VDZAgJRliROp0WG4oBdklP60mfjCy/NnZ4rZl1h59QIzWE5MyCCeM0ij/HASm45X99bgTzXWuV5zIPnxc69IyI30ahlLJZBU3/COuzcWjNX8Fa2V5K3rUg9fVTx2k3jXYi1oUs5cI+W/TyGo49Wj3CCqU2iNgLAIHxOvzucQZG3aAZOqGYMGNc9hRwOK0LRig0W4/Mg6w/1o6kNMdB6Vig5sZOEvZFRA3pnQXi9ubP6qqit2TUqSeGAgdwYQO0Ps4L8RRoGLXRbVtnXtjFhCsasCPXpZEdzFSGJnl7buvSrZLtr/oXRruj3Ogwpcr38cQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4326008)(4744005)(86362001)(9686003)(110136005)(122000001)(54906003)(71200400001)(8676002)(508600001)(66446008)(33656002)(5660300002)(316002)(7696005)(64756008)(2906002)(76116006)(83380400001)(38100700002)(52536014)(186003)(55016003)(66946007)(66476007)(8936002)(66556008)(26005)(38070700005)(6506007)(53546011);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?WhA6j1xPEldlhFrBAMhO9TV0kZmeT86oz5VHct0XXoFE8yiJVVns7oC68FgG?=
 =?us-ascii?Q?QOrH96cWQSZBUHKTifKf31TOWVWPOS1JKJJWNvTLPW5sqPRo3A86pZV3cUpr?=
 =?us-ascii?Q?fTGfjDbPc/o0oKwTY9K3lMUELazAWlAMHTqDp6VhjLZ/fTeqBCy2qxMeG9ow?=
 =?us-ascii?Q?FwC5DWr3zTDPvQsjKVX7dqu5VJ7GfsDcKh3ypUQzh+2Si7u2EwJz+XSAO/HR?=
 =?us-ascii?Q?BqGFmtbv9fXVlD0zbYEl/Hlf3NZ8e3YguQkTBigoOij1qUzRyaOHb637pKpa?=
 =?us-ascii?Q?TLG3vYqNJlbQvT2KqFX9oXO9dDl+5z3nXELBgYxOwm7BkepjKjaibcvKW7Mj?=
 =?us-ascii?Q?5qAECHbklz0jvFrObtiN0dxWvubPAJ+4lHC0ZY0LybSeVbiYrnVttGAFCmAY?=
 =?us-ascii?Q?ouyL9XbRP4iGHo6Kjc2xRNP/RhpubB02HqDMEaDTZTOllj2WjfqEDtpdim4t?=
 =?us-ascii?Q?djMzNQAyPXJAsMQybag48cgoHldwKMx9UwLLRdw80dyd6hlubkKD2qa4paFq?=
 =?us-ascii?Q?0EDIG2yPhDySz65DiuwpWU15wjjN5J+zcx9iqFpYNwm1DSUAYa8fMK8YVd5s?=
 =?us-ascii?Q?RcK06WSAKYcyZJ907kTysoVVaDnfK0hgVBSZICP19kv3sOI9kbeF9L1VfvVt?=
 =?us-ascii?Q?LhJyEiRLY5tcXHf0AWNILxikMMa1hdujaYScjfh4AUhQU+IXeKMEbn0h+ub/?=
 =?us-ascii?Q?p0gDRI0RoNKbRS5HKv3eqNc3Jhzk+Op2EQ/UYNiX+XjOdQ8vkyVPQTna4yBc?=
 =?us-ascii?Q?SmwCigTr+cHW/lnnLXjAXVPtvA/xAr6dVABXX+33WxcpKvlTJk/jWUKnimAk?=
 =?us-ascii?Q?+8BaqxtKk2q1KpRpXWu0Xa/REC+044sq1khRWVaFut/2CbW0lm9joXZ4WfuV?=
 =?us-ascii?Q?eeL2RE4ppdw3Y/F2WktEpy8fV0iQ7CgAueFdpKf41wzES2GFKgSCu3Hj0N1V?=
 =?us-ascii?Q?Ep9VNISRu/AaygLSLiT4dxtHuHKkqjBy3205jxQvDSTf5u8h7L2mQvyVgDyJ?=
 =?us-ascii?Q?I8i7HZ7c6v49tWrheRCYnYi1MfrQXoD3I+CkgHsNvPKZs9Mym6BX1v+4JYKx?=
 =?us-ascii?Q?coIaSYtzQXfEirBSI3QRmQ7Ib3cijKz/qIydxj+UTAs5Hx2pdV43bGxM6J2p?=
 =?us-ascii?Q?iji9uE/9KsqRJ9gJlE6dpQLSHoKMTEOk7fFq9UFqjyBF4QwophWkOwv5j9Hz?=
 =?us-ascii?Q?dfueynm7JMjSmIUhAa9Iuhge4CgDdq7GgUYw8fZhZatcoW6yNC4M6D5KwL14?=
 =?us-ascii?Q?Z/ooPB9GlReJ9K9ZzF96LEh/I0Dtsm+4Tzfn6FILn7IekDHoZLRqTj7P1PY5?=
 =?us-ascii?Q?yl338j8IwLx1WiaFrwcU459jCSigG6ETmJSD5l4yueGbZi2EB51V3rF+0Xn2?=
 =?us-ascii?Q?yW99w96EITsfyktt9IGCzeQUQ7KZvfgrLGFwtDKUp3S/KRUnPA8tItkmpX+Z?=
 =?us-ascii?Q?973fhHV+IxLPkN0LbEN1Yg/K2rTihnm9mGG+EMQKs3MPClvBq5OEVKGnaQS3?=
 =?us-ascii?Q?aBZ/6RvzvRp+0lHBh5P2ViDjV4hhMZ+BRjerXYR2u53vfLlgREdPuEwB+FHq?=
 =?us-ascii?Q?ZasFDrjEqWR3+lx0RphSFkNCq5bJgb02a2dlEprQSinMCYICjTz/nnVZd93Q?=
 =?us-ascii?Q?xY8yqK1VD5PWTqSY4ieEdN0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 292b4d14-adb0-4ed5-62ee-08d9b9a2646f
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2021 16:55:36.9372 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZBfjKm/yX2cZuxe0pCDKVmkX9ix6H1Ab1H2mUuUqy+uCWGtG4gFx2awp/+Qpz/LrfNwM7ZnshjzfPEjR2Zw0EQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4894
Received-SPF: pass client-ip=216.71.142.165; envelope-from=tsimpson@quicinc.com;
 helo=esa.hc3962-90.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Sergio Lopez <slp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Peter Maydell <peter.maydell@linaro.org>
> Sent: Monday, November 29, 2021 2:05 PM
> To: qemu-arm@nongnu.org; qemu-devel@nongnu.org
> Cc: Paolo Bonzini <pbonzini@redhat.com>; Sergio Lopez <slp@redhat.com>;
> Taylor Simpson <tsimpson@quicinc.com>; Yoshinori Sato
> <ysato@users.sourceforge.jp>; Marcel Apfelbaum
> <marcel.apfelbaum@gmail.com>
> Subject: [PATCH for-7.0 2/4] target/hexagon/cpu.h: don't include qemu-
> common.h
>=20
> The qemu-common.h header is not supposed to be included from any other
> header files, only from .c files (as documented in a comment at the start=
 of
> it).
>=20
> Move the include to linux-user/hexagon/cpu_loop.c, which needs it for the
> declaration of cpu_exec_step_atomic().
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/hexagon/cpu.h          | 1 -
>  linux-user/hexagon/cpu_loop.c | 1 +
>  2 files changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>


