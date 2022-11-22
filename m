Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD0063422A
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 18:05:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxWiG-00047s-Ua; Tue, 22 Nov 2022 12:05:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1oxWi7-00040h-Hf
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 12:05:35 -0500
Received: from mail-bn8nam11on20700.outbound.protection.outlook.com
 ([2a01:111:f400:7eae::700]
 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1oxWi3-0006eo-KG
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 12:05:25 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jy0uzb20sRX/btxJnMaHWMU6COguY96uLPgk6PDlgXXoOLs7RJ03mTJAW4xz0le8YnndPAhBjwhZYvkfnD3lKIMq2yjxWla45ruRW67B8V6Zoi21jLd6zFCX+Ot3UB8szrTBAdIqeP3OWApo+MU0LdWDBtuWCSiEMcfKNFCmOQDCP9eyN0696xGC+6Ycd6VtuscU2H8NHY5vwDF+BMGSYICaHGAMaI+6iXnSeskOsJjcWmQ0gq/Q6KfWERJYtCUtEpQbcbyn7bTcY+1csNcfFjtAgD8XDEuduJmV4IQI+AHE1YHGSfvbqtLmpJ35muvkcIP9+Q6m935m80DPGu9CNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XGeLGDhCo1/W60sIqIJ3YZbV/Ocut+tgK6m+rR/yHOc=;
 b=ajcw4O6S1QJE7zyFI3ZnQIK2BZ3qu72QaI76WRVMdDqDnpeK/eSHQ7/W8dXHcAoRdbA7ZLTQHh6tdLd790uMaTZ5PSVxmTR+codwXkS1KYTQmeC8OWNEQfVVka9rRdtga5HHnQ9G8qg0j4WHRWv4ZsFu/vLvjuCVcAVS2cKkCuRaV0DifqLisLBumx3+KdYRJkRQpqAJwnQ5FH11lOYMGMgmrEJI2g0hwqYRYxksNSNT64cQVGbo4tAc5QjVf1+iyO7jkm02utC22CxALRpLcZP4NpTUzXCauU/FcnPuNTLVdTJJwrSgcaSYULDypVAMl6UkhXcqGSPNrh9QevG+BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XGeLGDhCo1/W60sIqIJ3YZbV/Ocut+tgK6m+rR/yHOc=;
 b=OU+PgOTiesYPvm9QrcMZogtnXnQGSZ7bRJ0V06eSmibhvqLtKoRCVsPLJxCyf4GsxhUcxROOtITsGSwYsD7EESYMPnKf8k1wY86RP3q2V46hgfXl7K8I+KMuGZWya+JFMop8qMyZ+lpcAYkX2TDxw134915G5lLFrV96mXR3oZY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB7124.prod.exchangelabs.com (2603:10b6:610:f3::20) by
 SJ0PR01MB6208.prod.exchangelabs.com (2603:10b6:a03:29e::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5834.11; Tue, 22 Nov 2022 17:05:17 +0000
Received: from CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::607c:1d6c:d30d:6281]) by CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::607c:1d6c:d30d:6281%3]) with mapi id 15.20.5834.015; Tue, 22 Nov 2022
 17:05:16 +0000
Date: Tue, 22 Nov 2022 12:05:02 -0500
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, "Emilio G. Cota" <cota@braap.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: Plugin Memory Callback Debugging
Message-ID: <Y30BPtRgqSlLvtGk@strawberry.localdomain>
References: <Y3QNRWUK8BLRQlaQ@strawberry.localdomain>
 <878rkbalba.fsf@linaro.org>
 <Y3gAIEythPY+z0q0@strawberry.localdomain>
 <Y3gA/i8bBkR7mgkQ@strawberry.localdomain>
 <87wn7oarhw.fsf@linaro.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87wn7oarhw.fsf@linaro.org>
X-ClientProxiedBy: CH2PR10CA0008.namprd10.prod.outlook.com
 (2603:10b6:610:4c::18) To CH0PR01MB7124.prod.exchangelabs.com
 (2603:10b6:610:f3::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB7124:EE_|SJ0PR01MB6208:EE_
X-MS-Office365-Filtering-Correlation-Id: ac459c1c-070e-42dd-0ac5-08daccabba73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8Apu1DfV/KiuK0dezefoYcrOtOLlQMBbqG8AsbFBQa1ICS8JKjhGpyHPb6nw2zfMTXkE7yxje+VRZcmMnVoBDynbISUlECFgQO2/z2TpkhUB1J8/H9gVA0Dx4UM3nPOkiHt41Fu3EQ4vhrXTpY3t6yGgtd0BJiWTOkxzE4dvgUPyter/4852BLB3d5K0uoBXcqd+ni5cpy07e5WCva878X2ovSN3VDHmzZr8FYh8eAC5dzu3bLA9j64jb9bUBgcOdZuJvF0fAYZKsJBDJ6xYrR45zKGbuWiwFsjXMdBUH5RzOqy9VlP+8vdo5Ag7ER4U5GfzS5VW5tl0rhMI8L9GrOgLl0cIs2kaLK7uu7AHIh/TK+Upu7wilA27zU6Gh4CtA2AmoBzNvMLWXtRcWoCBZzuAmPIQYjTeubfiyItLodfkvpfdi9Iglt9EwyX9czxK6lphAG7iFclgUAcwTzWr4LZZsShcwt+f+z9H0/TVQKf0hhWpXnru5v26PPJpxSX8uU24/BTicaXQ8XnpQfR+L3ZaOgoTRtHdV696+tgW2RXb40t/UXdHIRDU2PMs3ZiyWvMMi2jhBusSmtUEG0Pq0vi2uG+LnsIPlr05Hpa0pd1LBO5sZan1/dbz0d+gDM9OhNRpFj4ojXVt3yZSFMeE/w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR01MB7124.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(346002)(396003)(376002)(366004)(39850400004)(451199015)(2906002)(38100700002)(3480700007)(186003)(9686003)(26005)(6666004)(6506007)(6512007)(4326008)(478600001)(6486002)(54906003)(316002)(8936002)(8676002)(66556008)(5660300002)(66476007)(6916009)(66946007)(41300700001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?N1/eD8O/QOA0MvPSdhOv+jqdK52D0hFGp676nk/zPHwWumeXcyYkF55Jz/?=
 =?iso-8859-1?Q?ZCHIOLgZ9p4gUA69QU4w7OpxHt1TAYLr5fpiZwUUPEa74vi3/8Ig1I0FMR?=
 =?iso-8859-1?Q?P4vro134Frq8nbwM9A/PnqAnJpOdJ8J/11rQ5nlD6SQD6vzwyizHgyIizH?=
 =?iso-8859-1?Q?x5yIwjC5XBwIQrkwuTvNAGDgf+WqBJ8uNc0g8audZ1SPnxaOZIvaIXf0YL?=
 =?iso-8859-1?Q?2/7d2OW7THKbFuqbph0SrCqUjefcMPGZJ3UywJMH7aeHyb3E7qwv8/JByu?=
 =?iso-8859-1?Q?JZloS/aQ37IpTdFpDigfd+hcoZde/QhUvbQB/qCE2uA94Fqu+XMVcw5mpW?=
 =?iso-8859-1?Q?mQTadOTuegjD8ARYykHfXkXv3sZcNig56BxNlHj+/JRpk0vgTIBqp+9cfs?=
 =?iso-8859-1?Q?ECRlu4cZaW2BK8JYBC+09yNDq8MfGqXYZ7sltqCo1YVVigy5ZteJvPiCP5?=
 =?iso-8859-1?Q?B//Lvij/QQHZ9ePg2Mr1yVV7gzA5Saf95PiEXVk5iXZYk/bNMjGVmqawSb?=
 =?iso-8859-1?Q?nJ4dcuBMiZciyFPXrsC8O4ME/iUL2OBwZOfl3PAG3qgDLHnC4iz7brXmx2?=
 =?iso-8859-1?Q?VWQVW7JP7OpL1GE1vIY6pwl/yG9IVDVB49R5lF96IK8nRnoAgFP2f5hrSV?=
 =?iso-8859-1?Q?mmo5IjQIJXRfIsPgcCjrN0JtAU6AIyDQAK1QSXbOWDqHWGTiqRHX9V3Y0A?=
 =?iso-8859-1?Q?4Yym43MNo+YZB8SxjyakGY7fBWjH1MtCqy52cuCgYAHm81k0BmvLrd5MRr?=
 =?iso-8859-1?Q?xVchduSqgvEbbho/6En332v9J5dqZOXL8RGtY7qSXu7LwrQ1QnEcmtIJeO?=
 =?iso-8859-1?Q?Oer+tm0NM8uqhnTxfEj3TM3SzR/xkfpcwQR3tDG+38pU28ucgE4LiT49g4?=
 =?iso-8859-1?Q?3T31OPMV06Temh8GzGhuZJYZmV+ABIOmI+Mln08p8gKCNvaGyWiKdGNssc?=
 =?iso-8859-1?Q?jkKKDKZmLtWeb/QdA12XlTFGziXlkLUpS+zYAVHhkS4cOlHQciHgFvJm9h?=
 =?iso-8859-1?Q?JhzqvJomQ5qF+cnn7a/t8QSfOC58BS/ILXi/zGX76/4Yrpyzhe/0bfxGDm?=
 =?iso-8859-1?Q?LiJfWeDuHcvnSmkNFpzHSsYIQ++owEn59N6icKT9MGwk9CkLqslSPTd9iY?=
 =?iso-8859-1?Q?dDISsqcU/4uUgm525c+dMCtmpJqPPSkLuUenkOJNj4zFvk77W+Qk55dqKR?=
 =?iso-8859-1?Q?YqNNI9Un27T4q+eSb5xXhgeWd5CbNKLJ5YDKw8rNO3hRf/1erQt5zfWBGj?=
 =?iso-8859-1?Q?ae+t+bDnPDjdMcfjAW3a/8z86k7l+7v5NBiQP6p7Wc5ZjyaRZ6SUujTfE/?=
 =?iso-8859-1?Q?cef/5UfTnAQzNPS2vHbEuuonbYmKdqtU/gpFje0zwERPS9ybNj5Zv2KOt3?=
 =?iso-8859-1?Q?iC8Q1locw0s9rP/HOUs7+7G3j9i6C7Jc2dT0SqBKz33VrUl2WH6baXfkF2?=
 =?iso-8859-1?Q?jtlovtrNrpQkl/oIFhlaNUMtacal6rp4MSZ0SVSMwnuSKUmmkSVv6j7eGI?=
 =?iso-8859-1?Q?+X/ikivd35i8KMSq96KnWTULn9GKT9G3C6AQ+3nG9X2YbS+7xjEoYNXxIB?=
 =?iso-8859-1?Q?ea7YcVQfal8FDxSi2T15ICKLuYrXlU0nvSHAlS9Hp/MWsV1LhR6JwUfr3u?=
 =?iso-8859-1?Q?jvDQ/Rpi6QTq/IkPI1moNmVTlZkvnlb2PUpPD33OqkIE+dMyff0ZgRHL6E?=
 =?iso-8859-1?Q?zIMCJ/bU9pXOPswiOTg=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac459c1c-070e-42dd-0ac5-08daccabba73
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB7124.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2022 17:05:16.8109 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gFTu63Rw5wBG5OEcLN2Wqode+1YeV7BfRloUQ/wRCTTq/jBcQjPZyHkf9J9FlyJW0zwQakETghIzbs4Bzm6Zi0gVik6FxZt0dV3GCstR+x+vYNaPCHegAavd5c97BgXz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR01MB6208
Received-SPF: pass client-ip=2a01:111:f400:7eae::700;
 envelope-from=aaron@os.amperecomputing.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_PASS=-0.001,
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
Reply-to:  Aaron Lindsay <aaron@os.amperecomputing.com>
From:  Aaron Lindsay via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Nov 21 22:02, Alex Bennée wrote:
> 
> Aaron Lindsay <aaron@os.amperecomputing.com> writes:
> 
> > Sorry, left off the very end of my timeline:
> >
> > On Nov 18 16:58, Aaron Lindsay wrote:
> >> I have, so far, discovered the following timeline:
> >> 1. My plugin receives a instruction execution callback for a load
> >>    instruction. At this time, cpu->plugin_mem_cbs points to the same
> >>    memory which will later be freed
> >> 2. During the handling of this callback, my plugin calls
> >qemu_plugin_reset()
> 
> The final plugin reset should only execute in the safe async context
> (i.e. no other vCPUs running code). That flushes all current generated
> code.
> 
> >> 3. Ostensibly something goes wrong here with the cleanup of
> >>    cpu->plugin_mem_cbs???
> 
> This may be missed by the reset path (hence your patch) but it should be
> being reset every instruction we instrument.
> 
> >> 4. Step 2 triggers the TBs to be flushed, which frees the memory pointed
> >>    to by cpu->plugin_mem_cbs 
> >
> > 5. A store exclusive instruction is translated and then executed, which
> >    requires the use of a helper. When executed, this helper checks
> >    cpu->plugin_mem_cbs, which is non-null, so it attempts to dereference
> >    and use it, resulting in the assertion.
> 
> It should be being reset for each instruction I think.

FYI - I suspect my above presentation of the problem suffered from the
"searching where the streetlamp is instead of where you lost something"
problem. In other words, I did/do observe the error at reset, but I now
believe that is merely where it is easiest to observe. The
cpu->plugin_mem_cbs doesn't appear to be reset at the end of
instructions and manifests at reset because that's when the underlying
memory is freed.

-Aaron

