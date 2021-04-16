Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B389A361B3A
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 10:19:28 +0200 (CEST)
Received: from localhost ([::1]:37758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXJhH-0005H3-Nk
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 04:19:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lXJXr-0001C6-1C; Fri, 16 Apr 2021 04:09:43 -0400
Received: from mail-eopbgr80121.outbound.protection.outlook.com
 ([40.107.8.121]:41299 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lXJXp-0007qY-1i; Fri, 16 Apr 2021 04:09:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gtZDk9BJ45NsihIpUldobB3nKzoaGbYSBPDQkASIyge9Tk/aRUNBW2t7PX6oLGz+KY78Nr1IeB4DWrFpppCDzoBth3cPiemEFiFJPfXehiEGLSs0bfF4LpuTx8e2hI7Q0q5rDKe+QnWniX29DLeyKTlg+l4JMHC4sI10x7kXaEZMwg7s4zI4NjY03d2kEMa5BMoT4I7bZHOYOGT/6IbPK+HsiCFe2FMaxzx46/mAP/zsPzl3ccFfDeIntZ7CL3jJmUFKVOBcfqGSbjCjWYSzm3GJPl8l/hIwIQfwm+kCLT5kxviGirehmGnpRLa5cZc/0K8Ks3zpTg1KOEk92Qt5ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vtju8JLKUCtgURwEpQJNHEca/ScnIMVuOyhf17idpsY=;
 b=BH6ruUC3U/+8Pd+cRf4ko7OtfEwLN8rjZGAK8YFp41E87E9Vbihnj9QwhXA4NvLtOSntHFNvf5onX3Mf1QxuW+SbhSAyVLiRXAXUGecCilc9IMQy9rWXoV9LLCt54nr2oO/wMPRdwRXgXkPdRri1dVRdWiGW/CBIKb3OMN/2mJhzw6xTLtPf5t6Os2uiQBersMa6KNEqz1Hn1oOmW7gDGY8WjKugd8a9co0LGjdVNy8Uy04P5nMR5mUNszr+1ZOcGpYXZ4vfKkMzOBNKvX9+tGN6LGr6T3n02FqQ3sSd4HG/DSTQLH0/URtpOJM1ttUeF4wrwoVflN9Gpae/9syIFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vtju8JLKUCtgURwEpQJNHEca/ScnIMVuOyhf17idpsY=;
 b=UEFYZMcNguE7/clYtlnsVMw9H9EabzeBA+c+OoFyoXSubJpEWArWC6denE2pVFeRHHqWdaeEU3Yc/S1GV78t1avQJZ6oOTpz5reg9skpL/WUDm/MDvTvcaMVo1eeZYnmBFumYMZgj1fF2nIfjAbG3nHaXFVMbPTPSORjyfB0lXU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5078.eurprd08.prod.outlook.com (2603:10a6:20b:e7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19; Fri, 16 Apr
 2021 08:09:31 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4042.019; Fri, 16 Apr 2021
 08:09:31 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, rvkagan@yandex-team.ru, den@openvz.org
Subject: [PATCH v3 04/33] block/nbd: nbd_client_handshake(): fix leak of s->ioc
Date: Fri, 16 Apr 2021 11:08:42 +0300
Message-Id: <20210416080911.83197-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210416080911.83197-1-vsementsov@virtuozzo.com>
References: <20210416080911.83197-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.206]
X-ClientProxiedBy: HE1P189CA0030.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::43)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.206) by
 HE1P189CA0030.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Fri, 16 Apr 2021 08:09:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a966ea7d-5f56-4564-e802-08d900aef6b5
X-MS-TrafficTypeDiagnostic: AM6PR08MB5078:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB507864BB249DFB0F99306A80C14C9@AM6PR08MB5078.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:52;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FT7GBYP8rW7KfRQ86u09ZrFvhDc6jexvo15gEQGLee2yXe/taRyBMDUaXmAf23qR6NOWGwnkManHBWKHXaksQEsVL1qjQ/3rsqxbMET5mQNnK60XtVt7GOpCaWvVxSfXj4Z4ofD2g/InsDgYMqHoEZ9NFTQgmqjKEoLy1eyFWovJxH8VBoazf+vbK1F4b+63BSby93sRhYhnIFfMnHz+yUobmH00El7cqa04vDZ1QJ27iL1h/kuzqjMYJFwITMjOJkg/qafQLqo6uYzyE8e2JdhI1gmiFUUJGkIlCboC/rHCsEk75KZHa3gmG3GVjAG2PSnIB7s1LgnTX2khL3rGSues1BssqY0LEfpgLxt6tCMLPML1XGsxh0i6b+Wnup2Us/G4fTFYBIHlV/5CjGoTOYw7/iIKHRnZWzMbFsRK7mM8a3umLQ5pWGcPdo/qKxWAFu1u3O7xtmaTM15z88ICradVVBybm8JoFB2iv7Grzg8ojVVdOLqdBQUXdnyAeFj9/NRki53xODeqTbH1jjbDN1IugtpMUEygilk8u4YRrvJOhZnJT5iVejWTud380O1jeqfkrVgJftqGmc4ncrKUbU7piCI2IJpvHj1kKaFUDDePoN4CB1Nju3SQoQ/lpNSETTlk2MRifIUZ65GVOd7ReNYnzAAT5LwBBR4l6fClndmDffnbymdLtJu2MHEqZxnd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(136003)(376002)(39840400004)(366004)(86362001)(36756003)(2616005)(66476007)(66946007)(66556008)(26005)(16526019)(6916009)(2906002)(6666004)(5660300002)(69590400012)(107886003)(186003)(4326008)(6506007)(316002)(478600001)(8676002)(8936002)(38350700002)(1076003)(4744005)(6486002)(83380400001)(956004)(52116002)(38100700002)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?0+R63F4BZrgEX41kw8zzgG4WKZOc8Bncw0kL1ie0wCfiNa9K0tJ3la/3P8+K?=
 =?us-ascii?Q?bp5+MAu7w5nt3TT2FhSKg/Hc+QKOnEjMCUwHG/dnDJ22JMbr0ldbeQMYGj52?=
 =?us-ascii?Q?lIZhx+eq3eMe9wunajkvnx0KoJ38RtIVZHH++0QADL9tPDkaDpeUncE4xEFb?=
 =?us-ascii?Q?QLw9iRSf37m5KWGCQppFBuFBDmByDmsgNPh92Ya93EfS2yGj1bxnhzObsNlb?=
 =?us-ascii?Q?N20Q3dSkib+cqDQ3D6RtGG3e+CZ4EbNduQcegMTjNSJnjxxjFuRywb77QWiw?=
 =?us-ascii?Q?xEuGaFkEBaSdfIOAEuE23vAZX0Ly7ipSbUYnd22GHUVsjfVLMl9ddvYZilvM?=
 =?us-ascii?Q?6OI2x6EiO9uYPoDQ3tU/f7LTjfcUfbKFZsN+GTZcR4mFtdYyCwX6fEVCWSBS?=
 =?us-ascii?Q?Q16J52+o5Bj5qbhSEQIKNp9eV7rzoyESqBuewWkt+4PJer7QGC+Jg/X4aoIw?=
 =?us-ascii?Q?0BzkWVKXqxVUGbnUGUOleL/LH63on0ZebXbR6K1vl3XeFOCl+Kyhx8IKXTtG?=
 =?us-ascii?Q?wuW18Lx3a3deQAP6bQyBiDTcNJFgkWoNSTQeW0x1gSDF9dIBMogXV8BBqZIe?=
 =?us-ascii?Q?OWapiT3x3BT8vk1lNjL6KV8dDdzmkdhcz1YlvlMLHzfW0XJPF6pkV0N1oONY?=
 =?us-ascii?Q?ldpYtON2yceZ/Wr/aSwLj5QIX5ayd2SgXhE82K0Zv9f8Y+DqDGH+MnMUzpaR?=
 =?us-ascii?Q?AzFxwThsFar7qEvE2hp7MJ7wxYiNNXe0BQRDcSA1IiTRnuX/VOYzK+3U3Ufu?=
 =?us-ascii?Q?RN7jGXrjvSk9rTIVqBLCaQJ3XpW+X8Hh0jGVpMkISEkEPV71tHd+lLtgiaDp?=
 =?us-ascii?Q?5jEO2B4TtwQ7GbAPlpZd6gpgfmtNOfYUZ8Y+EGUqIK5YmCqABWbGJDcaLkU8?=
 =?us-ascii?Q?UR/reSqHsn4Jix5b/Qcq5sNSet1du5Cg/6g8zpOp4xo467e3zPaopdYbiq7u?=
 =?us-ascii?Q?7foK+zCiin1MLDZuPnrq+fusPuwiaMsPnqYsvIyM55DQJ6lpvdBsnuXGrv/7?=
 =?us-ascii?Q?tr9BVyKI5yP5DYPOmLG9h1u3yaETW2W9cRYBQa51SSk1p4b6OK0W0a/ftrJS?=
 =?us-ascii?Q?z379+3vcLyRZ7WZhRZNC/4oxFmuRX3J9PaFY6imEWP0Nn8xi5f71PdeCNRDV?=
 =?us-ascii?Q?vshn622bki1t9alv6hMWs/Bbliy6LJRsR2+V6kcCc+VzC59mzzCPXnkHd2Rz?=
 =?us-ascii?Q?bxvgOn/4IvLelSWn5PgUsw78gaZgmIcYXrEiup3YCgtqCmW+/j87U9UtUTH7?=
 =?us-ascii?Q?cU9t1BJyvMCvqGooCXpNmJs4zj2CbaruAF5+rjIp1d69uzqrCducGFDL6RLc?=
 =?us-ascii?Q?dHy3FkIE3bYpuSqMzW1r+8OW?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a966ea7d-5f56-4564-e802-08d900aef6b5
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 08:09:31.5232 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wb7feD3lqbQ6wWfzn2V7JCEGLQ1OLruiOzuH85BVnfwJ01ShFgFINZ/1eR0clJ39Vc9o+GexOOX+tUxRQjiRXNMBKE6aQuuTIgDej8QI2aE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5078
Received-SPF: pass client-ip=40.107.8.121;
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

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/nbd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/block/nbd.c b/block/nbd.c
index 272af60b44..6efa11a185 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -1891,6 +1891,8 @@ static int nbd_client_handshake(BlockDriverState *bs, Error **errp)
                                  nbd_yank, bs);
         object_unref(OBJECT(s->sioc));
         s->sioc = NULL;
+        object_unref(OBJECT(s->ioc));
+        s->ioc = NULL;
 
         return ret;
     }
-- 
2.29.2


