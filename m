Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DE161097C
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 07:05:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooHRt-0003mI-By; Fri, 28 Oct 2022 00:58:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7300ee25fa=bin.meng@windriver.com>)
 id 1ooHRo-0003ld-GF
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 00:58:24 -0400
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7300ee25fa=bin.meng@windriver.com>)
 id 1ooHRm-00027T-P2
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 00:58:24 -0400
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 29S4wLMp017954; Thu, 27 Oct 2022 21:58:21 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=RU0NaIOfqT5nuKq/A7791gRn6np2jXF6/QYbNcHmKmI=;
 b=OOqIaqpWh7pnh78OqE36xSCR/rLIxpQ0dzKHniXzjfwMAqb7NUZXDd4virV4ffeS29YW
 fmf4COwQlf9zds3PBwUX9XTH+VIYhjz/XSIBAWB8bzVhz7mbBAYczxOX0TQuFYGqwrZQ
 XQqqYLtyzcvC/b7vKNJuSu+Ofj1T/hz/bTfgONztKd6DeXfXPJRQfxJYIKp3HDw9fs+f
 3qjko7b9sgEDu0UKMkyoTXt1k8I63z6Gha5UjVo/XIe+roIXL7ZJFC2dVwsJ+fIfg98c
 YVYmKGaREV2jcs5dif2qeD7YyB4MszogStRU7OjuEKuMaFURZrgKzrSrmrCe9/mcHbOe 2w== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kfg3gs4tx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Oct 2022 21:58:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eqNk52HwNVYVerLNQk7gdVbeHnYnR/CJmBVyk2ICkvW8vvK6YFe2vNIopVpspztf1FYKFyMOnBfY+PKFS5nfY8Mz0d15KFdLnHAr+kNVgs9hn8U3jLGAV4IXVdA4yQZ8rxoIfTkO81jxnfAKG6Z+A6SGlNK4eqvnpFcfLztA7MiHLRz65L7OBnqyAi6eGRQu5GjfMaJ/g0Xsz2FBR5kizWlQVrFz6R/Lxac0atay3KzFb30LhFp5jYf6KlmJGDg4MY1X6XhgFIrLhGqM1zRC09Iw1ddOEuaWqFrQnaUSLFuMwJ+sk6n6o7FVnTFok7UwXd+fWc2NMa6B7xbpZebKIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RU0NaIOfqT5nuKq/A7791gRn6np2jXF6/QYbNcHmKmI=;
 b=UMs81Zwrq6McVbPl7VKaQWAz9oimdguvSPYil3uVC3fuMyr+LPiWVvN3YkFZFGkKhhSttBHH+cPNcVhCH9PY6rfhBSl+9lAtTHvCWtZxpgi3dXuaRxKvFo0T1sNBFDovdHkVMIbf0gtI22nLK27FHiTvWjfCgB8k74Iv+lWgjz8PXyWtDV4TVaxlneQwKm9Jbc2lhM3PLRLLBw861ixze044VG4EIgza+TH9aJa8ztFbaU8HqsMtHm72A7lMSu4F+5bUUb0yCoqJ7h8nxl/GW+4Tz3x6JvLeudqkbLuKMXaBcbGmIv2gPK3O5+mxh0UkD0pvcFHnIb8Szu6bC5n3Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BL1PR11MB5351.namprd11.prod.outlook.com (2603:10b6:208:318::5)
 by MN2PR11MB4632.namprd11.prod.outlook.com (2603:10b6:208:24f::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Fri, 28 Oct
 2022 04:58:19 +0000
Received: from BL1PR11MB5351.namprd11.prod.outlook.com
 ([fe80::9a11:fa81:cdd8:b201]) by BL1PR11MB5351.namprd11.prod.outlook.com
 ([fe80::9a11:fa81:cdd8:b201%9]) with mapi id 15.20.5746.026; Fri, 28 Oct 2022
 04:58:19 +0000
From: Bin Meng <bin.meng@windriver.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH v6 06/11] tests/qtest: libqtest: Introduce qtest_wait_qemu()
Date: Fri, 28 Oct 2022 12:57:31 +0800
Message-Id: <20221028045736.679903-7-bin.meng@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221028045736.679903-1-bin.meng@windriver.com>
References: <20221028045736.679903-1-bin.meng@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SL2PR04CA0009.apcprd04.prod.outlook.com
 (2603:1096:100:2d::21) To BL1PR11MB5351.namprd11.prod.outlook.com
 (2603:10b6:208:318::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5351:EE_|MN2PR11MB4632:EE_
X-MS-Office365-Filtering-Correlation-Id: f46d4ae7-1ab3-4e0b-547f-08dab8a107f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z3XzQhSMVLU0PxNqbwCHSwap7Cj7RPZf0+DVAZSquKGI29fuo+QZIGwKXPDyRXkxWkFGui4JbY/mu9RdSl0VdprBjE8gl86RJdD1ebrFy3ggHOs/Jkf5SWTMk+F4sD6gRSxYd+JZhOwGHp9m6IoLfJjTktnTbd66jUIi5eY5dDb50pmf557nYfrkIN9Cmvty26zyI8wvwAfRz63a23eQ6q7yusDwDoHsKjyETSxIHMlLYkkIadi67ql/o+63BvLkHs4NAlHXFG+sxE2v+ftlxgcPArB/TrMjunaKdpr6hBbD0p5d+ALX1fAnRLzsoJEFZsjD3ATnNm/EAtYJOe4JYHEHFMXKTL7HOM0jjh/0pKq4Xvp0a82aRvidV8oh94qpOQ36fRA3n123YUU4VWOYc4gMseVuG1tdIuqHFU0jB5GnYWKsGZcBjiPIpV01/qQ6Xu15MmR5TaJ9QajatOIoO6ESxBJc6svSRir4TrohALY6LebZGp1AKOXPRr40E5iEf+BBKXycqd8H033W4QY5yGp5wGG9KG648BI/pDzR5VraFz/tntfznXufE79okSCC1LXXRV8bSXvxoz6XpQoZQm6kdS3x5GrB6QedowR6Lapx1al4PP8LAsWBt15ct0oMLuwtuDH1gdHIAaAiX0FEK6BOCex4TlhSExA3q+4b7BeWq7u02BnxWZtLFl+mzHwIN2kygGoExWlhdwGHz5jOAZ59p8rHAH9lSSElNU4CgUwoo+NCUuDxoRoIxXNur2NHbsWoR1WOFT8qu5Sp1CToXg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5351.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(39850400004)(346002)(366004)(396003)(451199015)(478600001)(26005)(6486002)(6506007)(36756003)(2906002)(83380400001)(52116002)(6666004)(86362001)(5660300002)(38100700002)(38350700002)(2616005)(316002)(186003)(1076003)(6512007)(66476007)(8676002)(54906003)(4326008)(6916009)(41300700001)(66946007)(66556008)(44832011)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2pSeG9NdEppODcxVkdCaWphZkFzbGFmWHVPVEhUVXh5eG93NWNPbjNlOU1S?=
 =?utf-8?B?NHZtckxkT1IxL2dseXZ6TDA5YVo4Qk5rbXFWMzhVNHJONmxNOXJXcEhVWjZD?=
 =?utf-8?B?RDVwUVUvTkc4TUpjVlJ4VDQ3Z2hLUHoxczd4b2c1aXBWMXhJUVMzQ3JRY3lO?=
 =?utf-8?B?dTlXSkRGZGgzbng5bEZpckJiOG5LQUVuOXVvSzJQa2lnaW5yS2E0STFQbEtC?=
 =?utf-8?B?VXpjYzFrb0Z6MkFIb2w1a3VPcnJaK3dwSHlTVkJxV1NjUnRyNG5iZUc4TUNB?=
 =?utf-8?B?NWJER2RvcjlDSmV2NytxMFZuU0Q3M25IUnFrd0sraGd5bFVSanhyVURrVEh1?=
 =?utf-8?B?SFM0eHN2K2JOeGw3VjlvMlcrYVp2MkQrM3ZyMFBmVHJJb21HZzBuU3Mxc2dZ?=
 =?utf-8?B?SEtiejV1aWZ3OUFGMHdlM3lZMFJBZmVpdWNoRFdpc2ZJcHpHeUVjVkh5bDcx?=
 =?utf-8?B?ckVTN3pZdUhkenJLTEVTa2poenZGRWpvd2pyeEdIbjNweHdzTVRHSGRoS2xr?=
 =?utf-8?B?blN4dzFLeHlaQWIwT1pkOUFDT0o0ZFFVR0VEWDliVWg3bnZtU3MrZm5KQnNs?=
 =?utf-8?B?VloveUJoUGgrczJvc1lRZnk0L3FML2xhUHBxM2puemFyc0dBSk5MZ1NvcEZM?=
 =?utf-8?B?K2N5cG50aERPOVdIeWdmMVY1QWlFTldyV2FxRXRqT3JhQnhISTAyNTYwblVw?=
 =?utf-8?B?YU1EMDFwNHNMUkY4ajdON0Fjait3QklneVVGU0t0SytZQmdFVDVkajgrMld5?=
 =?utf-8?B?TkdJL2ZDK1laQlJhT1RWdXlvR2M0RmZ6UjN3elpCSUUzZDduYm1HUi9HQ3JZ?=
 =?utf-8?B?VXVvTVNrV3dtTTg5SExjNFRhVTFMcHpuSFlLeVdISnJFazNZMS9ZWkxXdjZu?=
 =?utf-8?B?TFlZU05ncFhaOVp5NE5tTnRGMzJySmZyNmw2Z2NkMzJoTWU3WWpSeWljdnVr?=
 =?utf-8?B?ZUsrVk1NalhFZHZxY0Q2QkRYckovT21LRms2cTRXV3JRdms2RWhud2VUODEv?=
 =?utf-8?B?a1hQYlFvOVkwbXhneDA4VFIzaUUxWWZEcmFBNzVkVFViZU1wYUpHemRXQkZO?=
 =?utf-8?B?TXhQbkR2WHJxUnp4UEhGbVVjVFkvYld2QXNFV01mYVhJOVNBY21aV0l3NGJ0?=
 =?utf-8?B?WWNOYk81aG9pcm9yeDJBcWtCRjU0UnBVdzV2WXNTSDFWdWdXZThJMGxseXZD?=
 =?utf-8?B?WWFoUHdYUVJ0a0s3Y1VRNEppbHpGZVdwQ3pPYjBHOS9RM1JPY1JjeDl0MEFV?=
 =?utf-8?B?ZHhRYVRaY1ZIVm10L0UxZmdlR0V0Nnhlc1RRSTloRGxUTXljRCtuU0R4R1B1?=
 =?utf-8?B?TnBoU2cxL1hBMjlsalZBYkdBam5wQVJVTmR0MEMwWE1rOFRhT1ppYm52V1B3?=
 =?utf-8?B?SWt0eW0yY1JTY3owNGNpdEJaM1ZRUTdSSTR6ZEk4NWM5ZGVhOVlSbnNKUXE3?=
 =?utf-8?B?VEF0ekJGS1J0T3l3V1FQaTEyNFpOWXYzWFRZckxaam5CMk50dWYzY1Q0TnEx?=
 =?utf-8?B?RXVjd1FBV3FheE8wSzRqYW4yME95bmhNSHMwdk5qOXU2T3RSaEJPc2tsSG14?=
 =?utf-8?B?TkxpVjFGYlM1V0dCUlRncVFHbmpNc05JMlltaENUeGo5UUIzSHpyUEs1OWdz?=
 =?utf-8?B?VmxXRGZSSFN1dlRkS0VDUDNmWUlUWFhyRHRUQ1JsR3RGRmRyeitxVE1Dakps?=
 =?utf-8?B?STc2NnBWS01aK3VoMTg5THh3OENLU0F2Vkc1SmordElsVUt1eUh4aFJQSXNz?=
 =?utf-8?B?LzVZQ3F6U2x5NzBrZzBuNTA3YlV0M2pka2RUZ0Y2bkgvT2IwUDlMS2g4aWlK?=
 =?utf-8?B?enRSd1pmd1lrL2VFUW9IQ1VEeUNZYlFxUVZRNlRJdnlzd3ArSGpJWnFwendM?=
 =?utf-8?B?bFJqVDZ4Z0xoQ0txL1BUdml4UVlXN1NlZUEraEliZzB6SnRyd0RIVU8wYW5v?=
 =?utf-8?B?MnZsZGJPQUNJcmFFSUNHdVFhTnE2SjA0L3dlWm00dVQ2OWlUL2ttamxSK3Zn?=
 =?utf-8?B?TTF2cGZ0c0xsQ1d6dVBwelVOZXNIcXdHNDdLNjFqdUdPNDArQ1ZpMVludlhP?=
 =?utf-8?B?Q2IydXNER240blQ3b0NMUU9IQ1o1dVYrQ09HQ0lLUXUxYjN6T0pEMTlCL1Bq?=
 =?utf-8?Q?9E6tBZPvMGUNtke/t0uTdMTUz?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f46d4ae7-1ab3-4e0b-547f-08dab8a107f0
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5351.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 04:58:19.2687 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ajbS8ZFDmxziMHwW/ct3T008TmxOEk+DfoNZEew3d9nzKXlTGjj+Y0fAB1GlueffRWOfmhJO0wTAvQnKNgP/Pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4632
X-Proofpoint-GUID: O_5-D2W8swr_sfmHHF0oB0Re9rN_RNM8
X-Proofpoint-ORIG-GUID: O_5-D2W8swr_sfmHHF0oB0Re9rN_RNM8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-28_02,2022-10-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 spamscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 mlxlogscore=933
 mlxscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2210280030
Received-SPF: pass client-ip=205.220.166.238;
 envelope-from=prvs=7300ee25fa=bin.meng@windriver.com;
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Introduce an API for qtest to wait for the QEMU process to terminate.

Suggested-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

Changes in v6:
- new patch: "tests/qtest: libqtest: Introduce qtest_wait_qemu()"

 tests/qtest/libqtest.h |  9 ++++++
 tests/qtest/libqtest.c | 63 +++++++++++++++++++++++++-----------------
 2 files changed, 47 insertions(+), 25 deletions(-)

diff --git a/tests/qtest/libqtest.h b/tests/qtest/libqtest.h
index 65c040e504..91a5f7edd9 100644
--- a/tests/qtest/libqtest.h
+++ b/tests/qtest/libqtest.h
@@ -75,6 +75,15 @@ QTestState *qtest_init_without_qmp_handshake(const char *extra_args);
  */
 QTestState *qtest_init_with_serial(const char *extra_args, int *sock_fd);
 
+/**
+ * qtest_wait_qemu:
+ * @s: #QTestState instance to operate on.
+ *
+ * Wait for the QEMU process to terminate. It is safe to call this function
+ * multiple times.
+ */
+void qtest_wait_qemu(QTestState *s);
+
 /**
  * qtest_kill_qemu:
  * @s: #QTestState instance to operate on.
diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index d12a604d78..e1e2d39a6e 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -156,37 +156,14 @@ void qtest_set_expected_status(QTestState *s, int status)
     s->expected_status = status;
 }
 
-void qtest_kill_qemu(QTestState *s)
+static void qtest_check_status(QTestState *s)
 {
-    pid_t pid = s->qemu_pid;
-#ifndef _WIN32
-    int wstatus;
-#else
-    DWORD ret;
-#endif
-
-    /* Skip wait if qtest_probe_child already reaped.  */
-    if (pid != -1) {
-#ifndef _WIN32
-        kill(pid, SIGTERM);
-        TFR(pid = waitpid(s->qemu_pid, &s->wstatus, 0));
-        assert(pid == s->qemu_pid);
-#else
-        TerminateProcess((HANDLE)pid, s->expected_status);
-        ret = WaitForSingleObject((HANDLE)pid, INFINITE);
-        assert(ret == WAIT_OBJECT_0);
-        GetExitCodeProcess((HANDLE)pid, &s->exit_code);
-        CloseHandle((HANDLE)pid);
-#endif
-        s->qemu_pid = -1;
-    }
-
     /*
      * Check whether qemu exited with expected exit status; anything else is
      * fishy and should be logged with as much detail as possible.
      */
 #ifndef _WIN32
-    wstatus = s->wstatus;
+    int wstatus = s->wstatus;
     if (WIFEXITED(wstatus) && WEXITSTATUS(wstatus) != s->expected_status) {
         fprintf(stderr, "%s:%d: kill_qemu() tried to terminate QEMU "
                 "process but encountered exit status %d (expected %d)\n",
@@ -212,6 +189,42 @@ void qtest_kill_qemu(QTestState *s)
 #endif
 }
 
+void qtest_wait_qemu(QTestState *s)
+{
+#ifndef _WIN32
+    pid_t pid;
+
+    TFR(pid = waitpid(s->qemu_pid, &s->wstatus, 0));
+    assert(pid == s->qemu_pid);
+#else
+    DWORD ret;
+
+    ret = WaitForSingleObject((HANDLE)s->qemu_pid, INFINITE);
+    assert(ret == WAIT_OBJECT_0);
+    GetExitCodeProcess((HANDLE)s->qemu_pid, &s->exit_code);
+    CloseHandle((HANDLE)s->qemu_pid);
+#endif
+
+    qtest_check_status(s);
+}
+
+void qtest_kill_qemu(QTestState *s)
+{
+    /* Skip wait if qtest_probe_child() already reaped */
+    if (s->qemu_pid != -1) {
+#ifndef _WIN32
+        kill(s->qemu_pid, SIGTERM);
+#else
+        TerminateProcess((HANDLE)s->qemu_pid, s->expected_status);
+#endif
+        qtest_wait_qemu(s);
+        s->qemu_pid = -1;
+        return;
+    }
+
+    qtest_check_status(s);
+}
+
 static void kill_qemu_hook_func(void *s)
 {
     qtest_kill_qemu(s);
-- 
2.25.1


