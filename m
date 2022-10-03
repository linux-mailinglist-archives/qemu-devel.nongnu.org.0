Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E76BE5F2E84
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 11:53:16 +0200 (CEST)
Received: from localhost ([::1]:58316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofI8Q-00008y-Eb
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 05:53:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1ofI0B-0002h3-5X
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 05:44:43 -0400
Received: from mail-vi1eur04on070c.outbound.protection.outlook.com
 ([2a01:111:f400:fe0e::70c]:38159
 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1ofHzx-00037U-SN
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 05:44:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X5cGCNgF+n/jHnGjafpC82JCBKVjjwPSZlQqggpKyjTo0GsvUXL5jGMnGfPn+FYyBxQ31AnKVRh4zTk5QBSa3lqjWIBGlVLBWXlUG/lGCf0IKMqnIvEvM5hFzdBgijqV7X6RtGfwd/AJ+ATMibi/xVx6zBQn+rtCscJwifFLDMWguaORObh+0ASH4dO60JiS9eF49Uu6WJdrALIs3PVnY195MmnkHZL0UL4vH4w9kkisk5szmKoyH6TIisO4jOOUSajBFO3+hYFHZKNuQFKebpXi+eVmF1TEpmBhoiGQolKl8eu2NBO7Qk87SHCzCY1A8ozsaNUcPTjw32JrssgIRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=leL6W1bPjBeZBabQgAlReZDQI4PoSLYkYymsdEyK/aI=;
 b=dwg297aEZWea/0F/VkCtcS5ZCYj9tE0U1NePZvZdpET+bRnFMG5nf7CUR2N8XSCDo3YXVCTzpgn2ryAuPb6z8f2ieIlDeZKsLCpBiv4Ov4CQETO4DSvYAfk/f43CTbjwWdSWqPAb4lY/AUwY6zX08VWNCjWKCuhjiLd9I/zzpNn382hmcTJK7JTHKgpaD80v2/Da8mWqn+6K9xkinr+PCs4cc9h02MV06unOH/DFmCsvcBUfGZlRBrl2tbdskn9QeysZF30d/84oiUgmqTAsMTvmWClJu7YHTx8xGOueCZ36jA/Awt6wNXLSlwknLvRqsgKOyKOLaC9XGPYq2XQcdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=leL6W1bPjBeZBabQgAlReZDQI4PoSLYkYymsdEyK/aI=;
 b=MhjmrNfDmUKP2zPqvBLV7Vf/a+aWaQ6NGNXJk1XEaO+oUbJMAT13xggEkXL7dKzqn80xVr3W4882APJpkmPH2m6GHDm3wib6Dsb5TixTIYVA/ppTlh/lBW49LCoAWeOVm9L687ED0w1Nb/UWAlH33Eo3QK9kQZ5KeyWEjjT0oJShYJR7v2zJk5ZjWY4S4hRGZqyVORNukpUGiXmsKhWZASisNVxyEpCFOu0AfgsEHYMF4ztZ2J7Nr9I43vAh92f0C8C0Y2iorklFPlp0NutRQHGZeJRRKZZQz1XglE+zx5A8Pnn1uEzQXSzjQMC6i35n6aU+mbH2ys9cYrv6VEey1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DB9PR08MB8460.eurprd08.prod.outlook.com (2603:10a6:10:3d4::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Mon, 3 Oct
 2022 09:39:25 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%8]) with mapi id 15.20.5676.028; Mon, 3 Oct 2022
 09:39:25 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com, michael.roth@amd.com, kkostiuk@redhat.com,
 marcandre.lureau@gmail.com
Subject: [PATCH v3 7/7] qga: Add HW address getting for FreeBSD
Date: Mon,  3 Oct 2022 11:39:11 +0200
Message-Id: <20221003093911.1844031-8-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221003093911.1844031-1-alexander.ivanov@virtuozzo.com>
References: <20221003093911.1844031-1-alexander.ivanov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0096.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::8) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|DB9PR08MB8460:EE_
X-MS-Office365-Filtering-Correlation-Id: b6cf0ba5-1d30-46b0-c69e-08daa5232896
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LNCm65Dsq5WyF5G2m+8ZGkP3XNLv4oXqgDQc0q2SBsAfvvoECl14BdpZ3XXoaXMADRF2zANAyGUERcvCO4ezzsuBnNFNn3yiHQjo8kEDWqRPI1GCemcFsmcl0ek/edgabqo6bdT+zUNM5qexsgUwmarletCqpGtkLeRQOp1xXEupdh+qB+A4C2JFQPi689jlKuo4RhMSa+2jU67pCyUH4i+2k01NcA4seA7H87NQ52d/c7DMNsQCMarJh1LaNiAJP5qVr+qi7V5wf9HadzMOmToE0bi46vI4Aw76K901+A1YxpQuPI2rrSxB+rrVyJdLLspTo9uFzcQis26+Hv0LlSXjX4SSIzEkRPJDF8pCruW2lokhSyU4n8OayH73UPh+P9CaBugm2m282IEfsJGiOhHi6lev2xpUIOk9+Kz5Az6jjuDGAKQ2IPQWGfrL87brsnyUtd8R2gmOq5/pXeNF6QqGM5s6y16qo8/T08ff2CSfP2t2yhhqtyfFBezkC4eo3D3sIdhhYMoNT1EN5ACZlZqVX5jxemfXXT3B7eWVT3wwV9loRh2B/nHEB1rT1WiIRlbj86DOVnjTi2/qYoa9UI0fgrwpY7ITWbliua+dVYeCgGXLBuAZgHAIHV5/lw2NcvnuUyCNLa4NKo09nlQ2IUzNC5cTk54nGCp33++GwutHgskIMZovd/95A3wz79MMJEncab0yp1lq9C//BfBawH0dGb7FYpafilPEoHitf+mdAq8U0cM6Ox2imq0Cn3fc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39850400004)(366004)(376002)(136003)(346002)(396003)(451199015)(26005)(36756003)(66946007)(52116002)(6506007)(66556008)(66476007)(6512007)(41300700001)(8676002)(4326008)(6486002)(6666004)(6916009)(316002)(86362001)(38100700002)(38350700002)(2906002)(478600001)(5660300002)(8936002)(44832011)(1076003)(2616005)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y25pUFhUVlpLMXk0NnBZZFQxcFg5Rk5JcWVPN01FeFhNeGpTYkw1bUdjUk5v?=
 =?utf-8?B?UDFUbnh2Tk9nd1BYTk4wejFvbEh0dDlJZEZ0bXdwU0J0V1kwTmhMWmJsZmFa?=
 =?utf-8?B?b3hyU053NkRMUU5pSHUyUXJwcExJVmtSZ0l5cVBuNUMySjJjL3NOSjFuanBM?=
 =?utf-8?B?OWdjNkZnL1R0bDkrU2xEVWRYYVBxaWVLT1BnVlNDL1I5bWQwdG94YnlZNFFP?=
 =?utf-8?B?aENCSXdxYVUvbDh4VFhUUXA0bXNNcVdlK2IwT1lxMW5ycXJwaDFqY1RuZlRP?=
 =?utf-8?B?VjFpZFFtZ0pIZi90NkVpZlVDb1pzdy9VenVhV0l3TytuWVVYUlBUSm5ya3lu?=
 =?utf-8?B?VERZdGwxMnJlbWhzakUxWUhLOGorN0o2M3BzV0lwRTlWMU1qdElTNmdNZ1J3?=
 =?utf-8?B?RVl0RkdZSC8xajdWbHBJQUxHZ0FtSks4eXIzNGtkeWg4TnNIRUorMDFKbnVv?=
 =?utf-8?B?NnlrcXI4dkR3SDVVMVp3YW1wbXQyVGtLY0tiMTJzZjRzVnY5WE5kYjhLd3hz?=
 =?utf-8?B?NU9xd0p6eGNUUC9KRWZ5ZHI4bU80Yno3c3RPMlJPVnhOeUtoNWZaRDVlT0dU?=
 =?utf-8?B?Zy9MN3NrWlBReFE2WGpHU3lJRC84YjhOUTVsS1dqWDM5YjhKUmdXd1I0Y0Nr?=
 =?utf-8?B?anI0eE45NUxkYU1rdWxIdnhaaWJIcVo0ZE1DYmpoTS9LajVIZnRIWDFOSlZr?=
 =?utf-8?B?N0tITm5jd051OXUxUWRERUhLNFRWOThQbXZXTVJDa29tV2tGOHo2b2d1cUFp?=
 =?utf-8?B?VDVXUXdKMEk4MXQ2aDBRUUptcHBpdyt2emQxVC9ZTXErUmJ2eFVOamtuWGg0?=
 =?utf-8?B?T08zY0FHdGh1WHZyc0pOUmdvRWE2OGRyRFJuUW9WUCtLd3QydDBTWHB6OU80?=
 =?utf-8?B?MnJwbm9RQnhZMEFOS1lzTWpsSDZsbk1Hbnc3Z1pRcnRTOE85TVl6VmxkeUxX?=
 =?utf-8?B?RjNHRFdoTHhPQnNxSWdsU3BXUWYweGNpVWVwTG9nTlVyZVMzQlYxTWE0Q3Yz?=
 =?utf-8?B?WHhSOGJDdVpCbGRMR052WG9scitVeEx2TkFBZnpiTzA1VXVsaU9WMEVuZjd2?=
 =?utf-8?B?U1pUOGZpaGtMS2hBY2dUVCt5SW1lbVcrYm5IZDN1Sy9wMCtTY1JQa3RKOVZi?=
 =?utf-8?B?MVR1TEE3aVhVMngxY2NEZmlSQ3FwNWVOMFpFSWFCRUl5Q2pZZEFYK2pqYS9L?=
 =?utf-8?B?bVF4Y1Y2MlVNSWU3NWRjMGlZc0piZmJEempqMHVNMVZwTWhrcjZhQUl2ckJM?=
 =?utf-8?B?YkVETVBIUFNuZGhPSmhqUzFVMzhYSU1vWXN3TzgraFdscnQwTHg5eDFPUTBz?=
 =?utf-8?B?cCt3dU52a3lHajNQNXNJTFlXWmFjaUJlampnUXZDNEV1cHBoVmhIN3ZtNmF2?=
 =?utf-8?B?QU80d25zV3N5SEFxd3JldEdiRG5PRkR4bTRVNm10QlhnYUFzVng4cFR2SGlu?=
 =?utf-8?B?NTNkMG40SitNK2w2d1BZRExFMi9VWWZnMHUwdzE0aGh4aERxVDAyNlBUL3Zz?=
 =?utf-8?B?MEFPU3RqWGNFY25ZWTh2NjFXTlBuVWVMdWZjVldKdGxLRHE4MC9DZmM0OTlH?=
 =?utf-8?B?ZkRqYUg1RzQ0Q1NaOGJjT3BrU2xuUkxZY2tEazRleVZEV2FPMldkSTUyUVhs?=
 =?utf-8?B?Q3ZlRnByWW5RbUZrR0pIWlJDVjZUQ3crSUV6YVJIYnNuYW9RLzNPWWhhVjZ5?=
 =?utf-8?B?K0xueFprRnl4amQvRGtzK1B4YUtKQ0JvWXUyak56cThsSE5QdFQzR3lIMFRL?=
 =?utf-8?B?QlB5UmVTYWV0K3c3QWJzTHVxblAyb0ZxbjNQdGorOFhVQ21zZnZSQnBNeVFZ?=
 =?utf-8?B?anB3d3IxY1ZUV3hMV2NLMTFiY05VY1g1Y2lQWHJ3dFprc2pqRUViNXJuU2pm?=
 =?utf-8?B?UFZ2REVITXF3NUZtcjhTNFpFWncxUGFQRzdsQXdzZkpIaXhQRlBnZnZWcTBJ?=
 =?utf-8?B?Wm82aHNCencwV2UvdTJiZ1ZQRkFxVEdJZUdoMUp4NFh4bC9WNDdtL0d4OFZz?=
 =?utf-8?B?bFY5N0YyVDd0RmdyV1kreDFSVnk0eTlLT3ZPcjk3V2kxMkJXbmUzSk9GTE9I?=
 =?utf-8?B?c2tadGZzdjAza2NpWmRremFsTjRtRHRBQ0ZlZ29LbW1uTmtUMDArREdVaGFD?=
 =?utf-8?B?UWFkMzJRem16V2Fja2tlRUFGK0NkdGI5VExTeFVzOTgwNzJTTEExb0EwalNO?=
 =?utf-8?B?UkE9PQ==?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6cf0ba5-1d30-46b0-c69e-08daa5232896
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2022 09:39:25.1485 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XpBOZP/3pmEdDJzngYCbkiXUmROIuVfOcphJ8aPBzElQkrZywT5nOB/2j5YkMyCQ2KJVScN1vHuaEMRWy6wkV8i/DKI5q4gDIJj2SHZta2s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8460
Received-SPF: pass client-ip=2a01:111:f400:fe0e::70c;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace a dumb function in commands-bsd.c by the code of HW address
getting.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 qga/commands-bsd.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/qga/commands-bsd.c b/qga/commands-bsd.c
index 40f7ec7600..5f423a4710 100644
--- a/qga/commands-bsd.c
+++ b/qga/commands-bsd.c
@@ -20,6 +20,8 @@
 #include <sys/param.h>
 #include <sys/ucred.h>
 #include <sys/mount.h>
+#include <net/if_dl.h>
+#include <net/ethernet.h>
 #include <paths.h>
 
 #if defined(CONFIG_FSFREEZE) || defined(CONFIG_FSTRIM)
@@ -179,7 +181,19 @@ GuestCpuStatsList *qmp_guest_get_cpustats(Error **errp)
 int guest_get_hw_addr(struct ifaddrs *ifa, unsigned char *buf,
                       bool *obtained, Error **errp)
 {
+    struct sockaddr_dl *sdp;
+
     *obtained = false;
+    if (ifa->ifa_addr->sa_family != AF_LINK) {
+        /* We can get HW address only for AF_LINK family. */
+        g_debug("failed to get MAC address of %s", ifa->ifa_name);
+        return 0;
+    }
+
+    sdp = (struct sockaddr_dl *)ifa->ifa_addr;
+    memcpy(buf, sdp->sdl_data + sdp->sdl_nlen, ETHER_ADDR_LEN);
+    *obtained = true;
+
     return 0;
 }
 #endif /* HAVE_GETIFADDRS */
-- 
2.34.1


