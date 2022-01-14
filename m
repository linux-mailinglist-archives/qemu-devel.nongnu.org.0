Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C32448E53C
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 09:12:09 +0100 (CET)
Received: from localhost ([::1]:36736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8Hgt-0005V2-NY
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 03:12:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1n8GvY-0000Jx-Po
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 02:23:13 -0500
Received: from [2a01:111:f403:7010::713] (port=42723
 helo=JPN01-TYC-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1n8GvW-0002sz-0T
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 02:23:11 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lLeGP6p8I8W27dP7S19VXsFKDcBJEYhcFoBloAc5pLkkyswVRYYXo9gPKyiuQ8JTXkj1xnj8RlUKg5l/UwgARXCbOZ7Z7JfaOnkzrX1VNHN/jmw1CaKjqVNUhDu0zHS+J3o6Wz4w4XKWgCldewBGsgVL5JaiG1jxyOJBdxf4r3yxUBLLe3UdT+qC7Wtc8Uq9CVlGFHb4NpdwAdIpVZjb5DK7/4DGFCjENp/8wcUyoROnC5pf+XD7z7oGxUsr7hEMkdRPPGDZU0UoEMLAx6hxcLNS26VBhtoOm6fOrGiICLRLKX2Q4UI0GE0vGbK5+ekTUOWXY0vQ2jERVt1GkFHBNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eEknVqjBwJCQDjao6xBWWw2HpokTydQLn/qV71BRgt8=;
 b=d/67A+ohVCkMN2T50iEbDkat7fdaxmXNOYw3mN4HOkcA4XfT0B/Le5ONqNBoeZejBuDY/UjjdvhqMASK9d1U8t9ZspsmcR8FryEx+h97ff/RRooddIypFdnnZoZY49MeL3sng8cL8kHE8jBAm01nONplvfCK1KzpZbbRS/Ir3b8KjEXrHbAM0LAqJ4agUxaWt6Ez+n0LWckpuBWtLENxwysytu1TjNfkaVtlQLu/vXfxWuoBJLo7aOZ/OLJfdUdgkQPzzqa9FpkOqMy3N+mZoDf2rdX5KkNkRPZ5IoYg3MacWhu05x6AjtEZSc47tZrbTVmiJiMrB/1FUKvyCA24Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=zenithal.me; dmarc=pass action=none header.from=zenithal.me;
 dkim=pass header.d=zenithal.me; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zenithal.me;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eEknVqjBwJCQDjao6xBWWw2HpokTydQLn/qV71BRgt8=;
 b=rE0KHwJifaTiiZnWVuk5ixUtKhcJjzSTljT+z2MqG9ixvPzcDhSKQNTZQ6vGtz6SY2bfSe7d6ChdBlixr/aGIWNJqWuJSj3b3heol7CYJZd09Eng72ZZ7+X1QqXG6YCD/aVaUE4uKslGnzoz8rxG+xkBiE+wFPZJP1N+Fw8hVvs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=zenithal.me;
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:c0::6) by
 OSZP286MB1168.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:118::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.11; Fri, 14 Jan 2022 07:23:05 +0000
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5cf9:8c86:9001:90d9]) by TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5cf9:8c86:9001:90d9%8]) with mapi id 15.20.4888.011; Fri, 14 Jan 2022
 07:23:04 +0000
Date: Fri, 14 Jan 2022 15:23:01 +0800
From: "Hongren (Zenithal) Zheng" <i@zenithal.me>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v3 6/6] MAINTAINERS: add myself as CanoKey maintainer
Message-ID: <YeEk1YPhQLboQ6+E@Sun>
References: <YeBqg2AmIVYkrJcD@Sun>
 <YeBrfDkT4ZBgJRPa@Sun>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YeBrfDkT4ZBgJRPa@Sun>
X-Operating-System: Linux Sun 5.10.81 
X-Mailer: Mutt 2.1.5 (2021-12-30)
X-ClientProxiedBy: HK2PR0302CA0001.apcprd03.prod.outlook.com
 (2603:1096:202::11) To TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:c0::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7e346b13-196c-4ac6-f121-08d9d72eb46e
X-MS-TrafficTypeDiagnostic: OSZP286MB1168:EE_
X-Microsoft-Antispam-PRVS: <OSZP286MB11686FD3EE543906BC1E4F29BC549@OSZP286MB1168.JPNP286.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dXmf4Uuvc+yBFdPPIJLEQV6p1sdqQHgfUoJIQ7Bj15ggbM/No4DvNnptHHfGrGmw8vf+jDcmevetxVr1kCE7P7T8cJPk1+Iy52RKuyZWHRCrwo9cSG70cyKDNubMkEPdkYE8p4gWokcHGWvHq8049V1CGasZuuFozrx0AOn0XqSVP7iYAT7BioIKccvSe2T8lJ36R0QvjTA94BYCf3D/YHxRSUwwaVJBG9KaSDgpD95F7C9gd0DtBAWs95TKnKm3l96SB1DQWoEj/cWu6+UjxBX0RHZgBWSrM8h511Cvzn37DMOW3O+cF5LC0/4aQ6Ar8d9MWqmK/rjUcNiVS5VPU23Z2qz6cX+XJ4bAfTTaQisorw3VasScD+I0397rt1TiXbDaIU4KVljml3AeDtn996cBZj20TgfwIi2TFE4L0LptwvZfs+go5bYEFJuIhudfxaQ/JUfIVe/Ve+eLCRSOF8xusceqPf1d/o5/FLKYX4cyZf2GaX1RlRACrZZ6bjCFoqgu/tth0UTUS0TMtot1BRsiIJFWnZzkfsJs57NTbZ1xKHETafFvEPLUQxnlUdW5XVcJQ3N1jtCto6XY6+wmXnqGju1T4iD30uOr6zvBjvZloDlKjak6QfbKiFd0Z8vkRPv/06YR2ThsbxkIP6Fb08COViP29cWILiesGoMN4f6gkOTGZjB6z6b/xJcDXcd/wyBoWTNauhclgFyXY8UESA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(7916004)(396003)(39830400003)(136003)(346002)(366004)(376002)(316002)(54906003)(558084003)(6506007)(66556008)(4326008)(5660300002)(66946007)(6666004)(6916009)(83380400001)(786003)(2906002)(66476007)(8936002)(8676002)(52116002)(86362001)(33716001)(508600001)(6512007)(9686003)(186003)(38100700002)(6486002)(49092004)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Fo5QCqTn1GEr72WdT59CFjiFOg6rkwoh3gKwcF1DOtL83l4jDub7Kp5oqEH/?=
 =?us-ascii?Q?ywGhZYfJwCkYUuo8xxz6kiDU8XB+nqRxElCy8K9jPXCkrArYgVg9onS63D39?=
 =?us-ascii?Q?xgCaougSazV7JpQm2QLFVjB9nuAPBgcKKpuHE1FtFjrY4Xmd6eiGapy0WBb/?=
 =?us-ascii?Q?eVfWWeZaD2cG1S4xbntv5Z0/HvgdhxDTD2kCsCCemet42VaPXRKSyBZewPBU?=
 =?us-ascii?Q?9AE3qPKq+wCr+WknfjEKoscnBaeDIm/AxVDDQt7xueXhxeo24Pin361Cx7g8?=
 =?us-ascii?Q?AO3ctUt+l4py2zKEihC/MNQIdXZY5qdkCWjSzh9OysLe3+AmejRwkjLVeJJF?=
 =?us-ascii?Q?Qa0TyctGoOzuUB7lE+bWgkNcM8RWa3blYOLdMGaxdbdkwSdIrkQmBI452aab?=
 =?us-ascii?Q?4eNyddffH5xp+CizoPpYtH5j1gAq5Ksi9s/KgpzTjBAmDMqb5ayX2DupD9k0?=
 =?us-ascii?Q?/FAZKEDhFtDdkkfeeFhxXddScOWVIQUSDLHycOYEfZXva3wzDwrEPZ1xh0PQ?=
 =?us-ascii?Q?p4FeVNYI3TwQMXAlivMkdrDzSSlVc3OrsAsw+8nF001G82ryQZT9jQjY6EMS?=
 =?us-ascii?Q?AXrOhnkG2e3mHk1U+gWU7DlRFapk29cWd5Lvab1O0U00I8XmLq4hvre6zexp?=
 =?us-ascii?Q?ckKgGt1TRUDOHs6/4oVdQNndT1KhBoYwDieAhg1soWx8wiL1ANOF/ZiWC+YU?=
 =?us-ascii?Q?XGt0Che+mCv19h/a559XY61bvsw02J0OOaoPZXtKeKlVKGUKGYrjeoulwcSN?=
 =?us-ascii?Q?TfdQNJOKudNl7QsS7em7VTFfULYXWk48JZsDvGvgp58cR6HBhKLnVvBTF1hz?=
 =?us-ascii?Q?OoHt5cDI9nfP3wIVNG9ABrvm7t7faMaLGVuZg4tc/6M/fb/uFVkVQWTsjCzN?=
 =?us-ascii?Q?60GHE7JTil1XoiacVFmienEIVFuuuWmCkgvfMhRXiz53rzIIZcB6cQ5fNSXi?=
 =?us-ascii?Q?fktN1K1z1UmQ9a9/h//+DOqCvFRnPYOW8Y8kmejip2a+EhefK3MX/hsKHqTj?=
 =?us-ascii?Q?Sf+8ndcn8Q0SVsRiZSgemXRlisSyYOlpn09DylAQ+8vJz6++S6vLYK3DXi06?=
 =?us-ascii?Q?PBhyXQGg/Dfa4xnXTlyYDDPSTeTEUFEC/Sg40OI6hKrXS9V6j+e3p/WYTg4c?=
 =?us-ascii?Q?9BrJYWSxURpi517GTanvMR9SHszv+rQfy9/ShpT2k8L8FQ6VT+tYg8WrA0Fz?=
 =?us-ascii?Q?99+j/YxjRAHIjyNZdIWTmPHW7gffA2SCYeUKOpvPH1fUlbC4L9qZGOdYKbzM?=
 =?us-ascii?Q?+cXZpg4qyRpoiur0bXg2+52HredQ0z+AiYSAY2kiFUb8F5ChGU5JdjteFD6x?=
 =?us-ascii?Q?7npFGh+fmZcqm3dG/a7Vvrn37tTnWuG/G7PZhXJpE8aY6S/m8nMMlbGSBG4K?=
 =?us-ascii?Q?JQyST27s5PRrn2o3p9teutQf+ZGhC0P0tn5jKtFd9Dvg857ttD8WlOBrQR0v?=
 =?us-ascii?Q?Z0iW1bJDFFg5gfuZ3WGuM9omeF1kEhMQ0kyvqr3g89tNuF6SrpJ/xFtpz7BL?=
 =?us-ascii?Q?0sJKpSwBewMeYvprcQ9r/aivGpq2wNoobkKLv1s4WN4VHImttfezw5FgtWSQ?=
 =?us-ascii?Q?Mu2i+BJutawgyfRWqBbAOvrogMdH5288+NrnVyi5?=
X-OriginatorOrg: zenithal.me
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e346b13-196c-4ac6-f121-08d9d72eb46e
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2022 07:23:04.9334 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 436d481c-43b1-4418-8d7f-84c1e4887cf0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 61flcs6tYUfdTuY+euVHAhHEkCuUpniUIjpSiiycQZru6WI6aawo5spXkhMuSBGx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZP286MB1168
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f403:7010::713
 (failed)
Received-SPF: pass client-ip=2a01:111:f403:7010::713;
 envelope-from=i@zenithal.me;
 helo=JPN01-TYC-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 contact@canokeys.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 14, 2022 at 02:12:12AM +0800, Hongren (Zenithal) Zheng wrote:
> +F: docs/canokey.txt

I forgot to change this line, I will change it in the next version
along with other requested changes.

