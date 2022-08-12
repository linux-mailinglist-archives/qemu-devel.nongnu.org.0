Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0AA590D8F
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 10:42:10 +0200 (CEST)
Received: from localhost ([::1]:43228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMQF7-0006g2-9a
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 04:42:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>)
 id 1oMQB5-0003Ga-0M; Fri, 12 Aug 2022 04:37:59 -0400
Received: from mail-tycjpn01on2111.outbound.protection.outlook.com
 ([40.107.114.111]:13735 helo=JPN01-TYC-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>)
 id 1oMQB3-0005zJ-1I; Fri, 12 Aug 2022 04:37:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GtQ4+aienXBmDLsUBWYL8+dt8l8+IwDPhCCI5atfrqJHaJh2c4k5OjAm7bnD/6kVhtUbI8haR9MTNl4Dl1csqfIAEtZszYY6nA919c3/9Xrac/dbgoiu+HWsXBU+ZbtcsYq3vpKUjDhxN7cfr73Dle7jHE6xjZhnWYr7UjKNN+O3b+6n27gwrlYvh4S8M76zsuzBpMHEvJEVMMKFKGwVoAt49iVuARelpN4pPIwWuiwDyPTM503G6VD7ZqKI0BfyYu1O8ishVifLQNJzpVq0+TFR5ySwukHTuwfRn0iZ/13Aqc4qzC3eLx8v2ICrE8b74VqmgaMHrwD6xu5GmtHTOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZRqkTfccbUAnOWo057k3WDVYdNDARpLx2zmpUacIEAc=;
 b=ehG5UyEsvKIlGT5fDyG/edoSYjxXgNNcQioUY41TdFRuXn532Tz6MgoCDa3OODEjhZs6I70USpwrhlEFRMaZVbtJxT2ZB5QP9dYAW33Ob5t0jLSLazrZmzYdzqgNZVL45wnCSbgvksSK4YZqWGU74UMlKtz2TFTzQuKCmG2txKuDVOxRxbQKBGdyCk9u8KGvKKOMpeUMfNMbvSSoZYTUjStR02lKVroFW3NaH2+Ixyzw20nKfj8wSdds1QvNNba2GigiFByT0gYtDGhwGzIrz9dyOllE4C91rQsQPTqWx3Y0Fb5e4IfBnua4+cW7AWVkPXsYJlaGtIlicwes7OdDbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=zenithal.me; dmarc=pass action=none header.from=zenithal.me;
 dkim=pass header.d=zenithal.me; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zenithal.me;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZRqkTfccbUAnOWo057k3WDVYdNDARpLx2zmpUacIEAc=;
 b=GcC5NIt79IYOL+sFDk2n03xC//stppR8c8hbZHaUly3pg81f3IUkB/C9ZnMCuy4ThW0T65zUlxcmd4a737RcvbpKYpKvqhZHOKxjev/YVosim/Swg0yObRfjpz3rDxOs0tk/+ZmnWkOymuKrp0PyRzezA6vNVid9dlYW6g1Q5dM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=zenithal.me;
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:c0::6) by
 TYAP286MB0121.JPNP286.PROD.OUTLOOK.COM (2603:1096:404:803a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Fri, 12 Aug
 2022 08:37:49 +0000
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::591f:bb1:e62f:72bd]) by TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::591f:bb1:e62f:72bd%5]) with mapi id 15.20.5525.011; Fri, 12 Aug 2022
 08:37:49 +0000
Date: Fri, 12 Aug 2022 16:37:41 +0800
From: Hongren Zheng <i@zenithal.me>
To: Stefan Weil <sw@weilnetz.de>
Cc: qemu-devel@nongnu.org, libvir-list@redhat.com,
 "Canokeys . org" <contact@canokeys.org>, qemu-trivial@nongnu.org
Subject: Re: [PATCH for-7.1?] Fix some typos in documentation (most of them
 found by codespell)
Message-ID: <YvYRVfwBDttg/Qj7@Sun>
References: <20220812075642.1200578-1-sw@weilnetz.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220812075642.1200578-1-sw@weilnetz.de>
X-Operating-System: Linux Sun 5.15.26 
X-Mailer: Mutt 2.2.1 (2022-02-19)
X-ClientProxiedBy: BYAPR07CA0093.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::34) To TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:c0::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a4b8e5f3-ef70-4014-2081-08da7c3df04f
X-MS-TrafficTypeDiagnostic: TYAP286MB0121:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P0yTU8rIZkl0/hgjjF86CUl6VxMBlWrIq6AYbvrNk0UWTl8RgGgRqlZhBZtGUbv+Ljdvng4mjzg3dXd3vK8+sAOIUHjCCY4F12eo4mGpE+fytYeD4reZdEDvC3hl48Y3TiQRolWk/B2suuWyWCRPAUGa8eMQFyn3m0lqrsyacNBR0PY6Pmrh3+N8J3tQp/wkwHLVXzkM+wYrvMtARGb/STbfgNB/DsfLUx15rKonLtMX9Tii2bp1LXho8SpDEltXgp8TF1L+V4shDMpph33yY/V1VJWFHDfgg4NfLOjImOgJbG9Q2FIWpdvpYmC0pzhHBcwkPmkkraOKNsymFrcdGbuB7UjvmhR1WlE3+nJ35i6Lp5mL1GDCsZHBYDXjmZjGEIIOVedOURW9uJ/F0lolXAw6RS5Ks3sQL4e5U3xmS4meDd4l4lFYdmdHi/GFlNHwUYw7eIe0KUP8t97EWonSQIk310pfpFD0gec2PJhzzOYGiNEZrqtIGAfoixCFbZ1Fad6vASNv2ZuegEs6MsMV5yxyCbKDbLNd864hmAje+Z8vFwpR/bvtP1gE1zbecNNvsl4dAywicTcWbOLWJ/LAoIPCGlydnrJ99wrEE0eMv8gB38m+Pmb1Uv16llx/eOd0G1oUC9AjaNxJknrcMebu/E7IKNOAvxCR50GkMOiGGx0qKiVluiSkx0fjvHXeQUh10HM610513WYZg6wBwHlWI1+xGhihKcqSVqUN9ApdbvSBY7b8sffU3QnJ+yt+1meGf/dyyDPkUcZV2Y2rvXG4urNCM1kOjDrWBMGke1yl4S8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(39840400004)(396003)(136003)(346002)(376002)(366004)(66556008)(316002)(786003)(4326008)(38100700002)(6916009)(33716001)(41300700001)(6486002)(66946007)(66476007)(2906002)(86362001)(186003)(8676002)(478600001)(6666004)(5660300002)(8936002)(41320700001)(6512007)(9686003)(52116002)(6506007)(49092004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?C98+D5JZjc4c8T0evBuMnldLJGu3pwdG0/feWQotmb9TS1nkeqUc3digFo3s?=
 =?us-ascii?Q?payZjdH1ofxCCMFR6kd0XZxV0unE/YbH2gJZ2zWq57OW6c7qoOKq5IWl3vNv?=
 =?us-ascii?Q?lZPsvdAHpWJmj6nEuskY/3F/EZRU2pf156lBcOLt/Z3CvL2xvdLxvQwKBRcG?=
 =?us-ascii?Q?z/1iq9VvB+IG7EKVn+XrVzlZx5Yci9cocY0OC+7y/OIAwnN+hOkaOtR7n2QY?=
 =?us-ascii?Q?gtUhLtCQ4rDPz86hNZNT3JYVP9YxjDuNbS3i4MUmTr73ekOGn+59STHrBt37?=
 =?us-ascii?Q?M8e7xK+fPV3d/P/zA4ZPA6f3e96FKNXxN7SoAMc6i6gDFKWZ4pkFDBDsLqIc?=
 =?us-ascii?Q?oaJ1vaqgYG+jNOTXzycTDZ9wZGT+7MHVHX+DazC9WXZeldF9FNncgpttvtb5?=
 =?us-ascii?Q?5SSvZVWTnyEMO+jKFG29Y64WlLeMf+CSjOFg44dlkjtFRfWwJg3GtNll0F5y?=
 =?us-ascii?Q?sDdDBY2d+oCoQJX8DFFpJUJ3EMLyqOAGtqLx61KCb5sABbnAMSkZxKC3Vfg+?=
 =?us-ascii?Q?KjjhttzI7+99JR2BMetxrS6M6a5XOLy0rhPqBExAtH9+OK9NaCc2gjHzts5R?=
 =?us-ascii?Q?S4Sym1EsAsufE29UeM/+fvAniqwaG1kMFltfWP/wIT1tmDXr815tZ8HVbf7Y?=
 =?us-ascii?Q?KCuqEseJ6ISrtLgVXp6m+h8R3B5gTVvXHJlf1uBf27HHyLhJ8itRqOT8cj7f?=
 =?us-ascii?Q?/fafzXL8rn0v/dF9iZoWya7DIg7zn3lzQPHxuto1Jt5xb7vUJb3N6o/IjxIp?=
 =?us-ascii?Q?XbnZvJLXjcSfFV0E+ep5+s1dqOMjwA3r9oNSTQmIylinwdrqTOZsIBXf0ocW?=
 =?us-ascii?Q?O2PySFxaOLVPbKk7kcKGddTlCinyMgBV56zM7cmaSYqlxfdnrvuy3YVG8zAj?=
 =?us-ascii?Q?o9lb1UXqlLVYTZCuOuyRzztYEGqHziNk6DhPSzlUVimHORfKmTO66lK77FRz?=
 =?us-ascii?Q?f6AcLaYBGyYFlswUwaSwz0C0jmIJ+modo4r0Vp77C7D4K6QH9zi+v9ECPx7+?=
 =?us-ascii?Q?nbqESxfB9FZJkDZiVUpxkzzEkjGsZPAE58P6R0DeFJMSTbuzfQIOev9q45vZ?=
 =?us-ascii?Q?+Rx/MQBP9Q3bxRBIIeG5eqVhms2wzh4vacrWtbNazwHWM3LmKW+jjl5PUpUb?=
 =?us-ascii?Q?Xj03BWfS1qY2DcSWwM/kmnhHwEX2351ib5k357L7ioQng5iN1b54HHGm+oM0?=
 =?us-ascii?Q?A/CXVFJJTZcS87C3mAEqBUdiCiv7MKDiMWGTYx4hHLiVal6z5xFObOKUPQIu?=
 =?us-ascii?Q?c7/N9C4YFEH3h3KY+Gk6UNcxMyu1tXhRu9+T9H6wsExZc3lQHcjWjj44YyQc?=
 =?us-ascii?Q?8z2Ii1PscVTfQ3CPHcWzLASWYTWKY2fef4O54n9S4YQf3UYuf9SoR4G/U42y?=
 =?us-ascii?Q?Tl1vjP8h1aFxBfe/oYzmY1fwGmKq29TmK/3VQnbEMCQJZjkPb+CtpP0L9HQr?=
 =?us-ascii?Q?UpWg3BATCkT3ONXr9utGqdH0RFYhgoUUib00MSVxgqUa3wJMyKFBS4VWBtjd?=
 =?us-ascii?Q?ho6TmjnJydx22iA4Z+wRXKvAwkCVmppY49EfGfQxha5uSxeNCFGFTrv1iiIx?=
 =?us-ascii?Q?e7s8ai86j7r6g5YTnSi48tGMeJGT5gVkxuoycJZS?=
X-OriginatorOrg: zenithal.me
X-MS-Exchange-CrossTenant-Network-Message-Id: a4b8e5f3-ef70-4014-2081-08da7c3df04f
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2022 08:37:49.3850 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 436d481c-43b1-4418-8d7f-84c1e4887cf0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JHFnIiYHTnDpFuWf0ybyNqKp/MVI1LygYgzopZ+Invn7/FL13/WDaAtvU76vHNd7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAP286MB0121
Received-SPF: pass client-ip=40.107.114.111; envelope-from=i@zenithal.me;
 helo=JPN01-TYC-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 12, 2022 at 09:56:42AM +0200, Stefan Weil wrote:
> diff --git a/docs/system/devices/canokey.rst b/docs/system/devices/canokey.rst
> index c2c58ae3e7..cfa6186e48 100644
> --- a/docs/system/devices/canokey.rst
> +++ b/docs/system/devices/canokey.rst
> @@ -28,9 +28,9 @@ With the same software configuration as a hardware key,
>  the guest OS can use all the functionalities of a secure key as if
>  there was actually an hardware key plugged in.
>  
> -CanoKey QEMU provides much convenience for debuging:
> +CanoKey QEMU provides much convenience for debugging:
>  
> -* libcanokey-qemu supports debuging output thus developers can
> +* libcanokey-qemu supports debugging output thus developers can
>    inspect what happens inside a secure key
>  * CanoKey QEMU supports trace event thus event
>  * QEMU USB stack supports pcap thus USB packet between the guest
> @@ -102,8 +102,8 @@ and find CanoKey QEMU there:
>  
>  You may setup the key as guided in [6]_. The console for the key is at [7]_.
>  
> -Debuging
> -========
> +Debugging
> +=========
>  
>  CanoKey QEMU consists of two parts, ``libcanokey-qemu.so`` and ``canokey.c``,
>  the latter of which resides in QEMU. The former provides core functionality

Reviewed-by: Hongren (Zenithal) Zheng <i@zenithal.me>

