Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1EE4A5AE8
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 12:09:57 +0100 (CET)
Received: from localhost ([::1]:52826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEr2q-0008L5-4X
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 06:09:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nEqte-0000GG-H1
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 06:00:26 -0500
Received: from [2a01:111:f400:fe06::70d] (port=48390
 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nEqtY-0001NI-Py
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 06:00:24 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dd+BspD4vRKwvQM7X6HmzWWsS8iRpEomgdn4XdqiQVpUqXhCDRB69s0bjzUXMpGnRWqMtkU1E141sxnPzik7DgWrp+VZdcZK7q4N7tPszl/I3xPFeNG1D68QkEgkFRSKxYu/U2oWrGCxF0Bs+7qg7gGns5vYZEbdSyI1rv++THQsjpvJUPk3Fs1kJ/7wnEwliLh13DDGMOuXXVobsn0mKDadAhri+fFMa8MU9VG1iKCnvft3XQFRO51gJeGUjIYFuownHvJC7p5Sj9ZgPfK5tnaU4odzv28Zst7RXB1g+T+31kmK6dc06voGCn3nM0jRSyJ2ZChTkytN2469IE6gKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7uGfWmO9ZTbV66D0S8VNyblrj/Yd2ZR0pyMgU+eLCQI=;
 b=H9zeFtRCJzVKLNQMcWjEFRmqd/9ombFbB8IRYqRpa0Tn6feCnZM9Kb8BGfUTL+Je7098a8E0XQo7Lkd36XQ2eVJ38fhCBVbtLnFFy9t/FgyXSOoHxazia12h42CJ4GbD1u2UFzyKQJ0Yom9vlRs/f6gGdY+8AEZBv27bmb0laIiSG//QhyECQ1kopxsCtjRWjAExF2GLHFaYgu/L1MZabyC/egYEIU8IvfCguuQtEBMzpp1Ppbf8DE6DJpt52D95gKIejFH8xZcDb9fsveG5rbJdg9CPvGn77VtGtyfb7ie+CQtxTSgdEJmIRy9myB2ZjlhKTwO2J66d5OZflaRI1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7uGfWmO9ZTbV66D0S8VNyblrj/Yd2ZR0pyMgU+eLCQI=;
 b=SrKcAozlx3Ecief9iszL+47Ch4UwjCO0oI9ka8mkaXnpJXlL54AF+ZzmqWzn7udTZHVZ4g/2PDw1PWo1gfxSLK1BrbCg87qESYevwpg8mzDonutouKodeKdR8Sd4tOU8J08u7gSnJQs7q6Ub89BVVj+YUF5A/k9MY6KflxaIlvo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by VI1PR08MB5392.eurprd08.prod.outlook.com (2603:10a6:803:131::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Tue, 1 Feb
 2022 11:00:15 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%3]) with mapi id 15.20.4930.022; Tue, 1 Feb 2022
 11:00:15 +0000
Message-ID: <5c3deb35-6128-dc1d-b1cf-749257abafdd@virtuozzo.com>
Date: Tue, 1 Feb 2022 14:00:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] block: bdrv_set_backing_hd(): use drained section
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, hreitz@redhat.com, den@openvz.org
References: <20220124173741.2984056-1-vsementsov@virtuozzo.com>
 <8689ce30-7021-5d5d-861f-1d759e8acf46@redhat.com>
 <4aa42545-e0da-2a15-110e-3d7b2d8cd273@virtuozzo.com>
 <YfKobj+ZpzIxLasz@redhat.com>
 <196093af-80e8-20c0-3d73-4af642644af7@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <196093af-80e8-20c0-3d73-4af642644af7@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0065.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::20) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7e866ee0-3592-4c2e-aefe-08d9e572066d
X-MS-TrafficTypeDiagnostic: VI1PR08MB5392:EE_
X-Microsoft-Antispam-PRVS: <VI1PR08MB5392092C85056D390DEE312EC1269@VI1PR08MB5392.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +XLhKTpX55rpNHBepl6cFEb5iT4tiVMz8d8JHyv9tZ57nA3BlI/K3sPjH+I1AwmQxFjg4pET8zxCroGEg2m6dtW0nKKY+RSEisRl54bMzeFntTaZ5N51x2yYeWUCk5+0eYxOR1cPeXTNBMOBcLj0tOPPsM/S0YbSaA70AaXOOYqaTkENNIQNXbwy9Yi4OKDPPh67jFZUmgNj1VSvAGYe0s/XJd29DyvkvhAQ9F12N84dUfbh0W9rgewT9LVWe9D20hCWVtc8nh/oQGuwryXfoq3yEml+3vudwdSJCbRVRt8GDmHx7N7/LTL7hwZX/ZySWF0NiEVA/YB33K9PIlKqQxxCkVoKUBmC6yMLNtY4o4axq9yFLLwDAmu2iLw5R3/3DIOlWVFfy8tHjwsAhgiGhN40sM7Jg+OLzXdkeMhe5EByafyi1FlM/BwrzH2mwalq8IMkFkzsLJcYrKAr1pY9HaFkvR0JSiENh/Iqm8n8vmckKmMBvWQYcz11vgzheZXnrrMmwkDHFg7l50E55QzX2UideBBHbzcIqcbRCteDRLNIBng0fvLRaFJ3eXeOVSC+dPT5rpS6f0NMIcHjlfBJ+9hlrd2TO89BhAv4DOgJDxzWCGTTlU6lu/38dDQHOBVfsfY1ofcsxQMrXRkKO3gSKwJYrzdf2O5mlINwinLF097yA9ob+s1iGgnKczD0H1fUvEmW+NstdBYtohIF6MMtTUxsKDZFcXVyfy8EpQFHLUU8+DWUD/QS/x0TE4oeTMf6spBq82xzXhG6fEGAV7UMjg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8676002)(53546011)(6486002)(66476007)(66556008)(83380400001)(66946007)(6512007)(8936002)(4326008)(508600001)(5660300002)(6666004)(2906002)(52116002)(107886003)(110136005)(6506007)(26005)(31686004)(186003)(316002)(38100700002)(36756003)(31696002)(38350700002)(86362001)(2616005)(45980500001)(43740500002)(20210929001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UlBDS2JFV01lRmhOMVlOZUhTTGwybjlWZkFqQnFtQ0hnckprM1hraVRVeVBE?=
 =?utf-8?B?MG9FT3FDYUNHbEJUdS9YLy9UR1hXV1Y3SHY2VHBVd3hlN0RlZVo0NlNoa2g4?=
 =?utf-8?B?LzJnTGVzTlA4aE43VFg3cnE1Y3FKaGhWbHdpM0RrYUJFd0dPMTEvL01zSXYv?=
 =?utf-8?B?Ly9rd1kraVhrQmcvQllzQXJzcEVkTUpSamlGamFCZFJDZzhvdXZiakVOdklP?=
 =?utf-8?B?YjVxSmtsZHFMUklWaVZyeTVpdDNvWmI1WVdRUC9yeDg2NXJDdmk0VnNyN3JG?=
 =?utf-8?B?WU43T0w5Ny9UUkZzU0xOZncwb1Y3QUt5SFNoMGJFdUw2S2gwMDNSaVVXajNt?=
 =?utf-8?B?c0xYQlpnNjZqY0pyK3diNmpXazg4Wm9ZdHNHTmZPTnVVMmNvdEgyYVhKNVZX?=
 =?utf-8?B?OHFXbHRNU24vN2h2U0pqNTlmQWtZK1hiVHc1dTlhU0pnV0VxOEhuRWszZWF6?=
 =?utf-8?B?MGhZVmE1Tm8wV3hMWkhWYzljSHFvRVBiWHFaWFlOcUFhRjVoMTNXeUFOM0Vu?=
 =?utf-8?B?SlNpekxZQ0R4VERwVlh3SG0vNk85a0doWEc4ODVKRkV4d2lIejAwWDUvd1Fm?=
 =?utf-8?B?YTBhSGNmaVFEYUxYQ0FNL3I1TEU0Znp6VEdCWERjenRIcGZTcHNPaUJWMTl4?=
 =?utf-8?B?UDlVV2k0MjJkVEhKUGpXN0JDRmw3S012U1ErbFQ2aDQ2TFJkREZUVVE0T00z?=
 =?utf-8?B?QkVaYnZVWFZqTVpnVWRUTVMxTDZjU2ljVDFsblZkenBoTFRxczZSRjRtN3Rx?=
 =?utf-8?B?dy9GRG1QVlhtRTNXNlp2LzV5NVQzM2pXZ0ttcDdNYXF3RWxDcDJRUk1lTXpF?=
 =?utf-8?B?ZHMzU1BEcXlFeUg2QlhtTytDWmpYWm1vTzBGaHJUNFZYQVI1bjVKcW9ZYVBz?=
 =?utf-8?B?bEYycXF1SEtPTTRLanJOUWs3emhWcDJ0MjRVdHpKTFRUUGlXQlpYc05KeGlO?=
 =?utf-8?B?MWxmQXU0eXRmWWFmS2ZiVUExQ2tia1VndVFBNGZoOE9DR0FwbDFWREs5b1NC?=
 =?utf-8?B?bmJ5NzRBZk9ldzdIZTFmVGwwRHFSMEE2QzNNK0didzdja3BUYWtBYUFUYnhI?=
 =?utf-8?B?RlpaUWhaTnhaSzkrYk50cktJajNXZ1RqQ2lKaGVNNWdBTGh3eUgyZmJraG5k?=
 =?utf-8?B?UEREak9YMm5ONElQc3AxYnRSSklZaGJWSVVqaktPd3BlTkp5akhMc29mSEZr?=
 =?utf-8?B?aUJ2ZVQ5Uy9zS25WM1Q2aHdjazJSbnhDUlQzSWtJZ1pnUGtsT281NlU4Z1ox?=
 =?utf-8?B?clZkZkJMb09NQlYrM2FLZUFSYlhnKzhjdE5XQ3NPWlVLTGs2Sk1vUnJzVGNN?=
 =?utf-8?B?a0poU3NVQUpMWHN4aWxNb2xpYmVEbENpaVVVSXVXWk5BWkd5eXJXcGl1Ymo4?=
 =?utf-8?B?WHVNWlVjRVQ1dFNEUzRad1MyUDg5TTZrd2Vrajg3S3I0SlIrZG5LTlJqVjlz?=
 =?utf-8?B?L0NMTkF2YjZZY0NPVHR2aUw5ZllIUXZ6TDNlOTdEblJ3TlFHUEZDckZQdHZ1?=
 =?utf-8?B?RnA3aGhkUllOL3NYUUVOdGNRT3dZME5naUdjTkRzNHRDN0IvR1FxU1hlTCts?=
 =?utf-8?B?cDFGU1RlYlJkOW8yclZnY3NJb1Biam9QOWhyK3VMbUVoSkxUODBrTnVHQWxi?=
 =?utf-8?B?Z3VncHQwZG0rZVRTYS9OYklOUlpFWEp6NTRCZnYwaWovTWlzU0NBUFViS1Jz?=
 =?utf-8?B?elBPWWdWVXM5VGt1RDliaEFEekZwZDhFV3kxd0tTb1lBSW9lczNCNmFWWE5K?=
 =?utf-8?B?Wkp5aWFtL3c4c09JL0MwU2hRNG81dEg4bm94WVY1UGxOalJCODVvRnIzaUZS?=
 =?utf-8?B?SWo1L3ZJRjR4VTB5MTVENjJKUzRmdWlwS25EQ2ZUMFliT3Foa2xic2k1bXN3?=
 =?utf-8?B?WXowU2thSnhXSmoxWnpvbmFYMEVZTXU4UlNEU2pxMHZDdzJyMVZWVmtEb2Ix?=
 =?utf-8?B?YTBBa21UajlxZ3VzOWt4eEVMYTNLL1djMmV4UVRnWXdqYnRad0tFSjRvUlJ5?=
 =?utf-8?B?a1JaOVZLUlo0N2ZHazFPbjc1S3JCSThmVytDTmh6UCtPc3k3VlU4T3VRcnVr?=
 =?utf-8?B?SERRMWVmeStZRjN3TExuK0ZZMk9wemtRWUsvVnZRN2hRQWEvUGU4MDFGUmhy?=
 =?utf-8?B?Y2EzRU1CS2VSZ0RkTE1Raks5cWxTbFZ3b2lyWWZ2ZFlaQjd3aUp1Yjc3UlJU?=
 =?utf-8?B?VXFDTW43bGdKbVhIVmZkOVRBenNqTk5KVUVhUVExUk5LSHpncGROV1BheUFl?=
 =?utf-8?B?QTFQUmFORDdyN00weU8vZTd4VUxRPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e866ee0-3592-4c2e-aefe-08d9e572066d
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2022 11:00:14.9175 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 778Qf9mmtmZ+9tCogKYIpGW5mxhf03nFVoG92CVLIxHdNzfyZFA5yGeJmHmq1eRsJtG2OVzjjBRbUuH3cN8xWTaNA1AuRM97nDY4KVbPKzY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5392
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe06::70d
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe06::70d;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

28.01.2022 17:12, Emanuele Giuseppe Esposito wrote:
> 
> 
> On 27/01/2022 15:13, Kevin Wolf wrote:
>> Am 25.01.2022 um 11:12 hat Vladimir Sementsov-Ogievskiy geschrieben:
>>> 25.01.2022 12:24, Paolo Bonzini wrote:
>>>> On 1/24/22 18:37, Vladimir Sementsov-Ogievskiy wrote:
>>>>> Graph modifications should be done in drained section. stream_prepare()
>>>>> handler of block stream job call bdrv_set_backing_hd() without using
>>>>> drained section and it's theoretically possible that some IO request
>>>>> will interleave with graph modification and will use outdated pointers
>>>>> to removed block nodes.
>>>>>
>>>>> Some other callers use bdrv_set_backing_hd() not caring about drained
>>>>> sections too. So it seems good to make a drained section exactly in
>>>>> bdrv_set_backing_hd().
>>>>
>>>> Emanuele has a similar patch in his series to protect all graph
>>>> modifications with drains:
>>>>
>>>> @@ -3456,6 +3478,11 @@ int bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
>>>>
>>>>        assert(qemu_in_main_thread());
>>>>
>>>> +    bdrv_subtree_drained_begin_unlocked(bs);
>>>> +    if (backing_hd) {
>>>> +        bdrv_subtree_drained_begin_unlocked(backing_hd);
>>>> +    }
>>>> +
>>>>        ret = bdrv_set_backing_noperm(bs, backing_hd, tran, errp);
>>>>        if (ret < 0) {
>>>>            goto out;
>>>> @@ -3464,6 +3491,10 @@ int bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
>>>>        ret = bdrv_refresh_perms(bs, errp);
>>>>    out:
>>>>        tran_finalize(tran, ret);
>>>> +    if (backing_hd) {
>>>> +        bdrv_subtree_drained_end_unlocked(backing_hd);
>>>> +    }
>>>> +    bdrv_subtree_drained_end_unlocked(bs);
>>>>
>>>>        return ret;
>>>>    }
>>>>
>>>> so the idea at least is correct.
>>>>
>>>> I don't object to fixing this independently, but please check
>>>> 1) if a subtree drain would be more appropriate, 2) whether
>>>> backing_hd should be drained as well, 3) whether we're guaranteed
>>>> to be holding the AioContext lock as required for
>>>> bdrv_drained_begin/end.
>>>>
>>>
>>> Hmm.
>>>
>>> 1. Subtree draining of backing_hd will not help, as bs is not drained,
>>> we still may have in-fight request in bs, touching old bs->backing.
> 
> What do you mean bs is not drained? In my patch I drain both.
> 
>>>
>>> 2. I think non-recursive drain of bs is enough. We modify only bs
>>> node, so we should drain it. backing_hd itself is not modified. If
>>> backing_hd participate in some other backing chain - it's not touched,
>>> and in-flight requests in that other chain are not broken by
>>> modification, so why to drain it? Same for old bs->backing and other
>>> bs children. We are not interested in in-flight requests in subtree
>>> which are not part of request in bs. So, if no inflight requests in
>>> bs, we can modify bs and not care about requests in subtree.
>>
>> I agree on both points. Emanuele's patch seems to be doing unnecessary
>> work there.
> 
> Wait, the point of my patches[*] is to protect
> bdrv_replace_child_noperm(). See the cover letter of my series for more
> info.
> 
> The reason for a subtree drain is that one callback of .attach() in
> bdrv_replace_child_noperm() is bdrv_child_cb_attach().
> This attaches the node in child->opaque->children list, so both nodes
> pointed by the BdrvChild are modified (child->bs and child->opaque).
> Simply draining on child->bs won't be enough to also get child->opaque
> in my opinion[*].

So you mean that backing_hd is modified as its parent is changed, do I understand correctly?

Yes, it is modified in this point of view, but why this needs drain? If root bs is drained, we don't have in-flight requests touching this modified parent-child relationship.


> Same applies with detach.
> One interesting side note is what happens if we are moving the child
> from one bs to another (old_bs and new_bs are both != NULL):
> child->opaque will just lose and re-gain the same child.
> 
> Regarding this specific drain: I am missing something for sure here,
> because if I try to follow the code I see that from
> bdrv_set_backing_hd(bs, backing_hd)
> the call stack eventually ends up to
> bdrv_replace_child_noperm(child, new_bs /* -> backing_hd */)
> and then the graph modification there is:
> QLIST_INSERT_HEAD(&new_bs->parents, child, next_parent);
> 
> So why not protecting backing_hd?
> 
> Full stack:
> bdrv_set_backing_hd(bs, backing_hd)
>   bdrv_set_backing_noperm(bs, backing_hd)
>    bdrv_set_file_or_backing_noperm(bs, backing_hd)
>      bdrv_attach_child_noperm(parent_bs = bs, child_bs = backing_hd)
>       bdrv_attach_child_common(child_bs = backing_hd, .., parent_bs = bs)
>        new_child.bs = NULL;
>        new_child.opaque = parent_bs = bs;
>        bdrv_replace_child_noperm(new_child, child_bs = backing_hd)
> 
> [*] = BTW, I see that you understand this stuff way deeper than I do, so
> feel free to review my drained-related series if you have time :)
> 
>>
>>> 3. Jobs are bound to aio context, so I believe that they care to hold
>>> AioContext lock. For example, on path job_prepare may be called
>>> through job_exit(), job_exit() does
>>> aio_context_acquire(job->aio_context), or it may be called through
>>> job_cancel(), which seems to be called under aio_context_acquire() as
>>> well. So, seems in general we care about it, and of course
>>> bdrv_set_backing_hd() must be called with AioContext lock held. If for
>>> some code path it isn't, it's a bug..
>>
>> We do have some code that does exactly that: In the main thread, we
>> often don't hold the AioContext lock, but only the BQL. I find it quite
>> ugly, but it works as long as the node is in the main AioContext.
>>
>> One path where this is relevant is bdrv_open_inherit() ->
>> bdrv_open_backing_file() -> bdrv_set_backing_hd(). This one is harmless
>> because we know that we just created the new node in the main
>> AioContext.
>>
>> All the other paths seem to come either from jobs (which take the
>> AioContext as you explained) or directly from monitor commands, which I
>> just checked to take the lock as well.
>>
> 
> This won't hold anymore when the job patches are applied. So that is why
> in my case subtree_drained_begin/end_unlocked() works.
> 
> Thank you,
> Emanuele
> 


-- 
Best regards,
Vladimir

