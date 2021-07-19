Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C7B3CCDF8
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 08:33:22 +0200 (CEST)
Received: from localhost ([::1]:40636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5Mq9-00068E-81
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 02:33:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1m5MlE-000438-2I
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 02:28:16 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:10432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1m5MlA-0002Fj-HK
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 02:28:15 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16J6GRg0009274; Mon, 19 Jul 2021 06:28:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=bGLK7zVgi4iGLxrUGVtYjpkeEwAsYIliWGVlWXJb0/c=;
 b=ShvpSD20egc41K1cn6djaVbb7+sETSEXXUbwB2Ce9AfuGDQY0NiOSxZ+2MUOEPrXrxhr
 FncHm34QA7e/aT1oFUoa+VetH5Vv2VZjoSbBMHcYRcKUyopcaupfXdxvjfA6rO0D8TAZ
 FKpNIUj0OrtahPy1Mn1Dhdp6rwKGmiWD0CmVS95WRrJYm7GPOpqAgptnJA4cbzlW45zd
 ZckkFQMSTZhSEQ8WsVu4V92pKamZGT0vrW7DPcN02lISZb4EMX8KOTw/m3CmPeFkRYQo
 SapPfU7HWV5kyvEcgeWdsoovFSlUvaaM+VjzU+DciFesz/d8yx99hdoVVXKZVAeXMcFp +w== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2020-01-29; bh=bGLK7zVgi4iGLxrUGVtYjpkeEwAsYIliWGVlWXJb0/c=;
 b=B6wLf1TVqKcXrY336FQWq6CCrYT8A3q/ujKd3wkCKRbK3RdG7TIyoit6+MqJgCHRKw7k
 ivcDlep7L/XrpwT6WCWtbsORivqmi5bikzus1zBJNLs8EQs40ORPsDGUsPAKn26dfKfX
 lNjgNFst9/QkrgqIBPZrXqKS/+khAjMO69hwRw7QlBOjmorEkxsXhMmRZxThtiQ1O4UL
 tz0U5/cF6sqNL8BsRPzJvONwKXgueGGVu6j2GdXZEDEKPopvsXk5lirwGjYEt9kN7If+
 9U9qXFew/Ubh8+4hgD1lYKlqPiq8q+MLfT6tFJWvRvHyTGtGSW3sfA+0s31hY0DmFWaG 5g== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 39vrn5gkjg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 06:28:10 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16J6G9T4086873;
 Mon, 19 Jul 2021 06:28:09 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
 by userp3020.oracle.com with ESMTP id 39v8ys1vt5-6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 06:28:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XXS9hagRPhEb+AEx9Cv+iGvTLky6b190HkeDrEAvGBNCECcsiRb19NWZ72yHH7GXNUeUxagJ+s+JoelcmP7wdvfA33jRzMaIaWTwjjmTTacYs1Jmigo8H0adiJpFJqx8McDCm10PYi+EMgFt22sU3S7hlzcLKi6iBY5GymOnbgXD/xTCbRUZEgDGoiibmV2mhs2RNiYfAy9G8MOoQkORHvNiw7TWNoJ53nIWxAKVHqN+HWuvrdH0YdESh6MpABeH2VemFjxvk4t7O6qprd8Cgdi12LFzvt5fIqSCjjmpH9DLKCydXFntnZpg1kx7BlWI76W9Z5wC1UxshR/VVM1vCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bGLK7zVgi4iGLxrUGVtYjpkeEwAsYIliWGVlWXJb0/c=;
 b=GTp2siHsKuxQ2bTFE12e4NmfB48y53pOkhcwaSklzi65v9jUyJ7NGLcD/d7Gq/V90S+r5Pb/w6d7U2ib2nn8SC6v5z6woknaP1p6x21quDx35MVFpGNGyKkKOWMj1IqcTWILrKr1SSbmBrU5BIvGx5bs7tcawGOPYP7KNZlkS3BBH7pQ2AnTgo8KS0aYUIq3l7DObmvBzNSZGqoN4lNRnTFke18RDFQH4MEGe/vpSkHTtFygQ9kKwYOVzbE9uZQJOLJDJbPjG0UdTLTfz59twsTf4spk1GTzSaUHRfUuvgic60KzPrdJxT3U1ZETO1aD30NP85HFoVMjc0vnSzqDSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bGLK7zVgi4iGLxrUGVtYjpkeEwAsYIliWGVlWXJb0/c=;
 b=EUS05TllzbcccYHG7RSUV2tY9OTI/1KQuDY/42lBqWDkNzMiMEkus8ZOP3Xy+PpbvyCHC8h5TYgwegCYQnCPvttdI/ibz5L1Ym6ynygQMTXh5//T5A/BlmvUo54P3CfySWIEt9svR+xPdn3faZZfIH6tJ7fJxpHRizOMKF5vMIs=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2869.namprd10.prod.outlook.com (2603:10b6:a03:85::17)
 by SJ0PR10MB4814.namprd10.prod.outlook.com (2603:10b6:a03:2d5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22; Mon, 19 Jul
 2021 06:28:06 +0000
Received: from BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::5891:a7dc:5c2b:5539]) by BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::5891:a7dc:5c2b:5539%7]) with mapi id 15.20.4331.032; Mon, 19 Jul 2021
 06:28:06 +0000
From: Elena Ufimtseva <elena.ufimtseva@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 05/19] vfio-user: connect vfio proxy to remote server
Date: Sun, 18 Jul 2021 23:27:44 -0700
Message-Id: <bb4b1f827ed639aaa7eeadc7dbd4080507c35a92.1626675354.git.elena.ufimtseva@oracle.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1626675354.git.elena.ufimtseva@oracle.com>
References: <cover.1626675354.git.elena.ufimtseva@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR16CA0022.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::35) To BYAPR10MB2869.namprd10.prod.outlook.com
 (2603:10b6:a03:85::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from nuker.hsd1.ca.comcast.net
 (2601:642:4000:a09:3c73:d99e:ec8c:2487) by
 BY5PR16CA0022.namprd16.prod.outlook.com (2603:10b6:a03:1a0::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Mon, 19 Jul 2021 06:28:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b5c082e8-823a-40c1-d873-08d94a7e5ec1
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4814:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB4814323267D720C06C29C5228CE19@SJ0PR10MB4814.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:758;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6FaddS10L8qQWoGDtEiFcpbKrIEY2IGGeaY6efaLLlkdLwJgZZTcdPOh4yvnju8Wp9H4uZx9wfrZv6/rIKIwVk+TvfwYPj6z5GsTdW7a4OPsF48fzlaFjBGd1ujCZtghHKnc+G2V+ir8Zxwo+6jtaeE4c9ge/bIJzoOG7LpODuM4xYb+L+9r1vvBX5yGhXo+JQfybM6U+9ISio/2R1ehv4ONLVVF9oPuBwTg4PzaPeUCcqezcOCcr9cUZYqOVNDiceZk4HHkdR7ammQQmvsBzvD3xGTG5Um9nW3FEh8YLWGhiYCQVNoP3P+vPh6XmdHWVw1sQusN5LdrysQGi262XZPtOWnXkYSJZ2/t0MCYBA7VIWCbNWzZ2vQXBtJhLzlXJnk8ijafdX54TNwbm4xfdZoheyTXcScSkIAAl/xtB+UgN0eB4Ve4+BQ+DpqfC4OvGJsyKbtRfirMPGPM+fjJrz3FC6z9BRr0aDRsa6U4jo5LCQvxCmkWZILSzyeUNjMnFunvR20OSCk6/s2VdJrLlK4rRuj7FUYVFmmBeHjYzaCH5vlGA3mEBOBUM4o+IACVnq/KkaxD7YEwNXsG91BFOTKRBoxFaJvq19lIy1IuMajDG19aNl63oFrsf/yIUI4SBFobRO+N5/OJbh2ADmJvnw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2869.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(39860400002)(366004)(376002)(346002)(136003)(2906002)(6486002)(5660300002)(316002)(6512007)(186003)(66476007)(44832011)(66556008)(2616005)(6506007)(38100700002)(6916009)(52116002)(6666004)(8936002)(86362001)(107886003)(8676002)(83380400001)(66946007)(478600001)(36756003)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4KHzh1bwQsIkhRlTMPb1wICtpHN+O9ivVytfM79FS52Xdz0a/bBKD3dp4zOn?=
 =?us-ascii?Q?rqcnPYiYHyjbxN3mh5XW9+J4GYRZEktOqt9QkxiljYBi+FrRYV9mZpzgzYy8?=
 =?us-ascii?Q?feYo37rtIh3myKMYLGOCJaySOyiFfmLTqJdRIEPrxticoddQMm7Zzd2U0lcn?=
 =?us-ascii?Q?jvxTLwCCiagGJ1vQbbo1z/2ctkt2ngZHPP+3HhRSIyP+yQKCO6eRjqDrS6Mf?=
 =?us-ascii?Q?cfSgqpcNtwOmq9VxN6LY3jQaqUcl+rNkjih4/Di0VKlYka8zSz7rBNHct/cm?=
 =?us-ascii?Q?c6g0Q4BP4be+uoNvftpaJdm8yunyl8aZ1XQBN6X8W+o7qYpmarh+rgHiu2af?=
 =?us-ascii?Q?vFuzxti2feikm9T/p9blzZEIkxYKF8YxjvuaVtGzcMbwgiti2la8QMAB6dZs?=
 =?us-ascii?Q?BnqmZr65WrkklDx3nE2mkk0BWkYpp3e94CZ24bBuYrcgiupfkv1sTLXAQIoF?=
 =?us-ascii?Q?yKM8zdXIOUxVgZEoNyhlhaW3/LOtPWQ6HfrFm5qnosnsJF7bMtvmpm4u7RnT?=
 =?us-ascii?Q?DetRB+CGJT78JbjGbrWlWqsIvkLa+XpHrFavcTC22MQLOxJEid+CwxPcMyUJ?=
 =?us-ascii?Q?fyelxDi/D9FvKYJsDb1WTezyHgrR51lWZe0urTj46W3PE2ZnjZ/BsPHNf89R?=
 =?us-ascii?Q?KwBlcOklFWgvO16QJ/Odnq73lUcxXoziIQWLuRDI5I55/fmsm6alvu8SIGL7?=
 =?us-ascii?Q?YsK+WRtkDBDd9mHUDL9kqoyxD50wpjZPIZRdpAwUxUNHRUoqLPCufomx+FgW?=
 =?us-ascii?Q?3dkTHbMmiEY/WOOBYr7nbI+linrTT4dM+KimfcfJvLk9HqpC7O8r+FAeZHR6?=
 =?us-ascii?Q?zwq9k1qsqQxSJx0NfX01aqHWvOfbid+wdtpls47pi332rApEiaCK8ekP9A8S?=
 =?us-ascii?Q?qHi3hbHIkuRTSGAjE825OXNAblPLY03pUkYOAFJ0hijUNN8F8t68ukrvC6IL?=
 =?us-ascii?Q?/ab3W1qRE1z3lelnR0cshdjHosmtXjDgPkfhAOh24Gu/BygjHH6PDpC+fUWY?=
 =?us-ascii?Q?75O3zH0aCIsEvunrVYamFyjdMhdJ0wVEzjb2H1nUrnFxfVUxN6LLMRXPwnfB?=
 =?us-ascii?Q?gOorK6nE4DM30RzTXOhSHb6OcK5hpr9l5V19F6QSA2QqDvp2k0CTlz2cAC2p?=
 =?us-ascii?Q?xmkBwzQ2Ex2/W24WXXTnB8a49Hy7V/YwMuGP1cbXSx3jmWqsoLMaO0+M6Ke+?=
 =?us-ascii?Q?7dRI5hjYjaBCglY5AklMlBVum8P+Jk1Wzw0hzMYeMQya1432ZgW+UB+H4x/c?=
 =?us-ascii?Q?WC1wR/yYX9gw3OTNpFk22Xx8rOLKH+2aJ7AkPe6Wn5l78O3BbiBLOhwHtAex?=
 =?us-ascii?Q?vp678R10dJLg+DUSJQqqNNc86xcOa76xBJGWDZqUbI+z7P5n4lJF01beL0gC?=
 =?us-ascii?Q?QNsBD8w9hXMsLZ/Pw5yyMGSdvxyi?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5c082e8-823a-40c1-d873-08d94a7e5ec1
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2869.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 06:28:06.6952 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +UFDUDP+6/Wxlhjs9xlL/KHc4r9Hb1WWYfZiFHULBLuk6QZ6yFSOvXuFBy66M0D1260FeiaPzw/KVUTej7jQEMGM+IHDUfhUDhppOpzX+Wo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4814
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10049
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 malwarescore=0
 adultscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107190035
X-Proofpoint-GUID: t53pNtgqMkERLcBUikxcOF9h4ak9raOp
X-Proofpoint-ORIG-GUID: t53pNtgqMkERLcBUikxcOF9h4ak9raOp
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=elena.ufimtseva@oracle.com; helo=mx0a-00069f02.pphosted.com
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, jag.raman@oracle.com,
 swapnil.ingle@nutanix.com, john.levon@nutanix.com, alex.williamson@redhat.com,
 stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John G Johnson <john.g.johnson@oracle.com>

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/vfio/user.h |  2 ++
 hw/vfio/pci.c  | 16 ++++++++++
 hw/vfio/user.c | 87 ++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 105 insertions(+)

diff --git a/hw/vfio/user.h b/hw/vfio/user.h
index cdbc074579..12106ccb6a 100644
--- a/hw/vfio/user.h
+++ b/hw/vfio/user.h
@@ -117,4 +117,6 @@ typedef struct VFIOProxy {
 
 void vfio_user_recv(void *opaque);
 void vfio_user_send_reply(VFIOProxy *proxy, char *buf, int ret);
+VFIOProxy *vfio_user_connect_dev(char *sockname, Error **errp);
+void vfio_user_disconnect(VFIOProxy *proxy);
 #endif /* VFIO_USER_H */
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 554b562769..1effdcd5c0 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -3332,16 +3332,32 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
 {
     ERRP_GUARD();
     VFIOUserPCIDevice *udev = VFIO_USER_PCI(pdev);
+    VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
+    VFIODevice *vbasedev = &vdev->vbasedev;
+    VFIOProxy *proxy;
+    Error *err = NULL;
 
     if (!udev->sock_name) {
         error_setg(errp, "No socket specified");
         error_append_hint(errp, "Use -device vfio-user-pci,socket=<name>\n");
         return;
     }
+    proxy = vfio_user_connect_dev(udev->sock_name, &err);
+    if (!proxy) {
+        error_setg(errp, "Remote proxy not found");
+        return;
+    }
+    vbasedev->proxy = proxy;
 }
 
 static void vfio_user_instance_finalize(Object *obj)
 {
+    VFIOPCIDevice *vdev = VFIO_PCI_BASE(obj);
+    VFIODevice *vbasedev = &vdev->vbasedev;
+
+    vfio_put_device(vdev);
+
+    vfio_user_disconnect(vbasedev->proxy);
 }
 
 static Property vfio_user_pci_dev_properties[] = {
diff --git a/hw/vfio/user.c b/hw/vfio/user.c
index 021d5540e0..371ee9cd8b 100644
--- a/hw/vfio/user.c
+++ b/hw/vfio/user.c
@@ -284,3 +284,90 @@ static void vfio_user_send(VFIOProxy *proxy, vfio_user_hdr_t *msg,
         qemu_mutex_lock_iothread();
     }
 }
+
+static QLIST_HEAD(, VFIOProxy) vfio_user_sockets =
+    QLIST_HEAD_INITIALIZER(vfio_user_sockets);
+
+VFIOProxy *vfio_user_connect_dev(char *sockname, Error **errp)
+{
+    VFIOProxy *proxy;
+    struct QIOChannel *ioc;
+    int sockfd;
+
+    sockfd = unix_connect(sockname, errp);
+    if (sockfd == -1) {
+        return NULL;
+    }
+
+    ioc = qio_channel_new_fd(sockfd, errp);
+    if (ioc == NULL) {
+        close(sockfd);
+        return NULL;
+    }
+    qio_channel_set_blocking(ioc, true, NULL);
+
+    proxy = g_malloc0(sizeof(VFIOProxy));
+    proxy->sockname = sockname;
+    proxy->ioc = ioc;
+    proxy->flags = VFIO_PROXY_CLIENT;
+    proxy->state = CONNECTED;
+    qemu_cond_init(&proxy->close_cv);
+
+    if (vfio_user_iothread == NULL) {
+        vfio_user_iothread = iothread_create("VFIO user", errp);
+    }
+
+    qemu_mutex_init(&proxy->lock);
+    QTAILQ_INIT(&proxy->free);
+    QTAILQ_INIT(&proxy->pending);
+    QLIST_INSERT_HEAD(&vfio_user_sockets, proxy, next);
+
+    return proxy;
+}
+
+void vfio_user_disconnect(VFIOProxy *proxy)
+{
+    VFIOUserReply *r1, *r2;
+
+    qemu_mutex_lock(&proxy->lock);
+
+    /* our side is quitting */
+    if (proxy->state == CONNECTED) {
+        vfio_user_shutdown(proxy);
+        if (!QTAILQ_EMPTY(&proxy->pending)) {
+            error_printf("vfio_user_disconnect: outstanding requests\n");
+        }
+    }
+    qio_channel_close(proxy->ioc, NULL);
+    proxy->state = CLOSING;
+
+    QTAILQ_FOREACH_SAFE(r1, &proxy->pending, next, r2) {
+        qemu_cond_destroy(&r1->cv);
+        QTAILQ_REMOVE(&proxy->pending, r1, next);
+        g_free(r1);
+    }
+    QTAILQ_FOREACH_SAFE(r1, &proxy->free, next, r2) {
+        qemu_cond_destroy(&r1->cv);
+        QTAILQ_REMOVE(&proxy->free, r1, next);
+        g_free(r1);
+    }
+
+    /* drop locks so the iothread can make progress */
+    qemu_mutex_unlock_iothread();
+    qemu_cond_wait(&proxy->close_cv, &proxy->lock);
+
+    /* we now hold the only ref to proxy */
+    qemu_mutex_unlock(&proxy->lock);
+    qemu_cond_destroy(&proxy->close_cv);
+    qemu_mutex_destroy(&proxy->lock);
+
+    qemu_mutex_lock_iothread();
+
+    QLIST_REMOVE(proxy, next);
+    if (QLIST_EMPTY(&vfio_user_sockets)) {
+        iothread_destroy(vfio_user_iothread);
+        vfio_user_iothread = NULL;
+    }
+
+    g_free(proxy);
+}
-- 
2.25.1


