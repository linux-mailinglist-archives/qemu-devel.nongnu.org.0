Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 640BA3E319F
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 00:18:46 +0200 (CEST)
Received: from localhost ([::1]:36736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC8Av-0003UV-E5
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 18:18:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1mC85d-0006kc-MU
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 18:13:17 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:19910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1mC85b-000475-TI
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 18:13:17 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 176MBjrI007313; Fri, 6 Aug 2021 22:13:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=DFKu5QoHSkTuVBKFWGCp01oukjx5plIhmfU+c9tbqxE=;
 b=H3EkGsuEs6hCPO5Xx6DDvtZqQ8U1sqVbmLMnGkXyiA1f2LNh/I+mzuVLe2uLatHs8SLA
 bC8wL7yUFPsdn2y6ZSywULfMSHNN4ymzCXV2NlY/ZJzPbllgbRXrTIi9NnbQMvrYxozh
 r14ouZtxuiisRdJyE4MbJMZm09DgKtstrfvqRLfn4keaBpjxcnjEfm2S/pu8cZGnD9XL
 2P5kXWWNTyJvsNMr37IDWhB7JfpuY9JF9ebxb/uuBYYUsf/11PpoZWzrvp/dxlLaaj2e
 t4ZQHCEt+nmlkO6hMtIn0LMTTX2t6GSc0nGKndEUP1cO8OpHMJ1lE52QXfrMMnFObHho vg== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=DFKu5QoHSkTuVBKFWGCp01oukjx5plIhmfU+c9tbqxE=;
 b=xBf+tuxs8uaGepww8MbQZi9tyQG5HMZR18LENqi+2Ttt86OEyNKw7ctwHtwcdFXOMryU
 Tf2V2eP1fDLaZtqh+LFXydQgjNSJoXYPxZU8nD7JYo7tjdGTmG4QLsWpruzZcsgfQAqV
 edo2LXtV/qCcRCb0ioU5OfLZOIHGbXzETQvo740VPzZnE1iLiCa71+eQd3yYjpktkkHb
 vJshrIUyQ0E4h8f5wb5WwKvqw90fCD4azP4UTC+Q6I+H/zKN9T7jdX9j/qaJBsAZJBYe
 AVGfJBR9RHA4U6MnDAUdP4U7uF2nmWQor9oepHwMNLRvqxxBpmXykHrt/udIkScyWSWh pA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3a8p6rjpm7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 Aug 2021 22:13:10 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 176MBlK7032734;
 Fri, 6 Aug 2021 22:13:09 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
 by aserp3030.oracle.com with ESMTP id 3a78db75hh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 Aug 2021 22:13:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c9rcbM7I4JDYNCFz5hCgj3mNxFPVrP9PWuGiQfEj6RF7dWpmuf51UQEaVYU0091IUmoVS89q5F1TSFw3NVZZDmNkB8hZQEczqRt1ejdIJP84zYpnUFmdyNsBuqTxZwt6m5ouJ0VlnUu6VqLjEJ4CrROQDIbFq+zGZWbXb8zx7T5eu+9Hc682MMPPkTXxEwGGCpumJS5sKW6uK49sRpWwqPuyZguqezpwGVg9lizOdWmPmP6Te2qZ7RPyMe9Tt9nxpK9nBU80Txwjxrf+NbfC9bUN1fHAq0XA2WawoS2U8uG/LZdsKCNy0LeG58cwypGeHjxyEodnebmpDKVisr/zPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DFKu5QoHSkTuVBKFWGCp01oukjx5plIhmfU+c9tbqxE=;
 b=DRGKrQj6uoZKnti0hya9tKoVYqXLcq6LasfBJoXr1WCmWoeAdS/r4N18omui3+d6/6mvV0YrFgzlAmK98XQ9rydKKdTdtfWraFBzuX04Hzlvjn9s7QIwONYDO9lkwQBibDB3aF/f4OqRhQBExuMpBBKcIVQgLXs/YYr47BnREyIfTz7FzOKmHyEqpKUdP5PIY4IK7JGteyr77P9T7qtlfY3bm5c3QEA43PUVADYBZD+SE3zeifVNFDIOCCYt0MyAQd7sfTTOKLwvwM/L1c2JlZt6bG3jGpmayxubuD38IN+cUPbffg7BcOpxIbU7arcjqzLMIN7iVKqt7e4/v5XlUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DFKu5QoHSkTuVBKFWGCp01oukjx5plIhmfU+c9tbqxE=;
 b=hXEP6dFcGrhOyAXyN67bM0XIlrzhomS1NgEFJRkVnfRIPaY2PE9CTzLmbVF0JEdIZlknFUgTSoTgDktWXp0qHf4C+KzTto9T8mjwd+ImAcRvnF92qLVtzO1azjvTz6pxEAcOboeEH44T8WIAuSfAc/ZQpofp2WF47xE0MquNeHA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by SJ0PR10MB4734.namprd10.prod.outlook.com (2603:10b6:a03:2d2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Fri, 6 Aug
 2021 22:13:07 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::99fe:4091:351d:11e3]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::99fe:4091:351d:11e3%5]) with mapi id 15.20.4373.028; Fri, 6 Aug 2021
 22:13:07 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V6 08/27] memory: flat section iterator
Date: Fri,  6 Aug 2021 14:43:42 -0700
Message-Id: <1628286241-217457-9-git-send-email-steven.sistare@oracle.com>
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
 15.20.4394.16 via Frontend Transport; Fri, 6 Aug 2021 22:13:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 43ea2f52-60a6-484c-bdd0-08d959275e86
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4734:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB473469C10FE73C13C0EDF87AF9F39@SJ0PR10MB4734.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hu1hRyt5Y1qAxOyco8I3Vovkwd1lWVGsf0cYKbIBB7gjU+Y9Phpk8TcEHv5UvmzVU/LHLqWIdYXb2Tej9vQYc069lrzh9xN5Txv18QkzvHqKkss03TrM/r8LMAVqoMWyryrdKhYnGO7S54/m/ExrfOVCzascsBHEqHYjF9UyOuHptSzfLU2hSKwiBtxdPyPvp7wX9kxMmBUQcTM2svDpt45/yECxDT/pfyW1gAekUn9p8W76788t4Ky44R+w5ksvLqoqItuOAQ0syuPDgd4/UIUb4qNWE8VYvlnfDUfgU1Jp5kmDemkCrNU/5Ov7vDY+KhOs5aXL6GL3sfe0isg82REBwV0g0MeM/VMtaVDE3/Qsv/1rZM5H4c0l6wuIu8/R7rBxHPAC66vO4t15oLHiqoI1S8E96Rq6lxMAlnyMYwIC/RxRMH5w2pBvu2kpfl6OgjOd57NlZ1VovKOAxXlsPgEE+F7EE/uA4s8irNloTyGc0e0M2WmU7qSUSmnEsJYURYDVFDcxsxta1SPPG1+YwSVsdh7cCs3bRQvha5daeh+z8JQaApDo+4XfVlyBcPphXyrRFKKHfIqgt4pIm4ufKEcAEBzqdRWCcQe6DwwQSPdeaNJZaxlOIa4bVs0HGs3+yez+gtoZsvMkF5aXoxqW1j2h1wTLUuOjByBGeMor4qVQ96pGFO2tcxbT1aYAgS+HHX0oNM+fFv2nYGaWg7j5HA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(396003)(376002)(136003)(366004)(346002)(66946007)(107886003)(66476007)(8936002)(86362001)(316002)(83380400001)(54906003)(8676002)(66556008)(4326008)(36756003)(956004)(6666004)(26005)(186003)(2616005)(478600001)(7416002)(6916009)(5660300002)(2906002)(52116002)(7696005)(38100700002)(38350700002)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?08XVynwRs8adaK/HnrwcYgIVezIAXOp6o2zRrnpqOHeF+4dMrQeSkkpkmm8X?=
 =?us-ascii?Q?AR6nA0BIi2yN/zQbvfiNmv4JLAT1NsbYWiG4+dM1tMEF3PtAp7fQpeX1idWP?=
 =?us-ascii?Q?Y1lOuwUZlf3pWm8kyR9HcmXLMTWqyUcnSkz52SGE37nZAmB3089w2hPe4XeE?=
 =?us-ascii?Q?XgKIACYPz+UhkTMUyVfNkxt43oYexOi3+HBazjtBQO0mvKV9Ba3kPh3SHkqD?=
 =?us-ascii?Q?U3bdkogljYQ0hjz6GP56c+jfZzkvmrvnzuKXWw5Sh12+qcmYSaV1dk1yeSXt?=
 =?us-ascii?Q?I5OBzP9GvzbewvpBr8po810cMlaYkHiJFenpeJTOzdaEM81v5kM4wQqIYQnX?=
 =?us-ascii?Q?BiG4l9L5cJtSErN6WTgW9PTQI/y8wLbU+ke1xEc02eV/dxFUtFHVRCbfi5LV?=
 =?us-ascii?Q?VgX98vUBZVvbmt24QFgyTzA3LHxZMihoAntBUIJLJ3SuFqXlvXfgn9jKQoQY?=
 =?us-ascii?Q?Tve7NYc9efpCR83Tm0aXzo4Kelyn+0RFKHkBzyxTmea4ZKqhA7vwlb2xGO0c?=
 =?us-ascii?Q?PqNMwgKyCyUmmxK5+EC37uIGuzvMJgCR1kw5SXokyVAUJOdVV1IMpJAsx9kQ?=
 =?us-ascii?Q?zI0v6UemAwYO2VdiPKLRi/LscL2XLcas9yHjgvuLaYNKaiWxnWYn0ADO68yI?=
 =?us-ascii?Q?nfm9myx0AH5Y/pD57Lso9+l6Z7chcl4LmjoV30bZ6luZaMvfoJteX64Cz8MP?=
 =?us-ascii?Q?ZNXMTFVGOQhMLwuGBKmQAEa3veoxfg5If2eQMppaC2fxBROZ23CRv6sCCnSl?=
 =?us-ascii?Q?0Lfbnx8XiQIE5InyTO7fQWiXZaKQ5sVSZR89e3s+NWTd+6/jEOdPWX1DpF9b?=
 =?us-ascii?Q?QQD2bAW00KlZWinL6/hUuum06uyTGoiFwX/AtHjgnyMESasyoq4KzzbAOM54?=
 =?us-ascii?Q?3XAZ3Xrr5eWXFykEoq9BFjUrXrfkkfrENNc/wiW6/0z4Zv6sftA/ZNenL4Jv?=
 =?us-ascii?Q?1kJ6lNdLZUWOqtlVAOsg+RfkIPaekZWEqjKLPBLlo/Nc45ilUkobUvnoU3AG?=
 =?us-ascii?Q?BqltvbaIhUF8H0piO0XnQOz63r5gcUjbYt6nU31RnMJJ2OUFkoaf5a8C0CqQ?=
 =?us-ascii?Q?cX78UnJy7gJ7HY3NsdCPQmAOwhHarFFTenvoQg1sfbkLzOWfowne1zUw8Vte?=
 =?us-ascii?Q?fh0jBEqphp9T6exQhZm21fxyszC0Wx2pcAqsh9Uf9mlJhLOZgi/p/Dr2eLNB?=
 =?us-ascii?Q?F8zPgjGstcTj1tfdhqumW0JKLiEbweBCstVW+lyTb/k5tDgHQL69XwG1zyuJ?=
 =?us-ascii?Q?2g4YScoM7BuoD7oXJV5e+mpAUEarMt9oIElmVamCRhFiOUhb68c2u6uc2hp7?=
 =?us-ascii?Q?MuLyycwJLE5iDsC9vYevcmrM?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43ea2f52-60a6-484c-bdd0-08d959275e86
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2021 22:13:07.5350 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0AKWHpokTKwDTkGONO0q6t9MCiuf+Uv5UEqfnigMbcLaqO/QTYxS1P8x6tUYxL6wkf71keoJbJLkRHgFvb55N1grLfdsbbfv/ua1/i6yoRg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4734
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10068
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0 adultscore=0
 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108060145
X-Proofpoint-ORIG-GUID: -YH3UAo7QBAQMKy8n6GLAZpWswM8g0Ij
X-Proofpoint-GUID: -YH3UAo7QBAQMKy8n6GLAZpWswM8g0Ij
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

Add an iterator over the sections of a flattened address space.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 include/exec/memory.h | 31 +++++++++++++++++++++++++++++++
 softmmu/memory.c      | 20 ++++++++++++++++++++
 2 files changed, 51 insertions(+)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 0e6d364..2bb6772 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -2286,6 +2286,37 @@ void memory_region_set_ram_discard_manager(MemoryRegion *mr,
                                            RamDiscardManager *rdm);
 
 /**
+ * memory_region_section_cb: callback for address_space_flat_for_each_section()
+ *
+ * @s: MemoryRegionSection of the range
+ * @opaque: data pointer passed to address_space_flat_for_each_section()
+ * @errp: error message, returned to the address_space_flat_for_each_section
+ *        caller.
+ *
+ * Returns: non-zero to stop the iteration, and 0 to continue.  The same
+ * non-zero value is returned to the address_space_flat_for_each_section caller.
+ */
+
+typedef int (*memory_region_section_cb)(MemoryRegionSection *s,
+                                        void *opaque,
+                                        Error **errp);
+
+/**
+ * address_space_flat_for_each_section: walk the ranges in the address space
+ * flat view and call @func for each.  Return 0 on success, else return non-zero
+ * with a message in @errp.
+ *
+ * @as: target address space
+ * @func: callback function
+ * @opaque: passed to @func
+ * @errp: passed to @func
+ */
+int address_space_flat_for_each_section(AddressSpace *as,
+                                        memory_region_section_cb func,
+                                        void *opaque,
+                                        Error **errp);
+
+/**
  * memory_region_find: translate an address/size relative to a
  * MemoryRegion into a #MemoryRegionSection.
  *
diff --git a/softmmu/memory.c b/softmmu/memory.c
index e143692..45952fc 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -2645,6 +2645,26 @@ bool memory_region_is_mapped(MemoryRegion *mr)
     return mr->container ? true : false;
 }
 
+int address_space_flat_for_each_section(AddressSpace *as,
+                                        memory_region_section_cb func,
+                                        void *opaque,
+                                        Error **errp)
+{
+    FlatView *view = address_space_get_flatview(as);
+    FlatRange *fr;
+    int ret;
+
+    FOR_EACH_FLAT_RANGE(fr, view) {
+        MemoryRegionSection section = section_from_flat_range(fr, view);
+        ret = func(&section, opaque, errp);
+        if (ret) {
+            return ret;
+        }
+    }
+
+    return 0;
+}
+
 /* Same as memory_region_find, but it does not add a reference to the
  * returned region.  It must be called from an RCU critical section.
  */
-- 
1.8.3.1


