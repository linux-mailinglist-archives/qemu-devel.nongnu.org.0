Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC743472C9
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 08:38:15 +0100 (CET)
Received: from localhost ([::1]:58648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOy5m-0003FP-BX
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 03:38:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lOy2H-0007Ox-O6; Wed, 24 Mar 2021 03:34:37 -0400
Received: from mail-eopbgr60123.outbound.protection.outlook.com
 ([40.107.6.123]:13967 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lOy2D-0006M9-Dm; Wed, 24 Mar 2021 03:34:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k3f4BRLcIwhKr0peDNdCYsJXUaD8Dsw9zVPiKu2DFOvZ9BDx4aTuuRvne722A9yOmZhlWU48UbRCU9TDEqRA/aY7W/ABZX5Jc6Ojl28WeGQdT2zOtKTL2mknRwwWIBx9XcXYWExH4csV/hA1yosy8K9YnONPM08FbKyYSfFlU91qBkHpJ9xtguFXis4R1vm2Tc6u2T/lCUDbAQdW+2sXDpB3y2u7Tm6Gq3YX/7nVE6+l9vvZH9uPNRBzHx3bacQxHTPF9UGMUDtb3RAGUaI3PE9w+ojVwrEC8/cZ3ht7o8sCOdLCrSeiD7v/0snM6qchphMonqI407QCUZVO5bMDNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5OZvzg3Yqwgwko5ZayGQ3sWXjusyoOsgXCGxtxUIcUc=;
 b=lZLAImE88beKuYrPNCnDd4JSn2lY9CLWsHIow2fUt51hlCUvm4DtYoVfoaq9zsVxyrSOTYIA3Kr6y3A3B9gbvkUeV9zi2cNnPCLzdlAr9F1IbeHmROvA4EsIoKdOUPFmRKskXFgiXZlQK28bqLe4Htfz2fcN51+TtYDEX3N/XF+G8It1f6QR4nyCUv0sIC2V5Xp3Iv03hzfl7NDjUPqKhcJqSq4HzdPD1gPwK7qzP2WraxpHSkv01GBWbIzTZrXJonqpc1Es0eRTQB/s1T7BnZH1NLEBHdmYzJGvNzrNT4V4zRbAZoEKcWO9Jtg0vX1/aoraYGODoZwUnoxKemiDjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5OZvzg3Yqwgwko5ZayGQ3sWXjusyoOsgXCGxtxUIcUc=;
 b=M/iOjtHr7yI2O3KIn55/jjn0EkRfU01QZxQ0uE26BHaBTu39onm4+HR4C9Md0uZ8ecqbopO75nje4GnfnlQWm8BQev0mhqzlfcK8A5DltoHfMoW9+Oxua5MfvlBaSAJhuefFI8wqfw7oJoNNUf6/+9vAtIDnBBGdYH6xJojQ0Mw=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1907.eurprd08.prod.outlook.com (2603:10a6:203:4a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Wed, 24 Mar
 2021 07:34:29 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%7]) with mapi id 15.20.3955.027; Wed, 24 Mar 2021
 07:34:29 +0000
Subject: Re: [PATCH v2 2/5] qemu-iotests: allow passing unittest.main
 arguments to the test scripts
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: eesposit@redhat.com, qemu-block@nongnu.org, kwolf@redhat.com,
 mreitz@redhat.com
References: <20210323181928.311862-1-pbonzini@redhat.com>
 <20210323181928.311862-3-pbonzini@redhat.com>
 <69c695a1-e0c0-dd5a-7473-0b70ca2becdf@virtuozzo.com>
 <fb872acc-bc21-c1b1-3dcc-d6c74da5cef2@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <bc3cc130-f3e7-de0c-7d57-0bac8ec5b6af@virtuozzo.com>
Date: Wed, 24 Mar 2021 10:34:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <fb872acc-bc21-c1b1-3dcc-d6c74da5cef2@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: AM0PR04CA0045.eurprd04.prod.outlook.com
 (2603:10a6:208:1::22) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.202) by
 AM0PR04CA0045.eurprd04.prod.outlook.com (2603:10a6:208:1::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.24 via Frontend Transport; Wed, 24 Mar 2021 07:34:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ed5c6077-1f9a-4ff0-406d-08d8ee974147
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1907:
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1907F6E078BCDEC157BFC1FEC1639@AM5PR0801MB1907.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cQZ7afB/7os01xymjs8zbD2f9N3WLAmJDA7IckE3rUqHxvutDoUMolVYb+j8MilsJCRidoW/nVqQLn6YavBZk3wMPdlrIVYA/cQrGnLyV87t9kSSGQfR3CfgrNu3KWE8HZR0PYx35nJVd2jnMmB0tKuIqvNemhiq8lXM9cVemho3l5b2Vsmdue3lNLANZFQOlY4Zb0IvxUuMcAmiSMVQso3yCZY/Ev8WJGqA3hYNmiMSm/QbpUMN0Sd0REw6UL9PIFBAy5RLveUq1Chj6F/poRkEQXKAvBP5QvDKVBSiMAXGO1LoVQ4Xf7egS6lr9Rbd8Wfb/RCWbGFCZ0/ri3eH2//o6QAmUti7WUVTWTpJP0mBX02Ufo2jUdCKC66v/7MRwLEiEZI0hj2YkxgjD+3XKA2LbwCRQDZ214POL+6vVFk+tYVFXCIogFw67jh5HVU54OtbaFwuNUs8ddvQtTNLLlosRPy4tu1GCn0NNMSFoJ3Y6aI5s388vKR+oEmhK5BNjqA7xO+PpcHashY/hhA4Q5e0Mh5LFQHlMd83ZG9LaoKgU0grBlBlkizljCZJ3gLQ90e8of3aLWKMnJV5ySQXOgxkiS9Mm7tsPi9Nn7+eJVrN3KJ04jX5IcTnHHXy/mvBP/RH8l0glc7tgNIL07/CNHZ5wbWw42+TjjEug000t1PNHXeZ7sS/wNNNTxWvbs52kycZVsRp9MBqX/n+xpZN3v1haE9iynPkaW37yiV8d4o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(39840400004)(376002)(396003)(346002)(16576012)(16526019)(36756003)(2616005)(956004)(2906002)(316002)(6486002)(26005)(186003)(66946007)(5660300002)(66476007)(52116002)(53546011)(31696002)(83380400001)(31686004)(4326008)(8936002)(8676002)(66556008)(478600001)(86362001)(38100700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NkxUM21yY3Q1RGQzZmlZVGZTVTB0VFJJM2I1ZEsvUGw3MlVHeFJrUU1HZWJa?=
 =?utf-8?B?allOeXRRWkZLNndUMlU1a2c4dWpXQzl1MmVqN0xnR08xWjkvaDVXYlBsZUx1?=
 =?utf-8?B?YUsrZHVMa0xzTENlbkY2QTlQVFJoUisrWTdOMHUyTzZRWkVmdUc4S1oram1z?=
 =?utf-8?B?cSs4azRQRHI3SWh0bGdRNWpEVXJHWHFMc3FoNTI4RU9keXR1bU5UcjFYNVM3?=
 =?utf-8?B?ekozUGVMdDFtQys0REpWMjRXd09PVGdqZVZ3Sm8rQTlIZW1ISWNRY0hlMnJB?=
 =?utf-8?B?Y3BEUGhTKzZTS0hGOEMzTUJSMUpFYVZZRjFodWxPcVI4dmdpRWp0b2EwQlEx?=
 =?utf-8?B?OUVkTUpyempNcnB6WnY1MTZ0MUltU2ZkaTVlb1dBQktOcExSektvRHBzQmRI?=
 =?utf-8?B?ckprQjdsbmw3eVlCdm5jb1hOVm8xMHl1M3JlL2lBTkFxcmFFblByN3h4QjNi?=
 =?utf-8?B?MnpMVDkyMzZXQlBrU1BrbHVSd0RKSzdoUFdFc3dlR201dGlrdE1vcmwyQVp4?=
 =?utf-8?B?RVVRUVFrdm9iRkNKa1kxaFdIWnY3VFBkazBmTTFFc1o5YWR4anhUOGFVSVhU?=
 =?utf-8?B?THVzRVhtVzJ3a0wyZjI4N3dEdHlTeTdWT1B5aDNlUG4rRldpcXVKUkpuYm9F?=
 =?utf-8?B?cUd4bGhXV0ZZWG9wamxuSUJ4OUIzZU0xNXdsYS8rQzdubjRHTk0xQU9lVStq?=
 =?utf-8?B?aXdHOGFHSFV0M21jb2JDU0VQMjRDbWpMV2lqZWF2eHE3c2hrMll0WDA4Yy9Y?=
 =?utf-8?B?b3lxcXluTjNTZzU3U1pXbTh1c3R4T283T2NJNTY4TnAwclpkZjBCU0YyRVBD?=
 =?utf-8?B?L05NNEFTYXNlY1BjMG9GZWZkTkFuMEJJUGRINlV2cGgrUjlNLy9UeVMwYUpu?=
 =?utf-8?B?SWJwRXpqakpEYXcveVk5MFA5Tk1Md0pyREI5cXNJSnVNQXZEUE5zVHI4Uldk?=
 =?utf-8?B?UHdCMTNtZEw1K01WeGEzdmVMMndsVjhEN05wL24yK2V6eFFXNmNKbkZpZGtX?=
 =?utf-8?B?Ny9aMnN5eDhvZ3Z5ZlV5d0dtb1hpK0JwOUQvcWo3T1MxTGJFZjNGblhheDhC?=
 =?utf-8?B?UCtUb0pZMGtGYlVNK1YyL1FXUzYybDhiV2RVNGt6QmZQaUxCTy9WTWM5MFNr?=
 =?utf-8?B?dG04V2RjdUJ6QlRQa1JiNkZiZHBpZWU5MG45RE11bkI5c1pIbVRDWmhieXJ4?=
 =?utf-8?B?cWZjRmkzSVdUbEdHQUJobWZxMGNjM2NJZ3JvbS91Zk1KSGVRR1FSMitYcFdk?=
 =?utf-8?B?MDZRR0t2UlhOOWxtTUpuM0Q3NWJKQ3JhSHdleHpDU0JEWGdaUlpSN250V2JY?=
 =?utf-8?B?OUI2MXFwUEJmak5HWERQY29zOFR2b05WWTNINVBWTWVqUXJlTURQU3dUMDVJ?=
 =?utf-8?B?YWsyLzd3MXo1UjU2NWpLVlNobVlBQ0dCS29HS0hidGsrNitIR3hBWmdOeU0v?=
 =?utf-8?B?cXoxcGN6Sm5CeDN3UFRlcSt2WFJuM3NhUjJHai9qbFZSc0Rub2dOQS9OY2Zi?=
 =?utf-8?B?RUE5eTgxK3RqcDIvbzZFTnl5UHBFSFlBR2RXTkRnSDNuRGtuVFhzejVsa1Na?=
 =?utf-8?B?SG53eE0rTGJRQzFtRVR6ZEJ0ZVVYK29TUlJJYmllRSt3dzJJSVF6RGJxUUds?=
 =?utf-8?B?OHFXRmlkTXoyKzcreXNXK21lRzUwYThyVmJUVnd2a3pnSTFmdlpKSjRZYVll?=
 =?utf-8?B?WW0rN09qTHIyRS9wU0Y5S2s5ajV0VUVDdmVQSHdkUjl0RVY1aWsrSHpaRjg1?=
 =?utf-8?Q?aZ+06Q3HK6vakyI/U6go/cjSNOuS49wd71kffPI?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed5c6077-1f9a-4ff0-406d-08d8ee974147
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2021 07:34:28.9475 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7nIYHqTEK/6vBaUbHtP6xnbGhzFAlNMyzc2MGNf+hpW+yJi5NvbTfewZ69cXN0stlxj5KeRNDEvo+6ES3XudzR98OS0STxQnpsmlouf1dsA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1907
Received-SPF: pass client-ip=40.107.6.123;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

24.03.2021 00:22, Paolo Bonzini wrote:
> On 23/03/21 20:17, Vladimir Sementsov-Ogievskiy wrote:
>>>
>>> +    unittest.main(argv=argv,
>>> +                  testRunner=ReproducibleTestRunner,
>>> +                  verbosity=2 if debug else 1,
>>> +                  warnings=None if sys.warnoptions else 'ignore')
>>>   def execute_setup_common(supported_fmts: Sequence[str] = (),
>>>                            supported_platforms: Sequence[str] = (),
>>> @@ -1350,7 +1354,7 @@ def execute_test(*args, test_function=None, **kwargs):
>>>       debug = execute_setup_common(*args, **kwargs)
>>>       if not test_function:
>>> -        execute_unittest(debug)
>>> +        execute_unittest(sys.argv, debug)
>>>       else:
>>>           test_function()
>>>
>>
>> If you decide to resend for some of my comments (or due to another reviewer be more careful), I think it would be nicer to merge part of this commit which moves us from passing object to passing ReproducibleTestRunner to the previous commit, to not remove line that we've added in the previous commit. And here only add argv argument.
> 
> Well, it's the price to pay to make the previous commit as independent as possible.  In particular in the previous patch there's no reason to add the complexity of warnings.
> 
> I could make it three commits, but at some point too much splitting adds clutter, the patches are already pretty small.
> 

OK, they are good as is



-- 
Best regards,
Vladimir

