Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3786C4112AB
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 12:10:45 +0200 (CEST)
Received: from localhost ([::1]:37396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSGG4-000848-9U
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 06:10:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mSGDn-0006WK-Ak; Mon, 20 Sep 2021 06:08:23 -0400
Received: from mail-eopbgr140108.outbound.protection.outlook.com
 ([40.107.14.108]:12516 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mSGDk-0003D0-Bj; Mon, 20 Sep 2021 06:08:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T54j2DLuxmwzU02mkB0ZjCXZaXQFZd1uOphKUhwg8/ho5ZN3NPYe0K8Xp3//dflUmew0PVEQgX2WxpZrLxtERZqL1557i7yCExmUpB3g95OcsBmrJ5BYjIbXaiZjJiVi9XaWgnxm9TijO5QI5wqkVcABq0ZdAywhNdrW72P98RkkXEfcdWSp/HiXA1aNTSJ9IfI0Wu4HI6MBI8zhtV+60/7UCCybMatBNTZA0wG/bmuSCQs6ooFSX7a+VDWM9nW95Y9Yo2ZNbOWP7922EX7Qkr4mZwaZ+LV0ilnLEB1H0dB4xT5np39/SUs6XdvHOwwHVn4qQ0pN5MYeMnTQYFgnfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=gZK7KcqzwjGQEJY6zxFozohN4U2rGyh3fgEYevsMJDg=;
 b=kxLYE3RzuN1sjGY6AmIr9B6RvjO6cyeAvLhDlfnDDhyrnjjdpeKA1hdaxJtByahDCly7NETc3G8i2LVguPzXXXgDkNw67rqA/9rjf+wyIlmrFgPyVbWUvDBTvnfdoyBOd5p2FSEg3iAflJeI/n7zlBWrI0wvMHDE1XNBszvXBBAWidhlw2RJXJPViEX2wih4822/Ozq9KWexKPBXAJIlt0yibKwkMXa5D+Idm679oa0D7O+RdAIVKZUYSjMmsg8cNMRkimGQUDSBGtmdCENUr/lXKLlh/RRcnVJUVvEGe70vF5CFPtd33bPYahpHIdTir7BrsFEASHmL3Q9xKf/4lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gZK7KcqzwjGQEJY6zxFozohN4U2rGyh3fgEYevsMJDg=;
 b=CO/C9veCezfW1FAS5QXat4s+h2qAJuEw7FeF8jHE5I9byx9Gp+q5A8uKD8VQDDq7rOqhOVs75Ke1Nd+SQV0LMyem1ZLae3ZWOdF46PPZ9Lz7qh40LuLU1gYpvo1hLr15JGGta9VencDFOPHP5LWWgoZNpx88KrsGWD3QpT6UJvY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4213.eurprd08.prod.outlook.com (2603:10a6:20b:8e::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Mon, 20 Sep
 2021 10:08:16 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4523.018; Mon, 20 Sep 2021
 10:08:15 +0000
Subject: Re: [PULL 41/56] block/copy-before-write: make public block driver
To: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org
References: <20210901151619.689075-1-hreitz@redhat.com>
 <20210901151619.689075-42-hreitz@redhat.com> <YUhXZsbPxQyH2rpQ@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <41f8248f-3dbd-47a2-5723-0d76903bbc56@virtuozzo.com>
Date: Mon, 20 Sep 2021 13:08:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YUhXZsbPxQyH2rpQ@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR03CA0108.eurprd03.prod.outlook.com
 (2603:10a6:208:69::49) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.205) by
 AM0PR03CA0108.eurprd03.prod.outlook.com (2603:10a6:208:69::49) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.17 via Frontend Transport; Mon, 20 Sep 2021 10:08:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7bf0f257-622c-4faf-d831-08d97c1e9008
X-MS-TrafficTypeDiagnostic: AM6PR08MB4213:
X-Microsoft-Antispam-PRVS: <AM6PR08MB421323DC100648C610BF9046C1A09@AM6PR08MB4213.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nhKuz+qi2XkeP+c896/n/OyTRRYMD9P8zZ6tcI9AxIwZbsqTWjk5rrMUEMaOgyAl/+/x9nlanA4HySIi0KQ/kB3irj3MIa0GTf7Rm+TXsnsYsA0Y8hPOvL24cdEiqds/CH9tuXtKPcOVDBGRxfZQiJM5SujcPiDtUpdO9Asl94D4+kPNJrsW7yRL4wfrDQtWkn+Wwl/ga5/FEPCdfEdiJgk9p+3sCQ+PuGPO/2OeIp4E2MBfx0Gb14MTa8QJGbCcKvi0XHmAhisdbXx5in8vPsop2sJekEMqkDnkHAtvOstaiZGrSYbVpoU1PTofNEnu4hxdKR8wx3LkVI1NlCmD669TMGOCrCUt4FSw0u7BfJ4WSBiT9CLLGmBrawQiN7lOo+TGB0DYRishw86GjyzkGaJkblrk9CVobz2ETU6tMc+ONIddpzSgzYonk+XRqQDHPhFcaCrAKJr4aIwZdWsArVDDv1Ah9Ql+EolukbhEDbvHQbyUuUhmRPku4O5GG+KZDypO+50wl/zcZqkzUZTw7OZw5k40dhYUtL1DvvSHO3S0FQgnJ6UD9MbRAgHvAWVhO/FbydXZ0sezcJMqaUs6tPatN2gGmXCNJiT4+Y3jmJpskE501azyeV+3SbLWGaLwIMSxColi+0G0MLiYFT1rUeLFOlsSLPpHiz/cwXBlueeTQTkNBSHa4uFd7WuPzrD/M/WlYG1QavMCjQ7Ji/lcpyfLfAcM16sJCSeUzE0vzuJ7Q92yxCfB2qEGypqFBGk9V8s3rlajPQlR7cCi3k6IdI4ydRfILeOyiPNaojDDbm5zmp6pCQg+8o8WPx9h/ug+TtfPzV4xuGgA+EQKbWoelIPUACMJ2RZ7atppdl4HwGk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(376002)(366004)(346002)(136003)(396003)(66476007)(66556008)(83380400001)(16576012)(186003)(6486002)(4326008)(478600001)(31686004)(110136005)(36756003)(66946007)(2616005)(52116002)(5660300002)(26005)(8676002)(316002)(86362001)(2906002)(38350700002)(38100700002)(8936002)(31696002)(966005)(956004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3VYcEV6a2E3azNVMlZHM2FBNEE1bVhiRS9vaVpuSUNYWTFOdTVJRGRLUWpE?=
 =?utf-8?B?dnJFRzdlWXRMcXNheEg5SS9uSkdpMnJiYlhmcW9GcXYxVzZMOG5RZ2JZK3FG?=
 =?utf-8?B?YzJ2QStXVVczS21LZExUZUlwWm5pVXJ3YmFjYk03S2twZWVGV0hsTmJ3Z0dY?=
 =?utf-8?B?amR3dVFvUUk2QUZwYXJyYXUwVmxQbFl2TDRZMGU1WUJiK1JNbXZqdGRRaW9M?=
 =?utf-8?B?UGFCVHduL3BXRVVwUW40N0dZZFRpTndtNjUrN3lodUlkT2VvY1FuMGluVVZo?=
 =?utf-8?B?b2NBZ2c1MGRjOGphR3NSNXZXZ1FvZitjdWw1cExsSER5UXg3UEJML1ByYVFH?=
 =?utf-8?B?RkVoVWFMUlprL3d2eVNFWk94N0JGTStEVjZnMUtmSlZITVROYnMyMmUySUMv?=
 =?utf-8?B?TFhhc0VGNG5DOEIwT05CQW9uTHRWUmVwaG0zUUdtTlpaRk84eHZLUFIzeXhR?=
 =?utf-8?B?VGJ2RGpaWHJIaEptVFR2OXE2ZmpVM0tWNWpnZVVPOFdLT0xaRWtzbXRkVUU3?=
 =?utf-8?B?Q082dkpRdjRoYUNwdUF4VmNFTnN0SW9xOGp5ZlM1VlU0aTFZRmoySldYV2d3?=
 =?utf-8?B?QWdrRWh6ZHo5Ym03WWtpSnNzM2R4SlE4V1Z1OG1qSk96YU1EdTB3Ny9NWmo2?=
 =?utf-8?B?Z0Jrakx5R29QTHhNbDZLTENuZ20rdjBHRExONWF6R2Vya2NIY0lFRUVsSjdD?=
 =?utf-8?B?MnpKTEY0NGF3UDJpeENncnlOUEFxZGVpUlRYNTB4R1NQRkVsNmJ1bFlhS3Ri?=
 =?utf-8?B?VVpEeFNHck5odCt5UkxKcEZtaW9sVVJmTURGWnZJcTRzdjNjOXRES3EwTGVZ?=
 =?utf-8?B?Y1c1cWlQY2FrQklkaVBYKyswemcvT0ZMbXhYMVIxeGNpZE11allCMzg0SHg5?=
 =?utf-8?B?ZjZvSU1SQTh2RnJ4dk4yVmp1Y2tKQmhucFQ2NlRvV2NoUFlyUXRCSDF0Z21l?=
 =?utf-8?B?TjR5V2xrdzVVVDFaSHpvaTA5S2Y4ZVZwdTczeGZ3VUc3d2lMYjU5QUpRZXNB?=
 =?utf-8?B?M2tacjVFY0RTQXRlaUtIMnBEcVp1N0RjYlUxRitDcEZJclh6OGJQbE0rbzhP?=
 =?utf-8?B?bERrRmcvek50WFUvT2YwbUxIQ2h4THozd0hKZnVKMjZMOXpteXBmTVhZREk1?=
 =?utf-8?B?U3VMYzhvOWhZbEFQSVo1TjM2MVpHK20vbTN6bmVxWlhsdy9STWhKZWlDOGJy?=
 =?utf-8?B?N3lIMlQ2cjlKNFlEWEhPOFBsR2t3S3FPSjEwaUR2d1F5eTFDb2dTSDhxYTBS?=
 =?utf-8?B?U1JUUkpyQm4zNndtZnE1ZlU2dVRDdW1xazQ1U1VYZndoR0ZJT0xobmxncmlH?=
 =?utf-8?B?c2NkTlJvcjhtUGZIakZjSW0zKzk0dHF4YkVXc3JwU2RBTC91cmpiNk1aUnlh?=
 =?utf-8?B?cWphdTk4YVZBNWltNXZuaFAxM3pKZkNsTmthRjRxeFRYYlVXdUZLSEdVOUNK?=
 =?utf-8?B?YTkvdHJiNHpmVGJCWTh5Uzcyc3YxVzJadzF0SFpHeUhhWGltZjlzL3h6dGgr?=
 =?utf-8?B?VlBXMmEyTEE2RjVoQkEvMlE1Ulc4YnBMKytBV3pFdk1wd2pJVWd5eW9rWEgx?=
 =?utf-8?B?OUNPWkgzRVg5T2kzWHh1UkV4UTlicHJtbXRnTVpyTm1Mb205ZEg2TW40d0Qv?=
 =?utf-8?B?L3ZTQWJ3TW04cFZJWGlIQno0NmVRVS93d3RQcW1yWExmOUVuS3JBY3kwSWZP?=
 =?utf-8?B?WkYwN2N5RVlmVG5xOFdWTkIwTTlCYkJiYU9OcDBYczYzYS9aUW9haHA3dEJB?=
 =?utf-8?Q?d4l8UwIuLFxEtWJPi2bbGWQfa3FV9LEtDpJrgMb?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bf0f257-622c-4faf-d831-08d97c1e9008
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2021 10:08:15.8635 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /SKdzT5rJxNGWTviiP9DTbV0JUBu1GHebf/yODXV6SqDrdID15BLwiGLim32rkYmLBkwll22SaMACD+lUEL4gCKI0ZMLY+68P+xe8Bcx4ZI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4213
Received-SPF: pass client-ip=40.107.14.108;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
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

20.09.2021 12:41, Kevin Wolf wrote:
> Am 01.09.2021 um 17:16 hat Hanna Reitz geschrieben:
>> From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>
>> Finally, copy-before-write gets own .bdrv_open and .bdrv_close
>> handlers, block_init() call and becomes available through bdrv_open().
>>
>> To achieve this:
>>
>>   - cbw_init gets unused flags argument and becomes cbw_open
>>   - block_copy_state_free() call moved to new cbw_close()
>>   - in bdrv_cbw_append:
>>     - options are completed with driver and node-name, and we can simply
>>       use bdrv_insert_node() to do both open and drained replacing
>>   - in bdrv_cbw_drop:
>>     - cbw_close() is now responsible for freeing s->bcs, so don't do it
>>       here
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> Reviewed-by: Max Reitz <mreitz@redhat.com>
>> Message-Id: <20210824083856.17408-22-vsementsov@virtuozzo.com>
>> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> 
> This patch results in a change in behaviour that I assume was not
> intentional: Previously, creating a backup block job would succeed to
> insert the filter node independently of whether the filter driver was
> whitelisted or not. After this patch, it becomes an error if the filter
> driver isn't explicitly whitelisted:
> 
> https://bugzilla.redhat.com/show_bug.cgi?id=2004812

I'm sorry :( Will try to fix that today.

[..]

>> -    ret = bdrv_replace_node(source, top, errp);
>> -    bdrv_drained_end(source);
>> -    if (ret < 0) {
>> -        error_prepend(errp, "Cannot append copy-before-write filter: ");
>> -        goto fail;
>> +    top = bdrv_insert_node(source, opts, BDRV_O_RDWR, errp);
> 
> On the other hand, bdrv_insert_node() uses bdrv_open() internally, which
> is a really long and messy code path that basically has to handle all of
> the craziness that compatibility code for -drive needs to have.
> 
> Do we really need bdrv_open() here?
> 
> Or is all you really need just a version of bdrv_new_open_driver() that
> accepts an options QDict instead of just flags?
> 

Yes something like this, to always go through same interface.


-- 
Best regards,
Vladimir

