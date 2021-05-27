Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1313539327E
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 17:33:53 +0200 (CEST)
Received: from localhost ([::1]:43286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmI1A-0001et-2U
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 11:33:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lmHz9-0000qK-7W; Thu, 27 May 2021 11:31:47 -0400
Received: from mail-eopbgr70119.outbound.protection.outlook.com
 ([40.107.7.119]:51078 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lmHz5-0001kh-Pf; Thu, 27 May 2021 11:31:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZmDxXiAotwKCHFsAw9hJLFSJdB8cwAu+w2DyT58Fk3yxoOKFgStmrcOXrazl3xDFzvG+/Rxl4HxU6wawwQ4QwtG6b7rYsN13tdlY1fTPkGwDbL7ATjojCAC9xcdOET5IGYDU1xjslXO3oXc82ZbliK7vz4izjPq3PUDLp0mU0GAx7DMuqRgGnxCsM3AOhe8Degt42Q2VfzFOAhm1/VLKheNE9mZMtc5dXKZfAp6dWCXesySsVxUoVWFv8Mwv7B4e2M3+jtCo0Me2Cm/mDWQVCixNtdIbxnGa7x8qtZfkecVtKtS2j19Jr9MfH2k1EzNEwEzEkJAIQVNWI30xHKf09Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jajR5vPw+fy3Zp7BIzXFsIZfC9vK564cys4GNbT75cg=;
 b=ZXGzVtvpfBh+SOH1ArE2bBAJ9aCZfcTDPMnxRqsokefegPn5/t55igmgI2KoXJFbNKOYT0n7ar9Onx+6HAC5CjomZfUUQpQX6/feaQ6kcbeThqXRqBw21yjWDPu+g+c/TgeUrGH/+hr1dbczx80QgHoT4riywpHH02hKq5GEJFklGkCdV0DnhKWFI7geViQI9xUKs5XSy5OxX1E82BdcfhzsyWjzIF4lNUBH36N1xsbsFve78GEJDsZfErSHsVxxOhxyz5ATV0p91H3bsApQ+bdq+rimUR4NIiR8fc8DfwENkbCTUCkZMf5te2DRpvz+VOouOgIerXxhgYm3YliFGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jajR5vPw+fy3Zp7BIzXFsIZfC9vK564cys4GNbT75cg=;
 b=OhO895Sr0sNJNtNV/w7PjtrlLJDvLGG7CVIqhV5asKqrRy0mDYBxtulE2FdvlZ2i5K3YpkiV2yoViNUzSclL5/1Vjjwba/5au+gSCP72r7isgiFAoiMJYeGpcUGS/iB33WcRnPU2qxcvTvyqZlfkn91IO+GxsFsKfZqn9+A5Rxo=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4788.eurprd08.prod.outlook.com (2603:10a6:20b:c4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.27; Thu, 27 May
 2021 15:31:37 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.022; Thu, 27 May 2021
 15:31:37 +0000
Subject: Re: [PATCH 3/3] block: drop BlockBackendRootState::read_only
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, codyprime@gmail.com,
 armbru@redhat.com, fam@euphon.net, stefanha@redhat.com, jsnow@redhat.com,
 mreitz@redhat.com
References: <20210526211534.524597-1-vsementsov@virtuozzo.com>
 <20210526211534.524597-4-vsementsov@virtuozzo.com>
 <YK+w43oKABDuqDOC@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <d74494a4-82f4-871a-e275-dbfd9dbcc718@virtuozzo.com>
Date: Thu, 27 May 2021 18:31:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <YK+w43oKABDuqDOC@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.226]
X-ClientProxiedBy: AM0PR03CA0106.eurprd03.prod.outlook.com
 (2603:10a6:208:69::47) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.226) by
 AM0PR03CA0106.eurprd03.prod.outlook.com (2603:10a6:208:69::47) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Thu, 27 May 2021 15:31:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7a4ed10e-502d-4e6c-3664-08d921248458
X-MS-TrafficTypeDiagnostic: AM6PR08MB4788:
X-Microsoft-Antispam-PRVS: <AM6PR08MB478869B03DF17AC395499F57C1239@AM6PR08MB4788.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S37ho7y2PccTMIwQ0Iz1OU+cUqx1jnDzr+iu25Ax2ZogS1eFBl6MtqUQjXlVIphX03Tl125MSjHIsmhpCAvkqq3QZzZ2NQD32EXSmYPQbUfCppKO81fhPcAcUofqQT2ckU/syQa8j84HrEgOxoZodPql+eTmTobHI11FR0fbgcyYQovjMlSTzuJVQgeKr54WtgN2QYo/byBWELSwfmytc6G2SnlhRKbiqdYp68udceMK2lmHay1EBvzOPwFpvomYCI6YS/WST6ANIad+GWD53bAtC3/+eF4ympecq9QTWdW+K8xk24uBUYdsMNHjJHMiBTQA8Jh9eLMl/HKSUlZa9KMPKQ6V6hQj2iapknGI1ecvH1PL6ht63VAYFRb3/QADqsaKWJLpXmaT4nDfmOJlrloq7AKThr2hlCG1o6I/2JmXBUxpaR1V/5TTnK3hDZOCVtSAZguZnHi0wT+SAFnIsmlVJb4A8OIxxhoBi7NF6n+YtXa0JKeopcUH/WlKcm2F5/KkrorWIRB/7flliqKvMC7iETpkAEkyH+0mNE/gKzHm1TiEJCTyDuoUrrt3Z2XokoYUo0UzXzwWUO29IDBOlp6gQUUhe5j2q6uI62o/xonj/NVMTZauX828gaGMlZfP071SnW+7mLRjSRJ/AyH4mcVYv+NyJQUpxZSWwEm2JCCZrYyLT2mZf8FsLGAckK7BXRWN9cYVsAE2DGOQezbahQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(346002)(136003)(396003)(376002)(366004)(478600001)(4326008)(66556008)(6916009)(16576012)(86362001)(8936002)(83380400001)(186003)(31696002)(5660300002)(956004)(26005)(66946007)(66476007)(52116002)(316002)(16526019)(38100700002)(8676002)(2616005)(6486002)(31686004)(38350700002)(36756003)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?YkE1dFBpcWM4M3V5THRPamVmQ1l6ZnZ1elhrRGloNDMvcWNGNVc4MmNEYnA4?=
 =?utf-8?B?bUw0WGI2UDdXU0pQMXRPRE5uUnNmalJHRktWNzFlbk1YMVVIT3l6TU9yK09m?=
 =?utf-8?B?ZGszc0h4RDN3VG9QTmlRbGExVHVRZVRiVFJyMndrQ2xCNzlFQ1N6OHdRSDc1?=
 =?utf-8?B?TFlVN3czSW5xeE1aUk1ja05zeGUzaGZkTTVyUW8rdmU0aTNPemdoQVJ5NHNH?=
 =?utf-8?B?N2pjVmk2N1FuVTlLNU9oZ0Z2Y01sclZLZk40RGJaeThXVkhNOWJFOS9peU80?=
 =?utf-8?B?am1STVY3U1ZZdzdwZzNtZjd2S1ZhUDFTaUhud3d2VHVlUFFiZmNtdnF4b0ZN?=
 =?utf-8?B?aWNtLzVwRnRGYTlKSlB5dzBNT2cyWXE0MGpBQTBTNzVubENPbnZxNWxjdm5m?=
 =?utf-8?B?NDR6OHZXeDJrTGp1L21acU5aMTRrSUZOOWxDS2VHQnNXTVRuNDV6M0t4MzFu?=
 =?utf-8?B?U3pFTFdibEN4cW5yeFBVeFMxZ05SVytHVFk1RXBWZjZWdlRCS0JoVUU0Z1kw?=
 =?utf-8?B?OWFYUnpMV1g5QStPMWp1bGFRai9UdVdNZmpWSUlHeWd0bm56a3dYa2QyRGpR?=
 =?utf-8?B?MDMzUDFMWlJDWE9OMDhGdVpKUW05VFdNeWlxK0V1ekpIQVR6NlZ4bmpZSE5G?=
 =?utf-8?B?Sy9CbzRPUlJtcW1WWURlSVBPTnE4UGNwWFlVNEtta0xkcXlPOTU2VlN3TStF?=
 =?utf-8?B?dFZKNFBnWjA3WG9MWFlPVS9XWjRxdGY2WENDUlFvZnM2WStsMTVTa2FBZnp5?=
 =?utf-8?B?cVByN3VMWVczU3BOZ1RmWWU4TWEyWXNxS0o3L0NVd0s2VGZaWi85dEhPZGJX?=
 =?utf-8?B?UkJTMjlaYk5ZbUNKaWxkMWszMWQwanhhNFpldG9YZmxTNkZ4ZE1OUTBtRmFn?=
 =?utf-8?B?N2RCWjZkZVE1NGpDOE8zNzZHazRaV2RBV2o1OER1YlJTUTF1Wld3SUNCV21U?=
 =?utf-8?B?S2JQZzAvd2JmVUNaaHhuR09oSmtpellDengvNjhkUTlLcitnbVJneE1aWTZl?=
 =?utf-8?B?MmV1NWJuUzFhSFNVRVVTTGE1aG01dlpJY0NEZndlR2pPR2lEL2ZMUmdHS0dn?=
 =?utf-8?B?dFdHN2ZEWUt6UmE5K0VUdTlOT2RBTmlFZWZqd1dBUlBYaS9tdytNSmJUbUlJ?=
 =?utf-8?B?V2Z1MmI3NkNrcTJhbHdDR20wcytYdnBxQUdndWV6VFRPSjdhQkZsVE5uamp2?=
 =?utf-8?B?RjhaUmNiUlFLTDFwblZMYUNEMDUwWjVoVTBmZ2oxL3hHeW5LRmYrdUt1U2d2?=
 =?utf-8?B?Q3k0NFlZWW5uVEFlNHRuTjk5VWRJa1RuNi9VWm9YZU0zbHZFa3kveVNCSVpM?=
 =?utf-8?B?Y3ZqdFlXaWV1M1E1NEUwcXNjdWsvWFRSOWtFOVVoVGZFWThvRmxQbjJ0bmhR?=
 =?utf-8?B?TC9ocm43bld2NmtTc0I1M0NOeHpTbkI5dXBVSnEweXg1Ym5hbkdVcUhwSy9s?=
 =?utf-8?B?NW1CK0JpOXBvc1pBby83bG9teGFsU0R1VWFqRjNMQzM1RGtkejdGMFYyR1M4?=
 =?utf-8?B?ek9jdnQ3UmgvMnI0SkRscE8rVHRUaWNPSjVpdXozaGZ3dlBJb1ZQY2M1Mjk3?=
 =?utf-8?B?SUZOOXNvVGtVU0RVSjFPWk9PdWEvN3ZIOUgrN3N6Yks0QmprNm8va0g5ZzBH?=
 =?utf-8?B?UmlMYyswdE1sb0o1c2tuMFdwT1lIcHY2RExwcm83dGduTkJadXhOZTlwVnJ5?=
 =?utf-8?B?UmZOdUw2Ylp0c3ptUTM0akczNDNwdGMzMWRMd0hISW04T3JTWGdXREhJNGNy?=
 =?utf-8?Q?c/XnS0B04A6XVGz1ElbT+hE7IqT44qR3ybOtgFU?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a4ed10e-502d-4e6c-3664-08d921248458
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2021 15:31:37.3952 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GJXsWgW4R/KD73FJyu4grM/nrr2icdzpXzJ/7Au3pCO+ASa1U686NHviOp0wCjqeZuLtHd4JjJVCkNP/C2igFiiWNFPriun8RzRPNw0SCH0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4788
Received-SPF: pass client-ip=40.107.7.119;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

27.05.2021 17:46, Kevin Wolf wrote:
> Am 26.05.2021 um 23:15 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> Instead of keeping additional boolean field, let's store the
>> information in BDRV_O_RDWR bit of BlockBackendRootState::open_flags.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> 
>> diff --git a/blockdev.c b/blockdev.c
>> index 834c2304a1..c36884c691 100644
>> --- a/blockdev.c
>> +++ b/blockdev.c
>> @@ -576,6 +576,9 @@ static BlockBackend *blockdev_init(const char *file, QDict *bs_opts,
>>       }
>>   
>>       read_only = qemu_opt_get_bool(opts, BDRV_OPT_READ_ONLY, false);
>> +    if (!read_only) {
>> +        bdrv_flags |= BDRV_O_RDWR;
>> +    }
>>   
>>       /* init */
>>       if ((!file || !*file) && !qdict_size(bs_opts)) {
>> @@ -584,7 +587,6 @@ static BlockBackend *blockdev_init(const char *file, QDict *bs_opts,
>>           blk = blk_new(qemu_get_aio_context(), 0, BLK_PERM_ALL);
>>           blk_rs = blk_get_root_state(blk);
>>           blk_rs->open_flags    = bdrv_flags;
>> -        blk_rs->read_only     = read_only;
>>           blk_rs->detect_zeroes = detect_zeroes;
>>   
>>           qobject_unref(bs_opts);
> 
> That we're now using different flags for blk_new_open() looked a bit
> suspicious, though the new state intuitively makes more sense than the
> old one.
> 
> Anyway, this patch breaks ahci-test:
> 
> # starting QEMU: exec build/x86_64-softmmu/qemu-system-x86_64 -qtest unix:/tmp/qtest-54104.sock -qtest-log /dev/null -chardev socket,path=/tmp/qtest-54104.qmp,id=char0 -mon chardev=char0,mode=control -display none -drive file=/tmp/qtest.mGtxeg,if=none,id=drive0,cache=writeback,rerror=stop,werror=stop,format=raw -M q35 -device ide-hd,drive=drive0 -incoming unix:/tmp/qtest-migration.XVRZZi -accel qtest
> qemu-system-x86_64: -drive file=/tmp/qtest.mGtxeg,if=none,id=drive0,cache=writeback,rerror=stop,werror=stop,format=raw: Block node is read-only
> 

Interesting (me again not running make check, sorry for this :\. And that's fixed by

diff --git a/blockdev.c b/blockdev.c
index c36884c691..2f3f9bc746 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -609,7 +609,7 @@ static BlockBackend *blockdev_init(const char *file, QDict *bs_opts,
              bdrv_flags |= BDRV_O_INACTIVE;
          }
  
-        blk = blk_new_open(file, NULL, bs_opts, bdrv_flags, errp);
+        blk = blk_new_open(file, NULL, bs_opts, bdrv_flags & ~BDRV_O_RDWR, errp);
          if (!blk) {
              goto err_no_bs_opts;
          }


so to make a RW node we should not pass both option and flag ??

Most probably that's because in blk_new_open we do

         if (flags & BDRV_O_RDWR) {
             perm |= BLK_PERM_WRITE;
         }


Probably this should be refactored somehow, as it's strange that we tread read-only option and O_RDWR flags in a different ways.. Still not here. I'll resend so that this patch modifies only BlockBackendRootState, not the logic of blk_new_open() call.

-- 
Best regards,
Vladimir

