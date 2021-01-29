Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1001F30872A
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 09:56:25 +0100 (CET)
Received: from localhost ([::1]:37356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5PZo-00021P-4K
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 03:56:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l5PY1-0001NT-2N; Fri, 29 Jan 2021 03:54:37 -0500
Received: from mail-db8eur05on2097.outbound.protection.outlook.com
 ([40.107.20.97]:14177 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l5PXv-00035S-8g; Fri, 29 Jan 2021 03:54:32 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QP4fs8s2jha9xhaZdwZpMV6du/ia1CV2OPSasO3tHtZsRH7JFtLlltBPIa/5+lkw8zaPJfs9WDrGoTjaHOJBhYmr5b1Tq6NJQd3qK/+vzOA3/QMuNZd8YYOKYDBkxGuZjBcK27046Jh39tQcxdzpjHC1GWqV+sc4TgAN9woYRDOvbtH12BPM20D6zJK1tmBtACQXeR8cIE0tucDgwylg2TZDTpvo/TK7bmy37nXmPBkV31KmmlnKQe3D11fKq2bC39ewSHqIlHCEGaceXNwb7vrLFg3imE7Qh+RznJkIZ3VNGLjLKB3ubDiAYB9PMa/PRJL+hD+NPDvhDb4WXALNUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1JPX3V4gzuZcVg8KwqbWTxw+ZJN5Zs1sUbAHChKgXgo=;
 b=nV5o2SmQCZaj3uskpy/BdATwtstlvdk3++49ObacaCgYmnQaVJBiSt/RvvbpBkMJbNhnfNbIxsOqdA0tuPnNkIzHicGONhw1bl5yttKLSjpVAhnQkM0QWczgMnqL+jz9IlpDtHgkET70NtLEPQeCYdr6Fkug0KeuCYAEdkrOLdByyFO3yOkHGTV/cTuPY9K+pipqhbekfVmZXA9FjOsBo1IK6AuKqrhVN2dMeja1nIfWskxXu4cJiRCUz81/8rmVx16byh5TbaEJBQxUOdQf+tYRXLgbal7qB5rpTnb29NLlVcBPsjEmc8TdJ4VkwDbra3YkuM5dBAd5P7uzVHFfvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1JPX3V4gzuZcVg8KwqbWTxw+ZJN5Zs1sUbAHChKgXgo=;
 b=epNPg9/prZgUnt11gSynsaoSk7xOy+NiPnL9o2WFPqhhrXP/vy4M2jwXur2DFlA4xoLDRmJk+GJB4tT2J8s0W/UA3ERkqeohfWrUUPZf4LETqIhe3Fpf0lkcrag4LHfcIZraHr1WrPnebnV9af6TvjVVW8XLd/HUfmFTtMAaEdI=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5032.eurprd08.prod.outlook.com (2603:10a6:20b:ea::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Fri, 29 Jan
 2021 08:54:23 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3784.019; Fri, 29 Jan 2021
 08:54:23 +0000
Subject: Re: [PATCH] tests/Makefile.include: export PYTHON for check-block.sh
To: Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org
References: <20210129051346.56109-1-vsementsov@virtuozzo.com>
 <efc8bd97-9851-2a77-b6b4-92123e24db9a@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <f0732302-1ddc-2067-f23b-4d2ba51370a1@virtuozzo.com>
Date: Fri, 29 Jan 2021 11:54:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <efc8bd97-9851-2a77-b6b4-92123e24db9a@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.152]
X-ClientProxiedBy: AM0PR03CA0004.eurprd03.prod.outlook.com
 (2603:10a6:208:14::17) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.152) by
 AM0PR03CA0004.eurprd03.prod.outlook.com (2603:10a6:208:14::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.16 via Frontend Transport; Fri, 29 Jan 2021 08:54:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 61653d41-b3fe-4ad5-1e65-08d8c4337922
X-MS-TrafficTypeDiagnostic: AM6PR08MB5032:
X-Microsoft-Antispam-PRVS: <AM6PR08MB5032E15DD673AE09C46F7446C1B99@AM6PR08MB5032.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qtnP7tIPoJDJNpzcGOTjPjIfRdc3TBxx90ATsNZzC/61Jh1+E5/5oC5JBi8p3tqOAkVwJRgrXlx5LktMlT/vWlhQQ4MPy/LLilXwzg6dLEp/UnyBKpwa84OVM+76WM80+eCrWIcOGPle0A1opDYiY6cFxuLYXCPhw6shKFH/BN684blvZVk/Xwz0QJ3aqjFuZkv5L65KnbMOY8Ht5ZvCAuUFzxRkxi5Vny5n9y82e4Qiqw1zlgFzgYYP4N91wYEEjzAgHON4PD0+yXfMao2An+ywQO+qGdg3U9gfQcdnT2z+h0x+7ND8PCoegAJREMyryT2sPIOmsMMvzFaVHqi8Ki0HePVc0oh8lUd7SSK4V+SIeR1MBz8SLTe1nT2bM1FmuKlzSo7p2TA/4RI5t2nfEnAp/wXaNg4/hGzxq2GsaHOhtpOA0bd2p9HjnbE6FIXQ5MX8sM1/xb35grUyA1pWD6uzIGT+s3HA+zL0P/wmdeytHuQaR64GTIirfqimHAJw/qWmggBzH1P22yu8sdn2JrC881UTRa2ZUpZyjE8KHHPJKpEKnIVvzFma3/mkUv9D/q8T6mUGgMyukc9ngkt/n1ZRDdndaMBkRktPnxDyLaY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(366004)(39840400004)(396003)(4326008)(31696002)(8936002)(83380400001)(8676002)(2906002)(6486002)(36756003)(16576012)(66476007)(316002)(956004)(2616005)(66556008)(26005)(52116002)(86362001)(16526019)(186003)(478600001)(5660300002)(66946007)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QjhGaTM0QVBEMEc4T3VwQlpxakdMblNBT3pPbjZoZUpBR3NaRWt2Y2hNaXNR?=
 =?utf-8?B?dEs4YjZSeWUzcmVjdGRWMHRsQ2pBMjd1YXBzNVZJaW1DS2hneGZ0U3lRWFk0?=
 =?utf-8?B?U0l6N3RrUkNTKzZ3VlQ5a2RRaVY2LzhaVWZTMjhJQVM3QTNhQ2dIOGMwNlJa?=
 =?utf-8?B?b3FHWU4yaHJIV2xDRXNnRUlCQ2RoYWJjZzVOaTBnbE5QQVhKNzFYdVBJWnRu?=
 =?utf-8?B?TUkrcVdxUkpObE1qUnQrQ3RXSitOeVBpNHh3Q2R4OHc4dnR4Q2FrZzlUNm42?=
 =?utf-8?B?dUx0SVo0R2RMKzBqR0tQcGY0L2RjS2ZFSm1lWno4SU9PdC80SjVRQ3VQTDIz?=
 =?utf-8?B?MFQzQVNEeDZlQ3FHQThBcS9kb2l5b0NLL3Y5eGxTRnBteXZpQVY1WmNOZVJQ?=
 =?utf-8?B?N1JGZzJXQWx4UEwxMGpGMHV3dU1CVklZOW9tZHlmeW0vOHBiRWd2b2g3NTJh?=
 =?utf-8?B?UDZkMVVLZXZ2Z0UvVFdHOFg0V0x3YVQ1cEtrTXBNUUNqQ1ZreTRVQ3lBblIx?=
 =?utf-8?B?OUwxYWVhcEE5OWJOdGhSNG8zaEhVRWZWb29CZURoZUh3bkczVWhEbG5Zb1RC?=
 =?utf-8?B?d1pBdElJMkZHMTFZWmNweGpCUUx2SDArbnRTeWZ1THhHNWJ2S29ZVWNKci8z?=
 =?utf-8?B?c3NqQ3hrQlZZdG9YZHgyNFNmVDZaVTlrOXNWTUJzVG9LeWx5TlZDbG9SdGlt?=
 =?utf-8?B?RzYxQnA4L2N5Q0djZWZwc2Q3VXhwUlJPMkl5dHJjTkVlYkk1WlVJVlZydEVh?=
 =?utf-8?B?VmJKUWRzaTM1c3NZQWwxcjVtZm5ndUVZdE5PWlliVk9PRks5djNpZkE2Q1dl?=
 =?utf-8?B?YXRHS3RueWlBdEdESGxRZGxCMnFLWU9lYnRkUXhjb0JLZFMxdEN4enZnR0hV?=
 =?utf-8?B?YTk3eWI0ZWt0SWxaNnl0N1FlUlc5TGQyeGJjSkQrcThUU3BwK0dldXlXRjFF?=
 =?utf-8?B?V3NmemlzeVRBVDZQRjlocXZsQjRBdjR5VVIycFYxdmZyOGV4ZEdRMm45QVB3?=
 =?utf-8?B?dDdBQUlwaDVCSHlOZCtPckQyN1JjbkttbXFQM3lNWjZ5dGFCNS9IWVFFdEYw?=
 =?utf-8?B?UzNwYkJyeE5nODh1dUUvSXZLY1k5ZklINjl1R2VSUnhsWit0NTRvR2gxYk9C?=
 =?utf-8?B?VjFKRXBzWlFsTkhSMmJuQjA3NVI0RXgvVjdGVndKK2YwYzRZVE52V3JmelFO?=
 =?utf-8?B?SzhvRGlKbHA1TmdsREl3dHc0cFF2QmsrWThZSGZtbGswdEJNUURKcGkxYVc3?=
 =?utf-8?B?VkxHZU5FRnpZMFhYV2lEaXVqNFhiVXB1SktHVzBMeElaR0xCcFFrNXhOa05m?=
 =?utf-8?B?RlR5dHB1dm5UYjE5SG1aNVVjMjdJakZON2RIalFIRFFRb2Y5d2daV0hJTWFR?=
 =?utf-8?B?SEpMUjY0UUZwWittQzhHeTlYdXFVd0ZINWNxbTI2Wmw1UHltTEhnU3A1TzZH?=
 =?utf-8?B?STdWRHlOcTRFaWZySStDMUx5ZnNpOUZIQ3JwaEpnPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61653d41-b3fe-4ad5-1e65-08d8c4337922
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2021 08:54:22.9342 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1XnX6x1ZIKS5MTvHC4zlHjZlXylqrF3VZ0R35R7QA7/9WQQZFmlNCg506pxubf4FDs4ERnVHycVxBZK88rlWy9ZjVqE2Mw/9RR8ofpC8ax4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5032
Received-SPF: pass client-ip=40.107.20.97;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
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
Cc: kwolf@redhat.com, pbonzini@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

29.01.2021 11:25, Thomas Huth wrote:
> On 29/01/2021 06.13, Vladimir Sementsov-Ogievskiy wrote:
>> check-block.sh called by make check-block rely on PYTHON variable being
>> set.
>>
>> Fixes: f203080bbd9f9e5b31041b1f2afcd6040c5aaec5
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>
>> Hi! As Peter reported, build fails on platforms where python3 is not
>> /usr/bin/python3.. This patch should help. At least it works for me if
>> I move /usr/bin/python3 to another location and configure it with
>> --python=. And doesn't work without the patch.
>> Don't know how the thing seemed to work for me before :\
>>
>>   tests/Makefile.include | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/tests/Makefile.include b/tests/Makefile.include
>> index 3a0524ce74..ceaf3f0d6e 100644
>> --- a/tests/Makefile.include
>> +++ b/tests/Makefile.include
>> @@ -138,6 +138,7 @@ check:
>>   ifeq ($(CONFIG_TOOLS)$(CONFIG_POSIX),yy)
>>   QEMU_IOTESTS_HELPERS-$(CONFIG_LINUX) = tests/qemu-iotests/socket_scm_helper$(EXESUF)
>>   check: check-block
>> +export PYTHON
>>   check-block: $(SRC_PATH)/tests/check-block.sh qemu-img$(EXESUF) \
>>           qemu-io$(EXESUF) qemu-nbd$(EXESUF) $(QEMU_IOTESTS_HELPERS-y) \
>>           $(filter qemu-system-%, $(ninja-targets))
>>
> 
> That makes the iotests starting again when running the NetBSD tests ("make vm-build-netbsd"), but then some of the iotests are failing now, e.g.:
> 
> --- /home/qemu/qemu-test.N2qe9i/src/tests/qemu-iotests/040.out
> +++ 040.out.bad
> @@ -1,5 +1 @@
> -.................................................................
> -----------------------------------------------------------------------
> -Ran 65 tests
> -
> -OK
> +env: python3: No such file or directory
> 
> ... so looks like this was not the complete fix yet?
> 
>   Thomas
> 

Right, thanks.

Aha, we also need:

diff --git a/tests/qemu-iotests/testrunner.py b/tests/qemu-iotests/testrunner.py
index a581be6a29..24b3fba115 100644
--- a/tests/qemu-iotests/testrunner.py
+++ b/tests/qemu-iotests/testrunner.py
@@ -248,7 +248,7 @@ class TestRunner(ContextManager['TestRunner']):
  
          with f_test.open(encoding="utf-8") as f:
              try:
-                if f.readline() == '#!/usr/bin/env python3':
+                if f.readline().rstrip() == '#!/usr/bin/env python3':
                      args.insert(0, self.env.python)
              except UnicodeDecodeError:  # binary test? for future.
                  pass


will send as a separate patch.


-- 
Best regards,
Vladimir

