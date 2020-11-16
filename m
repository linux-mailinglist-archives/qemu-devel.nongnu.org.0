Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 067342B424A
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 12:12:48 +0100 (CET)
Received: from localhost ([::1]:57282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kecRC-0003ej-W6
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 06:12:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1kecP6-0001ie-Vw; Mon, 16 Nov 2020 06:10:37 -0500
Received: from mail-am6eur05on2102.outbound.protection.outlook.com
 ([40.107.22.102]:13706 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1kecP3-0001z6-Ej; Mon, 16 Nov 2020 06:10:36 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MMxg/4jWl9AEJHDTygOueXFvV5mcgeoJz0XE7D1fhgR4NYlr02GFlwSc7nwSc2DI13aaYi9JxsjDvtfA9kKE3E70aki/j+SiFhDYk7X2rU/bmayexoFh1LRuK3FCs+xTbujwOLl6ddumf6WAu42awmvuwTT860y9PZVudgQwOEsKokpyoXSfgWuwBFmZ6iRUhHSMPGl25awayxrlgdmRWnZg5Ol5nMZKPQ7WCBlNFJI+JYAH/Dn8M1ErU0HlLKF37Z4DR//RmDDr/qagcyyLy54fR+XDQ2dmMMlyCFQznxAOFukS31eSApuDQQBzjzNm8+vc9EcT4BJIwifLgN6NHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KYzyFwB5C0QU80eAbj7j9+IxkW4oV12IB+swk3QLS90=;
 b=WQAxBIvWflLasS6xtM0mb80k8frhnHltJrsspwCLuCSMs5n8Sl6e9s8mdNThk2iGrVghFxA0b248A+xq28ZnFK0NiJMZ80wTN5/q0Y3uTMcAtxClBbddblDjNlVp1djGD4wtqTrCJmD6vLsVVQTX5lU+C3r1lynRHKNz+P04O5WhiePDRjOGbAukpCkDwL+HDtVOAxW34nZwco4ewkmNILu1vJO2t4NgR+TCW7e6blzxG/7lxhhljFOv6eGQiDYZA7tWr5KkewjsgEvL5q51q/svPHstF/LfXYXVVmWwmZp7W5lfKyfPmXMc7XVInjZN6SCH4TtIvMgu2phb1A0iRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KYzyFwB5C0QU80eAbj7j9+IxkW4oV12IB+swk3QLS90=;
 b=DFV+M1+lqOyVIzhCcA/z8kQMIsBZww2lcE8uPOn5Filz9JEcrXcICYsFGBfzIzHADApX6U+ol/Dhh7W7jE1Zi2yX8sgSN33w/xd81Wp+bptSQkT8DUF8uHYJHKjkzhhpUHYS3rn3Zkt2JRQRqvXqW82bDKHmPiiGSC7Tdy7utto=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from HE1PR0801MB2124.eurprd08.prod.outlook.com (2603:10a6:3:89::22)
 by HE1PR0802MB2219.eurprd08.prod.outlook.com (2603:10a6:3:c3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Mon, 16 Nov
 2020 11:10:27 +0000
Received: from HE1PR0801MB2124.eurprd08.prod.outlook.com
 ([fe80::c565:a7d7:a7ab:e9c4]) by HE1PR0801MB2124.eurprd08.prod.outlook.com
 ([fe80::c565:a7d7:a7ab:e9c4%10]) with mapi id 15.20.3564.028; Mon, 16 Nov
 2020 11:10:27 +0000
Subject: Re: [PATCH 2/2] monitor: increase amount of data for monitor to read
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, jcody@redhat.com, kwolf@redhat.com,
 mreitz@redhat.com, armbru@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, eblake@redhat.com, marcandre.lureau@redhat.com,
 den@openvz.org
References: <1604666522-545580-1-git-send-email-andrey.shinkevich@virtuozzo.com>
 <1604666522-545580-3-git-send-email-andrey.shinkevich@virtuozzo.com>
 <f50a09b6-06b1-499a-8aeb-abb0cc52f729@virtuozzo.com>
From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
Message-ID: <f4b24445-23f3-1b4d-823e-8b62a324495a@virtuozzo.com>
Date: Mon, 16 Nov 2020 14:10:23 +0300
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
In-Reply-To: <f50a09b6-06b1-499a-8aeb-abb0cc52f729@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-Originating-IP: [109.252.36.39]
X-ClientProxiedBy: FR2P281CA0036.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::23) To HE1PR0801MB2124.eurprd08.prod.outlook.com
 (2603:10a6:3:89::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Admins-MacBook-Pro.local (109.252.36.39) by
 FR2P281CA0036.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:14::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.15 via Frontend Transport; Mon, 16 Nov 2020 11:10:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dc81d835-495d-47a1-d0a8-08d88a2038b1
X-MS-TrafficTypeDiagnostic: HE1PR0802MB2219:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <HE1PR0802MB2219C4487E144E60A7939873F4E30@HE1PR0802MB2219.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 06RK/Kx07XxjIorQil5W00JFbPaMhZBLxUE4zC8yM4Qw0bEDT9xK/wfVkrcHy1aC5GyzonntbCjjRiq3VKQbca7Y+NINIu6yrAJLKydnhLQmFSxHLv3RicIXM4nRP79h03rm5gBKyxOFt5O2XJjI9aJesXYqgFxxPtr5/quXm3fzTDYWAAOfC7m1a2UJlFoW8vJtqko2dvzsK0xfR9uUj6F/rcCMUzXjULFc5G3VJYzMRQq3u1xkXRSp+WCMs9rubvkqvKWW/PeJgglwDAmmmYjGqBwLqeEVwyXjBXUPUKcvB2lSQptc/yPqfbEFE0Wtbz21xrWmkuxHn89OCeC1JrCjYwj/sqE5RBq8I+TMcR7SW7n/T8q+34TZRRdEh5Ba
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HE1PR0801MB2124.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(376002)(346002)(39840400004)(396003)(86362001)(53546011)(8676002)(316002)(6506007)(83380400001)(66476007)(66556008)(66946007)(31696002)(5660300002)(7416002)(478600001)(956004)(2616005)(44832011)(36756003)(186003)(6512007)(26005)(16526019)(4326008)(2906002)(8936002)(6486002)(31686004)(107886003)(52116002)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: DIJNPlmyoLHzUyw9gVTQTcApeAehIcgesIMAskk68Z7+Qz2IkQyp/ydOpfflBKatOVRCKACgQpOmT6UZXdnoVVD1H6hGzKy+kiJPmONjGGHtpsHQIQobFVuDYVjLcx00OWzTDmChGtZmKuF0e66dUyPL3Eeir3vOdzezm6WPVmTX5D0Y4kjpNCKb/ktuzRfuMVFspMVyzVcy1+1cH/iYMGZgPyhd9talnUy6aFlmMRk8XsbMEXheLDuc3ojJCSDSVikQMHtvQVP6bpXuqX5HLgGevnYj4A9mIfGhHiQVCHmas8/kKndyH6Mkdrx/bmNxtfOk7Zp+SUukCO7ghQXlBhbwFQnzjJDcf3lKYGp5clrI9M29ZB+1ilORSvxQaVGmXzBj5GBgPLvZAvy1OxKvvimCDUrJQ3nEzxW2k3eqDJmAbj96DNDoj4NDOfMagUHEXeAM0JTmfTHU5iekm4Ym6DBvg4rvMRL353NwjX8W+U9kFMCsvY2mhNjCGKp4+rz1q9tZEE6oXEJgwXWmppXPv4MA8O8zXbLwri6LYRKKAS0cOlfJDeH8HrOU67qwu+asAHFJ6eU4NXgWUUstxJ21265/psp+J+eH4qCNI02TMU+f6JGIXowbD0fbOINTIm7auvt95bpMnNS1rJkmvOovhMlL04nRfEqtRh3Ncy08/60hjoBj7bWEdm7ljv/onUwu33yHM/vGGQhHZ8MRFYqN8ttI6F9Jps77nWHMY/AJVPWc5APw6dGd+lUt2MeS0uax25NA+wadSwUl+6lsVcZN8bMwwy19yPysl26f5Jl7LybDryjO5iBO4EHP0kZz/o3em2+rBgNMVthLOtJDmmsaR8rDVNYYjynxUS8vxNTHPallSXMYNuRlWlhXm/AL3kU8hEtTQ9xcZ8QKPt8SIGaghw==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc81d835-495d-47a1-d0a8-08d88a2038b1
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0801MB2124.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2020 11:10:27.0063 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lq/31Sgj+0cYqzSt2raEvLhD1W2qicmdFpS6aVOg2g4WVd4ORn9plF8Bf5ZlnyP24w5URbwpTEgYdEAzldLiNPVMprJM6Oub4waNclnDDjc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2219
Received-SPF: pass client-ip=40.107.22.102;
 envelope-from=andrey.shinkevich@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 06:10:29
X-ACL-Warn: Detected OS   = Windows NT kernel [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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

On 09.11.2020 12:55, Vladimir Sementsov-Ogievskiy wrote:
> 06.11.2020 15:42, Andrey Shinkevich wrote:
>> QMP and HMP monitors read one byte at a time from the socket or stdin,
>> which is very inefficient. With 100+ VMs on the host, this results in
>> multiple extra system calls and CPU overuse.
>> This patch increases the amount of read data up to 4096 bytes that fits
>> the buffer size on the channel level.
>>
>> Suggested-by: Denis V. Lunev <den@openvz.org>
>> Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
>> ---
>>   chardev/char-fd.c          | 64 
>> +++++++++++++++++++++++++++++++++++++++++++++-
>>   chardev/char-socket.c      | 54 +++++++++++++++++++++++++++-----------
>>   chardev/char.c             | 40 +++++++++++++++++++++++++++++
>>   include/chardev/char.h     | 15 +++++++++++
>>   monitor/monitor.c          |  2 +-
>>   tests/qemu-iotests/247.out |  2 +-
>>   6 files changed, 159 insertions(+), 18 deletions(-)

[...]

>> +        ret = qio_channel_read(
>> +            chan, (gchar *)thl.buf, len, NULL);
>> +        if (ret == 0) {
>> +            remove_fd_in_watch(chr);
>> +            qemu_chr_be_event(chr, CHR_EVENT_CLOSED);
>> +            thl = (const JSONthrottle){0};
>> +            return FALSE;
>> +        }
>> +        if (ret < 0) {
>> +            return TRUE;
>> +        }
> 
> large code chunk is shared with fd_chr_read_hmp(). Would be not bad to 
> avoid duplication..
> 

There were two reasons to split the function:
1. Not to make the code complicated.
2. Avoid unused buffer of 4k on the stack:
    fd_chr_read_hmp() { uint8_t buf[CHR_READ_BUF_LEN];..

>> +        thl.load = ret;
>> +        thl.cursor = 0;
>> +    }
>> +
>> +    size = thl.load;
>> +    start = thl.buf + thl.cursor;
> 
> you may use uint8_t* pointer type for thl.curser and get rid of size and 
> start variables.
> 

For the 'start', yes. And I will want the 'size' anyway.

[...]

>> +int qemu_chr_end_position(const char *buf, int size, JSONthrottle *thl)
>> +{
>> +    int i;
>> +
>> +    for (i = 0; i < size; i++) {
>> +        switch (buf[i]) {
>> +        case ' ':
>> +        case '\n':
>> +        case '\r':
>> +            continue;
>> +        case '{':
>> +            thl->brace_count++;
>> +            break;
>> +        case '}':
>> +            thl->brace_count--;
>> +            break;
>> +        case '[':
>> +            thl->bracket_count++;
>> +            break;
>> +        case ']':
>> +            thl->bracket_count--;
> 
> I don't think you need to care about square brackets, as QMP queries and 
> answers are always json objects, i.e. in pair of '{' and '}'.
> 

I've kept the brackets because it is another condition to put a command 
into the requests queue (see json_message_process_token()).


Andrey

