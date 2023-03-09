Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 537AE6B71B9
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 09:55:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbdxL-0006xs-RF; Mon, 13 Mar 2023 04:54:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pbdxK-0006xh-FR
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 04:54:58 -0400
Received: from mail-am6eur05on20706.outbound.protection.outlook.com
 ([2a01:111:f400:7e1b::706]
 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pbdxI-0005qS-LF
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 04:54:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WQ8wWp+PnQzvssvRr44qQ7AV/KFShKhDg4Wi9WQXZM6jsACtqiQityDlcsxEvLw1P9Nq523oVQLNbnKF/fAOZSsVBybRFFhIaWPu4gwWpw5FFoQoZcDK3tQ8keVLjOTBelYyH3cpuupwj9lx4aHCvbszzgCNm3KOiVW9cYHdOQp8Awbo9krHjvuK+HYetqz+7uAyNr8NOmmV2r5+c7MD3GNAv4vIyDxYwsg20FwuUwtUfvbf3A0yQYooS+2WIQtMF9k/MvnZ2q2YKjB3FWKn/EY0fAH9UAoizSyb70g1ZNpDDUFme4LLskdp3C7e259thJhX3rh4qtHt+vSOlk9J3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OZHRn57Hk8aHSg2InztEgw937fYItoUUlB+7TY7If6s=;
 b=DwZR5CoLi0tPlR50FuYpfqUfGLQigEPOhbcLJOB8LCAN3zO1S8IqZIk7F8IR3mR2UfJMBNUt0m1LhX1klzf2Dx7ex0aHaNjA1aKrLhAcjl8WzFLDK3kqTpbQRWM1XJywizq0erXxT2/0YvGmPtNh0nWf2+ludcOvw6ZAWGmjUl0TjJitVmhJHzmI+jRJSSJbAzf75Hv/DYq74Gr0nTtEkkVLFmiWKPrqTibuwYBaVJ2n/a2B6dXW+UsyszWHJQaDlcaxVY7e8blsHeCNC+T1SUJLgjkq7ZL4Dm8zGeXs1HeSsofEOq2iFw3QwksBiYbIQpmNWDAeQOM4mHYTfuDkdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OZHRn57Hk8aHSg2InztEgw937fYItoUUlB+7TY7If6s=;
 b=DkwR3ymckrNLUbaRfrVIiMI16W24VkVPYxvkoVfgocd6BzChmaWQx2UXEwyM7i5F5CYtjeNNTXmw1WOInj1FKTml2G09+F1HnY/Op5Z497rQUWk513GwGtHX9CanHZB0mI4RVGz9WoARyIUdxbQOmwejMkxizFzG43fySnk6d2o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by PAXP189MB1928.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:277::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 08:54:50 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::13ad:a312:15c6:91dc]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::13ad:a312:15c6:91dc%9]) with mapi id 15.20.6178.024; Mon, 13 Mar 2023
 08:54:49 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v7 6/8] igb: respect E1000_VMOLR_RSSE
Date: Thu,  9 Mar 2023 23:00:10 +0100
Message-Id: <20230309220012.25642-7-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309220012.25642-1-sriram.yagnaraman@est.tech>
References: <20230309220012.25642-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0034.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:9::31) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|PAXP189MB1928:EE_
X-MS-Office365-Filtering-Correlation-Id: 2083f56f-ebc1-435f-d1b7-08db23a09a62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e/g9XxyjSido7mA4LveEIq6r28FRkSWjmO95zBHvjkJXaTSbYBOe6yeb2XEowbQWp9IF6X+Da39KkKD11P3+tsdTr7n9LmmpW4meosRvLDlJowtL8YHwrD7bVGAPwFJMZQtrERi4KRreMXDxWuLqcuxYhJ1/Khh+Y3nR/L129OYHqqAwfCSv0FUCWjJvPkHKt1Gle/bz2LhlSuvPx/TcVIpKzPgXCqQd1PbMqrGGHaZhpBZgrJIEHtzWsyA+5sB5lBQ53PgpcBwpcbnztT9ggAVHr5ooTcRkSZCndgIcQCt2rIdnbwPxc/KirVV4QVn3PwBwn57qAQ015GMDxWDetPmar7sRAQI3Ub1L0iPoni08fKKibh3jLPPSlnGrdGqgPMAfAKhwxIhugGSg/dQFR2cjMHmKd2FOZR86UGT9VqRU7Xeww2WfHL0iiI/JchZcF7KxvqQjlBgIyKyz91R1icNuSxHEftbtTNMlE3Iyo2RKDyRzMoejZQBdWyhbwZyt4MgPNZrr+vObJSlV4PeuR+4DFlWGguHLnYd6sw0smmjqDWTph1UVfO2XqnwIFCXNBIQVuRSIe4UIyjBKl7M7U8Ilm2JNDH75Ea7sHoDVJsysARnSdWC53HOrG2OMwjRymM76BTmgStuw09MXLeHcEAWpARCksJeD9NPVTiYSgXMsyfjRWwiMa8EmI5KGU/Tx2vTvHHNUzSRe/mJaJ6Ql57i5e8t/Fr3S8do5mdW7KlI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(39830400003)(136003)(346002)(396003)(376002)(109986016)(451199018)(8936002)(2906002)(41300700001)(44832011)(66946007)(66556008)(5660300002)(66476007)(70586007)(4326008)(8676002)(4744005)(478600001)(83380400001)(54906003)(316002)(6486002)(36756003)(6506007)(6512007)(1076003)(6666004)(186003)(26005)(2616005)(38100700002)(86362001)(266003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?e6ra+17ScNejKzj+WURHXI5gouEnxTf0rSrYyojgKq80MZNMnxD2weiNSvmi?=
 =?us-ascii?Q?krwFHbI7xXCeDmc7sv7SwdKyzJt6/uEd1TuBxcMvz2a229nQb9/oesJbUuJl?=
 =?us-ascii?Q?rWJDMzSOiLK6Bk1eu+SiPLeItAYZPv3Qpl5OE9MpwZGKmlJRL8QWTh3tC2aN?=
 =?us-ascii?Q?TyRBldKKJ1iLIF2FL/Ssrn720k7tbX6DeC/E0huhqG9DbOvoj5V/M+WZIBzT?=
 =?us-ascii?Q?k3NEPiGytLog+Z2BrGo6ixDqlKlCcX15EJM/iDi8T8hEf/MAAXMvJT8RpBJJ?=
 =?us-ascii?Q?SRWZSKV/BfenDBPwqw4Rfc0NDqjVr25fuwdMRjekRs9uTpUjp/vgyrjonj5D?=
 =?us-ascii?Q?ejdDXRSLdrqX7lvbFQLVbRwkmQJlopSuKRrRnzwqWDYX1mYyVJGhCGLdWMby?=
 =?us-ascii?Q?tyj5mrnsRdNWEP+Leac51cBpruhd5EqJ6um6ipIyR9i64uoTxNLYqPpjdiQE?=
 =?us-ascii?Q?sn4NfRDcfHR1mF/8bZorArYNJNRzwh7/H7r/6slmzi9mrom9OIfnBsbbkFpn?=
 =?us-ascii?Q?tSkYSTfZkzdD0vnf3YP5i6Cxfv2WUKloISwpmGEX3QcIjHl7p12xeaTRA/C0?=
 =?us-ascii?Q?A5OuuSfnekLdIiVdLCQMr/5v9eg9Ngz5Io+L+PSrc0G0vmxudffMGs4JFZnO?=
 =?us-ascii?Q?SutxYQ8XA+1k3zEbL3CjyryAmPC5MTx/pXYi9tsMjaGrYT+/z9bSfsbdDQYN?=
 =?us-ascii?Q?7+7b+qA/itwn0qZ6uWzpqjXqQWRCwP5ZMjm47A/xH1y3QsTWxhgqLq3+1ajJ?=
 =?us-ascii?Q?Yxn5F6qdguOyE84ArAK1Hm9nbyGkTv1j1FnkHhLjN7mb3wyUc2YoVJ7lxK6b?=
 =?us-ascii?Q?j7Uxpxi5fPI4Y7P4fR/GjkULfBv56lubA5uxGi7cHgJ8QyWKPOdpQq6MWLIy?=
 =?us-ascii?Q?5vRGlyXdsLwUNATZ50eeLxd/nhrCZXyDxkFI546MfFeVISUr0mLPIOpUOBu8?=
 =?us-ascii?Q?9OSwpWxXRu3T0+GwbTCBXN2oDhibZ+L72HFiVQ2MabPk03LXuMr4Doy0dT1w?=
 =?us-ascii?Q?aVtF0esBqBll5YRk99OHAauRDZ7hnBBvCT6NtkQwHxAT+EwnSBYMyaIC4dtc?=
 =?us-ascii?Q?iY7pBZNhc7reolJUfGqHKT3fQQ8ar4j6DI/NjX3TMh9GrLppvYWBJRtVe1Rg?=
 =?us-ascii?Q?lDQcfjkF1sdFbR1W89cYLuQS+46myzSbhAsxo9BCWb4Dln9mcYsyIiZ6HtsP?=
 =?us-ascii?Q?JUE4wJ7tRapCct7DnWm48D5qGczuOqQrNh8UYx8ZUwjzC4fFkxz1i8AI26fa?=
 =?us-ascii?Q?gZVEkY9um0bmhKpYBo1Zbgk+qjMjLttTdnMZy3OxlBM+8vdnEgSko1ofEwkL?=
 =?us-ascii?Q?1X4nSYppbaNRRgvFp0xz5ACQsmrM7RbX0VmDlNSR8ljCWhV7boX7sI5QMtFa?=
 =?us-ascii?Q?LQ6KG4CobIPW6I5+4oDTSLuXVpiXPEXwbJVJ7YoAX/gjt++f1WX0AoIdToRA?=
 =?us-ascii?Q?Au5xHySU2GLpiClwArWXuqPhhD7A5CyjutTCeYpy4O3DSTPFmId0GanrnIs8?=
 =?us-ascii?Q?R6BRcgnS0glRCeccjUsHvunj8VVRr1S6s946vpQkb8vqXv1p/wvxxyruejgu?=
 =?us-ascii?Q?1PTxSwtzXqjvTA94R9U2OER+j5u2uAqkE00RgRtINewe8FjsCKzDAYz732l8?=
 =?us-ascii?Q?sg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 2083f56f-ebc1-435f-d1b7-08db23a09a62
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 08:54:49.6369 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: np1++PWOMaSkD+UN8ngwi1nb3bF2ew+Ge9lqYQcsf80zBXdMY9DLD2lSwQbh8bvFHPFqUdtseGXrnQJP+xsD/S6UozJChMvjGikgz9tKXpk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXP189MB1928
Received-SPF: pass client-ip=2a01:111:f400:7e1b::706;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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
index cb6993dd3b..f91cea20e5 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -1051,8 +1051,15 @@ static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
         if (queues) {
             igb_rss_parse_packet(core, core->rx_pkt,
                                  external_tx != NULL, rss_info);
+            /* Sec 8.26.1: PQn = VFn + VQn*8 */
             if (rss_info->queue & 1) {
-                queues <<= 8;
+                for (i = 0; i < IGB_NUM_VM_POOLS; i++) {
+                    if ((queues & BIT(i)) &&
+                        (core->mac[VMOLR0 + i] & E1000_VMOLR_RSSE)) {
+                        queues |= BIT(i + IGB_NUM_VM_POOLS);
+                        queues &= ~BIT(i);
+                    }
+                }
             }
         }
     } else {
-- 
2.34.1


