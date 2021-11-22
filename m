Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A93458D21
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 12:15:13 +0100 (CET)
Received: from localhost ([::1]:34158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp7I0-0008Dn-6N
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 06:15:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mp6zQ-00047e-1D
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 05:56:01 -0500
Received: from mail-eopbgr30135.outbound.protection.outlook.com
 ([40.107.3.135]:10917 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mp6zM-0000ph-5d
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 05:55:58 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y0SCBAOjqyhe02hPQfgs/EpXKL7ymUequ4OaX/ZS5en8ODG20JufMXJuV8kfovXBwx9OpDNyiQ/m/BbdyDt6aJX/FGWX5ljRGWzcEqfrLpFuW2j+dtYwBH0aQxYVQFYrOlngjC1/gfyeJHRhXCxQ1HY/EV5mbaCQt1BNtdbbDDaOF/4t0w2peLgloUuO0R+J0FpKhOWNIpXVIirARk/+KTKd5HPPgoR3oHXhlX8eaDkh/hH0qhpnAZ3w83dwo7C6XJxgZy3+QeI+L24w7RE0Qvfb7s3jfQe5nCAKgQfRHt/JJRxBtR+btz1qaVfElyadmxEryQi+IKuZP6myIEKxCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gh7Zx1gOEyrAb8pFg7nRF/qRU4eqmLibvpD3J68QKGU=;
 b=YngcK7etkEm86tNiYpu2v8FYuA2+vzYBH90/k6cFSkh2v5KU1nxYwCdCNbUEwD1hDP5t51Eo9lOSvZmayxzxS8FjctXkJyH3eNWD9hEwvA6lPYFj8D0ywBzeUa7372dGtzf3yZeJjAQKGgZjzvpb+IGTfT7ypfxcjXmfZypxxT3ReVj4YWqhG7V9hUKsAX+QpMwYdNMl01R5AMqsy0oPOlRhTQiL8Nsm8iNfKxbONrF09jQcVrQilvKceO2jigkguNTlvOvGc4Hmi5xlAJ+VtpLIHk0Wb8Sn7wTfCWAgIaJHUYKFgy2hcCrJyQwhqab1F2Y+f/Se8AqY/idmYbE74Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gh7Zx1gOEyrAb8pFg7nRF/qRU4eqmLibvpD3J68QKGU=;
 b=anX4Gk4FOlyZmXOsRC6t6WhAey0+PlMPLJBXi1ai+VAfH8ZEPq8MGEdCDtUUgN1VX40xFnbkVA2l7kaVNcyiKCfhWtwYqbjd27RLcfY6DCkpPDOfEBnLOdSZuIzXlSUAkvrmVQvLglcqumQ1FqSqtMu8QBCt4QnKz/BQ11pnBas=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB4146.eurprd08.prod.outlook.com (2603:10a6:208:129::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Mon, 22 Nov
 2021 10:03:32 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.022; Mon, 22 Nov 2021
 10:03:32 +0000
Message-ID: <7fd116a3-90e9-5d4f-3a9f-bcc15338c14c@virtuozzo.com>
Date: Mon, 22 Nov 2021 13:03:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] ui/vnc-clipboard: fix adding notifier twice
Content-Language: en-US
To: Nikta Lapshin <nikita.lapshin@virtuozzo.com>, qemu-devel@nongnu.org
Cc: kraxel@redhat.com, den@openvz.org
References: <20211110103800.2266729-1-vsementsov@virtuozzo.com>
 <5de2287b-5c1d-7350-b4f6-eaef67095315@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <5de2287b-5c1d-7350-b4f6-eaef67095315@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR01CA0068.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::45) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.233) by
 AM6PR01CA0068.eurprd01.prod.exchangelabs.com (2603:10a6:20b:e0::45) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Mon, 22 Nov 2021 10:03:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 42d2168f-ab6c-4fd5-cd47-08d9ad9f564e
X-MS-TrafficTypeDiagnostic: AM0PR08MB4146:
X-Microsoft-Antispam-PRVS: <AM0PR08MB4146DD7BE5A6BF06B398013EC19F9@AM0PR08MB4146.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q8F6esoPnQDyfSnZ+44xoX2LIEw5ZtuD5rA/NHZo0nItjD6fKzKcRD/NlcAYAHVp6HX5daAsV1bCRAIHxPYQdcyC4pmBUIchdTovpzCISHPnsUomXCCCJMlIVz+eTc58faQTAJtcR7UA3Ig2qRcu+gLTACOO2JFAiyc8S/DroDrj8A4HAbXxWFyiTd/fjRBGQeA9J4ephFv2F6nzIFo1laizyj2shpsuu8IPcFG45jHoqLC16srvpPEuHmnwH8BqTZiuziILMZ5jiq+RRJKdM6WpNUrD+UfuquGWq+eNdJT/VgHhIROy5dMDgSpBoohq1bCkM43X25frbq+SF3pgPF2S6sDjLz11bPWvx0LUyhlk09GZSEyVsDB0tSheButvkAJE2/q5FJgR8iKPCfKJwz4yxcyoysUOQ+N63ERrJK+FJvyfcE9yT/o0TQXmijsOTUrixagD1Xf0V798lHYeXrnWN5///CkbIT5V/zx58EiSphwmMK0s1E3hts+ZffBvwujoAo0p5oQO0ZxGVqYyBLMdiFGN27pnM1rN0rETUUMal2wGqKoUH3eSt/OA3vga+d4Am+nk7W/eNQWwPrKiNQPeNXk0D3uDiJuRrH9ao5lJyWt0UAW2I4h472NM5JVQD5HVkRcipLle99s8hM29nV5JhQeLekTfXTOBf0Mc0kjWiro+OtvAGtcDkOi4+1+XSOeHmx4kYEzz/RaWJ21pw2TFaKjV0i6zlGuul19oUdc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(53546011)(86362001)(66946007)(52116002)(66476007)(66556008)(2906002)(8936002)(4326008)(31696002)(186003)(956004)(5660300002)(6486002)(26005)(8676002)(16576012)(316002)(83380400001)(38350700002)(38100700002)(2616005)(508600001)(36756003)(31686004)(107886003)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bU14T1NYTXJwS0cwVWFLUjZUaG9OcWhtQ2hzVDU0SDh6S1RzYUhzd1VMN29J?=
 =?utf-8?B?MDlGT1g5Ym56Ti90dzRxMmxTSGVLQ2xtMWhwS3o2R2I0Tk1ZY2tPNnEwbmJK?=
 =?utf-8?B?NXNvd2RuaHRHeTFHdDRWc0hZcHcrS3JQM3FBWE15NWhOK3MyY1Vhd0o5TGp1?=
 =?utf-8?B?VmxhTmpCRkRYZ1ovVWxvc0psbUd4cVo5T2NXYlZ1QzMyWXZsbHczNUthdzRy?=
 =?utf-8?B?VWFUNVJiNTVkaFU3NnIxTTJrTlloZkE5eGNWZTFoZCtsM3VGcEJBdWFidVRs?=
 =?utf-8?B?S1BNQlNTRGJtTHVjTE5yMWpvTW5jTGRBcVZFcWJ1emx4bklDZ2dCaTAyS0pH?=
 =?utf-8?B?VEtEQXRWMWcrcVA4TERXU3VGK2FvNkJWWE9Hd3ptQmJmd1o2a1dxV2VrVFUx?=
 =?utf-8?B?dEgyNjdyS0V5YlZZWERhTFVKd3dHWGxvbWdmSzF6M29LWExYWDRrRStjaXlY?=
 =?utf-8?B?TC9DSFVVMXpETmdvek01RitEcDdqQm1ML2V6emhNbnNXTi9OMWl0MFJHcm9I?=
 =?utf-8?B?Z2RHOXY5NWFLeUhLOEwvUVA2eWlrWEJSc2FORnZpNFM0M0FtTnNFZVNrRXBn?=
 =?utf-8?B?dEF5WmZ4cWJIZ2RPdnJXOWZUYWtLaThOYVdmM09qTDlvdHZQV2JTMnVFUkJl?=
 =?utf-8?B?UndZdVpTVUtmNkFzZlZNcG1VREc4dmtGcUU4RUhLWmw0S1M4dEpCOWtIc0hF?=
 =?utf-8?B?UmloeWxpV2NvYmxYMDR0OVdEUm53U1ZjbWlENUd5czROdWNhMjQwUzNLUUM2?=
 =?utf-8?B?WXBDa2RBOVVsT1NjbGlDTzNwR0JldHkzVUNzSjRQMkNTenJCK0NkQXIweExs?=
 =?utf-8?B?NEY1b05vL1JqeVN5NTVWY0Ruamp1dmZES3BUcHdDZnZubHZQMDdKczJaV0h1?=
 =?utf-8?B?QzgvS3hPb2JVSkpYUWNrOHR2dDV0eGpCbnoydGVLcUpmai9xcy9VZXlBMTAy?=
 =?utf-8?B?YWRqS0xXWkxHRnlpbW8zNWtLV0JJenBzT1UybWNFODBKa2FxVlFOTCtHcEh6?=
 =?utf-8?B?YkRVSFp1NXhuSkdtei9MVkZ3SmpCa3ZRRGdYcVhvaTJHY2w5Uys0bzZ6L1cz?=
 =?utf-8?B?YkE1c0EvRmVPT0VHMFJzV1QyNll6YVRtWVJra2tRMndjcks3K1lpQmlWQTlt?=
 =?utf-8?B?aDNJOVpETktCZGVvamNlazJhM0R4LzRDbGpMUHBOc2xKb01Ib28xa25VQlhy?=
 =?utf-8?B?TjB3MWlhS1JrNVBPUGkrYnVuWWlNN2xDQnZzTGJSdGRBblJRTUNGbTdzb1I3?=
 =?utf-8?B?RXBVMzhxcmhKSWpsYVdyTVZzNkYzL3pueW5ibjF6ZzhUM1ZmZ0VjMmN1V1FC?=
 =?utf-8?B?V2J0UGQydUdSa3hJaWJGcGRaZU9vTDZrQ0FhSnB1T0xQZ0NhemIyUldlRFVn?=
 =?utf-8?B?TStWZEJxQkM4OUJDYjlubUt0Q1A1NUEvTjZmLzVWNFFDT1pwbTVYcDdDMERx?=
 =?utf-8?B?T2F2OXVkcVNXSnNYUXliL1hpSi9BdmxONFBycnFrMkJNQTRjMmp3OGhUcG14?=
 =?utf-8?B?N0NPam9FVk84d0pWa0NqNWhrWklBbjNoMEtkRWxFMEJwMFdYTDkwbitJaVVa?=
 =?utf-8?B?b1YyQnlId0xMb3ZBZGFkSFVJSW5FWXRiSEZEZG1OdVRCU2hXa056VDhVaENB?=
 =?utf-8?B?dWtwVTc2QXlUMGZpdVJpcVZzVHp6bUFpNG1EemdhVldPMTZxazVLRk1NQTh1?=
 =?utf-8?B?SFMzblpEL2RuWGxqWU40N05CUmIyU0ZLYzg4bTBuem41RnRLWldVby96UkEv?=
 =?utf-8?B?WDBGejR1OU5Sa2NaVDl0SHFCKzNGNXBZTlNJdVFadGFUY1c3aE5ITmFHM21M?=
 =?utf-8?B?RTlRSHc0RHVTL29McTUvMkd2Rk1uRm1XQldzN1ZSRWd2OUFzZXJNcnV4NEFy?=
 =?utf-8?B?TktQbkFaM1BGdGxaUFRqOGRidEhmSGJ5NEhkYTRrNWxmTTFvT3lrKzFyYTZH?=
 =?utf-8?B?ZnhHMytUYTM1T3hKWTRxRUk0M1FyUlZzeWI0M0p0TWUrMWxQVVp5bmVpMGRx?=
 =?utf-8?B?YTFTN1d1SSt2bk9LdHlwZUowZmNrcExkbnVDeDAzb0pXUy9kZGlsTWh1U1U5?=
 =?utf-8?B?T3RmZEQ4bEIxS1MvVXRoZ3hlU3ZFU3hVN3BaWC96bWZ1NWgxcXNpMzk2dEN4?=
 =?utf-8?B?eTRtZzQwSmp4dG1aR0F3S2U1VXBEaWNyK1VML0ludklPeFMzK0cvczE0WERO?=
 =?utf-8?B?cXRPZkJES2lMc3N0QmU4c1N2NEVoY2I0TEE5YXIvUlI2V29JSTFDeGlqT05p?=
 =?utf-8?B?T1gzdUVoZWlRTmtoVlVkbDJmdzNRPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42d2168f-ab6c-4fd5-cd47-08d9ad9f564e
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2021 10:03:32.5055 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +0bOP3XxC/SxAsvgKMQPzKeyJON96hRFqWS4pnvrtNXLVYuzwEJpb5dZSMPqMgQU4TY6bu+jZsYMbRLGcZjyD/UhLqUC6nFJGwp2Fcs4/Oo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4146
Received-SPF: pass client-ip=40.107.3.135;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

21.11.2021 22:12, Nikta Lapshin wrote:
> 
> On 11/10/21 13:38, Vladimir Sementsov-Ogievskiy wrote:
>> vnc_server_cut_text_caps() is not guaranteed to be called only once.
>>
>> If it called twice, we finally call notifier_list_add() twice with same
>> element. Which leads to loopback QLIST. So, on next
>> notifier_list_notify() we'll loop forever and QEMU stuck.
>>
>> So, let's only register new notifier if it's not yet registered.
>>
>> Note, that similar check is used in vdagent_chr_recv_caps() (before
>> call qemu_clipboard_peer_register()), and also before
>> qemu_clipboard_peer_unregister() call in vdagent_disconnect() and in
>> vnc_disconnect_finish().
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>
>> Hi all!
>>
>> After backporting clipboard patches to our Rhel7-based downstream, we
>> faced Qemu stuck in notifier_list_notify():
>>
>>      (gdb) bt
>>    #0  vnc_clipboard_notify (notifier=0x564427f283f8, data=0x564426c59a70) at ui/vnc-clipboard.c:193
>>    #1  0x0000564423455887 in notifier_list_notify (list=list@entry=0x564423d2b258 <clipboard_notifiers>, data=data@entry=0x564426c59a70) at util/notify.c:40
>>    #2  0x00005644233273bf in qemu_clipboard_update (info=info@entry=0x564426c59a70) at ui/clipboard.c:19
>>    #3  0x000056442334efd2 in vnc_client_cut_text_ext (vs=vs@entry=0x564427f18000, len=len@entry=4, flags=<optimized out>,
>>              data=data@entry=0x5644263cc00c "\002\f\001\251\020\377\377\377!\377\377\377\314\376\377\377\315\376\377\377 \377\377\377\316\345\241\300\307\376\377\377\310\376\377\377\376\376\377\377\a")
>>              at ui/vnc-clipboard.c:256
>>    #4  0x000056442333b172 in protocol_client_msg (vs=0x564427f18000, data=0x5644263cc000 "\006", len=<optimized out>) at ui/vnc.c:2396
>>    #5  0x0000564423338af6 in vnc_client_read (vs=0x564427f18000) at ui/vnc.c:1537
>>    #6  vnc_client_io (ioc=<optimized out>, condition=G_IO_IN, opaque=0x564427f18000) at ui/vnc.c:1559
>>    #7  0x00007f07b02cf147 in g_main_dispatch (context=0x564425546bb0) at gmain.c:3192
>>    #8  g_main_context_dispatch (context=context@entry=0x564425546bb0) at gmain.c:3845
>>    #9  0x00005644234468f7 in glib_pollfds_poll () at util/main-loop.c:215
>>    #10 os_host_main_loop_wait (timeout=<optimized out>) at util/main-loop.c:238
>>    #11 main_loop_wait (nonblocking=nonblocking@entry=0) at util/main-loop.c:497
>>
>>
>> investigations shows, that notifier list has only one element which points to itself as next. So, we are in the endless loop.
>>
>> Seems that it's possible, if vnc_server_cut_text_caps() called twice. Then it registers notifier twice and it added to QLIST twice, which leads to the situation.
>>
>>
>> I don't have any reproducer and not sure that bug may be reproduced on
>> master.
>>
>> I'm not familiar with ui code - may be vnc_server_cut_text_caps() should
>> never be called twice? Or notifier should be removed somehow before the
>> second call? Maybe this patch just shadows another bug?
>>
>> But what I do know, is that we should not put same element into QLIST
>> twice. And if the check I propose is not needed we should add an
>> assertion instead:
>>
>>    assert(!vs->cbpeer.update.notify);
>>
>>
>>   ui/vnc-clipboard.c | 10 ++++++----
>>   1 file changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/ui/vnc-clipboard.c b/ui/vnc-clipboard.c
>> index 9f077965d0..67284b556c 100644
>> --- a/ui/vnc-clipboard.c
>> +++ b/ui/vnc-clipboard.c
>> @@ -316,8 +316,10 @@ void vnc_server_cut_text_caps(VncState *vs)
>>       caps[1] = 0;
>>       vnc_clipboard_send(vs, 2, caps);
>> -    vs->cbpeer.name = "vnc";
>> -    vs->cbpeer.update.notify = vnc_clipboard_notify;
>> -    vs->cbpeer.request = vnc_clipboard_request;
>> -    qemu_clipboard_peer_register(&vs->cbpeer);
>> +    if (!vs->cbpeer.update.notify) {
>> +        vs->cbpeer.name = "vnc";
>> +        vs->cbpeer.update.notify = vnc_clipboard_notify;
>> +        vs->cbpeer.request = vnc_clipboard_request;
>> +        qemu_clipboard_peer_register(&vs->cbpeer);
>> +    }
>>   }
> 
> 
> Perhaps QLIST_IS_INSERTED will be suitable for such checks because I couldn't find any initialize of .notify pointer so it can potentially be UB.
> 

I think, vs structure should be initialized to zero at start. For example at start of vnc_connect(): "VncState *vs = g_new0(VncState, 1);", and I didn't find another place where it is allocated.

Also similar checks are already used in the code, so I think better to behave similarly here.

-- 
Best regards,
Vladimir

