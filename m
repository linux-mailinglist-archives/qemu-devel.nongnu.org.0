Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AB449BE22
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 23:01:19 +0100 (CET)
Received: from localhost ([::1]:58242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCTsM-0003YF-Va
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 17:01:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nCToQ-0000Ji-Ho
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 16:57:15 -0500
Received: from [2a01:111:f400:fe0e::730] (port=45285
 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nCToN-0002Hu-Ku
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 16:57:13 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X569eQMmmUIvzcejrM6CTtH6KHx7MSHafUjl4mZixRT3ZZ5uRkXIZ3tcDV+4nIfIfHfzWvlie3E8iMIupYa5jhg1b+2G547Le9EdI2ogXNq9fWPylEjapQE3H07+GRCqxlHePSIBOf3yn21zjIYa/kp0a7Hn+XHKrza+jcH58A19f+uEeVBtuwU+VBpJmIIhYeDateqsGQ9695e6e/0Hz4vZLKOODCPztfcrTLHOBEgDAIlMPY7KNTK3jlmWQjllOaawF5lCfDUTVtjNzUNJX5C3zrR2HqtTdalUopLIMttGh2TZKfEhCgvoLGUX4vWfmOspGLfs6mkYM3KGCou7pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SILlXWMQSEOfelhkeDN7JkIEuoT3VUTT4h9zQ2/QLtA=;
 b=UirRk7YSE27nAmGgVAxTG1hFO9Klw5TR7YgktzdFVhK/BNHdGZpzNM/1tHVmI9324KvMaOmLKDrKh+l7F5wNBJBdeUenlN3z3uopIdiOHl4lpJ+otXG8z7i1OrrRVto5gJAhAN99/Rt+iUPMDvJ5t6Fq1v8d+M/DvR3Gbm0Mt5yc3hWa22VHlkip+XFHYGHvkaWqXXIgJhIj1Fur3En+E3nHnbpeAN4R30Ux7pNExhPSQ1jhCsaQ+nRY7a9T56MkJ4iOnBvqeY91kakaP8UZ+qt+W5vpOAY7XtQnCNRmis+mgN+RfsVXoGAW+HmJq0aVBcpOlMLZG6QsWEnlbNgJBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SILlXWMQSEOfelhkeDN7JkIEuoT3VUTT4h9zQ2/QLtA=;
 b=on+KrZFQKqU3BPKa+csyS9gyoUPL/9wqxAjCvnX9fAzsqtF7ycMIJp37XSLbpPq7GQREXXHvP3bnJeYQySpAzCN/FCnfGfU800eZIOI8IB66aB7QF2vENhxQmx/PUnwRV2mCYOeCZ3PPJTydnmDNsYvQmhk33Mt4MVCf8ah6TD8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by DB7PR08MB3082.eurprd08.prod.outlook.com (2603:10a6:5:1d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Tue, 25 Jan
 2022 21:57:07 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4def:4b08:dfe6:b4bd]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4def:4b08:dfe6:b4bd%3]) with mapi id 15.20.4909.017; Tue, 25 Jan 2022
 21:57:07 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, michael.roth@amd.com, armbru@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, pbonzini@redhat.com
Subject: [PATCH v5 0/7] trace qmp commands
Date: Tue, 25 Jan 2022 22:56:48 +0100
Message-Id: <20220125215655.3111881-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0075.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::23) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa6cec89-feb1-42df-6df6-08d9e04da13a
X-MS-TrafficTypeDiagnostic: DB7PR08MB3082:EE_
X-Microsoft-Antispam-PRVS: <DB7PR08MB3082DEF1D7900178A6D5897CC15F9@DB7PR08MB3082.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ib8WiyryJCB4bH5YmA3ggeH2smAcUKfx00ZIS2mmxPGefhCxFum/Ag0yyhLhEVm4pejkzxwod+EncYCBAmUji8eFQoDmM0y51phMrr8n+y89dj0WyBz4Go0D4RaPByQAbMwU7nbR5Y72FLNcet0ZpBPgdJq+OYQWJd5r1UZZVSrrG4OvbmlvxE+vTlI0RxGUVo6X8Lvl2F6Z6YJGbnznbveeaLSrHcSC08/CtqmhKKnU/fGdP+ZNFcXeC7oze0oLAg+RwUiAtoGf7oGD4i8RaNVfkxCzHYnGhTQ1jt2ADSjfuwNTSUmhxEsrh8CR9frT6aNB5YcAvMqhsyFIH8C7Zjy9O9orVvv/galRqp5q7VTKQRkorc8e9LBheCo5ryStAHbXxZTZmQrp2+CeR0Aubn5JAOjKwWsDcd+k+KsBu5CC6fpUF196IZrjaMfhRFAKROS5NhUXhXPTtixAHubfyWR3jJuM0mOgzEaWvI8rs9Gb8/nsoIwDJtcU536Jt9QV1Y9ULkAmKUW0tj6fiWv+az88XeUmLmX24erR/8rAKOHjhg4tVYLRn4E3aNpX2a8yb29kfm7DlUPfWvsI2m6RG+Yv/svFg0NaJMiIYHQtQZ6F/vthsCZ0iYB896LlPSqCxsKnxWqlSWi3BIAMscgVEFe2ifjXOu1zI/EjTROYsBCahoWniiBMetu12DJwi8NKzhXhn+YMrXtufG+UCPz/7A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4326008)(2616005)(6916009)(86362001)(66946007)(186003)(36756003)(8676002)(38100700002)(8936002)(38350700002)(508600001)(66556008)(66476007)(5660300002)(52116002)(6512007)(6666004)(2906002)(83380400001)(6506007)(316002)(6486002)(26005)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aHW3SowfMVicjjrbmELDJKFft62UXSZyJlhuB2gQYOooJYX4p33gCJOSRZnK?=
 =?us-ascii?Q?RyhDvcFtt/WhXsRFwfsX/zzywpAqhvSj6N/KLhBKywV+pwFcZXGwI8yTlXYU?=
 =?us-ascii?Q?zVgLS09DewZK6a5X4jsRCXPa9Q8sK7sFO0F+GOi8yJo8N20oGUKXVYNhu2Ab?=
 =?us-ascii?Q?MQhXLN3bhAmZNDMSVR0a7DPJoWAJj3jNJ2baPcoje0vPQY16vjOyKYjwDNWA?=
 =?us-ascii?Q?3Wa6DB0Pr366b44KiXpOK5hcUNSrZSKN8ZiS2sHcBiCp/8HbwzUY8hfu5PyU?=
 =?us-ascii?Q?eMdlOgxvyhFxAd8tQu+0fO/yMuP+VIE/EQQmIOAzgAYk/EdaCFTAmMla9p1f?=
 =?us-ascii?Q?qYVTZ22Iuldj1x/5cZJnmLQj8Hvw775M6vjOBDf5AkKnOEoHxtNI9pKQ6ZFo?=
 =?us-ascii?Q?vzsk5UlpceNmr0Rk6H7St1AApGRoKag6AA03BQ+N5kJsqYjnXT967TVKdRZN?=
 =?us-ascii?Q?yBwLmfM+2yHzlFU39M1gZXv86xdzPBbF5mIAPRnCNRZJMstfeV6l+9hFIEY/?=
 =?us-ascii?Q?UGk+wayT0vQXIyYFxKpwOW6z3KQcoYQKN/zWQVsu5HRheYf503NEpn0+7JXW?=
 =?us-ascii?Q?K2it1HhjAQAuswaGVaxJWYkeFAZsEqWwm4XkBdPgS/C1dJld4CLLZvyi5jg1?=
 =?us-ascii?Q?0cgbgw40OEmXBG45AvtuvkhzKF8bth7gP3OdOUI4c7mIGLOCpBXBGlY/acrx?=
 =?us-ascii?Q?oXzYajHDKpXwjSq7RgcOfPw4vDXUFcKLgWrbNrBr4XR1mL/1jHR0rSdtW1uY?=
 =?us-ascii?Q?/g88yIof4rdE1zETJCIiB2XANnCtTzGxcSAITO88tiol8ES5RWuJhPWMIrHt?=
 =?us-ascii?Q?HgU6BoIFlL/jpVlyPy0eQxqYqDpBZzC/qKZt7lhsDUKOvOGVc0ReWUIJySUl?=
 =?us-ascii?Q?9rOzTXKaIuCRMGmgFt7q7hsl3rbU91fXtgtISSOMeH7QE9KBYwuzF4oicaa1?=
 =?us-ascii?Q?Ko7izO99GIWEWzcDAwsGd72rcoLkLtp5gQcL6GqbHhZemk6hsQRoXn6pLS9/?=
 =?us-ascii?Q?cj1Lk2zBYdOyJ8jAGdKy+uHZCVXIn4deKalo6iCQplvaW60MZ+XWI2GyLJuC?=
 =?us-ascii?Q?lrZxgJJQ+2WHgHiPbVBjWmx0v3ApDMQuVciP/Udxc35N1VOLTL2cSk8+DQaP?=
 =?us-ascii?Q?Oh+TxD1sVq/nBguP+9sCpvlJ9gJ8amcy22JJrN4iwMU4a/1vwLJn8vrHGDER?=
 =?us-ascii?Q?v98AMeq4vWCsMBEGWA6CCCfV/cbJn+NbLzxxGpk2x5yJp/PsZwX3ufYiyWsI?=
 =?us-ascii?Q?WwTEK2v/7AoWlw3aV+mkojh6eBftL7LsSy6YbGP5wJtw4xQxYWDPK8YAD01D?=
 =?us-ascii?Q?r48B1MinpcBdPEAmo5UPR/nBIWmobUycjulxflmVxvBcjoLh8TEkhJazjCzV?=
 =?us-ascii?Q?giv9nU9YW3mu6tmYnXjjfntf97LsX656bHTW0pZLSCj/dPmXRDOVHIOViIti?=
 =?us-ascii?Q?obKXueN4d0jGwNle3kTS48teC2UfpsiL1o22xXtKMwOEPV0CX5iGaz+303U/?=
 =?us-ascii?Q?RHdFqBXveaNXdCrAQu0pxb4oJqrjIuxhaPycIJ0L+QykmKDj0ODQmTlMTdZg?=
 =?us-ascii?Q?QGbrn5qtBtetPEKji/7+NFnJ7T+Em1H41+CPkfNhSOaS8tOOQgXcHpB0cpJr?=
 =?us-ascii?Q?k9FWnkxxVw+xkOx0c7LgKr8kUZMpOw/Vu1YXARt3rdUNtEoT12Wjjwd6EMeu?=
 =?us-ascii?Q?fTKbkFkuSb8RgX4mNPsIeMKhrIs=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa6cec89-feb1-42df-6df6-08d9e04da13a
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 21:57:07.2950 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FdZ98vO1iew+Ds1p92LGIH4LYq1elga/+AOg8zPF2qz9Bg0M9dkv3zh7kNYq628zHEsWCwtuKMnmsCaobwjBXfQQmGz1NSs7BuYCAqSl1TA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3082
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe0e::730
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe0e::730;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series aims to add trace points for each qmp command with help of
qapi code generator.

v5: small fixes and rewordings, + reshuffle patches so that main meson change now is like in v3 and Paolo's a-b make sense again.

01: - fix/reword commit message
    - fix typing in qapi/gen.py
    - rename add_trace_events to gen_trace_events, and to _gen_trace_event for private attribute
02: - split from 03, to make 03 a bit simpler
03: - reword commit message
    - rename add_trace_events to gen_trace_events, and to _gen_trace_event for private attribute
    - rebase on 02
    - merge here main.py changes, with new option: --gen-trace
04: - move some parts to other commits, so now it looks like 03 patch of v3, so add back a-b mark by Paolo
05: - split doc change from 04
06: - split new comments from 04
07: new

Vladimir Sementsov-Ogievskiy (7):
  scripts/qapi/gen.py: add FOO.trace-events output module
  qapi/commands: refactor error handling code
  qapi/commands: Optionally generate trace for QMP commands
  meson: generate trace events for qmp commands
  docs/qapi-code-gen: update to cover trace events code generation
  meson: document, why we don't generate trace events for tests/ and
    qga/
  qapi: generate trace events by default

 docs/devel/qapi-code-gen.rst |  23 +++++++-
 meson.build                  |   3 ++
 qapi/meson.build             |   7 +++
 qga/meson.build              |  11 +++-
 scripts/qapi/commands.py     | 101 ++++++++++++++++++++++++++++++-----
 scripts/qapi/gen.py          |  33 ++++++++++--
 scripts/qapi/main.py         |  10 ++--
 tests/meson.build            |  11 +++-
 trace/meson.build            |  11 ++--
 9 files changed, 182 insertions(+), 28 deletions(-)

-- 
2.31.1


