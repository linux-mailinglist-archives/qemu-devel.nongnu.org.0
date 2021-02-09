Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C18B631565C
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 19:55:26 +0100 (CET)
Received: from localhost ([::1]:35858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9YAX-0006bP-RO
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 13:55:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1l9Y8f-0005Mc-9o
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 13:53:29 -0500
Received: from mail-eopbgr40094.outbound.protection.outlook.com
 ([40.107.4.94]:56231 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1l9Y8d-0006xP-C9
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 13:53:29 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IAqmKMOvSWowYGbxRzATq6xDRiSoPB0Hsppvkes/rul89/N8TjBJb0gF2g7LXqKifVBsZk9VOpfC1zgFMrNgFgyPQJ1eSEk3uHMHcSehrhd7JksJj3hCUmPkx1Lez4VXp02GB+/18+XWjXpl4nyEhma1kdDzAYA7dBJV5UbJXDndpwHewXgy85OSObFOajnQM9KijE5sHFNl9oqqk9ScpEhiaQz4usVKHGbCgFUVXOqrB+Z8Ctg+jvwhHnQHSd2djDyIJDuRK3GRcTOnAKHjKkVa1htj8j/Qnfyt3fJL1DQW2GrF3j8xhSutXHig96217W2zLbd7MmY5/0UtAhSnJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6OclWQ1wsLiCXuJaSAAcPKThJ6aUNRIUfO7mTHYit+g=;
 b=mPwrm/Yv9V2S0OhSaLDfPQmxgQIcKU+dTUVlH1oRnBlvepBjVMVbySJ8qhtaRHswg7NDuq2FE6+SMQd4nxSoYUr+y5F6wSVNIZlXc6EwXlpqmQGg1Syp+Q50bYLmfzI2o9aXK5LxOHnBE9H2WIOHq6hsnmJSCghf7ojEc+86T20yAq5gzZwZgPkerxU2JTrA0tIDvCgVoeXjYOC1He05U1iWcii3u34z6lfC7rNMxmMRwewUz3BNOWEfG8vAmkXraFX8TQINVu+rMpFYGEDu8hMDcwgaOs1WzrV9O4/ojR4gJFpiHdT+j0uMrdI/czwOPRNxb970UtuIrODsRFKqcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6OclWQ1wsLiCXuJaSAAcPKThJ6aUNRIUfO7mTHYit+g=;
 b=lzV8r/vxcMckRz4PwQ9ctzVbsYN702ZUjR7/R89vgY5Rsh2EHzzaH3emCpC9ExCm4C09cm9TlEvW5iCTLNb+1EDyVq88i8VIuad020fSQV6CIQWcxFi+MxVYa4DAvYVzs5yfwgN+Dmod8u/qa4QvEVrCPMruJQbfSJgvcKpYERA=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM0PR08MB3364.eurprd08.prod.outlook.com (2603:10a6:208:e4::15)
 by AM9PR08MB6131.eurprd08.prod.outlook.com (2603:10a6:20b:2de::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.21; Tue, 9 Feb
 2021 18:38:09 +0000
Received: from AM0PR08MB3364.eurprd08.prod.outlook.com
 ([fe80::7440:fead:287e:949b]) by AM0PR08MB3364.eurprd08.prod.outlook.com
 ([fe80::7440:fead:287e:949b%6]) with mapi id 15.20.3825.030; Tue, 9 Feb 2021
 18:38:09 +0000
Subject: Re: [PATCH v13 0/5] UFFD write-tracking migration/snapshots
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu
 <peterx@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Den Lunev <den@openvz.org>
References: <20210121152458.193248-1-andrey.gruzdev@virtuozzo.com>
 <a88cb0b2-86a1-04b4-3ed1-d032850040df@redhat.com>
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Message-ID: <5d01402e-273a-53cf-b78b-b4b7f50340bc@virtuozzo.com>
Date: Tue, 9 Feb 2021 21:38:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <a88cb0b2-86a1-04b4-3ed1-d032850040df@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [95.165.26.68]
X-ClientProxiedBy: AM4PR0902CA0020.eurprd09.prod.outlook.com
 (2603:10a6:200:9b::30) To AM0PR08MB3364.eurprd08.prod.outlook.com
 (2603:10a6:208:e4::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.64] (95.165.26.68) by
 AM4PR0902CA0020.eurprd09.prod.outlook.com (2603:10a6:200:9b::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20 via Frontend
 Transport; Tue, 9 Feb 2021 18:38:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b69630a6-829f-4712-e9fd-08d8cd29d92f
X-MS-TrafficTypeDiagnostic: AM9PR08MB6131:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM9PR08MB61318E8BEDA21F9F96B5D30F9F8E9@AM9PR08MB6131.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /1tAkwszbvHeeRX16tUnJvOowyyYDTL2SVQNCw4opCgKiTPY0k2W+aDd1Tbyi4V5Kc3txdkjzsMemjkmoBpqyw0DSPLewxmY6uedMFR0p2pXIwYajm7hb7APu9TJ2B2+Nd8OxMd7xoifLUHcBfFFw0AFafFOpUylaX9kU0qFmnh/JypObfDvXA03Idxp5n1WRWdIQdYicNl5EykrBMOR8Tj6XRHYIw9kx0beZKwDbZ3Ti/s+AmhtzbwetdSfF9yO/lsXHO4V8bN6J0fmc0Fzpw08voGPTXKYK/wmzlA2RhAQNEA0MduVdRANN64ogjiRRVTX/UCucwxqLyQNmeS5GEJv62Pg/7fe8VKgoTt8jWeUtga0Wlc8Gh2sv+f7IkctlFmNgQfCkJxJMIu2YZKSJ7cGLJCWM43Wbfdy9d9eetqTg3sH9H3zgiKTgR9QbpqlsvuJgFDg/z34vMf9uz59bbNexpJO6avoe+V5TURKLShw/LTZ8Ui73qCQnsOEcFrYGWUbKsHaInHElRRsPZoycm67cARZXlLHUtwLNxQUPoPomgMQhZRSE0yF0YD7Vqv2xyPgR8kd933yKrW/rUEm7BiTp061OoX0wsLI8NaN0Tc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR08MB3364.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(39830400003)(376002)(346002)(366004)(36756003)(16576012)(44832011)(6486002)(83380400001)(53546011)(66476007)(66556008)(316002)(16526019)(2616005)(52116002)(956004)(31696002)(8676002)(186003)(26005)(31686004)(8936002)(2906002)(107886003)(5660300002)(478600001)(86362001)(4326008)(54906003)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NUJYMGR5dGFVM1FESEFhNXZuVndvd3NnaWRqS205cXd5Nm1ocElmNTFCazlC?=
 =?utf-8?B?emZUdUdhUXpmOWdRL0Rzc04wT09DcEpESWhXT1ltUTJNbFNGQytOUkpFdzlR?=
 =?utf-8?B?ZmRBUFNFREgyTzdqSXR3ekZtcUkxYkVDakp1MndMMkdRdHVzTzhtelB5OWRG?=
 =?utf-8?B?MFdkbVlVTk5TUUp5TjFLWVFYRG9IMm16UmpzaW5rYmI0UGJLWG01NEVpeHhy?=
 =?utf-8?B?c1N4N01JUkEvYTczdHpZRnpvYUFsNENnT3ZHYjhYTzk2TnM3bzFBRHlMUnlG?=
 =?utf-8?B?K0h1b1RiL2liRXJYdWZvbEZIZktlSlpDTGVLNHIrTCtHL2lvakZvQnNGeWM1?=
 =?utf-8?B?dFZWY08yQndEbkMxNDNWTHN5TkxvTE1QaGsvSnl6dHJKeGlKd0J0M1dGbnVX?=
 =?utf-8?B?cnJuaEROTlIwMUZMQy9mdVhZdWl1enRuUms2UTdlVnQvbHZFQUJqMjF1VFhV?=
 =?utf-8?B?dVBVSWNjeGd5OFB6amRaRXpCQmRuY0VvU0ZkL09kbW1MRHlDNUJ1aGlURkxY?=
 =?utf-8?B?TVd4YlJpUWR0cE9VcnBFRXJ0MFVKOUdNenJiVVBTcnd1Q3d5bVJacGRpOW1k?=
 =?utf-8?B?VHZFKy9wUHJKb3hQRXFXYzloQU9CUGt3MzZWY0VLUWVveGZ4NFRsR0wzY3M4?=
 =?utf-8?B?UU1sY2NnaVVyL05xRGRNWDR1NkoyY1pNZWh6RWdBTmt3VFQ4YlhscDRDdWNn?=
 =?utf-8?B?Mk5MaGE3dkR1NHZDVDNGbTFTbVFmWGF1Y2Q1THR6dStMbGtQd1ZkS21HaXgy?=
 =?utf-8?B?M29RRTRReDdKU2txTlJUMGRqSFBLeThvc3NpQUtnV296VUc0WW1XY3JNNTgw?=
 =?utf-8?B?S3oxelBzbjdBZ1dzNEwydWgwWXg0MWlhRldyODM4Rk80RldabEpyMnhjZnJQ?=
 =?utf-8?B?cFZCY0NBOEY1bUxLQnRVSkk4bGpOTzNMeWdoQUw4YjZZbDNRVnpKemhyL0cz?=
 =?utf-8?B?WmgwaVhjMFVuczBjK3NDaG5JeXVOWGt6NTNMNG1TVzZiYW1uV3Y1TUFoNFQy?=
 =?utf-8?B?VGVGcnJLRUxEYmp1Nk5qa255RzJidGFkVHBDNEpkMThuNlBJT1A4L1p2ampC?=
 =?utf-8?B?WFhMak93c3RJYzZLWXp0Wkc3aWJjNGFTalF4TXFNMW1kTVBtTVo1UkpCZjRL?=
 =?utf-8?B?ZTlNdlluZWNYeGVVVGVFZEZXaWZqV1pHZzMydWtMRTRCLyt2eCtBL3JZNUhB?=
 =?utf-8?B?cXNaYndEZlVLMjBkM2xvZWJDTmVud2pKajdxNXBVellNNldhUHRmQUJiaVRi?=
 =?utf-8?B?dU5vY1RrL0ZGT3dvTW41TXJvZDErRXRYK3RZY0o3RmE0M1dwTkJkOXJnVkY1?=
 =?utf-8?B?WmltU1Q5VVExVldORkZkelV3eEkrNTFnT0Yxd1Jnd3RUc0xqdHR5LzJwa2or?=
 =?utf-8?B?TnBNeWJoVktOVDNTWm9ya09la2JVV1RRWXJRUSswQ0FpRGN1T0EzUkNwaDg4?=
 =?utf-8?B?OUN0YzV0d1Mvc2tBbW9ubm1DdmxsNW8vMVVTb3lEdm01SUYxbnYwS0J0czEz?=
 =?utf-8?B?aytwSFRVZTNQS0tiTFRvZTVWRFc0cWJ0YTJhNkxEdC9rUHVDalhYNjQ0dmlS?=
 =?utf-8?B?WkF0QmNFQ3JOVXE1NzlocWQ3ZGNxbjdsclR3SHdTdGt1dE83eDFDdGtZKzRz?=
 =?utf-8?B?OGhBV0hpN3BKdUFyTEp2OVFGOVhpV2QrR1g3R05IeHdlbFpRMzVnZk5YMTB2?=
 =?utf-8?B?azVDRExaVlZwQzhpSHhFZ0ovZjZ5VS8yUytOUWlPbTU2YzVGRkVXZDQvN3pp?=
 =?utf-8?Q?8l9zXa1JKE49X6ARTsJDqoEUin0/UmlpVQrLw2s?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b69630a6-829f-4712-e9fd-08d8cd29d92f
X-MS-Exchange-CrossTenant-AuthSource: AM0PR08MB3364.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2021 18:38:09.5713 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CabW3D1r207Rw6i6kcgN4CehbbY/u/2HDYhP73KWyHiZfzCAflKMTTOBslRoaPKPS6a4XqKBBlMiyr9/1aQIBBj56K9m3EDAcOcNOvXyvyI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6131
Received-SPF: pass client-ip=40.107.4.94;
 envelope-from=andrey.gruzdev@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.265, RCVD_IN_DNSWL_NONE=-0.0001,
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

On 09.02.2021 15:37, David Hildenbrand wrote:
> On 21.01.21 16:24, andrey.gruzdev--- via wrote:
>> This patch series is a kind of 'rethinking' of Denis Plotnikov's 
>> ideas he's
>> implemented in his series '[PATCH v0 0/4] migration: add background 
>> snapshot'.
>>
>> Currently the only way to make (external) live VM snapshot is using 
>> existing
>> dirty page logging migration mechanism. The main problem is that it 
>> tends to
>> produce a lot of page duplicates while running VM goes on updating 
>> already
>> saved pages. That leads to the fact that vmstate image size is 
>> commonly several
>> times bigger then non-zero part of virtual machine's RSS. Time 
>> required to
>> converge RAM migration and the size of snapshot image severely depend 
>> on the
>> guest memory write rate, sometimes resulting in unacceptably long 
>> snapshot
>> creation time and huge image size.
>>
>> This series propose a way to solve the aforementioned problems. This 
>> is done
>> by using different RAM migration mechanism based on UFFD write 
>> protection
>> management introduced in v5.7 kernel. The migration strategy is to 
>> 'freeze'
>> guest RAM content using write-protection and iteratively release 
>> protection
>> for memory ranges that have already been saved to the migration stream.
>> At the same time we read in pending UFFD write fault events and save 
>> those
>> pages out-of-order with higher priority.
>>
>
> Hi,
>
> just stumbled over this, quick question:
>
> I recently played with UFFD_WP and notices that write protection is 
> only effective on pages/ranges that have already pages populated (IOW: 
> !pte_none() in the kernel).
>
> In case memory was never populated (or was discarded using e.g., 
> madvice(DONTNEED)), write-protection will be skipped silently and you 
> won't get WP events for applicable pages.
>
> So if someone writes to a yet unpoupulated page ("zero"), you won't 
> get WP events.
>
> I can spot that you do a single uffd_change_protection() on the whole 
> RAMBlock.
>
> How are you handling that scenario, or why don't you have to handle 
> that scenario?
>
Hi David,

I really wonder if such a problem exists.. If we are talking about a 
write to an unpopulated page, we should get first page fault on 
non-present page and populate it with protection bits from respective vma.
For UFFD_WP vma's  page will be populated non-writable. So we'll get 
another page fault on present but read-only page and go to handle_userfault.

-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                 virtuzzo.com


