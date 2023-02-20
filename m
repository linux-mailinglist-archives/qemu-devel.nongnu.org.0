Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C57FF69C851
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 11:11:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU36e-0008Ax-Um; Mon, 20 Feb 2023 05:09:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1415163841=bin.meng@windriver.com>)
 id 1pU36c-0008AK-Mq
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 05:09:10 -0500
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1415163841=bin.meng@windriver.com>)
 id 1pU36a-0000AG-RK
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 05:09:10 -0500
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31K9CRZt026793; Mon, 20 Feb 2023 02:08:56 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=sdc1sBW+ClvCoAfMr2NakYHq4WgtRTi5ldHN/9cqbdI=;
 b=GdnLObZMl/eJUJZOrZzu08grlEEnI4nVxfqKOLjKTgjEEW2MXgR1cktOMnaNH3gwUh/h
 9K7jrMDdQk314VSh7bZmviXi6ogy6T5Nvwexc/1M69cqh2gn1vUymcP026eG5KbIZDFW
 Ngc36rtpi0WdPoyl33N6A9D0clLMlrPflrwjbJWGRVMRrz3dYA9ZfJXIzr/68mqUccBP
 SUGUpzxs/ljBPbqZp9Ky2IXGCGuuIJtyjl5HMtYndh3FxihKzU5Ui0ju43ZdpEmaOUow
 OkuG7jYR+gGFAISuU5ThX6kdO3scgECcJRhH/JBYoERqzk/OwfZrdzHk/HngmcIvf6vz +w== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nty2psac2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Feb 2023 02:08:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yz/3yfx7lwTUUGLfKbu6IsX9pdVLEsNtXBj5fR7zuiibcQJhLKG2da+9OZC8zzPpU+DmCTahpcLfloHN0uMUUjkcdRYjLnLesuOXc41HhikyZwkmXNB+Q05lPSUhY3dreGApbDJWHOa1iurkbJb4nxg9fMt0iBTgYoJSmPaiNLTg7RrpM3bf4Mm1jY+Q4y06cYu5WlInsjw5ztYlDW6y1FG2o3W7CXbmAkqO6DpPutuYZkHbaU+fxLFuXsBW7UyNuakczgAZua2np/wPHqACxqnakKHfO/QhxmgRFU6l/hR3wQNI1035LWeD5Xc1YXVOBhHnnotvO+0rkpvcV5lkCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sdc1sBW+ClvCoAfMr2NakYHq4WgtRTi5ldHN/9cqbdI=;
 b=cA8XBd4mXWREhr00ictr2X0PF7NGQucQ9GrwAcs5B6rINM5Ko/ZrjfTB8IeE14tLIp4hXOF++ZdQxEQqL2kv24QMiqt1vYOlr1XwFmCpK8d1tK/PLOevwas2ce86+0qSuDHgh3KGDWqSZR263LCzLMGa/FCNgb+6hNDjW2IIt8CdLyoAUsdfgdwKQ2wFI8fhovIMD3wJiN1VAT/eInckjZ5/ubqjwcPfK5EsRpr5X+Urq2dMyRuFOttbMWxGMm9TNKhzCT5+nvYpUbFjbQ/EzGCUWcBW9513JWmSxWPxuEN+ZVv6mVU8JSQ6i9WBRUoXNYZFf1Ypebd/ncsJeJVmqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 IA0PR11MB7912.namprd11.prod.outlook.com (2603:10b6:208:3dd::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.20; Mon, 20 Feb
 2023 10:08:55 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::6c5d:5b92:1599:ce9]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::6c5d:5b92:1599:ce9%4]) with mapi id 15.20.6111.019; Mon, 20 Feb 2023
 10:08:55 +0000
From: Bin Meng <bin.meng@windriver.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org
Cc: Guohuai Shi <guohuai.shi@windriver.com>
Subject: [PATCH v5 13/16] fsdev: Disable proxy fs driver on Windows
Date: Mon, 20 Feb 2023 18:08:12 +0800
Message-Id: <20230220100815.1624266-14-bin.meng@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230220100815.1624266-1-bin.meng@windriver.com>
References: <20230220100815.1624266-1-bin.meng@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0220.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::15) To DM4PR11MB5358.namprd11.prod.outlook.com
 (2603:10b6:5:395::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5358:EE_|IA0PR11MB7912:EE_
X-MS-Office365-Filtering-Correlation-Id: 328fc7d3-cdbf-4451-2820-08db132a7938
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RsXwVo44tUVfSlm7qppJ9jF/zeCf4vlKCOk5UsEJj0+lFXYKJYt7PFjNE2DERyfwFKPxL7uKBgA9/hLWNiFqrAq1MDR+coROoNnXjwPc892YuneBpsigZnczJe88mqOrs8w4kHM3lXuDhS4epj5uLMQ5wkP//CjVwF63rY/vM4alYZhN7Lqrx+nsU0knq+QWByHplTFv+tD7DOINNSUFrqa5IjNlmSkXAkTIu069Ac751zYMdF166pL2yVM0+dzjTN49Y0Pfsu+AYWSJ7MjotXqSGAspvzJVXbGK6tooIwCdwGQoJGYbD+kDQC2uaH8sfZL6iVEPHsIeJjmb6w9u00KrmHNTzpUNXYxBDmZxBUXJCZkfUKaUeAV4FLOby8oPczQ30zu53rBpJoMYdso4v+vakMSz9mn84zyy2DlyBKK7nrRDPyOXrBqyvS6xhOqiAojwu1dIgOGzH4ODPwz63M5npsSSxpYU2HSaBqII6NPrbqPJwGdFHcDGQmJBWuydI202nLB2OI886BLILPw8JgOfADiMebZthQoc3WE1fFDdG6cQY9Ni37ffsdW/DlTzjmE7fsOAdj8ZSHKdz1VNSmXv+AVulX9AcdLuwJPvfWa1jksXiaAkLsCygoiS5PIPuoRaRo7q0PancohtOK84pLMmSpavli1T92IUyopGt0WInW+Z+OLf1HvM+SHcu0hzK7ggq0pJUzrbIA079cbzRg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(376002)(396003)(39850400004)(366004)(136003)(451199018)(8936002)(4744005)(83380400001)(5660300002)(41300700001)(86362001)(44832011)(2906002)(4326008)(52116002)(6486002)(6666004)(186003)(26005)(6512007)(1076003)(107886003)(66556008)(8676002)(66946007)(66476007)(316002)(478600001)(2616005)(110136005)(38350700002)(36756003)(38100700002)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FA2tdfpz0MjERVsVL9gjRYsevSSrJ8YgcDT8uhKA+E6w81uyBdaiGUxdnftz?=
 =?us-ascii?Q?4EpQzutHTsFYDKkjcddEUaGBIep4Hs9Tx8W0rkEgbu5IdfreVyKOpXkuGZCH?=
 =?us-ascii?Q?8AqzF4hxY0i0nrxfM9RZmeJsoEOV7bjali7s0FFgikP74T7pjUVoFlXW1b8J?=
 =?us-ascii?Q?PuwyArq4s0JpRGwZEnf+hLMZRhJ6YcHcJ4nn8NY5/rPuso/deI3vUnG9HUm7?=
 =?us-ascii?Q?/Kg8K78N8vytGhbUdrn4/dxnTRt5ZyBfpCTr2+djxUzGepzx5vl2q+3X7nRw?=
 =?us-ascii?Q?RrglAZfot0qb42rt3vV9VO/WfrtQlNPCm1d2fd5SsHrF/KlFACSKRMeHDcfF?=
 =?us-ascii?Q?Yy0b7GJTI7/FuvynnX8K4siCq//U3N40oZFfVlFWqxylt3wAl3drBJcRuh3l?=
 =?us-ascii?Q?59+tN+E/DDkqt6BfYzDplCCoTAf3uyXv9szyvMvK1XEpmrheVXi4zuX69Rx+?=
 =?us-ascii?Q?ujAaHKaPT+ki+qUPEsXuP6ORcoGzJaXOY4IGRlplVdeNLsAv5qrmkZzrYtRk?=
 =?us-ascii?Q?NrPz3GCbBCK1MfyveRJFt7Nn/TuxafytF67GDT3It0SOsHoRoAjlWMzhgmMD?=
 =?us-ascii?Q?dhku2/7IaBNrpj9SrLaLWR3XboeHrdXytpsZQ35WLvOdAj2Wb1LKL1OKGQ6H?=
 =?us-ascii?Q?bapyotPKK/zwzsKbI6B+EHvpVfsLB/FWH7vTN8NvC0MyCeDhEWGvJPC2emGw?=
 =?us-ascii?Q?3CXSlFiWuY30HLZrUu1xIPjwGOAocWuE+pyYZ0XbfbhxSGcGSD6ECMcJ6NVK?=
 =?us-ascii?Q?vO41xPFZdSWHdh1jBHIEFtCHiJW7UAqXxDn0WMNjZtrOjc6BQs0j2jAxBEWr?=
 =?us-ascii?Q?PQWVEHiPqPgUEtdfUOptwFfyMeMswehT7RKRYiXkjhlwD3QxI4Sfx5HKRHqs?=
 =?us-ascii?Q?1+/t9KXYT3jRBD8hlU8OFAYsz1HjfJHsdnyV6outXKaRJFApApxmiGtbGDut?=
 =?us-ascii?Q?yFpWMG+qK4ilAdNBQCd6Av/I3Gnvst1ktGHopI1bhZZ224YxMoZg39bD/v0n?=
 =?us-ascii?Q?q8G4I6VYY0c2V2e2RHt5nWQx4QFjRSJUlRd270grX9ut9Tb8A/Gyop3oQ4t6?=
 =?us-ascii?Q?WCGkg5HgisTqoOpK9Yys5IW13cNEZzKEi8cEdH6/JhSu/hZiPx8TJboH1o74?=
 =?us-ascii?Q?bCLJ08jmv/lrkCWhbw4KZBfdXTO0rlwSSHmFW4eG27Gx/0gtFPnYnMPCDacb?=
 =?us-ascii?Q?yjwNEVAEZZISbksVPt8NzJDia6C1zCaeNeQgDDU9mGvbNE45L1zudKBk4Pek?=
 =?us-ascii?Q?x5o+Th2LAwMaZF+tkDwdKea4z8XWTM8+NPUdoBRXAm5r0mhMzYJ6QGFKsJNt?=
 =?us-ascii?Q?Cw5J66EKt8LAvBZ+9FUldgouLyrBbVpNPueccyjEepZtamUb9tzBou3CQrQE?=
 =?us-ascii?Q?3g0A9GoPv/2we5SE24fCc7hGtSrvBL9f4z0EAuFQ0NiPaCEb4AWW80e9jY9c?=
 =?us-ascii?Q?FisyIJx+W2fyamA9Kl5QtcNKMk8c3gnqyWdz4B9BbJbTSJpapMc96ds57bCX?=
 =?us-ascii?Q?wwbsp/CAdv/ZvK7KyrGwJxHoBDd+ukz4/gKUDkRVf+XB5ZpiasDUso3hTVyd?=
 =?us-ascii?Q?j8bNaQeoglTWXHGIakOM3c2pGeOoNbpOS2ZZM2eR96z7YsDvOHLiJfqPvKCn?=
 =?us-ascii?Q?fw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 328fc7d3-cdbf-4451-2820-08db132a7938
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2023 10:08:54.9302 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cn/fQt9+m9VznM57HWooIvlkMq5WNnHpKvwhsbJaYqVEN7MYbeMxm+JJyfusloINPfz4wLBpj1V9kHTpMRTPvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7912
X-Proofpoint-ORIG-GUID: ajvYor7aIrR-qKzATBKiAmP8FiwIcT3N
X-Proofpoint-GUID: ajvYor7aIrR-qKzATBKiAmP8FiwIcT3N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-20_08,2023-02-17_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 suspectscore=0 bulkscore=0
 mlxlogscore=788 spamscore=0 priorityscore=1501 malwarescore=0 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302200091
Received-SPF: pass client-ip=205.220.166.238;
 envelope-from=prvs=1415163841=bin.meng@windriver.com;
 helo=mx0a-0064b401.pphosted.com
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

We don't plan to support 'proxy' file system driver for 9pfs on
Windows. Disable it for Windows build.

Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 fsdev/qemu-fsdev.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fsdev/qemu-fsdev.c b/fsdev/qemu-fsdev.c
index 3da64e9f72..58e0710fbb 100644
--- a/fsdev/qemu-fsdev.c
+++ b/fsdev/qemu-fsdev.c
@@ -89,6 +89,7 @@ static FsDriverTable FsDrivers[] = {
             NULL
         },
     },
+#ifndef CONFIG_WIN32
     {
         .name = "proxy",
         .ops = &proxy_ops,
@@ -100,6 +101,7 @@ static FsDriverTable FsDrivers[] = {
             NULL
         },
     },
+#endif
 };
 
 static int validate_opt(void *opaque, const char *name, const char *value,
-- 
2.25.1


