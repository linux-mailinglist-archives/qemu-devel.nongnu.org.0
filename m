Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB2830162D
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 16:10:09 +0100 (CET)
Received: from localhost ([::1]:56272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3KYC-00006I-NG
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 10:10:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l3KX0-0007sR-UG; Sat, 23 Jan 2021 10:08:56 -0500
Received: from mail-eopbgr20128.outbound.protection.outlook.com
 ([40.107.2.128]:56025 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l3KWx-0005Uq-A3; Sat, 23 Jan 2021 10:08:53 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QeKN7nMsS+71ZVA420JxDMdHpt/gygy84MRkEjCW0GHl3rOShbtZnSSjC2ux20vPz+/vTejBYXr8xGtWTTddJTNxKugPxACSM/sYl5jlTzLiS/qwLEICao9dhVAMkNr4oRWFmXk+jY9sQqNxI+UPRjF8A70wlK3i738U7xfvp5W8/Dzg2I0+rCjMSuwbYnXr+i1mHTuGqmgcIxEBLs417pmXOhVWA1G6CrgBH8evGVUbcpxaUs/ML5aodpz2Iay3v2KKQHFHeTEgh/ngFsZ9zL99VOZYUGYnGin/0EVe+pyq0ccd0UWpv46LBA9Dqp6iclpKEwjC1HGc0yvmbxTQIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U6CIvNmjvZ+/8RwCLHLVkzokIEojvzj9xzY9YDjwP18=;
 b=jFoVAqUKxCNyghRRTy33W1u57HSKBNY7AVhUrLQweHSAWIUKwxKourVLpDjJ5vzsJHRKBW5QkCMjH+RmRcsQONHAK6SYSw8PZ2x+pyCdBUQSLX6tWjthkUBORLMEAMyUJmtAqOs3009MOVqMigOnl57oMoi0yNhIoo/Ws9ncgLx6zZkZbJjjepNaj75EH9My561i6LHMu+8sFUklxJ6vR29ZLv+bDWibN0cJ5iI0r53GbMCSLgUQhj1SAtahl8Yd56MJQLbG6kQ4/1apfJrKkpJJEonjFvgtwESOrODUWa0mNlS+o9P7k4XQCaUpDKMHsjTiknkA0xNQD0pb4ZQtOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U6CIvNmjvZ+/8RwCLHLVkzokIEojvzj9xzY9YDjwP18=;
 b=P7dCeC1HxxB+fA5ZhJclclDWs3qls0xTYPfKAtEcwhvBYn6JCh+4b9/8BKaVHFjgkPgEpc0aOF1RpNqnD7d6UH53yXEpUHM5QhQkgW4iUyrAcyhrVnWzBHFxvghVjkurjArSucTYErwD55JEdmIiT61mzcwmfQCN7Q4S/qPS0bY=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4600.eurprd08.prod.outlook.com (2603:10a6:20b:84::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Sat, 23 Jan
 2021 15:08:46 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3784.015; Sat, 23 Jan 2021
 15:08:46 +0000
Subject: Re: [PATCH v7 10/11] iotests: rewrite check into python
To: Kevin Wolf <kwolf@redhat.com>
References: <20210116134424.82867-1-vsementsov@virtuozzo.com>
 <20210116134424.82867-11-vsementsov@virtuozzo.com>
 <20210122160804.GJ15866@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <0cee83d0-c77f-b2ef-3c42-648d217ad9a7@virtuozzo.com>
Date: Sat, 23 Jan 2021 18:08:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210122160804.GJ15866@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [178.176.79.161]
X-ClientProxiedBy: AM0PR02CA0015.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::28) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.42.4] (178.176.79.161) by
 AM0PR02CA0015.eurprd02.prod.outlook.com (2603:10a6:208:3e::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.12 via Frontend Transport; Sat, 23 Jan 2021 15:08:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 187b9d9a-a285-4eac-7aee-08d8bfb0c7e3
X-MS-TrafficTypeDiagnostic: AM6PR08MB4600:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB46002A299E17BD089B90DEA8C1BF0@AM6PR08MB4600.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ddhgxd/g4SIsmCtegKyciMiFwW5NhWGZjqG7ECr6TxND8K7kseHHi4eXWx/CBWF3joVcK+knd6szGDVlDgIz+HOYn5YDAKAAg4189vMOVNbRq6TYigVrS7bgSvzEBDj0zJjtHBHTy4aXl60tnT/BPTbBzEZQ9rbD9u9hGcTMh0cWwt7NPJVNPZebWyiyVzJBJ83HoF8Am6KA4c7Y5ipPMLBbURMktG6d4O8kcFUHrJVUgbYRrjwed9q7W6vLafvfGPhE36EcbxDfIYuu8ogNlxqCVozEkvckHwhZvJlohjgUDPVDFQLj5EZwPGivXOawnm9YFz7UOFlQEEUBFccKmND3sAoQE+60MJjOCFgY5c/1s5VN7mEy9s5nXseyzTWBQdV7X80QUKVYPIlP1WTshP8brcbiFXGfquIHfjAFOTQ+aYhKBUmwoA9Y96c+0XudT4Vg+s5iIEdCt0wyNFf4euxbkVaijWxTmRdyFaRgRWI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(39840400004)(136003)(376002)(396003)(16526019)(316002)(186003)(83380400001)(26005)(66556008)(52116002)(31686004)(2616005)(8936002)(5660300002)(478600001)(36756003)(6486002)(8676002)(31696002)(2906002)(4326008)(6916009)(66476007)(86362001)(16576012)(956004)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bFAycVJIaThTWmxySXhMSFUvZmF4NEhUWGo3K1pWRjU5K2NIL2cyWFQ4MGJF?=
 =?utf-8?B?WnNOemZKckxlbmtFbmo0NnF5MnU4c0JtUUNmQlJtZnV0aHNwcW5mZTF5TlZJ?=
 =?utf-8?B?SGI4NnhEQk5zeUpzWVhTOU1OdmQwdkNLdzJvcmNlK3lieDd6QTNnR0VFK3pH?=
 =?utf-8?B?VlBYdkt0MWtxZ1RRZmNhSE5TZk9XUVM2WlZYUy9tTlVNbUNNZGFvb3lFK0FR?=
 =?utf-8?B?bEpEKzlmQldjS1NDOGl5YjU5aW5jcXRWaS9NbU5rZjBhbGNRRk1kN1MzUlN1?=
 =?utf-8?B?UjZpMXZBK09VMTdIaXZtaE0zc05jSURmMzc5R3ZsVFJ6TjgreFpoRVdpWDF1?=
 =?utf-8?B?WS9BYUdLT2pXMGRoS0tyV2ZnZTk1Q1FqYjFncUVYVFNEcFhONnBtV2U2NmY3?=
 =?utf-8?B?NmpydzE2ZEREL20waWlhZEoxS3duNkR3R0ZTQzMyb2xsZmtLN0d6c0tuSlc2?=
 =?utf-8?B?VVZYVXpLUlFPRWJ5ZU9Ba1dWUFgvL3FhKzNmbkhlbFBKWVZkNXdCZG1OVXov?=
 =?utf-8?B?VjkvcmVMTXVqL3RNVnNkbVBRekxhUHkySVdCYlVXVXFLeE52eWcxdG01ak5Y?=
 =?utf-8?B?TGRBb25IazQvSnJ6MytaM1hZMEpaN1ZVNkRtMVhHbU5VZjNqaEY2Ni85dFpX?=
 =?utf-8?B?NGNHRnJjQU9Fb2dBVmFpd3RuRnRIUEJUb2JBUlJSRGFlQVlGc3ZRbVJHY0Nt?=
 =?utf-8?B?Y3lIZmg5MzlGd29FU29Ec0JVSTIvWThETGZHeS9xbWFSWUJvWVljWTlPaW5o?=
 =?utf-8?B?aXdET05UOWFIUk1UMXByRFoxNXhnd2dMbkROdExmVDhta0pqV093WTZmdEJ2?=
 =?utf-8?B?OXJiWE1SdjhRY1JSbmtBbFc2b0ZGMW91UTRSUEdpL3FpYWVhaGpIb0MrN2RX?=
 =?utf-8?B?UUthck5uc0VKMFBkSDBhRHFJNUE2SjRWZGVtc245bGp5RVBVYVFhR01FMkQ0?=
 =?utf-8?B?WUpxUUl5R3Q2NnhoL0JvQmQ0OTlveEYwNHA0Z0dHbUlwQUhsdmdRK2JlOVZE?=
 =?utf-8?B?YTA2cyt5a3Z6THZVeTh4WjE4Qm01b3ZEUHVJcDBGSXlEenNDeVdaSDB4K1B3?=
 =?utf-8?B?cjJ2T09HVUw1S0VtUXBUcVBmQ0VBTGcrcG1CdXFUR0NUL2lzblcvK2tQM3dt?=
 =?utf-8?B?c0g4N3B2QllsVVVhVWtTWE0zZE9OdkFjc3R0bS9HZWIzSTVjdmhCNTF1aWdv?=
 =?utf-8?B?eHBhOXRwNmVlNnEwVjRZUmVoVElBV0NySWErRTFvd29vcXZGcjMxY20wREc2?=
 =?utf-8?B?VGJidUhkYlAwZHY5Q2dVRnZIK044ME1mSFRZdVk4WjVpMVlnUlVGUmIwNkZo?=
 =?utf-8?Q?fW0q89m8uvliAOgtzCGlzI8W3v2E+ENE6x?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 187b9d9a-a285-4eac-7aee-08d8bfb0c7e3
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2021 15:08:46.2564 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6TSGBQhAYpwHxuhgSX1G7ZMLx5pp4WzF/ceQ+vP4l8/AY8GVXu4TsGAdkkqTOxo4Ma66zgDDNuzi+w2OAERY6Y0xw0Eux1IBzQP8s5FoeYU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4600
Received-SPF: pass client-ip=40.107.2.128;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-VE1-obe.outbound.protection.outlook.com
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
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

22.01.2021 19:08, Kevin Wolf wrote:
> Am 16.01.2021 um 14:44 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> Just use classes introduced in previous three commits. Behavior
>> difference is described in these three commits.
>>
>> Drop group file, as it becomes unused.
>>
>> Drop common.env: now check is in python, and for tests we use same
>> python interpreter that runs the check itself. Use build environment
>> PYTHON in check-block instead, to keep "make check" use the same
>> python.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> 
>> diff --git a/tests/check-block.sh b/tests/check-block.sh
>> index fb4c1baae9..26eb1c0a9b 100755
>> --- a/tests/check-block.sh
>> +++ b/tests/check-block.sh
>> @@ -69,7 +69,7 @@ export QEMU_CHECK_BLOCK_AUTO=1
>>   
>>   ret=0
>>   for fmt in $format_list ; do
>> -    ./check -makecheck -$fmt $group || ret=1
>> +    ${PYTHON} ./check -makecheck -$fmt $group || ret=1
>>   done
> 
> When I add an echo to print that command line, it seems that ${PYTHON}
> is empty for me. Is this expected?

It seems to be defined defined when called from make check. Did you just call check-block directly?

It's not intentional, but I think it's OK: if PYTHON is not defined let's just execute check as self-executable. And for make-check PYTHON is defined and correct python is used.

> 
>>   exit $ret
>> diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
>> index 952762d5ed..914321806a 100755
>> --- a/tests/qemu-iotests/check
>> +++ b/tests/qemu-iotests/check

[..]

>> -            if [ -x "$binary" ]
>> -            then
>> -                export QEMU_PROG="$build_root/$binary"
>> -                break
>> -            fi
>> -        done
>> -        popd > /dev/null
>> -        [ "$QEMU_PROG" = "" ] && _init_error "qemu not found"
>> -    fi
> 
> I think this else branch is kind of important (if there is no system
> emulator binary for the host architecture, find _any_ system emulator
> binary that was built). I can't find its equivalent in the new code.

Hmm, I decided testing "first found" emulator is strange.. It seems like we have several emulators and user don't care which would be tested?

Probably we should instead used qemu-system-* binary only if there is only one matching binary. And fail if there are many.



-- 
Best regards,
Vladimir

