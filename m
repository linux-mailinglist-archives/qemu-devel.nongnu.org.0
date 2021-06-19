Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF6A3ADBA3
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 22:19:03 +0200 (CEST)
Received: from localhost ([::1]:53786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luhQj-00071d-Qq
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 16:19:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1luhP8-0005AV-El; Sat, 19 Jun 2021 16:17:22 -0400
Received: from mail-eopbgr30094.outbound.protection.outlook.com
 ([40.107.3.94]:38967 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1luhP5-0004TP-1T; Sat, 19 Jun 2021 16:17:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n091ldco6fcmjfrOyaIg0iWmQ4Npn7swhthDQEyaCkSJUls4cmdLhK/uvsfjPnCh+gj5P4suIrgc0k2Ro4lnWlEqH3nuA13ZUogVKW7vi5fWxv0BQahmMN4G1h/OX1POgQu+l4cSZ0FQ8kS9x2lXCq2KFSXJbMmRXukalAUlt1LE/NsFDeOA5sYf8L8khm5IZa+XArm+BkYlhtwoW2ntU7Vsa6bwLb3s2zMKNRvxs3iQehs3DmuJrnKj+Rv/JeBSa4bnxNcoILqr1V9Mz3KBbLPtoMtC9j7EI3ET9lFVCHhNIM191kyCzUU2v+Qq7zAYFiVas9CsHpNx8VKDgF814w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iIhiUdTg4fIhOKBxstQ7no1FMep4EoF6kFxKWvkrH1Q=;
 b=ONlunH0h+UFpIYGX0Hj0F0LDYNIZ/jEYLvIZv9z0EOo/QVrF4VnyaO9JNhNCf2nMCZieOcrCAU+i9jS6tEUeJ74gX0gVEGgcTuNzWMxQLyq3X/sNoZur3gVEO5kqEJLOH8WVzCcn4+V5y0NNpAwm+fFmcl4J0qHwSmsi7Zoq3w/Tw9+kf/demiO9koVjddGDAlERdce/2FS98cYuvJiYPzPO9ITXJaPjeSBazTnmD88E+vs+4u+nKNcCGso2MlE6axAugYLsLZkEzXMwAxaQ1rxEj3Y4B782LpwHC/vStL2DGM+tvKLpj3UN1VX+M2sao4KSqaxsNx2s9YcKMGScOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iIhiUdTg4fIhOKBxstQ7no1FMep4EoF6kFxKWvkrH1Q=;
 b=LdhtsdbU6f+od3HgVhwxN7Q9esbwOIBkOXv/Mt3jsX9unEqrjK67HNUlfA63AIYpWKMzMuOHJUtPHNmEwdht/GrYk5WatP4lOehjzO0hI91H8Wl/b2LwXr2asMVbJjEtNj/eQcgdV/08WLeKVFMa6TY9ilomLOmDZjhtAHZWkJc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0802MB2611.eurprd08.prod.outlook.com (2603:10a6:203:a2::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Sat, 19 Jun
 2021 20:17:14 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4242.023; Sat, 19 Jun 2021
 20:17:14 +0000
Subject: Re: [PATCH v3 0/5] block-copy: make helper APIs thread safe
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-block@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20210614081130.22134-1-eesposit@redhat.com>
 <3761c5a9-d29e-8ce5-f785-38b01d76e141@redhat.com>
 <e1b618c4-6492-9101-d0f8-815edc401de3@virtuozzo.com>
Message-ID: <f9dd4b71-f9a5-5595-8d2a-5944d2d89a0e@virtuozzo.com>
Date: Sat, 19 Jun 2021 23:17:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <e1b618c4-6492-9101-d0f8-815edc401de3@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.221]
X-ClientProxiedBy: HE1PR0701CA0072.eurprd07.prod.outlook.com
 (2603:10a6:3:64::16) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.221) by
 HE1PR0701CA0072.eurprd07.prod.outlook.com (2603:10a6:3:64::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.7 via Frontend Transport; Sat, 19 Jun 2021 20:17:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 77fca30b-4033-404e-372e-08d9335f3a47
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2611:
X-Microsoft-Antispam-PRVS: <AM5PR0802MB26119094115F0E3246384DB9C10C9@AM5PR0802MB2611.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5dsazpXZfH1ucmfcgeCmGASCbJbmQMGvwxaSRL+N7Z7CPudthrsD+GlgBA7INtjyWWhK+76TjXLS6H7Sgfv4tnlmiM3YT0payS8ODgLBNOIqVmBKatpn04dF2c4jPYW134wdNmCxwDSzozbulJ7ZQT/MVxJS1u0JJbQo3sTtmz34APWD0jVagEIJJxZk8giAPZKOAegG/2EV+HQeeYwFgD2q6dmkqWhozQwmgInVO/Rk5gGJ8zgqC1LOcr2Fb0WrokWmQv0FlMR1GlI5ZFY9AnPeldKIMJm+EGGTmfjrMWbbLgyl3/teFQMnxYDqqL178FGULKybrKGdU6gqtL09WVzOK04L+lbfev/OBy2rm4M8zzURzKkVBKwXwESw+zlYztEwP5D+l7Kq75W/RHb99CBbXJhQmJgZZdv9nJ3Snchhdu2e6sdebxtYkvDbdi5hP8Sa1Ss/WNULcTEFTSwkIV/rmq6/gZYcT3p7HWvASjJGAQC04T6Udj6sNkQ9dev583ray46IlIcF9nHLGzY3yC4tYXZM9TRAe6ION3tBl7PLyg2Ie+WaeJYSoRopRW7MDMgrpUDrZzUxmvnJ7+/3ZT3HlPIgiCCAPRqhMc+HWBOPLwkN/YxD5HOBsPgpMad1RoH0LiFUll6NThlKVc2YY7QDDf1HVlNgrFe8qt3OED0TQcLKgcfyAu4FL+GkSvxeAAWftKbEtsJZvb+jxXdtcQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(39840400004)(366004)(396003)(66476007)(66556008)(66946007)(86362001)(478600001)(186003)(53546011)(316002)(8676002)(956004)(8936002)(36756003)(6486002)(2616005)(54906003)(4326008)(110136005)(38100700002)(83380400001)(26005)(52116002)(31696002)(16526019)(38350700002)(2906002)(31686004)(16576012)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RzZaUVhLUVV1SUU2Wjg1b3YwSHBhcEFBZmNUckUrcTNiTW5FNW9ZUWpXZnJN?=
 =?utf-8?B?dDM1UXBlb2JXL2FwRWF4bURtLys3dFRDK1NLRDd2ek1OUFBQVWNEbGMrZnZv?=
 =?utf-8?B?VU5pRGJlV2JkSDRmeDJhNzRwUm9yaHBDd0dQK1VyR1dVaEppUnFEaElDRzNp?=
 =?utf-8?B?L3BMcytUcVVkYUdYYnQ5Zk8zWWVQOEJEaGFXdGs1TjliQWRFdndpdUhJUzhR?=
 =?utf-8?B?LysvOEpQWEZpa0VUNjl5V1hqaVViWWR5cmlTWGM0OHJWdjBCSFZZdlBvNjBz?=
 =?utf-8?B?UXBjdk9jMXk0WWJzcUh3N0ZQS3UxdS95Z1BMN0UvOHBvR1A2bGlPYXhqeWht?=
 =?utf-8?B?UXJkSkY0N2xERVRWb1RKSlVYaklOcktySXZCdDU5RSs3eHczVit2Znp4RlRP?=
 =?utf-8?B?eXpxZjBVcmFlVFIxbnBpaGNINy9sVm1rK0FqalYyU09Pd0pSYm4vNkJBUlg3?=
 =?utf-8?B?ZkR0UTUvUEV4RzNrVkk2Ynl2MEh3K1ZKMlJUZHM0MVIwQWZrbFB1bmpKMmVz?=
 =?utf-8?B?RFl2RjFwL3NnNVVhRHUwSExMWU5FMXBJdWUrUHFLVXJBOFZGTFJyQVk1UzZt?=
 =?utf-8?B?QmJjUmtUSXhGT01BWHBFK0F1OGNBZUVmaWplSXp5MElzK2RGTVZSQVZKTWZU?=
 =?utf-8?B?eEY1amhrQVFZdUxweEJ6Y21zbGVQRmFsS2lmbStRNFNsODkveVR5eXZXeS9O?=
 =?utf-8?B?OVJzUE12MFRXQjlMWU5xazlCN21GVjd5ZmNNK2s4STNsZmFoOHRYWUJHYjU5?=
 =?utf-8?B?NlhKTkpGb3hrdThYR0FZYTFPNFkxZHBNdXlRSlFCRENsUlZWVWxldzQ4SXA2?=
 =?utf-8?B?R2QzQjNqdnZYUmorZEN6SGNRQXhua1dodlhaUU8rZ0NKNUFzNk5uSlJ3NElk?=
 =?utf-8?B?OXU4a1k3aGl1T01abDJvcGhFOWprMllvL0Vvd2tpSGM5VThJTWlQc3hoOWxE?=
 =?utf-8?B?UVRISDRxUVJHaFVPMFA3ZkRrdlllbDdab3VJclpObzA5R3NuOXFIN2MvS1VO?=
 =?utf-8?B?VXlYdkVjSGFPMHVRRlM3a21kcjBsYzBDbEJTTldLbEdJV0VGRi9salo3UklQ?=
 =?utf-8?B?Y0premxDUUlZS3d0RkY0bDlOMjAxSE9rNWVhL3RCcjlzc2pWZXI1UDRoL2pq?=
 =?utf-8?B?Vnp2MFJNQlgxZU1aaXlmbnlmckJjSFgxSzc3aEN2ekhKYVp2OHM5NlY5NXNU?=
 =?utf-8?B?ZTB5NkQwVXRHcTJOSEV2SnhwcmV2MGJiNHg3b29PT1ViRkRaNW8yNTdhcU5E?=
 =?utf-8?B?WUJZQ3Y0SnpsTU9KczAyd3V2M3FzMmttRmdlejRmWXZ5ZXFvQWMwWXZtNmFs?=
 =?utf-8?B?cHV1KzhILzViRTdhZFd5UzNBWG4zbWhBWVdNNjhQb0RDNHBHRUdVQ3RweVNH?=
 =?utf-8?B?M3RNOHpmVlJtRm9qMWd4Y2thS2VwSGE1a2U3N2l3QTBObWFjRklBb2VxUVRE?=
 =?utf-8?B?azVmOGtzcUcveHNKTkJHUXRaNXZMaXRGUCtYNGR4ekZTdjdXRStid1N6Smps?=
 =?utf-8?B?blVQTjNpQXFmMWdVMC9lRE1KR01uL2srVUZHS2RLNHEwNk9vV1BpVHB3NjBE?=
 =?utf-8?B?elY5bnVyMEg2ajU1S0VIV0xZNUNvaUFpNXo0WkZYbTNIZEgvZnp3SSt3YS9W?=
 =?utf-8?B?YnZjVTZNSEpObmJYcUpQbk9GU3M3Y1N2OFBsSWlaVnBpSlU5d2swM2czUWZt?=
 =?utf-8?B?R2R4SXFER211MlJFQm1PSzRaVnRZNlc5ZzhrdTlhUXI0Zmlma3l4NGVKem9X?=
 =?utf-8?Q?ICSljvlPil3Kdqasx/RFub+rgMpJ/arhLv+kRcW?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77fca30b-4033-404e-372e-08d9335f3a47
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2021 20:17:14.4123 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y8cijQr7jW3BHDyWOZ4kc8L8hdUyuberRKHEXQnOzRBYk7eK7PzOWtl1igrwJBJbS3nfADUHSqiasZ3+WTqKced3HVfpr6Ow+ZuFvZPLISc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2611
Received-SPF: pass client-ip=40.107.3.94;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.202, RCVD_IN_DNSWL_NONE=-0.0001,
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

19.06.2021 15:21, Vladimir Sementsov-Ogievskiy wrote:
> 14.06.2021 11:17, Emanuele Giuseppe Esposito wrote:
>>
>>
>> On 14/06/2021 10:11, Emanuele Giuseppe Esposito wrote:
>>> This serie of patches bring thread safety to the smaller APIs used by
>>> block-copy, namely ratelimit, progressmeter, co-shared-resource
>>> and aiotask.
>>> The end goal is to reduce the usage of AioContexlock in block-copy,
>>> by introducing smaller granularity locks thus on making the block layer
>>> thread safe.
>>>
>>> What's missing for block-copy to be fully thread-safe is fixing
>>> the CoSleep API to allow cross-thread sleep and wakeup.
>>> Paolo is working on it and will post the patches once his new
>>> CoSleep API is accepted.
>>>
>>> Patches 1-3 work on ratelimit, 4 covers progressmeter and
>>> 5 co-shared-resources.
>>>
>>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>>> ---
>>> v3:
>>> * Rebase on current master (had conflicts in block-copy), remove based-on in
>>>    cover letter
>>
>> Hi Kevin & Max,
>>
>> I think this series ha been reviewed and I just rebased it to current master. Can you give it a look and let me know if it can be merged?
>>
>> Thank you,
>> Emanuele
> 
> 
> I think, I can queue it myself as a block-job series. ratelimit and progressmeter are not mentioned in Block Jobs sections of MAINTAINERS, but actually these APIs used only by block-jobs.
> 
> I remember, Stefan had a complain against patch 5 and against general design of adding mutex to every structure.. Stefan, what do you think now? Paolo, is this v3 OK for you?
> 
> If everybody silent, I don't see a reason to slow down these series anymore and will make a pull request on Tuesday.
> 

Hmm, actually, I'll wait for final version of "[PATCH v4 0/6] block-copy: protect block-copy internal structures" which seems to be close, to pull them together.


-- 
Best regards,
Vladimir

