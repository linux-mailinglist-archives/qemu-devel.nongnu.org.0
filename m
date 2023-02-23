Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB0A6A0C95
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 16:08:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVDC6-00080H-Vn; Thu, 23 Feb 2023 10:07:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pVDC3-0007zC-8t
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 10:07:35 -0500
Received: from mail-mw2nam10on20621.outbound.protection.outlook.com
 ([2a01:111:f400:7e89::621]
 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pVDC1-0003jZ-8E
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 10:07:35 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MG9s4HQLk1prJWPKMEjibqX8MrxvKoEs4AEK5w2A893hcTpB7t4tLHsB/jKJSjU6Bv0WzFim9GifnainVw5N1Fdjo674W0YsKjg5t4gJyrrSrh23/CLGGL0cEF2zs9uv0aK/ZndZyOWNMxvN8+Xy9czzg0syaKQ/HjqsmKvTpNRfnN8ucKSfJW3clu3S+Bnp8fd8PfreDLVPHC2OoQ5BY51407YaYcT4NpEazWNpX48pSCt2T0tsdqBa4Qil1/gW46d9dd3OXrn6NIlO7xlXTAe5JTR8SLuxUsau4Rt4/MeG6Vm5yUSbgUMXPYfhug7kmimYZYucmFu/v/2HwmTFUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lap5UadoX7xYsOF1Gricr4fYGAW8lz5QxjMYi/gEDgY=;
 b=bmpz7yKl0athM08TksiiRzjLeVb7IatmY9IiiOLzW5OmAKaZ1a2MdK5x1KlXP8HPSCVC8U0KIkv7QaAIrkbMd64ownQPAIaq7IAFF1WfO1+GGN8tQzIh5XGTN8z0M8viF6+9lCYXIXKzg5i1QS7DIn6BhnEj/jVZIP95FjwH6a/OZOEsTysudASAXT/gI6fN9QzrRRwIoAGjvNfrkercSoOYfE36In0d4IREoJHMPAiVIS3mqCeyWcMw/yddMLEewLJqvtbdxSM6TSUT2wGgJIZzc9d5c0meAZLbD82fs4ZS+0XLlsWFgp5+jP3++COEWh2+raK0dTACmyack6zU1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lap5UadoX7xYsOF1Gricr4fYGAW8lz5QxjMYi/gEDgY=;
 b=ZAkiQuDS+RfbfI9EkPEFMBiSwHyri2WeFbWH5GuWTOPA6wS6p1jNUNa66YEME42ucv6SjqecLIToc0RRPhoZb7BewSqswhITzy1bLNbxwfbPSy9VUBRR5NNaO4++b62rVHzirvdDpTopjDq3cAlXYfjwjRZHE2cWEMobUM16ZHjYCN/McaVcIWXnvpt6v1xOr12scnCvrUr/Le1PVjMzdWfQjeEC9r5KINmelNLKiVKR///ygz9XzoX9AWlQcrnxYbsGG/QBedOLmUVxpq/gkvS9FCKuihPHDTYNuC5C6l5GUPEIPabvkaRa9DaDc5ETp/CxvPkqdG+LgMOLfJGoUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB5549.namprd12.prod.outlook.com (2603:10b6:5:209::13)
 by CY8PR12MB7435.namprd12.prod.outlook.com (2603:10b6:930:51::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.21; Thu, 23 Feb
 2023 15:07:29 +0000
Received: from DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::b980:cd87:77f2:3fbb]) by DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::b980:cd87:77f2:3fbb%3]) with mapi id 15.20.6134.021; Thu, 23 Feb 2023
 15:07:29 +0000
Message-ID: <e761581e-7c93-6c38-7cc7-388e1934e33c@nvidia.com>
Date: Thu, 23 Feb 2023 17:07:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 00/20] vfio: Add migration pre-copy support and device
 dirty tracking
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>
Cc: qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
References: <20230222174915.5647-1-avihaih@nvidia.com>
 <20230222135512.51b62650.alex.williamson@redhat.com>
 <12e40895-82dd-2529-5df7-50ff528ab5f6@redhat.com>
From: Avihai Horon <avihaih@nvidia.com>
In-Reply-To: <12e40895-82dd-2529-5df7-50ff528ab5f6@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0189.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::12) To DM6PR12MB5549.namprd12.prod.outlook.com
 (2603:10b6:5:209::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB5549:EE_|CY8PR12MB7435:EE_
X-MS-Office365-Filtering-Correlation-Id: d318afd3-75fd-4821-6f59-08db15afae2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Kgucg+b2rhNRaeqaMU6AYo212EPHn6GeNdW+DTEQ8GZNB6hrdVkXcPLupjz1V8mLLJTdEz7m3FkmCsCQ3MNrDOlSzNbEnSyuy49RQizRhp38byH07SwB0ElBZwys9ysuk6C+fFonJUWt8UU70KU2j0DlL9sUR+ZdIruWGuhxS3TWaNqa2QGruJt2XhmECQPZw8wY6/f76qQHS1e/gFbAKbtUViuShfEGFHUTmRfZUySehErUXMRzpZlh3L+TTcsWVYLxLixHm2od35DmjJmb5MqEmDpBpJkpIWM5n4PFSo8Qtc/Xvp57W7gTNWUCmrHda6/tngYI+AfQ+IGF/KlQQIkrBKndCKvBswKFrS/jBVA8NuRklfFlZXxsAtgzFCuplZ3nCupxGtDVKJUZ3qL9ptXIJSN8TKQ9XKEr5xs0hhcERIMxKtgwUC8oIrx+XrnK5O7SX0KEW6xd1dM0+PMDdfozl/v1fXwHzByqZWcXCpnmiC+5sH3vVeRrgiO34p/J1bwiOjeMf9f+IXJzOxYLMFcBsGiUZqiFrKdYw9wft2sKmqjPlGw3cd8e8fjS3TQxhJwtlxZQYpTgSMfubSaWQPl4pvaeQ33nlICmAXY8IuxxsfC8CtCxaoGYamcSbD6mcu52HYO058QQFvQXV+TnRG02t+/Lg7YOsNoynuqkuTF0x7beY/tk/W+AG6T3vYYPUsQyVyh81rNyisSKW7kS3uEDLFrnq6rh6t7wRJqIA3g3W8zDqoU7U+pKxYY6GV24
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5549.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(376002)(346002)(396003)(366004)(136003)(451199018)(478600001)(110136005)(6506007)(6512007)(6666004)(26005)(186003)(66574015)(66476007)(41300700001)(66946007)(66556008)(316002)(4326008)(53546011)(6486002)(966005)(8676002)(83380400001)(8936002)(5660300002)(2906002)(38100700002)(7416002)(2616005)(31696002)(86362001)(54906003)(31686004)(36756003)(14143004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q1k4RHVrcis3NGdrMEdnMXFYQzNrZzlGbytLWXNaK29aY3RqaW45b09HT2N3?=
 =?utf-8?B?dlFwdXNUOGFLNndRaXZFVTVtajhCdElwcTB5eHJHMlpQVUF4WS9yYWVhd0RR?=
 =?utf-8?B?WFBrU0FDdnZGVlpoWEdyR2YvMUs0S0R0dUxzQm0vRXVJeThyWlp5cGJHaGVj?=
 =?utf-8?B?bmRqUUUvd2JOWkRrMVc4NkJTWVhoVmovZ29jaUNMbzIyRWhZZFhoYy9YY2ZX?=
 =?utf-8?B?UHAwS1NJWlU1UWJyL3FZekU1NjliUkE3dWVGeEZybkRhVzZPY3FJMTRpSlZO?=
 =?utf-8?B?QU9RbXZ2UFEvbWg0QnNFRmlCRndUSjVCb2JDOUg4ZnlUTDhDTU1QcWxmSkRE?=
 =?utf-8?B?WGwrMlV5TTV2TmFqZjU3TFZjOHE3SEJLTGxCMTdSTGc4N2JTTHIxZjVLTDli?=
 =?utf-8?B?TGcvNnE5a2pHcUdRZS9QNHYwbGtnRzJySjN3V3pvNk93aUl0NE1MeTJuL3Fj?=
 =?utf-8?B?eEpMMG9jZkFUS0w1R1BUTGtQWnpQK0NrRUVNenpVQ2lDQWd2c3kzVXNhUmFp?=
 =?utf-8?B?Z01mdm9xY0MwZldDalArUkE3bytSdnc5ai9zSGYvN0tRUVMzK09Xc1pxOVVy?=
 =?utf-8?B?M2NmeFNScmZRUW1sRHRiNFFrWVE4U1NzNVkvdVNwaytZMU5sd3NmUyt5T1Nh?=
 =?utf-8?B?R3lNRUNnUTBRNERna2VsOVV1NjFXRk9DMzFwRXhqZmRCUksvMnlwM20va0xJ?=
 =?utf-8?B?KzA3YjFBcXI5WXM4c0JJRlc3R2p1dWNQVFpNNGRsV0tKZERvTUdmNGFwZjhD?=
 =?utf-8?B?dTV4UXZCczhXSmJvVE11R0xhZ21HYnJoVWhMVHNUelArK3oyVnV3TGgvMFFr?=
 =?utf-8?B?SGZUNjdGRnZKMXR3d2YzNFI3YlhHUVBmYVNpYW1UVEpvZjRFV3Q0WmRtVUMr?=
 =?utf-8?B?RWkxV0xvTU8xNEJTUEZLYTExK29CTjdQYTdxbWphQXlOd2ZJZlkyYjBXQU0w?=
 =?utf-8?B?ZnVvUzk5eXZuQnVBTE4vZFNLcnMxMTVVbUZXOUdSYXg0ZzJ0VUlDSHFLbVNw?=
 =?utf-8?B?VkpBM3lFR3lmeVd0UitrWm90RGFxNWZ6bFBEUGkzUzU2NHRNVE1MRlNqWmFJ?=
 =?utf-8?B?T2dHanlIYjNqZlBnUTl3aFJQZVlzTWw4V0xSTmRKelhMcXZwTDZkSWIyTjFj?=
 =?utf-8?B?MnpubVRWSG00RE4zb2V6MmFlS3lnQlVuL1ZnZG5iaDB5V3diNjVBZk9iVTg1?=
 =?utf-8?B?dE1Fa05xZ2h1d2JNTGtheXAzSkFURUU4Y3ZjUlZZWEdoaTNhU21xSWxqTFVp?=
 =?utf-8?B?VnAzTEJWUnY4UHUvT3VZaXJpV3FkRnRVTTd1RGd3ZzlWbkdMdWVyZWhVcDU0?=
 =?utf-8?B?bWR5cmR4Z0lrYTRYb0VPTUZDQ3BqN2RxUFI4bjFyUHNPRDBQM1ZGYWhPdGgr?=
 =?utf-8?B?UmNNOW8vbGJ3SFNnajRlc1d6SGE1Z2crMThxc0h6bkl4NDZFRzI3Q1N2UnpB?=
 =?utf-8?B?d3FVdXB3aDRldTA1VG5RNVNlMk8zRExybFFUZWU3ak5ZLzl4NFRUNzNYbG1O?=
 =?utf-8?B?VnFOQUh4ZUQ0aUVLb1BZVVREQW1xZzdXdStFancxcmNSWS9wOUh1S2FZYkRJ?=
 =?utf-8?B?SmtGT0NmUGp3TkhFeEJweTQwQk5VMUJKQWFTa055ZWE1S3RMYWh1QUorbU14?=
 =?utf-8?B?TjFlZzl2MDZqOHAyK21rWmhkaHRBTllRUXpjKzU5akxwcHM2QnowQStwTVRF?=
 =?utf-8?B?S3BJNGpSL2NKS01EWGxKeHYxZHpyV2dsUERkRTFVUS9meEdIMFpXWm9VT3Rw?=
 =?utf-8?B?YVErcDgvL0VYdzB5K2pkcFNOdnBBMSs5SjY1bHdETHgzMDl2YWtxUGh2QTBN?=
 =?utf-8?B?N09SUnVQUENBelpESTVBOEU3RGxmUG1JRStiOVE2cDMrZ1I0aTNZZXhQWUlK?=
 =?utf-8?B?ZEZ2elNUVFRBajNpRjNDbkQrU3BTVDdtSHd6a0NWNU9ncFF2eWRtT01iay9p?=
 =?utf-8?B?eUltR1NJems1ZUI0QkIyVTdwNnRDbU15WHk4QWhUaEluT2M5UHl2TTQwTDdS?=
 =?utf-8?B?a0lidytpQ2FDWWpBdVhnZzMzRldIaWRyRkp3MFNlSGlyWlFZZHFHZi9LOU9l?=
 =?utf-8?B?RVBiMFF2aHFadlFJN0ljK3J5UFJMU0dvYkhRRSt1aCtzMXNyQlFZUGpxWER1?=
 =?utf-8?Q?/coabiyhMLRGNBj+mpHOC9tMm?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d318afd3-75fd-4821-6f59-08db15afae2c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5549.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2023 15:07:29.1645 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r47C+1tK09KDwb9S9ihzxecJ+o9CIKN4dyvFftsEKUt50mqAxOnx0iNEA71r7IAJwleMsYJ7pnVBQNwk7rJOOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7435
Received-SPF: softfail client-ip=2a01:111:f400:7e89::621;
 envelope-from=avihaih@nvidia.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


On 23/02/2023 12:05, Cédric Le Goater wrote:
> External email: Use caution opening links or attachments
>
>
> On 2/22/23 21:55, Alex Williamson wrote:
>>
>> There are various errors running this through the CI on gitlab.
>>
>> This one seems bogus but needs to be resolved regardless:
>>
>> https://gitlab.com/alex.williamson/qemu/-/jobs/3817940731
>> FAILED: libqemu-aarch64-softmmu.fa.p/hw_vfio_common.c.o
>> 2786s390x-linux-gnu-gcc -m64 -Ilibqemu-aarch64-softmmu.fa.p -I. -I.. 
>> -Itarget/arm -I../target/arm -Iqapi -Itrace -Iui -Iui/shader 
>> -I/usr/include/pixman-1 -I/usr/include/capstone 
>> -I/usr/include/glib-2.0 -I/usr/lib/s390x-linux-gnu/glib-2.0/include 
>> -fdiagnostics-color=auto -Wall -Winvalid-pch -Werror -std=gnu11 -O2 
>> -g -isystem /builds/alex.williamson/qemu/linux-headers -isystem 
>> linux-headers -iquote . -iquote /builds/alex.williamson/qemu -iquote 
>> /builds/alex.williamson/qemu/include -iquote 
>> /builds/alex.williamson/qemu/tcg/s390x -pthread -U_FORTIFY_SOURCE 
>> -D_FORTIFY_SOURCE=2 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 
>> -D_LARGEFILE_SOURCE -fno-strict-aliasing -fno-common -fwrapv -Wundef 
>> -Wwrite-strings -Wmissing-prototypes -Wstrict-prototypes 
>> -Wredundant-decls -Wold-style-declaration -Wold-style-definition 
>> -Wtype-limits -Wformat-security -Wformat-y2k -Winit-self 
>> -Wignored-qualifiers -Wempty-body -Wnested-externs -Wendif-labels 
>> -Wexpansion-to-defined -Wimplicit-fallthrough=2 
>> -Wmissing-format-attribute -Wno-missing-include-dirs 
>> -Wno-shift-negative-value -Wno-psabi -fstack-protector-strong -fPIE 
>> -isystem../linux-headers -isystemlinux-headers -DNEED_CPU_H 
>> '-DCONFIG_TARGET="aarch64-softmmu-config-target.h"' 
>> '-DCONFIG_DEVICES="aarch64-softmmu-config-devices.h"' -MD -MQ 
>> libqemu-aarch64-softmmu.fa.p/hw_vfio_common.c.o -MF 
>> libqemu-aarch64-softmmu.fa.p/hw_vfio_common.c.o.d -o 
>> libqemu-aarch64-softmmu.fa.p/hw_vfio_common.c.o -c ../hw/vfio/common.c
>> 2787../hw/vfio/common.c: In function ‘vfio_listener_log_global_start’:
>> 2788../hw/vfio/common.c:1772:8: error: ‘ret’ may be used 
>> uninitialized in this function [-Werror=maybe-uninitialized]
>> 2789 1772 |     if (ret) {
>> 2790      |        ^
>
>
> The routine to fix is vfio_devices_start_dirty_page_tracking(). The 
> compiler
> is doing some inlining.
>
I don't think I understand how inlining could cause it.
Could you elaborate on this?

I thought that the compiler just missed the initialization of ret 
because it happens in the if else statement, and that simply doing "int 
ret = 0;" would solve it.

Thanks.


