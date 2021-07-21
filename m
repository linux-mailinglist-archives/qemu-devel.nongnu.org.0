Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E32FF3D0C7D
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 12:38:29 +0200 (CEST)
Received: from localhost ([::1]:52344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m69cS-0006HT-Uq
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 06:38:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m6981-0008Us-46; Wed, 21 Jul 2021 06:07:01 -0400
Received: from mail-vi1eur05on2115.outbound.protection.outlook.com
 ([40.107.21.115]:11108 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m697z-0002Gy-Ek; Wed, 21 Jul 2021 06:07:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F/ZYtkooSSP5danZDV8njo2AAa8/ewQ210/8wjwgeb1uuSFqO8LAxFjiLYRRP46YjgRJUnK/YuCXHimhwzk2cjdKnVuWf1LMnOznxKTsoBfk0i9N8V6Dkblw/+ZDJnMPfxdO/p45axSuRN7QutAUdLJIGXJcVCWy4NHYFrs5AXoxPoWmZAIdolQW+ogSMNdiH1GGSRqq5Ws3ZPR3FG6K3oNU0coswhhL5YsJ4KQ7LbTrwD+fRT+diKhMyH019Lc7oEDekIbsJBbe5FrSvJEbRkAbnPne8LMa9Wd7gSj8aKaElqP7rg3cFu0gKpJXH6QN9uYkcVzAXvLxKBQnL1Tdrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d1D+TJWfNhK5y6L7kQjd0njVG6279vZagGyKFmMJ4ew=;
 b=f7UJ6xsHmDWD2L9q0nBiYeW4SJoaUdkS3nW7LlpWBSHQh7g05GfT/kFHVQ3izsH4EhogLMfdYQWgJLrxpl7B1eAVm3s5tQ8+pJQIQo69Ul6edHgEIieJHv1LR2TS+q5oHmhwDZcU/yCnjpRsFB4lA6ZF9BmVgl3ZJzxj7Nq+SuqwJGvP/6+VH3Djvm9L3qyIyVcO/d8LsrZ4rh2viuIqfWCnq//+nyiWBMv0OyYGFCGE0L7tPbbwBL01x3Aq2kIJqxf8gmAhYyjCbbAEytql2oxFSjZYP5J7l/Wx/jyw3ksbaYPeIxyajk6wiKrbI7iK5wHv3hKKrkwUXml+/ECn8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d1D+TJWfNhK5y6L7kQjd0njVG6279vZagGyKFmMJ4ew=;
 b=ZP5sl66tGf/u4wHRDxqXh1+GatUwSnqnsGEuMl8a7wNR/e5ei6iCT9RkWS0he6EvonmIBK1sCKNYjFj2tSlvsSKhq2Z7nkyYX/Y0i4MuBN6IycjI7vEsDj02ETzyTGpxV2I2GJc13ktCbgYVpT1MPy7Enq15OywiA22bmsmonNY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.25; Wed, 21 Jul
 2021 10:06:50 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 10:06:50 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v6 29/33] iotests.py: hmp_qemu_io: support qdev
Date: Wed, 21 Jul 2021 13:05:51 +0300
Message-Id: <20210721100555.45594-30-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210721100555.45594-1-vsementsov@virtuozzo.com>
References: <20210721100555.45594-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR0701CA0068.eurprd07.prod.outlook.com
 (2603:10a6:3:64::12) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1PR0701CA0068.eurprd07.prod.outlook.com (2603:10a6:3:64::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.12 via Frontend Transport; Wed, 21 Jul 2021 10:06:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a354cfc-b263-4c33-e9af-08d94c2f4210
X-MS-TrafficTypeDiagnostic: AM7PR08MB5494:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB5494ACC40D87E85B3BFA36EDC1E39@AM7PR08MB5494.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:431;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xBjnHAZQJCqfHJPyGyg6cg3Q44r8E0u5BsaguKDn4kgXMnu+AP4hnjWC0sN+Jjq/enQq8M58vlJeTXgLyIFEG8Wh9AbQqmevGjRjuPylMu1HQuvDDtz6NVut6uiVgM4LmXvhBVRfFwraIhBVrilnuut4Q+gdS7iprHcQZQ930897qINns0qoBaxGxQ86aB4upkGKFSKFmInPcpcuMNDfA+pGRz0Mvag/nSL+GBrNLIEzu/PD9kREbgBRL6R7LdBC6LpuCx25WD/01kHIvVKQ+PR1jDsJEx2Yn3RNufwxrtI7B/HsQj/nXi7QDA0nldqaOCtUftrJ4wupI0JasQ+s0BlpDvk0qpVDf4sa7pLPr7YWLy+T6KBtCnrfBUR9kPdCbd/ZC9k1cEz2maoeOEz+IqQ/wMLeu166E4JlMxsEgq8KYycbTEW+HvS6M7gIFzRYNw+0wVq6hHAj98Y8vnUtXapTYpuFL0gVz1jnUOJwU0St6vuT6dgS5bgMkgPwpYyEc8xLtjUpj0mrkitLD+3oGiPJHef8aW5cW6sROY2+sFMKGKUi0EwWzgM5H/UG2jV5p3259l0HVcbN0SHhqSskD9zINRp2EIt2LdI9ysTVFdgtMgxPMJhE6XsG8c0uIZT9eG5vjib8wihw0BEREnl4n+9GMsS7NlzinmeWHgSIB3N3yHzX+bfTBHiXF8zps9SuO2cEFodAlqezfquXsa0xZw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(376002)(366004)(346002)(396003)(136003)(4326008)(36756003)(186003)(8676002)(478600001)(6666004)(66946007)(86362001)(83380400001)(66476007)(7416002)(8936002)(66556008)(5660300002)(2616005)(956004)(26005)(4744005)(6916009)(52116002)(2906002)(316002)(6486002)(6512007)(6506007)(1076003)(38100700002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Y7M7OKlwEhRYb0ACgn+2EviI8m2l9KI5O91JzxU6rzb44UOxK3goGzNjmdto?=
 =?us-ascii?Q?7V6j1msDXXsDOduSQKrk9n5KFd9Bn8naOIOn5zcqBn71Pf/J4QeHq+oTSu3v?=
 =?us-ascii?Q?n8xIHtyhSbHPC23DpyJV3miyPRFzZHi2QN3eDnA839rhNXTxLrbfRQDAsz+G?=
 =?us-ascii?Q?n1pjitIdPkprFUtMmEUoz0ghUwJvNb2ImY2/alUtqnWo/f4RK8/F9ZDijJ0N?=
 =?us-ascii?Q?oHdecn5ArYBdYyPCp7/YG0r6JIbtx+55nLbOW0RQONg3qnYZA5Zql8O1qosQ?=
 =?us-ascii?Q?QlrS33UCyd26TJfMRpMN2Em5lVuo8uRcHyXoTOCZKaHyK2Fhf5ubzYVCZdPF?=
 =?us-ascii?Q?D+CCygMW2Pi7qH1s0nAu668kK4hOCe36Hz8sVHh6iBWP0N6yZtRIo/LDMHj+?=
 =?us-ascii?Q?aQIpI/w5jH8chBUzs89LCvuPvdoC4WBn0XFHA7ua/7cUUSy2Es94aYdI4sEB?=
 =?us-ascii?Q?/sv+FXdqHH8VxSAQBi0BDjYQy9a+ftBdHUMzQTFtktWwBnNwtzNa5vzb7TFa?=
 =?us-ascii?Q?ctOoKUj83jVK9v1tNKAzIdQVF9eE+LDM0OrztkKGey6P1fSd9XqBuz1FOUGf?=
 =?us-ascii?Q?PHeOQIC1bAmdd/RaSACTWzrCqiu22Llw9n2F8wgC90fymavbQemer6CKHGPe?=
 =?us-ascii?Q?D/c/cbeWe648A63NugLpe9xZE4liZUnodInA/HZcMRXL7vHBH7z1kGYhkXru?=
 =?us-ascii?Q?qZs0LKhDqFMGLgcq5C+5/2szz+9/7lm1hsUxbWNOeJUEZclVDEKzPPv92GUv?=
 =?us-ascii?Q?xeQpTfkfCySUA1xsGN2be/4RA/lHkW3Ea6uCdIzBARhEYjIAEtvpTvwhJKc1?=
 =?us-ascii?Q?DVWGH5oPRxcB0hDtWu0dgkaIzdK+j3BFL//q+9mMd8gxxb+Z0YO6WoySmnbc?=
 =?us-ascii?Q?CJy4BDPxtR4aO9sfoqOkypBVD0gsM8TnqBw25Jv2zYyXJm/ssh63cJl/qYoe?=
 =?us-ascii?Q?7EV9+TxlYc+ukv7vcF0aacVu5Kl1cMcOttIHoT/gH7Yea/sf/Tr93l33Ckfe?=
 =?us-ascii?Q?K0BYPDLk/0JuXX1Ac+LAOLuRYqdR5VtWcvcAZCBoneflmOIkXBw4GFSfJ/sx?=
 =?us-ascii?Q?7brQ7fq8lGEZ4SX33n5VA4ARsyI7WpKzJhVdWkH8x9XCjn4mX9ekmuRUMxD/?=
 =?us-ascii?Q?v3PRTZ4kghB/fpPxCY5mogmWDb6Oq27maTrZvWHPnUKDnAdzxaWwuqfxu2b/?=
 =?us-ascii?Q?OWW83Vpx6yfa4V8fCHxYHcQQDhp7OcPyxa/3baRG8Cz1anrXR+yUWCjMhvua?=
 =?us-ascii?Q?FWrJ2XFFyl1HtivHXzu6qAwF6EHx+8VY5ETlfnNvYpyEr+Mw7t5Bl4OqH3us?=
 =?us-ascii?Q?Xp+awsgORqJ7f5sixSQQ8+4m?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a354cfc-b263-4c33-e9af-08d94c2f4210
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 10:06:50.6478 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Z6nITZZbQVLUiSZPFdVoBzFlNheGpo9F1uIGJxm/e/FGq+TczYiRo7yDG3IdBAghAMhJfr/gnqfFhXJn+OcLzK/qSrYZXgGRF7mew8Xvis=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5494
Received-SPF: pass client-ip=40.107.21.115;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/iotests.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 025e288ddd..9d0031a0e8 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -655,9 +655,10 @@ def resume_drive(self, drive: str) -> None:
         self.hmp(f'qemu-io {drive} "remove_break bp_{drive}"')
 
     def hmp_qemu_io(self, drive: str, cmd: str,
-                    use_log: bool = False) -> QMPMessage:
+                    use_log: bool = False, qdev: bool = False) -> QMPMessage:
         """Write to a given drive using an HMP command"""
-        return self.hmp(f'qemu-io {drive} "{cmd}"', use_log=use_log)
+        d = '-d ' if qdev else ''
+        return self.hmp(f'qemu-io {d}{drive} "{cmd}"', use_log=use_log)
 
     def flatten_qmp_object(self, obj, output=None, basestr=''):
         if output is None:
-- 
2.29.2


