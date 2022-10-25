Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F82D60CE8D
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 16:13:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onKdw-0002nW-MW; Tue, 25 Oct 2022 10:11:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7297d76813=bin.meng@windriver.com>)
 id 1onKdl-0001GD-OB
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 10:10:50 -0400
Received: from mx0b-0064b401.pphosted.com ([205.220.178.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7297d76813=bin.meng@windriver.com>)
 id 1onKdi-0001XT-Jv
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 10:10:49 -0400
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 29PAanVb002313; Tue, 25 Oct 2022 14:10:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=nnank1XdWqGncqrgkLq/+yLbNmf+zrW2b9ZXPF/KGL0=;
 b=YAgJKdzSS8An1yDJ8JFttnR3zDmnFzyDgPwuYuE9lDS9gxcwpP3W++fk/PrUjXRBjE/Y
 A8rJozMpvrNPqGyNygFKIWuD0MKcqzZW/qKhSzMiLXV9Cg/iQmBRBhOrNjBz3s6iV6CO
 99m6dmITIIb4Q4E9xg3GyyunRkLb4RHYKNvjGmHfZV1rT1PEMGfRkuXUFY5xafaGOvpW
 vsrzuvCH3S6iWL8t+6EiN3ElxIkpGMuRuZPnNn0LI9BKP5ENeCo9BdFtvXLgIsyvwZSJ
 bMwfaZBvZOeMTr9q7R7UaNhpwC+Uqe2d+I74C1vfrROMEQcux5CeClXkVMCYR67GB7Hy Vw== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2105.outbound.protection.outlook.com [104.47.55.105])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kc7g9uba7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Oct 2022 14:10:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iyAhX6kdxTrfseprudZr26hA0cu0MkTihTDsAav9Vj9mhF4j7xf3MlEE9Pf+jszcDdOajBJStDkoQLJbIWPIvsWlQ6aLQ9BpIPVGhjEPRLYh8S3OTwlOGHt3onEKtpwA/tKKoKgMpkZD0lbB/5dC0bspn7ph8cteeSxR9MZ/cB0jrk/Y7waMgP7kIvJtrFjOPaWe5nf7oSTDWSuqA8bWh6eju55lWIJcMaKrIDwnRZDlLNw77wOT3eHlfmQgLzrnxJWTRl50XjcKG0UR0+LCYp6C93sxyfZnhodVhgDfyMJLg1JtLXw5ZEhva+wt1aNL0NuEyEqaqGFHRsvzbLYlVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nnank1XdWqGncqrgkLq/+yLbNmf+zrW2b9ZXPF/KGL0=;
 b=CoeGDFhahOPnESJW2G8n469vxE7YKKp3lK0l6yE7m7EM0U/G/aPWWie9cvPqZ8GMm3td5WbSqbwJieq6aEqRm86gCUoCuq+85j61ZQBz2ipaYO6Dn5jCc0hvRjRS3BmwC7nBzwqcAhUtt/vMgkRPxYCRGLLY70VSu2VMyQvxcKx9vORuaPIbDS71UKhoKVM1GJSyJ5RWHVeZyys5ew6xALW+24Zyq4BJvKIjGZO50YKUx6VJcDKv3rG03qSzqI/4ejCsZgYHqGVIhyZ2HYkAT1nBfAeo0QrM9+OQiQPk8ENih8FM+Y3fzb8x4O+57nGJ5QpM/FzH7FIctSfj9oW0ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 DS7PR11MB5968.namprd11.prod.outlook.com (2603:10b6:8:73::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.43; Tue, 25 Oct 2022 14:10:32 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::b051:27b7:c1c1:7cb9]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::b051:27b7:c1c1:7cb9%4]) with mapi id 15.20.5746.025; Tue, 25 Oct 2022
 14:10:32 +0000
From: Bin Meng <bin.meng@windriver.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH] chardev/char-win-stdio: Pass Ctrl+C to guest with a
 multiplexed monitor
Date: Tue, 25 Oct 2022 22:10:15 +0800
Message-Id: <20221025141015.612291-1-bin.meng@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0212.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:19::6) To DM4PR11MB5358.namprd11.prod.outlook.com
 (2603:10b6:5:395::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5358:EE_|DS7PR11MB5968:EE_
X-MS-Office365-Filtering-Correlation-Id: f73a4242-00f3-4844-5c2b-08dab692ada6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2NE6tJm6DQMvgCdpD+QUwy+4DZp48Owlapq5xEszd5Lc5/dmpmVY1EGZltC7OaP4IlAdApsIs361/y8duYWA32mQRGsaCD/P6cdnlf67snmslf1a2cp0XWJpq1JM1D3gIgeFQHqt9WF6B85fRK7K0ijjjjPWlbyq64D2hpZHEY6HxA2Q56vL95okcKAb2TTgE2TOEhsXeuGOpTtHbLFhY0qoWxjxo0/IBkQxIgnGS1mowiT5R2jV/a+ajM9/RWF6a3cvXMDqx5y+gtrLgVbZWOnJ6fXLSA56nfsir/wCSiF8Fn/kZyG58sNEWzEidjaIRizxnPPf2qANM+LDetf0u1nf+snav3/nd1lSDhgTMyn4DqkrgPvZtNwAvzM6M3ySI7XyIwb2IYqWfnKhkF/TC7IF1J7qm76LMmqsR62cp/PPT0ozQnFq0tffr0PO8SSmAKKzieGWiwH+UGaZjJK1Urhwvn5F6v7wfS2hWjplZiobsSulhnfTSToPwhqxT3qCfheiojUpF345o4PAU/ewlrjtjH+dXS7CU48Nwkg90e2tVzaAqyF97nZ79ZKmrYIwBjGprqRGN9sclg+iG2rMVvmKOZD5/dn4ZBxVv/IbJMYEzo8h/XBk7gs91y90Q8nNTNWZzB+3Ia0K+62wOFbtWeTk6Dpi1BBq1nnsTiS8H0RGAprxkiDN+X2zDY7sFheB+YwvCGgj+Un1Qv7dtnKUKz+366did29gD55osp12EK2VVPUlYfJbk4IA3Udi/2Ms
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39850400004)(136003)(396003)(366004)(346002)(376002)(451199015)(86362001)(83380400001)(38100700002)(38350700002)(2616005)(5660300002)(44832011)(6512007)(6666004)(186003)(36756003)(52116002)(8936002)(6506007)(1076003)(66476007)(41300700001)(6486002)(54906003)(316002)(478600001)(26005)(6916009)(2906002)(66556008)(4326008)(8676002)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jKHsaeYYdlyLHdz92cm3sakPnXrFtYar9oUSOYI9HPAhrJCNqQOkL1wQOkHV?=
 =?us-ascii?Q?obAarZUvVG5NbUfC29XXHu30Cb/mRzCQMBX37QASK2rQzD89xnOhj+kaeCKh?=
 =?us-ascii?Q?fzgwNxwTzhSaOCIdr341gpVs3uAX1OveVs9otSf4g8u0icUuZM53X/yoaoCe?=
 =?us-ascii?Q?0oNELaH0/PIbhnjYN4M0z18BbLO+DDaboqTC2B5XvXeCxDPSLB0L98n5d3Fg?=
 =?us-ascii?Q?BRf71oJebR857Ga8a6azkAgkEra2sAk0f84N6C69J441SDaibxh8604QLw6L?=
 =?us-ascii?Q?sfXJms9aXvrcLVmFr1MHV5w7lBplOjLJqi79FUqu+Eooip0PdGpaVzRVJUrY?=
 =?us-ascii?Q?MKZ7aFPW58TDatN0ziq6ojCTU/QNRLPEAmDXOzlYJIeeTmCtHZBa4bFulbPA?=
 =?us-ascii?Q?n5vrWi9neEfWEehu6RcqBQyn1hgPw81EJOKjyEX8gHULFTgYymT944gYbyqi?=
 =?us-ascii?Q?UtWlxfs03w+m5XDsxA6a9ZAZ6gy/LK3VaOcrl060q8KE8l2p+8t7/NfLuRmh?=
 =?us-ascii?Q?Bc10gVEV1ScOlJAx/dhqyiracCzkyNwtL2EB3lOU9ER38LtmKY+QL12ioyqA?=
 =?us-ascii?Q?sWLJFCTzutzfYh/aVZbMEdxio9gdDHz14c5FLA4oSqrJ3LlLKNWKupnRxZls?=
 =?us-ascii?Q?JxgZdB0g/6lcLJ4SeEX9xXSY6uepVEaaxXe4gryx0KovIgkjSOGUKYkQ2ovh?=
 =?us-ascii?Q?j7rUW4U8OxaIJ9kzfy4wFc97LyuWcKFscpuINnTXEphtrjO/Mrmue1BW4mGn?=
 =?us-ascii?Q?ajlECZ2lQc8HuBQFMNAmYVFMTROsj1Wp7HdwrOGAjFC1MvSuLpYgMkVoCNU8?=
 =?us-ascii?Q?nK/kuDuwetCAh+E2ftAA/P4jxMHx0UfzSSTWnYcNY01JniRLZvwrf/kmKbai?=
 =?us-ascii?Q?jvUN8PFfkmfRTRxWixJkgyrHS4IS6uKETHRUK7GO/3CtCv1ZQCulV9gbwtrF?=
 =?us-ascii?Q?tZnBt9L2U8/lbvh2Iwq+Z65XGzF9fErcFLeRZ4+sIiwidmzJcv+VoccLgpOl?=
 =?us-ascii?Q?Dp8T3imJC0GFAEUlPM6GR+8DiKslSVB7rgTEKxkGNqKiyPU76SbJQBGUYi3Q?=
 =?us-ascii?Q?1p9Jwh5a9ev11KtQ53q/WM9sMKoBtdQb4cxMsThySQGBDWQsFnjyT41MgV0c?=
 =?us-ascii?Q?wVKI/cowkaRbum7oWqqWftUMUtqx9AuHVcrIm5FIyn+fgnQ3MOCa5aGtiQqu?=
 =?us-ascii?Q?+YcdvpJGAps4bjjWTFDUE94OpSuMaCL2EJlBN5TGPokY+jPDghhU3vQQ6qYh?=
 =?us-ascii?Q?W/ffWrXaDTBEOHiAgS8p3zWqUSA9VbKw+hseYES7UBTqSskZpLDfKiiF4GjB?=
 =?us-ascii?Q?4YXRGkdAi2Ze69j5/9dWdKFyYt8czAzkX2bQTFoLa/dDBgBEYShbYhMRqA7Y?=
 =?us-ascii?Q?V5Zb3ZJXxe2rOgfa2jcJgGUH4I+lZdCii8Mvi/vk000nDdJ6xGhc9Lge4fRc?=
 =?us-ascii?Q?5mq/pOhoeCwTsbc3dwVkOr5g6sX8uUNdHS9evh+WMb9HrDlt8TxJu42Byw8O?=
 =?us-ascii?Q?TPfOFUyCz2elpRVYZKj5CMW5gq1I/23BpSRs8zl83ARuajCqF5J5reRlg9Pu?=
 =?us-ascii?Q?cnIVAYXY3zewYk2LOeLyc9pi8IoKzJpnjtN3gYd4?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f73a4242-00f3-4844-5c2b-08dab692ada6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 14:10:32.3388 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PfwqOrRIQWPg/KK05mFom7N69BtRx1JCzFBhTrsHiQUxWJK4Ln3Fx/AzKCYDVYSu34U4sA2LvmM/7ZAM9zWKvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5968
X-Proofpoint-GUID: M5IahJEEuLPTuVflPLBPAlRjfQ9-jbDn
X-Proofpoint-ORIG-GUID: M5IahJEEuLPTuVflPLBPAlRjfQ9-jbDn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-25_06,2022-10-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1011
 bulkscore=0 malwarescore=0 mlxlogscore=831 spamscore=0 suspectscore=0
 mlxscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210250081
Received-SPF: pass client-ip=205.220.178.238;
 envelope-from=prvs=7297d76813=bin.meng@windriver.com;
 helo=mx0b-0064b401.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

At present when pressing Ctrl+C from a guest running on QEMU Windows
with a multiplexed monitor, e.g.: -serial mon:stdio, QEMU executable
just exits. This behavior is inconsistent with the Linux version.

Such behavior is caused by unconditionally setting the input mode
ENABLE_PROCESSED_INPUT for a console's input buffer. Fix this by
testing whether the chardev is allowed to do so.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 chardev/char-win-stdio.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/chardev/char-win-stdio.c b/chardev/char-win-stdio.c
index a4771ab82e..eb830eabd9 100644
--- a/chardev/char-win-stdio.c
+++ b/chardev/char-win-stdio.c
@@ -146,6 +146,8 @@ static void qemu_chr_open_stdio(Chardev *chr,
                                 bool *be_opened,
                                 Error **errp)
 {
+    ChardevStdio *opts = backend->u.stdio.data;
+    bool stdio_allow_signal = !opts->has_signal || opts->signal;
     WinStdioChardev *stdio = WIN_STDIO_CHARDEV(chr);
     DWORD              dwMode;
     int                is_console = 0;
@@ -193,7 +195,11 @@ static void qemu_chr_open_stdio(Chardev *chr,
     if (is_console) {
         /* set the terminal in raw mode */
         /* ENABLE_QUICK_EDIT_MODE | ENABLE_EXTENDED_FLAGS */
-        dwMode |= ENABLE_PROCESSED_INPUT;
+        if (stdio_allow_signal) {
+            dwMode |= ENABLE_PROCESSED_INPUT;
+        } else {
+            dwMode &= ~ENABLE_PROCESSED_INPUT;
+        }
     }
 
     SetConsoleMode(stdio->hStdIn, dwMode);
-- 
2.25.1


