Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A662484AE8
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 23:50:08 +0100 (CET)
Received: from localhost ([::1]:43334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4sd5-0008Tp-7C
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 17:50:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1n4sbc-0006Vh-4H
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 17:48:36 -0500
Received: from esa.hc3962-90.iphmx.com ([216.71.142.165]:64828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1n4sba-0006vA-2M
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 17:48:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1641336514; x=1641941314;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YF3WdmKnxvnOcCADuFEd1xtkMudWSJ5yzcAd0xlUOCs=;
 b=h7p9d1ZX5TjGLyy9PL9rFbhzJeUlpQlbJ71ja8ElwYGEm3raxyQH4Lyd
 1f0GKj0js2s8AkuEfLv9kMvImy68nUka8kBQv3k8rl1jmLKZD3utDt5AZ
 k7zc2uJI/Z+PBInskYv3UI6AsbivMgNh5+aJ++d0VaeLn+bWomb+9SazP 8=;
Received: from mail-dm6nam11lp2170.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.170])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2022 22:48:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NtNVX++xvSgtD0oImR+hufKedug3Epa9BZ/cyvrBUOMeK39Ln88G+Kx0E5PS2F631rg3UAp7xwudPKpiMnjU3yIYFXVv3h4fE8ZaFkR2CkOxgekAWlhZyR7etZEhS52in51AZtytLQhcjhhD5h0aSzQ/H1HZkPsXpaKLwGHi2Z6TsrSfcIINugFCdDY3JMncto3cGbr4HBAnKqwZE9UyFSuWx7CrSTP6rUdn/XJGEG5u+vo8dy76KKB4O+qPWtPSEezb4ReFL93cAcv4oVRiWp/hDaOCJ+YZp9pX9O9+b+aw2XNXNHSTubA8LFzoOfEOUG78sZnJZs9XO7QJvfspmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YF3WdmKnxvnOcCADuFEd1xtkMudWSJ5yzcAd0xlUOCs=;
 b=E7tmTXqK16P+4tDVvsefcKNPvODfbUGCa+UjOrdi/NKAVJuWMXtFdQejzFHvSGXnqcc+NvW2jZXxgBVq79DBEpumuoKtBrjuHvwk4PhfTO3GU+MWvkl29HJdmXpNDAy0aBSVkeXkiW/Z73xvLdt+M3U8wz/YO3Q/EM57swj5IQKKP10qA18nfR4ujHBSlDvAjSsG403WEmP9soyzAEGH5dJipiIGhyr39r8u58jX3qY/9WBndVBvsgjMEpjyv5lwwskST3iEJVotzmgDlJ4+LD2oJmfSUQbbuKpb1zG6Wrsq4DURLr2KI5Qsocc1HlkvyqHFzm6qx1C8qb14kbjAgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by SN4PR0201MB3439.namprd02.prod.outlook.com
 (2603:10b6:803:43::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.14; Tue, 4 Jan
 2022 22:48:29 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::2016:dd39:b081:9dd4]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::2016:dd39:b081:9dd4%6]) with mapi id 15.20.4844.016; Tue, 4 Jan 2022
 22:48:28 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH 1/2] tests/tcg/multiarch: Read fp flags before printf
Thread-Topic: [PATCH 1/2] tests/tcg/multiarch: Read fp flags before printf
Thread-Index: AQHX+Ho6iQO72KiaK029fCdlx0S5ZaxTiNHA
Date: Tue, 4 Jan 2022 22:48:28 +0000
Message-ID: <SN4PR0201MB8808AF7EEDDDC2159F0845E5DE4A9@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20211224035541.2159966-1-richard.henderson@linaro.org>
 <20211224035541.2159966-2-richard.henderson@linaro.org>
In-Reply-To: <20211224035541.2159966-2-richard.henderson@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 68d48dcd-3228-4d9d-1376-08d9cfd45370
x-ms-traffictypediagnostic: SN4PR0201MB3439:EE_
x-microsoft-antispam-prvs: <SN4PR0201MB3439B76747A3D0FA7E9F0601DE4A9@SN4PR0201MB3439.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1388;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7yHYJApBhXzlDlMls38Ksh/kBFyHx5UlfrzNHqBycWS5l54c9jko7C3vGrpRtHt5uIaWVmRjQxU0pTYwUH3fZwyeFawZybF7/vHE/T/Y7p/BidiH8++qGZFrPyVTiyaO5+j/t2KnJ3MM8MN9pJf6K7rtlE4jtOgj2QgriKi9QCyPzVCzTiJP6097Ch6/oJbXzYifaDDd1e42gwbpwkaa4VbDpvQgAp78nukDIB/LLLQsbeFU1okkOxvuX9cv76SBQLsgFn85BWMXBFx4ac2wpEXaCr46ufzeT61K6KxgoOHAPeHTzhLcxYiMkj0gmZqebahe3LoxiaPXEYme16fbAnyV0jt/RjneZ5DN930pLTCfzQEJVau48wYdTyVtXAW5MeCIOGf5OT0seULCc0N5F/QR4/z0JjXkxRchkjM9N+GUrejn7fzxO8u9fRfwbL2NC9td6jt4qnuPG8aFgVioDaKA3l0Q8GAEPd0s0wB0pBbZVNrqpBrCaR8ncKV1qvSIgxDcKt6nfRNgstAoWxLXhykmuPiSy1BqS8rygK1ToQP53xTQmakZr/cyfSK69hd2pXvOWaoedUvLeHg2XNkHoQ8nfUY+cNg0H8MSq6ZVV/OmyCfSGFJIcsTSMfh+K1AfkeoYmdUx249kMoOFFJyPx5QbZTIZjMmdbsNqnVPgvGi3GvVGb+ykh+FLvTPPu5p1SGA+uO84bDA9kVCu31ofyA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38070700005)(66446008)(33656002)(64756008)(8936002)(76116006)(66476007)(66556008)(38100700002)(6506007)(53546011)(52536014)(2906002)(66946007)(122000001)(4326008)(8676002)(7696005)(508600001)(86362001)(316002)(55016003)(5660300002)(110136005)(9686003)(186003)(26005)(71200400001)(4744005)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?PTmGtNZ9DlZols+Ujllhl9km5ReJ5J+U3opXPVJelGR9w6t/7hY/cpVZkF2I?=
 =?us-ascii?Q?j3S28qqHkIcrfLNO84vA4qJ+JBabO6x+MpQAUu+LVsiVl+btzcPUm6UynME9?=
 =?us-ascii?Q?z9Ro6VeegbGxn/EErBm3Pe7Bz+RVm6B3Us+90wCM/yZBNieszaCW1TdsZ3nN?=
 =?us-ascii?Q?oGJzAqXkTRsVJ5Rj+tuEUVQf0AgdqhPy6cVJUr6+uSlxDh/KvSaot67j88KY?=
 =?us-ascii?Q?R0aPVy9P9K/9tNisgfCr2jGiGKTkTsU/lwHBn+RXNhUIlCq3NYnihJQEpU0a?=
 =?us-ascii?Q?26cHr0qCPyVNU0aarglXJl86fBOMz9kIFMtFTpuTyMEGeOJLIqrfFORf8l5k?=
 =?us-ascii?Q?2/P7ExrqYtitZW8l2s7SZxeAjgXhcmncIDQ24M706NKhUJdl5txZBJdNOxBa?=
 =?us-ascii?Q?gXdx5AX+BRu0BQGMMkkdyhVj0Uc+uzSOqUBrl5sgJ7UCz7LaMykAxOFXESEx?=
 =?us-ascii?Q?KTQZrykAqlvfKZJm3hz0P7tGcIODF9ghnME8qp8YOny37xb+6IfqTme2A3di?=
 =?us-ascii?Q?jwouKq+NBzkyjjz45wpWMH1vXp52zsV9+rwArRTeLtomhKF+4wUsQNOL/qNq?=
 =?us-ascii?Q?ZPiHvCdDoJ6CHvw1Tbng2LLwo8RSSbMp9Koz1H2TTzrSmMAGFvlbBroUSitx?=
 =?us-ascii?Q?rNUhrhVuPUkXWdzOsj+NqxhUymWh23ksnyX8ev6cTxYqWwmht3kS/W182ag8?=
 =?us-ascii?Q?UEHfFmpeGQU+x7PFBVxL22ydY6jipbTLEo5cSq8hhALsHXkjMfBA73lAFdH6?=
 =?us-ascii?Q?G9V57gwasOQHehkTXikoPp/FU5dsp/dMN4pyeI5SD7cDtG91RxSZeKJtSKg6?=
 =?us-ascii?Q?n/chhVPuJf8Df+6dNYQvcoa3C+F+May/1cnglQCHks/NGDsvDNHoutRVEiHo?=
 =?us-ascii?Q?qODcaSU0XpzbWHEQ+N4gXBt8rFigE1JDYVewvb1A7YSsmXQUQJxxD/mLvhXq?=
 =?us-ascii?Q?9iWKTi/1A+VqZ6n+N7CGz5UdiKEm9J/YDJ0NiVe1YfHish581IWKabYA2M4S?=
 =?us-ascii?Q?zWHAKLVHogUfXcWUiPMKno2gsXWv1T7ItJfBxLxlR9AeNdDObeMAx3coT3jL?=
 =?us-ascii?Q?sY7FbEW1n0nuV72VLhAn1bodDxLg2lBKArnxla9+ZQdQUATFu6phwMXx5oJ8?=
 =?us-ascii?Q?BFG9VP4+Cgwk/9MBtf3ZgMQ8Ie98asTh9yt/1rolkcxlEKZ8vdblOLhkFn4l?=
 =?us-ascii?Q?hEbWySylYlMhZYwvGkL1ZCyIhBk0e2qgDovjTyZcoFkDQOROq6ijuNEtFK6r?=
 =?us-ascii?Q?gKTRzaZ5Z75jiaHugwH8RCZ8AV+lweVS/IloOLm122m33JmUb5qqkK2Cnd5n?=
 =?us-ascii?Q?4x7pYti+XsOtdeGDx1/ds7lUvV+eeaHi7j/ursjxr2FSEV2BpSrCQgnR2n05?=
 =?us-ascii?Q?JMtBmaVhtGjC16IhoX4HKKnoaUw40gx16H2vvfkHjPSbCT6joyiJJprY+9Dl?=
 =?us-ascii?Q?olpQh0F2atQHmKlcmLtvrIyVCLVe7NQu+/hGP6/fSRD9avLnpJVg+1BhDoOp?=
 =?us-ascii?Q?cudbqRbhNuNni9PrdP1imQmOJAErVChLa4+g5W+i1X6PYL0hLLhdHlIo4jpc?=
 =?us-ascii?Q?dpD9JIf6HNQgy6If1rbl+hSy3rlG+PL473zTyRrG6nWcKKhOBfVT99Grgk09?=
 =?us-ascii?Q?QE1SVH2Kqg7Nw/Dq9PNypwc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68d48dcd-3228-4d9d-1376-08d9cfd45370
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jan 2022 22:48:28.8555 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z6VxmQ5wfnQQzWo4X0mkCjDTvV4CEBgXRO+luh9o6UBMXFG5kM6abowoy+2Y0SCictBPhqXiIR3lusWFP3uW7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0201MB3439
Received-SPF: pass client-ip=216.71.142.165; envelope-from=tsimpson@quicinc.com;
 helo=esa.hc3962-90.iphmx.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "alex.bennee@linaro.org" <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Richard Henderson <richard.henderson@linaro.org>
> Sent: Thursday, December 23, 2021 9:56 PM
> To: qemu-devel@nongnu.org
> Cc: alex.bennee@linaro.org; Taylor Simpson <tsimpson@quicinc.com>
> Subject: [PATCH 1/2] tests/tcg/multiarch: Read fp flags before printf
>=20
> We need to read the floating-point flags before printf may do other float=
ing-
> point operations which may affect the flags.
>=20
> Hexagon reference files regenerated by Taylor Simpson.
>=20
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Message-Id: <1639510781-3790-1-git-send-email-tsimpson@quicinc.com>
> ---
>  tests/tcg/multiarch/float_convs.c |   2 +-
>  tests/tcg/multiarch/float_madds.c |   2 +-
>  tests/tcg/hexagon/float_convs.ref | 152 +++++++++++++++---------------
> tests/tcg/hexagon/float_madds.ref |  48 +++++-----
>  4 files changed, 102 insertions(+), 102 deletions(-)

Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>

Was Hexagon the only target that needed new ref files?



