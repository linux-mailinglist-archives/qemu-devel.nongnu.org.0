Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B00A535554F
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 15:37:12 +0200 (CEST)
Received: from localhost ([::1]:46268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTltH-0004rt-PJ
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 09:37:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lTls6-000494-On
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 09:35:58 -0400
Received: from mail-vi1eur05on2097.outbound.protection.outlook.com
 ([40.107.21.97]:40636 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lTls3-0005LO-1h
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 09:35:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RY/Vo4MdwCxMDBWkRlnXl+zEpKFk4nIBwlEaONCBWKhd26BnDZVIsg26t/ZXabCR9XX5s1jBE7Qoi25bvWkINERqp2pbnb3x/UYXwoKBndKky1VdOopM1vlzJb25ABp5naFDnGAq2e+OSSbxcUGwDfLO/rEOFe9iBc5+ZyY9PrTlC+RnMPHf97SnRsbyvhXWKGwu8MX35smXiZwyS7JMRkUeQhuuNqmyvtxb9HH1ODiCwtv7KiLb7tdvfVy8C7njl8F4dqpajt7K1k9FAOC248/zHVSsB9F1ldcRvPnVtfwoTahmdPl6hkqUnbU9zHbJLoxHIEoCr32eBvGllCcRKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZG0kMFJFtggSIFIXgkHycHBlNX7W6pqp5Xh86B3CkyM=;
 b=BTV1Yong3ZO2UKYpt8DsCybgeec93Q40eJHnrwYOyGC/4eAaSHFFbEsuCHfRiXUWlqiKXImk7FIXcYgCN6H+poK0EQz+IcPXGnLAY36eIJzsDu18BP2yFRIqGVr/vA0b1J3msiYxgDlGF3dYS1FvDs5eEsZk0iHUziWTVpZZYG+JJk3J7GSK+xvIAq2EoxGUuGK1n0grnY2Leqed8L5MnnmRQTCQof0BLMr4SAUJoMT4QNqgZIq6WTK0p9wrFF4pWnvbjr+ov9G0C/Lh/7/RD/7CYzSr7B9VV9gacP0sAd11x+xBd85MPXL+OI5RXFrSxiBOm6GbGq7BJZ8UGcJiQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZG0kMFJFtggSIFIXgkHycHBlNX7W6pqp5Xh86B3CkyM=;
 b=SxF8j86xpgLHKoUG/SUKKTXrXmbkvEQPlIb4fWv2HLOfA20MWIfr6G2XiHzjhN8hbfomyEYKI/7jN4MQRFxOcQIXNAwGQPZHXprMwaOBAKgk/GNDJhWvqs2tznu3Glm9ZiNjmX+CjpBZQ3l+q5LieCXpMjVG4a/1WVW/fq7P+L8=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM0PR08MB3364.eurprd08.prod.outlook.com (2603:10a6:208:e4::15)
 by AM0PR08MB5043.eurprd08.prod.outlook.com (2603:10a6:208:166::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.26; Tue, 6 Apr
 2021 13:20:50 +0000
Received: from AM0PR08MB3364.eurprd08.prod.outlook.com
 ([fe80::a8e6:4693:824d:19f5]) by AM0PR08MB3364.eurprd08.prod.outlook.com
 ([fe80::a8e6:4693:824d:19f5%7]) with mapi id 15.20.3999.032; Tue, 6 Apr 2021
 13:20:49 +0000
Subject: Re: [PATCH for-6.0 v1 1/4] migration: Fix missing qemu_fflush() on
 buffer file in bg_migration_thread
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, Den Lunev <den@openvz.org>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>
References: <20210401092226.102804-1-andrey.gruzdev@virtuozzo.com>
 <20210401092226.102804-2-andrey.gruzdev@virtuozzo.com>
 <YGxUKvsO+Qw6MnMX@work-vm>
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Message-ID: <c05066dc-e64a-17e0-f087-3f7711d15a93@virtuozzo.com>
Date: Tue, 6 Apr 2021 16:20:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
In-Reply-To: <YGxUKvsO+Qw6MnMX@work-vm>
Content-Type: multipart/alternative;
 boundary="------------B67AA5D7D9CA1E71318B908A"
Content-Language: en-US
X-Originating-IP: [109.252.109.82]
X-ClientProxiedBy: AM0PR05CA0078.eurprd05.prod.outlook.com
 (2603:10a6:208:136::18) To AM0PR08MB3364.eurprd08.prod.outlook.com
 (2603:10a6:208:e4::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.3] (109.252.109.82) by
 AM0PR05CA0078.eurprd05.prod.outlook.com (2603:10a6:208:136::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27 via Frontend
 Transport; Tue, 6 Apr 2021 13:20:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8982d716-b040-451e-8b6e-08d8f8fecbc2
X-MS-TrafficTypeDiagnostic: AM0PR08MB5043:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB50437A6779F65B47FD6D0C259F769@AM0PR08MB5043.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0z55YTbTLw5SGd2kLr5cHqRx+3zQSc6VexfTfIO810Zjjb2gg489pw1YKLzmgDOXA/DEqTJOJLse9UtmkaNq/YrHKjVIqWbXsF5pLvAJfIeslyLuIvtqaBrI1PPbAjvBHmpUfqjroJNQNQwCnIVWzwIGYtHVR6xdZo1ws50uEjWVpld5MSCHSVavU/a7uAQkClr4hOXG3nkCkOxW4MKIGdAHLO5eDrvaLtiTHpwKDP4CruxGRgVSdDxJV1w0qr+no2GNXfpXXHdJ5bKNQo+uk+dqPqyyyqPpJ2GTJFXDTzxlMPHFJvKgG5qShwOUtTSRHXKCnui0Gh0yYV+ABomJAsh9Qa5XVD0IyFR9CHel+RLHVLZ2P3A0XFhEv22KaHoAHW+hYhxHxZVEejUuvz5MWpTjAGyjTP959ve7571VfTz+QJS1y6JECoTcmQDJUE0+mYanH/4WxRdZKcno5Gju+gM1LN5CLYbFHFpPdpZJ6Lai8067hJy+BU6AiM6NQmhfAoASIR6Cfv0pYVo7sUiRCbPAZuiMez7ntRLtY9TWdEwhEBghOsYxkdD38JwLhRL3cbNfjRWPWQd4VpUR6Lt37jBKeNeJWoAMVmFMh/2XKSvxwoFK3FtJWztcb3zGqQG4V93TOp56YZ1z/RbVpZ2hklpZNaX1l2qsCP03EcT0euaAWIUWEYI0Kxi1znW1oWriWrqkRW3kbSvEqrqIkBP2cmThQFk82WNVH7j2JuE+f5GTXlrRbsr8RF58BP+35uc9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR08MB3364.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(376002)(346002)(396003)(136003)(366004)(8936002)(956004)(5660300002)(33964004)(83380400001)(26005)(36756003)(31686004)(52116002)(2616005)(38350700001)(478600001)(4326008)(86362001)(6486002)(66476007)(66946007)(6916009)(44832011)(38100700001)(2906002)(16576012)(66556008)(316002)(186003)(16526019)(31696002)(53546011)(8676002)(54906003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bW5LdkZCMExrdXJkVGsyZ2VYcnZzODRoMVBoN3dzSS81ZXNqbWFMVkt5bHZM?=
 =?utf-8?B?L095TSs3cDBmVkRETlYvNkVpZEVTQ3FMY3AzY3BxYUlHZnYzUHdpZFZDNzMr?=
 =?utf-8?B?UllDK3hidW1NamhXcGZ3MlRSZ2NORXdDTmR6SGRveHEwVHA0WU1SS1RKRUFn?=
 =?utf-8?B?anJOQVk1bitsMmE0OTRxdG9MK3dEWFBoZDZOTGhnbmtpQVV6aGRhc0hyWlBH?=
 =?utf-8?B?Rmc0dGxtR2IvOEd5SGhuNC9mbDB6TFkyVW5jN282em1oY3B0RjZsSGlTbkJN?=
 =?utf-8?B?MGU4SHNQZ1FLcEFkeURBUlozV0k4b0xRaEFBWlpoM0VKenVoa0xubFJjbTRX?=
 =?utf-8?B?SlIzdGJ3dTBXY2lGT0JiYkVYV2FXdG95Q1p3VkVHa2FuRUJYQ0J4ejBHTnQy?=
 =?utf-8?B?Z1VnRkI4djduODMxNWZ0Q1Y0RVRiN0xzTS9qbWl1QXNiWEZyRk5OSjZsSTc2?=
 =?utf-8?B?cVNGeGlDTHlXM2RIQTFKTDRQSjVsM1ZIOFMvdy8xWjY3VjQvSS81Q29ZVFcz?=
 =?utf-8?B?NS9MTzR4ell5Q0grb2hxL2xpY2haMXlTQ2d5Mk94Q29iRkhLM3k3YitlYS9i?=
 =?utf-8?B?bE5jUlhXQ1lPdGRuM3pOQUdLdmwyM0FpNlU0Y2tnNmh1RGJUY2xndWJZK0tN?=
 =?utf-8?B?U1c5ZmlvS09jWXd6Q0tOeCtSSDRnZ3BPQlhGYlh3WWdmT2F3Q0hZcGJpbXFw?=
 =?utf-8?B?UWhyb3FGVDFLeXU2aEpmZTR3U1JMV1B5dTZ5M3BHUURrMXJlOG9nTDgvR1Vu?=
 =?utf-8?B?bjI0QWx1bXlzcG9pSU9pdE51MGxxUnJSOXRuTE1QclM0bUdONlhSVmc1KzVw?=
 =?utf-8?B?YU9yMFBiMGJyc2RxR1JqYWlMM2t3RWdabm5vZys3S255QkJZQVRTeHZzK0V0?=
 =?utf-8?B?WGZ3eWZvSnhNTVdFZUkzbUF1Zm1JUTc0UW14MCtlRlcrbmZmSHRsc0xMNWll?=
 =?utf-8?B?bmdZLzh3MC9vTXFZZXJXUjR5ZEwvQ0dpVENQRlpqbnhvYlpMK01NMEFzaGVQ?=
 =?utf-8?B?cW1yemNLVmprMkZORkRLOVlMT25IVDR0UFlhYTd6WEVzQ1VYYmYxdjE5VWJ2?=
 =?utf-8?B?UnJ6U3IyazNpNUZsVml3NDh5ZktGWVZlSUV3amxOZEFqbDYvU1Y3bC9VOHlH?=
 =?utf-8?B?Y0cvNVhPM2hzYlBaMkR1L3dGcmI2V01DbUQzODdqWlRRL0t4ZUZCanR4K1No?=
 =?utf-8?B?UVpkS0o0RnhFOGg1OTE1MjB2b1N1NEJlaVVTK1lDbjZGTlBrSzV1QWhKampE?=
 =?utf-8?B?RjF0T29neUlXZkJTSVhsaWp6clVvMCtGOWkvMXBGODNRN2NrbW9UMTFwY1hS?=
 =?utf-8?B?SkFnczhJaDZweWpOa004NXZGYTlqNkFkMWNuRHBGQXo1MmtneHE4Y3V0aUZI?=
 =?utf-8?B?NGZoR29yQlJnR2tIRmI4c2N4V0tWcEFwYVZ6cU1HMzQvd1BQaWxDVjRIajVT?=
 =?utf-8?B?YmdjQ1dEdzFwYzFxUVdRdTZKY3luTGUrenRiN295VDRHOHVTOEdnK3V2V0pa?=
 =?utf-8?B?RUFUa2g3MWtGajcxc0hnOHZzUVEyYUNTRXZUbnlSeUs2NmN2WEFKZmRDUXBW?=
 =?utf-8?B?eTIraHV6RzlzVWpRSmVxSjZiOHM2YjVMT0Z0VEViVG1wTzQ3eklvYWxJSVdG?=
 =?utf-8?B?SHFFVDdJYkVybWlYOFZnRFVSSnBpdklEeWtCY1dHdmJxcTV0MlphMks0aDd4?=
 =?utf-8?B?dGVXbHo0OE1teWlhK0ZMdzdCSWFkNE1GaGF3aUU5SVUzOVg0UHdNRThvNDFa?=
 =?utf-8?Q?Esrlnnt01b0BDT1j96sB7ejowMAFBW2HMgqlNd9?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8982d716-b040-451e-8b6e-08d8f8fecbc2
X-MS-Exchange-CrossTenant-AuthSource: AM0PR08MB3364.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 13:20:49.7760 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g5Q3bE4o9oAXKU/Ej7Ki5/ua3fwstBju6LDXAcKOKqEHY3Jsmnts6JdvYFPW39hUjrslGgywfWKFL2betmHm/5mD34jKwaf8bb4VaAjVrt0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5043
Received-SPF: pass client-ip=40.107.21.97;
 envelope-from=andrey.gruzdev@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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

--------------B67AA5D7D9CA1E71318B908A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06.04.2021 15:29, Dr. David Alan Gilbert wrote:
> * Andrey Gruzdev (andrey.gruzdev@virtuozzo.com) wrote:
>> Added missing qemu_fflush() on buffer file holding precopy device state.
>> Increased initial QIOChannelBuffer allocation to 512KB to avoid reallocs.
>> Typical configurations often require >200KB for device state and VMDESC.
>>
>> Fixes: 8518278a6af589ccc401f06e35f171b1e6fae800 (migration: implementation
>>    of background snapshot thread)
>> Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>
> OK, but in future, please keep separate things separate - the buffer
> size increase in particular.

Got it, thanks.

>> ---
>>   migration/migration.c | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/migration/migration.c b/migration/migration.c
>> index ca8b97baa5..00e13f9d58 100644
>> --- a/migration/migration.c
>> +++ b/migration/migration.c
>> @@ -3812,7 +3812,7 @@ static void *bg_migration_thread(void *opaque)
>>        * with vCPUs running and, finally, write stashed non-RAM part of
>>        * the vmstate from the buffer to the migration stream.
>>        */
>> -    s->bioc = qio_channel_buffer_new(128 * 1024);
>> +    s->bioc = qio_channel_buffer_new(512 * 1024);
>>       qio_channel_set_name(QIO_CHANNEL(s->bioc), "vmstate-buffer");
>>       fb = qemu_fopen_channel_output(QIO_CHANNEL(s->bioc));
>>       object_unref(OBJECT(s->bioc));
>> @@ -3866,6 +3866,12 @@ static void *bg_migration_thread(void *opaque)
>>       if (qemu_savevm_state_complete_precopy_non_iterable(fb, false, false)) {
>>           goto fail;
>>       }
>> +    /*
>> +     * Since we are going to get non-iterable state data directly
>> +     * from s->bioc->data, explicit flush is needed here.
>> +     */
>> +    qemu_fflush(fb);
>> +
>>       /* Now initialize UFFD context and start tracking RAM writes */
>>       if (ram_write_tracking_start()) {
>>           goto fail;
>> -- 
>> 2.27.0
>>
>>


-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                 virtuzzo.com


--------------B67AA5D7D9CA1E71318B908A
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 06.04.2021 15:29, Dr. David Alan
      Gilbert wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:YGxUKvsO+Qw6MnMX@work-vm">
      <pre class="moz-quote-pre" wrap="">* Andrey Gruzdev (<a class="moz-txt-link-abbreviated" href="mailto:andrey.gruzdev@virtuozzo.com">andrey.gruzdev@virtuozzo.com</a>) wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Added missing qemu_fflush() on buffer file holding precopy device state.
Increased initial QIOChannelBuffer allocation to 512KB to avoid reallocs.
Typical configurations often require &gt;200KB for device state and VMDESC.

Fixes: 8518278a6af589ccc401f06e35f171b1e6fae800 (migration: implementation
  of background snapshot thread)
Signed-off-by: Andrey Gruzdev <a class="moz-txt-link-rfc2396E" href="mailto:andrey.gruzdev@virtuozzo.com">&lt;andrey.gruzdev@virtuozzo.com&gt;</a>
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Reviewed-by: Dr. David Alan Gilbert <a class="moz-txt-link-rfc2396E" href="mailto:dgilbert@redhat.com">&lt;dgilbert@redhat.com&gt;</a>

OK, but in future, please keep separate things separate - the buffer
size increase in particular.
</pre>
    </blockquote>
    <pre>Got it, thanks.
</pre>
    <blockquote type="cite" cite="mid:YGxUKvsO+Qw6MnMX@work-vm">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">---
 migration/migration.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/migration/migration.c b/migration/migration.c
index ca8b97baa5..00e13f9d58 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3812,7 +3812,7 @@ static void *bg_migration_thread(void *opaque)
      * with vCPUs running and, finally, write stashed non-RAM part of
      * the vmstate from the buffer to the migration stream.
      */
-    s-&gt;bioc = qio_channel_buffer_new(128 * 1024);
+    s-&gt;bioc = qio_channel_buffer_new(512 * 1024);
     qio_channel_set_name(QIO_CHANNEL(s-&gt;bioc), &quot;vmstate-buffer&quot;);
     fb = qemu_fopen_channel_output(QIO_CHANNEL(s-&gt;bioc));
     object_unref(OBJECT(s-&gt;bioc));
@@ -3866,6 +3866,12 @@ static void *bg_migration_thread(void *opaque)
     if (qemu_savevm_state_complete_precopy_non_iterable(fb, false, false)) {
         goto fail;
     }
+    /*
+     * Since we are going to get non-iterable state data directly
+     * from s-&gt;bioc-&gt;data, explicit flush is needed here.
+     */
+    qemu_fflush(fb);
+
     /* Now initialize UFFD context and start tracking RAM writes */
     if (ram_write_tracking_start()) {
         goto fail;
-- 
2.27.0


</pre>
      </blockquote>
    </blockquote>
    <br>
    <br>
    <pre class="moz-signature" cols="72">-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                virtuzzo.com</pre>
  </body>
</html>

--------------B67AA5D7D9CA1E71318B908A--

