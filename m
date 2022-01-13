Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D0048DD99
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 19:21:49 +0100 (CET)
Received: from localhost ([::1]:41954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n84jM-0003Gb-LQ
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 13:21:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1n84aT-0001rf-9c
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 13:12:38 -0500
Received: from [2a01:111:f403:7010::730] (port=41879
 helo=JPN01-TYC-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1n84aR-0001yL-Rc
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 13:12:37 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fd3Katjp2G+gKOxGTPqU1/xIAj/7BXIn52FpigPLiIs3pFGEKQOvMOjwurqYaYE5WZxlZPnq847Cwk6ti3UDE3UIG8fCuHdHJ3hp9cja3D5z5hkV5LdG9HtpAxGQmSz5rGyhoUlDwyEkJsPnK8WWByrorBteyjZ+dpHgTCOXW8EFyeAxMEccIcpUE3VFk2/PNeBaXkoIWXZ/fw2gXaoGje0hIMwPeWiuluFVTZpuWhdnl62Xdk36VvReYTFjPYU3InRxBtzcFBcl2tTnWf8D6z6fSAa80ixkKfujiZ7K4BApMrTkndTGmAOmv4nfl+WVvXQqZiNDTE0Bv5NGnCKXoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O8XKO/huN2cB+a81Use87V9PGHZOttZ5KeIkoMImvjM=;
 b=cUn3T1FvrIw/l6JrrfRV7pSuncWmBlHlDomR00r1z8n4y/Xjlv+aWAz7guCAkGXEiUsFH9MoXXejgEWwY5cxxw8l/7lYGMddYh4fAmkfr2MqMYWp6k8A5w/4FRbrtzLPvR2TXaMn2v2qL7yQ2R8cCRd1Q3c0JKBb4Ks0Iu8Ivrz2df7iZ7uFH6tWp7vMiY6QDhbICRq49N5FKVB1jqakhAPRatRnKy/bV/jB6yn/3xPiWa+d/inkmMDXDhDkRp0sM3YmI80BoXXZYPieO7fAJd2nMYJfEYiLLnhQ40GJ8WBr6DMzm8q+rOk6dzLJLKBcx0l0x1NkmbdDO9FHOCF1bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=zenithal.me; dmarc=pass action=none header.from=zenithal.me;
 dkim=pass header.d=zenithal.me; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zenithal.me;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O8XKO/huN2cB+a81Use87V9PGHZOttZ5KeIkoMImvjM=;
 b=hIo2NVBuB4AdLehuRmlI15kCeZctDkrbIXnLJ6JjxULK6gJcoqE/Ed2FP8FIB5cMLaWcUMxiO9KjYeDyX9awwrzdVyRIZYVQpkCMXRtv0y7BM2dMXg25i0IjjIK9GZCRYTob8PLe5FaqKY24eTn+d9p46KnqLgw35UITmicAR28=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=zenithal.me;
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:c0::6) by
 OSZP286MB1166.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:13b::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.9; Thu, 13 Jan 2022 18:11:59 +0000
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5cf9:8c86:9001:90d9]) by TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5cf9:8c86:9001:90d9%8]) with mapi id 15.20.4888.011; Thu, 13 Jan 2022
 18:11:59 +0000
Date: Fri, 14 Jan 2022 02:11:56 +0800
From: "Hongren (Zenithal) Zheng" <i@zenithal.me>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 5/6] docs/system/devices/usb: Add CanoKey to USB devices
 examples
Message-ID: <YeBrbOLSDL1xJAj6@Sun>
References: <YeBqg2AmIVYkrJcD@Sun>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YeBqg2AmIVYkrJcD@Sun>
X-Operating-System: Linux Sun 5.10.81 
X-Mailer: Mutt 2.1.5 (2021-12-30)
X-ClientProxiedBy: HK2PR04CA0058.apcprd04.prod.outlook.com
 (2603:1096:202:14::26) To TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:c0::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ffaa1560-94c6-4c9f-d147-08d9d6c030cf
X-MS-TrafficTypeDiagnostic: OSZP286MB1166:EE_
X-Microsoft-Antispam-PRVS: <OSZP286MB11660374E104642D550F590CBC539@OSZP286MB1166.JPNP286.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3upRU6GJmeJFZBYjwTDdOD3+CzK6qsK8GBAfsYq6rXsbJe6qRYlDHQaryWq93P9ozgkd82ESDDPGDE1aDC8OH0j9jKAXeZZr9UksnnZ07bq3wXF4MxSTkbjdqQSoIJen9HRNAP48t4KzO2dr/OCWlR1Q7HFAIE5JNheGxVrFihi3x3unjUHayvmQDerBOAd4VKfWU2DcTJx+1lzgF42zZxVcQfGR84NoI788GT2q/XT2v+6zZQNj2nFH6ytEX21dCAKUGdMg5DL1W0/nxJr3H2sbdgqU/L5fRXR27OKPNo0fBLNPNYhVjX1jMFybz31iY3wwPqgIKxSAqFVqWk3h2fwDnaiUBPHjxnrhDr2PIOISonqxaz+vbkACdsHfgL5uBZobCfFzjqNAF4ukiTlOMNkVYRCXd2Dkera+06s0srJDOiT2356rYv4IVpAFA9AsROaG5/4bgM6gC0vpKne59wuwiPWgRCfl8xA8Sa+Z73DPwl0oDrPW1KxEWROTrVQgXbYcmVcxs+McADdsgbwjWWviL3fgpl3oAAT1vD6S6wfgGedYW44qCxEO+zfX63tmlxhIdd+ERYzgR/u3MHq8oZYBaDwkPahGkgamKUAeY+VgvNQM41yLLArgiTS4yk2CAg5ZGAluM/eDCtYLlh1DYvGFiQHxYjVG4hAMcaAqiMzCphRNXgMEf0SjNy0ycdE3y7yE+QIdhpnibKWJxDoXGA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(7916004)(396003)(346002)(39830400003)(366004)(136003)(376002)(6486002)(54906003)(8676002)(6666004)(186003)(4326008)(52116002)(4744005)(5660300002)(8936002)(6506007)(2906002)(38100700002)(66946007)(66556008)(66476007)(316002)(9686003)(6916009)(6512007)(86362001)(508600001)(33716001)(786003)(49092004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VjLauZMBVcXrupELC1uZbghK1b2NmIPTR0DLoWDYknGRyGGHBRAAimt4RttU?=
 =?us-ascii?Q?UcltLpwlgFdjcRTR78VrxUgtNjSn1TUJR+KQ0zHASSzMuqmCnbxbHsUJPWQy?=
 =?us-ascii?Q?GCnwo2ifFmt9FxuoFL+fKYKho5mozlrrNDnY5UWuWjvvdoBjPGMlyfN8AZf4?=
 =?us-ascii?Q?BabUjVcokPopybxUpftfc4kvbwQ0pavvksmAhbPHX3qvM4eZ8MnJI2nISwWG?=
 =?us-ascii?Q?ktNHY8kM7TQLpPWAtMOt0976xWOsZGKDQqKG+MIj+Jc0QmbJq6RZH/QCOBPf?=
 =?us-ascii?Q?PR0Xw1gedYn5lgGe6gOUYnlEV21HjfHhWyZwsVBLydENkWaAKLjelOev6/k3?=
 =?us-ascii?Q?vm6e0Vy12MCb/OmcHre/J0u+rkt5YNGFofENXwGTour+A2GN/nvR+zwMJ7bp?=
 =?us-ascii?Q?vIAgiD/Vg+wB6qwawWoOEwFirlpuDPcj1qou1AHebJDTbq9fR9ZM3seG6TLa?=
 =?us-ascii?Q?3PWbF2fdXMgU2XHBQnWoyD6S/tIKd/ai9XiNW59nIE1rZyCxD+MhUj7b9AVd?=
 =?us-ascii?Q?/nKfp5DhaPocOR7KDNJV+AsyfkDBegcEYr+KaaP0s4NfR+BHkFu9JI7l7RdK?=
 =?us-ascii?Q?sfsikSJpS3pwbs0+IKMApgT7S99bDi2XkZjWnQtd+wYYjlPKT7aHliBPJsSL?=
 =?us-ascii?Q?SQXf0P7Hm/SPEOijT3ujpgqiO6d+nll3g2otkW4fOgG/5LPi5/qXprWPkWwZ?=
 =?us-ascii?Q?zIkJhHRtsc2e0e7/N1rARZoC7jo81zQHSeq71x/yNRPHxFpf6lmivmTPpvs5?=
 =?us-ascii?Q?1qqTmsaUJ4wnIDRECpu5xne9gmei24aJwqsQOjdOT0jNXeEqgpyrxD/mgxkN?=
 =?us-ascii?Q?DTyuCRWJ8BMoBAXA1KCsGemsLVOPx0dnu33Esfk6jwnexqbN80YcL6DQ6rqv?=
 =?us-ascii?Q?ClrAghS9jSujxUTE+qX2KT70gCMJp3WbaxiZPXHpOPgvbJKGvcZgcrHbJO59?=
 =?us-ascii?Q?y/p25/kZBGGYa5vVmG0Eu8a0jc4OyrHAeSeyi7PDIH9BqEX1Ar27+9UTQmFz?=
 =?us-ascii?Q?UlZ6DdRQEP6BhWDDtxoCHxMacf5azFjpl14bn7/pSubQKbxYcs+8uMee4nwe?=
 =?us-ascii?Q?+V1tvx83SVT/PbuDAU9cLC0mAe41DUFttNMkIklzt/M2sFKqeqr6DIQrljoL?=
 =?us-ascii?Q?hXw2uWjdEDiyLzMQBhvGyRmTrpLPt9YqedB5anugv5XRBuUCfcI4vw64xOej?=
 =?us-ascii?Q?7Sc/khvQsbIYj7bW+uZ7nf6wbKstDV0kcE+l4hlfQoDbf945SztvovaVKbvE?=
 =?us-ascii?Q?7dmEi58dbsJCFQiqGfoBzXREgLfMCSXqgNId/1ibT4nLM8jH12+hi8P8hEYd?=
 =?us-ascii?Q?O/uaWLzbrjPGTHeAu2yUev3D4pwmidr4e4CaEYrd6jAJWMR/BttDio/0WFP1?=
 =?us-ascii?Q?KqvEIb6fYUm0y1sxJ457f/dPrj6I/m8kRm4m0eVlkcMelW+Xu9adPVFYJCpS?=
 =?us-ascii?Q?txRBmh2cEcP7VA0BEdlRxSlMLfnOPvMKXadgWz24qPRu+8tJjVTzGNeslq/h?=
 =?us-ascii?Q?oa5lDm+Q/mhh6w4iUwDKIszjVSmfvBVsnf1byot6257285DGhHqnb4s7r3Kg?=
 =?us-ascii?Q?5SDrI3hcdq46+yaJRx0L8hYX1w4/moTcGU3ytyCF?=
X-OriginatorOrg: zenithal.me
X-MS-Exchange-CrossTenant-Network-Message-Id: ffaa1560-94c6-4c9f-d147-08d9d6c030cf
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2022 18:11:59.1720 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 436d481c-43b1-4418-8d7f-84c1e4887cf0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 47umCNBpOSnd5+Ra7HidOQhI2J1eS/mT9H2HohxJIH/f9f9N3rSXEr8lbffz/xS7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZP286MB1166
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f403:7010::730
 (failed)
Received-SPF: pass client-ip=2a01:111:f403:7010::730;
 envelope-from=i@zenithal.me;
 helo=JPN01-TYC-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Signed-off-by: Hongren (Zenithal) Zheng <i@zenithal.me>
---
 docs/system/devices/usb.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/docs/system/devices/usb.rst b/docs/system/devices/usb.rst
index afb7d6c226..341694403a 100644
--- a/docs/system/devices/usb.rst
+++ b/docs/system/devices/usb.rst
@@ -199,6 +199,9 @@ option or the ``device_add`` monitor command. Available devices are:
 ``u2f-{emulated,passthru}``
    Universal Second Factor device
 
+``canokey``
+   An Open-source Secure Key implementing FIDO2, OpenPGP, PIV and more.
+
 Physical port addressing
 ^^^^^^^^^^^^^^^^^^^^^^^^
 
-- 
2.34.1


