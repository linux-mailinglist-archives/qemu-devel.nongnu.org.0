Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D7F319D6B
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 12:35:45 +0100 (CET)
Received: from localhost ([::1]:37242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAWjg-0003x7-Kr
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 06:35:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lAWia-0003Pz-1B; Fri, 12 Feb 2021 06:34:36 -0500
Received: from mail-he1eur04on0728.outbound.protection.outlook.com
 ([2a01:111:f400:fe0d::728]:41140
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lAWiW-00042R-0Z; Fri, 12 Feb 2021 06:34:34 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WvIJJGrRo1bhdkkz3a4uOQliByfLn5wgZYEBVg5SG53/IYg6YzJxR84ksl2G/h/+Ns+KcMmhAf3QXAIo7F4uLauJgQcjQWOvNI4D4A+5ZeWLWz+dahq+ofQqdXQL9Lv2WMdUQhEXxpcFhe5rzCOILBtfwaJkLlOJUswoja42wAw9O45CRZbjmCt6sYivD062c2D+eqpFFn+mOPHOAzHpKQFsNpjQ/srdkrjKDRLvIF8YmMGyyeBlVXPcOD0sTeOxiVCy+RgfZKag3K8NbUlbSqcZbNf1KqjhxVAG4PU6hARDONv4KOPaFNgmof0qjNKynktZx6V2KsSqNARGjjqgew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eG3+C9d4A5V03KR+nMfEkGyYuhlGHYT3Yd+bsca+x5Y=;
 b=OYVzViFh7rG0so/nG7UTGcvosTQEZQHXj5rSI3oWKgQJkDyov/6+mqZ3VY+fn+O7+/71SINpSFfCHTdhbGgeG/L1FtiWnXCmeOUa21vTghD8MH7r6stU1jPx1AtLXj8cuF6XWYBsDyTn+6qW1iUZoDANbvK4VcIVZUOC2I0FfbeF3xszCk4IkgXtNAbA6rwMAqNS0WC5oGwbIes3KmqyyM+urhRskL2p0NndBPM2FU2rqkajOR8YPJMeKmk+e0d1kPpbNxvHTcMpTT4M0SglaWq2fwmji2JgaTFbogKKVeLSKDJRNRadby3C46Le+vm8avMQPT/p5mES2sSFudk4ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eG3+C9d4A5V03KR+nMfEkGyYuhlGHYT3Yd+bsca+x5Y=;
 b=jO06FvWhEWRbarZuvNBUG7jM64u2ba/ymvnZ+jnkrrkCr7CBlJl9ifcnaXfb2S5yWyvn5GK8cTFHiP25TQp/dyLOMxH/mRpulu9pxoSAz+L42L+15SR6IlyEWwgbRqrcbbmcNhPzTW5xv1Vk2s/c8yI6czYk3o7xiXqBcHC1yrQ=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6038.eurprd08.prod.outlook.com (2603:10a6:20b:23f::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Fri, 12 Feb
 2021 11:34:14 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%9]) with mapi id 15.20.3846.034; Fri, 12 Feb 2021
 11:34:14 +0000
Subject: Re: [PATCH v2 1/2] block: Explicit null-co uses 'read-zeroes=false'
To: Eric Blake <eblake@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>, qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
References: <20210211142656.3818078-1-philmd@redhat.com>
 <20210211142656.3818078-2-philmd@redhat.com>
 <40f42cc8-521f-5090-63cf-b4549be43905@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <ce8d588f-e2a6-191a-dcd9-af510fbcca40@virtuozzo.com>
Date: Fri, 12 Feb 2021 14:34:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <40f42cc8-521f-5090-63cf-b4549be43905@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.212]
X-ClientProxiedBy: AM0PR10CA0024.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::34) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.212) by
 AM0PR10CA0024.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27 via Frontend
 Transport; Fri, 12 Feb 2021 11:34:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6d9d675b-7094-42f5-f2dc-08d8cf4a1ffe
X-MS-TrafficTypeDiagnostic: AS8PR08MB6038:
X-Microsoft-Antispam-PRVS: <AS8PR08MB6038A26C9A5C6AD2428F1280C18B9@AS8PR08MB6038.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VFHlm0vjjEPOHCtvImcb/1hNhC8FD+BJ0SklUtwu5UYaiUN4zbTEUAq/JVZYwDIlLWRX03/71gUoQ2eKcjACKwM5gb7flEBb5CT3psMEY23oi3GMaPf2rmDVEH3wyQqLso4jbkhj7a45MX1v9K4jy2w1Ls+nkzUkEcZ4zPrJtcWMxwj8vuFg5KvOHBEe0J9bofboPvBLP9lqRp3VfLixjM2vDP+/Xwrk/DqwJS1p59NnjfW/zgNYf7AuPnKPhZIgV8iy4pwx2vr3iChSuEFXGr+A+cx+y3rhjBI64VoLZ0tyqvPuj4K5ya2ElSxahXuKGgkCTbyu7tTIrmCykvwbKU3X0sp86jAK8s3U41tQ0wWu363KLo0J66Qd4NPJZ8B8iveL8KIr7lYw3L1S58e40VBB8QDggaBsDhtK/ygCcQq6oBddhT/H5dRBzXFLXZFAiP1rPhL7Nj2STqRUOOoA67ZHyHWqkQJvp4CThWLAvb50CbiyPFXjmkq7rq9cS/rK8XvxXuVIi228QBaayyHNmky4tvWzl9OtZNlWaFZmqRNPJvBnBzLn7gCBqMEW+P18gE17jVa9sYCs0HQZxX+O/s2KVd5Adhi5LhMZsEY6zBo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(346002)(366004)(396003)(136003)(376002)(16526019)(66946007)(86362001)(186003)(26005)(956004)(7416002)(8936002)(2616005)(31696002)(2906002)(66556008)(4326008)(478600001)(52116002)(6486002)(36756003)(8676002)(5660300002)(16576012)(316002)(83380400001)(110136005)(66476007)(31686004)(53546011)(54906003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NnNhdXJLb3Q4c3N4czdyZzZuQThxM1pta0ltRUZZTVZZMlNqdlVOVldHZTUy?=
 =?utf-8?B?YlN0bURJb0dQZk1TZ3lCWWJyWnJrNTBieGhOS1Axdk5nZTVrblp5TlVab1ZF?=
 =?utf-8?B?NDYrckY3WDJldUNOQmR5SWdoWml4NzRsQ29Xd2VLdlRJTitEQ3FIb25sZmIy?=
 =?utf-8?B?NlV0Q2t4amlyVnJ2WHcxMWtybnIrUzRIYldqS0l0bmZIRm83MXZzRVFoNXlB?=
 =?utf-8?B?UlVLSm92OEwxYWlNZGE5NDhCWElUdHJvQTc0NTU1K3VuUkM2cmJKdG02YUhO?=
 =?utf-8?B?ZEVpN0p1dGEwV1NPMFVneWRFU3dwazI4QTBITCtIQ1JBM0R0d0ZTNXA4c0FJ?=
 =?utf-8?B?NlpqdG9CYjIxOTZ2QTdRc1FCV1pwZExucE1DY0ZNdmk0WjUvbmswMitjWjVN?=
 =?utf-8?B?ZVltcGZrd25HcHQ1Zk0rOWR4bDdDaVNBdWZYb0FaRXc3SWx3RmE4R3lrcG5Q?=
 =?utf-8?B?a3lybVAweGd6VzExUXJSWHFYTWY3V1hHdk42a0RKazZ3dFBJOHRqQUdEYmxU?=
 =?utf-8?B?bGlseU1rVW1TM1pPU1VsdkUwT0VjeG1mNWIrU3dlM0F2QnhHUy9UTkg4dFI1?=
 =?utf-8?B?RXJBaU5BbjJ4SXkvUkgvdUtoNlIyOWlWT2YrOFYrMnRZQThFejNnL1NtZnQ5?=
 =?utf-8?B?NTdlcmF0SXhJUFVsTDZCZkVSVm5lQjlHVHU2aXF5NVB0bncyZzY0TXJ1Zzhl?=
 =?utf-8?B?cDlIUWFkREhtRWJWYXhGaGNqUDhVWVptSUdVK2FWRVNoMlNJVFpnR296M21Y?=
 =?utf-8?B?bXo2UzZ5czRuUHh3UGRRVG8rYmpNdXp3K2xVa0NGQmV5RWZoQXVQZ21OTUQ5?=
 =?utf-8?B?ZUM4cjRrZWZYQ3k5TkJkZ0dCb2NYN1k5MGM3VXBIMzdZMC92Vk9ZWjd0MlJx?=
 =?utf-8?B?TlZOdXlsZ2pqT0liaDljNmlzUmVQRjU2cjJRWFBTM2l3dkMweHF6Rkp0L3dj?=
 =?utf-8?B?ZVNqNWc2bG9xcDRSWWp2S3BFd3NRaWFTbGF4MFQ3dlJUZmNnc2x6djNXUnFj?=
 =?utf-8?B?dEVQSVpJYnY4QzAvMThqM2Y1aUVhV0dKVTFVZG91NEhNQnFjM2tyd1JLeDdK?=
 =?utf-8?B?ektnMnROaWdnYnZoNTJOWnBCSlgzeDhoQ25paWJnYS9VbHhQNTFpcnJQTTdK?=
 =?utf-8?B?Z3RuYjR5N2xmdWFtdk1wandCaHhMWEtMYjIzeGN5Yjl0ZWh0RDB1ODlSbTN1?=
 =?utf-8?B?QkRTSlhVdjM3dnhjNEJDb3JhWUN4cDE3MUpRYmRYUHBLdlg1S3Rna2trZVRI?=
 =?utf-8?B?LzRoVmZqZ245K3ppeFV4SEFoMzVkMGJndnptdlVraU50cFJUMlkvRGQ4T3Jw?=
 =?utf-8?B?TmYzNUZjMjYxZ3NuaEk4OFZVSGMxK01FMVVlbFFTRFFvMm1XWTZkb1NUZ0NQ?=
 =?utf-8?B?V1ZjM1RQY3lMM0JlMEh1UlMrQU12S1ZVaDRYWTJaZU1BdXFqQTBieUR2T3RC?=
 =?utf-8?B?aUVTOGFHd3ZMWnJUeFJrNC9BaUNOakNkem53c3dEaE9ubVh3R29ZTlFwdU5j?=
 =?utf-8?B?M2dDM3lWc05jSXlHQzRyelBBcktFT2lkNk9LVm1qM3hPMVY0cWNick9jdGx0?=
 =?utf-8?B?VkZnK0xiYWd5T3F3dExOMlhEMm9kZVhKTmZuZGU1bWVmeHAvRFJBZTY0NXVH?=
 =?utf-8?B?QS9QZWQvUW9jREtkZDFvNk1GNjI0ZnhINFcwMWJOdFVGNVdXR3BCRmJQazZp?=
 =?utf-8?B?RmRjU1dJNFpNUEpTQjRhRFNoRVZVL3hLbWlPOStyaXh6dXgyRm1LcUc2RHBN?=
 =?utf-8?Q?2tbXXzpMzGv+VYiMrKZHpUBqNT+cyUYYHgRQPKs?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d9d675b-7094-42f5-f2dc-08d8cf4a1ffe
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2021 11:34:14.5829 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G4BZjLzh/n+XofOiOd9h4DbiFNE3rxDDlKafKLArkZr2CBaGi7cL7H3VZ9LYT5hMMUAg10Oh8kL95PULB25zzaD4idfL1fSEdzKnxqKfRdg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6038
Received-SPF: pass client-ip=2a01:111:f400:fe0d::728;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.119, RCVD_IN_DNSWL_NONE=-0.0001,
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

12.02.2021 01:40, Eric Blake wrote:
> On 2/11/21 8:26 AM, Philippe Mathieu-Daudé wrote:
>> We are going to switch the 'null-co' default 'read-zeroes' value
>> from FALSE to TRUE in the next commit. First explicit the FALSE
>> value when it is not set.
> 
> Grammar suggestion, along with a suggestion for an additional sentence
> to make the intent of this commit clearer:
> 
> As a first step, request an explicit FALSE value rather than relying on
> the defaults.  This is intended to be a purely mechanical adjustment for
> no performance behavior in the tests; later patches may then flip or
> elide the explicit choice for tests where performance does not matter.
> 
>>
>> Suggested-by: Eric Blake <eblake@redhat.com>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>> - Missing: 056 & 155. I couldn't figure out the proper syntax,
>>    any help welcomed...
> 
> 056 - looks like just one line:
>          self.vm =
> iotests.VM().add_drive_raw("file=blkdebug::null-co://,id=drive0,align=65536,driver=blkdebug")
> 
> the best way to add it here would be rewriting that line to use blockdev
> syntax rather than blkdebug: URI syntax.  The other question is whether
> it is a noticeable time difference when the default is flipped in 2/2.
> 
> 155 - looks like several uses such as:
> 
> class TestBlockdevMirrorForcedBacking(MirrorBaseClass):
>      cmd = 'blockdev-mirror'
>      existing = True
>      target_backing = None
>      target_blockdev_backing = { 'driver': 'null-co' }
>      target_real_backing = 'null-co://'
> 
> 
>> - I'm unsure about 162, this doesn't seem to use the null-co
>>    driver but rather testing global syntax.
> 
> Concur; I don't see any reason to worry about this one (but mentioning
> it in the commit message can't hurt in case someone asks later)
> 
> # blkdebug expects all of its arguments to be strings, but its
> # bdrv_refresh_filename() implementation should not assume that they
> have been
> # passed as strings in the original options QDict.
> # So this should emit blkdebug:42:null-co:// as the filename:
> touch 42
> $QEMU_IMG info 'json:{"driver": "blkdebug", "config": 42,
>                        "image.driver": "null-co"}' \
> 
> 
>> ---
>>   docs/devel/testing.rst                     | 14 +++++++-------
>>   tests/qtest/fuzz/generic_fuzz_configs.h    | 11 ++++++-----
>>   tests/test-bdrv-drain.c                    | 10 ++++++++--
>>   tests/acceptance/virtio_check_params.py    |  2 +-
>>   tests/perf/block/qcow2/convert-blockstatus |  6 +++---
>>   tests/qemu-iotests/040                     |  2 +-
> 
> You did a pretty good hunt for culprits!
> 
>>   tests/qemu-iotests/041                     | 12 ++++++++----
>>   tests/qemu-iotests/051                     |  2 +-
>>   tests/qemu-iotests/051.out                 |  2 +-
>>   tests/qemu-iotests/051.pc.out              |  4 ++--
> 
> and for the fallout to the iotests.
> 
> I did not audit for which tests are easy candidates for dropping the
> explicit read-zeroes=false (that is, where the extra time in allowing
> the flipped default doesn't penalize the test), but am okay giving this
> patch:
> 
> Reviewed-by: Eric Blake <eblake@redhat.com>
> 
> 

I'd keep tests/qemu-iotests as is..

Benefits of keeping old behavior (by adding read-zeroes=false)

  - saving several milliseconds. I doubt that it would be even noticeable. Could you give have much time of "make check-block" it saves, if we update all iotests to use read-zeroes=false, instead of transparently move to new default?

Drawbacks of adding read-zeroes=false:

  - it's generally better to test only default behavior than only non-default behavior
  - this patch creates extra conflicts on any patch porting between upstream/downstream
  - for new tests, nobady will care about read-zeroes and will not add it.. (or will add when copy existing test no thinking about it), so it will be a kind of mess

-- 
Best regards,
Vladimir

