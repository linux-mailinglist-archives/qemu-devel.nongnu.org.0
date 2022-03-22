Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FF44E398A
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 08:26:01 +0100 (CET)
Received: from localhost ([::1]:58408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWYu0-0004RR-BU
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 03:26:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1nWYrV-0003V0-Io
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 03:23:25 -0400
Received: from mail-os0jpn01on2118.outbound.protection.outlook.com
 ([40.107.113.118]:22627 helo=JPN01-OS0-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1nWYrS-0006Up-AM
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 03:23:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BeSERt6o+Lu95RRxRoGy8my/j+K6TezbRXjQJbaNLwxDaEYIaWLF2mGkTfEcKQQC/uRhlMcrPlJRBY4s3uVAb37G1wwjd1VRU01mnm+7QVNG+/1PnRG9YwUv1jKFx4venyAzjaVHEy+ZeOpqa4OiznzC/Cwae0vuVO2SmonxoZkKZ3BTjCF6CmPx4iM4TF3eLty2hzWkhDERpMw/+T/DwtGATXk00JLW29YS0Cl2U5P39tHZTRiE0UtJJqFbuMSwR8TRabdCofnMycH1o47BqaJqNJE+p43ocwwZn9vEqMuz1G14FJVP1qHDJiS8VQJ2u4MFHr8bGSVFxa2kNtaazg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AVgH1FKpeQT3udwyi7/dOzEfrx3oDRcZti2pgiH49iQ=;
 b=hKMM4b1abcymkbgiAlafhXxjXztpjGuDvPyIMemCeSn4nERbywm3PyjBtBg7yksqnrykQfHp9mHlMbfVegNdvFJiSE4Q236CGRmzZTUENOnNcRfBN4N6L05ywF2NQ4euNR0JSmrFiMBfIqNvQPl2FZhtz4IQMQhjY/Aj+zU5hqzH2XPww+J3ddlIOecWyJDbHIilbn6ZZ0d4vQ0Yf27row/7CIJ2+zf6WRUecN1YyTPtzSJnEahAZ2cdQ7Qz0jw34EFFJW2/MkIShgMmvFNmzU0E4OKA2GyT3iW2Xa4/XK1BVgTG9nj57Soz6CqK32inJ3pKJ35w+X9bPRYxq8Pe6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=zenithal.me; dmarc=pass action=none header.from=zenithal.me;
 dkim=pass header.d=zenithal.me; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zenithal.me;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AVgH1FKpeQT3udwyi7/dOzEfrx3oDRcZti2pgiH49iQ=;
 b=XbWmA2/9Zp/FreuzhuyG4bXJbe+WKjWHnI5sVgzp7GRA3tuom/gGtb3TO5Y/tI0ZpEjhLRI5cduLeOC/8abKY5t2p/wECN5Od8CHTIU6ZBRiqhnHFzA9mevoPLQNDJwC53P57H5AgAd+TGRxy43//Sp/TCJlS4Xuz5ULE2/oWHA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=zenithal.me;
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:c0::6) by
 TYAP286MB0859.JPNP286.PROD.OUTLOOK.COM (2603:1096:402:3d::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5081.18; Tue, 22 Mar 2022 07:18:11 +0000
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::45e2:c04f:6bf9:2134]) by TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::45e2:c04f:6bf9:2134%7]) with mapi id 15.20.5081.023; Tue, 22 Mar 2022
 07:18:11 +0000
Date: Tue, 22 Mar 2022 15:18:02 +0800
From: "Hongren (Zenithal) Zheng" <i@zenithal.me>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v4 0/6] Introduce CanoKey QEMU
Message-ID: <Yjl4KqzeVBjNL1z0@Sun>
References: <YfJozy5qjVYh24Xp@Sun> <Yge2Sy2sA6JpUvcj@Sun>
 <20220304105119.wcmgrlefsawnqmc2@sirius.home.kraxel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220304105119.wcmgrlefsawnqmc2@sirius.home.kraxel.org>
X-Operating-System: Linux Sun 5.15.26 
X-Mailer: Mutt 2.2.1 (2022-02-19)
X-ClientProxiedBy: SJ0PR03CA0238.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::33) To TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:c0::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c1e81779-83aa-4805-4326-08da0bd41ef8
X-MS-TrafficTypeDiagnostic: TYAP286MB0859:EE_
X-Microsoft-Antispam-PRVS: <TYAP286MB08594E966FAB5F06E5D8E842BC179@TYAP286MB0859.JPNP286.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8u6Dga02L0PBqHBcm8YM98Jb5RGPADrocnmym4MthFAuh0IJg7JEA+x55CXLr2Bj/FS+WBq4Q8azZaqTYkKEbJtkmZr8eMWENu2F5KXy+BQrclQXo6HE6fKDpe6c737T1UvjP8J0ddHvAcVYTg9ygLVXUOrCEZFIEj83NO92Y7WU38quMVH+oxBcUPbtksLi9a3Z88FGCQYcjqUU4LJ4i5jTTXx3M0jrPB4U5nfj7D4nmpyvRgVsDamX7PYKgiz156KJUM7EtXdnPSRF6oaGWS19lTer0bBjV88jdqspvy1G8zoBUhg6d3Dm4sp1wqK+GL4kiIb8C76eJYMpriKh334Bxx6j+5vvHYUqPxLFdeO2vEx0a2Sq69pcqUOtr7RUIeCq+o31HcP2GcFbtrLIBPJ3MQp2LXPDT54BVbcgnOc7OQ8uFYln3RXG2fMxkTTUsjcLetZEf5UAkINiKqnNeZiCTHFuJGuXsEhXSKjwbLdGSuQturQzH4lOZisevmEM+Hgazr6+/SzPl2LyxqdAp6euZlN3kqw94LFmulslNahoOiKSStgoWCcjuYkMbzgq7pPFXR2y9hvNXOzBZKVnha1Y/2PmS4jy/QLKxgRbY7DQxSzKVxsW1HnkheT1qCRSSbBim98wAQcH1E7SrxV/vbxnYfO27JtFr5fxM/lqQUDYxhkfjVFJPYVNTBd3nInjB/vaV3AiU+Jeg9sncaaJjInwDFFyG21vXPEJ+f8PItnJ6RM9bEJF85qlJOv7lKxPXZ5+7sRYPP9fEYXTUZFZew==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(136003)(39830400003)(376002)(346002)(396003)(366004)(2906002)(6506007)(186003)(52116002)(9686003)(6512007)(33716001)(83380400001)(6916009)(786003)(316002)(38100700002)(8676002)(8936002)(5660300002)(4326008)(86362001)(66946007)(66556008)(66476007)(508600001)(6486002)(6666004)(966005)(49092004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6Wx3w1PhH0yTBB2mk/1gfIK9kO4gz7prmcL8Pmcxd0lsjRzD+BudT0m+kvDG?=
 =?us-ascii?Q?DAZrz4khBen/mMIDXikp0uhAE3f/F86DtFh12T1DI5OujHdRqL8l0S3qDHv4?=
 =?us-ascii?Q?eOqJzYAJxGf/HSrj+KgD7j159gb+5L+Zzb4BIqgRuhS4ur3y1iGKAJMkaK6M?=
 =?us-ascii?Q?rC6vrtggus5MKuZa0q8mUsZwPE3BUIk87bggCKZbIu0znRtlW3nGT+A2UxNw?=
 =?us-ascii?Q?Lh44MNBwWj6LCAZH3o6qAnY8t54U+SEV+LuoayfncN7WGtVWvBLFJCE4R0iz?=
 =?us-ascii?Q?anKJ9AlQhz9pN9F8o+TCGml7R/R4TYZiw2ZKro/qk1TQwGsLoJMjgdxB0ASP?=
 =?us-ascii?Q?8jOibaaNx25NwNCppRe1s6kT1DxNC/2uC3qIv8hsj0OeIUU1lYXeX6yVspzB?=
 =?us-ascii?Q?Pv2EjjszntFXQNWN5BqsgjwWwY9kq//sQnNp1mZXkbysZQTUd1fRxKRCzZpY?=
 =?us-ascii?Q?1QJQQEbaSy+XPgPIUNPFBFLd4HPvM+TDE1DKgj1id0FUf+kMzzdFJR8okeW0?=
 =?us-ascii?Q?ZywKkySfH8b9UbHptUI4U2q/zDMK0R6Iok1IQ0LhqmpjthIgUrEm8tOfylv4?=
 =?us-ascii?Q?tjSLu9V3+JpzmnHoTiidn2kL4bVa+9j4o1Q3T6SoH4/A9bKMYTyPbjrn4knB?=
 =?us-ascii?Q?MvTRCtSFtILnPPciCLBMepnAc5EClkt+TcUnPGUSi7Q69kXH9tiGj1ifFOhv?=
 =?us-ascii?Q?OdPJ7bRTyl/S8I+teQWI/TUoMBLtGCSwgmcmwiZQrze2/XPIzmIhvCKFtFtj?=
 =?us-ascii?Q?5d4R3q/Jzn4NHga7EcBm6nxgBWr8IrYbsVpU0KMMqK+DUwKzGyinhCXJE8Uv?=
 =?us-ascii?Q?jF+Dkn0qzTd5vK5uoLXh55e88avdNg+Q2ChEsV0HBRiTwJe4bbtyf2vWP9Ee?=
 =?us-ascii?Q?lYGbLjag2jn1s8DsYM+sCu7TzL2q6mPyWM210u/fBDZ2CyVH4PpBsNNEcYEx?=
 =?us-ascii?Q?NGGK3TwEyukr+lQPgWlSBaOD8YNHHUqLDyJBD0NnPmsVfoDTfOiqSAVGyVqR?=
 =?us-ascii?Q?cC6x8XG0bIpWUArp7Ooos4B9j4y+W93rcWDhKhXXBYfmjarisWlmZmgMyBSn?=
 =?us-ascii?Q?Fd4tSt6bef93JaGPalpOlp7pUcQZomZP7oTk8h8Ds85439Drw8lDDmezOUNL?=
 =?us-ascii?Q?49lVudGJkJ9dxtDY1GgxbHTKOlwPmTQBpG0wFOGX8SNvX7kMocgZl3jU9Q03?=
 =?us-ascii?Q?AsRbmvX3TCdXponuursVbnAmICQ0raGmnpmbGbpW7dix4qk83ujcTHYSxOZG?=
 =?us-ascii?Q?4fQfB+lvw6oYLUvOLxho7FdJ5uFSYJe6aiqk5lQL7P4nT2kjJxhmUb3KmflW?=
 =?us-ascii?Q?DV7A3SIMvYYkjsHblrODuPlgmU3ECo6/yGNii4IQZ7i9/oZVxcUCqcBlIlAQ?=
 =?us-ascii?Q?43+5ugYr6dB80keUFJlDpvNDkdHso3o+wpKZvCfSRS7ks1HykaCgtLj6/AUt?=
 =?us-ascii?Q?WyCVUcJJQkd0R+/24XRpJ8WifKx94s2s?=
X-OriginatorOrg: zenithal.me
X-MS-Exchange-CrossTenant-Network-Message-Id: c1e81779-83aa-4805-4326-08da0bd41ef8
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2022 07:18:10.9885 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 436d481c-43b1-4418-8d7f-84c1e4887cf0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xVpy0r81jHbyVfuaP2Wzcgl4gwlGoKOi2u7ijfZBZlAwoCtBJgC2SW03GoNro/yL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAP286MB0859
Received-SPF: pass client-ip=40.107.113.118; envelope-from=i@zenithal.me;
 helo=JPN01-OS0-obe.outbound.protection.outlook.com
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org, contact@canokeys.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 04, 2022 at 11:51:19AM +0100, Gerd Hoffmann wrote:
> On Sat, Feb 12, 2022 at 09:29:47PM +0800, Hongren (Zenithal) Zheng wrote:
> > Hi,
> > 
> > Is there any further feedback on this patch set.
> 
> Sorry for the looong delay, I'm rather busy with edk2.

Fully understandable. There is also delay on my side, sorry for that
too.

> 
> Tried to queue up this, noticed it breaks the build in case the
> canokey library is not installed.

Yes, this is my fault. I forgot to put `softmmu_ss.add(canokey)`
inside a `if canokey.found()` conditional check.

I've fixed it with 
https://gitlab.com/ZenithalHourlyRate/qemu/-/commit/5d8604c70abefc8146dbb4f7836f3215bc9df966
which will be contained in v5.

> 
> I'd suggest to run the patch series through the qemu gitlab CI
> before sending out v5.

I have gone through qemu gitlab CI and the result is in
https://gitlab.com/ZenithalHourlyRate/qemu/-/pipelines/497317417
Except check-dco and check-patch (I only generate Signed-off-by line
when `git format-patch`), other failed checks are "allowed to fail" and
I've checked the log, these failures are about Debian RISC-V packages
instead of qemu itself.

Is this appropriate for sending out v5?

By the way, we are planning to separate libcanokey-qemu.so
from canokey-core to a dedicated repo at
https://github.com/canokeys/canokey-qemu
(not done yet), which would result in changes in documentation.
I will contain these changes in v5 once we are done.

> 
> take care,
>   Gerd
> 

Regards,

Hongren

