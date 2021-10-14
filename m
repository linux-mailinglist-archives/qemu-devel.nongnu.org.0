Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D3642DE2C
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 17:32:53 +0200 (CEST)
Received: from localhost ([::1]:37670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb2iy-0004eP-Mc
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 11:32:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mb2dy-00030v-Ns
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 11:27:44 -0400
Received: from mail-ve1eur01on0714.outbound.protection.outlook.com
 ([2a01:111:f400:fe1f::714]:63999
 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mb2dv-000098-Ko
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 11:27:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k79f7xq9unZ0f9nICbSx/Z0XKel1OEx8apzwuynHs/aRQB5UlzTeXX98UUvAjQi65Fu7/6UuXvYXnRIGzFhV0k/rgvwNlOHhhPvoV3J/r2FPRn8HPNXIenu23NxGSqLRvpdTtHc3E/Tz3sqmH3oUrGJkpGQk8+XvHp7/PGV8PpxL2ZOzSt3gAWg6XmvZ2XINvMRt3addH3Hn+1BX+yYC3dCJOh+MLYSa/pDFeG6jxIgHB4kpAetjTiO34PyrXsFgzuegD4JfOWGP8ECTrHfgpkOhnI8I1zywcU3PguvXATPRQvEMc4mxkLjdGTgUTjQWzoW5myeja1ZuHQYzJz0fLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d4OskIkkD+Hm2TV+abwjYUM8YVFqCxMvc6B6KP4bses=;
 b=Pyp3FfQTxbGwfZ3ngL0ktkxsrHrQyZiakvxNDIADpL2yXY2E4KzkO+MEldesxfq6vW5X3wUFDTp7ko6L44yO3nMQmVYzMd9zv6PiY2JIkbRpOTndwFh4nDQO4lzb+3XdHO2zuL/UbREb6N1nnzuCR1X3qsD5Rwm8/8ekdLawfW+jCD0AevBV3FE+5t4IOQM69e/2Rf9FeFowKWW1qfeuVh6on17U2NApgkfAwUDHk4PpC3zf2JsX+BhQuN4uVTbjyla6zRhMJtgKL+myBey1dsxe2ao/rlUnWOtyXYS4rbzY2IUIFGPSD3ZpsDp6q3Fqj+nlB39slDT8nzOJt9MuQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d4OskIkkD+Hm2TV+abwjYUM8YVFqCxMvc6B6KP4bses=;
 b=lZi75beClIiA0NWDtnIKZr8AEXpiqShRmq+NYvqSSDMt++1LwVXqVBhyqMME07c9SRqZmDYyWX7zZ1Zqxxoe19FKkHJkP0CfUMfmB7NPn5dwORV6fSC1KcBa2kCf9IYVy0bVQtTY/IA3z7vAGf9MNdhq/YlMMKeVbqCLAF7Cr4A=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6534.eurprd08.prod.outlook.com (2603:10a6:20b:31c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.20; Thu, 14 Oct
 2021 15:22:33 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc%4]) with mapi id 15.20.4608.016; Thu, 14 Oct 2021
 15:22:33 +0000
Message-ID: <9b6f4ade-7be4-6dd0-7b14-950de92d2cc5@virtuozzo.com>
Date: Thu, 14 Oct 2021 18:22:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 0/5] trace: inroduce qmp: trace namespace
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, stefanha@redhat.com, pbonzini@redhat.com,
 michael.roth@amd.com, den@openvz.org, libvir-list@redhat.com
References: <20210923195451.714796-1-vsementsov@virtuozzo.com>
 <87czoa8nul.fsf@dusky.pond.sub.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <87czoa8nul.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0304.eurprd06.prod.outlook.com
 (2603:10a6:20b:45b::30) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.43) by
 AS9PR06CA0304.eurprd06.prod.outlook.com (2603:10a6:20b:45b::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Thu, 14 Oct 2021 15:22:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c693aab2-17f7-456c-c82f-08d98f267225
X-MS-TrafficTypeDiagnostic: AS8PR08MB6534:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB65342925BB4826089B8CB699C1B89@AS8PR08MB6534.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VhIROOsIE46grmAEPkBx9z/uLcZ1RFLizb9rPlVLtZXLd3wj9qmjbUZgNSyxLsj8YtKjEJWxp9bSA4naPDdF+nKoS/M24Gi4V/AGpHuVplTAymhy8OPJeQKpC70qPzpdFhwMEXndWbVIGrwv5+Dt2M9rzPCVivZmz1uOV99sFH7aSg36Mll4B6mZeBnQUauVN0nR+aEo5OywC8tHeI96oTzcui5QeuyAg7EDAioWg92vB9JGBMetkWjr+1iyBXcX31FRjh4CamPK9JEtY09YHNTxVVF2X0WPXeXFSVRT7YAufLqyenOGv6CxSWFu6pr+4GkAZ/mbyJN+eGXm7rzVPpqaW4ea3I68YMLovre/3iQ+8WZkohAup9UISAQ2tgoFOWIg2QWeH0YuXrUr5UFz8auhfxybDs/dsleDPtdeAuqvEjOFbvSsXe1LQ8Gv1zdxEiYgrEkusSJ1NZhoZgy4YO3zoJpU4CDXOrPjxJ+aEWTuicF+h//KKmoU7f+O1bDCNDjZjdou8JRouvu2kVw/J9DfxKDCW62uMMHF9FwgJTWKqwLRr9h/aRhQeHRSdKl0encI9SUoXfE+7UrFg01brwSvHqRz8uB3BKx59o7Y43JVbHuuPgke6kufbJGAqXaQw5BU3rB8C8Gyk7dvTLmQEvAmF6fDkIujR4jjcXHzcTZOP24r0yv8obUWLRlZ4w+2QOcyTTJTZIL+6D3yExdHcwqOM3HHtPnhsbaHr0jOH2QO0+SW7Utw06BdSBQCh01NHdnz4ej/tBWslDIRoWdNYQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38100700002)(52116002)(36756003)(86362001)(26005)(956004)(186003)(31696002)(2616005)(8936002)(8676002)(31686004)(66946007)(83380400001)(508600001)(6916009)(5660300002)(6486002)(16576012)(66556008)(4326008)(38350700002)(2906002)(66476007)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SUNxUERUQ1I2cHJXazBWNHdFdjM3QmVhZEFHbCs2SEpJcHNsa0lTbmo5MlhP?=
 =?utf-8?B?bms2NkxqOUFnZW0zenQ3Nm1YaFgxWUpwUXRvckpmRWVQVDlOQ1cyYW5sbVA5?=
 =?utf-8?B?SkxuMzNWYWFCOVNiUjJzNmlCSENYY0tpbmltcWJYOE9kN3F5OXZva0MxRmVh?=
 =?utf-8?B?MVRtcU9ZbWZRMFFtTmVzZ3Q5bjZDcC9IUUpBK0MxOHRaOTBrM09ISzFiVzVL?=
 =?utf-8?B?R3dZWi9IMmhqY1VXSmEwNmdjTXVXQW1tR0hTUzJCMjdZdytLV0FnV1J1WG9D?=
 =?utf-8?B?MUV3Z3ZCWGhFYU1oRVA0aXJOMVRMRWJnR1d3YkxROWg2S2R3RXlPTXB1SGd5?=
 =?utf-8?B?VlY4OEswQmk2dDVDVXEwNWtlVDBzYXZDb3RkTzh1YWJmdHc4MVhVc3BObnBH?=
 =?utf-8?B?RmRXeThvS2tBSGw3SU01TTYreGEyc1BaeFdJME1nZmxJNnk1ejEza3dnajdE?=
 =?utf-8?B?a1FxVWZyZzMxMFZ0RkpnQlhLNEgvbE91SUk5QkYrUXNJVEYrZTBrRlNJKy9i?=
 =?utf-8?B?S3hQVEprZjdwOTErQmYzS3A5Tnl0NXdrQnNMYUtTRUVlaGR4YTJBQXlHRmUz?=
 =?utf-8?B?WlZzaHJIb2JaUjB3YWhleHVxenNCdlA2WWtlaURVTUhBcUtaNEROVjd4dTlJ?=
 =?utf-8?B?dGkvcTZlU1NkOGk3cHhJMWFGSTNLc1I3anJqOXZ3eGNIY3VMK3dLMDRRQjF0?=
 =?utf-8?B?aHlXM2tIVDJNT2RFZWJJUktNbVJRSWFOMWt2czJpQ0lPUTViWHhtQ01EakVh?=
 =?utf-8?B?dDd0dExzV01KZk1uQ0FuTmkyTVZGTVVKRy9FQ0xKMnNNa1NHeVZIbUEzTitF?=
 =?utf-8?B?S0pNN3JnUGd1RzVmYjBJMWF4OVFhSmdvVGdub0pTUGZaMmZ0WTZrcjhjcFNR?=
 =?utf-8?B?a2VUbndFdExPVFhmejh3NmlIdEltRjNQVmx6SlA0WG92d2lZMFFMbmdEaW13?=
 =?utf-8?B?d1RKYWV6Wlp2UEo2MFZmV0NQNzBZWTBQbW1sSjdKYVBUME9QM1FzNUkwUUE1?=
 =?utf-8?B?ZWdSaE5PcEcyVmJidG5BRlpieFV3ZlYzS2w5Z2VSUEhOZGNLaFE2SzkvSXpy?=
 =?utf-8?B?VGFYdUNvVzJOamZjWk4zUGY1Z3ZMdGlSOUw4WTlkaXVycUtxUXlqWWRCT2Jh?=
 =?utf-8?B?ZGlmUWtZMEVsc2czVjRqckJibmVzWUszQlg3bnNnQkN5bU5KbXhmVVN5Rnpl?=
 =?utf-8?B?bDMvQnd0UERoOVlnSElNSG9mN2hGZUdLVUVibHNpcG1IYXIxSTZOcGFDclJS?=
 =?utf-8?B?ak5uLzhIQWhnYlFYWlcwbUFpdUppNGI0WUtNbk5kbFd5WHJSTHVOdWZEZWFi?=
 =?utf-8?B?emNOKzBpOXdqVmFQRGdwVE9vbHlkZk9QSWh0eUZqNWxyQ1Bwc1VsbDFoNHhZ?=
 =?utf-8?B?NzYyMUNoK3Q4ZWJBekxhVG1hNG4rQ3ZuM1ZFOHVDbGFrVmtkTW1lcktBdGN5?=
 =?utf-8?B?N1B1am1SaHJZZUNxQ2phNmdwaWJxZWZNQ0ZJMHJmakVLTW1ZMG1mTGVWQWJ2?=
 =?utf-8?B?ZjhPREFmd2E5YjI1NlhsTGFmNlNvOUVKZDEvRks3MmFFUnNTb1psWTQzakFD?=
 =?utf-8?B?WGx5R1U5MHpwQzdGc0M4ZTYwTXltTVhMV2V2LzVPam52ZWNMYkFRbWJWQXIv?=
 =?utf-8?B?WUYxQjNXdktsdktsK0EyR3h1U0xkUHBPVTFFMjExNlZLY0J4dHB4d2tSMEw4?=
 =?utf-8?B?ZVMyY0F1dnBmeTdqUHlacGdwT0E1Y2llZzVmdUd4SmFCMzFtNlJaYnZKN2RT?=
 =?utf-8?Q?NzkDPJjJkKiYIATzGm3B1mrvqz/bHSDwFBeHVEa?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c693aab2-17f7-456c-c82f-08d98f267225
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2021 15:22:33.7498 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dHMuxjc/mvbX0hbzVtK9BDIf+aVQ/VFu4KravxkVZ2svvETtdVwaoD9ZAW+VWDNhVZgIcfN6pzraikGImLMQ4gCWTRMiryvtEEk2zoePhpc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6534
Received-SPF: pass client-ip=2a01:111:f400:fe1f::714;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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

12.10.2021 14:49, Markus Armbruster wrote:
> Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:
> 
>> Hi all!
>>
>> We have handle_qmp_command and qmp_command_repond trace points to trace
>> qmp commands. They are very useful to debug problems involving
>> management tools like libvirt.
>>
>> But tracing all qmp commands is too much.
>>
>> Here I suggest a kind of tracing namespace. Formally this series adds a
>> trace points called qmp:<some-command> for every command, which may be
>> enabled in separate like
>>
>>    --trace qmp:drive-backup
>>
>> or by pattern like
>>
>>    --trace qmp:block-job-*
>>
>> or similarly with help of qmp command trace-event-set-state.
>>
>> This also allows to enable tracing of some qmp commands permanently
>>   (by downstream patch or in libvirt xml). For example, I'm going to
>> enable tracing of block job comamnds and blockdev-* commands in
>> Virtuozzo. Qemu logs are often too empty (for example, in comparison
>> with Libvirt), logging block jobs is not too much but will be very
>> helpful.
> 
> What exactly is traced?  Peeking at PATCH 5... looks like it's input
> that makes it to qmp_dispatch() and command responses, but not events.
> 
> Fine print on "input that makes it to qmp_dispatch()":
> 
> * You trace right before we execute the command, not when we receive,
>    parse and enqueue input.
> 
> * Corollary: input with certain errors is not traced.
> 
> * You don't trace the input text, you trace the unparsed parse tree.
> 
> All fine, I presume.
> 
> Existing tracepoints in monitor/qmp.c, and what information they send
> (inessential bits omitted for clarity):
> 
> * handle_qmp_command
> 
>    Handling a QMP command: unparsed parse tree
> 
>    Fine print, safe to ignore:
> 
>    - Out-of-band commands will be executed right away, in-band commands
>      will be queued.  Tracepoints monitor_qmp_in_band_enqueue and
>      monitor_qmp_in_band_dequeue provide insight into that.
> 
>    - This also receives and queues parse errors, without tracing them.
>      Tracepoint monitor_qmp_err_in_band traces them as they are dequeued.
> 
> * monitor_qmp_cmd_in_band
> 
>    About to execute in-band command: command ID, if any
> 
> * monitor_qmp_cmd_out_of_band
> 
>    About to execute out-of-band command: command ID, if any
> 
> * monitor_qmp_respond
> 
>    About to send command response or event: QObject
> 
> For input, --trace qmp:* is like --trace handle_qmp_command, except it
> traces late rather than early.
> 
> For output, --trace qmp:* is like --trace monitor_qmp_respond less
> events.
> 
> The main improvement over existing tracepoints seems to be the ability
> to filter on command names.
> 
> To get that, you overload the @name argument of QMP command
> trace-event-set-state.  In addition to the documented meaning "Event
> name pattern", it also has an alternate, undocumented meaning "QMP
> command name pattern".  The "undocumented" part is easy enough to fix.
> However, QMP heavily frowns on argument values that need to be parsed.

Still, pattern is parsed anyway, as pattern. But yes, this patch adds
rather specific and tricky logic, which a lot more than just a pattern
to search through the list.

Another possible way is to update QAPI code generator to insert a personal
trace point for each qmp command.. That seems more complicated to implement,
but I can try.

> But before we discuss this in depth, we should decide whether we want
> the filtering feature.
> 
> Management applications can enable and disable tracing as needed, but
> doing it all in QEMU might be more convenient or robust.
> 
> Libvirt logs all QMP traffic.

I am not sure.. At lest in Vz7 (based on RH7) it doesn't.. Is something changed in new versions?

For example, I run a migration by virsh. In libvirtd.log I see migration events, but don't see the "migrate" command itself, neither migrate-set-parameters / migrate-set-capabilities..

So, I never could rely on libvirt logs in this area, and we usually use Qemu tracing to debug QMP traffic.

Also, Libvirt is not the only source of QMP traffic.. In Vz7 backup is done separately. I do backup of VM. In vm log I see drive-backup trace point. In Libvirt I see only "new connection, client: /usr/libexec/vz_backup_client <cmdline follows>"..

>  I doubt it'll make use of your filtering
> feature.  Cc'ing libvir-list just in case.
> 
> Another way to log all traffic is to route it through socat -x or
> similar.
> 
> Opinions?
> 

The benefit of Qemu tracepoints, is that you can enable them independently of any environment/management tool.

-- 
Best regards,
Vladimir

