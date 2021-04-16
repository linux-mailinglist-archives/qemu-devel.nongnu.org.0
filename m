Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC9B361B45
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 10:24:23 +0200 (CEST)
Received: from localhost ([::1]:55954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXJm2-0004GD-K1
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 04:24:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lXJYD-0001Wa-7R; Fri, 16 Apr 2021 04:10:05 -0400
Received: from mail-db8eur05on2123.outbound.protection.outlook.com
 ([40.107.20.123]:36960 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lXJY8-0008AI-Rm; Fri, 16 Apr 2021 04:10:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UIVpXDZ9KBpmiphS6fX8b2iRTq0Xf9mijOGudnJSCmorB2g/FFRNywcdsBx5xlImV15/0bA6FcywaUwgAYFujOTxDMNSy7qEN6DCRi241Lj4U96/ItPtDfAacKRuW+Q7/nXQTi2OffOCs9fF9pAJRqlMswvn3hyRxfCAVGnj6oXp+b9UNZAYVmnWA6gEglg47TdfdQCi33uLsQoMlbbeK5v6GndD/YeMisMb4VDK1qCRyATZHOyeMvqzbyNROkuJanxRmJDbQLhqMZRf807V1waZOEuXD2gth7Q7NsTf82Z9q22QNA8gIrRWHo9b+6PAxS/vzzZUZNtRi0wHkp9dOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qm0oHy7jwAz3jZKTXjvRzUGq2+oIQdGpID7wE3IsTuk=;
 b=dWd5nvnn31Ndv1eUuDViM26p9tOThh2AEYu+cbTgETvzX51Ekl0Egm5oPYdubU0XDs2oModKuwVPE2zIk02tJFXdWkNKF6/qwhgI94CB+ZVIhZNVfXKtrKUIVts2OCnOKbFBCqdcfZzaJsHOC9HqkP0oj98zlXUF8zxXnqvvdvmK6xQ3keDk9YDQ5fAUNokRq96wZ2ItQbMjsMABWQUsqmq9TwUK1EhLqIlnRDdLpXcxX4e1cfE/2c4LW4TCjj3SmN6Z6oT1ipb80AhxAkFtIbyvtvezF8tcDdMnzbnTLU/gTrRghAD/1ZTzDNLl92G4D16FWEM1Mh9f8lCpXMwSKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qm0oHy7jwAz3jZKTXjvRzUGq2+oIQdGpID7wE3IsTuk=;
 b=FBblzXrzUhePrA/7y6ohf0wBFb6euXlh2vfo00D+OSV0MulFyE6Wkl2Kj40Ud8f3d6FPUlabZ1WWauHAIBXyYVOyMnS934DPhdtN9CuuR3SFITqxzRMpR659cGQTIA9w2mBTE5vV3CqE6PFsGcv1Q9mhYqxfgDQIF8ya0JP6LPk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4599.eurprd08.prod.outlook.com (2603:10a6:20b:8f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.18; Fri, 16 Apr
 2021 08:09:58 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4042.019; Fri, 16 Apr 2021
 08:09:58 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, rvkagan@yandex-team.ru, den@openvz.org
Subject: [PATCH v3 23/33] block/nbd: nbd_teardown_connection() don't touch
 s->sioc
Date: Fri, 16 Apr 2021 11:09:01 +0300
Message-Id: <20210416080911.83197-24-vsementsov@virtuozzo.com>
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
 15.20.4042.16 via Frontend Transport; Fri, 16 Apr 2021 08:09:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3c0bf9a4-d0d6-47bd-7bc6-08d900af06b4
X-MS-TrafficTypeDiagnostic: AM6PR08MB4599:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4599AE4F61789BA7D901DDBDC14C9@AM6PR08MB4599.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:669;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aNa1gRFrtHbjILdyh54J3/el65WejVIZwcagmA8S/FM9q+ubmhbShQoBzhnfXCycZJ9iMfwEg3LMm+EW+Md1og0gPHBzCS+nE51WCSW03bmpdKX1TszzV5oK/TgC2hPUlgN3jvHAPWjxohdLzQaZ02CM4c7bp3dzFSn89p6Rl4KvdmUgEuGH7744ka91eQzAtN570g0pNh6A6xu1ojKyw7rXBIB4NX9JB8hA128BpgNg3gZXSca6m71zQxCyEAWg3KQJj0h5cQyPtB1DduIwvVTqJE38/dhur07y2oAuMp4QxAne7/H0YiT8CHZ8HtGxuxe7ZS2f0f2kSbU29mA6wpQrfuoyt61SFFcVuU6p4FL1Rhvo7ID2+F2itBZdfdytV+NdohfAxwzBs3k84goboq9cLecSR9q4dqrIimlP6whLNQtTNF0Qju7Auee2k2UJYpd9YxNSlTxHcPPKoauXzOWJx7/9ra1vcbVFPHx1WAq0nmpHpzpiSCT/FPprraeWarM0wU6XSmCqfU6ywF078+3HGf4fYFVKswJzXzKDv5WLPwO+tK2W25fCD0NRGWYKUp6V/xCJonXBPwl4UlqjuNAXoaOWvpifLmhagVUxDHcAHQysbblySTfhBhL0sLxHR4v8o5veJSPGvCFGLhx/htsQnKIW7wgEhYSOYtdxnAWDk95AFa2DpW+rUWA7XNBQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(39840400004)(136003)(396003)(346002)(6506007)(6512007)(478600001)(66946007)(4744005)(6486002)(6916009)(4326008)(8676002)(8936002)(6666004)(66556008)(186003)(38350700002)(16526019)(38100700002)(5660300002)(107886003)(1076003)(2906002)(956004)(86362001)(83380400001)(2616005)(36756003)(66476007)(316002)(52116002)(69590400012)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?jn4Aw0cR/eGTmS9LCq4JdhQm/UeGhZ7gNP1gKeAtYS/PxLzOg5w5Qj3oBZUC?=
 =?us-ascii?Q?nkWyqZnvZtjyZblYVRXI2XsvP0EQXAN7uXYvKEzXjsXLvnE0gfDxVc3bVIvN?=
 =?us-ascii?Q?zSCP6VKx7neLq+lVxiDbGyNp8H2iO1SY0DL+IS4yWs/p7VyMPtk6/iGi1Kx8?=
 =?us-ascii?Q?HYYu8A5X1m8ryCJcvNQeX17mqN02WlWuu0uzEzhwWmMRL8oOcKs69lsE36IT?=
 =?us-ascii?Q?nKjrRD1/Y4lYzqiE34TbFElfUt6KWX7lPfYLrPoHq5oJFLZjdG/8JI1dx543?=
 =?us-ascii?Q?DWtNg0tAXE9S48tvpjOxFFGky/e0VSPXQiLUQTAUcTaX7vQY7W4QqRATxoK+?=
 =?us-ascii?Q?mBxf9TnB/Fk69xq3B8gWjpEV8KzmHa6Ryv4RPX7UndS0PqfNS5PDjXb2TFVs?=
 =?us-ascii?Q?IfZK5YLCZWUNtZtvP8iYKhmZB67r8WjuQzOAEOUP6MxcXohNk4OT21+reXLb?=
 =?us-ascii?Q?QxOqw6kMkSEu5GtE8NT8ElaX92VuvX7paVgz6iTzh26jfjG7ssErCwsY9sAM?=
 =?us-ascii?Q?cZIKYf0vIRR7hghX1wM6RIeeneAyh5EUO0sfubx28Y27cZ6I4G0WVSE4Q4Vo?=
 =?us-ascii?Q?WnUeOGlqCfTQw/b9GHOs08suDXiobe7yMFpJkfLjAYO9ZY1TfayuRpl/puTb?=
 =?us-ascii?Q?XSd6ol5WtDyc9zPqluh79v+FDDrgc4EseuRssd0IDmNY/KPCp3klzni5R5uX?=
 =?us-ascii?Q?NlXBISnIBfeYU7tASPP0Osw16nkvWYoXJykn6sgTEluKU841b3kyBIDzq1w8?=
 =?us-ascii?Q?3fnuGU+4zgXMDdqpzA+8fRqAr9KEAM1F0Ic0LRkpuQqKju+4RYZuncIcP/u4?=
 =?us-ascii?Q?kCGkE5Mygc1bp3LsBOw57Adrr6/Q/nxHNVWVheZuo0NQKy/g4bj94L6pRu31?=
 =?us-ascii?Q?+EABmNGLRPQLLDvEvXyv0w6nByUdHxfJXwRomIIGqIvMaa4EmFSJVYi+8Xkp?=
 =?us-ascii?Q?CnfZXd4uPAIq92de1rDpOxpsngcGVDk5tW+NcVAtN9KG1mfWGI/yIfsFiWxZ?=
 =?us-ascii?Q?zty2WkhxhpXgZm3qobRcWJ37qA3+OAfgt7EFOVxIf2slp90Mr6l507ACZ7j9?=
 =?us-ascii?Q?ZrtHLFvrMzjR/BHFOkm7jTm1QiiQ/H8HVfDKG+D7Gi2QfbTPjk6Z+wiwe3yS?=
 =?us-ascii?Q?uqEu1oksRW2SMylSRHYI46GrPiDBkO010nka7/P8FKlLvkv9DAwKoaS/WEEe?=
 =?us-ascii?Q?f5bzjMU3nMm6VZZH8Hdv/nlncNK33D1RvhNAPIj20e4xgd+2JsSgvWzL10/m?=
 =?us-ascii?Q?OMvGuJSn+qG7VXpDhGDRk5jCxMgzaVLslVdPqlQUoTJaZ1WQZKYh2r3umO3F?=
 =?us-ascii?Q?GBBZfp/7DohJH0j8oVaA7V2C?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c0bf9a4-d0d6-47bd-7bc6-08d900af06b4
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 08:09:58.3236 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Ppez2+OylIHXbG5YMiAYXFkapNoPuoDqFfjwkSwXGPy8G8gJIISgUjpiGACDZUHuprCwL/IWMhp5c9gc5OlsC/1QGS/4Dby80XGWX/dojw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4599
Received-SPF: pass client-ip=40.107.20.123;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

Negotiation during reconnect is now done in thread, and s->sioc is not
available during negotiation. Negotiation in thread will be cancelled
by nbd_client_connection_release() called from nbd_clear_bdrvstate().
So, we don't need this code chunk anymore.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/nbd.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index ec69a4ad65..cece53313c 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -284,10 +284,6 @@ static void nbd_teardown_connection(BlockDriverState *bs)
     if (s->ioc) {
         /* finish any pending coroutines */
         qio_channel_shutdown(s->ioc, QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
-    } else if (s->sioc) {
-        /* abort negotiation */
-        qio_channel_shutdown(QIO_CHANNEL(s->sioc), QIO_CHANNEL_SHUTDOWN_BOTH,
-                             NULL);
     }
 
     s->state = NBD_CLIENT_QUIT;
-- 
2.29.2


