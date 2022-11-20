Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BA463133B
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Nov 2022 10:40:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1owgoE-0005Qh-LC; Sun, 20 Nov 2022 04:40:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1owgnq-0005Nz-Uk; Sun, 20 Nov 2022 04:39:54 -0500
Received: from mail-dm6nam12on20631.outbound.protection.outlook.com
 ([2a01:111:f400:fe59::631]
 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1owgnp-0004xK-5B; Sun, 20 Nov 2022 04:39:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c0Tj/+dTvNJT4AuMcOZeCqnXKFmEViyqy0d+iAGM12rjJDsp0BV6/802mv7XZF63PljWL7Rbl3mx4EONlURHtQIQ1RJtZm37+x3ImK5jW/L2+ZVFgthS9bP3wm5wJWaKkpOMqilcNgAsId6gA6uYbdz7jZETP4xKjHzgNaDEqzwNB6EIHzfusIsUvuo5sW+j8Joxsp4R4iFOQamBRioUwRHftADv8f/6MEuGSfZgvxk5SYrf/kHyYu9xqVq9W/NcETJ4JZiKb6JfsfIVnUHeWSjmuWe7i1oHHBqxAAvx32F4sDDvCIAZFUwClmrAhDcOZLRZyvxckYEZ0gIlWCMx5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DM68TmySEfZcJWlaAsMalnX4FmXuCu1RJ/ijVr++Kok=;
 b=IJq1fUg559A6Eq4hCCPviiVrCdCIbJf8W7wJyJLdxJCrfz71GLnEQDi2UO5IlZkzHoM3ZiYkwaWDn/30no4W1f0GM54j9qx49WAWI4hMTAmJi+c3+7iKZhy7xUbVARjt7FN8lMucLgnEvvaw1R52tvYzHqYnYDtdqb6stAuZuldmsydkZfJWirYxnQ1Uff02BGDMcpdIFTvedxgnW7JGPEgmAZlJ+2I8tZIyXLPtFPeRRHCnNQlg0Q0+Ws8IPSAyy2fA7H4CwU9xbpVGBbcnbQgg96v0nL/ORQOCrhdvgL/tIP6yDQKzEWUf32Vf31W45J7VOzuhTfQp0aVKU1w/EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DM68TmySEfZcJWlaAsMalnX4FmXuCu1RJ/ijVr++Kok=;
 b=tYNEfUDfwzvRK93mq7P/uwAi2lkjgXVEyW4ux621YhEYoADP9/mLfgrC9mimtYe8v3gCNOYWf83Rn1/i8I8WOa54MhIegLUPy+z5Ro7WZy7JNgFovxT84/AiLzVlrnA57NO9cWDJMRWKw7COqvMvzonV6C4T/rjxIFDXqCSs7JuQOoWx/jN5pB1vtr5J3dDBKZaX5f0a2DXny3Fz6jGs0gCbhXw0TWO3IUmWGXeRjjeB4nr+Cja54YvGmMOZnFqmJGG57AqdXqgBIYEJ8N+24OQsx7QfzjcSeS/jfjL1MozzdtQZpZ9j1w3RNJsvyCILRKXDxj5WRrFRjEY2oWkG7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB5549.namprd12.prod.outlook.com (2603:10b6:5:209::13)
 by DM6PR12MB4532.namprd12.prod.outlook.com (2603:10b6:5:2af::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Sun, 20 Nov
 2022 09:39:46 +0000
Received: from DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::820f:1fa0:9353:bece]) by DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::820f:1fa0:9353:bece%9]) with mapi id 15.20.5834.011; Sun, 20 Nov 2022
 09:39:46 +0000
Message-ID: <93ccf29a-0301-5053-c2dc-20f28daaa7f4@nvidia.com>
Date: Sun, 20 Nov 2022 11:39:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v3 14/17] vfio/migration: Reset device if setting recover
 state fails
Content-Language: en-US
To: Alex Williamson <alex.williamson@redhat.com>
Cc: qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 John Snow <jsnow@redhat.com>, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 Kunkun Jiang <jiangkunkun@huawei.com>, "Zhang, Chen" <chen.zhang@intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Shay Drory <shayd@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>,
 Joao Martins <joao.m.martins@oracle.com>
References: <20221103161620.13120-1-avihaih@nvidia.com>
 <20221103161620.13120-15-avihaih@nvidia.com>
 <20221116113651.0bdcfea1.alex.williamson@redhat.com>
 <2904a876-72c2-45d2-16a4-5a9733b432a7@nvidia.com>
 <20221117111828.4b5641fc.alex.williamson@redhat.com>
From: Avihai Horon <avihaih@nvidia.com>
In-Reply-To: <20221117111828.4b5641fc.alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0313.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::12) To DM6PR12MB5549.namprd12.prod.outlook.com
 (2603:10b6:5:209::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB5549:EE_|DM6PR12MB4532:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e52bb5c-38cc-4a07-db69-08dacadb28fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6oIYiAoWXr7iht7JG9q2nJXPmbgRZoqL9d8Gxe5pATlCiacXWRiipvZ31H7Yen5TV+OCvvpKdGOuGVN955JwHz+S63H+WspyzwKMyvJZSxlfBBzXvmv7e5jRM4cRMkzzafUbNeQHiUb9CiSuNKLDk7zzGJy6IZuBneiOk4tAI03iwcpCBhmmF7kMa8PTXQ0XFJrxwU9VGsMWcMuvIbOJcluv+YEj38vNDUFfdnDBmORijLXNGgWRkR83Pe3rLn77LqyVh/KnXGY0Y3c+Hfvpntzk7J3HtbRl00+h60v5yTBryVexnolCHpXoZ2I6l70LcTF8x68sXtPZpwsZHFUz7m0QVcNxdtDCtNhcHg8gv5RYnWgcTkZlmqz4tQe+GknZrmp0cIxgBxLP/cqUB47Ms8WhGWuCkrIrfVg8TuPIyTbczKMo5SM7GZec8fjqOTyJ9gHCYhFW6Dw/FljwIgAVteHR/biqZyhvf8WvOn405IstcFpa1wXGJZ4I11fibiOK/GEVnJf5ShVsVzq2me61ChIIAHpEQ+mLq7L45Nv+BRR0ozbLB/3Yqf6zyEboNauA5v6+bNo2oYH7kCGuDWfCGhGQop6Wltcz3uH6icKAEx8piXSi2nUB9/qxOfTJ8A2U99R0qy4y+95Sf5+iQVjdY0sKSw6cJ9M19qNZ4i+qhIXpCsMz1ygFIa19DlHPVPhhsRuMlJGkL6wJC63zkf3qI6Gz08HDeMiJg8ptOVzeQAQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5549.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(136003)(39860400002)(346002)(376002)(366004)(451199015)(6666004)(6512007)(6506007)(2616005)(186003)(53546011)(26005)(6486002)(2906002)(36756003)(478600001)(38100700002)(31696002)(86362001)(83380400001)(8936002)(7416002)(41300700001)(31686004)(66476007)(66556008)(66946007)(8676002)(5660300002)(4326008)(54906003)(6916009)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2xXMzhjdlAyRyt1SUUwSW9oanp1VmJ3VEorMkFKNHNZNTd3NG1QUHVaa2lX?=
 =?utf-8?B?eDV3ZnNvbXNPbzlhQWJUbFVTemxKTmxhdFg2REg1b3VWVnZaZ3NpM0YvNGVt?=
 =?utf-8?B?UUY1OHAyUEpmd0prbUNhZkFzTUtCeTFpelVoQk5pOGgwdXJheXR6L0F2eURB?=
 =?utf-8?B?UmxvcjdROHZyYjRFdExTTXpKaHdsRURkVVBOai9lS0huSDVzdTg4WFFLdldY?=
 =?utf-8?B?TkwyWWp1MWhiaGVtSE1XNWtQSTBtdEs3b1NSUVFTUE9BMVpmUklZNm91Q3hs?=
 =?utf-8?B?OHQ0ZGdSenNOS2pzYXVpRUtET2NhUGJjSy9UVDh3WnJ5UU9VL3BOTkhzMGkr?=
 =?utf-8?B?dS9qc3hvTWxxTkJSVzJ1dEhXTzRJWkpIdUZCRWw5YUF2S1VOcHFrbTdqUzl0?=
 =?utf-8?B?enY5bDRCc01FOENjakZnUHZTMWhrOFdVWEtxNFlxRVU2YlhlOE1mSHlYV0hX?=
 =?utf-8?B?MDlXNjZyb2FEc2F5bXNSc2FldVo2NUdxRGpQdjd3Z2l5dzlQeU9GV2ZleEcx?=
 =?utf-8?B?UUt0MFN1V1RHK09Jc1hJbXZxR2xtQld6cWtzSkhzZzUyeWR0bTZySUVmb2Nq?=
 =?utf-8?B?b0hjeHp4cHBHSlFYN1NXVDdySUJiSjIzdkluL3hzTDlOeCtnNlpmNlV1Tllt?=
 =?utf-8?B?NXlhMm8ra0hZUVF3Q0lzSXF2ZktXekZIQVhjL050SURXK3A1cGlQMXZRSFdr?=
 =?utf-8?B?enc5WnJDc3huSU5IdytXc1FKbzI4emJKYU5IQzVlV3ZaWVFHQjVNZWxSQk9O?=
 =?utf-8?B?NXlqcDlyVVNZS0Y1SSt5S3Q5bTZ0VjNhckhMT2tpRElXMC80VG9vdjlQZFVB?=
 =?utf-8?B?alowdVhBWUhQSVVUQ3VObTZQNDNhbEpQMFJaalJUeDlDRFVYVi9VQzZrLytD?=
 =?utf-8?B?ZGRwY0c5dHFyNDZUVWVmWkdzaTJLWXgyUXF6SGk2aUIwNmxGYUpoNVNYYU43?=
 =?utf-8?B?U2hWT3hVVTZXSnY5S2hmb0RlYktSUWJrL2ZXSHozc3p0RlZOaDlSY291TVlO?=
 =?utf-8?B?c0hGd3NUM2VYaTcxa3VJOVV1d1VXMlVzV0I5YWtUWGIyY1RZK0d5Zi9vdUlI?=
 =?utf-8?B?NkdOcDhWd3JtOXI2eGFZbXdPRmkxbElaN3FBRWM1SytjMUZoTHZLMUFWU05W?=
 =?utf-8?B?Y1Y2alNuRHRIRHFFMU1tN0pRbWxtampEam9JcGlROGgxUGd3RW9mdVlDdTM0?=
 =?utf-8?B?MDVldFRjUEtpcHh6c3RadGpqTUI1cUR1MmtrcHd5TmowUVA1c3ZZOE9aSzhT?=
 =?utf-8?B?blJwSE1PSXpJLzJTTzNZa3hNM2RCN1VFd0VWVVViUG9HYXIvOFJxN2FaajQy?=
 =?utf-8?B?UkppZEFDVDcxbjExR3hsa1ZRRzNkWTdrb25jNDlSd0hWOUIrMGdvbEdQU0Vv?=
 =?utf-8?B?RUlGcUg3UHZvSGQva3VBdGZKNXl1RFMwMVBQMTE1aVlMclZuR3FPUWFGT1RI?=
 =?utf-8?B?MjY1dXB6cGM2QnVoQ212dm40cjUraDVPdWs2QWczNnJiYW1TTFoxTHZ0UThh?=
 =?utf-8?B?RFUzV2l1R2VEVEM1anV5WlI1emZuZDk2Q2FKb2E2UzFGNVAwOHAzUzFXVk4z?=
 =?utf-8?B?SzRqSFlxdjBtUHVIbVNldlNta2UxdDlrYW5qNWgxWkNFNDQvd2t0N1ZDZVhx?=
 =?utf-8?B?aGdPd3lIdDZITGJoMUVWaXdGVE9abmVlKzdKM0pUWHhNdzBBYjc5L0FHR25B?=
 =?utf-8?B?aHhUU1Q2SE9BSkszaUIwWlk1R0l6SWxkaU5tR3N1VnVENTltalFrSHpkckFM?=
 =?utf-8?B?Vm9ydFNGV2xRMEJoOFJSYzM0NVlsM0E1MmtVTERuZ0xYTXpLZGQ5SG8ybmVh?=
 =?utf-8?B?UnE3U2dvUGM1WXFYajZNaXFVQWk2NzQ0c05ESHYzNEtFUHVBSFFLNzEzMEdQ?=
 =?utf-8?B?ZElOMnlmZzJYdU1kaE1WNU5tTzJNdUFFOHk2N2NOK0FPUlhQZ2ZqUFNUNDY4?=
 =?utf-8?B?K2JsM0d3R3djVmtDK2xxdzJhNEhRaWpRVVlYUWJXcENMaVJza29RWmpVa2ht?=
 =?utf-8?B?K2lQTkd1V2NNYUlQUDk4S0M5QzVvWUhnNzJLaGNlN0R3aGh2SlNRQ2lteUtu?=
 =?utf-8?B?SFBsRStWY2NBNHNvWTJuUG1rUjBuVlh4UmRkdlRsS1BHN1NabGQ0SzNjUnYx?=
 =?utf-8?Q?UYDnkYTJthuwbUipsewXO8xMY?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e52bb5c-38cc-4a07-db69-08dacadb28fb
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5549.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2022 09:39:46.3245 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vS3HqX+mLr64yueGJdG3bre1/7i3NEc2DEsUACTM9fB6dY0SOi3DTHinfa4r5gyM1fedb7YYrihWGyJWuGXOIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4532
Received-SPF: softfail client-ip=2a01:111:f400:fe59::631;
 envelope-from=avihaih@nvidia.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_HELO_PASS=-0.001,
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


On 17/11/2022 20:18, Alex Williamson wrote:
> External email: Use caution opening links or attachments
>
>
> On Thu, 17 Nov 2022 19:11:47 +0200
> Avihai Horon <avihaih@nvidia.com> wrote:
>
>> On 16/11/2022 20:36, Alex Williamson wrote:
>>> External email: Use caution opening links or attachments
>>>
>>>
>>> On Thu, 3 Nov 2022 18:16:17 +0200
>>> Avihai Horon <avihaih@nvidia.com> wrote:
>>>
>>>> If vfio_migration_set_state() fails to set the device in the requested
>>>> state it tries to put it in a recover state. If setting the device in
>>>> the recover state fails as well, hw_error is triggered and the VM is
>>>> aborted.
>>>>
>>>> To improve user experience and avoid VM data loss, reset the device with
>>>> VFIO_RESET_DEVICE instead of aborting the VM.
>>>>
>>>> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
>>>> ---
>>>>    hw/vfio/migration.c | 14 ++++++++++++--
>>>>    1 file changed, 12 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
>>>> index f8c3228314..e8068b9147 100644
>>>> --- a/hw/vfio/migration.c
>>>> +++ b/hw/vfio/migration.c
>>>> @@ -92,8 +92,18 @@ static int vfio_migration_set_state(VFIODevice *vbasedev,
>>>>
>>>>            mig_state->device_state = recover_state;
>>>>            if (ioctl(vbasedev->fd, VFIO_DEVICE_FEATURE, feature)) {
>>>> -            hw_error("%s: Failed setting device in recover state, err: %s",
>>>> -                     vbasedev->name, strerror(errno));
>>>> +            error_report(
>>>> +                "%s: Failed setting device in recover state, err: %s. Resetting device",
>>>> +                         vbasedev->name, strerror(errno));
>>>> +
>>>> +            if (ioctl(vbasedev->fd, VFIO_DEVICE_RESET)) {
>>>> +                hw_error("%s: Failed resetting device, err: %s", vbasedev->name,
>>>> +                         strerror(errno));
>>>> +            }
>>>> +
>>>> +            migration->device_state = VFIO_DEVICE_STATE_RUNNING;
>>>> +
>>>> +            return -1;
>>>>            }
>>>>
>>>>            migration->device_state = recover_state;
>>> This addresses one of my comments on 12/ and should probably be rolled
>>> in there.
>> Not sure to which comment you refer to. Could you elaborate?
> Hmm, I guess I thought this was in the section immediately following
> where I questioned going to recovery state.  I'm still not sure why
> this is a separate patch from the initial implementation of the
> function in 12/ though.

This adds new functionality comparing to v1, so I thought this should be 
in its own patch.

I can squash it to patch 12 if you want.


