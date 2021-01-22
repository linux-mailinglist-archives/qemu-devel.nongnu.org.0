Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C25300122
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 12:06:15 +0100 (CET)
Received: from localhost ([::1]:42430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2uGc-0003uD-QI
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 06:06:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l2uFX-0003Mi-JW; Fri, 22 Jan 2021 06:05:07 -0500
Received: from mail-eopbgr40109.outbound.protection.outlook.com
 ([40.107.4.109]:30722 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l2uFT-0006NH-12; Fri, 22 Jan 2021 06:05:06 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z48TQW2D9Wh18qay26gZWLRgO6+zJW9D1o8HmO/7WQVIMj96ESBgQoVdkYgred5W+xt60u96735RHOJK4p6IKwv6dIo2T0eS7MSiuO5bqq1LZJTFmfvTvRyC5fpXX/PqFKQPnFw91RAU+rYCCtEOUHy39k8VJTGrUwL6pQGdHfZH4HVfWYmvnroS7qN6aBEIMWG7UIlxGmlR3tInF3Y4Gy8huCFX8QwyueDddo9wb2/tcGZQ5+THq8jtKCuLTwmBIypkQ4CbsDBDFwfN7I5CnKfZ2c7ihT8pHGz1aOmCVSxxKPFC4yunnniScil/d0Pd6UHZtXJ0g8yZjpFwjoe/vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xth32pTD9VBRuyBXzWet1KSneyWFhMd+EBSflF8YWLM=;
 b=doNihxyf0TVBLv1W5vs+wjO3re+sSh3o0Lyvt8zXa0404Mqoknto1gkDqtaoTzuPDQWTBdSHQUI2b7bFHrwWUhbC4u+vcrtKAgloSyLz+fdlrVYEYGJEqLlUVUZQn5ZcRrhZP64tJIiInaLFW921PsbyRmuxOy5ghMIMjEtk5wuFxD2Yuz2rEEaMLrv8nlCdjRHBTFwbhWiQt87OtuDW9oofpMiIUYdA+28K++WR5dkiYr82qVY/1dQ5kMgJRHxOMDa05MFIflhP5FsUZMtT90viittuSb5kDPgx5x4eaUM5iqrUoEc1/S/ockKvttzB5KsFU88/PVKosDrfyFIN4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xth32pTD9VBRuyBXzWet1KSneyWFhMd+EBSflF8YWLM=;
 b=NDuV/rm2MZ+XFm7Lxlf8ncig+WdKuycW/+eIky1BWj4DqpGeIHDSxs4rHw0JhS6XQ35+fcTl/Q06WBPsUMfHflGy1Vy5F42gfIUTgmw89x4wSEA3i8YhCjD745a0KWFkrGGCMH388zE7SQl7lTHl4OmQb7HFfqSsHLDFkrrC0vA=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com (2603:10a6:803:137::19)
 by VI1PR08MB3472.eurprd08.prod.outlook.com (2603:10a6:803:80::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Fri, 22 Jan
 2021 11:04:58 +0000
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::44c9:5ac7:5302:7179]) by VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::44c9:5ac7:5302:7179%5]) with mapi id 15.20.3784.013; Fri, 22 Jan 2021
 11:04:58 +0000
Subject: Re: [PATCH v2 06/36] block: BdrvChildClass: add
 .get_parent_aio_context handler
To: Kevin Wolf <kwolf@redhat.com>
References: <20201127144522.29991-1-vsementsov@virtuozzo.com>
 <20201127144522.29991-7-vsementsov@virtuozzo.com>
 <20210118151336.GG11555@merkur.fritz.box>
 <9b7e051b-3a8b-f7cd-dc55-ee24add46677@virtuozzo.com>
 <20210119163805.GI5012@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <fb41291e-45c3-31d6-3f56-5ef5c42feaf3@virtuozzo.com>
Date: Fri, 22 Jan 2021 14:04:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210119163805.GI5012@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.101]
X-ClientProxiedBy: AM3PR07CA0115.eurprd07.prod.outlook.com
 (2603:10a6:207:7::25) To VI1PR08MB5503.eurprd08.prod.outlook.com
 (2603:10a6:803:137::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.101) by
 AM3PR07CA0115.eurprd07.prod.outlook.com (2603:10a6:207:7::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.6 via Frontend Transport; Fri, 22 Jan 2021 11:04:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bbfa25cc-5611-469e-7cd3-08d8bec58e50
X-MS-TrafficTypeDiagnostic: VI1PR08MB3472:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB3472B84A0B6BEC101A438CCFC1A00@VI1PR08MB3472.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sC1VOz7y6PnnIoKqtfcwuw6i+DOghzHlwRbtLclAEKQOkp6GjpviAhEL1R9JXA5Eof/t80gVqTFXv0/PMHEDqWIOEl5uKQR6I12fUXO/BdY9kmbuBR/RrHnoXJJ+865Q/3/OvkXJTPA68u+6krB3MMh5+saDjSGhdCTnswcqEdDfkbXZASCpoT2JC0ozjs1mUZpXemKogx4oHJ2eUqrbzt1wKNlnWjFFV8c3uQT92O3Jxdcu2uupwAD3CD5MCv61skMnUJQXn13NWZipgZs2KKC/wq7dR/yB0P+6y0c7lqe6lpyAHeAvDhhDUA0MIxeqKQFI+TXtLqumClIdoUVVITTcY6lfvAjHNQ5HU48G8ugzIWMJ1uXMPHn/fTkMPp5kV9o7cjWBby9PD7VT4WUFEEp0MIlvFv1HqYJ+ALsGzIP7a0hLUNmWnrT9t1H2eubqa57oJE1SO5xnRKtQUJnNAAMiF2f+vJQIVRq8bpTc5kycCqBD9owDoYj/KPamCHxu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR08MB5503.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(39840400004)(396003)(366004)(66556008)(66476007)(66946007)(478600001)(5660300002)(2616005)(16576012)(4326008)(316002)(956004)(107886003)(16526019)(31696002)(36756003)(86362001)(6486002)(26005)(186003)(6916009)(52116002)(83380400001)(2906002)(8936002)(31686004)(8676002)(142923001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZW1IWkFUTGlWdjRZdEppeDdZbXFKNEVSNkdxN0xaRHNIVzhJK0tQcVQxeXQw?=
 =?utf-8?B?WXVyZm9PUEN0UmZYaHEzRmhjU1lBZkdWZFJsdWhMM0VkamRablVUbUU1amNX?=
 =?utf-8?B?b0FNRTFZQ25QRVVWNm05VWhsT2Qva1AyM2ZIZDdDdktCbDNlYlB1YWNTVXJn?=
 =?utf-8?B?bW8rNmswZXMzRUFaSFNJRnlTTWphdDVLczV0TUNrdDZxRE5IbUxpWjloYUVh?=
 =?utf-8?B?YlB3VVNrNTlySlA5ekI2L09ocUo5QjFRTkk0RktNa2tFUHhpSENJck9qaTE1?=
 =?utf-8?B?K2NzeVB5V0U5bzNrUmhPUjh5QU9ncGw5dXNWa1NMclUrT0dlK1RJclZ3S0pR?=
 =?utf-8?B?a2dFU2VZTTJRY0RXQ1cvOFR4Y1JLNkYwZGg1MHRNWjVPdzNESjhtN2llMnBr?=
 =?utf-8?B?MXFkSXVqOTdqYm9zRWtEQ2pjdGw3MWtmc2Z4RmE5WXlyS1NkeTFZVEJMb1hl?=
 =?utf-8?B?Qkt3eHdDWTBydFVFTW4vN3lrbEpzRU9tOXhmaTVvdndiQzdQaVoraGhzc2N4?=
 =?utf-8?B?K2hSaFA2RG54ZWdDa0JKNmxjZDNXaC9JOGJTRmEvb0VSK1BIQURTV2xXeGhl?=
 =?utf-8?B?YWR1alZYSXR5NndLZWwwck5XVjlacXJkbXJzeWg4ZTgxTHRLeHdSOW1uV1c2?=
 =?utf-8?B?aUdVUGhBSHlYbkF3UmMycytxYnZIcEw1ZDQvZitZNHhYTzhLKzJlN3lERlJy?=
 =?utf-8?B?S0Q3TFZpcVU0a0ZycXFEOUJKbFFaUVBVajRvOFZEdkJQT2JRcUdPVWlEdzE4?=
 =?utf-8?B?NFlrckIxYjR1NHVKdFZQdHJ1QjNHL3gwdEtIdUhveEJvRThNV3ZnWkNoeUJ2?=
 =?utf-8?B?V2JNNXpnTjhvTzlZT3JDRTlKQVNYSlhYR0lIcVFWcStBN3g3bW9Oa2syS0Ey?=
 =?utf-8?B?a1lLK1JSTWwzc2VwQ0hWYWVvWEd5bm9vOElQZGNTRjF5SkM1UER5NDVhZmk1?=
 =?utf-8?B?MEZuNmNsMDJ4ZWRIazE0VGVOWFBhYkx1TmhwL0ErZW5XVUF2am9STDBLYUkx?=
 =?utf-8?B?dG9YVGU3NDdNRGwxdUxnQ0REanVyZmN3bVhJRDlkTXlLNXdSRTlVL1c4NHBL?=
 =?utf-8?B?Z3hBeWozOU82TDZBUkpqbVhoaTh4M2Z3allkZXZGN0VCY1AvaHo0Q2UzWFBT?=
 =?utf-8?B?R0Zud3hsaW9NSWpjYXFsRlAxR29QN01GMjJTcHR6cHJDS0x0bkFWWndTcVFU?=
 =?utf-8?B?aHloNG5uUms1bnhmRzF6RWV3K2RTOVo0RWJvY1cvbzBlQmRIM2o0aG9DUUZJ?=
 =?utf-8?B?dmpLaWU1YlBnU2EvbDlBZzU2RzQ4d0tBT3I1M1U0ZEwvMzJKdGVVQUJBRWc2?=
 =?utf-8?B?aHEvLytwT3YrOU5WVHJSaXpTNzJIeHpLSzFocWRDY0IwVThNaDA2MU5zMVlr?=
 =?utf-8?B?aTJKeUZGYVZNdjRPV2tpdTA4ZEpOdjFXQXNiMEhvRUVnNUZ3MUM5Z21Qcndz?=
 =?utf-8?B?RzdrZFNaeTg2cFl4K1J6MGd1MldwSGxiY1EzRGp3PT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbfa25cc-5611-469e-7cd3-08d8bec58e50
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB5503.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2021 11:04:57.9882 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6930uNwvlu7H3AqGVoObbsj+/xWIZqxIAwVXeGMr4b7KZMROpSSd7dSTZE0rgxBH1Lv8QDaD0B10BjfjYj5UdHdvqcOExgKlIDni1pPvHW8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3472
Received-SPF: pass client-ip=40.107.4.109;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
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
Cc: qemu-block@nongnu.org, armbru@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

19.01.2021 19:38, Kevin Wolf wrote:
> Am 18.01.2021 um 18:36 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> 18.01.2021 18:13, Kevin Wolf wrote:
>>> Am 27.11.2020 um 15:44 hat Vladimir Sementsov-Ogievskiy geschrieben:
>>>> Add new handler to get aio context and implement it in all child
>>>> classes. Add corresponding public interface to be used soon.
>>>>
>>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>>
>>> Hm, are you going to introduce cases where parent and child context
>>> don't match, or why is this a useful function?
>>>
>>> Even if so, I feel it shouldn't be any of the child's business what
>>> AioContext the parent uses.
>>>
>>> Well, maybe the rest of the series will answer this.
>>
>> It's for the following patch, to not pass parent (as opaque) with it's
>> class, and with its ctx in separate. Just to simplify the interface of
>> the function, we are going to work with a lot.
> 
> In a way, the result is nicer because we already assume that ctx is the
> parent context when we move things to different AioContexts. So it's
> more consistent to just directly take it from the parent.
> 
> At the same time, it also complicates things a bit because now we need a
> defined state in the middle of an operation that adds, removes or
> replaces a child.
> 
> I guess I still to make more progress in the review of this series until
> I see how you're using the interface.
> 
>> Hm. I'll take this opportunity to say, that the terminology that calls
>> graph edge "BdrvChild" always leads to the mess between parents and
>> children.. "child_class" is a class of parent.. list of parents is
>> list of children... It all would be a lot simpler to understand if
>> BdrvChild was BdrvEdge or something like this.
> 
> Yeah, that would probably be clearer now that we actually use it to
> work with both ends of the edge. And BdrvNode instead of
> BlockDriverState, I guess.

Do you think, we can just rename them? Or it would be too painful for developers,
who get used to current names? I can make patches


-- 
Best regards,
Vladimir

