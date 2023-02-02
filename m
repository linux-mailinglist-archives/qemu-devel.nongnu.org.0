Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3234468783F
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 10:07:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNVY8-0003Yw-Ti; Thu, 02 Feb 2023 04:06:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pNVXj-0003Y9-RW
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 04:06:08 -0500
Received: from mail-db3eur04on0721.outbound.protection.outlook.com
 ([2a01:111:f400:fe0c::721]
 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pNVXd-00065l-Kc
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 04:06:07 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BGdrnjpeE9flL31GbUkp8GXT6lqF9QB+gBoNyo8swik/PJjl1jATYhCxrxo0AGVeoMuLORXNxlzAcAJVOyVbp9clCOIE6cA1Hkac1gzQFWahRtKrx9pr/rdWkVd3n5tBQSm2i8SfLMA2b1cj8mpKR7GQS+PCzSF+rtYokY0fpQzr8RSu+Sn8bUSNMo3Orx4GXGXeF6N/pRrH4iuSXRUowNRIDP3UaQB+v8kiMOcnVxbf2vAhOMTuhIEH+eG/UZbfZuiNq7TNRuxFu24b38X89wn4tgK2owyZLXsncwIhSaGsdMy84zeQrGVP5Ct/gQkL9PrVAmVwu5q4G5r+Izj9RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j9Abq45938CGnKEaQArxmSlaen8sO/agH+n/BVwCof0=;
 b=cAcGsqXccOleYbzoYdAl4s6WoC4YSeldkOrowHT8wBl9CX5P2AI3c2cj3TmcmAQLadTNK0bUHmDRIGvdwWMHx2HfHFc+TpvVw0ns551ogvZ0LRbXds7Wnrw94WScTul0lFQJJFOaWkUGUHeaFTbNdRJuw9huV+Qg2vqRi9ejuF4zcVed4OuTPlRzmVtusGQpfze6zMCYPHR98KE0PtYIetpV2nMVIcWsc9Lm3BaMK2fyx00gKjnjgJa9hDifo+10xHdrAMHRO4oOiROl8bBAbSpHlPt1UlJ6GpwoCBf6zMBBXVETI+HIXL1bG5tY75prNp0OlTQAJoXhsH9AJ2plaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j9Abq45938CGnKEaQArxmSlaen8sO/agH+n/BVwCof0=;
 b=X5am084BEzO+VtHqtBGHf8v+lDuR+KPBcvnz0ivYpNtIybTLvcCGvWTz39qsGxgFXXfDljwuM0AFS5ylprc2tlvX7fZ1kOGPRbtmHLXkKaRf7jnS1zVenN65IK9v55xMA54DlqUVvVULeXVipSgIQAP5wNN+dk0kiW/Z1t3Pl98=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by PAWP189MB2592.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:362::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Thu, 2 Feb
 2023 09:05:57 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420%9]) with mapi id 15.20.6064.025; Thu, 2 Feb 2023
 09:05:57 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v6 1/8] MAINTAINERS: Add Sriram Yagnaraman as a igb reviewer
Date: Thu,  2 Feb 2023 08:52:50 +0100
Message-Id: <20230202075257.16033-2-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230202075257.16033-1-sriram.yagnaraman@est.tech>
References: <20230202075257.16033-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GVYP280CA0002.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:fa::9) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|PAWP189MB2592:EE_
X-MS-Office365-Filtering-Correlation-Id: 7407b895-8bc4-4555-2966-08db04fcb203
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ptU5lP9GG2Tsr9LotXZoknIbwx2nR2IQU0Wme2FrDrWqX8OI+1Et7WRJ0V1MiRj3HRSBTyLJJqOH+pLDTAW8EfRHbLsy1GZWJWhru9No3jOaN7P/9gZkq8xObCAjx8rcVNSY7AatEXksWFdalx/G+jr1vv6Dx1m7JRxX3H/KwbTO+Pvd7HGjPUuFQzhd9rfOCB40mjSINZbx//I1zuqpkVedFHDwf69UPTQOsu6pf6S/fev2FGPSk1TBzEMl3mgaN+6udiblY9sI3IiMbNrG7rizdqYRs/WG0gQaPGz/mzwC8TaivmH+s/PGqQ4ndZtRiwcvzQFfY4lNWSNIwduLWsCBK1XjdiQE3IH9E1QY9f7toRB7xEz3JqYJfutwxewBJbMShh/rlPsUFZDU1x8UHnalp9SBe9FY5Ab4QRHnyxLqTt3kXiJUeoz6QkVnzGlh16jqX53rH1x+XDquuLKAsFoyiJ0PEBqddehIA7doZ+EgtpRnCmN3aaKUKbayjZP7sY9K46Ft1QbQU6G74Gglz+4HRKAGkpNOhY99TXKGbNmZ5IzQI/81mgELu/4u4slPfaNCFjReasujqvWd+FlXBSDi9XB8efWX9JGX9EzL4jrDCjF1BR6OyTxR2o//Npa60wiHixSZ8/I6gbYXd5Il51Fr92H7/oh+1AJfJ5lPhcVIi5/L3HiyJiFXys2EiqMe+Qcj2UGJ+WflfKIzTC+En1m1wHoU68wj6qUoDBnwFS8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(376002)(136003)(346002)(39840400004)(451199018)(109986016)(70586007)(66476007)(1076003)(316002)(8936002)(4326008)(6666004)(6506007)(66556008)(8676002)(54906003)(66946007)(41300700001)(478600001)(6512007)(2616005)(26005)(6486002)(86362001)(186003)(36756003)(44832011)(4744005)(5660300002)(2906002)(38100700002)(266003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XST9ylFjfNAyC9Uadgx5vo6Mx1poBmHWIEC7LLqLrMKDWRc2vPjYMjrFA70y?=
 =?us-ascii?Q?3EHfMroO50sql9xbM1r8cFjyOu1LeSm6HUCidbL5HyAmBw/9q6Lfdd7N9Osv?=
 =?us-ascii?Q?CjT2/uy80T22mooWtc0Emd9vw6eKjhgU8PEhaT8nwJ1Oa3BtiUf1SXq7oVQA?=
 =?us-ascii?Q?xWHSbLoN3Vo6GW0MKCg82K+H1oSdbr0P4LiZAcw9P9SEOE+Lg+khMUMv1PLU?=
 =?us-ascii?Q?LOLKqfIj2pUQrq3pVsiCH0sbs5e0zR31yX8FWm8ukqJoOjXChHuQMAcYmmev?=
 =?us-ascii?Q?Si4B26nKjTQf7PosTCzPg7XtLh9Jg4ZAUbi7J4isxNx+58Q08DpmU4akMdrQ?=
 =?us-ascii?Q?8fJuNdDmRv1a5WSAv+oQIc+jbla116/QJWJUxj1hy2NtdZ1nsNgtIdlb+yMy?=
 =?us-ascii?Q?UuzZ89fj4w3sTzEXsq6iVjl77g+k2nze7qkOyH9BdV+W3uiVZWmO1Ht4S7+1?=
 =?us-ascii?Q?YMVfS1QVVHQntnO5DrYHH+BgA2EbkiMPEUUbtDQOJVv84RXU46aTFVdYD0d+?=
 =?us-ascii?Q?MCnSkT1ehYZSUvDJE3C+6Dlikp0QsyCqcq52aBpZRUgS7mXmEwHoDciJFmjH?=
 =?us-ascii?Q?A9kqH2zhyHPEw3N6kX/yaTBjnJs02I4kUk9bGOB0xmuWzpQ19qlS8uUBlc31?=
 =?us-ascii?Q?DngatXb2+NQy8MF4O8bykB2A5Qp6N5P+KVzz4UZMToVcRaXBbl2kSOBfeV7u?=
 =?us-ascii?Q?bwrUjVw/MdsimnWz2S3G4L6sn0WC7tJ2Puz4eOEcPy1dz5fDihTntWuPK5Bf?=
 =?us-ascii?Q?x2KC2nVmAzEEse3ZCetAMF1szQFHlTeqLoMPmfKeQi7GINdFKsK3qzbbRvn/?=
 =?us-ascii?Q?Lvgy/yV80aRmpoQcMXr2z+QUirnxNeC3oks2hj556cJnB1B18xgElqEXawNr?=
 =?us-ascii?Q?TDaa3TZT5AI2Y9fNCnf5r8EAc9NyOP4rYZ9Q/OW99HlBxxkLwoTKyTCKsE5g?=
 =?us-ascii?Q?xDo/aeFpCeRNwaEf4QNNixKWTIFQUd0D9yeIn/sWqHUff7PoXXSDYl3K6yZ/?=
 =?us-ascii?Q?0d5pImMnKOeJTWUZcfNovBWaJsusrrxvNhx49psT7J13gHz+e8EChsh1f26f?=
 =?us-ascii?Q?Up1W3dmEo1MNOiyno34gmxr2d+ZKsy3t/zX2BD94J+yHNFeoxiCMFfH5L6Vv?=
 =?us-ascii?Q?rTDghu49iU3s/s2S5zSLMkacINL9FMuxXf/FPg2dvj237mKosqagKgV30gQO?=
 =?us-ascii?Q?a831+Lwuf/0NCZLvKwJtPF9NgCCuez6m0hKHZAOVB01ABp1Z7tqWdwZTo8j6?=
 =?us-ascii?Q?D3hjECh1rpMUicV3/yLyGAaIoxYM0TpacoVKFYEnkrUheCa49HaV9dLLDjxl?=
 =?us-ascii?Q?6o6dWK9/A/lLFLbSD8mReRMHD7PN0OlFHcyrycBewD1/8oGGIzv5bbnCN0+w?=
 =?us-ascii?Q?bbCBhxO6I3rxUL6FmjM5zwqMXB38EU94UwehPpZXgXZAfmXMo9uhaxI1XrS2?=
 =?us-ascii?Q?fZf0LREOcmtN6+q+3Ww64gqwPnZ4T3C9xxZ94NuW/WUQRVyKR3fuYCs2xAdd?=
 =?us-ascii?Q?u7iWmMJnKPmBJU+4bSmTyx2WqVje1CBWvxtyjvMSZOEYV/B4TwweXrB0iqG0?=
 =?us-ascii?Q?N3/5+1X8WYHgpAqZ8lNnM/jE89MgLI2EmIFv0XCe3Me8IT3K/5Mu5NNBWLtm?=
 =?us-ascii?Q?lA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 7407b895-8bc4-4555-2966-08db04fcb203
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 09:05:56.9598 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oGg4cmFOmwtfKQWT0qbLbpLVSL+iz9/BwLyvEXEUtPVaynNa0hwCNeDDf9lGC7y6DY0VORLODIm6HAMQWn3OEKSdKXJ4qsBAbcaPq9hUJuY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWP189MB2592
Received-SPF: pass client-ip=2a01:111:f400:fe0c::721;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

I would like to review and be informed on changes to igb device

Signed-off-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ece23b2b15..7d0e84ce37 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2224,6 +2224,7 @@ F: tests/qtest/libqos/e1000e.*
 
 igb
 M: Akihiko Odaki <akihiko.odaki@daynix.com>
+R: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
 S: Maintained
 F: docs/system/devices/igb.rst
 F: hw/net/igb*
-- 
2.34.1


