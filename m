Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E492E341DEB
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 14:14:59 +0100 (CET)
Received: from localhost ([::1]:40636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNExv-0002Dq-1d
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 09:14:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lNEx3-0001lG-M2
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 09:14:06 -0400
Received: from mail-vi1eur05on2137.outbound.protection.outlook.com
 ([40.107.21.137]:61281 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lNEx0-0004np-Bk
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 09:14:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P0YDu7jhSOU72wnUhPR9/jfPta25bpS2l4XAQ7pFS6tbqQk1KZVd35dlWWymy+hnCIGIualOtAzO4kTpun6wvLCFKenT+NMbGJZZ+vHeyktzl0VqqYCT05HlIHve6EMIcuSIIiSYiIz2xtJNyrSp0Nk3Dzr5fiXUn1jDPXBNCvdFloEyp0gAyvKSiyvGiT6gnuu2GBGgPRCHbOt4izYJiCfNvJZTt7HqNGE7NIwxT+m7bKBjSa7HfSDa1PpbXqtt9ry8KAVptHoe5xQav4u3iIFlRc+WrX6XQY70sbpoIw+baPzlHVvJPUHO13CtQkAtx71jDr3ECyL38Gnf07iVxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v4DqzR0VJSQXKO2tT8HS0FVksQAKlZn6LoJdFoTh3Vw=;
 b=csTg9D0uWA0/e7YPj7DEH+uIuJTKDg1p+cjhK2oplqXJpXiG5v2aA8f1fIicLB4Epm54R1+/IBH8O0oXbB9K1emi9G0ClxZQdxgN3LLj+LN7pcu5vBHK+Hj/f4rHSDnDne0lAKcpwBsNp9DTEM+sAa0QAOt4Mhp3bbc7QxlIynuE7U+DzXI2UoererrNLt5QT4EG/F6ln7svThDv5l2rRAE6QingZnSB9YrJ/+SEh6ESjYAh+KbZbEHNyWB6q3CrbbR6BAo5Xgnh+a2A+SJzXunQ86trxva3nrJkVQNRzSKBnKUl8fYvlLTvo3W1mu/2lD6oIgsSGGvtqOqPhvNadA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v4DqzR0VJSQXKO2tT8HS0FVksQAKlZn6LoJdFoTh3Vw=;
 b=c7nk4YrVvFv7W9zMyxFf68TfgRwKtD8OS+Zd28OBxfO8jHoZY3hktcgG0R8LjZIgsNndsq6OFK7B5aFAwLs7fcjBokNF67x7tUsj/7Wl8Rjdroh0hX/MmySlCF8Y2M+eC0vG4lfsuUTCPCRS3KHVMo+/uOvsMvS4lqBqN5g5lDg=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM0PR08MB3364.eurprd08.prod.outlook.com (2603:10a6:208:e4::15)
 by AM0PR08MB4146.eurprd08.prod.outlook.com (2603:10a6:208:129::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Fri, 19 Mar
 2021 13:13:59 +0000
Received: from AM0PR08MB3364.eurprd08.prod.outlook.com
 ([fe80::7440:fead:287e:949b]) by AM0PR08MB3364.eurprd08.prod.outlook.com
 ([fe80::7440:fead:287e:949b%6]) with mapi id 15.20.3955.023; Fri, 19 Mar 2021
 13:13:59 +0000
Subject: Re: [PATCH 1/3] migration: Fix missing qemu_fflush() on buffer file
 in bg_migration_thread
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
Cc: Den Lunev <den@openvz.org>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>
References: <20210318174611.293520-1-andrey.gruzdev@virtuozzo.com>
 <20210318174611.293520-2-andrey.gruzdev@virtuozzo.com>
 <598dd667-9152-0160-b27d-699bffb955cb@redhat.com>
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Message-ID: <1686526a-1574-50b7-078a-1cb62dae2f03@virtuozzo.com>
Date: Fri, 19 Mar 2021 16:13:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <598dd667-9152-0160-b27d-699bffb955cb@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [95.165.26.68]
X-ClientProxiedBy: AM0PR10CA0062.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::15) To AM0PR08MB3364.eurprd08.prod.outlook.com
 (2603:10a6:208:e4::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.64] (95.165.26.68) by
 AM0PR10CA0062.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Fri, 19 Mar 2021 13:13:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2d725ca6-07d0-440d-1e81-08d8ead8db65
X-MS-TrafficTypeDiagnostic: AM0PR08MB4146:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB4146DC9BC9D60A147CFE8BDC9F689@AM0PR08MB4146.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CWpv6W44F5BgHZe8waEEA1Woaz7aKpkJscw2Pg5GcO2TFTPtm8pkA/oksqv9VYxxmtGj50jmCimQzEIflmC4TdDcKCSgj+O502ZVDa8h93XgzmLfxq0rTPHejsPK+RF469h6NP0d/dREgLEptqziPZ/IM+lBEhwud9oe4qtCEaRMoKDfLNaEm/xEsr6NgU5u3RImwjf8rikcJ8E/bkDS93qVcUTQ5Cl/nLi0e6KoRGJ7ewXDQP47milUC2+ZeND+8r9m1wY6Q6GnPx4pkAkfc3biHfSS97KuLbHBJz4qS+Ez0RMfMowF8oibVaLH5HLG8Pf5rjM6tVLfmmMR9jZxJy61z80qyrZtg8r2oS9lHiP9GXFX230jft0iSmUkWsyq/cImsdmNKX9ulRDAjDc+prwUSExY8GkLIaSWrqNq5AkqCYchjXD8jHSu0GuMg+JQ0icAYsDnqIfrzgGXyEBLfEIpUFtUizo1W7GKd+4xKHCgs+33o4xmG9oqrcdRoXj3aSE36AcEnZH3tgMnXRgDsvJKRMtR8snLiTeJZIHvM1V9TJnmZUDZb7wodNisFstU0vt0PCw5Ss0YR6pTncc26r2fwo5p+zW+FhCbUkzZTP1g0rAUsceWszxJ4c0vne7MN8tBN/m1/JqtT5sI/hibqkQzqUFPfBxEmT+zxdrHhai/J9S6hPa+dW1OfPGVaU/ZOb03dC3Fo5McbybJAicVNw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR08MB3364.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(396003)(136003)(376002)(39830400003)(2906002)(36756003)(16526019)(5660300002)(66556008)(31696002)(316002)(16576012)(52116002)(478600001)(86362001)(66476007)(53546011)(66946007)(186003)(6486002)(4326008)(26005)(2616005)(956004)(8676002)(31686004)(44832011)(8936002)(54906003)(83380400001)(38100700001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MFk3aW90UU52NzJUNW1HNDdHcmszb3laV0cwSUxpdkF2d1ZDN3JsRHBVKzN5?=
 =?utf-8?B?SzBaZEVqMytEakxCeXRucFhDS2NwUHRTZmJjN1B3ZGNMOTNVaGgzbUFzUnpO?=
 =?utf-8?B?U0xzSmd2WnRpMElyWFpUQzNGa0VHbmRwNXppeFZLckxZVDhrdUR0WW9XeG5h?=
 =?utf-8?B?cndtWFg4ODhrTVluU1ZUQUZjUFU0U09QOGZIR0JEMlNtQkNKWTVoaE1kWGVl?=
 =?utf-8?B?dGE5azV5RlVjQnJRWGdxaGZzcE1RaUlJVjlxcTJDQUdDMnRjWG1DQVZRNFBV?=
 =?utf-8?B?VHRkVU44eHRFU2hMOXRUNTRJb3VoRkgxLyt6a1JFaHBRdlV1S1BvY0x5ekxI?=
 =?utf-8?B?SHoxM0c3SnRwYWRnYWwvOG5ObG4wbjBTTlY1UDB6NHR6QU1XczQyTFdOdmZV?=
 =?utf-8?B?c1NORXY4RTZwbkkzYkdBWmQwWSszaGJ4NEJSM0lhc3VaWnFka2FaMnJQVkhM?=
 =?utf-8?B?MEJmY0NOREsrOG02eFNPTEVuelFnemg5Ti9QUmhLNWo5WXc4MzBPMkJYcWZ3?=
 =?utf-8?B?WGNHR01jYlZXNm9Da3EvZFBxVndGR25IZDJya2RpeDF1VEs2YUF0WnFjSWFV?=
 =?utf-8?B?Tnp5RFowejluWlVFa2hsaVFrdjVrMlpWbGZnU2RZWFpNZEZRcXRMTDBFb21w?=
 =?utf-8?B?Yk55VFNlMmVUazhjMVlGc05KT2o3STNFckpHR2lRcnVoT1JoNkV0bWhteFc1?=
 =?utf-8?B?NzAxWUovK2lJRzAvb0VrUlRwQlBmK2FCVVk3a3dJR2lFbzdVNlE0YWsrZ0JJ?=
 =?utf-8?B?NFAxMlJaeCt1d1dtVWJSMXdranZtWU5TMXFDRGRxRXdhakRCSVdsSDNoVkpW?=
 =?utf-8?B?NmNtRjBiOTVqeEVZdGU1cmtpN05qTVJrb0dWVUxOcGE2VU9GR0RvRzF0ZktY?=
 =?utf-8?B?NHhkdC9Rb1Z6MjVJZnBheWNVUjRLVWFhQTVXclVJVTlNV0ViTDMyamdyYk5m?=
 =?utf-8?B?amJaSzRmN01sdUxzMVJOT2xFb0Y3V2VhMlFHRVBNYXR6d005YW9ka1g2dmRm?=
 =?utf-8?B?QkVoVDlxRzZzYzVUeVNoTE1vZGpyWGY5TkNZL2lHdVNKT29CRzVxUjN5elhC?=
 =?utf-8?B?c2REdk1KTldpMDVYcklBYmxVSXFqMmZaZ0J6bExKcmhPZGhyUmliSE5nRWFn?=
 =?utf-8?B?VGJQTU5IOFVmZ3lnSTVEN2p3a0IyN1JCZThtVWhmdEk3MW50NVREUWgvekNL?=
 =?utf-8?B?SGNyRVp6UTZTeU1vNDRjazlpaEYyVmx5RHU1YUJRTTZobkRmZUVzaGRRMjNL?=
 =?utf-8?B?WUxQaUdsSkhTdElwYWpQNGhXbzhTaHUrUUJvVkUrZ1c2NldpbndNZFhnQU9j?=
 =?utf-8?B?Y0lRSW1IMnhGZkZtUVMvRmlSeHZZZU05STBwbVFCcXgrVmtxNUhtQm5PU2w3?=
 =?utf-8?B?T1o0ZS83N0MwUHNCRWhtQ1dCOUEzS3daazBhYTAzUVZTSXZxOXJPUDBXbVd1?=
 =?utf-8?B?eDVaeDhzcWNUc1lUeFEyZWtacG9NSkc4d3daY2JkVk1jU05STFFYNkNQVDhH?=
 =?utf-8?B?dlo1ZjNGNGdHTkVqa1FXOXhoemVoTS9wWXRtdUdjcWJDazZjSzVwOCtZV2Nw?=
 =?utf-8?B?SG1lTlJMUmY0cnY2S1FYMFVOczFlbVFCQXAyYkZINHVoanZicTNTeWlrRjJC?=
 =?utf-8?B?REUyRUFFRDhTNllRTzc2ZmpGeFRrRFNCYXoveGMyMDZaYTJuMC9UWk1aWjNN?=
 =?utf-8?B?S1NCUUxJZ2VnQ2d0ejZnWVlpY0hDSlBXNFB4SUQrT3RZMFRtTWRmU3drbXcx?=
 =?utf-8?Q?G32dYP2zYCSfJybpaGxD0sQWKZPvYnPl41GHQTc?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d725ca6-07d0-440d-1e81-08d8ead8db65
X-MS-Exchange-CrossTenant-AuthSource: AM0PR08MB3364.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2021 13:13:58.8947 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5vP9ywb5hYBB4D6cEvXcjQgeOPkbj4r8MyvMWbCB5DRffR/RuxggUYm+PdaEhD7WGRWYN4OVajhxyiTGm3i3QiyeDlxLiJ101yAwgk9p0dM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4146
Received-SPF: pass client-ip=40.107.21.137;
 envelope-from=andrey.gruzdev@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, RCVD_IN_SBL=0.141, SPF_HELO_PASS=-0.001,
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

On 19.03.2021 15:39, David Hildenbrand wrote:
> On 18.03.21 18:46, Andrey Gruzdev wrote:
>> Added missing qemu_fflush() on buffer file holding precopy device state.
>> Increased initial QIOChannelBuffer allocation to 512KB to avoid 
>> reallocs.
>> Typical configurations often require >200KB for device state and VMDESC.
>>
>> Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
>> ---
>>   migration/migration.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/migration/migration.c b/migration/migration.c
>> index 36768391b6..496cf6e17b 100644
>> --- a/migration/migration.c
>> +++ b/migration/migration.c
>> @@ -3857,7 +3857,7 @@ static void *bg_migration_thread(void *opaque)
>>        * with vCPUs running and, finally, write stashed non-RAM part of
>>        * the vmstate from the buffer to the migration stream.
>>        */
>> -    s->bioc = qio_channel_buffer_new(128 * 1024);
>> +    s->bioc = qio_channel_buffer_new(512 * 1024);
>
> ^ would that better be a separate patch? It sounds more like an 
> improvement than a fix.
>
>> qio_channel_set_name(QIO_CHANNEL(s->bioc), "vmstate-buffer");
>>       fb = qemu_fopen_channel_output(QIO_CHANNEL(s->bioc));
>>       object_unref(OBJECT(s->bioc));
>> @@ -3911,6 +3911,8 @@ static void *bg_migration_thread(void *opaque)
>>       if (qemu_savevm_state_complete_precopy_non_iterable(fb, false, 
>> false)) {
>>           goto fail;
>>       }
>> +    qemu_fflush(fb);
>
> Fixes: ?
>
It fixes unflushed QEMUFile, not an improvement. If not flushed, the 
migrate_get_current()->bioc->data
would stay missing some bytes at the tail.
>> +
>>       /* Now initialize UFFD context and start tracking RAM writes */
>>       if (ram_write_tracking_start()) {
>>           goto fail;
>>
>
>

-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                 virtuzzo.com


