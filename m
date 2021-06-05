Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EC739CAB7
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Jun 2021 21:20:32 +0200 (CEST)
Received: from localhost ([::1]:54398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpbqR-0007Fb-CT
	for lists+qemu-devel@lfdr.de; Sat, 05 Jun 2021 15:20:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lpbpO-0006W0-CS; Sat, 05 Jun 2021 15:19:26 -0400
Received: from mail-eopbgr70107.outbound.protection.outlook.com
 ([40.107.7.107]:36430 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lpbpK-0001iN-GI; Sat, 05 Jun 2021 15:19:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iXv7ub6rzIjKwgnGH6UVlL8uOUZKW1dNyD7eRBs+9ncYVyGY9FVn6Xs9jRlO5yGuhe0TEN8OhNmG4ZUgCQ9CwTEUKqBd2TjlevRYid5P/i5YdDsBaTA3FE7iVwmY63Y82xnrowN5QFb2XIINeazLxUL0/1GNN1M40wG/+aJTArrPP0IcP0rc2NFzf/CuM8exD8KHk2YxrlO9g1SAjhPNwaYrUB6bgjzDJWTxUGiECy8gdrwOPOA39uDcyk9M7UKMwMLARRTwCOwUmQnZZav1ozEL4IJ7kUEaVrm2mueHD9xG/gEYbTxjCB6o4g2jYdTfInwQQRGj/9o9SAib5EeCSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fi+KIKeuKJpXHS8SF/LEArsdFjU9o9zJyLCQ4P59TOI=;
 b=dsMa5QyqtqGvDCFUGpAmj5q0kxGSjJrro6T39U4oDOeNQq5m1XU5Ji4ciPaaCYhf6iDakhLVyHeLWF34cD6fzZ4pAiJ6YkL4rL1od9WdH1liGV2L3ymssdP3Z0+W+xZcKycWfnhABSTPa2ZQ7qLBIprJUB8QoEtakY+yVCED2movi5ZUPv4BowI5fx+2DjX2rNsbrp+X3l9SpAicj4/+5pLr0BmwGKr9NJJ6f9ZCEXNQsGlS6ISbNmutU+slX9wnXyhj2EkPNdUXoxvjZsFf7t2WQNqK5PltkG9Q0ia2CT/M0d4vnMsTzT4c9faIKTUN2Td6L4n85YMdYqY/gYp7Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fi+KIKeuKJpXHS8SF/LEArsdFjU9o9zJyLCQ4P59TOI=;
 b=P717/BBbrV6rzqKmXoIU3J/XOtVh0AgfVHJgHEzy+7z6GFohhtQSmXFHALyxMC5eNiKukYbcZBvy3hG1UZLTEIu1HLQ2zLlvq+XabdLVxT6mPHtsH4ekjLu8gOMOk2D8PvptX9MjAlBP2tN40lCulONAD43DLdLIAJVgXV/iX/o=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6945.eurprd08.prod.outlook.com (2603:10a6:20b:344::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22; Sat, 5 Jun
 2021 19:19:18 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.029; Sat, 5 Jun 2021
 19:19:18 +0000
Subject: Re: [PATCH v5 10/16] qemu-iotests: extend the check script to prepare
 supporting valgrind for python tests
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
References: <20210604091723.13419-1-eesposit@redhat.com>
 <20210604091723.13419-11-eesposit@redhat.com>
 <de6439dc-c20f-f138-496f-5bc4ca5d8f97@virtuozzo.com>
 <4fec3474-e3e0-6f7d-eec8-bef25738ef2e@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <3d53d144-dca3-ccf8-ecf7-79103f39eb81@virtuozzo.com>
Date: Sat, 5 Jun 2021 22:19:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <4fec3474-e3e0-6f7d-eec8-bef25738ef2e@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.208]
X-ClientProxiedBy: AM4PR0302CA0003.eurprd03.prod.outlook.com
 (2603:10a6:205:2::16) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.208) by
 AM4PR0302CA0003.eurprd03.prod.outlook.com (2603:10a6:205:2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.15 via Frontend
 Transport; Sat, 5 Jun 2021 19:19:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 88c4da96-45ff-4fb4-25aa-08d92856d093
X-MS-TrafficTypeDiagnostic: AS8PR08MB6945:
X-Microsoft-Antispam-PRVS: <AS8PR08MB6945ADBA6BEF66C604A777A6C13A9@AS8PR08MB6945.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BfsSE+Zy8Ae2pJx3ZrGTThIN8TRpXHJR7LjWnjrHTy12xdWHUta214gw7hrvXIAJ0TeNn3I19Dvofud+ax68g/OD3rj1VArHD2xJJMIuqqy3qwTSbDEUnZb35eggKBO/p85SxQ+2fg5RjfkCg1qygIVPmmXzrFxe+eVE2A29UNrKgD66lKGe8bTjYobAo9o4nYQL4+NBYu+qOA3vhDjoGDN3aVy8/bXDwEvIQKsUm0H4VxSS3FhbmwNrwyq9dNKx96TpHz0BQxOwfKgZN3r5P/GU8EtZNqaWDmNJQf8gyMMyk358miY75pZ+E+jn0fDP9OEL2vcL/W6Tzfq0UPI9DATPbHZlNeKVy51PdKtJfqXcBsRVMJkv5hntmZaFMoAmAos4OmfI4uK7nLXvUTb2FbbyD2gluFsXjee6y1pngKRSZKck3bdRMOyIcmRyhbjhZqWdAAM6aE0swqCsP91tyN4CL7hkMbt2Q5jBhP9NMzr6eBPzZZeGTzdIFD1OovIWX1p+DW6OsH5s+2dsoUnkVuepkqsu9N17kYeINTakZAWDPsnLX98cAkdO477WIyGZtcrG6IPoIWTMO9+R/fBRGnXEuMMk3ToiHXppk17aepzrbGz80bEFzAfkkk0WucTPDHF1+EZxqB1jE2hFXIrotMQOcuxV4mb22Wt/89Lg7/NCWVPWKcy9TTHigh4SYHBZ9+Zafzd2xZnHL3KBC9puDaMclFg+Btpk11FWRU1x+1GvpitA4Xf5XatwGhGHozbj+5oEmK4iPJR2+m4cZHayBnrJJKDeVv259iK8tvby4gpLBFvI1u1qpX3xwHnn5t/4SUMIsZ/UN9it3UbPWHUhew==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39840400004)(346002)(136003)(396003)(366004)(66476007)(26005)(66556008)(2906002)(966005)(36756003)(16526019)(956004)(53546011)(186003)(8676002)(38350700002)(66946007)(478600001)(8936002)(86362001)(38100700002)(31686004)(6486002)(2616005)(316002)(52116002)(5660300002)(54906003)(83380400001)(31696002)(4326008)(16576012)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZXRMeHdqOG5GYlNCalB3eXRnMDNQeG5LK2dldzNQQzh2MGhBMzd2NFFkMm53?=
 =?utf-8?B?Mnk2dlhhZ1JYNVp4SE1aT214cktCSmI3bXJKVW8rd1Z4NmpTWU1jc1VQNFli?=
 =?utf-8?B?YXNKM29OaTZad2poTTRzQlYzb0FweTNicC9GSEJaNXdza2lTeXpnSXlpMUVD?=
 =?utf-8?B?QSt0c3hSY0dIVFJxeSthL05ORGhYY3hmWTU2SXpPQlpzUVkwS0Q2Vnc1U2o3?=
 =?utf-8?B?NTN6c1V2aEpNN2h6LzBwYkprTmMrRzJCQUJjRWV5a2kxUGNTUEgwcG83OUpJ?=
 =?utf-8?B?YTdOSm95eVlWSUt6MjVKTTMxT1lvelpTMjdkeWNoOE9JekhWc29CYUtULzVv?=
 =?utf-8?B?VE0ySit4VU9udWs0MVE5aXV1cm1VWUhSWDVQd1NDTy9reFZjbnJBR3Q2WE1y?=
 =?utf-8?B?MTVKdWFaelIwZ0tPNnAvazJsK1ZYSkhPSS9ER0ZHSDdOL01jaGpYZ1N6MVdJ?=
 =?utf-8?B?dDVQRmVYNUlOdVZma3ZmVGxkM0FRY0NTRU1YZzNaK1FJcW9HR2s1MjFFMjA0?=
 =?utf-8?B?SWdUS2RURUt4S1ludXdzL3E3WjBEcFZUU1ArTWo4M0xKRmZRTFZiSm5CMXY2?=
 =?utf-8?B?N1hyRkQvdFRDdzVpMlE2NFRKdkZZTzRmVDdaaTVzQ0dWYy85MXM1RHRjUTJ3?=
 =?utf-8?B?RmhxQVZXR0I1a1FoZTQ0ZzRWQ294NEJWZlI2d0VobmdxYkc0RVY1dUY0dWtu?=
 =?utf-8?B?YmlkaXQrRWp6WkhDT0N2eDVCb0Mwb1c3QmU1QXRLTGdCQ2RWYnpiRzYyazZj?=
 =?utf-8?B?dHd0MTVPMGxVaVRYUjRLSHdJOUFtVFpHeUR2SElHV0NjRWlBZnBqUWVPYU1u?=
 =?utf-8?B?SXVZOWZ6bXFuU09yUStqbndDRDBqYUJlNFJpUlA0Ly8xa0xvbjRjekRJRldI?=
 =?utf-8?B?V01CaVk0SnVGU1pERkpWRThHT3VYbkxqT3ZGcTFyWFZ1WkJuUkdIbnFmRjgv?=
 =?utf-8?B?RGZZZUdONm5meUt2SXRvWWZUb095ZHN0cSt6Y3E1TzlxQlhuTk44WFVMalRG?=
 =?utf-8?B?MmwyK0pIeHI3b3RsZ0FSalBMZGpmRGV3VHN2NFlyQWdQbWM3RzJzQW5JNGV5?=
 =?utf-8?B?ZWdTRTFWaFNEQWhXK0V1L09Fa3E4Um1iU3JaZHJyVlhVNEc1R0dLTGZJSU9u?=
 =?utf-8?B?WXZEbFk4dUF2cEllZzNMKzk2S1NFMXhRZmQ5Q1piMnJxL3NDWUdHYkZjSWRI?=
 =?utf-8?B?TWsyY3VsN3RsVm5vaGdhN3N2OFN4SjZ1cFBxbTJzKzNnNzdYWXBHUGpoZDQ2?=
 =?utf-8?B?Ri9QcEJyRWtYMnFhZGZxQUg3QWRHMm5IdTA1YllONnlhMlZ2a2NkYk9JNDRl?=
 =?utf-8?B?eTgxQ0hvdTJiVGpidzIrbXJBZlc0eFQ1SXYvaS9LL1JKbnZGT04vMmZsL2w5?=
 =?utf-8?B?YTc5a0x0SFcvQ2JqMzErQ0RHcXd6R1VUeW1ma2hNNjdsZm1ZdkVNMURKRFQ0?=
 =?utf-8?B?YTdZMjZiRzU5bEJzenJKNDVmMU9OK0FTZFRVblZxR1h4ZlpiWHR5aVYxWUFz?=
 =?utf-8?B?NGhMU1BiVzVYdmRLRzFrVUxYSkd1M2F3eERBU0VTeEFFclpzT1o4YXRvVnBl?=
 =?utf-8?B?TEJKUTBRZjY0a21QOG9nTUZyazUySkVRY3REZGhoNmluczIwaTRUUTg5aU1L?=
 =?utf-8?B?K1lIc1ROTHJhV1YreWxvR2I5L2xVQ2tORUlETGVpVUZ3WDNyVHpSSXdJMGlq?=
 =?utf-8?B?SThCcVpZb2NIM3c5WXJvLy85M2FvOEgzYlZYV0RxZ1RxaE9wNlpvTFY5NFpF?=
 =?utf-8?Q?kIDAtEVUp0iB63rrTNTVJ7XhbyuyXLBMvdTVpLu?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88c4da96-45ff-4fb4-25aa-08d92856d093
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2021 19:19:18.2423 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XImLyTv+7FCOs9KNI3dXoxdWX4BxmXJS87+zKwZQilumKeLV1uBSJRupDtGn9/cOCI15Q7tiCZQJzLUlU9bthE5sn8s8zSsTb7cvzzNfwqY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6945
Received-SPF: pass client-ip=40.107.7.107;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.59, RCVD_IN_DNSWL_NONE=-0.0001,
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

05.06.2021 20:38, Emanuele Giuseppe Esposito wrote:
> 
> 
> On 05/06/2021 15:28, Vladimir Sementsov-Ogievskiy wrote:
>> 04.06.2021 12:17, Emanuele Giuseppe Esposito wrote:
>>> Currently, the check script only parses the option and sets the
>>> VALGRIND_QEMU environmental variable to "y".
>>> Add another local python variable that prepares the command line,
>>> identical to the one provided in the test scripts.
>>>
>>> Because the python script does not know in advance the valgrind
>>> PID to assign to the log file name, use the "%p" flag in valgrind
>>> log file name that automatically puts the process PID at runtime.
>>>
>>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>>> Reviewed-by: Max Reitz <mreitz@redhat.com>
>>> ---
>>>   tests/qemu-iotests/check      |  7 ++++---
>>>   tests/qemu-iotests/iotests.py | 11 +++++++++++
>>>   tests/qemu-iotests/testenv.py |  1 +
>>>   3 files changed, 16 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
>>> index 1dba4218c0..e6aa110715 100755
>>> --- a/tests/qemu-iotests/check
>>> +++ b/tests/qemu-iotests/check
>>> @@ -39,6 +39,10 @@ def make_argparser() -> argparse.ArgumentParser:
>>>       p.add_argument('--gdb', action='store_true',
>>>                      help="start gdbserver with $GDB_OPTIONS options \
>>>                           ('localhost:12345' if $GDB_OPTIONS is empty)")
>>> +    p.add_argument('--valgrind', action='store_true',
>>> +                    help='use valgrind, sets VALGRIND_QEMU environment '
>>> +                    'variable')
>>> +
>>>       p.add_argument('--misalign', action='store_true',
>>>                      help='misalign memory allocations')
>>>       p.add_argument('--color', choices=['on', 'off', 'auto'],
>>> @@ -88,9 +92,6 @@ def make_argparser() -> argparse.ArgumentParser:
>>>       g_bash.add_argument('-o', dest='imgopts',
>>>                           help='options to pass to qemu-img create/convert, '
>>>                           'sets IMGOPTS environment variable')
>>> -    g_bash.add_argument('--valgrind', action='store_true',
>>> -                        help='use valgrind, sets VALGRIND_QEMU environment '
>>> -                        'variable')
>>>       g_sel = p.add_argument_group('test selecting options',
>>>                                    'The following options specify test set '
>>> diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
>>> index c547e8c07b..3fa1bd0ab5 100644
>>> --- a/tests/qemu-iotests/iotests.py
>>> +++ b/tests/qemu-iotests/iotests.py
>>> @@ -96,6 +96,17 @@
>>>       sys.stderr.write('Please run this test via the "check" script\n')
>>>       sys.exit(os.EX_USAGE)
>>> +qemu_valgrind = []
>>> +if os.environ.get('VALGRIND_QEMU') == "y" and \
>>> +    os.environ.get('NO_VALGRIND') != "y":
>>
>> Hmm, interesting, why do you need additional NO_VALGRIND variable
> 
> To maintain consistency with the bash tests, where we have:
> 
> # Valgrind bug #409141 https://bugs.kde.org/show_bug.cgi?id=409141
> # Until valgrind 3.16+ is ubiquitous, we must work around a hang in
> # valgrind when issuing sigkill. Disable valgrind for this invocation.
> _NO_VALGRIND()
> {
>      NO_VALGRIND="y" "$@"
> }
> 

A, hm, I see it in bash tests. So, it's intended to not set by user but by test.. But I doubt that python test will want to set environment variable to disable valgrind. Most probably they will want to set some valgrind_supported=False near supported_fmts=['qcow2']. So, we'll need valgrind_supported argument for execute_setup_common. But no reason to implement it until we don't need.

> 
>>
>>> +    valgrind_logfile = "--log-file=" + test_dir
>>> +    # %p allows to put the valgrind process PID, since
>>> +    # we don't know it a priori (subprocess.Popen is
>>> +    # not yet invoked)
>>> +    valgrind_logfile += "/%p.valgrind"
>>> +
>>> +    qemu_valgrind = ['valgrind', valgrind_logfile, '--error-exitcode=99']
>>> +
>>>   socket_scm_helper = os.environ.get('SOCKET_SCM_HELPER', 'socket_scm_helper')
>>>   luks_default_secret_object = 'secret,id=keysec0,data=' + \
>>> diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
>>> index 8501c6caf5..8bf154376f 100644
>>> --- a/tests/qemu-iotests/testenv.py
>>> +++ b/tests/qemu-iotests/testenv.py
>>> @@ -298,6 +298,7 @@ def print_env(self) -> None:
>>>   SOCK_DIR      -- {SOCK_DIR}
>>>   SOCKET_SCM_HELPER -- {SOCKET_SCM_HELPER}
>>>   GDB_OPTIONS   -- {GDB_OPTIONS}
>>> +VALGRIND_QEMU -- {VALGRIND_QEMU}
>>>   """
>>>           args = collections.defaultdict(str, self.get_env())
>>>
>>
>>
>>
>> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>
> 


-- 
Best regards,
Vladimir

