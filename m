Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3897D2F8D10
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 12:05:04 +0100 (CET)
Received: from localhost ([::1]:46344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0jOA-0000Fl-Ma
	for lists+qemu-devel@lfdr.de; Sat, 16 Jan 2021 06:05:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0jMl-00080f-Pz; Sat, 16 Jan 2021 06:03:36 -0500
Received: from mail-eopbgr80134.outbound.protection.outlook.com
 ([40.107.8.134]:3650 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0jMj-00028R-7L; Sat, 16 Jan 2021 06:03:35 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IIQKFXqPiFBU/4ZpucKf5pHlJ5+tHZqj3oIlOpvnZfQQvB22wE7ue9DuDlCBk4TwH4TYyPCahnN+DbH8imt09PBffChxvZ/J01ndOVAal4DmAG4WZx928lqfIAK65mYaYFd2lQ9Hpo70g6p1oUDoc63+WK+dcBGdUpRW2HzFdKE69NJUNjlAzpn0Hj96Ql6Gl/aDNdOBPxl6BCZ2+HUGJ4jgTntec0QWlrh8kPmAgteSxF0oVmggPKXl36gS6CM0XpnmJ52SeSWD7k2kKa6E/Esq422WaJ1P2XK96ZSqLugGyUFWIMNmSVYFLz2K/z5HkjEBeaP29sRHziB0Sjnp0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b3aYvlHZmWvfbf8igBfG/xkW9vYnbvmtYLL0W+wN9qM=;
 b=el+r28wLeWzX2RXdi4bI8tDK4a6QgRkNIPVJkUl9EADVlHF+zpwPDdfaACc2SsJEr9LRYzJf7FomDttgHWpKozTxtNuBbemgaXs/swoZpcYScNt2anTwGwoK4Vau7iT8amfN3SAMhmGkUiyRXqvWBRxad5B0w4n70fAIf+GzNbHyBSzfFzppMRNjxkSIxF9NDDVRsVSFg9WdtfVA5gCmkteWkvdamjwk7MKJTnmY8J0eE2QDCCK5oxVJB7XdiGmh/os/LJB1xvRMI10S80my4IEru4bG/wa478sJRWy6t6KfTN/z7fT0jdQ0in9YseMCGgMvm6tfWLry17HRYDZU4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b3aYvlHZmWvfbf8igBfG/xkW9vYnbvmtYLL0W+wN9qM=;
 b=XVDRFe+i3otGtkUOeHEUTL62jNIlb7PRm9FPWsPIvIsANRMrWNffSxZFsyVOo/1IawWTv37NJjW2RMrwbbxVNTLieetidG0NLMjGyRxfCxHGuFikVk4/gpRE3GlaHZ1gpint4Uj6CxbmZDPaqhfvRc/Zvgq1EP2HiJHTjYxXy5U=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com (2603:10a6:803:137::19)
 by VI1PR08MB3887.eurprd08.prod.outlook.com (2603:10a6:803:c2::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Sat, 16 Jan
 2021 11:03:28 +0000
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::44c9:5ac7:5302:7179]) by VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::44c9:5ac7:5302:7179%4]) with mapi id 15.20.3763.013; Sat, 16 Jan 2021
 11:03:28 +0000
Subject: Re: [PATCH v6 08/11] iotests: add testenv.py
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: Kevin Wolf <kwolf@redhat.com>
References: <20210109122631.167314-1-vsementsov@virtuozzo.com>
 <20210109122631.167314-9-vsementsov@virtuozzo.com>
 <20210115111827.GB5429@merkur.fritz.box>
 <6fbbcc18-3f14-bcd6-05a2-a40e0352710d@virtuozzo.com>
 <20210115124555.GC5429@merkur.fritz.box>
 <41e62d69-30f1-eb86-6cc3-cdd052aadb26@virtuozzo.com>
 <20210115132019.GD5429@merkur.fritz.box>
 <7e520790-bc1e-739e-3822-ca78799f5a3f@virtuozzo.com>
Message-ID: <c52d0f46-116f-5f28-a15f-0bc128fca7eb@virtuozzo.com>
Date: Sat, 16 Jan 2021 14:03:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <7e520790-bc1e-739e-3822-ca78799f5a3f@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.72]
X-ClientProxiedBy: AM4PR05CA0035.eurprd05.prod.outlook.com (2603:10a6:205::48)
 To VI1PR08MB5503.eurprd08.prod.outlook.com
 (2603:10a6:803:137::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.72) by
 AM4PR05CA0035.eurprd05.prod.outlook.com (2603:10a6:205::48) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.11 via Frontend Transport; Sat, 16 Jan 2021 11:03:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d001c3e5-6b79-4ce6-090f-08d8ba0e5a09
X-MS-TrafficTypeDiagnostic: VI1PR08MB3887:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB3887EF8D3E1D4982A4238DACC1A60@VI1PR08MB3887.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CVHBm8mzI9M/MAZvSfXvl2kUMamcU49+uJgg8DCWflXjxJfoQRHzvz6k3xRIeC/Eqf+eG1tMknIAK7GD3GMpfYCIGtRg2H3SUECQ4ZuOKzx90e6Xqn9JYrY1PuotHd/thTKtKLoqw0XVsIvjvudja67DeucgWBzxjqZeozEtfhWNjr3vef5pkE10Yei3TfgUtm9OiyKL+c2DBa2QGHSG0U+iEafNiJNSx9VKROuIj28RiWpgKLR6KCEGchfZnJV9rRpFwqOFIi5tVAKmb3tuWR4SWieiPbk4BQdlUtywxDxBEOlQIcGNxY37NneXgM8lmwUfrl/mrfjmnF4GbqwVlA44vEcwQlwswg5EqUs7axlU8+Hlw/CxxwrI9nuYYKKT4rq5oJEpoYVgG1MyeoVlCP0o96QRvfqRTKUOpl08ic/eQ7an7Vw27/s9zSvaA6NbQZ7kjEGeclPK/kEV8of2gzpmjW2tDnkBfETGDr+8TbM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR08MB5503.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(396003)(39830400003)(376002)(366004)(2906002)(36756003)(8936002)(2616005)(956004)(6486002)(5660300002)(66556008)(4326008)(26005)(6916009)(66946007)(478600001)(16526019)(52116002)(31696002)(186003)(31686004)(316002)(8676002)(16576012)(66476007)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Rk5vVFNNWFdMOUJodjJ6b2YwYzVEdGtQYUx0dS9pMGVqSG9SQmVDL282V1pY?=
 =?utf-8?B?USs1ZnAwa01iN29uZWo3ZFVaZFVSbDVvTElwTUxCTW5FaktoUE05UHhrMnc3?=
 =?utf-8?B?eTcvVDRYZzlrclE2dGdSK2VGcHQ1N215UmE2LzB4eW9TN2Z0WHk0M3ZDZXNJ?=
 =?utf-8?B?d1BHd2J4WVEwc3I0aHhrSmU5Mi93dkU3UnZlTEtpaFdCYzY0MmpLa2ZEM1JI?=
 =?utf-8?B?bFpTTW1zM1RySFdjRVpOSXpXR1FIUlQ2UUY2NEgvMEVmZ3QxWTFOQXFCWGFN?=
 =?utf-8?B?RDBTK1lEYk1UYnp0a09hS0FwNHQxaHVxU3NjT05YSzFocHpsRFJVYmJmcS9K?=
 =?utf-8?B?enFXMjlTTmU5N2pieWFXUGlsMW4zKzRDRnVPeHhwMVlrVzRyU1ZZRkZHdjlq?=
 =?utf-8?B?MVJ0S2cvZk9Sd29USHJEZTBJWjJUZ2ZPZWR6VzZjT1ZqY1hmM3doaUJzUkpm?=
 =?utf-8?B?eHFFTjJBUUVDelpsWHpoR3dsMHRLWXJ4dUswelpmZ21hS1NBYS9iSzdvMDd3?=
 =?utf-8?B?TC9mSXBTQkZ0T3dXRDFJQll6SUJHTmhLTnBxclBwTFRiV2VOaWJQQUJqVHA2?=
 =?utf-8?B?bGcwTUQzZGs2T29IVFNiR3NFaVM0NnlzVEMxYXFlNlVid2h2SXZnYlFoUW02?=
 =?utf-8?B?SzY1MFJjK2hYVDE4NXJ0ZkNPQnlOejEzeTNTMDR1QTV6RXhTaVpKVDhuUFlw?=
 =?utf-8?B?RzQzZ2pBcklYaE1vdTJuNnlmR29VajhBSm1uRFRHQUZxRUxRcC9Fak9ZNnhY?=
 =?utf-8?B?VlZ3ZEtObGdYZTFCVWd6RzhJWG1Uc1YzL2hleDI4WEdFWnVMcHFkWnFLYXZX?=
 =?utf-8?B?SHRqZnh6STZ3cVBQQldFMVlNTWwwMmgwNjduUk0xbGdzemROc21IUEdlU1hN?=
 =?utf-8?B?RGdGUVFvNHk2S2NqY2t5cm4rSU1nbDhSOGcwWTlYZ3VwS1JFOFllMFFhSjJT?=
 =?utf-8?B?Y0ZyM1dnd0VjdVJsRlpaOTBPYXllZU83SHkxaEppZGRYeTNQTDFPWU1tbmxO?=
 =?utf-8?B?b1N2c0p4V2VyVkQxeGhEc0xsUDRFUms5NFVWdGZheXp1NUY5SlZDQWd6a1VS?=
 =?utf-8?B?NlNCRzNPTGR6VVRhaUVqWTFvVUR1MXNSM2xGRUtTVGVVQ0tPM05JOEl3eHVH?=
 =?utf-8?B?TjIrVExXWkNMVlpkcTVGOHB0WHdKRXRoOEJ3djhxdUViMldud1EzbXhIMTZl?=
 =?utf-8?B?V0s4ckhpSEN3ZnVBVTQxa2hLMTdTOC82YkxnVWhMcHJ0d2xzUitCNHRwaVQ1?=
 =?utf-8?B?WGkrSVJuaWp4ajVQcWRyeTNoSmhOZmU4YjRhbGpMZzcvNk1tMWhkQ1NGTVVJ?=
 =?utf-8?Q?8A6WGAoL5zfQcFmnV9HpWoyb4bdYmyFtL2?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d001c3e5-6b79-4ce6-090f-08d8ba0e5a09
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB5503.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2021 11:03:28.2575 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x2XUcgm0MTgHE+c8YrP9qqIeA2WBD47dmtIIT46xojyft+5onGXX9aGFExIbAUQfOKQ8OIBy/MULDoXdEPv+XKD9Wy9doCtUJVf8+GSlwKI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3887
Received-SPF: pass client-ip=40.107.8.134;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

15.01.2021 16:30, Vladimir Sementsov-Ogievskiy wrote:
> 15.01.2021 16:20, Kevin Wolf wrote:
>> Am 15.01.2021 um 14:10 hat Vladimir Sementsov-Ogievskiy geschrieben:
>>> 15.01.2021 15:45, Kevin Wolf wrote:
>>>> Am 15.01.2021 um 13:19 hat Vladimir Sementsov-Ogievskiy geschrieben:
>>>>> 15.01.2021 14:18, Kevin Wolf wrote:
>>>>>> Am 09.01.2021 um 13:26 hat Vladimir Sementsov-Ogievskiy geschrieben:
>>>>>>> Add TestEnv class, which will handle test environment in a new python
>>>>>>> iotests running framework.
>>>>>>>
>>>>>>> Difference with current ./check interface:
>>>>>>> - -v (verbose) option dropped, as it is unused
>>>>>>>
>>>>>>> - -xdiff option is dropped, until somebody complains that it is needed
>>>>>>> - same for -n option
>>>>>>>
>>>>>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>>>>>> ---
>>>>>>>     tests/qemu-iotests/testenv.py | 328 ++++++++++++++++++++++++++++++++++
>>>>>>>     1 file changed, 328 insertions(+)
>>>>>>>     create mode 100755 tests/qemu-iotests/testenv.py
>>>>>>>
>>>
>>> [..]
>>>
>>>>>>> +    def init_binaries(self):
>>>>>>> +        """Init binary path variables:
>>>>>>> +             PYTHON (for bash tests)
>>>>>>> +             QEMU_PROG, QEMU_IMG_PROG, QEMU_IO_PROG, QEMU_NBD_PROG, QSD_PROG
>>>>>>> +             SOCKET_SCM_HELPER
>>>>>>> +        """
>>>>>>> +        self.python = '/usr/bin/python3 -B'
>>>>>>
>>>>>> This doesn't look right, we need to respect the Python binary set in
>>>>>> configure (which I think we get from common.env)
>>>>>
>>>>> Oh, I missed the change. Then I should just drop this self.python.
>>>>
>>>> Do we still get the value from elsewhere or do we need to manually parse
>>>> common.env?
>>>
>>> Hmm.. Good question. We have either parse common.env, and still create self.python variable.
>>>
>>> Or drop it, and include common.env directly to bash tests. For this we'll need to export
>>>
>>> BUILD_IOTESTS, and do
>>>   . $BUILD_IOTESTS/common.env
>>>
>>> in common.rc..
>>
>> check uses it, too, for running Python test cases.
>>
> 
> But new check (written in python) doesn't.. Should I keep bash check, which will have only one line to call check.py with help of PYTHON?
> 
> 

Or finally, may be just drop it? Can we just use system python for tests, now when we are already in a python3 world?

-- 
Best regards,
Vladimir

