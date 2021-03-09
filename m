Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B22332A69
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 16:29:01 +0100 (CET)
Received: from localhost ([::1]:39544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJeI8-0008QZ-UU
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 10:29:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1lJdX3-0002i6-MP
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:40:23 -0500
Received: from mail-eopbgr750092.outbound.protection.outlook.com
 ([40.107.75.92]:60901 helo=NAM02-BL2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1lJdWy-0003d3-5R
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:40:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J0I69ax+o6DnosorjwWox6bFAu9FcQYs7YJ9YPVhP3f9i8PRubo+Zzqavk+ecQfE8+sGYbsSKKMJKL8v9blA1ZdjChHrDtP64SiGqiLJFnFvwCknsj2uEwhgPzFqzl9aZBD07G786yVznr+6g7+XMlcUYHYDGeZ8nvZIhqGPzKRm5t+6VJ/x0U2ggneVBRjft3deoJ3IAniUxzwAMCjfRd/94c9RZIouWkV1vqMvHuJ4vg3IRNNHzkyawmcUIU120PR6QwoGFScXT1MT43As1N3QAjaetx1DZ3BdQIDZeuvcaQlZLYOwlKfeZ+8qn7iUvo3zm8LjDJ0zci5TKK0xPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ByH1XVOmLUAlYjS5aH9aKjc9sax1YUkNFXfV5oec/Y=;
 b=obvzMVigmpN+kEOPX5sB7UeY68dwvskkTbw7RYm9ETa+7pp0wVf7bw2wLodQei2OGMAZuIGiJlemztzn6L+vt89dfMOrsXVrCggon0j2DZlwu/rVnx+a8Ss54KTmyxAtqCMxTicwev5mAGUXTBz1heCplx1SYfkPHmc09LhLA6gv7ngPoXsQtqyAEnONHBm7tnEJJUPoi+3pK5xolNANq28D39kjCKq592sixhxujy2xpH4GYFcN8wivhtCzKTPDG1GMUlAuwv0OYSjMeVcuKwmOtccmUGy4OhDNku1+YMl0uJGb2dqsNoVdOxwAjqT7lkn0n46zhDbnPt57p0gdOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ByH1XVOmLUAlYjS5aH9aKjc9sax1YUkNFXfV5oec/Y=;
 b=uCHX/Tlt7GQO+CqZjb3jOONq8BdGKp29+Qs5wadjc2Yjl045krsA6PoSrN2Up2maZ+O0y78+82VpXin6CPl9uHSjA7vg8EW1gP+yd9JiKFlH2v+quFlQzDgHea7E72PDvQqlPAy50KsELTgQzVT0Bv8fEvZ33zlc0hqSXvvKgf4=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from SN6PR01MB4304.prod.exchangelabs.com (2603:10b6:805:a6::23) by
 SA0PR01MB6473.prod.exchangelabs.com (2603:10b6:806:ec::8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.26; Tue, 9 Mar 2021 14:40:12 +0000
Received: from SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::c43:8d97:e9e9:6403]) by SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::c43:8d97:e9e9:6403%7]) with mapi id 15.20.3912.027; Tue, 9 Mar 2021
 14:40:12 +0000
Date: Tue, 9 Mar 2021 09:40:16 -0500
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 "Emilio G. Cota" <cota@braap.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH] plugins: Expose physical addresses instead of device
 offsets
Message-ID: <YEeI0GLdvRFAB+FV@strawberry.localdomain>
References: <20210308201406.1240023-1-aaron@os.amperecomputing.com>
 <CAFEAcA-x=FPqFMi7=RkPj4sU7nPgqZCnRf4x7k5_e2AcryGJ+A@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-x=FPqFMi7=RkPj4sU7nPgqZCnRf4x7k5_e2AcryGJ+A@mail.gmail.com>
X-Originating-IP: [68.73.113.219]
X-ClientProxiedBy: MN2PR05CA0024.namprd05.prod.outlook.com
 (2603:10b6:208:c0::37) To SN6PR01MB4304.prod.exchangelabs.com
 (2603:10b6:805:a6::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from strawberry.localdomain (68.73.113.219) by
 MN2PR05CA0024.namprd05.prod.outlook.com (2603:10b6:208:c0::37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.16 via Frontend Transport; Tue, 9 Mar 2021 14:40:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b79a501b-7fa2-4f8f-9e36-08d8e3093ecc
X-MS-TrafficTypeDiagnostic: SA0PR01MB6473:
X-Microsoft-Antispam-PRVS: <SA0PR01MB64730ADF770EFB79B11CFA558A929@SA0PR01MB6473.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nb4V1/xYhiLzoR1dUuXgGyidYUMfa7vRU50Ws1mvucAm0JgRNKodR5JwycqOvHv5bxELuDR34ZwHgm+0nR2i24QlTAA2ANdpAKsrUWopZHvplwN3FTiK7hbmHwCC6OVtnxDLdp2Ad0KxesG7pvYfXHHmsgW0xNm2pBsCfVUYNnLHnjpyTHTayZkem7c/+PJ6+NaurERwrpCY8Yg7/TZfk9xKkXTfPUgmntAk5KJy3NR+e0lIKtAIECVkaJ9TpMLzzGPf0kMXoLjpNVXv7yJW3p9THUJ2CXpImlS7+Gvdgh8UD8JN+lNrNhuu8TJeDAm71t6MhmVtrWlBvdKr+FriyPGZDEM/C6l5rVvNa1BFa30zKqVtuouj3YI8tIIrD72voi81Guon3BzULKPpRMa2lKFUxD6lfepeYfrp6uZxvw8hXaU9aKe63d8V+ojJR5iodCDtGU0tlJieDBqShXh/WSIZMx0b9Fa9K0v2ovNpIgwyKFOD+olDZbtUbQwmg15EQMkJIYRzJ85Wj6SebctM6ZZ0aub6aOaiZ4D32dA41nJ/PH3QvLyZl1VZcK+lTq+g
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR01MB4304.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39850400004)(136003)(346002)(396003)(376002)(5660300002)(26005)(4326008)(316002)(86362001)(186003)(16526019)(9686003)(6916009)(55016002)(6506007)(8936002)(66476007)(8676002)(7696005)(66946007)(83380400001)(52116002)(66556008)(54906003)(956004)(478600001)(2906002)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?b0HkEF6ruXJxRkAMhmqyS1LIIcPmxiaY5iautZqbMsJ62m5Sav086YcllsHK?=
 =?us-ascii?Q?G7/0UKCYXjeaREMtJIC1LRhErhfb9LQpLeU7bCxxPQWHJ9E9wvZTXyHC/R/F?=
 =?us-ascii?Q?DaKCWcVZwtefBA2XueUxgADb1FM7XyfZ5z3sEpjIqHdKBhLeR8OSiXo9s19l?=
 =?us-ascii?Q?P4y8OyrMIdRmP78W3yEfruqnqJkMtWVt9aDGabCVPzmZgfg2U88vwnV3+IMn?=
 =?us-ascii?Q?WJcpvStsHgPsoeMrELsJyRgN6Fn/T9FZJ6hv5my5fEyzp6HWPbuBD3BO8mAS?=
 =?us-ascii?Q?LVqjyYmpk9oV1AZjt2wbx3p5wJ7nWNHJzI8/Qw8WnAobDf3YcILash1VJUCd?=
 =?us-ascii?Q?FoU4ExxD6kqsP7YhwLF01vut+FPPiptHgBtwz8giMBVl0VKtWGx6miK+ST0S?=
 =?us-ascii?Q?h96xs/eNXdFWp3eKrWUKHQFUghz+SQ/m1vnQXaTsHYwz0y4+yMg3OWxpgOwu?=
 =?us-ascii?Q?aBFfhDUYv28e7rMh9Oe4EPL5l+jhJa/+SUJBe1ujSVV+WGg6cNexU9BVx51M?=
 =?us-ascii?Q?TNJn9XvY2itAeQ4dYXf/u4125B1FU72H1iVKZvryPoXtrJOPW2cYPoxyIPlH?=
 =?us-ascii?Q?BE7HaB+x707s93tSBRDWFR2/520JFEZ9ladc43e9YV9c4CaCkF6XpE6X/11V?=
 =?us-ascii?Q?34dWyyFM1mphwXBS7q6RK4TmXGKl3wzMV1kJN+PruSOhswCSA2ozWvgVF6iw?=
 =?us-ascii?Q?G7CWBUvvOoW/c/d3cm772DuAdvldcnFErcwjQohDYiooky/yf5Y+t3FkafHM?=
 =?us-ascii?Q?NQiDWNFU/RY/g42t1d/Uoln/GKZTNEeJdyyI2oi7aCQXK0T8l5XKjBhTuwfr?=
 =?us-ascii?Q?LUAbdBaNI0+j7K9B8pG92BiAyqlrw3j+62YZ0MeGIDYeA+J6jXxikHKePPsl?=
 =?us-ascii?Q?xSFPc/JsZxKO7W+Blh+rm5RsR/hlOsJA/uLmKSWeRH7AaMNjtPvKPj103ED0?=
 =?us-ascii?Q?I6yGAR0s43VU/z76N0bhVYnvmJLTfigNJecTmurEDi/oy26qMSgVZ+MM4r3W?=
 =?us-ascii?Q?Rb78VF+79mNKQm3YG4uJY1yPG5hem8QSElwRcGgRoyjmP6EwuUcVXG0q3llw?=
 =?us-ascii?Q?TKctxh7D6t3ICPlAxLNhoXw+D1QwvCabZIRHbxG9fGRPlJM5wlxE26PrPM4I?=
 =?us-ascii?Q?/ju9iDPNy9A0WK7UUfFHGLNW8uxvCCuWlJX3b+wBShlRvJgwubaFfschWLJc?=
 =?us-ascii?Q?sHnL1j1AHosYmGthgUuk3Y2hkSGExmkinKjLcbLvjneQAfXxNiTTsvgdLoBy?=
 =?us-ascii?Q?e+oJMSfUvHSrmXY0JaPWFyEscYEvz4HQE0l0Nv/qX6gVbCrvlNx4pAzE2Zhp?=
 =?us-ascii?Q?5qw/HKOKwGUgLoTamEGDZWGV?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b79a501b-7fa2-4f8f-9e36-08d8e3093ecc
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4304.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2021 14:40:12.2482 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1nHD3UZY5h/epXlLreW6aC0ZHSf5hclcD4MPSnv42yDLY3c2xr4wFamd6K3w2okzWucOrzwdT35QGKdxtVgNbnY7e8B5aevNZhiGeVff3rc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR01MB6473
Received-SPF: pass client-ip=40.107.75.92;
 envelope-from=aaron@os.amperecomputing.com;
 helo=NAM02-BL2-obe.outbound.protection.outlook.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, MSGID_FROM_MTA_HEADER=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

On Mar 09 10:08, Peter Maydell wrote:
> On Mon, 8 Mar 2021 at 20:14, Aaron Lindsay <aaron@os.amperecomputing.com> wrote:
> >
> > This allows plugins to query for full virtual-to-physical address
> > translation for a given `qemu_plugin_hwaddr` and stops exposing the
> > offset within the device itself. As this change breaks the API,
> > QEMU_PLUGIN_VERSION is incremented.
> >
> > Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
> > ---
> 
> 
> > diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
> > index c66507fe8f..2252ecf2f0 100644
> > --- a/include/qemu/qemu-plugin.h
> > +++ b/include/qemu/qemu-plugin.h
> > @@ -47,7 +47,7 @@ typedef uint64_t qemu_plugin_id_t;
> >
> >  extern QEMU_PLUGIN_EXPORT int qemu_plugin_version;
> >
> > -#define QEMU_PLUGIN_VERSION 0
> > +#define QEMU_PLUGIN_VERSION 1
> >
> >  typedef struct {
> >      /* string describing architecture */
> > @@ -328,7 +328,7 @@ struct qemu_plugin_hwaddr *qemu_plugin_get_hwaddr(qemu_plugin_meminfo_t info,
> >   * offset will be into the appropriate block of RAM.
> >   */
> >  bool qemu_plugin_hwaddr_is_io(const struct qemu_plugin_hwaddr *haddr);
> > -uint64_t qemu_plugin_hwaddr_device_offset(const struct qemu_plugin_hwaddr *haddr);
> > +uint64_t qemu_plugin_hwaddr_phys_addr(const struct qemu_plugin_hwaddr *haddr);
> 
> 
> This should have a documentation comment, since this is the public-facing API.

I now see I neglected to update the comment right here the function
declaration, and will do so for v2.

But are you asking for additional documentation beyond that change? If
so, where is the right place to add this? docs/devel/tcg-plugins.rst
doesn't seem to have much in the way of documentation for the actual
calls.

> Also, physical addresses aren't uniquely identifying, they're only valid
> in the context of a particular address space (think TrustZone, for instance),
> so the plugin-facing API should probably have some concept of how it
> distinguishes "this is an access for Secure 0x4000" from "this is an
> access for Non-Secure 0x4000".

I agree it could be handy to expose address spaces in addition to the
addresses themselves. Do you believe doing so would change the form of
the interface in this patch, or could that be a logically separate
addition?

I have a secondary concern that it might be hard to expose address
spaces in an architecture-agnostic yet still-helpful way, but haven't
thought through that enough for it to be a firm opinion.

-Aaron

