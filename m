Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7096904BE
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 11:29:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ4A1-0001AJ-DE; Thu, 09 Feb 2023 05:28:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pQ49y-00019p-1g
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 05:28:10 -0500
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pQ49u-0007zt-SU
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 05:28:09 -0500
Received: from pps.filterd (m0127842.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3198BkWL002442; Thu, 9 Feb 2023 02:28:03 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=proofpoint20171006; bh=fCEGGXwlIQHmiilvUneTH/8MMuIQUtrcL/2BVsc5n8k=;
 b=A5GB4gU0ScvKTWEj8iRAwwbKEAEluZV5dSz00zxqT3qYyH5y5+EoVoPHcnIy2QFr/B0n
 R1oZ+YWwgw2fNj/PnDFXX8SY7RGe/goYVno04A7nMZr2ckMy57PY0z2PY7j5OxNPVVFs
 88ZhOWJ8QrrKKNJ5JolmpFC6gascAllgyzGUMGfQSovIanMbnyaqv+bupCy59cFws18z
 UXm16NnPa+PEYI80L4DVh8GSIKZu6il7QO30zPt+NxqMm7NVREy+DYJ6DRUQlHgvkXCG
 YxAeLuVcfRD505xEKhVlWlxakfIMnXxJUbVIt+XLFhG6a2dtWutvBo+IEuuAZwxfRvMB fw== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3nhqjp1bye-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Feb 2023 02:28:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nkb9uCnHGLSPMWoMHTeU32vXSd+pA3NSpdRBrkk/jF2op9w4yjqgV8WpstpfwaOCVXPuMQJWMY0qUe0araC2pXPKr/NGCxhiCjNu6ig7uX1N6XpjLaOCyrrc0DPH4SInwlxrgsQ4XVRfiYKGzOBkBpe4kZypzc/Znnw0tRTbOIMHJ/IpILE9cmjlovXkhg0fYoErhNVkrdEfAA4/h3yg+aIhGV5R+126wcICO1Qrk9sOL0tOqhCKnZZcpyRNpzbmkgbzfa1ZVGXBQCFztZX/9SHsmj3PpfHwOrU2vMINdWpzH+9yWzg8dyNxY/cyL/jh2wJDdq4bg6jF17+J6y90ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fCEGGXwlIQHmiilvUneTH/8MMuIQUtrcL/2BVsc5n8k=;
 b=gCCN8uZGkjNrhlDq+blodsskkdG53cMBY9uuk1BFXf5o11AycV/VzTzO2LGi1UOhRKODoe20n2cT77+EiODMw2ue0YaoYLh3C5LpVJLypBnBBZ/uh2+mIW3ZU/6ltpKQn5mnsSVmfb2vB1yDfowGNwwHNiHKsWEIIjVGI8r9XPjdx70au4Be7B9lbss/I9K+AlgleYSHad4u3HgNlAApt1qh/pTtHNmZVoPUvq9ISxaU5SxlFLFhhNanfJ482UIaYGyM/clGBnhp1seZIiGk3ctlB0XHcMDO55NK6/peoXMyUPzuRwgiwpXYNyw1daeVd4HdH6aulZKr8fgN2bbp+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fCEGGXwlIQHmiilvUneTH/8MMuIQUtrcL/2BVsc5n8k=;
 b=WHGkYciJWv2XL16hM9e8edfVRWA3990drrJr0hWdj0VF5iapO0iFZTNmHcTtIKglLUuVnEe5Brq+dl0HW/JHeqSin7vvM2ZdinJQBXRQVqvjQk6mSyewBCduWVrsqUT5+AOVFqvN6TgOWWOMgXJedJR98ZP9xb+M6O+QFTFCckgu24nEauSd2QsCSFLnueJ4tmdBWi1J2CqDroLiwu6+ctSV9twsptZJ/iNkT71UxwVbMN4y/Iy+YlQUfoib4rc8rIVZyY9YAj/nSi3yxu4qu8E3R+HisMrtbklADgAlLJdG0fcZ+S20YumPTdHfJeEFjYX6qyiTQPaTX7o97xRfog==
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by BN0PR02MB8240.namprd02.prod.outlook.com (2603:10b6:408:157::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Thu, 9 Feb
 2023 10:28:01 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::707d:b1c1:e895:94ac]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::707d:b1c1:e895:94ac%3]) with mapi id 15.20.6064.036; Thu, 9 Feb 2023
 10:28:00 +0000
From: Het Gala <het.gala@nutanix.com>
To: qemu-devel@nongnu.org
Cc: prerna.saxena@nutanix.com, quintela@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, berrange@redhat.com, armbru@redhat.com,
 eblake@redhat.com, manish.mishra@nutanix.com,
 aravind.retnakaran@nutanix.com, Het Gala <het.gala@nutanix.com>
Subject: [PATCH v3 1/6] migration: moved hmp_split_at_commma() helper func to
 qapi-util.c file
Date: Thu,  9 Feb 2023 10:27:49 +0000
Message-Id: <20230209102754.81578-2-het.gala@nutanix.com>
X-Mailer: git-send-email 2.22.3
In-Reply-To: <20230209102754.81578-1-het.gala@nutanix.com>
References: <20230209102754.81578-1-het.gala@nutanix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0123.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::8) To BYAPR02MB4343.namprd02.prod.outlook.com
 (2603:10b6:a03:57::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR02MB4343:EE_|BN0PR02MB8240:EE_
X-MS-Office365-Filtering-Correlation-Id: 81b24e3e-6ab5-43d4-a2ef-08db0a8851b1
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9tGwaXdJcnmbMQy+yXSN+aO7tYYj08gaeAcoehAmBHyRIRTW9twPs0SW1JNo8PQsWRuPJWpMAWB1AWyq2O8U/oCpVYe2ysNsruKwuZGytp4mhsGHdW9FxNBpp3cm5R82xRO7iMWIYKthyLGxHw1oeb+gYtO+7sH/fvrggkOVlL6VCtiLV/NSv6qEhNJ1Q6xErL5e/LaG+l6aW6e8bv2Qj3thCnqpcc0zSdgtRA6k8jbtkki0IZm4a4PBV4sgI/EvCj6FQG4vetIIQ/TqiNFPAu4VsF9Lc/ph0tpvpjvid6Mku6uLstKp0FF5t4xLP0f9JcBczN7lGECxt29fo13wSVtCwS3RF6JtL8/OvsRi0UFYzG2d3FoLYX/rcXBcbuFjbaGy/P1ulfYU5gj21x+H4ZQ5VsMXZFfTUDyIbBRwsws/ql607wNwG60X3gM7C5gFyzQLPB4xGgMPzQU5+Gkfplx3ukQFpb9IDE8XCDAmv3xNcQRh+20DMWuLGnGF2s5z/qIK+qpqgbT9rmX/mFcAvi+RPvUbApgc9PWmjXgpr7hDP7/JLitD05ok5hCRj3/wpzn+y3FANTtihC6KolJcYoZPCztV3bRT1Sj4qGQ2F9bj0GrLJdRQlq36CXojiKRawEHMnecf/6MwqCx5wpEOCFndwCyUWTvDibCkASJNs3EpISI3tZ422M0NnaUUTALPSqr/gd6nsaaIh7sfWeAHww==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(39860400002)(376002)(366004)(136003)(346002)(451199018)(5660300002)(36756003)(2906002)(44832011)(83380400001)(66476007)(1076003)(38100700002)(38350700002)(2616005)(8676002)(4326008)(6916009)(66946007)(41300700001)(26005)(8936002)(6666004)(66556008)(107886003)(186003)(6512007)(6506007)(316002)(478600001)(86362001)(6486002)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1cQ0unnmYTEV/K8EaCSe2Aay0XCO1H2EoAv3PcTMYCWQT9ytETMa2Amve7ol?=
 =?us-ascii?Q?4rwtcxKAgvypQlxdd6+6FT34eni4WFKwwi5lijBkGXjcyyDrt1PSHbQdL54y?=
 =?us-ascii?Q?MzJnlZeKz85/Yjl0lG7ZdCuajZdUcPfWttnj3R+X340wWXc+iAkBGnKdGWMJ?=
 =?us-ascii?Q?goe7AjjmD1decF69WqA+mG4YVoI0clVTrBPje2UCo6sgxplo0EWDlr4fYFq8?=
 =?us-ascii?Q?HigsbACRKvFrFwFdeDjbjlQ3MCZvARQ9J9gHkbwZhtt2J3Ay8EmwuwFheB1q?=
 =?us-ascii?Q?TSqCV4lvaGAqzZO56uaw1pFHXqomh3ChURsyx7QBCjDoHtUfx4yZiO8wvrSc?=
 =?us-ascii?Q?ojDrPgKGDEyVK8jYpdG+/iIbSUb2F2WURTiOLEeONfIUGFJONUlkM9QhMgx0?=
 =?us-ascii?Q?U16nU5ovxfPZxBh7Brxp73ca32sqUIAJ8okYaLHppb0c9b/9CUqPNcW1PIAb?=
 =?us-ascii?Q?aougKWRVO5sQLEYT9psZohS09lOSR/y9dL/w4DnjWhW/WaqiQEpEsQgHbMX3?=
 =?us-ascii?Q?e1v3sPegLWlb8kQZVPZgusZ2dlnhb4ZAl49hX8xE3/vdTz6yZTLhnhuU5bTu?=
 =?us-ascii?Q?MHNN1LZUH64Uv49n65ICGFzyBw7UlooVgwoLOJfmqYkl6MjVZnsVUgy0mvs5?=
 =?us-ascii?Q?ZBDvTfoBvoLgI/wFZD1Oyinph/TbO7QVTWOZ4xraWUzKeufPplfmxatGtYPl?=
 =?us-ascii?Q?F6gFk+bZHzy0gTrYVAJSmVhMVDSLED8UeEVp9XagCi+nCP1YP2lhcNUFdBar?=
 =?us-ascii?Q?a3DNStp2ZFq11XT6wLSn3R06h5mnpmLFVH3hU08bw9/j4jpb68l57qVeTGf6?=
 =?us-ascii?Q?EkGEgUNrSjVrX1oJ9eNUDNL8CsdaGtQWh2qTwEd3LRq5dSr8YzdMq15td374?=
 =?us-ascii?Q?e3nVQqa644rtjWsIMR8dg7NlScCDFm6Zf3JKSiEm9aDfW8UF1IMCFg77ZlHx?=
 =?us-ascii?Q?WcN8nov8Eu1or577ZQ44JubO8zV+zdvAc2eU0/0Ii9MpHsCj5LNjBm/sOtA9?=
 =?us-ascii?Q?vElGWRw1kqL6+5OzEH2BxYUaH10rNhHTploHe4R57P7sLoJsoRLILZNnJsnB?=
 =?us-ascii?Q?fbKtWY1o4MkMiqq/bjaPGRLWcKNe9gtB18dHGzpl4RxeNU4+fuW+WiHyfvV1?=
 =?us-ascii?Q?AO8ja89u+fybs7u+qWutW2a3tAADNYisFiug38QM6+Njmuq8Z6kqVta7k4TF?=
 =?us-ascii?Q?Sly3x4v+AYBdJrGuilSwcpb9JxtTwVrpxEP0VeXMGMe51G0NbOYgxHATgRNR?=
 =?us-ascii?Q?6lBndiFTpIe1nxIUH9pQNW7ORs2YWTFiP19VBsdUVvCufh3oL12gFUx1eYjz?=
 =?us-ascii?Q?lbc48u20x0C2OhTNQt8G/Ih4sWvfjjpjSeSoQxnGL3uVWJ2JPiOvWB6LlmzP?=
 =?us-ascii?Q?/gxtF5T6YwKFIcvEeUw318Lg04N+ZsXjNyy9QdasZFGD0p+mR6ffGI3npqgZ?=
 =?us-ascii?Q?64jkz1EPEqPQK0/U2jAVd8kA2gqQoSEQ94Q5n+TxDMqbuKzxPhd+dG0Rodlu?=
 =?us-ascii?Q?iFQ9HRXHfpmahQb5fR2q82WG6XqLKmyp973PLi+R7QI1MxsqEIzuNZW52fF6?=
 =?us-ascii?Q?lSj2ZxqfETUH6yfukxyeHxKGOrkT0bJSjdmlsMTfQRvfmZaqUadDVgQsu8yq?=
 =?us-ascii?Q?Jw=3D=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81b24e3e-6ab5-43d4-a2ef-08db0a8851b1
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 10:28:00.7826 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K/Lqgy727DCdRpq7cR1vO6wNvC9nt2QmLhqDPrEiao2nvuEodeyx9mUy8NIQy8LGPghZd45e/qNS0/9gxgLt0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR02MB8240
X-Proofpoint-GUID: V0w3DxA8wSahoCHYDqg8bgmU7lwfIvkD
X-Proofpoint-ORIG-GUID: V0w3DxA8wSahoCHYDqg8bgmU7lwfIvkD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-09_08,2023-02-08_02,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12; envelope-from=het.gala@nutanix.com;
 helo=mx0b-002c1b01.pphosted.com
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

Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
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


