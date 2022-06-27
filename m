Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8884C55B861
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 09:56:45 +0200 (CEST)
Received: from localhost ([::1]:40444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5jbv-00035w-PC
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 03:56:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1o5jNO-0004ta-Vu
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 03:41:43 -0400
Received: from mail-dm6nam11on20604.outbound.protection.outlook.com
 ([2a01:111:f400:7eaa::604]:48481
 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1o5jNF-0000Hi-16
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 03:41:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jt51EPkRNYBDO4JQ5mvNMgDcjqxsSUIZp55LkSJ7x/1EGuZWDRG/1aE1bKHliQRynGLZk0tJqg/NFIJB0/IjlvZcLdOgSqMeTll8wkM5ddBIXQt+Zfqki4YxDZzayNtotDfQnI58fhqsozUut5MOq0ZUz8H5vsjdIBvuloNP37inbmqu+q9hFGLze/eM2atY837GK9Mvj40ZsSt0TeBQZR8agen8O8MEcMWLg3FQ/lmvMiSHoojDs0nfVSH9/Gf+BdjeXNCWZ9SVnKTkmluY1YQSbilcBen4r5WFHQjwThFlHo4dzXESqx2yuPIIZV4lYOhBdkzW80GY9tNnUZlWmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9M08sBn8etHMkJj1brt3zsikmZ3WXflKQ41cxx1DDRU=;
 b=hRhQXwvui/kWx2P5c5NSkYVd2mL1dozZQqCabAGPmtOmmpus4sJ/M3FXR+c037EzqkRXTpC6OvFGDZM37ks4maOPaMzut6Fxf1CVmlai0z6AFZwx3VmxsY6KduiQcLbemS6Z6rbJMqEXAdheIE+8lQ7h/1pelr3HAAUoCtYzsHV+WTfuO6mkjgivMIRL3zsPUapiXT9G6gt5WoLPoqzgMy5chIMkfwISqODj1Hjzae2NPfXNj+KpdfMhCptr9MTnrF5nJdSEUBVMXiVBcVMrIWLkzC48K4Hkm4vcE3jLlF0EweCjOy1mWtF6CQCK9M8gdUR7odGIQ4VkmQtbIwzB7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9M08sBn8etHMkJj1brt3zsikmZ3WXflKQ41cxx1DDRU=;
 b=VXYwb5QicwiKH45xuDak56/MWFnz5dVABDQDZ46mFChjeTwtzxxuFDLjygT2w5ws3M4pUJdr1ptUlkCeIGqck3qrVH+uV+PCp5JY0OS4TjbTIraSe0xM91jUIy4Py/Tp59ZMpYS627M1K6tB6o6A0R1BSuFBqcSEapFkY5dloHiETmC0iHMbepkEeIOAnsxVZzne0MOMKg+NnUihkuh3qEnmLo4aFWnqj8tuK3WkpsFUUuwOZQ2w0JQnp9Q97Y9QvWnXjne81dEDbkadhPa8ajRl0lNBbSyDVYbRcw1+lMgUKk3kcEepl2/gjfwjjFEhi+G18ZSNxl3ZDP0q6YrmPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB5549.namprd12.prod.outlook.com (2603:10b6:5:209::13)
 by MN2PR12MB4608.namprd12.prod.outlook.com (2603:10b6:208:fd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Mon, 27 Jun
 2022 07:36:26 +0000
Received: from DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::bc8f:cb9f:6062:34ec]) by DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::bc8f:cb9f:6062:34ec%9]) with mapi id 15.20.5373.018; Mon, 27 Jun 2022
 07:36:26 +0000
Message-ID: <f734c3cc-e07f-912c-6858-7eb9e28d4145@nvidia.com>
Date: Mon, 27 Jun 2022 10:36:18 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 00/11] vfio/migration: Implement VFIO migration
 protocol v2
Content-Language: en-US
To: Alex Williamson <alex.williamson@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>, Yishai Hadas <yishaih@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Mark Bloch <mbloch@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>
References: <20220530170739.19072-1-avihaih@nvidia.com>
 <a3c0e7ca-4707-5154-d270-c1034881462a@nvidia.com>
 <20220607153239.386fbed4.alex.williamson@redhat.com>
 <4973fad7-5e71-aa4c-dfbe-24da254f3cfa@nvidia.com>
 <20220617155129.206749cb.alex.williamson@redhat.com>
From: Avihai Horon <avihaih@nvidia.com>
In-Reply-To: <20220617155129.206749cb.alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0354.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::17) To DM6PR12MB5549.namprd12.prod.outlook.com
 (2603:10b6:5:209::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4dc98df0-8a4c-49c4-8432-08da580fbdf0
X-MS-TrafficTypeDiagnostic: MN2PR12MB4608:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BuZSu65cbYi9s826/mFCbhCZYe2QbjlsTsQ92JFShhrJ1v9ZAyN2jTKgRHaCeDHmPJ7rf4JPGtOd1VyB3YNE46o9ZaXgM5iqeah/6mmdlx3qLhoJvAkKhkTruefUaZuE+e3vulGjxMGttfUsvlIe8Usr3MqT099nKa3X90sZOa7iDDjAG5Rok1hcnPVusnW0xr4+CHgygweB2xEyE4n6LoD7TENgSgLmG1FexSwKMPxIgDzL/xRYtg8i3WHsXMgEMpXnycQ/z23/RW9+x7KbxNyU9kWmGMF270annWh5R4GXX1YN7URftwR6iHqz1WhCuF8lOT3mtPfIOJZ7p7tOfyBbCazbEBTNDCoCYYg7n6ftQJgt2n3D7QY+tUtsTKo5hzSvhYCo7JvWH2/boR2+IlBNfSjoSkVZDqF9D9u05akJ0fAmLRxjKkukKPiRCyCmmb3qLZzEoe0PROwYPF0ynVR7Q/qd1fJe01wU9oYEP4zMdNSbMR6afSzF+wAP77Kx1CzJIMyufcF1gljf1/YfbbOJms1QwR24YfCkiJ7JZhMTLy1MOVC8U+DXE3LR4own+ti8bpPx557nFo5pXEa4D496KumJm4OxZK3hl8SAMw/SPzfhMvJMMeYfRD72Lz80KvnAAyMXjb5qNGhOA8gryF/6j3yV20rL8rjLFc1QyJgwu92z9PutUwFO4Ky/sjfgAgdzUHmYGxM/FQKMSAmIFDbbbBebrRw6SVsPF4PA4JxgT1GMSfb3NTnIap7+zUqahdbu6IAUpZmjANswvBH6PdncNatX5KrQIasLdezb3Is0jZ1gjWu5bWziLb6P62T5sAnjbmlRw069PS0gfhu3OTiiZW7GHraK6XAhjdnQfuesmA1o+TtGLPWFT9Hukn2Z40qp1TnZb8hWjPoUDSxamA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5549.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(136003)(366004)(396003)(346002)(376002)(316002)(83380400001)(6486002)(966005)(66556008)(6666004)(41300700001)(6506007)(31686004)(66946007)(66476007)(186003)(2616005)(36756003)(478600001)(4326008)(8676002)(6512007)(107886003)(31696002)(8936002)(53546011)(54906003)(110136005)(38100700002)(5660300002)(86362001)(26005)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2NCUEJoTXNZN3BVRHNGMDNXcWQ3T2xwemk0Y1pDUVBYWVNIZE85NXlyWWFt?=
 =?utf-8?B?clBwTitCR2w3d05ZUFJZMjlpTU5FbmZubDl2aFU2V1V2TmNRRDhSNVl5VW9p?=
 =?utf-8?B?ZGx2Vll1QUR2Y0ducU9aS05GODJhS2grV0ZaYzVEVGRDY3VhMGhOVHBKcmpz?=
 =?utf-8?B?aHJTUWg5Q1p1QTErMWIzbGUxaE02bmovRU55ZnQvaVBkV0lYdXgybnRodlUv?=
 =?utf-8?B?SlVUd1BOSkJ0ODBmS2FWeWlBa2hXMUN4emErUEprdXhMbmtvVzYwbXF2VjNV?=
 =?utf-8?B?bFFKSUE1MlhzRUhvZGdnUDZoMjlaZno2LzBlUGs2OFA3U1ltcnh6V21MaHJQ?=
 =?utf-8?B?Q24va1JhRlA0Y1ltNlE3Z3RLVVlDdzNyelQvWGk0a3lndXNqTjlKMEZpWDJo?=
 =?utf-8?B?ZmRUK3VjcHZORGdSY25Ea0JpS29VdW15cnpBRDJsNHpVbjdBRDF2dHJXL2tM?=
 =?utf-8?B?MzkzR1V0TmUwWTRvM0ZzcHNPQk50K0FZSEs5c05zSUJDa2NTdUducEc4bllV?=
 =?utf-8?B?aUE5aVZoNlB0b2JlZzg0d1paNnh5RVYxL09xckJXOUExWW9MbjNnWkljT3dF?=
 =?utf-8?B?WmMxVE4wMnNaTTQrbXB6U0pXc2tHR3ZvUlVFNnhlZjJkMGt4TzAvUkNWZS9q?=
 =?utf-8?B?cHNrelM3MDMxT0gzU09rdUl1TXJ5MUI1UnVwNTVLT29EZXpqREpqOFhHSjB1?=
 =?utf-8?B?SlZwekt1Z0NVblVKVEcrOWhaMDF3TVAyVjhlTFdRMmNXK0RRdUJkRXlRMXpE?=
 =?utf-8?B?OG1PUEJXYlJ6dGZFcExBNTlLeDlad1NybzNUUkYyWVBBdlZnNklSbWgxdWpR?=
 =?utf-8?B?WCtkbTJLWFU1MTZjY3dBcWtLRnhlY0QvU0J4Vm5kczR0V1JReW55NkFqaWZy?=
 =?utf-8?B?anNEOHd4ZVBTdUR4bHhXOVJHM1JvUThxTGg0R1pOdEhxR3N5azBuYTRvUzNY?=
 =?utf-8?B?SkJEYktIbXVGank0bERkcnpobG9zNUdNZlRROHNkMnZPaEl2ejhkNTJwREN6?=
 =?utf-8?B?S3JOdjFMTTdPekx1RXBlTXdJQ1pjU0RoTEY2Wmt5bXdzNmNQR2J6dUZXMlBx?=
 =?utf-8?B?TEVERkZNUDZmMGJKdXB6a3ZVdHB6VUFzaTh6SjV1bEJ5ekZyRUxaUDNiM2pn?=
 =?utf-8?B?dDlTaWl1VEtZcmpSM2U1cS9PS25QekFjU25BNGkrbmFVekdQYjFJYUtOVG1V?=
 =?utf-8?B?MjlnRXdXR3FBa1ZDYXhZUjdRbFI0SVVqeHlKUUpnV2V3OGtZR043cFVIVlJQ?=
 =?utf-8?B?Z1dGMVhBNWtwY0R6K3cyUWRLbFBQNjNvczJFTFVyaEdrSWo5d0U4SDFzbnly?=
 =?utf-8?B?RnZTOGpGQmRkRStrL0RRTURaVSt5ZE5UaUFEOWRBN1QxaTBrQkkwM3RyZ3dZ?=
 =?utf-8?B?RDZtM0NjVkdvSGtBMlY3WnlvcHM1TG85OFNuM0RFUzNNbEtBM0sva3hwcHV1?=
 =?utf-8?B?QU11ZXI2V21PS1IwUGNVSUZ2OUdudHhlQjhxdTRBTjVVd2tqaktoeFBRSjlu?=
 =?utf-8?B?d2F4N1N6dW1sT3EySXIyOE12TGl1R0VlWFBEejduU09mTmFsWDhRbS96cFFI?=
 =?utf-8?B?cTBmMk9ybGpIYTZrUFFPSzcwRjBGWE83WUxTd0x5TVJpaWVnVy9TN3AvanE2?=
 =?utf-8?B?WEdqa1JpUERvWkxyUmtORERkRkNjOFZNREdHUnF1eXR5Z3ZKOEk5S2ZrT2lO?=
 =?utf-8?B?UXNGV1QrUjNEM0JtK25kL2ZYNksyK0FMSjhud1RiNThiUFV6Ync2VWRIQVNO?=
 =?utf-8?B?Z2NwU3lEVFFtbjdSZEtQTVNOQ0hjK1BPS3F3UEpzd0xKUkpSN25XNFJzNE5S?=
 =?utf-8?B?U3pVUStRSk9MRzFYOUFpNFU3bVJyOFk3b3g3L3RJZ0VhVERFbnp2dG9WWXdD?=
 =?utf-8?B?THJxM0hDaHpLc0t4TTJPUlVJbkVQMGZTeWNKVkdwT0ViSW1uRHR3a2orVlJs?=
 =?utf-8?B?NWQ2bVZKVkVBOGJYWll2ODdvNWg5VzdLa21NQ21EK3RnbHVma2JwTVBSTHJE?=
 =?utf-8?B?cmljTUFnQTg5dERpQ1NJb2ZCeFA3Tit2MzI3Wk5QQXBFQkd6YnlhY05HUkxK?=
 =?utf-8?B?ZlJQZlIxSk52ZENqbGxkMWJURnRyVXJxc2hmbzg2YUFUQTBPUmt5b2IrSUpv?=
 =?utf-8?Q?VlIrszRZG93jUiEudbqrPLEJw?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dc98df0-8a4c-49c4-8432-08da580fbdf0
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5549.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2022 07:36:26.2958 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UPIq8i1HloWfAGQLJ84RpZwHLqmd5FUaXqZqNkIFnm3EObA9O2XscMrdu9Xs4Ssn59kqBzk4HtPYHWFC4CxMgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4608
Received-SPF: softfail client-ip=2a01:111:f400:7eaa::604;
 envelope-from=avihaih@nvidia.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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


On 6/18/2022 12:51 AM, Alex Williamson wrote:
> External email: Use caution opening links or attachments
>
>
> On Mon, 13 Jun 2022 14:21:26 +0300
> Avihai Horon <avihaih@nvidia.com> wrote:
>
>> On 6/8/2022 12:32 AM, Alex Williamson wrote:
>>> External email: Use caution opening links or attachments
>>>
>>>
>>> On Tue, 7 Jun 2022 20:44:23 +0300
>>> Avihai Horon <avihaih@nvidia.com> wrote:
>>>
>>>> On 5/30/2022 8:07 PM, Avihai Horon wrote:
>>>>> Hello,
>>>>>
>>>>> Following VFIO migration protocol v2 acceptance in kernel, this series
>>>>> implements VFIO migration according to the new v2 protocol and replaces
>>>>> the now deprecated v1 implementation.
>>>>>
>>>>> The main differences between v1 and v2 migration protocols are:
>>>>> 1. VFIO device state is represented as a finite state machine instead of
>>>>>       a bitmap.
>>>>>
>>>>> 2. The migration interface with kernel is done using VFIO_DEVICE_FEATURE
>>>>>       ioctl and normal read() and write() instead of the migration region
>>>>>       used in v1.
>>>>>
>>>>> 3. Migration protocol v2 currently doesn't support the pre-copy phase of
>>>>>       migration.
>>>>>
>>>>> Full description of the v2 protocol and the differences from v1 can be
>>>>> found here [1].
>>>>>
>>>>> Patches 1-3 are prep patches fixing bugs and adding QEMUFile function
>>>>> that will be used later.
>>>>>
>>>>> Patches 4-6 refactor v1 protocol code to make it easier to add v2
>>>>> protocol.
>>>>>
>>>>> Patches 7-11 implement v2 protocol and remove v1 protocol.
>>>>>
>>>>> Thanks.
>>>>>
>>>>> [1]
>>>>> https://lore.kernel.org/all/20220224142024.147653-10-yishaih@nvidia.com/
>>>>>
>>>>> Changes from v1: https://lore.kernel.org/all/20220512154320.19697-1-avihaih@nvidia.com/
>>>>> - Split the big patch that replaced v1 with v2 into several patches as
>>>>>      suggested by Joao, to make review easier.
>>>>> - Change warn_report to warn_report_once when container doesn't support
>>>>>      dirty tracking.
>>>>> - Add Reviewed-by tag.
>>>>>
>>>>> Avihai Horon (11):
>>>>>      vfio/migration: Fix NULL pointer dereference bug
>>>>>      vfio/migration: Skip pre-copy if dirty page tracking is not supported
>>>>>      migration/qemu-file: Add qemu_file_get_to_fd()
>>>>>      vfio/common: Change vfio_devices_all_running_and_saving() logic to
>>>>>        equivalent one
>>>>>      vfio/migration: Move migration v1 logic to vfio_migration_init()
>>>>>      vfio/migration: Rename functions/structs related to v1 protocol
>>>>>      vfio/migration: Implement VFIO migration protocol v2
>>>>>      vfio/migration: Remove VFIO migration protocol v1
>>>>>      vfio/migration: Reset device if setting recover state fails
>>>>>      vfio: Alphabetize migration section of VFIO trace-events file
>>>>>      docs/devel: Align vfio-migration docs to VFIO migration v2
>>>>>
>>>>>     docs/devel/vfio-migration.rst |  77 ++--
>>>>>     hw/vfio/common.c              |  21 +-
>>>>>     hw/vfio/migration.c           | 640 ++++++++--------------------------
>>>>>     hw/vfio/trace-events          |  25 +-
>>>>>     include/hw/vfio/vfio-common.h |   8 +-
>>>>>     migration/migration.c         |   5 +
>>>>>     migration/migration.h         |   3 +
>>>>>     migration/qemu-file.c         |  34 ++
>>>>>     migration/qemu-file.h         |   1 +
>>>>>     9 files changed, 252 insertions(+), 562 deletions(-)
>>>>>
>>>> Ping.
>>> Based on the changelog, this seems like a mostly cosmetic spin and I
>>> don't see that all of the discussion threads from v1 were resolved to
>>> everyone's satisfaction.  I'm certainly still uncomfortable with the
>>> pre-copy behavior and I thought there were still some action items to
>>> figure out whether an SLA is present and vet the solution with
>>> management tools.  Thanks,
>> Yes.
>> OK, so let's clear things up and reach an agreement before I prepare the
>> v3 series.
>>
>> There are three topics that came up in previous discussion:
>>
>>   1. [PATCH v2 01/11] vfio/migration: Fix NULL pointer dereference bug.
>>      Juan gave his Reviewed-by but he wasn't sure about qemu_file_* usage
>>      outside migration thread.
>>      This code existed before and I fixed a NULL pointer dereference that
>>      I encountered.
>>      I suggested that later we can refactor VMChangeStateHandler to
>>      return error.
>>      I prefer not to do this refactor right now because I am not sure
>>      it's as straightforward change as it might seem - if some notifier
>>      fails and we abort do_vm_stop/vm_prepare_start in the middle, can
>>      this leave the VM in some unstable state?
>>      We plan to leave it as is and not do the refactor as part of this
>>      series.
>>      Are you ok with this?
> I'll defer to Juan here, it's not 100% clear to me from the last reply
> if he's looking for that sooner than later.  Juan?
<snip>
>>   3. [PATCH v2 03/11] migration/qemu-file: Add qemu_file_get_to_fd().
>>      Juan expressed his concern about the amount of data that will go
>>      through main migration thread.
>>
>> This is already the case in v1 protocol - VFIO devices send all their
>> data in the main migration thread. Note that like in v1 protocol, here
>> as well the data is sent in small sized chunks, each with a header.
>> This patch just aims to eliminate an extra copy.
>>
>> We plan to leave it as is. Is this ok?
> I don't think we should lean too heavily on this being a bump from v1 to
> v2 protocol as v1 was only ever experimental and hasn't been widely
> used in practice AFAIK.  Again, I'll defer to the migration folks for
> this, it requires their buy-in.  Thanks,

Ping.
Juan, can you respond to items 1 and 3?
Thanks.



