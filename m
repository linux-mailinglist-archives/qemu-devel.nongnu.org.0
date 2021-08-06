Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3883E31C0
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 00:27:50 +0200 (CEST)
Received: from localhost ([::1]:42018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC8Jg-0000yp-GD
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 18:27:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1mC864-00089P-CX
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 18:13:44 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:56974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1mC862-0004OY-LN
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 18:13:44 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 176MBPFi029961; Fri, 6 Aug 2021 22:13:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=biDqY0Q/Fv1zFLC8JgiEyiyUXIcCxUjJwR37bRrNLDM=;
 b=W1yWvVaG5Xglt2nZtOG/f3Gc5Kg2BvnYwWH7KtYFSOh6j3q+aGGtd7i7RIwx9TlT5CFP
 O9p1crsyyEt1xx6PKi5r+Aja1PxRQKFNHUHmJZkrqJVVs3AoQQCotiglZwWFeSU48366
 UcEHZH8W8c1j84KYbh4pIZcQpmXHK0c2eW5QvnCL6qvIhbo8i7BAqtjcyR6iHyyLUw7V
 AW4QutYdkT0PELWToDrG+a0StKg/Vwe3SDes1lEOaxg/lyL7G/ypIjeLZdOhSfLxiClv
 cAL47oHNaRcAetWv5GfF2bvuzkSCSSidpU9TT0nhkeCfhieEQjDbRp6VXyiaPmvuSf92 lA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=biDqY0Q/Fv1zFLC8JgiEyiyUXIcCxUjJwR37bRrNLDM=;
 b=fMU4G8vpaR+Fj8piYIwu2ffSJTiTH6Atu4OOLUPGlVaOoL1aaz+1DiMxYCntAZJcscAx
 MVl5PYWq/Gex1JMlbEGFjiiIaD9hxdWkMl0Lt9MFbdp5hUp3QsGCWBcz/qWFf5MKMt96
 r+PGCJHMZfSeyPxJIbXSvvzqSdyJw1ykoqMhTS2OmGv58ADEmk5pyyBI4/FBqL8awdz8
 PL/OpvI+Ed3gFi2taFUfTPuSJvW9pzNsr2v0xPclS6zFDQCiYcP3KpKQTDf7NVwhdtGI
 as/HotQBvLLX2NYVVoKJ2+lHsN1xFMgdOBx7QfCnOrueV7wKhnFy61q98fm2c8AepO0m jw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3a90justqk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 Aug 2021 22:13:37 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 176MBi32181498;
 Fri, 6 Aug 2021 22:13:36 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
 by userp3020.oracle.com with ESMTP id 3a5ga30fj3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 Aug 2021 22:13:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IZmW22FhtnlpDqhwl8EJnx+4/fHit12frDtUgVxwVMGznljGVX7gmm2h9zoagDhHUsuq2OGD46stOI/v72XMLd6RdgFQMDyrxMZsoVm7cK7VKproCps2lxL4bAL2BmbCvEaLiM39NW8edDnGYpKWJAVB6Zflm9qKGDW3am0pKvFlXC88x/8SSIeBcEXLX+Hcd9iFpbLEf7FgMIqpB3/npcz+VxgRGGEN/cv5HxBSvVP7E3PC90KzwKtWxldH0Bv5pAZye0T6oaLHCpHgDp6mPZlGQZ8nNwBD+Spkw/S8OdXPKBJMg7efoCkx3EiUHrR2V3x5XIZq+RPiHl4MKo2RsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=biDqY0Q/Fv1zFLC8JgiEyiyUXIcCxUjJwR37bRrNLDM=;
 b=i1DDgTUwHlv0a9LL0jkRRTlW8V4KBjm8dm8bOOQaYf2mNP3Ou+ahfTC0B9gkLznWh0Xqtp3wo/NaEMugzNqFhKA0Ht/J2YO5BB9CWwkeTxrXYIXp+DtdMtBUQxCKUsyKETcNI9eCvH5Kul04I+udoR9UDfONPhDUc/1W8Z1dv01YRU9Vua9xPyZgFhymJZ+c40i9198siQyleUyJJ0lyNj0B8Kt2V2W690saPujfDZIWVKh1K69iRq0jNXSMeiff0xpcq2b+FQe5QNJlXdzc5HZhfbtWqEvfbQKjMIjD9R1+L3pY1LHHhpGhu3TIhlWIxeSAqkGUxZiMlOCdAZHIlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=biDqY0Q/Fv1zFLC8JgiEyiyUXIcCxUjJwR37bRrNLDM=;
 b=k8zOFW1Hr75oLaS6+kOvSr338DLrWSvXecOQ43IityE3o6IOUENVEM30AYbZWp+3/agXHEKPAV8hTvRr9nBmVZeYntU69HFX2nmfpAlmkrhWMIOnNPd5QqyELzEk+vTirGCZ9g9W5seI3GJ8GAAjIySDiiVTB1J/MCty9j7DjV4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BY5PR10MB4129.namprd10.prod.outlook.com (2603:10b6:a03:210::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Fri, 6 Aug
 2021 22:13:34 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::99fe:4091:351d:11e3]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::99fe:4091:351d:11e3%5]) with mapi id 15.20.4373.028; Fri, 6 Aug 2021
 22:13:34 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V6 22/27] vhost: reset vhost devices for cpr
Date: Fri,  6 Aug 2021 14:43:56 -0700
Message-Id: <1628286241-217457-23-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1628286241-217457-1-git-send-email-steven.sistare@oracle.com>
References: <1628286241-217457-1-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SA9PR03CA0002.namprd03.prod.outlook.com
 (2603:10b6:806:20::7) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ca-dev63.us.oracle.com (148.87.23.7) by
 SA9PR03CA0002.namprd03.prod.outlook.com (2603:10b6:806:20::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.16 via Frontend Transport; Fri, 6 Aug 2021 22:13:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1cf64abf-6434-4b54-a534-08d959276e50
X-MS-TrafficTypeDiagnostic: BY5PR10MB4129:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR10MB41299C17E8319A5435066501F9F39@BY5PR10MB4129.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vljJ7U9ROqfRDPVsGcKK+h+OVt4GIw946gvpbhY2DAnEy72yYn7QDDpHfI21Drg5E+LAOqDfYUWhzULKKynPkfmvEP2jYPDabAC/l4+gkr3kL9N1mXfPa9J7afonWWLx7g6BhUb6c92oBz5JoWQrWoIvzINM/axyiMZzu6zyekdyJoHLfCf0fyuiUdFIlccF7N/SwYIq+7qhqb37K0fEQMwBcSsOgzmzqUtq8wXogcpI8FK9h9c4B/kMt7phosbWH25ao8RU9y/ilHJphrEj+zWcnJDs2OiCePmnu/9MASKXYu2olguFWoRJj2v3VW1Wn7HbX3K2vfS7PUyYB3xxqRhl1OXVIwDplkAlP2l5zaNtP1hqjnjuXRwEpfCn+Mv4u4vBXBzos2jxA+j9Pzvue5TpBTQp+gen6CK+JnhKQr5eu/PFZEL3AsiZrVZMF62H25gDc6x9XdzWZln54JOIgnEtAWNdlRolWJldnWQcW9M/zgNP6SsTH3pK8iKI3tId4dt7yctG+sWolSytIdGKxq0LUXwpce4Wn8QdI8Vcz4h1X7kRD5/x8K3AhNTHfFxTp9hfKFwiDSM0N7lhEuma1eH2bX7LPPiCICINv0RTwTT2Mzj2QH7WYKjqVA6BebzhMoFe1aqeJxMQSRokyApPLT53oyhpV6/dtAVA6jJVn6JMIgctCa0OlJUazXfIp+tQwvSQuXDLfvxwjfrhUp0Qxg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(396003)(39860400002)(366004)(346002)(376002)(66946007)(66556008)(956004)(2616005)(316002)(7416002)(38350700002)(8936002)(478600001)(66476007)(36756003)(86362001)(38100700002)(5660300002)(54906003)(8676002)(4326008)(6486002)(7696005)(52116002)(186003)(2906002)(6666004)(107886003)(6916009)(26005)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+oYMGmBr4hrJGfsKezc53vHVUF2h+y2yXQUkVwOu3aaurf7qp636qrMccxOX?=
 =?us-ascii?Q?K4xSUdfwzp1EKB7pwzKJzSWWTD4eLm3Y1RyH64eOxz/YgFPNyVyIUMNqddI7?=
 =?us-ascii?Q?fit9kingJZrhOdb2HDsBORYvUPp3M8w88ze2BjcDizE5LgYXkUBiXy9dtXw1?=
 =?us-ascii?Q?HtAqqFA6wNUL2WXjF2jFDHxT9NfGGH9VTNhB2q7DzEFWPOrfBzFsL+zogU1r?=
 =?us-ascii?Q?KQdfgnn+O0WMh1PdROXIhRBGTlSlPkaQgRsFiaeEEIlRnnWwtT2PzaHGnn6P?=
 =?us-ascii?Q?kcwlnk5Q0zymnvi7WW4MCaM8PjKehpIi8c5wlW17iFU998AG5jxFqlCrq3Av?=
 =?us-ascii?Q?hf1LnO9mXeFPh7/q8h00R2ihOmR1j6PGkhrC2LxRrYrd+DenQiXZWnGo0sU7?=
 =?us-ascii?Q?/NxanUl+IJ/4sg//n6IXXGObqyufs1d0H9obJWosynCi8Yy5f0OlstOGbjxV?=
 =?us-ascii?Q?6TpSTvaDk31uKa6I/g+jO56FOYWpisq9QqH0P5TEGiT/KGEFEKtfxudH7HJJ?=
 =?us-ascii?Q?o07PqBUkzZTaLnFJownaApYI7ik3uoTqJvg5ggMTq/thg57/AvCrFMYdVUki?=
 =?us-ascii?Q?4l0Rk9CEYdrYR+FazM7553/brsg3ElnrQdylas0d6gYqznc63L3tVtZzV72i?=
 =?us-ascii?Q?7GgOAjAAKARxKzBowQwb6k0fqmrgrWNQOacTKcyp/VAZUaD0Yn5KRE0NCr+Q?=
 =?us-ascii?Q?7tK+hCkJAPIyT0SLlXlw1xAdjse+CKUiIONuDq5f9dbB9S94LdyII/AWUHcl?=
 =?us-ascii?Q?VXnDbg5KJKBuw1ZDkBg60Z9Rykxa9eDRqGlBIAuLwu9Vsw/OMSNgub7v0Bve?=
 =?us-ascii?Q?9u0BGX80vaUXjOWWCcQfK0oJ1Kfz7GzpGBdGufxtunLPOi3+RErzN3/YkJbw?=
 =?us-ascii?Q?q+cZgGeIZSNjNsBzk6gwKoJx81GcaX+ARMfMRktNnkLgrqqOhN+1zlpTQMF0?=
 =?us-ascii?Q?CBzvbReEDzMBoeXu73K3f2tE3tBhFfYUtGgFeiS4iSAC2WI9hMfbuVk0+QuA?=
 =?us-ascii?Q?gwQnMG07i9Oaar3tcBPVG5r2ZB4UIzSyiw36ox4xGkJsFBVsS0zmjzAEb62g?=
 =?us-ascii?Q?IeE+RGOhLFiCISp+wAT4gMGE92RBt8Y19miWIJaQ8NbE6OavYN4OfUgt8Qva?=
 =?us-ascii?Q?ncnsdHoewiZVanCQ7u34h19FwCd/DWjrwtiJyoXffYNe4uaihiUdYdChy5PL?=
 =?us-ascii?Q?IDr6kU2vz47SylS+maG8H1S3kMi7zCvuDx3Tb+i8eJv02pvO4WFa6/GXbZsw?=
 =?us-ascii?Q?CunikuwdGGzAYxQMHriUm4hxL42fbfnnmQzg4hgIboPIdJrgkjOQAA00DWbj?=
 =?us-ascii?Q?8/R357vcuExXMyk3j+ZEpE/p?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cf64abf-6434-4b54-a534-08d959276e50
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2021 22:13:34.0280 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XbI/1Fswmo6rIWcRE3tQByejTwQA7fCOLY+9tO/3dwzivGf5DbxyJ0SoWpVA3nB6n8nNpyc70lUAkCMdZjNFeMmdGyM3TfV52jgQOdfieE8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4129
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10068
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 phishscore=0
 spamscore=0 adultscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108060145
X-Proofpoint-ORIG-GUID: qFLI0iX3M1ARDLpkuC2kBuKSwH259dLi
X-Proofpoint-GUID: qFLI0iX3M1ARDLpkuC2kBuKSwH259dLi
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Zheng Chuan <zhengchuan@huawei.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A vhost device is implicitly preserved across re-exec because its fd is not
closed, and the value of the fd is specified on the command line for the
new qemu to find.  However, new qemu issues an VHOST_RESET_OWNER ioctl,
which fails because the device already has an owner.  To fix, reset the
owner prior to exec.

Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 hw/virtio/vhost.c         | 11 +++++++++++
 include/hw/virtio/vhost.h |  1 +
 migration/cpr.c           |  2 ++
 3 files changed, 14 insertions(+)

diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index e8f85a5..3934178 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -1832,6 +1832,17 @@ void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev)
     hdev->vdev = NULL;
 }
 
+void vhost_dev_reset_all(void)
+{
+    struct vhost_dev *dev;
+
+    QLIST_FOREACH(dev, &vhost_devices, entry) {
+        if (dev->vhost_ops->vhost_reset_device(dev) < 0) {
+            VHOST_OPS_DEBUG("vhost_reset_device failed");
+        }
+    }
+}
+
 int vhost_net_set_backend(struct vhost_dev *hdev,
                           struct vhost_vring_file *file)
 {
diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
index 045d0fd..facdfc2 100644
--- a/include/hw/virtio/vhost.h
+++ b/include/hw/virtio/vhost.h
@@ -108,6 +108,7 @@ int vhost_dev_init(struct vhost_dev *hdev, void *opaque,
 void vhost_dev_cleanup(struct vhost_dev *hdev);
 int vhost_dev_start(struct vhost_dev *hdev, VirtIODevice *vdev);
 void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev);
+void vhost_dev_reset_all(void);
 int vhost_dev_enable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev);
 void vhost_dev_disable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev);
 
diff --git a/migration/cpr.c b/migration/cpr.c
index 16f11bd..fd37d98 100644
--- a/migration/cpr.c
+++ b/migration/cpr.c
@@ -8,6 +8,7 @@
 #include "qemu/osdep.h"
 #include "exec/memory.h"
 #include "hw/vfio/vfio-common.h"
+#include "hw/virtio/vhost.h"
 #include "io/channel-buffer.h"
 #include "io/channel-file.h"
 #include "migration.h"
@@ -116,6 +117,7 @@ void qmp_cpr_exec(strList *args, Error **errp)
     if (cpr_state_save(errp)) {
         return;
     }
+    vhost_dev_reset_all();
     qemu_system_exec_request(args);
 }
 
-- 
1.8.3.1


