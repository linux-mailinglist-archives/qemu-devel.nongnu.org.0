Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F3B2D1BEF
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 22:22:26 +0100 (CET)
Received: from localhost ([::1]:59708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmNxh-0002wN-9U
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 16:22:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1kmNv6-0001vt-Pp
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 16:19:47 -0500
Received: from mail-co1nam11on2138.outbound.protection.outlook.com
 ([40.107.220.138]:40993 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1kmNuz-0001iQ-Qh
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 16:19:44 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NIg3vJ4dscqN8k5Syl9lkRTJCUu8hz39ZYvBds3EzGqw+dFFnLKGb5gBCwKWllIFSgLnoNftPqqGnaD35sYYd/QzJOY5U7SNrliIN9k5KsA3fpI5bmxpco5ttpYCPN7WalLGu+8upIuAIFGtpuwNIRdXcMHfoKKGj06ApHtkedaU0Wk5yFiD+ekoD6UyNZTtur5Wbm12tI3lOV7M8sDlZaLQVM98sroqHaBMYhVAHE5gxEowXqIVUVhbbGOU0NFHjCzLhNvj7C4rwJz+A4huEK0v8bLrPtUXKvis92nIx63Pnbt/V8rfG2TJZG/u0pz5Vuqlp2XVIo8Y4iJhBUcyzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mLpQrYmj5psyZUMtnatc+iM7WKUUqwEjRozhRJ8ciQ4=;
 b=CCpdFnpA73V7gYjf8wSWdWVs3pL3AZ+NZnEy14X5jJsMKzK83DOAh9V4JlzLJh/1zPe9ffWHx7lPA5zku94UnlwGNC10ySqOwgGoznvP9ipo841HS/PiT8QnA6iAqDQfAPEAcHDsfKw0lTFDKqEurT48dnHI5VWRQEfWjoYhjBwMF8FWMReL98nWgFvrxzODGBn0Usz+JKaZALNuxTfmAPnDPjw0mpEf4rd2qD78CxoyaxPSO9fS880xbTqVqstpfKNbhMj1ZdLn1ddv0qhqs23gOijFYzMeJHj4skh0JyY0fWu2ecDbZ+R0KgxgQ6lkwlZODecjyuXmMyM7AykKVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mLpQrYmj5psyZUMtnatc+iM7WKUUqwEjRozhRJ8ciQ4=;
 b=QzkRRhwkjb6ys4IrgWyl208//codmQeIHY2rThV9YDpXdWmi1BPqALEPnAZzau1WKvuiKfBY57mCD2KoqdspCXay3kR9rFnstqJpQ6hbIq+9n/ydIBMhjpenIbKiP0oOHOnFxTx/kaG0zp9v8FGaySilwbpGF5SNQSkxcJl24K0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from SN6PR01MB4304.prod.exchangelabs.com (2603:10b6:805:a6::23) by
 SN6PR01MB4352.prod.exchangelabs.com (2603:10b6:805:e6::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.21; Mon, 7 Dec 2020 21:04:32 +0000
Received: from SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::882b:7534:1246:a8d9]) by SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::882b:7534:1246:a8d9%5]) with mapi id 15.20.3632.021; Mon, 7 Dec 2020
 21:04:31 +0000
Date: Mon, 7 Dec 2020 16:03:24 -0500
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: qemu-devel@nongnu.org
Cc: cota@braap.org, alex.bennee@linaro.org, richard.henderson@linaro.org
Subject: Plugin Register Accesses
Message-ID: <X86YnHhHMpQBr2/G@strawberry.localdomain>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Originating-IP: [68.73.113.219]
X-ClientProxiedBy: BL0PR03CA0014.namprd03.prod.outlook.com
 (2603:10b6:208:2d::27) To SN6PR01MB4304.prod.exchangelabs.com
 (2603:10b6:805:a6::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from strawberry.localdomain (68.73.113.219) by
 BL0PR03CA0014.namprd03.prod.outlook.com (2603:10b6:208:2d::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17 via Frontend Transport; Mon, 7 Dec 2020 21:04:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 96a33ac1-cf99-430b-1a86-08d89af3b18c
X-MS-TrafficTypeDiagnostic: SN6PR01MB4352:
X-Microsoft-Antispam-PRVS: <SN6PR01MB43521280A596859CE0FFA7EC8ACE0@SN6PR01MB4352.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sz8v8UihoElfjtxfhq3TkDZJ1Hb25dhqaBAb0k0f42Rj/qanYwE7yIcCNxpmWjmQAYGPpJi242yPhMjdTOqSFR+XNa0yf4xush5z379lhOfk0+chXGjMyCIWC0rRpcFH6O18szZTy9KJ/dWsB67mvKOkd6hBQFpw7usjVuICvZUkRD2ZFsAYM3A8TBJpJQPh+fuHbIzoQCtUc037vktw1Hjcwn+bEL5HoerAWRDqIfsb8BjG4R4jRAKWrFzqbapw6cJaGwAC28xHzwbIFBq5G7sNyGQOWM9dNbrC5LhTFF8X2CB3MaORhSY9T8nRpr2F
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR01MB4304.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(136003)(346002)(366004)(39840400004)(2906002)(66946007)(83380400001)(8936002)(956004)(6506007)(52116002)(6666004)(6916009)(478600001)(316002)(8676002)(86362001)(66476007)(4326008)(4744005)(186003)(66556008)(3480700007)(26005)(55016002)(16526019)(9686003)(7696005)(7116003)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?M0sun2wQ1e+8LG7/y3T3J+8zxbJyYEWQM6Xpd1fmkGt0hws9ypg26Rclb01i?=
 =?us-ascii?Q?5rBRPeD4TQQt6gPs8SBYyeOtsERrO9OIOauthWVDN3ZIopGYyfSVC0Wk2M3+?=
 =?us-ascii?Q?Mmvbu4x1MtI0CWi6Jhh01PU2m5sz2gt1+SKwpY/x6kh8zftyWXodtrOBef5L?=
 =?us-ascii?Q?5LgmfHG8eWTDOftVBdR0JuCN0+wTbcUiLRXoxkwjuGziKeWDykAQGGLGu0eZ?=
 =?us-ascii?Q?qyB1rCITaauF9vtwK/I+xX26ePQWVEHXBlz5bG9H6IiIjWYf2nGsfZQNcegJ?=
 =?us-ascii?Q?ZxrPjytN9KM5eh2ZNzPnZ9htlD/FB4hyhM5QNXDbQzAH3K0jp/disrpgrI0p?=
 =?us-ascii?Q?y21lcEG3x26k1q6294G6ris7fYHh0yZZDZZpnWLsYuiyPWLLIK6wSidcMAJK?=
 =?us-ascii?Q?Kg0rxlYKpb5wj3TEylDG8dvG+Y01rQpaaip4vavOa2ApltKH84wC/ecqO0HM?=
 =?us-ascii?Q?C3BDFVVptH9Ij0AV/MT8AEAJstEso1PVGWbYBEuNombf9mD50irS5UZa3ixb?=
 =?us-ascii?Q?vny9bhgyVBtMDQ3Zc6mIkKVsGM5v6WDqFQx5hkrvvQfV+n6/h/r3QdJIfJdF?=
 =?us-ascii?Q?kWWuOpCCy2MPL1ewwrFZzBfsSKpM9Ydb1O/zO8jcFAbAFYtSNHrnQo0ZKNI8?=
 =?us-ascii?Q?LIck6HKvHw5o0zP4CgnvuEYsw33wmFsUp7dfDGzemphforFIcoL5ILwPqBre?=
 =?us-ascii?Q?Lp599kHl1r3xaiNx1ZrpoRBGvCV2LPty8wslZPODgUCTS0ZAL7rbpGSOgWHS?=
 =?us-ascii?Q?0JevxGRuPMsyyperDojoN/8pV1m9oQ7t+UL2GV/QD2t6M6HOV4Anyl8gI4vs?=
 =?us-ascii?Q?dIcp/4spOmCXzjgMBf3tnul75GnB4y3toURxuFfZDjZoAjtCv7C1a3xhY7Bt?=
 =?us-ascii?Q?W7Rp8aSPD22+xjPnErxILNJk0fnEn6J+bNdRfU12xEzdiqaXbayLVZ6TazkX?=
 =?us-ascii?Q?icWjv2UP5mdHFqsEgt/nXSZB7BERoVrHh61k8YIvbz7TEdQFpjEj7dSpryvM?=
 =?us-ascii?Q?ENt7?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4304.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2020 21:04:31.5826 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-Network-Message-Id: 96a33ac1-cf99-430b-1a86-08d89af3b18c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GfCaYCs2DDHkCl9n1sdLC3d/EHSRu8KSi54Jm117JZ4Rsi7J1p89ryhWPi6HqleGO0PEv4Apsocd29MbeGLw46RT5xMHYOwPxrTh709O8oA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR01MB4352
Received-SPF: pass client-ip=40.107.220.138;
 envelope-from=aaron@os.amperecomputing.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
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

I'm trying to migrate to using the new plugin interface. I see the
following in include/qemu/qemu-plugin.h:

> enum qemu_plugin_cb_flags {
>     QEMU_PLUGIN_CB_NO_REGS, /* callback does not access the CPU's regs */
>     QEMU_PLUGIN_CB_R_REGS,  /* callback reads the CPU's regs */
>     QEMU_PLUGIN_CB_RW_REGS, /* callback reads and writes the CPU's regs */
> };

But I don't see a way to access registers in callbacks. Am I missing
something?

-Aaron

