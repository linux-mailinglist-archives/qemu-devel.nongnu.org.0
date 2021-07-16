Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4525B3CB761
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 14:34:36 +0200 (CEST)
Received: from localhost ([::1]:48800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4N34-00067P-UQ
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 08:34:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m4N0p-0004ov-0L; Fri, 16 Jul 2021 08:32:15 -0400
Received: from mail-db8eur05on2102.outbound.protection.outlook.com
 ([40.107.20.102]:43361 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m4N0l-0001fl-2M; Fri, 16 Jul 2021 08:32:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jn+QXlSBHL0Y/qzW+ZeSYmFvDd3z9OQnTH9l8KIi24s3lb8+vpcw6FOdqk7mCJAeXjLhhDpPxv1/DS/ZUGubsNXDHDid+Wy+kpXr2KPQNznj7DQt7lDzSlkHfkEYWzva/uhwJ4dC+zdNu26tWcnlB4Tb2c4DarPvLTxIF/eRkfqzISm5zwGzwxbELVEIqx4EQjjReuesl8H6UIJxpIgWmvQOldMsd9bRl3YtCBpz6H5P7etXkB8ls2XjdUI7+eO0v2LTONTH8zMGzWA7LN8g4nINLmTwAjb22dWKO81/JFKWIj0Q340VzB11ojteWot9jw67+3a5e5rA1Xx5+STzZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WQ6wexfGg6LexLu20k6PcCCy+1S0i9B0Mqffb09qbAk=;
 b=XzMk5SLRhzcgbKcWrX3CjLrdiXYecUaz2QlsyCrjKd61/9VPkRFTU84qNSlIen8sPjH9l66A9lG+mV6PkcWbHVRmkX5XdJ886KLeHxTB5rDZu4cbYwr3C1AFJrc+D8D6RDtFEZY4bmmJllhKh02hn8PlZdAbv4dyOzKOR2bOU2+DkPGVc1r4poA6Vvu+VOX8xyIPBac5jc0VjPNy1nBJrnxh3GbooeahaEGMID8dauwfxQT+p5SXJwpY5y041ZBTnu1IYdVppcp6z2FVSjyRcY7poCIAnmor50P63J9pDCBQp/ZULgG9/h5H1naiZKCbQipuVF9XEq+juz/VnNXPhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WQ6wexfGg6LexLu20k6PcCCy+1S0i9B0Mqffb09qbAk=;
 b=wJ7IsXmQf7SL7cMBjSFQauYsTW7Zvi6yBxy7/My+g0Uoo4xNbi8PMhqdX1dKWM0vS51UJ8Xva+ZhECnHpRNr1ixQWcy/7yfX7RwWKEs6wK2yupxxM6MpmsQQdoEuRQRUbsE6RzY84D5A+nlmy9l2nucZ8ovbRdxuUDdGzKsZ5OA=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4721.eurprd08.prod.outlook.com (2603:10a6:20b:c7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.23; Fri, 16 Jul
 2021 12:32:07 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4331.026; Fri, 16 Jul 2021
 12:32:07 +0000
Subject: Re: [PATCH 06/14] iotest 302: use img_info_log() helper
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, den@openvz.org, jsnow@redhat.com
References: <20210705091549.178335-1-vsementsov@virtuozzo.com>
 <20210705091549.178335-7-vsementsov@virtuozzo.com>
 <76a17051-b5c4-e262-98c3-046273fa4440@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <c9c4a666-5fce-cb1f-20f4-6e842d7b54e1@virtuozzo.com>
Date: Fri, 16 Jul 2021 15:32:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <76a17051-b5c4-e262-98c3-046273fa4440@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM9P250CA0017.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:21c::22) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.193) by
 AM9P250CA0017.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:21c::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.24 via Frontend Transport; Fri, 16 Jul 2021 12:32:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2010a309-e5b4-4c19-3d0c-08d94855b9a6
X-MS-TrafficTypeDiagnostic: AM6PR08MB4721:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB47216D82027A4F0B1A0533E1C1119@AM6PR08MB4721.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pZ+mNjsy8oFtmUQRF3uFdDI3LoACvbIoaeKxnnhbkElaRkUBBtEpudSgpkN2IX9QlDw1XSvrdqOwgRtxocC6t8h5jKGcEBwSQRUOK/XuAYo8ORkEVegmphQn5ZgTuGTfKrS5aMpiyXfo3NKZlSuW5bjbL2hRUeUDsk2oK5dJlRdrYQbk5OlqRmFEHZ/RjnLFncaBQqQYc56syd9LkzjSIRwnIan9jZzdIM12SvCV5EhckkVAnrnef+yL93zNVgTN6gd/Q9/3hWOGI/t13DOCdzqvFSDFx6GKT/yvy3gfOFegayIWZdCgAW7UoVZ/V/ahDYrBA4jIZ7SGS6cw7XEF7XCvQ2wvgWKzASJvMeAXEwHchDIZ/gs+kRDUUNEri5+WgUJeUrtan6b5/q62xM9pjRhGKDjg16RKc+lhrGiiwjrThOM1MpvXnDH8glNRocEyqOhBKfvFbx3kSQ36pRA5mv8WdYihHvtHmMh+3owJrlwQfp/I1vEot00UA9VLGcv2VGC7emxhCyPdGbSc8axeUz4ifZquXbSXEZphULEjgX9gY7ac8ci8/Nd5c/jLNWNykxLAXixi/+ZVKVRf1+ebrvMgpyKQqzKRRQ5m0rFJkSk6cmvmL609UCOVxPgJUEoJZLrh6jeJlMWbrt2bOQHWqFwfGyAZIdRlj0/usguJJLsswWBI4lzO/oi5bTiV4bUSNmZsn1Cef5UZR7Qjk0T1pNl6LKHG+yflOIUO37ek9V2OKBNT73DPZorCcOPGIwD8lLRmMl9E3L13hucHJQYT+A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(39840400004)(346002)(376002)(366004)(16576012)(86362001)(36756003)(316002)(8936002)(31686004)(6486002)(2906002)(83380400001)(956004)(2616005)(4326008)(478600001)(38100700002)(8676002)(52116002)(26005)(53546011)(186003)(38350700002)(5660300002)(66556008)(66946007)(31696002)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0RIYTZPUUFRZHJHNnZvMkt5ZHBud09Qd1dZc3ZUczcxek14UUJkdXpacnNZ?=
 =?utf-8?B?NlliaENWRUVaK2ludzk0UlUwSm9rZWlIcngyekxVQjdiaWdPbXFjTU8rSHRx?=
 =?utf-8?B?WDJXTDlRU29lYnRpbXJObHc4TlJKMkFZOUlORks5Y2dPUzIvbDV4MlFEUnRD?=
 =?utf-8?B?clNsdFVJdE9ob0FRUklwYXQrR1ZxZjZZU3NOVFE1WDZjVU5lQ3h3elRhSGYx?=
 =?utf-8?B?SERWWVlxV3FzTHhDWmZFblYzbWxLRG1maHQzc1NIZHNVbHcxblIwbnZLVHlI?=
 =?utf-8?B?MTMrL0VleGpsSnlMN1duR0JNQXNsY29vekQvRzVoUWVrd2dsVE1jYTBnajgw?=
 =?utf-8?B?c0krVnRUQkp3K0c3dEdRcFdhT2RpQlZJRnVEc09HZStoRXlQT25tYStrdmNl?=
 =?utf-8?B?dVNhVlRnYWRVZTR6ckIvVEFSTy91Qm1qcHcwdWFJQjhQK25YSE9XdHAvbmVT?=
 =?utf-8?B?UU1OZUZOL1JwTzdxWGlBMlkzQnh0ZGliOFBUM3NWSW5pVTVFUG83VWdrZU5J?=
 =?utf-8?B?M2dpNlg0SHlnVFlDNFZvbWdTOE9Ybmw3dUZLQ0NNMDVrVVlEaDFIZHNkOVhk?=
 =?utf-8?B?QllVZXovYmUxTndxU3BscW9GcjVWVExKUktiY3RrNzlXUmE4ZVh5cTMvN0Zq?=
 =?utf-8?B?TTFFVlVrbGQwUDJpR0c3UWJTbVN3LzJrejNXeVNjdm1wUlpRN2h4UUxFNVg5?=
 =?utf-8?B?M1ZSa0pSdXhiWGhmL0VWcmxBc1BHcVFhQjVhMHNONjd6cTFpUm8yVk5IVUo0?=
 =?utf-8?B?V21tOXdkM1U5T1M0a2w2VnJoU1FQOE12aWJrckVPNUlHbkRMeHYrdVR6ZHIw?=
 =?utf-8?B?dTdLT01jay9KSG1NUjBQY0JIZDh4NFVnWjhQdE1URHpMZlhYWEExQVNwbHBH?=
 =?utf-8?B?YnhFVk42ZWRJL3RDK040UXAvekNOeWdTNktnVW41WlVyVXF1ZDlGRkRlZ1FZ?=
 =?utf-8?B?b3BxYTI1WGUwMkEwK1J3VFcwK2w5WnhiMXZ0VTByRGg5Z1ZyTEp1M0J3bWFw?=
 =?utf-8?B?dkcweW5PckZiRWZ5WVdMRVgrQjV0L3FNUjNOT3JzQ04xVjc5dFVHSDlReFRZ?=
 =?utf-8?B?YjlSYUlad29pclVEbHo1TlNTeVVBc2RzNnRCTll1VVhPQXZ0NG5MKzNKMy9U?=
 =?utf-8?B?S0lUUXdNNnZEVmNDR0V4WWtZVzY2dExCWlBYU1BrU01rK0ZsMWFra2RObGh4?=
 =?utf-8?B?YU9KdkpqTFpXL0h6eDFDNEtVOGUrMGhPUE9FZ0k4cjczMnMyUm9nZWtSdzAz?=
 =?utf-8?B?Y0RsRDBoMHdpZ01FaDBFWjl2LzY5UkxqN3BabjR2bjFBRStscWMxNU9hK29J?=
 =?utf-8?B?V1ZYdEpZd0RqMEVBeFBISnc5OUlCdnNQZnhkaEdKMm5ZdkVlMTVYUElLeHdX?=
 =?utf-8?B?T0w1WkJsWnNSZ2Iwa05FLzdiNElwSGVZN1dEK1RyNFkyWjZaRFpxQkJ1elly?=
 =?utf-8?B?TVY3emlBa1FwQWxsQkhmcjUzZjI2VjdlT1IxdWpTKzVqR2U2bEp3a29uSVkz?=
 =?utf-8?B?TXZDTUlUS25MWTNuT24vTk9oNU1McytPNHZGVjRhZUdPTURrYVdXZjV5aXV4?=
 =?utf-8?B?cEpua05TT21tYm1oVm5xZ1hFMWpRWXI5QU9DTEdhOUlHVzk1cWZ5OExGejh3?=
 =?utf-8?B?ZVpiamxUbzU4R1dYYnVoT0VraEhRNHZMYlZqSGh5YzlHQTlYdEVQcHJOdW1x?=
 =?utf-8?B?ZVU3OWJkU1dJVjZjOGcwSDF5UEtaOGxPMERNYmdjQkQ5S0Y2YlM1MTJteHlJ?=
 =?utf-8?Q?CYIbvK0mTPE72Kop9t62955XXo/NrOw3a1pJCf2?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2010a309-e5b4-4c19-3d0c-08d94855b9a6
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2021 12:32:07.4930 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GmuRMDCZDzJzdKQl1uNjgkFHYNuu939bSzCxp8ZMSnFF8DsGcgN4j2Biuzs7pRzEQJyOWTotXIOYS8Lo4uCfH+7dTZFWOzVTOS7Xb+V5gRY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4721
Received-SPF: pass client-ip=40.107.20.102;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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

16.07.2021 14:39, Max Reitz wrote:
> On 05.07.21 11:15, Vladimir Sementsov-Ogievskiy wrote:
>> Instead of qemu_img_log("info", ..) use generic helper img_info_log().
>>
>> img_info_log() has smarter logic. For example it use filter_img_info()
>> to filter output, which in turns filter a compression type. So it will
>> help us in future when we implement a possibility to use zstd
>> compression by default (with help of some runtime config file or maybe
>> build option). For now to test you should recompile qemu with a small
>> patch:
>>
>>      --- a/block/qcow2.c
>>      +++ b/block/qcow2.c
>>      @@ -3540,6 +3540,11 @@ qcow2_co_create(BlockdevCreateOptions *create_options, Error **errp)
>>               }
>>           }
>>
>>      +    if (!qcow2_opts->has_compression_type && version >= 3) {
>>      +        qcow2_opts->has_compression_type = true;
>>      +        qcow2_opts->compression_type = QCOW2_COMPRESSION_TYPE_ZSTD;
>>      +    }
>>      +
>>           if (qcow2_opts->has_compression_type &&
>>               qcow2_opts->compression_type != QCOW2_COMPRESSION_TYPE_ZLIB) {
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   tests/qemu-iotests/302     | 3 ++-
>>   tests/qemu-iotests/302.out | 7 +++----
>>   2 files changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/tests/qemu-iotests/302 b/tests/qemu-iotests/302
>> index 5695af4914..2180dbc896 100755
>> --- a/tests/qemu-iotests/302
>> +++ b/tests/qemu-iotests/302
>> @@ -34,6 +34,7 @@ from iotests import (
>>       qemu_img_measure,
>>       qemu_io,
>>       qemu_nbd_popen,
>> +    img_info_log,
>>   )
>>   iotests.script_initialize(supported_fmts=["qcow2"])
>> @@ -99,7 +100,7 @@ with tarfile.open(tar_file, "w") as tar:
>>               nbd_uri)
>>           iotests.log("=== Converted image info ===")
>> -        qemu_img_log("info", nbd_uri)
>> +        img_info_log(nbd_uri)
> 
> There’s another `qemu_img_log("info", nbd_uri)` call above this place. We can’t use `img_info_log()` there, because in that case, the image is not in qcow2 format (which is the test’s image format), but `img_info_log()` enforces “-f {imgfmt}”.  It would have been nice to have a comment on that somewhere, though.

I'll add a comment. Actually, I only fixed places which breaks when I set zstd by default. That's why some things may be not covered.

> 
> But, well.
> 
> Reviewed-by: Max Reitz <mreitz@redhat.com>
> 
> (And speaking in principle, I don’t think I like the broad img_info_log() very much anyway, because I feel like tests should rather only have the actually relevant bits in their reference outputs…)

I agree, extra useless information in test outputs is always a pain.. We should pay more attention to it when add new tests.

> 
>>           iotests.log("=== Converted image check ===")
>>           qemu_img_log("check", nbd_uri)
>> diff --git a/tests/qemu-iotests/302.out b/tests/qemu-iotests/302.out
>> index e2f6077e83..3e7c281b91 100644
>> --- a/tests/qemu-iotests/302.out
>> +++ b/tests/qemu-iotests/302.out
>> @@ -6,14 +6,13 @@ virtual size: 448 KiB (458752 bytes)
>>   disk size: unavailable
>>   === Converted image info ===
>> -image: nbd+unix:///exp?socket=SOCK_DIR/PID-nbd-sock
>> -file format: qcow2
>> +image: TEST_IMG
>> +file format: IMGFMT
>>   virtual size: 1 GiB (1073741824 bytes)
>> -disk size: unavailable
>>   cluster_size: 65536
>>   Format specific information:
>>       compat: 1.1
>> -    compression type: zlib
>> +    compression type: COMPRESSION_TYPE
>>       lazy refcounts: false
>>       refcount bits: 16
>>       corrupt: false
> 


-- 
Best regards,
Vladimir

