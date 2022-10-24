Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 944826099A5
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 07:09:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ompYB-0004ES-Kw; Mon, 24 Oct 2022 00:58:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=72963f20b2=bin.meng@windriver.com>)
 id 1ompXu-0003t3-3D
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 00:58:43 -0400
Received: from mx0b-0064b401.pphosted.com ([205.220.178.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=72963f20b2=bin.meng@windriver.com>)
 id 1ompXq-00068S-Bj
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 00:58:41 -0400
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 29O4wR9p014323; Mon, 24 Oct 2022 04:58:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=R+duudYh1J0kX/mffKQJ3Z6PLhCTv7qtHEh0HvLqpvo=;
 b=fPnBjh9nJrw3Aj2/kqBAsPyLndP092C4gLrCR9Nk90hnF/Yb5gdLNhT6Jqvu3hpZI8IL
 XRygCmC6M4DtD7NNim6z5GR32uaOGoQweA4sc0k2NuBwZHfZkOL6x+ldmJ2bcK1wTwcM
 Z/N+8vV/W+yOHlrWpVg+OLggaxE+qzJlcLPww1daMAY2PHeBDYHhpUt6deGJGuz8aG/l
 H+vODrdadT9/nDy0jJYQXd95GqqtRbVYTIB4rf/Ztr8IxkhJpndwAWzgi7RrkkWs7l9s
 9LzF1PsRfK/0B/SHg6YEMt9poVEjOtcJ3TBnRVkCA4dMzQVvXQFQGJ2CHp4HsdgBD2Te hg== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2109.outbound.protection.outlook.com [104.47.70.109])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kc7g9stj8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Oct 2022 04:58:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XL2ijE9AbRrI4WqsrInfv0fAqjpLNAbeXdR6GRm5lhbSfKnijIohiLTwBz1tR1npSw0GvtTGJWxeR91vXT2i1+We1RKn+YXnROtwkqdu4WgdFp30A9PpuqD4jdp3eznmKlZBByGFbkYSrxtC3oBLm/6tPJGNnEDmt7febSDqCNhC4cbDVZEA3GnoDf2f/pBL3o9dtUIPJZi1Z3VMBKeSk+YzxttZ67E/D/uYECOCERCSIs7xEeCuDqPJeBSpSdh1DLEjwiicc6eeR5hKod2EJzOEIEKrhfHCi3bNDeR88KKAetBDv7KRiN0c8SHGkV71E5/CGdDk1sHHEU3gat35Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R+duudYh1J0kX/mffKQJ3Z6PLhCTv7qtHEh0HvLqpvo=;
 b=NI4XLtejuvOoaXaQ++4fJBu3OWwxlRMfaUIj4WDKcQ6bVfy6BUOXLQi64vh+wvi7TA37pVZw8eBWVabKtStMj+FLkA0A83SLgKcYlD/pUQmW/7ezj7ENnCHCZw3tiTwaO6ERr/iLdhRbVlKY5WyzyIORVNSSVbk1okGhLnnnNimtmd2kJyXN4SJz78ephtAvWlvEHmmrJI8dxpWnT+Vr3sPdAdzT0/dIR0vzUMciXbFMdjzLxE1GejEWPQMwXuat2emB1odgbpPqQU21yXoTeezpIGLZRJtlsg2J+tjQuJmEt/ovkn/+H7kJ2Apwhxw6aIUJSTI6MwiQcLO3qCitCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 MW4PR11MB6911.namprd11.prod.outlook.com (2603:10b6:303:22d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.26; Mon, 24 Oct
 2022 04:58:25 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::b051:27b7:c1c1:7cb9]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::b051:27b7:c1c1:7cb9%4]) with mapi id 15.20.5746.025; Mon, 24 Oct 2022
 04:58:25 +0000
From: Bin Meng <bin.meng@windriver.com>
To: qemu-devel@nongnu.org
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>
Subject: [PATCH 05/16] hw/9pfs: Update P9_FILE_ID to support Windows
Date: Mon, 24 Oct 2022 12:57:48 +0800
Message-Id: <20221024045759.448014-6-bin.meng@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221024045759.448014-1-bin.meng@windriver.com>
References: <20221024045759.448014-1-bin.meng@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0021.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::26) To DM4PR11MB5358.namprd11.prod.outlook.com
 (2603:10b6:5:395::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5358:EE_|MW4PR11MB6911:EE_
X-MS-Office365-Filtering-Correlation-Id: c17bee60-238e-42bf-e4f2-08dab57c624c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wgghzCmL7QuXl/OVZzPBacudKlptNLbmLMSt7iuiur2leIHj1WHKXaB0LLix/dORcEuxJSbmnbxPKq3qmTotkK7nIt6RcIPeYqxCKG53Yz2BaGtFobiYppvCumoqL4zE9sg3hQIv3PU+38Vc2C0cNAY2gChRvhVyIUQ0Ftc+4DfKUlJ3ImdhBg9RMU0++i3f0JBx3jwwBcrL5cndxjS3hGLY/Z2pDqmj9dxU0PlYOKSgaGGSyAyBMvUac57lg4zyTMB2ui+BHI6QnZQvUE//lG763RXpyZSsxOhK3OZWMtyDXJZo70m82zCD0aAAn2ds7rQePf8uDNatW4XCvN000kY998ISmmo+WZad5qhwCeIHBYtyiYITFA/Lvrp5MW4ZzdC8ReUkyR0jrs9sGAtby86YVJGAzn7qgfO1JEahroL6VfanhtNsK1AXdA9ieew3NflFjFmvbriJWMkCHwh/oLkck4P8j/o1OgoOvm4v8B7zyvz58+mcHR22KhiJ/UR68kmSBdnfUJ4hECRai+axg8egcqbkYnT7jEKVY11kbuxs9MQfdDt4q4MNh06/M3RpQUTKG7N6g8u2q7E0w1rW9J3TCfhN8lQ95DbQ8Px9bMqBMUC9HteTeX2aV5eGAfkR7hbV+dqICai3G765hK6/5ETk169Z64AHwqFJWMCFMeKj0Sqy5OZ6/613+o5AcUdBrlaqPORfxc9aSXXS+JKJRdjz1H9aNRBdNxWP7/X4/+oEmR/8N2mTFg42cc1padmq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(396003)(39850400004)(346002)(136003)(366004)(451199015)(6666004)(6506007)(2616005)(52116002)(6512007)(26005)(1076003)(186003)(83380400001)(44832011)(2906002)(4744005)(6916009)(54906003)(316002)(478600001)(6486002)(5660300002)(8936002)(41300700001)(66946007)(66556008)(4326008)(8676002)(66476007)(86362001)(36756003)(38100700002)(38350700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3meQ3teh1xTxL/vK6ffceVuDlVALCGREa1OjlVvMwfByggkKd1qBonnHrfZr?=
 =?us-ascii?Q?uilPLPQoF89MMydcfUVME3VQgh72CN8NyoV49K4++Dwq9uNpqsj+fa3geu2S?=
 =?us-ascii?Q?UW9r1pTe47AUJzbFZJu7RqD0Zit8DUkTy058IgMpqt07PvKok8OS4wlkT4uM?=
 =?us-ascii?Q?VjaORN1DoB6fyLfAR/sEKYTsNsQy2UbXuIxm3C/Hb8vHFqCjn7+izR+wSPn3?=
 =?us-ascii?Q?TBPTAAPo4RWHY+sVvuXjJuTPcBmqdCDwkrv3U6MbMEmjtHDuK51V5MSK0UFV?=
 =?us-ascii?Q?JydyNEqnr09tyPl7zHtKn687hXlQubgh6JTVapGq5SI+WVZSFJca0LuRH1Kg?=
 =?us-ascii?Q?MfDDSYVRDZWJumHGWN7mA069u73OLjcTkA5WNWApc1OOTiIwUFs0+u+aIc9g?=
 =?us-ascii?Q?VYDkddX4aHX7Rh2ZLNv1ibRrhK8BBLADitEN7z8LuVp1sO5oLhy6aN+gLhnS?=
 =?us-ascii?Q?Ob/7JKOYaWblb6xYFGuLk7dQfuYfd6VCzsKOm0LxiR85SnKreyA20BJFDNbp?=
 =?us-ascii?Q?3SOt1pjP19a/0X+O7tOlE+P9Y9EF+eDBZ8u+YIN3ljQDKByRscXOScVtqnxp?=
 =?us-ascii?Q?0KozCFbZe002hpq/9VcgKNeI5y0peqxKwGGY2bZM8Gy2pzn3reYOuc3qJqEf?=
 =?us-ascii?Q?AUQPhaTM2x8te3lExa+j801qlb5ohKh/EJnOvsidD/rGm4QW/Rzx2+yNCZtL?=
 =?us-ascii?Q?W0tCpS3M4NYvh4gY08OzkmaBJtn3F5FV6TmMFTYs70fFhB1w+sOH8r7eiwpA?=
 =?us-ascii?Q?C4ars3hv7+CPighnOsP75o5O7HRMfv+GkE9VlNDnRDghKMWp2vnb8xkqdJ3+?=
 =?us-ascii?Q?oqeHENKjPhX9ZCt4T83HivnxAAcfcR2FPE3vHkcERqTE+O4G2V7iQmjWO+Cz?=
 =?us-ascii?Q?JDXWFG1WXLq90VD4ge2dimunP2FFz1+CG/SQ++Gq7IEuZ7UNJt643qXYye4e?=
 =?us-ascii?Q?Jc9W01zqYJaDQlNxvr3AoY6idljABYmqjeERj+tAgxt5LlCRFbRQKOkxCS+4?=
 =?us-ascii?Q?eALC+RQ8EvLcHlolrziAfR4c8gu3CcUB/sEDqHcreh16xZK/GYsSc6pIvCac?=
 =?us-ascii?Q?2dr6ye4i5OQw4CD8bP3c5vqjgGxJvSN7TxaLKMMeHYV3aGghT6/S3nC/7uUb?=
 =?us-ascii?Q?RcyCa5AfmvgB0NpAKDcFjjg7WmjAECMPsenOVX/1FO/FymYaQlH9VNKarRHL?=
 =?us-ascii?Q?6CQxGqDQVvCG3cwBlODywowVwN6w5ww3td/HPc6pNZOLqSL89cr5wPYkPT33?=
 =?us-ascii?Q?7cCpVELUC1L2cnJqP14Eb9H7sBcJYobyAs7LcgQwvqVgRGhbFmx8PD9QHZTl?=
 =?us-ascii?Q?ZKT+2KExDzC0I4jCsIOiHW0uBHbt59yBoGLH++1iqbaQd7nqKATGZmxPNHj7?=
 =?us-ascii?Q?+87EqGEmcW52Qi9UgARlZyF//rvcR4qZgnZT5AYjTn9dyKREFmbj1rPox7xH?=
 =?us-ascii?Q?IbFHIv1Ju6v2SMoIpuWYty1jv3aIzW1hWrVQME1JIdNorQ/Kaehz8IQSq9Iu?=
 =?us-ascii?Q?CT6OEHXnhN4/8JwkbMthDqaVVpw3guwlJuMZlCpLTkpDIOvN4czvsOdPbT1A?=
 =?us-ascii?Q?sjWFdRH/wAZufX4QaXcqEp6h6xgm25FzeRaH2YqoS3/0ESaXjo7eRINmZeWu?=
 =?us-ascii?Q?Jg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c17bee60-238e-42bf-e4f2-08dab57c624c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 04:58:25.7999 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /07WMoAiTCyyzHOyPsINbGuklX/UHSvEv3EgfCUlrpKwqufbH37p7KwlFb4JrFr6wlgGx4GjWcNX6rk5t9q/WQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6911
X-Proofpoint-GUID: b4cKdonRYx6U4OXJ03rmOZKW6HrrmBHc
X-Proofpoint-ORIG-GUID: b4cKdonRYx6U4OXJ03rmOZKW6HrrmBHc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-23_02,2022-10-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 mlxlogscore=580 spamscore=0 suspectscore=0
 mlxscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210240031
Received-SPF: pass client-ip=205.220.178.238;
 envelope-from=prvs=72963f20b2=bin.meng@windriver.com;
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

On Windows P9_FILE_ID points to a file handle.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/9pfs/9p-file-id.h | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/hw/9pfs/9p-file-id.h b/hw/9pfs/9p-file-id.h
index 60cbfbf4dd..00903048e6 100644
--- a/hw/9pfs/9p-file-id.h
+++ b/hw/9pfs/9p-file-id.h
@@ -11,11 +11,19 @@
 /*
  * 9pfs file id
  *
- * This is file descriptor on POSIX platforms
+ * This is file descriptor on POSIX platforms, handle on Windows
  */
+#ifndef CONFIG_WIN32
 typedef int P9_FILE_ID;
+#else
+typedef HANDLE P9_FILE_ID;
+#endif
 
 /* invalid value for P9_FILE_ID */
+#ifndef CONFIG_WIN32
 #define P9_INVALID_FILE -1
+#else
+#define P9_INVALID_FILE INVALID_HANDLE_VALUE
+#endif
 
 #endif
-- 
2.25.1


