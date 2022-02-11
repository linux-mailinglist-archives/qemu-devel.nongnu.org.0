Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A2A4B2239
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 10:40:32 +0100 (CET)
Received: from localhost ([::1]:58736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nISPn-0006UX-AG
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 04:40:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nISOC-0005ex-AM; Fri, 11 Feb 2022 04:38:52 -0500
Received: from [2a01:111:f400:fe0d::70d] (port=61153
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nISO9-0007nv-0G; Fri, 11 Feb 2022 04:38:51 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ICwSwQA17hlxTtsS3zoSp6Ix5opmSrxXO61FCXP5SfuFvhZWb+cxDvb0Vl+EzTnv8jyt/Ddq4MrR6nUIpuhoIKM2i+ypNjtOTzfMkJ/a329iihOYTesbHntKgzJ4Ml6y7p2gMck1fUCXLSgKz8Kt4cXzZGJCyztq1cx6wrHi8FGFzLL9t+5pMSXtzCWH3M8Hw9JjWSeAB58vMqy5UgRsxG9Y/cRgwWedAjAJI2SKYIdQWfWVPSoOjIBg9Z0LQ68l/FDKYDmqYugo08wZa3crQP7KkyEp5jWCoPeaA30+hjF5SV8DMc1DCT0FT/BoliaXZ1YIpQ13zwR4vAyCSaEtog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u2O+LhLX0inGz4G0lYIk0Ct/vJf04+SA5j4wxiL3KYg=;
 b=HrOnVfvHba5JK57Xh1VMfyD6AbfN02f5Cx0kCcA6ma9borjARvNNh6HjdXpFXH2ky7YuFbnvpQyQrdK1b2mNwlyrTTdYboGjLGpdElbMJCgHUkz7NdeAYw3pQw1Y3K3HNzG+lbfaJ0i845cupyLDHgK3P7qfxQZP1Nzbv8/bd/qen1jBoGlxG6rmriJQYA70YuXl+39yTaR2mDAGIRIi2XbDy8mqkASjRhRKPkapmO8W65+G3UdPNMVMgyuq0p+d+O6PJLIPZ0UCQs+jrIJv7B5NlWHXB27OgTh96/4u98tzsmj0QoSFFlnBHIqEKnjnY0otlvHfnBYSpJgCGCFV0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u2O+LhLX0inGz4G0lYIk0Ct/vJf04+SA5j4wxiL3KYg=;
 b=nKjjAdBWDqztd96sFbF6GTWa2dY+rIQ+G4ccz9bHGe1oplWeYv4G7OpakKNz2/lIpQVK8dWcP373Y3sUtFOMgbNuaS8uo7gCBvDlK4poRjBUb/P7+KPJkRFQ/1bnl002bkSce3Dm65BGx3GN15shuol5bV7EAXdgRRbCerYkl6E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM6PR08MB4581.eurprd08.prod.outlook.com (2603:10a6:20b:83::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Fri, 11 Feb
 2022 09:38:29 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%4]) with mapi id 15.20.4975.011; Fri, 11 Feb 2022
 09:38:29 +0000
Message-ID: <387be0c9-f293-fabd-7401-3f70bb42801f@virtuozzo.com>
Date: Fri, 11 Feb 2022 12:38:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 1/8] tests/qemu-iotests/testrunner: Allow parallel test
 invocations
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20220209101530.3442837-1-thuth@redhat.com>
 <20220209101530.3442837-2-thuth@redhat.com> <YgYsbRc9XNYjUH2L@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <YgYsbRc9XNYjUH2L@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR1001CA0012.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:2::25) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f9454fc2-3246-4257-ad92-08d9ed4242b8
X-MS-TrafficTypeDiagnostic: AM6PR08MB4581:EE_
X-Microsoft-Antispam-PRVS: <AM6PR08MB45819D7D9DC7896DAA0ECAADC1309@AM6PR08MB4581.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9AJ5F05Acnr3Te/1Hcq2/b7n087TO/gPhmh9PbuRZL5QpWK9V/gTKBvwthBsxzI73x5ILWabv9SNYquihvURZhlhrRgUtljF5StthnYY37JJH6XZQpD85OLeX1JwZ/docr4fQWVEt4TWUlguybYmk1SQbA7fQ3GEkBqMAQxuPgq9H/Da+ZevBXR+bqNxC94OFXbdryxmf+r6eAsZWryh2DK5gGF7fUJSc6HTuqtJH0hB/XYSdwSbwhI1YY1+AsH70L+ZBeXyeTardqipTTrSRALA+06yH+Z5bqzAblwTIaMzm26ESGQYmVaPZBcfFERHXUHe+s1DEol+XUaAvq1pFcQmfKe4nL0t9ljMNzVOjpfjCy5mdD68fzjS3zIiwWUBDLPKsrBqP0S7q3br0Nw7jQC90HBRMjO+x5dxAcnNykRz2/pXyg/8FCG/drYPnA5G/a9hf+9SGm/u4ilcoINAVC2NYCtuPeosHWIOLzhWhIsdylFAdChe5Oy/RvmrAYKKmeePnzDXktWyfQ0ELZjJPDDMsE40b6xNMTPbLOidUy8vePefRQIV6NHTO6JVyFEbeQUiIo1Lokx4jcRzC+8E3QCIl5LSgx4QphYrDfhPADaTR5ZbThVb1EV1tW81nW+/hRF89+VPH6qk8hSyJooZVWFYYDeHAP6cGPrzyfKa+sYJ4baDKsC2/DiLwSk5DI4GKDmlkuQJPvymLaJFFO/Pyvu/ZcKj4dtjjvSpKsAUmBoys5g3M1oNSDswFpjCIGPk6IaBn4rizp9kNgdFiFmRzA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6512007)(36756003)(38350700002)(38100700002)(66476007)(31686004)(66556008)(66946007)(8676002)(4326008)(508600001)(2906002)(2616005)(52116002)(316002)(54906003)(6486002)(26005)(6506007)(31696002)(186003)(110136005)(8936002)(86362001)(83380400001)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VEN4TUlSNWo3RnkwVmNlWkthOUsrYXF3d2JDZWt0YmhBZkdQbmlRZXgxWXhy?=
 =?utf-8?B?YmF6eDFlUU9jOW9TcUNlc3dYcml6cXZncktDa1Z3cUg3ekprUSs4bExvcWho?=
 =?utf-8?B?UmdHTEtucG94eDhIZHBHZlVVaU5sY2RTam9tRHZMSE1CZXYzUE1EZ0ZOMGxr?=
 =?utf-8?B?MG1HdjhzekQ1aFpIVjdDM3VLaTRHc3M3ZEF3a2RDUFN6ZkdreDA2dGZCVWV2?=
 =?utf-8?B?YXo3dDltWXZWNkRUVGY0ZCtzeFFUUGNKSXZPNkdIRnJhTVFkQ3E1ZU9aUGp4?=
 =?utf-8?B?OVRZb2IxVGVpdWJOMVNWeXcxZzB4ZGFjV1BTcEtDZHMwdmFkRFRWRDM0ZGpD?=
 =?utf-8?B?ZXNTSFFoM0lseFduckxnRTROdDRoV3hybWhrcUpmTE54R2YxaEIzVDdxWkJO?=
 =?utf-8?B?TFVMc2hycEZOcFNsTVhwQkxtM0xjRHpBUkxkeG0zMUp5b2xoWTAxbTZ6blpr?=
 =?utf-8?B?ODBTMGJXTWhVeVl6U3Y5RXZVcVVrZUdKSjRqaWpMVVBLWGZLQm5idzVDOG95?=
 =?utf-8?B?UzFRRGNVTWFoeEd4VGNLd1RiM0U1TFZ3dk1BdXk5NmRLT0lwYTJudWI3VGpa?=
 =?utf-8?B?MUlnK3A3ajErNGRXNDZTWG5xRDhqQUdIZ0lxc05NaFBTUnEvRWN6S2ZoZjB2?=
 =?utf-8?B?Zm5PeitVN1k2eUNJakhuMnRvOTdjRUovWUZjaEEwUzlpcnMyQVdkS0tqbmlG?=
 =?utf-8?B?YTVqS1BwcXVRU1dGVnFZbDlzZjNRSmdJOXE1elhxOStvY1N0eThZUGc0ZmxT?=
 =?utf-8?B?cUdFMzBTbFp4NklNUDAxNjBzemxTcHRtRSt4MERWbU9EWlErQmVqeE5yNkdo?=
 =?utf-8?B?Q2c3L2VHREhiOFVaS3V1cFdFSEgxK3U0L0ozNE1sTlRLbjgwVENXNXRXVzF3?=
 =?utf-8?B?ZURiUDJmTC8zTkE2K3UxNHhOaUx1dDNpUzM3YmVzd0xjU3NRLzJSWEl5ZFVS?=
 =?utf-8?B?Zjl6VVV5WDdwanBkVjF6bk40WXBKNVJzaU1GZUxaSlA5TzhGeDVacWlpWUNp?=
 =?utf-8?B?QUFXU3lQOU9KQVF6dTZZcGYzeTNYS0R0cUVLT3NyRHB4TW1EUVdNVE90Um1s?=
 =?utf-8?B?WkJ0ZzEzMmorVFU0VDFPb0RRYUZVQ3VXUVRndW9YTXJpeE1MRlgxVTFkOXFV?=
 =?utf-8?B?aWl6dkU5NVYzaTVjeUZ2Q0VVWTNYT3F4blQrUi9ZL0lTL1pXeUNEZkZpM0ti?=
 =?utf-8?B?SWxTQ1o1UGJ3bEpwVHZVUnJ2K293RkRMWm1udTdWeUtnZDcwZlVibUVPczVH?=
 =?utf-8?B?U1NkdlNLWEZYejl1Q2VIZVRhMzJaV1VieXFrdy8wbE1GVE5NbEJ6S0FTWmRY?=
 =?utf-8?B?NHdDd0I0S3lZZW9tMEprU1l5ZXFJMEp6dWxLbUxJbzQvYkZ4cTNNL2REMXQv?=
 =?utf-8?B?UXBackJ3N1ovcVdLR3JkMFRFcE43eTV3TU1NTVB1bHYrUnREdUk4VUpMVzNk?=
 =?utf-8?B?VWpIMEhibC9OckdITnY1dTQyMXAvTjFtMVlUOGNRM2xiTmVpNmcyRzJjU1Qz?=
 =?utf-8?B?aXYzcjhoUmN2VFFBaHBjTHFCWkF0czZXUFA4RUpaeE9BbU1rS2kwRS9KRmlM?=
 =?utf-8?B?RmR3UjJaTjlvbVZtZjA1Qi9ocE1EN3VxbTFabnBqYzUyMHozRENlWTA2Zi9Y?=
 =?utf-8?B?VFovMW50dkVKMzRkNEtaM3NVVWtWN2tTWndHSFBhcEVRSTg4RjBQN1M4UlVj?=
 =?utf-8?B?QTR6eXVVYVVxYTZhR0I2dXppZkxaNHBFa0NmREkySlZsUjhSOHVob1hFRHBh?=
 =?utf-8?B?REVkYzMwenNFQUx5LzNYaGpzYitMNlVTb1NwbSt2YkRYbnlKNjI1U01qTVhS?=
 =?utf-8?B?L1dad3gwOEtGM1oranNRVVpIWm92MjZQTmY5ai9xUHFialZFc0Y5V0JCTFlw?=
 =?utf-8?B?Q2QrSWtYdzFCQVlYeU9EdjlkUWZyRi9XZ2VZait2dE5Sb2hBMGc0L0RNczd2?=
 =?utf-8?B?MGNENDlUM0FFWDZsWGZwTG5HNnBFemJNYUhUMHEvQ2VmUkIwZE1sYkpFUXBN?=
 =?utf-8?B?YzQreEJtVXVwRlMvTUxNNzNTY0hYN21YbkxMYVUvREpBUElDVndoZ2RXNmRX?=
 =?utf-8?B?MVRhdDN4WFBvSTZzdDBpUldKZ0h4SzFHU2l0REhid000Ump2WFlqczJzTkxM?=
 =?utf-8?B?VXE3elVBNjV2dTdGWE5scThxYUxGZ2tjVDJlbFNtbmJLZ2lycy9odUlkWVlT?=
 =?utf-8?B?dGFBdXlnWlVLVm1yaUk2RTF2TVRmekc4Nnpib1dzR3ltRW56WndNQmFjamtj?=
 =?utf-8?B?akRvUnZ1ZFQvMmZWZ0NwSlYvamp3PT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9454fc2-3246-4257-ad92-08d9ed4242b8
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 09:38:29.7189 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jtrp8NlQl1U1fvSOOumYML8Snhnoc3ok+EtbGG02DF10oiKOvRzRvHwaLlNHQqjQ0uCuEoF/3LY81QvjIjU8ZgIprNy5rMGQiz3GvG+7qnA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4581
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe0d::70d
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe0d::70d;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

11.02.2022 12:29, Kevin Wolf wrote:
> Am 09.02.2022 um 11:15 hat Thomas Huth geschrieben:
>> If multiple tests run in parallel, they must use unique file
>> names for the test output.
>>
>> Suggested-by: Hanna Reitz <hreitz@redhat.com>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   tests/qemu-iotests/testrunner.py | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tests/qemu-iotests/testrunner.py b/tests/qemu-iotests/testrunner.py
>> index 0eace147b8..9d20f51bb1 100644
>> --- a/tests/qemu-iotests/testrunner.py
>> +++ b/tests/qemu-iotests/testrunner.py
>> @@ -259,7 +259,7 @@ def do_run_test(self, test: str, mp: bool) -> TestResult:
>>           """
>>   
>>           f_test = Path(test)
>> -        f_bad = Path(f_test.name + '.out.bad')
>> +        f_bad = Path(f'{os.getpid()}-{f_test.name}.out.bad')
>>           f_notrun = Path(f_test.name + '.notrun')
>>           f_casenotrun = Path(f_test.name + '.casenotrun')
>>           f_reference = Path(self.find_reference(test))
> 
> Hmm... It does make sense, but nobody ever cleans those files up.
> Currently, the next run of the test will just overwrite the existing
> file or delete it when the test succeeds. So after running the test
> suite, you have .out.bad files for every failed test, but not for those
> that succeeded.
> 
> After this change, won't the test directory accumulate tons of .out.bad
> files over time?
> 

Actually, .out.bad files are put not to TEST_DIR but to build/tests/qemu-iotests..

If we want to do several runs in parallel, I think all files that test-run produces should be in TEST_DIR and SOCK_DIR. And we should care to keep TEST_DIR/*.out.bad after test-run, so user can examine them.


-- 
Best regards,
Vladimir

