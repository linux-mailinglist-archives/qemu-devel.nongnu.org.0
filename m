Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34AEC3E3192
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 00:14:45 +0200 (CEST)
Received: from localhost ([::1]:48184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC872-0000ka-86
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 18:14:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1mC85U-0006J8-NZ
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 18:13:08 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:8272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1mC85S-00040U-V8
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 18:13:08 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 176MC34m023309; Fri, 6 Aug 2021 22:13:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=emhj1NmXHkHVB4VTfPgnA0+3jmB42gCz4diX8NR9d8o=;
 b=0RJnoV8EjjS0+De1YoKSWnVJ0tdAPN13ABbzarnxClgRNDQMNeV9v8nhaYJAbvtALi5b
 Jsm9h56mKSpxgMA9kyvWnf6UoWJ3bFini9GxTIfCq8PmWIh5LAlFDFtUyo7WXTz7GHmn
 +PBQMfvRVM5gbFgVZOA310c/MknHKLEBPz++Y2TWPzSdoO1WqR5a4Gg0J1Dd2Ed9YKQN
 aV5CryQ6s86nCSIDXfRBABAkyKVhkFYHcwQzVAWUlzvSkSCm9bhi3obbiua1fJPcJtKi
 bJ8JwOyCD2MlTd5LqY+kHGjj4uocCXWyn893zk5ihSOGkCxJqVLGqSQAaGHbtJG/CB/g mg== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=emhj1NmXHkHVB4VTfPgnA0+3jmB42gCz4diX8NR9d8o=;
 b=VyWu02qJAae/11lw0FAMkxR6B7hsi+VxdSPK3eNEtwSErR+rmH8KSjHsT4gi++8kL4Ek
 eqLzQF44y1dIwft1Z+vg3z8Rc49EDbcKJM1aaiu+XEY/ZYY9StpFYVsGzPRlaDx2Tn2M
 pw4YrZdRa6k1klB0ON5UqWVcB/iZcCS5WzYjlOYw5Ig0vrK9oBe/+YYd0xKdXoxwyfqa
 35kGXRhk9nUrUNoTS3XMiVcXrchfDk8rGG6FoZo2zR7WoVLDaZMns2Qc/rRtCj8iUoiF
 yPkFryMYL8ZZ0OKUySLV14bpc8m1cbFfJp2ALN8Whuv/I/wDzrAAX98ZfNrbZRiE49W9 pg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3a8vy3t4xb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 Aug 2021 22:13:01 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 176MBh6L032630;
 Fri, 6 Aug 2021 22:13:00 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2177.outbound.protection.outlook.com [104.47.58.177])
 by aserp3030.oracle.com with ESMTP id 3a78db75cd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 Aug 2021 22:12:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gOdaWKJtte5IALrjYwhxxcHvvWFJeOyKWa1kKjDWAw4hcIJ56t+bfRhpG+pnAFgYXU4xrtfEwZkax5Qat1DinUJDYioEU1kX4ELcMLPojTrc6VxM4MpRUSh8dOP6EYdbJ6iMs4aVJz06pNLbFbUmzGb5RPaBkpQjnbk1QGFoBKnP3DvP6/qt7UrT4Cl1NxaTWmFVIaLzyUEXpLfcUQZUOYi33gjpaZ2Z9gdHAbxqVodOscUV6nzqsmT++FKFJ3YWEGWf7aPE+KaORwvkqKUwjqO4NXQEk+6GGCkmxmJSXpmQSEJsuXGydROdmTgfWFdEknSxPOY0kdxLlZjYfl1s7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=emhj1NmXHkHVB4VTfPgnA0+3jmB42gCz4diX8NR9d8o=;
 b=EDPeY0wX34KQOi0xnswWKypWNDJrQshj556S1SKh9JY64y5oW06sqXo8ZhgoxEnAxBEh253ZtvzXZXCwBWW+LN1tjck8dtDD03lgl/Z2Uv34QDTNTsjptHq4oVDEwbxjtaRxgPIUN80anu0MxKLZTBNxihOooBZ0Il99Fn8IWRIbWN2tF6rmTqgnjNYe4xEjFAWzjb7uvI+MMAggoaVc54zlF1RcdUCcmS6vsranfmHz94TWCOmwLLEhzGZaB4oEgA9LLKaDkURk4pZHXYWI8y+lfvZGCPdQImGWX1fmSehrvwOfbnX7tGhTiPANTCsEvSTxWSrv3Xk8j0z/Xsc9oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=emhj1NmXHkHVB4VTfPgnA0+3jmB42gCz4diX8NR9d8o=;
 b=piWJU4OZ+YoKBqbSr75R3FNI+p31KV2M4bqgzx4VHY9o32juvnqK3WjFluyCkdSv/12QByKcosYdcS6WSQ7kVTKBNDlxt1FjRR5AIdofRhVpHYIe/I7g2NW/GVViO8SCEQgpkHgyHkAqltrpvk7DbLDY+alnMNamsDvrqutt900=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BY5PR10MB4324.namprd10.prod.outlook.com (2603:10b6:a03:205::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Fri, 6 Aug
 2021 22:12:57 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::99fe:4091:351d:11e3]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::99fe:4091:351d:11e3%5]) with mapi id 15.20.4373.028; Fri, 6 Aug 2021
 22:12:57 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V6 03/27] migration: qemu file wrappers
Date: Fri,  6 Aug 2021 14:43:37 -0700
Message-Id: <1628286241-217457-4-git-send-email-steven.sistare@oracle.com>
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
 15.20.4394.16 via Frontend Transport; Fri, 6 Aug 2021 22:12:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d64c4d44-661b-4f95-f016-08d9592758ad
X-MS-TrafficTypeDiagnostic: BY5PR10MB4324:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR10MB4324C0F3F071D5C906CD74C7F9F39@BY5PR10MB4324.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QxsX/GCQEU2lgD7edNT3kqqT4w6KIQ9jvN1/5mBxoyHcDqdNKmb5EsS4aQnxaqYPlhYpPHPkq8+ugJWU4NyzN9BVvnM/xKP6DQv863wZwCZxiIXuRlQ73PN5a2kN/BHaFp+vpttoRJato/mn1rciliWuQLnu5epgz80XzclqvU7PwPWDZcN2njaUJq/9gHoomb2lFyF8ZtrBH0mzXqj4XL9hkYGTYjgJp3VR7sbZQM7AJlT6wL8oavbGGkQnMG4CxciJHVeHmk6sZEzIQ4ll9uR5WPkvOb9VriHGY0SmxQITqZw+K5h1Zku4DaaCnb5xlOCFBbMOr9cR/uFPakQeLMZxZH4si1J7w9nEJZGPr67T5wRB9jFG4TKiDTdrgqVhu8KUX6oMYtOrDj6zm9ji2/L4lnJQQ4fSB2iE4eoHo0LRiOgO9w2/lktq2XxtMkLbyFiW/cmbzphFT0daGaTd82rwIHsjdQPPBzLt50q0j+qVpNFGpBQO3EymMc7r5B4NK8I3QahwKZpKiFAqlK2FooYl9+12m2TDJjwg9AhcNTYDa5NJwRuqn2i0SAmtmYQA7dgtQ2diJ1cHifdN6As31dKo+0/YEr4cPpkiS4QsQOCx/4KCjTCIBPNgxtjxXu8b1olEnQ+eZ2ijpicrtBZQP+4EXfOfWJNfpBv8OLfs5JXtaGMskSORNYYx5SMuDuqN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(508600001)(6916009)(2906002)(36756003)(956004)(107886003)(7696005)(4326008)(7416002)(52116002)(2616005)(54906003)(186003)(86362001)(66476007)(66556008)(6486002)(66946007)(38100700002)(38350700002)(6666004)(5660300002)(8936002)(8676002)(316002)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nfUhCYXRzMrwQMotjfIB23hEIclNs9bFV5/BM75F4pO3r4CXbpHDHt+Twl/Y?=
 =?us-ascii?Q?SnPI81cFFBS1L15kayMLr5Y0cPot/a1LEeWTyCBJtk4g+AaLpUrTod+BHV+5?=
 =?us-ascii?Q?gtVDGJWQ01IwbH5NPhhTllX76c1grqOvkvybrPL2OzzGCAxpdIUl146nlBiI?=
 =?us-ascii?Q?I3P+xv/RZ8BsuLl1dXZpBzLdj4hJuP9vVnqklm9dB7Wb++RLKAKaA7LEWLMz?=
 =?us-ascii?Q?WWiDyzXLA4rjDb9l+3p1Ho50rRfohSJCVgY6qT5uCwWlndfa9r5nQ7g0TJ24?=
 =?us-ascii?Q?1Yl75Hvx6Tuf8RJjzoKvJc1sGNIzm8v4PpdvE4GuywKxSMCPVC/uZcBJcehp?=
 =?us-ascii?Q?Yz3pBk7+AA6bqIQbfJ2N3laMn5W1/MTG/GzuKNYTmsk4zaZKOoSBVUWDNCqz?=
 =?us-ascii?Q?bg+2IrQpwW0tot0WkonW+zG8abygm71WCbY6pPbXvt2clIfof+OBQpG07tE9?=
 =?us-ascii?Q?kMo0THKJv7H7Wtc3M1drrnzvAp/oEtnuykAwHKJQoGfOh6kb09h/1ZW7q9PJ?=
 =?us-ascii?Q?m9M5HJn1OQQaVKI7wbuBVsaWWasqmxzDv21iUnW5tKtIMHfKcgdvTR3YVgYU?=
 =?us-ascii?Q?TmEP2lRCc6dRW+b0AyOuW/ZlMJvOu9mXApSH4eNVcMwBB+aS1vW1tEja1ON3?=
 =?us-ascii?Q?WSjKnNZaWybWzxM4VM2+DTaJaWQPKUhXmI4gbTha2MQdmfUmmOgw6neiIn/n?=
 =?us-ascii?Q?SRa2XEnQdH5pB9ksxIexeSpii4V58ShLfX3nCoK873uv2lTgmyskQaP2GLea?=
 =?us-ascii?Q?5NqEE0Pe+K/eDRVfZKeN/1mcjPEAKaX/Bpf7Szq6TmWHH0hX/LNcUyfN4K8u?=
 =?us-ascii?Q?hBhhoDHWceVUp19EF8eQjSa3XjdCJstUc/HC2WainpU88IMFmUca8wFgSXbd?=
 =?us-ascii?Q?UQmpeHZdQoOJW6iqpLWockVprGfF9FsXVuyJYiohwPMs/5/NA7NvHByrQOFn?=
 =?us-ascii?Q?5zpc7v0f61Cmg/uOAd4B+0bcqZl1diBWl7/dm3etV21KWydLxegi6gdw4BEf?=
 =?us-ascii?Q?JMlz7l3ox5staErcIev7WHHbRxVujLZeot9sEadmad7Uv13r1KJtiOJkLvjU?=
 =?us-ascii?Q?2MIYqkgwy3RGowQBAHeSYDWthvSYTG5wJ2pLZTzzr7Q470Ke2ttRy0brUiys?=
 =?us-ascii?Q?iyBmfU6vK8opS0Qj3Xo89PhBtrO1btgn2MvZC8TGQfpO3qRXu1Ot5ZVy3kwU?=
 =?us-ascii?Q?bserIykcONwcvR1gLbOOK6cZAYZhBJVlQC+Peb+LCTlIvRbN8FuGOyichlso?=
 =?us-ascii?Q?4FIG32AzvqeTl2hIYfFOemx0pLoydH3n1t63WqXEb3lU7WnuDb0IymXZeKXl?=
 =?us-ascii?Q?V5x5dmkiXQX3WMaEvYMkfC6s?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d64c4d44-661b-4f95-f016-08d9592758ad
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2021 22:12:57.7415 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CQad3itAHr42VrCkfrSHgNqPl22sWHX4/zprAYADyqJ1LQw12av9VF0S7rbpLVYC6fO3HbYmPysYYDNvzs9PuKbKULatKNfy3DKrIsk/z0k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4324
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10068
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0 adultscore=0
 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108060145
X-Proofpoint-GUID: oLIDN0yONmb0NGXbf1xiOQMRwbck1Sw9
X-Proofpoint-ORIG-GUID: oLIDN0yONmb0NGXbf1xiOQMRwbck1Sw9
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

Add qemu_file_open and qemu_fd_open to create QEMUFile objects for unix
files and file descriptors.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 migration/qemu-file-channel.c | 36 ++++++++++++++++++++++++++++++++++++
 migration/qemu-file-channel.h |  6 ++++++
 2 files changed, 42 insertions(+)

diff --git a/migration/qemu-file-channel.c b/migration/qemu-file-channel.c
index bb5a575..afb16d7 100644
--- a/migration/qemu-file-channel.c
+++ b/migration/qemu-file-channel.c
@@ -27,8 +27,10 @@
 #include "qemu-file.h"
 #include "io/channel-socket.h"
 #include "io/channel-tls.h"
+#include "io/channel-file.h"
 #include "qemu/iov.h"
 #include "qemu/yank.h"
+#include "qapi/error.h"
 #include "yank_functions.h"
 
 
@@ -192,3 +194,37 @@ QEMUFile *qemu_fopen_channel_output(QIOChannel *ioc)
     object_ref(OBJECT(ioc));
     return qemu_fopen_ops(ioc, &channel_output_ops, true);
 }
+
+QEMUFile *qemu_file_open(const char *path, int flags, int mode,
+                         const char *name, Error **errp)
+{
+    g_autoptr(QIOChannelFile) fioc = NULL;
+    QIOChannel *ioc;
+    QEMUFile *f;
+
+    if (flags & O_RDWR) {
+        error_setg(errp, "qemu_file_open %s: O_RDWR not supported", path);
+        return NULL;
+    }
+
+    fioc = qio_channel_file_new_path(path, flags, mode, errp);
+    if (!fioc) {
+        return NULL;
+    }
+
+    ioc = QIO_CHANNEL(fioc);
+    qio_channel_set_name(ioc, name);
+    f = (flags & O_WRONLY) ? qemu_fopen_channel_output(ioc) :
+                             qemu_fopen_channel_input(ioc);
+    return f;
+}
+
+QEMUFile *qemu_fd_open(int fd, bool writable, const char *name)
+{
+    g_autoptr(QIOChannelFile) fioc = qio_channel_file_new_fd(fd);
+    QIOChannel *ioc = QIO_CHANNEL(fioc);
+    QEMUFile *f = writable ? qemu_fopen_channel_output(ioc) :
+                             qemu_fopen_channel_input(ioc);
+    qio_channel_set_name(ioc, name);
+    return f;
+}
diff --git a/migration/qemu-file-channel.h b/migration/qemu-file-channel.h
index 0028a09..324ae2d 100644
--- a/migration/qemu-file-channel.h
+++ b/migration/qemu-file-channel.h
@@ -29,4 +29,10 @@
 
 QEMUFile *qemu_fopen_channel_input(QIOChannel *ioc);
 QEMUFile *qemu_fopen_channel_output(QIOChannel *ioc);
+
+QEMUFile *qemu_file_open(const char *path, int flags, int mode,
+                         const char *name, Error **errp);
+
+QEMUFile *qemu_fd_open(int fd, bool writable, const char *name);
+
 #endif
-- 
1.8.3.1


