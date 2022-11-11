Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C496E625260
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 05:24:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otLZQ-0000Tr-67; Thu, 10 Nov 2022 23:23:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=83144312e2=bin.meng@windriver.com>)
 id 1otLZO-0000TX-AH
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 23:23:10 -0500
Received: from mx0b-0064b401.pphosted.com ([205.220.178.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=83144312e2=bin.meng@windriver.com>)
 id 1otLZL-0001Y6-OK
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 23:23:10 -0500
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AB4N0iM024928; Fri, 11 Nov 2022 04:23:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=UtEzJOqW8iIbBBj7/HaMvsgPYrEDv8luASoWw86jxRo=;
 b=kUMRfjAxf9k8T12NVGoK/tjYDpdItDCmho5n3SlFc+XzLPuGR8Ioa7pcOVbp2UOeznt/
 FDjOZy6rNuCcCBuXStNSfZKwMiHN7nxU6JrASLcl79j4Jy3i9Em2gpJsairNlakh7sBK
 BQDBX2NZD5kFFBxmEuTk3aVCb1I8K7mFRuL4fIPa10VNjd+loevbt3wBZqtytZz9/vDz
 NabWtwX9ybIpMHgfNNGd3h7nymGdTG79ZhlLoVGAV2tqFQP2TDrA0+EcOzv/IZtfhRmz
 aITepp/GalSbeeLqRUsJagLHEf3Y+ZKGqa2Yb2kZdsP2ING0q7yWW47xg8oXFuFUJMvI Kg== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2103.outbound.protection.outlook.com [104.47.70.103])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3knd21ndvc-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Nov 2022 04:23:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PbAGdkZm9JWO9zJe05Iki2BouLxB3JmdqK883SjhDBgVHdjR5AGaFF3AqAy6ZZZChFdPhUwRorCVM6j/Jcr/CGS1acWlDh/hwq5TbPvKvLY17ry6uhknAnjcnM/anEaFbluq8XvYvuXAD4tW/1u9K124WHb5IHSfMnTr73FXLSJ9+tNwUiGi0cvbSWj2bfbJBhZ6N7oYRIf0Jh7c/K3+3/zLYGye4B8jjB3etSrhKF7to1cWTi8F/3H9fo2u7dlfgirWefcE10skY0fR0HnpVrfO0AWe73sZ4/G4Ss2oh9TD45nJQx3BFJbJL/Hyg1s+IIPNXAqh5dP4OqRGviekRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UtEzJOqW8iIbBBj7/HaMvsgPYrEDv8luASoWw86jxRo=;
 b=MKFs76CVyHmrPxGyIUuuHePXpC62eK/vU2ABgBUiL7AEnuXiF3v8hqYKg4Ri/SKOFnuVkOIKSi6SOV0O0DPzYt9uXU9Cf7nCAf5ZOtkj1jyi0bChrlHcXuE9kk5i7d9cEmhWESradGiHZnJxd8rKiuoVHrkP1u/FSyytW+5iKZHF2J3sewigDUDJTwJ9nYWh6MXi0W3blFR3wQ8OqUcRxCHCRULTZZuiEUagTP69o8qAWPDlCGt77W+uOSJ/cOdvU9lmnLOmP8GnuWk/HVsIQoRTc7XDXwXchu0D51SKuUNsQQqBU6h7Ely5HFK70kuDkPMlUbRw9bdO3jBfk5Xb1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 SJ0PR11MB5102.namprd11.prod.outlook.com (2603:10b6:a03:2ac::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Fri, 11 Nov
 2022 04:22:55 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::8e5e:71da:1e29:bc15]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::8e5e:71da:1e29:bc15%5]) with mapi id 15.20.5813.013; Fri, 11 Nov 2022
 04:22:55 +0000
From: Bin Meng <bin.meng@windriver.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 04/19] osdep.h: Introduce a QEMU file descriptor type
Date: Fri, 11 Nov 2022 12:22:10 +0800
Message-Id: <20221111042225.1115931-5-bin.meng@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221111042225.1115931-1-bin.meng@windriver.com>
References: <20221111042225.1115931-1-bin.meng@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0138.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1::17) To DM4PR11MB5358.namprd11.prod.outlook.com
 (2603:10b6:5:395::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5358:EE_|SJ0PR11MB5102:EE_
X-MS-Office365-Filtering-Correlation-Id: 051449a4-04b1-4b2b-429c-08dac39c67af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OQq27Wj01RYivX9GrDc1Y+REsaXGJVSxIeigNCBTaefWQPsDye1kYo2i1K3u8LXJdeDQS33Jo4omSNgu9phwvFUt8bCieGSbqUu3TUjPoq3v53QGs6p6dVwVCdRcEPDMYwrGV+zx67yzcTA0rH5GQpulP3hMuhOtrC+X5j75v5ETBsh3VsayjCMEyNCcozhR0Mz8uZFLQFQgUr1EtizyM61d5Mbrqzctiz37S79ZKITrPyQvn3pBhQBXYPDkr7mHwU837c5i2zHY0VFbteV7Pq0tgTd3GVZyI7lX5D4Vc7KRjAnSuTRHaVGTFRyTD3FFX7bAUVV242uQfoYR5eAsKK/Fi7aegOJ2dRPHRzIVVe3zB9d1o71MEIPs1R4ySaeRacrjImY1wBUwD4iN5/7s3XHrT/2/RqqHXhWqqzxNGY6LLiljPJXVXOyB12a6rL1aV4bU0p4mWkcjc4j9LaFq5ibNxIPhpB0+8Mv2tKd6B1WoN2RUU3A8bw0clU9TQm74Hw0ftb+zy96qeCJi9qB0Z85qsnIHKXAi4sSKZo0FczXcm48/cWem+tbMUVgqwabcKfX+wZro443hdL/WCvBkdZV8xrZt0v6tHYSvGM02flqM3MqlDzXuP6VvOg8hltRgTbX+3X9VroXjuluDZ0XEYHXhaBApgKjcokaoHYMov9Zf4xhyMGKyhGpyU1XHy0O/tVzL3//7gcWMtWEkOIWrq3YHMaRuFMv8i9ltzUWV4u1dzC/BsPShFzz+ttR5lqkIGA2QNiwba2rX4p3gnlUPcg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(346002)(376002)(39850400004)(366004)(136003)(451199015)(66556008)(316002)(86362001)(8676002)(66476007)(66946007)(4326008)(38350700002)(38100700002)(36756003)(44832011)(52116002)(6512007)(2616005)(1076003)(26005)(6506007)(478600001)(6666004)(186003)(6486002)(8936002)(41300700001)(6916009)(2906002)(54906003)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uoAQWzgap6fZZO4c3zqlCAyv99/01cvyuiJIUASIFAKJxVU4jODPkVZxENix?=
 =?us-ascii?Q?oXJfvd/w0BO9XYXn6H3ELjsxmrijm8BDWNy2XfvBwNmUkRRji0KU/SYdhGqH?=
 =?us-ascii?Q?EPW6/upu5AkVCwB77eCWLUuGOey2VKIEUfjg4s+hXYNcWvbp/IOfVo/dxcOe?=
 =?us-ascii?Q?hyJW0bd/IRpSmrhU/4urKGy6p67ynsxEQnom/BiTgNkAppI1/XkV0bFB8oDm?=
 =?us-ascii?Q?qNG1WG4lDU0VJz5ysQHb1Z8mWhvBrtQv0zI0JRnL0+OghCkcOGaErEc1dxd/?=
 =?us-ascii?Q?PcRS5p7NZy156f1z5VBj34e0a/Puv4z+WMvMf+XNiJezLv68rNogjuk5aLzC?=
 =?us-ascii?Q?4wA3rvIxRq9QENCAVza+wWynJU0t3RhX6GXyiYK5e45tIsxcbNQ7mlsvBM7E?=
 =?us-ascii?Q?XZuAaoqhktQojDLya/4GHFI8BPo2zAB39L4q8fMSPaNz8yDqWFbErRUnaMy4?=
 =?us-ascii?Q?3pUBaxN4IiS4Tq+2/pwsRl4PKqpW1jZ9T/Nv1Y6YcMfBzcaWue7ZNxRLrbQd?=
 =?us-ascii?Q?qILjUh8XEOgpaGVUZKze83CY1CA12iBOjtnFpzLtgAIfvpn2yM66VsCmsI6j?=
 =?us-ascii?Q?F/NocPun1e17tQvHfzuFqKMhB/+iDF6IGLSSNIhPDF8A8ynxO0jZoLFR0Oiq?=
 =?us-ascii?Q?Ge5akA7bGgtYLK7F5DMPz55UXQzYvzTPhQaJgxpWw1kfSxg7nCNlUEkwGoMx?=
 =?us-ascii?Q?QvA7SJfraTFNQX6Ti57+E9Rz4bPr45alFGhogNHPG6wfC+t04RNZbsScwkjA?=
 =?us-ascii?Q?243B+nw0LOVl/YXiaMUt7QazhPq0VyCUftQ1/0jJ2QWsF34g17M1VTSGK7PZ?=
 =?us-ascii?Q?HDppGhrKw16zovhHVX9QnddyY25Th3aIe9sAe1zQ1QObdp+6h4derw+wuEpk?=
 =?us-ascii?Q?RgzzHAiyZ+2T1GTcTIEMfzsuA7+EMV6Qs0JEKHjtu0dUPNDp038OYLrePJKB?=
 =?us-ascii?Q?DGMv0195yPzMValVLdym9VEqT/Y2N7rg4uOL0zx2kVQnIG1mvVTtRy5wX7+f?=
 =?us-ascii?Q?bQ21i4jKvLKIRiD1AKGIUdg5LGp3Cox0qrSfV/mEb8q2oNP2EChulA6LShdV?=
 =?us-ascii?Q?2m5Gibr2KdC0lIlVOwrIn58jBXNXEBrahFyTYsdaG9YSXuY1FyiSw/i+b26g?=
 =?us-ascii?Q?aKtdTf7bJ0upbkzW/wnVXz//XGOShIdbV++KeX7dKHOZDiGyWSzlgeGsB0in?=
 =?us-ascii?Q?wGMDgHEmIyhabGFoMLss5k7BMDibAbnhXqtgUkzuiviWWap0tSVBwpA5Sfac?=
 =?us-ascii?Q?PYJ0xVc6d8i8esAjX71kseVfJYkB1RdLDXwA10Mb7j0x+nx7+3S9Fg3eCYM5?=
 =?us-ascii?Q?Ofj4Jmh3ZE49ubxp5IrHGjLH48kpZWErtLv0vEiT0h9pm0Q28gJtZ6+yIdUx?=
 =?us-ascii?Q?5UFP+SlJlwSaDpcxdVZZjhM/INvGXFbPeVg5Vmfux5OkvkGYLu2ubksUNRx2?=
 =?us-ascii?Q?QEtyM76QcwoXsB9fKC1k2vcEIGVsIkOqQT3tK2NvP/rHOubMlAbU5uXQwuoJ?=
 =?us-ascii?Q?EfpUjvzCKlS9RieEdF7TQMgBHIEfhaM9/N77z8WKe+PmaFCMPcgBOj/YfMkU?=
 =?us-ascii?Q?0yfLA8PlxsVw1hGnTF2JpgV+OSoJiFVfzxe3iKMP?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 051449a4-04b1-4b2b-429c-08dac39c67af
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 04:22:55.0867 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UNftmdphQ/hBFHWkPa40Mdu5kJwzTGvdFE5WhXgXWujQY19MD8eTN9Qub/xSM9/GKWr+wdluDQqb6mLLfebqBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5102
X-Proofpoint-GUID: Yygb_MXUg9n_o-ntCPxkVErSDuFufo07
X-Proofpoint-ORIG-GUID: Yygb_MXUg9n_o-ntCPxkVErSDuFufo07
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-11_01,2022-11-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1011
 suspectscore=0 lowpriorityscore=0 mlxscore=0 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 mlxlogscore=562 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211110027
Received-SPF: pass client-ip=205.220.178.238;
 envelope-from=prvs=83144312e2=bin.meng@windriver.com;
 helo=mx0b-0064b401.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Introduce a new QemuFd_t type to represent a file descriptor for
different platforms. On POSIX platforms, this is a file descriptor
On Windows, this is a file handle.

Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

Changes in v2:
- Change to introduce QemuFd_t in osdep.h

 include/qemu/osdep.h | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index b9c4307779..45fc8bb5d9 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -705,6 +705,32 @@ static inline int platform_does_not_support_system(const char *command)
 }
 #endif /* !HAVE_SYSTEM_FUNCTION */
 
+/*
+ * QEMU file descriptor type
+ *
+ * On POSIX platforms, this is a file descriptor (int).
+ * On Windows, this is a file handle (HANDLE).
+ */
+#ifndef _WIN32
+typedef int QemuFd_t;
+#define QEMU_FD_INVALID -1
+#else
+typedef HANDLE QemuFd_t;
+#define QEMU_FD_INVALID INVALID_HANDLE_VALUE
+#endif
+
+/**
+ * qemu_fd_invalid - determine if a given QEMU file descriptor is invalid
+ *
+ * @fd: the value of a QEMU file descriptor
+ *
+ * Returns true if a given QEMU file descriptor is invalid, otherwise false.
+ */
+static inline bool qemu_fd_invalid(QemuFd_t fd)
+{
+    return (fd == QEMU_FD_INVALID);
+}
+
 #ifdef __cplusplus
 }
 #endif
-- 
2.25.1


