Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7454F5EDC64
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 14:18:28 +0200 (CEST)
Received: from localhost ([::1]:34626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odW1C-0006uv-6u
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 08:18:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <michael.labiuk@virtuozzo.com>)
 id 1odSeV-0001Pi-Eg
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:42:48 -0400
Received: from mail-db5eur01on0710.outbound.protection.outlook.com
 ([2a01:111:f400:fe02::710]:9322
 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <michael.labiuk@virtuozzo.com>)
 id 1odSeO-0003ti-UC
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:42:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XD2/zFuW03zvIRi9gS+WoP79Orr6bBtl55YkJWK1nwcIDCbcmohVd4qCc5d+Afsvj2+lvaeobmMTYw+kFascK5ouo1q8dAQ9iTtaBqxcri7UqaNsVJCgybNC8FszDEGDMMssiN2G4iT2veniQeB1acYszta8MEPEl54ZAkFSMykQK6RPqSKFtinBR0yxGidjPfzqumGNraSb2wZgytCIRHAT+jmLLIWMcI6FZRMCxfUFYdwq6v6EQe628KCEvr+/2pnI3/L5OtwQYQ0yI0+aYeXwHsF3KGKQtn2KZnGs0GdR+0NpUOj7khBGjJJEGpvaGET7ODjt6kTjuqSBvG7bGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D1zN8opHnGhWukFCFXyIpO1lBDfcTPYEob5ZGZPddQI=;
 b=EI4MCelpCVZPxB+nTx1/JzEYgqdZ87pygV0mJR+gPv/p+HfG0DyVA0zTQiiyepHBmKPTfZxbtrOH6RyFY2mwEAQ9ZTtzSDWTwqR9US7t+5hUSSg6TJtRh/ni8NloxaM4R0lXfoi7UOlRQI/5WmL9vAXrtgA94DTJqdBrbQ6sB0WJhnYOY5/bI81S7VxpXdnQkPAuFaKwV3gQbqqlq56X3OoPpbtiMhK0JFBqYwhpo/MW8KkOA7cRezzWFJ9XfL16lve2xfHSHPLu9n9wvm2y4SqhtrKTZDeIT9IDCnNcPu2Pm2CmRJRB+F6iLM9Rgk3LjZYLrmWRYwoZ4pRdQQpyCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D1zN8opHnGhWukFCFXyIpO1lBDfcTPYEob5ZGZPddQI=;
 b=c90Qwv8i2riXj2W3Pt/VZoYifqlZhp3Ev74ik6THk86hRWl5XdnDBYiIebHVo82X3J42T2dzqQk+cdB+UfJGp3iGjwrqMYeETCvU3X0U5yIMLSCkPq/dD7fq524fVVsPRba09sxtZlGYAATWrl8MXqLP77s4j6LldQQIF25Z15vIjx/2oniY6Y6armN182Pr8agTMXP/kNKsvkhDUoEsOrGdBXNyjTLdg+NXaKIWqgEIvFomB9kyP+5sDb5wbBhwL7fLnkBvP9CYqcuMUDLc3DoXWd/cyU9AHzka2vY3zpwN9Jqzly71S1LkBnBD7QCBjVNHxHW07lwXWkydXUWXDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM0PR08MB3298.eurprd08.prod.outlook.com (2603:10a6:208:5e::31)
 by PAVPR08MB8823.eurprd08.prod.outlook.com (2603:10a6:102:2fe::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Wed, 28 Sep
 2022 08:37:28 +0000
Received: from AM0PR08MB3298.eurprd08.prod.outlook.com
 ([fe80::7f2a:a87c:67ad:8cac]) by AM0PR08MB3298.eurprd08.prod.outlook.com
 ([fe80::7f2a:a87c:67ad:8cac%7]) with mapi id 15.20.5654.026; Wed, 28 Sep 2022
 08:37:28 +0000
Message-ID: <9e8fa6ce-469f-71a9-0e8c-6836a679155a@virtuozzo.com>
Date: Wed, 28 Sep 2022 11:37:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4 5/7] tests/x86: Add 'q35' machine type to
 override-tests in hd-geo-test
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, den@virtuozzo.com
References: <20220920104842.605530-1-michael.labiuk@virtuozzo.com>
 <20220920104842.605530-6-michael.labiuk@virtuozzo.com>
 <8559e561-1f03-81e6-78e6-ba97bb74bebb@redhat.com>
From: Michael Labiuk <michael.labiuk@virtuozzo.com>
In-Reply-To: <8559e561-1f03-81e6-78e6-ba97bb74bebb@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM5PR0301CA0023.eurprd03.prod.outlook.com
 (2603:10a6:206:14::36) To AM0PR08MB3298.eurprd08.prod.outlook.com
 (2603:10a6:208:5e::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR08MB3298:EE_|PAVPR08MB8823:EE_
X-MS-Office365-Filtering-Correlation-Id: 16d24af5-06a2-4747-096f-08daa12cad3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9kg8j7kK0pmJYXoegE50Z1w07S20sljJjq8lfJngkIBuLF+3SkofvGz+mucCSbVRJBYtnHKHqT6GnVxaeSkJBiAFwlI0Cv5r+eg1/I3ROnzk+M9d9aYgkIk/HxDoSAKWKjobQIIGYi9YYp6Noj5XHfoamD7X09wE14cquJWn6RXBOlwQO6cgFFMQOkYhtzsQWQK/7CO31su610iOrQik6DRiDnzNlMxs0cJXkvtNlo7nJoQtrNXIowrBLX0tdfpCjREPKUXGvTcVF442/jxnR91P1wKYSmHk0q2Wnb59Srntp17wAYOtDh3mjS775CEKJi3wsklVVag7NhPM08SGT9ZjDOwHZQ9pHylRzjP5mbd+lznSjPki01/Jx97YP17fomZzQa/jzrZS6iSn9CKeNv85so9lzzq0oQnGfluRWYx4ca8Hmg0/B6yA4QXE91+FoYtsPs1XOFKyf4eJU6qPaJtfwbi4olBv63dF59Y9kk64YoRnUb1SiEpex4HwLt9ZzqzcTjuNCPkcITgkqq6rZCQsz27ECHRB9KFgmD4qYAcEix6vLIIJFbf81n94cKPtvXyFbDMVhqEt9iSIwi4ss06FXlZY5YM9N+1FAx0HcBFfsq5loZW0FSeVwLnJ7lPw3g8FuhkTSr7olEAGYUcOCs6/36ViSTiFkdmgFmByyhj5Nvkd5cxUGXMZ8Dw26UPvNMMcBbFSZUsdnzKCpcdP2xMtMqqjzOfp8THUstFwX4bA2aojQtqKUTBHSJrK867VwL+fQhp9Q7tJasacLaPK/B0H2QvNf0nngpduZai/8aA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR08MB3298.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(39850400004)(376002)(346002)(396003)(366004)(451199015)(31686004)(86362001)(38100700002)(31696002)(36756003)(66476007)(2906002)(44832011)(6512007)(8936002)(66946007)(66556008)(5660300002)(4326008)(8676002)(2616005)(6506007)(316002)(54906003)(41300700001)(53546011)(186003)(6486002)(478600001)(107886003)(26005)(6666004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0VTRTdLdE8zay9MRGtpSkdJdnRDMkE4QWRlQ3FSSVl5d2J1SVB0NDNWYTZi?=
 =?utf-8?B?UmxFcG5uOXcrWGpRZnF6NW5BN1NRZ2RjK0Y5bFRvaDVTM2xSWS9qZlNURUMv?=
 =?utf-8?B?VzloQU53eENCTkd6THlJRkNURkw5bUtwSUNIbWNMSVIwcXdWT0pSRXl6SUxD?=
 =?utf-8?B?ZG1JazNMNnYzUENTbTJsN2VtVWl0WnYraEFmam5rQnR0MGd0S2NMQVRlSEFk?=
 =?utf-8?B?cmlseWpUaSs4TkJ4aDZDRmJqVDBHRXBmYitZZWZJeUFQSlpYenROQ2ZMSEhi?=
 =?utf-8?B?YjRtN2dBT1VZUWVsUjNocm40QndrUGtJU3prUWhFWWxBMzhJSk9sRTJ1NlRJ?=
 =?utf-8?B?bEsyZUJmb1pnS091RW1jWjlJbEk5U2hUUW5TSW9xSTZIalpDNzZjTlZGNUV3?=
 =?utf-8?B?VVoxVUdHNVltSUg1OWs3OEN0Q0gwWFdISUMySXNKTkZXSzhSRW9MMVFZZVQ5?=
 =?utf-8?B?aVo1VzhkNjcvN2J0TG5mSzNhd2g5QmVBNGdvd29jMHFGL1FFUXlBVGVwS21X?=
 =?utf-8?B?SXJiejNsQXBBK3hoSXBNOUcyQVF4WDl6NnYxYjlTYXlTcVdndEpVS0kyN0I0?=
 =?utf-8?B?a0g1dzYwY0JMSHh3UG10R0NzT3NXUEZBRnpHYmk0SEI4TW9VTW1obHNvSndD?=
 =?utf-8?B?c2plK1ZvOWkvZitEZ0M0NVRZaFJ3RXpPT2xPU1doclVoRXdFMHNNMjVBUFpE?=
 =?utf-8?B?VC9xRW5FcGdpM3d1Sk5VZEQ2VzNtV3pFZ1pRSU9uamNocG50c3owWHhYSzJw?=
 =?utf-8?B?RFVuOVhMZG5SV0RmK24rbXZRL0ZqTUhmMzAyS0VuWXdMRlNPZmFuMTdHdUxs?=
 =?utf-8?B?eHI1UGtMQ0g5alVUc2c3WnYrZVRoU3pNenQ1NFM1Q05DUmRFMktSSitqTWd2?=
 =?utf-8?B?Z1I3eUJuZ3cwditTaEhCRGtKZjMyOFhnS2dhbVJlWUV1eVlaU2FiamtnSVJz?=
 =?utf-8?B?UVAwd0ZGMmRRdGtMbjduUlVMWHR6aCtQblE4cTk1dnRqdGtQNGxDVWVGTUxC?=
 =?utf-8?B?Qzc3S3ptdnpxUCt0QmlnZXUyaFZSSjhkMlFGelVpM1ZFUFI2R1ZRdTlZSVcy?=
 =?utf-8?B?V1BqVDhLU3NvcWlEVWZVL1oyLytrNTJKR2UzTDhzbUtsT0tUK2dhZjh2Z2Rn?=
 =?utf-8?B?QkZEZUJsVmZMLzNCa0M4bHZFbGM3YUZUdzBBKzd0LzdPZllsSWtjNVVUck9Z?=
 =?utf-8?B?czh5OFJJWnZrellhUzJ3YVNtM2RhWDZXb1ZkMnJJc3hxYTZOMmJNWWJLVEVJ?=
 =?utf-8?B?amtqT3EwMUpGMlFaak44bmJGWDEwT2lpTHdDRlExYjVYZXhnNVYybUZYcHhs?=
 =?utf-8?B?a2dzeCs5Sk5HRnhXRlpyMkk4WXB1ZU1aQ29MazdWWVRtaFNpUUJUVUpDK3hP?=
 =?utf-8?B?dUEyWjk2TVFZS1M2YncwbnhJdE9Ea0xSZWh0TmhOVmEzZklEWUJkMDJzZzEz?=
 =?utf-8?B?S0lRSUxXQVhHdHljTHJyeFduYWRQUVpDd1FxdGI4SzVqbmdqTFNCcjhTZUVu?=
 =?utf-8?B?MnBJZTdqRDR2bm9kcmQ2RXJlaVdRSTkwc0dvdlVVR3VDaTBmY3ZiTkZzNE1q?=
 =?utf-8?B?dVhUVGFuOThuSm0zMi8zd0MrelJDRDBuMTUzYlAvOFp5ZlhOSjMrVGFGazVB?=
 =?utf-8?B?aEFNTnFQMmdUMHRKbVhlSEs5NklpMms4OU04K2hiWGU2ZGFnVzhrOVcyK0px?=
 =?utf-8?B?UzlibzNQbmkvRU9lMk01RHowb0RWM3JGOENSSHhSdjBwQi8vb29ybStoTFVI?=
 =?utf-8?B?Wm1taVdSMVlhYThkZVVST0hQUkVsdFR0THdva0VMMmxaTzd6RkxGV3hVTFJm?=
 =?utf-8?B?cEVlU0xnZWxQeU9RVk5OWTdBN0lSWDhJVzRXVmxnVFh2YTdwbVdJRG5BSjk2?=
 =?utf-8?B?S1crdTU5KzMrWFI3T3IxZ1FHdFg4TktOOWF6bXFyS0ZEemNwU0VTanRUL0Yr?=
 =?utf-8?B?cEpYQS9pN3NvYXdPSGd4MmMyZVhLTDUyN05uV0NsS1l3ODVpQWlHWHdOZU10?=
 =?utf-8?B?WVFRRFZKK3BUeWFPdEo4NHJtYVFRbEcwU0hRdURHNE1yM3ZxSys1bVJUYm5M?=
 =?utf-8?B?SzQ5eW5tMmZIb1pNMTVGUDVsbEdBWmorUERSSjN5b2pkd2RhdEc5L2RJOU16?=
 =?utf-8?B?QXFkeU11QkZiSU1ObmVlRjJPV2JaOG8rZllBdkVncjJvYWdIUlc1RXVPcnov?=
 =?utf-8?B?VXc9PQ==?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16d24af5-06a2-4747-096f-08daa12cad3f
X-MS-Exchange-CrossTenant-AuthSource: AM0PR08MB3298.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2022 08:37:28.5912 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gRW6zBScV98sqDXxUbNTJnKVgN17Sx6Z8AQO/S54oGzvX8XCzBPlpk2of4B5SxqWiwBi3rFxmIzK5RwlHPhgFIGHrjCynwrTN/DN5SriXf8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB8823
Received-SPF: pass client-ip=2a01:111:f400:fe02::710;
 envelope-from=michael.labiuk@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.319,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

Thanks for spotting the typo!
It should be "q35".

On 9/27/22 16:00, Thomas Huth wrote:
> On 20/09/2022 12.48, Michael Labiuk wrote:
>> Signed-off-by: Michael Labiuk <michael.labiuk@virtuozzo.com>
>> diff --git a/tests/qtest/hd-geo-test.c b/tests/qtest/hd-geo-test.c
>> index 413cf964c0..58b1107d64 100644
>> --- a/tests/qtest/hd-geo-test.c
>> +++ b/tests/qtest/hd-geo-test.c
> ...
>> @@ -799,7 +857,23 @@ static void test_override_virtio_blk(void)
>>       add_drive_with_mbr(args, empty_mbr, 1);
>>       add_virtio_disk(args, 0, "pci.0", 3, 10000, 120, 30);
>>       add_virtio_disk(args, 1, "pci.0", 4, 9000, 120, 30);
>> -    test_override(args, expected);
>> +    test_override(args, "pc", expected);
>> +}
>> +
>> +static void test_override_virtio_blk_q35(void)
>> +{
>> +    TestArgs *args = create_args();
>> +    CHSResult expected[] = {
>> +        {"/pci@i0cf8/pci-bridge@2/scsi@3/disk@0,0", {10000, 120, 30} },
>> +        {"/pci@i0cf8/pci-bridge@2/scsi@4/disk@0,0", {9000, 120, 30} },
>> +        {NULL, {0, 0, 0} }
>> +    };
>> +    add_drive_with_mbr(args, empty_mbr, 1);
>> +    add_drive_with_mbr(args, empty_mbr, 1);
>> +    setup_pci_bridge(args, "pcie.0", "br");
>> +    add_virtio_disk(args, 0, "br", 3, 10000, 120, 30);
>> +    add_virtio_disk(args, 1, "br", 4, 9000, 120, 30);
>> +    test_override(args, "pc", expected);
> 
> Shouldn't that use "q35" as machine instead?
> 
>   Thomas
> 

