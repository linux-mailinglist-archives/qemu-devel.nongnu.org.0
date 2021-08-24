Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A33E53F5A44
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 10:59:01 +0200 (CEST)
Received: from localhost ([::1]:35674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mISGq-0000O0-G3
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 04:59:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mIRyR-000397-Eb; Tue, 24 Aug 2021 04:39:59 -0400
Received: from mail-eopbgr70137.outbound.protection.outlook.com
 ([40.107.7.137]:13025 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mIRyP-0007eD-QN; Tue, 24 Aug 2021 04:39:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UrOuhTsz5anD+R4nWg6QpShmZrBWM0i1gqIP6q+V8dxzeJWdWCDZdpqqF9qirHtHKbdap7GU0xghysxPj4pLZY/GSxhqswNR1NEpSjtKBHcGx/i/RllJFAJsM3PWTnTfvWwet3upA7kwhN2fz092r9b5THtIEktPdjgtvMgY6Hrf6x1FtYWZXeBPVVBH6gHNjvDnUk5Pc1x6lR6gwDRV68fPnhLTLuZwzIGUYSFI8gw9lh2BXyueN1OTFlbJINa+Pett7EpudkdqkfZUv3aUKPfRJLTLhl3tpx04qsAEbEllezsnEcIlv+GL3/M92H7RBDb1CQIo6xehBppZn9X7yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e3uU44tcrU1em3AcwKZs0h/khB6xFRZOacOUIEfk+ew=;
 b=et7+nxslChk/5rCU7u2DzooUFh45EmdlFgOSToVcfoZ3G1QKhs4MBr6Pv1cs+SGP+8uoY033RQeawOnzOi92Fl5Ea7IxydJnY5tlZ8mMzonmnRBwhnmwgabAk8BkGobniPUHu9wbJsg/1N4fo+6kDXuo8Z3jOzUBhLuOWLkVF9gfrlUeiyj54uiN+eahm50X5wM+nEJml80E1SyqOwtfxOvSUurmA9wtHnbBhDVn7w6hfV7lJM6ErpXw4zecW9eYMkGwM0v2Q7VrRfEuqz1n1UPOXcyWPlwkVxSgXewRWoHJfoQ2gf18PkK3G6dQxGo8S1I+L0s/afPqOzyvGzE7mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e3uU44tcrU1em3AcwKZs0h/khB6xFRZOacOUIEfk+ew=;
 b=uUkyhzA1FxEH6P+MurZMYDoaDFNtHe6LujMGp75LJjG06Le5DdLxI8e6a7DQMw989Qt9WhkHR7jJAFqOxkzwNyf2kpjmEa3glOMZi2WNWRd096A03wg+BZdP7AvJ4gGJLREBTwUiBKMRBvbDAGkZpdBzb7gdCcb1iKOMCKUfQDg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4088.eurprd08.prod.outlook.com (2603:10a6:20b:a9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.24; Tue, 24 Aug
 2021 08:39:52 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423%2]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 08:39:52 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v8 25/34] python:QEMUMachine: template typing for self
 returning methods
Date: Tue, 24 Aug 2021 11:38:47 +0300
Message-Id: <20210824083856.17408-26-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210824083856.17408-1-vsementsov@virtuozzo.com>
References: <20210824083856.17408-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR05CA0178.eurprd05.prod.outlook.com
 (2603:10a6:3:f8::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.249) by
 HE1PR05CA0178.eurprd05.prod.outlook.com (2603:10a6:3:f8::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 08:39:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9e8ab60c-cb40-41b2-c273-08d966dabdc7
X-MS-TrafficTypeDiagnostic: AM6PR08MB4088:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4088022EF2C9A4E12789CA3FC1C59@AM6PR08MB4088.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wmL+5bbt0lQfrxh2ZQywQ4RrxgW7USng9XM19i2wYIBaQ2RVYQwhC7al2S4MklAfRDyVBzdoTMcrHPPomOKKE7l752MtHzQsVGD7BiuJUTjo82dVDtd8PvWSppDEN9JrREgdFIAWihKmgmOOikL4c2+rj6ZHtLY2Wf7uMdofCKLq7Z1a33cqqt8EDKT4v5T5bUoHraMDWfte6tr8zuaQjww30eMm0VrltUFlT+VmSLuYyr97piK9yctM1vgkMRmDAasFJxqqCyxEpWQiGLHW2ozOjy5A5bSlGS0YwFOiKyE2U3EK/d4rJgnaKW/OtxR8aw6cRvfxSpZXmMbrSrdPM27w6W3aEvhsm4MrqEJEIjQVbfdZZbMkoqzGA8Gk3ZvEWXOw0UN4BrM1GNerf1lArrHXUBfJvmesLvcen0c8cbHw9ZXeWGhUf/n0O3QdJZ9mZM5bUi/grnVMfVmNskrFmawwsLmsQfY7Vzg8PuG73aPhnVU+z05mCL2f4GsdkiASes0G6hZtTTPnExg3N6/1VhvoQAu0GMv8RlKdsSFmOKSRGOecT0PYP/vRlezASxIloenkUvouJyp1d1fd+C9LGmE91GEUz+VdgBNMsAK6w8LcWHIBwWZG99XlKHWu34J62DW2HhvfJpTDnEwVpAh6zMSbjNZ29OfUJxD7hNU89nUCkJpBGf2Q9ChZvsPHMhbMBDRsX5Opuvcxx9FT12bYZQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39830400003)(376002)(366004)(396003)(136003)(346002)(1076003)(7416002)(83380400001)(4326008)(956004)(6486002)(38100700002)(38350700002)(8676002)(6512007)(2906002)(478600001)(186003)(66556008)(66476007)(6666004)(6506007)(52116002)(26005)(8936002)(36756003)(2616005)(86362001)(6916009)(316002)(66946007)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jba639DzZPNtXpjDQxlFIMz7EjDgufYhOmShMmku8SWSs9f8MXwAslk7esCk?=
 =?us-ascii?Q?BL/8++EqSlTF2NRFZu/hnXnb6xQpMmhvH+uJzY3Z0rXPfZV2QVYWPJ8umC2k?=
 =?us-ascii?Q?7wnX1QM6uduoTO5JB3S8iU5al/+idXJzvI1WF2fEpNwtdsXyCm+fs8XXwjqB?=
 =?us-ascii?Q?IQV4sAdWFmP4Zx8XKWwE3yxtV8KkAiHz3BWNWw845UITPsqrpXmvJVJDNafy?=
 =?us-ascii?Q?QfEmCr5Y8LLYPs9N+nD76/nd+MTa4VOcRRENgujzp8uL6h60mP7Iu6jeHIqy?=
 =?us-ascii?Q?V7xUeakHokSgKqlxvFjAT5pIaYStsUZNijlpW4mSc6ljdLJTdwD/PcU5iXMP?=
 =?us-ascii?Q?UhF1ykXyJDzVb1/fe/g0bTQajb00H5cS/WKSj9kwKwJino6SYssyqW9BwMbo?=
 =?us-ascii?Q?AfXuCk7xjUclVJUzYqE8uX2DqPHOhnuC/nk7hEazsAeXfzKw5acELApoBSYD?=
 =?us-ascii?Q?6S+Uw3dgy/q3Iz6iVQ6j25+AArAn0fyG7vGr6TLEWKnHfJwpgDSk3UWCG2NS?=
 =?us-ascii?Q?BuYn5R6CTLLdTRX1RbExRmjJhuIFNBg8TTxXnIkw43OkUKjSkTNIEVZN6T5n?=
 =?us-ascii?Q?7mgN91+SzJGrPDvpGjUOgXySSgr+tLhtYxjLlfW3eOVKmB+PwcdKg9HW8P8u?=
 =?us-ascii?Q?aMFHiFsR3Qy6cYTfU/90QVzyyoJtoaGohzjXIjyMcnF+/LLz8kxhQAitDGuo?=
 =?us-ascii?Q?+YIEngtqeTH/+1gdcPa24O0n+54FiPy1sQ3qfBv1pc5vxA12d3DYUWtbsfkb?=
 =?us-ascii?Q?k/hvX54yyCrGfQBnP2eNevLm+6eyc9ZtzYsvOqqpKrWOFaZeYqo57whTUTdr?=
 =?us-ascii?Q?Gkupy1tM/fUJCY0BbLn+DTe+hJxIsWbXaMQ0sX6WVquMaMLx53RJozcEhrMb?=
 =?us-ascii?Q?jrAkxjIQtYYDGmrC8xLsn3JIdFOaJcBg+3s8rQ68atihlnchIvS/PgM+ipfz?=
 =?us-ascii?Q?XlFdTj9KXSLahq1Opr/Df+TAuZ2XQRC5naqGFbM2P8Njz4h+1KLnjHhGsr9s?=
 =?us-ascii?Q?2rDmdi3L3GRk7qSNr7fK42w3YasAk+eMFXUm6K0rt4w0fxS4WmjA1Smvzsam?=
 =?us-ascii?Q?bVVrnej9IyIrWp7xbsj9APVywJCic/M3lLXiGECcb74A9NHFrh9iY9b67XAX?=
 =?us-ascii?Q?iPV/MorOtOb6m9s+q7JDA9gazsMk4XT6fdVdNZDqOUw7whQFro+K36DNMeTW?=
 =?us-ascii?Q?tOD40Fa5E3gssPJEQvmqb0XBgx5rimrnje20lD1aR2O9NN5bDGr55Wg6dOoy?=
 =?us-ascii?Q?wW7Co5jNZEcmnRb5NhWTRq1oZrduh6VOnwBZzW+FbjOI/pVEyJjnzRjK98PD?=
 =?us-ascii?Q?AMDDq2x2DaIp0G49Btb3iGEk?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e8ab60c-cb40-41b2-c273-08d966dabdc7
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 08:39:52.3580 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uqFNlEsSjGQPqBgYznLp3QTXtqkDtCzvXackWu2blKr5gBHLJhmCGV51NF9EyfU863KOx1Z5abH8oYgr15V2AXRAZbSMTnscVCthHJVK9ao=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4088
Received-SPF: pass client-ip=40.107.7.137;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

mypy thinks that return value of these methods in subclusses is
QEMUMachine, which is wrong. So, make typing smarter.

Suggested-by: John Snow <jsnow@redhat.com>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 python/qemu/machine/machine.py | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index ce1e130c13..1c347d2c30 100644
--- a/python/qemu/machine/machine.py
+++ b/python/qemu/machine/machine.py
@@ -36,6 +36,7 @@
     Sequence,
     Tuple,
     Type,
+    TypeVar,
 )
 
 from qemu.qmp import (  # pylint: disable=import-error
@@ -73,6 +74,9 @@ class AbnormalShutdown(QEMUMachineError):
     """
 
 
+_T = TypeVar('_T', bound='QEMUMachine')
+
+
 class QEMUMachine:
     """
     A QEMU VM.
@@ -166,7 +170,7 @@ def __init__(self,
         self._remove_files: List[str] = []
         self._user_killed = False
 
-    def __enter__(self) -> 'QEMUMachine':
+    def __enter__(self: _T) -> _T:
         return self
 
     def __exit__(self,
@@ -182,8 +186,8 @@ def add_monitor_null(self) -> None:
         self._args.append('-monitor')
         self._args.append('null')
 
-    def add_fd(self, fd: int, fdset: int,
-               opaque: str, opts: str = '') -> 'QEMUMachine':
+    def add_fd(self: _T, fd: int, fdset: int,
+               opaque: str, opts: str = '') -> _T:
         """
         Pass a file descriptor to the VM
         """
-- 
2.29.2


