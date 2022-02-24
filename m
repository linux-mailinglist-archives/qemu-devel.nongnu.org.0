Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DB84C2DE6
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 15:10:03 +0100 (CET)
Received: from localhost ([::1]:40376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNEok-0005gF-Mn
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 09:10:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nNEm1-0002us-F8; Thu, 24 Feb 2022 09:07:13 -0500
Received: from [2a01:111:f400:fe0e::708] (port=54601
 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nNEly-0007DT-H8; Thu, 24 Feb 2022 09:07:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nKGCM2VyJbrZ08rEo1Mt5R20h5/al3akWKWGmImA+Y8O3j06tHdBmsbP7tyWcsbZcTMJTBouCoRV1iWGz3rgLI940K6D1VPH/9z2a8+dNb5uGUWzna2m49u4H8Y5Dqt87guqUZVDLue7+c5jq3PFvt3JIlod3ovduOwF9jKKPdwHaqgwSYyy3+424Dk4h+p3YHIzFCkiYvyTaWYzqn4qwmlHx5CCDt5XU+73j7PXVzKJnya5A/dZBa2cdSIKG3GfNtQR9DgY1d7tg1+sK5t9aYVE9Gb1eXVH1nd2iYRUlh60DwmHOLO6Jryjj39z6SIQ/h6tnjSlu3aWfIg1njZudA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZWATHtOP5aYGbAW2T/TxnP9ay2Dyn7BGbprR8IVCmeo=;
 b=Cyi+jL8u/S/zou5t2iEo/wzvox2zC35HEj8BFVz4TUCTO/tinu4Zim8u/Bvn8YtXfliLOyrArmi6fATzqvl+IzeqIlgn75i8LM260pZHjA+JsOSQfWpo8oQpZr1gkkvQlMSWQlBowG5PtGm69V9Z+z8gzMo/T2t/CHN6FicnEIDJhT2WorUzh0wWdqPAQ7DxDnh/PuPomMSbdDNRVajE85yD0PNMY0OwoPEqEDUBTvBW4gEaL9oXavlx9pEw3sr5wbhhYtGiO7ssk1jV6AgzwWHXHvWI4vcUGfz6bi7e7UvIx/SUJ3qLkJqfRUIAKcYgYXil2piMK6wVreF3YB3Vgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZWATHtOP5aYGbAW2T/TxnP9ay2Dyn7BGbprR8IVCmeo=;
 b=mgEjEyRJOFcNCI/U/GDd8fwGLNbgEtsrebAI23HjIveVWtzOe3Llp2oqtDrnwAIi7SHRhXrX4hN82D88ti4a69uhjgd76OfoRb07aI28q+AlcUuNHslb1TBQFHpy5QqqWOnx1T0vz25nnZhHqnPQE3EI06Ye4bndW0er6iRvyjo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by VE1PR08MB5118.eurprd08.prod.outlook.com (2603:10a6:803:107::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.24; Thu, 24 Feb
 2022 14:07:06 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%3]) with mapi id 15.20.5017.021; Thu, 24 Feb 2022
 14:07:05 +0000
Message-ID: <5c3b392d-a70a-6afc-f0ff-2f1421478e53@virtuozzo.com>
Date: Thu, 24 Feb 2022 17:07:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 15/18] iotests/image-fleecing: add test case with bitmap
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, xiechanglong.d@gmail.com,
 wencongyang2@huawei.com, fam@euphon.net, stefanha@redhat.com,
 eblake@redhat.com, kwolf@redhat.com, jsnow@redhat.com,
 nikita.lapshin@virtuozzo.com
References: <20220216194617.126484-1-vsementsov@virtuozzo.com>
 <20220216194617.126484-16-vsementsov@virtuozzo.com>
 <6526d98b-bbe4-b551-47dc-9929a3cdd828@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <6526d98b-bbe4-b551-47dc-9929a3cdd828@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0038.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::14) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8cf5516d-0c70-4cf6-5562-08d9f79ef04e
X-MS-TrafficTypeDiagnostic: VE1PR08MB5118:EE_
X-Microsoft-Antispam-PRVS: <VE1PR08MB5118B53DF767490B4BDB5C52C13D9@VE1PR08MB5118.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IGtRcE2HK4Eapl/bPDM6u83r44ULvIi34MfnhFfsrVoCfb6x+YoUAZj4W0X5MVFkDAyDvEHRBZaU28R8Mw0j1JjVLmoNMIr/TbXp6BG1G7eO3d9abSb5VF4hRVCpkPR7jX4QzQ93GhV2PXjuWvE7XOJIeuxrD4cF6b9NcFINTLMjKRfuAiNyWpJdWGTU6DzTfP4ZcH79e7Ib8+lEOA07VfjTA11nQC0+AEt1GIERBFFIQ9Lp1J7uVuIuaf8XlhBuYD9bryvNCJl19D7Y9qyvohtFEAoC2T26v5dMRLzOEO7gBytytdEYPuAScD9tz/5hl564k0KHLONx9xKJgjPsDgFB2i4GUnTAv1RuzQQ+clEo/kX2DW52O92ca+iaV0Fa/K+1VB7yJnv6vwj88YzDt2BXVYgJhSuID8qRBsnRV3FYTG5OzlIVIbtWkgmdUjdxOfMz7l9UmGgsx7aD6U0KL7gHgg7qF0SQ1waWxcRW+r9cZKqfter9ebCYjSTnKjEcAEwi+6Y36XWUq6Mrv3jH5mK69pY/hSFDYrehtWDAtnehN8iaW2FkXQRwfhD3blEFeWRRDeeuRSO26m15tWS8UccWPszZ+d78D1hlNVkhtv+zl/MGU3bqAd53q73WHPcn6gje3hiZCv0lD/4TX7nMcWUXMtZoXh99vqTl+/QzhJQa5GopzzkXwzlgfF5Jb7aizYIQ/vFzEVpGCOuEiFIEJN8137J+N3TSm5sLKROX7cNNcTCcT1kUZyy/uDAnKOT0w5trQKmXVVW9ZcHB7wiyug==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(316002)(4326008)(86362001)(66476007)(66556008)(508600001)(31696002)(6486002)(2906002)(8676002)(66946007)(107886003)(53546011)(52116002)(7416002)(5660300002)(36756003)(31686004)(186003)(26005)(6506007)(8936002)(38350700002)(38100700002)(83380400001)(6512007)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SzRsa1Rvek5FTWlIMEVVb1pIbjZkYmxsU3lKd3NWY1llWGpKVDM0YWc3VStE?=
 =?utf-8?B?bGJLb0k3NFFleExPZGNVYk9pb0xKUjl2Z2dBVHBYTVYycVhRVm5wcStzWTcy?=
 =?utf-8?B?VzVSK0FmWXFHR00yUjFoT1VuSDZCTDhuQ2UrREtBT1dzckRWVEtxUG8zaGNi?=
 =?utf-8?B?RERQcEh4QkJRZDZ1NzVFTncwdVdNU1RrMDJRQVFTT25XWnFMMzRQenZHUXV1?=
 =?utf-8?B?M1ZDb2xreDYrRnlTQnd0NURFUlNiQmlaWUQ0aHJUTndhOEhQNTlUN0lySGw2?=
 =?utf-8?B?alZ1dEcrTlJvWEFETGE5SHJMc1Via1JnQU1sR2FscEgwRlZqVHF2RE9MT2Zm?=
 =?utf-8?B?KzNkZHE1K2RkNjd4bFVHSWx4emFMM0ZUaEw4NkVXTm9aY3JGQkZMdGQweUtt?=
 =?utf-8?B?ZDhHU2FvMS9kSGFlMXI5ZWVadzZvTkZpTnVFZ2FoWitSMGhMa1Y0OWxPbFV5?=
 =?utf-8?B?VzVBT01kcE9OM0lVbVVucHo2ZkdyN01ocE03ZG5ocDQvVFpoWW5WT0xYbkNq?=
 =?utf-8?B?cE1pamNXam42V2xYYWZ0SU9ENkVwUWp6TDdPZ0Y4dExRUnBKY1hNNGFWOHlo?=
 =?utf-8?B?Q0I0dmRuWVlQdXJDMThKUFFsajV3YS9TWFFCcVJ1NlJHKzIwVXExRFlrZ2U1?=
 =?utf-8?B?c095NzFXZTJ1cEc3OThBcVMwQ0JaVmdjUzgwaHJqclR6YlYwOEdEUmxLVXdF?=
 =?utf-8?B?QlV1Z1pGakF4d2xYME9ISHBMSGlocUVuaHErVUlpeklQWnFJeXVic09KZkU3?=
 =?utf-8?B?d3B2NCtlWlFDbzkwK2Z3dkhVb0wyOStueGZVc0VNVEkyL3RxbXhwcU03WmpG?=
 =?utf-8?B?cHB5di9BVkpoNG55KzRPSkJGRm8zeUdUYlNMWCt3TXpOYnorbkRIZWxYWlhO?=
 =?utf-8?B?dUNIeUd2SmxtU2UrL0VXZ0c2b3hBMkh4ZzBVN21FVlpoSFdKbkJkTkpGRk0w?=
 =?utf-8?B?M1RlK0Z1cCtGQm9ZWCtYSHR6Y3c2RTRWc3VMYm13Ym1Tc3dQcndJY2Z0SFNW?=
 =?utf-8?B?VHgyS2lYa2QwRDdnMUxibHkzK2tlTERLQnh0b0NVMitXNVJWSWtiZ2M5RXhV?=
 =?utf-8?B?YXhOUFQ1VURmOHJrMlN2eE5oZHY5aXJKTm9EMGpKcFIzTWYzSnpXQUdhdVl4?=
 =?utf-8?B?TVIwVDYzVmdjalBOME9ScUNJL3Q4Zm1iWmR0T2Rzbm0yMHU0ZVJDdWxFM21F?=
 =?utf-8?B?bURCWERMZzBEWGc1Wm1FNVB3TGRycW5GYlgxSWhsSWg0cXhEYk50MmtjSk55?=
 =?utf-8?B?VmZhQitkaW16TjBBd2xjZEV3ZXd0dkU1NWxKQ21DQVJTb0JzdzNnVXEvL3pI?=
 =?utf-8?B?YWljVVJTdVZKVHQzcEZyaHJueDkwdEJ1ZzBEQzh2b3o2czlPTjV2M1Rsb1Er?=
 =?utf-8?B?cUxpUWJyTEUySis5MmlpVWxBdnpsVXRvSm9PM3p5WFNVM2U5cnVGM29QQjN2?=
 =?utf-8?B?aVhzYm91eXF2dEhvbkVYanl1b0ZidGZrZ09MR2hWUjA4aW5rcjBmWkZPbkt4?=
 =?utf-8?B?U3FZZ085bkIrVUpFaEY2a2Fibk93SXlHRXkwaXFnMnpXK3ZJeVFrUXRwbXFT?=
 =?utf-8?B?bEdBTlJyWTNkUEM5SmZsemJJZ1lmTFk1NUNKbGwxZC9YbUlGaFFlbDhTanhh?=
 =?utf-8?B?Skl1SnhNeDlrNjFjZnVOZ3dtZ1VHczZDWUs4di82Q05OMEhVTW9FTXZ2MDhQ?=
 =?utf-8?B?WFo5TFIzTVZBUDk0ODl0d3laYU1LOTdxdWFIajFHSGFDQkhVRVltRWhjQmo3?=
 =?utf-8?B?cndFWG1BRDJWdFFWdmYwS2ZHMmxibzF0YTRyWmUxdnZHL3pvTEFTb2dNTHBl?=
 =?utf-8?B?QU5mcnd4RkwzSllGaGpvb0NhZlY5S1dUWkdnR0hIaUZ0Z2xtckU1SEliNnBZ?=
 =?utf-8?B?MlNIR2haTGIxZUY4TnFudmRJUFpEY3M2MFNpblhCU1ZVeWdiTlZLMVk3WkZD?=
 =?utf-8?B?S1pSazI0dHp0d1Z3RzdJWHY4RFVONDVrS0FsbFk2SUtZOEJzYmR5cXJDYTRM?=
 =?utf-8?B?Tmc0TDFnRzJTbS9kQldBcFZvc1owVUk2bEFsdlh1cmYvQjJZaE1kNWJqMDIy?=
 =?utf-8?B?cjYxQTNIOUVKTk0zV2RURDkzOThqdjlRY1Uyd2hBV1Y0M2toT015bU8yTWw5?=
 =?utf-8?B?UGZFQzREcWdHeFZIMVZDU3NWK0FFSkxSRldZVVhFRy95ZGFnc0p4MStaaUUv?=
 =?utf-8?B?a0pWRncwemZWWUdHRFcxTkw3Tis3M1NtUGpnczh5MndQV29XQXk0eTFVNFlZ?=
 =?utf-8?B?RG9JdjBNSzNVOWVab3hoS21VWEFnPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cf5516d-0c70-4cf6-5562-08d9f79ef04e
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 14:07:05.9132 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B9m14E/kcRGIGz6GBFpgWipsFNQDJwXJIw88a6ZqejXCuE72h3NTW4jwsw2gH8ybON537o06i0JAT4XcCiaRMaFzbIkRPXDw8zmgUvso2Kc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5118
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe0e::708
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe0e::708;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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

24.02.2022 15:58, Hanna Reitz wrote:
> On 16.02.22 20:46, Vladimir Sementsov-Ogievskiy wrote:
>> Note that reads zero areas (not dirty in the bitmap) fails, that's
>> correct.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   tests/qemu-iotests/tests/image-fleecing     | 32 ++++++--
>>   tests/qemu-iotests/tests/image-fleecing.out | 84 +++++++++++++++++++++
>>   2 files changed, 108 insertions(+), 8 deletions(-)
> 
> Looks good, just one general usage question:
> 
>> diff --git a/tests/qemu-iotests/tests/image-fleecing b/tests/qemu-iotests/tests/image-fleecing
>> index 909fc0a7ad..33995612be 100755
>> --- a/tests/qemu-iotests/tests/image-fleecing
>> +++ b/tests/qemu-iotests/tests/image-fleecing
>> @@ -23,7 +23,7 @@
>>   # Creator/Owner: John Snow <jsnow@redhat.com>
>>   import iotests
>> -from iotests import log, qemu_img, qemu_io, qemu_io_silent
>> +from iotests import log, qemu_img, qemu_io, qemu_io_silent, qemu_io_pipe_and_status
>>   iotests.script_initialize(
>>       supported_fmts=['qcow2', 'qcow', 'qed', 'vmdk', 'vhdx', 'raw'],
>> @@ -50,11 +50,15 @@ remainder = [('0xd5', '0x108000',  '32k'), # Right-end of partial-left [1]
>>                ('0xcd', '0x3ff0000', '64k')] # patterns[3]
>>   def do_test(use_cbw, use_snapshot_access_filter, base_img_path,
>> -            fleece_img_path, nbd_sock_path, vm):
>> +            fleece_img_path, nbd_sock_path, vm,
>> +            bitmap=False):
>>       log('--- Setting up images ---')
>>       log('')
>>       assert qemu_img('create', '-f', iotests.imgfmt, base_img_path, '64M') == 0
>> +    if bitmap:
>> +        assert qemu_img('bitmap', '--add', base_img_path, 'bitmap0') == 0
>> +
>>       if use_snapshot_access_filter:
>>           assert use_cbw
>>           assert qemu_img('create', '-f', 'raw', fleece_img_path, '64M') == 0
>> @@ -106,12 +110,17 @@ def do_test(use_cbw, use_snapshot_access_filter, base_img_path,
>>       # Establish CBW from source to fleecing node
>>       if use_cbw:
>> -        log(vm.qmp('blockdev-add', {
>> +        fl_cbw = {
>>               'driver': 'copy-before-write',
>>               'node-name': 'fl-cbw',
>>               'file': src_node,
>>               'target': tmp_node
>> -        }))
>> +        }
>> +
>> +        if bitmap:
>> +            fl_cbw['bitmap'] = {'node': src_node, 'name': 'bitmap0'}
>> +
>> +        log(vm.qmp('blockdev-add', fl_cbw))
>>           log(vm.qmp('qom-set', path=qom_path, property='drive', value='fl-cbw'))
> 
> This makes me wonder how exactly the @bitmap parameter is to be used. In this case here, we use an active bitmap that tracks all writes, so it looks like a case of trying to copy the changes since some previous checkpoint (as a point-in-time state).  But if there are any writes between the blockdev-add and the qom-set, then they will not be included in the CBW bitmap.  Is that fine?  Or is it perhaps even intentional?
> 
> (Is the idea that one would use a transaction to disable the current bitmap (say “A”), and add a new one (say “B”) at the same time, then use bitmap A for the CBW filter, delete it after the backup, and then use B for the subsequent backup?)
> 

Hmm, good question. If we do this way, we break a point-in-time of backup.. We'll make a copy of disk in state of the moment of qom-set, but use an outdated copy of bitmap..

Good solution would do blockdev-add and qom-set in one transaction. But it's more possible to make transaction support for my proposed blockdev-replace, which should substitute qom-set in this scenario..

And supporting blockdev-add in transaction is not simple too.

With usual backup we simply do blockdev-backup and all needed bitmap manipulations in one transaction. With filter, actual backup start is qom-set (or blockdev-replace), not blockdev-add.. But we can't pass bitmap parameter to qom-set or blockdev-replace.

We probably could support blockdev-reopen in transaction, and change the bitmap in reopen.. But that seems wrong to me: we should not use reopen in scenario where we've just created this temporary node with all arguments we want.

Keeping in mind my recent series that introduces a kind of transaction for bdrv_close, may be the best and more native way is really support blockdev-add and blockdev-del in transaction.


The only alternative way I see is to not copy the user-given bitmap, but use exactly what user gives. This way, we do the following:

1. User give active bitmap A to cbw_open, so bitmap continue to track dirtiness.
2. User start a new dirty bitmap B
3. On filter insertion, we have a good bitmap with all needed dirty bits
4. After filter insertion, user stops tracking in bitmap A (disable it)

This way, we'll not lose any data. The drawback, is that we may copy some extra data, that was not actually dirty at point [3] (because we disable bitmap A after it, not in transaction). As well, bitmap B which will be used for next incremental backup will probably contain some extra dirty bits. That's not bad, but that's not an ideal architecture.

-- 
Best regards,
Vladimir

