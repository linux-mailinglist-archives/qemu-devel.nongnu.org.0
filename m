Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5524476F64
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 12:03:45 +0100 (CET)
Received: from localhost ([::1]:48542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxoY4-0004xA-UG
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 06:03:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mxoW2-0003V0-Ro; Thu, 16 Dec 2021 06:01:38 -0500
Received: from mail-eopbgr130139.outbound.protection.outlook.com
 ([40.107.13.139]:7553 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mxoW0-0005Xp-Nk; Thu, 16 Dec 2021 06:01:38 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EHZR8d63twTG0S8PEpj4PbSEu0+1j/FgO6KbGlVAX9xW4419zoYoukCGGCCu7JdQ4TWXUhyCGNz8jd9ePnK1/DNOF8KZ6rsKj4tF6tpPA48X8tm42/77ut3iCQl5pngg+6yr/PdGHCrnOaKNpIigjcQZvGkFG0rc64e1gzwtK0yKWiX9d07aUBe7tGcoSowbkeF1zROp7sGAbPcyKxrCJNcqpDsSUFPWdnUCl858uUytmZ0/cKiehrSL40IiD4p8K4XdH+zBhZom24R+b15FMhkRKc/HLlH+WM/GDkvlG+tp43DVFAL3KeomtMQTs7tP2/n0p3W/GjgplnKJ5dbZ8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ktlhU4Tqfdpd9CR5dzYk9imkrZO/bm++q025WT8j1Is=;
 b=azzgO8JP+vWwoItmaglvnD1KRFNQIkwGKW0pI6G3JOh4yTdrWF7SvDFvwrg5v6ljsKFGw+/035j+uDrxvkiydgt89MAU0GKdcktDxkBVgouYzn5uqsAf8/EpXnuvNa6+G/a9goDP16UlRVBqJNwuqxbDxD/J8UhLPh/xirX2cfdIRP5mOcI9ZNUaITqdaWXbPoupd4TH3w63hEXtvFtAQrm+nosUu8KOBe8TH+gRrfOsgv3mDBtLRRoiK291HnIEnsHoh+V16SJc3Q9k31becixKj0Wr5Iqq803JYnK1POFZb8V6HGD7mkFvGGLLal4bANIBGJjrwBaKDZKtKlZsmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ktlhU4Tqfdpd9CR5dzYk9imkrZO/bm++q025WT8j1Is=;
 b=jICNHRI4CTHDJ4uoYBxAhSF9+NCG2JoGexfXC/lJZCkGAzgOFCDUOfy5ED/5TNFr4lzBkGCc4v7mJQ+FBvXaOAWbcQM4zmwT9wHxuFhHMqymeCmrWk7PVNTietiu8iicn7HRYjnznKoK1prG0NqFYX/4L6DAQ8MS9vWP4nB1IS0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB4276.eurprd08.prod.outlook.com (2603:10a6:208:13a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Thu, 16 Dec
 2021 11:01:31 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Thu, 16 Dec 2021
 11:01:31 +0000
Message-ID: <90b71aa5-4fc9-8864-cefa-6332a485eec3@virtuozzo.com>
Date: Thu, 16 Dec 2021 14:01:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 17/25] iotests/mirror-top-perms: switch to AQMP
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Daniel Berrange <berrange@redhat.com>, Andrea Bolognani
 <abologna@redhat.com>, Wainer Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-block@nongnu.org
References: <20211215193939.3768033-1-jsnow@redhat.com>
 <20211215193939.3768033-18-jsnow@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211215193939.3768033-18-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR0202CA0058.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::35) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.230) by
 AM6PR0202CA0058.eurprd02.prod.outlook.com (2603:10a6:20b:3a::35) with
 Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Thu, 16 Dec 2021 11:01:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d7ca51ca-4a60-4ff8-9e84-08d9c0836a56
X-MS-TrafficTypeDiagnostic: AM0PR08MB4276:EE_
X-Microsoft-Antispam-PRVS: <AM0PR08MB4276F5D4D68F1996E62A93E5C1779@AM0PR08MB4276.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ASl6O2WaImqHq377MtqZTwnFEE8xos41RsvlmkzA0DIrxne5Q7ii2ksBygqF+fy446dtQ1uffnzl8KqjghskXzRF1sBithHIKKOH7R9XWv9e31H1arDy8LrmzNUNFsrwhGlWF3lqrA7almHpSYO4uCREprSDM4tYI8ApCZCyPBgijJUiBDhdHTMXiqf3dIL6EtZDlGSm46ntDfD2ADJccHwdZDXrEW8Z2cfyRO6+Jpv92b/m7IB+lRmAvWQjOyXxTBL3PS3Itb8VgXaq0tkuVCeDb+ndCFIzcRD9wW0QPmsTaFfco0jEEr2j0AGrvbu2w3UYmMYEu9OTUoaj5PwxHxF1YUKv+PF8/fxlWVyU2pICZ++r+2+W3cPVgxFrH9ngPMN1ezpqOpbECkBIpQ35Z2meqLC8rThw4nVOiG6qmVEtJi/y0CQUAJXCZwI1QGx4/1OW9Ku5TfhFW+ooHQ+5PCSANAZ/1xRrOUwExz5JQUJ411pioCQ07sab22VJ+HBhc2n538SFjG4isXA0/PP61myOF4gOlMLU3VxD8r0HiUSVr695WcgNTg11lsTtN0VGQQS+Qh1xSC1fLWvudjM5yrt0axD0pPr1g4uO0Go48+sNLHGDFzYTPRxJZgLkqIqCWjEbCQggBTdJ4YtEALul67RpSIij2RQYk2Fi1pAwINVPiQFRLRAhZE6yRT3oys7W5ThQ80L9WM2bbRl0hAO6XbmKkkXXFRB0GnToU4GQKiBc3PgMZbs9fH6amlzMNNfUDhR6zqdzHtlo+7FY59/V9w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(54906003)(31686004)(8936002)(36756003)(31696002)(5660300002)(66556008)(2906002)(38100700002)(38350700002)(7416002)(86362001)(4326008)(8676002)(186003)(508600001)(316002)(66946007)(16576012)(6486002)(52116002)(66476007)(26005)(956004)(2616005)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dysyZG9pNU5wRTdWWWU5K1ZrbVpTT1ZFcms1Zy9BWFZHNjZJd1dGTVhDSzJP?=
 =?utf-8?B?ZThGYWRaMDVFZm9BN0N1RFVONks5VnBlelQ3NXk2VUtyTUZxeDdsd0FMcUtp?=
 =?utf-8?B?OU1GazBCSjJUNnlHYURlMHJ5SjFWcXFQdXZmbk9GWWpiamJzUVRBMUhnUThY?=
 =?utf-8?B?MkZWUW1GclJDUWRQN09WOUg5QWZGVWljTno4QkpXaFB1SDZ0dHBLN1Z1dkV5?=
 =?utf-8?B?dnBJNVlzVTBlbTVkMTNkRldmdlFBOXlLMEdCenhsQWFHcnJENDVHU1h5K3VL?=
 =?utf-8?B?bXFHSU43Q3lEZlBKamZWRnNqdm5mWkh5ZUlsT3F5WDRDMnZuQ3hlWFlLTUlx?=
 =?utf-8?B?eE03OW9TaUVENzU3bERzOS8wRHVkam1nRXpFV3M0WWwzT01mc1ZTU1NmR0hv?=
 =?utf-8?B?MjdqekpId3o3Mk55Wk1NNVUrc2FhK1BKbmJTQjhrZFF1TU03RENDdjB0SklZ?=
 =?utf-8?B?c2lNais2RmNybU9ERjZsNVV0WVhmU2hZYVBickYySVR1UXZxVmc5bDFSZzRP?=
 =?utf-8?B?TkNLemhNWEZhTldkekJSSVpwdDdZYTRtekZEb2hwTGxHbEVvenUvWmxzTzdR?=
 =?utf-8?B?TGxYbnY5M0xVM1ovZm1yejRYckM1UCtnVmVZOFJPU0YwbWp1eWdMN2RZa0ZW?=
 =?utf-8?B?dHFGNFZiQ05PZ0R4d2R6QW9CN2NMSi9hZERwU3loTkNKc0lSa1dzVDF6Yy8z?=
 =?utf-8?B?UnA2N0JzWHl4YXN4aWRKdlI0REhMai9WclcwZkhZVGo3ODVLaXphMTNFbkpB?=
 =?utf-8?B?WEk1cVlHcGRCcUNwbXFOZSs0eExsRVNuYytBTXIxdERQSGhNM2NSTTJzVDNn?=
 =?utf-8?B?R1VWRllpNk5mK1RGUGhFL08yYVBHdmtBNTZwUGxXbnkwZStvSi8yUXIxTFVw?=
 =?utf-8?B?bThvNnJQQzdRc0c1bFF6WWV5MlNrSGtxRUgrZWVtZTQxbGRQS2phb0w5Sm1y?=
 =?utf-8?B?L3RkNnVmZ0gzTEVtQXJXUGZBVFJtWW9obitXVlR6NVRkeGdLclJUWkthY3lO?=
 =?utf-8?B?QmFZRmF6TDhQUFFyZVFUM0RuRWZvZ0VKcTUyZHB4MzBLbnpnMWl0YlF0cFU4?=
 =?utf-8?B?bTc1Tkc4d01VRnhhTmdNVWNVVVJQOTZ2cnNzQW5DeUpkU0swZ25WUmpXTzMy?=
 =?utf-8?B?RmdzNTVLTXdWU2h1VWNhWlNUQWovZ3VCYk9EMjVra01DOURGTHNkZ1R1RUhs?=
 =?utf-8?B?TWQ3d2FpN1F5VURQR21LV0pvSW5kNFlLckpsZXgvUjZQRllwME45c05RUllC?=
 =?utf-8?B?Wmk3am5FRDFXQkpmN3NKSkFWSG5MUnZaMk1PWGtXU2FIeHBzSmxOa0pjREVp?=
 =?utf-8?B?NVhoMFB2alcwWEJnbjRJQXNZMEk5dVVISTJzbGF2MFlQNHVyWkpZMWZ5WENm?=
 =?utf-8?B?SmhkQzZDRDVwZkhucjJiVkxmZUpjdzRzS01JMjJXYjJBNEVWL0l0c0ZCLzNo?=
 =?utf-8?B?RkRDdElSdnppL3lYSzI5OHE1emtqR1l0WlIrT2NQNWlzRjNzUW9YZWhsM09Y?=
 =?utf-8?B?TUZmTEtGSEpLOFU4QnBtSDlSdEh3bkFrd1AyNVA4TVNEMEVVYjVJZUZ4QUlq?=
 =?utf-8?B?a0VmcGtsVk9wbTEzbUpCVTlNUElJUUpuV1hsMy9PRkxocTk5Zjd1a0xvaHdy?=
 =?utf-8?B?VzJLTHYvN281ZmxQQ3h4L3hkdDdSRFpFN0RjS0lySXRBMGxYV085ZGdmbTZM?=
 =?utf-8?B?ZjZJZG4veFVMZVgzYmVweGsyYUNrNjdISVVld3Z5bDkwYWdGQWtSbVIzSDd4?=
 =?utf-8?B?M2hjSGJEZjBtT2QwRFdoZXYyZkNGendLVzlnbXVONXhSU0lWNkRwT2dHSzJ5?=
 =?utf-8?B?RStYTWZJUitTK2hpdkJseE1kYitpamhzZE1rMlFUUTNDNFNwa2l4ekV1UDVI?=
 =?utf-8?B?Q3ppcUlET3B1aHBCL1hGMGhONGVFdFUzcTErMFNtQlhzZGI1WUR6K0hHNjVh?=
 =?utf-8?B?WEVkNjJPczZtNmNwQ0IrQ2hyUWFZMjd0Qm1LaUxYQVI2ejJHM1JnZ1BLbTN3?=
 =?utf-8?B?ZVBMOGlwZkRBZWFvcmZYbW4rN1VrQk54QkRSclc1cVQrczBZaXpBemhRNjdv?=
 =?utf-8?B?VEJJU1VJTkU1OEk1NE9uQnRBZ1d6RmQzQjdKbXFMN0ZndkNZTEkveElQTHRv?=
 =?utf-8?B?OC9WZTVEeUxVMUxSZFhUbytVcjN4azFVa1lDcWEvcmlwWlhBNjFuTWx5STNq?=
 =?utf-8?B?VGtaZ2w5QlNUUERsVFB3OEpHeG9XQVRCQ0hKMFZmd1NEOW80QkVHWnV3WURP?=
 =?utf-8?Q?f5Jcwe0ae+U9BIsFtBWIRTrS9uHWefr3ijrSP+997Y=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7ca51ca-4a60-4ff8-9e84-08d9c0836a56
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 11:01:30.8170 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8nMFXmY+rOQoBs8I/fvsEFNxubEG/QzH4AsC91SAPl314JKaPvy8Hc1AEUtKw1ZBZSqhtkR0dhlMDdSphSwJ5rvq02B8y91wdbPLCjU1EU8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4276
Received-SPF: pass client-ip=40.107.13.139;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.034, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

15.12.2021 22:39, John Snow wrote:
> Signed-off-by: John Snow <jsnow@redhat.com>


Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

> 
> ---
> 
> Note: I still need to adjust the logging. The problem now is that the
> logging messages include the PID of the test process, so they need to be
> filtered out. I'll investigate that for a follow-up, or for v2.
> 
> I could just add yet another filtering function somewhere, but I think
> it's getting out of hand with how many filters and loggers there are, so
> I want to give it a slightly more serious treatment instead of a
> hackjob.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>

Hmm, something is wrong with your scripts or git-notes practices )

> ---
>   tests/qemu-iotests/tests/mirror-top-perms | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/qemu-iotests/tests/mirror-top-perms b/tests/qemu-iotests/tests/mirror-top-perms
> index 0a51a613f3..f394931a00 100755
> --- a/tests/qemu-iotests/tests/mirror-top-perms
> +++ b/tests/qemu-iotests/tests/mirror-top-perms
> @@ -23,7 +23,6 @@ import os
>   
>   from qemu.aqmp import ConnectError
>   from qemu.machine import machine
> -from qemu.qmp import QMPConnectError
>   
>   import iotests
>   from iotests import change_log_level, qemu_img
> @@ -101,13 +100,13 @@ class TestMirrorTopPerms(iotests.QMPTestCase):
>           self.vm_b.add_device('virtio-blk,drive=drive0,share-rw=on')
>           try:
>               # Silence AQMP errors temporarily.
> -            # TODO: Remove this and just allow the errors to be logged when
> -            # AQMP fully replaces QMP.
> +            # TODO: Remove change_log_level and allow the errors to be logged.
> +            #       This necessitates a PID filter on *all* logging output.
>               with change_log_level('qemu.aqmp'):
>                   self.vm_b.launch()
>                   print('ERROR: VM B launched successfully, '
>                         'this should not have happened')
> -        except (QMPConnectError, ConnectError):
> +        except ConnectError:
>               assert 'Is another process using the image' in self.vm_b.get_log()
>   
>           result = self.vm.qmp('block-job-cancel',
> 


-- 
Best regards,
Vladimir

