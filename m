Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE023E3199
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 00:16:49 +0200 (CEST)
Received: from localhost ([::1]:56812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC892-0006XV-Mx
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 18:16:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1mC85a-0006a1-KR
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 18:13:14 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:11068)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1mC85Y-000444-AO
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 18:13:14 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 176MBdcB032510; Fri, 6 Aug 2021 22:13:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=a5dhAjsqTvzNVLMfT4s5tNUbs8dDdlkP/58BNy18jos=;
 b=wpy3XqXxb+IN2QpmWLt4qOzJvfYOPvq71CJ6hk1XRxfoTiKpbZ1d1liYDFRF4tfzmO+G
 Y2V2xt1T85b6ttcoGXHxaU5nqzSLbicmWjsXegHmnoN/HnrfaO4LdoFVtbYRCCIm0zav
 Uq5WSiLtF0dP7ZiGL0bQCh+JQuBQRSBwNzf6PddoA7814PW+pHzTDr3/HV77/idBHvDv
 gtCqhMTmQdwltfvh4x9RRzLBHK5c4o0Z6P4qjp5hl3l5st42ohJMaRURXDWr5GrzlHix
 BwQRC15irKvhm+ODZJqwjQZxM19mNDtxLnDhP9Gfi+vRmI5JeQkUAXQ28go7luRZfd3u ew== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=a5dhAjsqTvzNVLMfT4s5tNUbs8dDdlkP/58BNy18jos=;
 b=xTAGGzbqLO/fPpBiCSEWywP1htyDTDmBHZL+3zQ9vCLJYX9tM03AJVPoL3z9R1W37pYe
 di/NWGXf/FWDefRoJqlAO7viVNBeoM4hkr6Bhxyx8q1z0ph8t9XYlauHK/ES39jy69et
 vapYuPhAnGsmcARA/TRthPFO0R9pflSaFeIaxHUd2NM8S6l7bHvL1V5lhj6emGIAQhuo
 coBDi6h4WUwbHFcKdqOzLLOvpPUSXRpMKT3npyK8+b/8ASiln9Tmu0qSL6GcpbW8PPg9
 PMXOTKLE1jtrJQpeqKSHDgypLIQirAEdTPanwLJacfJ7qAKqBdqQjwKCA/VZUZeI0Un9 0w== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3a9661s13p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 Aug 2021 22:13:06 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 176MBk5A032675;
 Fri, 6 Aug 2021 22:13:06 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
 by aserp3030.oracle.com with ESMTP id 3a78db75et-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 Aug 2021 22:13:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FNWCqOVq6Uaurl2E/yOteURQdlW1PbCMgPRDBMoMNfSY4Dbp7bWhBCdNZW+6GiVknsjfpo/U5bckl2JacQaKQzyIowKKzqVN46Zh0/fnxLsDgN0oERJKfn0uu7eDcd4i/iIT+8oGbBv0N7Qw06DxFNv9mP0DzEGimJcoJ0YdR10AgW4m96m/tCIw1a/mSjgVe8pTXv9PveHllK2SiywRQFo3o6w4kYbT/3E2M2zuG1kPrjsC3/CFGvmc1r86WR8rAGCNU+hzHEY7pygaZVL9iDmrJACWTLH3nslwK/ET/xpZuLKaCq2zQoJYM3qKWtNvuX6rGhZZlf5T5fhLUlrWYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a5dhAjsqTvzNVLMfT4s5tNUbs8dDdlkP/58BNy18jos=;
 b=fR7Iv2biOxhMMT0Zh0WZTTYPCzn48S2PPuMLpyFU1EOkW/icXYVOtPjOjqXLrfxWX/89R6mCM6jDgOia3sLPn6mkBkvSl97TP55kRN3PaXnFBmr8BGiMuWTWTCr3MSUi9t0StG/YmkjLLuVULGfi8uFiOmUoNrRxdOUSvd9xehfNSXhTeDi6B7o9zf3vjAQKpna4qP2RE5/yVEgUvIpuSTP8Ip8morVhBFdIr8b5gOVg46p6NVQ6m8BWv7CxuCnTtOSYqgf+UbTRvGQp+Drd2yRPboF6ol9ootjI4TUafcFUMU4/CAT6Z+aVeuTDSn1bXZkEyiTifx8kPO3w3Jht/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a5dhAjsqTvzNVLMfT4s5tNUbs8dDdlkP/58BNy18jos=;
 b=WIYmS37lBJ/WG04ERoPQREM6l3XXHNV3CgMkOE5OKfxG+00cIXKaHlWA+g0xKLsS8RmBwrKqfzJ3zzD+2Fm2Hl3PgziQM46kQGBWVE5ObGCRbLSlFvrUOjiN/tHRZ7OsKSyFP+isLKYVyd1TslvML9Of/9EpKKfa4F7TjQBn/8U=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BY5PR10MB4324.namprd10.prod.outlook.com (2603:10b6:a03:205::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Fri, 6 Aug
 2021 22:13:03 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::99fe:4091:351d:11e3]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::99fe:4091:351d:11e3%5]) with mapi id 15.20.4373.028; Fri, 6 Aug 2021
 22:13:03 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V6 06/27] cpr: reboot mode
Date: Fri,  6 Aug 2021 14:43:40 -0700
Message-Id: <1628286241-217457-7-git-send-email-steven.sistare@oracle.com>
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
 15.20.4394.16 via Frontend Transport; Fri, 6 Aug 2021 22:13:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 64d02d30-9300-4f84-4529-08d959275c3f
X-MS-TrafficTypeDiagnostic: BY5PR10MB4324:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR10MB4324D8B12B416DB0AC662299F9F39@BY5PR10MB4324.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HNPBUgrvm8lFWGQAVI6j2ClJwIQztkhOWbQJGuUUKZINGzIg8oUZ/1orQu8wwnTu42bB84KonP8fLZxKwKrog/WEFwZvyqy75Fi+Hvo0W4xXuw7I0+3CLziQUvxIxnbeyUcZNuNsMdzyLHCb5KO8sOQTAyynva3uVfHhAGCycCPSv4RbIhaKY5MTNiCx7xEJWrJHEaGz7UwxbWIs8BDDAO8U+jdaSVOHyPafJ0o88quLHMrva21swk3fQNd047MQ69XO2e+I8qH5A2/JBdlbdAZYPHQ7S7O+HcskNNwkU+iAEMmfSaj4/p0VHnnKje8bbxR+yUsREsvO6qhrU14W2hbltH5h9Xenx7V1K7PHa62FWIqilVRgMM8yLwbUaWuKHBUpOxVTrZvr5z3pA/fa7NErqcblMGMDVNTAqc+/WN56rImI0nDvylmXy3Xguu1OWZF6KvrCgESqlo54/ORz/n+TGZztWZ5anDTvhk958Ia3W0v76+cMcGVyXHCrEn5EOpu5AN2wRluO8WXjGifv1AF6xjgpjuMjtZKsvKV46bERw2miR5Ib78T6PIntaW2iGcTp/kzVQ2bqipIEUNrNnr6g8y79C3kug+S2UZt3HhP2pAJjuATk7kwRhRNb8kGHGtNw+8PEEpTrZenDNDz3H3mcjGS6KjmAm0caeyxwcQoUcuW7b8af+deKNGbI4Tto4A6MMv6MUJz0emlPgGaaJA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(508600001)(6916009)(2906002)(36756003)(956004)(107886003)(7696005)(4326008)(83380400001)(7416002)(52116002)(2616005)(54906003)(186003)(86362001)(66476007)(66556008)(6486002)(66946007)(38100700002)(38350700002)(6666004)(5660300002)(8936002)(8676002)(316002)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AXFozWW2xoDrKUe8tWXgd1fj5QSEkmn8tMuXoHPlmbxG7XTPcWOpZH421hW2?=
 =?us-ascii?Q?grjOE04REV8ZiPGJftc+lCCAEcvdm7opaK4vKCXNGXZdow31B9J4fTbMbOKl?=
 =?us-ascii?Q?w70+kHrHC2t+apdoj1wajzXhnpG7ymveD1tYkkOL6n0UcByj4tVH3Tx3LjLy?=
 =?us-ascii?Q?zRLGNgjWpLiVK5bbkRDh3rQ37ls1JoMQNWakd6ntB3UfW7gNu9BhrFL9tU8+?=
 =?us-ascii?Q?gyODqAxg+R5JgbeOJsQQGVzua5SESWAigwlCulxfOz6lRokGljWB5Wd4b5S6?=
 =?us-ascii?Q?k+luiLs3+BMuHckzIYbBTvKZ6QR7f20Ee2CkvASklUSA7inWc7Gofn6yuuTL?=
 =?us-ascii?Q?Y2zDkc5Ae3tkhoJ4rH5u/TseaFDzQXBZkHaedNFkTZK7xrSdzsu9uODbjQZ5?=
 =?us-ascii?Q?DE8mzehc3KSByUdyKSEDc5Oao3jTedSEcmfQRtYiQhnHd3+B8mQRpbjhjW3z?=
 =?us-ascii?Q?ZdNlhPnbvg9o4sgSRYhHVsKgUqLjoqisHbmEbkVndtrq218iKjml8q8kpvty?=
 =?us-ascii?Q?7kkd5sfLNEW24h2rgMDA43yb3pmQtwGKVb2OX2q9mMzDHQgKC+CZqd4WUAEW?=
 =?us-ascii?Q?lDcpLT3rwyi3H9gzE0RVy+dGKTG+Uqyu0OXpWX8NiYkykN8RSJejxF87RzSt?=
 =?us-ascii?Q?nmDGmy/dqtSNR7mXygEDxw/NBOKM7sEGuHEcJR1bEv82wWx7EbIK2rxFsfNb?=
 =?us-ascii?Q?ZbwqVdcCOHmuH8atQt7CtfSceNoT/+1u0kINF2KhKpSfNnyzaF+QyOm4CyEC?=
 =?us-ascii?Q?aIY6IEpTHxzphYer42SCaUk+zlcyA3gUywySgwONGTVSFfEoRrakERkneWL8?=
 =?us-ascii?Q?3misF/Moq9jEdai6mmqEU/+anyMfXrBP3LagIykEAdFRPzlgiHqOPNtfXl6b?=
 =?us-ascii?Q?gNDoInnzHTMI373fZHXoXC5x+57SPM6qnN+Wzo3tvGf9PcVNLntLE0ZUqK8i?=
 =?us-ascii?Q?jnPKAxkR/75J8jg3ciyblhyiE0TPDNlZDc4VUB5fFIlx1Upbxuwv3I8fJZUf?=
 =?us-ascii?Q?q5KcH2jSdOnR7buVCYwgi35iI2mrKdsc7hwIKW71ckrfOICCXDPKzgoOOozN?=
 =?us-ascii?Q?r4+rFx9AVeqaytdZ7YJRlaTfbwsbB2YxP0zdFlGGqv5PCcvFPcFq6u/AxIAS?=
 =?us-ascii?Q?Bdk6jLg87eP3R1JRf/ZSTLwTgu8aVlZcZHRIMnsaQBjTz8R3oNsX4L7cXOE9?=
 =?us-ascii?Q?3ByiaZjDEPgQENHeNyn+O1CEMIyEH8osGqgyJu2grBnxnMYiPhOa1hbToNEA?=
 =?us-ascii?Q?gjRIn9BTgTHjkc08B8SS4hh2uLwiXZBoHkJ/ZeTi97MKw0ri30FOz/QTnxU4?=
 =?us-ascii?Q?e84frSm/cLzLe+77uTkQwQJJ?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64d02d30-9300-4f84-4529-08d959275c3f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2021 22:13:03.7351 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iQ3SbaGUv5nRnbjurV9D9KsKdg1HxVjFzKcmZRMx2LlrH7F8JcXYOmqGkRIb+1TH5Fv0KBXG0p6fwPqSb6l3d+H2ZLjZclp0rnjXwjR+bJQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4324
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10068
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0 adultscore=0
 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108060145
X-Proofpoint-GUID: 4j7LORCyoVoBZ5q9Zh4R_f6jO858j-em
X-Proofpoint-ORIG-GUID: 4j7LORCyoVoBZ5q9Zh4R_f6jO858j-em
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
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

Provide the cpr-save and cpr-load functions for live update.  These save and
restore VM state, with minimal guest pause time, so that qemu may be updated
to a new version in between.

cpr-save stops the VM and saves vmstate to an ordinary file.  It supports
any type of guest image and block device, but the caller must not modify
guest block devices between cpr-save and cpr-load.

cpr-save supports several modes, the first of which is reboot. In this mode,
the caller invokes cpr-save and then terminates qemu.  The caller may then
update the host kernel and system software and reboot.  The caller resumes
the guest by running qemu with the same arguments as the original process
and invoking cpr-load.  To use this mode, guest ram must be mapped to a
persistent shared memory file such as /dev/dax0.0 or /dev/shm PKRAM.

The reboot mode supports vfio devices if the caller first suspends the
guest, such as by issuing guest-suspend-ram to the qemu guest agent.  The
guest drivers' suspend methods flush outstanding requests and re-initialize
the devices, and thus there is no device state to save and restore.

cpr-load loads state from the file.  If the VM was running at cpr-save time,
then VM execution resumes.  If the VM was suspended at cpr-save time, then
the caller must issue a system_wakeup command to resume.

cpr-save syntax:
  { 'enum': 'CprMode', 'data': [ 'reboot' ] }
  { 'command': 'cpr-save', 'data': { 'filename': 'str', 'mode': 'CprMode' }}

cpr-load syntax:
  { 'command': 'cpr-load', 'data': { 'filename': 'str' } }

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 MAINTAINERS             |   8 +++
 include/migration/cpr.h |  17 ++++++
 migration/cpr.c         | 136 ++++++++++++++++++++++++++++++++++++++++++++++++
 migration/meson.build   |   1 +
 qapi/cpr.json           |  56 ++++++++++++++++++++
 qapi/meson.build        |   1 +
 qapi/qapi-schema.json   |   1 +
 7 files changed, 220 insertions(+)
 create mode 100644 include/migration/cpr.h
 create mode 100644 migration/cpr.c
 create mode 100644 qapi/cpr.json

diff --git a/MAINTAINERS b/MAINTAINERS
index 37b1a8e..2611ca6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2900,6 +2900,14 @@ F: net/colo*
 F: net/filter-rewriter.c
 F: net/filter-mirror.c
 
+CPR
+M: Steve Sistare <steven.sistare@oracle.com>
+M: Mark Kanda <mark.kanda@oracle.com>
+S: Maintained
+F: include/migration/cpr.h
+F: migration/cpr.c
+F: qapi/cpr.json
+
 Record/replay
 M: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
 R: Paolo Bonzini <pbonzini@redhat.com>
diff --git a/include/migration/cpr.h b/include/migration/cpr.h
new file mode 100644
index 0000000..a76429a
--- /dev/null
+++ b/include/migration/cpr.h
@@ -0,0 +1,17 @@
+/*
+ * Copyright (c) 2021 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef MIGRATION_CPR_H
+#define MIGRATION_CPR_H
+
+#include "qapi/qapi-types-cpr.h"
+
+#define CPR_MODE_NONE ((CprMode)(-1))
+
+CprMode cpr_mode(void);
+
+#endif
diff --git a/migration/cpr.c b/migration/cpr.c
new file mode 100644
index 0000000..1ec903f
--- /dev/null
+++ b/migration/cpr.c
@@ -0,0 +1,136 @@
+/*
+ * Copyright (c) 2021 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "exec/memory.h"
+#include "io/channel-buffer.h"
+#include "io/channel-file.h"
+#include "migration.h"
+#include "migration/cpr.h"
+#include "migration/global_state.h"
+#include "migration/misc.h"
+#include "migration/snapshot.h"
+#include "qapi/error.h"
+#include "qapi/qapi-commands-cpr.h"
+#include "qapi/qmp/qerror.h"
+#include "qemu-file-channel.h"
+#include "qemu-file.h"
+#include "savevm.h"
+#include "sysemu/cpu-timers.h"
+#include "sysemu/replay.h"
+#include "sysemu/runstate.h"
+#include "sysemu/runstate-action.h"
+#include "sysemu/sysemu.h"
+#include "sysemu/xen.h"
+
+static CprMode cpr_active_mode = CPR_MODE_NONE;
+
+CprMode cpr_mode(void)
+{
+    return cpr_active_mode;
+}
+
+void qmp_cpr_save(const char *filename, CprMode mode, Error **errp)
+{
+    int ret;
+    QEMUFile *f;
+    int flags = O_CREAT | O_WRONLY | O_TRUNC;
+    int saved_vm_running = runstate_is_running();
+
+    if (qemu_check_ram_volatile(errp)) {
+        return;
+    }
+
+    if (migrate_colo_enabled()) {
+        error_setg(errp, "cpr-save does not support x-colo");
+        return;
+    }
+
+    if (replay_mode != REPLAY_MODE_NONE) {
+        error_setg(errp, "cpr-save does not support replay");
+        return;
+    }
+
+    if (global_state_store()) {
+        error_setg(errp, "Error saving global state");
+        return;
+    }
+
+    f = qemu_file_open(filename, flags, 0600, "cpr-save", errp);
+    if (!f) {
+        return;
+    }
+
+    if (runstate_check(RUN_STATE_SUSPENDED)) {
+        /* Update timers_state before saving.  Suspend did not so do. */
+        cpu_disable_ticks();
+    }
+    vm_stop(RUN_STATE_SAVE_VM);
+
+    cpr_active_mode = mode;
+    ret = qemu_save_device_state(f);
+    qemu_fclose(f);
+    if (ret < 0) {
+        error_setg(errp, "Error %d while saving VM state", ret);
+        goto err;
+    }
+
+    return;
+
+err:
+    if (saved_vm_running) {
+        vm_start();
+    }
+    cpr_active_mode = CPR_MODE_NONE;
+}
+
+void qmp_cpr_load(const char *filename, Error **errp)
+{
+    QEMUFile *f;
+    int ret;
+    RunState state;
+
+    if (runstate_is_running()) {
+        error_setg(errp, "cpr-load called for a running VM");
+        return;
+    }
+
+    f = qemu_file_open(filename, O_RDONLY, 0, "cpr-load", errp);
+    if (!f) {
+        return;
+    }
+
+    if (qemu_get_be32(f) != QEMU_VM_FILE_MAGIC ||
+        qemu_get_be32(f) != QEMU_VM_FILE_VERSION) {
+        error_setg(errp, "%s is not a vmstate file", filename);
+        qemu_fclose(f);
+        return;
+    }
+
+    cpr_active_mode = CPR_MODE_REBOOT;  /* generalized in a later patch */
+
+    ret = qemu_load_device_state(f);
+    qemu_fclose(f);
+    if (ret < 0) {
+        error_setg(errp, "Error %d while loading VM state", ret);
+        goto out;
+    }
+
+    state = global_state_get_runstate();
+    if (state == RUN_STATE_RUNNING) {
+        vm_start();
+    } else {
+        runstate_set(state);
+        if (runstate_check(RUN_STATE_SUSPENDED)) {
+            /* Force vm_start to be called later. */
+            qemu_system_start_on_wakeup_request();
+        }
+    }
+
+out:
+    cpr_active_mode = CPR_MODE_NONE;
+}
diff --git a/migration/meson.build b/migration/meson.build
index f8714dc..fd59281 100644
--- a/migration/meson.build
+++ b/migration/meson.build
@@ -15,6 +15,7 @@ softmmu_ss.add(files(
   'channel.c',
   'colo-failover.c',
   'colo.c',
+  'cpr.c',
   'exec.c',
   'fd.c',
   'global_state.c',
diff --git a/qapi/cpr.json b/qapi/cpr.json
new file mode 100644
index 0000000..2edd08e
--- /dev/null
+++ b/qapi/cpr.json
@@ -0,0 +1,56 @@
+# -*- Mode: Python -*-
+#
+# Copyright (c) 2021 Oracle and/or its affiliates.
+#
+# This work is licensed under the terms of the GNU GPL, version 2.
+# See the COPYING file in the top-level directory.
+
+##
+# = CPR - CheckPoint and Restart
+##
+
+{ 'include': 'common.json' }
+
+##
+# @CprMode:
+#
+# @reboot: checkpoint can be cpr-load'ed after a host kexec reboot.
+#
+# Since: 6.2
+##
+{ 'enum': 'CprMode',
+  'data': [ 'reboot' ] }
+
+##
+# @cpr-save:
+#
+# Create a checkpoint of the virtual machine device state in @filename.
+# Unlike snapshot-save, this command completes synchronously, saves state
+# to an ordinary file, and does not save guest RAM or guest block device
+# blocks.  The caller must not modify guest block devices between cpr-save
+# and cpr-load.
+#
+# For reboot mode, all guest RAM objects must be non-volatile across reboot,
+# and created with the share=on parameter.
+#
+# @filename: name of checkpoint file
+# @mode: @CprMode mode
+#
+# Since: 6.2
+##
+{ 'command': 'cpr-save',
+  'data': { 'filename': 'str',
+            'mode': 'CprMode' } }
+
+##
+# @cpr-load:
+#
+# Start virtual machine from checkpoint file that was created earlier using
+# the cpr-save command.
+#
+# @filename: name of checkpoint file
+#
+# Since: 6.2
+##
+{ 'command': 'cpr-load',
+  'data': { 'filename': 'str' } }
diff --git a/qapi/meson.build b/qapi/meson.build
index c356a38..73ece6a 100644
--- a/qapi/meson.build
+++ b/qapi/meson.build
@@ -27,6 +27,7 @@ qapi_all_modules = [
   'common',
   'compat',
   'control',
+  'cpr',
   'crypto',
   'dump',
   'error',
diff --git a/qapi/qapi-schema.json b/qapi/qapi-schema.json
index 4912b97..001d790 100644
--- a/qapi/qapi-schema.json
+++ b/qapi/qapi-schema.json
@@ -77,6 +77,7 @@
 { 'include': 'ui.json' }
 { 'include': 'authz.json' }
 { 'include': 'migration.json' }
+{ 'include': 'cpr.json' }
 { 'include': 'transaction.json' }
 { 'include': 'trace.json' }
 { 'include': 'compat.json' }
-- 
1.8.3.1


