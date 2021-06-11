Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2F33A43D3
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 16:09:56 +0200 (CEST)
Received: from localhost ([::1]:53366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrhr9-0001c5-W5
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 10:09:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrhoB-0006Sb-6R
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 10:06:52 -0400
Received: from mail-eopbgr40096.outbound.protection.outlook.com
 ([40.107.4.96]:3076 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrho7-0008Lf-HJ
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 10:06:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L80Vu/calFZ4d/fWPGLWNQwINqJE6AH9KmV4l3Z/npVfWLwcq3VBzi+3HDEdH9npcA3VRwuqx6KlmCA5bnaK0L0aSMAX87/SXtsNnCkKHPIKi7JVspUwQdbNSQB41Jw9aSxAxL702L3hOTbmoXNb4TLzXxJXqFnkQjLb9uyj+t5IoEJPbOk5Y5TkXxEtzTlcIMXAwWnnbxldddsk2tH22UbELqEfLXOSIvTz/HnUtzd1FWE3RdbwRnhAOgWXpW98f2SH37lIIDgyYj0neyd4NgDezYfMJpbGf+kivURJ4b2hAPqgKHxnWT3B+D0C7rigjyA1C022CxtHcXW5/mFKrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CEE0HN4nEMCQyUphtOSGZDgtfgEX1W+/cD4b93X9Dfc=;
 b=Gz83BsEdTmDOJl/291z/kOhr9WPoZIqAJhaaXipZwyrBEbBVIKkQGiyVj6ZTkfEKvJIpTlra5B4RxZ+MOPWVMOzUXIJcnzZmdHqBU3fGHdd0Af7TqOSQ0S9CLC1JuQxRqU0BlmLjR3jap7audWa+k+Eg8O1rwZMK/4oKgtD8p6I3wsAKoFnBPvCE696eesAY54qX/MznG1bzAWz475Hy3SnngPT3GPUrRNnP7cF3QezG3Vu10waEQeIigCaoVP2DuA3Cn3esaKGpVUjoUUb5pjDzQ42oZfeRrbdW+ZIMIidi6/zkD4fdI2g4er9B4T8mMKkfYq2nEpa+hPWd5r3pjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CEE0HN4nEMCQyUphtOSGZDgtfgEX1W+/cD4b93X9Dfc=;
 b=I/P2KCyyCPyceKYFvPK80ajQ3WAiaI73I1xWvg0BHI7tf2tfYzhlSAp0O9n6yIpsnnuVwW2vyynKlPcK5/RkR65Pdjwer6wCKn1mAjiTifdp/928xdzuDHca1zCqCcZvrUAEZFBcGGLuvKfNYgAf342O6W3vhUcBMTP6LiZVQ3Y=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4600.eurprd08.prod.outlook.com (2603:10a6:20b:84::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.26; Fri, 11 Jun
 2021 14:06:44 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4219.023; Fri, 11 Jun 2021
 14:06:44 +0000
Subject: Re: GSoC Intro - TUI interface for QMP
To: John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Niteesh G. S." <niteesh.gs@gmail.com>
Cc: kwolf@redhat.com, wainersm@redhat.com, qemu-devel@nongnu.org,
 ehabkost@redhat.com, armbru@redhat.com
References: <CAN6ztm-J2GoQKkLb=Az0H2Q8UKK4oE3PgXg7g14=T53sQAUyDg@mail.gmail.com>
 <CAN6ztm9JKPo05_qJo1cFGq2P6f1DzB9vu+VZ054e9MdHVkRLog@mail.gmail.com>
 <YKuq242kdKxhvHAr@stefanha-x1.localdomain>
 <351d1344-a243-ca77-396b-0c1d071b9066@redhat.com>
Message-ID: <1fef6d06-74c6-48e3-84d4-e6febaafb1e0@virtuozzo.com>
Date: Fri, 11 Jun 2021 17:06:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <351d1344-a243-ca77-396b-0c1d071b9066@redhat.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: AM8P190CA0030.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:219::35) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 AM8P190CA0030.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:219::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.20 via Frontend Transport; Fri, 11 Jun 2021 14:06:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7b9ac074-1a6a-4521-c3d4-08d92ce22497
X-MS-TrafficTypeDiagnostic: AM6PR08MB4600:
X-Microsoft-Antispam-PRVS: <AM6PR08MB460025168C7DF9B6CAC458BAC1349@AM6PR08MB4600.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9shpuSR/7fbZyJT2RmgAl+9IaT8IGTX/xYTEqfeEb1rLzer7CVXJxMXVy7O2rsiSY+LY0SHWyPSip5PcieGDPGsDZbi4Iu8ySEay+9N/5KRRSNPyjdAjYt/P75Hcngj21WzZIaaOk850oFn0DTani3uYtxLFgxjc/HSxFAzVGgjvMX/5kbJxuHSJu8+bZZWB9rIYenpWjsUTngDR5Y8LQgClxPzEZ3fRoVrcDGHDQa4tm9hoBibvx4jBRYghfeLjugSah9SYJZaIorq+fMFdpBdqM7Sum0yujjXkHWdi0Ba+nQenAqVjQBXG7qS6g7sTZWxPw4zGlbnEzJjGxB3J8o9KmZhMGDJKN8HVIErw7+ClEWqHeUzlfssdt6sKGg1VinteqOqzhlgLdF2fwNAyNTliYdNTLt/l+0FvCJI1Y85ywXQiUf4FbTseVlMxJadMN06zCo8FK5M7oEboHjcNsOCAPQTDLQKiWKVIk/0uuXcAwFsAJezWVZXaG/dUqWITT1uWBIHJuE7xHzEUjQdxYetr31UKxQccg1+hxnv4HH9hSA1Dva/j2e8uTiyHQ+cyK6X4aCVU2MJGap8gJA8y3w/MID7qqpQ/qJbThQPJk8QfDEYTtE+eGjYex9XW7X5yc6SG2Cav1Emg1/v1IQQFdZ++92JJnR1++DQWN9GMwqBvLU1MXyM4v59JCKBL2PNQ43GTxDN0+KrnBElkbO3tm581kFLYzuID2Ni8LdbP9mE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(39840400004)(396003)(376002)(366004)(31686004)(5660300002)(66574015)(316002)(6486002)(110136005)(66946007)(2906002)(2616005)(8676002)(30864003)(53546011)(66476007)(16576012)(186003)(8936002)(86362001)(83380400001)(66556008)(36756003)(4326008)(38350700002)(38100700002)(478600001)(52116002)(31696002)(956004)(16526019)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?Windows-1252?Q?/5OA9MZn36c4qDBEtDhi2/iU1/Q0PBqhAtFNrBWvL65Frfmky+ukyXNQ?=
 =?Windows-1252?Q?26a5A+e0wG0u7KqheEN6nA2+kKrMjN3ZDNdg5GZQ9zZKgTXOyciJpP95?=
 =?Windows-1252?Q?KzVG0pD4A1OVjVC5YmD6qfJZxbVnDe9Iouyh5xkRPaUljti5gKmb6ihu?=
 =?Windows-1252?Q?Y6b9jdVh9ACo/bkg7Px4eqdsP5z9UGZkllCas/1VYTT2YSWoin26kMeQ?=
 =?Windows-1252?Q?SVxexTSbNUF+4zdr9ho++vVX5FeXERxlFkdmxzKvhY7+d3TowOH0vW5Y?=
 =?Windows-1252?Q?fs4vf7I/c6SiAQK2oT5yd2HdWIAaPQvkyj3cWQqTYoVfg5horXZmf7Ws?=
 =?Windows-1252?Q?H2LP9oAumhqwGS0yYBPb2dyy82KjZuFdMfs+/DD+qkRyRLhRJGVyC8eR?=
 =?Windows-1252?Q?xbC7cvYaeEj5HMg5boVx6RQ6DqNwXRCqEVK5YZCBiT6s06bfy2NJ9t2b?=
 =?Windows-1252?Q?wyykp3+jeBCaifCDWVNf/iT5edPNgsFuhf/qk31lKu/Ewwnl30aLjQZG?=
 =?Windows-1252?Q?CENicY4ZNOKY6a9hC8fXYYaaTHbphEs4CDfdAjzHgiYGgwrIgxqU5GtF?=
 =?Windows-1252?Q?avSL1EPSoMPvfDbunafmDYjfLDCh1zs02GSyh3+K+CA4PXJw8Mnyr48n?=
 =?Windows-1252?Q?M+Zm4wJuQFqs2pXBntFEVTZB2GG7mvDIzZ7TN9lAlYO88Omar2yDRBRu?=
 =?Windows-1252?Q?wiA5H+p5RlaSfC3ZPqMguLVckgdKvbxmK8hhgd1+W/FlrhpCb1Stk44m?=
 =?Windows-1252?Q?rTrotadfyq2BylBwYT5zz0FYIZ4nzq3gqiKVfCcFum33AOW+1YFZyeHl?=
 =?Windows-1252?Q?lNmzejEfd25SL43uSyn3nad6xGz+zdGYrDreru6lOcmu3GhBkqzQtlwM?=
 =?Windows-1252?Q?DB0o1cnsYtMckkONt8yHVTFxD23zMR5lDnT0rRZJc8FE2uglP5tuQghn?=
 =?Windows-1252?Q?TLsSY6fpzFb8rVZZBoKm4Pw9OXbB9QQeTR14oTBl/Y+840hqUlavpaaM?=
 =?Windows-1252?Q?EINPT3riR20jbMZMr8klohHFL/obTOPeVWwuVT4GgK/aLcEMQNzFFjdi?=
 =?Windows-1252?Q?YiA2Qn90CSeYIKpCCWC2D5C9FBs54hiXaL+Wqgq2RkxzeWupyk/O/Pk6?=
 =?Windows-1252?Q?+Fri2DvanFpNbSE4ajwGHPCbSzlMNZLjIfbGw8f9vCKJo+8nMqtUpUrh?=
 =?Windows-1252?Q?UKq210aNsev99gJWOC8vvbgRNEHb1Ilk/ykAE+NCcXJZ8SSIsokuBa3N?=
 =?Windows-1252?Q?dgi8TannfFI7XJJ9DMB9cqyGwnbFRbzEGFaYWnKBgAMiiMzTdNZnnfnB?=
 =?Windows-1252?Q?OCskGDYSiMN00tNDqhhzDi6RQ1T/qUfq5cALuzYKIqLHsiZyW4LLqtpU?=
 =?Windows-1252?Q?3kq62m5vx6VuKNzl2nNq2LFuuB98LbOsElg8I5aZxA2qHgY9v3r9Iqzr?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b9ac074-1a6a-4521-c3d4-08d92ce22497
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2021 14:06:43.9485 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B6nOW5qSZhBElrNMw34LV55N2qgRUHdk3yjyDtP/Scm8Pjn6c2gCcPOgixC95UgNtSCsdwT+13Lah6tEeYdCSAva4Yi6CdoaIpZbWlkpIUA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4600
Received-SPF: pass client-ip=40.107.4.96;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

24.05.2021 20:34, John Snow wrote:
> On 5/24/21 9:32 AM, Stefan Hajnoczi wrote:
>> On Sat, May 22, 2021 at 12:32:00AM +0530, Niteesh G. S. wrote:
> 
> Welcome Niteesh :) I look forward to working with you this summer.
> 
>>> By end of this summer, I would like to get a basic TUI with some desirable
>>> features working. Some of the features I would like to get working are
> 
> As a reminder to anyone reading this thread, the goal is to create a qmp-shell that functions more as a TUI, akin to mutt, irssi, or (my favorite example) mitmproxy. The idea is that there will be, at minimum, a history panel showing QMP messages that have occurred so far and a text entry panel for entering new commands.
> 
> This shell can then be augmented with various other features to facilitate testing, debugging, etc. One of the core upgrades over the existing qmp-shell will be the featuring of truly asynchronous events which will appear in the history panel without requiring the human user to press <enter> to allow them to display. This will use a new Asynchronous QMP library to facilitate this feature, bringing with it fixes over our current use of undocumented Python features abusing non-blocking sockets in the old QMP library.
> 
> My plan is to worry about implementing the very basics of the shell first, and then to add more features on as we feel comfortable with the basics. We can discuss what we consider to be the bare minimum for this project and lay out the feature requirements that define a successful minimum.
> 
>>> 1) Syntax checking
> 
> To a limited extent. I don't want to disallow the user from sending commands that are invalid in the event that we want to test the server's ability to cope with and reply to invalid commands.
> 
> However, if the syntax is malformed enough that we can't understand it to send it to the server, good error messages that point out what exactly went wrong are helpful.
> 
>>> 2) Syntax highlighting
>>> 3) Code completion
>>> 4) Logging
>>>
>>> I would like to hear some of the features you would like to have and also
>>> your
>>> advice's on implementation.
>>
>> Welcome Niteesh!
>>
>> It would be great to have an QMP API documentation viewer built into the
>> TUI. When you enter a command like 'migrate' it would automatically
>> display the associated QMP command documentation from qapi/*.json.
>>
> 
> Stefan's suggestion is an important one to me. The current qmp-shell does have an auto-complete list of available commands (press <tab> after connecting to see the list), but it offers no explanation of what the commands do, what their arguments are, etc.
> 
> Being able to get interactive help explaining the commands, their arguments, etc would be a massive usability improvement over the old shell.
> 
>> Stefan
>>
> Additionally, there's a few threads we've had before with people's stretch goals, dreams, nice-to-haves and so on. I owe you a bit of a compilation of those ideas. Here are some that I happen to remember.
> 
> (Keep in mind that not all of these have been discussed or vetted thoroughly on list, some may be vastly harder than others, and not all of them may be mutually compatible. There may even be objections to some of these. We will definitely not do every last thing on this list, and it is important we stay focused on the core task and get code merged this summer. However, some of these stretch goals might be fun and provide you with extreme leeway to investigate features that interest you personally, so I am listing them now.)
> 
> 
> 1. Utilize or otherwise re-implement readline's history feature, such that when opening qmp-shell, you can press up/down to recall previously issued commands. (The usage of 'readline' library itself may be complicated if we wish to use a TUI library like urwid. Some re-creation of features may be necessary.)
> 
> 2. Implement tab-complete for command names, command arguments, etc.
> 
> 3. Implement a FiSH-like suggestion mode where, without tab complete, the text entry window shows (in e.g. a gray font) the most likely auto-complete. You can press <tab> to accept this auto-completion.
> 
> 4. Add the ability to save a log file for a given session, recording timestamps, incoming messages and outgoing messages. Sessions could possibly be automatically saved and cycled such that the last 10 or so are kept, or maybe up 10MB, or some other kind of limit.
> 
> 5. Add the ability to load an old log file and "replay" it to a server. Optionally, the "replay" might be able to use the log timestamps to replay the commands with an identical timing. After a replay, it might be nice to be able to use a diff viewer of some kind to show differences between the original script and the replay.
> 
> 6. Add the ability to "attach" qmp-shell to an existing instance of a libvirt-managed QEMU and have qmp-shell behave in a "watch" mode, showing commands sent back and forth between QEMU and libvirt, to help facilitate live debugging of libvirt.
> 
> 7. Add the ability to "hide" certain events from the history view. By pressing a certain hotkey, we can enter a command mode and start filtering certain events. For example, we may wish to hide from view all JOB_STATUS_CHANGE events from view. Certain filtering modes may warrant their own explicit mode available directly in the shell, but we may wish to provide a more powerful filtering/scripting mechanism.
> 
> 8. Similar to above, add the ability to change the "verbosity" of events in the history panel live at runtime. For example:
> 
>    - Show the full QMP message, pretty-printed
>    - Show the full QMP message, condensed with no spaces.
>    - Show the raw byte sequence of each QMP message.
>    - Show an abbreviated summary; just the command name or event name.
>    - Show or hide timestamps
>    - Show outgoing commands in terms of what the user typed in qmp-shell.
>      (e.g., if we offer a simple syntax, show the simple-syntax version.)
> 
>    Being able to toggle between these at-will may be nice to help see
>    more or less information dynamically as the situation calls for it.
> 
> 
> 9. The ability to generate an iotest stub from the current session history or a subsection thereof. It's OK if the test isn't fully functional on its own, leaving some sections as stubs. Generating the commands, waiting for the commands to complete, and generating an '.out' could be a nice feature that helps qmp-shell users quickly write tests.
> 
> Some thoughts on this:
> 
> - iotests usually launch a VM to connect to. qmp-shell will not know the arguments QEMU was launched with. The generated test might attempt to launch QEMU with a minimum viable configuration, leaving other arguments as a stub marked #FIXME.
> 
> - The generated iotest may be able to automatically generate event waits. For instance, if a JOB_STATUS_CHANGE event occurs prior to the user entering the next command, the generated iotest could automatically insert a delay that waits for the same event.
> 
> - Generated tests should always end with a VM shutdown sequence, either explicitly (user sends a 'quit' command) or implicitly (The python iotest library calls vm.shutdown())
> 
> 
> 10. The ability to detect a disconnection and attempt to reconnect automatically, similar to how an IRC client would.
> 
> 11. The ability to define macros to perform multi-step, complex routines with a single command. Something like a ~/.config/qemu/qmp-shell.conf file could possibly define these macros. The ability to create/save/edit these macros directly from the shell could be nice.
> 
> 12. Integrating tools like Vladimir's block graph visualization tool. There are complex memory structures in QEMU that can be hard to understand quickly by reading large volumes of text. qmp-shell could be augmented to help render and visualize them quickly, facilitating debugging greatly.
> 

Thanks for noting this :)

Great that you've started this job! I'll share some my ideas in relation:

13. An ability to connect to running libvirt guest instead of qemu process. It's simple, and it's done in my scripts/render_block_graph, by additional small class LibvirtGuest, which realizes .command interface like QEMUMonitorProtocol.

Further without numbers and less concrete (and maybe less related to the considered project, but just to keep in mind)

== Language ==

I never liked typing Json things by hand. All these quotes, etc.. So it would be good to support (may be enabled by cmdline option) some dialects. Most simple is support Yaml: it's a lot less restrictive about quotes than Json.
I have a tool (I think I didn't publish it, by probably I should), which simplifies sending qmp commands to libvirt guests. And it implements own key-value syntax, which goes further than yaml and allows omitting not only quotes but also commas and colons, so instead of

virsh qemu-monitor-command vm1 '{"execute": "blockdev-add", "arguments": {"id": "disk", "driver": "qcow2", "cache": {"writeback": true, "direct": true}, "aio": "native", "discard": "unmap", "file": {"driver": "file", "filename": "/tmp/somedisk"}}}'

I can write

qmp vm1 blockdev-add id disk driver qcow2 cache {writeback true direct true} aio native discard unmap file {driver file filename /tmp/somedisk}


== Visualization ==

Hmm, as John said in 12 it would be good to integrate with some visualization. I'll say what idea I had around it:

We have script in qemu scripts/render_block_graph , which runs some qmp commands to get the structure of Qemu's block-layer (it's a complex graph structure) and uses graphviz to render a png image. I had an idea to make a simple http server, that provides a way in realtime in browser watch Qemu process block-layer.

And really, if we are going to visualize, I think trying to do it in terminal is a wrong way. Better to assist the terminal by web server (or may be, just make the terminal inside a web page?), and visualize in browser, as html/js/css already has everything we need for any kind of visualization.

Also, if you ever used browser internal debugger, you know about it's very kind feature of visualizing json objects, so in the output it is collapsed, and you can click by fields to open them.. That would be very nice for output of query-named-block-nodes command which is huge and hard to look through. And for all json objects in displayed history..


== Simple start of qmp-shell ==

Actually I don't use qmp-shell ;) Instead I just run qemu with "-qmp stdio" argument, because it's a lot simpler than remember how to run it with unix socket, and run qmp-shell on that unix socket in another terminal.

(and yes, to compose command in json, I use my "qmp" script which parses simple key-val language, and print command in json).

So, what I mean: it would be nice to have a possibility run _one_ command in _one_ terminal with all needed qemu arguments, to get into qmp terminal immediately, and have qemu stdout messages together with QAPI events. Like when I simply run qemu binary with "-qmp stdio" option.

-- 
Best regards,
Vladimir

