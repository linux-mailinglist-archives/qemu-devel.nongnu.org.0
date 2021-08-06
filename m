Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0254D3E31A7
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 00:20:55 +0200 (CEST)
Received: from localhost ([::1]:45234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC8Cz-0000eM-Ig
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 18:20:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1mC85m-0007DR-87
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 18:13:26 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:29052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1mC85k-0004CU-7Z
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 18:13:25 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 176MC34n023309; Fri, 6 Aug 2021 22:13:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=75zZ/yjfc+FBxgEI3tCsey3+RfhAFPqgNxlIO52HzAY=;
 b=CYvgj4KQN92gjsMPzHklftDBQwrcXQiNiGzPxvdiy6hLFfSL2tSu7pU09DfXnUyBGqy8
 4zlXXVEUnRxlpqSY1Yk0HX1rFhx0PzKcohqXuVwJ9OIYmyawHxH80+k3jR1ghAI2mTuU
 rsd5wdRf3Ql6PUL9iC0t/TyFTHjZfmC6qGUxDMyTRu1JrqzqinZE+Xlm5ta4NZSCzv4j
 Mk7GikC6eJ94PTvG7COVTmoayhWUPGmxgJIoRMy/RvowQ58fx3A2R2bh/E8+lUCU4i0R
 PRhRZ2xR2yTiZl/la2LshacLvaNAKFOR6hsLP1a9I8fxc37YOxdrciI6U66YxnTC6YHA 6w== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=75zZ/yjfc+FBxgEI3tCsey3+RfhAFPqgNxlIO52HzAY=;
 b=ea+HGRKZ8jHMZGcU6T4qf+HIEwoG/wNjoXKcZ/fuUIH7ocVG4LNtUSH9Hp07Fpcr68Vc
 GNvkjmUqvUGKONs1Ei9bHpdlVGHKrspc2xlT7DkVee81GWPggx3qMNq3TWtzsn0vKU3j
 wHS6GuKETRqq/Mp07WFny105AU04h3hECcYAtB2lIsQE+UeEh8qeTuYpcm/atRCr3l2O
 sdFEtPBraKG96TZPebLvSM8m2LWRa9Zr2rFkTg9dNWl6YJEu1OdBMRX2+orM55VlvChW
 E9wJW3ot1JXAldwcByI2vFgldEjtnvKGJD2wN+c7FutO1zTU9vcTZWn1EIOhHqUd8nyh ww== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3a8vy3t4xq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 Aug 2021 22:13:18 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 176MBejb032608;
 Fri, 6 Aug 2021 22:13:16 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
 by aserp3030.oracle.com with ESMTP id 3a78db75me-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 Aug 2021 22:13:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TibgtvvXMYYw7iTjRlrmF8FJiVxoo2k+OhYE84t/61fYMwBS0K8iJQpaZK9AMAZKWbaFdeeRS1O43HLU+a+BGpHkl6++6CJMsZq6RuTwH3DOnS3uFkMXT7y9EU6XPSB5QpYZjGUC4DExzshuQNC7wUaYm1NjzSimuUdcRDdRgxZTgwsoU0ShtwA6HXB/FQUR2zBBMybCfO56rrI54oMyvFdFZucAeigY6tfVONPEtTBtApBnNdNuNZy95Ep2vI/FJ2UL1OeqNR6JyhPDcU1MLkYxAcXnydilYcSoZE85TLMenWZFq1H1G70VkIyaUbGhveUlIv2Vl3awS8fzneZlog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=75zZ/yjfc+FBxgEI3tCsey3+RfhAFPqgNxlIO52HzAY=;
 b=lZNE6Iw1cfQtBwcc0tYm+oAQhlQ0uAjVzigN0iaPlo+4/nLR3wSrSm6s0Se+SxHkG4ZvcrwNS5Z5ErVUzMtKppKRauE5jm0WIvcQfZH+LIWSDNUZfTIMsDnhTpZPEp1x2RtC+uRYfJgv0WYNEUJYeI7qFhJfJRkfL8Q8n85rHp38yOBtD/znldxAhUEk7qFc32DQzgPB5G+zRHA9Ys2ys2x/YsAMssIQt5aoO8hxFYFCw+Ppx1bRwzcibDDHr5e3BvYnyIUizuIvaWzqAjbgpNfDTPbzJ5isAKBoceJ1RD/DTogtkRxPCdaiz7GKY8QwcSrsibklgxzP2WVkf6tzpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=75zZ/yjfc+FBxgEI3tCsey3+RfhAFPqgNxlIO52HzAY=;
 b=nxAjB78n+DRFidVRNzOjAs9TjEl/sPkKaMH5RvUFhSGCAyRrbltSgIyv5aNg6oMraS3+CPPsPsjd181mYe79Kxwg+nuxwljCgJbk6n10ParWMsRywUp7Q4ZIjRw6Q/K46+hyrWY+uDJH2oJVsghbBw3R1PuAkq9gLpJoZQ1hInc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by SJ0PR10MB4734.namprd10.prod.outlook.com (2603:10b6:a03:2d2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Fri, 6 Aug
 2021 22:13:15 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::99fe:4091:351d:11e3]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::99fe:4091:351d:11e3%5]) with mapi id 15.20.4373.028; Fri, 6 Aug 2021
 22:13:15 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V6 12/27] vl: helper to request re-exec
Date: Fri,  6 Aug 2021 14:43:46 -0700
Message-Id: <1628286241-217457-13-git-send-email-steven.sistare@oracle.com>
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
 15.20.4394.16 via Frontend Transport; Fri, 6 Aug 2021 22:13:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 81a811e6-386d-49cf-06c8-08d959276309
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4734:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB47344F35726D7690069937D0F9F39@SJ0PR10MB4734.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q+MpO8HO4VZL8Qi6kge9flT7z/yNg44oIFMmRX853/lRLx6sPzQAAFoQz6K8Q6SvXFCDfZ+SfZTNYIPGnYY4TTgPjv6+SNZJJpXXO1FT0ZbxWMylHFtilk1ZLd/hhaC7ql3W31weeKCZjWDWjvmW/p0vGXlfZ8qziC87OcitorB78BEOuhBPWbvyVRwoFQ33namUkURKWZlx8sYJ2iirT+lTjQnne2ZEtB80PcHHGY8r6D+qUrh9ur7s/rd7kQKXSlxUhE/UIrwZKhJrZK1wgofJFaH8vrl7NjhmjzX/4eXhV8nf7OvDE+vhZGqnC8NvBGu648sHdC2cblWbyE0JGxu5JSLoWv0clcyWaSRYVl0/j8x4+p9FlVoPN1S5sv/Ar3U7N2c+JTl5Nw99g4Jue5jXP7IgggGJTLBHXatbPx1fUOF7wWLELlFYD2S1YDFL5GKbR57v/2aqtU5GP4K8IdPCFxbV+wMEYS4UPWVtQE+I1b0DturUdqyBr1jFyZ6NHFksm7M0g3EeRYKaPO5eRhm62ynIDCD32UqgVqG/4PYGcBl4o6Ls0DjWVFcwYN/xeb22/IrkdyaArL9d9oYfkiN+9OTGjZU/ajN9h6j16otzF+F4khLiO535RgIJv33I4bUWn8yA298KKmVIUnrI/cwl7kVPQmKurBRjiiRjtrg80aLgclSnJYtCjV/Mc7g6putePWQUo1gX01U3nYEu6Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(396003)(376002)(136003)(366004)(346002)(66946007)(107886003)(66476007)(8936002)(86362001)(316002)(83380400001)(54906003)(8676002)(66556008)(4326008)(36756003)(956004)(6666004)(26005)(186003)(2616005)(478600001)(7416002)(6916009)(5660300002)(2906002)(52116002)(7696005)(38100700002)(38350700002)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Z4Pzlpuurjei3XzFkF3gUvHd/1lZf8slLdGMvxznSRrfwEobNvL0LcExarA8?=
 =?us-ascii?Q?uoSnrEtE3d3BHbrPhxChOyBJUC4Q9wblga4ZRUO7l0LB1TFKMkUvwRIVzBgk?=
 =?us-ascii?Q?tu+fBVvLRzu+ykAY8Nnvxv7LPf6PjlcOdHoHYEpJGqcxGco3nrlFtjuIKHWs?=
 =?us-ascii?Q?qfky2jv9ul49/f1+/WgZtiUrbo3eXPGkmwcbl2TArQ38a5eAMivRQdL/IpNc?=
 =?us-ascii?Q?1BfrJVbh8+R0rXr2EojlnriXKCemdfcvtCcMfcl5gFiZa6qQsPeeUpQ9Fzoo?=
 =?us-ascii?Q?UVcVmr5ViN4V9bFBCMmEJIwb29RV+6zVqAFq8HUBSfraj1roIom2/98xhcz9?=
 =?us-ascii?Q?/+dGhfaltOx722WpgZw1O59fxs6b/qAGDKiW3PnETBZ0DtQKjHCvIP7JmZrY?=
 =?us-ascii?Q?InfHr3wuIaUXdrUhcXDEbgqN9/S9UYerWyq15TALRRq4gQSJkH5lQAiQaVXD?=
 =?us-ascii?Q?iRH9BmfAwervl2kJ+TohtjvApv/qMROMtR7ho+MPOidtl1AHgy6nWIxfE2xC?=
 =?us-ascii?Q?RucHsrdexCSC0VoBYtRmCoHCPQi8Yc3q7egABOHD7lu4ChoNz2CGvBMVPPmU?=
 =?us-ascii?Q?SHptm0uB2mreByhwz18HiOa4kRb3ajd9rEurHLHc5ksEfSK+DiOu5Jfm/qOX?=
 =?us-ascii?Q?j02kAtkQbL3XSifjWwoxZ5XyMIMCeC9+xJHBl6PO9BdqnukWfB3luBo0SCKa?=
 =?us-ascii?Q?skuD7LxVMS3ZZa3EvTonQFyE4rpEh7ikY5gRtFzMigA+rpXdRyvaWeDaBLkw?=
 =?us-ascii?Q?AvNidkF9fPf/qEJcqEosw6r2JAas71WVAgKMdx1g123QhcAFNzfCLyS4cGFl?=
 =?us-ascii?Q?h170K9Xv/AVZ6xhkEkcewyCoErJRnUC0z5wkxHyIGnT3NzzgZh2CNYLjkeJu?=
 =?us-ascii?Q?hARlhrBDkWP32zreBsI6JlbRJgqnO8DksEtKLjzZXSrlQN0Z4vkGGvggxB54?=
 =?us-ascii?Q?oOy74pPsbFVzTRbK8BvkDlgzVIOynrSq1tZEQA9s1x0cnELixBH0duttcmuH?=
 =?us-ascii?Q?wohUuiZ1XDUak3xWVj9kt5bBNEHktqodjBJ6f9bdfXWfrJYjInqqozSbNhjr?=
 =?us-ascii?Q?/cOJ8UAyq7S4gPRwuBbADvUZxd9ruHJqrgUaEEo8LdQcENc805/YxbSS7LCD?=
 =?us-ascii?Q?LFYUeUgIom993tNWxFkReP50uNVU8i6Hylj+yQVABw/VTO7hls4eAPxiWXDe?=
 =?us-ascii?Q?0wFSobdi1B61S8D3rMoOol7fnbPeQnOXRTIAYeb0RzqvPnQG64eFohZQU/Tq?=
 =?us-ascii?Q?ge6w9sCIoIbVoSzxQazUH1dXTUCiy4vWshI1sKPltGwE1ViaLOjOx1IvfUXS?=
 =?us-ascii?Q?vtIMdHHt7sZ4vqmI5Xtd2zMk?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81a811e6-386d-49cf-06c8-08d959276309
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2021 22:13:15.1277 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cugwOKP+AXz2ifDB8lAdMkcFGey92jUFtKm55rDG6my3jq3YEKv7qEpOGWpwCUvRAytOnmg2wzB1qVwYYdU1jZpzTueW5snsVHEpt9QxowU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4734
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10068
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0 adultscore=0
 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108060145
X-Proofpoint-GUID: abwyZAdrL4PcAlP-ZdC448AhvHr8x5rf
X-Proofpoint-ORIG-GUID: abwyZAdrL4PcAlP-ZdC448AhvHr8x5rf
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

Add a qemu_system_exec_request() hook that causes the main loop to exit and
re-exec qemu using the specified arguments.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 include/sysemu/runstate.h |  1 +
 softmmu/runstate.c        | 21 +++++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/include/sysemu/runstate.h b/include/sysemu/runstate.h
index b655c7b..198211b 100644
--- a/include/sysemu/runstate.h
+++ b/include/sysemu/runstate.h
@@ -57,6 +57,7 @@ void qemu_system_wakeup_enable(WakeupReason reason, bool enabled);
 void qemu_register_wakeup_notifier(Notifier *notifier);
 void qemu_register_wakeup_support(void);
 void qemu_system_shutdown_request(ShutdownCause reason);
+void qemu_system_exec_request(const strList *args);
 void qemu_system_powerdown_request(void);
 void qemu_register_powerdown_notifier(Notifier *notifier);
 void qemu_register_shutdown_notifier(Notifier *notifier);
diff --git a/softmmu/runstate.c b/softmmu/runstate.c
index 3d344c9..309a4bf 100644
--- a/softmmu/runstate.c
+++ b/softmmu/runstate.c
@@ -38,6 +38,7 @@
 #include "monitor/monitor.h"
 #include "net/net.h"
 #include "net/vhost_net.h"
+#include "qapi/util.h"
 #include "qapi/error.h"
 #include "qapi/qapi-commands-run-state.h"
 #include "qapi/qapi-events-run-state.h"
@@ -355,6 +356,7 @@ static NotifierList wakeup_notifiers =
 static NotifierList shutdown_notifiers =
     NOTIFIER_LIST_INITIALIZER(shutdown_notifiers);
 static uint32_t wakeup_reason_mask = ~(1 << QEMU_WAKEUP_REASON_NONE);
+static char **exec_argv;
 
 ShutdownCause qemu_shutdown_requested_get(void)
 {
@@ -371,6 +373,11 @@ static int qemu_shutdown_requested(void)
     return qatomic_xchg(&shutdown_requested, SHUTDOWN_CAUSE_NONE);
 }
 
+static int qemu_exec_requested(void)
+{
+    return exec_argv != NULL;
+}
+
 static void qemu_kill_report(void)
 {
     if (!qtest_driver() && shutdown_signal) {
@@ -641,6 +648,13 @@ void qemu_system_shutdown_request(ShutdownCause reason)
     qemu_notify_event();
 }
 
+void qemu_system_exec_request(const strList *args)
+{
+    exec_argv = strv_from_strList(args);
+    shutdown_requested = 1;
+    qemu_notify_event();
+}
+
 static void qemu_system_powerdown(void)
 {
     qapi_event_send_powerdown();
@@ -689,6 +703,13 @@ static bool main_loop_should_exit(void)
     }
     request = qemu_shutdown_requested();
     if (request) {
+
+        if (qemu_exec_requested()) {
+            execvp(exec_argv[0], exec_argv);
+            error_report("execvp %s failed: %s", exec_argv[0], strerror(errno));
+            g_strfreev(exec_argv);
+            exec_argv = NULL;
+        }
         qemu_kill_report();
         qemu_system_shutdown(request);
         if (shutdown_action == SHUTDOWN_ACTION_PAUSE) {
-- 
1.8.3.1


