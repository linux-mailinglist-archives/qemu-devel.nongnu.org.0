Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BB73CBDDC
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 22:37:20 +0200 (CEST)
Received: from localhost ([::1]:47336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4UaF-0007Ry-IF
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 16:37:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m4UYN-0005qW-3d; Fri, 16 Jul 2021 16:35:23 -0400
Received: from mail-eopbgr40113.outbound.protection.outlook.com
 ([40.107.4.113]:45947 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m4UYI-0004Hq-LE; Fri, 16 Jul 2021 16:35:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jPwvmeoAA/WMHfvVr1dpWwD7Er0jgsJ6ISh1JvEi5+0jWgDjD6iuksNMzQaEdxMlxgUGpZHk0B9efsQD17pMC09mwGWtDRqGg0MwcHQPvwQ0AoU620kxHabzv+UEqpsO8JAOiEUrBcYjQUTJSprfJjrH1loWU7BsxK+QwWWd329UBsWBvvOdgZWkoF5uEGk9Ak0mVQR/LS1Gt5st/qUjr0pMH4Hd+D5x43ZSpnj1OKJyCE5am4EeYdjWBdq+Rel0yR8nPMeEbke+0acIug76wxXcGkjsLp9RHzdv0kZ+5r1pKyxUYRjru8TPvMikMiPFtYXrPBQK/qtj7Uz9GHowOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OiDj4FHTMIfE+mcPG8cAM8Ct4f5UON0PZHTNNnhD+6o=;
 b=O85+c7YBW2d3NOMbwfXQsHAF+W0XfwCsFCNPZDFYeqE3bBHdAaDtJnIjjYHkv8V5f8EyzoyUxr8ygxalRZ2SkYqp23dYqkb0nIVmQZm7KlPR1b3E6qEl4CT9k9u6wysmWucxWUT/CxRc8GI2QfCwpqhh77a7o5Squhjf2ypLEAiaKDTztI+YPMS29OBfSuPfo9dqmMI/woQmIUCwC+Tr4uUtiNYvkZJ2YcRlyBW9ICWrdW+SFlKirJdCnzVFM5ON5+a62vu50cnHVV247NgzJ5i2vZtS9O83Pi1elnWW+6DE4DkWbnhloXuIyZ/h2Qlg5lhMxS9n6lzeyYMpn+9x8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OiDj4FHTMIfE+mcPG8cAM8Ct4f5UON0PZHTNNnhD+6o=;
 b=lB6p1nq9w18CsTu5/s7dI4CfRiA6WjVPiCnEJz9d6r+efocyxOn7g5+5zNJwh3BFt4L6ey6eWKrJha8iNmi3mKyNWqVtRLERS+8tMgjUOaCF+HSaHX6EROk09fV4JayJceI9PrPJc0OorJHN1RUSKOOxJ6qlc2Jdl1qJ0Hevo4I=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1908.eurprd08.prod.outlook.com (2603:10a6:203:4b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.26; Fri, 16 Jul
 2021 20:35:14 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4331.026; Fri, 16 Jul 2021
 20:35:14 +0000
Subject: Re: [PATCH v2] docs: document file-posix locking protocol
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, mreitz@redhat.com,
 eblake@redhat.com, den@openvz.org, berrange@redhat.com, armbru@redhat.com
References: <20210703135033.835344-1-vsementsov@virtuozzo.com>
 <5534503c-373e-2d58-9906-d1c690a91037@virtuozzo.com>
 <23b63eb2-dbec-04d5-f06a-8d81e3552536@virtuozzo.com>
 <ec283ec5-6498-5ec8-32e4-483893d5b48d@virtuozzo.com>
Message-ID: <53a5304c-d876-13f9-712b-86982b6b7cc2@virtuozzo.com>
Date: Fri, 16 Jul 2021 23:35:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <ec283ec5-6498-5ec8-32e4-483893d5b48d@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM8P251CA0021.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:21b::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.193) by
 AM8P251CA0021.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:21b::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Fri, 16 Jul 2021 20:35:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97837872-780b-4abd-534b-08d9489936f3
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1908:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB19085AA8A0544E32DEF55EEEC1119@AM5PR0801MB1908.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0wulcQV0T6I7SOLBKp8C0EXK+6iyvxB0oIjfRZ46vMABUnfXeea7JJ3iGNcpELlJj8OPJRmXTS3Wm5DtxS1nbJmiJCkQ+JXKr0sHbc7aRazQCllBMFs83rHTYsr+5HB2h8qE1C8rcZWx9QxRCWAqn/9K+6cD4EiJ/SSFSsPdiHOJBlWje3ji+ZGQyvEvBhKI7cRt7VSsrlgAQnnqQcjIevP9+zylUtbtk6n7K2NmYm+/YCTS58VfXFAj1GHpznfBiaBGNbE8675fhWTLp3OI54b3EtG1sm6XWMQkOTSYlhdGLkRVwDmU61l7/ykAJmAF6af3sWXKKaM92d+lU6fFTdARXaWm5aLB/fb9069xnCTQilEcBQn4y48DjuRNlvH5Xg/iIGLRIZf21FFsAJNIOuNhEBJn/lnbmZPzHTQSMqz8ka7MHEpWxxg4L7ZPdY8n41XhuCn9FFlZmUjvlRurrflkXT0M9ZVbpipzZx3e5SofgtC06vuFeDklCShjmGU4xmV9hTcQBagTY74+uNEro/g08Q3Gkhk+zbuALyHHnHykT6kUDv8fciCVX4+KlkVjsatSycjTL47zwVblPxzkPoYXR4w4e5bqHZOHWO6yzmDp9ZWmfEjFW9cRQh1xuxTsRRW+rMh72/AsVY6FfR6iZgzATppyCEOkecy2Z5DRJR34fOEyDRsBxPI/4zbTxgtVZw5WYYdMMNQwBjzu/pDp49yYH0VRM0FftheWrR1Ioz8awnbs+8+5lQm8TfWkEWCWxNLJu//TSyGGROZlrWHl9g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(396003)(39840400004)(366004)(346002)(2616005)(5660300002)(956004)(2906002)(6486002)(86362001)(31696002)(8936002)(36756003)(478600001)(31686004)(83380400001)(26005)(8676002)(186003)(66946007)(52116002)(6916009)(4326008)(316002)(16576012)(38350700002)(66476007)(38100700002)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a2pGSXlqak1aRzBrOWFEUm0rdlliakhXcFpVM1dnVnErbkZlVjk1SElybTA0?=
 =?utf-8?B?Zjk1eExwcGN3L2ZHV2RFMmIyM2xqMENLZnpFamxsdnB1Umo1WG1xakN0SHY5?=
 =?utf-8?B?UU9wRG1qc0svc1V0SnVvMFoyVHlmOHZJZktOeUhHcFJYRUFucVgzQUlTTnVC?=
 =?utf-8?B?L1NDQTZxeEZncENYS0xSUXgzOFNMMStUS0hWbnhINWVtSmpJdW5xd0FqNHhv?=
 =?utf-8?B?ZFdaOU16WVZTY0hjRGNEWlJrOURWUGgxWk5ka2p1SmJGdEFDUE1UbXNzOS9I?=
 =?utf-8?B?bHpoT1poNjEvQW82dzN6VjJDME5yWC81azVQd2NoQ0JWZ1kxcDU5Z3FpbEFK?=
 =?utf-8?B?WVpBSlhvc3h3YzEvNGpmbWoxU29pb3pETVNIR2xwelRKRWVMbkZlOElhMXhO?=
 =?utf-8?B?Wk9iMGNuRzdZeGlTRWN5UmFhZXpBZEpMR1UzcFZOTi9BY1RkbG1EVVBxQUJI?=
 =?utf-8?B?SW9Wc1IrSlFtTW5VckJMbHpINWVMQURtdVJkQ1FIKzd0QkxRdVQ4VnBnOGpI?=
 =?utf-8?B?M3VCNUlISUkwdFNaT3ZOelA2S0x3OGN6MWVzMWVVaHhVRWQrbU5adGhCcnBQ?=
 =?utf-8?B?aSt5ck9OUWxzOTExRUloaHU0Q0dSV2w0Y1pIaFljeDZ6WEhDOG1yeDUvWlhO?=
 =?utf-8?B?T0dFcGo4RExlWUpSckdwbVRMd3NXUVVvRytlYnhwUi8ySVc3WHRWbWNhbDdX?=
 =?utf-8?B?UVEwVDZYNEh0bFhuK0NxMDdFaDAvaE5sNE1DWVJUODNWNjFiczVIc3BFRElX?=
 =?utf-8?B?VWVHdHBVY1hBLzNsVExZU3FjVnNnV3h1SklnM2NER2JFaHFsSVZ3OTVKOS9P?=
 =?utf-8?B?Q2FMdVFHbGtCc1ZncWU2ODVrQStyUFNNMXJnNTVqLzhaTzlyelFxWm9tSk5s?=
 =?utf-8?B?UTQvSG1YVVVpNUtRQW1UdWxvVEo3TDM3aThyZ1ZhUkhZN1F4SzhoeE11OEZ0?=
 =?utf-8?B?VjhBQjk0U0tMaVJMaktkNFNINU5zblFkZHdnbW9qMXBPeWNwNVl1RVBRVlVr?=
 =?utf-8?B?L0tEdlplVDNUMXN2SkVYaVdyelZ1cEFxVXkybEpMNGl4dDRjMEEvMWdzMUxR?=
 =?utf-8?B?MTBSZmNxNU5hMjkwRGdidzdNN0VXSW44bHp5dHZWMGNWZFdXRnZNTXJKV2VQ?=
 =?utf-8?B?SDgxZUZoM2NVbzdTRVhLajN5WTFPR21URVRROVhlVlBiMVZCY2xoQ2JybTBH?=
 =?utf-8?B?NVRZUGh1b0xMZjJ6eVVCY0dUdUROajFNZ0FaZzRmK2kxQjFNKzN0eGFLK01v?=
 =?utf-8?B?bmU3eFh3aFd4MSt0NGl0c2VjN0M3OVNqY0s3MFdPL1FpNGRTbmVWdnlXd055?=
 =?utf-8?B?MDdIWUVzMEZDcm5CNTBKUC8wRXk4WnlqT3pVRmpUeUg4SnBENHczaUlXcW5m?=
 =?utf-8?B?MFY2M2dLMWFJaTg1V0g4aWdVd2pGU243MW5KandZVFFob1RrVjlIK1lXNE9r?=
 =?utf-8?B?V3NjcVRvT3p0TVkrWmlqMndmckhhTFJJVWtKM1FQcDJNKzVCTVdJMWZMblE1?=
 =?utf-8?B?RVdYM0xQRU9waUpEbExmNk9nRkdPTUJaZnBkdU90RVUxQXhJSUFzekd4U3Iy?=
 =?utf-8?B?dzE4TGxsWjVRZnMveUo4cDBLOU42QkxERS8yUmxBRGlpNllhM1ZSQVhnRHNB?=
 =?utf-8?B?Zks4a0NCc3VESk9JMVFVRG1TazZSUFlpL2k4Mlg4VHIwbVpVSVFKZEQ3VDVP?=
 =?utf-8?B?TVVDWThnTFhxeEtETzVCKzJHZERmN1JwdU1FUlR0MmszcTJBSEl6YXlSVlJh?=
 =?utf-8?Q?uPSqGjMdp8rTZuoY5GgRlIZY0yUyUzd8oHHzrD4?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97837872-780b-4abd-534b-08d9489936f3
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2021 20:35:13.9475 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +yyhYWrZ/O2BJScXgnSqpUQi08FuSqfu3A7nK0ivgiGJaTXYPs/Ymo27fMraFUj8emBlk5QaCvumfOV/P74M3eGJsi80rBuby0UrG/PCzFU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1908
Received-SPF: pass client-ip=40.107.4.113;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
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

16.07.2021 21:47, Vladimir Sementsov-Ogievskiy wrote:
> 16.07.2021 19:21, Vladimir Sementsov-Ogievskiy wrote:
>> 15.07.2021 23:00, Vladimir Sementsov-Ogievskiy wrote:
>>> 03.07.2021 16:50, Vladimir Sementsov-Ogievskiy wrote:
>>>> +Permission bytes. If permission byte is rd-locked, it means that some process
>>>> +uses corresponding permission on that file.
>>>> +
>>>> +Byte    Operation
>>>> +100     read
>>>> +          Lock holder can read
>>>> +101     write
>>>> +          Lock holder can write
>>>> +102     write-unchanged
>>>> +          Lock holder can write same data if it sure, that this write doesn't
>>>> +          break concurrent readers. This is mostly used internally in Qemu
>>>> +          and it wouldn't be good idea to exploit it somehow.
>>>
>>> Let's make it more strict:
>>>
>>> New software should never lock this byte and interpret this byte locked by other process like write permission (same as 101).
>>
>> [*]
>>
>>>
>>>> +103     resize
>>>> +          Lock holder can resize the file. "write" permission is also required
>>>> +          for resizing, so lock byte 103 only if you also lock byte 101.
>>>> +104     graph-mod
>>>> +          Undefined. QEMU may sometimes locks this byte, but external programs
>>>> +          should not. QEMU will stop locking this byte in future
>>>> +
>>>> +Unshare bytes. If permission byte is rd-locked, it means that some process
>>>> +does not allow the others use corresponding options on that file.
>>>> +
>>>> +Byte    Operation
>>>> +200     read
>>>> +          Lock holder don't allow read operation to other processes.
>>>> +201     write
>>>> +          Lock holder don't allow write operation to other processes. This
>>>> +          still allows others to do write-uncahnged operations. Better not
>>>> +          exploit outside of Qemu.
>>>> +202     write-unchanged
>>>> +          Lock holder don't allow write-unchanged operation to other processes.
>>>
>>> And here, correspondingly:
>>>
>>> New software should never lock this byte and interpret this byte locked by other process like write permission unshared (same as 201).
>>
>> Hmm, no. For [*] work correctly, new software should always lock 202 if it locks 201.
>>
>>
>>>
>>>> +203     resize
>>>> +          Lock holder don't allow resizing the file by other processes.
>>>> +204     graph-mod
>>>> +          Undefined. QEMU may sometimes locks this byte, but external programs
>>>> +          should not. QEMU will stop locking this byte in future
>>>> +
>>>> +Handling the permissions works as follows: assume we want to open the file to do
>>>> +some operations and in the same time want to disallow some operation to other
>>>> +processes. So, we want to lock some of the bytes described above. We operate as
>>>> +follows:
>>>> +
>>>
>>>
>>
>> More on this.
>>
>> Hmm, we can just drop graph-mod. I don't think it is needed now, and anyway no sense in locking it in file-posix.
>>
>> write-unchanged is rather strange here. One process may read data and write it back and consider it WRITE_UNCHANGED, but other process may change the file intermediatly, and for it the WRITE_UNCHANGED of first process is not "unchanged"..
>>
>> It probably good to drop write-unchanged from the protocol at all. But what if we have old qemu that can lock write-unchanged (byte 102) and not write (byte 101)? The audit do we really have such a case now or in some previous version is rather hard to do..
>> So, if we want to support it in the most compatible way, all new software should lock both 201 and 202 to unshare write.
>>
>> Locking 102 in pair with 101 doesn't make real sense: if we has write access, we don't need additional write-unchanged anyway. Still, we may document that these bytes should be locked together just for consistency with "unshare" bytes.
>>
>> Any thoughts?
>>
>> Probably it worth also document that 203 is recommended to be locked if application want to lock 201, to avoid bad behaving process, that locks 103 and not 101 and thinks that it has permission to resize.
>>
> 
> 
> And one more question to consider.
> 
> What about read? Actually what's the sense of locking byte 200? What's wrong for us if some other process access the file in RO mode?
> 
> In Qemu this permissin is called CONSISTENT_READ.. Who knows what it means? How much consistent may be read by process A, when process B has write permission and do write at the moment?
> 
> Hmm, looking at BLK_PERM_CONSISTENT_READ description, I see that it mostly about intermediate nodes of commit block job. If we read from intermediate node of commite block job we may read old data (original view of the node) or new data (that was recently committed and actually unrelated to this intermediate node that we are going to remove).
> 
> But I doubt that it make sense for interprocess syncrhonisation: if want to read consistantly, we must unshare write on the whole backing chain.. And no real sense in sharing READ..
> 
> 
> Finally, it seems to me that only the following scenarios make sense:
> 
> 1. read-only access, don't care about existing writing Qemu process: just open RO, don't care about locks (like qemu-img --force-share)
> 
> 2. RO or RW access, want consistency: unshare all operations, lock bytes 20*. Than no real sense in locking any of 10*.. But for consistency and safety better to lock them all.
> 
> 


And final interesting question: we do force-share write in block-job filters, to not break the job itself.. Interesting, don't we release file locks during block-jobs, so that another process can write to the image during the job? I'll check it later.


-- 
Best regards,
Vladimir

