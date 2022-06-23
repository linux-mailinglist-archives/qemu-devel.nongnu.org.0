Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBEBA557FB0
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 18:23:53 +0200 (CEST)
Received: from localhost ([::1]:46952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4PcW-00031D-Py
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 12:23:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1o4Pap-0001YA-DZ
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 12:22:07 -0400
Received: from mail-os0jpn01on2097.outbound.protection.outlook.com
 ([40.107.113.97]:28281 helo=JPN01-OS0-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1o4Pan-0001FD-KH
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 12:22:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VH2xpDTe2kQMvRnzp3YtHalt32fxf16xg+AFhAnw/fLovYBUsh8v3rhyrsiOfn+tG86K0kNTCqaE5p+t11WCd1rxeOOmhxJ3oJ3kiXtWr3pBU1R3iXTNQbCfXP5fnhW2yDItLKEKpssdApFctpShPykCjxaD/tifzRpdwxVKd2cSKbYcMXKTpvfznrdDyBYg7SM8STfW4mmVQv5VdI0e+n3S0TYKg124SPCiY9a/xdYnUFTWC63WG+eHrWVwxIZUUTxk8qG9vdhv662HsQ/4yojm6u8P34y2HxbRscgBzQUKv6XaZadseXzZ2+tQ/raNlAgQDGMR6NwgOSWgEEJjaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=660hSoL862MfajG8ltD7tNJIcJXs/GkLopDA5610868=;
 b=bGjOnaSz2xVjwQzaeE3uwHH0MXV4PQ38f+whSgezwRfwD2ZyCOyH+tPPthd6Ev+emvWHDrbBvWj/dlrkFezDIOJRQIdAHjCcgPchwVq8eNEYSxMGr5kdyEGFFK3u06bwVwySKQrfCByNC9ykaArrEfvETnxW4ShCV4rV6kclkSnBYJH6WnWALtVEZJhUDgjE6SWA+pw4jOsg08RHT4YxF34uYlgBxr0XFEgZcZqy/UeMLScl0HOgJQWdEhMWi0UsJb4aGkOafJglBZRl4hJEmEbbnK41EUfY2TmbkyQOWeViJ/VSM4NXpg7eoz2X4BRBWpaBJ2MbSzi53EMuEu0vaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=zenithal.me; dmarc=pass action=none header.from=zenithal.me;
 dkim=pass header.d=zenithal.me; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zenithal.me;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=660hSoL862MfajG8ltD7tNJIcJXs/GkLopDA5610868=;
 b=aPdiA9KjUY/1DvksyXuiox508geIEwEVbWdIQpO+DMqZek48CaxgbEajQWBnqN8kCDZCqOIA5Aq9FFnR/p3R9ZtGpBjV4cn5aIK+0B2GOHx9IFaIyqOEpsYU4V0+6VQDwuslmze1AnJTZOriPY2+JtTiA0J3tDRGN6GPuDgiV4c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=zenithal.me;
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:c0::6) by
 OS3P286MB2616.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:1fb::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.15; Thu, 23 Jun 2022 16:21:59 +0000
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::a162:2f17:bb41:c95]) by TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::a162:2f17:bb41:c95%9]) with mapi id 15.20.5373.016; Thu, 23 Jun 2022
 16:21:58 +0000
Date: Fri, 24 Jun 2022 00:21:51 +0800
From: "Hongren (Zenithal) Zheng" <i@zenithal.me>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, contact@canokeys.org,
 MkfsSion <myychina28759@gmail.com>
Subject: Re: [PATCH v2 0/3] CanoKey: Fix xHCI compatibility and CCID ZLP
Message-ID: <YrSTH5Oprtn06f6q@Sun>
References: <YqcptnhfCtUn2+T6@Sun>
 <YrSD1xGYsWWk996E@Sun>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YrSD1xGYsWWk996E@Sun>
X-Operating-System: Linux Sun 5.15.26 
X-Mailer: Mutt 2.2.1 (2022-02-19)
X-ClientProxiedBy: BY5PR20CA0011.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::24) To TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:c0::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d0649991-d6e1-4339-0515-08da55347f35
X-MS-TrafficTypeDiagnostic: OS3P286MB2616:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dwrcguS/rtZ+PJXC2ji6DHgo29qnNHi5JGH9JRe3439Wgs7Z3rZ9m4XcRZlRxkOZLqU7beJBfjISUyjlSeXxzKQ2JuGe1l6sT0rn/OX9KvKz9NcYRRoG86c+eCicdVYbcU9o+YOd3d0cgKdO8U9X5cw4Im4P4zs5SSTZEfo7Lz5xrYYjcsO0spo8eK4cz1OD7/XKFXD//QypNg4V4+z+5IxokoAC1WYQKEbop8h+xsi+KQVazDM707j6IKUAl2yYdrzf2RxFgOTMx2EC6Q4WhauZydSkG6Kqhkr3vM/Q7n2gws795Fh8CblaUkMtB6rFmnIP8qV2svKdQFN16vIp2LA3nosrp/ZaW9p3poryUbFbukgnJu9qoPFcjuM2ATxixsruHUzcKE+V7WVInq/aDQIgoAHzmYBOxSoXFiBsA9qn0nAb+xvCZ6k/yYc6DFUuc5SmOK3QvA97B9uNTCyTW5U9VCwn7fbmM84/Hd91O43pTyYDe+j+/pzJvumVBmMuQAln6GJTSnoifXg7T8COJ+2Qv4VkcrXjrugXpHkeBAEEodycuSC950jP3M69J1Jit41km+TBEVT13qYtANiQ/D2FeJECjvq/OUdVH+DYkaJgjrHmwHYwWVAcGrYE0QRmEQ95a1iwNG/rV8g4ntFP8GmexG8S/ZQxyB7S8C0heE6Mu0YyVwFK5mVvdiOpryB8pO+aHh1VNDMJCMhn3HvKYVjl5WGScsHEtg5fOCmorhe26zOu1FUbMiy6nW0QVcXmMRON02gpixITXPjfBOET2/khCNa/UB3+H0Z8ot6Me7U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(136003)(346002)(39830400003)(366004)(376002)(396003)(6666004)(86362001)(33716001)(6916009)(5660300002)(786003)(478600001)(4744005)(316002)(6486002)(6506007)(186003)(8936002)(83380400001)(41320700001)(2906002)(52116002)(38100700002)(6512007)(9686003)(41300700001)(66556008)(8676002)(66476007)(66946007)(4326008)(49092004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FSum1Rn0JGyGhp7JtgaxfA6qGeMZMi5NpOLMpmRLiRZM0PWi5a/teYYDAnCq?=
 =?us-ascii?Q?1/o5Ue829BTe9pphZq7xnRRmoML2uCpq6BmzVieOM3NY4O8xFb7LoKR8AeWi?=
 =?us-ascii?Q?yYXd+W0be9d4acoKDzsSL2Y+t/PkqZeP785yw5rj+ulazr1q9/jhLzqJkKoT?=
 =?us-ascii?Q?twr5KMHvYHITbiA8YdzBW5vy+/040snPHhxESk8cko1RzIF3mSEz6JkqoA55?=
 =?us-ascii?Q?+/k6crn9fm0jVknGOJq3CJXVgYyxaHQWlLGmWBq1PscD4WB+5Vwdf7AWSQl5?=
 =?us-ascii?Q?Ni37DpIkqc4xgxebxPyR+YGIfuRSQ/AbLXE7JWGc8Y++Of6efaOxmdGLU0/Q?=
 =?us-ascii?Q?gHwE/GAEexEkNzmvSC/LogtmYt8f1TubmW34YIOCcoTh/swLaVCwKGqkNgn7?=
 =?us-ascii?Q?Rm2UM8MPsf9RGv9EOHCTa80DVWKdhnclmOmBgSvqnYDZPoJ5ka8I0czQsXOt?=
 =?us-ascii?Q?ZMKVmD9N9dpxhVSsWnlyw7J6lMI9rCtkI5DOTOhQgyrmxjeZy8HTqhKr/mT1?=
 =?us-ascii?Q?Y+KQpFzioMiTCwiV+J/c55HT2DwTJAFWmY25Gzhykj3G2ey25h6Kjb6QBm/w?=
 =?us-ascii?Q?DWk8PZ67d3uREDdwNG4eGGj+70tng7zNu9G/0ufXDkdsc9S7RzNnafxo4Dlm?=
 =?us-ascii?Q?TO8J19NkorBvulAorYg8qpMK8D61YZhpXA5EbF4brNzRzmNhY43K7bYwH+OQ?=
 =?us-ascii?Q?6dITTj0HwtHpSmF1lfWchnVBw1VBPelQ/fF3kXf+YhepPJXr2mHSh5y0OLhc?=
 =?us-ascii?Q?/Fo4TElXDhFN5h+iLR5/A5i3rkT50IhPdzaJ7Os6bB7f38HoQN1sygxqR7BF?=
 =?us-ascii?Q?COHcREChOXm8JUd9RNUYV0W36JiQrk1bprFQZ95/rdQuNS6tBvt23h2zFC2/?=
 =?us-ascii?Q?EghH8uul7weJBVtc4q6g7IaazDHa0qDkdp4qTmX6yaiXPyanmnXim73s1vve?=
 =?us-ascii?Q?IVj6OixA1zDsd3DMKSwIydJOn4MfK8Dy85GlOGHON9l+WuoQRDR4DjtEvweJ?=
 =?us-ascii?Q?el0TfYGXD42uGz4rzTXL8sD4VYkJv1l3OiHnIdoloNL8lf23mOvJF1E3PyG6?=
 =?us-ascii?Q?SF7iB9eVJmVqvgtgCS+5rnmj2pCq/wiJ2eXV4TbP3VhsvLM6ijOtB0Eh+XSh?=
 =?us-ascii?Q?ZQNojFoPArOMDRvM/XLnrQ6ijZCPXAyl2ySsGloDQSrsoz9KyJeIaqUwEGU1?=
 =?us-ascii?Q?rCjLx7EdBT6AjZhXYKd4w/3QMloUJ+PFa+sj268/mE2CkC3d3XoS1INd/enU?=
 =?us-ascii?Q?NvdUTwfDToudeF6EFAYG+Uo5RHDD6RntERFA3qX74MEmHk3U9fsbjcn95FZk?=
 =?us-ascii?Q?NEWR/VV1tkTnOjx2J6Wd12Hxlx9hWUsFiXzb5GI3Zi1BTcqfnwBjTUaIy/A2?=
 =?us-ascii?Q?MCv3F0C2LcqjIClnuDqwY9nV/4fv6ZEpxdq0q0LL6G5dsMA6kMFDwfPabZac?=
 =?us-ascii?Q?tFfiq2J+ksDreuvoehf2twjCeOmIMr7CjBgarP6WP2+znBcyzD02/jBUyiYC?=
 =?us-ascii?Q?nRwP5cT4xC4kUa4HDe2Plvlion5GFVU8A9BvkI+94uU3dUSYgXO2/IiXF4fQ?=
 =?us-ascii?Q?vKQrZ1Cm8UWZ43KLHb9KbCpMAHGJfTsZZjKYnCRngmgpYHdic/ga9Ooa+7gI?=
 =?us-ascii?Q?3CpTlOMjB0oaTN8g3piy/5kSTk33phWrnhnXVMQHq6bqPQXZvfuZBMpd97R3?=
 =?us-ascii?Q?wAYYOgkO2NwYxLSRIpfh4s1bPzGV/+cN2po7vES9oXWKMqSvogQdz1Yo6mdG?=
 =?us-ascii?Q?tC10gJ9StA=3D=3D?=
X-OriginatorOrg: zenithal.me
X-MS-Exchange-CrossTenant-Network-Message-Id: d0649991-d6e1-4339-0515-08da55347f35
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 16:21:58.8294 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 436d481c-43b1-4418-8d7f-84c1e4887cf0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3BouEOJNDr4KIDaQZ17ULWXdP4OMAUcuwUFlsq5rF49uFfJp0uaalrMe9lrcnQol
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3P286MB2616
Received-SPF: pass client-ip=40.107.113.97; envelope-from=i@zenithal.me;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 23, 2022 at 11:16:39PM +0800, Hongren (Zenithal) Zheng wrote:
> BTW, as the commit "add myself as CanoKey maintainer" has been
> merged, how should I submit patches on CanoKey to you and QEMU?

Also I want to add CanoKey in ChangeLog/7.1 in QEMU wiki.
But the account for wiki should be created by some other
people with existing accounts. I wonder if you or anyone
on the list could kindly do me a favor? Thanks!

My preferred username is Zenithal.

