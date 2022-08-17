Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADAC5973D8
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 18:13:56 +0200 (CEST)
Received: from localhost ([::1]:37762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOLg3-0006Y1-Mh
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 12:13:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oOLND-0006uK-Dq; Wed, 17 Aug 2022 11:54:27 -0400
Received: from mail-eopbgr60132.outbound.protection.outlook.com
 ([40.107.6.132]:65374 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oOLNB-0001M7-Mb; Wed, 17 Aug 2022 11:54:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NApMi7Q3SGnMcpzAY3KtudB5VBM4RvT3L2QqN41kefMm1+QdHJNhjao8mHn75JokAsjgAKgb9euAazL2pNkaB1KZsfMSjvesjQAtFBZkd6LoVsKp/nAjpG7czhsPZLbaK5gd8E4sutK01XIn2MWAqn7DzevB4EnTHknWyiVeSkaff1Sx/p7ytasefajEsu2R4SRJ24u+OYYFxxMO6L0NXQbdDVOgKnjdVCnIKCkCJp9nNEgIr9kJ0lJxRkEEY3N0xntZSgLfXoaKbCpDNpDXx6oCG4fa0UX4GlnX/iWqhrUI+thl6aLpQGSbP1fkud/rnvFEpBL8Hp1reoKOOk9FNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yr9G2ndpvrtYIlDQyw75oWRpBdNTzx0CL+e36ag47VU=;
 b=gSHdqeY2988TtIvTKtOxx1Nq+rklfsds2xVfmavU8wkTa00H/UxUcuvMhDaLW1kY2PtNssIpEmHiLFVbvpxKSL48kEgIqnBSgyIrdDbZ0WusFmyUDdaLYmwwnNyi5trCDR4toAO1K9L+JdeF2GfAVKdCswcFDIrurzsqMyNxZx9yJgE/roe/11kXVje0w3LQyRRgBTRDHYuPXKm8fywZCAg8lK4A2X9CUGTAS4BkpKMwjlB306fKhOeVl7/RAObi4KO7C1a+EtmPoo89NJ3rYzhrNq2IAQ+67vQPJ4e/8KcdPcgvsZej+rv9s3R26TC4YbnwWgh8+dJGWZE1g6SXaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yr9G2ndpvrtYIlDQyw75oWRpBdNTzx0CL+e36ag47VU=;
 b=BKGJrqHpSt1xOvC1VRFSuGWk6HWcIOEohBYX6urRWrhnIHUqOfqApp6/4HgVYErdRhKk+FsRY41sX5PfGT0q4Ur0e+2zEk2eftUhbKJjRPZ8zXe0Y+kqrRFzO48YX00eK2nFO+xjz4nDkUXkFDoHUCydz73n0cgOxmRBk9LTEsEoTRJiuyqdMlAQs/4E4AsblixoseILz417FL1VpcRQZ9ecFqukmqI6lYU5H/Pc5cw50LV51KMSHZKt/IfTX9sNabe3vyHraMDlvCEHog5apyxDGKBlt5Z4AVw2sq/7tVuMEoNlri5zJtg8ZxpG684tOArqx+DMRwZBL8xxUTx+Pw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by PAXPR08MB6783.eurprd08.prod.outlook.com (2603:10a6:102:131::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Wed, 17 Aug
 2022 15:54:14 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2%6]) with mapi id 15.20.5504.028; Wed, 17 Aug 2022
 15:54:14 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH 07/10] iotests: Add leak check test for parallels format
Date: Wed, 17 Aug 2022 17:53:58 +0200
Message-Id: <20220817155401.2045492-8-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220817155401.2045492-1-alexander.ivanov@virtuozzo.com>
References: <20220817155401.2045492-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0111.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::12) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ec9d3a23-5540-4766-dbae-08da8068bc1d
X-MS-TrafficTypeDiagnostic: PAXPR08MB6783:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 39ANi6ztvOatckWhERvmOY6IygWjhW7WQkruKH8k+/0IiHCyjCE5WA2sT3sY6mmFt1kyEifh7/sYp6rHw50NefFHVmIZPVjEZk3nlMc/h2+GGW9fMhB5iDwFVhRPPwisq2EAuz8QnSBUegb2tWDtT9uIBdoGKVadxBky39xar6lbm2Jbiw97x65DueHuwtSyd4Moya6eikbcD3ZsDus5kDY4w+dMCUhj5kJa7cqoYroDOuN0u/79YMYHR3DJQfaK3QHQ32pkyz2S1saoFauraz1RbrtJsZskqAms9SiXv3sHOjpeFExREckyBti4e0m47D/1+funxv45Ot0VbNlzrN+yE/gafkJ9FBXBss47Pfo+Gc+U6EUOx36GwfFkTmW9+XoLxEj0vcbrMouUWtV7kq+DS3Xs+zp16wJsu3yWMoqjqqwMA7+g4xHVFCLzaczWYXcO0C80tjfckyb90pV5yPb4ZDZX6Lj4LUMLweYlYYjbk5h3bOeN7BpSN8J1dZlP0V5IgCeSj5nkPdBmz/lwLuAXzI0mMuHOWkj4qfgfRcXUaiODEnsuGVriWBPhgfIDo8RENi8hgiFE7cfvLYKMPNqN3q/DEXasSmqGUab8FT6QwR8Ck4s3U4mot0lTdW+fVt8feOk39OTBDJgMoOtncQ0npFctUt/nlz8Bdmgyxzk1tVq/Z2CwcK1ocj7FPsgUTZvcAmvCwsG/2NIqmsHLfITyZdr4sSz5YEQhfoH1Vw0FRaxsE22ieMJG4lIf9DSjL3vjRIJLOGLHy26CDco5IDPRgiCetAAUAmGq6H+hOEVmkEg13SPU4uqhXJ8sYw2rENCmsiovIkaJ+pd9p9JxZQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39850400004)(346002)(136003)(366004)(376002)(396003)(66476007)(66556008)(36756003)(5660300002)(44832011)(66946007)(6916009)(316002)(86362001)(8676002)(6512007)(52116002)(6666004)(26005)(478600001)(6486002)(4326008)(38100700002)(38350700002)(2906002)(186003)(2616005)(1076003)(41300700001)(6506007)(8936002)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iRsrQq8d2kQ0+293hlnrRyKAAkffQVFOCfBUHaj5uftzWNbZP1rOd2xCTXnv?=
 =?us-ascii?Q?f4Tlt5cVfs6yf81GWuRgIb+bqYhET10cHiVjB2llW5gBtIvj20jWwIAzdgOL?=
 =?us-ascii?Q?YaKPtEBi1EKj5e79co11cPewCnn6nOjLdGXT3WDnA9MNHQsCbwr/DyXs+Q2W?=
 =?us-ascii?Q?olRUZYN9xm+Q2ehWsBRGx+qJMZoee+kl+nWjwOvfwEuqjT/ZgzD4dHLIWK9P?=
 =?us-ascii?Q?nFPBgnT+60f0Qc4VBAjOAwTOl2F+krwcmA0l4ChcT5IJ8q6ahk2LxozJi1zo?=
 =?us-ascii?Q?e3jZuabuLk8jVJVzPFknhkNWONMIGARUOZxc44DG9n5eoSCsJBu/IEtwY3sJ?=
 =?us-ascii?Q?fC2IHU3mDMTkqYLa+KP+iBP/L8Fq8+bi/jRyPBuyadBW2PaakakMR/i/EIcd?=
 =?us-ascii?Q?HygZsRdRjS65kHK0juNLvYTE7vKsnM9z1rqePqdT78X4mUA9D69T8GaL/+h1?=
 =?us-ascii?Q?evksMiJW3vjDE/Us7k5NEugHI1skb+3TC4owWDJXFYvt/Wls0S5L6rbnkyhr?=
 =?us-ascii?Q?iNZXd21fRIxAHvAoc9lcbiYyUiDIK8X4MunKrXV43qocNWqQNk8D1TH2XEcB?=
 =?us-ascii?Q?MVeIPIagIh/BmwOl+ro1uPNBkfp1Jc4tzpYEdJGAqnDV/PQycqqhlug3WDcx?=
 =?us-ascii?Q?Zx6F593WtxnHp5L+JjcBwSZZK4XM2xoU7ik8JkBSgUkAfRJ/jMlWjOgMScLx?=
 =?us-ascii?Q?VUzeCUEMbQrBihojoUWd6Q5rY8ZGXaV/JxVvoJb1o/LQQID+Rsi1/AiY+LgN?=
 =?us-ascii?Q?PaovsZ3K+XQNqFpKcXrLz8d21fS11FKyxogalMQIVNQs/+sQGIrMpm7irW9L?=
 =?us-ascii?Q?JFSn5KqvxhPDROU0HsIFdmiMC9aj7vwrPjV+1h3y1YO59new28A9yGcIlYPe?=
 =?us-ascii?Q?hVbCAmHimFzPkXX9rO/NLYxRqe9fQbtUYsKz0xGHrp7i9Zq5/uNFF0uYxnkp?=
 =?us-ascii?Q?2iuRi4+/NgTqirtQG+FT/Usitl1iJ/in46BDtyyUBVFJWNDYanZaWJCByd9B?=
 =?us-ascii?Q?rJzzF7jbjbOaVVZlTgTKILALIpvC5vLY76STYPH5UCLMiEB48IAyL8ZaiP+S?=
 =?us-ascii?Q?GCBVVP8tlZNyrp0EQhxtJw4ih8oI9kBx1JeF2fhOEObyqeDCihDfJ0M5D9CS?=
 =?us-ascii?Q?RhrZUFzXGoMkvEEFVZIw+X99UOGeD3DS05WZulknKetscWJaqHj29Vlcr/ba?=
 =?us-ascii?Q?yNxI+yHrnXdktZo0Z82on/8LHpBL9eMjVyF9QKEOetrORpkwszH62Qbnnvsm?=
 =?us-ascii?Q?RJ+9aj0/XEEwZiW3iq9p9by0kCtOhQ4MfcfMvJgdU3sHtK2waiQDZZCTSHhR?=
 =?us-ascii?Q?Q43JHUwRnEObgpq/xWBtu/UvzfdnQ/h4ruCQIs44/s0wykB+BChAalOwIgfr?=
 =?us-ascii?Q?CP4rjrwlra6E2lu+dG0l+n6Xzn1Aiuy5ejU1WL/6CZFrjJxG6ZEHBRSxPUwq?=
 =?us-ascii?Q?kycRYkX8J0a9shyGzw2j36kAoQZYJz9pPvk/pXh/zmdDBqyJgEkNQYbvr6aL?=
 =?us-ascii?Q?WSo5TBlhhyLm7y0NVsQVj1pT2V67g99yQdioR2kZRJdIjweK0wvwc0izOkhQ?=
 =?us-ascii?Q?R4btpdPfUPijmeXRlpIxJIR+atqtmecFQjFUd++BrjZchM4GZv+qENJXzFhv?=
 =?us-ascii?Q?Fz/9IRHisekgN34YIyuBCXk=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec9d3a23-5540-4766-dbae-08da8068bc1d
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2022 15:54:14.8467 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vYaziIofIi5H1cPV8xBS9mdi7p9uMtr/VRsZtFyBlbi10U997MqmjHu9PUuFqaVnlM/6mDpLm3HcBltMGf5mkLrYmlaKp+DkgUAFxIqnAqc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6783
Received-SPF: pass client-ip=40.107.6.132;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

Write a pattern to the last cluster, extend the image
by 1 claster, repair and check that the last cluster
still has the same pattern.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 tests/qemu-iotests/tests/parallels-checks     | 27 +++++++++++++++++++
 tests/qemu-iotests/tests/parallels-checks.out | 22 +++++++++++++++
 2 files changed, 49 insertions(+)

diff --git a/tests/qemu-iotests/tests/parallels-checks b/tests/qemu-iotests/tests/parallels-checks
index 5aaadb0c74..a793b8c2fe 100755
--- a/tests/qemu-iotests/tests/parallels-checks
+++ b/tests/qemu-iotests/tests/parallels-checks
@@ -71,6 +71,33 @@ _check_test_img -r all
 echo "== read repaired image =="
 { $QEMU_IO -c "read -P 0x00 0 $CLUSTER_SIZE" "$TEST_IMG"; } 2>&1 | _filter_qemu_io | _filter_testdir
 
+# Clear image
+_make_test_img $SIZE
+
+echo "== TEST LEAK CHECK =="
+
+echo "== write pattern to last cluster =="
+echo "write -P 0x11 $LAST_CLUSTER_OFF $CLUSTER_SIZE"
+{ $QEMU_IO -c "write -P 0x11 $LAST_CLUSTER_OFF $CLUSTER_SIZE" "$TEST_IMG"; } 2>&1 | _filter_qemu_io | _filter_testdir
+
+file_size=`stat --printf="%s" "$TEST_IMG"`
+echo "file size: $file_size"
+
+echo "== extend image by 1 cluster =="
+fallocate -l $((file_size + CLUSTER_SIZE)) "$TEST_IMG"
+
+file_size=`stat --printf="%s" "$TEST_IMG"`
+echo "file size: $file_size"
+
+echo "== repair image =="
+_check_test_img -r all
+
+file_size=`stat --printf="%s" "$TEST_IMG"`
+echo "file size: $file_size"
+
+echo "== check last cluster =="
+{ $QEMU_IO -c "read -P 0x11 $LAST_CLUSTER_OFF $CLUSTER_SIZE" "$TEST_IMG"; } 2>&1 | _filter_qemu_io | _filter_testdir
+
 
 # success, all done
 echo "*** done"
diff --git a/tests/qemu-iotests/tests/parallels-checks.out b/tests/qemu-iotests/tests/parallels-checks.out
index 787851a250..fa0fca953e 100644
--- a/tests/qemu-iotests/tests/parallels-checks.out
+++ b/tests/qemu-iotests/tests/parallels-checks.out
@@ -19,4 +19,26 @@ No errors were found on the image.
 == read repaired image ==
 read 1048576/1048576 bytes at offset 0
 1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=4194304
+== TEST LEAK CHECK ==
+== write pattern to last cluster ==
+write -P 0x11 3145728 1048576
+wrote 1048576/1048576 bytes at offset 3145728
+1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+file size: 2097152
+== extend image by 1 cluster ==
+file size: 3145728
+== repair image ==
+Repairing space leaked at the end of the image 1048576
+The following inconsistencies were found and repaired:
+
+    1 leaked clusters
+    0 corruptions
+
+Double checking the fixed image now...
+No errors were found on the image.
+file size: 2097152
+== check last cluster ==
+read 1048576/1048576 bytes at offset 3145728
+1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 *** done
-- 
2.34.1


