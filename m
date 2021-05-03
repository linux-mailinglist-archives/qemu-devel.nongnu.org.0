Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCB9371266
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 10:22:08 +0200 (CEST)
Received: from localhost ([::1]:53940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldTqA-00050V-AI
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 04:22:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldTpI-0004UO-IE; Mon, 03 May 2021 04:21:12 -0400
Received: from mail-eopbgr140132.outbound.protection.outlook.com
 ([40.107.14.132]:18245 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldTpF-0008Fd-FS; Mon, 03 May 2021 04:21:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a73vnbAq172rzyOtwmmilInC7k1AUgu68gQbzXvKlbDFMcGVPvV487nkgdOd6J8Px2wlex+maTmltGQL7tGPpfflC83LrCxgOlGY8lVW7pe9PH2DZ3Ob/Tb2XN7YZ7e8GUNqVmtop9t6J8J/DV6XjMPBf6tp6IxmqbXKNwPsgmNFhG1ljcjI6coKVl9fJvjz/qJqc3v0eGiGsTApEqj1SWAk2iIp9h0zybWe5o1KlYEjFULGNFxPxi183H2Pclurj+++kJY+YhZOsFChdvYp2LeubsnG6+gSxl+T4mM5mpi4tmX7vMzLM/D2fbAkh2QyTq42DC02C5POj99Wps4+0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=owxQJK1nW5Ba03BPjWoB9ILuEFbrQN/zzGVcoYUWoxA=;
 b=SyYV7NraHo1DyPE5ZVb2WtPuzox68eP5VPgoR6DK+WdODZVTre+DTSirRWlfm6F9qknLF2dYtr+wEu7oCZ5AAaq/ZMdcMGiLdBCDMoH7qjjYuk6klelWxn/sW/iaXbRz79iam+4ps6NM+hz+bc97RlBD4oZ9OJ1+yo1zvzt6tcMFsqy/bUgfHykPw3X6nuCy/xlAyX5l96Jz2pyJr7QrYYfa4V46PwSIGZtpjoRaWk+/M4fF21sOJXOO46fqweL8GaBoXX2f+hXelRM8V4jo0/RKsMLfZkkX/TXXGGFQUN7u1VK4uQW9S7ICnO3KsxRTxbTNHKyjrqqzLO5+01MMFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=owxQJK1nW5Ba03BPjWoB9ILuEFbrQN/zzGVcoYUWoxA=;
 b=A7c0oSnRetHc4ZdaO9EEWpANKujy3Zs55CVge1qXNhQvU4hEYHBt27F7Bc/KYJkbzUoQcAgQsmo2E5iUpiwkzMoMn6jKfNAtuNTValKgEH2bHyvgybNi34+MCWe8ZtA7ZqYxFCHQxBDzbUlU54wgl5jJAlMT3yEH4FuEQL0Yff0=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1843.eurprd08.prod.outlook.com (2603:10a6:203:3a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.38; Mon, 3 May
 2021 08:21:03 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4087.039; Mon, 3 May 2021
 08:21:03 +0000
Subject: Re: [PATCH] block: simplify write-threshold and drop write notifiers
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, fam@euphon.net, stefanha@redhat.com,
 kwolf@redhat.com, pbonzini@redhat.com, eesposit@redhat.com
References: <20210421220950.105017-1-vsementsov@virtuozzo.com>
 <8496a111-5721-923d-2e82-920f2e77233a@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <f94dbd48-7337-1224-c041-d590df9681d2@virtuozzo.com>
Date: Mon, 3 May 2021 11:21:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
In-Reply-To: <8496a111-5721-923d-2e82-920f2e77233a@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.251]
X-ClientProxiedBy: FR0P281CA0012.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::17) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.251) by
 FR0P281CA0012.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:15::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.8 via Frontend Transport; Mon, 3 May 2021 08:21:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dd561ec4-8ab4-49f4-ccad-08d90e0c643a
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1843:
X-Microsoft-Antispam-PRVS: <AM5PR0801MB18435C3EDE71CA8E649823C6C15B9@AM5PR0801MB1843.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nJcQr9rGNEQNXwyxXF2GFWJKMyfO9Ju/CWQ/k50ohj4o7fKFTb6qO1FlitYQRgsv55NNLksjtO//Br2Dkwy9rlLvi9IX98IWIKOLZeIElHbiqyO5EElec8d8+wptBhvehHg+ztYl5mDA0t6RNz9TeBEWsbHWXVPKiMjRjG5jjHiqMMHTndD+UYWkphTwIkLBLYhCiuvDFUwMoWV6UXKzqbcDRZ2O6Rd/icvfWYTo/13ManxJ5W4mteGXv2cFkMxp0AW6uTUl0sWwTNp1upTExF3z4Q/W5n7+mqOZwhqUBVMDJr3U527Avm3lMQmifehNY9LALUJTCBgWxYKB+kT750GimCZX/9qc+7/luwSbIyls63KkWQQ34Gi5SmtuojDcrx3v642F0PFpNEebWajxLo6I1zMYoQZNnM5LYziWzYvusSYKkCDcu1KrBjLcUoEp9liujWWq25F1SKC4itxw2YDDFZjzVTkPQO7Zid7e7CuJ2AYCqe16qtMtF5iYD0I4lV5isi1gp1KFKtc4OHJipMkkDQmqYNTxuacEgKUktYJSS56Du2/HKv3XRxjmMnJW0FMXyltKnBj5RSjkJEw/XGf0eOAq1qpORdTs9Ox8KJ54Rcb7t4lD0H6S2Cj2LrlL00LfWEEXUFh/iUxq7sm+Kx7Qt4l3mfMghr2v+5BZ2VjVyRR3cGbKzAYxvtuCP8oryA85qlmF6OJ0EydKR95GN+2aChwPok0+P2pjygaL9jE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(346002)(366004)(136003)(396003)(376002)(66946007)(38350700002)(38100700002)(26005)(53546011)(16526019)(66556008)(66476007)(83380400001)(31686004)(36756003)(4326008)(16576012)(478600001)(316002)(8936002)(52116002)(186003)(2906002)(8676002)(31696002)(956004)(2616005)(6486002)(86362001)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QXNsejYrK1h5MklCaXZtdDZaNGZiMWlwdDZqWG5BcjFyVEgzK1QyY3JXdzZE?=
 =?utf-8?B?M3hXMU02a3RmNmVxTzhBb0J0MmtZbG9yRzE3UEZHd1F0RDhrOW1XZzNWV3Ft?=
 =?utf-8?B?TnlxQmNqbFI0TVcrM3dUWDQvdk51c005NmxUTUZZa3poY3kzRzhoMVYwOTVn?=
 =?utf-8?B?QnVpNTJnaVVyeVArWHorRU9icmdmN1QrOTkwVGhxMGNIK0diL0cva0pzSnlm?=
 =?utf-8?B?d2c0MUlkR0JNSmx0eXRGQXNXSE00TkxXNENtSDg2enBsb1lhSHlFTGx2eEJ5?=
 =?utf-8?B?UjFSRU4zSlFya0lMNTZaNTE0NVBhbzNiSFAwSGkrVC9DTG1tMTRBUGk3L0VM?=
 =?utf-8?B?L1M0Q2NZWUVCRUJ5M0pKaXQ2aEJzb0FFREdZTy9PTFBDMGlvNmRYU05pYkxS?=
 =?utf-8?B?ZWVBZEF6YVVpU3I3QXlWZWdiR0NPR21VR1BaNmJFUE9CcDdOMTJDVERrWEFH?=
 =?utf-8?B?cG5wUVNXL0g5OUpqYnFTWEw5bmprdUZVZE9HZG1BZDZQT3JXOFV1Ly9jMmhP?=
 =?utf-8?B?aFdqYitLSlpQVnAya3hFamdQcGdnUlNvcE56TGFSQmtaUVNpaFQ4NDM1djNy?=
 =?utf-8?B?d2VsV2ZVbkUwUHJ2c2M2Y1k0c3MwVm1tbXlUVk1CajBxYzRRMC9RY0w0ZXNO?=
 =?utf-8?B?OTdXVk16d2hKZUoxbUR6MUVYWDQ3c3Z3MkRXVE5yNTRXZDhoVzk2UlNMZEhq?=
 =?utf-8?B?OUNKUHlIakxUeWtSS2dRQjBlcVkzdXZQdUdmZk0zM1pUdlp1ZXA5SytIYUVL?=
 =?utf-8?B?UHRCYVM0ZGdPNU94aVdwcUNxbHVqNmdMcU9MRm5WNldPcmRnTEhKbUVtUG5K?=
 =?utf-8?B?UVZHY1NVdHRZaS81UThNZE5CeHRjRGkreGlQWml6R1lnMXhwQzViN3JRUmpY?=
 =?utf-8?B?OUdzRDRGUHdQd3FwZUZPRnVtTEN2SWVOMThaZUNsZ3BXbnNPS2lwbVlJeFdz?=
 =?utf-8?B?d0ZvV2lwWTU5MUtpZ0NYR3V4SENFWDRuSmo3UXpnWHdZR1cwcmtYckRReTJD?=
 =?utf-8?B?MzRKY2pZQnNnVzZuUGFpQWJLVlhMODFQNEdIamRPSmNIeXRKQmFJbllqbklS?=
 =?utf-8?B?K2dCZE14bERkMFA1QnFhanYyamVNb1pXcnVCWWk3L2tVckgxOU5QLy9uc0tV?=
 =?utf-8?B?NGhxYXR1R1ViK210ZHNIc3ZWbktDYWFIeGl6VGJNbWF2aUJRUDZEMThTQzVh?=
 =?utf-8?B?ZGNpOXl5VkdKYWpwZXBHak10VVZrbElaSVBOakM4QlQwK0xGaEFtMUc0QmpS?=
 =?utf-8?B?OUlyUkNYc0dzcGYwWStxUW1QR28zSE96TDdUU1ZZQTdJOE0rVkU3QmM2NW05?=
 =?utf-8?B?Z3NoZnJxMTlxeTFrMFIzcWlYSHdwY3FDZnVpNnFjbHRBY3hhODlYS282T3NN?=
 =?utf-8?B?WC9yODBETWxTNnoycGhkd2dWZW1EclN6T1FQZ29aeEUvaC9BWXBUaWFXbDMr?=
 =?utf-8?B?anJ4Z2IwK1RnSkFVL0Q2aWY3ZmFIT3RNeHhoK0c2eVVydk1OVUVpaVBmeVVI?=
 =?utf-8?B?cnFwa1htWkUraGpFT1R5VHJmblZycTkzaXQ2OUFWTWE0QnU1TnBDSUttTUZa?=
 =?utf-8?B?OHgxNyszRjU3WW9xZU83UDk2S0R4Umpyb0F2WnBLaDUvTGVkbEs2TU9wclhW?=
 =?utf-8?B?VFpRc1VUVGIwY0x1VmUrdnhpeTkzZnNLSVNCUjk0dTFFQUYyNEMvOUtFU3hj?=
 =?utf-8?B?NjEyRWxQbkxsdzJiNTl6VlFMWk5xZ3dsK3BtT2kwbytXcU50UGx4OXhTUCtl?=
 =?utf-8?Q?rI3h7HyiJ2JpzmT13whZ2ftNXAEKZniDD+e0tiB?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd561ec4-8ab4-49f4-ccad-08d90e0c643a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2021 08:21:03.5170 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t9p+3GqQngdH6dpfCj7zzJGUmS8aCbPnrCf8PlmVQ2RzlmnrkR5XxB2b8SuQxnhtgvfQa+spaZieaMv23Jx1otS4Bm8wtPXi2yQuTYIdR+g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1843
Received-SPF: pass client-ip=40.107.14.132;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

30.04.2021 13:04, Max Reitz wrote:
> On 22.04.21 00:09, Vladimir Sementsov-Ogievskiy wrote:
>> write-notifiers are used only for write-threshold. New code for such
>> purpose should create filters.
>>
>> Let's handle write-threshold simply in generic code and drop write
>> notifiers at all.
>>
>> Also move part of write-threshold API that is used only for testing to
>> the test.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>
>> I agree that this could be split into 2-3 parts and not combining
>> everything into one. But I'm tired now.
> 
> Er...  You should have put it off until the next day then? O:)

Yes, sorry. I wanted to send that day... Don't remember why :) Checked now, that was not Friday.. I wanted to drop write notifiers long ago, and when I finally do it I couldn't wait, so cool it seemed to me :)

Thanks for comments, I'll send v2 soon.

> 
> It should be multiple patches.  At least one to move the write threshold update to block/io.c, and then another to drop write notifiers.
> 
>> I can send v2 if needed, so
>> consider it as RFC. Or take as is if you think it's not too much-in-one.
>>
>> I also suggest this as a prepartion (and partly substitution) for
>> "[PATCH v2 0/8] Block layer thread-safety, continued"
>>
>>   include/block/block_int.h         | 12 -----
>>   include/block/write-threshold.h   | 24 ---------
>>   block.c                           |  1 -
>>   block/io.c                        | 21 +++++---
>>   block/write-threshold.c           | 87 ++-----------------------------
>>   tests/unit/test-write-threshold.c | 38 ++++++++++++++
>>   6 files changed, 54 insertions(+), 129 deletions(-)
> 
> [...]
> 
>> diff --git a/block/io.c b/block/io.c
>> index ca2dca3007..e0aa775952 100644
>> --- a/block/io.c
>> +++ b/block/io.c
>> @@ -36,6 +36,8 @@
>>   #include "qemu/main-loop.h"
>>   #include "sysemu/replay.h"
>> +#include "qapi/qapi-events-block-core.h"
>> +
>>   /* Maximum bounce buffer for copy-on-read and write zeroes, in bytes */
>>   #define MAX_BOUNCE_BUFFER (32768 << BDRV_SECTOR_BITS)
>> @@ -1974,6 +1976,8 @@ bdrv_co_write_req_prepare(BdrvChild *child, int64_t offset, int64_t bytes,
>>              child->perm & BLK_PERM_RESIZE);
>>       switch (req->type) {
>> +        uint64_t write_threshold;
>> +
> 
> Works, but I think this is the first time I see a variable declared in a switch block.  What I usually do for such cases is to put a block after the label.  (i.e. case X: { uint64_t write_threshold; ... })
> 
> But it wouldn’t hurt to just declare this at the beginning of bdrv_co_write_req_prepare(), I think.
> 
>>       case BDRV_TRACKED_WRITE:
>>       case BDRV_TRACKED_DISCARD:
>>           if (flags & BDRV_REQ_WRITE_UNCHANGED) {
>> @@ -1981,8 +1985,15 @@ bdrv_co_write_req_prepare(BdrvChild *child, int64_t offset, int64_t bytes,
>>           } else {
>>               assert(child->perm & BLK_PERM_WRITE);
>>           }
>> -        return notifier_with_return_list_notify(&bs->before_write_notifiers,
>> -                                                req);
>> +        write_threshold = qatomic_read(&bs->write_threshold_offset);
>> +        if (write_threshold > 0 && offset + bytes > write_threshold) {
>> +            qapi_event_send_block_write_threshold(
>> +                bs->node_name,
>> +                offset + bytes - write_threshold,
>> +                write_threshold);
>> +            qatomic_set(&bs->write_threshold_offset, 0);
>> +        }
> 
> I’d put all of this into a function in block/write-threshold.c that’s called from here.
> 
> Max
> 
>> +        return 0;
>>       case BDRV_TRACKED_TRUNCATE:
>>           assert(child->perm & BLK_PERM_RESIZE);
>>           return 0;
>> @@ -3137,12 +3148,6 @@ bool bdrv_qiov_is_aligned(BlockDriverState *bs, QEMUIOVector *qiov)
>>       return true;
>>   }
>> -void bdrv_add_before_write_notifier(BlockDriverState *bs,
>> -                                    NotifierWithReturn *notifier)
>> -{
>> -    notifier_with_return_list_add(&bs->before_write_notifiers, notifier);
>> -}
>> -
>>   void bdrv_io_plug(BlockDriverState *bs)
>>   {
>>       BdrvChild *child;
> 


-- 
Best regards,
Vladimir

