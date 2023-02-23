Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C63B66A0CD6
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 16:25:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVDTQ-00063p-8j; Thu, 23 Feb 2023 10:25:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pVDTN-000600-Ma
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 10:25:29 -0500
Received: from mail-dm6nam12on20624.outbound.protection.outlook.com
 ([2a01:111:f400:fe59::624]
 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pVDTK-0002Fn-0m
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 10:25:29 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YTNTSdXCS9bgkoQlj5XTwdshJzE+izCxoh2Qvw9ldQBqE0O3cGYUaPFogyUno3Bp2Iv6rP41pZyEoojPKk8FhRuquQN2M+IDZKoX1iHm+0TnVAH7EkyQHLF23N9HZg1ItZdJbaRlAe90XmnOLv+havPse8RPE/Rn3Aus2h/KD4uVTiqXJjLvGAIsJHiOCRVluzIDAsaBJWYnj3H/xEkZWJZlkebjiG5pCmltr4lOQkkiIrWdgfHZnopyRd6Dg8oi7KSik3gP9aFZFNfCSKwjI1mrhTKD/fN+KjNYvoMAROBtdtO27loHv+dQCH9qf/ysvb0fnU0BvU6FmIfrbeJu/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0RMNuiw/WIrEWnwR9g53jXuAnlgE4B31ltYTk7lv/Ws=;
 b=Ktb6ztKZFqorCZ/1RkI8f/friJ4IZiR1czGLCVQ8Y5dgOlQqDmJN1iEyPb2aTmawxGdri7xVpXnAo+9vsesfTV1lGQvTOEjQCpiMErc60F/W7ZoFRA5M/2wJyrtZ7CZ2vOiEapVEgnAW06MwilZvZWP41vN1VUvIWCRi9aziSEm6OiUPU2qMAafjP1bC4f7BiRZ/18AMNFRpYARBqWkhER1dJ5uuuYZe44XffQVrhzpH9syGI9rCHpp4KFVGcvVDbsOzzkFojRER89ZBvQfJbUpxZuDtWZBQPY2o6bf/2l0ZmgAbTVG9R6KRm3Zr8LESS6yCGNpUIEQDdYMqaAXORA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0RMNuiw/WIrEWnwR9g53jXuAnlgE4B31ltYTk7lv/Ws=;
 b=pisu52uqZL2JYUCRaMB3+j/DlIfpq9V9qCJvJ9kLzB7HhjWBoOh/D4NYXCxFBUNcQwR16Hb71emvFQxgvxgAux3FElrIduiWD6PdG0Q7vhRDpPUOgd8VoM6BEBfk4gkLbr/JnvEN/lRSgqxEHipQzcIQOvDlbKGZH23FRDN1FMtHmtUCwUCkJPXgtU2cQoQGc1VO6wK6wEDWezcKYkbH6lO17tzTyek9o/byPfEN5TIbQIpDBOFOIkGDaawpJkbwuxrzgJ1MCvr9qXInIf8YGExT1EJhE/dNeMadTOp0pffkDw3Htju3ax7Tg7ujaSOBmCbGIrA2Ow8fKJkYzPon9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB5549.namprd12.prod.outlook.com (2603:10b6:5:209::13)
 by IA1PR12MB6067.namprd12.prod.outlook.com (2603:10b6:208:3ed::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Thu, 23 Feb
 2023 15:25:21 +0000
Received: from DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::b980:cd87:77f2:3fbb]) by DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::b980:cd87:77f2:3fbb%3]) with mapi id 15.20.6134.021; Thu, 23 Feb 2023
 15:25:21 +0000
Message-ID: <38bdb26f-08d7-fe11-9a97-ebcc95c82254@nvidia.com>
Date: Thu, 23 Feb 2023 17:25:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 03/20] vfio/migration: Add VFIO migration pre-copy
 support
Content-Language: en-US
To: Alex Williamson <alex.williamson@redhat.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
References: <20230222174915.5647-1-avihaih@nvidia.com>
 <20230222174915.5647-4-avihaih@nvidia.com>
 <20230222135811.705b85b7.alex.williamson@redhat.com>
From: Avihai Horon <avihaih@nvidia.com>
In-Reply-To: <20230222135811.705b85b7.alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0423.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::14) To DM6PR12MB5549.namprd12.prod.outlook.com
 (2603:10b6:5:209::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB5549:EE_|IA1PR12MB6067:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f4f92e0-4ddc-44d9-688e-08db15b22d49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oLxrzU7v7LpOvCfxv11rXigGKfiUNwrWr4gaSe5SH3K4tn8nwKdMcy684G7U88JSxVOU9Tq77aof9usNlgNOMqM6XvfO1+CnzmZd2JW7pUMR5x7+Ny+ENRYUjBBq0DN42JtdSCKXm/7EMtCfHQTrAWqM9X9KWwo3ZHbgnQNkp/wncMiDDvAVCwqHMNpLd6n22A1GE42jtBzc/dBo8OS3k8QQ1ksFUHbG1Ipn+5gg1Fn233hrLbWRt8AJM8v07pjv0yQXoXWlzPvyNtzQDs9/VQqFfGdWiPBUdip07LTkRW5dtFIIG3ayxwv60P3tOVBxHTNjl1s5odSmjqdKE8oo7G6btwZ3NIw9aCR57g7lpUYnnZdtVbyDzYiZ4iI6XtRbwcXXQfBuCyv8i2NYAWoW3Ta74RJ1rfPcYfRKt/m7+OmRUC04vnGL5i66zRrMCcql6Mxp6hZuLlrGm/AqdzV1Ezi7/0xXrEvIRMjXBfXmC0xM+75Ld6nKDpadAPihkdv0tJycLfy1EwHflwQXZA5K79PQv8bzacEt+egk/lm8Djsm+qnJGlHcIUcpxSVY/grHhyygP8PJYlsi8Lqx33teceAhBHgJ1HAgg0ksnhb3th96JNdPDBImzqg010aK67X9Law5koOgJWz/dN3CdoJip+2XXPGwiaape39VQjJpHVd8txqdl9j8IVBgWfEu50dS736NGYUi8XKy8tttGmPHWUZKVAmfGRR66GoMfbAEDX+xRsUt4W/tmhaubPbhA6p7nhiCFQJEwTnpvIbbup3jkQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5549.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(346002)(136003)(376002)(366004)(396003)(451199018)(6666004)(86362001)(83380400001)(316002)(54906003)(478600001)(31696002)(2616005)(6486002)(6512007)(31686004)(38100700002)(6506007)(26005)(966005)(186003)(66946007)(66556008)(4326008)(66476007)(8676002)(5660300002)(30864003)(7416002)(2906002)(6916009)(8936002)(36756003)(41300700001)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ejZZMlBIYlQzK2MzSnNFYnN2cUUzbFJZZ1p1VTU3Y2xTRFM0UVNDcEU2RnBM?=
 =?utf-8?B?MkI4am9FZE43N1FXd3lGWThYem5YK2ZrZk5YZVJ1Z3k4bUdxeDFxMDlRTXZX?=
 =?utf-8?B?a09zVnk1WUpSTytES1o1TzBGSUV3TmRxRUJHYmlMNUxGZDdGTmQwTUJkcDM4?=
 =?utf-8?B?S3V1Y0RTNUxacXJ5bEFMdUFuVmNyN2gySzdrUDNydnh2SFV1cW1YY1h0UDJa?=
 =?utf-8?B?UmJSSldZbzVBckhvVHlXZ2UweC9ZS1Ftb3dhZkRWa21nZVdwSzRKcE5aVmRw?=
 =?utf-8?B?MFNQUzVLK2tiRWMydWlwVG51cUVnVDhxOFJmUmw5dEtIVkI5YkloY2MzUlJO?=
 =?utf-8?B?YmlhMDhrWStXK1VjVG8rbm5EOGMwekxYOU1HcDVvKzk4N0JHNVpHNE1abHpF?=
 =?utf-8?B?S1dOblJYV0l4RUpsYU9lNmJvTlZWMWxZWmtXcmhIcVU0SGVkL1NBL0kxa3lV?=
 =?utf-8?B?eFkrNUgrSHIzNGEvR1ZtNndvb0lwNnJrN0pYV0tmOUxlWVhaUmZsVmc1N2Vy?=
 =?utf-8?B?Zkk3cTcvY2NRZ1FIYWlTNWdQcFQ2KzhXNktYYTMzbDdBOXltVFdMQ0xNYUc1?=
 =?utf-8?B?VEtYamkzUjlyWWVIRkZob3VwZllyeE9IY0VDVW5SVXd1RnFYR0FvK1RMbExX?=
 =?utf-8?B?eDlJSzhScWhraTVEVnNlZkE1UzFUS2thVjhOY2dvOHZzYUVGZk9BUkJQcW5X?=
 =?utf-8?B?TzVIdHlEMFZ4bzFINmlNdDJOajI2c2t5Qjh5dXE2b25hb1NKc2htQkJZdDAw?=
 =?utf-8?B?NjY2Z0h1Q1VTdzJmRFY0TVF1azhxK28zTXVhNWxsbXREUkkwd1cxT1ZVT1Vo?=
 =?utf-8?B?TGRKWUNnano3eURjRlJVZmN0YWVQckg1eTBGVU53Vm9sZnFXaVNzQStKWDlP?=
 =?utf-8?B?eXpEOVJrY1k3QWd2OUZFMDd0Y3hjNXhLc1d1MGh4SHJqdnJMbTVUNE9IbFZS?=
 =?utf-8?B?Kzl6dWxuTkJTNVF4OTdyYmZwWE8zVDlXZ1pSald2SWQ5bm5EcGJJSXczYmpl?=
 =?utf-8?B?dnRmYmg4dUo5VlRMNEVVbmdIdXJNS2NZRDNYSGx2T2hiaHFuQms1MHZLY0Yw?=
 =?utf-8?B?SFM3bHBZTUR4T0FQbm9GcEpsYW5Sd0pzWC81M1g1b3BpcWZObW5kVlJ5am11?=
 =?utf-8?B?UzlxZXhqQ2RHK1J3ZE5ZUElkbWt2QncvSkJIQ3VpK2dkSTFuVzBvbzRRZnFF?=
 =?utf-8?B?YzRVMml2ZEJJNGJTM0E5Mjg1Y0pGRkRLZHVHUkF2NGRZN3AxYlJ1NDJsak51?=
 =?utf-8?B?bjl0T1NpRUVPb0w0Y1BPYTIwKzlvSFo4Ti94ckhBLy8yd3JFUHdFWEZqMEhq?=
 =?utf-8?B?WTU0YlJWcnpnWFhnNjVNUFVrdVZVdTI5YkxSNDZRQjVFZUswNENucjU5SDc3?=
 =?utf-8?B?ZkNUYUxCZXJPVTJLb1VrQ0E5ZVcyRndtbHYvV1ZFaDlUc3lTSGhJcHo2d3Zl?=
 =?utf-8?B?MVR3TU5IQURRdkJqR3JTZ1NYNklWRkdXb2l3cmVMVXMrTHpsako2K1ltVzhw?=
 =?utf-8?B?b3FzVHFPL25JRll2THJibTQySlRib3BtUTZ6RU1VUVlaYXF6SlA2SGlhNE5a?=
 =?utf-8?B?Ykc1dnJDUlVNMDZNVXFVbTR0dW1JRHpheStiQmVTbXF6WjdHRzVrK1hrb3FT?=
 =?utf-8?B?ZG96MW5BUm10eTUxSmFVTXpWWFM4dFVLOGVNWFEyQzRic2o4WGhRdElmbms2?=
 =?utf-8?B?YWJhUjlTMkw1T1ZtR3UvbjZGRG01NDVrR0lsL0RKeStWdS9TZHVaV0ljQ25p?=
 =?utf-8?B?N2FUOC9KckYwQ0doNmZ6d2NDUXNsdkRCZk9KcnBtZXB6N2FyKzVCdEJja3M1?=
 =?utf-8?B?VTdsaVZ2U0Jqc25MaCtPb1BQK3Nnclk3QWMzT2svWUR5RkNxd1Q0Tm4zL3Z3?=
 =?utf-8?B?dXpLaEF4OUFVMUo0eUcvUmZnZDhQQTg1bU5iUkNNUHVObG5hQjdvU2dVQVB1?=
 =?utf-8?B?MmJSc0FzYUFKTUFzRTRGQ3M1ZTBLSUdDQUdjR1ZqVjNZWXp4clduQ3JWZCtG?=
 =?utf-8?B?N0RJTkh3WXVuZ2pOK3RBOTZWZ1ZEM3l6b1BNWmoxaGZyNFNXZ1M0ZENtcHM0?=
 =?utf-8?B?dk1Vd2ZDSUpCVGJHVngvK2RURG5CZ3FUVGZoZVE0RFU0Y3V5SHg4d3YrMEda?=
 =?utf-8?Q?x5vb5iEsoYPfTufXX9QEbhvUv?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f4f92e0-4ddc-44d9-688e-08db15b22d49
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5549.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2023 15:25:21.3547 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YHJDwx0uGGFG3aXKV2+a6xn1RANxVVtUs2oMWDv3i4eJslJy7hpJJBZkjWLRHAsAt4JAa3c1tYTLfMyr5dRi5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6067
Received-SPF: softfail client-ip=2a01:111:f400:fe59::624;
 envelope-from=avihaih@nvidia.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, SPF_HELO_PASS=-0.001,
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


On 22/02/2023 22:58, Alex Williamson wrote:
> External email: Use caution opening links or attachments
>
>
> On Wed, 22 Feb 2023 19:48:58 +0200
> Avihai Horon <avihaih@nvidia.com> wrote:
>
>> Pre-copy support allows the VFIO device data to be transferred while the
>> VM is running. This helps to accommodate VFIO devices that have a large
>> amount of data that needs to be transferred, and it can reduce migration
>> downtime.
>>
>> Pre-copy support is optional in VFIO migration protocol v2.
>> Implement pre-copy of VFIO migration protocol v2 and use it for devices
>> that support it. Full description of it can be found here [1].
>>
>> [1]
>> https://lore.kernel.org/kvm/20221206083438.37807-3-yishaih@nvidia.com/
>>
>> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
>> ---
>>   docs/devel/vfio-migration.rst |  35 +++++--
>>   include/hw/vfio/vfio-common.h |   3 +
>>   hw/vfio/common.c              |   6 +-
>>   hw/vfio/migration.c           | 175 ++++++++++++++++++++++++++++++++--
>>   hw/vfio/trace-events          |   4 +-
>>   5 files changed, 201 insertions(+), 22 deletions(-)
>>
>> diff --git a/docs/devel/vfio-migration.rst b/docs/devel/vfio-migration.rst
>> index c214c73e28..ba80b9150d 100644
>> --- a/docs/devel/vfio-migration.rst
>> +++ b/docs/devel/vfio-migration.rst
>> @@ -7,12 +7,14 @@ the guest is running on source host and restoring this saved state on the
>>   destination host. This document details how saving and restoring of VFIO
>>   devices is done in QEMU.
>>
>> -Migration of VFIO devices currently consists of a single stop-and-copy phase.
>> -During the stop-and-copy phase the guest is stopped and the entire VFIO device
>> -data is transferred to the destination.
>> -
>> -The pre-copy phase of migration is currently not supported for VFIO devices.
>> -Support for VFIO pre-copy will be added later on.
>> +Migration of VFIO devices consists of two phases: the optional pre-copy phase,
>> +and the stop-and-copy phase. The pre-copy phase is iterative and allows to
>> +accommodate VFIO devices that have a large amount of data that needs to be
>> +transferred. The iterative pre-copy phase of migration allows for the guest to
>> +continue whilst the VFIO device state is transferred to the destination, this
>> +helps to reduce the total downtime of the VM. VFIO devices can choose to skip
>> +the pre-copy phase of migration by not reporting the VFIO_MIGRATION_PRE_COPY
>> +flag in VFIO_DEVICE_FEATURE_MIGRATION ioctl.
> Or alternatively for the last sentence,
>
>    VFIO devices opt-in to pre-copy support by reporting the
>    VFIO_MIGRATION_PRE_COPY flag in the VFIO_DEVICE_FEATURE_MIGRATION
>    ioctl.

Sounds good, I will change it.

>
>>   Note that currently VFIO migration is supported only for a single device. This
>>   is due to VFIO migration's lack of P2P support. However, P2P support is planned
>> @@ -29,10 +31,20 @@ VFIO implements the device hooks for the iterative approach as follows:
>>   * A ``load_setup`` function that sets the VFIO device on the destination in
>>     _RESUMING state.
>>
>> +* A ``state_pending_estimate`` function that reports an estimate of the
>> +  remaining pre-copy data that the vendor driver has yet to save for the VFIO
>> +  device.
>> +
>>   * A ``state_pending_exact`` function that reads pending_bytes from the vendor
>>     driver, which indicates the amount of data that the vendor driver has yet to
>>     save for the VFIO device.
>>
>> +* An ``is_active_iterate`` function that indicates ``save_live_iterate`` is
>> +  active only when the VFIO device is in pre-copy states.
>> +
>> +* A ``save_live_iterate`` function that reads the VFIO device's data from the
>> +  vendor driver during iterative pre-copy phase.
>> +
>>   * A ``save_state`` function to save the device config space if it is present.
>>
>>   * A ``save_live_complete_precopy`` function that sets the VFIO device in
>> @@ -95,8 +107,10 @@ Flow of state changes during Live migration
>>   ===========================================
>>
>>   Below is the flow of state change during live migration.
>> -The values in the brackets represent the VM state, the migration state, and
>> +The values in the parentheses represent the VM state, the migration state, and
>>   the VFIO device state, respectively.
>> +The text in the square brackets represents the flow if the VFIO device supports
>> +pre-copy.
>>
>>   Live migration save path
>>   ------------------------
>> @@ -108,11 +122,12 @@ Live migration save path
>>                                     |
>>                        migrate_init spawns migration_thread
>>                   Migration thread then calls each device's .save_setup()
>> -                       (RUNNING, _SETUP, _RUNNING)
>> +                  (RUNNING, _SETUP, _RUNNING [_PRE_COPY])
>>                                     |
>> -                      (RUNNING, _ACTIVE, _RUNNING)
>> -             If device is active, get pending_bytes by .state_pending_exact()
>> +                  (RUNNING, _ACTIVE, _RUNNING [_PRE_COPY])
>> +      If device is active, get pending_bytes by .state_pending_{estimate,exact}()
>>             If total pending_bytes >= threshold_size, call .save_live_iterate()
>> +                  [Data of VFIO device for pre-copy phase is copied]
>>           Iterate till total pending bytes converge and are less than threshold
>>                                     |
>>     On migration completion, vCPU stops and calls .save_live_complete_precopy for
>> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
>> index 87524c64a4..ee55d442b4 100644
>> --- a/include/hw/vfio/vfio-common.h
>> +++ b/include/hw/vfio/vfio-common.h
>> @@ -66,6 +66,9 @@ typedef struct VFIOMigration {
>>       int data_fd;
>>       void *data_buffer;
>>       size_t data_buffer_size;
>> +    uint64_t precopy_init_size;
>> +    uint64_t precopy_dirty_size;
> size_t?
>
>> +    uint64_t mig_flags;
>>   } VFIOMigration;
>>
>>   typedef struct VFIOAddressSpace {
>> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
>> index bab83c0e55..6f5afe9f5a 100644
>> --- a/hw/vfio/common.c
>> +++ b/hw/vfio/common.c
>> @@ -409,7 +409,8 @@ static bool vfio_devices_all_dirty_tracking(VFIOContainer *container)
>>               }
>>
>>               if (vbasedev->pre_copy_dirty_page_tracking == ON_OFF_AUTO_OFF &&
>> -                migration->device_state == VFIO_DEVICE_STATE_RUNNING) {
>> +                (migration->device_state == VFIO_DEVICE_STATE_RUNNING ||
>> +                 migration->device_state == VFIO_DEVICE_STATE_PRE_COPY)) {
>>                   return false;
>>               }
>>           }
>> @@ -438,7 +439,8 @@ static bool vfio_devices_all_running_and_mig_active(VFIOContainer *container)
>>                   return false;
>>               }
>>
>> -            if (migration->device_state == VFIO_DEVICE_STATE_RUNNING) {
>> +            if (migration->device_state == VFIO_DEVICE_STATE_RUNNING ||
>> +                migration->device_state == VFIO_DEVICE_STATE_PRE_COPY) {
>>                   continue;
>>               } else {
>>                   return false;
>> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
>> index 94a4df73d0..307983d57d 100644
>> --- a/hw/vfio/migration.c
>> +++ b/hw/vfio/migration.c
>> @@ -67,6 +67,8 @@ static const char *mig_state_to_str(enum vfio_device_mig_state state)
>>           return "STOP_COPY";
>>       case VFIO_DEVICE_STATE_RESUMING:
>>           return "RESUMING";
>> +    case VFIO_DEVICE_STATE_PRE_COPY:
>> +        return "PRE_COPY";
>>       default:
>>           return "UNKNOWN STATE";
>>       }
>> @@ -240,6 +242,23 @@ static int vfio_query_stop_copy_size(VFIODevice *vbasedev,
>>       return 0;
>>   }
>>
>> +static int vfio_query_precopy_size(VFIOMigration *migration,
>> +                                   uint64_t *init_size, uint64_t *dirty_size)
> size_t?  Seems like a concern throughout.

Yes, I will change it in all places.

>> +{
>> +    struct vfio_precopy_info precopy = {
>> +        .argsz = sizeof(precopy),
>> +    };
>> +
>> +    if (ioctl(migration->data_fd, VFIO_MIG_GET_PRECOPY_INFO, &precopy)) {
>> +        return -errno;
>> +    }
>> +
>> +    *init_size = precopy.initial_bytes;
>> +    *dirty_size = precopy.dirty_bytes;
>> +
>> +    return 0;
>> +}
>> +
>>   /* Returns the size of saved data on success and -errno on error */
>>   static ssize_t vfio_save_block(QEMUFile *f, VFIOMigration *migration)
>>   {
>> @@ -248,6 +267,11 @@ static ssize_t vfio_save_block(QEMUFile *f, VFIOMigration *migration)
>>       data_size = read(migration->data_fd, migration->data_buffer,
>>                        migration->data_buffer_size);
>>       if (data_size < 0) {
>> +        /* Pre-copy emptied all the device state for now */
>> +        if (errno == ENOMSG) {
>> +            return 0;
>> +        }
>> +
>>           return -errno;
>>       }
>>       if (data_size == 0) {
>> @@ -264,6 +288,31 @@ static ssize_t vfio_save_block(QEMUFile *f, VFIOMigration *migration)
>>       return qemu_file_get_error(f) ?: data_size;
>>   }
>>
>> +static void vfio_update_estimated_pending_data(VFIOMigration *migration,
>> +                                               uint64_t data_size)
>> +{
>> +    if (!data_size) {
>> +        /*
>> +         * Pre-copy emptied all the device state for now, update estimated sizes
>> +         * accordingly.
>> +         */
>> +        migration->precopy_init_size = 0;
>> +        migration->precopy_dirty_size = 0;
>> +
>> +        return;
>> +    }
>> +
>> +    if (migration->precopy_init_size) {
>> +        uint64_t init_size = MIN(migration->precopy_init_size, data_size);
>> +
>> +        migration->precopy_init_size -= init_size;
>> +        data_size -= init_size;
>> +    }
>> +
>> +    migration->precopy_dirty_size -= MIN(migration->precopy_dirty_size,
>> +                                         data_size);
>> +}
>> +
>>   /* ---------------------------------------------------------------------- */
>>
>>   static int vfio_save_setup(QEMUFile *f, void *opaque)
>> @@ -284,6 +333,35 @@ static int vfio_save_setup(QEMUFile *f, void *opaque)
>>           return -ENOMEM;
>>       }
>>
>> +    if (migration->mig_flags & VFIO_MIGRATION_PRE_COPY) {
>> +        uint64_t init_size = 0, dirty_size = 0;
>> +        int ret;
>> +
>> +        switch (migration->device_state) {
>> +        case VFIO_DEVICE_STATE_RUNNING:
>> +            ret = vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_PRE_COPY,
>> +                                           VFIO_DEVICE_STATE_RUNNING);
>> +            if (ret) {
>> +                return ret;
>> +            }
>> +
>> +            vfio_query_precopy_size(migration, &init_size, &dirty_size);
>> +            migration->precopy_init_size = init_size;
>> +            migration->precopy_dirty_size = dirty_size;
> Seems like we could do away with {init,dirty}_size, initialize
> migration->precopy_{init,dirty}_size before the switch, pass them
> directly to vfio_query_precopy_size() and remove all but the break from
> the case below.  But then that also suggests we could redefine
> vfio_query_precopy_size() to
>
> static int vfio_update_precopy_info(VFIOMigration *migration)
>
> which sets the fields directly since this is the only way it's used.

You are right, I will change it.

>> +
>> +            break;
>> +        case VFIO_DEVICE_STATE_STOP:
>> +            /* vfio_save_complete_precopy() will go to STOP_COPY */
>> +
>> +            migration->precopy_init_size = 0;
>> +            migration->precopy_dirty_size = 0;
>> +
>> +            break;
>> +        default:
>> +            return -EINVAL;
>> +        }
>> +    }
>> +
>>       trace_vfio_save_setup(vbasedev->name, migration->data_buffer_size);
>>
>>       qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
>> @@ -302,23 +380,44 @@ static void vfio_save_cleanup(void *opaque)
>>       trace_vfio_save_cleanup(vbasedev->name);
>>   }
>>
>> +static void vfio_state_pending_estimate(void *opaque, uint64_t threshold_size,
>> +                                        uint64_t *must_precopy,
>> +                                        uint64_t *can_postcopy)
>> +{
>> +    VFIODevice *vbasedev = opaque;
>> +    VFIOMigration *migration = vbasedev->migration;
>> +
>> +    if (migration->device_state != VFIO_DEVICE_STATE_PRE_COPY) {
>> +        return;
>> +    }
>> +
>> +    /*
>> +     * Initial size should be transferred during pre-copy phase so stop-copy
>> +     * phase will not be slowed down. Report threshold_size to force another
>> +     * pre-copy iteration.
>> +     */
>> +    *must_precopy += migration->precopy_init_size ?
>> +                         threshold_size :
>> +                         migration->precopy_dirty_size;
> This sure feels like we're feeding false data back to the iterator to
> spoof it to run another iteration, when the vfio migration protocol
> only recommends that initial_bytes reaches zero before proceeding to
> stop-copy, it's not a requirement.  What benefit is actually observed
> from this?  Why is this required for initial pre-copy support?  It
> seems devious.

As previously discussed in the thread that added the pre-copy uAPI [1], 
the init_bytes can be used by drivers to reduce the downtime.
For example, mlx5 transfers some metadata to the target so it will be 
able to pre-allocate resources etc.

[1] 
https://lore.kernel.org/kvm/ae4a6259-349d-0131-896c-7a6ea775cc9e@nvidia.com/

Thanks!

>> +
>> +    trace_vfio_state_pending_estimate(vbasedev->name, *must_precopy,
>> +                                      *can_postcopy,
>> +                                      migration->precopy_init_size,
>> +                                      migration->precopy_dirty_size);
>> +}
>> +
>>   /*
>>    * Migration size of VFIO devices can be as little as a few KBs or as big as
>>    * many GBs. This value should be big enough to cover the worst case.
>>    */
>>   #define VFIO_MIG_STOP_COPY_SIZE (100 * GiB)
>>
>> -/*
>> - * Only exact function is implemented and not estimate function. The reason is
>> - * that during pre-copy phase of migration the estimate function is called
>> - * repeatedly while pending RAM size is over the threshold, thus migration
>> - * can't converge and querying the VFIO device pending data size is useless.
>> - */
>>   static void vfio_state_pending_exact(void *opaque, uint64_t threshold_size,
>>                                        uint64_t *must_precopy,
>>                                        uint64_t *can_postcopy)
>>   {
>>       VFIODevice *vbasedev = opaque;
>> +    VFIOMigration *migration = vbasedev->migration;
>>       uint64_t stop_copy_size = VFIO_MIG_STOP_COPY_SIZE;
>>
>>       /*
>> @@ -328,8 +427,57 @@ static void vfio_state_pending_exact(void *opaque, uint64_t threshold_size,
>>       vfio_query_stop_copy_size(vbasedev, &stop_copy_size);
>>       *must_precopy += stop_copy_size;
>>
>> +    if (migration->device_state == VFIO_DEVICE_STATE_PRE_COPY) {
>> +        uint64_t init_size = 0, dirty_size = 0;
>> +
>> +        vfio_query_precopy_size(migration, &init_size, &dirty_size);
>> +        migration->precopy_init_size = init_size;
>> +        migration->precopy_dirty_size = dirty_size;
> This is the only other caller of vfio_query_precopy_size(), following
> the same pattern that could be simplified if the function filled the
> migration fields itself.
>
>> +
>> +        /*
>> +         * Initial size should be transferred during pre-copy phase so
>> +         * stop-copy phase will not be slowed down. Report threshold_size
>> +         * to force another pre-copy iteration.
>> +         */
>> +        *must_precopy += migration->precopy_init_size ?
>> +                             threshold_size :
>> +                             migration->precopy_dirty_size;
>> +    }
> Just as sketchy as above.  Thanks,
>
> Alex
>
>> +
>>       trace_vfio_state_pending_exact(vbasedev->name, *must_precopy, *can_postcopy,
>> -                                   stop_copy_size);
>> +                                   stop_copy_size, migration->precopy_init_size,
>> +                                   migration->precopy_dirty_size);
>> +}
>> +
>> +static bool vfio_is_active_iterate(void *opaque)
>> +{
>> +    VFIODevice *vbasedev = opaque;
>> +    VFIOMigration *migration = vbasedev->migration;
>> +
>> +    return migration->device_state == VFIO_DEVICE_STATE_PRE_COPY;
>> +}
>> +
>> +static int vfio_save_iterate(QEMUFile *f, void *opaque)
>> +{
>> +    VFIODevice *vbasedev = opaque;
>> +    VFIOMigration *migration = vbasedev->migration;
>> +    ssize_t data_size;
>> +
>> +    data_size = vfio_save_block(f, migration);
>> +    if (data_size < 0) {
>> +        return data_size;
>> +    }
>> +    qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
>> +
>> +    vfio_update_estimated_pending_data(migration, data_size);
>> +
>> +    trace_vfio_save_iterate(vbasedev->name);
>> +
>> +    /*
>> +     * A VFIO device's pre-copy dirty_bytes is not guaranteed to reach zero.
>> +     * Return 1 so following handlers will not be potentially blocked.
>> +     */
>> +    return 1;
>>   }
>>
>>   static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
>> @@ -338,7 +486,7 @@ static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
>>       ssize_t data_size;
>>       int ret;
>>
>> -    /* We reach here with device state STOP only */
>> +    /* We reach here with device state STOP or STOP_COPY only */
>>       ret = vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_STOP_COPY,
>>                                      VFIO_DEVICE_STATE_STOP);
>>       if (ret) {
>> @@ -457,7 +605,10 @@ static int vfio_load_state(QEMUFile *f, void *opaque, int version_id)
>>   static const SaveVMHandlers savevm_vfio_handlers = {
>>       .save_setup = vfio_save_setup,
>>       .save_cleanup = vfio_save_cleanup,
>> +    .state_pending_estimate = vfio_state_pending_estimate,
>>       .state_pending_exact = vfio_state_pending_exact,
>> +    .is_active_iterate = vfio_is_active_iterate,
>> +    .save_live_iterate = vfio_save_iterate,
>>       .save_live_complete_precopy = vfio_save_complete_precopy,
>>       .save_state = vfio_save_state,
>>       .load_setup = vfio_load_setup,
>> @@ -470,13 +621,18 @@ static const SaveVMHandlers savevm_vfio_handlers = {
>>   static void vfio_vmstate_change(void *opaque, bool running, RunState state)
>>   {
>>       VFIODevice *vbasedev = opaque;
>> +    VFIOMigration *migration = vbasedev->migration;
>>       enum vfio_device_mig_state new_state;
>>       int ret;
>>
>>       if (running) {
>>           new_state = VFIO_DEVICE_STATE_RUNNING;
>>       } else {
>> -        new_state = VFIO_DEVICE_STATE_STOP;
>> +        new_state =
>> +            (migration->device_state == VFIO_DEVICE_STATE_PRE_COPY &&
>> +             (state == RUN_STATE_FINISH_MIGRATE || state == RUN_STATE_PAUSED)) ?
>> +                VFIO_DEVICE_STATE_STOP_COPY :
>> +                VFIO_DEVICE_STATE_STOP;
>>       }
>>
>>       /*
>> @@ -590,6 +746,7 @@ static int vfio_migration_init(VFIODevice *vbasedev)
>>       migration->vbasedev = vbasedev;
>>       migration->device_state = VFIO_DEVICE_STATE_RUNNING;
>>       migration->data_fd = -1;
>> +    migration->mig_flags = mig_flags;
>>
>>       oid = vmstate_if_get_id(VMSTATE_IF(DEVICE(obj)));
>>       if (oid) {
>> diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
>> index 669d9fe07c..51613e02e6 100644
>> --- a/hw/vfio/trace-events
>> +++ b/hw/vfio/trace-events
>> @@ -161,6 +161,8 @@ vfio_save_block(const char *name, int data_size) " (%s) data_size %d"
>>   vfio_save_cleanup(const char *name) " (%s)"
>>   vfio_save_complete_precopy(const char *name, int ret) " (%s) ret %d"
>>   vfio_save_device_config_state(const char *name) " (%s)"
>> +vfio_save_iterate(const char *name) " (%s)"
>>   vfio_save_setup(const char *name, uint64_t data_buffer_size) " (%s) data buffer size 0x%"PRIx64
>> -vfio_state_pending_exact(const char *name, uint64_t precopy, uint64_t postcopy, uint64_t stopcopy_size) " (%s) precopy 0x%"PRIx64" postcopy 0x%"PRIx64" stopcopy size 0x%"PRIx64
>> +vfio_state_pending_estimate(const char *name, uint64_t precopy, uint64_t postcopy, uint64_t precopy_init_size, uint64_t precopy_dirty_size) " (%s) precopy 0x%"PRIx64" postcopy 0x%"PRIx64" precopy initial size 0x%"PRIx64" precopy dirty size 0x%"PRIx64
>> +vfio_state_pending_exact(const char *name, uint64_t precopy, uint64_t postcopy, uint64_t stopcopy_size, uint64_t precopy_init_size, uint64_t precopy_dirty_size) " (%s) precopy 0x%"PRIx64" postcopy 0x%"PRIx64" stopcopy size 0x%"PRIx64" precopy initial size 0x%"PRIx64" precopy dirty size 0x%"PRIx64
>>   vfio_vmstate_change(const char *name, int running, const char *reason, const char *dev_state) " (%s) running %d reason %s device state %s"

