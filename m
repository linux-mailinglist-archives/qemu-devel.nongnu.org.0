Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B19F45407BB
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 19:52:34 +0200 (CEST)
Received: from localhost ([::1]:59002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nydNZ-0006r1-JG
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 13:52:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1nydKm-0004ih-9o
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 13:49:40 -0400
Received: from mail-bn7nam10on2087.outbound.protection.outlook.com
 ([40.107.92.87]:16993 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1nydKj-0004cg-E9
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 13:49:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EA9uQy/wudlgC2173BQql7oHU4UM+ERkMMfBi/8aBPsz7eqhMMzF6yhUcXiRwqsDpM+kP1Z8KZZW/FNb4Mzq+L/yOXRaIPlUlhOfAB6CGpDYFxpRPOdlFYxNs5A4u2jNj4YvMcsM2jEN5qwcYQ6onaVpfXM6q/5jbkBeRbog7Etcmec/pDfqxru0zpeQYQZbFUIbiUC+Wy4uDmcz35ucCVk42b5T0G4Vzs0vNvvqg1FQijpKQDiOmLMhNuHJNgsHx2ir9muq2prCzf0z4FVVVtBFaVkbXIeBKyWIw/VYCmvXNzSbJNnAhM66JRUnJZaGMRgcD0gFq0oY996sb5mQnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RW7RNGhjYy36SpjJeV0u2ZwMUrtidR+zBW9B/ou/08E=;
 b=kQfbWNRz4GiRezYdMqBKLuNk7iagjK7fgPn0qH0V2YeXMq0Ys4+kCcAP18Q3rXQyQGOXheywAe8/lt++7dxWRQDilAUPpoin+DBZEyyB9qXqiQNUNlUd4iKMqMZeol3LTicUWsMJId3cgOlri6vxmivuS1U5c1LYoaTMkTa7TRWyYEC4EMJcrwlByAMTl5pGvs1prBTr+hFF+lC4WG03vcIxgzmfoTOvXFPQ1LPby9rUaP7B8rGE/gKHizm2/GdND4kGOGxj/mEZG4UEs/RpTYyLBTi/Bazz+IvOz7fnEepOzh06mq+6shxKj24xupc1RprNc/Uf7JtMc+pxTErj6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RW7RNGhjYy36SpjJeV0u2ZwMUrtidR+zBW9B/ou/08E=;
 b=rl96E27o8U9i8vemhMl/PoZLyt80SHCRyj7vE5fHl/q6DKt/H7Upud4WRrvmjMZTNhu7w+BDRg/xZQMgAxm8dd4VeRP2XuHT8ZlZ1vihF0iEZIfiNkWWFfRk2hPSg9RKd78aeW2kWMxavDED4mp8oedivFXaXi4rHIE0gOlizr/BwxldtoXHy0R0kExPr32riiltoydqGGvWyNL0onfEBMvM1U9dRaEsIFbR+5+kCDq1rok3AHqaVjkxAq3aPX5UaxuxVe/l328dR8OlF5lRoA5K/FMjpZzeQ5ueic/ea2Z0eoA6cifjwtQ4Wrb3Ao6Z1Y8sn38GAJ9gTg5D3ghPgQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB5549.namprd12.prod.outlook.com (2603:10b6:5:209::13)
 by SN6PR12MB4766.namprd12.prod.outlook.com (2603:10b6:805:e2::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Tue, 7 Jun
 2022 17:44:32 +0000
Received: from DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::bc8f:cb9f:6062:34ec]) by DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::bc8f:cb9f:6062:34ec%7]) with mapi id 15.20.5314.019; Tue, 7 Jun 2022
 17:44:32 +0000
Message-ID: <a3c0e7ca-4707-5154-d270-c1034881462a@nvidia.com>
Date: Tue, 7 Jun 2022 20:44:23 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 00/11] vfio/migration: Implement VFIO migration
 protocol v2
Content-Language: en-US
To: qemu-devel@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Cc: Joao Martins <joao.m.martins@oracle.com>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Mark Bloch <mbloch@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>
References: <20220530170739.19072-1-avihaih@nvidia.com>
From: Avihai Horon <avihaih@nvidia.com>
In-Reply-To: <20220530170739.19072-1-avihaih@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:311::6) To DM6PR12MB5549.namprd12.prod.outlook.com
 (2603:10b6:5:209::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 60687649-2e70-41aa-48e1-08da48ad60f7
X-MS-TrafficTypeDiagnostic: SN6PR12MB4766:EE_
X-Microsoft-Antispam-PRVS: <SN6PR12MB4766E408D3F4139E9A901D27DEA59@SN6PR12MB4766.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m7CdKmcXMgiak7inAKvtMMkt3SHriBsaCJIanEDr4VD8YDTAx5iq/eMQDdvsyRLZ95G7C5xuKakdubyAGu7Suy6oj7gFQUVWE18cpBmfcLoi2NqqzRAVM0bKiyWD6a8Ed1hFiw2uCzv0vSTdlL2uOtSofJkDCBzPjpiG1mPe2Q0Id4JFaaLZ0sjpKsfmQFgeOmwxdJp4fqCFomNYhBc25MQj1yLFOkaS/xFBfjpKnnZdrjQ5Q0AAUDMq/rd1FXZuYLd3fAyMOQwoqeGr+uD1fh2ce7YtNFzHL7xmzbl6XhtxImk6Djqlq+WcUPPZmkUgqeccrCuv9wfD59PquQdzFcNvtF+q2holTnTo8jFElxPCZSJhfJ1iPCz92LS43/fZjAgdRUimodl+LV1cISKVX6Df09WIxzpZmCYaSyCo6W4ZDSrom0ALt7vNNChq82L9sP8DHefcN8Y2AfABu/HTKgXdFxrHM/9h2N7VmZwSrI/s2vND8JrdimxVy7Z4p2C8Mr4lYppKGu2ZD8ci5KusHSPMqP6tUYt0TOBPV9e6bbGfek261lmh/aovO3adOdZuIoAoCPASU+JQ9hO5mHMoRKR7H8yNPCb765WDxREQn48U0OfPiyArAIVKFW4waj0HlxXs5nj9/EYQxRHRpNkGBFWSanRkbk+lhQ0MG1/8VpS540xT4mSJHWFGHDfwxCRKvnzkKRsy9dIRv2JJX/rGrLSjL+DDPrHw5fpXQHvjrfpiZrpGma3mh0e497riBF/3ols6p92RJRNSjAJAST9tBkIhq8lhX2QZOsXZNIfiAr+s53yGwKHuQaKwQUVsUj9FFbau4pxCUsrCcXMT9OxKqNmiP+dMGXiN/8XlWK5xD+U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5549.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(110136005)(5660300002)(316002)(8676002)(36756003)(2906002)(53546011)(8936002)(6506007)(4326008)(2616005)(66946007)(66556008)(83380400001)(66476007)(31696002)(186003)(54906003)(6666004)(107886003)(38100700002)(6512007)(26005)(31686004)(966005)(86362001)(6486002)(508600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aU1BQkRKVlE4T2FXVnVzYnl3YlFCb2w3WWtZdzBMYjJhNDJjNHJPNmxoVjIy?=
 =?utf-8?B?VjBoOXR5NVc3S21BeFc2NXEvRmFjMDFieWlkZWUwb0hpVS91SlZSZjBTRTBn?=
 =?utf-8?B?SnpwbnFNNTB1YzZVMDhaQmFXRjhwaHB0RmZMQTlBUHNtQjc4RGVFNjJWZ1Fz?=
 =?utf-8?B?R1pSNTFjSktUZG9zenk3V1Q0U2Erbk1NcXNkVkRSM2pHeWgrOXhDVmN0cFFP?=
 =?utf-8?B?V1RYTFY3dFplWXFhaGF4aVNmNk9LdHlPMURUSTRZZit6cFFFcFBQN0ZtRGx0?=
 =?utf-8?B?ODc2RHExbDBKdXVsejZ2Nk9hdHZRMTJaM1ZGLzkrV0dpMkg4NDlaVllRRC9M?=
 =?utf-8?B?MTV2YU9tVW82dDk4Mzdrckp3akZ3ZzVtNXJOUzlleWMxRkhoQnY3NnZMY05M?=
 =?utf-8?B?R3pwendqQXh5OUlLWWxPMDlpWklKeWpWQkRuUjdtUi8xKzBJSUJOell0Q3g1?=
 =?utf-8?B?Um9yWm1VOHNJV2VVak9ZOXgwTVVrTk8xenJzcEN5dWI5WHc1ZEVxZFVQeUs5?=
 =?utf-8?B?SzZZRDBUNnczN3o4eHIrT1pVV09PU2Vrc1lNbEo5TU04SzQ3V2ZhUURNMEcy?=
 =?utf-8?B?bHFYZk82V1VISkpPMVppUGtqMkJ1clo2UlFXMENTTm5YZEh4OXJCOG5YcVVh?=
 =?utf-8?B?aWhMYW5lRlhkTUtPelFOUlpwMjV6TU9QdEZBY0dqYjVhK0hUV1l4c0lrZjg5?=
 =?utf-8?B?WGhBWkV2Qk9vb1JGbUZIQkp3TlcwRUJiYi85S2YwNFBwVzJaYWgyWUNpMll0?=
 =?utf-8?B?NkwyeWl0YlRyYy9FcHV1K1NVUWw0bm9SZGZ5YjRkdTgvbUpUS3VjQm9OOHRJ?=
 =?utf-8?B?ZzNoVDVvUDlKTDA2aWR5OENXOTVxcFZKU3NLS0RDSHNDOEVaL3R5VmFSMXlS?=
 =?utf-8?B?VWlrTE5rZjE0YUZVeEoydEVodWo1ZHpNNGlRbnFCZkxCVGwyL3ArWHAzaVFX?=
 =?utf-8?B?RkM4TUtvRk81dkVmWHEyRE94OFlDOElvdWdVSm93Z3E0MHZqYWxHRmE1eVlP?=
 =?utf-8?B?MkkvT1NKcXhVa09reWh3aVNHSFdkVFJzRzdWRlZ3Yk9TRmJKT0hxd0pMRDlL?=
 =?utf-8?B?ZzYrcWN4U3NMMjBrVGFoRjdrNlM3Yk9MT0pkUFIyZnZDd2djbGJXb3NkVlFB?=
 =?utf-8?B?WjBsZ1JUYkR5cjJ5QmJzTGl1bUc4cm5yL0FNODlVMExtVWFwTzJWVEpMaHR3?=
 =?utf-8?B?Rlg0MUMwQngreHhlRVEvb1ZEdWF4NExUK2xZejRTYms3YktSVjhiU2I4UXJx?=
 =?utf-8?B?ZTVZZk1aeUExK2RRMlBjbkp4ZEduTTk1UVQvQ1I3VVFIckpya3Vtbk56bERt?=
 =?utf-8?B?Y3VjUG1jZ05WTjAxZzkyNlRhbDI5aVJBclhabEw1NjNHMjM3RVRaVmlCWGdv?=
 =?utf-8?B?d2kyekpGNlhqSWs0T1E5MThSZzE1enNneFBIWGhzSVBKUmFOY1Zibks0K3NM?=
 =?utf-8?B?Nk9TSlJuNGVtZ1lOa2xMTjBTSTlDQ0ZtWnBaeGZXMzFmSUVhSStHbWtHWFND?=
 =?utf-8?B?Z2xQd2N1T1Bpd0wxd0FrQlgrVE5TODhyMFoxU0pnMVZqSDEzKzNQbkRidHd4?=
 =?utf-8?B?SDM2VTd1d3JNSkV0ZGlIc1JNZjNGeGRWbC9MYjZkb1B4dGloN0NlNjRqYWFY?=
 =?utf-8?B?ek05SnZaanhHK3VUL2VkWlZraVhMd3hkQlFFVG5FMlIzU2pmaWg2L3l6ZGlK?=
 =?utf-8?B?V2dhU1d2djFySlNQbjFpK3UyWHJURXRNeTF4OFAvUUJhRDFmRVV3RCtyNVNn?=
 =?utf-8?B?aE40ZDNHZUVSeGsvZHpVcysvWkpVZUxkZG96ZlM0NkZ0c1Z5dXRSNXM1V1dU?=
 =?utf-8?B?MDQvV3A3eUwvZUVna2lhcDQ2NHA2czJxZmY2bmtrSnVTRDNjUUVhdlloUlE1?=
 =?utf-8?B?bzhia1E1OVFCNDY0MGVmWVNtdWpHTXpxRWZCWlRZakthS2xXeTNUN00zL1NH?=
 =?utf-8?B?enNRWkJhb3B0dDdFN0tlaXMyOHptU01HcHlnSjBzb1I2QjU5dkZiOEdDVkE2?=
 =?utf-8?B?Unc1Y3FVVkVmZTJxSXlyRnVkZGY0a3BSY3pKZDgwVmE3KzRpcEl0U1hyZlow?=
 =?utf-8?B?Uzg3cWF3cVFvd1RrcytET1JWem4rNUJRN1E0UFM2SkFtNEYzSHBwSlFjd0Yy?=
 =?utf-8?B?Ly93MlJ0ejZUV1BFTGhnWG1JK1FtandSbWtnbmx6eEF6bVkydUI0dnovYUZT?=
 =?utf-8?B?cXlDM3JXVjczM2ErUHJESFZleEQ0NGdFU2U1UzFhN3dSZFVrNXM1K2ZtTW4y?=
 =?utf-8?B?SmNBa0xHYWNGS2lzK1ZJNG9ENVBzOUpGUTRramQ4bWV6RnoyZU95UHBwYm9u?=
 =?utf-8?B?VWZxcGJvTE8xUkpiblNtWG5SOXo0aTl4b2h4eGtMU0lMaWM5akljQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60687649-2e70-41aa-48e1-08da48ad60f7
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5549.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2022 17:44:32.6424 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1W5W3UutF2hu19UdbwuhaLe5rzUeasZ8A8KROFAQ3tvY4nTT8hA/oiY9x/PnGDjpO4A1KQ0F7MOGO2KkF7AL+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB4766
Received-SPF: softfail client-ip=40.107.92.87; envelope-from=avihaih@nvidia.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
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


On 5/30/2022 8:07 PM, Avihai Horon wrote:
> Hello,
>
> Following VFIO migration protocol v2 acceptance in kernel, this series
> implements VFIO migration according to the new v2 protocol and replaces
> the now deprecated v1 implementation.
>
> The main differences between v1 and v2 migration protocols are:
> 1. VFIO device state is represented as a finite state machine instead of
>     a bitmap.
>
> 2. The migration interface with kernel is done using VFIO_DEVICE_FEATURE
>     ioctl and normal read() and write() instead of the migration region
>     used in v1.
>
> 3. Migration protocol v2 currently doesn't support the pre-copy phase of
>     migration.
>
> Full description of the v2 protocol and the differences from v1 can be
> found here [1].
>
> Patches 1-3 are prep patches fixing bugs and adding QEMUFile function
> that will be used later.
>
> Patches 4-6 refactor v1 protocol code to make it easier to add v2
> protocol.
>
> Patches 7-11 implement v2 protocol and remove v1 protocol.
>
> Thanks.
>
> [1]
> https://lore.kernel.org/all/20220224142024.147653-10-yishaih@nvidia.com/
>
> Changes from v1: https://lore.kernel.org/all/20220512154320.19697-1-avihaih@nvidia.com/
> - Split the big patch that replaced v1 with v2 into several patches as
>    suggested by Joao, to make review easier.
> - Change warn_report to warn_report_once when container doesn't support
>    dirty tracking.
> - Add Reviewed-by tag.
>
> Avihai Horon (11):
>    vfio/migration: Fix NULL pointer dereference bug
>    vfio/migration: Skip pre-copy if dirty page tracking is not supported
>    migration/qemu-file: Add qemu_file_get_to_fd()
>    vfio/common: Change vfio_devices_all_running_and_saving() logic to
>      equivalent one
>    vfio/migration: Move migration v1 logic to vfio_migration_init()
>    vfio/migration: Rename functions/structs related to v1 protocol
>    vfio/migration: Implement VFIO migration protocol v2
>    vfio/migration: Remove VFIO migration protocol v1
>    vfio/migration: Reset device if setting recover state fails
>    vfio: Alphabetize migration section of VFIO trace-events file
>    docs/devel: Align vfio-migration docs to VFIO migration v2
>
>   docs/devel/vfio-migration.rst |  77 ++--
>   hw/vfio/common.c              |  21 +-
>   hw/vfio/migration.c           | 640 ++++++++--------------------------
>   hw/vfio/trace-events          |  25 +-
>   include/hw/vfio/vfio-common.h |   8 +-
>   migration/migration.c         |   5 +
>   migration/migration.h         |   3 +
>   migration/qemu-file.c         |  34 ++
>   migration/qemu-file.h         |   1 +
>   9 files changed, 252 insertions(+), 562 deletions(-)
>
Ping.


