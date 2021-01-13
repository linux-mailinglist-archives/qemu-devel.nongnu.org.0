Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E072F4E2E
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 16:10:51 +0100 (CET)
Received: from localhost ([::1]:40054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzhnO-0003Sk-EP
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 10:10:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kzhk1-0000uU-W9; Wed, 13 Jan 2021 10:07:27 -0500
Received: from mail-eopbgr70137.outbound.protection.outlook.com
 ([40.107.7.137]:53678 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kzhjz-0005FD-1t; Wed, 13 Jan 2021 10:07:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nZ8xQ8AjJHT26viKTk020faZIXqO1D/iSTewdUzhu79A9MPvXhc4sj5dTPp3wYWamqQ9TzXVeeZ3rgVcXfj9VAXyIQCixFlWwue9+CmKCYlDYHg29QeRtgQeun9FQgofbvmZ/Sy0dYS5lgcbX+9YLvMWKD5RFMpyPoVK0I94WtoZCSO28/6v2g3BmFDsRkchm34g5KSk2+KdTDZ83wcEIVhmVcOD3GNSDHye7rHi//hrx1pykVjl4005tGBvTdWS6geI63D5JMG3Aq63tNBSCXwUbXxSGxHS5PMtKPlO7n1vA8ir5QIxLsvl52Hn+SP+cX92kjzC8RWYCBWaM5HCjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w2GVV2gI6skaEEj0IA77RWH6dbJcSAQgC55cq0vkor4=;
 b=T3gfcYAsTWQ8Rf5B5ouLy0H5weenyEuALUkSzjHeWg9CrOAcGA8Jyw6NcQHVGnR+PFnHqs+hCzNsc4MmpMbc1DxjPnShVC++6eA64H52OaGkD61CLpWraSxEU2QTGqmE8AFXauSmLKUg6sGWkGNK12zNiTODjp5YXFNYhTbUSYP8fJFec7ITFvX51s7WVMtBX3Olncqro/vsVCozJvM6pubXzgE2CAaU/Ogqe4Ew3WfWP4JSNTDkSuOv/pikP2lNqddQTdCJ0CWx0g51DY8R0e2+rvCm8HYPvOk1RzNzm2yoamQyM0wXhG6MqrRGGZC3LOYvzCfXfsAHEXTOGCsNLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w2GVV2gI6skaEEj0IA77RWH6dbJcSAQgC55cq0vkor4=;
 b=KC8oGfiVYoekeJhPG/9rrOSbWKA8iqDH5Xqy+s1m7Z3xyUnGd9nxm3rOgDtB/nZSy2C9kDT7EbKLEnuxiXMxsbxuE+uxy5TkcRuCj9LKfoZSqP2te4/pw6FPjb/QMLckbUK24+ObI4lGrA3mtKqoKX45KzqNBNZGwPZ5OGxzYZg=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4533.eurprd08.prod.outlook.com (2603:10a6:20b:b5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Wed, 13 Jan
 2021 15:07:15 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.009; Wed, 13 Jan 2021
 15:07:15 +0000
Subject: Re: [PATCH 4/7] iotests/129: Use throttle node
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20210113140616.150283-1-mreitz@redhat.com>
 <20210113140616.150283-5-mreitz@redhat.com>
 <0bbc2785-cfeb-ac64-6c19-5d86e7a0ca75@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <bd084784-e768-a6f2-8ab8-22fdd627445e@virtuozzo.com>
Date: Wed, 13 Jan 2021 18:07:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <0bbc2785-cfeb-ac64-6c19-5d86e7a0ca75@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.80]
X-ClientProxiedBy: AM0PR01CA0175.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:aa::44) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.80) by
 AM0PR01CA0175.eurprd01.prod.exchangelabs.com (2603:10a6:208:aa::44) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10 via Frontend
 Transport; Wed, 13 Jan 2021 15:07:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f8a9dc99-ca1d-4936-d08a-08d8b7d4e9b2
X-MS-TrafficTypeDiagnostic: AM6PR08MB4533:
X-Microsoft-Antispam-PRVS: <AM6PR08MB45330628396DA57A6D795122C1A90@AM6PR08MB4533.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kU+1Yhik3n6O0SErS8E9IOILZVWB1nVDHHiw2S3c/whRwLWeTbnWNmxAJQ+qBWfGXS001Kkj7jmS0y/Iut7ol/82t0S5PPqW7TbGx9EayEJxyvccjm5l0tsnuwekxp1UBE4jnVUcZnZZaQsSBqKwBeqW1HJikE4pDZs0egN3vTk8QmvytcM6lRpoQOnTorWFFzuriCslVe4PYdMpmD4I3fR7A23APCHavaOmxeI2etdPbtEHuAHPT8mGdLWqM2RL7O87nFGscM5I55sLrRjseGsQOZYv1OOtW6b2OWc2c2uu/OO098s78aDrN9xIdMCj5HepoEyKzcpcET/Ua4bYLdEws1CJKAUwAH5wPv+2IK9vC902OeecnycULjPWxugOK2whXzqbe3ZlQuw7QHa3IF48Kv3ARMMA6EvEiXWGvo0U+ci4BruGIEG7Y74+fss3yLhF8Mu8UmQgHgFvdNjnQVkdBePkAo9nBSLq2CZoGP/LdbSa9FEP1SADOWzrpAva23jA2zepxqA+LnlxM2jC3Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(376002)(366004)(39840400004)(346002)(6486002)(316002)(8676002)(83380400001)(31696002)(966005)(31686004)(52116002)(66476007)(8936002)(86362001)(186003)(16526019)(26005)(66946007)(53546011)(5660300002)(66556008)(36756003)(478600001)(2906002)(16576012)(956004)(2616005)(4326008)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?T0d6emxEUnVteFIyVVppVDBQZ2lRdk1OR1IyMW5VYVVESEF3RllZUERqcG9m?=
 =?utf-8?B?ZVNhTmcwcUlOWVVlSC9nZzNUQkE3SWZzTHJoZklqeExuc2l1WDBaczN6Zzd2?=
 =?utf-8?B?aHNNcmxWOWUyRnpoVzVIcjdaR29BRG1PWE9IZzNqR2lvalFpSzFvWEk5TFZH?=
 =?utf-8?B?NmExZ2hIVDN5MnVNZEVoTVQ5aTFIcVZaT3UzVjBZTUhtT2FaR1dqdzlUekVU?=
 =?utf-8?B?ZFZCRUFHdkxMN2xhK1BTOSt6SW5ob2ZOb3JJNEw0ajJCUXdQT3k2dWRjTGk3?=
 =?utf-8?B?WExiR3oyMjFPc1pGejdtc1lCODFUTFlTVE5yVjRXMTdSRDlzdWZOaVFiN1ZG?=
 =?utf-8?B?WG43VUNJN3huV1Vjd3VVYy9SZFBXWlR6ZG1EYmpNNkJXRG1SbkZWS3ltZy9p?=
 =?utf-8?B?VXh6SWZhUHVVL0srQjVNYmRxT2d1TnJSTFE2WnpLb1FiZ25SRG83NERxUjh4?=
 =?utf-8?B?MTcrTWJBbitzT0lhUTI1dEFleTJycTZvajJmZmhYZzZnRmd6YkRjcEJqajds?=
 =?utf-8?B?QWtSOFY2dVBtUXIxZ1FHQmFhOWVzYUhLbWRRZnllR0RvTHdPSnNCTjZmMi8v?=
 =?utf-8?B?d3QwZmFBTlpxNXlqdTdUMmtFemI5Zk5peTJZMldYOWs1c1o5Y0ZuZ0diMVQw?=
 =?utf-8?B?dG12eEFmdm1RUkZjdmFMVjJPdnRtcTVwb2JCZ3VXTW9GUE1ZTVFaZVhJM0pq?=
 =?utf-8?B?STE0bnhlQVFuU3AyNFZVdFdiZVA1M2ZJL1h0UzFYd1c4OXF0SmpTdUlBQ21a?=
 =?utf-8?B?MXlqSk9DUytEcFFWVmM4ZS9aMnF1ODV6WUcwM0t6ZEdVOWJsSWxsbXVwMmhU?=
 =?utf-8?B?ejlHQVYrMnNUMVQxSDE5c1NhajdOK1ZOUmgrenl2bytEa08zUDBTd2xlWWZo?=
 =?utf-8?B?bDVMbG4zQklVdjc1Q2FzWGQ5Tmt4WnIzVnRWdEkrd3JQYjFaTE5iTVd2MVp5?=
 =?utf-8?B?VFBuTnJxZ216TFVkNndBeXU3MnV1Sk1vQkQ4eDU5QmVPSjk0cElXVW9wZVYy?=
 =?utf-8?B?WW13WW90dVBzcStTL2dsRnRpSEFxZ3BxeG4yYWdlSVVIQVkrUzI1MDFTNnV2?=
 =?utf-8?B?aXZkSFJsQjlFakEzVEIrVHZsckk5U0dkZllkT2dKbjBlZmJmVDMyZVJSTTda?=
 =?utf-8?B?WmtsQUFQZmsrSTVsQzgyTE53UE4vdHI1Vm1NS0k1V0MxcGJvWm5mL0Z5RE0y?=
 =?utf-8?B?MGpxUE1tSEt0MGdOdTdWSXdqSEtsRS85MXk1dFpTWHBrbzI5Q0syK3NDdWlB?=
 =?utf-8?B?cmc1amNScW1qWmN1STAzSGdLbTF6azdUMVVIdzdOZ04xL2hSUDM2K2V1V3R0?=
 =?utf-8?Q?Bw1jLzJsTdDhHOe3QTpcTTm25hE8p+TE4M?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2021 15:07:15.4162 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: f8a9dc99-ca1d-4936-d08a-08d8b7d4e9b2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q/Q1aD/E1LlD2eAuYyMUG6Y0c1+sFOxIIOgRL2D/oz0cKgbQ5yUOcgHl76eKywhHBzQw0+W0+hkr0kspmOZTsdqXMRSm+MYq2PS9QewVUxs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4533
Received-SPF: pass client-ip=40.107.7.137;
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

13.01.2021 17:10, Max Reitz wrote:
> On 13.01.21 15:06, Max Reitz wrote:
>> Throttling on the BB has not affected block jobs in a while, so it is
>> possible that one of the jobs in 129 finishes before the VM is stopped.
>> We can fix that by running the job from a throttle node.
>>
>> Signed-off-by: Max Reitz <mreitz@redhat.com>
>> ---
>>   tests/qemu-iotests/129 | 39 +++++++++++++++------------------------
>>   1 file changed, 15 insertions(+), 24 deletions(-)
>>
>> diff --git a/tests/qemu-iotests/129 b/tests/qemu-iotests/129
>> index dd23bb2e5a..febc806398 100755
>> --- a/tests/qemu-iotests/129
>> +++ b/tests/qemu-iotests/129
> 
> [...]
> 
>> @@ -53,33 +51,26 @@ class TestStopWithBlockJob(iotests.QMPTestCase):
>>       def do_test_stop(self, cmd, **args):
>>           """Test 'stop' while block job is running on a throttled drive.
>>           The 'stop' command shouldn't drain the job"""
>> -        params = {"device": "drive0",
>> -                  "bps": 1024,
>> -                  "bps_rd": 0,
>> -                  "bps_wr": 0,
>> -                  "iops": 0,
>> -                  "iops_rd": 0,
>> -                  "iops_wr": 0,
>> -                 }
>> -        result = self.vm.qmp("block_set_io_throttle", conv_keys=False,
>> -                             **params)
>> -        self.assert_qmp(result, 'return', {})
>>           result = self.vm.qmp(cmd, **args)
>>           self.assert_qmp(result, 'return', {})
>> +
>>           result = self.vm.qmp("stop")
>>           self.assert_qmp(result, 'return', {})
>>           result = self.vm.qmp("query-block-jobs")
>> +
>>           self.assert_qmp(result, 'return[0]/status', 'running')
>>           self.assert_qmp(result, 'return[0]/ready', False)
>> +        self.vm.qmp("block-job-cancel", device="drive0", force=True)
>> +
> 
> Sorry, somewhere along the way I forgot to remove this block-job-cancel.  It’s still from
> https://lists.nongnu.org/archive/html/qemu-block/2019-06/msg00499.html and I don’t know why I added it there.  It should probably go.
> 
> ('stop' should have drained, that’s the point, so there shouldn’t be any further delay if we quit the VM without cancelling the job.)
> 

what do you mean by 'stop' should have drained? As I understand, after "stop" jobs should continue and it's OK.. So, immediately after "stop" command job may generate new requests, why not?


-- 
Best regards,
Vladimir

