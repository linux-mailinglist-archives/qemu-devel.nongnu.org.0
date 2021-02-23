Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4103232FF
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 22:10:56 +0100 (CET)
Received: from localhost ([::1]:44214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEexL-00008K-19
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 16:10:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1lEewC-00083m-E4
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 16:09:44 -0500
Received: from mail-dm6nam10on2107.outbound.protection.outlook.com
 ([40.107.93.107]:21600 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1lEewA-00064V-7q
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 16:09:43 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d24upz7IGJq9g5UUsCbDmfetpLGUFcGdRbGyCVo8OsiQYnKex+4wWOMwW0UjPSBh7bH6ZrmYUZb9DLoldEzMm/wyjLy+TVsgZ8ocri4cL9x/Y4FW/RfWaMPGT05+0XEKzzwVClqGIUCVAykRZNPtdUZ3kbi104g4igUjvyAZjuY5PuZeceaTo5Jd4HPc7tEzCW+c4Ds6x5Bi6DyHT2ItvSYPNDpkdfPHW3n3ip/UkMcfwL7z40kh+UfVB0e64DG5MqvHnJPOSh915qIkpqN0IJ8ZDh7CbGwIeMw32oxllHvltkTkwHSNpH+XpyHVoj5q/FBa03bztXvhIR7T/PPQog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wnjcneg9j0Yvv3bGUSyOwFs16g0pm/pSg2BnCvkvcJo=;
 b=kAE7HmgjLgap2YVzDIykLsgdacjLp9jUQwVcgWDIvwpM7Zp2kQz6BnyvNTBTl5mRTZ9sPBL8m7+pE3uZT4EzL9Q0DpVnw84426A3/yuebWCUQmzLRRrUc41ZPIMnm0bvpQifhqKII6IOr0uGLro39LaSE/DonkmgnqtK9xhEz4Fww1Jle/A+jwpRi6Ce+xEHqdjftrF/u56yDsKgLedC6cadZC0CFwz90g/czcC755tf0+86dHmEKaFIQQHs9++zp0JENmmMY+d9bX8JRE7oYMo+qI/eR5LQNH2wydTfY12rzZzIIIZ8xzecgXYI8qrU1qAOXHmNhDwUF+fp09pYZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wnjcneg9j0Yvv3bGUSyOwFs16g0pm/pSg2BnCvkvcJo=;
 b=eb+vlIK0RfXZuei3i6ZbAOyfUbMRAVo2wn9C1F9yZ9BopERu+QtXAimqLBb7ST2enNEHFe/gdb3NRPJxE1pmtZUF4FQZMnRh5ULgKF8GzN6eUOTw3UufX9I6p0Qtdr/n/KuWBZRm35WTQFZ95BzXMJ+52LpDycIHEmREsAA9cjs=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from SN6PR01MB4304.prod.exchangelabs.com (2603:10b6:805:a6::23) by
 SA0PR01MB6459.prod.exchangelabs.com (2603:10b6:806:db::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3868.29; Tue, 23 Feb 2021 20:54:35 +0000
Received: from SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::c43:8d97:e9e9:6403]) by SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::c43:8d97:e9e9:6403%7]) with mapi id 15.20.3868.033; Tue, 23 Feb 2021
 20:54:35 +0000
Date: Tue, 23 Feb 2021 15:53:54 -0500
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, cota@braap.org, richard.henderson@linaro.org
Subject: Re: Plugin Address Translations Inconsistent/Incorrect?
Message-ID: <YDVrYk9O2gBPwxe4@strawberry.localdomain>
References: <YDPk08PCwhD7Nm2+@strawberry.localdomain>
 <8735xn6fy7.fsf@linaro.org>
 <YDQYrptOxAjs0Pf0@strawberry.localdomain>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YDQYrptOxAjs0Pf0@strawberry.localdomain>
X-Originating-IP: [68.73.113.219]
X-ClientProxiedBy: MN2PR11CA0022.namprd11.prod.outlook.com
 (2603:10b6:208:23b::27) To SN6PR01MB4304.prod.exchangelabs.com
 (2603:10b6:805:a6::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from strawberry.localdomain (68.73.113.219) by
 MN2PR11CA0022.namprd11.prod.outlook.com (2603:10b6:208:23b::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.28 via Frontend
 Transport; Tue, 23 Feb 2021 20:54:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0292a005-1401-4c08-4be4-08d8d83d3a24
X-MS-TrafficTypeDiagnostic: SA0PR01MB6459:
X-Microsoft-Antispam-PRVS: <SA0PR01MB6459A918EE2161859818F6738A809@SA0PR01MB6459.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VRuOYEnRNPx5HClv+6vPOOCFcCzlIg2JQpfL/NrB9Lf6P1K6Eag4NgOE2bwCY+403hYE7wBUo4BFobbgW1PWC2BkotP1SyxVxEELVyAloTVtwjBOyWfFBPxO6OpokY3lHKVpb3eyqah6/avWiabwy9OaBgSSiGEuq+Bl/H9vxK/Yc5taHIom6Y906YsXRHYTwmXlZrbUHcli6F0mBRSFJIYce03krNtRWOIWRxvQ5OqiGKjq2a7yXvf6ggeI8FDAO3UYLW5FuLS77zFHF5Y4LlUQR9XcqSGCe+feO4JilAZNRbLA9LSkkUVb/wn0wGRqlsldFvVcFVikQubhoB/yuc/Ml5Wk5uPzXF3rszWFAFpWOiUcmd+Rx4gTPCHLrbfNTB8z1n0LupZ6dwRivhovgnTfXr5pi3vTYCUNZrfhOcITw8QtWjY9umQ565ZDCJF+iUDVfC8vBD4ZatVKVEZNoxsdBH+GvN7++efmL+eprajKZElr9LYJxqeGAH5r8SnZcNJzEBe7kSumLAR28nplbA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR01MB4304.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(7696005)(55016002)(2906002)(186003)(9686003)(4326008)(16526019)(26005)(956004)(6666004)(6506007)(83380400001)(86362001)(498600001)(52116002)(66476007)(6916009)(66556008)(66946007)(8676002)(8936002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?iso-8859-1?Q?scfhY9tBIcHLc9ISduHcGicMA7Fcx4ln08M4Fhnvw5D6z+ugzgdk9n2lGH?=
 =?iso-8859-1?Q?lp6H7U2Nn8mVt0Q1wXxp4ROwaNNFUzGIFvMy4DlfC2+5t8fAI3Hrq1UBXT?=
 =?iso-8859-1?Q?OAbBM+anGT+2YnioKVXKbGy9c7IkIWIhCOzX3Q/jlj68y1raxEN/d6if8C?=
 =?iso-8859-1?Q?sPBTEN1a3yrB0r+TrFGCYkh/zjd6llUWRn5gu9LTzLrKTgweo8HYzFEmVF?=
 =?iso-8859-1?Q?i/iySvFcDB3fyGtxJL02acba7J0LTKgLSG70R+Ir9BOG0Cv1i2Wp7Fyc4q?=
 =?iso-8859-1?Q?Zt/0DSApEhxtevPc5Epl5qW9RiUA2d2fXiqnpE+7vw4USRd4exEPHCYPmL?=
 =?iso-8859-1?Q?8YZjGqMWg9pviZ3qeQX/b6RdShdKvbxw2hN4tSAjf4PVCujcBOk0GvuUGf?=
 =?iso-8859-1?Q?cWWjDOxP9Wr1IDq4JAz4w4yW7TQUC0bzyAjdQGqqu9qPsZm0Sx9dhsJj9J?=
 =?iso-8859-1?Q?7zkMBINDWTjHOVNxceUz9zgI02I8dI6AIvodiEOeopiMK6So2K3s8bd3Zm?=
 =?iso-8859-1?Q?Eagy1LawhK/Xr5cY2Bk7OE2UHJv4eJV7rNy/H5XqP7zshciz3Zu4Ms8lvd?=
 =?iso-8859-1?Q?rgR6nYLs6OrqgbbEpnCKr6tuALxRU2nt7wFJCKB0sU9vaSMqfpDiSqDEQb?=
 =?iso-8859-1?Q?asZz1WkyFHv3oI4rojMe0hNJ/8IGR8IDPMRQ31ffxmnimqWyi36eJyfgvy?=
 =?iso-8859-1?Q?BwJNKZAtzdgQYxVocrTWYhjFFlPl1ZBMbmP41W48Bb/RbcKR5DCoYiJkY5?=
 =?iso-8859-1?Q?C4iu4KU+KyALwrmAfEHLQIu1ipNZz/5wFR7HGcB3zUEy1/jonsLoNBXxCv?=
 =?iso-8859-1?Q?JBjbcOJoIobRaYt/Yle3zIbV6ZEj+5kN+IxCbAHgVAlkC9wFFbbj86f+1r?=
 =?iso-8859-1?Q?9jqR5oroYZqOc4fEuyDSm6z3s8c6i0FpeMa2PthM4VQEbEh1ohdmdHhqUq?=
 =?iso-8859-1?Q?a1UgexxVtVrasClgA36zdbXNxRiCjVK3+zJnv6ZO1zXMyO2SbpGzxnzSUS?=
 =?iso-8859-1?Q?jC6LdN+9MVie+gtUBhz80W46k0fNWcRiAoirWw/Ew1xqms1TO9Sw8Jaj6X?=
 =?iso-8859-1?Q?1xf4h1yLmEivmoQplSG3J/8nkY3lyXRfk0CBIB5qai7vMZcPsZ+gAu7Puh?=
 =?iso-8859-1?Q?CxRHhBFyUY9xBC/nN29WVv/tYSfM4jsytPCSCydyHt8SIblvZI2SsVSmKm?=
 =?iso-8859-1?Q?AYOcgxNnbvuNg1dw3iSMXZ3gwFo8w8VFE/fn+IVjclZ5gv4/ZINJvZZh02?=
 =?iso-8859-1?Q?+pG5uPeLW2+ME/cezed07SgcQkYpYJ2Qd6VjP0TBTpU4ehn7JlPHXSqCJg?=
 =?iso-8859-1?Q?O6PO9HiL5V2ux/Y4ZKfyDg0Y+vFQMIu9lTy+DGlPxExBOsIxBD1XeERiGx?=
 =?iso-8859-1?Q?ShznEViGMD?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0292a005-1401-4c08-4be4-08d8d83d3a24
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4304.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2021 20:54:35.5965 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +ls3qdhDH/wD8pCi/p6jYl68Wq9uaG1GyI4NYDZFaiWBodomLrtBw6tFGBkdvgzgHvwB+JniRUwr6TLgsU+YJj2NxvrAs3DIIwRLpBHRxRg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR01MB6459
Received-SPF: pass client-ip=40.107.93.107;
 envelope-from=aaron@os.amperecomputing.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  Aaron Lindsay <aaron@os.amperecomputing.com>
From:  Aaron Lindsay via <qemu-devel@nongnu.org>

On Feb 22 15:48, Aaron Lindsay wrote:
> On Feb 22 19:30, Alex Bennée wrote:
> > Aaron Lindsay <aaron@os.amperecomputing.com> writes:
> > That said I think we could add an additional helper to translate a
> > hwaddr to a global address space address. I'm open to suggestions of the
> > best way to structure this.
> 
> Haven't put a ton of thought into it, but what about something like this
> (untested):
> 
> uint64_t qemu_plugin_hwaddr_phys_addr(const struct qemu_plugin_hwaddr *haddr)
> {
> #ifdef CONFIG_SOFTMMU
>     if (haddr) {
>         if (!haddr->is_io) {
>             RAMBlock *block;
>             ram_addr_t offset;
> 
>             block = qemu_ram_block_from_host((void *) haddr->v.ram.hostaddr, false, &offset);
>             if (!block) {
>                 error_report("Bad ram pointer %"PRIx64"", haddr->v.ram.hostaddr);
>                 abort();
>             }
> 
>             return block->offset + offset + block->mr->addr;
>         } else {
>             MemoryRegionSection *mrs = haddr->v.io.section;
>             return haddr->v.io.offset + mrs->mr->addr;
>         }
>     }
> #endif
>     return 0;
> }

This appears to successfully return correct physical addresses for RAM
at least, though I've not tested it thoroughly for MMIO yet.

If it ends up being desirable based on the discussion elsewhere on this
thread I am willing to perform more complete testing, turn this into a
patch, and submit it.

-Aaron

