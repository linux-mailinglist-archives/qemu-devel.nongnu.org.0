Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AB849DEA7
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 11:01:37 +0100 (CET)
Received: from localhost ([::1]:47482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD1ay-0000Vn-Ut
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 05:01:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1nD1Nw-0005cA-1J
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 04:48:08 -0500
Received: from [2a01:111:f403:7010::711] (port=39593
 helo=JPN01-TYC-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1nD1Nu-0001wE-CU
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 04:48:07 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S6idBWV9lEZWVa/yJaUsHoBQ+rSdZoGjS9HK+oUA1Gq3xwlkKnydYogjmn5MFzmjb2xyCDE03Bjh+DnKfV8UObLeOFaG9t5uoINb7Y+SWxFiziDJu3vGH0tkmK8re4L6tWyEV6NENlw+1Xx3ttGv7ZkeOnP6qCRnH3VjqTUfmA8dLXmIf4VlY8Tl76rHdoWgVrHYSRhyAoPQ7qhgs2ygzAzUgQyX6fgvQTrsu5uB7GRwERS5rubXwMdTm4FcWpulsq8ezRI8nxIg1OtjuHA6fu0IeahkK0PltL7sfbzjSEh0rwk7ByKwzeoCfnZuFnhPh940s0buUrdzCEMuoUvxKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YbibJKF9CRuIMOVJgsB8vTmEh9t1ort0aPe5DpUKkxk=;
 b=DnccnW+U1MLoIIEnykCoalElvbZw5fYD6tku//G2LMAxe5ek6mGouGOBniLXydNoF6j9rm39nG60ZIE5fUz/7RLkoahgPB1hRbRr2sGrYpWCylaLxbpzVodFKDRQYO+brTiVRroQFiHdlHfjM1qJDOePySB1O8zeJQYPblKisJwPBIMijGFnUQd7dMUNM64NxOjfG97ccRzjU2K3uvvB+DYPnMcLgDr9NdIfTevg4dEhjUS61RILDrIU97yh8eg9S7o2AxVU4XrKB/LFIQtYJXWulT67/O/dgSZdgKqpup9U6kzY4lf4jVxS2hjKXNKSwNbXFRlxECnZBSl3RRp/Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zenithal.me;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YbibJKF9CRuIMOVJgsB8vTmEh9t1ort0aPe5DpUKkxk=;
 b=dl6FN9U+1zs/D2wjof9PsaslJ+JhvnBTxtPUzH4MteAen6wKHC9J+FIEvV9HaxNknLXNCLR6nIQf00atU0fnQWnw7dhAMPXin9ZX6dIt/suqHsnCCymjpBuatUzQZ69Lbn1y4aJ9/2tnbKdDbYmurgn5Q443igvMIF2EC54KOl0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=zenithal.me;
Received: from TYYP286MB1406.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:de::5) by
 TYYP286MB1148.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:cf::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4930.15; Thu, 27 Jan 2022 09:48:01 +0000
Received: from TYYP286MB1406.JPNP286.PROD.OUTLOOK.COM
 ([fe80::3108:c030:a6ec:7a1b]) by TYYP286MB1406.JPNP286.PROD.OUTLOOK.COM
 ([fe80::3108:c030:a6ec:7a1b%8]) with mapi id 15.20.4930.017; Thu, 27 Jan 2022
 09:48:01 +0000
Date: Thu, 27 Jan 2022 17:47:58 +0800
From: "Hongren (Zenithal) Zheng" <i@zenithal.me>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 6/6] MAINTAINERS: add myself as CanoKey maintainer
Message-ID: <YfJqToKbPGXZqDnB@Sun>
References: <YfJozy5qjVYh24Xp@Sun>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YfJozy5qjVYh24Xp@Sun>
X-Operating-System: Linux Sun 5.10.81
X-Mailer: Mutt 2.1.5 (2021-12-30)
X-ClientProxiedBy: HK2PR04CA0080.apcprd04.prod.outlook.com
 (2603:1096:202:15::24) To TYYP286MB1406.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:de::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2d2447d4-f8d8-4dd7-fa53-08d9e17a1b4e
X-MS-TrafficTypeDiagnostic: TYYP286MB1148:EE_
X-Microsoft-Antispam-PRVS: <TYYP286MB1148F5B06D43B21B393CFA78BC219@TYYP286MB1148.JPNP286.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:214;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mf/TxYWDnyV68hjiYiXaTXIKu2MAycFy3i+cQi+wLGl5NXQp671ixK/aYdcUWc3uvW3OgBn0XzXDgFz4GY4HCTdw4hDKDWfvR4ljIqQ+IvqXiz7rKxhVlASPiQYdcYvgyFQe2sxpdSoarxN24pdrVLM9OK9jIikKse4K0lwQfkD6KhLl7OGO4LaRyWlhJ+DBWT0GiUKhEwSSRbjd2mbc6PFwm2ROj67eFMmHzOGcBuYi7DnUsaQUa0DUI4uwU2qKMPr7JZRY8zbXfyzmXog6SrCB1wiNODd0paBj1ANVL9VuSi1M+nwnszilupXAghqsvdJCM/sfnv2BY0XfqpxiA7SSHPz8lr2sEPKnw2mlG7ZETOy5EPaKnKG0Muzb+BbkFydt5GLUFi4R9rGoZ/+/v+5mRH92KCySTyd4Ai/RsWPSyYgp/OQNjExEQPFJFr4JdGPiqYdzAmPcV4Z8/BjuRV01GMfszHZGntGyFf36WPVlcFuUWkjDCYQyx5KBCkhygJlGOyWKYjuFeAJiL2e0+qO0+iqJ76YD3Go0vu1w3ptJfZO3poH9ebIs2xr6QS2mOtYXbPkj24JZqJSVtKn2FIErGcdgA75UdOjN1WubuzSqDHX+JD8OHggSgWDdu1UiJBnUuGOh0jpYWKXvWO63zFbLzxylSKI8k0hU97MFwCPQDhcmusiUMlfXutP8eHES3s2AK9EDQ/8Lc9ZPur+Ptn/mTGKEWUjkGRIuba7gKcY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYYP286MB1406.JPNP286.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(346002)(136003)(376002)(39830400003)(366004)(396003)(33716001)(54906003)(6916009)(8676002)(316002)(786003)(66556008)(66476007)(5660300002)(66946007)(8936002)(4326008)(4744005)(38100700002)(38350700002)(6486002)(26005)(186003)(86362001)(508600001)(2906002)(52116002)(6512007)(6506007)(6666004)(9686003)(49092004)(20210929001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hYhlIu2gt+QYLlflXV5ayqFtnBs/5SoYpwsHLx3J4yKRJokFGxobrKP2eJ+d?=
 =?us-ascii?Q?sHQMQYTmMlDY2gvXmM64pbHodHH4aq9BB4g8yDXyh2VeCRo8rv/IEQ85VLH2?=
 =?us-ascii?Q?OV7bBYeojztxuEbn6PzvfyoddxQCuXqCyOTqKfFax19mAETk/M5QZgHMugNk?=
 =?us-ascii?Q?tjWfoZbMWikAt25KBw2L3XWEukqp/mufrFSamBf1K2oSTlxkQid9+RewhTXd?=
 =?us-ascii?Q?rJclUkLckex3FgPwcs/u5Cpeex28TkD0WFBz+th3jBtcM2kOrciut2ggFhG7?=
 =?us-ascii?Q?XgeNaM9EfcYnMFdytc81jDM6NAocu51noNDi2G3Zz9j8xdo7Zi+Mv73RyY5c?=
 =?us-ascii?Q?PBsZmrDY+lVTfqWgLocYuuLfqtUdIXSSCjxxp3QnOB6bzTv4e46ZGyDFtzqf?=
 =?us-ascii?Q?Yhg73h7HwTLWC59rwMtaMflLHfEYvpVj7KYYDWaUPgxO0d9LlBnZzfCDWwgD?=
 =?us-ascii?Q?AHE7vYMynCVlhd70AH+dhHUGWjP94uArLq7RQ3j0X58n2zbHK/ulG6xoyDaw?=
 =?us-ascii?Q?tZ11wI5P1i0EaOQDSi5CgQrk+kyAzS6AgG8A5LJxT9PQnBj0UGQTjJeP9FVi?=
 =?us-ascii?Q?JFT4S0GI0Zkd/3RHLyF2HwnsQxTy5VSem3Ymth2SNn3HLs1X3E/UqmhUiT5N?=
 =?us-ascii?Q?n8rfvo2bEFtK9IDd18/6CaSwIH+cWPz1ztB+1Gv1NI0x/23G5VO16EdBVZUK?=
 =?us-ascii?Q?IzSwa/gt1MF0dQGzPyF5GXU0U3H8UnhWnURI7IhjXvHsu28/52vwhaqlpzVP?=
 =?us-ascii?Q?QjmmgzJelSE7W3xqvs1wXtaSM6hNGfLtC39IgnpnCD/Tlb1hdeOZSCIzI9Qr?=
 =?us-ascii?Q?l3Mw3oZJmqWqXlUSV7i2BtHKflJLWMQF3StIqiSgrdFnMZHnxCt7cRSDahEw?=
 =?us-ascii?Q?Gu3vLsHD6CFKgUd7zagroioIK5LoXAFCq3L4xY/UMCC0A62eNtcaVzhazmA0?=
 =?us-ascii?Q?nh9V0v2v/yxHoxwYR1BB1C2vyQpa026CgYOzzUjiUVa5rTr3lRv596VB9H9t?=
 =?us-ascii?Q?u6CkSyn7Yz+btDyrWyTl5/8pDztGl7Jpc8nMHCRAYlP4Q8/UeKQDFlxVhUS4?=
 =?us-ascii?Q?PMOUqLqTZVE9bd6zDlLUXyLA1gJg7ml2a29FCmxJAT1faNJMDllnvy0I3ex0?=
 =?us-ascii?Q?O1za0l4B5XxJyTEtxswhyX6xnAMxmrjZ8WUnsoa1I7n67UIwHL2TgqGd+f1D?=
 =?us-ascii?Q?E1bnvDA1Tu2rfcaCs1KgLsTUb4kbiDBikuNka5Hbb/u/rb2yVG943thGQsC4?=
 =?us-ascii?Q?WnED5hQbwOZjFQtNs7KzGAdl9tYnMxvWE+uO8eXICu/Brxou2WEplxh49EL4?=
 =?us-ascii?Q?e7M3nDi9MJoyOZ6Y540CJCGZdNSrmA30oOuj+Mmb06z1itseFUbMddzamnOK?=
 =?us-ascii?Q?g5VjDA3BvhoESF/25Ufcgz0MkmWZEFMr81rDgvgd6NTdi38MiUWovjtA1p3Y?=
 =?us-ascii?Q?RjZbIcrYWn3Ue61RizfRh6bYuirtsXUIxzQUXRq9OG05qQL1Db9Gb+ieY5VB?=
 =?us-ascii?Q?UcvVxObjyffht8Xh7CIWExcfY2CH31no0h7D+PRLcgnz6W9pp1+hbSdQrvYK?=
 =?us-ascii?Q?axjIozxlptG02FHrEL0=3D?=
X-OriginatorOrg: zenithal.me
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d2447d4-f8d8-4dd7-fa53-08d9e17a1b4e
X-MS-Exchange-CrossTenant-AuthSource: TYYP286MB1406.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 09:48:01.2243 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 436d481c-43b1-4418-8d7f-84c1e4887cf0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y1GdXBap2uf1gNWeofp+9SAf4UdjdGXboAX5KSbYXcBUlhYF1FMEOZNU1YIYwWiB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB1148
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f403:7010::711
 (failed)
Received-SPF: pass client-ip=2a01:111:f403:7010::711;
 envelope-from=i@zenithal.me;
 helo=JPN01-TYC-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 contact@canokeys.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Hongren (Zenithal) Zheng <i@zenithal.me>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e4b3a4bcdf..e46e9cdf1b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2376,6 +2376,14 @@ F: hw/intc/s390_flic*.c
 F: include/hw/s390x/s390_flic.h
 L: qemu-s390x@nongnu.org
 
+CanoKey
+M: Hongren (Zenithal) Zheng <i@zenithal.me>
+S: Maintained
+R: Canokeys.org <contact@canokeys.org>
+F: hw/usb/canokey.c
+F: hw/usb/canokey.h
+F: docs/system/devices/canokey.rst
+
 Subsystems
 ----------
 Overall Audio backends
-- 
2.34.1


