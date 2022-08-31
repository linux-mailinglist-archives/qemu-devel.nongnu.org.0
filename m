Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A28405A7B37
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 12:19:43 +0200 (CEST)
Received: from localhost ([::1]:34334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTKow-0005MJ-62
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 06:19:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <michael.labiuk@virtuozzo.com>)
 id 1oTKlr-0003Cv-Rt
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 06:16:31 -0400
Received: from mail-db3eur04on072b.outbound.protection.outlook.com
 ([2a01:111:f400:fe0c::72b]:43427
 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <michael.labiuk@virtuozzo.com>)
 id 1oTKln-0005DD-RJ
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 06:16:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gC8xgpVpl4nlFAvAJsLfNmnm2rNk6X5NhWnpvXHNxAs6ARvYyI3i1jTlj43aK3GsymiDmOeNmG7VrLUjJZEY5ObiVbMzlcEgg5heHFMUqw+M/hY44mgiYoIHYu+udW/5QYlnc0iS0PBj+HBKQWto8xoRPxVB+GpedPTu7UZNwfGM47hXqfygMXU34Eil7++s66veOoVaCFK+1M8aZC9i7opzuacDQaa5upoxnecPxQdeWTiGEJmIeq0LZeinhvpGCKRs8heVcwZx+s0KnzQmYwLW5npEvxBRRtxtzPjuBcp1eXX+1cmwXgaCCUGUsIx4wPUfYqbxiUd+abh4tcs31w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A2VE5vdhNYgW0kKBQGVPOZkibijMRiccqEjcduYAFlU=;
 b=ThIXpaSS6VUvUbYV1XG0ZobKvhqAUkR1+sciBrB3uNXhn0xPv4zi2G4PTgNsLhgsoZ6orOTDNkxGnkFWd2NtuV3Qd2oRhwJ8QVkvNXROHxW16+Nx0S25m/pYMWvW44HIzeNEqrdpB/TVEgqB0miIw+2aBDp8w/JGn1Xt3ZMDjV1yvTvVh/B9qs8/+g+FdsB770D+YA96K7If1qH4CNKzldwQ06IJHSkIH2fqr6+BvU4z9K2xUiSga0JtXu6UOEp2QvxTCx5gUhORdt0MZttop8Bn6GiGnQ61CL90tWHoDG0NUSE3+Ig53MJiywtF7U27v1W3rX53GI17H6GtdZj4mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A2VE5vdhNYgW0kKBQGVPOZkibijMRiccqEjcduYAFlU=;
 b=ZF3fJVEvKPKK+ApUdR3Ui4roziTVZgFIQWiozV5wNzsBf5tfavGoGN2c1cOBA5x9wZliAstboCl49PaC0at8OC++AmkL8HZyilJJZsy1dbyBPOCyI+0F9gqd79xDa/xJrqZ52OmDAheimlyckTNfpVfO11wZWitu1dod/0nrjiUtF6Xka9o/31nX1LLLQ/yZnRhK8ayRGRqbO5b0LkoPkIJqlSI3sAlC3sKOj7yaE0MBNSPlEkZ1eUHnisvZroHSd0GjGX1TPcY27b9gyXjdEMBYLZU0zS3g6s8X7R1lgrA1GB3vRMyYQqFq9H+WuIzjQ80fL9lbxlH6aA4XD8g3vQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM0PR08MB3298.eurprd08.prod.outlook.com (2603:10a6:208:5e::31)
 by DU0PR08MB7809.eurprd08.prod.outlook.com (2603:10a6:10:3b7::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.21; Wed, 31 Aug
 2022 10:11:20 +0000
Received: from AM0PR08MB3298.eurprd08.prod.outlook.com
 ([fe80::b559:fa97:6603:5335]) by AM0PR08MB3298.eurprd08.prod.outlook.com
 ([fe80::b559:fa97:6603:5335%4]) with mapi id 15.20.5588.010; Wed, 31 Aug 2022
 10:11:20 +0000
Message-ID: <89bd52be-3a59-5466-e3d6-f70d4469f2dc@virtuozzo.com>
Date: Wed, 31 Aug 2022 13:11:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] tests/x86: Add 'q35' machine type to hotplug tests
Content-Language: en-US
To: "Denis V. Lunev" <den@virtuozzo.com>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
References: <20220826114159.6370-1-michael.labiuk@virtuozzo.com>
 <e344f9f1-2dc9-5fdc-77e0-32900b721d42@virtuozzo.com>
From: Michael Labiuk <michael.labiuk@virtuozzo.com>
In-Reply-To: <e344f9f1-2dc9-5fdc-77e0-32900b721d42@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0008.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::14) To AM0PR08MB3298.eurprd08.prod.outlook.com
 (2603:10a6:208:5e::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 216536af-70dd-4c5a-c09b-08da8b3926b2
X-MS-TrafficTypeDiagnostic: DU0PR08MB7809:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aLHFDKLRZGuemisSgRWBlrIpqdq3ElMemomz20qVmTORiww6yM0487JZXVrAxp8j2/baWmTM2MH4VYCTzb1G73WuttPCs0owMue4OlVlX2YZsSZ91bJfCxLwuUPHr/ei/DsIJ0Z+EKzKpB3YYR9Qtu4vB7tQT67TeOQt/vaDF9ZtjE0GZaq5KxRXfJLS8Yjn2fCW+Vj60pMGACQQVMJZHRf0QtTRuC2sVT0f3L9EPpSZLivJBJoivRcGBsbYpKFJPmVLaMFDXYi3m+AuznKClFu1GYYb4vzDkuTwt6kzKUpFCX2yudPbZDwuAg3YE6Dar3YDJhoTL5AgWXfTKzzreBMiZ0sHZnwLZOomFp/MbLlfoaanRLgI74Yd8pNg6ZtfT3pwqu0Dx7Z3FnPlau0sn0lXzjEvTa+d4GOjuRuXD6rE1iQrqGAup6QDJ9YYqlYbQCZ3qh84ufCymzGxgRUmVuOYZchmO9lp7qgPxF+uRYWg+2IILcToTYnyOXKZPDlE4e4AEjYuYCm5m2oaCs6ogsi2Edm3kGxU8iztUh/4TuOIhG4PFwPHeMeJnzeYY4Ifwf2gtWKDXpjpoEL/6X7ql104JxEDqJ0GGrEF7dwf7bc2TXEjC3NOCjFFh/fbMb06F/cBuLJk9qsDa3ffL0HGMoJqbxFcwfsO2yOxr+sQOcP1tiOVg3bTqS/kqcyVQ010O2F/jo+0DjHwVxpV338oJ45h5hoaMP2MWY+H3WHT7OFdRsqij9S/mqTw6ytuez4Ppz2HpmsKLmpXXIMWjU/OooUclOcJrEnhjBuw9jaEbX8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR08MB3298.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(366004)(136003)(346002)(396003)(39850400004)(38100700002)(26005)(53546011)(6486002)(6512007)(6506007)(478600001)(41300700001)(86362001)(31696002)(31686004)(8936002)(36756003)(2616005)(83380400001)(4326008)(66946007)(5660300002)(2906002)(66476007)(186003)(8676002)(66556008)(54906003)(44832011)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b1c3ODNQRTRiQnkvb2Y5VDY5K3B0VGh6UEIrUnhOeWRhUVA3Ym9xVUtjS2c0?=
 =?utf-8?B?MFlxaGlrMXdzS3BlUUdrb3NweEJUcUUvb0FkYjhaQUJiemNJSUhCcmxwZFFz?=
 =?utf-8?B?Vnd3OG12dEt4eksrenFQb1JDWm9ybWd4Z3BYL0lWWmF5MVhVcjZRTG50eFpQ?=
 =?utf-8?B?N0ZhZzg4TzJKbitJVzB5TjVublJOVGI0OEw0NXJLa053MzY4VkJSMVJuUnR2?=
 =?utf-8?B?K3dCeEpwSkVqZVpWckdWQk0rMWZ2SkRXazdkUE9HMVp0TTVkWFNaT210OU1j?=
 =?utf-8?B?MmpUNVdTWkVQNHpHM29iZEF3eXJpaVA3TU9IWG0zd0V2N200dFBYR29abHFG?=
 =?utf-8?B?K2hsWG5XYm8za3NtSlM2SEZJYUxFa3p4WHYyV1N5aUtMV05QaVNsSE9Uejgy?=
 =?utf-8?B?MXNtQk9qTER0NmU5d3orL3V5TDBJTlJiRGFPNnI5UnptTDN1ZTk1a2FrUFBU?=
 =?utf-8?B?bHdTR29HUVJYRldUdkI4cVBYQTR0c3ZuM1hYK3JGYWN5QmpwSHc3YWpuU0xC?=
 =?utf-8?B?MmZVYWtKbUJOdGMrZUlEaVN1N2U0ZmVSb29hOHV5anBGNHFRN1I4aHpzKzJH?=
 =?utf-8?B?MXhYV3lDaE5VL281QUwxV3QwTVFNQ3ZLVTFraGdiSTNHaUpZNThodHdZWEds?=
 =?utf-8?B?NXNjTnlabHdGTkJRSkMwZEp6ZlkxcEJEc2xZb2t0QVZKWjduK1N4SU5MS25h?=
 =?utf-8?B?b1BOWGs1a3MvaVN4aEpOUWliQ3VsM1F5ZnVHa0NkdkZXS1l6VXdWR2NoZ0hx?=
 =?utf-8?B?QnlUQWJhdXpINFFIa0IycnhpeTc0Mk10U2tMVXJxYlhmV2hoR2lES2YzY2Fw?=
 =?utf-8?B?SjhCZFFxQzlpcDBRMW9MSmFYNmg2ak5MKzAyRE1zZEFYSjN1YloyNGxZdzBx?=
 =?utf-8?B?Y3hUemROZGl1emU2ekVHMVhsL3ErUkhTdGp5QjVOck5IdVNoR0hDQlZ6bEM0?=
 =?utf-8?B?UFJrVXpwMXlqeDFiZHRCYmRHTzdYSHMvNVBGR1pUaEdMb1VrSTRqNSswc0RP?=
 =?utf-8?B?a2ltdjArbDRRRjAvajZhd2tYSldJZjJmMFVIcElKRjdtZ1hKRTJUdTZOSkxT?=
 =?utf-8?B?a2lzdFpHVG1sYi9FR05sdmN4R0ZSNHFvaEkyOVhQendXcThnYWZTZlowNWpH?=
 =?utf-8?B?OHNYNS9SRUV2bXBkZGJXci8wYWNQNzV3aVNRcGJIenI5bmFNWmttNndPay9n?=
 =?utf-8?B?enZYTG9PL2dzZXFQalNCNkFqMUFCdktSWkQxVVBSOXZTWmxNZmt0OFV1TFFr?=
 =?utf-8?B?T0R6RG5FazBzOHh4dm82ZThDK0QvTUhTeDdXakMxVlljQVJlVjlpd0FwZisw?=
 =?utf-8?B?dUcvVHlMWElpSkJPNHhPWm5LeU1nNzdld0ZWbkhFTEtaV3ViNWt0ZlVJUUZr?=
 =?utf-8?B?VEcyUU5pUkNBNTR4ZkV4Tlc4am1jaFlLMktzSTZQUUNpL3p2YTlUUi9yZmps?=
 =?utf-8?B?d1lNUThoOEhrYXQyaXhKL21SOU1CSzJCbk11WHg4cm1IcFZVR1oxcWJaQ2pQ?=
 =?utf-8?B?cUUrSzVHKzkzYnFrMVNZSFd1VVlKOVczdG1qTU0rQm5oVkVWVUpSR2h1TlJL?=
 =?utf-8?B?WkZvRlRvR1BkUi9BYjMrMFZDck90SitDYUhaclhnbldGMWNIejZLTUp2Yk1U?=
 =?utf-8?B?clhKQklWRzhzdkZlam96YmJmbWx6a1RoeFFHa2ZTOVBZdHhpU0dFMFlzVG5Z?=
 =?utf-8?B?QkJXQzI3VFhrU2U2LzNpWEFOQUgyZnJKSHlVRkFJMk00b1JTQ0RRbk9qM21z?=
 =?utf-8?B?UE82VWVuSlNVZzBvV1lCa0hlUXI0RXZQbTQxU1MvZEFOb2pZVkV2V0NsOElz?=
 =?utf-8?B?TGNZa0Z2RTZzYktOWmFlTFlodzEzYzhsUEhEWlQvNkMvTUg0TGZOUS9OcTE1?=
 =?utf-8?B?bEp6VDd0dHhRRXU1RU5HUHNxR2ttOG9VeHZpYno1cTdyeTVWZDY0R2F1ZHdQ?=
 =?utf-8?B?cVl3RmZSL3R4OXBRRGo1TVVzTUpFZHJmUVBHQ1h0M1o2NndQUXdSMGRZVi91?=
 =?utf-8?B?M1kzbFUwazF2enlncDd5MmFPT3ExSTlBcXp3OWlTVnphVHYvWmMrWERiK21q?=
 =?utf-8?B?ZVpFd1Rka2gwaUgvMk1NU2RRb3cyRDNvNzVJSC9zWTl2cUQ3ZkdERzVobWs5?=
 =?utf-8?B?QTl0ZkpvbFFpbUhYOGJrUUhvSEMvN3RJTVVuMXBLbEo2UWV4cVo2ak9jWndD?=
 =?utf-8?B?aFE9PQ==?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 216536af-70dd-4c5a-c09b-08da8b3926b2
X-MS-Exchange-CrossTenant-AuthSource: AM0PR08MB3298.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2022 10:11:20.6085 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qsWVGLtvz4zLeFlD1smw/3RdLCiWbyygW6Xw1383dpz73Ij5EWZ/j7oPelh9BuWPUSKrbsKHPu/CVB1BmxNAALK6JE321Xr0aaSQZuoqmfc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7809
Received-SPF: pass client-ip=2a01:111:f400:fe0c::72b;
 envelope-from=michael.labiuk@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 8/26/22 15:39, Denis V. Lunev wrote:
> On 26.08.2022 13:41, Michael Labiuk wrote:
>> +static void test_q35_pci_unplug_request(void)
> that seems a little bit wrong. we have pcie test and thus
> the naming should be appropriate.
> 
> What about test_pcie_unplug_request()?

I don't think so. Device type remains PCI. Only bridge configuration to 
allow hotplug.

>> diff --git a/tests/qtest/drive_del-test.c b/tests/qtest/drive_del-test.c
>> index 5e6d58b4dd..3a2ddecf22 100644
>> --- a/tests/qtest/drive_del-test.c
>> +++ b/tests/qtest/drive_del-test.c
>> @@ -258,6 +258,27 @@ static void test_cli_device_del(void)
>>       qtest_quit(qts);
>>   }
> 
> this patch seems trashes the internal structure of the test.
> originally it was unified for all archs through
>    qvirtio_get_dev_type(void)
> and this change makes the test non-uniform.
> This should be rethinked

We have to add test with explicit machine type. Existing test works fine 
but use default machine type. Type returned by 
qvirtio_get_dev_type(void) is the same for 'pc' and 'q35' machine types.
May be better to create a new test instead of extending drive-del-test. 
Can you make suggestion?

>> diff --git a/tests/qtest/ivshmem-test.c b/tests/qtest/ivshmem-test.c
>> index e23a97fa8e..c4ca7efc62 100644
>> --- a/tests/qtest/ivshmem-test.c
>> +++ b/tests/qtest/ivshmem-test.c
>> @@ -378,6 +378,32 @@ static void test_ivshmem_server(void)
>>       close(thread.pipe[0]);
>>   }
>> +static void device_del(QTestState *qtest, const char *id)
>> +{
>> +    QDict *resp;
>> +
>> +    resp = qtest_qmp(qtest,
>> +                     "{'execute': 'device_del',"
>> +                     " 'arguments': { 'id': %s } }", id);
>> +
>> +    g_assert(qdict_haskey(resp, "return"));
>> +    qobject_unref(resp);
>> +}
>> +
>> +static void test_ivshmem_hotplug_q35(void)
>> +{
>> +    QTestState *qts = qtest_init("-object 
>> memory-backend-ram,size=1M,id=mb1 "
>> +                                 "-device pcie-root-port,id=p1 "
>> +                                 "-device pcie-pci-bridge,bus=p1,id=b1 "
>> +                                 "-machine q35");
>> +
>> +    qtest_qmp_device_add(qts, "ivshmem-plain", "iv1",
>> +                         "{'memdev': 'mb1', 'bus': 'b1'}");
>> +    device_del(qts, "iv1");
>> +
>> +    qtest_quit(qts);
>> +}
>> +
> I think that we need something like we have observed in 
> tests/qtest/drive_del-test.c
> to avoid copy/pasted code
> 
Could you explain where you find duplicate?
We can't select behavior because we do not want to replace test for 
default machine type. Needed new test for 'q35'.

Thanks,
Michael

