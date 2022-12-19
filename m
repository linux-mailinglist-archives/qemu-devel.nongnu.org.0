Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8DB650A24
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 11:32:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7DHG-0003JR-G6; Mon, 19 Dec 2022 05:21:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9352c01a6b=bin.meng@windriver.com>)
 id 1p7DGw-0003CP-Mv
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 05:21:28 -0500
Received: from mx0b-0064b401.pphosted.com ([205.220.178.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9352c01a6b=bin.meng@windriver.com>)
 id 1p7DGt-0007VS-W3
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 05:21:26 -0500
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BJ9mDb9010303; Mon, 19 Dec 2022 10:21:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=EhzGH2k4YwfRO4tEM52bj5LThqSxVk3rVHoc+y1mtTo=;
 b=bxX8TBcRdLdWy1HszSEkOMFxJGRhHUhGEkMpOeNN4Q1MQX5rWIgJc8iwudX+8ssKtYKl
 rWoZzuM2B82Mtv46Ja1ed1b38xPOiQyhTS8Wvk1lyoVm509G/H7D4XpibeeBM17kljbu
 MbOHYfL+atnuqSuK9hdotajVCH3HddrPbnYQixkDPIHfXqxjDQhTxfHcWt3+FVF6EKvf
 28bWGo3zDw8qi4GlGDagmmspQWJM70Xkta/vTWckwVTNTze+MFCc4Goi6YaAi0VNkRtd
 cci188QsvaMRwGeAi9x3PYHGP07SItX1CjTrksMSFkCYnnBd7PWNaaoLZNt2bIqQwOPC XQ== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mh4r99b7g-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Dec 2022 10:21:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PmLFGW/am9DaRyDz2puj6ggsRctVgPVvHSB2h0sWUseTSOYDFLxS3bsZROjodXA9ZI0YBpHfHaAPmxOUcVQlsi88BRdwrx5kemwXBOiijINtJeBnQY9WpjaWYyw66RtkouCd8Yz61nLn27qdlAsv/u/bao5i5zhIPglA6L9DMB1k8U9T+u3uAYWYMppLb7cZKCdwxzAGYyDqA3a0ACY7YYfWBwmPcSLrGdJlCm7jKT+APx+KHdLMeJLOuhzDpm8MjeG+WmsPs7iEk7qvF8OBV0+e2dO46kjY5L3FW7dfGna8hO2cz3jbqjl0P4kZFOMQo7/rWrUKhMIk/N+kij7jng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EhzGH2k4YwfRO4tEM52bj5LThqSxVk3rVHoc+y1mtTo=;
 b=E00yhZSIa8cRwFD6+vdUyabwszIl4c050mQ+1WAVvzjn3ZxOMf926v+z6Twhgn0KHA0djCHtNuq17C5XVxDy7Jl0ghs56aIfuM9wIE43fgexFwY/Uf6BQTNiue4HX//W0i/7duysfQ+qlUS88HIBycRiybwmlt5pEaGBgHMGtW+pTc9hcAGUuTTW3dE+KTrji5Ffsx+xREB5ERqP54rTcwkjT9AllUzO2rb7tkXnScnChJ1rv638qo5P9idAt2aUeGX08nYkYzrorJ3jQ9Am0HLUPaZ3r8zTuJDIPQejtBA9iVmRyoHFMSOEcNpjxSO8AkQKVCF/yOGj8cHESVmFew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 CH3PR11MB7201.namprd11.prod.outlook.com (2603:10b6:610:143::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Mon, 19 Dec
 2022 10:21:19 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::8e5e:71da:1e29:bc15]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::8e5e:71da:1e29:bc15%5]) with mapi id 15.20.5880.019; Mon, 19 Dec 2022
 10:21:18 +0000
From: Bin Meng <bin.meng@windriver.com>
To: Greg Kurz <groug@kaod.org>, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 qemu-devel@nongnu.org
Cc: Guohuai Shi <guohuai.shi@windriver.com>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v3 16/17] tests/qtest: virtio-9p-test: Adapt the case for win32
Date: Mon, 19 Dec 2022 18:20:20 +0800
Message-Id: <20221219102022.2167736-17-bin.meng@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221219102022.2167736-1-bin.meng@windriver.com>
References: <20221219102022.2167736-1-bin.meng@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0158.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:35::14) To DM4PR11MB5358.namprd11.prod.outlook.com
 (2603:10b6:5:395::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5358:EE_|CH3PR11MB7201:EE_
X-MS-Office365-Filtering-Correlation-Id: 559c6400-10c8-4ac5-50f5-08dae1aac4a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i+jlr+NQ9JW7CRpmqOJH+SFk7GvZQkJhzgd5AgBPWVAdq5QAsP2Gbs6jWw4oxX8UEtyZkXn7hPEYqbUNkHRW3Eci3dpXC4ndKBMn/mITfP2dfL7/rZ4gV7TMSIZDluAlKrZdJXf64kyC9odEUUPG/KcJRvzvCy7f7LDtxog/MpneZpEuG1fYg7WFAxcm0C+EZkOv01G9bZAVnWDCjvo4UJVG12T2Mc9LWaUdm/4e506nY+HJ735TheEGi22BAaM/lYfsGuA/EwP44jveFbeHby/GoDIJnQBcpnw6xTNF9NRO4Os+vCqS0pGEH0C58dOBFoslLCj+t5BjSsB9DZELFddzeNouvq2siYB2PZHwMNfJ+CjyTYP5PFw05/g4Xqu0VV6drUKZR9gy5LzcVr9DQN+I/jLkS+vLWdTre7T2S071nHPUMt+t/cH13mR1D6C+VDRdLZmXq7K94tokYEP9sg7hfxYNh6xz2QBMswhTtbWbPmP8LaXo3y4lSnyrh+eXhtmtAufI+MWrkKRmhFYuV9Ers7tyMzz7nv8e0t5qMVGZps+8n6fnGuzwe7semfvAO5hjk3hkpp4ESNv/ucM0w7tDRHXI2rTsdfSyDc3fUyIw4yXXLvhlJEvAbPmGWfRuC1rgNua//Njrlorg5yvkyrjLWIcJd1uFxfW1gc0WGrMkvm2diMOFM6zHF5xCZWGY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(39850400004)(346002)(366004)(396003)(136003)(451199015)(478600001)(41300700001)(38100700002)(38350700002)(26005)(186003)(52116002)(1076003)(2616005)(6506007)(36756003)(86362001)(6486002)(4326008)(2906002)(66476007)(66946007)(6512007)(66556008)(8676002)(5660300002)(8936002)(6666004)(44832011)(316002)(110136005)(4744005)(54906003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vqTPrH8N6CPwQz3syyKJjiFLShulrWfGH8ucNsRVxmP6FGVEVOvyeHozUYWW?=
 =?us-ascii?Q?7QrlbGNFgnqKNsZ++mbFxmntzUrpe4F9xpvnwQyX7AN47VoI4HK7CR2H+8JK?=
 =?us-ascii?Q?dnhP6j5ooPRWwBeS0YHlCNRGqWgRsGtYNBmeR8UDUi0vOFk5pa1hExBfMMZa?=
 =?us-ascii?Q?V0l/hiaSbzYYi2wYoKzjUHEIqpwb06NhcpPC/IDg0PLGdmldp8NkYN8Flt3Y?=
 =?us-ascii?Q?fdr6gq9MOmFw6rUr2VrXsPejtY02bLYfrKfYHqLJOJ9ZBqy3KU9kNNBg7+5N?=
 =?us-ascii?Q?OmJwdfB0ylm+73PxarRMTbjKbC51kntTDHorItXtOGb+qB3NW1FaHQFr/23L?=
 =?us-ascii?Q?6e4INNzT+2n+mahGd48nDgFEqopPcW9+8+o6vB3ZeLMfrQ0weT0SPR961Iue?=
 =?us-ascii?Q?QYsAzywF/NuhDmZ7fGg3wNFdmVH5lwWbDbP2BbEPZY8/4Z5MXserr/z/j2pc?=
 =?us-ascii?Q?elnWkTWZphzinTBlQ3dCgOW0uuhqs4AjO4JqOXLWePdV/tgHqTs8vaI6nAUs?=
 =?us-ascii?Q?+6EmDFhghfFaXWapso+dreVj0EbI45kedqTW/ncqwDd9nWg+YgISROjU0nzp?=
 =?us-ascii?Q?dizKlCFKAUnYk4irDscNtzRM4/4O7borleTtOHpx0AX2UI2JjPdai2/7K41T?=
 =?us-ascii?Q?NUXoO4L4YJ60FQjqwcrgmkjB0UJfGMv36Op0DtEo8Y1bJEbz4Xi2LFHRZ5nt?=
 =?us-ascii?Q?vOBTeMjdj7uMfMezDFsCjFK4f+PmcpUrYP6Ovuf5IBeMeXCki+InK6ChInuK?=
 =?us-ascii?Q?NRvOU9qgrD0ceWvDuc47cI6dqVfflYtOHKxZMihZDOHv6e76Ix82KSzfpYlQ?=
 =?us-ascii?Q?HKpw9MDdNUdV7DNRqaYC0+FnD+0SvORo4uyOoRiu/gMPuZuHJ+U7vG1ZO2Qj?=
 =?us-ascii?Q?ge3emCb3iio+RkZFOizeG+vHH23wJayN7j1v8j4n2gLjsGLxVO+YvJtfIieH?=
 =?us-ascii?Q?wRz8NqvZ10eW5tIjH6b7u2UcbqkEjQwsL3bnmq8mnYEqygs3bR24I0TIEOQB?=
 =?us-ascii?Q?byy6qd5X+vA+6M4e/0gnp5UgwcEaaBoBqDlmb4E8Zvz/0xtIhLVGyk/6dCm/?=
 =?us-ascii?Q?Mo7ixyInJYDOswXn6tEg5c25Ed++91AOm2B7p4rdnwmwlP+DbpmCZLYE+c0N?=
 =?us-ascii?Q?eIKnvEc4w0ufTakK3MBqjidKieHTq0G+jEKyTW1UpFrowco6GOcHTmxMq4Rz?=
 =?us-ascii?Q?Mpe1V7GrZFBNGq+Qx/AJ9tF0tMcHxjETEUihYhYwoQb9A6OsBAmRvjFlUzl7?=
 =?us-ascii?Q?mGlbIC0Ik5woGMTaF4byc8OLyqPvnFvXTiqTXgStSqtPRMbgCYbFWAEuHYke?=
 =?us-ascii?Q?CMeCI5tPxvg9lwaSh/wXEJQq55qA8k6rCMV0YMIxHx7fHfeXy2SOGVA4VG/U?=
 =?us-ascii?Q?XA5q95MN37/gplX6dlpvvpZbaXbf7D5og+z3+SW7qvHDxhq1RTABb35P4CHB?=
 =?us-ascii?Q?dVNGRQc07nWkZAllu3feqvGjqYa5csMF6FMzcuBowrJfK549bglDSTXCvdjm?=
 =?us-ascii?Q?pc7r/05bUMgl9hL7PYIsJwV1ezgiLNrzo2I/DsxoWAqoIwK1Wud4RAiVkPIZ?=
 =?us-ascii?Q?Csed1cVnZckIayfxoGoD+MVKhH1MTdKREByxuTxH?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 559c6400-10c8-4ac5-50f5-08dae1aac4a0
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2022 10:21:18.9171 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2aTlRXqwfRgWFHXGZPwqY7SG3bTjolnJxMdoO7Wk6OO61p9HMJ1OpgMFMeQAqteXdJGKFagQg4BwggbHo70Mbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7201
X-Proofpoint-GUID: kz9OJaWbvCAmXUVdR890QkPz7fu6Wghl
X-Proofpoint-ORIG-GUID: kz9OJaWbvCAmXUVdR890QkPz7fu6Wghl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-18_13,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 mlxlogscore=999 priorityscore=1501 clxscore=1015 phishscore=0
 lowpriorityscore=0 impostorscore=0 mlxscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212190092
Received-SPF: pass client-ip=205.220.178.238;
 envelope-from=prvs=9352c01a6b=bin.meng@windriver.com;
 helo=mx0b-0064b401.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Guohuai Shi <guohuai.shi@windriver.com>

Windows does not provide the getuid() API. Let's create a local
one and return a fixed value 0 as the uid for testing.

Co-developed-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---

(no changes since v1)

 tests/qtest/libqos/virtio-9p-client.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/qtest/libqos/virtio-9p-client.h b/tests/qtest/libqos/virtio-9p-client.h
index 78228eb97d..a5c0107580 100644
--- a/tests/qtest/libqos/virtio-9p-client.h
+++ b/tests/qtest/libqos/virtio-9p-client.h
@@ -491,4 +491,11 @@ void v9fs_rlink(P9Req *req);
 TunlinkatRes v9fs_tunlinkat(TunlinkatOpt);
 void v9fs_runlinkat(P9Req *req);
 
+#ifdef CONFIG_WIN32
+static inline uint32_t getuid(void)
+{
+    return 0;
+}
+#endif
+
 #endif
-- 
2.25.1


