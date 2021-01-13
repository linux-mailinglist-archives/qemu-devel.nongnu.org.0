Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A032F50B1
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 18:13:54 +0100 (CET)
Received: from localhost ([::1]:37976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzjiU-0004K9-0P
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 12:13:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kzjaJ-0003S9-6t; Wed, 13 Jan 2021 12:05:27 -0500
Received: from mail-eopbgr70112.outbound.protection.outlook.com
 ([40.107.7.112]:55232 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kzjaA-0006to-Jl; Wed, 13 Jan 2021 12:05:25 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EDE+aoZN1RtR+O7T89Fw/fNjTNjaprMhUrNMUxIJ6U/lL4UNgZ2LyA4r7VmT7CLy1+/QjVSmOiRIMK/62/jrJNc+YKggkGZJ7s+1VQF2kR2qrcMXVPpawO76TR8fjxxCYi7InN0/m3RtRZvoVuNZtoP2ziIDVPR9T9rLUTHGb55FRhkSC27ZakkjgrH6P1wH6ECCcsQ5aPh9BE6sNucbyWNsNivARcf1JgnOVLRhJ3bCtmOILzmyhaVqm3JiruTMAWO+vmzCzo29ySaDjtabMUZrXWGhOHZOj7CwIOnpGxyheff2O/d5fJzazWQ6ZN4BFL/TQphpgncLpavbP9kuxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v9V5QZ/a8DOJqbwamS17ilOP5/jml4oGNtGM7BtBWpU=;
 b=iUPCAFnjN/Ar1JpBxEASBDDn+omEgigQVV0mbQ5nKAR1mJGEQd2m8HXl9fOIvvAMZL38ZNgF06CHvwEk6JBr7U8SjdlWop4PFBHCGw8CRGXy6R2VuBlUhWvZOn7yqdKzM1H/SyRuN4v1JS038ZM/CMb5LJtg/2PrmM9KzE0uflvvtklADNVE3ojaoTdzFkAn3HF9z7P1d0AEgLA7GmSptusNLtKjRqbm2rcGtWIaZ7NDbAtJKq/YniN6ft3yp+BR+q7GB14p/MKTv8M65sQyNtcTx/+tC/olxAsv5VeVfosEtwpySphSI9hD3dR0zcBZOjmdUdH0pu0LKLkJAgboPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v9V5QZ/a8DOJqbwamS17ilOP5/jml4oGNtGM7BtBWpU=;
 b=lgzx7rfX2SzlinCU3Tj5zwPwFQjYrz0A54ESzkUsqxFgLM3IzbKu6tE4omAs1WL1dO//dr1GL6S3Q3FKtYLOcneUr1HKGUM8fove9PPRv78GyjaEFc6leeBLlayXpq7lV/8zVPzFnZsFFiy3ye8LKwHCM6goitkQKAWGma+UF1A=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4535.eurprd08.prod.outlook.com (2603:10a6:20b:74::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Wed, 13 Jan
 2021 17:05:05 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.009; Wed, 13 Jan 2021
 17:05:05 +0000
Subject: Re: [PATCH 4/7] iotests/129: Use throttle node
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20210113140616.150283-1-mreitz@redhat.com>
 <20210113140616.150283-5-mreitz@redhat.com>
 <e3aa08b0-940d-8ae7-c4ee-a132510c1c55@virtuozzo.com>
 <0257a8ac-316f-6cd9-926c-921e7a26c7e1@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <50ee44df-3a68-f160-50c3-fa90c31dd28d@virtuozzo.com>
Date: Wed, 13 Jan 2021 20:05:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <0257a8ac-316f-6cd9-926c-921e7a26c7e1@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.80]
X-ClientProxiedBy: AM8P192CA0030.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:21b::35) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.80) by
 AM8P192CA0030.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:21b::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.10 via Frontend Transport; Wed, 13 Jan 2021 17:05:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ab0ea16-4f96-4fc5-6387-08d8b7e55f78
X-MS-TrafficTypeDiagnostic: AM6PR08MB4535:
X-Microsoft-Antispam-PRVS: <AM6PR08MB4535D3701B46BFFA1C4D1390C1A90@AM6PR08MB4535.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1824;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oMcj8mEff9EEHGDcJc/OxM5xSqjRfibHbxu0BmZZFwOc5PuUixd9ono4nkGQiL/j+PrnWRA72EqPi3ymkbUNH7LQBcI0lMPHX52zjXWTMBZcByooNf1dVnm/kRZrxvHamHEsKVCZBeDnvrv2e86AcEx0I4SPYBhPLICF7LSpuOlksXo9ogvPzCjnHTJa4fFR3qCwSlE3RpAAkt6ztcwSAvvX+vY6EpHbYugs6KvHrDC2UDOfFzhi4FcrIQulySM4lqt3rhBBpUte6/vnEQehk3q4E5DxDYup7heLr2IbuD7HtP/dJJb14lh4puEwrqXq7De0e+l3+FlNZquSEtqkB8WjeWseE3q6A5WVBHnI/D6G+Z7YZeNAIcbKWOKM9rzFOGekJx2hD66DZjYdp2hg6gCsDZ8Hq3f5k0fALJZJ8gly4KTD9EihN03gSWewzbgd0RsH/NZBEdAudYIl0YdgMmqyGvRMgwofzvkBGqqJdsc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39840400004)(396003)(346002)(136003)(366004)(36756003)(86362001)(4326008)(956004)(5660300002)(2616005)(31696002)(53546011)(478600001)(66946007)(26005)(2906002)(186003)(16526019)(83380400001)(52116002)(16576012)(31686004)(66476007)(8676002)(8936002)(316002)(6486002)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?emJDTkthQWx3b0RkL3h4QkRBYmlwYjJ4VlBoWnNvQmR0NTk2VWxVOGtpSDcw?=
 =?utf-8?B?TDVYeWhuZUVTT0gvMUc4dnM5cElaQTVKcGJaNEtER0tuSjljYWo4QWRtLzAy?=
 =?utf-8?B?cXJ1S2I2bmpGc0NjT0VGZVROSHdnSUN5YTlpNkl5OHY4RWFOdGpvYmF5TFly?=
 =?utf-8?B?UW56UlJZTVNKZGpzK0FPS1Qxc0xRdW83S2M5OG1tbnFjb2l1dmJxQjBEYlgr?=
 =?utf-8?B?QytXL1dxMlhUY3ZWVk1DWlVUUEcxRkZwSDYxZGVTbGhRYk41UDhUOEtPcVF2?=
 =?utf-8?B?YTdQYXdYWHdaTmFQeDlvaVNHeElkVS81ZTJScDRSN3ZicjNWM1hOdm1XODll?=
 =?utf-8?B?Zk9XTmZ2NllBZ2htWm45Z1l4bnJPQm11RS9JNFc0QmhQWFV2ZTBDdDFIdWdq?=
 =?utf-8?B?RTVyMWpyVkdKNk5IbXVQelQ5akExS3JqWDFmbG1SMWI5c204Smp6QTI2T3pU?=
 =?utf-8?B?MldFNzJHUnRuSmRJS2V0UlNUN3VPTzliYjJVNFZrR292Umgwa29Gbkh1Vm1K?=
 =?utf-8?B?L3orNDFsQWRiakNlTFZZbVJGSEJualN6UFdzMERrckRHWlViL0dxbXcwaUNU?=
 =?utf-8?B?YlNRM1diV0ZkL3duM0xYTjRrY0JsL2N3MjFramJFa3RzcHRRSE9rUzFEU0Q3?=
 =?utf-8?B?SkdPQjNiVllQR2V2YUd5WUl3OW42ZTEyWUVYWGM2UGNaMXgyZkNza0J6dU1B?=
 =?utf-8?B?QjlWanErT3VNb21lTk5INGV2dWJnd2NyY3BGcHJSQXpuV1RCY0QwRFNJc24x?=
 =?utf-8?B?NDhudTRNbFM0bVYzRGN4TXp4WUJmRzMxSWI3VXNkU0FLY3dhUUswNVJMWWU5?=
 =?utf-8?B?WmFaMTl1V3RybzkrbHR5NUMzYXdpblFTMENheEpwdVlkbkdjVnlwYldrMXFO?=
 =?utf-8?B?NDV6anVqWnhNa3FLSVE3TXlIR1RYdVRSdkkxTFlGTHNVTDd1eDR2YVljK0VI?=
 =?utf-8?B?ampPQWJ2bGpheW5hbHlBK0QwamMzMzJoS21uU1JWQWVrTXIvbVZKNXFQMlNj?=
 =?utf-8?B?RXhrVzJ5eVpDS2tOakhGYS9DeS9hTklZK0NzTEZRS2o4VW41ZFU3YzFFM0FE?=
 =?utf-8?B?UWZDTElRK2Y2WFMwbUM2NkQ4Q2JQSk1LQkEzcFJUYkdZczFIZ0wzSjRidkVZ?=
 =?utf-8?B?Q1EwTU9ES0NBcWMvYlF3WDNramJ5QlZweEN2Y2xCRHo3U1BSUGhJNmlJeHpZ?=
 =?utf-8?B?c2gyVXhyVXBZMS9TNU9lM3RsRk5oWTBYanBXbmhBdFRqSTdOM0VCRVZGeEZU?=
 =?utf-8?B?VDNNOVpqTDUveFp4L3NyNGR0eE4xRGdZcFRncTVuZ2cyUUExbGttUE5lcGRD?=
 =?utf-8?Q?SPpe2CNIe6AIGx939XQ5Q58o146qzKwKCu?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2021 17:05:04.8819 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ab0ea16-4f96-4fc5-6387-08d8b7e55f78
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j4mzxu6+Dh0ENQeplyhdsv9z78kTPKCLCJqfcupuyB/XR3gQNV8QXcqezr8owo75GxaV46PMgRiJ0NO3OagjMzKDEc5mh61Oc+hoqgQrM38=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4535
Received-SPF: pass client-ip=40.107.7.112;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

13.01.2021 20:02, Max Reitz wrote:
> On 13.01.21 17:46, Vladimir Sementsov-Ogievskiy wrote:
>> 13.01.2021 17:06, Max Reitz wrote:
>>> Throttling on the BB has not affected block jobs in a while, so it is
>>> possible that one of the jobs in 129 finishes before the VM is stopped.
>>> We can fix that by running the job from a throttle node.
>>>
>>> Signed-off-by: Max Reitz <mreitz@redhat.com>
>>> ---
>>>   tests/qemu-iotests/129 | 39 +++++++++++++++------------------------
>>>   1 file changed, 15 insertions(+), 24 deletions(-)
>>>
>>> diff --git a/tests/qemu-iotests/129 b/tests/qemu-iotests/129
>>> index dd23bb2e5a..febc806398 100755
>>> --- a/tests/qemu-iotests/129
>>> +++ b/tests/qemu-iotests/129
>>> @@ -32,20 +32,18 @@ class TestStopWithBlockJob(iotests.QMPTestCase):
>>>           iotests.qemu_img('create', '-f', iotests.imgfmt, self.test_img,
>>>                            "-b", self.base_img, '-F', iotests.imgfmt)
>>>           iotests.qemu_io('-f', iotests.imgfmt, '-c', 'write -P0x5d 1M 128M', self.test_img)
>>> -        self.vm = iotests.VM().add_drive(self.test_img)
>>> +        self.vm = iotests.VM()
>>> +        self.vm.add_object('throttle-group,id=tg0,x-bps-total=1024')
>>> +
>>> +        source_drive = 'driver=throttle,' + \
>>> +                       'throttle-group=tg0,' + \
>>> +                      f'file.driver={iotests.imgfmt},' + \
>>> +                      f'file.file.filename={self.test_img}'
>>
>> python has a "c-like" string "concatenation", i.e., you may omit "+" operators (I don't know is it a good practice, but I do so:)
> 
> OK, why not.
> 
>>> +
>>> +        self.vm.add_drive(None, source_drive)
>>>           self.vm.launch()
>>>       def tearDown(self):
>>> -        params = {"device": "drive0",
>>> -                  "bps": 0,
>>> -                  "bps_rd": 0,
>>> -                  "bps_wr": 0,
>>> -                  "iops": 0,
>>> -                  "iops_rd": 0,
>>> -                  "iops_wr": 0,
>>> -                 }
>>> -        result = self.vm.qmp("block_set_io_throttle", conv_keys=False,
>>> -                             **params)
>>>           self.vm.shutdown()
>>>           for img in (self.test_img, self.target_img, self.base_img):
>>>               iotests.try_remove(img)
>>> @@ -53,33 +51,26 @@ class TestStopWithBlockJob(iotests.QMPTestCase):
>>>       def do_test_stop(self, cmd, **args):
>>>           """Test 'stop' while block job is running on a throttled drive.
>>>           The 'stop' command shouldn't drain the job"""
>>> -        params = {"device": "drive0",
>>> -                  "bps": 1024,
>>> -                  "bps_rd": 0,
>>> -                  "bps_wr": 0,
>>> -                  "iops": 0,
>>> -                  "iops_rd": 0,
>>> -                  "iops_wr": 0,
>>> -                 }
>>> -        result = self.vm.qmp("block_set_io_throttle", conv_keys=False,
>>> -                             **params)
>>> -        self.assert_qmp(result, 'return', {})
>>>           result = self.vm.qmp(cmd, **args)
>>>           self.assert_qmp(result, 'return', {})
>>> +
>>>           result = self.vm.qmp("stop")
>>>           self.assert_qmp(result, 'return', {})
>>>           result = self.vm.qmp("query-block-jobs")
>>> +
>>>           self.assert_qmp(result, 'return[0]/status', 'running')
>>>           self.assert_qmp(result, 'return[0]/ready', False)
>>> +        self.vm.qmp("block-job-cancel", device="drive0", force=True)
>>
>> won't hurt, but I'd drop it as unrelated to commit
>>
>>> +
>>>       def test_drive_mirror(self):
>>>           self.do_test_stop("drive-mirror", device="drive0",
>>> -                          target=self.target_img,
>>> +                          target=self.target_img, format=iotests.imgfmt,
>>>                             sync="full")
>>
>> this doesn't seem need/related too..
> 
> It is, because without a @format parameter, the job uses the driver of @device as the output format.  That driver is now 'throttle', which doesn’t work as a format.
> 

Ah, understand now, OK.


-- 
Best regards,
Vladimir

