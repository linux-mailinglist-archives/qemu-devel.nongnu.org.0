Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C21F34A129
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 06:52:06 +0100 (CET)
Received: from localhost ([::1]:36476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPfO9-0002Dz-6k
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 01:52:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1lPfHt-0003Zt-7f; Fri, 26 Mar 2021 01:45:37 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:47100)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1lPfHf-00045U-1R; Fri, 26 Mar 2021 01:45:36 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12Q5hwbD195112;
 Fri, 26 Mar 2021 05:45:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=imsKgCj1Dwu8nUrJWQbZD7znxPHHyeEE0O+O1bABRoA=;
 b=VPbrGOu7gLULxjwvjUY78ggWTjquxKj1kil0T2HZGOub0Tm9lnaNhyw2hGXmwjgglaAo
 W5TZABdoqHciddq+P04pVcuMB/LR7pnmUUrcHFMH9jQwH/7aHobGI2QtVagwRY0+cnF5
 X6SXJpyB6qedVnKHu78yEU4V22r5NXZYlt977NBkBsjEpvGO0E3RZzgRP7NAIeTfSxZe
 zo6L+PC7YMSSIcPsmBsJC8/ja/1ioLU77b4HqArH1VhEQlKVSou63bbvcyIMNh7dnHqL
 MEJPCYpBHr3ozxKUGqMMWs82CAhGAi3rtkrAm4ZpSOrnm0WpWMKrPhRIQYCnkU3GUpRJ RA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 37h1420vyg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Mar 2021 05:45:06 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12Q5aJeY140931;
 Fri, 26 Mar 2021 05:45:05 GMT
Received: from nam02-bl2-obe.outbound.protection.outlook.com
 (mail-bl2nam02lp2052.outbound.protection.outlook.com [104.47.38.52])
 by userp3020.oracle.com with ESMTP id 37h14grkca-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Mar 2021 05:45:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gti4G16ybyqs3tu1bUD6p/KOfv0k7shsHOo5F5zdMkva+Pj92iRWXzyCxffe93MQaPhm3Fa9e9rafjYn1vhLB35JsG41ikZ5mkRLNsWkMG3t57UMOLe/RHmCod/O6cJUSpF5cUxcsH2WEr+tNo3xDqI7LkcKSIqENossnvBWTa2SAKX6w8EcKBiwMaW1bxYRdqoJLs6aoh6ua3otMLa+ntZL6jfOM/0Pwz7i3JArAIWJs5LujwNCZpDbBWDVtafhw+Rh+5ENAlxQzVngws/A8PDnT3GUNC8De6O1RrZM3BW9+z+Jc0JgS9ZIcB7ZFOteumAhEVZOfX8LJEEfoN7KLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=imsKgCj1Dwu8nUrJWQbZD7znxPHHyeEE0O+O1bABRoA=;
 b=R9bqWCZITARhCGTUAk8b3cwV7QEZsGgo9MYJX3Ps9+RnhUxpldRhhasbRhL+ESGYUN/lUYpGe3ji9cz1pvRVqrSI5fkvKW90L5K4GArGZrELdlGxPyO0ItzQOshGlp+QfxApI6vCB11TxsGY2PrP6n7kvjwIW7SMqd++BYAmKpmxJr/9T+xEFMG7N55vbv0KaQh3mlSCOHna0F+G2DrLTp9YlkiZp7WwvnHof1F4m64S+tGe1LflwKiiHzh530S4nQ3gssClxkD76KUnCk1erewqnX07VGoonWkXlfrPJ5mm1wgNqCJhaq64ldHyxeY2lmLehpn9/HHTbyXfzmB3VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=imsKgCj1Dwu8nUrJWQbZD7znxPHHyeEE0O+O1bABRoA=;
 b=cNlcDjlt+IMTOpXoKSALficSlJYnf4N09wjYO2nNZ86azRkdT6eZOdaa0RKBeTAy/ZVvi6BxjnskcEoOgTo9Y3qlVomFJKBqFSyDiXdszg4iAFjACWaVTAEBG4NFjX+1ID3+JH/7beyDg+ADDA07vUTJPubhzRYWTBKfVpIXf+M=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from DM6PR10MB2668.namprd10.prod.outlook.com (2603:10b6:5:b2::25) by
 DM6PR10MB3068.namprd10.prod.outlook.com (2603:10b6:5:6a::33) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.26; Fri, 26 Mar 2021 05:45:03 +0000
Received: from DM6PR10MB2668.namprd10.prod.outlook.com
 ([fe80::9d2c:340:5b24:bff7]) by DM6PR10MB2668.namprd10.prod.outlook.com
 ([fe80::9d2c:340:5b24:bff7%6]) with mapi id 15.20.3846.054; Fri, 26 Mar 2021
 05:45:03 +0000
From: Dongli Zhang <dongli.zhang@oracle.com>
To: qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 1/6] qdev: introduce qapi/hmp command for kick/call event
Date: Thu, 25 Mar 2021 22:44:28 -0700
Message-Id: <20210326054433.11762-2-dongli.zhang@oracle.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210326054433.11762-1-dongli.zhang@oracle.com>
References: <20210326054433.11762-1-dongli.zhang@oracle.com>
Content-Type: text/plain
X-Originating-IP: [138.3.200.16]
X-ClientProxiedBy: BYAPR02CA0053.namprd02.prod.outlook.com
 (2603:10b6:a03:54::30) To DM6PR10MB2668.namprd10.prod.outlook.com
 (2603:10b6:5:b2::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (138.3.200.16) by
 BYAPR02CA0053.namprd02.prod.outlook.com (2603:10b6:a03:54::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.25 via Frontend Transport; Fri, 26 Mar 2021 05:45:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fdb8a088-6ff8-4945-dee2-08d8f01a4d66
X-MS-TrafficTypeDiagnostic: DM6PR10MB3068:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR10MB306854967BE6429A0FE29308F0619@DM6PR10MB3068.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:107;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7bFo/+7q6VquMF8jlcwR/TKCHlYFQzDak4Mn+eN+XtSjvVzMdcHQVUStqsCChmhq9LtsRmKGueImH3/pSNjRF9yInkrh8pYc34u5JvCYILOTRSxyQd7/mcRcPhWWkSFYx+02rZZM2KZpkV7FQ8w5ZS6psQVeGAAqw903wumrSevMMbCnFFV+CxHcuVc2I44trTLV0wMxLlGgodSoP9YqY7avykGuFYcKmD04aPCLYliyfNpzhkworl6SetK37tFLuW1dvYQCYzYuUePv1NrkYBR75E4RUl4zX9pF7/0DApV40NJdo3Vijbkuf3RDPyE+AmORF1+kEAVCI5KP265uUsC62aw6TJo6Fv9IJH81bW35kIW2Ioh4pVyOVfyv0O12vDaADfVs0vrOP8hblhSSJgTP6yuJW9GCeXJ78kEWmAi2byHlFaKdDF/mpxoLoXa8onkOCPimGTADxAxwIl6Sokjs/ibz20CMeax/3KJ/krUtNMY7iSjUzD8Daz9s24+BucYxjb4w3W9FiPtx93/IUQnygqYSjKqpatsQQv5uOQyZnJxis0RUAbGs/SY5Q1y0qdvZANJPKN35Sw3DsQqF1gp8Fe3+TJ/gFUtCgNSSf3o4x0rKWvkyviu9QCLzAXjTD667JIaotQCBbkDbymjdXWltMoSQLsllxLaNKbOXoDzXo4G9L+tkhUtpg47NBqX5Sb0+t6q0r6e7tYWWmjhXvlQq6nxQBY7BphV9ncmcjbG+SMkFgELgBlOF/eyb9iBIOpWUYTmHnZ9tAdjh7cT7wA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB2668.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(39860400002)(376002)(366004)(396003)(346002)(26005)(8936002)(956004)(8676002)(36756003)(44832011)(6666004)(16526019)(2616005)(83380400001)(7416002)(6506007)(186003)(6486002)(966005)(478600001)(5660300002)(52116002)(69590400012)(66556008)(38100700001)(1076003)(4326008)(66476007)(6512007)(66946007)(316002)(107886003)(86362001)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?H7VV3wjJgPvn2p/TnxaEZaIOXzrq1oPNoAvWBlQUPOEoU36okWZeWUBtEKN7?=
 =?us-ascii?Q?KaI8cQ2r4tc1WZDpHUXBc5KVAzb42FufW+iU8ll5fW9MZKoIL6Oum0I/cJOZ?=
 =?us-ascii?Q?4vBGw2I6+abx64Y9uDBW4JvU6zJS7sAxJ3oe7Jr7MDodn94bd5O06ponWZIk?=
 =?us-ascii?Q?TNFQm530xIViwkue44Z3viaLUqsLHiPhVg6McFS/vXhjoOj0XtFpdw+ytE3J?=
 =?us-ascii?Q?zkRzkfH26jkHxYznqA48IBgnuQRugSyjKgL1n8yBls/bWFZ8vjZqPpfKQLU3?=
 =?us-ascii?Q?EZ9r1Uvud/ZTwdwoxbKDrGneYKhee/acfW5n0V2dqkc2PoXmmat5i4ntAAZ+?=
 =?us-ascii?Q?CVxqTqT66nmYDZBC+HkmZnmMw6wdnAdmvMLpVks4SgnS0rV49GK4yKCuThOq?=
 =?us-ascii?Q?4najoZu5dhuWMpsdZN7x7oF5Iwvq6rTmDsl2T/c3RtgVbdFruStYwe4SByH5?=
 =?us-ascii?Q?g2YdkxudrH1i1v1DzaUWDK3xQP93Xw7YwKa1HVDMBvTTfoT9sSgfVPYlZsCc?=
 =?us-ascii?Q?rV+VOoHvsGleUUzNDSA9tJiLwQD1l1dP8ZLtHUjoMmlMRO8bR0qzxzpn0m48?=
 =?us-ascii?Q?bWjcmIR8g+VjL44LvAOeNfFFxIwtyzDXqragiWCW7q9cDBLZDQ9dpQzZf48J?=
 =?us-ascii?Q?iicoXYZIM0T2Z7LK6gR+aMEhuRtTwG1mDAPZZrf5CAMuI741G45f526yisQ5?=
 =?us-ascii?Q?dOfJ6dTiGw7RvPNyXXtzQgK89PPqWynBp1LYMsjiRZpGDZP59QMsbwL7zbb7?=
 =?us-ascii?Q?U78te6flzHEuRK8geEWxxCtDaV7/MYS+FUBFImYjoDkMaiTDADNVj9Lyp88T?=
 =?us-ascii?Q?UnXG6AQtRhco1E48460vCRLXLou9e6pT4Sfay9Dpkljh4+EJOD41xE1f6a8Y?=
 =?us-ascii?Q?29mgO3EwPf6wJDKrN+vO5/yAYAvKLsEkERN9MSZ+2scDDoruwJ2BGCNDxrfl?=
 =?us-ascii?Q?9dv3O07GUOWxbnyaKh+py+9RYxw/lNnI9g1+ATWeWb6xHFLYf/4XoCCswfbu?=
 =?us-ascii?Q?gaTneebKldlJIzKievK6S2E63EqnO8zoqH6m+VU5DwjerramCMEt19XPFXct?=
 =?us-ascii?Q?bEYzvhQlHQf7JHGIxKaOdrbRYcpp6V6GMbPqH/v2lEYMnLZib94xr9SRrK8S?=
 =?us-ascii?Q?WXHWt4Db/LRM/EWwmp1qKPv9DxNqZQAHMY3xgLfIfzF30huf8kOD9IOjgUzF?=
 =?us-ascii?Q?fNYtOq52NM5WHQXYhxXb6cbS+2TWN7h55pj1yjvq2PZ1fFehtuKJSHIFvKOJ?=
 =?us-ascii?Q?DdFWsagYWgDeXMBdsvR7sYuiQX8bne+kS1KvOyHUS5+WEhH2/90qPYoEoT6J?=
 =?us-ascii?Q?sZYXZbuF56S9y7ExOGWdlXuM?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdb8a088-6ff8-4945-dee2-08d8f01a4d66
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB2668.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2021 05:45:03.3857 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RKxpaJt9an+1xxNhzsvqEaXe9YCcC8FuPjCm/cZX/Qes6+/n3wYusi1wxsdCHPKlKEVVTo/GZ54kA7+OI2ZSpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3068
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9934
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 bulkscore=0 spamscore=0
 phishscore=0 adultscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103250000
 definitions=main-2103260040
X-Proofpoint-GUID: 2_9xCqXqXIu0JHRgjFsCXlv9YVbBUW1P
X-Proofpoint-ORIG-GUID: 2_9xCqXqXIu0JHRgjFsCXlv9YVbBUW1P
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9934
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 mlxscore=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0 adultscore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103250000
 definitions=main-2103260041
Received-SPF: pass client-ip=141.146.126.78;
 envelope-from=dongli.zhang@oracle.com; helo=aserp2120.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, fam@euphon.net, berrange@redhat.com, ehabkost@redhat.com,
 mst@redhat.com, jasowang@redhat.com, joe.jin@oracle.com, armbru@redhat.com,
 dgilbert@redhat.com, stefanha@redhat.com, pbonzini@redhat.com,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The virtio device/driver (e.g., vhost-scsi or vhost-net) may hang due to
the loss of doorbell kick, e.g.,

https://lists.gnu.org/archive/html/qemu-devel/2018-12/msg01711.html

... or due to the loss of IRQ, e.g., as fixed by linux kernel commit
fe200ae48ef5 ("genirq: Mark polled irqs and defer the real handler").

This patch introduces a new debug interface 'DeviceEvent' to DeviceClass
to help narrow down if the issue is due to loss of irq/kick. So far the new
interface handles only two events: 'call' and 'kick'. Any device (e.g.,
virtio/vhost or VFIO) may implement the interface (e.g., via eventfd, MSI-X
or legacy IRQ).

The 'call' is to inject irq on purpose by admin for a specific device (e.g.,
vhost-scsi) from QEMU/host to VM, while the 'kick' is to kick the doorbell
on purpose by admin at QEMU/host side for a specific device.

Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
---
 hmp-commands.hx        | 14 +++++++++++
 include/hw/qdev-core.h |  9 +++++++
 include/monitor/hmp.h  |  1 +
 qapi/qdev.json         | 30 ++++++++++++++++++++++
 softmmu/qdev-monitor.c | 56 ++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 110 insertions(+)

diff --git a/hmp-commands.hx b/hmp-commands.hx
index 435c591a1c..d74b895fff 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -1725,3 +1725,17 @@ ERST
         .flags      = "p",
     },
 
+    {
+        .name       = "x-debug-device-event",
+        .args_type  = "dev:s,event:s,queue:l",
+        .params     = "dev event queue",
+        .help       = "generate device event for a specific device queue",
+        .cmd        = hmp_x_debug_device_event,
+        .flags      = "p",
+    },
+
+SRST
+``x-debug-device-event`` *dev* *event* *queue*
+  Generate device event *event* for specific *queue* of *dev*
+ERST
+
diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index bafc311bfa..1ea8bf23b9 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -29,9 +29,17 @@ typedef enum DeviceCategory {
     DEVICE_CATEGORY_MAX
 } DeviceCategory;
 
+enum {
+    DEVICE_EVENT_CALL,
+    DEVICE_EVENT_KICK,
+    DEVICE_EVENT_MAX
+};
+
 typedef void (*DeviceRealize)(DeviceState *dev, Error **errp);
 typedef void (*DeviceUnrealize)(DeviceState *dev);
 typedef void (*DeviceReset)(DeviceState *dev);
+typedef void (*DeviceEvent)(DeviceState *dev, int event, int queue,
+                            Error **errp);
 typedef void (*BusRealize)(BusState *bus, Error **errp);
 typedef void (*BusUnrealize)(BusState *bus);
 
@@ -132,6 +140,7 @@ struct DeviceClass {
     DeviceReset reset;
     DeviceRealize realize;
     DeviceUnrealize unrealize;
+    DeviceEvent event;
 
     /* device state */
     const VMStateDescription *vmsd;
diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index 605d57287a..c7795d4ba5 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -129,5 +129,6 @@ void hmp_info_replay(Monitor *mon, const QDict *qdict);
 void hmp_replay_break(Monitor *mon, const QDict *qdict);
 void hmp_replay_delete_break(Monitor *mon, const QDict *qdict);
 void hmp_replay_seek(Monitor *mon, const QDict *qdict);
+void hmp_x_debug_device_event(Monitor *mon, const QDict *qdict);
 
 #endif
diff --git a/qapi/qdev.json b/qapi/qdev.json
index b83178220b..711c4a297a 100644
--- a/qapi/qdev.json
+++ b/qapi/qdev.json
@@ -124,3 +124,33 @@
 ##
 { 'event': 'DEVICE_DELETED',
   'data': { '*device': 'str', 'path': 'str' } }
+
+##
+# @x-debug-device-event:
+#
+# Generate device event for a specific device queue
+#
+# @dev: device path
+#
+# @event: event (e.g., kick or call) to trigger
+#
+# @queue: queue id
+#
+# Returns: Nothing on success
+#
+# Since: 6.1
+#
+# Notes: This is used to debug VM driver hang issue. The 'kick' event is to
+#        send notification to QEMU/vhost while the 'call' event is to
+#        interrupt VM on purpose.
+#
+# Example:
+#
+# -> { "execute": "x-debug-device_event",
+#      "arguments": { "dev": "/machine/peripheral/vscsi0", "event": "kick",
+#                     "queue": 1 } }
+# <- { "return": {} }
+#
+##
+{ 'command': 'x-debug-device-event',
+  'data': {'dev': 'str', 'event': 'str', 'queue': 'int'} }
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index a9955b97a0..bca53111fb 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -924,6 +924,62 @@ void hmp_device_del(Monitor *mon, const QDict *qdict)
     hmp_handle_error(mon, err);
 }
 
+static const char * const device_events[DEVICE_EVENT_MAX] = {
+    [DEVICE_EVENT_KICK] = "kick",
+    [DEVICE_EVENT_CALL] = "call"
+};
+
+static int get_device_event(const char *event)
+{
+    int evt;
+
+    for (evt = 0; evt < ARRAY_SIZE(device_events); evt++) {
+        if (!strcmp(device_events[evt], event)) {
+            return evt;
+        }
+    }
+
+    return -ENOENT;
+}
+
+void qmp_x_debug_device_event(const char *dev, const char *event,
+                              int64_t queue, Error **errp)
+{
+    DeviceState *device = find_device_state(dev, NULL);
+    DeviceClass *dc;
+    int evt;
+
+    if (!device) {
+        error_setg(errp, "Device %s not found", dev);
+        return;
+    }
+
+    dc = DEVICE_GET_CLASS(device);
+    if (!dc->event) {
+        error_setg(errp, "device_event is not supported");
+        return;
+    }
+
+    evt = get_device_event(event);
+    if (evt < 0) {
+        error_setg(errp, "Unsupported event %s", event);
+        return;
+    }
+
+    dc->event(device, evt, queue, errp);
+}
+
+void hmp_x_debug_device_event(Monitor *mon, const QDict *qdict)
+{
+    const char *dev = qdict_get_str(qdict, "dev");
+    const char *event = qdict_get_str(qdict, "event");
+    int queue = qdict_get_try_int(qdict, "queue", -1);
+    Error *err = NULL;
+
+    qmp_x_debug_device_event(dev, event, queue, &err);
+    hmp_handle_error(mon, err);
+}
+
 BlockBackend *blk_by_qdev_id(const char *id, Error **errp)
 {
     DeviceState *dev;
-- 
2.17.1


