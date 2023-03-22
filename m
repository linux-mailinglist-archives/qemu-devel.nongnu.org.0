Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EDD36C4CAB
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 15:00:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pez0i-0003k3-Oo; Wed, 22 Mar 2023 10:00:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pez0e-0003j5-Ii
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 10:00:12 -0400
Received: from mail-am7eur03on2071a.outbound.protection.outlook.com
 ([2a01:111:f400:7eaf::71a]
 helo=EUR03-AM7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pez0d-0002CS-1p
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 10:00:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ee92+9WTRLTDC73+z471qC5CtVCzRCAcpzLmr3ec2MW7XPgEcM8pY+EodEn/NVhRS1gawRIw+rwSvS/FZZk92XkxOi2s6g9SM0BePT+NLEvT9vx8JcxD6apclsKDyHVa+xZk288CxiuUP/DNWTKCAk666CGcZxFhL8pRhmoQXcQocvwOw29Hv/j4IUBymU1oTwF7muQjo+vr0b/pPdAc4hlx8yXg+YsMMhFIzxQLI4am3c98MN2PUd/QhyiNPRbYNmNgR6eouKpvePO978E6JoJvlsUlGf8N0scdo1ulvmEgOGmgiM3x0awQs9bim1LAND35l9LrYtdgtQyuRWF9Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3K7oLf3LHLxA84gb3wKAfWXMzKWQgK9A6ff3OIZoER8=;
 b=HbSjKt0T0cqVw9VmAQfqqtESZRQHx1nmi/doq0awfbgOnigFfJqGNiFzKr4Cublkz0rCSQTmy4BB9X7j2r+BM35FqwUME+Wonwi2XXlyKL7xSdiTSYwiiquOZxd3t34pKGr4v8B6qxD3a9vFLDgf6UCpzdKQKBuBcT3ND4C7FKhEwIXJKHGj485tnK/S55NIOmLOgJTDywJmCTQpwnIZlzlZaCK2mqEPxCcwQY3BnyPkzB62+nFeYSz36UxZC31sp0pTO6xdYj2wYGyMOLyRgRzPUby+OFy8dIvZhkCalI2RxX9m9nvJu2eQ9hcUx41YGXCbnTwZlfdHKuzeAsWslQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3K7oLf3LHLxA84gb3wKAfWXMzKWQgK9A6ff3OIZoER8=;
 b=UXqRvIK7Vlw3Mi6068WpszvPIHcV1FysI81COHtIgEPxXy93SAPXU94VR2ZntqS8rfDXnPDAilnHJfiVULC5go8KUXqhqd23o6BqoyKrbTzWXXC3OEK05MXWHpXNOk1zaKTE/4bZ2iaxbC8Y5ZDy+T8pxWHpqD0yZG3GH0LWJuA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by PRAP189MB1850.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:27b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 14:00:03 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::13ad:a312:15c6:91dc]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::13ad:a312:15c6:91dc%9]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 14:00:03 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v9 6/8] igb: respect E1000_VMOLR_RSSE
Date: Wed, 22 Mar 2023 14:04:38 +0100
Message-Id: <20230322130440.26808-7-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230322130440.26808-1-sriram.yagnaraman@est.tech>
References: <20230322130440.26808-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0091.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:8::25) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|PRAP189MB1850:EE_
X-MS-Office365-Filtering-Correlation-Id: 19592c71-9e19-44e7-7974-08db2addbb6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CTLTcN6Moq0GZUZK5uAAEqRZEl6aYc7/hr82PFmqtBYSTas/w41UONBbzBm7QZvjS/nyKh/4CLjCnANSr7d12EkLAmhlLrFCV2EmT7Gfk6WxkmFbBc37R8QA6VceDEqYDPlyZkiVkLBFDC+8m5nA7A/4BWUjNOXc1iJcQqHiAsUTul6ygJQfUP7yIFTLDP9jMJVMsnL2ltMvL09ZvKEnqipNY5g/EQtScsMRXaP9GuXGFSWucYFKl+ti5RKMoJ+wCMT4s0bFQ9uEh4TzDoFatG2tYfjly1Ck/Aejf0ArvSLsXWgCu7i7ux9h5m5YTt7JoQuevDpyUl73zDFUl8S9XfPGQeRkCHg+6ghIpJtS+l/2paRwvaTxbOMrykrwmsmruCB8XdE79F0WVzrwxVVwlm/rH24DXPL3G444huzEQPtACjsCz92mNZVtvSEn2itHSZNYFPu8M12K90Z9bJu0zQpm0hN/XEKgS5mMIsLJ1+3jrwPPfZLrE5rWubaECtBewyRIPMedMURceBNF6UATU4s6XEaixbN32rNoHApdX2dh8Nilq9pm5rmerxHC+Wo8JTlWBzWvZK8eyJXIbFdxfuXt7RV0CvRJM20OJQZI2ZtFVamrH5Bl7yLkyU1PZ6gE8835LiWDmGBMmkUnkYYJAc5+r+f3nBx4sguVid0P3j9dPSw64nL1yzeFDRU/BfkP6viZRRgmTyfwk+kmFvDX/ijopow04Z/uEDrW9RQMvGI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(136003)(39840400004)(376002)(346002)(109986016)(451199018)(86362001)(36756003)(83380400001)(186003)(66476007)(8676002)(316002)(4326008)(66946007)(70586007)(478600001)(2616005)(54906003)(1076003)(6506007)(26005)(6512007)(6486002)(6666004)(66556008)(38100700002)(4744005)(5660300002)(44832011)(41300700001)(8936002)(2906002)(266003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YGnIZNln65Fr+MCTuu5R90/IOPJL0fcbUib+IppwHgPxRwBj3prsun+RZO3Y?=
 =?us-ascii?Q?OXbFoacc1iSNWcuVjViAD1QYkgap9RgorIbleSDi0mgrypdj8uPPOcCr5LzV?=
 =?us-ascii?Q?Tqc/iFXVtCmguTXZK7DknUZy6FrHpP2Mc1vbyjaN8sJClW2Xy6ZntQ1o0x7P?=
 =?us-ascii?Q?nnTyW3h4aa5Put0LaCAJ6G9W54JjuyWp6kFRiF53MDhDLhK7nhHQZ8l3lxvj?=
 =?us-ascii?Q?r6QpYJl/weSjPV5ykyZRmiPThhA57LYUPXtzKsRABq2n6d1BcS0v/JjoiNog?=
 =?us-ascii?Q?dyDgCYs9tgOv2he/yIMcttNBqw2Xmz9B5b/sn4Nb4Td5eGvGQLhhHHyjwcjz?=
 =?us-ascii?Q?c4th8Y/lKvKVWf98VK1gHXjsUBLSWxYIkziOVfT8eLewEgDP/tPt+PMaNH0V?=
 =?us-ascii?Q?lnouB5jjFigzOVW8/YcJ81IJEZj+idFaRqpop/wogOnT6Uehq84wRNPVoFyd?=
 =?us-ascii?Q?s8rkPqqDVpgQm9SiGAALxcrAbYpcUQZpRSTXL7HD2AXadpn8hzniwgu5Xpbv?=
 =?us-ascii?Q?LLH8EV/MITySR63U6VVqsMrS2xKjIJy/q4miMFv450PtsviwG6HRzRPI7HLa?=
 =?us-ascii?Q?5yL17/dn6O9m/4tmRdPF1eK97Ld1f3scKtUDMDR3JG52ePTP0O1Q99kmoC0H?=
 =?us-ascii?Q?NNlpR0RCXpCJyT1npcYpdFk3rjQvGlio+8sy/Po/5+K7lWiMzqgV6fhtBJrs?=
 =?us-ascii?Q?jsi9NQUPwim9lj8t931C6eUfob95JdbgY+n0A9hTLnWjcmc4Oed8/6KFIYq/?=
 =?us-ascii?Q?QUOQdE7NgHpnBKBwRrRjyHUCPju835ngGKzovMmSu2sdzE8pUXZm8uH/J9GM?=
 =?us-ascii?Q?Qt3ETSQqRndwbp7FlSTFsxvxGWDeccLK9IPDS6slHFrNNBjtWfCYNfVH2l9z?=
 =?us-ascii?Q?NNPYzGJ4zx//DJ870YIaxa4aIWUs9v/n77kIAbe0oibCrKvuFo2eGr8OVxHP?=
 =?us-ascii?Q?pYnYpjKiMCbPfo8deQK9G8tnFnxoJkR/saaNd1/4kxE+8bAVcrqAMnEebbVi?=
 =?us-ascii?Q?dRU7Qk3dgKD7wEnnQP8vAeL7mItoVRv/BnQXQX07G9ApZAQXabYcQFOMesFw?=
 =?us-ascii?Q?AkoLxjV5PCkblEttQgRUtFGnMceyaoiszUJrUxXb+pcIijTahLXfpKzhuduJ?=
 =?us-ascii?Q?F70ZICuglXrr6X39NHMr3md1IExe0AEM894dHRQGAAtmYGUpW1b/0MSxMiJf?=
 =?us-ascii?Q?nPzkSeWIkJCtGN9hQ8KFHO7QSeFSpTnuAOINiqsG39ZVeazVt9OVUefBbujy?=
 =?us-ascii?Q?1WIV9bQCIY16E+nH/0g2F1vhpE6sHPmiCxp4ignn+Me/vidS6PFWOX87p/20?=
 =?us-ascii?Q?pNX7453MIp5dlWtNUizI5hTAfdLM/lUZRNLHenYXidTS9hf+SqjQNsKBH7cq?=
 =?us-ascii?Q?AgTEIit4YjEDDlx80pPN7XkhI3I29SE5NZSqtTORgTr4pBa6f4jjs3pfBafx?=
 =?us-ascii?Q?4e1v6iwIVlJAawsAEbt5flwnJCpxZLokc3XV5gxamlx4l3UqqukSrFW65/LM?=
 =?us-ascii?Q?4zdFXYX9D5gHuEjP1hQC/+Z5RDAD2eB6bEVI6XG5rfLTo8CjMfOWl1vbkZWq?=
 =?us-ascii?Q?w8REDzJ7Md5owXB07Uw8bL+nCaluM6wFP/uuLMbwlnJDGJhR/8OzDffCC3a+?=
 =?us-ascii?Q?aQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 19592c71-9e19-44e7-7974-08db2addbb6e
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 14:00:02.4712 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7VlpCkTA3IOP+zHHBn5oMVdY8F50ABwmE3VenGySDaPGa5/JG+RJQbxHvLS3AFq+pDnRvjQarcgUx5bzqimYo20sxx6Qyr8IQfCmh0v4bIM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAP189MB1850
Received-SPF: pass client-ip=2a01:111:f400:7eaf::71a;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR03-AM7-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_PASS=-0.001,
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
index 0c5019fd6c..ce81e60558 100644
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


