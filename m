Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 170A141E216
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 21:12:34 +0200 (CEST)
Received: from localhost ([::1]:37292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mW1Ts-0008TK-J0
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 15:12:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mW1Sa-0007gT-3L; Thu, 30 Sep 2021 15:11:12 -0400
Received: from mail-eopbgr40092.outbound.protection.outlook.com
 ([40.107.4.92]:26688 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mW1SX-0002jv-IN; Thu, 30 Sep 2021 15:11:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HXlZ/z0TWUZ5xEfxPnsiWLo2Bv8vG4GeaBmnooBsTygmlL01IUor0bkJ/0740vbUrQ/CpOhSEzZEXxiUz1uHdpdOdPuDlKWKZsW/9LeqVG7YvKhFOUD2Ndl9cbNus3l5W5SHMIf1tBtT0fEDn9xu0aZIi41FrUxE2F5ZXSD4uKp4Bbsj3ozNowTxrtPbK165u7UlEsYGMDNt5GMtHyB8as57x7qwpA+3kOpU7uBQHv8KhZELDNBcU7BzhPDM4jzZvgI1kTLZomvbDUr2H1jfgGtuk7zz8D5D4v2ERopsE50dwhEqAwCtSDAHYUEUXZnRHtp4aNnsn4C+TMSPSc5DAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=Nzz4oIO+h9KmJrOwV86bmbrSRAgB8NQ1akyRZFbfZLE=;
 b=jrMGnJiczp09EHZ9rw/xfs918EkWlult6hW9sFMRqhvn1IpQi5d0J/chEDnIbSo9boEdpJA2CyaOoLKdWEAE+S/Oa3IUSniAnLsFyIpXJUbhHIMmo3fT5MytNHUm3X44SwImA1By4qBQ8zKW5jz7GoRwwu9QYDKy0kII/wJ+ruCRx5IcYVnVyTTyHuulN5XlZm983OmbFtPepAlIgqxPAa6uTjYaYgBDRVbVTJFJdmAD0J9yq158kP6t7nEkyqgpRGA6b9asp31uZT6t1ltMESEO6O+fO+yjzMyuwICcII7zEeKs9B+HM2akAVclcM2mpnCmfoo1R5AMUGj7ru6qHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nzz4oIO+h9KmJrOwV86bmbrSRAgB8NQ1akyRZFbfZLE=;
 b=UBHngCkPJEn7hhqohxx7pzF+BRgF/hF+rryUYrbUX/2ERpq0/ZyhHifbA1E3geDEW6LxJ5HBLkjCdXaEX/yLLyC2p15rV8bxhOdBQTf+7p4DUfmHcVWJJyw8W/CcrPwEppcwQeWzGS+sa2gIQzghvUo2Z/f/9a3RB4HtO+2afyw=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6038.eurprd08.prod.outlook.com (2603:10a6:20b:23f::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Thu, 30 Sep
 2021 19:11:04 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%7]) with mapi id 15.20.4566.015; Thu, 30 Sep 2021
 19:11:04 +0000
Message-ID: <06a182ec-75a8-fb26-9c09-6c7ac5ba876c@virtuozzo.com>
Date: Thu, 30 Sep 2021 22:11:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3] nbd/server: Add --selinux-label option
Content-Language: en-US
To: "Richard W.M. Jones" <rjones@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>
Cc: Eric Blake <eblake@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Thomas Huth <thuth@redhat.com>,
 Wainer Moschetta <wainersm@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Daniel Berrange <berrange@redhat.com>
References: <20210930084701.3899578-1-rjones@redhat.com>
 <c9a4f4ce-b626-18a4-326a-03ebfe5b5aee@virtuozzo.com>
 <CAKJDGDbtCp-aecYPs-4zK4dojo=uhez=_T2iL2yKx08guuXKbA@mail.gmail.com>
 <20210930183727.GD3361@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20210930183727.GD3361@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0077.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::16) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.227) by
 FR0P281CA0077.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1e::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.8 via Frontend Transport; Thu, 30 Sep 2021 19:11:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a95ec991-a0c5-4665-c67c-08d984460c82
X-MS-TrafficTypeDiagnostic: AS8PR08MB6038:
X-Microsoft-Antispam-PRVS: <AS8PR08MB60386FF36C0273BBACFE0AE6C1AA9@AS8PR08MB6038.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:112;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3efhbY13CDBo1p4rj6AINPt5ws+pkfL5SNpjbb5blVAudK1D8Yu3jKdPiocK1K6wNPCqLZ/9qicgjxuetH6SVyl59HNUDZXTEvCFadGumJsIfL1nlK0YOYvjy6xeIiBOOL/hUb0Y22mm4nI5rPq688GT8ZtesMLmLqC5PhgttePHIVZHbXVwPxmpUhwfW2raXU+k1qTHpspysGcuIf1PCzlYQe9EZKRG4g3U/DrVrbtxI7946qn76lhQ5gnCmeWh6gpbADROHnQr7zUPkChHzpEroM3GIf7N5jW+NYyFNAeBP7G0J7JzvfsYTLu1djhJDMpzstf2+d+SAXMubB3lcwFp8WpFbHeijZ7xbgfAwIVvK1lvExEXyIlM2+26uVSuwY0MC/8QHe6F6RwHYXbjaFxo63cBnujaPtzUbgucZbXPe5K1mXPuqkrWObOU7GLsWsf8yAc5wBoSt5eiWZ3n60Ic4ntEzWUANbFFnKtBnyR2ufl59DvtX2zwxPRk2bE+eLN8x7X0bWic84rkKq9U45IqvV/QF6YyNBIAfmrDl0vGfzPPxxewCvnGa4EZoSlJfFcI0jlxLloST09mYd7A27YJeJ1+5lCf5ax0jqEVdKt8Gg7vPwv2dxYkCbKsLuxnyyndH+mPgTN3rOg+/8voiTAF63SQvmoiRcZ0CVu199XoUP+PjF4LhiCMnPKHcZqOS8JMozSctr+/TbS4HFAf/4WpCTFUTirWY9JmvRKKbdYR7uy7d3lhKCJYZ9bdR0MYHmrCFBVX1irhiIPoblJkP+MzFgL74a1RhJ9YA7GO0AOTGoLLwynmhPY+XaeZqDe7pbrqqK57Udw+6dSXMhF/53BvDA9AYXCEVrPz145LS4UAKyGZ8jfSBN5DSt3BAZUmlETWL+1NrWTbffyDEUbnog==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(5660300002)(956004)(2616005)(2906002)(38350700002)(66476007)(66556008)(66946007)(31696002)(4326008)(38100700002)(8936002)(6486002)(966005)(31686004)(86362001)(508600001)(26005)(36756003)(52116002)(316002)(110136005)(53546011)(7416002)(16576012)(54906003)(186003)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Skp2WFE3SmlDMHVPYUxxbnJ6eng3K3FFRkQ5c3RMOXhVMkZTWVZJd2M2eHhV?=
 =?utf-8?B?M2JzRlhrSmdqbFcrNnhjVU5laVZTT283MjVMWjdPSWdydkFVTmo1MGhtQVk4?=
 =?utf-8?B?azJaYVBGNS9LcEpKYWdtblRzWXdYZFdLTTBLMTRPdE1qbFRoOUNmUGZHTG5R?=
 =?utf-8?B?eGtNU0RRZ0gwQWhjY3ZhV1pUa085ekVGcDJySE5lcXVrVmdGVWFRaFRBcG5u?=
 =?utf-8?B?NnQ3TXNBV3hsRWZLTC95Wit3WmlqcTRCN2RlODBtUkdSbm5wSmFDM1c3aENI?=
 =?utf-8?B?Zi9DTUoxcVgvRklqQ1RZWkJMK1pPeXlSSzNKem5zeDA1Rkw2QXJ0ejFIS2hh?=
 =?utf-8?B?cTVDOWV6THViZGYzY01ySkxERXZYV0o3eUV3REpVQWtFOXhuOExmUWgvb3Nk?=
 =?utf-8?B?SFYweUp6K1dNRmN2RXhlejJSaERCRlVCV1dmS3l3UEpOZjl3VGhYSGx3S1dz?=
 =?utf-8?B?anh5cHhLM1E3aFV0M0RyQUZxWDQzci9LeUxTbm9BaVRXZkJhZzEreFoyQVVB?=
 =?utf-8?B?Y2MxK0NLY1dPL2xGOXhWYXZOVjM3OGpuUHVTT0NBUStaRThpSVV0Yk9qWjR5?=
 =?utf-8?B?NmhpODg1bEpwK0haaXB0QXAzY2VuejZsLzdBTHVFUTkvTXk1VnZTMXVReGdU?=
 =?utf-8?B?S3VFUk1Db2RPM1BHazN2TDdXaWJjYW1VOVRzcHF1SUhZUlBTV0lvZmVNNHpt?=
 =?utf-8?B?YzAvMGJhYkg4MnZZNnlMamZrbXRyWXA4ejl5c3NRSVI4eUpaRXoydjBQZnZ6?=
 =?utf-8?B?UE13elJqUlBIbW1sb09HZ1E0RWFPZVVYb0FzM0FJeWNQdENBSjhCSlZzbWNM?=
 =?utf-8?B?QUNZNjlzYldUeWlqWEozU1FxdGE2RUdvNDdVazlCUFF6ZjZZanB1K2d6eS91?=
 =?utf-8?B?bW1RaE4rdHBCRVExS0JDTVhaQVEzbjI5VmNWaktHREJqL3BHVGZBYzFRMkRE?=
 =?utf-8?B?UFIzV2JmZFhDRmV6bGxzS0NqYytmcEhLOUhmWnBBeUh0aFpLNU1WVlJ2WFly?=
 =?utf-8?B?ajI2Vy9BMUliV2RyWTg4dUo5S3cvOU1Ha09RK0lqSkJHR2wvQ3ZlbmMwK282?=
 =?utf-8?B?QWsvZWdTWjZOdXVLWjVVeXU0aEZwTk9wMTVYV2g5TzZBMUgrK1VtK2pRMkZp?=
 =?utf-8?B?aS9lOG5nY1FzakszR3VMNmJ5ZE1WSmJRdDV1YWU1dm9GcTNlM291THE2V1NW?=
 =?utf-8?B?ZGlCNWFDbDNIYWhzTXcxK1E1WjlWQjk1cUpBMHFWa3Fad2ZpSjlyMWwwRkZ4?=
 =?utf-8?B?UDU5ZGpkaUN6dEt5V2xMZzlDNmdMdjlyVnp5RWh2MTQ3Q1AydTJBbEtNTEZV?=
 =?utf-8?B?Tk9pYk0va3BNU0pud1BPWk9objFIaDEyL3BLWllVQ3h1T09tcDY5MVMxR0Y1?=
 =?utf-8?B?VlExTTc0cDFGbWVaUnZ2S2pmd1lVNzZqbVhUMFJsRkhVbEtsbWsxQUN0K3N4?=
 =?utf-8?B?MzhsWHdGSjg5djkvSDdabmJ1anZtWXhIdXZ3QWpnU2VxQ2xLKzU1a2ZRZDh3?=
 =?utf-8?B?N09FelRVbGFOU0d0YTd6ek5zSS9rMWZLMXRKcmVvTWFEZG5RbEN4OWtKNGRP?=
 =?utf-8?B?MFZRdmh6L2ErWFB6VWlsemcvSGEyMU11OExvaGVJVVNrenZGNW5wa01LYUE3?=
 =?utf-8?B?aTI0SWc1K09xUWJKWC9NV01iSHFFL2F3bUgvNDdpSm9wYS9OUjI1WjNlM1BR?=
 =?utf-8?B?eXRtNndtS0ladVBXU3c2ZHVSci8vRFpjU09hbG53WmxvdFFjWlhsT1F6aGtm?=
 =?utf-8?Q?vaDuhKogA85Opeo0l+wRad27lcES7YhppkX7e9g?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a95ec991-a0c5-4665-c67c-08d984460c82
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 19:11:04.2856 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0HZ5U1tiF3rKK5JePuT30McOCXb6gtqkZEz0gw6pusBCu5ZMkNKzkxVJOoD1M3S/CUDC2L6qOWcYP4Xjlza4HrS4zb4zIPII3lud8bWRDSk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6038
Received-SPF: pass client-ip=40.107.4.92;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, CTE_8BIT_MISMATCH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.127, RCVD_IN_DNSWL_NONE=-0.0001,
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

9/30/21 21:37, Richard W.M. Jones wrote:
> On Thu, Sep 30, 2021 at 02:00:11PM -0300, Willian Rampazzo wrote:
>> On Thu, Sep 30, 2021 at 5:55 AM Vladimir Sementsov-Ogievskiy
>> <vsementsov@virtuozzo.com> wrote:
>>>
>>> 9/30/21 11:47, Richard W.M. Jones wrote:
>>>> Under SELinux, Unix domain sockets have two labels.  One is on the
>>>> disk and can be set with commands such as chcon(1).  There is a
>>>> different label stored in memory (called the process label).  This can
>>>> only be set by the process creating the socket.  When using SELinux +
>>>> SVirt and wanting qemu to be able to connect to a qemu-nbd instance,
>>>> you must set both labels correctly first.
>>>>
>>>> For qemu-nbd the options to set the second label are awkward.  You can
>>>> create the socket in a wrapper program and then exec into qemu-nbd.
>>>> Or you could try something with LD_PRELOAD.
>>>>
>>>> This commit adds the ability to set the label straightforwardly on the
>>>> command line, via the new --selinux-label flag.  (The name of the flag
>>>> is the same as the equivalent nbdkit option.)
>>>>
>>>> A worked example showing how to use the new option can be found in
>>>> this bug: https://bugzilla.redhat.com/show_bug.cgi?id=1984938
>>>>
>>>> Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=1984938
>>>> Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
>>>> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
>>>> Signed-off-by: Eric Blake <eblake@redhat.com>
>>>
>>> this should be Reviewed-by?
>>
>> Maybe, because of this:
>> https://lists.gnu.org/archive/html/qemu-devel/2021-09/msg07081.html
>>
>> I got confused with this v3.
> 
> Yes, I'd somehow lost the original patch and picked it up from Eric's
> queue to make v3.

Than it's probably correct. Still a bit strange to send own patch with another s-o-b in the end.

> 
> Having said that I'm not sure what the objection above means.  Do you
> mean Eric's tag should be Reviewed-by instead of S-o-b?  (And why?)
> 

I thought you just accidentally used s-o-b instead of r-b.

-- 
Best regards,
Vladimir

