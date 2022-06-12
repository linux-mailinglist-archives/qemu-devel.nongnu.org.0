Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15859547B6B
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Jun 2022 20:11:52 +0200 (CEST)
Received: from localhost ([::1]:43528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0S3y-000430-JH
	for lists+qemu-devel@lfdr.de; Sun, 12 Jun 2022 14:11:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1o0S2K-0003MW-LE
 for qemu-devel@nongnu.org; Sun, 12 Jun 2022 14:10:08 -0400
Received: from mail-tycjpn01on2070b.outbound.protection.outlook.com
 ([2a01:111:f403:7010::70b]:34126
 helo=JPN01-TYC-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1o0S2H-0005ED-MC
 for qemu-devel@nongnu.org; Sun, 12 Jun 2022 14:10:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=df870xmhTbxoUW5S17e5xEkUgy70dbiF+U8ajkAUS8caT4yYI8KpcfJkehRxm30Eal1Wq8QAXXdTL1wkq0m8O95DIJ0JpDfC2HmA1822ps1cUeeWRqLPZuS+MMONC3GCUcQJ6b/OzfAU9k+xAgx10Oc/Op2gT8MBgtguKhuhsUAUn5EPZWdNkZxzJ9hlxeTZrFWndl/zMuFY7ne8Bh6wnt2SHOydl1hLDG+9QaChHXlB4d2fS3TOv8i9qskUWKKRmOfZ8vEZgZchZUP+4pkE9epWW8+Bdi23qqDOuoQ4Y0FtDfBJaDfehgFNv0uFKxFtAU0iVYwfOmM53DtUuxrVmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UyGLMs+eTl4NzydcFIYHZV23gkIwPw9mYRMkjcr+N9M=;
 b=IKoyxIkbENURdKupml/UbWdmvx+5ZQDXtGsgN08HoMcVj0V/XMzSVBXKFYRMgy/047Gjn34gDC5jgdbizDmzBfp5tmTbU4IiRdv2Asop5+vZXS4CiqNSkk+jRExRMvhMJt0bub/fzE9TlZNnEC9AKuzJwBI9Bsr9E3r1B4DTDuANGw3An1rO+Yxh8Nfjez4LjK04kqccBsizf8vPLvHxOb4Ail5q1pXtysr+UI/ZSe8Qco+szxPMyvTc1bJ0HGc5D/C/AqQ/99My+VmnkoeJzOzug+AGzT0oRwsT2YVPN3R8YqCRga2eK97jQ9jGo/oI4bxWd/NX7RGuS64n34rypQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=zenithal.me; dmarc=pass action=none header.from=zenithal.me;
 dkim=pass header.d=zenithal.me; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zenithal.me;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UyGLMs+eTl4NzydcFIYHZV23gkIwPw9mYRMkjcr+N9M=;
 b=cwzNJQIUmsSh4rCd97N9wufZSwqGYjioZeWsDWGLmGxZKGHqc7ffklduE1ZF91nsdYk93pEGX5+hN3+/SAKuihar73kOLS2+RAMjEOZ4s+0h3bdcnDUGJzYuc0Gb4zXnyLWCSTFWJOvjbxpTzI0Z9G+U/bA9BYSe15ZumL/EemU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=zenithal.me;
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:c0::6) by
 TYBP286MB0320.JPNP286.PROD.OUTLOOK.COM (2603:1096:404:801c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Sun, 12 Jun
 2022 18:09:27 +0000
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::a162:2f17:bb41:c95]) by TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::a162:2f17:bb41:c95%9]) with mapi id 15.20.5332.020; Sun, 12 Jun 2022
 18:09:27 +0000
Date: Mon, 13 Jun 2022 02:09:19 +0800
From: "Hongren (Zenithal) Zheng" <i@zenithal.me>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, contact@canokeys.org,
 MkfsSion <myychina28759@gmail.com>
Subject: [PATCH 1/3] hw/usb/canokey: Fix CCID ZLP
Message-ID: <YqYrz54XJKlu6ldd@Sun>
References: <YqYrIpNQHCBaOca5@Sun>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YqYrIpNQHCBaOca5@Sun>
X-Operating-System: Linux Sun 5.15.26 
X-Mailer: Mutt 2.2.1 (2022-02-19)
X-ClientProxiedBy: BYAPR08CA0043.namprd08.prod.outlook.com
 (2603:10b6:a03:117::20) To TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:c0::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a05b8a1-be21-409c-173a-08da4c9eb03b
X-MS-TrafficTypeDiagnostic: TYBP286MB0320:EE_
X-Microsoft-Antispam-PRVS: <TYBP286MB0320F03C84904035940F981FBCA89@TYBP286MB0320.JPNP286.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X6Prw5XFX2FFQy8N6pbhiW/uwBuOcr997WudcipikZi+dnZNOgRqNZGOVce+RTt8EECsPzFKBPssoB54eBYtePYR8ib5Ln+UyCGObwZ15+1aLucg5fbJfw8M59ve6TlTOGjSSIq2SGx07JEoPczDxvWycvRJBjCoyZCutekN0Ft/OK3zfR5sa5CYgl+b0FpDYLYtouVoxuur1ETc2swCIHHA03xpn9q3C8Fmb7+DuZN93AhPKr8aKpj4hA2MhbyGn7L+FexZrLUEErxxp638oZR7IEDWcFyCmsCf/iC1heDm+QrMxc7cuybRrbU2uiuWxYVGbPXtlhFG0GhVGqbphouNjMVusNx9FU6f3dQvHBusFRU5gpYmc8zc13MKOzEj+nrlK1I4XfvoYCETBDE7rpy1TtDmwi+ZWUVx8AOm9YM3K7AxL2T59cOPxem0uljzbkiRbS+qPiSP/KULWGHYCqemTYJkHsGblieUC+YpOnV64vmb3x79nNPTvM2OFYq0/baxwbj3hp7R14+6cZMGE85hYYyiuNZlatFuHo7HQ9oDjdR1KDKU1VDbZSDXRB53hQfDQ+Iu8wg9trpM1HbCUvcyWC46pu8HjQLSvXw4G5EIhqB90wBoHPXhzcOh5tlDOGfiPkwuo2Zjye3rvYQDJ9VzxUbqMQFGD82fX51s8FO9LysXknGzwUyoGiIRXq2GkMr9dOnLVWPQ0fVHrYfSdCxieUZS6JqZ9EvUU21xWyM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(396003)(136003)(39830400003)(366004)(346002)(33716001)(316002)(786003)(186003)(83380400001)(41300700001)(6916009)(8936002)(508600001)(5660300002)(6486002)(4326008)(8676002)(66946007)(66556008)(66476007)(6666004)(2906002)(41320700001)(38100700002)(52116002)(6512007)(9686003)(6506007)(86362001)(3714002)(49092004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2kkWdHai80/4Y2bf7Hjfwz20TbCZqWDZW0NY3c4hShwhGqwPkAF+939qJRTC?=
 =?us-ascii?Q?9pdzC3N1PzNY7l7KtjPDDOdalfz6OpU4+Z6iJKWv6Lv832fyW5ZI0+nwJ+K9?=
 =?us-ascii?Q?2jYg7TSdnDAsu5GKFpbplzVwPdFYpcDcuU6A1CrUlgDw1/xFtGK6u5N8Viwa?=
 =?us-ascii?Q?cV/UwWzfKvJiCYuYOA6JQmRQkSJufW+6wrrhm7agvXJkACuUgJEGQA5BSNlR?=
 =?us-ascii?Q?QQGcilEtXB3FAmh5YH8upyrIT6HbGiHJoe9GiCGf3tPBQ1mqIMjhdRj/PBym?=
 =?us-ascii?Q?+52zZZFaV6zFMQJeGS/pspYLMF1TCOJMSsb9eUKgPHdMhecfRgLgl1wM/K1u?=
 =?us-ascii?Q?XSUDPx+/Sy6dK2dt4oY1PYGHt5J1t50eIC3TllG3gHjYQJlEUQcBDgrDYiEo?=
 =?us-ascii?Q?XUcnAwTz82hLg9da2AwKowMvc0xUMi1Gw2vX9Lm7098Tdf/skSvtgEh8So0F?=
 =?us-ascii?Q?dy9aV246WBdSspVSRY0LNbuM3aB7x5NdDgXe7lw2Z9B/hr1YDd6ikZE7VziH?=
 =?us-ascii?Q?sSVhDGDOnYqSYIO0IbbTTQ0g8uvuGjGag9H9O5vvshRm/3dmT7N8gwTNQOzM?=
 =?us-ascii?Q?E73CKVG3Cgi7sPyGU0vxylmF0kaKktuY7cMCavOXWVUvhLak4rh02XQz8Xmd?=
 =?us-ascii?Q?q/7WdRlwEUngeGLojy/OctxuIpvYvWx7rGU5D0sVz8VtwSL0Oflck/bJmy1k?=
 =?us-ascii?Q?AB0jM2p3gMybwUWFI81Lh4cgxKC+39vr8qdLXQdyNtmkabrX93LszrGXIXNo?=
 =?us-ascii?Q?SR2hVlek3t0y8qwPdqzmMXh711rcLjniA+3/CT46Gq6LEtvjMbvTGTITmTke?=
 =?us-ascii?Q?5WS1dLldkX8zId9yB777PalJhHgE9Vw340H95N41Xu/LNjEqzXXU4WW6DkxI?=
 =?us-ascii?Q?tY6S1+hMLbydxkIXxBLrdFWrK1cFleo94KVomaiMJBNaENexiGEQgEg5vUk6?=
 =?us-ascii?Q?4ceJfbkGJrJEb2h9od5rGO+0VphlDnnNDX9zY07Vs2CbLUTjieBveJakIJ1+?=
 =?us-ascii?Q?HWdYG7q4mahQhRAaKYCGrF92yoEAst39Q0/U6dnMWp4gVQZn0B8AAmBuFOtC?=
 =?us-ascii?Q?/rMTtqBPXQ0BHAtDpZZcFKhZU6gUa2hb+yc9aNqpSa2IAPrh693ytFrEpgfb?=
 =?us-ascii?Q?ggyjvd1tNvT64DI90AbSVgKfOyRlZ+0f0ZZZGEyDmP/+EsPxsdQlSyc4dm7z?=
 =?us-ascii?Q?wC5hl/M9V35A9no3pV/djLUafO6lKaM7tPpUqEai0Fs9qY+kypf3ds1/rb+V?=
 =?us-ascii?Q?xe+ZOrZ0c9KY2id2IgiS9LcyhZwp/tprz15cjjKtwKHr3kzpEMOAKRvwi2vV?=
 =?us-ascii?Q?6oRytAqA/OkDlmqE0PwnHsMYthdRanCumEN2k359WowLWj6g2kSzlTBwh94L?=
 =?us-ascii?Q?rvdg7/Cu3HGJsc+xG88ElM6hn+paJxhMZznlAlAIXE6cIbplRQEQH4a1UAzo?=
 =?us-ascii?Q?EUvBrCnayz+/aC48+h/wwLCdE20G1GB0U6xLN00Al2dDHrZTzK7QinUGaZtJ?=
 =?us-ascii?Q?teUqXi6CbKFYnx55TIptLq/4YcmW2w1wAqXU8KE/MjRYxjJkGLbfJenvmhmU?=
 =?us-ascii?Q?D3HWkJSWOEsgS7x/8+EYLI6SIqOQlZMf+gM0Ucgo9ViqIjliUQAX/cDUjEJ2?=
 =?us-ascii?Q?PvCwnLyn+CRspQVn70utdVJJmgj1mYrPTzlfelpXfn0+1rAXeGUa2myJq2n5?=
 =?us-ascii?Q?d9I4fkM8LYBw5DD78slMxxeX8oFcT2ELdjCu9iw/fN7KXsMJA+b04606aqF0?=
 =?us-ascii?Q?jd+GG9CDew=3D=3D?=
X-OriginatorOrg: zenithal.me
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a05b8a1-be21-409c-173a-08da4c9eb03b
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2022 18:09:27.4208 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 436d481c-43b1-4418-8d7f-84c1e4887cf0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m3Qx3YwdMcwi6Po3APiwENdYnjzur4ZA4QMfoPHbcyPe3qqeawp1DT8+7aS6N+fN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYBP286MB0320
Received-SPF: pass client-ip=2a01:111:f403:7010::70b;
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

CCID could send zero-length packet (ZLP)
if we invoke two data_in, two packets would be concated
and we could not distinguish them.

The CANOKEY_EMU_EP_CTAPHID is exported from canokey-qemu.h

Reported-by: MkfsSion <myychina28759@gmail.com>
Signed-off-by: Hongren (Zenithal) Zheng <i@zenithal.me>
---
 hw/usb/canokey.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/usb/canokey.c b/hw/usb/canokey.c
index 4a08b1cbd7..86548923eb 100644
--- a/hw/usb/canokey.c
+++ b/hw/usb/canokey.c
@@ -109,11 +109,10 @@ int canokey_emu_transmit(
      * Note: this is a quirk for CanoKey CTAPHID
      * because it calls multiple emu_transmit in one device_loop
      * but w/o data_in it would stuck in device_loop
-     * This has no side effect for CCID as it is strictly
-     * OUT then IN transfer
-     * However it has side effect for Control transfer
+     * This has side effect for CCID since CCID can send ZLP
+     * This also has side effect for Control transfer
      */
-    if (ep_in != 0) {
+    if (ep_in == CANOKEY_EMU_EP_CTAPHID) {
         canokey_emu_data_in(ep_in);
     }
     return 0;
-- 
2.35.1


