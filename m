Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 553E66A73E8
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 19:56:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXRbH-0001Pr-5w; Wed, 01 Mar 2023 13:54:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pXRbD-0001Pf-Km
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 13:54:47 -0500
Received: from mail-mw2nam10on2083.outbound.protection.outlook.com
 ([40.107.94.83] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pXRbB-00040y-5c
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 13:54:47 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YjWX+FEWLrsbB/SRYevdW95WeQ/AaAzDC2yB5K5pCA7TjWm2a/40vWoSTGxGpZGCrdLbZbRf23/y4XGjdQwIf6E26bLs2ob8xq0VlbSP1/vy06h53FHb3ir3i1QL7gniSGaRFU/hTApYuylw096lVBpu3tIBcQHU/0mPdYtxHpF4+42aKoUV7KowW7FrNKVcL9/j/OCYnM28AdQ8QSlTkSi3/FOPVIEOgIOMVEvEzrHKzmuzew8ERDGC5lmDS1GwNhwZNBwExdpXt7oauzQyKe22ig5MHL/T53D8eCHLZH3kVIXroWf2GuZoKGtDFm3UVR8j/09t1PQX9t6GCc7zKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0duXL0kD0MRpK2n/nqEKUdsakgnOx6owMF9cb1g2REs=;
 b=Q7xxh/yN46OvGFEjUYfv72G7zC7HNQfccBm8t+lLMlm9SYGkX3kQXzlbHnrcsPLpAZB7D6aT7q7MoIX/56+IihkyoNb5dxE8I03JvumRKdWrBlrnpXAQalarOd/09FnKFFMsFBlfeeEN8gAe8w3dAIfhstgV+IpVitN4wMN04ff4bwucZUTDCo8RUQBGGRQoiXzcEOLR+5AEkScav2JfaR5gYdR8vFbsY2L/UefgBN3S1uT0DPanlHgGAusodx3fZXtZXoJ12WJcr8IJeb87j/mQ4p5TPQw+WdkDB2Q4eFdfw3WMKUWLbeXt5ZCbm7gJoRlGoLZ9muBs6exiaRuGcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0duXL0kD0MRpK2n/nqEKUdsakgnOx6owMF9cb1g2REs=;
 b=XsIsupCZCl25xSZSH/EyjGiUFsw3JgsGwx88VC8Nuc3XtkzmWnGCb6iG0ahtj9U9zoGwPrAvIGrX6PjHD0kqPxT8gSMZDqr8wSL/uq2uG35RSDqCHbsA7ybB9nPOZ5CbcDM6c3BAphYN3atXiwL0ANIe5r2hB9qSjUPIKof0FuqVsAUW+az5FFkSjZtTjW3xuKhL55auUO6KQrd4eO3jzaHbr0cNDR0qaq41jljiygwA0AvnuRdDz3URZ4RumeNDthbzvk176Sldr3VeLDx+11+wXd+n9Y/tKlT12cJ8r9YFoIGmabhsZXkv2ndqfLRs+spyD04yw+GLHQway/GAUw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB5544.namprd12.prod.outlook.com (2603:10b6:a03:1d9::22)
 by CH3PR12MB7643.namprd12.prod.outlook.com (2603:10b6:610:152::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Wed, 1 Mar
 2023 18:49:39 +0000
Received: from BY5PR12MB5544.namprd12.prod.outlook.com
 ([fe80::3287:efd8:14bb:c5f6]) by BY5PR12MB5544.namprd12.prod.outlook.com
 ([fe80::3287:efd8:14bb:c5f6%4]) with mapi id 15.20.6134.029; Wed, 1 Mar 2023
 18:49:39 +0000
Message-ID: <b142b581-65c3-285d-bc68-fabc8d5ab0b7@nvidia.com>
Date: Wed, 1 Mar 2023 20:49:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 03/20] vfio/migration: Add VFIO migration pre-copy
 support
Content-Language: en-US
To: Alex Williamson <alex.williamson@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>
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
 Yishai Hadas <yishaih@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>,
 Joao Martins <joao.m.martins@oracle.com>
References: <20230222174915.5647-1-avihaih@nvidia.com>
 <20230222174915.5647-4-avihaih@nvidia.com>
 <20230222135811.705b85b7.alex.williamson@redhat.com>
 <38bdb26f-08d7-fe11-9a97-ebcc95c82254@nvidia.com>
 <20230223141637.67870a03.alex.williamson@redhat.com>
 <a875f6e5-951b-8f39-7867-313eabe54363@nvidia.com>
 <20230227091444.6a6e93cd.alex.williamson@redhat.com>
 <Y/znqJvtxtUEmsHi@nvidia.com>
 <20230227104308.14077d8a.alex.williamson@redhat.com>
From: Avihai Horon <avihaih@nvidia.com>
In-Reply-To: <20230227104308.14077d8a.alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO0P123CA0014.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::18) To BY5PR12MB5544.namprd12.prod.outlook.com
 (2603:10b6:a03:1d9::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB5544:EE_|CH3PR12MB7643:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e1161b6-5a28-4630-4837-08db1a85b5e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +zt1OAOqN3FemThANMBcENOi5kEYELxUYIk8AAxjLrB5Jo4Q/UpYrrncYVsc7ebBco1v7QfUnP9ykfU5Yq+S+FA8/XubbMvrid/qxRP5a1XJvrcxrzidTCajF0Q1aZnzRlDeH0rqLcYtugxM9L1Yzz6JuhHNipKQkJJVvYypaW4FEopFQt0Nmku5MwN2KQCQoRoc5OirniaC5ggd0/6VG7qMfUxxgP0TxoYG4j64NBAtt6cY17hCjBN2rKmIQDrr95S6nKGl0dSGph23IUqJxRdhqOcd6nw/DJZusAS+6OI+QINf08r2QLKjXiq7gPcaquODPtB1pieEjIzK2L6KpArpSqok2+V4dXhxov43FvYBDl4VmXherU9Ks8ZHOsU5ZZLn1rwVF5Fjvy72D0DoPPOUj+igye+ZvN1K1eqI3so/1/bHoxedH/0Dj7DKVPe0xocA1ShD3ql0WuOg2JhGumyOgJqxZ4ha4Gy8rK/WczxZU+E80P2e7jmRyY12yA/gy3mmyHKGCMdh2RkH8cLhdDS0wDqvMi8UpKkF2kl/7237zAtkYYUiECLhAJERjfgIT5lfGgesFTNbbvPSk+Bxivr4IU+Lo8BxH0KG2eS+vds1uUptbm4b1WYzBSYOYWZHKMg+UMVVkmFA5iEhDjtTCQwiCbTrH3CA35N+6Ub/On2d+SJZ0A5t/L7Anybo+43lPpOG5SKehrHN09x6kYJfPDxpmkOKiXb97CFG3P5Vlx0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB5544.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(136003)(346002)(366004)(39860400002)(396003)(451199018)(36756003)(4326008)(54906003)(316002)(110136005)(6636002)(83380400001)(478600001)(6666004)(2616005)(6486002)(5660300002)(186003)(26005)(6506007)(53546011)(6512007)(86362001)(2906002)(41300700001)(66946007)(7416002)(31696002)(8936002)(66556008)(66476007)(8676002)(38100700002)(66899018)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2V0SVNYYlBjNDFVS2VEaVpWZXZOL3FXaEVzQVpDa2h3R2syU2l1V2EzVjN5?=
 =?utf-8?B?RWlGQXBGUzNZSjRsd0NUaDFEcGJ1c3phNlRtOXJyN1FHRXBTYjFCYk9MWWgw?=
 =?utf-8?B?YjFObHZTc1FNT1FFaFVhejlXQnN3eHFaVTUrWGh5NVJJSUZLS2xDajRLdVE3?=
 =?utf-8?B?cFNOVDZxVHRCOHgxZnFMRHRGSC9UNmsvU2RlcEIzNnVzdEtTaEZrZFp0T2Vh?=
 =?utf-8?B?SmNNdHhUOVJHb1EzSUlicldaM0d0a2ZrTkxsZERYV0ZYRHhQaGgvd1RQQllE?=
 =?utf-8?B?RlIvMmdJeEtqcVd3VVRNZWUrejBuV0JhRXlNWDA1MWxiNlRJWk40ekVpV0ZB?=
 =?utf-8?B?bGFNSy9SWFExMnhETHNTblJqR2V0YVpGOCsreGErODFRTElzV0E2RGNidk5X?=
 =?utf-8?B?TC9LbHZWUFM1THFnTDNFUjJ5dzYvUGt3L1JBbFdqSTh6NnVpcXN0dGdtUUMz?=
 =?utf-8?B?ZHorVmlVejduY0I0b3VPenZzZGZhbGJMOUlCOS9VdWRVOWtxVFcvUHp2R1pt?=
 =?utf-8?B?S3Z6NVZHQ0ZhelI5TXM3dGllQVErcE9OMTJ1OHgzQXdxMHVuaFFjQjFJWERT?=
 =?utf-8?B?cm1QbXVoc0wzWlREcVpSOEVHa1p4R09sOVh6K05OcjJ1OWh4L0NXbnc0Mkti?=
 =?utf-8?B?NlBibkQ2WHY5R0xhQ0h4dVFNUGhvVHo4aml0SlExUEcyVjlESkZsQ0JOZWpx?=
 =?utf-8?B?TjFkVTd5dVQ4RFprWGRicTBUd3F1ei9wNC9GcW1VL1hIbnJ4Vm9tYmwvdUpH?=
 =?utf-8?B?aXFuRmJBTWY3NE9jY0ZNcER4ZldzNCtMQTZvYmRRUHkyalI1TWx4d05PckZE?=
 =?utf-8?B?WWNkaG5WazJzSFFLdVVlZTM2Mjg2R0h5YTNHR005ZnpaMUJuTWp2REZXV1ZE?=
 =?utf-8?B?SjA1bXVIdVdsS0l6M1Q1KzZIKzB1cU5MNzZabmpjQjEzZDNmbU1GL1QxZXY4?=
 =?utf-8?B?Q2lSZW4vRU13V1BIekNDTWsrbTJxeXMxRVlraEsvRzEyNWNuK2xRSXZIM0Q4?=
 =?utf-8?B?OENlZGYyRWZraTdneVhOaThUQk15cnhDSXN5bG9uanVxd0VkaTB1QlZUOE0z?=
 =?utf-8?B?VG9xWmI2YkZwTVZybWx4WE9OSGgraTJjVzEwVm5sR1RCSVJISFg4K2hwVDdJ?=
 =?utf-8?B?aURITFRFMkdxTmZwRk1DUlB2UDA5aDNpL0Rzd21NMlhxS3N0L054aEVxdVFz?=
 =?utf-8?B?ZEs1ZWJIUnBVZndTZjF6SWR6V2ZIYUtJMk96aTAxMkEwOElGMkQzVEVwWStp?=
 =?utf-8?B?ZE1HaERBVUZ5cTBtSXAwaDdUMzk1VjFZa1VaTlV1T2lxUXlKMWJabWRFWXc1?=
 =?utf-8?B?SlZ3OTZ1UGhBRzNneGdKOGRSUmxGc3F3OEFiQnVsUTJDN2NnTXBEdmtjaDNy?=
 =?utf-8?B?OW5pRDlZQzRMbUtHaTJhcE93T3pDTzNSUDR2eThSQXlMZ3Z6TmNlcnZWNjY0?=
 =?utf-8?B?T1diTndycmVJcXVUVERYeTBGaUI0bTNad0xyaTkrbzNYRnlRa3MxYmI5NVhC?=
 =?utf-8?B?YXZlSXY0ajNrdW9JU1YzSU5QUFZWZXJHRXRlTXBYN01wbmFpU1hHdnVtNDJF?=
 =?utf-8?B?aHhpUkZ5S0tkNTZlNnkrbkNWaU5BQi9wV0Y5MDhmenRBWFkxNFFuVVJMeHBB?=
 =?utf-8?B?OWZoRjVUcmJCdlpMMlZ5YjNZR1NQZ3MvTWFCc0ttaUd2aFYyWjZGN1ZyOFZ0?=
 =?utf-8?B?S21KK1QxenlmRXlya1kzb3ZiOTRUaEdlZElvaFFZZmIwSnlOb2JXYWs5ZGxu?=
 =?utf-8?B?RTlXRGwxTnQ4eld1QWlVVjRlY3VrZCtLMWRXQ09Kb1ZzcS9MZXRFMGhoMlBX?=
 =?utf-8?B?V3Z4SkJ3ZitWc3EraXQxbktOWUZQWmJnTi8zY1E2TEw0MFBDTU5FUmtoVFpJ?=
 =?utf-8?B?RjJqaGpRZ0RwQ0xYM0lPM0Y4b1hKVmsweVNvNjhTd0xPZWxZQ3c4SCs0S01C?=
 =?utf-8?B?czFsTUUvK3lBYW9Gb3JtRmxSTmdkUlVVMG9aZVkvbDl1R2JMMUwrUThZWmFV?=
 =?utf-8?B?ZVVwOXI0b3VwdzVDOHpmdWJzd2JidGtST1pSNFhNa29rOWtPU0xyekRBMW9y?=
 =?utf-8?B?WnVnMkF2Q2hpa1lvVE0rdFJ1M1FCWHFEb2tLRDMvQmt4MnFrdmFkdXVCcGp3?=
 =?utf-8?Q?srY8bNQgRweN1PZZEdnqdGhIU?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e1161b6-5a28-4630-4837-08db1a85b5e7
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB5544.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2023 18:49:39.2081 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wnt5+21UZhF1Kv18mlaFG6Yo2lK3R+hWffY0eoi0EmpTUSzO4Y9OF3mliF7YjouGddKYtQiPMEheRt6lW8Ccow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7643
Received-SPF: softfail client-ip=40.107.94.83; envelope-from=avihaih@nvidia.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


On 27/02/2023 19:43, Alex Williamson wrote:
> External email: Use caution opening links or attachments
>
>
> On Mon, 27 Feb 2023 13:26:00 -0400
> Jason Gunthorpe <jgg@nvidia.com> wrote:
>
>> On Mon, Feb 27, 2023 at 09:14:44AM -0700, Alex Williamson wrote:
>>
>>> But we have no requirement to send all init_bytes before stop-copy.
>>> This is a hack to achieve a theoretical benefit that a driver might be
>>> able to improve the latency on the target by completing another
>>> iteration.
>> I think this is another half-step at this point..
>>
>> The goal is to not stop the VM until the target VFIO driver has
>> completed loading initial_bytes.
>>
>> This signals that the time consuming pre-setup is completed in the
>> device and we don't have to use downtime to do that work.
>>
>> We've measured this in our devices and the time-shift can be
>> significant, like seconds levels of time removed from the downtime
>> period.
>>
>> Stopping the VM before this pre-setup is done is simply extending the
>> stopped VM downtime.
>>
>> Really what we want is to have the far side acknowledge that
>> initial_bytes has completed loading.
>>
>> To remind, what mlx5 is doing here with precopy is time-shifting work,
>> not data. We want to put expensive work (ie time) into the period when
>> the VM is still running and have less downtime.
>>
>> This challenges the assumption built into qmeu that all data has equal
>> time and it can estimate downtime time simply by scaling the estimated
>> data. We have a data-size independent time component to deal with as
>> well.
> As I mentioned before, I understand the motivation, but imo the
> implementation is exploiting the interface it extended in order to force
> a device driven policy which is specifically not a requirement of the
> vfio migration uAPI.  It sounds like there's more work required in the
> QEMU migration interfaces to properly factor this information into the
> algorithm.  Until then, this seems like a follow-on improvement unless
> you can convince the migration maintainers that providing false
> information in order to force another pre-copy iteration is a valid use
> of passing the threshold value to the driver.

In my previous message I suggested to drop this exploit and instead 
change the QEMU migration API and introduce to it the concept of 
pre-copy initial bytes -- data that must be transferred before source VM 
stops (which is different from current @must_precopy that represents 
data that can be transferred even when VM is stopped).
We could do it by adding a new parameter "init_precopy_size" to the 
state_pending_{estimate,exact} handlers and every migration user could 
use it (RAM, block, etc).
We will also change the migration algorithm to take this new parameter 
into account when deciding to move to stop-copy.

Of course this will have to be approved by migration maintainers first, 
but if it's done in a standard way such as above, via the migration API, 
would it be OK by you to go this way?

Thanks.


