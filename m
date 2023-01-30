Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 439FD680F08
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 14:31:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMUAh-0002Uu-8i; Mon, 30 Jan 2023 08:26:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pMU8A-0007v0-Eg
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 08:23:36 -0500
Received: from mail-he1eur04on0730.outbound.protection.outlook.com
 ([2a01:111:f400:fe0d::730]
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pMU88-0006AH-Dz
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 08:23:29 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DFaTSnS5Uz2+XykXwKXt3OjSBpFqcZR/fC6P2jO5YqYqAh7GashIAZ5/dTUbr4fWR7HQwJPvaxf+iMCzr9bUq5JUyfZdrbkIrrO8c8xauIgmoOX4hhgezu/LtFdHk+dF3yDaouOkg7od9PAZwxJTUaUeVN/lqn6TVHi/69+1Rq1eEndVT5JOe35lR4ew7aN2Oo7x6+2FQAdAjFcxg4AYEagZV3Tn+85+iqZ9Slaj4xFx0F2AWSlVZ7Ar+xW+Y3aofioteRtc7TRNBJcYsgrNjpcV8D5l8WMuqXEgP68BFO6IzTrdxSV2EScdP8HLAaatE1Zp/7kn8kUxl1PZLKZU2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L5jzUOJqHF2FoyoJikzZOErwl8q6ttexmyVn7JjDL2U=;
 b=Urfi6q+0coRRoXhkYdhBO2FaTfu0ZY5yYBIa6Jd2fIekY9K/irmXFecRklD+MAUAEJq+qea7CiKP3T4v2uaz0Bflgie5DZVB3ekgHjkdmYMOh8HpOCLCKiH+ZYW2NyNP9dfU3CP8/tsEiz4zlm9BRAhpePMS+xUwd+PmXWxC85d0oaiWSbXysqrFbW7JY1jtZqFn1dJE0K2/c85VQUlgFY8YzUkGziOpQNqktYO9Xm1ZCMtWdC+AF3cDk81SzHCdOkBduQhuhGsi8HAbdLhDquWfSfpf2s/JFhGmLORuONDqmpJ+pUDiFvKV437XIudhn/zXcVXdVxDepIddjNbOdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L5jzUOJqHF2FoyoJikzZOErwl8q6ttexmyVn7JjDL2U=;
 b=C9q/PioDJhIFIoyAqiUGT9NQUZpLryVUVLNo3OuOTDF2Gz4VpdYWlPMCmVQY3x3WjF0rvRext4JKK5WrYFouXaVS0wWYerICtHLQs9eS3EMPcBuMQMeclah5P1EdsFrMD4UWuse9tws/D2LpWDJEUzG5xsfXV74EuABsQUcZZHs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by DB8P189MB0885.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:16f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Mon, 30 Jan
 2023 13:23:12 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420%9]) with mapi id 15.20.6043.036; Mon, 30 Jan 2023
 13:23:12 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v2 6/9] igb: respect E1000_VMOLR_RSSE
Date: Mon, 30 Jan 2023 14:23:01 +0100
Message-Id: <20230130132304.2347-7-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130132304.2347-1-sriram.yagnaraman@est.tech>
References: <20230130132304.2347-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0043.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:9::7)
 To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|DB8P189MB0885:EE_
X-MS-Office365-Filtering-Correlation-Id: 98b0dce0-cee6-47e9-dc42-08db02c522b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I8DTaSnldEmyOPEpwIJQ9FsCflpUMVbfWOkl/IbHKjipUS5A7bnz2Cdw7IZHoTbI4u5ZGSIqj/daV51+Ffb4NTGQViFNgjthKIZJrob09mw0NaC8EV+NbOjlMd6eJ+0N6CWh0ffxtBEHteA7QKYxHtT/moLTOl3WnkeckJ3RAvXiRE1xgwdr7rVPVGTvehz1S+pSLlpVDR3gNQSic6K0mIF1OclQN7NNBeYo4pVwUL7qCtC1YpmPVBO85+Ri0pc7crrN/i+6TtLdPdfzv7nvMJMNKgFTnlZW7yRD/fE+VLZ0qtTX8xLWkFIjCEKEmRtsvx0NUHvp43QMa6t95c7V/4dR8uC+jnxjnBwpJlRj8ad2DcRSuriJ1BR7PWED1L07FsZg2jVMuwcIcw22asuAAv8GfgL2ojFQ3pqncGQH/piAZwSl4km1JNtPcOgRc5FUcqYmu0fRP2QBGIDwCXj9fA0pSTOziyanFMGGroUQ0Ez5uEGDH84xmt0OKVqKEy5f6fBleqlBN07XQ2mJrmoyYxWsMwAgkvh1WYMZiNSMeWBamNDvCBHSwFopQ1agQWyuNKiJugTJfwOfTeD1wFFzimvAd0dN9z8t2mOZNRv4l3MMx2Gr9t1IpOrHmI43ZjrHpBbMrd8gydQ3qCitjS1nq+Pp0+teETdx+uE4sTmSSAeQlUplhUIwlSkgGu/mfvHYCIft/NlrFuIh2Xl8siYSanPNKieyH8BaHC42zJ+2iR0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(376002)(136003)(39830400003)(396003)(109986016)(451199018)(86362001)(38100700002)(36756003)(5660300002)(8936002)(70586007)(54906003)(66946007)(66476007)(316002)(4326008)(8676002)(66556008)(2906002)(4744005)(44832011)(83380400001)(2616005)(6486002)(478600001)(41300700001)(26005)(6506007)(186003)(6512007)(1076003)(6666004)(266003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bK8sjQAzjQoPX4qnchK4MNxfXRVS59MSwVYZp3zcubNziOt0im6Kh3/2I11q?=
 =?us-ascii?Q?WFqbOE3C17TNlQ0deAGRPd5uE8bfj1WgyqmO4/W+hAGINURET1X665dKeg8h?=
 =?us-ascii?Q?KsnVb5vX8bZb+rnsytm4IBTIaWmwZMQFvx3QEWZp8Z9y0rgGNRs3JeNvYTZa?=
 =?us-ascii?Q?goLdiA/y7giZ1kwxOLXcQHtu09KZvO6xJPdAfU6l3UWN/pFjxNBukQEGUJPb?=
 =?us-ascii?Q?erCzhUM94pF4lGZhizJ/C9uBlS/0A3KVOe9wY2fJddBqZ97VqTtbmE2jeMd5?=
 =?us-ascii?Q?P9NZet5rm72t+auu7WlDb8a46s8FrwKejkiVm6fYmIz/ZASIyEbLk0L8jQ4e?=
 =?us-ascii?Q?2CTd5+WqPDScWEZ58sS+dlVicPG3ukfvhSfddZc8ZEbUbMQxAbCRiCLWkW2I?=
 =?us-ascii?Q?mVo770ARJasr6YwdRO6Jr3IfdWosdNDRZ+ew+02xv/gsdNcLK2ZEKtlAxliT?=
 =?us-ascii?Q?Sg24g5xJEJzUsb6dcrPWCo/kzVDFKsf4paEbDxl0VJ1vGvnF8L/AN2kZoveN?=
 =?us-ascii?Q?PJBwYaGwqARdURiQYQ1+7UP7JRQk4yTNY2Vpynij2GA7A8QI2JTPV6Td5o/H?=
 =?us-ascii?Q?jrlM0GTFIJgtImOxhi+j5pwYU95g/EklXvcFbjYMGHFb4nROo/wihx4ZKlkv?=
 =?us-ascii?Q?B6B7tgVLDj1Q/jWKcPCoNk38cmmDpbC7pIc7N3RSyizrSMn9TFJyhYKIj34B?=
 =?us-ascii?Q?0LxaUlJPXCLKuEyP2LYNT1bs2cm/vnt2H76ke6rxyuns2V4Tyth62/Jh3hhT?=
 =?us-ascii?Q?HyxtEF0D9AzJTpgcMwp5Jkz/SJae8KIcIVyOVfXCH4Zv1xMvdLNcnoSgnULg?=
 =?us-ascii?Q?guIaeYYgv6jSE0zJ4a2YLml8G+q0oyxG4gqMgsAj5wp2rScKekTCNATHi/RU?=
 =?us-ascii?Q?UePLbpUWGKqoa8vBNN5RwTgdFVGXgWtl330OGt1ckZ7evd/nTsm9kP6WvzkO?=
 =?us-ascii?Q?Zmc0PrWEnmVL6Rvya9FrhxV112NHLuoXQEQ0bDHUyHYAcXIWGXASFZqw2igR?=
 =?us-ascii?Q?OvnvN720KfSskLKqiBucWagvnmpBJUQLF9wxmgTukuoaeYBrXhEBjgCwa5YN?=
 =?us-ascii?Q?OKZkvZWwQSjPOqeqJGfbSILjFaLbs5kVqPryTwIvILaroPeN4fzlDznxk07F?=
 =?us-ascii?Q?t3XBtINCQ1iE68L3O0gtqYO/5jBoN5zd2mk8SkRB1M5p/O/mO/iK2WtNSokE?=
 =?us-ascii?Q?Igwr1uzxp+2mMEmf5WAb6Q72MHfUJ9g8S53EZ9ttQJszWqfXb8MTs0zMn+bp?=
 =?us-ascii?Q?3GjC29uV6BNPT+7Z6jy58KkVKzhnZGUndt4hZMMDcOXMLbq8W4nmYjotu9lJ?=
 =?us-ascii?Q?1SNutqq+/fhzVCs5x3HdgjO4ZBzo177aom9UO6CWf2FtT4K7ZjTf7N7rbfu/?=
 =?us-ascii?Q?+bL5qObcZFtVxYG2SakKKfPGzG0LjXWerTV4+VcA+33qIFBokF49WqYyria7?=
 =?us-ascii?Q?+A47akdDbT+Cy2nJxmtp46ETtG+j3X85TylqQb98NlCSFyUlrBBIgAZDElwx?=
 =?us-ascii?Q?JZjd0y6Drg3Mk15ITYSlMdYG/U1XcG5Ue2vXrGBYAvc2ZRFknIQEo0ByTb7S?=
 =?us-ascii?Q?jNTBa7BmcGMIOa/oRLg0SeRLP40/oU3huC3OKCHXWAbY4+/qqurbCgljv9IB?=
 =?us-ascii?Q?0A=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 98b0dce0-cee6-47e9-dc42-08db02c522b7
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 13:23:11.8907 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: roblgI5j+f/KFPqtMWhIbme+rHnFTnWp5rOwUcDzsP1TOmIujcBfbhiLhF8dWjlNwrEd9MH/ZDgTppMbQlV/4yCk7FGonk/Dq6lYfjgvjjg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0885
Received-SPF: pass client-ip=2a01:111:f400:fe0d::730;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

RSS for VFs is only enabled if VMOLR[n].RSSE is set.

Signed-off-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
---
 hw/net/igb_core.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index 89650fcfd4..b41b1a5d21 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -1047,8 +1047,15 @@ static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
         if (queues) {
             igb_rss_parse_packet(core, core->rx_pkt,
                                  external_tx != NULL, rss_info);
+            /* Sec 8.26.1: PQn = VFn + VQn*8 */
             if (rss_info->queue & 1) {
-                queues <<= 8;
+                for (i = 0; i < IGB_MAX_VM_POOLS; i++) {
+                    if ((queues & BIT(i)) &&
+                        (core->mac[VMOLR0 + i] & E1000_VMOLR_RSSE)) {
+                        queues |= BIT(i + IGB_MAX_VM_POOLS);
+                        queues &= ~BIT(i);
+                    }
+                }
             }
         }
     } else {
-- 
2.34.1


