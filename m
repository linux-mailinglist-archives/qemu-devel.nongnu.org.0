Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C37B72F77AE
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 12:32:47 +0100 (CET)
Received: from localhost ([::1]:40510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0NLS-0001vi-R5
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 06:32:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0NJu-0001PM-Qo; Fri, 15 Jan 2021 06:31:10 -0500
Received: from mail-eopbgr50128.outbound.protection.outlook.com
 ([40.107.5.128]:6249 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0NJp-0004mj-6P; Fri, 15 Jan 2021 06:31:10 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nuHXmRDlC8sjWyDQ4n/6gKVIS8uUsrp2ymGGhS39sZiiqN4cZSoP4s27eX9yBHNNGL2OS0XWojFnyi1Ljfa5CNa4AjZidhGYN/0xS18KnQqMb/zdpNEsHZFLIgTOWa/kk9iiIc7kmJRf0u41Kj5S0QYkVdMpsqe/z2A7VMIpCIrWx9+zXPUYgP1xDyNqmuoerDVj3xuIt5nj6tNYY8AkJadUBvAhLTL8yRZ27L5sfIimRbxqDaaVbte474Ieejoz2HFuF7ROCjnHpDHlIAy87WPjOf06jeCRAIPri82fyww6wJ/AxUvfYVYe3KISSLYS+70HIT7uFJDd8F3HBBDpZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nyeKnW5OXUICRU2nzIiL6ylJpzPk9TFIne77y04DX9M=;
 b=CoHuQ6GceT4QfvfKvk/s+RKhzhYJ6IJL8utwl/PoUv89iP/leloj5UJf+S8waX4oQEfS94rXUkDdAKH1SB18D3YRzlTXQgXC/WFAvH8I/2S903+tDbnCqwsWa7nFNVK0Q+QwyOVNPPtQfS8GCIOMKoZsrEzwmc9Ises1Hn8uRjBFGnQVcwgMcF1axdEoYR8KlT055nEgXKEdIYCyHRby7WrJxS+ewaePn+bsTHP//Wjsnxe2Mj5wM11YzR448iDnsng0luW3GGpOCwPFk5RFW5fWikdTefdn7/ygLvRGcuQk8x5OLnWQ3h3ZX/ntEWMkAvUe/Go6R7+rnEaffE3YUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nyeKnW5OXUICRU2nzIiL6ylJpzPk9TFIne77y04DX9M=;
 b=cVx3u4z/EIA05e5J7+v0FquZlmYawJqOI0e4kQ6X5kKjvfuiz7biTcqjKiyU9Rr2GGl7YndyKzamr/gge9AEZBTHc7L/JG08A6grT/YIcREFZDD4GEM5VVPNiBJXT0etfLnT8cbsl5nh+y3uXvt2Iv3/Ku4CrEZEB8CPGsFvBoU=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6374.eurprd08.prod.outlook.com (2603:10a6:20b:338::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Fri, 15 Jan
 2021 11:31:02 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.011; Fri, 15 Jan 2021
 11:31:02 +0000
Subject: Re: [PATCH v3 10/10] iotests/300: Clean up pylint and mypy complaints
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20210114170304.87507-1-mreitz@redhat.com>
 <20210114170304.87507-11-mreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <5e2cc423-124f-3b63-2804-d0fe99e30826@virtuozzo.com>
Date: Fri, 15 Jan 2021 14:30:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210114170304.87507-11-mreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.75]
X-ClientProxiedBy: AM4PR05CA0036.eurprd05.prod.outlook.com (2603:10a6:205::49)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.75) by
 AM4PR05CA0036.eurprd05.prod.outlook.com (2603:10a6:205::49) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.11 via Frontend Transport; Fri, 15 Jan 2021 11:31:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e18c817b-7f2d-4310-9609-08d8b94909b0
X-MS-TrafficTypeDiagnostic: AS8PR08MB6374:
X-Microsoft-Antispam-PRVS: <AS8PR08MB6374C3AEC34DC4A81974248DC1A70@AS8PR08MB6374.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HdtTirYHSOgPmM4fz+vh7qSlTAJb7gmKgBWEr6IWRwwFWjvm3Xu0GQIZ36ABvl0kVqqoG7+QQkO1fDZMdQNpn+4PDXDON0y5cY/M2lKnMTtXjVe/Z+wSMtCCm+ywaFAAIGO7EIz7q2/pYejKh1sFacmJEr3gHhkSUGK1JrXY0dx7/thZIvfLq63I7iK6wzxPWha60OhHT2gEJelupLUcXiAb61PALdccgV0gRyxnEWD7ag02FINymFRN7WXv7AsWDm+NqOSVTc29vCODab5PQD5i9Ir5dXlZGOkfPAR4BcKdgs923UM6KxfNRvUISEqdIp2Zb9yxBn9v17WOdYtNL+k+qb7tFOolB0xJfqiHh5DvtqsQCHzFumkbeqQ7KUevihq6HcgI6mJBmG4IVCXI0ij6fefEv5c3bLNRgKn/+QqXa1iCcwvUWWov4b4QJmJ4IcK2NN35fuMLuKwdJamkOfnBgi9jMgmRWvB/Ge6ykNY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(136003)(346002)(366004)(39830400003)(36756003)(6666004)(956004)(83380400001)(5660300002)(478600001)(6486002)(66476007)(66946007)(26005)(86362001)(186003)(52116002)(16576012)(2616005)(54906003)(316002)(31686004)(8676002)(66556008)(31696002)(4326008)(16526019)(8936002)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Y1VWYjh2SzVzMWNPQnBzSFBVWDgxMXF1TWZ2OFRSdzl6NU9COS9RdERya1lk?=
 =?utf-8?B?T2dQbjdITVlmd3RZQnF5Y01JbjduandBUGhqM2NMcXBWRFF0bmYwWTdsS2Y5?=
 =?utf-8?B?S05vdGg1aEc5VFFYMWtObWdWRXJ5L3FTNkFabEFENU5YYWY5YjR4NEZGQTVE?=
 =?utf-8?B?Q01JTVNPajhkSUNzUGdNOGh0bUN4aHpKOUVrb3RUdWdRV1pqWFpzdm03c1NO?=
 =?utf-8?B?UXk3dkR4LzdTZ1BFVXhBbjNwa2JmUXlzTUFjUHhPUUZ1WVFOU3dOYVR1WDFY?=
 =?utf-8?B?bTBIVG5HQTRQSFduMnlCb1d6V04rM3Ftc1lvUkxzKzRFa0hvL2RZVTVxSDF3?=
 =?utf-8?B?TjA3bWdqRHBmODhZODhXdkUweVArU0VQczJLRy9DeGM3NjllamRtRFZpVlJO?=
 =?utf-8?B?cEszNDVjNDZ6aUhuT1Y2bzNibFdmOGpvNnE2cHVyUThVakN3amkvV0xHZXdQ?=
 =?utf-8?B?UXpDVkhOWThFVWlFV0RvTGd0UnMzUC81ZkRXQks1bVNVaG9VOEVRSXZvUzhx?=
 =?utf-8?B?MXNSYTZ2UDFqSU50MzNaZncxZkw0V2FGU0hQc1h5SjRzTXhPTUFUQkE3emh4?=
 =?utf-8?B?a1ZyMGJPSE1nZXMzTkpuWmZobE5UMU9ybTA2S3l1M2U0RUZ6Q1RZNk9ZWkc0?=
 =?utf-8?B?RVpWOWFBYTgrdlJkcHRkbG45RU5RVnhXWEFRMkRCRFRKMHVRVms5Nms4UkNY?=
 =?utf-8?B?TzhIblNiV2QxdG8rNzV3cUg1WHpraHppdXJzeHRXRmpOZWlhRnI1dHJMUldL?=
 =?utf-8?B?N1RCM2tkNGFVbFNMYjdwTHVqVVRZWmUxajI1TnoycDVlR0NXbmllWEhDaW9m?=
 =?utf-8?B?bDBOeERmZ0xSQXJBSU9YaW1EZ3FZeUFERjNqcFdYaDVVYlZ1VTJldUgvc0V1?=
 =?utf-8?B?NnVVMlB1SjUrYWlWWDFRZEI0V3VxdjJJNVB0R0p4bHd6dVg5ak1XTEl0SnZr?=
 =?utf-8?B?eEgrQk1oUW90bEJhVCsyNXhhUHA2TG9jV3hBVHAxZmhLTmlEVXlXSkdGSXR6?=
 =?utf-8?B?MXlicHpobmd0RmxOQVJPcU1RRzcrNXlDcW9JMjlOd25yTkphMTVvc1o3a3Q5?=
 =?utf-8?B?NHZ0dDdtditQR0FIbkdaK1NpMkE5aUpWdHU3amRzakc4dStYNkZaaldXelRV?=
 =?utf-8?B?QUlRSFJENFphdmZ2V3FJVzlWVWxjcG1HZ1kzRjhJMUU1L05WRkIxZG5oL1RQ?=
 =?utf-8?B?c1lMMjNnZXV4WEd0cU5kM20vbXZXVVAveHRMdWFzVEJZM1FxM2M2alVFdnh6?=
 =?utf-8?B?ZGNETGpBV1d1ODFKZ0l6dTkxQzZsSTkyZmR2RW5vcFRDUThPRU8zMys2RWRt?=
 =?utf-8?Q?UnKlPo2ovszu8+IePKpayIjVa0MK/vKBzY?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e18c817b-7f2d-4310-9609-08d8b94909b0
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2021 11:31:02.0199 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z8fpSJVUJ5OKfJeMAHsvRfvKr02eZ3KKFa1Wf/Q05UYhU5X8kSKY2gGRdxNoKfcmDrViHl6TH4WSpW06CKaJIK+IqcU2aV7n+G+B3bU2m8A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6374
Received-SPF: pass client-ip=40.107.5.128;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.237, RCVD_IN_DNSWL_LOW=-0.7,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

14.01.2021 20:03, Max Reitz wrote:
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>   tests/qemu-iotests/297 |  2 +-
>   tests/qemu-iotests/300 | 18 +++++++++++++++---
>   2 files changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
> index 1dce1d1b1c..03d8604538 100755
> --- a/tests/qemu-iotests/297
> +++ b/tests/qemu-iotests/297
> @@ -33,7 +33,7 @@ SKIP_FILES = (
>       '218', '219', '222', '224', '228', '234', '235', '236', '237', '238',
>       '240', '242', '245', '246', '248', '255', '256', '257', '258', '260',
>       '262', '264', '266', '274', '277', '280', '281', '295', '296', '298',
> -    '299', '300', '302', '303', '304', '307',
> +    '299', '302', '303', '304', '307',
>       'nbd-fault-injector.py', 'qcow2.py', 'qcow2_format.py', 'qed.py'
>   )
>   
> diff --git a/tests/qemu-iotests/300 b/tests/qemu-iotests/300
> index b864a21d5e..64d388a8fa 100755
> --- a/tests/qemu-iotests/300
> +++ b/tests/qemu-iotests/300
> @@ -22,7 +22,11 @@ import os
>   import random
>   import re
>   from typing import Dict, List, Optional, Union
> +
>   import iotests
> +
> +# Import qemu after iotests.py has amended the PYTHONPATH

you mean os.path, exactly,

  sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))

yes?

> +# pylint: disable=wrong-import-order
>   import qemu
>   
>   BlockBitmapMapping = List[Dict[str, Union[str, List[Dict[str, str]]]]]
> @@ -110,10 +114,14 @@ class TestDirtyBitmapMigration(iotests.QMPTestCase):
>           If @msg is None, check that there has not been any error.
>           """
>           self.vm_b.shutdown()
> +
> +        log = self.vm_b.get_log()
> +        assert log is not None # Loaded after shutdown
> +
>           if msg is None:
> -            self.assertNotIn('qemu-system-', self.vm_b.get_log())
> +            self.assertNotIn('qemu-system-', log)
>           else:
> -            self.assertIn(msg, self.vm_b.get_log())
> +            self.assertIn(msg, log)
>   
>       @staticmethod
>       def mapping(node_name: str, node_alias: str,
> @@ -445,9 +453,13 @@ class TestBlockBitmapMappingErrors(TestDirtyBitmapMigration):
>   
>           # Check for the error in the source's log
>           self.vm_a.shutdown()
> +
> +        log = self.vm_a.get_log()
> +        assert log is not None # Loaded after shutdown
> +
>           self.assertIn(f"Cannot migrate bitmap '{name}' on node "
>                         f"'{self.src_node_name}': Name is longer than 255 bytes",
> -                      self.vm_a.get_log())
> +                      log)
>   
>           # Expect abnormal shutdown of the destination VM because of
>           # the failed migration
> 

Your new comments are the only PEP8 complains in the 300 iotest:

flake8 300
300:119:31: E261 at least two spaces before inline comment
300:458:31: E261 at least two spaces before inline comment

So, I'd fix them.

anyway:
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>


-- 
Best regards,
Vladimir

