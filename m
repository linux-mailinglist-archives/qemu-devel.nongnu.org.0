Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E7F3E31CE
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 00:32:55 +0200 (CEST)
Received: from localhost ([::1]:53112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC8Oc-0000Ji-VY
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 18:32:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1mC875-0002xv-IM
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 18:14:47 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:13076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1mC873-00052E-LV
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 18:14:47 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 176MC2S3023291; Fri, 6 Aug 2021 22:13:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=7wMaSno/Fh25MXUAXxVPxpEVPhxavP8Wm9st/teRymU=;
 b=1NwAUM5YNm7gKtOKKtCAVfL7Xnxw6YDAKxkcKGsBBfzOQfsSdDgTcSd0SLMoy14wG6BD
 WFcq2rocmjnOdyHPHlj0/rpLtSRmGsxsECXJ6P7b/ysLB+u1K9vU5Yid8Au0x7z/UFQq
 WlfJBoOalcJhproEBUgWsOzFlgue1PKG2l1YHcgzL22Mm6x1z4R6NbEenBehWdivucMs
 xMuWt2ZSqP91UGpSYZyGrm48AfQUmh2lzZM0+3p8N9ZPs36eW4ANde+VJIB8K5sIqnDO
 cwcuGXk/eZcyHcYaTMF8PbAWzAPOtTh8kBZLh+rXleZ2wvU1Y0G0Eg2RG+ZvgQsI5ROo UQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=7wMaSno/Fh25MXUAXxVPxpEVPhxavP8Wm9st/teRymU=;
 b=xTUhoBZSJk2RazFuJWnfhDJibqoEg1uiwFBuvZrAkt+3m3VbVWQP6l13b4oDKqvNLDZ8
 b86Z0B58mZLe/TgZVn5w9C2yk1SXR3Eij+Tt5E9FHjg5hG02DDy1n3BnsuIRkOvvBYp4
 bJyM1WNVLq63+Ua8GPvM+h7DmLJxBGPHOnokTHxrymXzqzTMvNRl/+bhwdxDMK4rgGm6
 ENR09TtHocDzZ5kYmQratzkkxLGS7azaK+hRVR5FcZLpM9Jq55la7Dw7PgTxwiOAA7t6
 8ZkUcL+KXXzfduLpRoycDt3XKfKOOBDcXMUdUAmf/qZCfU766lxfc+r03rY59/GCTw/I xQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3a8vy3t4y4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 Aug 2021 22:13:40 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 176MBgJN181317;
 Fri, 6 Aug 2021 22:13:39 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
 by userp3020.oracle.com with ESMTP id 3a5ga30fk0-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 Aug 2021 22:13:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cwwLsH7rDNSsnH8KI9kN7PM6co/w7+gny2RGNhzBOeyj+R5io8i47hB7HJ+90o9VQ0bmd8zqwJTvHbyrNxB3qeND3rIljoO/DHEbx8jyqawkdGkSKdfE3wM+3jb4IjO+EO4KZWghxqMlPg1FENFwRW4mxLrZuA8LKxdM92yrbJov0h2x0OQOZpylfPzcXFXzZD8m5/05HB1SgYD953p3trsZgqwglYjYQi2+2xpuTkJBb6IcMHGcRRnRWD0uREl4wVYpNzHITUMfCOwG5QOtVgGw8l9eVkqZTd7tBvpDlVABUrRW3W0uC3OkVur/JafeI0XPNx9DZMZNX38/q865Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7wMaSno/Fh25MXUAXxVPxpEVPhxavP8Wm9st/teRymU=;
 b=eEHnGpHxputHlz2sbrvmFtxKLeJaBaYEejQHLw0i8fKj5IHqgZ3xAE4j9SPsleHTewrInG2G+pGLd5mJJGtH7gkmMhHN5M1qZ3QJ4a3wSK9t/FgusyJ49t2oZfLCiNOsW0Du9jdQyWdLkBfmBM69vcE42Tvvny/WGcBOZF25KZp+PgpvoZocgDpb4H5Wl//UadzHXkwqjXKBXzkLpspSg2T6uaDipHoa2xv4Xw1OAvOUedw856t1wDbwFPHkYZbdzXs7v9uKvy7r8rfqrgL0N5v10q2n67UFfXS0nH4aRBmjrU+CBi24G+gOpbRYkBJQEf1YL0FtULdXiZmYaNsDLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7wMaSno/Fh25MXUAXxVPxpEVPhxavP8Wm9st/teRymU=;
 b=UNxnQdpWyZbPkVMMNuHhthpizWrt3aHaPfo9QM2MInjCkDghxf7A5ScZIsGMzO1vz0J/BhwsTyGeWX3+AnK613iHYo9A65VaiwnSPLGHeQHDhK38bE3At2QPZCmE5SK2OvOSR7qZN9hFi+Sk21YGgsJ2DrT1k7FeOQwOcZYGKIU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by SJ0PR10MB4734.namprd10.prod.outlook.com (2603:10b6:a03:2d2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Fri, 6 Aug
 2021 22:13:38 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::99fe:4091:351d:11e3]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::99fe:4091:351d:11e3%5]) with mapi id 15.20.4373.028; Fri, 6 Aug 2021
 22:13:38 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V6 24/27] chardev: cpr for simple devices
Date: Fri,  6 Aug 2021 14:43:58 -0700
Message-Id: <1628286241-217457-25-git-send-email-steven.sistare@oracle.com>
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
 15.20.4394.16 via Frontend Transport; Fri, 6 Aug 2021 22:13:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 58d98d1a-2bc3-4869-8630-08d959277095
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4734:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB473405AE2AEE00D8A2CF0978F9F39@SJ0PR10MB4734.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:281;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cgRTPrDXiHM75XuRYQpWJLlAUgj3GVFnUeXijYJ3/AJZ1WIlUct0hDKmwEcXFgu+ADlLp++bmuFdp22fhBHnYa4Bb8Iwsiu4tprZSU7OS8l2k4mMyFzD9EgGUmGcCnIdJnVDnLk0Pmjz/I1JhcrSmpO4abz6o8oT8E+S4MhKbC3QVOC+wscmWJ7kAjTHUUWB5OA9lZPowG7l75Vc/YRJJmhsYCwy9CQYifRp+XEPnz/ZbLqmznZ0qz93fxsWkNxCsAJua8/KGr8A+hiu1w2ngQE62Q2nYNr7lZSaqwtLjemQX6JpatZlstJJHFhqc4Uy9W9e6sAZkdJWDtZHYgRa8OUjQYVKuPCmf5yFJAO8H2YuQhqGh2W7dRBsgBqL26WrXE5BoaV1H6hi7dpqzA+/6+SsfJgO2vJiMEh7vXhy2hCUXwdGEiva8f04hq9NxThP2MPAtq+tbMMhF4XmJZ0OLgFaKXYNN8mNBgjWx5zvgRF+N1hc31Gas6CJSWlAeEJZVdIfs64cjSNhAolAZJTSft7eZz6bQ1MoK4Rblo3hPYxP7fypIkAVakDxCReqbU4Q4rv46FQaTfHeelLaKmuN5hKUsn5wZhHJEZ3OBLdnrigvFAArNhkpumBJutvt/QwMpSAZX16I9OzbBES0XwN86fRGxO0ERLNZTkKJlPjMnHZlxdfZGKbLfXW3QEZtmeHgqN79OeBjUo+ygcmtz78yqQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(396003)(376002)(136003)(366004)(346002)(66946007)(107886003)(66476007)(8936002)(86362001)(316002)(83380400001)(54906003)(8676002)(66556008)(4326008)(36756003)(956004)(6666004)(26005)(186003)(2616005)(478600001)(7416002)(6916009)(5660300002)(2906002)(52116002)(7696005)(38100700002)(38350700002)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fa8XbD1jG9uCxn7MScFKy6szLf99WeIPJjkB29xe7rlpDrEeHpxP4e7XrsFV?=
 =?us-ascii?Q?FPdZTclcKyPZpFOe44JqZuxJXXTlcWvaM6NEy+4+xBpRHOP8aJUCxiipQma8?=
 =?us-ascii?Q?dkGKB+V8MD4Y82425C0c27/fl52hwdFn7xkwe/CzY7dZZXqp/lbZZooxFsT3?=
 =?us-ascii?Q?RN5bR3D6VfWsZwQ0r5m8e2d4+NkMlGJSNTPTgLQrshaSafSB/cucHLTf9tXV?=
 =?us-ascii?Q?4wwLZqqBSi10VHbbvnwPKaurrbHAJ/UWWFvN0gaeRTMFGMrGjaR5meQ3Makz?=
 =?us-ascii?Q?ZmLV2V0uNVpJuI2M8NiH+aDmvGPQaPhhzu4F5mwEy7kPbxxXWncsvkjp0SvO?=
 =?us-ascii?Q?jxUImhnHuSBOd9aSlUzBdRZWWsA12Cb2xBAoH23Nly5zEbnmTwVtziMHSfOR?=
 =?us-ascii?Q?VS6/DpS9uvITs74blce44JznFdi8jS2IvXn53xVGYbfs0rTGpiXV+Su1I5I/?=
 =?us-ascii?Q?tM8bctNFkdnZPBzuua/8S7yXRFoR2pKJjdD1YDQClY/6mJETR7/NHbnDQzfP?=
 =?us-ascii?Q?qELEDfqY1QytAkzVlPwlWMsbK8Q+oztykDCIdU8U6MseQE3+nSK7f6uUVai/?=
 =?us-ascii?Q?hGUL5kWAuyiDiCLClgHc+GP7q2aSRoSNpilvj0yF/UCu/l80AetwE1oRSOHw?=
 =?us-ascii?Q?IWaHJkCMtoK7WDOwvJ22DhTH4CJ2rkiB3tPe+x/vMfxKz5zi/1pD6EdKoC1u?=
 =?us-ascii?Q?YC5Tyl/UI/84w6PfLjDq/kso2oHCUkgjHvGU5oINLmFJHpjA43Y+eUUeKGkF?=
 =?us-ascii?Q?2VLphyWA0sQIlFEL0J7CtolW2l+KROfciPc1IFStZR8/ONvCT3FuiFHXzQBB?=
 =?us-ascii?Q?YxNHNMV9hNEIU1yiy4Xy41Krg3hbeap77ZQHraqGDqNvLPStYIqcjkosCzGj?=
 =?us-ascii?Q?o9rmQOZmxIQQWm+DslUn2BLOrx2u2cVl+BX6FU1taJ/Mq/EwMY7z3rO6fr9E?=
 =?us-ascii?Q?//ad9ftgiCacLRQEe8bFeAclqbh4fVqHtR2cbjGrh4SYeexpNxJ8yD6PrOvf?=
 =?us-ascii?Q?jhxbrcec0hnXRaM73tK6lUAGAOPW/+CAlEjsSdrA8SYISIcEQAuhNXwMg011?=
 =?us-ascii?Q?C40dOdz1Y2DiPIPr9ZDtS5wlYHqoUYsaayvRyKv93NMptp28P4i3CAlQsKnS?=
 =?us-ascii?Q?sARVpkOoahV6bNVMRjs9yVrBFB4pExiIQoz/lCOMbooPfrtBVwN+mzC9RtQN?=
 =?us-ascii?Q?ZgtiQg48g7Sum2sC8vufHtMmdjs0fQoOFxFvn8pNe6Kto8RePrDvlG8Rt8uC?=
 =?us-ascii?Q?FWOENrHBcwXBGllAVyzahtbrX7Csygudo+a1XMl/0CzIOH8C4l7cSY1t3gBZ?=
 =?us-ascii?Q?BPIk8E89rmac7P6vFR8FV0ja?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58d98d1a-2bc3-4869-8630-08d959277095
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2021 22:13:37.8678 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hm8f+PbpDELxLVziNSzRbF86TP+BOHGW6HC4KyAwTkMU/yrjkciWqR4OiwNkN7PMGjxhCqsnUg/OdWbNdbeFcIbAfXSI0bwowsMzNNJsjM8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4734
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10068
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 phishscore=0
 spamscore=0 adultscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108060145
X-Proofpoint-GUID: em-lCe8bGZevPqfyzTBQDJ-IaGg0dagv
X-Proofpoint-ORIG-GUID: em-lCe8bGZevPqfyzTBQDJ-IaGg0dagv
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

Set QEMU_CHAR_FEATURE_CPR for devices that trivially support cpr.
char-stdio is slightly less trivial.  Allow the gdb server by
closing it on exec.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 chardev/char-mux.c     | 1 +
 chardev/char-null.c    | 1 +
 chardev/char-serial.c  | 1 +
 chardev/char-stdio.c   | 8 ++++++++
 gdbstub.c              | 1 +
 include/chardev/char.h | 1 +
 migration/cpr.c        | 1 +
 7 files changed, 14 insertions(+)

diff --git a/chardev/char-mux.c b/chardev/char-mux.c
index 5baf419..bf7bad9 100644
--- a/chardev/char-mux.c
+++ b/chardev/char-mux.c
@@ -336,6 +336,7 @@ static void qemu_chr_open_mux(Chardev *chr,
      */
     *be_opened = muxes_opened;
     qemu_chr_fe_init(&d->chr, drv, errp);
+    qemu_chr_set_feature(chr, QEMU_CHAR_FEATURE_CPR);
 }
 
 static void qemu_chr_parse_mux(QemuOpts *opts, ChardevBackend *backend,
diff --git a/chardev/char-null.c b/chardev/char-null.c
index 1c6a290..02acaff 100644
--- a/chardev/char-null.c
+++ b/chardev/char-null.c
@@ -32,6 +32,7 @@ static void null_chr_open(Chardev *chr,
                           Error **errp)
 {
     *be_opened = false;
+    qemu_chr_set_feature(chr, QEMU_CHAR_FEATURE_CPR);
 }
 
 static void char_null_class_init(ObjectClass *oc, void *data)
diff --git a/chardev/char-serial.c b/chardev/char-serial.c
index 7c3d84a..b585085 100644
--- a/chardev/char-serial.c
+++ b/chardev/char-serial.c
@@ -274,6 +274,7 @@ static void qmp_chardev_open_serial(Chardev *chr,
     qemu_set_nonblock(fd);
     tty_serial_init(fd, 115200, 'N', 8, 1);
 
+    qemu_chr_set_feature(chr, QEMU_CHAR_FEATURE_CPR);
     qemu_chr_open_fd(chr, fd, fd);
 }
 #endif /* __linux__ || __sun__ */
diff --git a/chardev/char-stdio.c b/chardev/char-stdio.c
index 403da30..9410c16 100644
--- a/chardev/char-stdio.c
+++ b/chardev/char-stdio.c
@@ -114,9 +114,17 @@ static void qemu_chr_open_stdio(Chardev *chr,
 
     stdio_allow_signal = !opts->has_signal || opts->signal;
     qemu_chr_set_echo_stdio(chr, false);
+    qemu_chr_set_feature(chr, QEMU_CHAR_FEATURE_CPR);
 }
 #endif
 
+void qemu_term_exit(void)
+{
+#ifndef _WIN32
+    term_exit();
+#endif
+}
+
 static void qemu_chr_parse_stdio(QemuOpts *opts, ChardevBackend *backend,
                                  Error **errp)
 {
diff --git a/gdbstub.c b/gdbstub.c
index 52bde5b..5210a3f 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -3534,6 +3534,7 @@ int gdbserver_start(const char *device)
         mon_chr = gdbserver_state.mon_chr;
         reset_gdbserver_state();
     }
+    mon_chr->reopen_on_cpr = true;
 
     create_processes(&gdbserver_state);
 
diff --git a/include/chardev/char.h b/include/chardev/char.h
index 3fa3528..187c665 100644
--- a/include/chardev/char.h
+++ b/include/chardev/char.h
@@ -295,5 +295,6 @@ void resume_mux_open(void);
 void qemu_chr_parse_vc(QemuOpts *opts, ChardevBackend *backend, Error **errp);
 
 bool qemu_chr_is_cpr_capable(Error **errp);
+void qemu_term_exit(void);
 
 #endif
diff --git a/migration/cpr.c b/migration/cpr.c
index 62b2d51..d14bc5a 100644
--- a/migration/cpr.c
+++ b/migration/cpr.c
@@ -119,6 +119,7 @@ void qmp_cpr_exec(strList *args, Error **errp)
         return;
     }
     vhost_dev_reset_all();
+    qemu_term_exit();
     qemu_system_exec_request(args);
 }
 
-- 
1.8.3.1


