Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B329E6D5872
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 08:09:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjZpf-0003aw-2S; Tue, 04 Apr 2023 02:07:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pjZpb-0003YV-Hi
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 02:07:47 -0400
Received: from mail-co1nam11on20610.outbound.protection.outlook.com
 ([2a01:111:f400:7eab::610]
 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pjZpZ-00011p-IL
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 02:07:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nnbsYpkWizSkOurdojLjBZwUsq3Nf2QA1Efq8WU2ysWXYDI3pvc5HXYFTYII3X662Vb4zECxnTJa7ly/2TaDMSYQFMrf6CJmU6Xna8sgAOkfLMofGLhbz+41SBdERplsHHKXEfdgO4c1MKv8BRYdJili4VT4tHWXG+mWnSStNQQ1ig0it8z8h8cOBw0qHr1NWqEWgOrte0ax8RQNTVIunrHKoBsHCE8kXTzEF+pkoBn6gI9tTU9WUDacTOwaB+Y2SskDwo5mCXqFx6ALBiOPmBTMIZMpwDuzcnmTUTcFmQuqpYqYykSm0beNG9R33++vKE+iwCtj50LAdkIEnyu/yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=02ij0e2tcYGnmzf18jdogx+iIDSF5Y0lRB0UE4JMJ04=;
 b=ky2u2UdVuXTDolAOfXfPIwuWwIxJlZ1jkTHg73S8Md7d4BA7Eafjf4cqNCMr9Mbmi8QrlirhApk3lE1JVTA7ttZJL1+/h2P1GZ/X2/HukdpZFVAeUr3z9VzraghEAlaLYYz+vd4m2LbbOj9RVmGJN/O79NhRoQ5xdhIDz8M0sIwSfCz3KC47LLAgayUFXXqANBCUjCIbH3an1weM1qrVdHCfaCM29YJElyeGcqApSaYHanXZhv4mdM4Q6DI/bwVDUOx3oOriCuXpUO+ArCRn2KM1LfLh0cF5OeUCkXY4IArdncjPcg1bdyiTT9Ta8zHF1xT/GDHuNKV522RDlcOfaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=02ij0e2tcYGnmzf18jdogx+iIDSF5Y0lRB0UE4JMJ04=;
 b=OUQRiVgRQxWQ81gy6bHeNiLTiv+t3XhIBzkEmWpDqdZptWY2kMObiH8crq7cWGhSImFvGAGdZCquuS75IQXAr6BMeTlhs/2uhRWzW+uf7dc/An+g2Ah6WG9AA0MjIusqcG5jN6+ico6mzuUshqOQaDhN0P5jutowe0kY8epf7LPrzh6KvP0Fo+J4ZCONKBogagA4E8bp7tPiqE3vuH0FTd+batQa9VSjef+xXar6oAjphDBTBZjs6bj/JLNV7BSXVjH9GDrkfmL9hYg4HvUIvnyMKjsuWaKmCsMHm7oIuxT4HictSjlVF20ZvhrcS2NEkHu4gvD3CYa7ILCMt1FHgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB5544.namprd12.prod.outlook.com (2603:10b6:a03:1d9::22)
 by CY8PR12MB7242.namprd12.prod.outlook.com (2603:10b6:930:59::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Tue, 4 Apr
 2023 06:07:38 +0000
Received: from BY5PR12MB5544.namprd12.prod.outlook.com
 ([fe80::423c:5fb4:a0f0:e918]) by BY5PR12MB5544.namprd12.prod.outlook.com
 ([fe80::423c:5fb4:a0f0:e918%8]) with mapi id 15.20.6254.034; Tue, 4 Apr 2023
 06:07:37 +0000
Message-ID: <f6c26122-83bf-7bd2-6d13-dd1b2a136cb7@nvidia.com>
Date: Tue, 4 Apr 2023 09:07:30 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] vfio/migration: Skip log_sync during migration SETUP state
To: Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
Cc: qemu-devel@nongnu.org, Keqian Zhu <zhukeqian1@huawei.com>,
 Joao Martins <joao.m.martins@oracle.com>
References: <20230403130000.6422-1-avihaih@nvidia.com>
 <bebd7827-1d72-9572-ea1a-d41d8b856dbe@redhat.com>
 <20230403153633.1aeeceec.alex.williamson@redhat.com>
Content-Language: en-US
From: Avihai Horon <avihaih@nvidia.com>
In-Reply-To: <20230403153633.1aeeceec.alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PA7P264CA0084.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:349::8) To BY5PR12MB5544.namprd12.prod.outlook.com
 (2603:10b6:a03:1d9::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB5544:EE_|CY8PR12MB7242:EE_
X-MS-Office365-Filtering-Correlation-Id: f7fc448c-7dc0-406e-78a2-08db34d2e3cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VO7bq4rJ9jZwrb5enZx71u5GGGUqviBVQo/2+g3HMu3WnAt+DYY6zOMWDA4pPX6ZlhOMtCCRImJM+Of4pxKwlimgkkEF3PIeayhkoI/pnF1q7mfCOq6Wb0KB8+j3PQO2f/yagXPVJvSkGF09fujQOmR936G5YDCxhzJ/UKHikmRh3WuIFLvqm6I7oEHtClM2Thsfy3FvpJUU8/oejbcuXTkL5qodt5hFz2wmVbSVXYVarhAXMExCrLuO3fPZFnGfTHGgpzXGpGlMVX5ZtDKYnx3Htz3IbPFGsJyu6kf6XnspJeu39PJW7FonmcMXH965GiV33dvE0xGZPi+KTnCky26OIZh7QD65cV1UmTnBbTsRrzD+iiYXSkW4Z9TxbDTqKoPUaC1t3wSLMdo51Omou6tA/vokwrcB//MnrnxvM5bgPtdi5m4o2Wz8N3cwL3RU2sbiIAvXYvzjjjAKlfTxt6K38Qi6+kEWXgQM8XNhwnel3Z71KUG10E3yliBijq7aaKjTIM4rLlbWyI79p8olM+BF9+dusKAZxeRhKxj9SVSmN+BN07HVxash2qDqwqvHj97W8i22+uq7HKOcJ/LLjZWBrbhBg4ptjF61heHqhpqTXVynC1ubBbvhZKsGALPG3P22diV/QsMFLimYs6fndw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB5544.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(376002)(366004)(346002)(396003)(39860400002)(451199021)(36756003)(4326008)(54906003)(110136005)(8676002)(66476007)(316002)(66946007)(66556008)(6486002)(6666004)(478600001)(8936002)(5660300002)(41300700001)(2906002)(86362001)(31696002)(38100700002)(2616005)(186003)(6512007)(26005)(6506007)(53546011)(83380400001)(66574015)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3BacGZid1lteFdmUWFqdHpRTDBUdk8zdFpkVnU3citSVFpXWW4ydnBBRGow?=
 =?utf-8?B?eXF1NTRvdytQMW9EeTM0SUxJYlVoaUpuby9lZUxXQUczOU5KV0lZTDA0SmNW?=
 =?utf-8?B?Y2twU001MFJjZ2ZnRjdmbDRONEJjQ3B6YUZSSzZpb2hkRnhhMWErVU9Wc1pX?=
 =?utf-8?B?eklpR2l0VStyNDI2emxxWUpWMFNMZVRWeFR1UEFpRWJMQmRmcnVZSFhMQWpY?=
 =?utf-8?B?NTd4YnloanZQYjJMS1lVSCtLemFWRlJSa2FuUmdQRTRtQnpWcDRGUmtBVmxa?=
 =?utf-8?B?TjBsblVqclpUSGJ5V25XNzVWYVZteEFXQUI4cE0zYW8xR0xxQVBqcFp0ZUtz?=
 =?utf-8?B?c1pVWW5VdVBIM2FWOXVWRHJQQllSeWFBWlh3RHk2NkxmeldOaFY0RXlmTkx4?=
 =?utf-8?B?S0FCeVEvMDZLdVBkTC80LzFzNzFPWTE4b0RnVHlkWElaN0g5b3Mwa2VGbGdM?=
 =?utf-8?B?dU1pN290S21MTm9RTi9nRStzSjZWSy84dmQwdWI1VDA0dUE1aTlRUDJhclFJ?=
 =?utf-8?B?WXpOLzNSbmluc28xaW45UmZaYUV1bnZCWjVrME94cWRveFNneUVOUjVzdU9H?=
 =?utf-8?B?YnJNVmZuL004TlNaZFM3WHp6Yk1RenpMZXgrUWk3RDlCRG9aQ0dDRkNyUFR5?=
 =?utf-8?B?NytOKzdma2pHOGYxU3l5ZE1nUjBGTUR0Y0xIVDJ5bHpJWUhSQk92eFZjeTg0?=
 =?utf-8?B?K052NmxBU2IrVFoyZUZNUUZGc0V4TVNPdlRFdFBQN2l6R0RHa2FrYjJFMlBj?=
 =?utf-8?B?aDlIWTZHVFF2RHJCeXIyakFwc3FtRmJwaEJVN0QyU3VDd1lzeWNYKzVJVGdZ?=
 =?utf-8?B?VVlvRHRBR3ExcGFyWndVL1p5TlI1MkJCdzJ1ZStGZzU1eDJjVUl1SVBwK1c0?=
 =?utf-8?B?ajFRNTE5ek1xOXlwV0NwWE4waGdIK3ZTY1dGU0RyRjVmYkJIOTErbHNLUVB4?=
 =?utf-8?B?Q2FGZzZIbGI4bVhYNlhHbEQ5blVOeW5RZ0hmR0VZQ1ZGd1FmVlZuTmx4ZTh1?=
 =?utf-8?B?QXl2R0VKYnRWS2ozeGgvb3Rwc2FLMXFVMklUY0N2a3BCOC9Xa3ozMGFUY2Z5?=
 =?utf-8?B?WEMwL1NCeUNZWWwrMlhKSHVwYWIzSkU2MFFRek00bVFIV20rKzRtTStnTlpj?=
 =?utf-8?B?ZkFHc3EyN1FnMlh3M0lXa0lQSlVMSTJraGxLUTFtdTdsc3dHRkFEMEtybEJN?=
 =?utf-8?B?ZVdZUE5acnRUdDVsRVBoLys5M2hsN3VLaUZJUThtMzNjME1VTUVGc0VyeENh?=
 =?utf-8?B?aUpJcEhuWDg4NE52UjFIWm1BMlNxWWNLYmdlMHdnWGIxTkpDYkR0SVI1RlE5?=
 =?utf-8?B?NCszckMzZ0JBa0U0T3RCSCtDcE1Bdk9HT1lvaXd6WlBzYlo2VlpRcnZVWjlN?=
 =?utf-8?B?WE1xd0Q4RjFFVHpuTDg2NVFQaXFUdHY1WXVsamlMMWpwc0tQSWcvUW04akFD?=
 =?utf-8?B?K1U1b05pTmEvemFpS082Wkw5MlFMOUE2dGxhR21Rbkc0aFVLM1hvejA1dlpk?=
 =?utf-8?B?RnE1RHdFWkVZcUdKMWpHRzFZWGgzc0lDNDNLZDJqcDY3SGU1eFBpaVU2eml0?=
 =?utf-8?B?Z3FSSjk1UHJYZHd3WGJuTWRzT0FsMDVjOFRlZkNhdWJtOVNMUlBnelU4NFRh?=
 =?utf-8?B?M2JDZDcwZzFhR2VocW5sZVNuSXNMUXZUTGlUWG9wZGdFNTJSZUYvUjNmcEVj?=
 =?utf-8?B?cjA2ZTJ4YTI1OExGaDExWWhYam1Ec0VQLzA2RG5ISTQ4eUhhazlZc1dBWFdN?=
 =?utf-8?B?andybDB0RXVEZWxuZWhIMWZXTEhUOTBJYzZsTDlzcHFHbU03Z3E3d3FxOEEx?=
 =?utf-8?B?a2doSWc5SmN3MTVCVXNrSlVWLzRBaHFDcFZGQjlFRWhJbm5MZVN1R0k4Qllq?=
 =?utf-8?B?aVdUUkxsNEx5VTErQUhGVmtGT1g0RVd0Q21tTU1zUkNXYjFpVWw0c1BvWGJt?=
 =?utf-8?B?UWdHb2NWSVAvYTBQS0xyRTlFMFpqNmxUWHZ2UFo3S0o1Q1NBSVZTK3FOcSti?=
 =?utf-8?B?UU5VMkQ1L3RXc0NYQ3N2ZmJyMDNzQkdzSEFhY0RKM245M0ZvZktpdmhHcU5u?=
 =?utf-8?B?amtpUlJTVVBabTQ3Z2d3ZGZQSVB1cXhwSVJOT0paSEF0clhLZmwxUmp0UUNT?=
 =?utf-8?Q?6fSvPauH1Y+Vrh9H36/PQyBc9?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7fc448c-7dc0-406e-78a2-08db34d2e3cd
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB5544.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 06:07:37.5883 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GsSw2l+MTMo2j1Uticd4n6WMm5y6O7mWXI714J6OceNShpVnogaZv/srUVu9Ka1WFylUS/NcbuH3yjnUTCwX3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7242
Received-SPF: softfail client-ip=2a01:111:f400:7eab::610;
 envelope-from=avihaih@nvidia.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.349, SPF_HELO_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


On 04/04/2023 0:36, Alex Williamson wrote:
> External email: Use caution opening links or attachments
>
>
> On Mon, 3 Apr 2023 22:36:42 +0200
> Cédric Le Goater <clg@redhat.com> wrote:
>
>> On 4/3/23 15:00, Avihai Horon wrote:
>>> Currently, VFIO log_sync can be issued while migration is in SETUP
>>> state. However, doing this log_sync is at best redundant and at worst
>>> can fail.
>>>
>>> Redundant -- all RAM is marked dirty in migration SETUP state and is
>>> transferred only after migration is set to ACTIVE state, so doing
>>> log_sync during migration SETUP is pointless.
>>>
>>> Can fail -- there is a time window, between setting migration state to
>>> SETUP and starting dirty tracking by RAM save_live_setup handler, during
>>> which dirty tracking is still not started. Any VFIO log_sync call that
>>> is issued during this time window will fail. For example, this error can
>>> be triggered by migrating a VM when a GUI is active, which constantly
>>> calls log_sync.
>>>
>>> Fix it by skipping VFIO log_sync while migration is in SETUP state.
>>>
>>> Fixes: 758b96b61d5c ("vfio/migrate: Move switch of dirty tracking into vfio_memory_listener")
>>> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
>> migration is still experimental, so this can wait 8.1. Correct me if not.
> Agreed, this doesn't seem nearly catastrophic enough as an experimental
> feature that it can't wait for the 8.1 devel cycle to open.

Sure, so let's wait for 8.1 cycle to open.

Thanks!

>>> ---
>>>    hw/vfio/common.c | 3 ++-
>>>    1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
>>> index 4d01ea3515..78358ede27 100644
>>> --- a/hw/vfio/common.c
>>> +++ b/hw/vfio/common.c
>>> @@ -478,7 +478,8 @@ static bool vfio_devices_all_dirty_tracking(VFIOContainer *container)
>>>        VFIODevice *vbasedev;
>>>        MigrationState *ms = migrate_get_current();
>>>
>>> -    if (!migration_is_setup_or_active(ms->state)) {
>>> +    if (ms->state != MIGRATION_STATUS_ACTIVE &&
>>> +        ms->state != MIGRATION_STATUS_DEVICE) {
>>>            return false;
>>>        }
>>>

