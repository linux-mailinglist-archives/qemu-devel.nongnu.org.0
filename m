Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EED76F6016
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 22:32:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puJ8r-0004wq-Ay; Wed, 03 May 2023 16:32:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tejus.gk@nutanix.com>)
 id 1puJ8l-0004wW-U7
 for qemu-devel@nongnu.org; Wed, 03 May 2023 16:31:55 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tejus.gk@nutanix.com>)
 id 1puJ8j-0001R6-57
 for qemu-devel@nongnu.org; Wed, 03 May 2023 16:31:55 -0400
Received: from pps.filterd (m0127840.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 343JrX9S028423; Wed, 3 May 2023 13:31:49 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=proofpoint20171006;
 bh=ReD0jy/8C6BaIeHP67695+EX/3aebZiIX38inuB3ebs=;
 b=KpcC7ck5p8G8XsOZxpjFTQ7ycsK6jfXZQQhdXd2KCFlKG7srid3d/eaQdT9QUyquJmsi
 vavhHKjkGw0COcr5/97QdfEL6V2L8vX9b8NERvOwUa4xpbZE9w4ufN9KJkhonwbqyqog
 KXIlmYmiJUtScuDgRY96wEvsihyZBiANAzgO/ufe1VlIxivvMnACkXS7DsbZ09QM0dQy
 1d4NhxZuoCUY/kpR1v1A6SxYHZNzOH/RAkIXFq79jPhmkBhrzCU+x1ESPUCvYUoCfuxd
 VHD1IjdCpYE44KMouQEXrkQ61UaO8xa0R7gQVb44ZYsHUuSOLam71S8k3gJrq2/BQvhH hw== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2102.outbound.protection.outlook.com [104.47.70.102])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3q8yjx0x7s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 May 2023 13:31:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y0+rV5Hr4zNGFK08bMl2S5uAs2y9Gnd2OA6cQtZ0A2R8+GnjlPx4iQzxogUTDFwi1YIaFBBEPFJtRgM9mnc/3m9nWQ+GKLLuwBT8OzdEFP6qVq9+Ddm58r2EI9XDrxUDniDwSxmBxsyEg29ph/o6WdOFsMnVpqQ0CPJ1entWFMBEHzcs4kbh7OiWHyjnGJ2FVLRUUZD0j9FlJP39iPMgE7Ue2QgOxe7APU43WNstMup6xbr/IHZLxUwqriBz7TsItR/iXF4lrJHnW8Hh7AMQmGSKaf0JzItx3dDoNFx9cB6uKBF48rzTFswJbInS8VSOmxgCoqAy7VkNDy74Yu/ESw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ReD0jy/8C6BaIeHP67695+EX/3aebZiIX38inuB3ebs=;
 b=fD4gdtk+ofw8kQvWRx5X70eOBc7GkfbTdPYNvCQhrNKJ6OsdfqqiG3pIvi7IALk66eevvJnQShC1YHTtwePMaz9ET+zVKwpiskPwCRL2m7VKAEzz5We0PwN8RWBYqS7Og0AUivcj69BrIo1eBGXQnbSiaPlmZyM3T34AaU0oLtb/OQFrN3vqCfOukDu+gkHTTcOQ+HZpqecDcvUCJd9LVx0AWezoGebmaKmHPH5M8HrcKqR3OYXsu1gfaUj4EwEi5WXWiI8EYBBJ9WxQShqtNi9gZ/jgE5Hw5udwsytg0cHj5Hgm/IUCfEmhrLUjO+A6aEmiDu3VJmLcOd+9PNUrDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ReD0jy/8C6BaIeHP67695+EX/3aebZiIX38inuB3ebs=;
 b=UYy4GqJN8VvKv0QFREZUVpTLHTECGWmbDSZo+yIKuyK/+KuFDcY2RY3DPBIu1wQWCcTKwpJ7SlcctI/L9/MSf9zvssTL+Z95TS42J+x7ybN3IXVXT5YtfvD15DuOrf2m2WEm4vOjGttf+SV1+6XueX+0VADvMoq0EVkKZcHyqPyZAAcozIcZJJyia/JdRjbAzl6T7ggMDXsfnO05nKukk4W7MmRt2kI3ZYn4GxLtTxB+nChvasRiLGgxnQv3pW1cQe4wvuzWIC0f+MnfHYKx808qepPRuxzx2nI/ekHzoR9iYllTaLvJEuo1RQ6kmKnHWNvvZquZV1xpPojjpPFJQg==
Received: from BYAPR02MB4806.namprd02.prod.outlook.com (2603:10b6:a03:42::30)
 by SA0PR02MB7321.namprd02.prod.outlook.com (2603:10b6:806:e4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Wed, 3 May
 2023 20:31:45 +0000
Received: from BYAPR02MB4806.namprd02.prod.outlook.com
 ([fe80::7a30:ca33:20c9:c9d0]) by BYAPR02MB4806.namprd02.prod.outlook.com
 ([fe80::7a30:ca33:20c9:c9d0%6]) with mapi id 15.20.6340.031; Wed, 3 May 2023
 20:31:45 +0000
From: "tejus.gk" <tejus.gk@nutanix.com>
To: qemu-devel@nongnu.org
Cc: quintela@redhat.com, peterx@redhat.com, leobras@redhat.com,
 "tejus.gk" <tejus.gk@nutanix.com>
Subject: [RFC 0/1] migration: Update error description whenever migration fails
Date: Wed,  3 May 2023 20:31:15 +0000
Message-Id: <20230503203116.42429-1-tejus.gk@nutanix.com>
X-Mailer: git-send-email 2.22.3
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0018.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::31) To BYAPR02MB4806.namprd02.prod.outlook.com
 (2603:10b6:a03:42::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR02MB4806:EE_|SA0PR02MB7321:EE_
X-MS-Office365-Filtering-Correlation-Id: c26d5a5c-c036-429b-a3bc-08db4c1569c0
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O9jpq/ENadw8N5Ya9AliIzDi2UQeUfWOWor8xooJJ/CEhQD4NIlyYlYg4TF3klO/BG9RXZNJgNaxFtwz29iOxwikVuGr0ptQwe0X0e/Vec36mlHtqsMzO/i1as5CT4s+gxwi0nos1Gjf6t/x5w6AGm80XEGB8XBNviIC+LkEQOC8gX4F7l+ILWONAosgUzkD6zoiYJNzxNfO8NMJq5nCCAlNPJV8aUPQmbaHyMXyDEwWiwj9rAzou5jmPtbv8qrVljqnmcZvLfHdEna1teK49bViiVLnZw5BAnkVwKSym/h9ZhqU1kJAnD2H7QKical6XZdn21zNQmQLUklUKEJtCUiH1wrCW2Q7VmwPzQ1q/IWi3VMgA9yCE0UWJN5NcnoDZwgES6HrLtX2yoEBjcj9zDGVaOL91w8B52aQevlbA51tHkpVXfZr2QY+sIuE3xt+128oyE8DRz6HcykUmLzk42wIZh7vEgvOF9OkrKSVE43b7/u7Jd7iqkk64LXMIFHL2KxcDHzqceEGBjZQ1iAWUq2E7ODRdWU/2U9sIgoIVkj2r3GO0QpS+nxMloOAiuHSPPZ13CxmGkjuZlD0VoAr34xIusMMeDRLY6am4vu8XiDoN1cTURBKM7LbivzV+870
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4806.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(136003)(346002)(39860400002)(396003)(376002)(451199021)(66476007)(2616005)(26005)(6506007)(1076003)(186003)(6512007)(316002)(66946007)(6916009)(66556008)(4326008)(41300700001)(8676002)(107886003)(38100700002)(38350700002)(8936002)(5660300002)(6666004)(6486002)(52116002)(86362001)(478600001)(15650500001)(36756003)(2906002)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mGJ5efLNDmakwqf7tID82T23XLvfc+HefPcB6TQUmcYWSLhQc7ehwRiqj4+W?=
 =?us-ascii?Q?Z5pLU006rd2/LAjVLK7jk5Mpm4dGeuBwSLqr1wWtfI0eji6fAQqunlLsONYv?=
 =?us-ascii?Q?E1d0c8jts04i3XAR9oiYNiFo22BXuDHF7Atzbrm8ugJRUU5rI6QcGtElxRQL?=
 =?us-ascii?Q?Rb9OHPGGZlyvY9T/iF2NC4v9mNSox5EonG6CEiZkfmo9sKItpMusMz3NhHvC?=
 =?us-ascii?Q?9aoIhkjUBw46Yh0FAhlV4KEWJ9BsNH7AanFVl5TPl0doJ147YIQPRi5NhSfE?=
 =?us-ascii?Q?rEiAKB++vUNCvK+VY9BAatH2BHoy/S0hQKyhOaRKsHwA3GhamNTFChCas9Nz?=
 =?us-ascii?Q?BrD8vtYr5FutLanjrKlHu8jEEI/jgMfAf/6V/Dpx1bNch1RDjCwAeWUUoKrz?=
 =?us-ascii?Q?ybd//OY1rdpotHAyF3WnTVcDM0XeB6zfPq/RYg0vj03isIlfmSGlr2v1O8QN?=
 =?us-ascii?Q?xGb0O6MJ1YJL9XkfPSqVjDTYkn16f3WJJZ+6dFkBKYIiHfl6Gt81hpsbetir?=
 =?us-ascii?Q?u3Azx7CmhrGofLyKHGyKfZGWr9A63N0abeTX+x7W/XYcFvZg9TodyVuR6GY1?=
 =?us-ascii?Q?zYdSdlyzPEQFwoZBxLFS94boRGGdJA/j++TB2vqFDS59Q9y6B1XZM+vHWjgX?=
 =?us-ascii?Q?DyahxjZcNiyDGV7AcfWvGqk2FNofuVirtjUkPHwve2pM41KIhOzOFr40d76y?=
 =?us-ascii?Q?nz+NIH6mEk45IJluVmb1sKY0qk4FYDLFFBW/mFEUxZUBTHOBEAoJ/yRyfzut?=
 =?us-ascii?Q?Wa0q0yH30kPO2vnEeBfS6kTqDiGsABKuq9lzhu8pi3tz5MmKyskx4ILW7Ks5?=
 =?us-ascii?Q?xsTy/ckXyjo9WBZFgtbiNyXzlysMWKYVTNaCUV04BK1G98mffIk92qX29+5p?=
 =?us-ascii?Q?ARJ0dwtNkAClQzmaa4dIer/oIL2Mn+HppTh8ec9mJSCOoLY0KDiiDIpfsOLm?=
 =?us-ascii?Q?me20JsqZQTMUTPKyBiTcfli1xVgKeIP/r/1IA2OebTiuQAloctohghfTlrEM?=
 =?us-ascii?Q?GsEi0QN1B09ZEalpFNJZlWuPNBOHO64W+SNDF4I49CYqTRYTf1OgF3wEZw1K?=
 =?us-ascii?Q?aspcfoQ40liqFRqw0X4ZUXgzWVojXqG5R5l9S+DHjpFKqVez4pe9vj7EcvlL?=
 =?us-ascii?Q?8jtb3LUzsbTxHoVvzoIljet9VQjkO99MyrK/65xQQ7YXTIs/r65vmLVxa27p?=
 =?us-ascii?Q?xV/LVsRATLfseGPjVzuoncwOpQbSraAd5djJ/62E/CxVzhCCIhIR/BIQ9Nfn?=
 =?us-ascii?Q?6Sws/2IsdeVpqSDpLU7HrZO4ltDDzh7v0JZ/v4EqhweWMRAcdXxbLChHaS1V?=
 =?us-ascii?Q?6Ti10Orjl7MBE5O0liUt/5tTdXXy21wmni7g4yXp+if+rRsbOgLK34cPS3bw?=
 =?us-ascii?Q?z0ne4rf7tS205yT+yHGw4byEaMaAt8C3amtiHc70p4petrKuoCjaqMEn89fE?=
 =?us-ascii?Q?zHdi3EtqeXipOdhd79TKQZ9Lel1L64PYraA/lRzBzdvE6XRrPMFvNsTb2LDQ?=
 =?us-ascii?Q?d+IHZwMmKP+D3bnKzlVsjjR06niEHhlxiaO6TrBrOQBAI1388lIXgYEDhJNR?=
 =?us-ascii?Q?aONovj/lmNJqczsYtUs4J4uhvHYCHGNABWe61emI08zlDBb/xiqKR5x0CpTQ?=
 =?us-ascii?Q?Lw=3D=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c26d5a5c-c036-429b-a3bc-08db4c1569c0
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4806.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 20:31:45.7146 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C9u8TqxR+snd9ngCLJyncQPgJIRUk6wiKiWFkQp4w5iovjMSnpN8EzpPeIeRH+DLoVFKxbYKmm934tjuaSaAhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR02MB7321
X-Proofpoint-ORIG-GUID: 7FN8ym8vkBfEGQ-5oyKRlvbSM6Nj4Ja8
X-Proofpoint-GUID: 7FN8ym8vkBfEGQ-5oyKRlvbSM6Nj4Ja8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-03_14,2023-05-03_01,2023-02-09_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68; envelope-from=tejus.gk@nutanix.com;
 helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
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

Hi everyone,

Currently, in QEMU, whenever a migration fails, its state is set to
MIGRATION_STATUS_FAILED
via the function migrate_set_state. However, there are places in the
code where the migration is marked as a failed migration; however, the
error description is never updated in the migration state object. This
causes problems when libvirt tries to query for the status of the
migration via a query-migrate; it never receives an error description
and hence reports the error as "unexpectedly failed". This
doesn't give us any information about what actually went wrong with
the migration.

An approach to solve this problem, which this patch explores, is to
update the migration errors through  migrate_set_error, whenever the
migration state is updated to MIGRATION_STATUS_FAILED. However,
sometimes these error descriptions can be due to various reasons or be
too vague.

An alternative approach to tackle this is to update the error
description from the point where the error actually occurred. For
instance, an error which occurs while saving the vmstate in the function
vmstate_save_state_v in the file migration/vmstate.c, results in a
failed migration, hence the error description can be updated here
itself, rather than updating it in the function migration_completion,
present in migration/migration.c.

tejus.gk (1):
  migration: Update error description whenever migration fails

 migration/migration.c | 8 ++++++++
 1 file changed, 8 insertions(+)

-- 
2.22.3


