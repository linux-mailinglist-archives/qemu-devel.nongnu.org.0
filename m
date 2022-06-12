Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4325547B6F
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Jun 2022 20:15:44 +0200 (CEST)
Received: from localhost ([::1]:51316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0S7j-0000wv-Ph
	for lists+qemu-devel@lfdr.de; Sun, 12 Jun 2022 14:15:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1o0S3u-0004yC-54
 for qemu-devel@nongnu.org; Sun, 12 Jun 2022 14:11:46 -0400
Received: from mail-tycjpn01on2108.outbound.protection.outlook.com
 ([40.107.114.108]:8929 helo=JPN01-TYC-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1o0S3r-0005cH-93
 for qemu-devel@nongnu.org; Sun, 12 Jun 2022 14:11:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bSBFMR3sGWhpAiw6TYIU0nKiyLAHUxaPWUTAn/V7btHp2dXkbu6cgIwlaxlukPQ2WuuLv+VO+RnD9Aiplr/bO0O4eDOYu73L2K6X/dUgUuPVIihWoru7vuHE3giRgPuiJbW/Dsa6z5RlKV0yj787Gv4YtYkWNyvUuy2/eGuFxqQ9RCL0AhCpMcr4RNwaquJ5h0PPS3rrT6eGvHdr+LpgGhvUmEwv+gD+hX2wHPdrqKRsyYshyZUb5GZq9noQualqdGZQDJI5sckkQGTleDIL0Y9+OND+vOrzH6L1z4WEwKnjmd2PL8FSVZE2rt19Kro8WSdf7Q7CZRjts83tRQNUZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3lwiktQcmd4WD9pZBsVfxZegkbOdti5lWKg+CkkV+NY=;
 b=lU/4KF5I6ptnA0dXDKVNQlUz5BbZYusz9n/U7LALmy/t/OdJmILjNq0gs6RrMxGjj2BwH5dJowomueLBL0+cZ5sHtdKlgYekRH4xBijQVLuqvr7w9LOS93BrtZQFzIIMFMrW74do8x08h7cUW9+Yp0MVIQqQ2H20yHWgjtyWdbUAhipJBjW5byWEOlVR3JajSp/izJQdzXY9T55T5aWVcbcP1umasdtifz3owmAt0pRGKlWzaR4KMik5MMImrtuUQLZfAoAgZdbpjt/txVaE/YY4MlW6vS0VwNrm8TZ6Xrap4gBc0Dmeg9fyzlx/qQ4Hp6G0SUOwbVHg9cvvnT/JLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=zenithal.me; dmarc=pass action=none header.from=zenithal.me;
 dkim=pass header.d=zenithal.me; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zenithal.me;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3lwiktQcmd4WD9pZBsVfxZegkbOdti5lWKg+CkkV+NY=;
 b=nWsyUDdRJJTTlYQzE15hGofUz8rbwYEsupiWWoFF1mOrQGWvRx0unxTTqN9yRjsN8wnzbCBk+uV1Xq4I1TGsMsRe4YZHwdTzIq3NGTdRh9VM2qCB3nj/Ih9IjzoJWrqv936pIKZHPfLZOsVxyv2iILSP+qTEVaTZlfkahGPSer4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=zenithal.me;
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:c0::6) by
 TYBP286MB0320.JPNP286.PROD.OUTLOOK.COM (2603:1096:404:801c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Sun, 12 Jun
 2022 18:06:34 +0000
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::a162:2f17:bb41:c95]) by TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::a162:2f17:bb41:c95%9]) with mapi id 15.20.5332.020; Sun, 12 Jun 2022
 18:06:34 +0000
Date: Mon, 13 Jun 2022 02:06:26 +0800
From: "Hongren (Zenithal) Zheng" <i@zenithal.me>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, contact@canokeys.org,
 MkfsSion <myychina28759@gmail.com>
Subject: [PATCH 0/3] CanoKey: Fix xHCI compatibility and CCID ZLP
Message-ID: <YqYrIpNQHCBaOca5@Sun>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Operating-System: Linux Sun 5.15.26 
X-Mailer: Mutt 2.2.1 (2022-02-19)
X-ClientProxiedBy: BY5PR17CA0059.namprd17.prod.outlook.com
 (2603:10b6:a03:167::36) To TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:c0::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c42c2584-0c0e-42b3-8272-08da4c9e48f9
X-MS-TrafficTypeDiagnostic: TYBP286MB0320:EE_
X-Microsoft-Antispam-PRVS: <TYBP286MB03206C0D12260A2D936E5598BCA89@TYBP286MB0320.JPNP286.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gc8gz51BPlucbgfiLIi2iKtYLMrcCjJDBz0ll+/UjOZu+rLlcOf+S+5e5qI5/2vE6ukIJNzbcuwfmdVBXXtSWcoeIA3cTHBfeYcXUx+lpip1+Z5xlRcj+Oxhsxvy/q8F83qfWhlyQFxAXQZD6Xv8U0WY/ejCbM8uF22VDNVteFoUoxD+FtPZDbhTNHmnovw3TH8Bzf5bwk56GrxRDx7J0XAkGTRnX3kwVUQZWeLICV+zGJec9agSredGliVZJuRIcMxFUOP5yAAxzkaBmeuHTtDZakQFDBCTKIBnCpUAUo7ohc+KaCPV/xn1isd2Pn1uA62upG+X5Kq0Oiu1Zh/q03Z5e/lU2+ShlWWzYrQuktLKE+HbSIXpjEQiqAFdvdvTCSTwxHYVeuW0bJ2s0251z7W9tqmc/rEGeHdluiKX8Xog1OR68JyuLG7W6NyTtF7MqFUBy/3Qsd4N7qLS2EXZjF71pmcartp33wcpXstRFbEn062h5sWybvjYKU3/GCQaydDzYg548yi8N/mQ0WoA6abWkyWq8ySHTAFbJ3Rvl4ZkxrlYkTWW1rS/sN5vyxa1esugQg8NZ+CmGQ2EgFiQQI53Flz9s7J/QRFgFRAfyFSJ/N+mB8iOLYqT0nMDLk9rZzHesxCk1c1GYgFsPP3uBmm2ZKGHhFjz1gD4yvanJacME+VKuKTZNjSIEEI6Nikkqq4lkCP2XllUiT7X7aP86Ki0dLxh6kmccsvuSeJ6izk1e6YTkPmwjB6AljxNfuz+R78Aw6S06BE6ZQJ32pd3fQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(396003)(136003)(39830400003)(366004)(346002)(33716001)(316002)(786003)(186003)(83380400001)(41300700001)(6916009)(8936002)(508600001)(5660300002)(966005)(6486002)(4326008)(8676002)(66946007)(66556008)(66476007)(6666004)(2906002)(41320700001)(38100700002)(52116002)(6512007)(9686003)(6506007)(86362001)(49092004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aw2GPWE+We+q2wuxv+u7+HrLVRobIkA6oBSbbAL0pQP1tyGCRahx/1jZXR7V?=
 =?us-ascii?Q?O43Kyl47szktRQK+RNI+bCN+0AxOhiV3uQztKv+HYsPt1JZUxjMBrF/wodpq?=
 =?us-ascii?Q?oNmK/qr1AgDmkxM9NTqhIQjafJzuW1v990S06QauYFrXHIUS+GWujYX3ySaM?=
 =?us-ascii?Q?vfitcTi6AB8c5dDNcL7udP0Bh78M+x5Ilq/aqYf+5QsdQzh2JlW0b/gV1N7O?=
 =?us-ascii?Q?y0IF6wELDr65ElVpeLZsa4s5I6CMfEdCEfjfUGaz6kkFhXAw8qdlQ3nXz050?=
 =?us-ascii?Q?D8VaOH35ymG8O5u1iHF0kJJmsIbcYwYqxNxr9kxaLBAasKoZ/IhVUDfrkqQw?=
 =?us-ascii?Q?StEGD/gcNoPYL3KySfK/lpn5QqjtwiT/GNm1hcuCGmy919uvlnFYZ3Lht5cr?=
 =?us-ascii?Q?vmNl5bsK25sj0IpbPf6vcarE8LB8K/2KevnHQZpC4fxDqOo8ur8nv08yjU9u?=
 =?us-ascii?Q?wGs0cc/QvUIanHwo9R6z+2jwxJ78/0PsFS4OtO4hL8HzN6XZhqgmbVLSiZuJ?=
 =?us-ascii?Q?yarok8brOvWs65FCFAYfwTR+Fj4ZfXxSXKxIStusLoBD3z8y0nPm628pfr9q?=
 =?us-ascii?Q?ZlxqOQ01KB8HX/eG65kEkDM8o5mB89VurMzNIeRNO7t7G/fkpLlVg0E+rWhP?=
 =?us-ascii?Q?GTzCyVUjZcTMtJBdesCBpnx/Qocf80ijZaey040D6Ivz7n1kdQzPVYs0pNaL?=
 =?us-ascii?Q?e1Okx+3cTPcB9Yp4ojuYAC2M+jd3hACl9M8Z7xNmo3lP2edn8aBzGk/7fPy8?=
 =?us-ascii?Q?gCDfpQnBwLgU28vPgb2Gx90K6pv1JCZQqR/9nQsAv3IqYDTAc9KpsD4aYPcn?=
 =?us-ascii?Q?to+lujOhVk6nu39k11c0VG2gWO5ZbNFLbeWr5H9BKad9A2zJ23pwaqU1Lh6p?=
 =?us-ascii?Q?tvskqadl+UNkVjDMxsc0teNFV2Y2QYmUA5zbiZKYpVoNKSRgDZHeWTCpaIrI?=
 =?us-ascii?Q?9q2ZUXaslpBFY5jXXheSKwI7lf0kZRowe7x18D6UAIt+2vBK8KSZWxqrvH0g?=
 =?us-ascii?Q?WR8fMsiCwtVPlFZ6UMrsu+tintO47aFboFbEYM9cixJ1/1npzZgZcLmXdsa1?=
 =?us-ascii?Q?7q6jVznA0qB4aImQBjClGQQiwoT9eS7bjK6zCxRewq8PDY+jIHzBHQodn41y?=
 =?us-ascii?Q?WybjiXc4WeB0qTQzURRFThztE/yktduYBpqfmPM1SQoe9TAK8R/mjDFB5Vfn?=
 =?us-ascii?Q?dRbpZm/JDnByRdJJAy6VXk5kGCgysYEHddDxlt4rXsABxnDX4oG/0GMTu04a?=
 =?us-ascii?Q?XYEUwfEEDMGA54DB3W81QF7QczycpbQB8w0ZrCDPcMHFTy/dKj4bCjZAQBIb?=
 =?us-ascii?Q?zEqWPcH0J57Cjggf8Sw6q42FFR4L95bBhanAIaRKB65eylsxdZw8cq3G5XlU?=
 =?us-ascii?Q?glwFDb526ReYMTVuRUZowpy5wdKk8m/l9ALNKqMuF8LtIZWaupbbTvf3VHgo?=
 =?us-ascii?Q?soMOrzb8hKWkRNl//bJrSipDBkQWFWDUxTG79YXT0S6pn1wLBbWya8ajJdmz?=
 =?us-ascii?Q?4Dg2/Uxk8oaHO6UZjWLLRJxkV6XpyWzTm9gw/Knj0NnnQ40MQhTbxqFQXlLV?=
 =?us-ascii?Q?N7XyH97rDFSP0HczuQHd7XSf/LVqlnZ2XJS1EaU2gLhcVTeTwn3l19GCTC2d?=
 =?us-ascii?Q?z8E+JtD05kOIz4QjM/2suzgd2n7VVkrHO0IrJFpqvUocEqaDIxKswyBwPF/U?=
 =?us-ascii?Q?llz2qmqoSHS0nEjhVd4lCyKA1Yq/UjvOj2iT3QKujcdq2fc1WI0EDsK8yW8M?=
 =?us-ascii?Q?moNQ3xwttg=3D=3D?=
X-OriginatorOrg: zenithal.me
X-MS-Exchange-CrossTenant-Network-Message-Id: c42c2584-0c0e-42b3-8272-08da4c9e48f9
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2022 18:06:33.9983 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 436d481c-43b1-4418-8d7f-84c1e4887cf0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dYzSMNz8GjFnGu6Z44o8wDsIilgOkm9nDaY8CGS8Nx2bEXyxHDxUi+YnbJngIjKZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYBP286MB0320
Received-SPF: pass client-ip=40.107.114.108; envelope-from=i@zenithal.me;
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

Hongren (Zenithal) Zheng (3):
  hw/usb/canokey: Fix CCID ZLP
  hw/usb/canokey: fix compatibility of qemu-xhci
  docs/system/devices/usb/canokey: remove limitations on qemu-xhci

 docs/system/devices/canokey.rst | 10 ----------
 hw/usb/canokey.c                | 35 +++++++++++++++++++++++++++++----
 hw/usb/canokey.h                |  1 +
 3 files changed, 32 insertions(+), 14 deletions(-)

-- 
2.35.1


