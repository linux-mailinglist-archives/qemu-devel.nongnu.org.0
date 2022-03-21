Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EDA4E3014
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 19:36:50 +0100 (CET)
Received: from localhost ([::1]:38236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWMtc-0000Hp-PQ
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 14:36:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1nWMqp-0007GZ-IE
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 14:33:55 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.142.165]:35936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1nWMqn-0002OF-Ci
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 14:33:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1647887633; x=1648492433;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iAT9M/MR+Wxa9KuAv2gni6kJGmvM+siaxrLU9fbLsR8=;
 b=Cjzo2ta2J9B+tIBM1oNtF9IchXCJV41MABsYTI7BsWBoOBXUB6VcdwHV
 jZsUypejUkUK5hx3Kyl/qucpyxwVQllwW4YktsTbyH7SfKgxzPyeYssv5
 J4q5okm6gWPG/Co3kVgVry+bcfDcshhOR7BvWB6YYQzXfh7J/wWf9ZYq8 0=;
Received: from mail-dm6nam11lp2172.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.172])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 18:33:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NJ6YGo50oSnfQlSEQGtQAxLDW4vC1aC3StRuNud2I9h+bFHqglkoj0EC2Ei93Q8N062Z+dO02eLITbUHbh2imIiH0XpGmDdwTdEmQP2L4zEMlzh2fbrrcwpMo2abyoXmCfBXJ9yUV9BSLZ1GVLf3vk2uBYPTOZE7eMVV1EMOASc60co2xl6r6+MD8R4KwKGhj9QeD+SeS3PWN9vReYKmZxBY1GtK82m3PM+F/FklQfwAScVwOZZLW26zLf+USqNG4T14DTdq0iKbpfc1LOy7uhZwjxJsmFF989f8sXgSi2olCBUUMaLqg+uS1foG4KaPg5Kz1i9W8qPoBB57W9yg8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iAT9M/MR+Wxa9KuAv2gni6kJGmvM+siaxrLU9fbLsR8=;
 b=HRCrjgDwTRaTSEMfeNnmuu9IGY7ReO+e8lBI0ry2qBNUftf/SiHKSHJiWvwr9234pZxqmgLdjCtFJImjKr/V/XVbq2jaJNjzLa5KsHyTiOA72FHKkTk2Kmqea2GTw4k27LSUJmXfHYpovxZXeWRUsk9hPDe9gssiI1qSWtd+93VxLI/+Lz4OT7J+KgYaIW7Ke305xBjW/LJua+AYwNIzdDevLZr+kiFQzRPTNktEu74SznE4ilOogHoDeTX1Je1MgZ2ErcC8P4MJip7PFZhjIOlxgmmVMGEjDZ8w2wNmfzS7DcKhORUN1ZbNMK7R8KXCzbzwVhO53L1f3tujOFoIaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by BY5PR02MB6084.namprd02.prod.outlook.com
 (2603:10b6:a03:1b4::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.18; Mon, 21 Mar
 2022 18:33:48 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::a55a:64a8:cac:4a39]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::a55a:64a8:cac:4a39%3]) with mapi id 15.20.5081.022; Mon, 21 Mar 2022
 18:33:48 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Anton Johansson <anjo@rev.ng>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v8 07/12] target/hexagon: prepare input for the idef-parser
Thread-Topic: [PATCH v8 07/12] target/hexagon: prepare input for the
 idef-parser
Thread-Index: AQHYHdb8rXjXokvz3UKplnD4tEfyOKzKZ2CA
Date: Mon, 21 Mar 2022 18:33:48 +0000
Message-ID: <SN4PR0201MB880811D683261179164D2AABDE169@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20220209170312.30662-1-anjo@rev.ng>
 <20220209170312.30662-8-anjo@rev.ng>
In-Reply-To: <20220209170312.30662-8-anjo@rev.ng>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 23d631a7-a660-4f3e-736a-08da0b695719
x-ms-traffictypediagnostic: BY5PR02MB6084:EE_
x-microsoft-antispam-prvs: <BY5PR02MB608463AA8D166727B108532DDE169@BY5PR02MB6084.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: N+dETUOqnphCf3xQvzgY/HU5zj0AkpjzJioD4wYPUM4MA4dwFuF1wzVH057flbBUbe6wgXOPZQoDXfzNSZAAeTObwxZHl8Yp2q7mJlaUx3JuessgxKRI3kBPRHCB7znc1L3DWEiCaTlgAipMREIUQ8MbFpK9/0jkbl9Zq8pvxZrnR7QDkh/0ozsYYgNMh1ceBA9VTD600xF8Uw1cpbsGjS6AZMSfFMkeNO1oEPuvs8kUFzwf8KnIkgOP6NZn2A5g6weqA4nBKyKXOFXLVtF6FpOF68qruUqJtk6OE3jKabnl+FWZuZoKmk1ygNBc86ii56DI+jHpcGWB6MRnliT36I0j1k+PmxSz8H/Xv1bglOCaN5rvDHROpGikMjSEy2P88upd3JUqmgYqARe0GF7M1FrQeDr3Rh6ZwmWCnQjloYR20MrwKJybNPiOmVpm5URGYuXbLVRZ9Mv7KNPAktQSaChF97KhwmTIlfvOB8ExPpiXpTtEfopCSBcxxbwe0Kr151ESaZ+4VX7jl8QnGqgihB9gkMI88kXa+abo4dPcL1QtcLGNvToYlDsj6yPne+qQB/iGAzWUgjPBQcgB56UWR3s7KJVHUgUnGmp569AjKrfJqnJ/XbHx3MxRjGlnX4+QWRPJl+BkkcW3C69ridIVuo7ZMlfVZ8KCynFalR6VeLciLljqpIRpXKSUTSygZidlqQNhZcw9MF4I0kBMSgkF6w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(71200400001)(83380400001)(53546011)(6506007)(7696005)(9686003)(26005)(55016003)(508600001)(186003)(316002)(8936002)(76116006)(66946007)(66556008)(66476007)(64756008)(66446008)(86362001)(4326008)(2906002)(5660300002)(52536014)(38070700005)(33656002)(54906003)(110136005)(122000001)(38100700002)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?zB9ybyWGJMZT69TpIabA+e/21Q4Fck45QGkPmYy0zcCOu4+7FG6VjV4SulH1?=
 =?us-ascii?Q?2k31/3llBtGTECqtaSJb/8fKRlogortwlQOCUX3JBUe15BKIJMBM6d0DFLIN?=
 =?us-ascii?Q?QV6TTR2f+G2CAjGwwhj3vdT8sDqAuv3rRyC0XIvvsXaI78XqYQ9vMRz9NYhf?=
 =?us-ascii?Q?wvYQA3nZF161Otjm+O3iWkgR+mHkZ5rRvfhuPLgJOi6AkZN6sDp9fkcULI58?=
 =?us-ascii?Q?LEccs5xxLrlZ2VFFtV7IyuGPh5uBBMNPK2BbStftGclei4xTSuBIVRxVLttX?=
 =?us-ascii?Q?JfIZch9XdqjguNnIMEBPF03dpSgR8xor6vr4cKFGMdjet5S5kgAObNpCi7ve?=
 =?us-ascii?Q?hNIbtJmbenUeL3H0pYyFDxcSCOqrwOxLeEN6Fji1iUeKfFSqtFYCyQtmWnnQ?=
 =?us-ascii?Q?TZUQ59fQiPEAuOobtnFHDiSgT9naTr3AG0QayO4HGw/PB7dmt9Kk5l5k6gFV?=
 =?us-ascii?Q?nd+TT22nxCnb2UyHBjcRJl/kVZWWklBUjx54wzxeWyM2mTfqpp4h+hjj7LUX?=
 =?us-ascii?Q?+OSQyalvsuAuHIz8tJ/dcmoUaBAid7NFD7YVswZmH2YUwgM2Y+tsFksjgH2n?=
 =?us-ascii?Q?jD2nzxur6pExpFOgNAUqbPTcL65pL5q/QhztWFpwGqCK9gnS8l6DLaDKANXL?=
 =?us-ascii?Q?KmmzG/v0RhD4fohgiMJk1z0ID2hYc7wPHPKDMtWCchGYh4MOygsqMsO0fPwM?=
 =?us-ascii?Q?5eSbn3I+4/OvmN31shPk9JZ/9raLJg4svQsHTCBh7sBr2gfUKGHAIHuKE+tW?=
 =?us-ascii?Q?e33jpRU8WrduPlOhLgeT0/1sxllf+J7aG090Bm1dXwLq3rcTYw+zHRkcLmQx?=
 =?us-ascii?Q?WWiIo+799p7Mwj+NS2xnLdzl0kVo1xzLYSvegnx7E7ojv20kd+3V0/jnfK0j?=
 =?us-ascii?Q?JgH4AvzSRr1iBkHkUCvsMFK/0BZEJI4la87xWM3yJXFBwu2N8L37ixGhrrjy?=
 =?us-ascii?Q?TOA57LmZJg9cGJT+KUCAgsxm7PgvcmQogf+c0EUTC4t6t/qPbarTvC5d/urn?=
 =?us-ascii?Q?SFejtp5kVU+hImp6LPGn2X50mduUKYcYI8okN97e58ypTodOk2Bz6qMfzKJW?=
 =?us-ascii?Q?fH80W7EGPcAnLaAxJNXovOvy26aroM0cQEbZHIOy8L86+FWxEzcv8UVvTVU/?=
 =?us-ascii?Q?ZIugr3xK7eytcfDridWjqgi9JFTQgW8Z8WO9spuUhb01ppva4wi9uMYEILNa?=
 =?us-ascii?Q?HYGz2n66RmAEKeW3GD9+RAEqUhps0T8bLMsT7/OX7BYiaYqT1V54eaF+4kLE?=
 =?us-ascii?Q?/CZqKOGxto3X4S1Y9MDTeX0hIzgc7mBRyXXSxIFmSCyqSBHWitWB8p07GgG5?=
 =?us-ascii?Q?JCzCFyUAuwWG7zpnImgJAt9VvCbTWk0ObPdCNFjr5EB5Cu+6zk1QkoKSO6O4?=
 =?us-ascii?Q?1Xv5rkgrttLxo8mxmvFtqSLZHUBLxbLmD8j2bozTiLI36dKjsiBl4xbfixvw?=
 =?us-ascii?Q?zJJgZBDNQ/3F6Z6QSLmnlovijSft0JDT?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23d631a7-a660-4f3e-736a-08da0b695719
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2022 18:33:48.6166 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aJ0eqBG4t5tFdiHTAkw4zq1Lr8tZnH/vfaSJn0MUqUXWvrqS8bePNEe/t2Eiex56h+mkbcWYBNfumIID9nw4LQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6084
Received-SPF: pass client-ip=216.71.142.165; envelope-from=tsimpson@quicinc.com;
 helo=esa.hc3962-90.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Cc: "ale@rev.ng" <ale@rev.ng>, Brian Cain <bcain@quicinc.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "babush@rev.ng" <babush@rev.ng>, "nizzo@rev.ng" <nizzo@rev.ng>,
 Michael Lambert <mlambert@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Anton Johansson <anjo@rev.ng>
> Sent: Wednesday, February 9, 2022 11:03 AM
> To: qemu-devel@nongnu.org
> Cc: ale@rev.ng; Taylor Simpson <tsimpson@quicinc.com>; Brian Cain
> <bcain@quicinc.com>; Michael Lambert <mlambert@quicinc.com>;
> babush@rev.ng; nizzo@rev.ng; richard.henderson@linaro.org
> Subject: [PATCH v8 07/12] target/hexagon: prepare input for the idef-pars=
er
>=20
> From: Alessandro Di Federico <ale@rev.ng>
>=20
> Introduce infrastructure necessary to produce a file suitable for being p=
arsed
> by the idef-parser.
>=20
> Signed-off-by: Alessandro Di Federico <ale@rev.ng>
> Signed-off-by: Anton Johansson <anjo@rev.ng>
> ---
>  target/hexagon/gen_idef_parser_funcs.py | 125
> +++++++++++++++++++++
>  target/hexagon/idef-parser/macros.inc   | 140
> ++++++++++++++++++++++++
>  target/hexagon/idef-parser/prepare      |  24 ++++
>  target/hexagon/meson.build              |  17 +++
>  4 files changed, 306 insertions(+)
>  create mode 100644 target/hexagon/gen_idef_parser_funcs.py
>  create mode 100644 target/hexagon/idef-parser/macros.inc
>  create mode 100755 target/hexagon/idef-parser/prepare

Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>

