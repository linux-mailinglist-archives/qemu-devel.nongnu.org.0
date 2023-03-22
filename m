Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1586C4659
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 10:28:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peukk-0007NI-9k; Wed, 22 Mar 2023 05:27:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1peukh-0007Mu-Au
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 05:27:27 -0400
Received: from mail-dbaeur03on20727.outbound.protection.outlook.com
 ([2a01:111:f400:fe1a::727]
 helo=EUR03-DBA-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1peukf-0003Dq-Uq
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 05:27:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Py6s9cC0RooTcSwmstqIbpuHcx/wlfpDXeCp3F6niBBMzQGKJtdSjaJomwLf8jiLRKWX2s8PRl61E9GmSNgMoO3yrF8dg6yaJsA36sMtl0G/yD3i+gluVX4H30VFbYYCSfl3xd+Ecvvpnsrdc2E6CtczWC3uXqnfWkZ/sWUG95xLu1mJwrWWHEyfKadypZt+GXh/punfyZMGUo7GCoq1hw37WgMsRxxEsgf4gy+6Tgruslo4zTookbGZI+ucqM0hzzryENVmHwSkTwRf1hq6fFPM/2QBfp4o+nqd7O41yCAB7vjeGES8aapfLs/KcGXjRU9fkMvbp3vcqASdrPCgsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ExFXUOT+0wn1K2MpQcm7SdWdgozygGms7tnOXifMoss=;
 b=oD/f4pYfKKsNdJWRAm/Z+h0qayjHJrScwT5Js5JzzaOyY4l8A2xIC2MSHvyheTKtb44xypNn168XuBDEZ05wgMAt1v+66/B5Ba+nFOrMTciO/qHnuMar+tXkFoL6KAfjC7y5tBDcMJedy+XcRoTKMUZWEv9Inw13aQbzwjkzMF0GhXxVH33+t+OfQy2pSmNPYn6+XUMVdW4Tn4v35rjFtIr+YxMZsntlqn+1T3ABdeJeiOMecT7S8UZhgPXymuRShv8glUaDDkqEMesq2tGOpFKe3IFVnBDuHrm5UElA24VqWRz1JFWjlmujvtyx13bmQ5uMJlPRTSLMrnNB0lUheQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ExFXUOT+0wn1K2MpQcm7SdWdgozygGms7tnOXifMoss=;
 b=hbDK/l9VLi4KTmCOj33UeUvMilzeUc07rOuRHE4vsGLu1u6n+N6koNesVCLcBtNcjyMHCO/IXi+39O65TxUwy/yWq+sYmlWkTigoeK8BP+5GXF7M8BdFrvN2YK0vP2JEg5NG0XgLtt8GpsT3q/pjtl7FkOnHRdD+miTOIDuRdlU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by DU0P189MB2201.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:3ee::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 09:27:13 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::13ad:a312:15c6:91dc]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::13ad:a312:15c6:91dc%9]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 09:27:13 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v8 6/8] igb: respect E1000_VMOLR_RSSE
Date: Wed, 22 Mar 2023 10:27:02 +0100
Message-Id: <20230322092704.22776-7-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230322092704.22776-1-sriram.yagnaraman@est.tech>
References: <20230322092704.22776-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: OS6P279CA0149.NORP279.PROD.OUTLOOK.COM
 (2603:10a6:e10:3a::6) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|DU0P189MB2201:EE_
X-MS-Office365-Filtering-Correlation-Id: f501e7d9-d1b1-43cf-d828-08db2ab79dcf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WEJkw37VzagCkr5cEulfTHR5+j9L41PK4R7uroH4PVpIYhT+gj5Sr18OwNKf0RcM/ZaNvTHrpABQSyf65BMabSb2Mo0fMK6VuFHyuHkQpvXs3S/HNbeA6/O+KtN+TO0g+F/zheR39uV9iC+wNC43sL9afNHLTjKjlf/cDB4HabwtDcz9oQ1GsL85foMwpJjFJzxlId/yH6eNxWbdaY0BKFGx2oSpleG5scTq8TZTbsZNdLI79BtaNmyi8TwMlLhSCz4uJP9z/uJm4jZlWNXgweRHppilTsb4rTbPIbuzRav6BfPID4FCj8cULikMPiJYDZwD56b/nSERVcUIp76Pw1KnwDdFkJokVrdkZYf0kkbzNsrt6dBav5TPyFvHXKlbFWid4+wTZX014LIDGTzKxIE54yw0xx5XPheNc4xFoQY3FUaxdy1Q+eiyGdsAw25ES3b0Ldg6xe0AfORKY+c7wBjqOx8agyUKRxoQSTLpEjFENzvuXkfsSBbpHwE5JH3bufqSNzkgmuZkfYqi1Wul47ZXOciij3g+U0h1KmbLMlX+aqZZECElMNkuAZB8QuhI/H3Qn4T5JB3AcDe0DZ6EbIXTWooaQ9gaOR922qqLhS/LxugiGy05PpTymer/Rh3neajXc94LacvGLDVdaFnDV7tZL9J7xwFhJfXP78CKZE1rS9aDj8j6r9fFpRiNOqaP+LLCi9OXRNDLF9UGxIqMxlVEaRFQw+UhYHkYODqstyM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(376002)(136003)(39840400004)(346002)(109986016)(451199018)(36756003)(44832011)(8936002)(4744005)(5660300002)(41300700001)(83380400001)(2906002)(2616005)(316002)(478600001)(6486002)(54906003)(86362001)(38100700002)(1076003)(6512007)(26005)(8676002)(70586007)(6506007)(66476007)(66556008)(66946007)(4326008)(186003)(6666004)(266003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LhOhaLsJaWnZTnJNfQPtEz5LlWuAYyK6209es37SVadvLWbwikIdTkmoQsZ8?=
 =?us-ascii?Q?gDk0NcYRS5utjo6bXr4ZXbrR3o+lmJtPfSkTu/+mvK9eDRvv30irewg0LpsT?=
 =?us-ascii?Q?RDtDhPJl73xn0S5qK3JPRWB2Q9DMui4HoP3Te6Cyy0ayJik3UB5UlCQPF+fZ?=
 =?us-ascii?Q?clWF0mM8DBfZ21AB5RYUf/f0Y5IIuy9nFphnxSkX3g458N+fXpUeeXqXe1YR?=
 =?us-ascii?Q?MKDFGj5iTFgtfbrtBSSAZkx1j490qP78FhOu1cyVdsVW2WDA0bchmUg+d5aF?=
 =?us-ascii?Q?0M5k+Hn3LGpVwaMLsRCIX8zwipLxZkJ2rMLSTuypqjoZayFMqz5p5Lt2XUzj?=
 =?us-ascii?Q?6sKH0VOCX+ml8Aw0HHuDbhYvHiQTpKqSF2f4RrsF2yKPvX8/XxvhwxQm3w4p?=
 =?us-ascii?Q?sCcMGCBxjCFmbvh7k2zuAMKXEif2WNjkOYDTTa5ivPuNtPOrc+HL4AsuSABB?=
 =?us-ascii?Q?+KMx5ZPMhUrG3GrrJJJ4VKdhMjgvNA87YbNKJ/rQLZ5kmlm6txw/8YWWE9N+?=
 =?us-ascii?Q?HeiVjKB4N04aud5HEtgp+CMTFb2PPBQ/GPyQd3A2/PkroreXQzSijMEPg0Yw?=
 =?us-ascii?Q?UJWb59RKAB13kVueryUewtU92vVJEH8nVs6UFgtPxky+O83xQ5btln7hboe5?=
 =?us-ascii?Q?y/uyHG0LrAL3wO1G2pI/UpMFM6QnmUQbhsM8CzARlgtrwJxit2QpiW2k5tBW?=
 =?us-ascii?Q?z5uCUwOsa5/pZCIZBUaI9W92nlbbzPavLqWz1TUhWdFNadU5CB+l2Q28Wl8t?=
 =?us-ascii?Q?D9yBdtem1IAnSNG1dXJAddwrgXZOn3NBDTZ1kyFEr3QfL2OctXh9HcZcqbjb?=
 =?us-ascii?Q?kqumn9rewic1z1nzt4ZejW9wAT5SDRZlZP/cDCdnvwiaqnq9DoRJlWXb+4Fc?=
 =?us-ascii?Q?AF71MMDd2jDl00+FS4xdSq8wfoYrpOf2GlW+1/C1S4eaAa8wGotBTmbfb/T8?=
 =?us-ascii?Q?9aqf3eyT0DRx8UBm3nYEC0QiV2vI12ddOAWEF4ohjwAyiZHyCHM9BxQ3Tz57?=
 =?us-ascii?Q?Gx6FuSZwFDpmh3vfMQ+OapLjW0vLv/zSvoT1KLSRur4FAyFSqAcsRDRBFgXX?=
 =?us-ascii?Q?Cy0/e7nnPOljLaR7sc7u2TkjgSXCXvDTFhEUqIBx04yr8vddKTBrIA+SDvFd?=
 =?us-ascii?Q?Q5GGnnq2E1D0CFR9xx3tCRPNvrAmoKGLYYmfs/8AdXBm3vsXneVnz2gh4Eay?=
 =?us-ascii?Q?NcB9+9pevxukI66dA9BJldfYhnfZ4f6XolYyNRVJAUzAeuLgen+V6jolGvAa?=
 =?us-ascii?Q?RW6KA/9qGLkMTQJchVB9YDaJFq6NFufq6utLTeZrtyngnredwGQ5u6BDV+Jq?=
 =?us-ascii?Q?LhTJuiyWgS/oceBZ9w/gKhx/m6obYZ7UnJrPee7Szxs0sfEzwCLxGXL92YNh?=
 =?us-ascii?Q?a5JCEB2UQMsVfKqwc2dzMzG3Z6SVuc4p57VwEm2UIwm1wP9/0sm4Nv3/JBUk?=
 =?us-ascii?Q?9IjyJU1g2gTZgRt6deqyan+drurcSFoCtIzBSIa4uZvi9/qdIwuJkVhTMVDb?=
 =?us-ascii?Q?y52vzyQbBXN39owdc59UDT7zGvxuoj+9cTlXbCU3iMvkLxVH/Fjja360FoQH?=
 =?us-ascii?Q?W3ZRkMK8cetyRJCA6DsxjYdNA68rTXnwjP0ZL0qWO1M8B8EX8lYewlL/uF/j?=
 =?us-ascii?Q?FA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: f501e7d9-d1b1-43cf-d828-08db2ab79dcf
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 09:27:11.9332 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kLekwMvpOHhw6iQROk1VreKFd6TbbGfKqq4Vxae4b58xdp6Txw7RVxQ5fgSTBMNpw3a1U7DTyhaJiBEal3rXhixq3r1Z8Gpo7l86xizMzKg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB2201
Received-SPF: pass client-ip=2a01:111:f400:fe1a::727;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR03-DBA-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_NONE=0.001,
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

RSS for VFs is only enabled if VMOLR[n].RSSE is set.

Signed-off-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
---
 hw/net/igb_core.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index 1de24ffde2..fd38c7c56c 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -1054,8 +1054,15 @@ static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
         if (queues) {
             igb_rss_parse_packet(core, core->rx_pkt,
                                  external_tx != NULL, rss_info);
+            /* Sec 8.26.1: PQn = VFn + VQn*8 */
             if (rss_info->queue & 1) {
-                queues <<= 8;
+                for (i = 0; i < IGB_NUM_VM_POOLS; i++) {
+                    if ((queues & BIT(i)) &&
+                        (core->mac[VMOLR0 + i] & E1000_VMOLR_RSSE)) {
+                        queues |= BIT(i + IGB_NUM_VM_POOLS);
+                        queues &= ~BIT(i);
+                    }
+                }
             }
         }
     } else {
-- 
2.34.1


