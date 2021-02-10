Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CB731693C
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 15:37:34 +0100 (CET)
Received: from localhost ([::1]:55194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9qcX-0005Sj-Ke
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 09:37:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l9qbE-0004wp-2i; Wed, 10 Feb 2021 09:36:12 -0500
Received: from mail-eopbgr150114.outbound.protection.outlook.com
 ([40.107.15.114]:30774 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l9qb9-0003Xc-6v; Wed, 10 Feb 2021 09:36:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ck2lyqtyqGzB9cD3itKG8bOaZ7dAYbxRjjnUYb1GhuseXcdbQtF0JKItVNH+zUG3g/8X+32n/9KdKf/DqUhMNKSguEqpDdCUdaVngjsZotkg/E15udCoutajrRKtrzr0+y3zpenP3XysKXdBY17jQ+RPauW4NRniqH93r/hdIFfh0co135PXfXXxwZxZPofjH0+4eIQIp5Voarptq58LEu16/F0YqGsqOwsHZjPOEy+/bLukipBKjnZXbKAfmR/13JJ5O6IEvu5YAMqlb0gBv4UgXvGVwgM2UUgF5xt/v5x5yQ9HgveFqFdNSqWimQZWtasxDzpkffIEtHLg8o7bDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=39hNAZwTXn7ElWyDgPuh+JRbkiLES8XDlVl66L0fCAk=;
 b=Ubpf2kfzykTBL5vvZ015EEM3v3m60LFOw6MaxLoJItz7sMhdqNGuuO6zfaj2IRwyBWXcY3vtimbT+5VVciJ3boEkK/PV2yWNmB0b466F4d2NtMA9oAH96Cq/Yp3v5ARbuW7Qn+vLd8lyQh/6yN3PxBHj2gAuEp1Azn//XdJmHEznUMcnd6GSae60BLIFPpfYGB0P5reiv0a3KFTtj0WKtH6mzmvhVtnz1qozWfLgzKysPOMPWmBqZpA4ODMI9NywpAbanY7fAOkT6dhwdsI6optliyElqm+7e5cFKtr5W5BX9rrZE2/YKAUn0JrCDpQMspiV801+nsL6Xcso6z7sbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=39hNAZwTXn7ElWyDgPuh+JRbkiLES8XDlVl66L0fCAk=;
 b=uUbkN1IwEF4IOSA5Mxb3j6OtvWTsV8Nt8iO01OXoPLLCAaAabUL4ql8KVt5IJXW3vG7g9QJuw0PR3bQcJeASH8/mWUU/6HbYcEM5ucqOBXI5f/IQDaFZax6YUh/VN1nYHKDer+umQCEY2CYQSvTW6z9VfUSRH24ilNzXGMdru4A=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5446.eurprd08.prod.outlook.com (2603:10a6:20b:107::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.26; Wed, 10 Feb
 2021 14:36:02 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%9]) with mapi id 15.20.3846.025; Wed, 10 Feb 2021
 14:36:02 +0000
Subject: Re: [PATCH 0/7] qcow2: compressed write cache
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, eblake@redhat.com,
 armbru@redhat.com, mreitz@redhat.com, den@openvz.org
References: <20210129165030.640169-1-vsementsov@virtuozzo.com>
 <20210210123538.GB5144@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <3696b3d0-e8e0-f263-70cb-2f5a8a2340e8@virtuozzo.com>
Date: Wed, 10 Feb 2021 17:35:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210210123538.GB5144@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.242]
X-ClientProxiedBy: AM4PR05CA0030.eurprd05.prod.outlook.com (2603:10a6:205::43)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.242) by
 AM4PR05CA0030.eurprd05.prod.outlook.com (2603:10a6:205::43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.27 via Frontend Transport; Wed, 10 Feb 2021 14:36:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 35fb88d1-e30b-4098-9af7-08d8cdd130af
X-MS-TrafficTypeDiagnostic: AM7PR08MB5446:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB5446EB3187305AA30132E860C18D9@AM7PR08MB5446.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ed8/S249GwdKxmw8mZQsnkmgLkkSy1LYL5Tgr++EJ3P63UanrIJCMBzp4ONi5xwUCE+FuwEwiuyVp9Vjp/s5UyrzsSzP00XAGacvtzcHx9Miz7fbGEKS9pYctYHEe6+l0MNygFblSQ8qDCmuHjvDeWHDFDn6DyYuhoF8kY/OD9jnxvDJzcDGD97ZWRsjpfVWm/mjx6qamZDJL8uP4hpIxvRCoUmxlBRPvoJFbMt5fENUtpodeZNxKWlEWW4T3wAhz0xSuvsPAZJy5RNObtTwjWRyZ5OvgBXJm8cgGTdgCDzaOQ3I7up5O9lSdRgi4/tgtFG75Pv1U14ZUdwBShLSmvXgj9Ou+0DzXjXiv04hs9X0TOpsz5SzSCZRZeWcVPnM7naetoedIBo1zHHhK0PyBgRbf61Th+WguadeH11G8P8lZmT2z+e2J/124uSC4VufGOfRtTA5i/5GUWfpzN6o+peZgZrRXHYcmoF27BFAaOXDnBUL+NGhUqjGZj6AeLTL4/2c14+4DW8CQ4rIAFGnbSu+/tdEBL2WFRdR2YjJU5orXh2AH5bOGzwsNjr1FHb76kvCpZSxsbJIeyXXKMywRWwPffCdcaktvqwYCk30y3U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39840400004)(136003)(396003)(346002)(376002)(83380400001)(186003)(16526019)(6666004)(86362001)(31696002)(66946007)(66556008)(6486002)(52116002)(2616005)(26005)(956004)(316002)(8676002)(16576012)(31686004)(4326008)(5660300002)(8936002)(478600001)(36756003)(2906002)(107886003)(6916009)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?K2RDYTlUZE81NGJSU3hxalptNGhZZ01xQnNYdDR0TVJUbDdSc254RzFGQlFF?=
 =?utf-8?B?UUZpSUt4WGIvQldmRHJRSEdMc0plUHg3T2RabnNtOTZUL045RVhoRmV2Z0lE?=
 =?utf-8?B?RUpINGtvcFZScENCcGZaWGQ0V21aN2M0UXZpeWRoSTNSOEZRM3BMbTN0UVNw?=
 =?utf-8?B?dU45M3gwTDBhSlF4bXo1ajF0Y3gyRTNxS2dsOTM5aXJ0eGRCMlp3dVQrMFJo?=
 =?utf-8?B?ZThsS3lhbS8xcXFUWTVHNmlvMEV2SUJIOVdQSzZ5djhmZWZFK2hzYm9mMEJr?=
 =?utf-8?B?WGZnVjFURUFxelBlWmlKRUg4T25Wc3RlUVl0UWs1RDZIcVhwUWJ2VlhmNHZC?=
 =?utf-8?B?RVQ0cUJWTU4rcXJCWWd0SDcrcWZDdkd5RDJPcWhVN3hWRzBJYXJWZmVmUms3?=
 =?utf-8?B?aGVEU3g5NnA1emp0M1RHb3grTElXdnFiVmdsUlppbFZxeWFCY1VRUkpqNFBU?=
 =?utf-8?B?dlJESDJGbWdPMmkzeTUwZDNHRGxQcmNYOFhZbkQwWHN2K09wVDM2Yi9YNHgx?=
 =?utf-8?B?TWU0aytUQTk0VTJQR0FINVpZN0lmKzlTTlhKQTlPREZGRDRTNUttUVdacHRP?=
 =?utf-8?B?ZlBnL05tYUxwKzF4WVA0cUg0TlVDd29qcUxEdEhoR1RtQk4wUVJVNkJ4NmpN?=
 =?utf-8?B?ZWozMmNxMnVoVFE1VDB0UzAzbTVJVEo5VjVnSDVwRmJnNXhkZnNxNUpzY091?=
 =?utf-8?B?UXo5WnViNGwrU2orUC9ReTBWWnBlaTMxc2JVNEROa3F6RFpNYjhIZ3JXUWFX?=
 =?utf-8?B?YmY0YzFLaEtrblFsOEFlR25DbUlOVEh3SzFRS1BmVVluOUVjUUFRZ0xTcEd0?=
 =?utf-8?B?aU5OSGVENWxlR29RNjNvcG9UdytsSXFkL3lVOTB1RVJ2WnJ4eE0yaHM4TmFu?=
 =?utf-8?B?WUcycDVNYlM5ZEt1dURwdmY5eDZxRkl0QmV1c2FSbmp4WmZKc2IyUE9JWldQ?=
 =?utf-8?B?RDhqT0JBTkpheS9yeDY2b25ic1N1KzVZVW9sa1NYQUwyUktnTHdtbHBpQS9X?=
 =?utf-8?B?Ui9OMUd5NWQyTzVZUFZkYlpERzgwYThWa25ucldPSzVxNFBxd3ExTm1oVzd6?=
 =?utf-8?B?Ukw0VVhWWENKaU9OdjNWa0pnYndWdFR4bjN0UXdzb0dzMjNkTWFwZlMxS0o1?=
 =?utf-8?B?TSt2cVlIUjFnT2QxVHV2SFRUQU1aaGxLeXp3RXQ1UW44dXc3N3czUjA1VElk?=
 =?utf-8?B?TXdWM084ZHMvS1I5SXpwRlEwT2pLUUFYbEQ1endiTUo2RUdJcjFJbE9PNVIx?=
 =?utf-8?B?SlpBM1QyQTBhZ2Y1REhDazQzeGtoYjhoTTExclZKL1pyaS9pbEY0MWp2Y0N2?=
 =?utf-8?B?eHc1Z3V4NlhEUDErQ05RcEh3U0VhREI5Zm95RVdFTWFmUml4RFVpUitDWGsw?=
 =?utf-8?B?enZ0WCtRTDhQdjRDaEFIQW9zWERUR2Uzekd6RHIzSXVScFk5NEhqRjBDT3Jv?=
 =?utf-8?B?LzY2bnFCNUtBdzdmeVJsV2dpbVhJTHVBS0VkbzVLRUFYT21lU2JiTGpJdFlT?=
 =?utf-8?B?bFhLL1QxT2NNV3hsMzVMWlBqN085dzVtR2xmWHhadTFwZnJLSThMVjJsQ1Ra?=
 =?utf-8?B?RlArVDVaUGRxeG0vd2lRZFdxK3hOeUgwaDNMSE15eGRGMWl3RDhsazErdlhP?=
 =?utf-8?B?ekM2YmhzcUdJSkx5WGV4UjBXTHF1b1VkQ250SGdOWEpUUzd3VFBKemg3VHl1?=
 =?utf-8?B?a0V4dEdTZXpIMFpMVXpkUjRZMjBDZDI4QWJrcVU5TlBzeVNOVS9ZeWIxNE5M?=
 =?utf-8?Q?zDfrV3/iijeEiD6m2RNPhxBj3kDq3TdIZIH8rsu?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35fb88d1-e30b-4098-9af7-08d8cdd130af
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2021 14:36:02.5233 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CndO7KbOBjEKtUbgmJ5pW4w476VxHn226V67uhK2O6IxCDW1tqXHtwOdahDu0FbvQ825dwx8fIyX7aLF2lnDlqzGExcNzpR4kdE4fY6uN3o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5446
Received-SPF: pass client-ip=40.107.15.114;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: 10
X-Spam_score: 1.0
X-Spam_bar: +
X-Spam_report: (1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MSGID_FROM_MTA_HEADER=0.001,
 NICE_REPLY_A=-0.211, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_PASS=-0.001,
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

10.02.2021 15:35, Kevin Wolf wrote:
> Am 29.01.2021 um 17:50 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> Hi all!
>>
>> I know, I have several series waiting for a resend, but I had to switch
>> to another task spawned from our customer's bug.
>>
>> Original problem: we use O_DIRECT for all vm images in our product, it's
>> the policy. The only exclusion is backup target qcow2 image for
>> compressed backup, because compressed backup is extremely slow with
>> O_DIRECT (due to unaligned writes). Customer complains that backup
>> produces a lot of pagecache.
>>
>> So we can either implement some internal cache or use fadvise somehow.
>> Backup has several async workes, which writes simultaneously, so in both
>> ways we have to track host cluster filling (before dropping the cache
>> corresponding to the cluster).  So, if we have to track anyway, let's
>> try to implement the cache.
>>
>> Idea is simple: cache small unaligned write and flush the cluster when
>> filled.
> 
> I haven't had the time to properly look at the patches, but is there
> anything in it that is actually specific to compressed writes?
> 
> I'm asking because you may remember that a few years ago I talked at KVM
> Forum about how a data cache could be used for small unaligned (to
> cluster sizes) writes to reduce COW cost (mostly for sequential access
> where the other part of the cluster would be filled soon enough).
> 
> So if we're introducing some kind of data cache, wouldn't it be nice to
> use it even in the more general case instead of just restricting it to
> compression?
> 

Specific things are:

  - setting data_end per cluster at some moment (so we flush the cluster when it is not full) In this case we align up the data_end, as we know that the remaining part of cluster is unused. But, that may be refactored as an option.
  - wait for the whole cluster filled

So it can be reused for some sequential (more or less) copying process with unaligned chunks.. But different copying jobs in qemu always have aligned chunks, the only exclusion is copying to compressed target..

Still I intentionally implemented it in a separate file, and there no use of BDRVQcow2State, so it's simple enough to refactor and reuse if needed.

I can rename it to "unaligned_copy_cache" or something like this.

-- 
Best regards,
Vladimir

