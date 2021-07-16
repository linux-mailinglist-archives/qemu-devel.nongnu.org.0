Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B633CBA7D
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 18:22:25 +0200 (CEST)
Received: from localhost ([::1]:35518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4QbW-0005eq-IN
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 12:22:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m4Qac-0004um-75; Fri, 16 Jul 2021 12:21:26 -0400
Received: from mail-am6eur05on2114.outbound.protection.outlook.com
 ([40.107.22.114]:59552 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m4QaZ-0007OS-KZ; Fri, 16 Jul 2021 12:21:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CMUllIx5SpVH6pJD8qlptpY0YJjLeMnMw7+NU1+OSTg6/MVzl0DzjF7GcIVaiVgXc9Id7EYoK2SqOe8x1t1eZWgDVOker+M4hTMJ68Jd8RXRyF4nMbaEqd0j4RVkELlNyc3uxk0KCBD7OR2s3oD+Jb4gIoo7J1FKbCUtMLXY/9VGuiCw8/GgedJJgXcP8AgVzGPelvTA4F6GWdVK6gyqszpxPAz0JvB+j19a8EWFzg1FerbLEOIrV+ky3nXH+9xIa8ZbddTdVOHlm2C98g5r3WzZYcl6ONyZw1BaQpDIyyVl4BAKwse0l7MgdJghhHjyV4ng/j8UfdXoF+oy09NZvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BC5x4hSyk36q7UzLxb4y7/paneOSXs/CVUaYJN0zDsc=;
 b=VXF225gfrbwUa7MtQzpSG9Gb/Qg8fU0zdswDCVn8scVlFi3dkl29BEOVI46Dp96RYdEI0TAN4BJlO6+OeTInjchtZHmcDTPcXiJQ7V0guLw+K9KfZNhqLkA7ZMr5OJ4VCthHZLHKEJd/mi/vpPK5cxUwNKh+BJj66XiXiGauadMs88SR5QQNh45yBMoNq7GRezLgfT+NqWP3dwZYyGeP99iUKc1/76MYorX+w4hfBDUocKnE8a7CbX8dW2cXtUI/KoNANoKrWrqeoXqwVS9le/2TgkKr0xd8/q3dqjYE+va/IHt4vzu0amAsbXXNpaCwQCisbX9eH0ZTJf4NhtrYpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BC5x4hSyk36q7UzLxb4y7/paneOSXs/CVUaYJN0zDsc=;
 b=oX3PTwzJa34YNM9UdPiSNPu0r7nXh3Mjp4bCr694qkh6iWzbRHmRlKA+qvtLoJBcNGmrZcIZwJNGFtJGJD70rHbPten5bpbOV/MaC4PzJ8txUcE3vheBmYY1FK//V02RRjNidcQblENZiS62Jl0s/14fdamCd8YknCUhP+C4/Pg=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB2983.eurprd08.prod.outlook.com (2603:10a6:209:4d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Fri, 16 Jul
 2021 16:21:13 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4331.026; Fri, 16 Jul 2021
 16:21:13 +0000
Subject: Re: [PATCH v2] docs: document file-posix locking protocol
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, mreitz@redhat.com,
 eblake@redhat.com, den@openvz.org, berrange@redhat.com, armbru@redhat.com
References: <20210703135033.835344-1-vsementsov@virtuozzo.com>
 <5534503c-373e-2d58-9906-d1c690a91037@virtuozzo.com>
Message-ID: <23b63eb2-dbec-04d5-f06a-8d81e3552536@virtuozzo.com>
Date: Fri, 16 Jul 2021 19:21:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <5534503c-373e-2d58-9906-d1c690a91037@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0016.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::21) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.193) by
 FR0P281CA0016.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:15::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.8 via Frontend Transport; Fri, 16 Jul 2021 16:21:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 127372bb-892a-4935-f8f5-08d94875bac0
X-MS-TrafficTypeDiagnostic: AM6PR08MB2983:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB2983407F6CC3F7CEB336D775C1119@AM6PR08MB2983.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KjkNAj43jfIYxCQK8x+iXW7laNOsDA0TlpDS7vXAP0qefzOpxKt++GtW6BkawWGTWWTNhSDpWrLq8egC3SQRuJutNJhZiODhe8Dz13/yLvQ7A5TcAUsJ3zrqBjuUww89NYE277R+rVDsCAR3f60iSx2J4G7CuvCfvMNrQakb5FV5HrdQu+UNb1e+6xBzvCBVPl5ZBeqP7jTyme5nxmAlxRMaPKuUoIw27omj5xTd9V9qV8Fc/w1xPYZpvykMkaEZ/tTOi5UGOY4/3tEA6HdzgRThwj6JsxBfKRjViK7vHsH0HvIgUFTinE4i70NnGrDWrb90J2RddWfC2c3isWDFcIjnSDMRl6ILSXYgQhok/3CukXjB7/APlAOcDK85iqARqR3J1YE/EtbFNYW1rHNNYpf2SDDYjsLDi3TANRGhUPt03Q5LB2ZvSus963mIynYVgfVBgzkE73DspJR3Ft5oIU7UQ+kif/bxNlGu0ijSXpG031xHFShkNvKmUmfzPe2UcnFRlF0pvbFJjEx1bX9gLoo+fGEo33VadraM6R+QIz2TXUfLKXoL5cKiOiOEt2dZ6dt7lt+bf77DzO1hPkBm5OmSL/csUrYO61vw49q7JcZsvcRW7MQRtys2kPTGRhPdc3UG32iIM7I76C0b+ksfCZmsKx5xFPwt57+94s2iK+Bpw7Gn6NcEU7LWZpixjsbaXvCwG5HV/KHQEeDaXE/KGR1twLJS3fZAuVj5YBVm1m1zWwe5zb/MhHtHHfbuBbBrJgTdLWU5gGVAeqskJrTEdg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(39830400003)(376002)(346002)(136003)(38350700002)(6486002)(2616005)(956004)(38100700002)(316002)(8936002)(16576012)(2906002)(8676002)(66476007)(31686004)(52116002)(478600001)(83380400001)(86362001)(186003)(26005)(36756003)(6916009)(66946007)(66556008)(5660300002)(6666004)(31696002)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmYyZVNlY0llSFNpc1J0MUNEeUl6V0VXOGUyMGZQSmJsOUVuNmdEYTNkd0t1?=
 =?utf-8?B?K2w0dmN5K0I3QjE0OThvN1JUOEZ6ei92eUIxMTl6NkFRbUFoRVluMSt2d0Zm?=
 =?utf-8?B?eVZIa1AwWWQ2ZCttcXJXblJ2bU0xM1FzUkJNZGw5bG9SSEhENlZqS2lPdlhs?=
 =?utf-8?B?U0R2RXc3WXZHMndTV08wNHNBWmZxMDZ4bThURVFkeWl0RnBObVhLckxhZzlx?=
 =?utf-8?B?c3NCQkc5a29zWnpGVzBlUWN6V3VkZG1tY2YzNnVYQnovRC9PMjRxQldwaHE5?=
 =?utf-8?B?RnBVVnh3Nk85Q3poVmhLUHRrWHZYL2gvdE5ORy9JK2dOM1RuYkNrZ0crYW9n?=
 =?utf-8?B?dm81T3phRG04NUY1MzJBWmxFODVUeVFEKy9Nb3FsNWdDQXhXVUllbWlvQUN1?=
 =?utf-8?B?THBLamg3WUxCeG9aQzI4UTA3NVdaNmswR0RPdFNhYlJNSnF6a2dEcm91RUpi?=
 =?utf-8?B?ZTZYV1V1T0I4NzRDS2VhekM1RTdBMXlQVWU4NHhrQ3FmMEhaYVVveFhlLzZV?=
 =?utf-8?B?aExsR1kzNXQvcWMwbjF5STJqVThjUFB0SWRPbUwzYTIxVmtlVjE0N09yVWl4?=
 =?utf-8?B?NW5mU2Vqa2VhTEkrTk9xMGRvV0FTZGt1a0hXZXNycXBRTDUrRStLVlJaZEw5?=
 =?utf-8?B?V01VbTd5dXR2VjJHaEIramhBeTc1emN6bm1DNmpkbDBwQmFPQ2RGKzV0enZs?=
 =?utf-8?B?MHNoUkdpTDZUSXdwZk1xUERHbTJtWXpnNzl5MStYTXREenFhcDRhQzdmZnll?=
 =?utf-8?B?YXBVVFRZRmFRL0V0S1RzVjVEcy8yajlTSTlYQnp5aC9zOGZRckhHWG9VMWU5?=
 =?utf-8?B?MEh1eVlaVXlUVk1uNFY2WndnQ1RETW1DTm1sSXU3WkpQSi82MFY0NHhnb0x3?=
 =?utf-8?B?ZUlPTHZ2QkpGR0VlRVhNYUF1YjFwYzdxYUFEMDZNTHNOZmJ0Zlhvb2RnVlpy?=
 =?utf-8?B?bXp5dWZyanhkdC9XWEFBMUo0bkRTc1hTbXBNc1YrcjB4c1FtN1lteHN4K01q?=
 =?utf-8?B?QzRzclRzZXRKSlM0eVpEZzFEdEgrMWFZTWl3cVFrRjVWYnRxR0s5R2k3dksx?=
 =?utf-8?B?ajdmRTIvUm1CN1NEU2Nkb2FNdllvRWY0cnVLRDY0MkdLOGV0dW5JakJrUWRW?=
 =?utf-8?B?NGlGZ1MxdEwvaUJNSTgxYVhSWkJPd2orblJHUEJ6TVNUUXIrZzNMTGszVkU5?=
 =?utf-8?B?Q1dUbThNeEd4aytiYVhPckJ6Z05zYVV5c0hYeUtDRzltMFB4T0tIRHB6T01i?=
 =?utf-8?B?U2kwVk90aGNqZkxpODBOVmNtWERhVm9FejU2OTJBVjFZOHQ5VWJ2bGJBVU8v?=
 =?utf-8?B?UFVrQWcwQUxEZ3p0eEZyMnVIdmFBMW0rMTMrMDFmUE1mNUdBRDdiYVJBVWtT?=
 =?utf-8?B?UnNnMHBxQmxIVnFvNkpmSXF6OXdrbU1tTnVSREE2OEFoWVlKM050OHlNb2Jn?=
 =?utf-8?B?dDRIc044aVhRQ3hvUm4vQk5qdGVYRHdoa2h0QVR5V2lxa2U1SWVrd3dMNEox?=
 =?utf-8?B?a0ZNWTN0U2dpUEo4dVdlVm9LUkVodUpCaWFWNENDc1hMYlhCUmlQNGRmQ1l4?=
 =?utf-8?B?R3RzaHBEZkJrZWxJMkIzUlpUSmE5blRmWjg3VGVxR3Y4eHhMcWdGL2k0SHY1?=
 =?utf-8?B?MVZmeEFTbTIwVlZDS0pGMkJYOGxzZTdXc1dLWGFLd1greUU4WHVYWkM4YVNa?=
 =?utf-8?B?azdlTUxZNXVZN2NmSHBqdS9oZzJ5NmpXclpaa05YRUdhdnM0ZnpIU2hvUWQv?=
 =?utf-8?Q?nBQKKpOSMr10MSeBHDNYkjmcdWrD4nNoZAvl1H3?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 127372bb-892a-4935-f8f5-08d94875bac0
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2021 16:21:13.2572 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WFhZRSVbGewwvWikO8dC0AR830cWZfu3jT/u65kbmcO1UUqGhgodVOLenY7AS8CAWyDUMLONu1KeDNkD7ygAHQkxfAgaN1gAA2yhQKsO02w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB2983
Received-SPF: pass client-ip=40.107.22.114;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

15.07.2021 23:00, Vladimir Sementsov-Ogievskiy wrote:
> 03.07.2021 16:50, Vladimir Sementsov-Ogievskiy wrote:
>> +Permission bytes. If permission byte is rd-locked, it means that some process
>> +uses corresponding permission on that file.
>> +
>> +Byte    Operation
>> +100     read
>> +          Lock holder can read
>> +101     write
>> +          Lock holder can write
>> +102     write-unchanged
>> +          Lock holder can write same data if it sure, that this write doesn't
>> +          break concurrent readers. This is mostly used internally in Qemu
>> +          and it wouldn't be good idea to exploit it somehow.
> 
> Let's make it more strict:
> 
> New software should never lock this byte and interpret this byte locked by other process like write permission (same as 101).

[*]

> 
>> +103     resize
>> +          Lock holder can resize the file. "write" permission is also required
>> +          for resizing, so lock byte 103 only if you also lock byte 101.
>> +104     graph-mod
>> +          Undefined. QEMU may sometimes locks this byte, but external programs
>> +          should not. QEMU will stop locking this byte in future
>> +
>> +Unshare bytes. If permission byte is rd-locked, it means that some process
>> +does not allow the others use corresponding options on that file.
>> +
>> +Byte    Operation
>> +200     read
>> +          Lock holder don't allow read operation to other processes.
>> +201     write
>> +          Lock holder don't allow write operation to other processes. This
>> +          still allows others to do write-uncahnged operations. Better not
>> +          exploit outside of Qemu.
>> +202     write-unchanged
>> +          Lock holder don't allow write-unchanged operation to other processes.
> 
> And here, correspondingly:
> 
> New software should never lock this byte and interpret this byte locked by other process like write permission unshared (same as 201).

Hmm, no. For [*] work correctly, new software should always lock 202 if it locks 201.


> 
>> +203     resize
>> +          Lock holder don't allow resizing the file by other processes.
>> +204     graph-mod
>> +          Undefined. QEMU may sometimes locks this byte, but external programs
>> +          should not. QEMU will stop locking this byte in future
>> +
>> +Handling the permissions works as follows: assume we want to open the file to do
>> +some operations and in the same time want to disallow some operation to other
>> +processes. So, we want to lock some of the bytes described above. We operate as
>> +follows:
>> +
> 
> 

More on this.

Hmm, we can just drop graph-mod. I don't think it is needed now, and anyway no sense in locking it in file-posix.

write-unchanged is rather strange here. One process may read data and write it back and consider it WRITE_UNCHANGED, but other process may change the file intermediatly, and for it the WRITE_UNCHANGED of first process is not "unchanged"..

It probably good to drop write-unchanged from the protocol at all. But what if we have old qemu that can lock write-unchanged (byte 102) and not write (byte 101)? The audit do we really have such a case now or in some previous version is rather hard to do..
So, if we want to support it in the most compatible way, all new software should lock both 201 and 202 to unshare write.

Locking 102 in pair with 101 doesn't make real sense: if we has write access, we don't need additional write-unchanged anyway. Still, we may document that these bytes should be locked together just for consistency with "unshare" bytes.

Any thoughts?

Probably it worth also document that 203 is recommended to be locked if application want to lock 201, to avoid bad behaving process, that locks 103 and not 101 and thinks that it has permission to resize.

-- 
Best regards,
Vladimir

