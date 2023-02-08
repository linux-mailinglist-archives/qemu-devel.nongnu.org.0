Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 023E368EB99
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 10:36:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPgsH-00071o-C1; Wed, 08 Feb 2023 04:36:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pPgsE-000717-7i
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 04:36:18 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pPgsC-0005Hm-4W
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 04:36:17 -0500
Received: from pps.filterd (m0127840.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3185T1sX025574; Wed, 8 Feb 2023 01:36:14 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=proofpoint20171006; bh=kEhVrWVNt9KY6tJ8n0QFQXWYy1yZ9d2S10NdvpApDlQ=;
 b=hD0PdiuzFpoalTY2K7EfFqRosTyNDPVCRS01v87fgX01arGffMiSfrYQAB1My2JAMLBw
 SJCNduUr7rdF5IrJ9SarFHrRgBStUo/vCk/tPJnWgOU6v4bZcj67tIQChjPkAbqmGxrF
 cfTbLJfvzCAMRs+sJCUDhYXF/dA1yhiJVOLDz0j7NXGe7rYLcn9bX7NtEv9t4Z9/zySp
 hrS1XeDx+eOBS4pfSrMIhsjarn8z6vKAuPpE2PeRZ/y23xFjXxBhFezwrY9UK3DrcK5b
 r4RFGAD3nll3oU7ud3uqH0U6IPfN4uL7sB3Rs3d7jTD8d824/f6cWW90KQI6WY90mnhb 9A== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3nhmk1bt2k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Feb 2023 01:36:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ExMMsttDrpEdRexpxsIXyCGEUF7/am6pFmXDFcW0ru7ZwqGyPRgetZdKLIRfmlxRWqRyatXoqKB8/Z2DywUf8fGvWm3iZHx4Ibgy/rtPBhrdtReId+Oa2U1KL1lHlIdcVdfH924x6suSmPQHdtaR0ITqpzJWMAPwJFIcxL8OhXuMNuDKufo43Wio5BtdnAqX9qmdzGXUWYUj4Tm2nL22eTqjKID/5rAj3FnruC/d0lVpSp+Os4TyMrPjWTBXcmayz/2Q5lE5pbLpL2qp4m47KQNPRjha0HJ/6Gs5Rh7IwF6UzXx7IqRSxY15i16JH5yz00JTTD3HscVyc0PbUngl9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kEhVrWVNt9KY6tJ8n0QFQXWYy1yZ9d2S10NdvpApDlQ=;
 b=VSmb/j/qctfOXBDJKTApQZ+c+3uE6A6y9QNNWg8jsBGKnhz6NhSOukESa+k4Dm7Etykb8/vvzSzeyIbOgGfYJyqaCsJuB0KB32zGZDq5Vdq6geCPUJ1llAeo+DaZvV1CnB+39XYZdovQblaWFcXt96uBmEWl/FoDqlMNJgpkaNjYrplay8B756dhjzczDpwx13ETaVp30fKgXU7cbU9GP204N/r1kkrJqGneAzxr7DbdPgiJgacYhCyQsyPCwE4o2jBIFOKTToNrq8J//UZa3gvrER/NcNghLCqo+A4Y8/fvvD2XNNo1K87VmL9bHKVhdfRYK5y2bKcLy1Fsp7g3lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kEhVrWVNt9KY6tJ8n0QFQXWYy1yZ9d2S10NdvpApDlQ=;
 b=sKQMSsFl3uFEWAlTmpFCIla2lswgqLx7gyEnPc/hz/v67XKlbXnHn4g0MvT4hUESfjEi5p6gZi72gWjAz/LYLVSOR2rkLLZhgaPm0lLyvmFyprfgt1cjnMquTqjtVSpyVNyaswNDyfkuMfYXkaOqtGd2Zz2Rp2bllhkNGoZOG/MXNistnB6nKk9Bd1/nm9tYeTIE4QSwzj/8hYadZCRNxpiY1+dJ+34+B8+CTGQRluCIUJzisQ3EONXpcbRBUHeJF5qq3LNaXUlJxMFi1eQA5E8muhdDnaaHCmRaR7mS0GMXf+qs5WvZEULIxU9fzMAzeU223LnOA+M0RaAuxTEIUA==
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by SA1PR02MB8494.namprd02.prod.outlook.com (2603:10b6:806:1f9::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.36; Wed, 8 Feb
 2023 09:36:07 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::707d:b1c1:e895:94ac]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::707d:b1c1:e895:94ac%3]) with mapi id 15.20.6064.036; Wed, 8 Feb 2023
 09:36:07 +0000
From: Het Gala <het.gala@nutanix.com>
To: qemu-devel@nongnu.org
Cc: prerna.saxena@nutanix.com, quintela@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, berrange@redhat.com, armbru@redhat.com,
 eblake@redhat.com, manish.mishra@nutanix.com,
 aravind.retnakaran@nutanix.com, Het Gala <het.gala@nutanix.com>
Subject: [PATCH v2 1/6] migration: moved hmp_split_at_commma() helper func to
 qapi-util.c file
Date: Wed,  8 Feb 2023 09:35:55 +0000
Message-Id: <20230208093600.242665-2-het.gala@nutanix.com>
X-Mailer: git-send-email 2.22.3
In-Reply-To: <20230208093600.242665-1-het.gala@nutanix.com>
References: <20230208093600.242665-1-het.gala@nutanix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0014.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::19) To BYAPR02MB4343.namprd02.prod.outlook.com
 (2603:10b6:a03:57::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR02MB4343:EE_|SA1PR02MB8494:EE_
X-MS-Office365-Filtering-Correlation-Id: 5471f5f3-ccbe-4544-7adf-08db09b7e769
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x2zuVI93VAWqlVMi4cTLWcok2Z3Etm5B1B4e/cGqYVV6vOuLqU+y9lB/jUSuXzKtrH3XMwXRTlffb1HSPIxj5xmUcHuguGGR0gaacNh682WMuutO1uFoKMXyu5c/KeE6lyzmio9tguM/W8uBu9/x9mi1PFRzk7STDCciJxpFsyUglwm7AArQVWNDnVxaVJ7Wp356At1fGZVK6+SvPgFKrw7wzI4FIDxznhZrf/hI9ti5X6PExcsGg3Nzz81zQax4nv4pRUJpWilStPOM0rUzAt9Qk0vTbEHyHNY4ZJSU/5hHrB2tLVODcE3iDkBAFATOv2TCBrYqxhjgCPAY+/RY1nK7KAqsJTYWY6b8gpDAAhA4SWsQUHNYpbRU8CL2OLJ6vro9rO5PkkzXH3aCdqnQHjZhZN2EqD3Hi7z2XWJ9yFJy7fzW6HRwsWq8putQSZQRLVfrcofJt6HaqamP164Hlw52cI4wa3BDqi9BAE8gO5MlyUUWU8F1KrmKuvpESRz561aO3g+ecJdBwcFUhwdz4ypp21+iTiO9QT8aeZCj4gHrVvSHv46KobLrV6MSPFtGf3pOnkKD0f0cWOaT5eBvDrTdL8l1AUYMo5SOaeMlwNQfJqCQ6/inpzmME0Rjv+7REsOX1BjGf3EGHBUe/ndot1b2b0F5ZvtJM0jfGFdXC2IHnvxpY6x0/54f+X3/xKtVyeRR3VitefAvITXLs5VOOQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(396003)(136003)(366004)(39860400002)(376002)(451199018)(6506007)(1076003)(6512007)(36756003)(26005)(186003)(52116002)(6486002)(478600001)(6666004)(107886003)(8936002)(5660300002)(4326008)(6916009)(66556008)(66476007)(8676002)(66946007)(38350700002)(41300700001)(38100700002)(2616005)(2906002)(86362001)(316002)(44832011)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sMEHgAtz/a+vRqkUhLW6KrxHWmkOR0AfWk4SbCe78NDUwb7irTzJbVB+ER1H?=
 =?us-ascii?Q?LKHq/lH2lo+KDaTGOA1i+RNgKnSf04Y3GTjwZCsdh1sP8AzXYy2jtrCw9UkZ?=
 =?us-ascii?Q?+BPkMQ5MFt5HG2vpFQYSHR3xhVCN429W4qn6jBjx0Chd5fLKmrd05w3TjB2l?=
 =?us-ascii?Q?5L2fKtUpyX0iXKyyuybHJdho3hQOXLiE2/qFt8sSeeznH5WISMCN++/+hqjf?=
 =?us-ascii?Q?2CrFE2GKBtr4ISOLhB6HVl7hkovexxyWHB1yQRuS6EXxOsWmQdZCVjMrhVMw?=
 =?us-ascii?Q?mvdamRAGMzmQgqEd+FCOXmn+tYBtLQK24w79OT4ac7eHouQidyZu5nnJB4Os?=
 =?us-ascii?Q?HrOrGmv5KDsrl+tmhhMCd64ySKzwIh6Ul//USCIGgnUMZ/RwqOSd1A+pzqh9?=
 =?us-ascii?Q?yZt9vLLdCz9gojqJGN3QrRfZHY5bBamaKgblCvJhvkxegL1nzIc1fE06ku7l?=
 =?us-ascii?Q?EoEOHs6NbmbK6nBy3eYGb8O+1cQUxDjUsbWrV48t57cxnID7ZBoGshtIltEf?=
 =?us-ascii?Q?4Q22BOKNP6GXm7q3kqtlQbM87FUP7eEzKTRHICOzQ3CiOK3BIFG8CsKErUjy?=
 =?us-ascii?Q?SzEfW7fSgxU3g9cchaus+W6sLNtHB65dBeEoJcIa7Ri7XxiRAfxBKmoki8/8?=
 =?us-ascii?Q?8mlDnB2WExaIQL48QmR5iHHVV+/hQ+jHaH9tVDRLWQmDhoEv/4EnM4QL2JOB?=
 =?us-ascii?Q?84VECmiJRhv1HdTxKWsA/G6QYkFRUPOZubkggdITDQPPvrogmVDPX0Nfi8AE?=
 =?us-ascii?Q?uUFS8RSscagaDu71PsN7hrftdPuUgCwD726TIuTbf21DBlJEEQXm3+QaaOex?=
 =?us-ascii?Q?Zbir8b4nwBwhdIBpGPjOzGDY+MjxNafwWQfH2qXZpgzy05TnSKw1ljV3OJ9Y?=
 =?us-ascii?Q?Eo6v15QrpOXh65/oObpFvkMnikDyMd9zSuJR6BRZKtgCGv/NVyVXvCtsNPvx?=
 =?us-ascii?Q?mf/RDSETsWqRjOZP897x6VHe/uTfW3mHLtD/25JYDu84vM6RiQkqvcYVvdl4?=
 =?us-ascii?Q?e/SCbL7qlKj78mJgL2LNY2efsdmfHMZ3wuB/qaz431BggEdRMKn6XbhQk3F6?=
 =?us-ascii?Q?j06qNfl9auNejCJJfVFJP7zF7VVwkigNeGh4G7l3YvqTMZh961hAyv9Bzs8d?=
 =?us-ascii?Q?VvoGOlEfhgyfbXPu0GkC1k3P7NLBnKPKyY+P4E+jy4SmN3VVgeHi6HUsObMM?=
 =?us-ascii?Q?IlnrSBb1DCu92osqriItXwaJuuojjkUFMxBklyNMkZ/HRWFfz3SADi1dtKer?=
 =?us-ascii?Q?pQrYMEyhkytXDw2ITjAoEr2lHEpByuSd1avL5RuY4yxyhGFrNPMRVJBJ8mLO?=
 =?us-ascii?Q?Qim8KKQ9vp/0ZJPFdqb39tEZPZpgNMXSb2DzgT8bbG1qxwzGtCkGvwnEciCN?=
 =?us-ascii?Q?rNQun4SY/yF0Mx++HmD+kikzKiTz8NgVUXRTohjWLGYnVllFXfLPLKFjX68r?=
 =?us-ascii?Q?/tQjuVH3VCpb39l1Qb5talWj0mW4zWGJQiqasTUvoUuguo8JEj2FSmur6TPn?=
 =?us-ascii?Q?XM9n/ls4h0D18L8XIZJTqcE3g3ixMWxVDvIctitPykLv54Yg13bZPa8x28MY?=
 =?us-ascii?Q?BQI8gTSrtxaz/ooBfvWTsk3FWKoVeLnjnxbGY3UDYZJt/qITwnsbhVGoRhS5?=
 =?us-ascii?Q?mA=3D=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5471f5f3-ccbe-4544-7adf-08db09b7e769
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 09:36:07.3390 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UNtIZueb5AsI9uaB5MGUEzTW0dQwpJIB0IaHo5+SU+j4nq4tfvI7IDivtoUfZWPf/MYwO3iUovzvn2UEfB2yqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR02MB8494
X-Proofpoint-GUID: CRnOK8yqqxjXvUWX9ewa-w0gQQ8RTq_P
X-Proofpoint-ORIG-GUID: CRnOK8yqqxjXvUWX9ewa-w0gQQ8RTq_P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-08_03,2023-02-08_01,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68; envelope-from=het.gala@nutanix.com;
 helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

renamed hmp_split_at_comma() --> str_split_at_comma()
Shifted helper function to qapi-util.c file. Give external linkage, as
this function will be handy in coming commit for migration.

Minor correction:
g_strsplit(str ?: "", ",", -1) --> g_strsplit(str ? str : "", ",", -1)

Suggested-by: Daniel P. Berrange <berrange@redhat.com>
Suggested-by: Manish Mishra <manish.mishra@nutanix.com>
Suggested-by: Aravind Retnakaran <aravind.retnakaran@nutanix.com>
Signed-off-by: Het Gala <het.gala@nutanix.com>
---
 include/monitor/hmp.h  |  1 -
 include/qapi/util.h    |  1 +
 monitor/hmp-cmds.c     | 19 -------------------
 net/net-hmp-cmds.c     |  2 +-
 qapi/qapi-util.c       | 19 +++++++++++++++++++
 stats/stats-hmp-cmds.c |  2 +-
 6 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index 2220f14fc9..e80848fbd0 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -19,7 +19,6 @@
 
 bool hmp_handle_error(Monitor *mon, Error *err);
 void hmp_help_cmd(Monitor *mon, const char *name);
-strList *hmp_split_at_comma(const char *str);
 
 void hmp_info_name(Monitor *mon, const QDict *qdict);
 void hmp_info_version(Monitor *mon, const QDict *qdict);
diff --git a/include/qapi/util.h b/include/qapi/util.h
index 81a2b13a33..6c8d8575e3 100644
--- a/include/qapi/util.h
+++ b/include/qapi/util.h
@@ -29,6 +29,7 @@ bool qapi_bool_parse(const char *name, const char *value, bool *obj,
                      Error **errp);
 
 int parse_qapi_name(const char *name, bool complete);
+struct strList *str_split_at_comma(const char *str);
 
 /*
  * For any GenericList @list, insert @element at the front.
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 34bd8c67d7..9665e6e0a5 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -39,25 +39,6 @@ bool hmp_handle_error(Monitor *mon, Error *err)
     return false;
 }
 
-/*
- * Split @str at comma.
- * A null @str defaults to "".
- */
-strList *hmp_split_at_comma(const char *str)
-{
-    char **split = g_strsplit(str ?: "", ",", -1);
-    strList *res = NULL;
-    strList **tail = &res;
-    int i;
-
-    for (i = 0; split[i]; i++) {
-        QAPI_LIST_APPEND(tail, split[i]);
-    }
-
-    g_free(split);
-    return res;
-}
-
 void hmp_info_name(Monitor *mon, const QDict *qdict)
 {
     NameInfo *info;
diff --git a/net/net-hmp-cmds.c b/net/net-hmp-cmds.c
index 41d326bf5f..a3c597a727 100644
--- a/net/net-hmp-cmds.c
+++ b/net/net-hmp-cmds.c
@@ -72,7 +72,7 @@ void hmp_announce_self(Monitor *mon, const QDict *qdict)
                                             migrate_announce_params());
 
     qapi_free_strList(params->interfaces);
-    params->interfaces = hmp_split_at_comma(interfaces_str);
+    params->interfaces = str_split_at_comma(interfaces_str);
     params->has_interfaces = params->interfaces != NULL;
     params->id = g_strdup(id);
     qmp_announce_self(params, NULL);
diff --git a/qapi/qapi-util.c b/qapi/qapi-util.c
index 63596e11c5..e26b9d957b 100644
--- a/qapi/qapi-util.c
+++ b/qapi/qapi-util.c
@@ -152,3 +152,22 @@ int parse_qapi_name(const char *str, bool complete)
     }
     return p - str;
 }
+
+/*
+ * Split @str at comma.
+ * A null @str defaults to "".
+ */
+strList *str_split_at_comma(const char *str)
+{
+    char **split = g_strsplit(str ? str : "", ",", -1);
+    strList *res = NULL;
+    strList **tail = &res;
+    int i;
+
+    for (i = 0; split[i]; i++) {
+        QAPI_LIST_APPEND(tail, split[i]);
+    }
+
+    g_free(split);
+    return res;
+}
diff --git a/stats/stats-hmp-cmds.c b/stats/stats-hmp-cmds.c
index 531e35d128..cfee05a076 100644
--- a/stats/stats-hmp-cmds.c
+++ b/stats/stats-hmp-cmds.c
@@ -174,7 +174,7 @@ static StatsFilter *stats_filter(StatsTarget target, const char *names,
             request->provider = provider_idx;
             if (names && !g_str_equal(names, "*")) {
                 request->has_names = true;
-                request->names = hmp_split_at_comma(names);
+                request->names = str_split_at_comma(names);
             }
             QAPI_LIST_PREPEND(request_list, request);
         }
-- 
2.22.3


