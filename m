Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A773B548523
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 14:34:00 +0200 (CEST)
Received: from localhost ([::1]:34242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0jGZ-00065s-NV
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 08:33:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1o0iwF-0000oe-45
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 08:12:59 -0400
Received: from mail-tycjpn01on20710.outbound.protection.outlook.com
 ([2a01:111:f403:7010::710]:5894
 helo=JPN01-TYC-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1o0iwB-0007qz-Nw
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 08:12:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZKn0lc7TwTnQZos7mOdMRnLpBN7kozRcKobDwkZYYInkpIowJzbYcUhA2voU7ON0PbVsitmCoQ0R6wMsqUsfjlD4HMH61Jy+RvXmGxh1UpWFngYTIrqdlIxMjsw47103MvjkYtILvIeAwib2rMrh/kXEpcBPe3s0eFdvqgJMviZS2GWyjtNEfavgdkf/3hBCOBkepZX0W/3KfaQumrg+rbG9iguVr01APYAVQ5EfyU53kJtZLPCaNdRIMbJngsQrbTWwKWiGBmhZTNx34a69ccxDYYDP0SerMZZUHTVt0daiq/II0xPf60BhyDiffcR3SPIZ0XarDVuPbez4M6+Fkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QpS34G2UyvH3OeqMD3orFwhljqRD7RYYhxGnBphd2jA=;
 b=SttDHc2ndoLyN4EpUlNTlZT0/JhLhtmxVY3PjSsj0wNXbvLekVPzHjDbb6dh7Ao7WqIODn1kz3SDKyA4k7ZMLY0exp6c2m9AsTfQRmRlQojHW6sDM8haLEolcRWEYuPiVW64JiS7MCQW9ZqbKYWex1GAdMuVOqInDSWYcOsLopQW2mbfZDEkwjKRFiOs6XrulJGrBHUJPzXRbleMIaQv7hfqk130508GdrJsBcZGXMOSju/PeiV9T9Em+MrhTtNx02MP0b+i7aE6X4RGupK+W7SjpiJSJ8SgN1R9OHV8LofGhcXILYEZEhlW8QYPbw7i6jZoRTWlRNJgrZZ8SgPj3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=zenithal.me; dmarc=pass action=none header.from=zenithal.me;
 dkim=pass header.d=zenithal.me; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zenithal.me;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QpS34G2UyvH3OeqMD3orFwhljqRD7RYYhxGnBphd2jA=;
 b=Lgj9AzFwsyJ3J/vO3QweM0SMJXdFxhXAZzz1F5XRdvYXLjqvZEvxiFW9AunDd2KaPse2HSMugnqH5C6r21Iu62Zes071oXKmbcEKGxMOX7aaSYFzqFQzu0hW7ZgErjavQNOVAUyqmSiQmxdVMrmz/q0FbBNBZV0gIyqkHyP+gR8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=zenithal.me;
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:c0::6) by
 OS3P286MB0549.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:d1::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5332.12; Mon, 13 Jun 2022 12:12:46 +0000
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::a162:2f17:bb41:c95]) by TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::a162:2f17:bb41:c95%9]) with mapi id 15.20.5332.020; Mon, 13 Jun 2022
 12:12:45 +0000
Date: Mon, 13 Jun 2022 20:12:38 +0800
From: "Hongren (Zenithal) Zheng" <i@zenithal.me>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, contact@canokeys.org,
 MkfsSion <myychina28759@gmail.com>
Subject: [PATCH v2 0/3] CanoKey: Fix xHCI compatibility and CCID ZLP
Message-ID: <YqcptnhfCtUn2+T6@Sun>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Operating-System: Linux Sun 5.15.26
X-Mailer: Mutt 2.2.1 (2022-02-19)
X-ClientProxiedBy: SJ0PR03CA0190.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::15) To TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:c0::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 690a31d3-4a41-4d9d-30b3-08da4d360655
X-MS-TrafficTypeDiagnostic: OS3P286MB0549:EE_
X-Microsoft-Antispam-PRVS: <OS3P286MB054997107F6136A0A8D15DA8BCAB9@OS3P286MB0549.JPNP286.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J8OxqbTk8IErytYqxVXZ5QmHgHDxvLfyOwXjZCTY6NNFglwh9sO3WO6IwW19kqYAKat/Z2lInkSTc54OuVHOGEIHERjHhog7D/r7LVmzuHCEW9Wkq0AzuG2VK/38OxSH6BU4tf294p3GxM0W5KCT/ycQXDWw6iwSlusPCwtk+2BCbb0txPb0vUj7oUejkzffpKdD5oxF6xN68mKDvsiQFtD9fec1B2MZoU/E/+KQ8o1OOeShJ9vt9E4dYf0LxR033fU/p6hxsXcoY/FtbJMB73alfC8b66yqTdipcK7Z8SGHdSJ/qaMTAMJRnOY7pCN3PmtAkiwWKcRB/5xZ/y/9dAH77UV8jndsXfvuxKp2K79789uCb4+QC4ub2OuV/x+6sEBJUSOPA3nBYALNi+3x80K63Hx4fiB+R5iV0U1JvulcnSoaDQp8PlLgpJymUvfBk8jqvczHE1622PcjVFKsSYeVGdzDv88ORio8pwPHPNI93noHzaNSxUVU/+7WdNf2zHl9ZNRhJ9L6QFu2eEK2AKOWI00rw7azxTeX5dSVpksEavnh20ukT25U/Dp5kl7iHT0TOimDPxC5yVRW49FHC7KzB8PA5KzFZEJSYma4h9XKG0ZOAVgJLu5Hk5+pzQYJb9SGmVTrSDbZR9tW5PFzKlvHGn90BeFlQ5+1MRECrMwyWeilFMRplR4/+rlSWz2jE7qyI2qlMrQ9J6ll6RY2cHckLsCK6Fjny7zOPXat0Kqfi6y2g6Jea3PHGvIh+R85mZE5cQo0nfXiRt9c/gPnKOJZ/CZXOkk2ehd/j2PJ0lQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(136003)(346002)(366004)(396003)(39840400004)(508600001)(66476007)(316002)(786003)(66556008)(66946007)(8676002)(8936002)(6486002)(41300700001)(5660300002)(4326008)(86362001)(966005)(41320700001)(6916009)(2906002)(52116002)(38100700002)(6666004)(6512007)(9686003)(6506007)(83380400001)(33716001)(186003)(49092004)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?a8KlhlgmrpsPuPYRwsC3Ml5zky2gCzQNulKG/LLZJMGPRASsdd2UzeAmj1/5?=
 =?us-ascii?Q?uFt0ii9tC1tERQxJ4Fje/8SE0RXMgNf4mSh27HYu68/zP8H+Nuz5xqAex+Tb?=
 =?us-ascii?Q?ZDf/kgsB5DzHYpPu9BJN9Y5MpDkmAYVomPOtvxq1mkXekpMPR3XbDwL4CPb6?=
 =?us-ascii?Q?AzD5gAtxmd19s7WKiBbNs8IC20TgAueJTR/9sCLJtQ3bYMdMwdKFWB/1X0/O?=
 =?us-ascii?Q?MOQWawvWZU+uEsOESGhQ3pT8oxRBXxMV1LdQeqL9CXZvZrQvaumhOC9RSYbx?=
 =?us-ascii?Q?j2huhf9mus8CozzFjGheVK1n4VZJvjpcxPbb3yFIjWDuA1fzEsgQSyMYAo4Q?=
 =?us-ascii?Q?7+bl9kRhgbQlPM0FSkWvU6UpKcYB+cSESwHQgkSGz8kOpbKq3adoGSIFFmmU?=
 =?us-ascii?Q?AZyh1tRosHCclJoKuoJIsMZRJqjEzZUHmvO8qD2qB3hUsLy0CStWA0f+1E54?=
 =?us-ascii?Q?/cVNufK36K4pck/IVms/RBnbfJzeYtYZYFxlplm8IS/EuOJjrAdSXkBA93De?=
 =?us-ascii?Q?mevFR3cDFXDWvem0EzsCeeZl63cBzqQVXnd/3duR/e053EfsUZ3uJswSicLH?=
 =?us-ascii?Q?FhoVqnmBB3HjuxbNUi6mQ03x918nCmfq3SJU706Ci4PIV43BuMnMHRZGGpBk?=
 =?us-ascii?Q?DG/9cMij1mDlGp+jkQj7IySgHphqR0dowTH5UnIcv0i914DZllCiNJQFbrtE?=
 =?us-ascii?Q?xLkE8dmIOoi55eX9dkQLfqfmwgNfa+BhEFC/D+rpyiq/VKgUnrimEbMllUjD?=
 =?us-ascii?Q?Z9K//Jj6Xene69cw+iJCFlOrDLb/RtMV6iw7qjFEVyAtl1bcqhe2TDdilVkj?=
 =?us-ascii?Q?pPL22OPs08+BxCgj0nfckRBDY0JFN3O+/BM6w4Lz8qPL0p8iaBxPx32QOXth?=
 =?us-ascii?Q?ZSUn9UrTSlRtvKlYGdgIgn6oPN2DxV0ptbl3C/QGGDSiPe2E2L4E6MlJlD9T?=
 =?us-ascii?Q?ySjUbfCgRiUoinBqCKTUOv8pMvLQpRuJ7iOvxpjMsK1av1hcfDTVQ9bB5c13?=
 =?us-ascii?Q?xHGI5iZfZuXkE3F/pUQazoYewtZ3Pw6rZchSuUvNKgJdtky661JSUOE7w9zQ?=
 =?us-ascii?Q?dZ4uFV3vVzk1I9EYCohk1eqVMBwlXG58QTTmyFqRdFIKS+HPpcUwb9vvz2N7?=
 =?us-ascii?Q?92pVwe60490rC3rIZ8Inna3I6h08NWzwM7kJhpSjboSmmBRnWHMXXzuHsmIZ?=
 =?us-ascii?Q?IcuiNha+TXzo9bXzfnx10Ax8FwRh1znaxFugohyZKsw4gft5dQzUyyYy+5jZ?=
 =?us-ascii?Q?CzHPfTTFHE0Gsv0vO4Ofh/yYGHV6/Qz4t9Jf7G4F6OoeHj/nIiAseKu38Jtz?=
 =?us-ascii?Q?2p8d9Pd0s9zTA5f3hLEd1bFHxcJHSnaguSKIgyj9I7RC7G35JE0SSwl6hhWS?=
 =?us-ascii?Q?Mb8NPfO+pqzX0GqCK9zI09YguX7RKvcuN0U/Fp9uQfiyvE0hW7nlHR+e8Y9Q?=
 =?us-ascii?Q?J7LGRkqZk10J0qUzB1bNkfI72jV1KQPDbNbpBnlJbDxFTQp2aDAjHXC8OnKp?=
 =?us-ascii?Q?9w2dTYwtNffQ50xPbP4nEqOMZSenjtbt6i6FPHhYrsUkJdg7Ba0yzmdGMKTG?=
 =?us-ascii?Q?GwgC38MEc3mVNM7AkjdYqFNniJNZknGc4O/aA7VIcoKdY3o1Pj1ATzl8P3Cz?=
 =?us-ascii?Q?Z7zZINx2s3deMBBxQaAHjn+rpcHdXOd7DUn2gOApcn2CIOrZrSUAjy9VNl7u?=
 =?us-ascii?Q?10I1OYN2hCNx54+tWCv9yOX+HcuajOLu6S8pwpI/J1htVd8a9vrE8ENh3a/7?=
 =?us-ascii?Q?ny+vgmCnXw=3D=3D?=
X-OriginatorOrg: zenithal.me
X-MS-Exchange-CrossTenant-Network-Message-Id: 690a31d3-4a41-4d9d-30b3-08da4d360655
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2022 12:12:45.7571 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 436d481c-43b1-4418-8d7f-84c1e4887cf0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +O0nr9bsnJZ++WIdXZx0LrKwT5nIU1/KEdLLwKlBOJoeF4F5CQ/hIS74z09xRpZi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3P286MB0549
Received-SPF: pass client-ip=2a01:111:f403:7010::710;
 envelope-from=i@zenithal.me;
 helo=JPN01-TYC-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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

In patch v5 [1] of Introduce CanoKey QEMU I said that canokey-qemu
was incompatible with qemu-xhci.

kraxel kindly suggested[2] that it should be the problem of usb_wakeup
So I fixed it in this patch set.

Now that the v5 patch has been in the process of git PULL [3],
I think it would be better to post a new patch set instead
of sending out v6, which would make maintainer's tree back and forth.

This patch should be applied after [1].

As for the CCID ZLP issue, it is described in the comment and commit
message.

I added a commit in https://github.com/canokeys/canokey-qemu
to export the EP num in the header, so hw/usb/canokey.c in qemu
could use it for CTAPHID quirks. If you want to compile
this version when --enable-canokey, make sure to use the latest
libcanokey-qemu.so

The CI result for this PATCH is at [4]. The failure for
amd64-debian-container seems irrelevent to this patchset.

[1] https://lore.kernel.org/qemu-devel/YoY5k0PQny8WtAHi@Sun/
[2] https://lore.kernel.org/qemu-devel/20220609095659.ulgk64bx3nlqzs2k@sirius.home.kraxel.org/
[3] https://lore.kernel.org/qemu-devel/20220610092043.1874654-1-kraxel@redhat.com/
[4] https://gitlab.com/ZenithalHourlyRate/qemu/-/pipelines/561801062

---
v2: 
  * use usb_ep_get instead of recording ep_in_pointer
      as suggested by kraxel
  * CI result for v2 is at
https://gitlab.com/ZenithalHourlyRate/qemu/-/pipelines/562306905

Hongren (Zenithal) Zheng (3):
  hw/usb/canokey: Fix CCID ZLP
  hw/usb/canokey: fix compatibility of qemu-xhci
  docs/system/devices/usb/canokey: remove limitations on qemu-xhci

 docs/system/devices/canokey.rst | 10 ----------
 hw/usb/canokey.c                | 30 ++++++++++++++++++++++++++----
 2 files changed, 26 insertions(+), 14 deletions(-)

-- 
2.35.1


