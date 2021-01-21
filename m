Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 433002FF51E
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 20:52:48 +0100 (CET)
Received: from localhost ([::1]:50792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2g0d-0006mB-Bw
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 14:52:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l2fqZ-00060b-J8; Thu, 21 Jan 2021 14:42:23 -0500
Received: from mail-eopbgr60119.outbound.protection.outlook.com
 ([40.107.6.119]:56888 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l2fqW-0003tm-T6; Thu, 21 Jan 2021 14:42:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RqX4fbo20EQJyatBZTOUjokKtdKL4uZsaX68shAcmSKjNLC1c24Ylk2IwNfXdA5Dl2MVNrQQu2+hb1T4fOeD65bnh/RCvqZzLfth8YpTQLC1e6tyP+ofHyP/ikASdueyso7dRpS+Tmhfdq5L8Ph7/Gbe8+dI9suv3s729Cs1kJLLy9x1Xeld2n5zNLBQdrTT3Uh9HTS4hRGpndsh40ddUEtk+Lf+/Es5ufLp8ze3Asf+YZcUrPExtRxe+JlakpsGh/vbeWc1xGOeZsA6l5RK42RUef9640SyPQrMm+dHvcr9M5Rs3y+4SpNShY/DwtCXB6s9f3mtdvWVYAnyXOrTCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I7sL7xTbz89On1QCDAEm8LsVSnCKawsUjDA1UgxoSeQ=;
 b=ROe1iacRALy/ul4D1r6nopACunVgjQRdA3kVPbglUD3IOn8h6bz2u70GpkeUNChBCazRqmGKdqB2fTvOe3sjL5bzFSXeUdFA5aK53kvGu8OucV634SMHo2xNJ+mDTyO4LO/ztqe0q0IN2mlV38zukzNotNMaSzGY2ZUChRN+087NeYjnC4BLCqSuhZ1URiZZcfOQXu/C4ZmXTM5qmFQ6ev6tmRm8wXlVIt3iZOWi4vF6H1JSEoM50vkqnQHhMoxdq0d/xOt3+rb5wiJcDniNAqrQOUIvnrL3pFvashVmCJnx9JQvC6u9zNQtlMHi2Cb6/Tfzx36t/HhbmPCV2l1Now==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I7sL7xTbz89On1QCDAEm8LsVSnCKawsUjDA1UgxoSeQ=;
 b=lLrrFrNgx+f/rniEqPc0/gAib1L6PhxqXyXU2WAAjFC3R8dvT2WCO4CO9E/gZchYXW+Kg7R7oR94eMmtC2OjngNJVQCrmlOgWYhirb8vZ1IJKyMdX17D+tnN4EMN0mmfuLdcZDZdpqXgI6vaOBkIOc1lFushsLBSHLsdVBdrFb8=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0802MB2417.eurprd08.prod.outlook.com (2603:10a6:203:9c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Thu, 21 Jan
 2021 19:42:16 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.014; Thu, 21 Jan 2021
 19:42:16 +0000
Subject: Re: [PATCH 09/11] iotests/264: add mirror-cancel test-case
To: Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org
References: <20201118180433.11931-1-vsementsov@virtuozzo.com>
 <20201118180433.11931-10-vsementsov@virtuozzo.com>
 <80374353-9ad2-0dbf-576f-9b37e342cda6@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <e3a908d5-9256-470e-6ef8-e8f2195fc058@virtuozzo.com>
Date: Thu, 21 Jan 2021 22:42:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <80374353-9ad2-0dbf-576f-9b37e342cda6@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.101]
X-ClientProxiedBy: AM0PR02CA0217.eurprd02.prod.outlook.com
 (2603:10a6:20b:28f::24) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.101) by
 AM0PR02CA0217.eurprd02.prod.outlook.com (2603:10a6:20b:28f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12 via Frontend
 Transport; Thu, 21 Jan 2021 19:42:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bcf77491-6994-4ba2-013d-08d8be44a854
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2417:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0802MB241729942125C86B1BE62F10C1A10@AM5PR0802MB2417.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kwVxIGtiEmNxq2DyWRHQgwKFJIy1sivrBK5LkO+fTsiSyk3K6tD5P6memzluG+taCn83cnWtuzSDHKktBPCHHUqjYo1oU9zjTVnrPltWM+fAE+X3B750JFzq0Lo4sXxe2LDwnpwLKf9Bf2XnbvHybVcrgqWxDR+u69Cq7v+tHtOWz0/OTAhUJ2KCkLJws/huRKeeHUKwDh81OwSXGZo7KoGBEZOQQBW2mLTHc82ODZBHQcaMz1tRGPrpkzA0uEpjDqt5GJNcL0hXYiJSlqbThZOBcGuiMGUmyEZytlhD12qO2L5SRoT/+3gQ/ihtpk4pi4mSeFM03xc9s5UedL65FuzEVRJIQQv67jKzcLfhnAKClbxfxlrheo5hnnIaVGPFcwFr6WiQOM+h69iHcO24dgqpjzK3s57iGuwlrfAaM3nxjdXL5yuh4hQWHyOxTnscgH9dm5BGsaZI+anco4jztmFkhfcU3MhNWG3OChAN1SE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(396003)(39830400003)(366004)(66556008)(66476007)(66946007)(478600001)(5660300002)(2616005)(4326008)(316002)(956004)(16576012)(16526019)(53546011)(31696002)(36756003)(86362001)(6486002)(26005)(186003)(107886003)(83380400001)(52116002)(2906002)(8936002)(31686004)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VkN2czhFSWFsUHJlcFY5aS8yNVhGVXltK3dQaTN5aEE2K3RRNVdscHY5KzVR?=
 =?utf-8?B?MWFLMG1yVW56WllLRWVEb1dxZ3hBMFNTekgwSE02M01QdmxYVzB0OG9GUkY1?=
 =?utf-8?B?bmIyaEoxUjlXRFJObDVGMEtMV21oWThqRlIwRVJib3dFRU8wdUpyeVArVGRR?=
 =?utf-8?B?bi9lNVBPVzRIV1BVTXQxcmlqcWpBQjYyT1FZbVkyL2xFSnBkSzYvZXBJTUJM?=
 =?utf-8?B?MnZLb0hFR0poazJ5TklPaW9jUTlLRzJMd1pRbjJYNXp0QjYvV2x5SG82N1JM?=
 =?utf-8?B?L0hEdW9FaTMxaVBOMmJQN1NvSHpRcWJXRXF1cEsyVzRpeFJPRmtsTnd4Ti9v?=
 =?utf-8?B?UmdGTk4xYW5kaXZlNldIZWNtcjUveVBxanlPMW9adTFJK3hnbHN5NFAxNnFI?=
 =?utf-8?B?MFlySVB4NlhMTE5qeU9CYTlEMzk4N1A1K0ZsaTUxdXRtUElTM21FSDEwVGN4?=
 =?utf-8?B?cE5BcFNQdDk4VE9BVkVVRlIvOXRYVXlvSmp0Q2ZWRm1XaUllcW14R2V5akp1?=
 =?utf-8?B?RHM0VXNsTWpCSXZvMXlBMHFCSCtlaTZFYm85TXBJaGVOd2o3bldPS1JDdkps?=
 =?utf-8?B?dWtvQVhjdVRZZWxseWExWjgzM2hrZXFrU2R2Mi9KbVJBRGVWb0h3bjNXSUt4?=
 =?utf-8?B?MHIrWFM1ZTE1eitnRnBlMXB2QlVRcHRpamU4Y2lYU3BMalZKTkhsY05BMlhk?=
 =?utf-8?B?VHRkUWp0ZFNmakZlQWhML0dIVDdYaFY1anFRd1J3Wnd3WUtJNTM3RHFMOUxM?=
 =?utf-8?B?SVc1eXYrK3lSSk5TRldRVHY4aWpKMDNGK0h0MndRMEhrVmJlc1NDVmRMbXAw?=
 =?utf-8?B?VWpydEJOb2JvNVpKS3JZQ1BQdXlla1RmTDNLZlMrM21GN2VPOE80Y2M5VTBq?=
 =?utf-8?B?WHAyMWtkUHo3SzZORDc2bStIeGdzdW4zVTRXdXFVa2lFeGhPNG12RWRiOTVQ?=
 =?utf-8?B?ZWZ3V3VhT2ExZjN0ZldDNW94dEVRS2x2L3NLc0M2WXhnYzdsL3l2ZVkrUmN5?=
 =?utf-8?B?VGVONlQ0VmFwelU2TXlSanFxVzZaUHBGSjdIZUFHZktkbzNzNW02aHN6MlJ1?=
 =?utf-8?B?QkwxaTJIbzA2Y2xuQkJMb0JpeFJWb2p2aW9uM1BaUHBnenFFbCt5a1VoSSti?=
 =?utf-8?B?T1pnTjlyN3JOSU5ZVW9UbnVrYXhxSkI1NXBRSzE5SWlHWGhCdG16ZEphS2ZH?=
 =?utf-8?B?QjFReGZnTjRhZTUxYWFqSWd2VVJhNmZyL0dIWGpPQ2pKcWV1aTVDYWtzc3Yr?=
 =?utf-8?B?Q1JkdXJwbFRubXNCWVBvNnRiRThJMW82dHdkRnYwUUxFcWJzTElDd2REK3g4?=
 =?utf-8?Q?tqhnve0XFcQrNPdHpAiVPzMp3cWi1typsc?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcf77491-6994-4ba2-013d-08d8be44a854
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2021 19:42:16.4852 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9bQKKNa3u8msFu8KRPXLXBRQmTV5/keD8xXA421NTIPYuzIReDt48cVuw+aAzekGpmRwPSx+Xu9ut0IMVyUx1jVW9g7qkQ+2pZVH9zriG6A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2417
Received-SPF: pass client-ip=40.107.6.119;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 stefanha@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

21.01.2021 04:26, Eric Blake wrote:
> On 11/18/20 12:04 PM, Vladimir Sementsov-Ogievskiy wrote:
>> Check that cancel doesn't wait for 10s of nbd reconnect timeout.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   tests/qemu-iotests/264     | 38 ++++++++++++++++++++++++++++++--------
>>   tests/qemu-iotests/264.out |  4 ++--
>>   2 files changed, 32 insertions(+), 10 deletions(-)
> 
>>   
>> +    def test_mirror_cancel(self):
>> +        # Mirror speed limit doesn't work well enough, it seems that mirror
>> +        # will run many parallel requests anyway. MAX_IN_FLIGHT is 16 and
>> +        # MAX_IO_BYTES is 1M in mirror.c, so let's use 20M disk.
>> +        self.init_vm(20 * 1024 * 1024)
>> +        self.start_job('blockdev-mirror')
> 
> Is this comment still accurate given recent work on the mirror filter?

Hmm, what do you mean? I missed it..

> I'm fine taking the patch as-is and tweaking it with followups, though,
> in order to make progress.

Good for me, of course

> 
>> +
>> +        result = self.vm.qmp('block-job-cancel', device='drive0')
>> +        self.assert_qmp(result, 'return', {})
>> +
>> +        start_t = time.time()
>> +        self.vm.event_wait('BLOCK_JOB_CANCELLED')
>> +        delta_t = time.time() - start_t
>> +        self.assertTrue(delta_t < 2.0)
> 
> I hope this doesn't fail on CI platforms under heavy load.  It didn't
> fail for me locally, but I hope we don't have to revisit it.  Is there
> any way we can test this in a manner that is not as fragile?

Hmm, I don't know. We want to check that cancel is not as long as reconnect timeout.. If it fails, we'll adjust the constants :) And we have no limit in it, we can use 1hour for reconnect-timeout and 10min for mirror to cancel for example (but probably something other may fail with such big timeouts)

> 
> Reviewed-by: Eric Blake <eblake@redhat.com>
> 


-- 
Best regards,
Vladimir

