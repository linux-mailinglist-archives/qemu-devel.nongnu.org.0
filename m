Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 700603CBC1C
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 20:48:41 +0200 (CEST)
Received: from localhost ([::1]:60704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4St6-0002y0-12
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 14:48:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m4Ss6-0002JG-7k; Fri, 16 Jul 2021 14:47:38 -0400
Received: from mail-db8eur05on2128.outbound.protection.outlook.com
 ([40.107.20.128]:16332 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m4Ss3-00060X-GF; Fri, 16 Jul 2021 14:47:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lre++Sce7Ib5tnbz8i1g2K0XxvN/X29JTg8B0AecdhbAmo6zO8HBCslAKSRkWBbVcrhbY6BJGMKaqDxnr94zE1mkFS5v3UL9OL1yx4moqkSdKD9gboywmZ7ljd6z3syZITa+dd/yv0FOvjfTgy/X5O4/NHxHtgw4Pw+bhPTT50r3GSLHMQPbxCJfklNsQ2oLFhUjm4WNLs0ay1WXspE7yV4dCEaP6ZKosd+PawaNGAfrJeGwl3NC4x+z7DUaTU3uvfIN5TbFoZCkMhRGuuZrlR/LpJbVh3+L2Tf1imE6SooaOyXYR8Kixp2s65CDMPaxt7jdjGAxYnj1DLw/sZ15Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VdH7LLlmIOhLc8Oan1+OZLd+jgYm6l6x2v01xzaUk3k=;
 b=DSuU3qtHtsEhKsqCsqoDkLsPNgn8VG1Sgb4tq7fdZvD79c7kZ9+ZlCVZDJADxcufeZHaozsAPshOIGPmcnp28ntwPsoJ4iQQESmXrTqnqHmVtRRqKh7PPnL1bWZrmVO/E4nXbvE3Kl0M+L1q2l5/R5wkgGRR5Farh89dHhOQlu+kvEj6yTtnt6ZlhJZk6hf3YdEll+fQhNkLbY0WTW/zadwAC/bFizi/zQXYFJ9pe+k1ibTrJ+Lh1aGqHlg006BxKMZEgLQED6v87uB0Dxu328QdVygZMIKOIJ9HIX0IubsooWyBLTAvjuJieSTFtQ8PeQ+mf8qDPNI7qkJsnqgtFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VdH7LLlmIOhLc8Oan1+OZLd+jgYm6l6x2v01xzaUk3k=;
 b=rP8Ny4GIFff62KNSTDi1ywNA52XIHvPvEJYEaspgllshoE4KvXnNHWsIfkS9NwYTnmzRGmwlcLfHA9NzCNdaKkipL4O0SHa9YMxHCgZWb6MqgM9ZerKyzh8dYplKR2ob9SXtz0zSOMzsZl2NIPt8hFnN8CQwLJ6lcQvayGXM588=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4214.eurprd08.prod.outlook.com (2603:10a6:20b:8d::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.31; Fri, 16 Jul
 2021 18:47:30 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4331.026; Fri, 16 Jul 2021
 18:47:30 +0000
Subject: Re: [PATCH v2] docs: document file-posix locking protocol
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, mreitz@redhat.com,
 eblake@redhat.com, den@openvz.org, berrange@redhat.com, armbru@redhat.com
References: <20210703135033.835344-1-vsementsov@virtuozzo.com>
 <5534503c-373e-2d58-9906-d1c690a91037@virtuozzo.com>
 <23b63eb2-dbec-04d5-f06a-8d81e3552536@virtuozzo.com>
Message-ID: <ec283ec5-6498-5ec8-32e4-483893d5b48d@virtuozzo.com>
Date: Fri, 16 Jul 2021 21:47:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <23b63eb2-dbec-04d5-f06a-8d81e3552536@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0042.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::13) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.193) by
 FR3P281CA0042.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.8 via Frontend Transport; Fri, 16 Jul 2021 18:47:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d6fa0013-8b3d-46bf-6743-08d9488a2a14
X-MS-TrafficTypeDiagnostic: AM6PR08MB4214:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4214F6077C809A960DC8AAB4C1119@AM6PR08MB4214.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K8jJBdynhMhUoWDcVzJ/QPtL2v3Pr0tEOmJjs3eG1/JNoHr7Z2K1jbEkDg9JKBUAD0CVkWD923NSgMfeK2DTo1wtS21otT9NZ7cabRJDiBb5DU3S2G2xfK4eo/JYvsPOpTCtA+6w2qIgiKzz5ypVzZGc05xbdA3FJrt1FIe0WnPQ79t+uurYCBXyoM8RTZWRUa15/hDybGE6H4uneLbX2kAsDjJ52bhTTLbIr86Z6tldTNYmyf1b0KfnE4esrL4PgXUkBjcz3XjrqZfrrStSz7SoHMHlXc70smRG6YTsMC/POgJxz+pGOTv8QI4n/t37kp8zwayrg38OSxA8ixQjeXG3enPoENSrfcV5JkS55o4l1ecHncuiuPUt14ZXG9WEUxowFDjCLbNI3V1LJFWbGRXrqxQKovImiAiCXHaAqnvaeyG3dn2ZoMcOBSwS79yqJqKuHmo6pOkjgtBWKqOG16PZRQ6J+TYewdGEHa3/thTmGIuhDylOtPblcYyT9sNLu+YAGvZlj7gUppOyUh7IR7hNhwcLf8OmKxm7wi40U1Z8yJB65KQzvjq8ZS3MiyCKbqKMUZ3GFdezepfd94ikhAV+dCx7CNvlcM3O85wjzfSYar5GsjURRwjFc+OFRha93x9VbkwubENVb4Z012UK1QeGfSILfWpdUjrZVV+OHrzPN+gcwleS4T1qdPuWosHyBLx4QBKibzuXK7x0kW/tOMCbq9i2tNz1CpylCWEl2cD6xG5bf1tz3e5McIS4dAgM4hYUwQgM0pCVqvTM3IXP4w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(39840400004)(376002)(136003)(396003)(66946007)(316002)(66476007)(52116002)(66556008)(2616005)(8936002)(31696002)(956004)(5660300002)(16576012)(478600001)(2906002)(38350700002)(6486002)(38100700002)(86362001)(36756003)(8676002)(6916009)(26005)(83380400001)(4326008)(186003)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rlk4endKNWN3V2cvRlAwNjlzdVJXRjg0R29CbkE5QkNyL0dsd3JWVkJIeFdq?=
 =?utf-8?B?QVNqRURWOVFud3VhL1hnRnBuZU11NGRsN1dHZTFQZ1lMRVJPam0xNkNrMnpy?=
 =?utf-8?B?aFBSTldZR2RCakh1UTBCd2I3K0dZcWF5bzV0S3ZHakpPSEpsY3grTDNPWm9n?=
 =?utf-8?B?N28yYnZBdmpuTjVMc3VZTTB5QUk0bmQ0MkdNVVNQQVNTRER6NFR4K01NeUND?=
 =?utf-8?B?M2daR1dGekV1eWNvVjhocG11S0ZFV1dQMkJqMW5JdG9jZU1tcVR6blQwaW11?=
 =?utf-8?B?a2t5YW5HNThWSTc1SmxjdDFzYnU3ZkQ3OEgrYk9NbS9MaVlhRkt0M0hoSDJZ?=
 =?utf-8?B?a0p3NmV0L3B3b09namFDVkdyVFdxeUppNDNMRnB3TG9jamtMdUxZREIwQlhC?=
 =?utf-8?B?azNiYmwzdDVQVGVZRXF4UmlKSlRXMVd2V3NPYWtzM0Iwcmtnc0czcGhOYVFZ?=
 =?utf-8?B?MytmbUFKaTFpSzJrZW0rN014U2NtdTYxbjBjUmxzdU8vNHhVU24rK0VGa3JT?=
 =?utf-8?B?TG9QQ2FpNFlpZnhwVm5SVDdiRXBkZlJnbVc4RjAwYVQ0a1Bkall6aGRlSHNB?=
 =?utf-8?B?Z2FPbjJWRjZQTDJNcVo0b0lGUFhVR3pveFRtWlFsaVY0Y1pOdERNQjQ5K3hQ?=
 =?utf-8?B?UWJaZklCaWJZNVo1cVg3cldwL3EvRDdDa0RvRFUxSDBQeVA2ekxJTURqNGxu?=
 =?utf-8?B?ZHMrRDZIN3RXb2U4aExnZGtKRFZhaTIwc3ZBdHVXVkRsUUVIRk1uM1RPREZt?=
 =?utf-8?B?U01ucStERUM0QlNyd0xBZ2p4TVFNM2h6SXJ5VTBtUnhtQ2UwRlVCYVdxODF3?=
 =?utf-8?B?b0drclIvM2IyaUdEaEswemk5NzMyZExhVkRaMHN1aU4rQWxmaFU5RjdhV1Zv?=
 =?utf-8?B?K2RjSlYzUkxMZG8vR1hFVlRJMURQMzNnRWZ1Z3d5K29xdDNYeFhia1lSM29F?=
 =?utf-8?B?aG1acjBJazRlbTVsbWptOUVwRXVtYmp1aFNkN252UHY5c2ZtNk90VVV1MEFG?=
 =?utf-8?B?ZXpxSWNDVTJrWjFLUitwMVpvRWpGa0g3YXZQS3NBM0tzUDluazByWFV4MG1q?=
 =?utf-8?B?eUNZSDJ3bVpYZ3ArdmJ3eWQ2SVVSSDllRGVNaGduT1JMUUFxOWxxYXlvdU4z?=
 =?utf-8?B?UjZhZVZHcmF2cEw4NTlPcUFWWkd2SUJ6SGw3a0l4Vks2eGVHbnI3aUFqaUpo?=
 =?utf-8?B?QTZxTlpIYU5NaDRhVnRHZ3BvNTFqQmY5NVFsYm55QmN2L2VDdElxbTdOVnBT?=
 =?utf-8?B?VnIzQ0hWd3lVcDJkTmF5NUJwOVkvRllTVGFhOXB0ZVU2VjllQjhQV3dUbGE0?=
 =?utf-8?B?UDRYTE50RFJVWUpIMncyUXBQWlgvSmIwdm9jQnRLZUEyK0prTXpvemp0STJZ?=
 =?utf-8?B?Q0ZraUhKcWQ2clRzSnJzNjBLZndXNkNQOHJZSU53bkgrMXFkcXJLTzNSaXNh?=
 =?utf-8?B?YnZGVno1Ti83c3lmanFKd2lrM2pxVDNBZ1lDc3pDcDhPM3l0blZReVdMTXpB?=
 =?utf-8?B?UzV1bWxLQzkwQkpFQmxTUnF3RWloWVlweUFTWFJZd2xYaGppUEVabXRCcEZJ?=
 =?utf-8?B?M0VVY0M2MlpHWEFKZFNRejFtUHU3WmdERjV2YjRDR08yWGZiSUZ0NjFVaCt0?=
 =?utf-8?B?MnpRMjMrMFRHOHVyWlFoaE05eXN5MVhNKzU1ajhEdnRzVDJFdzZ3dzJkRkxP?=
 =?utf-8?B?Rjl3amFiWkl4Y0lhc2NMc3JrY3YzbmNsZmtseEJDRmRqR0Vic0k5d2Fab0cr?=
 =?utf-8?Q?opyV++WeO+ut+y0wzdOIk+Tiig+5u6tx8v7QNaw?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6fa0013-8b3d-46bf-6743-08d9488a2a14
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2021 18:47:30.0552 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WnF9SzG71jE+nwtn14pDdHtcIZXmK7OqVigC8KKIPCBQHOo2CxpfQDWr999TyNWyBJaM8HHgP73cRl6xBaODWGL4dvRI3GdT2U92e0r+33Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4214
Received-SPF: pass client-ip=40.107.20.128;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

16.07.2021 19:21, Vladimir Sementsov-Ogievskiy wrote:
> 15.07.2021 23:00, Vladimir Sementsov-Ogievskiy wrote:
>> 03.07.2021 16:50, Vladimir Sementsov-Ogievskiy wrote:
>>> +Permission bytes. If permission byte is rd-locked, it means that some process
>>> +uses corresponding permission on that file.
>>> +
>>> +Byte    Operation
>>> +100     read
>>> +          Lock holder can read
>>> +101     write
>>> +          Lock holder can write
>>> +102     write-unchanged
>>> +          Lock holder can write same data if it sure, that this write doesn't
>>> +          break concurrent readers. This is mostly used internally in Qemu
>>> +          and it wouldn't be good idea to exploit it somehow.
>>
>> Let's make it more strict:
>>
>> New software should never lock this byte and interpret this byte locked by other process like write permission (same as 101).
> 
> [*]
> 
>>
>>> +103     resize
>>> +          Lock holder can resize the file. "write" permission is also required
>>> +          for resizing, so lock byte 103 only if you also lock byte 101.
>>> +104     graph-mod
>>> +          Undefined. QEMU may sometimes locks this byte, but external programs
>>> +          should not. QEMU will stop locking this byte in future
>>> +
>>> +Unshare bytes. If permission byte is rd-locked, it means that some process
>>> +does not allow the others use corresponding options on that file.
>>> +
>>> +Byte    Operation
>>> +200     read
>>> +          Lock holder don't allow read operation to other processes.
>>> +201     write
>>> +          Lock holder don't allow write operation to other processes. This
>>> +          still allows others to do write-uncahnged operations. Better not
>>> +          exploit outside of Qemu.
>>> +202     write-unchanged
>>> +          Lock holder don't allow write-unchanged operation to other processes.
>>
>> And here, correspondingly:
>>
>> New software should never lock this byte and interpret this byte locked by other process like write permission unshared (same as 201).
> 
> Hmm, no. For [*] work correctly, new software should always lock 202 if it locks 201.
> 
> 
>>
>>> +203     resize
>>> +          Lock holder don't allow resizing the file by other processes.
>>> +204     graph-mod
>>> +          Undefined. QEMU may sometimes locks this byte, but external programs
>>> +          should not. QEMU will stop locking this byte in future
>>> +
>>> +Handling the permissions works as follows: assume we want to open the file to do
>>> +some operations and in the same time want to disallow some operation to other
>>> +processes. So, we want to lock some of the bytes described above. We operate as
>>> +follows:
>>> +
>>
>>
> 
> More on this.
> 
> Hmm, we can just drop graph-mod. I don't think it is needed now, and anyway no sense in locking it in file-posix.
> 
> write-unchanged is rather strange here. One process may read data and write it back and consider it WRITE_UNCHANGED, but other process may change the file intermediatly, and for it the WRITE_UNCHANGED of first process is not "unchanged"..
> 
> It probably good to drop write-unchanged from the protocol at all. But what if we have old qemu that can lock write-unchanged (byte 102) and not write (byte 101)? The audit do we really have such a case now or in some previous version is rather hard to do..
> So, if we want to support it in the most compatible way, all new software should lock both 201 and 202 to unshare write.
> 
> Locking 102 in pair with 101 doesn't make real sense: if we has write access, we don't need additional write-unchanged anyway. Still, we may document that these bytes should be locked together just for consistency with "unshare" bytes.
> 
> Any thoughts?
> 
> Probably it worth also document that 203 is recommended to be locked if application want to lock 201, to avoid bad behaving process, that locks 103 and not 101 and thinks that it has permission to resize.
> 


And one more question to consider.

What about read? Actually what's the sense of locking byte 200? What's wrong for us if some other process access the file in RO mode?

In Qemu this permissin is called CONSISTENT_READ.. Who knows what it means? How much consistent may be read by process A, when process B has write permission and do write at the moment?

Hmm, looking at BLK_PERM_CONSISTENT_READ description, I see that it mostly about intermediate nodes of commit block job. If we read from intermediate node of commite block job we may read old data (original view of the node) or new data (that was recently committed and actually unrelated to this intermediate node that we are going to remove).

But I doubt that it make sense for interprocess syncrhonisation: if want to read consistantly, we must unshare write on the whole backing chain.. And no real sense in sharing READ..


Finally, it seems to me that only the following scenarios make sense:

1. read-only access, don't care about existing writing Qemu process: just open RO, don't care about locks (like qemu-img --force-share)

2. RO or RW access, want consistency: unshare all operations, lock bytes 20*. Than no real sense in locking any of 10*.. But for consistency and safety better to lock them all.



-- 
Best regards,
Vladimir

