Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70ED43684FC
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 18:37:36 +0200 (CEST)
Received: from localhost ([::1]:42252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZcKd-0004lN-F8
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 12:37:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lZcES-0007Ig-Qi; Thu, 22 Apr 2021 12:31:12 -0400
Received: from mail-eopbgr00116.outbound.protection.outlook.com
 ([40.107.0.116]:34309 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lZcEQ-0003vI-TE; Thu, 22 Apr 2021 12:31:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OZIE3ekLvmxn+vmpzI6Q17dkxijn+PhUYCgFiZKCeMebdRcQ3kEGa/91nbB3SC+Oj+00+TI9mGUmPU0jlm9pwfKqbkjwhVRyBV8xV0V3iZejES8WCpsvQa+nBscak2pLXDwm6/GOdkU5xym/rAvegtOMTz60LRzfVVKGdRk8YZNCLL56GhLjHa9cfUBN6jM4QoW72NxUjSgAHbbVGdSg0QE4/eflxf+uOgHWVU0vkrR0kWtJPM+/aMpw3UNqry19qSfF5xYI8JfT62K3KGOl4ClnoPCB3EhTlmFmw9jFRr7e2RgWA950yZw6S8UHxPIUFlNvlpPSk34OxifpwBe0xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=39GRkmJDllTgdVI1SRKlrMHJCYsH3ftdbT2AG2zoeQ8=;
 b=SaDOXKobZ/KfFbTqNzCOg5cJzAhKIK+ebyTQH03YSpdO5kE9WvtIBT7cHAvqrzssfSx1fuZvTUwPCL+pFmMUvGF8O/NPKXfdtR0qmI6IyFbtdtjQEPWoGdrD0iZzAYIT9w2T3Pzlz2WTWt5OycK0HW1/yuWLSlzMFnLxrF54m+0dQf0I4eSYce+Hi1k7YVEx6GJbh0xrnUK4cA0rgm5sXdFlm89kqcobt2CJV0xRtBr75q/0flFWpbA3JYx4wo+Cd4tXDLBkfCgT5ZpBG/ZkQzRqxq4lnlo0nk3HqWpEYvTVPef9RkK5Feh+ZFRM+h6MfOD+gCYin6iO50CEE//i/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=39GRkmJDllTgdVI1SRKlrMHJCYsH3ftdbT2AG2zoeQ8=;
 b=k4U1Av7gkPIpdVkMgoPB3vzWS4NN/PeNq/JRPmbzDtaU/i9YkdcO1Mb68kQ/2VyMMReGROtHX1rbdoZOM6ON4iuaxmmt9Xd/FkOaFjZitK/Fx1iCPWdfo4WnjmFRT+OlYrhrb9xG274XURWZFpa7lzjyuJyGL3x9rLOjqoxvtcg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3861.eurprd08.prod.outlook.com (2603:10a6:20b:80::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Thu, 22 Apr
 2021 16:31:04 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.021; Thu, 22 Apr 2021
 16:31:04 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org
Subject: [PATCH v6 03/12] block/qcow2-cluster: assert no data_file on
 compressed write path
Date: Thu, 22 Apr 2021 19:30:37 +0300
Message-Id: <20210422163046.442932-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210422163046.442932-1-vsementsov@virtuozzo.com>
References: <20210422163046.442932-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.222]
X-ClientProxiedBy: HE1PR0501CA0006.eurprd05.prod.outlook.com
 (2603:10a6:3:1a::16) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.222) by
 HE1PR0501CA0006.eurprd05.prod.outlook.com (2603:10a6:3:1a::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Thu, 22 Apr 2021 16:31:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d90a732c-1a06-4eee-e4c4-08d905ac061b
X-MS-TrafficTypeDiagnostic: AM6PR08MB3861:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB38614E32E8CDD42A43C65695C1469@AM6PR08MB3861.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gIyC5f6Md94xu2tZBNnUswoLNDioI9ONwun8zC0JTrmhFg6DKNffFmvOXvC2CWQEZqQCwhX53dbbCCfpmFkuN8kCp24X7NrBbcxZI+ZR5OWqMo56nMVfqOfuJSEiqJrf5Pta3vz2p8i37Oy/nT54CPshGpJoaAvvN8Hp6hLE1T6gPN7xxbs3ySqiwhikjLV75OlWwdNyPqNaHEYZMJNkkmldBszKYKzw8MMA5Q9su213lGiLxTidMyyYNaHl6Edw+Rh5hGhkHXOq2pmPqhpFh8sSkkcNMRt6os/r3Ke+vdnR8vUt+MuWAskwzAxJmtrFR4fViO5LYCM8kvCczDob5Y1CK4QT9hj+57IYYRhrwMrXMZZRcw2UZqkMuK7wrRCYeD8okZO06m5OyYYx7UPVpNu4i5ULTEA7mAAWCXTb06sj3QMmtdPgsO0cp/pdHGNb84sGM2QIzgPDAMEmZCwuuQ8iBk6/tYIVV0t5NVsMWhLp/sivrpk45j3MPDs70pl4kY+whuoMqLfjoZ/OIC8cD+PNzm3fCBU/ohcCEz1WFohFamTDXy+rH3ausWBVJRbhS0m1TZBMh38EcOIS0WoSvKMxt/XdMKdoGsNabp2Nn/vZaCHYdZtk9Zo7euE0mSP6XgGNtB45J0iLk8zh+pEPncPIa0afPOH/Yt20UzOSEVau0eTLOfVh+w+D5fQiUgpu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(366004)(39840400004)(396003)(6666004)(4744005)(4326008)(107886003)(26005)(6486002)(956004)(2906002)(83380400001)(2616005)(52116002)(316002)(478600001)(8936002)(66476007)(6916009)(66556008)(66946007)(38100700002)(1076003)(38350700002)(5660300002)(6506007)(8676002)(186003)(6512007)(16526019)(36756003)(86362001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?1UP4SW8IjT1KSy6qPD4ftVgtkIbyM4p48NVX4pMFOfG2tWDvGvQ76PHQvPmZ?=
 =?us-ascii?Q?Z1GYgCEQVm/b4ltAr6vGH491oaVxiwiiOJYX8x6w2KzQ6bqPwhMQ7lDw1NDX?=
 =?us-ascii?Q?TXF/eiwokAV5s0vIJv0/dxSk79KM+wyrxA7pM6rUw1NSAcU9iStBJ4turd5U?=
 =?us-ascii?Q?fQUvsq7stVELTxFA0d11NoZCqiEgnzG3Iq9d/91tsODeZB0zTwFFO2LRz3gC?=
 =?us-ascii?Q?rXXZ+FH0Lc4D0ZtgqmS7BR/OjnzBZaFmI9j+gAj2LcnTy0xs8pcgO9LJ7Id7?=
 =?us-ascii?Q?ICT8abfbdBsegJ4UpEvOTl7RGvpnhaFRL2F5KuB9bC0F5VZizB0MGbHyCPVm?=
 =?us-ascii?Q?9PMkEDUuW701IhPoQUSVa1AynsP3d/avVrbk5fOY/I0eEzPh1ZCZs9+aemaN?=
 =?us-ascii?Q?+ssDLDnwv/sEDn7KpyIFEG6DHzK1lwZBOA6kNqgYIoo5xjiofdvLpqH6yxjW?=
 =?us-ascii?Q?Lld07E3cJGwx4mF9/BFTyTWk8NB4Ifug4iHPivfPgS+u3pY9xUfYbb6tcmGN?=
 =?us-ascii?Q?PlBJbVgr/FiLBbt52nNp1jbf/+eS/sm0X03XXf4C6xdu3TnqKmwFHe9Q21wx?=
 =?us-ascii?Q?gF5y5S7Y9mlE0l5O3xMOeS9ji+ii+FokQb6C2C+VlONdJGbIHKryZsNKfAPW?=
 =?us-ascii?Q?2+m1Sj7+z/pK4qbfddAEio2vrWeYQ2eP018c2YHRbsd8EJm4kCdIRaAEE9xM?=
 =?us-ascii?Q?OlpfyHEws3324Tw/KVe3fxP+QjgYsJGAcdv8M8MOEUzLbYSgsr62ekgZaBKb?=
 =?us-ascii?Q?X0Yk6lPgYbIag16sH9j8MPXJHB2PkSBf97QqkNuMFaDbU67Jd1N3LLs7dzrd?=
 =?us-ascii?Q?C9LZv0nxpg6g/KUVMly6TbsyXDaUvuieP3mAMAuprIq24L5zfY1TwmvZbjxu?=
 =?us-ascii?Q?clMkDl6pAuq3TL6v2sA/FSEJq5LqnqFKuH0IWbKvpQnAPUX6t/emvJzOVKNW?=
 =?us-ascii?Q?IYHEiaDi069+S5Nw3gNXjrE6XL1DZ01VEMiPafxRAFrjhps2aI3lFIlyRkxU?=
 =?us-ascii?Q?diu/6wl3HQN57420Y4y2TrZ2BQeLhx2wOWMBpf7BabpNMY19fO0lDQ99CUwc?=
 =?us-ascii?Q?KddlZGuaSHjiPhpJtOFKtB8vTVLcqNCyGvNuQMjFlud+tTgUFflCAJRNe6yz?=
 =?us-ascii?Q?yOdlbtNnAbA0yjr6aq8KlIlsIpae5mHaccG1vsA6qPgeFtIHoyFPBPxqQzJy?=
 =?us-ascii?Q?7QqaRW8ktXOairNYPa8B+G5WN+RHQGs20elRvkL7Cbl0ByD+mOvrAHgyHXXC?=
 =?us-ascii?Q?mVzdcitlPHIqqYgR2WUdrloOSE50WlrkC/rLSH9yXSHn9Qlj/uQyTRSQhAeD?=
 =?us-ascii?Q?c5cLQkOwEJZOW7BEXuCooQQW?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d90a732c-1a06-4eee-e4c4-08d905ac061b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2021 16:31:04.5995 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ijFTJx/bzrat+VECp0WDAXCtbpJDhPXx8qorcv1YgfZkeC/ochESEwZvqpImNCuzO81kJdVsjyv5okPBgUczJrSKOst4i1eCha0Q/MONZlE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3861
Received-SPF: pass client-ip=40.107.0.116;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

First, we return 0 here, but it's not a success, we didn't set
host_offset out parameter.

Next, it can't happen, as has_data_file() is checked in
qcow2_co_pwritev_compressed_part(). So, let's just assert it.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/qcow2-cluster.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
index bd0597842f..6105d4e7e0 100644
--- a/block/qcow2-cluster.c
+++ b/block/qcow2-cluster.c
@@ -821,9 +821,7 @@ int qcow2_alloc_compressed_cluster_offset(BlockDriverState *bs,
     int64_t cluster_offset;
     int nb_csectors;
 
-    if (has_data_file(bs)) {
-        return 0;
-    }
+    assert(!has_data_file(bs));
 
     ret = get_cluster_table(bs, offset, &l2_slice, &l2_index);
     if (ret < 0) {
-- 
2.29.2


