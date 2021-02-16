Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D08031CEC1
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 18:13:52 +0100 (CET)
Received: from localhost ([::1]:59968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC3v5-0004EI-M5
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 12:13:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lC3U2-0006lG-8q; Tue, 16 Feb 2021 11:45:54 -0500
Received: from mail-eopbgr30092.outbound.protection.outlook.com
 ([40.107.3.92]:41051 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lC3Tv-00077d-M9; Tue, 16 Feb 2021 11:45:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mSuGrJuRt8uVyiLr9pA9/6vSxegKxMnT8/KV8+d04TBIYazrv2QGVGVwTGEClNhnYbS4hrz91IB+o9eqEo31OzxdUIxw612eWLQcEwoD5F0vk9tT7g0eXvP4hUyhfA8stXZuDUJbRlQS8Xbk++Cya3kE9wrauw3Ss1vRt2uytjlQzIuhMg5seXSm5wzWmtC6zBcTGiMiIT4uVG+RP1CRZqxvR9GLeAbEgKo+sV6+9aDoYbS1DonquloT/knRB8TTEDQQbZYemOYF4dG9AEtbA15nOVS5TxNxDY+ytKilvIWIsEChAfgt3wE4pxmPld9CUgnTLZceUXjpCN1PhAmnXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SnXNCM/VmNuzNKz0FaJQwshJZh0mwggmke70IKp/z5s=;
 b=ZjchpLNEZ2LbIXxIARdFDrTFoYEiA2lKms6EXLjjn3e4BYuC5xuUkYZbQA5i2YIcA3XXvZ/qQn85yhHQ7VNlvEvnUO4ALxiCK4QnWYZVG53D5h36ePLNXVqGV6hIGnI+b30JvWZmJWd5JnpDbMtqLNWFwP0uaSkxcVZxJno2p+5Bhxno/QOjGNxnYR3DrBcGxCLUFDA/tmw1Dh3rm29wczXuAfFyXibERutArzF2mlTSPbOjK3we2FcfwSGvBhE8lKYF7xaROpDo30qmIBI8fzpmsYbkB67JR0JCapkngOSp6c0vYEpOAkwrHhNWDXzJe5NPdr5YYMq5JAv5XWVLvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SnXNCM/VmNuzNKz0FaJQwshJZh0mwggmke70IKp/z5s=;
 b=dHCQ2aagDx59KPZ+95on4n2/nOs2O5cE3u2Y8VXfnTa2LDmdFo0JN2M/68HUK1P/6F75Ui2JG8CTSK7h+dpTcSYekpImVO4+IJjIApMmLCOrFLixTHDELLmRy/9uKJ9KuH8kpQgl5PeTG8IBraxT1WhQ9ckoqLNuZsXDNb4KNOk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6038.eurprd08.prod.outlook.com (2603:10a6:20b:23f::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Tue, 16 Feb
 2021 16:45:43 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%9]) with mapi id 15.20.3846.043; Tue, 16 Feb 2021
 16:45:43 +0000
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, den@openvz.org, stefanha@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, jsnow@redhat.com,
 vsementsov@virtuozzo.com, eblake@redhat.com
Subject: [PATCH 4/5] iotests.py: add unarchive_sample_image() helper
Date: Tue, 16 Feb 2021 19:45:26 +0300
Message-Id: <20210216164527.37745-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210216164527.37745-1-vsementsov@virtuozzo.com>
References: <20210216164527.37745-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.244]
X-ClientProxiedBy: AM3PR05CA0149.eurprd05.prod.outlook.com
 (2603:10a6:207:3::27) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.244) by
 AM3PR05CA0149.eurprd05.prod.outlook.com (2603:10a6:207:3::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.25 via Frontend Transport; Tue, 16 Feb 2021 16:45:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 32b63c56-13b5-4991-3d7d-08d8d29a4d3b
X-MS-TrafficTypeDiagnostic: AS8PR08MB6038:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6038BF137132BF199EEC1609C1879@AS8PR08MB6038.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Yh7iKI3za2LIoR1iaFC9Ym2jzgZJhOcO3QRV/3z8/KYwCdt2VopX6QP0PvLx0ut0hZ/BCHqi7iwaFrkUL4isbM4bUr/khlZkvwpUet1Yyhomvu44s6eOxVevvU29Zh+EvDCNXTL7ngyadLDVSLrcY9QactdincPdH/xyUi55gpvs79a29hIDSWbx3toudN1EVDUkOiQbv4+qjrIyVVWXX2JANV5o+8AR/Evh+Mllqn9pchSXAkbKWV91tkjzVZWKr5pE7MIvLtGt8Q5S5YAE0706lWAuNZk4WDLZ8CDBYqOTXbRPTbAEcs1SRWLg3NkUoxY7yFAyHcuLTQ+TpIPpxYGnDLLHM6aul0XYnfl7mpIyjCe0Yqs15zYccmWoBOZ0zJnRmOsZmbARAiErPDk+iHHQnavvH0Ge9WHzQ+9Y/NpjKtEQUgnT7yKAaTZSRQLdsVkOu5n8+XrgyQdPMyQro8Chjg5/8sZdhLjx0P17ufYgzvB1uPM1lVpMQSWcLcPlk4Fj9kG+6XccYzxVf9SU0w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39850400004)(376002)(396003)(346002)(366004)(2616005)(316002)(6916009)(6486002)(186003)(26005)(4326008)(5660300002)(2906002)(478600001)(16526019)(6512007)(956004)(36756003)(83380400001)(8676002)(66556008)(66476007)(1076003)(52116002)(6506007)(6666004)(8936002)(66946007)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?/hPvHzrkmAfbgvaaaxf5cMm/wBEsLPREW8WNUJgoiS2ZjiD68WakG1CIxNUP?=
 =?us-ascii?Q?+ljEBzGMhZIXbqAe6IXpH3ITF2YJcrGuW6D+ltXlW1xDIYbAEx2+bRYzLybu?=
 =?us-ascii?Q?rbx96ctv1+JgUsP6MzzCxgSYkSIDNo1bvVA63XxTdx0Ue8H4tn0xwnwncmR+?=
 =?us-ascii?Q?b7hp+vzNXYicOzqKQIJP12YrcoruRQ2TYoQNeCQ2K0MVn1l8wqTFqCcY1rjM?=
 =?us-ascii?Q?Q4c7jtTmj3zABMqiOC4BWMRu1YaTZ+0Bkt+dWx6FfDuzXwh+SLG9VVlZvDXm?=
 =?us-ascii?Q?zbrOv9ZQT7Y5pzOFy55EpODYPWujK1rV5NH51LfJgCqeG+hHsKOXWb+K7CY1?=
 =?us-ascii?Q?eHC90ntH0+9oGVw/lHLm0ahiUeD9TccdGc5JeEotFtiaZyvV6nh8c2dr4iFx?=
 =?us-ascii?Q?2BIRgCv8wTTZmc4T8GqrkH4mZdJrTquTqrtkkTrUIX4XTW40k3TmF7ctp5/E?=
 =?us-ascii?Q?JbGAyZwSQmv4476B04IF992NCKBrOveuTpHXU8s5kfcamITkzPFNUQGSJFQE?=
 =?us-ascii?Q?R9cWEiI41jciowLf1xM/c0oGI49FGEw3ve6ehdi96vyDKjYB6ELExDTDVqfF?=
 =?us-ascii?Q?yKF6Gay8ixQA/cvXLxd6CDMRX8tPhCJ9LcAlstqbBIp/dEf5W4csAdXghF8X?=
 =?us-ascii?Q?uN8GYTO3sJslgTVzOD0jim59HLz9aeykZnbGu17DZ4P1uQpBo7vw1ki5nhcW?=
 =?us-ascii?Q?3pme95RBxJvH2S50OgJtK2BdW5BBoBLNuzhL+DFYNs8n1SXGZbSiGdpqV0mX?=
 =?us-ascii?Q?RNCc0G87wh6kmwfT/5sG7QiWGdK9otcgdXCIAQ5w0FF7eRXjsIjqpSxKB/Un?=
 =?us-ascii?Q?5Ba3WkofvtwXtrR2x9uApWVFUsvPLxrz9xwJahpMdyGcZ1uvDTN4Ywt12ZNe?=
 =?us-ascii?Q?yt+38u3HkXr6dOBJpvTRoM0Ol1lO5ow1CmPSBlUXa68fJykw/kkJ7gzTOERX?=
 =?us-ascii?Q?6hTaYCsRCxmcSkVB60f6pOFzlL6y7/Cf/D383GY+xW4la26Be8HCtimhGz9s?=
 =?us-ascii?Q?jqbq5KQmt2AGvIuwZyFIqCUpzinPG0FhCAi9GPCiv9SmDoGJ7zMIpkkBhWQe?=
 =?us-ascii?Q?NyWIWsRXeO5bZStuIU2c0SZt1HzuAM0JR92Ory7TdQiXMYvUZ9DGQdJDjo2Y?=
 =?us-ascii?Q?nW2pOCXgh3wffk4K61Em/EX6l1ZMow0mzhHmtnXSlGbXRAdCVAPuDrKEaBZ7?=
 =?us-ascii?Q?LKbJnHMTZyZRtV4uuqr5rTyvSItii2KOeOSZzoFb6JaBUR8QySkJnXqHcb/a?=
 =?us-ascii?Q?4N9vzB6qcjomEHpLcWt7NEH+ZNPwTdhUBfqtE0nKPYL2jhy3sO9feZaM8iMg?=
 =?us-ascii?Q?Gz1JmhE/0cc+D0eRpAZLu6V1?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32b63c56-13b5-4991-3d7d-08d8d29a4d3b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2021 16:45:43.6734 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G8mdDsmCk/DEHMpQ5WU9IgKOR+ounFt6MoJMOZlFtGYnulEIiRjvFd8mrzYq1P44ISFT+GueFLL4NzU+B4XxOQI5+lKF2GcxWEqJI1cdli4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6038
Received-SPF: pass client-ip=40.107.3.92;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
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
Reply-to:  Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
From:  Vladimir Sementsov-Ogievskiy via <qemu-devel@nongnu.org>

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/iotests.py | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 00be68eca3..ea6238f242 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -17,6 +17,7 @@
 #
 
 import atexit
+import bz2
 from collections import OrderedDict
 import faulthandler
 import io
@@ -24,6 +25,7 @@ import json
 import logging
 import os
 import re
+import shutil
 import signal
 import struct
 import subprocess
@@ -96,6 +98,14 @@ luks_default_secret_object = 'secret,id=keysec0,data=' + \
                              os.environ.get('IMGKEYSECRET', '')
 luks_default_key_secret_opt = 'key-secret=keysec0'
 
+sample_img_dir = os.environ['SAMPLE_IMG_DIR']
+
+
+def unarchive_sample_image(sample, fname):
+    sample_fname = os.path.join(sample_img_dir, sample + '.bz2')
+    with bz2.open(sample_fname) as f_in, open(fname, 'wb') as f_out:
+        shutil.copyfileobj(f_in, f_out)
+
 
 def qemu_tool_pipe_and_status(tool: str, args: Sequence[str],
                               connect_stderr: bool = True) -> Tuple[str, int]:
-- 
2.29.2


