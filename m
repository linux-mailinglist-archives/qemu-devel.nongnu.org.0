Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9062D39440A
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 16:18:43 +0200 (CEST)
Received: from localhost ([::1]:57224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmdJy-0007qb-2q
	for lists+qemu-devel@lfdr.de; Fri, 28 May 2021 10:18:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lmdIB-0005Dz-F5; Fri, 28 May 2021 10:16:51 -0400
Received: from mail-eopbgr80111.outbound.protection.outlook.com
 ([40.107.8.111]:43062 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lmdI8-0006WH-VL; Fri, 28 May 2021 10:16:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fe99W7q30tvCRvipwy/n42CvfhVEPwBL7sTiWTsMI0Cd520Cyb+JjHJBkH2W/L3GFH5qc1/JpKtDa/79nIEhu/8UTCVRqr3HhRyP/ov7vl2eyyAMYBhUq0sPD4SyXGWxB/b0kngFyXaQNJkQxgWb8Hb9xTFNCgH/VLf5r7yi0v2utwbvCZBV6/Wb0/RrOVqz7OTqb3JsIE4zesjKkADaMhhFVp5H4lYznTP849J+hsvEWlErB5ih7rseCVb3QdL81f5UvGm5PyXg8/LMVmNMlpHHlSijYuBtLMC0wCWkbdtL+8SNNh6wlg+zsuKTV1Da1wEMFUT8KsY1SjfOWKsYDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z9NNyaVNEJFq6b439vWm9Ia2zKuG1MN1q+l8hOuZHWY=;
 b=Rx62v21k4CZ8OzALHI+io5SFrysq/H3ksiwnJyZNLh3AgX+PvQLkViRyo7ubWDhCAEVcgzG0IU1i77+yIG5US9XIcgMUwTmOxswuG/Yhk3jYEYzGPc2iqAlBYnyHbEb8CXfpMqaPT1lfZPeTcuvRg0m07Gu3lai9VDKmKemO3es1TOFMI0mCvP0cA2w1OvKL3JHQMYEySaUzzwmmH9gpMKIK3xZ5aiV2FOTxL9PydmzE6GKXHBdtF3kgZgQLbqB7LFe5AZvKEcGRROiMbHMcWglr5UiURvYyvsFk/wF/aYfJ4HKwMqNdOyrdGWWVtH352sNbeTh/3+xgV+CdwaHDBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z9NNyaVNEJFq6b439vWm9Ia2zKuG1MN1q+l8hOuZHWY=;
 b=i9fgOaKNCmQb+DxlFKy9dpSqxuvw5VkY7HehEKkGa73dVOrklvMtX7Kmz+f/iBsJa13ce4ixdQQ8ucX/jui1FH1AmUxlw9zVCXUa9+U7aqk4hgZt1FAb3QUq1nbrjsWNlkE3bw8W9xIXrUlK7GRzADtECcmvk5enJUk7CGMheek=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3893.eurprd08.prod.outlook.com (2603:10a6:20b:8d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Fri, 28 May
 2021 14:16:45 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.022; Fri, 28 May 2021
 14:16:45 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, pbonzini@redhat.com,
 stefanha@redhat.com, eesposit@redhat.com
Subject: [PATCH 0/2] block-copy: small fix and refactor
Date: Fri, 28 May 2021 17:16:26 +0300
Message-Id: <20210528141628.44287-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.226]
X-ClientProxiedBy: HE1PR0701CA0048.eurprd07.prod.outlook.com
 (2603:10a6:3:9e::16) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.226) by
 HE1PR0701CA0048.eurprd07.prod.outlook.com (2603:10a6:3:9e::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.11 via Frontend Transport; Fri, 28 May 2021 14:16:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2ce5b6de-f3b6-4f26-ec44-08d921e33911
X-MS-TrafficTypeDiagnostic: AM6PR08MB3893:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3893E3F60E717815508F02BFC1229@AM6PR08MB3893.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2043;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Tp3jdg/avMGEXWlZyqKO34ify2sHSJ+JrQCAPiG0uCev4E6E7D3ADe42SHWEkGPi1XfIw6H42k1VWxLiJS72lSFnsuoR9stmHMx3wEIPR4nPJcTMbz1V9gbIIMRn6To6iBuEYbuJSf8pwfyGQx/6pAdK1ka2Rt1UtK8VjKDZOsA64ge0NHtIYL7INTu/PRdNYnyZQ/CiiQWaTuc91Wm8jqNeUEMyY8WwxTxVMwf5x6jhZFf5PgEKHTeVFaRJMNJy8LfavKjWfzqlmLgPlTSZLGAyeozJxFvd0ti3pYoOat9B2V3hU2QWvN9G8nOFGI7KNUK7Lf5qL9eeJsrok66EAM2Ap4mBCIFaLbA1C4EyI+4ndqd37zs3yj2TJ8xLfgzs9xjcHXTPyX+L54cvaBpe9B8/7MKfVbuBq6OTClLCmieTwqo1P4sksL3DPurnJL+mtVjnXkRjRXIhYweRqtR2jjeBX852IjzQmYCbJtc8hdHodVEBDggq69TnB3FbMCDDzGKoJ406stNUjM+49MVKtt7XTKAkbYqp6lFXxF7aM44o8zscwG2qLlgMMwoIW8DbTpY7o3FC+DC2fBwMmgZH8UkeSUMpzwYJcB9k3DnmyFa292AdgdSAD+fRE96IqNL/3s3CEUmTD17X3wGrfNG601uRljoFzWeq7r6+EaiJaeKGuKXwzSKFrKgoCPac5SPh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39830400003)(396003)(136003)(346002)(366004)(26005)(6512007)(2906002)(83380400001)(38350700002)(186003)(16526019)(86362001)(38100700002)(8936002)(8676002)(4326008)(6506007)(6486002)(6666004)(52116002)(66556008)(66476007)(4744005)(316002)(1076003)(66946007)(2616005)(956004)(6916009)(5660300002)(36756003)(478600001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?p+iZg7e6U/LUxLQOtbF1eM+2N+5ctc/PPZzh46llgjgM4hRjnDLlmvaB2Nah?=
 =?us-ascii?Q?NmmeYXnAtCfy1u3bYpu0z7/ZfT6ToOWUEK4NZBdoqVj3zZaxHs80dvZW2HQk?=
 =?us-ascii?Q?SniKge4mR2HtIv0mQZAr9QVmYWSJoHJW40sUFOM1Ioo6ATbDVXlxYHeETsZt?=
 =?us-ascii?Q?JH4OlvCrMjENjJ/5VDsOD13THquNc1Wmw3vdCLcdkaWDXmHDVFcMBjEOllY8?=
 =?us-ascii?Q?3zwt2+oDqQbCMu9B+87TTP36aNQmCFtj5HjhIH96Fg1s8wsd0eSs2lkOzLiS?=
 =?us-ascii?Q?MMSfIFlDpWrErVoDLf2rboXGzwDyUrIUL+A9iquKIyQR1XgOl8VrEv5mAmJk?=
 =?us-ascii?Q?Go5Xrbjkv6tqUctG0cfLIPjMYeX40uP/PMmK/X7PVOTy6EbsLWP3JlvmP3e8?=
 =?us-ascii?Q?r+FJ+alv4Rui2eZQzdDaNYxMjwUUmnZF/NCcdXW57znsjXFLpKX0FPIQ7oKI?=
 =?us-ascii?Q?L3pjn0ln2ny0DentveRvlvrQ1STJt21q//LxdmXIRq3f91vYketoRyKgSGKM?=
 =?us-ascii?Q?3U1xCZRj/eZwpc9VdXyDiaZ6wmKHgugg1b5JwpRQEwa68bc/eJ62r7J4jM1G?=
 =?us-ascii?Q?h9+Bxh5stiFjtosN8incPNT8shBEO8HZHB9DH3NCK3mVF8L1PiBC276TXEoe?=
 =?us-ascii?Q?z4pB3BEnQ3rwkNqMrKMX6PRjMMB+AYeOj9btvPa2IghucuRr56mwlS6WfTpn?=
 =?us-ascii?Q?shLuEmcyvkTnJn/9ZdouXwaeqPZJhj46JsqwMBRpQtEX5uAivQZAaHxTj980?=
 =?us-ascii?Q?r8rxx5UEBJrcZWbKwxAn0JTIxqtoKybegGBfygzvNE/BtOaL8CB9Tvf27jOw?=
 =?us-ascii?Q?0Sr+0GgzWcxIwzQQ2ncV1G2FjSxKUt90RsygUxgzeOPeAya+mNP4KOW8IoOQ?=
 =?us-ascii?Q?u/HJq9z2RG9yzM2xjqnDElDHfJqqlDvFBuMI3Kj9OHHU8Xzsh87U5tjztK4m?=
 =?us-ascii?Q?926TDf/SLKk0+uq28XIC8MzR03GXVnjSQDX/t8fbZ7bhYLGHeLBTwqFZ9Kme?=
 =?us-ascii?Q?/hIvvkPV9cqtYuMWtng5y11spDq96RPB29iPshLqEAhxC0Ed3fnanqnpkj2/?=
 =?us-ascii?Q?UT5CxIG7uH5+i5kFD2Dx7svx46nN35atqAV/IM3yYmTU9Edj28xLTNtmTrrC?=
 =?us-ascii?Q?KFUgUPXziwemizRDEqy2Wr8pFKhkAi4yIEB79L3XhCAngxuRLddJDl/CsSDl?=
 =?us-ascii?Q?9/jB1ywR+EAMc8y2z6otmHZK/ghQ6vrtaNmOZN61FD82kqXG0OJcgN6WAq9n?=
 =?us-ascii?Q?/dLP1QsODreAQJL/LMUe1yC7GmJMqtFo4Y9ilA4T9XU6fzDqWdEQ7sKS/hT3?=
 =?us-ascii?Q?DIx1PP7qlKOorcZejZbekkDW?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ce5b6de-f3b6-4f26-ec44-08d921e33911
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2021 14:16:45.0176 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aVTmZeWMk0OaKf3LJJkYZ/M+O+vW9EBV/+3TDwg8ormA7EoVHRg7wB92eIi4YyYI6uOy58YXcVSzbnuneB/M6vvVOIl/mqHPKHM+kCd0RkM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3893
Received-SPF: pass client-ip=40.107.8.111;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all!

This is my suggestion how to refactor block-copy to avoid extra atomic
operations in 
"[PATCH v2 0/7] block-copy: protect block-copy internal structures"

Vladimir Sementsov-Ogievskiy (2):
  block-copy: fix block_copy_task_entry() progress update
  block-copy: refactor copy_range handling

 block/block-copy.c | 79 +++++++++++++++++++++++++++++++---------------
 1 file changed, 53 insertions(+), 26 deletions(-)

-- 
2.29.2


