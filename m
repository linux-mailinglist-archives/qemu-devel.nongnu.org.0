Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC2C40D3BC
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 09:24:33 +0200 (CEST)
Received: from localhost ([::1]:60836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQll1-00037f-TJ
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 03:24:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQlk4-0002RW-Pq
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 03:23:33 -0400
Received: from mail-he1eur04on071f.outbound.protection.outlook.com
 ([2a01:111:f400:fe0d::71f]:35400
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQlk2-0004U5-1u
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 03:23:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k27azjtvPloSIck8fwpUuiEPymzWtaIwkpo/aP6o+5n8KWO/VJNfbXpLusXAWr8AN1FOh3WiOj5rhLkFIZbdR7loK82eK4zPo/3A0xW8JG3KeRvbowm3Z0oezhzpSkyNmqP5VjEBf9HMzXnTWB3Vs1L+8ac3CpOi/3FNNYg0JTlK8z0iotP4+8k4WaXQYwX4CFp+8NOQ/CKbkg/DoiijQdGiBkWQ4uCyJBe7Zb0AvQjdFXY1a5LRYr78uh8djgXobTMrvQjTPT/5TxyYzaKO1BYgypIpBQ1h5Bkh7DS1TZqKD8oGvSUrV4YT3zwrojjGra4q3Ch0/hXcIsLAeJYINA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=fBB4QKdbjrdsEBv9DD0lrABfE0aL6YCYRNXbyJ++OoI=;
 b=MP7w17Scr/SGLMzQG+vbLGub2Y4lgV6qPcmHeXwMEjTqhEVNP5u82+ya55Oe6U+zkySnE6fpfEIdDG4T/ry8/Dq9TMcwFoK0zAX1CpSzzYxG/dy1YOoWJJ/I2SsTwlqHQ/WcGt4HX79a2jZ4LhPPQBu45enkUtIQAnDG2ERUyVn+cwKQWldb/TmfdDTU89IFb+OOAp4lKf4fLlP5K0HhKo+sojLTcwveco23Rh9xY5cmslZY3IuVGMeGSprCYhz3HqVSJGi6s8oxVpozZhA524SitZ/wTRFvkuHUn6YAx/6O8FgmlvcT1Sa8XADJtoxWFLzQBlmoFQuMC66pBZQcoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fBB4QKdbjrdsEBv9DD0lrABfE0aL6YCYRNXbyJ++OoI=;
 b=SWBOdZqxxflVbBaDBzpUUBJyMZMFHOheF4fXlTWfXdA2i0tb6CdV9yX/Fx/tsafX9u1zI+c+2LZLWAtSHaLN8Lrto2Ke7L5gZye8jAmP1q5HqR4sOwEtvmpKB5z2bkJB9yzbHbSwhuzpS6qwthffk//lQgAcugvlzZaZ9weSC40=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB2984.eurprd08.prod.outlook.com (2603:10a6:209:4e::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Thu, 16 Sep
 2021 07:18:24 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4523.016; Thu, 16 Sep 2021
 07:18:24 +0000
Subject: Re: [PATCH RFC 0/5] Subject: [PATCH RFC 0/5] qapi: Add feature flags
 to enum members
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: eblake@redhat.com, jsnow@redhat.com, marcandre.lureau@redhat.com,
 mdroth@linux.vnet.ibm.com, libguestfs@redhat.com, libvir-list@redhat.com,
 berrange@redhat.com, pkrempa@redhat.com, kwolf@redhat.com
References: <20210915192425.4104210-1-armbru@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <5b9b9fe9-12e2-c6f3-8430-450f55255d55@virtuozzo.com>
Date: Thu, 16 Sep 2021 10:18:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210915192425.4104210-1-armbru@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0077.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::16) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.205) by
 FR0P281CA0077.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1e::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.6 via Frontend Transport; Thu, 16 Sep 2021 07:18:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 12e72d9d-98f6-4269-7790-08d978e22be8
X-MS-TrafficTypeDiagnostic: AM6PR08MB2984:
X-Microsoft-Antispam-PRVS: <AM6PR08MB29848D410AFEF8B343389D7AC1DC9@AM6PR08MB2984.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jjvRbZ5tIrCX339DWrK4kdgdm9mffkfKQDax8dPN8Mpw654sk0QScf5rRXbOi14cOUxvQ6j8gytH5/L+Y8TKMfv25zX8dNfjuwnfNof1RDny4oLwILcM7Gh8l/NdxP9F/cSjB8iWk7iq+BOS2AjhlQskTeVKgKLdRcPdBCHMXA7dw5y4hACV5kdJ9f/lwMrWmexNkSgXTP/Duk9aArKRULmdWbLHSyHBPw4V8/j7mEIC5ykwssJBicWrkkiVDsCjlq3s6cr3PZtZUqrzw0NnscHOELNLi9mX5/bnSztbKG6ByYUrA5ohslocbLG96EIBWM54y80/Fwmh0aQq/RhsPzkVVeajU/GSE+y1WrpU2pYrANb4Cznkt5Xf8nyUzA+pLicHaYa/yg+f+TF3FHuqhlj8ywA3aDrojUCarfzmVyHUByVE74RqkCZoZFaVthZd9WuTEix3sxw8/TMRLmn07DM/crGBC9j6249eIIGxcDtEFQUAWx7ZHZ61/JDpN+FZrKf4ePLwfKTRMbi3Ee7Wme3dy1XhN6fL6Ig8/vEYtTvwj+iJxBxBWcOIC8Sm/WMv4quUaWlzxnO1BenqfLWZSAr/G6VnyuzzItKmwmwGmF0p/M4LZMf6rAmntGnRzVgAGXeZAyIcnwGmjYJTvEqPY2HTkHOYJI5rzaHJpfcF+dwubWgvh2MS8cxGIhl/q75JlJthgPBM9alIRUBv7SE7nIAU9Mx31vPMrNwyOBvcbO7qFkOnxQbtB/U5lkDGQlmx6VR32bnbYhjlqfCZk/eT7g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(346002)(376002)(39850400004)(366004)(6486002)(52116002)(478600001)(2906002)(36756003)(38100700002)(31686004)(4326008)(316002)(16576012)(7416002)(38350700002)(956004)(86362001)(26005)(2616005)(186003)(31696002)(5660300002)(66476007)(8936002)(66946007)(8676002)(66556008)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YTE3N09qNzYyOEVSK3F0Tmc1bVlmTTJtSVd0dGxmWnpLR0ZLL3B1aWYrQ0Vn?=
 =?utf-8?B?MzlWVG9XVm50cVp0YmV0SGluYU1XMjhFQU5iZTZ0TkVRQld4YjQ3RkxCdTFl?=
 =?utf-8?B?cjZ0L2J0Q1hlRTdMWkh3TThRRkl1QXRJVGlQN3FGNDI2Z2Y3Mk1HUHFjMmhm?=
 =?utf-8?B?MVVVenZUL2NaUUphSGdnRUxBVGhuamFnb3NxWnNndmU2MXFSWVh0R1lVYmpl?=
 =?utf-8?B?QURpNEtrUkc1UkpKUlc4aDJoWmlTaVB6TERQUGtsci9Rd1dYbFdxRlc0RHlv?=
 =?utf-8?B?UXJzOFVreERkcXRsbkVuYWR3ejFwa3ViUlp0aE5DRTFxRXpscTN6TVdXMXVw?=
 =?utf-8?B?M1kwNG5UV29qZUsrdWYrS1AveEJGbzhMR0VoakluNnNQRUtNeG5DcW8xK3Zx?=
 =?utf-8?B?VU9QZmg1SVN0MnMralNVS1NDL3NsZjJLN1hueDhCZy9lM2t2ME9BdFUzeklC?=
 =?utf-8?B?Y2Z4M3NhU3hTUjBwYlVneWh4VGpEdEtPWVNaOVRnS2NxcW02TU8reVdjd0c5?=
 =?utf-8?B?QTQzdkdvWU5kbGZnTVc4dEMzbkM5UXU4eis3Vm1uV3VsZmh3cmY2NkdaWDAy?=
 =?utf-8?B?ejYrUk9ubHo5dFlYOVFOcTFRZlR3SkFMV2docitMQlBFSlg5UnBOTUhDVk1T?=
 =?utf-8?B?M1ZwTkluNkM0K2NSK1lMdUR0M0RtK2ZkRmhkQWxyTW45QVRZSEVEbUpvSWNl?=
 =?utf-8?B?ZjZWOVRraC9iazcxU1lkaG9RcmJRNDBpQkYzRGMyd0dTZFBjVHdWdGliMnc3?=
 =?utf-8?B?UWtpdUZib2xmVlJCQlhhQ2pobjk3MkF0UU5rekVycSt3K29LVkgyMUxYeDEr?=
 =?utf-8?B?M1JoNytVeEJ3UE4rNEtCeVg4ME1qdEl5UEd5YlJFazM2bjBZaUVHRk5oTUZE?=
 =?utf-8?B?QjRWNnhIYWZPTVY4Wk9nTVAvL1JOamc4R3VaK3pIV1ZZZHBxTys1dG1kdDNt?=
 =?utf-8?B?RVVBdzMrczNscllaQno2Nkh4eS9vK2tPOG1BRjBhTHFQMktSdmJhQmNYdG5G?=
 =?utf-8?B?SmpjV1lEc08yZGQyWU9DeHNxT2dINTk0aTN1RXJqWERQVnQ0aG1zUmhFbnZu?=
 =?utf-8?B?TVN5cC9CaG00YVhHRGN3bzVBNXYrejdWRUhVSml6VXlOMm5BbFBRcy9FMFQv?=
 =?utf-8?B?RmlzQUwxdDRqd1MwNldNMzZXdDUwZ3FKVDlLVmV2ZUd4SCtHdG9aK2toRElI?=
 =?utf-8?B?c1BqTVNUNUtJSDdWVnpDZ3JoMS93NDQ1YktNM0Y1aEdURUNjMFpnWjU4NUk0?=
 =?utf-8?B?MGpRSXBmYTVlRjZLRlNTeFNHdVk4UEJjQkdoVWZTVEFxUlI5dG9RcGZQYXp4?=
 =?utf-8?B?NlNBdThMbnRUTW9pZ0NZZFdOM3NIa2pzOFd5ZXpKY0pCSzMwRlFNNXdGZkNV?=
 =?utf-8?B?SFpUVFE3YlZYcDc2MXk3VktWQTZXZk9ZMnhoRzhkTjVCWVYrQ3U4VzllMzlY?=
 =?utf-8?B?NGY2ckhnZ0JzcTMxbGI5T0dobnduVVhaTDJlMEZmNE5SOURXYTJqVWg4VExN?=
 =?utf-8?B?aTVCOWJ0RytWMHAxd1pLczNjY3JaS1lRTEowaytTUy9pMThHK1pkaGdhTUxP?=
 =?utf-8?B?dURRcFhERCs0Z09qM0wrZWxpMC8vOUU1VjN4WGlsSUs3bjZKdlNuK1BFNlVv?=
 =?utf-8?B?QmNGdFZ6d3N1bDJqVyt3TXZjd3hlSGxiQkZGejFnVC8yblpoZlU0NEVTN1Bz?=
 =?utf-8?B?NzR3NmlRVzdqU2dSTkRFbTNsTEREeW92aGRVNTJlY1dRdUQ2V0h1anBYZUh2?=
 =?utf-8?Q?HmyYRT7uPTjjxWPcyzmkO7hbyU47/YB979CYdA9?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12e72d9d-98f6-4269-7790-08d978e22be8
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 07:18:24.5572 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qc2L7IX9ll1BqtX6rirJww44eLpzQifl27iDAOTn/yfe6dlZyA295Q6nt0ELbJHpzBlXS8Br8BWtDj0mexEHDsdrnudG84ePWzt+xwxzgIM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB2984
Received-SPF: pass client-ip=2a01:111:f400:fe0d::71f;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.698, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Great! Thanks for working on this!

15.09.2021 22:24, Markus Armbruster wrote:
> PATCH 1+2 add feature flags to enum members.  Awkward due to an
> introspection design mistake; see PATCH 1 for details.  Feedback
> welcome, in particular from management application guys.
> 
> PATCH 3+4 implement policy deprecated-input={reject,crash} for enum
> values.
> 
> Policy deprecated-output=hide is not implemented, because we can't
> hide a value without hiding the entire member, which is almost
> certainly more than the requester of this policy bargained for.
> Perhaps we want a new policy deprecated-output=crash to help us catch
> unwanted use of deprecated enum values.  Thoughts?

I think crash policy for output is doubtful. If we have query-* command that returns a lot of things and some of them are deprecated the whole command will always crash..  Deprecated is "use" of the deprecated field, but we can't control does user use a specific field or not.

If some deprecated output is a consequence of deprecated input, we'd better always show it.. Or in other words, we shouldn't deprecate such output, deprecating of the corresponding input is enough.

So, we are saying about showing some internal state to the user. And part of this state becomes deprecated because internal implementation changed. I think the only correct thing to do is handle deprecated=hide by hand, in the place where we set this deprecated field. Only at this place we can decide, should we simulate old deprecated output value or not. For this we'll need a possibility to get current policy at any place, but that doesn't seem to be a problem, I see, it's just a global variable compat_policy.

> 
> PATCH 5 puts the new feature flags to use.  It makes sense only on top
> of Vladimir's deprecation of drive-backup.  See its commit message for
> a reference.
> 
> Based on my "[PATCH 00/22] qapi: Remove simple unions from the schema
> language".
> 
> Based-on: Message-Id: <20210913123932.3306639-1-armbru@redhat.com>
> 
> Markus Armbruster (5):
>    qapi: Enable enum member introspection to show more than name
>    qapi: Add feature flags to enum members
>    qapi: Move compat policy from QObject to generic visitor
>    qapi: Implement deprecated-input={reject,crash} for enum values
>    block: Deprecate transaction type drive-backup
> 
>   docs/devel/qapi-code-gen.rst                  |  4 ++-
>   qapi/compat.json                              |  3 +++
>   qapi/introspect.json                          | 23 ++++++++++++++--
>   qapi/transaction.json                         |  5 +++-
>   include/qapi/qobject-input-visitor.h          |  4 ---
>   include/qapi/qobject-output-visitor.h         |  4 ---
>   include/qapi/util.h                           |  6 ++++-
>   include/qapi/visitor-impl.h                   |  3 +++
>   include/qapi/visitor.h                        |  9 +++++++
>   qapi/qapi-visit-core.c                        | 27 ++++++++++++++++---
>   qapi/qmp-dispatch.c                           |  4 +--
>   qapi/qobject-input-visitor.c                  | 14 +---------
>   qapi/qobject-output-visitor.c                 | 14 +---------
>   scripts/qapi/expr.py                          |  3 ++-
>   scripts/qapi/introspect.py                    | 19 ++++++++++---
>   scripts/qapi/schema.py                        | 22 +++++++++++++--
>   scripts/qapi/types.py                         | 17 +++++++++++-
>   tests/qapi-schema/doc-good.json               |  5 +++-
>   tests/qapi-schema/doc-good.out                |  3 +++
>   tests/qapi-schema/doc-good.txt                |  3 +++
>   .../qapi-schema/enum-dict-member-unknown.err  |  2 +-
>   tests/qapi-schema/qapi-schema-test.json       |  3 ++-
>   tests/qapi-schema/qapi-schema-test.out        |  1 +
>   tests/qapi-schema/test-qapi.py                |  1 +
>   24 files changed, 144 insertions(+), 55 deletions(-)
> 


-- 
Best regards,
Vladimir

