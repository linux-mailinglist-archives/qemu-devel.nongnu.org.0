Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A9B31067C
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 09:19:10 +0100 (CET)
Received: from localhost ([::1]:52740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7wKa-0007BU-LX
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 03:19:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l7wJC-0006Ap-AU
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 03:17:43 -0500
Received: from mail-eopbgr40105.outbound.protection.outlook.com
 ([40.107.4.105]:58148 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l7wJ6-0004nT-Sg
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 03:17:41 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kKucP1IAraZPPXC8rW70dcOPiGHlhkU+ULg1UtfDhIdH2ixlOzZpPGtQf3dYiW+krK9t43D9ATQblQC9ThcvM4nBKLfv8PIbWn9pXnV4xOWDhgwyCNhw85qlTws5hciITazA1iQETAxXqe/kRIv8o+t44FgchBwGP22AWrtcXrKf5pUtYZ0bHkvWG8/oGOjSv6H+Pv43u+7JnUAF4pkgqPHy0u7Yf0ldTh0Nxtj5EyYkmMItxrv1K/OfCjPGtqWfS0Co4XWTbjR4YFBo+PiW+u2P1+Or/6jAYe0amPob6YxBLkoFwvvWcAITQLLMe6VjVmaDsFORCKYwrXyuo2Q/Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ffWUFaVeXxrG65I8Y/M2OpgUJ9TJlksNebrSWVWXmU0=;
 b=UejJQQwXS6G9lJg04iBpKJaeJU4MDqYKXjLcO++b7CHNmsIcO11BiDGV4wvIO0ev9xh0mDo1FYiOU07TamLXV73WPCu/HmXc/rIFBGOfnGNrPSBBbGIFyW12KfXsc+0xEpAuamMmQXyA9sYo6vQWV7fAix0qQkvhWVjrLKvqh8RHXkIQoCdDyFFcOBNAw+IQz0UDPRoa3ebHTp59FvfvVKgnzC1sT7mNWSgX6CuhI2WNxBCXeHzw7j3WAohYYj3TQq7S5vMbDzreye4aFoZmdKgYn+DJoUWh8I0O/63jukVIG3JE9PMgMTN7kuAsxBetklwVIAd2soxlqd2eqKJ8Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ffWUFaVeXxrG65I8Y/M2OpgUJ9TJlksNebrSWVWXmU0=;
 b=tMgbTquepp0HMNKRF8AzxFHOjH1dBuoLNfk9uCHevWoDNVcNyjp4ryZkmQZkxUX2yARlLfcyCMowi5sDeTa6EA8KWEiymrFVppNV/R36OumY+9Td7QH1e+AIeNt66wKqnwC6lOmWhg3LydObmKrQcvGwUS2Pn/YpW5h0CNc7AjM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4786.eurprd08.prod.outlook.com (2603:10a6:20b:cc::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.23; Fri, 5 Feb
 2021 08:17:32 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3805.028; Fri, 5 Feb 2021
 08:17:32 +0000
Subject: Re: [PATCH] monitor: trace qmp_send_response
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org
References: <20210204222444.22217-1-vsementsov@virtuozzo.com>
 <874kir6j8e.fsf@dusky.pond.sub.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <57b5be3a-ce9f-51f8-9ac8-7baf20823723@virtuozzo.com>
Date: Fri, 5 Feb 2021 11:17:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <874kir6j8e.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.213]
X-ClientProxiedBy: AM0PR03CA0022.eurprd03.prod.outlook.com
 (2603:10a6:208:14::35) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.213) by
 AM0PR03CA0022.eurprd03.prod.outlook.com (2603:10a6:208:14::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.17 via Frontend Transport; Fri, 5 Feb 2021 08:17:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4b100db0-67d7-4cd7-0ddb-08d8c9ae7caf
X-MS-TrafficTypeDiagnostic: AM6PR08MB4786:
X-Microsoft-Antispam-PRVS: <AM6PR08MB478667065BD1FA6AE4598489C1B29@AM6PR08MB4786.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:54;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YfUCQJjRBXwPdrSihyUt08PkgiM+Mt1nT0CrAnYrd2ybMziWeT+H0Gl8AZhkXYIzKsP4ZfwfB+EMnCcXGZTwz6HnOmXLYTucaO7+oPZcW8XhaQhHPJc1SNPHb2dtqshrtDylp6jf786mC+EhSSRNPWLYJCUH8RGPbQNq1JxOS/MtfM8vSWl5LsIvWRqdZ7Z6pFKgcybH2+KJIfVNFGrbQ9aUfSNhrhB/sCOjSe3CeLGQwajp0/NayNLi9Q1t88fbxjD9QQY/zbDaXM1S/pVHCIify75x+j8t/qPx7MjqNK0yZzADJIUlOZRrDJ/yEicwSZte5xtzezgf1SfzeGBY7TQpwCLuc/H4wDXd9KJhY4XaNV60vumqlDYHl1PrM5Ja+FSQvKAEARvxu4f/XPFujAG6RlXyqWAa54ngbm5z29L92JGLjsVwHSFDMXyl2yn0GrL2P6uG/nMwNAilgMz8IwNKgtxQzg1hvbnpX1aHWDRpnDDjGMkFqEuUmgPdtY4/zzo810LobOT+qBZzcQVJSThdc210JzWGcX/7xM8nN0LZkUzucU6Z9CWQafp7S7dMa8TtugFukBUuEpTaXL01331RkjLwFZF1HWoq0fk57vU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39830400003)(396003)(136003)(366004)(376002)(346002)(6916009)(31686004)(4326008)(6486002)(16576012)(186003)(478600001)(16526019)(8936002)(83380400001)(316002)(2906002)(36756003)(2616005)(956004)(66476007)(66946007)(5660300002)(66556008)(86362001)(8676002)(26005)(52116002)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?L3BLL2VvRUJOWm9aaHZuMTlMajFTUUhZdUF2MHB6ZmF2a3RVdS9xVUJKekxL?=
 =?utf-8?B?dlNGdUN6Z3UvRDBpcXR3bVFnMjRhVVRZWHR2Sk5CMDQ3SGZRdmpnNVduTENC?=
 =?utf-8?B?WGtYSVRqdTQrNFdHTUFSSFdHR0VQZWhLV1QwLzI0RGFiQlNab3k0Sjd2QzdI?=
 =?utf-8?B?TWFndjhJeFFtdmlDZjhlVUp2TkVXS0FoYnEzRGNPTGw0clZVUlB2bTJ1L0c1?=
 =?utf-8?B?UDJjMVRtQ3VKeUxJMnlwNlM2d1ZoTVVtTEc3ZFFNK3J1c3BQaW53NDAvdUd4?=
 =?utf-8?B?eGFINVJjZUFNcWNiYnIxaXF1SEJqZnNHVHpldXJHVWFpM2Q2eEE5M1dDL3JH?=
 =?utf-8?B?aE5OZ0FSeWlWZ1F0K0FHazZ3blk3UW1FN1E0TGJrOXFKdXpWUGsvMGdIeWdm?=
 =?utf-8?B?Y3JnTnlPK1VUZlBJUWQwTUdsVjlOZVRlMk9pYWRucklyU0k5S1FCd1k1Q0lm?=
 =?utf-8?B?a3BlQXVLV2NjeFZmU21yMlBhM0R4bGJFSGlLWWRtRndZeHhlZ2hDd2ZlQm8w?=
 =?utf-8?B?RFRVcGRVOVdHU1dYTjVJTFMyU0p6UTRzeWJobWFvU0N6VkJTSHlJalJpcW1l?=
 =?utf-8?B?Q0xCSTg4b09BN3plV2VZckcrSnpTWlQ1ZW1scXlaN1NtVGRXWkRjS244Ukw2?=
 =?utf-8?B?Z2FBMDdwWWtXbTUxeGNQbVcyWExiaGhGVjhFYmxGOWxyYlM2ZWxaRlVTWEpt?=
 =?utf-8?B?RWJ6SjZtaG50T2VCT3V5Tkg2NkVGNmJkTTd2L0VoeWxvekUySFBMK3RncFNR?=
 =?utf-8?B?S1Uvb2ZJZkM4Q3h0cVB2bUk3K0FZMXNMUk5LZkNqeHlTcUpxK1RjaWJRUE1D?=
 =?utf-8?B?WUhLMndobmdEd1ZKTmRiK240N3JVcks1aGJnN0hyQUhWU3V3ZGwreVhTZnlY?=
 =?utf-8?B?aGY5UGwwZkRsN1YwNDFUcE90MEFtZS9IdVdZRjFRUmhoNmd6SzU2T05URzJ5?=
 =?utf-8?B?U25ZaDdKU0lLT3NHV2Rac1FUanIxZjhNblB4eUI3aDlWTi8yemxpUEJ1Wmxx?=
 =?utf-8?B?VTlsWEwwZnlZa2R5T0IvcVZINmNiQlhWY2d5eXowbDloeVdiRnZVSDl4RmZ4?=
 =?utf-8?B?N1JmQkpWOXZXQ0QvZ3hZWEp1Vy9jcUpLNUtLSC81VVRZcUFkN2ZUclFLWTJQ?=
 =?utf-8?B?RStoUHNTeW1ueVZKRm1rVVBPMUpzV1J3SlF2Snk0VWFHUWhvaXc0NGdkM2s5?=
 =?utf-8?B?dndJdXIyZEtvSG11ZURqSmFXengweEhxeXBOU0JKT3VoVGZnNHhXS1l4Qlp2?=
 =?utf-8?B?MGhKMTBrSEZVeFQ1Ymh4Wm4xL25QUEs5OUlZcHp3V1drMmhjbHVNSzhLL0NG?=
 =?utf-8?B?aERPNmN4VVdoVUlPMTQya2VQZnRJUkFaaGRHZmtNRW9LeFFqSmJ6V1JaMm9O?=
 =?utf-8?B?TVI5cm9KTFBCTkNnYmNuR3V1V2ZCSzlSQjNkQlFEbnV4UG5HeVRCTFFoOTAz?=
 =?utf-8?B?RUJucDNPbVg0ZlM3NjRwYTRhNGlET1lvTklyTDhHUWpPVjV1eldiM0swaGhp?=
 =?utf-8?B?VS9FSFowVUNDcHlPdkptKzVOaUdyc1Jua1lvK3MyUGtlMjFCSGM5OEVDVDZq?=
 =?utf-8?B?Um5xekc2TzIrU0kxamI4WEIzZTVlNVJUUHhwQzVRMllXMGgwTm5BamhESEhI?=
 =?utf-8?B?OWhVOSt5TkE3UlNYSjFDQnRMdFlibWJEcW1kelowWGNOU2EweGhTbmlJbjZK?=
 =?utf-8?B?ck1PcTB3QnZKYU1EWFhxQXBKZUZjdDRnd0V6cStRTFJIV0RlMllYUmxpK0VW?=
 =?utf-8?Q?Sx0DM5GW7so+nCm1qEg+gymkZ4oK3/miHiHf1E0?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b100db0-67d7-4cd7-0ddb-08d8c9ae7caf
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 08:17:32.7190 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3cz7K0ompPPgTYzBiy0OuMFTWtl0NV/7qq1WoAxnwRl3d+DUp2/etyEqWzcPCYZODswdCVXglvA77I0mzyOkSPfVh0Q86JQqRTDfJhpSJ1A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4786
Received-SPF: pass client-ip=40.107.4.105;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.182, RCVD_IN_DNSWL_NONE=-0.0001,
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

05.02.2021 10:56, Markus Armbruster wrote:
> Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:
> 
>> Add a useful counterpart for trace_handle_qmp_command for debugging
>> libvirt guests.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   monitor/qmp.c        | 6 ++++++
>>   monitor/trace-events | 1 +
>>   2 files changed, 7 insertions(+)
>>
>> diff --git a/monitor/qmp.c b/monitor/qmp.c
>> index 8f91af32be..772b9e7b30 100644
>> --- a/monitor/qmp.c
>> +++ b/monitor/qmp.c
>> @@ -111,6 +111,12 @@ void qmp_send_response(MonitorQMP *mon, const QDict *rsp)
>>       const QObject *data = QOBJECT(rsp);
>>       GString *json;
>>   
>> +    if (trace_event_get_state_backends(TRACE_QMP_SEND_RESPONSE)) {
>> +        json = qobject_to_json(data);
>> +        trace_qmp_send_response(mon, json->str);
>> +        g_string_free(json, true);
>> +    }
>> +
>>       json = qobject_to_json_pretty(data, mon->pretty);
>>       assert(json != NULL);
>>   
>> diff --git a/monitor/trace-events b/monitor/trace-events
>> index 0365ac4d99..12f0576c7b 100644
>> --- a/monitor/trace-events
>> +++ b/monitor/trace-events
>> @@ -13,3 +13,4 @@ monitor_suspend(void *ptr, int cnt) "mon %p: %d"
>>   monitor_qmp_cmd_in_band(const char *id) "%s"
>>   monitor_qmp_cmd_out_of_band(const char *id) "%s"
>>   handle_qmp_command(void *mon, const char *req) "mon %p req: %s"
>> +qmp_send_response(void *mon, const char *req) "mon %p req: %s"
> 
> A slightly lazier version of this just landed in commit f680405f45 "qmp:
> Add more tracepoints".  The difference is yours ignores mon->pretty for
> tracing.
> 
> Thoughts?
> 

Ah, missed this, great. Then, nothing to do.

In our environment (I'm not sure who do it libvirt, or other our tool) different query- commands are called periodically and their output is big enough, so I decided to trace json in oneline.. Still better is developing a way to not trace some qmp commands and their output.

-- 
Best regards,
Vladimir

