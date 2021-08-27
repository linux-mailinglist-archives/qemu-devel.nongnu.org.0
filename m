Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E18FA3F9E8B
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 20:09:31 +0200 (CEST)
Received: from localhost ([::1]:37120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJgI9-0001p4-Tf
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 14:09:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mJg3S-0005uJ-Q3
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 13:54:14 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:41890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mJg3Q-0006zF-3C
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 13:54:14 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 17RGa3vV010409;
 Fri, 27 Aug 2021 17:54:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=cJtuV147Oty00gCnd0OZ+2qIeuHVTrmRmvnw/yW0uA4=;
 b=OjrImtFgBselH9B3m8IJun+1Op15U/YwGe1Y4TfT6Pon1GaYN7nK1Y3ogO8SO0EJJi77
 Ojblywx02jzPKOdMd009jkoa9ILCgwmTwibXjzOTJhe67vHtYNCfPr/3qWXLN2RJM6tj
 piktyg/myrmdKUs6zaYcQRBs8hr8pVdC8S5euIsZs3BQuUSE7f4KHPM2yC/XZ83ZV1nE
 7J6NcUJ2D/s4OaSx9f9HKSvjeTor27lz0wFwIHO/3rjvxvJXJwcp87BjSiadedrDxbVc
 C+8e5bBUhKw+N3UA3ryPgOzpE7oVpEnf1bWLwjTIV6PIyGlSOPAnQur6cuwJC5izAFyG Ug== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=cJtuV147Oty00gCnd0OZ+2qIeuHVTrmRmvnw/yW0uA4=;
 b=KuVXA+n9nI/qhBjoTo54CRARuCBFspLmZIe0KDhSJoS30vOr7JcbjsDVZHuuT8xxFahR
 976McVtmXyGhskDzOda5STJWG0Qqoq6hGyffxW4XTC+92AYdZNVvR+q+T2myvalkhSQq
 +8sPwTreo9Nt9hNNvWEmzwghuJEJ8TKLmdY5WdDSS7Edocsj2AUEKmSLnkDivYIuETE4
 gd0ni1zAH3g6E+HiNouIqVrvvPvk1Q37wuCVKTSB8RA2BSTh221QLwXQEAN30OcoVrkZ
 niqZU2mhsxgMMbBybOj9KjPRTyyucaUEu8/BlgWKw9DGmZVWSL5I1SpEiArt7U755tlU Hg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ap3eavcd6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Aug 2021 17:54:10 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17RHnseo178913;
 Fri, 27 Aug 2021 17:54:08 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
 by userp3020.oracle.com with ESMTP id 3akb92hjc0-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Aug 2021 17:54:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eTGw7IvzCzZKN0H1UezIjcn3ceg9XOUkZchbJ9FlwNRx0gdUEIh/lHGA3dGOm0B7W3LyJth6NmgTT5Dpq58YT00BVHM7kdovCljPXrtj3cWS2J2v27GEroInah0jx0vzvvuVYUls1VzF7k27ZHeiLpUajIWkW5IkMo72ZJCnWIcGM6jjF0vhKvPt/VmwhUq1mbxTuAhwaa855shtVhZgAkOeHOalvSQx0o91T8PG4T06jkgmRwpUt4dNs5HTWj411+udLPBBslUZ/NcHs3S2C2b6aygUhYSmEbHH4jV3sTGgn3au/cCku64tRw48vHuON16ZraY5vGM43cp5PSN0Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cJtuV147Oty00gCnd0OZ+2qIeuHVTrmRmvnw/yW0uA4=;
 b=mdIwBKDxsb5zL7OtVf+h86pb1aUNKpFQMCr1LI28iI1dvDq8XbXxLfe9MV5Q4kniw62U9ybg13gixe2rL7/VAOeSYbjHYCpBNv5XFKyI+upxi6NDlogHp6/Ou7Uk5+HfXht1XtXZovJ2Al8BfNpb646LlIzcWgjGmSf7QMQLM2f4/TzBMe4EdxqDYeMWeNAX5xLuaXBg0QKSg9gwcsxTRAxLx9n4d03KRHpbGA8bhnsD2UH6tkP9Dv38PTgC6OQ06geBBXTflo/A3n9ELOPGiRwhl85aWZXRVc6cr+nHkE3JyIiQkHphLY1BbeMlqPQGlZw5kD1pblopLVeAvYfXng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cJtuV147Oty00gCnd0OZ+2qIeuHVTrmRmvnw/yW0uA4=;
 b=K/pvOxisfhAYeMECsfMhKtH7HbSxdyW/3JATTDGRUsluF008+yVglQdKux/gP+lsY1SbdaACxWzgSYKg2XhCPJuyN0qZFq1MEAl1TU5mx48l9JA/y64fa4srxFuoAr+H4UfNtAoEfJDphgE6NfrepzdjwKyvZhLp2q/WDp8piNM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by BLAPR10MB4865.namprd10.prod.outlook.com (2603:10b6:208:334::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.23; Fri, 27 Aug
 2021 17:54:07 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::282e:c371:7a10:b122]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::282e:c371:7a10:b122%5]) with mapi id 15.20.4457.023; Fri, 27 Aug 2021
 17:54:07 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC server v2 10/11] vfio-user: register handlers to
 facilitate migration
Date: Fri, 27 Aug 2021 13:53:29 -0400
Message-Id: <1550222ea65ae3dc425dff236f4f36b723ab8597.1630084211.git.jag.raman@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1630084211.git.jag.raman@oracle.com>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
 <cover.1630084211.git.jag.raman@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0093.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::34) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jaraman-bur-1.us.oracle.com (209.17.40.46) by
 BYAPR11CA0093.namprd11.prod.outlook.com (2603:10b6:a03:f4::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.20 via Frontend Transport; Fri, 27 Aug 2021 17:54:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1486e02d-06cf-49d6-6dc9-08d96983aa71
X-MS-TrafficTypeDiagnostic: BLAPR10MB4865:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BLAPR10MB48658BF619E88A21EF0C85B490C89@BLAPR10MB4865.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: scdzYurNQMN1WcyM+oOXV5duqColYkCxV/uzzV2r0LMg/RJ+r68R97gDWpokS1W8FHLD6XffmVvem0Uyr952TdZdaEW0+9JTk2oVLoqgpmmPV1YqLkSQZAltpX73amKK5UM8eWtcHuEH/6cscfWGOHnoMOLyMx7kKUQVpJScW7wyzklsfjpvEc+KpxxIqbqmKSWXqMx959ee0EVRcUfMILQFuP8aWQMKruCsPLzLSgCqDUT8zlotYfTzmAiRrBP3lEOthdWq1ZwdaUs09suVKB8DS+Uk6SjGbf/wUsj2faqKtjfRrR56YjcE0qtZ2L5/nSncyUDWpSJNiIrT1mg8q9MOWk+sqQrny5MCiU0Xk2TydqXsp4CMS8/ajxPyN5lboBSD0eoIDA6KJEDhH3pj0qAMxF4qgmf4Jb7ViKrma/MatG5gUC1LQELrNRxqvqHgmv+ILxfT5iuIH0pOiRPGU0KT1TH/qa8979zmEvoLCpxTcbbgA6GkLc2qXu2aEFeM5hORtfkvXv1bGbYUb3mQ4W2gfac0FtMX+FkjsXqRwzAz6Lg/u1AuZsv0YqGYBxjLzF8jNPcWAE9IRIsTcANTJdgFQWnazDo03NDuiLHrNxRSgd0K8quGISFCm7YFE5xKHm93RLk2aoHt69w4MOVpa1xXkw0eT0UODEB7B9AUYTZnsOMuL5o4wch/rui0SMlb3Xr8MWs3DPWP5IDwPnLQYA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(39860400002)(366004)(136003)(396003)(2906002)(186003)(2616005)(8936002)(26005)(8676002)(38100700002)(36756003)(52116002)(7696005)(83380400001)(107886003)(478600001)(38350700002)(956004)(7416002)(6486002)(4326008)(6666004)(66946007)(5660300002)(66556008)(30864003)(66476007)(316002)(6916009)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cB5/ID0oIUr0CblemOLFhuBVix+QIFQfeHqyiwCqk/yhCFnA9SPyCWVOEwFg?=
 =?us-ascii?Q?iijTU8+ZB4EW42kvURtuVrRnFPwv1eIImGfdBy1qmdTtGqbpP5+bNs3yMPf8?=
 =?us-ascii?Q?+r337fERYVrowxGSFdTntLQQk18h+799MrtRJQPNISi4ZgMKucLQuX83dDgI?=
 =?us-ascii?Q?LY/Tg6muXjbRwnNWQL2pfDE4MdbDtwV2HYKL+KEbyV9GdmaGdAgtbMqVXXf+?=
 =?us-ascii?Q?0ez23ohvzU3GnsiQP6vJ5v6fXn9UufMiRlpFIvvvM4cMvFn/sHW3/Dk5l1tv?=
 =?us-ascii?Q?xdB09VcOQFa0wDrqPhjiS0Y3TMxd7bMIMxAzIIVu634kP+gS7G3eTQnHVVfm?=
 =?us-ascii?Q?RuYfLwcOBlvInWuABbPi88DyOgOExXnn53QhGxgjVlJlCwMfjuoT7eTJBjjn?=
 =?us-ascii?Q?PXjSfheUVZpq72R0T3q+bpEapMOhkXE45ouiD79n02FrVFGwh2q+XV47o1H1?=
 =?us-ascii?Q?3ZTrNNLuHZ7YxHCoD4zxuXqkvz08RYl/rwchvy3oNgLBKQMofPxHHqMoBX+v?=
 =?us-ascii?Q?f+Guzm1uN1AYx/ES3lUoDjNzF85DPEMuzFyAI+DvHYfmU3gUIuIVu42mDaOO?=
 =?us-ascii?Q?l+drXdd80CEFbatNXQzmQfuM4KQSlYeA9o7zeuwqfpVhQYf2SuS7f2zenoq/?=
 =?us-ascii?Q?bWAYoFIhxpbWaYSU2ExDC6wY5DSR04hZYMEPck+E/8z203ZGOU8vRC4TEsiK?=
 =?us-ascii?Q?eV/s0l83ZCYE3KCLL8O8yzX1KlmYgfQctiweyWqQEO0GHXyiiTvb6cDpd+Vw?=
 =?us-ascii?Q?EpMR5+tohFJobyR3lQAAi7dHehITajrv0CanYa/qlTofLE2z0A18pfsVEqom?=
 =?us-ascii?Q?fbAqevjmqcohroorlJDot3T6QYhJksmNWuoj32YXq6peiT24ihIlmNmslgIL?=
 =?us-ascii?Q?jcFJV9p1TDz9nurJmKSAJ/HRie7NW0UK0vR6G2JZiKpNj+nbFANeyZmykiUQ?=
 =?us-ascii?Q?g+x/c0jbg7DRaZ5lhkSBI8ZfAI7NnUs2jM4kSnHnQxksFXJT/GBoN/Bq/XVm?=
 =?us-ascii?Q?i41xHzoILAbUSU1zz6a8piNtrGJPR1e4wyhKeBoUX6xSagfN0HsjMYWRymZR?=
 =?us-ascii?Q?vNCWnYN3VMUu1J0V1giB4tDlppyuFFSC/SqlUdZ1KDhg9i9L0/r456JJ9N/h?=
 =?us-ascii?Q?d5h2J/q5jBydnsnjBzIalygHyqJt2W041dZbpADH4Glpon67OnXwZuzHZBPl?=
 =?us-ascii?Q?r4JWwqOE17/Z53Foaq/omdZiiGYxZk/MY5E01aHMb1FF3oTSjubgVboRqVdP?=
 =?us-ascii?Q?fZDTFqGNfN1rvifp9JS6Kn56c5acpsnVIxmNDi9X2bx6AqVD2yQLh7sxqqaQ?=
 =?us-ascii?Q?RuWuF7QgDlZhFOo8WH8F5rOd?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1486e02d-06cf-49d6-6dc9-08d96983aa71
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 17:54:07.2547 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oV/GJxLWeGgpNh9QVYBXE18dZOYghzsOOfbwbqZEwgjeVPk72EO2T9qRr4BGj2WHQVSMKrXV8vG5+aNERcJsRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4865
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10089
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0 spamscore=0
 bulkscore=0 mlxlogscore=999 malwarescore=0 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108270105
X-Proofpoint-ORIG-GUID: ejgUHTdBRW3rfwT6F144iETPYBkoI0pG
X-Proofpoint-GUID: ejgUHTdBRW3rfwT6F144iETPYBkoI0pG
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, thuth@redhat.com,
 jag.raman@oracle.com, swapnil.ingle@nutanix.com, john.levon@nutanix.com,
 philmd@redhat.com, alex.williamson@redhat.com, marcandre.lureau@gmail.com,
 stefanha@redhat.com, thanos.makatos@nutanix.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Store and load the device's state during migration. use libvfio-user's
handlers for this purpose

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 migration/savevm.h        |   2 +
 hw/remote/vfio-user-obj.c | 313 ++++++++++++++++++++++++++++++++++++++++++++++
 migration/savevm.c        |  73 +++++++++++
 3 files changed, 388 insertions(+)

diff --git a/migration/savevm.h b/migration/savevm.h
index 6461342..8007064 100644
--- a/migration/savevm.h
+++ b/migration/savevm.h
@@ -67,5 +67,7 @@ int qemu_loadvm_state_main(QEMUFile *f, MigrationIncomingState *mis);
 int qemu_load_device_state(QEMUFile *f);
 int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
         bool in_postcopy, bool inactivate_disks);
+int qemu_remote_savevm(QEMUFile *f, DeviceState *dev);
+int qemu_remote_loadvm(QEMUFile *f);
 
 #endif
diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index 92605ed..16cf515 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -45,6 +45,10 @@
 #include "hw/boards.h"
 #include "hw/remote/iohub.h"
 #include "hw/remote/machine.h"
+#include "migration/qemu-file.h"
+#include "migration/savevm.h"
+#include "migration/global_state.h"
+#include "block/block.h"
 
 #define TYPE_VFU_OBJECT "vfio-user"
 OBJECT_DECLARE_TYPE(VfuObject, VfuObjectClass, VFU_OBJECT)
@@ -72,6 +76,33 @@ struct VfuObject {
     PCIDevice *pci_dev;
 
     int vfu_poll_fd;
+
+    /*
+     * vfu_mig_buf holds the migration data. In the remote server, this
+     * buffer replaces the role of an IO channel which links the source
+     * and the destination.
+     *
+     * Whenever the client QEMU process initiates migration, the remote
+     * server gets notified via libvfio-user callbacks. The remote server
+     * sets up a QEMUFile object using this buffer as backend. The remote
+     * server passes this object to its migration subsystem, which slurps
+     * the VMSD of the device ('devid' above) referenced by this object
+     * and stores the VMSD in this buffer.
+     *
+     * The client subsequetly asks the remote server for any data that
+     * needs to be moved over to the destination via libvfio-user
+     * library's vfu_migration_callbacks_t callbacks. The remote hands
+     * over this buffer as data at this time.
+     *
+     * A reverse of this process happens at the destination.
+     */
+    uint8_t *vfu_mig_buf;
+
+    uint64_t vfu_mig_buf_size;
+
+    uint64_t vfu_mig_buf_pending;
+
+    QEMUFile *vfu_mig_file;
 };
 
 static void vfu_object_set_socket(Object *obj, const char *str, Error **errp)
@@ -96,6 +127,250 @@ static void vfu_object_set_devid(Object *obj, const char *str, Error **errp)
     trace_vfu_prop("devid", str);
 }
 
+/**
+ * Migration helper functions
+ *
+ * vfu_mig_buf_read & vfu_mig_buf_write are used by QEMU's migration
+ * subsystem - qemu_remote_loadvm & qemu_remote_savevm. loadvm/savevm
+ * call these functions via QEMUFileOps to load/save the VMSD of a
+ * device into vfu_mig_buf
+ *
+ */
+static ssize_t vfu_mig_buf_read(void *opaque, uint8_t *buf, int64_t pos,
+                                size_t size, Error **errp)
+{
+    VfuObject *o = opaque;
+
+    if (pos > o->vfu_mig_buf_size) {
+        size = 0;
+    } else if ((pos + size) > o->vfu_mig_buf_size) {
+        size = o->vfu_mig_buf_size;
+    }
+
+    memcpy(buf, (o->vfu_mig_buf + pos), size);
+
+    o->vfu_mig_buf_size -= size;
+
+    return size;
+}
+
+static ssize_t vfu_mig_buf_write(void *opaque, struct iovec *iov, int iovcnt,
+                                 int64_t pos, Error **errp)
+{
+    VfuObject *o = opaque;
+    uint64_t end = pos + iov_size(iov, iovcnt);
+    int i;
+
+    if (end > o->vfu_mig_buf_size) {
+        o->vfu_mig_buf = g_realloc(o->vfu_mig_buf, end);
+    }
+
+    for (i = 0; i < iovcnt; i++) {
+        memcpy((o->vfu_mig_buf + o->vfu_mig_buf_size), iov[i].iov_base,
+               iov[i].iov_len);
+        o->vfu_mig_buf_size += iov[i].iov_len;
+        o->vfu_mig_buf_pending += iov[i].iov_len;
+    }
+
+    return iov_size(iov, iovcnt);
+}
+
+static int vfu_mig_buf_shutdown(void *opaque, bool rd, bool wr, Error **errp)
+{
+    VfuObject *o = opaque;
+
+    o->vfu_mig_buf_size = 0;
+
+    g_free(o->vfu_mig_buf);
+
+    return 0;
+}
+
+static const QEMUFileOps vfu_mig_fops_save = {
+    .writev_buffer  = vfu_mig_buf_write,
+    .shut_down      = vfu_mig_buf_shutdown,
+};
+
+static const QEMUFileOps vfu_mig_fops_load = {
+    .get_buffer     = vfu_mig_buf_read,
+    .shut_down      = vfu_mig_buf_shutdown,
+};
+
+/**
+ * handlers for vfu_migration_callbacks_t
+ *
+ * The libvfio-user library accesses these handlers to drive the migration
+ * at the remote end, and also to transport the data stored in vfu_mig_buf
+ *
+ */
+static void vfu_mig_state_precopy(vfu_ctx_t *vfu_ctx)
+{
+    VfuObject *o = vfu_get_private(vfu_ctx);
+    int ret;
+
+    if (!o->vfu_mig_file) {
+        o->vfu_mig_file = qemu_fopen_ops(o, &vfu_mig_fops_save, false);
+    }
+
+    ret = qemu_remote_savevm(o->vfu_mig_file, DEVICE(o->pci_dev));
+    if (ret) {
+        qemu_file_shutdown(o->vfu_mig_file);
+        return;
+    }
+
+    qemu_fflush(o->vfu_mig_file);
+}
+
+static void vfu_mig_state_running(vfu_ctx_t *vfu_ctx)
+{
+    VfuObject *o = vfu_get_private(vfu_ctx);
+    VfuObjectClass *k = VFU_OBJECT_GET_CLASS(OBJECT(o));
+    static int migrated_devs;
+    Error *local_err = NULL;
+    int ret;
+
+    ret = qemu_remote_loadvm(o->vfu_mig_file);
+    if (ret) {
+        error_setg(&error_abort, "vfu: failed to restore device state");
+        return;
+    }
+
+    if (++migrated_devs == k->nr_devs) {
+        bdrv_invalidate_cache_all(&local_err);
+        if (local_err) {
+            error_report_err(local_err);
+            return;
+        }
+
+        vm_start();
+    }
+}
+
+static void vfu_mig_state_stop(vfu_ctx_t *vfu_ctx)
+{
+    VfuObject *o = vfu_get_private(vfu_ctx);
+    VfuObjectClass *k = VFU_OBJECT_GET_CLASS(OBJECT(o));
+    static int migrated_devs;
+
+    /**
+     * note: calling bdrv_inactivate_all() is not the best approach.
+     *
+     *  Ideally, we would identify the block devices (if any) indirectly
+     *  linked (such as via a scs-hd device) to each of the migrated devices,
+     *  and inactivate them individually. This is essential while operating
+     *  the server in a storage daemon mode, with devices from different VMs.
+     *
+     *  However, we currently don't have this capability. As such, we need to
+     *  inactivate all devices at the same time when migration is completed.
+     */
+    if (++migrated_devs == k->nr_devs) {
+        bdrv_inactivate_all();
+    }
+}
+
+static int vfu_mig_transition(vfu_ctx_t *vfu_ctx, vfu_migr_state_t state)
+{
+    switch (state) {
+    case VFU_MIGR_STATE_RESUME:
+    case VFU_MIGR_STATE_STOP_AND_COPY:
+        break;
+    case VFU_MIGR_STATE_STOP:
+        vfu_mig_state_stop(vfu_ctx);
+        break;
+    case VFU_MIGR_STATE_PRE_COPY:
+        vfu_mig_state_precopy(vfu_ctx);
+        break;
+    case VFU_MIGR_STATE_RUNNING:
+        if (!runstate_is_running()) {
+            vfu_mig_state_running(vfu_ctx);
+        }
+        break;
+    default:
+        warn_report("vfu: Unknown migration state %d", state);
+    }
+
+    return 0;
+}
+
+static uint64_t vfu_mig_get_pending_bytes(vfu_ctx_t *vfu_ctx)
+{
+    VfuObject *o = vfu_get_private(vfu_ctx);
+
+    return o->vfu_mig_buf_pending;
+}
+
+static int vfu_mig_prepare_data(vfu_ctx_t *vfu_ctx, uint64_t *offset,
+                                uint64_t *size)
+{
+    VfuObject *o = vfu_get_private(vfu_ctx);
+
+    if (offset) {
+        *offset = 0;
+    }
+
+    if (size) {
+        *size = o->vfu_mig_buf_size;
+    }
+
+    return 0;
+}
+
+static ssize_t vfu_mig_read_data(vfu_ctx_t *vfu_ctx, void *buf,
+                                 uint64_t size, uint64_t offset)
+{
+    VfuObject *o = vfu_get_private(vfu_ctx);
+
+    if (offset > o->vfu_mig_buf_size) {
+        return -1;
+    }
+
+    if ((offset + size) > o->vfu_mig_buf_size) {
+        warn_report("vfu: buffer overflow - check pending_bytes");
+        size = o->vfu_mig_buf_size - offset;
+    }
+
+    memcpy(buf, (o->vfu_mig_buf + offset), size);
+
+    o->vfu_mig_buf_pending -= size;
+
+    return size;
+}
+
+static ssize_t vfu_mig_write_data(vfu_ctx_t *vfu_ctx, void *data,
+                                  uint64_t size, uint64_t offset)
+{
+    VfuObject *o = vfu_get_private(vfu_ctx);
+    uint64_t end = offset + size;
+
+    if (end > o->vfu_mig_buf_size) {
+        o->vfu_mig_buf = g_realloc(o->vfu_mig_buf, end);
+        o->vfu_mig_buf_size = end;
+    }
+
+    memcpy((o->vfu_mig_buf + offset), data, size);
+
+    if (!o->vfu_mig_file) {
+        o->vfu_mig_file = qemu_fopen_ops(o, &vfu_mig_fops_load, false);
+    }
+
+    return size;
+}
+
+static int vfu_mig_data_written(vfu_ctx_t *vfu_ctx, uint64_t count)
+{
+    return 0;
+}
+
+static const vfu_migration_callbacks_t vfu_mig_cbs = {
+    .version = VFU_MIGR_CALLBACKS_VERS,
+    .transition = &vfu_mig_transition,
+    .get_pending_bytes = &vfu_mig_get_pending_bytes,
+    .prepare_data = &vfu_mig_prepare_data,
+    .read_data = &vfu_mig_read_data,
+    .data_written = &vfu_mig_data_written,
+    .write_data = &vfu_mig_write_data,
+};
+
 static void vfu_object_ctx_run(void *opaque)
 {
     VfuObject *o = opaque;
@@ -340,6 +615,7 @@ static void vfu_object_machine_done(Notifier *notifier, void *data)
 {
     VfuObject *o = container_of(notifier, VfuObject, machine_done);
     DeviceState *dev = NULL;
+    size_t migr_area_size;
     QemuThread thread;
     int ret;
 
@@ -401,6 +677,35 @@ static void vfu_object_machine_done(Notifier *notifier, void *data)
         return;
     }
 
+    /*
+     * TODO: The 0x20000 number used below is a temporary. We are working on
+     *     a cleaner fix for this.
+     *
+     *     The libvfio-user library assumes that the remote knows the size of
+     *     the data to be migrated at boot time, but that is not the case with
+     *     VMSDs, as it can contain a variable-size buffer. 0x20000 is used
+     *     as a sufficiently large buffer to demonstrate migration, but that
+     *     cannot be used as a solution.
+     *
+     */
+    ret = vfu_setup_region(o->vfu_ctx, VFU_PCI_DEV_MIGR_REGION_IDX,
+                           0x20000, NULL,
+                           VFU_REGION_FLAG_RW, NULL, 0, -1, 0);
+    if (ret < 0) {
+        error_setg(&error_abort, "vfu: Failed to register migration BAR %s- %s",
+                   o->devid, strerror(errno));
+        return;
+    }
+
+    migr_area_size = vfu_get_migr_register_area_size();
+    ret = vfu_setup_device_migration_callbacks(o->vfu_ctx, &vfu_mig_cbs,
+                                               migr_area_size);
+    if (ret < 0) {
+        error_setg(&error_abort, "vfu: Failed to setup migration %s- %s",
+                   o->devid, strerror(errno));
+        return;
+    }
+
     ret = vfu_realize_ctx(o->vfu_ctx);
     if (ret < 0) {
         error_setg(&error_abort, "vfu: Failed to realize device %s- %s",
@@ -435,6 +740,14 @@ static void vfu_object_init(Object *obj)
     qemu_add_machine_init_done_notifier(&o->machine_done);
 
     o->vfu_poll_fd = -1;
+
+    o->vfu_mig_file = NULL;
+
+    o->vfu_mig_buf = NULL;
+
+    o->vfu_mig_buf_size = 0;
+
+    o->vfu_mig_buf_pending = 0;
 }
 
 static void vfu_object_finalize(Object *obj)
diff --git a/migration/savevm.c b/migration/savevm.c
index 7b7b64b..341fde7 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1604,6 +1604,49 @@ static int qemu_savevm_state(QEMUFile *f, Error **errp)
     return ret;
 }
 
+static SaveStateEntry *find_se_from_dev(DeviceState *dev)
+{
+    SaveStateEntry *se;
+
+    QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
+        if (se->opaque == dev) {
+            return se;
+        }
+    }
+
+    return NULL;
+}
+
+int qemu_remote_savevm(QEMUFile *f, DeviceState *dev)
+{
+    SaveStateEntry *se;
+    int ret = 0;
+
+    se = find_se_from_dev(dev);
+    if (!se) {
+        return -ENODEV;
+    }
+
+    if (!se->vmsd || !vmstate_save_needed(se->vmsd, se->opaque)) {
+        return ret;
+    }
+
+    save_section_header(f, se, QEMU_VM_SECTION_FULL);
+
+    ret = vmstate_save(f, se, NULL);
+    if (ret) {
+        qemu_file_set_error(f, ret);
+        return ret;
+    }
+
+    save_section_footer(f, se);
+
+    qemu_put_byte(f, QEMU_VM_EOF);
+    qemu_fflush(f);
+
+    return 0;
+}
+
 void qemu_savevm_live_state(QEMUFile *f)
 {
     /* save QEMU_VM_SECTION_END section */
@@ -2444,6 +2487,36 @@ qemu_loadvm_section_start_full(QEMUFile *f, MigrationIncomingState *mis)
     return 0;
 }
 
+int qemu_remote_loadvm(QEMUFile *f)
+{
+    uint8_t section_type;
+    int ret = 0;
+
+    while (true) {
+        section_type = qemu_get_byte(f);
+
+        ret = qemu_file_get_error(f);
+        if (ret) {
+            break;
+        }
+
+        switch (section_type) {
+        case QEMU_VM_SECTION_FULL:
+            ret = qemu_loadvm_section_start_full(f, NULL);
+            if (ret < 0) {
+                break;
+            }
+            break;
+        case QEMU_VM_EOF:
+            return ret;
+        default:
+            return -EINVAL;
+        }
+    }
+
+    return ret;
+}
+
 static int
 qemu_loadvm_section_part_end(QEMUFile *f, MigrationIncomingState *mis)
 {
-- 
1.8.3.1


