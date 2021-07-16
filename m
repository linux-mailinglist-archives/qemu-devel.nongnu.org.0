Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 920CD3CB8A7
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 16:26:10 +0200 (CEST)
Received: from localhost ([::1]:37702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4On3-000613-D4
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 10:26:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m4OlW-0005F9-Lb; Fri, 16 Jul 2021 10:24:35 -0400
Received: from mail-eopbgr30104.outbound.protection.outlook.com
 ([40.107.3.104]:27394 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m4OlT-00024K-VG; Fri, 16 Jul 2021 10:24:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cokBBBuxp28IIPyybE4t0OuLWFAvGgw7q2lTO/rxFARrE6kQN9ODkKzNmVTGyYllXZKsKus7AboOq+4/kFelr+GBn3o6kP0C5V6ZknnFveXXB9+yST8iUMt6DbmffohKNrISYzSZImWBpRjxRwR8NcT1i0G8swXYMUHfOAxT+tud2scJBkrYMhILZEJf9TMhXnar3qmimoIosEBviBe1G12rlmgmCQskGKt2aw+8y4gGwC1KhDLo5CqlVDseQceYx5enkZ/KVRw+TyTZ8cRJLaXSX9iE+x6t2N8XQe+gooV37KXZjBKfVF3LltIFeSVElegjHU+rXsigJWZ14tZcxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rRbdQjJj7IkgPLcPP0ikYJSESpQif2v3Tpm63XhVzIY=;
 b=Slfmu92WfjTo/LFYTsh4PZ/XHDgsfu030wGZ1otNT5voJKisDGMEo4jSM0XmhpF0eNWk7VuncVuB3Bzl2rZZrurH6bjuyQDWwPa4p18+aV74N4NBgit0MtqD+MXsrBiGWDC+Kt8BnElGR1cKjM8/qMtGUIpNAG9ZXXsnGLKe8JvjQHNYDQUYe8ZW2sG80ymecf22OfYO8fvqh0cxmthKwD1SK7IZgGvcBDtfKlCU5hwxd4XHmDPlYw8P5gEi+3O8TjwLtjIrfVh8OvR2xj3nIg6gEVun87pBHSebT3n5dwgN4TWkCNu/w29C1u/iOOPpUcR9qtAxAIIvAXzU200lRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rRbdQjJj7IkgPLcPP0ikYJSESpQif2v3Tpm63XhVzIY=;
 b=B1imI0D273/smSmSK+8QnGY+siVBPhgyXnfXGpT2bPwa7rasrhI2gG25fAFf46RqgkGuoymNddfINNuomUbg5UttSNVIm8q8oSvXaeJqUk6eIVPb/sjygfnYDU4ALEV07k5YPcWp6yCPhNe1RN4+bikpE2axvXcBrTSZuoR89v0=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4406.eurprd08.prod.outlook.com (2603:10a6:20b:71::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Fri, 16 Jul
 2021 14:24:28 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4331.026; Fri, 16 Jul 2021
 14:24:28 +0000
Subject: Re: [PATCH 08/14] iotests/common.rc: _make_test_img(): smarter
 compressiont_type handling
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, den@openvz.org, jsnow@redhat.com
References: <20210705091549.178335-1-vsementsov@virtuozzo.com>
 <20210705091549.178335-9-vsementsov@virtuozzo.com>
 <d983ae4a-dce5-35d3-1c63-7285651eae56@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <a8c71445-a7cb-7d10-6b24-449861f9d39f@virtuozzo.com>
Date: Fri, 16 Jul 2021 17:24:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <d983ae4a-dce5-35d3-1c63-7285651eae56@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR2P264CA0005.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::17)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.193) by
 PR2P264CA0005.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Fri, 16 Jul 2021 14:24:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 70720880-4ceb-4865-c91a-08d948656bca
X-MS-TrafficTypeDiagnostic: AM6PR08MB4406:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4406157DE6CEB94C2E3E775DC1119@AM6PR08MB4406.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T5gwuRWUHDHHk5nQYCZVTjI1oWayLvQQoYVl79w8tzFyaL9DTm0DVaB12YgVjHEOJaHraMzrSmkViK3bnywD6olLrH3pjTdzgavynMsYFDXp3d0uHrw4XYIf+mgTJGSvQYvnX7ZAbZSmTfniPEgfxBlZQwYWFrojAngSBSIjcGe9dgjFs2vpDrt81VyJyXX6QP+9p75x3ThjdYMjVrhTXWuVnwdERmowVmJFa2i8dAhzbkpi+SQRoOA0JFE6LV5wLsYj2qeN3Vfg756iCkskRJNrF9a08qjBr/NSnzz7WLjp7Qljy4n/Fh30OB6puaSJ60aWCNM13gOHObO2Sy6FNrpdw6UZdO/ZxNSqwQYZ2+jd7qZy9aHAAnpOOg8tQtnEvT6PT5AMCp8KiuQtkKVHkpx/rUsEEUeG6loKm05E2z43DQO25ZH4j3y0fvTEBAR4WIS/o0Uw98akS4E4wJo8n4JX6kXN6pnLkPM+PYe1wv204d9Pl08xTVhVS4Pz7MbhmJWaNAtg1gBBnERs5DzQMR1iSRONZRhmOMD2jsMnGDF8LFtuxLu6wtBNNYZInm5t2IJFEvN2ji/gNjWJ+bCO1R3wTAQyUgnQPCbQS+B9SMqHZEY07/Hzp4jnk18fmbinA5t8LLLboyoQAaTxT6HNML+LIF2nxpdZJ3gd5DQWcCN9TlFirOIMZll/U8aGolNOp4HoBlgvQCQhLuwagW/hHaHYg7VBJODSYjsi05UD+0a9iGpZvYB3kO8omv2LhdZhU0CFtdRNatqy5fCEMBrV0w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(39840400004)(346002)(366004)(136003)(956004)(52116002)(6486002)(2906002)(83380400001)(86362001)(36756003)(316002)(31686004)(66946007)(5660300002)(26005)(66556008)(2616005)(66476007)(186003)(478600001)(16576012)(38350700002)(38100700002)(53546011)(8936002)(8676002)(31696002)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OHlWOFZRVVREdFR2Ykw3VHlMYzljODNWaDFSeG5ycTlVbVIxUGNHaGdZOGVw?=
 =?utf-8?B?UGZvTVdIeWxjdk1iZ25Sa2xyRXQzNStLbHVTdnUxVWthN2J4ajFHZjc3bGNx?=
 =?utf-8?B?VFpad0NHVHNKMnkyQWFUdzZ5N0I5U0xXQ1F4QU01My9tMllGSVNiUFo4NFMx?=
 =?utf-8?B?TkhmYkxsN09pYnptSFJJeVFtSUZTeXk1TjZRWVBXOG8waUNhWUlGamhOZFFK?=
 =?utf-8?B?cEdndUhyYUNpUjhwd1FiNzJzVjN5U090dWtyZXZZSzJ5Q0V6d25IVC8vY25K?=
 =?utf-8?B?ZDFwaDVxWlJKZ1l3S3hBVFFZeEozUUtIb0dPNS9MUWsveWtvYVl1dkZCK1pr?=
 =?utf-8?B?Wk1NQSt4NTVSeGxmWTRtSm5uelo0MHVoY0pwM3J4Myt0RjRZVU44cG9UbmQ3?=
 =?utf-8?B?dENFQXdpdnZSaGxCNmNvVDBlcG8wQkhCWW1CL29PR0RyU2laWUg1MDRLcUNU?=
 =?utf-8?B?czFHeVlkTCtRd1M4SUhuemllWHFpMTJhaXhSZWJZanlMZWs2WnBGZFNsclJ3?=
 =?utf-8?B?T0pQbWEvbXJBOEJqdW9HanA5NjFUV1lPVFVBeVd3VEdMcTlVK21rSjZQNzJy?=
 =?utf-8?B?Q2dRTXk0UHdRZEtla3Y5K1Q5SmtCRzM4WmovOElxWm1pZzM0SERhOGJWTDBk?=
 =?utf-8?B?RUtJZkhvY01aSjBWR3gyMXkwTzBsaHNMQkh1ZDl1czhPWVI5dlBrUHZmZC91?=
 =?utf-8?B?NjkrSjdGd3g2cmVuajR2NGdoUGFFU0Q5K2FuZURSRU9lUDVXSzQ0NTVDTWRV?=
 =?utf-8?B?YURLMXIzcUsrZml1ZEhtZlpjRUxTTC9veHpFbE5PdzdHNVl6VUY0NWxCQ1I2?=
 =?utf-8?B?QnVMNjlkU3F1YUttMFJpdGJ6SHY2ejZ4dUJzbHd3RU5QVkZQSXdnQWViOER1?=
 =?utf-8?B?ckY2Mm5JbG4wbk5GTzNlcEd6UGM0cy9TZ3YzSjhCZDVKMGVzTUZkMmRsYmpV?=
 =?utf-8?B?a3VlVkJQdXJOWGI3ZVdLR3R6WXYva1liWmZTekJBKzRxd2NWeG1aaU9VWUt2?=
 =?utf-8?B?aFVkZU43OU9ISTZRcFkramJOOEtZLytlbFozSzEwa0VIK2Z5SldVV1JIakJh?=
 =?utf-8?B?K0JqMnRGMTRDZGZVSkp5QldNL1JLVjdZcXI0S3dzZGpHREVBYXV3SzV5YUpU?=
 =?utf-8?B?cWROVDZXL3hUNlY3SllhU2NFOEdFRXRiZFN0R3pkc0FiRTYrNzJ5VmFpajJF?=
 =?utf-8?B?a1VoSVVrUE5OaitUUnBCQTBvWWtQOEptNENrOXY3N3NHUkg4YTU3V3haK3lh?=
 =?utf-8?B?S3ZIWlU5U3huUjd0NWpHcXg2RjI4NmRDWmJFMVc5Q3BmY1Z4K1luTXRNRGRK?=
 =?utf-8?B?L3RHaloxdTVFM1UwNWtmRk1BNTdZYkt1cjFhOGg1TzJ3bzA4Q0NTenJMK3lG?=
 =?utf-8?B?M0Z1QzBKVFk0VGx0anRWcHlCMnpsYy9OVjRRTEFvYzY1aGVqazl5Yzdoejdi?=
 =?utf-8?B?SlkrUHBTWXFRcjRRT2RhMHpTVUQ2SXB2QzJXNmxJQnp4bktHKzFZWUpXVWp0?=
 =?utf-8?B?QmoxeXEwYXJlaHlPRDNVVDNLeUhMeUtDeDUwWXgyeFR6YmhDa0VobTlmMXc1?=
 =?utf-8?B?VWljQXNnVUxvcjhLUkhjWElCcVpDVlJLb1hoZUl0QW1ORnRObkN1dzdyTzl5?=
 =?utf-8?B?bUJMNVBIQ0hsM0pValEzMHlSTUQzMmkyVDMyRGtrVDM5SDRtZVB6b0x6bURZ?=
 =?utf-8?B?UXIwVXVvNzNoNzFEMTZPUGZ2aElUUzJQaHZtMkV1Skc3K1NjZW5zR25jVUdJ?=
 =?utf-8?Q?2StL+kAzo6HQRH9tFmh0MEMBZZL+yvnCXJjQaXH?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70720880-4ceb-4865-c91a-08d948656bca
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2021 14:24:28.8467 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: djs/8P8SA/VAVC2EyLBXZgEeBfr2SXfLrJiDOWCyUf4JJU3fwtawOEDeYw3V90KuACWu2uzRrgTK3BTkXj8m9hdXHjrtrUmGfopJJmfLWQU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4406
Received-SPF: pass client-ip=40.107.3.104;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
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

16.07.2021 15:38, Max Reitz wrote:
> Subject: s/compressiont_type/compression_type/
> 
> On 05.07.21 11:15, Vladimir Sementsov-Ogievskiy wrote:
>> Like it is done in iotests.py in qemu_img_create_prepare_args(), let's
>> not follow compression_type=zstd of IMGOPTS if test creates image in
>> old format.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   tests/qemu-iotests/common.rc | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/tests/qemu-iotests/common.rc b/tests/qemu-iotests/common.rc
>> index cbbf6d7c7f..4cae5b2d70 100644
>> --- a/tests/qemu-iotests/common.rc
>> +++ b/tests/qemu-iotests/common.rc
>> @@ -438,6 +438,14 @@ _make_test_img()
>>               backing_file=$param
>>               continue
>>           elif $opts_param; then
>> +            if [[ "$param" == *"compat=0"* ]]; then
> 
> Like in patch 2, probably should be 0.10, and account for “v2”.
> 
>> +                # If user specified zstd compression type in IMGOPTS, this will
>> +                # just not work. So, let's imply forcing zlib compression when
>> +                # test creates image in old version of the format.
>> +                # Similarly works qemu_img_create_prepare_args() in iotests.py
>> +                optstr=$(echo "$optstr" | $SED -e 's/compression_type=\w\+//')
> 
> What about the surrounding comma, if compression_type is just one option among others?  Do we need something like
> 
> $SED -e 's/,compression_type=\w\+//' -e 's/compression_type=\w\+,\?//'
> 
> ?

Agree

> 
>> +                optstr=$(_optstr_add "$optstr" "compression_type=zlib")
> 
> As the comment says, this is for compression_type in $IMGOPTS and then compat=0.10 in the parameters.  It won’t work if you have e.g. “_make_test_img -o compat=0.10,compression_type=zstd”, because then this generates the optstr “$IMGOPTS,compression_type=zlib,compat=0.10,compression_type=zstd”. Not sure if we want to care about this case, but, well...
> 
> Then there’s the case where I have compat=0.10 in $IMGOPTS, and the test wants to use compression_type=zstd.  I think it’s correct not to replace compression_type=zstd then, because the test should be skipped for compat=0.10 in $IMGOPTS.  But that’s not what happens in the iotest.py version (qemu_img_create_prepare_args()), so I wonder whether the latter should be made to match this behavior here, if in any way possible.
> 
> Now that I think about it more, I begin to wonder more...
> 
> So this code doesn’t explicitly handle compression_type only in $IMGOPTS.  If you have
> 
> _make_test_img -o compression_type=zstd,compat=0.10
> 
> It’ll still keep the compression_type=zstd.  However, for
> 
> _make_test_img -o compression_type=zstd -o compat=0.10
> 
> It’ll replace it by zlib.
> 
> So perhaps we should explicitly scan for compression_type only in $IMGOPTS and then drop it from the optstr if compat=0.10 is in the _make_test_img's -o options.
> 
> But thinking further, this is not how $IMGOPTS work.  So far they aren’t advisory, they are mandatory.  If a test cannot work with something in $IMGOPTS, it has to be skipped.  Like, when you have compat=0.10 in $IMGOPTS, I don’t want to run tests that use v3 features and have them just create v3 images for those tests.
> 
> So my impression is that you’re giving compression_type special treatment here, and I don’t know why exactly.  Tests that create v2 images should just have compression_type be an unsupported_imgopt.
> 
> Max
> 

Hmm.. I have better idea: deprecate v2 and drop all iotest support for it now :)) What do you think?


If not, than instead of this patch, we just should skip all tests that don't support compression_type=zstd due to using old version.. This means that we will skip some test-cases that can work with zstd just because we can't skip separate test cases in bash tests.

(ohh, I'd deprecate bash tests too.. But that's kind of taste)


-- 
Best regards,
Vladimir

