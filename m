Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E025F52A424
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 16:03:04 +0200 (CEST)
Received: from localhost ([::1]:56962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqxmx-00086N-JM
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 10:03:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1nqwOd-0006Zb-9u
 for qemu-devel@nongnu.org; Tue, 17 May 2022 08:33:53 -0400
Received: from mail-bn8nam12on2043.outbound.protection.outlook.com
 ([40.107.237.43]:14688 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1nqwOZ-0003AC-Ry
 for qemu-devel@nongnu.org; Tue, 17 May 2022 08:33:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aSkHoSpEYbok8qc9MZ3Eac4TWkYm1yLJsW7Rc2V2vpYeNYhPN5ztTJLxW/vjYw+WXw/NZ/aqUpalUfjGz2Lk/HDLqqFN1FyAKXJVWlhygdevsgWO2RhSGKwEZUdoPGJ2wPmQPclFifWySZRJShrfHJ0YBftq9AAqYZ9nUnYkYmwhpbSOF88xAgw6zIFgXMLQ29/YSSDMvjP7FR/QnNCWl87MO5u6Tf7frN+uOWOmgbodfueVY1r98AG6oDilLmzAlSn/J6VdUevzeE/fyjz4NgfvfFEXYRdqRQwOP0ufl6ruinNeUCW7fXLwpq+QR0IOmPV0VB6kF86iL7BcjWqrBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=45F/xCNhtr6NYdlzE8ZVrhJzU8nvzATrT2GCD5kbQJ4=;
 b=IUHO5/wR1MndYg+XXyNKnNRZf1eDjHpdJc1vP7weLfpOJQoM/92SJxchNOrl+TDrZtX+huqdlZ9RGMUZemfMaUwY2Wb8nC8RbGqOsPq5Jw56rU8h8Vj/jJgdcRjPKltkEWaM0n8tmuI07Gvw2lVMOl1e26WdD3lQ5bsO3VCiApIAQmjYMqA6DC/uHLrX6qKKViYISYgN5zjRiKGSKgU2qkkp+5HEp28icSuuo8+ZiSqzLPbbGwE6G72DJ87wuXM1Wtz/TkYVq1XOxNVJMu/5hbjMtqjwUIuHVlf2xLIDgKPAhW33cZbDWgC5fu91bnANI0UFj3clYEa5Ro2aYCjmHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=45F/xCNhtr6NYdlzE8ZVrhJzU8nvzATrT2GCD5kbQJ4=;
 b=aDNnOnFNAzqeSLKOiVUCoLjRkF74G2GOk1n+qMHW5Z3tM3zNzD2vkCGxAZR9njU5CnfvR9q0/WpSp37kAVcQnjQ5ZU5Fnr6OsEGE5Nnl+Z+DP3zAgpY6EIh3lWeRYAF3b4HjTlSghFWPVAQaW/GN6Bt17XrUehv28pLqlSOderAzRQoEeTTQbiRtbTh/B0PscS9o0v1Sou6zxw2SYh5/tq1GjSorizgb0TI+xtDokXURvAGX9dEVAVuA34t84vxnfjVoL1Wsl5w6vm9IsLe2RT61mt4lV/+ZIctN1JDm+88H3SqY2Xvlq1G1Rw4ehX8vG4G7Mwcbzlq5dcYhlCOpwQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB5544.namprd12.prod.outlook.com (2603:10b6:a03:1d9::22)
 by BN8PR12MB3107.namprd12.prod.outlook.com (2603:10b6:408:46::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.17; Tue, 17 May
 2022 12:28:42 +0000
Received: from BY5PR12MB5544.namprd12.prod.outlook.com
 ([fe80::a1ca:addf:80ba:e6c3]) by BY5PR12MB5544.namprd12.prod.outlook.com
 ([fe80::a1ca:addf:80ba:e6c3%6]) with mapi id 15.20.5250.018; Tue, 17 May 2022
 12:28:42 +0000
Message-ID: <ca7310a6-80fa-ec4d-f480-fce5ffb0c8cd@nvidia.com>
Date: Tue, 17 May 2022 15:28:33 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 3/9] vfio/migration: Fix NULL pointer dereference bug
Content-Language: en-US
To: quintela@redhat.com
Cc: qemu-devel@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Mark Bloch <mbloch@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>
References: <20220512154320.19697-1-avihaih@nvidia.com>
 <20220512154320.19697-4-avihaih@nvidia.com> <87lev1sp8j.fsf@secure.mitica>
From: Avihai Horon <avihaih@nvidia.com>
In-Reply-To: <87lev1sp8j.fsf@secure.mitica>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0319.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::19) To BY5PR12MB5544.namprd12.prod.outlook.com
 (2603:10b6:a03:1d9::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 19c6f3e7-de4a-449c-f83f-08da3800c705
X-MS-TrafficTypeDiagnostic: BN8PR12MB3107:EE_
X-Microsoft-Antispam-PRVS: <BN8PR12MB310738B063EE22B18313A0E6DECE9@BN8PR12MB3107.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z8fpY9uh6aEXrt2UcJqZK+QxwTYnqbj0XUGoqs2g4/7cRDrdbedNjmwSJVUlr8wG+rpJPJXF4mviifnSPc8yE5rg84RqVebWzUkX87SwNnc+yr97kk9xrzWlyf8Nm8fJhKsN7vFBiANIaW85cXxruShKxmER/iGrv6FWF8cmkwpKuTLlhevERlacvCC7cFvivEeXvEI6KO6zvlHphebRByuGw5g09RsDrIJODizGl/icxFfEv+MvoPDhWnD/FKUDdXIar6VBEm+5tQnVyOP3l3eh3W1FPS9MDsGohm8TXWwC/Ysb2QaTjxOH0BYi/cMBRRPM3DeC2YX1bULXI96ni+SFE0uPViWhmQHKy2/j/zCzZDWGBrvKFEolYeTw8jsBZiioxoZiF9oltbywjeIVoblOfESjNovGWQNvr4FmgEIEMCVO0l5N8ntNqavHV8Dguj6Owb1ZO+RyYuo2ahndni2wIN0BOmAJa1BQCHcumtdDq7iqUWupoJeKJgqeQPfqbCdghIAeMtL/EPi53h14GEIl9WMCNUIhfXYJrtTQ45UmseLoEfsh2tV56hq102yHIGq6kZB4N7Td+2BePdhBroLh3JmEx+LOYyKiO3z6giSns/eNQnKASGfno9Y2kotU60YBuico/Zv1O5z2J7ylF+z1V4ZijwPrfBzxlc8OsSCbqyGRU0Bsz5uWENLUeBrvs0EzGWmPvnbNLm9YbDCtAos8Imtxt95x1uHUF4dJc7s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB5544.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(316002)(6916009)(38100700002)(53546011)(66476007)(2906002)(2616005)(4326008)(8676002)(66946007)(66556008)(26005)(6506007)(6512007)(186003)(508600001)(6486002)(6666004)(107886003)(5660300002)(31686004)(31696002)(86362001)(83380400001)(54906003)(8936002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0dRSjdQdVpKYWM0MkhWV3RhNVFkbC96SWNtSEw5am1GbFNxMUs5S1VXNTVp?=
 =?utf-8?B?TzNxNnVvc1B2NElVakl5dWlSNjZWb1R4RGl1dzYwQUZHY043ajBLMWJUQTln?=
 =?utf-8?B?WmdXZU5Td3k1eWZva0xSSHNITi9SNmFXb3VKZ1dQcXp4VTNJTzU3Y1Nqc1Jm?=
 =?utf-8?B?QzF6ZGlJOENRM1dnTjRSbW5xUjFqb3pOQ1lZZExld1Y0dzlxOUQvWlQwbGRU?=
 =?utf-8?B?ZmF2Kzl4MW1SaHRKTkVuVlMxR3ZLU2JWK1lRMTdUK1hjeHdMQlIxaTUyVlZj?=
 =?utf-8?B?TlgwZEcyeHNpMXhEWU96ODVqQmpEc1Q2M01DcEUyaHFjOHZlY1FpRk03NzM4?=
 =?utf-8?B?L3ZkYzZqbWc5M2FUZm94RFVJU0k5MHRCV2hTUmZEMUlCWElkV1AyMkhZc2RN?=
 =?utf-8?B?V0cxV2VxVHFES1Z2WnJEaGtObDNtODBjVk44U3RXUnNMSGx6TUpzTUs4Wloy?=
 =?utf-8?B?OUdVRlBwWDhtK0xwT0p4ekZVTDB2TEZ6RnRBRUQvOU1saWdSYk9aemVZL3dU?=
 =?utf-8?B?N2N0bFhjVzVLYklCWnh3dGdZU0dJSFo1YUltZkZRakdOQ3YyLzRaOGZlSWZu?=
 =?utf-8?B?YXFUdnBWZ2JIR3JGaHF0K1N5YkF5QzA4bDU1MmRucEk1OTExWmx3aHRkUURG?=
 =?utf-8?B?NCtnVDdjOFFSMTFDVHlEMlVDN3NYS253MFlUS1lqQ0pJdE5kN3JZRjZvRWo4?=
 =?utf-8?B?SlNXM3l1STl2ZExmVTMwZzdGOVNaV1ZONW9JS1hqbGNGN1J1dWpnUE9VeEtl?=
 =?utf-8?B?bkg2SldURDJwazBiOXUzWVNFeDlKc3M1enNQVEptTm9ERzZraXFjQzJYbzZa?=
 =?utf-8?B?Q2Ruc2E3UFdodG1uN29kRTJqV2pZcFN2U2EyWXlCbXliTndqU1AvczJrWTNH?=
 =?utf-8?B?SGJMd3hoU1JnRFBCeXUrSlk4ZDYydmdXVHNYeStRWFlOSmh1M0pmU3IyMTJX?=
 =?utf-8?B?QUVKWDA2QnJjWEEwaGRGOE9zbjViVFVhcXlZSTdLQ1dYUWszRmtBWDNWcDhu?=
 =?utf-8?B?V1BSOGlRa1NPWXNZSDlINHI5UEV2b0NSUFRacVZ4SnJtYWh3NjZ6VXVnZkp3?=
 =?utf-8?B?YUJ3VkJRWkFISXVuc012ZVA4WFh3ZkEyZXdEZjZhelFvTTZzdnoxUDBJWDE3?=
 =?utf-8?B?YWkrYTE3MnA3dmNhUnpZbENZSTlZd01LaUNrcVFWMzlWSXl0S2JnRG9VV1li?=
 =?utf-8?B?anNBS3g1TGlENTVIamVSSTAvbk9QczlsbGpqd3NmdkxKaEVZRWU3eTNXaURa?=
 =?utf-8?B?QlRKd1l1ZkhKMlFWeHloMnV1U0lyZGxVUWxQeEJCNkFFWGNQVS9pNEVqcTdD?=
 =?utf-8?B?WkdNeC9uc2FGSGJqTmRKa2dBaHFjaHppSldJKzRLc255SDZCUlFFRDFwbG8x?=
 =?utf-8?B?YStjL1ZFQWJIS2xCb1A2MkJGZFhxbFloRjcvL08yeGh0akZLT2hJWDRqVGpJ?=
 =?utf-8?B?aDdwbnUxSVc3RnpxMVU3b3JjSVhGUHVaQ1hVME9oRllFQXQ1K3BHN3l0SVYw?=
 =?utf-8?B?cGVTTmgxbzVDNzhYMGN3bzJ6MXA2SEs5WEhBbW54UHlteDV3eTJzQVNtTmZ2?=
 =?utf-8?B?WjNYaXdRbDFZa2xGelZod1ZlRDFFQ2NIWU8zR090M2RqR0VndE5VeXNSbHBO?=
 =?utf-8?B?aE5wSFRxL0pnUmFTbXN1SXhwY0kwSjR5OXN2MWgwdFFadG9vU0tEa0JvNGFD?=
 =?utf-8?B?ODVYVkZjVDBmYnNKQ1pZYXk1RjJGVTlYZVhkVVRTeUZkZXFocE94Zlo5ckox?=
 =?utf-8?B?eGt2aTc3WEM3RkljZmJ1dXdJdGtqWE1XQ2oyRnFRcGFxaVVIdWpYNXM2NWhu?=
 =?utf-8?B?VzVmdkpKRUxPaHRCdjVUODlKeCt0ZHhqMlZsQlNJa09WQlZESWlzbGpwV2dL?=
 =?utf-8?B?TWJTRTRadUgzZThtdGZFc2Z4UTI3cXIzUWFYSW50eDBkNDM5TndVZjBEZFZh?=
 =?utf-8?B?cHhZUE53UjlwV2ZLZTNvTnQ3MVQyTnBlMmxLMVJjVXFhbFd4WE1YQk14ZEkr?=
 =?utf-8?B?ZjVLUFFCVXBmclovLzBCdnZtLzlyN3dNYk56RWJLMTh5bHptQ05LQ0J0WFFV?=
 =?utf-8?B?dUZKNG1WWm9nNmo3N0txY1dOM3JsY1FoSEppbkVwakRuV2xEdzRINTVkTlBv?=
 =?utf-8?B?SDRkOVV4UDJvdGNkdSs1VlM3TFJ1ZGlFYlBaeWJja2EwN1dtU09xRDVzT3Q2?=
 =?utf-8?B?RjRtTUJURWI4WkVHMy8rQnpjTnh5UHh1dmdWckZnd1BBcHJIOTlYKzYrUU1V?=
 =?utf-8?B?YmsvMWtvOVZ1Zndwbk5CLzNZblhEenVJdzBKZWlRM2d5aHFVN0lzbnE1VmtR?=
 =?utf-8?B?UmFuWFJsZFdDRnVJTXVDU2xlbk5YNnY0dVJERmJRZHVQYlIzQmREZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19c6f3e7-de4a-449c-f83f-08da3800c705
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB5544.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2022 12:28:41.9371 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Si72ejnyrXeIFd+Cn/ZXILh4Q2Z9KDRiaf2C3xpnWPMpEOnZ4ydWQqkKnk9pEXkfJXyPGZEKxP4SvUWeZKgD2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3107
Received-SPF: softfail client-ip=40.107.237.43;
 envelope-from=avihaih@nvidia.com;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


On 5/16/2022 2:15 PM, Juan Quintela wrote:
> External email: Use caution opening links or attachments
>
>
> Avihai Horon <avihaih@nvidia.com> wrote:
>> As part of its error flow, vfio_vmstate_change() accesses
>> MigrationState->to_dst_file without any checks. This can cause a NULL
>> pointer dereference if the error flow is taken and
>> MigrationState->to_dst_file is not set.
>>
>> For example, this can happen if VM is started or stopped not during
>> migration and vfio_vmstate_change() error flow is taken, as
>> MigrationState->to_dst_file is not set at that time.
>>
>> Fix it by checking that MigrationState->to_dst_file is set before using
>> it.
>>
>> Fixes: 02a7e71b1e5b ("vfio: Add VM state change handler to know state of VM")
>> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
>> ---
>>   hw/vfio/migration.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
>> index 835608cd23..21e8f9d4d4 100644
>> --- a/hw/vfio/migration.c
>> +++ b/hw/vfio/migration.c
>> @@ -744,7 +744,9 @@ static void vfio_vmstate_change(void *opaque, bool running, RunState state)
>>            */
>>           error_report("%s: Failed to set device state 0x%x", vbasedev->name,
>>                        (migration->device_state & mask) | value);
>> -        qemu_file_set_error(migrate_get_current()->to_dst_file, ret);
>> +        if (migrate_get_current()->to_dst_file) {
>> +            qemu_file_set_error(migrate_get_current()->to_dst_file, ret);
>> +        }
>>       }
> Reviewed-by: Juan Quintela <quintela@redhat.com>
>
> I mean that the change is right.
>
> But I am not so sure about using qemu_file_* operations outside of the
> migration_thread.  I *think* that everything else that uses qemu_file_*
> functions is operating inside the migration_thread, and this one don't
> look like it.  Furthermore, a fast look at qemu source, I can't see
> anyplace where we setup an error in a vmstate_change.

vfio_vmstate_change() will operate inside migration_thread if 
migration_thread is the one that called vm start/stop.

In cases where vm start/stop was not called by migration_thread, it will 
operate outside of migration_thread. But I think in such cases 
to_dst_file should not be set.

Ideally we should have returned error, but vm_state_notify() doesn't 
report errors.

Maybe later we can change vm_state_notify() to support error reporting, 
or instead of using to_dst_file to indicate an error, update some flag 
in VFIOMigration.


Thanks.

>
> Later, Juan.
>
>>       vbasedev->migration->vm_running = running;
>>       trace_vfio_vmstate_change(vbasedev->name, running, RunState_str(state),

