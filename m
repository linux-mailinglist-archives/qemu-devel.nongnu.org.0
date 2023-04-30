Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67ABB6F290F
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Apr 2023 15:33:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pt79w-00032S-Rm; Sun, 30 Apr 2023 09:32:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1pt79s-000321-If
 for qemu-devel@nongnu.org; Sun, 30 Apr 2023 09:32:08 -0400
Received: from mail-os0jpn01on2139.outbound.protection.outlook.com
 ([40.107.113.139] helo=JPN01-OS0-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1pt79q-0000kN-CC
 for qemu-devel@nongnu.org; Sun, 30 Apr 2023 09:32:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cFXTXMf8qwRD9HP8ULV2J8nSDzRG3D12rMJLzLJn26v3IrGjc7mJ+FBEpKvOSaJc0FPwxiO/LFVf0b2uymbl7Mcsf2rYdEqvrS6QiR1csI0Q8UbhQWTuntLYs/8s9D3VmUMU47N6yg+kWFWEFwIA25WbwKUMq81YxSBkaz1LCMBunwUYXfCwleE1Q6r2pUi3gH4D8/TkEAFWKJMhiycKhfkPrpiLdQidiCBZ4F43fkNeIAWBCE9PZNAiLmzEbbAQoVthXqOMRvf2TUAQTE13buRXcpUGtKEAF4mUhLjOwfMgxc30Lr1ei6sg4hmBuACEyqzewJpa7sg3hgMHdyu8SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I4NoSxOfel8mwhhoWMba55Wx5k9tgWT/2rL+DiyQ+dE=;
 b=UobL1m/qn7mjgYLMQwrSn2DRPFRH421pus2rwia/uUv6kxHu1oFu6ZifnA8tno8c6qv4xb6MdDqZxgJonY6Aht2S9Di25ET7eP35DfyCzAP2MahT9n+FRxFi5VYoFLwGOZ8Fo3y2g56j+loxKeds5Gtw60SeaX2OUPF8vdvamSJW1FK7un9fdKRsazQRdQ7OVrgUeg77p/7ZhZD3vpkeJ6przPY8lXfRmWju9p2wzeXAuTdSUFliScKJtHI9ysjK7y8VD76I1y5nugfnSCwetnJDK9Cmnmtf8Ya5RYLA2X5vQgH8UMncU+LgD+R5RveK8N8kvOO4GwQHWxCMISl3dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=zenithal.me; dmarc=pass action=none header.from=zenithal.me;
 dkim=pass header.d=zenithal.me; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zenithal.me;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I4NoSxOfel8mwhhoWMba55Wx5k9tgWT/2rL+DiyQ+dE=;
 b=Dnz8HQXeWrjOYxHSNccN6Sbp0tGamH5a3gGdMPcRdY29mxaacADvTtyemVJVtWxl7TkwqbQ68jTqfyWFHnXUS2h/WCHDeY2AdFZ4dxt0OWoQQsNGHtMrPxFtyOR4xaRwk20D2wznTMgHmFopxN2140A+o87wuqbdtPycnaots1A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=zenithal.me;
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:c0::6) by
 OS3P286MB2247.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:19f::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6340.28; Sun, 30 Apr 2023 13:26:59 +0000
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::91e1:d460:5907:34d6]) by TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::91e1:d460:5907:34d6%3]) with mapi id 15.20.6340.028; Sun, 30 Apr 2023
 13:26:59 +0000
Date: Sun, 30 Apr 2023 21:26:50 +0800
From: "Hongren (Zenithal) Zheng" <i@zenithal.me>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 "Canokeys.org" <contact@canokeys.org>, MkfsSion <mkfssion@mkfssion.com>
Subject: Re: Apache license usage (was Re: [PULL 04/15] hw/usb: Add CanoKey
 Implementation)
Message-ID: <ZE5smpiemFJWsMaQ@Sun>
References: <20220614121610.508356-1-kraxel@redhat.com>
 <20220614121610.508356-5-kraxel@redhat.com>
 <ZEpKXncC/e6FKRe9@redhat.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZEpKXncC/e6FKRe9@redhat.com>
X-Operating-System: Linux Sun 5.15.67
X-Mailer: Mutt 2.2.7 (2022-08-07)
X-ClientProxiedBy: BYAPR06CA0061.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::38) To TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:c0::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCP286MB1393:EE_|OS3P286MB2247:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d432b57-cf26-405b-f2f4-08db497e9304
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +NdDrczD8PhKeiudpJttwOq2feYDm2dqkoWB7hwKev1uk/J3Z3d1bcU3Tqup3/MjntJCmWpRgoglZdzvNOyhMNjrP9/TELU6CyKFPdTe4z2x7eB67TCUpMhMTwmJi5sFNFSDp2vjdeK7YTafgPyqc1B7/4qSSw9jrJhP4kYcOlU0PNjOPN0nnT/E2CbniMvrkWiX4eFn0yUBwiaeY8kPQwTHTUw9IBUdl0YnHXW47yWvPWpfG8dDD8jyLJ0nOi5C9V241Jx0z8CV998GJ6KX9g0CzDrlteBR/zd9q/un18xbzGmvMtrUxuzYXAfHzQ9hq2j4r6Z4MzDMchGdMF07UhXvxDUa8HKCpVOsykadaN9UYl9JSBi7cslqyhQP5bmAcPbclpP5GcXzT17VVeG+St+fCoUDPonH+kO6x+nTdZxy3NEgPoUad3NTNgT5Vg24Ov6qcow4rNX+1p74/Yjfs8aEl+L7rVGytqhR7q4PjHKFqCeEn9ukS1YMcr+QcnKNQ7pE+HNsmoctYfKY7Q5GItSeJBLambms1LEcj1+3eG+yH/kvtDgSkowkdnxaVUCxfJ+gkkWW9jS0zmKHUq5Qf+p8bZ0SuLTCXE5QsWzfVBQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(376002)(39830400003)(396003)(366004)(136003)(346002)(451199021)(41320700001)(33716001)(786003)(316002)(4326008)(9686003)(6512007)(6506007)(186003)(41300700001)(83380400001)(478600001)(66946007)(54906003)(6916009)(6486002)(6666004)(66476007)(66556008)(966005)(38100700002)(2906002)(86362001)(8936002)(8676002)(5660300002)(49092004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?6nxaA+Q0R5AUORNj+u0FUrusREJuJi29tcOjRwgThzma2sSV63LrVmCuNf?=
 =?iso-8859-1?Q?89mg4yn278ZxRzoQZRd69Yqo+1Ci+sQFhySso65mKZNXrFQYs6/ebHQqMj?=
 =?iso-8859-1?Q?OB75nwQ9Dap5X5J3ZPHi8rF3Acmbp/hxaQu4dQI/UMbHnQaYOA6KF0Okn/?=
 =?iso-8859-1?Q?lXmSdxsWdLBBx5XqyWFPzz27Qlxh28vP0P2qjDR+k3SFX3DOqsYtTiae+A?=
 =?iso-8859-1?Q?+6dv4v1QQt1BhCm+1/GxeP67iZPRA4NRNq5XvmuPHwwZVQKxi4VEy7B+SL?=
 =?iso-8859-1?Q?sv6k+W99DSub1lDO1mzGmSVAlcOon28H6btBw6Y/mm9D/ly7qMGbsK9UMO?=
 =?iso-8859-1?Q?VGEHDSQl8vFgA5DH3zqYrkfdQVBEDTpsKNC1kIGlwDs1p3zvfozYENAcBX?=
 =?iso-8859-1?Q?VeAnQZq9EannIli1ZCXv67Zip9/PejaY4jddYnhdSxZAj2PIzqfHGNayxN?=
 =?iso-8859-1?Q?BXZTXIjZA7fJ3sthJhWzXJdtzYzuDr0X8ny0YefUlDttOFuzP6B3XBySXD?=
 =?iso-8859-1?Q?3HYAfeX/iSE6qaNI6VGtFmHPOHnlcNQCiCMe5tJrz6WAk80/ZzWli8uOFm?=
 =?iso-8859-1?Q?47IhnEa9N7r9uabfyIeEI2bg0bVB3kNDckp6/etnBed83YonFmPJM/222k?=
 =?iso-8859-1?Q?av3qhY2t2IikyFNHruEJoX1mBDGXy3Jd9/N7Pu6WoAPDL670NS0LWdE2sz?=
 =?iso-8859-1?Q?08nG73rXOa21jRkjlu783M04bR2rXvfhQAzKjBtWf8aVVs2h3h/a+Nw64f?=
 =?iso-8859-1?Q?+byMLwCiQ9IV/mbn5LvNrGqEqCF4t2SMxjiicw6CO4TmZP1v3KDy0FlJrb?=
 =?iso-8859-1?Q?qqCH2HSJjRCxNnTj6sntEOk3e+iMMf8V2gG47K3GdN8Zi3bgmpF7BrBK37?=
 =?iso-8859-1?Q?GvACdfpIoDY5upgYamdSTg9fwYOf/onWA6VjogtsPp/WDGJQzdDv79uLL5?=
 =?iso-8859-1?Q?TpWWu6tAZrnSnzzzF7NjHriQ9NaoToLLedbrVSZ8p/idOx/d+2lDJluQxJ?=
 =?iso-8859-1?Q?3YAnDVy9VnqCFVmPI1RDOx3vJHyKInyl4SkBIPWfkO9kecSRBkjkg/ellN?=
 =?iso-8859-1?Q?knUlcye9mRepk5uGJDIaMioL3BuXFDmgO9fCS5q4LBkznq42notdEE2QSg?=
 =?iso-8859-1?Q?ysnwXDo5Jl3v1UA/j/bczccGNuH+O7GkDDkK2KakDKB4VAjBjhDaSC0NGO?=
 =?iso-8859-1?Q?XoYGoD4s9+B/Aub4CIr8qOBwH2GD6g0Hsuu+44499c8Uoq9Oz6LBe15VkW?=
 =?iso-8859-1?Q?iKa/f/QoG3FkP3DsfbZZaaOPF2u03Ja4/ebooN4WY4h8vZFTihsZgcW1/i?=
 =?iso-8859-1?Q?9aqcM8oJDLNd8mrf4iyw/TLlKNi5HQ1NK4jYLqQcACp5CrNycjJG6F2OYl?=
 =?iso-8859-1?Q?ygm7iF83pNrSWUn8C8PfG5bJHziLOfAaxjjaS1gFW0f/E0m8UObnFYWd5U?=
 =?iso-8859-1?Q?aR6BqTcA+WjW7S0BQWilq0rjH942dUDoYcfV2fhUbBHRoe35vPwfTxKVsa?=
 =?iso-8859-1?Q?xPG3GioopCkFLzTdcQdJspKNkgwnpR4fJkTvvN4dwho2Sct458ZPfopo4L?=
 =?iso-8859-1?Q?lwqUFACStkmyJtRSnvrDzn4lVk+5MbCmJKOHxHAgDCtlREwKSRlUAKu/OY?=
 =?iso-8859-1?Q?KJ2s2ztzNuohNIL3xqEzZVmHdwfHr26sID?=
X-OriginatorOrg: zenithal.me
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d432b57-cf26-405b-f2f4-08db497e9304
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2023 13:26:58.8602 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 436d481c-43b1-4418-8d7f-84c1e4887cf0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6tVPLeyauUxOeAmp6zmE3A5WKRA4eSaTyH7dS6p5OF0FvbdXXztCG3QvdpI6zKOK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3P286MB2247
Received-SPF: pass client-ip=40.107.113.139; envelope-from=i@zenithal.me;
 helo=JPN01-OS0-obe.outbound.protection.outlook.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Apr 27, 2023 at 11:11:42AM +0100, Daniel P. Berrangé wrote:
> On Tue, Jun 14, 2022 at 02:15:59PM +0200, Gerd Hoffmann wrote:
> > From: "Hongren (Zenithal) Zheng" <i@zenithal.me>
> > 
> > This commit added a new emulated device called CanoKey to QEMU.
> > 
> > CanoKey implements platform independent features in canokey-core
> > https://github.com/canokeys/canokey-core, and leaves the USB implementation
> > to the platform.
> > 
> > In this commit the USB part was implemented in QEMU using QEMU's USB APIs,
> > therefore the emulated CanoKey can communicate with the guest OS using USB.
> > 
> > Signed-off-by: Hongren (Zenithal) Zheng <i@zenithal.me>
> > Message-Id: <YoY6Mgph6f6Hc/zI@Sun>
> > Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> > ---
> >  hw/usb/canokey.h |  69 +++++++++++
> >  hw/usb/canokey.c | 300 +++++++++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 369 insertions(+)
> >  create mode 100644 hw/usb/canokey.h
> >  create mode 100644 hw/usb/canokey.c
> > 
> > diff --git a/hw/usb/canokey.h b/hw/usb/canokey.h
> > new file mode 100644
> > index 000000000000..24cf30420346
> > --- /dev/null
> > +++ b/hw/usb/canokey.h
> > @@ -0,0 +1,69 @@
> > +/*
> > + * CanoKey QEMU device header.
> > + *
> > + * Copyright (c) 2021-2022 Canokeys.org <contact@canokeys.org>
> > + * Written by Hongren (Zenithal) Zheng <i@zenithal.me>
> > + *
> > + * This code is licensed under the Apache-2.0.
> > + */
> 
> > diff --git a/hw/usb/canokey.c b/hw/usb/canokey.c
> > new file mode 100644
> > index 000000000000..6cb8b7cdb089
> > --- /dev/null
> > +++ b/hw/usb/canokey.c
> > @@ -0,0 +1,300 @@
> > +/*
> > + * CanoKey QEMU device implementation.
> > + *
> > + * Copyright (c) 2021-2022 Canokeys.org <contact@canokeys.org>
> > + * Written by Hongren (Zenithal) Zheng <i@zenithal.me>
> > + *
> > + * This code is licensed under the Apache-2.0.
> > + */
> 
> In the process of auditing licensing in QEMU I found this patch
> adding code that is Apache-2.0 licensed, and as such I don't
> think we should have ever merged the patch as is.
> 
> QEMU as a combined work is GPLv2-only.
> 
> There is disagreement between the Apache foundation and FSF on this
> topic[1], but FSF considered Apache 2.0 to be incompatible with the
> GPL-v2. Fedora licensing follows the same view of Apache being GPLv2
> incompatible.
> 
> More generally I think it is a little dubious to write new devices
> while claiming a license that's different from normal QEMU code
> license. I expect there is inevitably a degree of cut+paste from
> existing QEMU code to handle the device boilerplate code which
> would be sufficient to expect a GPLv2-or-later license to apply.
> 
> The two added files in this commit are the only occurrence of
> Apache licensing in QEMU that I see.
> 
> Hongren, IIUC from the attribution above, you wrote the code but
> Canokeys.org claims copyright. Could you report whether Canokeys.org
> will agree to change the licensing on these files to QEMU's normal
> GPLv2-or-later licensing.

I have discussed it internally with canokeys.org and they agreed
to re-license it under GPLv2+

I will send a patch modifying the license.

In the meantime, canokey.c was also modified by
MkfsSion <mkfssion@mkfssion.com>

I've Cc'ed MkfsSion for their attitude on this.

> 
> With regards,
> Daniel
> 
> [1] https://www.apache.org/licenses/GPL-compatibility.html
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> 

