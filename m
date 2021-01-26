Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B563039F9
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 11:16:06 +0100 (CET)
Received: from localhost ([::1]:38358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4LOG-00088Y-8K
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 05:16:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l4LKK-0005PZ-Py; Tue, 26 Jan 2021 05:12:00 -0500
Received: from mail-am6eur05on2096.outbound.protection.outlook.com
 ([40.107.22.96]:19713 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l4LKG-0002Pn-L4; Tue, 26 Jan 2021 05:12:00 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cQHleaMpyOcncbSraPkIHz27mt3//cvSqCg2a2Eu8a61lVLZDkPu7n7yCGmx6i+x4HMxyHVrZaSqDNoN4HIlqBH6zNRZGcMvXes8X/NDF/iSb/sNoH0SI6UM9EViQhzcI9Q1AH8ugZnsOCINt5PcfBhfN+YyMMPhp59YukVF4P33YoTyI0AkFCYIjqtU/IouKfJNjPdfcDznAmR+mhsshtNSaIfka//dqvSLCNm11iVzspnjVd7uFjh3qiX3C8hkJlyO+5Y7Js00/sPZ3kWGPhF22wz7A/HLv2ogJ7LLIZwjk5wmPeXpoDVv+v+5/3bOy9Tq2caVfP7o9RcSjl6N4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nIWgPAyGXk2TIOu4gid0mdzA9OYLw6dSnp4wOzPpE9Q=;
 b=gdpnXk8HNPOXts6SdXPHCtUBXvlYE3itu7nevwWJm/ajEDtH+uhl3fUINw2Xq4iZOSbg0Z7tULQ0xHEdeDeL3UrVnQAetx1YV8IrLn1VAsP2fcytmhLCXRU2dnnUT5806/IFJ1kcb4BvrZKHPE6WqAXfIN3vrnMLOLGQrmjywANOJqk7QDjwumlQQja9haApeFQ9NSgMOKxKYe9NoOT9PAamv9OykLxM6KYmKMG8042LMToJ6DOoT61dzei199ZqsTpMarfQ+qgXTo991f8qrnKjdM2r2uk73t6ShlWU/sH2DyfrKjaHzPglkKFdOpnp9q49sd+YqYRY50U+RL/8hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nIWgPAyGXk2TIOu4gid0mdzA9OYLw6dSnp4wOzPpE9Q=;
 b=m1PhRii+9II2f2wikcBjgnH2zIGNXDoTHi5mtu6/VKFYGw7PhJmW3pwyd+XBrgE20QCwgGkYKatEvmvb44bz43eUGDDXHrWJiYVOtXrcEqDTmLjekhkD2WFGJqaxd6pbg24wRQwHCFf/bLV6alaN42qfLPJ15UKoSl/WY1Km+ls=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4787.eurprd08.prod.outlook.com (2603:10a6:20b:c9::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.17; Tue, 26 Jan
 2021 10:11:53 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3784.019; Tue, 26 Jan 2021
 10:11:53 +0000
Subject: Re: [PATCH v9 4/6] iotests: add testrunner.py
To: qemu-block@nongnu.org
References: <20210125185056.129513-1-vsementsov@virtuozzo.com>
 <20210125185056.129513-5-vsementsov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <48549505-24b6-4fa6-babe-adca184f655b@virtuozzo.com>
Date: Tue, 26 Jan 2021 13:11:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210125185056.129513-5-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.100]
X-ClientProxiedBy: AM0PR06CA0103.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::44) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.100) by
 AM0PR06CA0103.eurprd06.prod.outlook.com (2603:10a6:208:fa::44) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.12 via Frontend Transport; Tue, 26 Jan 2021 10:11:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a32bbf5-8784-43a8-c99c-08d8c1e2cdb8
X-MS-TrafficTypeDiagnostic: AM6PR08MB4787:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4787DA7C6A774A60B6CC2495C1BC0@AM6PR08MB4787.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2Bj1+xFXXZP4xMjKk5VbU2ZfdkZuDFjayJ/YQrDstC5Kz0tqeynItZcJdrlhjkLyxHahxLVo+GIwOONsyzweLnQtuR3IEU2QOPzr3kaTWNtDFQBWx+cqoVnSeUc2o/tun00Nv8sgc9Vz/On5iy829f/k5e37kyXUh5GXrMM90bZ967gllMGNG1zojnVqqJNlKYY4i8a5NQXdAmLZgNBfstmZPV7y7FnYGvP2tcB/pUB67aX1oPyRvZJkvQGBGUj/HLqSrQk8DVO+UCrRi26wtoysFkjNY6RsS0x7AKSfy7kc05LKLTZ6toRTY2zMBpDn2BowUQex6PZCMwRrPnYQQHF0nzvsipcpIa/yLQx4BXqSWjoe/Xju3ItKjc89D4egBQxoBRdcuqPjLnXgmTn2iKaYteDucvgxSD3WX8eULtVxJQ9nQxGDnNV+LedLEXL99OLsr5K+LLJh3sP+Fj/eJENt80KDOfyQEcS+rUpVMdg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(366004)(136003)(346002)(39830400003)(316002)(86362001)(36756003)(8936002)(66476007)(2616005)(66946007)(6486002)(6916009)(956004)(31686004)(66556008)(31696002)(16576012)(4326008)(52116002)(478600001)(186003)(5660300002)(16526019)(8676002)(2906002)(26005)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UDE0VjJWeDF3YUd1RFRBMVNEcDFINUVUZGlldGIydUFCZXh5eWRrcm5vcmc5?=
 =?utf-8?B?dWdXQUZYandiWlNMMXdWbWJuYmI1MWdrZFhoc0lFdnpNTjVZaGdwd2p0OUdU?=
 =?utf-8?B?NHpyY08zd1daRjE2VlVhYWc1UDJjUGJjczFXdEJkdXA0YmlDVXY5cVhERXcz?=
 =?utf-8?B?aFVRRUV4ZmRWblEvcHphaUwwSUhQOExSS096TXA0RldqSVIzVDFSN0kwcXF2?=
 =?utf-8?B?N2svR2xvTkdWeEh4VHpnUytFQnFMOHQ0d29PTnhnTE1zNUxJeFloL2VqcCtY?=
 =?utf-8?B?dnRZSnpWMitidmNVTjA3Z1M0bHlrR1Mxb3dhSWhuUGdNdG1URE9GN3lDS2tM?=
 =?utf-8?B?N0ZYT3hBR3lZbGthVVdhbERzRDc0cGcvQnlZWk9lSndrTE5oOTZBeEpzb2k4?=
 =?utf-8?B?a2VDMS9GMDBOQ2sxcGRBUnBsRm1YclVMV0Vic05aSkV3WkJ3SmREQmc1NnU1?=
 =?utf-8?B?RzJyN2FiZFV4a3VWL3ErTG53aFQ1UHpPRnBPY1ExU1h0YXdwKzdQZ0ljRzl1?=
 =?utf-8?B?RXdGVEZUYi9YaWhvbUdSRnU2bG5XSHlYL2lRM0VKUkdiTEdkZkVKR3dHemtD?=
 =?utf-8?B?NWIyNHF6RmQ3ODJzUmlQOWNBRERZbHdxWDdyUHJQNm5mR0YxS0lYTVlVbFV0?=
 =?utf-8?B?ditOWUQyTWx2VnpENG1SQlpkR2JWU25hUnVmbzd6UlNsd2F1V1VOMjZ6dUtX?=
 =?utf-8?B?VHV0ZFEyRlNEYlZFeEp3SGxPTFBOdWxtbDU1aHMvVUk0OWtKaFhOQXhFVG5i?=
 =?utf-8?B?VHFyVUZjeG95VTRFWmlNK2ZSZm1SakEzcVkzbUZVajMrSjd5QU1oYm04V3p1?=
 =?utf-8?B?Zyt2bnVGQnJOaWczYlhCSVVMWldFTGlKdm1MVjN5UW5YaVVxZExTQXcrem81?=
 =?utf-8?B?a2RVeC85M3lWM3hieWpaWWxMUFgxL1VtS1g0TFB0RnBwemNDUWRXdWFmMmJF?=
 =?utf-8?B?L0NIOE9QeUxGYktpODFrY2hVREw2Yk1DWjNocE1Ia3YweXpYQ1ljUzJvZlI2?=
 =?utf-8?B?WUtWUXhyQys1S09Kb2c2NEs1Z1JqbWR0MHFlVGhWZnZmanBhR1dIWjhIblFQ?=
 =?utf-8?B?YStsWCs2RXFCSXFVdi9Vc0VncU00bmM3L0cvNnZUWlBOajNrM1BDOEQ1ZzRj?=
 =?utf-8?B?K3lIWm1uKzNGVUVaRXpLd2dKdm9tczRRVUVtdUpWSDl0UFJwaFBNQ21neWl3?=
 =?utf-8?B?VUkwTnI0cmpQWVBiM01YRkZ4b0VvRU4wemJ5amJqNFQ1djBxVlVoYUlkbG1X?=
 =?utf-8?B?Tis1WEc1VFdVNjluMGVOKzF5S2ZlbFFGT0FsdDBpaVJ1ZlN5SE1nL3BVRER0?=
 =?utf-8?B?SlQ1bkhVTVV6KzJjNUZSUjJFd2NMU1ZIenNjRFpTT2g5WWpaempmVHF2UVlw?=
 =?utf-8?B?ZXQzdEJBNTlxUlhrWWxVOGErQlJNSmY3NW5PSytZUjJmTWkrOXVnT0pxSThh?=
 =?utf-8?B?U3NRaFU1WkhLWmZiaEpxVyt2UFdoUE1MS0FULyt3PT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a32bbf5-8784-43a8-c99c-08d8c1e2cdb8
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2021 10:11:53.1910 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GtJa+d46DravrLF/GEhbcALOKTpR2bPdbJC12dTVM0kSSobmys3aion4Q7PsK4qpEmWZC1yhhL5xkyfxwSHnqCStjv4kgpa11VWhoe70I+E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4787
Received-SPF: pass client-ip=40.107.22.96;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com, den@openvz.org,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

25.01.2021 21:50, Vladimir Sementsov-Ogievskiy wrote:
> Add TestRunner class, which will run tests in a new python iotests
> running framework.
> 
> There are some differences with current ./check behavior, most
> significant are:
> - Consider all tests self-executable, just run them, don't run python
>    by hand.
> - Elapsed time is cached in json file
> - Elapsed time precision increased a bit
> - Instead of using "diff -w" which ignores all whitespace differences,
>    manually strip whitespace at line end then use python difflib, which
>    no longer ignores spacing mid-line
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy<vsementsov@virtuozzo.com>

squash-in to fix mypy complains, and try use ContextManager for CI:


diff --git a/tests/qemu-iotests/testrunner.py b/tests/qemu-iotests/testrunner.py
index 8480d2d586..046f9ce38f 100644
--- a/tests/qemu-iotests/testrunner.py
+++ b/tests/qemu-iotests/testrunner.py
@@ -27,8 +27,8 @@ import json
  import termios
  import sys
  from contextlib import contextmanager
-from contextlib import AbstractContextManager
-from typing import List, Optional, Iterator, Any, Sequence
+from typing import List, Optional, Iterator, Any, Sequence, Dict, \
+        ContextManager
  
  from testenv import TestEnv
  
@@ -69,7 +69,7 @@ def savetty() -> Iterator[None]:
              termios.tcsetattr(fd, termios.TCSADRAIN, attr)
  
  
-class LastElapsedTime(AbstractContextManager['LastElapsedTime']):
+class LastElapsedTime(ContextManager['LastElapsedTime']):
      """ Cache for elapsed time for tests, to show it during new test run
  
      It is safe to use get() at any time.  To use update(), you must either
@@ -78,6 +78,7 @@ class LastElapsedTime(AbstractContextManager['LastElapsedTime']):
      def __init__(self, cache_file: str, env: TestEnv) -> None:
          self.env = env
          self.cache_file = cache_file
+        self.cache: Dict[str, Dict[str, Dict[str, float]]]
  
          try:
              with open(cache_file) as f:
@@ -98,8 +99,7 @@ class LastElapsedTime(AbstractContextManager['LastElapsedTime']):
  
      def update(self, test: str, elapsed: float) -> None:
          d = self.cache.setdefault(test, {})
-        d = d.setdefault(self.env.imgproto, {})
-        d[self.env.imgfmt] = elapsed
+        d.setdefault(self.env.imgproto, {})[self.env.imgfmt] = elapsed
  
      def save(self) -> None:
          with open(self.cache_file, 'w') as f:
@@ -124,7 +124,7 @@ class TestResult:
          self.interrupted = interrupted
  
  
-class TestRunner(AbstractContextManager['TestRunner']):
+class TestRunner(ContextManager['TestRunner']):
      def __init__(self, env: TestEnv, makecheck: bool = False,
                   color: str = 'auto') -> None:
          self.env = env



-- 
Best regards,
Vladimir

