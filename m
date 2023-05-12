Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA85B700A5F
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 16:34:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxTpN-0007tN-67; Fri, 12 May 2023 10:33:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pxTpH-0007qY-JU
 for qemu-devel@nongnu.org; Fri, 12 May 2023 10:32:55 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pxTpD-0002af-Nq
 for qemu-devel@nongnu.org; Fri, 12 May 2023 10:32:55 -0400
Received: from pps.filterd (m0127842.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34C9Qahx020415; Fri, 12 May 2023 07:32:48 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=proofpoint20171006;
 bh=btBHOJqvJHL9jNSXJhi6SpL8+Nb4Y9uxWKWgCwwjAbc=;
 b=Lc4fqnNI3pn6SsmjABsQ8MDNWdlQJ7CnklHovfDMebSI8X/n6WYhO6BVeqPL04Kj123J
 4nEv2TeCeT6ZSLtrIqY/CmnhDm52B0pWT1WcI6f6ALHXlqW+GcCSziwzzcbPlv0hxWsy
 mT8FUV4BXiZnbUmJm02+K0rB7Q80EGFymECDXIAx7avzOPhxzFgoC37Z8YitKjlOCv2M
 gt/R7yQxTK5I9Xbkv/rene63w2+VuN33EszPWJs2Ydmk7OjlsVYZfmpg9fgGKjODoUTE
 WUJcegrxXReKOwhbqgaVF3CX7iAC6OKNQhdLm8aKOm0lqMrNFF9JvNN306+NFSnLnxJX cQ== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3qf835sx3k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 May 2023 07:32:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZTbzVPKZwM+uE2a3FAxOOZUu1xhT6SQEl8o7akX7dNxMZYFQJrfVf5vM/Ie51tGBxOmWCxiAM4esNZtYYJgDtQFHo9WOof0iuylHwngirx2N4AC0xT93jgNa6iP0ld24YAGcUalMe6yidB2bylgyNVKT6T8Y7/k0xSDZAWnJVDKzV0nBzOOKRnc43vBcda7nmJjr3I3ICfYs/l4+FfJWI55u7Vy03XvwK5uetRTDgmojHYRabAeGMRThoqkhVw3aOiuEBGpUth3xDU979EIyszitZ38je0JXVVWvuBlhXnW8iHbRfIH6OYDQ95H9uusZYo0R9uf2bsZxbvWWDX4z7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=btBHOJqvJHL9jNSXJhi6SpL8+Nb4Y9uxWKWgCwwjAbc=;
 b=WjNTRC4H5AZFAw11L0h4owqbZjZoROR8LdL6UiF1CVWl2PcBy0gFhcPM7N5O7LPxLiMGYg2FNBIpzsnD2ewkk1nA6mAnVAx4qNxAxdLocG4DfPrGgwYxoh/0m+Dfe+VNATYG2hLTRWPSlqbfcMhU1ZePEwpARXLrdypOWJJVzEvzxIdok4B7syIZnU9YXJ12QBJgb9Cn09Xww3r9Moa0HelwRNplbAEFJc76ssYlp79tblRiPou7TyQzLjalWietJqjcmmk+JLgjZNqJx+Vx5F8HvZpWZaPd7O12QjTGz6mwqmJ9xebSfsjFmKlNZluLO6dkYHIZAgiS1Q42+B8wSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=btBHOJqvJHL9jNSXJhi6SpL8+Nb4Y9uxWKWgCwwjAbc=;
 b=jpGtcFjD9fRDyztwvi7fgrSJuJ43kxTBKwgTFOhfd5OW0yhfXcB/nr9Q9vegC8pj5BC6TD3d4PtcNy9r4XMcshXcJuyeiAQcTdE3UhZSEfpnn5vS340zPbq49ocke/Wg+S4Sih/+bN8mqsEz/f+6zjTTHVBzX8HYF+21vJrKrqXKMG/LW4Y+GkYzsZQHIx9StHfc6ZBjw8ohP7+6raHzrO9e49WqQUAdL9cErasQsQ78tJUf5jSXZkJoxRp2F1rA0+jbkTEup/zb0tYntNEEKK59VY7AZbv0RNRaMTyX7+z4IJnKoHhwki5Tz8PfNa6o/ghF7MevEOQnjGNzSA7gTg==
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by SA2PR02MB7657.namprd02.prod.outlook.com (2603:10b6:806:140::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.24; Fri, 12 May
 2023 14:32:46 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::4500:569:a3d6:71c9]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::4500:569:a3d6:71c9%6]) with mapi id 15.20.6387.020; Fri, 12 May 2023
 14:32:46 +0000
From: Het Gala <het.gala@nutanix.com>
To: qemu-devel@nongnu.org
Cc: prerna.saxena@nutanix.com, quintela@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, berrange@redhat.com, armbru@redhat.com,
 eblake@redhat.com, manish.mishra@nutanix.com,
 aravind.retnakaran@nutanix.com, Het Gala <het.gala@nutanix.com>
Subject: [PATCH v4 0/8] migration: Modified 'migrate' and 'migrate-incoming'
 QAPI commands for migration
Date: Fri, 12 May 2023 14:32:32 +0000
Message-Id: <20230512143240.192504-1-het.gala@nutanix.com>
X-Mailer: git-send-email 2.22.3
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR04CA0014.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::24) To BYAPR02MB4343.namprd02.prod.outlook.com
 (2603:10b6:a03:57::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR02MB4343:EE_|SA2PR02MB7657:EE_
X-MS-Office365-Filtering-Correlation-Id: 9624573a-9e16-435d-a1ef-08db52f5c0a3
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g4zV0VOVx2TxGXsgFJF/xVqiyhNwP8Xz5aWBB99p3RmOC5nkiBoIJoKcy1clxt7kAqp4He8G/6XIYVu2a0T7XubXA+0ZQygPkUEzq2NLiNZ2ziVDWcnOTOuEtBzqfdHLeRE+HTcfGf0zDFxSam6BvF/g54/DYbZzOSqp41JK4u/lzaIcfxl/aWhrC0pMw3Ax2q7RiSEAFOQmkb2cD6nG3frdtk/N6zai6qZh7P9ndUwMqXoil9n4v6TN0PfDmGyhaKy6e2DMEtTLae0ElRsUkbWRJ9M7bZvF6kTENAIoFub9LCt1MfLjxCV2BGcFB1qnVbTbrWrs9/WuEIR4LCtOG50ows25DkxWC+91IfppiEyydHGbsMBfZ8DaSd0tGCsp9aWRzg16Ow9aVyk6E/4k1KWzrHB4bWiGr7n2Ib0YPpJHA/fkALLW0OAv6t+goUAcv/CDql/X5UFpdCVQ9eznrBEwnffmh0Wfh6oyzZBDbT88/jvL0zjbeKn2RlgmTlZLs2fqQCCx2fIhVcj7Scftg/43bev2+tKBfC3xgM+hkrqRx3QmU4yoUfm2+b2DWdK0awMgQCpcM7Q3oVQVH9bdgpNxnPqtpBmvlKzQoebK9i8XQ6scCftz0klksoJwFfp+irwEvkcn8mdqayL11KIsYQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(376002)(346002)(136003)(39860400002)(396003)(451199021)(36756003)(38100700002)(38350700002)(186003)(26005)(1076003)(6512007)(6506007)(107886003)(2906002)(2616005)(83380400001)(86362001)(41300700001)(6666004)(6486002)(52116002)(966005)(66946007)(6916009)(4326008)(316002)(66556008)(66476007)(478600001)(5660300002)(44832011)(8936002)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5edZPFSsHC77jqRjj+nxY8nehS9IsZvm0WrT/dSuIobdvHOM0G2w0siEpuIA?=
 =?us-ascii?Q?uZ3Mru3MuP+iGiJhG6RdVqnKfBYujdKUXwS0EUMXOGn5C/EBLhgx0ytSccnX?=
 =?us-ascii?Q?D3ku6bFcbbAmrPwFL7TLmsHbmdTBPljwnIiwCItd3jKIHvnNQ+FCGGdG1sGN?=
 =?us-ascii?Q?q898ENVaw3UwCkvZLoeSvc5htOh2ZQXZ4Bu2I/9EhwG3sX5uej1K3uUWnvVX?=
 =?us-ascii?Q?5O7MerfXm5bhCWqxRElCAScWKrVrToOC5GifTo9ZtWmHdmcmHf0dmRDnJ47P?=
 =?us-ascii?Q?J1EXMHi/4LDOU4MPUz/aeSRyYr6BE5SZ7jw+L9n6DnzhoLb+Q8PT9cN/lrws?=
 =?us-ascii?Q?CryKClCeBRnOd3rgkXrAINEihJSOaMfq9Wq9WknNHE2wme++LkMBDNTGOf2F?=
 =?us-ascii?Q?iHEj4yIfxPmixGVeWL5nes/VSDp9WewvBEFjDQd9bHlxRXEQJt3ywt9xt+cw?=
 =?us-ascii?Q?fqH9Q3dWKGV4HNGAVlSQ1ATW0/71aBd9dgk8C1WIojM9vktr9M80VvANe7In?=
 =?us-ascii?Q?0yMASP9KZIRNJtnkBeNFQNZmGnYifhxIqer7l6dJ4IFChtvlKeMZWcZd9rDi?=
 =?us-ascii?Q?B5F6jRKGy0h9B8DGt0kwEFbq48cOXleify/Ym3z1SaIy8msHCY3J2nZgeE8R?=
 =?us-ascii?Q?DvT5VrtVic8qGHcjM7PwToky3GmB3PhgcuHY77Mxt0Y+8yJyRv7+5qH4rlok?=
 =?us-ascii?Q?b7dgeFgkEVhofatCf3MdiQeAiVMFd/Xv65Sdm+4a80tfJ4HhIWy4yNUNOcsV?=
 =?us-ascii?Q?43akqmwggf0fH4TuaFmx2ouPo5M4mLRz2tomflSsoxjBXy/ZU9Zm0l94b+Ye?=
 =?us-ascii?Q?yASTjJVfvFz9jsCElcc1FS4sfmgWkxEad3jtYloperHnitXmxg6MM9N/2AnF?=
 =?us-ascii?Q?eAcjnTDOC3tTN+MuohRBwbywbmxkETTKpTTmxt4/6yxME2tkXZ1foXlaAQma?=
 =?us-ascii?Q?QA4bXpAYwSbaAVniKS6jNVNvpmJ9y8K/JKZsqk+YRmjbpb10+GwShSbVw5ab?=
 =?us-ascii?Q?oJaJjwM392RukMgsbZb2AQwG4KRiQtJ9Tie7pkqFRP7NccnbkOyDEYWt/4DG?=
 =?us-ascii?Q?AaTGcOEO94xj1VahNrFywU9dJY6vvfroBhW5cDh6A5NGJq9+REMbHjg9iVpr?=
 =?us-ascii?Q?q+FqW6T2P4SnOieL08myVLkGouflSdvKBet/DfAnRqE8rPe62lCxH3Cocso1?=
 =?us-ascii?Q?Vmj7TXznhihXiN+zXdt5n/cyNFukOanQeJs34x5aZs4vvglObj0xUdix7BqY?=
 =?us-ascii?Q?WFbWF5uDFdJEMg9VH4+n4ohVvIYTZ9B7u8l/KOwmYaGMqj8NwE/FJw9eNsf6?=
 =?us-ascii?Q?LE9YuW8U9UWk3sbtlz2YtmMgLQ9VMM3k2pyeEaLwShjzloFnmloiy+vlHDZv?=
 =?us-ascii?Q?ugY60q3YaTiJexmrMC4Fp/OKOdwM5UvqUrQdlXmpOYoa51ZMuH9Tcw0fTmUo?=
 =?us-ascii?Q?lPOwKDn0N1QPITvy45GZhl8BgBldSwQ/Apmf3cPG7O6Kg+uMPpfFQ0jBGdeD?=
 =?us-ascii?Q?VLc2Dv9sqRLWeiWl3E1y8WqyYpMkWb0JUPaMgPUzdXwy12iEbpls/oEeA0RM?=
 =?us-ascii?Q?tPOdENwLsaoheZXGSMrHvBAYZfeIfiqy136HzaET?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9624573a-9e16-435d-a1ef-08db52f5c0a3
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2023 14:32:45.7980 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rJBcngKg7fjZZC0obdYKuf27EQAkQg2PbuPBtoOVdjEKNZ1rYHO4Lr8tHAtKnS4X+/DOmtZ35j+NU6RlwPigFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR02MB7657
X-Proofpoint-ORIG-GUID: SFZZUtc6vrGzVxYCpI2vwBDumN-f4yB5
X-Proofpoint-GUID: SFZZUtc6vrGzVxYCpI2vwBDumN-f4yB5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-12_08,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12; envelope-from=het.gala@nutanix.com;
 helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This is v4 patchset of modified 'migrate' and 'migrate-incoming' QAPI design
for upstream review.

Link to previous upstream community patchset links:
v1: https://lists.gnu.org/archive/html/qemu-devel/2022-12/msg04339.html
v2: https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg02106.html
v3: https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg02473.html

Changelog:
----------
- Restructured the patchset into 8 different independently build patches.
- Patches [1-2] focused on introducing MigrateAddress struct to QAPIs
- Patches [3-5] focused on implementing modified QAPI design to transport
  backends like (socket, exec and rdma).
- Patches [6-8] focused on introducing MigrateChannelList struct on top of
  MigrateAddress QAPI as an additional argument to both migration QAPIs
  and also implemented in the migration code path.

v4 series look a longer time to post, as it was blocked because of improvment
change required on the qapi design level to allow 'unions inside another
union'.
For detailed discussion on this, please follow the upstream discussion here:
https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg06782.html
https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg06783.html

I would like to thank Markus and Daniel for merging patches to allow union
inside another union and also would like to thank Eric for his reviews
on the patches.

Het Gala (8):
  migration: introduced 'MigrateAddress' in QAPI for migration wire
    protocol.
  migration: Converts uri parameter into 'MigrateAddress' struct
  migration: converts socket backend to accept MigrateAddress struct
  migration: converts rdma backend to accept MigrateAddress struct
  migration: converts exec backend to accept MigrateAddress struct.
  migration: modified 'migrate' QAPI to accept 'channels' argument for
    migration
  migration: modified 'migrate-incoming' QAPI to accept 'channels'
    argument for migration.
  migration: Introduced MigrateChannelList struct to migration code
    flow.

 migration/exec.c               |  60 +++++++---
 migration/exec.h               |   8 +-
 migration/migration-hmp-cmds.c | 127 ++++++++++++++++++++-
 migration/migration.c          | 196 +++++++++++++++++++++++++++------
 migration/rdma.c               |  38 +++----
 migration/rdma.h               |   6 +-
 migration/socket.c             |  39 ++-----
 migration/socket.h             |   7 +-
 qapi/migration.json            | 145 +++++++++++++++++++++++-
 softmmu/vl.c                   |   2 +-
 10 files changed, 512 insertions(+), 116 deletions(-)

-- 
2.22.3


