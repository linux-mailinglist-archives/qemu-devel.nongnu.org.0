Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2B75F975B
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 06:16:34 +0200 (CEST)
Received: from localhost ([::1]:41168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohkDR-0003Pa-RF
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 00:16:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7282db322c=bin.meng@windriver.com>)
 id 1ohk2M-0004eC-R4; Mon, 10 Oct 2022 00:05:07 -0400
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238]:33964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7282db322c=bin.meng@windriver.com>)
 id 1ohk2K-0003GD-R1; Mon, 10 Oct 2022 00:05:06 -0400
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.5) with ESMTP id
 29A3qTi2008565; Sun, 9 Oct 2022 21:04:57 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=1qeWhE+rJX6yHjv14S0VeaIe0u40rTX5lWhl2aB0Xlo=;
 b=HdO1pUXLfYgomZl25ZgGZtY+hIUW1DXK1M7l8azSmzfjwFmOn/1jEBidTBeOXINuQWio
 K/Wb1TQlEZYFCeHtn0C0X3qipOezULjc+NXJXlDqsAYtLFMZ2NaNTmHEzgR29Bf64crK
 YM0kRBKC/cc+AAex7QejZ6RraNXZm7CcJ0F19NmKFj7i4adNoyEjTD+NCvhlD68eNRiG
 /cYEi/yupcjYwdi2w39PyWOJj3drXRLx3pegASK+HXQ0Mkbn0pcAk8MtbesgxTgv10at
 w1CLYfcw64d/F7zBKNU/eVoH4gCAhCdajC1ytwdMIX7nrqKPIWwIfgh8qO9RWrb5/nkP JA== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3k38qj8yu7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 09 Oct 2022 21:04:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aM7kKK+i0kBE4RyzmwoeFocDl5WDZDl1hY9cTmXCy+Bo2UVM2Fm8sp0/cczQ22xCw6MVvgsNZxhEah5Eeh9lygGrDktRc+QwL9HMALVDwIuQj5pP1haNin8PyrmIVUz1IJJpmHo/qdU8DTWcPRWUj1XEzhLsjkqTxuDYtuHlgLLFIaeQgIi1hXf981nXDos7ZaP2zQvU3OFg3uQjs6UNHbTFI+arSNb3xdeDN4DVoneWJnlJciqNX2YGE0YGO2Fk3yShVpKeQf/36+dHJL+jUgMWunt4q/+TMVxdLE/SKlyyDFehIHfJUXvhXOkRfEkCEWGmtgqEt9tHJtlP9esh9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1qeWhE+rJX6yHjv14S0VeaIe0u40rTX5lWhl2aB0Xlo=;
 b=IY8S//s50nYf/e8SklNY8FbTc5M6gMKzgf82vdM1T+683d+xd6Wsw7OBnGVGM1avQNSyVPkI0eUoO7bqe0V6kUx3G2TQlEosrXRisKuNoVoFUw5YEj3VQl3YxdBNnN5gi6O1fAtTePWI75tn/CwNm++w6VXoo8SA87UFRv1lfNo61Tr/TGXLDq+CuDtwNjGU8su/3KL8HB/mQCV/iKaE8dNCX4cE6oO+3SdcaMGq2PPzwPY+Sucgn5uI6mbURHKkLq/pbIsLDhyzyRIcJkWhdRbw3g5CsR0tYU1GO4qjU7D7GiWcMkmryhHqKj/9kuiQrIv3kaqOu/oxg0e1Dot1wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 PH7PR11MB5957.namprd11.prod.outlook.com (2603:10b6:510:1e0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.40; Mon, 10 Oct
 2022 04:04:54 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::1c50:83e9:d2fa:ebe9]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::1c50:83e9:d2fa:ebe9%8]) with mapi id 15.20.5676.031; Mon, 10 Oct 2022
 04:04:53 +0000
From: Bin Meng <bin.meng@windriver.com>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Cc: Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v6 1/2] block: Ignore close() failure in get_tmp_filename()
Date: Mon, 10 Oct 2022 12:04:30 +0800
Message-Id: <20221010040432.3380478-1-bin.meng@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2PR04CA0010.apcprd04.prod.outlook.com
 (2603:1096:100:2d::22) To DM4PR11MB5358.namprd11.prod.outlook.com
 (2603:10b6:5:395::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5358:EE_|PH7PR11MB5957:EE_
X-MS-Office365-Filtering-Correlation-Id: a6283e48-96dd-4366-37a9-08daaa749612
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5vZFUNR9O9twvNnRQUTHmF5yVSIytoSLWzosANnOaClfaegV8wQwLZyOigqP95cM3ZvJDwlkHZYUPnzJ2O5q/UrDemCJu3E8rh94qbkz6VichCsC/UVX3tKRNaKXUhz3vYmaA4TuxIMW/g6bBY2frdAh7V7Ke1AGcwXg85ngCo0XHpL+mIkPrJnpMdJZlMMNolrRsYIzzyF2o27f+hzujhIZS3qfHqIg53H5G47o8ELTuqkeexBqdH45tpGbiVedUm1zPmOqc6wJL7/q8xDyWyLAxRKWXPG5TD5flGiYDltyaQ807DrimKmcJj+sPNFGO5dxzi9C3c9F41PG/dZXRnLOSBhoiAgbpGKcVViPp8M1/RNVnlMPn+j1Xm9o5dVrdi/rdQX/UvX/GWoPJq9BW8USTwmjqXPKx3qTHc5NAOESPdBintITVsgM3Wji5HKi1KHq+2RsU/OpB+vhsBZ/fgeoQ36U0i4JXwlG9qxUnqKFgajfc53PoFvdi2lhQ622CQpDYaNe7awg4hERLvrNXPVu5zzMX5psc8PJZ8mRTYb9YI5gMvI0kG5Z/3HFvuiEShwLxe4idDP6ABdaey+UWzViwEaxbeC5hSaRgH5sk8M4rAHpPlayZW3hWHSBA/OBOBDqB12PrsdofMtYaYo1UCQje1oB82JskjCFgBC+uqqcBuaz1ygOfK4mmHrKeqn0xylej9ggQj7QSd1vDhagi5SLTlXdtkNtLqCglVL5KZxLX6WaWievw9X8ovOnuxS5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(39840400004)(376002)(366004)(346002)(396003)(451199015)(54906003)(110136005)(6486002)(66946007)(66556008)(66476007)(4744005)(478600001)(4326008)(41300700001)(44832011)(8676002)(36756003)(5660300002)(316002)(8936002)(6666004)(38350700002)(38100700002)(26005)(6512007)(2616005)(1076003)(86362001)(6506007)(52116002)(83380400001)(186003)(2906002)(66899015);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2j2Nhwmyv+IGefBrMP9VlgbCfKY7b5TJdv8+mpdZOUYStvtJCi3BWtn/TYwd?=
 =?us-ascii?Q?vsWKXd4VgE2rTheR8cfDJjY2+ecmckbZ+gbYKjXkIoZoXduLS9LuuUx85pzu?=
 =?us-ascii?Q?Qm3prggXU48veIxE5yBc8MWZ+2FSQ5tyAxwnqCUdm4oAWhLgJety/OlH/R6h?=
 =?us-ascii?Q?UYwlpDE0oyAvhL6NpvaUMmBOeMS4/hPKBre0VQy0xjvaf/g5okNOVCK8z/r0?=
 =?us-ascii?Q?yG1udhy/Z04bsaxHArdf/uevHE2WBE7ixQieH1vhv9X/lmHKdF5Kfcg7ruZt?=
 =?us-ascii?Q?GIhLnrxilGZyAnTjJPc5VAvVhWCpLNQUeFQoZsJYlPdevKKMrCkF/aGmX0Kv?=
 =?us-ascii?Q?4gq7usltvQtceNcDZ8ZDvJ+f2r0ncWW29AuisWGX/T6AMl80XFqB6Nu3wYA3?=
 =?us-ascii?Q?gBM2YuUXqJSp/xn+NN7hO6Rr7Si3Mzcl75bx+sO98TlNUid5j+2rZJEzXGAo?=
 =?us-ascii?Q?8gb8vtBG5zQ+A6oltJPJSaYoblcJjPTnd9n3dvV/hS5EE7oGwxWOFObOsb7g?=
 =?us-ascii?Q?4wwsSeRRS+8TFGU8//TCZvY1tzU/CG4MpnpWus2HxJBYVl6HXdX9Mv3Ckn97?=
 =?us-ascii?Q?s6vYSwsNTHEIXWpSEuLxAmOb/+WwcwF7QPxO2JqbLvbd6Hu7G2LhkS5gwiKU?=
 =?us-ascii?Q?Tavcy1gIgn4thWdVc38OSVed8dRaR55AsAEUSbTlWh+CQ2mvWJ3tGsgmnNdj?=
 =?us-ascii?Q?FTvsXGBdDEUt3+M7FLfJ6UMTSYHvluQOUZ/o5GLMe1d1dnji06lcAQspT9jI?=
 =?us-ascii?Q?sUmJF0aQMyT23rxSvjG7NALtNd0qB3pfQyGAztCgzfriLNJlgtf+KvnNKtZW?=
 =?us-ascii?Q?CCMmg0br6rhLNvVDSYQtNSYc9ApoK+WmfBOPXtYxZznDs9trISI89ZdAxUdH?=
 =?us-ascii?Q?Rainn/TlcuqrGfz0eQYl5kWIXucbX94aZz58bSR/qkCrGjljo62BO6sP2iGe?=
 =?us-ascii?Q?YMeMlZyV4NrGKO4x/Q2g+hutuQiuzl6KE22lsd8I8yWrZYDdmeLS2kyyFOeC?=
 =?us-ascii?Q?wIpCRYjgx8UqccbL0mxVPByiEXv9i0IXUJF8WMHsqJIL6jsSYR/OSu60rufl?=
 =?us-ascii?Q?JbHVB9w5eSX8x6Qsf+jmm0VbBspkEEg+FiyWFsa5UDoaSMPBJeRHvkd6Bfs4?=
 =?us-ascii?Q?eyB9uKGm6G7GjKbb9jW6f8dMdO0YBr/FN8wrwUtArN6hjPRPGaA+jnqCUW7O?=
 =?us-ascii?Q?Y2tbfuXzTu5DIC5kwCMOIRP80GEquwFrehSPhHUXKoWZ/ZGlx18eq94pdfRU?=
 =?us-ascii?Q?Yge8tXMrWRUnOyCAafAe/8cau7uSd/OTGWohCA8z14Ig3+clz+nSM9Yzfc//?=
 =?us-ascii?Q?EdfFZ5eJK5faUFXLNowVMclpAfrD+BRzGa50B8kgs5wOH4WxhcHOe2SLD16d?=
 =?us-ascii?Q?69afk6unkbjRe9z0NJFjMCGLXWSVQLq791+50/ghHOCkp18Ps19Umpjn5jf1?=
 =?us-ascii?Q?Jpmzq5xMdWAl5uqbjz+s3gAurtuwONlu+N/5hPb7nhYqXZ7WROW2Vse07HZF?=
 =?us-ascii?Q?m7syZMmlMWyp3MyOzOVONlpEa/9aWqKXHcEeV9qBS14aWYAx4bdK4biSGNR8?=
 =?us-ascii?Q?dR45hn77tcWJpob5PSq8yCJ/e8VE9YacsVWFua6q?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6283e48-96dd-4366-37a9-08daaa749612
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2022 04:04:53.8301 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ayXOzWP6+lb3YnJoix2iTG5nfeiOa9kmdFovJfaN6DhBqhQOaGAZVumVjE5BDbB+tHIpEDmM5OZ9IcKxi1eBqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5957
X-Proofpoint-ORIG-GUID: 1OXoRG8ddgmsmqPHLe16kPUgJtNQIzCG
X-Proofpoint-GUID: 1OXoRG8ddgmsmqPHLe16kPUgJtNQIzCG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-07_04,2022-10-07_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 spamscore=0 suspectscore=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 impostorscore=0 mlxscore=0 adultscore=0
 clxscore=1011 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210100022
Received-SPF: pass client-ip=205.220.166.238;
 envelope-from=prvs=7282db322c=bin.meng@windriver.com;
 helo=mx0a-0064b401.pphosted.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The temporary file has been created and is ready for use. Checking
return value of close() does not seem useful. The file descriptor
is almost certainly closed; see close(2) under "Dealing with error
returns from close()".

Let's simply ignore close() failure here.

Suggested-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
---

(no changes since v5)

Changes in v5:
- new patch: "block: Ignore close() failure in get_tmp_filename()"

 block.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/block.c b/block.c
index bc85f46eed..582c205307 100644
--- a/block.c
+++ b/block.c
@@ -886,10 +886,7 @@ int get_tmp_filename(char *filename, int size)
     if (fd < 0) {
         return -errno;
     }
-    if (close(fd) != 0) {
-        unlink(filename);
-        return -errno;
-    }
+    close(fd);
     return 0;
 #endif
 }
-- 
2.25.1


