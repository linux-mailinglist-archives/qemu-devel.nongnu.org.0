Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 041DE5784DE
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 16:10:57 +0200 (CEST)
Received: from localhost ([::1]:52798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDRSa-0001f3-3z
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 10:10:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <NikunjAmritlal.Dadhania@amd.com>)
 id 1oDRDO-0001iu-Ka
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 09:55:14 -0400
Received: from mail-dm6nam12on2050.outbound.protection.outlook.com
 ([40.107.243.50]:41824 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <NikunjAmritlal.Dadhania@amd.com>)
 id 1oDRDM-0002jc-2Q
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 09:55:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AtxmZzqjRZOdcpu+SFziA1SL4jv69gMJrU76L7w4ahY1VDqHkbYEX5xDyB5NZJmj3zy8eHBpFXq7oyiBZj3AF79QJISD1MjAXIGhyREHm3qCMkQX5ovMlQ/WUgFk+TWPW3xR+u832uTtPGjfLPE4EgbauD6JzOWG9A8BHBATwMCCacep9rrDME1k5FnACjVBIqjPvV26R2XQl+PnNoJILw5CkI/XktYlh25Te20LZYiqH6ugqK6iHbw9wM7jhj6iULyD9ceWWqXjxP3+1bEx1NORPDz2MSyinbX+tviXtTLCCQyK9TPrbrS1QmjlpraZP064IyFiO406aO+yntyP4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C3hLlNYdz9w7vcyPn2WWHXDuNiC4Hq+KXLOroiEO5GM=;
 b=c/qtCfjUN3eqBdI04FreNSmi0nIaoSaqHkh5NqjuLYWUVGlGuB3FBelMJnxyUo4a25BKuPmJaulwzEGI9R+CfyJvh9Cn3HhmUECTM6ly4j0Cbe/svJ+NuCdLOBgNJT6jpNZA9KY1jSRcYxSqNGhVJ8KSeVIjmLOSFvXIN6obvGT6Q+c05RKJTvFJxwAd4OagQk1R9hI5no1jMBCgnX6B3r7Tap3QIg+h4QFVbCPxQN/0MgnAIxOra0rxP/GqwEMIqXCFy54WqEZgvEceQPbzR4j2+GwPGYAWUVcc7qGi6j7lucFDaNxtHBuYqWUYGsuJ/iP9J+1WZXId+Y4mouQhKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C3hLlNYdz9w7vcyPn2WWHXDuNiC4Hq+KXLOroiEO5GM=;
 b=CCYz2D2Ve7NoAjn9+hqIBbxtNJa+I3xeYSb+mer/D1bcPGxWgkDUWi5/M5ebWxp5Msfo2tgaIxT25gJiVex3heMOx9lBY6De31wEZUqDPfKNU1Db+isoJT1ctcw6PClaXPe5504ey/bKnu6xFNhKZZIZ6YfvozlXvZa8qf1uBTc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS7PR12MB6309.namprd12.prod.outlook.com (2603:10b6:8:96::19) by
 BYAPR12MB3014.namprd12.prod.outlook.com (2603:10b6:a03:d8::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5438.14; Mon, 18 Jul 2022 13:55:07 +0000
Received: from DS7PR12MB6309.namprd12.prod.outlook.com
 ([fe80::d9f4:5879:843b:55da]) by DS7PR12MB6309.namprd12.prod.outlook.com
 ([fe80::d9f4:5879:843b:55da%9]) with mapi id 15.20.5417.026; Mon, 18 Jul 2022
 13:55:07 +0000
Message-ID: <4740e201-7da1-5440-1d28-00a10ae243e4@amd.com>
Date: Mon, 18 Jul 2022 19:24:55 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] x86: cpu: Error out if memory exceeds addressable range
Content-Language: en-US
To: Joao Martins <joao.m.martins@oracle.com>,
 Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, f4bug@amsat.org,
 Abraham.Shaju@amd.com, bharata@amd.com,
 Sean Christopherson <seanjc@google.com>
References: <20220718081734.135598-1-nikunj@amd.com>
 <20220718144210.4ef95c53@redhat.com>
 <e4cd8e81-a8a0-a898-e61b-3e0250dc4995@amd.com>
 <91b2ec7d-c159-85ed-dad8-37aac6c505d3@oracle.com>
From: "Nikunj A. Dadhania" <nikunj@amd.com>
In-Reply-To: <91b2ec7d-c159-85ed-dad8-37aac6c505d3@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0221.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:ea::17) To DS7PR12MB6309.namprd12.prod.outlook.com
 (2603:10b6:8:96::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 607b135e-60c4-446d-0d82-08da68c51f62
X-MS-TrafficTypeDiagnostic: BYAPR12MB3014:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VczFVGjqxa55hu44hTk1YDWezCbIEKjsn+IuTEsfMw1bUP0u3Z6v0oWU7MhpoHx4qRdePW7MxAoCzXJJ/iBASpqe0qIjoImdLw+U0/Yar96JUigO0IumPszzk527Pjpza/9L1PFA+izJrTkk1QjwwTSqeOpI3LjtROAjIFnmbeeoMf/g8pG4nX6y5u63zm0JHjRKpOTVQIeqeLim+9+P1gYP25cKW79nSce41xOYuS+huz1arr7iKttVIKCKmlKLj5So/fwE0BrWd7RBgxDtBinZsmMJ8JpwYC5GQuOq5NZVyWuIVjQ5ye1eRle4y2oAeo6cT8RUUnGjIwLgeFWncNDN2PW6hEChpYZswkrJjtntfBRjsbKU3Q8I75O5EYR6mT2+Cfu7eoEdCYOMg6tABpSFhxqT7yXcWLs9OtuKNxQ+Aiq4RWX+Ebxmb5McA3X3ObR2iTY4asotkdmoe9FvzsAlDF56PGAcrAM2YpgGqmUghSAMwY5yf0FcN83sWRQa1XUyJvwyAh5zbvPIEqJTz80jNvkkkCd8EK3P1H/M7ldw3XYGRH9ar6YCKThdL3TODr16gVNo517gILdczebxtvhmafPO019px02VwsP2Cl6g3D4xbo6UKbkx/DEcp+TNMtGtFbqxQc28GJGpUm5hZgjCWYqpxRMQunb4aZH8lb+89BwoSAcXr/KF++NwC1w7iTzKLFQ3JqBENdHCtttH1gQiY+70BThLMBiC+GMWFWul0djQHNsxKH7veBbc4xKedjQB3rAxW1yVDhbwhd/qUx5iFg8QonHyWkf265nkIz1RQ4lbGmChpOAXcihuahmxwPbAJ4eBXb4y9Ims2u1/Qo9oib7h0sXkaM7q8rZdvW7nDFcEkbvmuEs0B0IVu8nVIUh4WzGwwbP2V9qWO7uqBVroP3TiJ2OiAoRV0jjvzXI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB6309.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(346002)(136003)(396003)(366004)(39860400002)(110136005)(31686004)(36756003)(316002)(186003)(38100700002)(66946007)(4326008)(5660300002)(2616005)(2906002)(66556008)(66476007)(41300700001)(8676002)(6666004)(478600001)(6512007)(6486002)(26005)(966005)(8936002)(54906003)(31696002)(53546011)(6506007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?blVzYXM1NDU5WmJKNEQvLzlBN3E2eDJOWUpMelZsM2ZCYXdXUXFMdmtjeGZ1?=
 =?utf-8?B?VlVVNkFTWDVGZ0tsa2NyRUJiYklFdk1KblFtSDU1YW14Yk40OS9yVURiTzk2?=
 =?utf-8?B?YzZpOVNsRTNucVBNeGM2Q1ZNMGZ6NUh1c1RwRkRPVHBDcWVlOGpVdUxweDhH?=
 =?utf-8?B?Y1NsdzJqb3diSkhMWjYzbkdSTUV6SCtKU28vNVluTTBWT29VNjQ3MWc2MGhI?=
 =?utf-8?B?UkJnZUxqOXpGL213Y0c4ODR4aGdWOTlYVG1kNWFuUk9GT245ZmQzdHdtUUY3?=
 =?utf-8?B?eGU1d3VpcURFREtGYWhEM3lHditPRHI5aitOeTNwaEUyc1ZpcU16cFVtaUxH?=
 =?utf-8?B?L2lTSGt2ZGp4dlFVN3Zib29RWHVCVFpaR3FmVDV2ZzQ3Z0h2M3MvOXNXeFJk?=
 =?utf-8?B?bzhYa1BPMjhMYzJURHZid1ZHWjI0ME5PcWRuaVVkZTh4Nm9wSStTT2s4amRU?=
 =?utf-8?B?SnlHTlRlOVdlR0N3R2t3a3E0Y05RRXNEWTBsRlBZcnBRbWx0UHNxUjhXdTlW?=
 =?utf-8?B?RWEyL3NBNE5LR0dIZGdJT013RmhtWGJaL2w1Yi9pcEEzaXl1ckNjYktKcXhD?=
 =?utf-8?B?QkQ3czcwb014MDlLaldLbHo1RmdCeEFKdStmbjZuTVo2dHdickhVVXNkTy9E?=
 =?utf-8?B?NGJ1ZFdRWU5URk1mZXhJekVkWi9abGlnTVpUR1F3dDFmTCtFMWNnUDBvbHdB?=
 =?utf-8?B?a2g2c2ZEZEs3bUVXV0NJc0ZjUFRrWENHNGlKQlhPMUpXL1JSdjBIUWVMREhx?=
 =?utf-8?B?dGU0SzJuUTNjSGZIaVlIcGRUQ2V5dGlDSHNkN3dXajdjK3lkNDJQR2hnRVZG?=
 =?utf-8?B?Z2U1eXY5a3M3SVA2ZkxiRUoraTJTbDdpdi9iZkV6VmtTdmdId3g3UVBsV0Ri?=
 =?utf-8?B?NkYxSEJ2S3ZlWjd2am41UCt1TUN0bWhoSklEbGswaDJldE9aNWIxWXByVWlX?=
 =?utf-8?B?LzlhVXZzRXdzRFdlRGQ4SnY2eWJkWGpmbVVCdlg5Q0hFZFpKWS9WS3B2cUZB?=
 =?utf-8?B?SDFuVk5wVDVETVJDU29xV3h1SDNpYmloR1VJYkh5bUFvOEJIS3p6cVltRlF6?=
 =?utf-8?B?SDREMFRwNmlhYmRUbVlKSzVyVUUwMTVOcWNNRGdMSGNROU1ybndWZGVtMnpT?=
 =?utf-8?B?VTJmNXF1M0FwM3BPcDVHYVJOQjJBaGpQZ1E0TmRpU29lSGhzQTVacnl2djhr?=
 =?utf-8?B?QWxaU1NaaHFQbmVwZzZGeFp1SEN6V3A0M1FMQzBuYytENHVoWHp3eE1KOVNq?=
 =?utf-8?B?dFFKZ2svTWRzSEtiK2V0OWhsZGZpWXltNldBQ3NHU3dqNk1CZlJCVjBlWE1h?=
 =?utf-8?B?ckg2SzFkT3ZMMnBtS3IyY0JYMU9COXJYdVNVcWV4elJtd3c1VzFxMzRzY1F3?=
 =?utf-8?B?RHJkZW40QmR5WGh3SFJyRHBiZTlzMjg0V1FqYm9NbGJINTdwSUZ0eFdkWVBw?=
 =?utf-8?B?VjBISFBRQ2E1a05xR2Z1Q3BacUU3czkzeDNRNW5oVU16TllXQ24zdXNUUGdw?=
 =?utf-8?B?Qmw2UUcrazdrakM4SlRLMW81UFgyL2NQK20zMjZ5bmdNK0RIR2d3bGJ5Q0F6?=
 =?utf-8?B?dU1tbHpZekttb0QxVkJZdjNuZkFwSXBGZTNzZUZzNEN6emhpdStraVhBOElt?=
 =?utf-8?B?N0RXeVBZdWdSbTc4S1VDM0t5WmhRcHdwdEVsMTJyQ0I2VUZla0ZBMEZ4STdq?=
 =?utf-8?B?bUpXQTkyTXVmVTAwSUtIWmp3NFZVNGxRSjNxQ1duNC9aMEUrZTVzS25Cb2lk?=
 =?utf-8?B?aUg5RWxlTktsTVl6dXUwRFRKY3BudzM0YU5hWW9YSEZsM0xNL2dSRDVab1RP?=
 =?utf-8?B?ZWhpZTUwcFVUOFhRdHZXSThydTZMbU5pdkFiWVdicDJHeXdmb21JVTVVanRF?=
 =?utf-8?B?cTVpbVovQ1NjeXk5N25Wbm91OHNwWGE1NTU5aEZHZHJra005OWhTRkd2Mldi?=
 =?utf-8?B?OGFpUGdoZkczNjlCeFNlbVBMNzcvZCsrcFpheXRTOHJYVkRTK2lvcUF1ZjBn?=
 =?utf-8?B?b0h6NzFlUzYraUVHeitrSTlySjF6dFhsSFNFTzZQWmF6bHR6K0FPZlVhK1dp?=
 =?utf-8?B?YXhGSlhkUTZqMm5pdDNDYnZSME1VT2tQb2hobmdXRldhU2llZXFqOW9lMkdD?=
 =?utf-8?Q?3XMQJa2LZCzLXG0TFReKJXid3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 607b135e-60c4-446d-0d82-08da68c51f62
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB6309.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 13:55:07.3864 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r1ACJhtyduII++N64rMPvga6Rs1cb1cFh2ikJkrb2DX7ktgG8JNDvlV5HRykkGiS83JgFtuHNC45oP9tQIeoGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3014
Received-SPF: softfail client-ip=40.107.243.50;
 envelope-from=NikunjAmritlal.Dadhania@amd.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



On 7/18/2022 7:15 PM, Joao Martins wrote:
> On 7/18/22 14:10, Nikunj A. Dadhania wrote:
>> On 7/18/2022 6:12 PM, Igor Mammedov wrote:
>>> On Mon, 18 Jul 2022 13:47:34 +0530
>>> Nikunj A Dadhania <nikunj@amd.com> wrote:
>>>
>>>> Currently it is possible to start a guest with memory that is beyond
>>>> the addressable range of CPU and QEMU does not even warn about it.
>>>> The default phys_bits is 40 and can address 1TB. However it allows to
>>>> start a guest with greater than 1TB memory.
>>>>
>>>> Prevent this by erroring out in such a scenario.
>>>>
>>>> Reported-by: Shaju Abraham <Abraham.Shaju@amd.com>
>>>> Signed-off-by: Nikunj A Dadhania <nikunj@amd.com>
>>>
>>>
>>> Following shall care of your issue:
>>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg900136.html
>>
>> Thanks, I tried out the patch series, I could start guest till 978G (not sure 
>> why this magic number yet) and after that I start getting errors:
> 
> It's expected. The point of the series is meant to avoid attempting at DMA mapping
> over the HyperTransport region. Before it would just fail to either hotplug/boot with VFIO
> devices on kernels >= 5.4 (even if older kernels or other configs let you go through you
> might still see IOMMU errors at some point). So what we essentially do is to have the
> region above 4G to instead start at 1T, thus requiring 1 more phys-bit on cases like this
> where the max gpa hits the Hyper Transport reserved region.
> 
> The cover-letter and this patch
> (https://lore.kernel.org/qemu-devel/20220715171628.21437-11-joao.m.martins@oracle.com/
> should clarify on the logic.

Thanks looks good !

> The check you're adding here is essentially patch 9 of the series.

Yes, saw that change.

Regards
Nikunj

