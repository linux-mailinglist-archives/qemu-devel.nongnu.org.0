Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FEB9582A04
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 17:52:55 +0200 (CEST)
Received: from localhost ([::1]:45154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGjLB-0006MA-W8
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 11:52:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1oGjJU-0004x5-1P
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 11:51:08 -0400
Received: from mail-dm6nam10on2062a.outbound.protection.outlook.com
 ([2a01:111:f400:7e88::62a]:52112
 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1oGjJP-0000y3-Fi
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 11:51:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HAThZ4fIolGJRfyQrs3pFSx6coMFwzMkmarcAbFtTEl0AVv5TgG1zxbbBDYsFx6qARrELRlq+UkvG3LzIiLK8g6KBUn0btua/DLoFsm4FhV/Eqq41voSOOW8eKewv3SkBVqon13NuoLBy0Q+UeoS99YiWagGf0K5AdXR8zoAqjwK4O0DRXq/OauiuUfLo+R1J+7yx7MUxjjZg8yHp49+XspEUIH6cB893AxPHraxjK6Bhj2fIr4Zqst92GQ/yu3s33yP5soVhutOi8R0yCVzEdE9tXTtJ59ot5sgMPrH5kOkKinXQTpkBcOrQ1pw/50sinQ67/BA0uk03r2qJ8W0UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1iw7rDFyh1imEGbNybqizIMDbobocA+PAxcBsSR86HY=;
 b=FjzxDh0FRcyBjjZuCqQTpd8QBdGz7NHfApgMFpMQXtJKLpJooWuZwjta9dl8naJwBzY3VBkZZyoguTMi07Frkl3BfXVGpURWzZqJMZJbFajD9KhoKHSIbF5XRycRmtZzFrGVQiYa/eypi/HeIJ/e0HrtVtHVNR5ymME3ep7pa605RLqpYbgZezaAS5PIHH0AgcOGunDZc6ILPn0uUV5iZGoAL1mDaaXywnsj14uD+BgPnxCALVTDVWAY5xx7JWqQL9Fn68lEmBR5XzN0pYEnw4OGgupnGXt3avPBqm8UIWAV7AU6NRsnIJ7kUNXgRKzi9aJ+qG++ztbOTOJv4lIEzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1iw7rDFyh1imEGbNybqizIMDbobocA+PAxcBsSR86HY=;
 b=f0t+43YurXiNb6sT1V3VIFdxVUdnKT245+Q5lVjTvNXr60CaFAI97HSyi6X2pqoM9BGhGc5uTGMhTNfxfNBeGEZhtA6Wej+Hq2IOayyGqitlUyq5jiZK0Ent4RLhMG1d56yRi4FppxnLK3qUlKK66BGDSbfrlzhC1spOtdMWkS/FTn4Em3BcmDNMbR526sYri1c8aPUn8lKLjnNBIllvOes/jk/Kvm6/1M8f27zInocFRzdKpT8Mk4aDddokE3UP0LWxRKuTY/1Dw0gnI/hdew14BLEV80REFP7FrTB+Iuxx4sQ00UQbgiDg2hR4KHYJA4Wu+nlIh4J8YIZyPNvgLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB5549.namprd12.prod.outlook.com (2603:10b6:5:209::13)
 by MN2PR12MB3151.namprd12.prod.outlook.com (2603:10b6:208:d1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Wed, 27 Jul
 2022 15:45:54 +0000
Received: from DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::e4ed:a822:b348:f38d]) by DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::e4ed:a822:b348:f38d%8]) with mapi id 15.20.5458.025; Wed, 27 Jul 2022
 15:45:54 +0000
Message-ID: <39f6d299-96c8-9e8c-dcbc-0e4873fd225f@nvidia.com>
Date: Wed, 27 Jul 2022 18:45:46 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 07/11] vfio/migration: Implement VFIO migration
 protocol v2
Content-Language: en-US
To: Jason Gunthorpe <jgg@nvidia.com>, Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>, Yishai Hadas <yishaih@nvidia.com>,
 Mark Bloch <mbloch@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>
References: <20220530170739.19072-1-avihaih@nvidia.com>
 <20220530170739.19072-8-avihaih@nvidia.com>
 <20220718151219.GA60193@nvidia.com>
From: Avihai Horon <avihaih@nvidia.com>
In-Reply-To: <20220718151219.GA60193@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0071.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::35) To DM6PR12MB5549.namprd12.prod.outlook.com
 (2603:10b6:5:209::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d2ac5c47-9637-4e20-fad7-08da6fe716e5
X-MS-TrafficTypeDiagnostic: MN2PR12MB3151:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Cv8R67PA0yb/CsvW+m9BRW9cTw22YWXX5UoVZ23JpkCFW0v4bTTZJnW9UV2RfZT3r5XkZ026mke7MYCKAfWKE3fFi6pjPhyW8gBsJ22h4/yGfawXXROgql3HJbfAU16ikxHkvlbjgFHPKzMuxOEPPycAMzXNy8fm2CbRVvb1480eDjRpszbf71SkIsUUvXDHPOCjiRon+o6PlTRqbIoKusC/lmF+Peq/C7Bre+E5wVRLJoLZ7df57YGIx7gDPdWXGG5aA84Dm23urmv6SFFCpLey/vBMRMXDfDlO/F6M7E3opHbGi6xJY2DcrmUWB5PznAWdQXDtc+c89na71VS97CTwK0+OmQA8M+KboeCa6d99UISiP/keG6rwqwAdk0AvofMkODl48fuoG7pJkgEanxy9AVArfkosodDfGG5zutc8B1harVIFhk+FEpakyQ8PqoWdCMtlR4dfpOxJjWxh4u6dgj6DiI4JI64nNxhHx66JKEnoz3axlYqEoGBSaYrtsoylLmaujWfSCAoplW5xUGHqwnoG2XujwcthKNY+gElFL7VHKmkBZ8rAKRxR3JRTv+aaDzR0t52mJ9//BQqJ+8Wr5cqQov8nyGqCiNOPFO3Omawrtcl8VGWHot3LNW3Qra7iv6tpTLKsvAsEFj1M0hHA995fVpuMXiKabziNVC91A5AQGlgu4Z87mqLHIUiEXIKCbLNKKK/Vb+Ve9XgXtiaxgkVbT/C5VhpMidiHGGj/Um0/3ka88eSjkpaLV/VgYPZ+aM5EPlOOtQD5VcF72FXoFgS/KdZVNMid323Xjx1yV2YP78Gu22XfVzPPifyvRs3J4N5RUzAVAsfo0HhQgw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5549.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(39860400002)(136003)(366004)(376002)(346002)(53546011)(66476007)(66946007)(4326008)(8936002)(8676002)(66556008)(6512007)(26005)(6486002)(5660300002)(31686004)(2616005)(316002)(38100700002)(478600001)(54906003)(6506007)(107886003)(86362001)(41300700001)(6666004)(36756003)(83380400001)(2906002)(186003)(110136005)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmRCbWpOY0gwbzBROVhSakVWaUo1RDgwVER6Yng4YXpkNmM0eEl5Vk1YN0hk?=
 =?utf-8?B?K0VBdUozdkQzZXR4WjY1V3ZHWGlWOVVDM25RaWRQZFNHN2ViRnhBcDJiQ0xV?=
 =?utf-8?B?UGMwdm5COW9MTlh2TEhnTlp0NTE5M2xzb00yWnh0eEUwWWR6MmRIRFJnWHVs?=
 =?utf-8?B?OUlOYXZVK0hHSmF5MS9sSW4wQWxxQkJKenRWVTRWdUg5Y0YwYldDZVAyNlFR?=
 =?utf-8?B?L1NKQi9GQzJrMG9PbWMvNm14cnpLNytpczJTS1Rjck40OUN2TTdoYi9RS1Jx?=
 =?utf-8?B?T3Fvb2R3Q0ZXWERENEFxOU16S2xrZmhSWWwrQnJmOGlJUkJ5Q3g5clNFM2xy?=
 =?utf-8?B?b0lpSC9SUnRCV0g1ZkY0VkRxTXBwdXQvK1lGNXhPRjVqWm9DVlZQbnJQN2Jv?=
 =?utf-8?B?eEFCcnloSXowamNkdDNDZ0xYUzBZQU8xNFNBSTJjaXlFMzUwVkltY21EU2Yr?=
 =?utf-8?B?NWRUc0RkcW52dmNyVmJZV040Q29OREk1djl1Zm9ibHcvczNsWlJCb1B1d3lX?=
 =?utf-8?B?V2RzV0JpWFBWa1VBYVcrYjhjelJiVnF3WFBMOWwvNnA4bWgzWXJQQmRWS2h3?=
 =?utf-8?B?TUJwa1lxdEs0R2xNQzA0YXV6VlV3TVRhSTNDTVRqQlFSdW5OWGVJeVR4UE1P?=
 =?utf-8?B?TVBFN2ZNdFArdTN4dVFxbXlpMTd0YWZiQjdlOGp6RjhXVTNFTmhuUzkxWUF1?=
 =?utf-8?B?Vm9hMjlpTGFSRWoyb01nY1EvQlQ1MyszL2E4V0ljemQ3SG1tcHRFM1NxNzJE?=
 =?utf-8?B?MVduQlJqSnoyT2IzWDFPTGsyQU5OR0FDWGtjRGIvYlc1OFc1ekJUYzBveUVC?=
 =?utf-8?B?ajBJK29JSGc3N1VyVS8xTm9wUW9TWkczSCtoV1IyMjhsN2N5RjFDT1RSRm1R?=
 =?utf-8?B?VmZFWjFSMVdjNU1ndFBiOEw1dGVMeDRjODdZemtHSElmSEc4LzQ1eDVzRlk2?=
 =?utf-8?B?UHJqOTV2RUtBdGtmK1hHQWZXNTJ5T2Q3SThrY241ZkJpOHlES0lDL1M3QVA2?=
 =?utf-8?B?Q3BLM3piZnZlbktDOC9XaUhPZXBoVWV5c0htT09ZRVhnSThGUXE5VS91aUFh?=
 =?utf-8?B?NTk0K1lTa2xDMnYwWlR4SjQ0L1V2TEhsK05FMmxkNC96eUdQT2xpSHRNNlJt?=
 =?utf-8?B?RmhzQldDWHJUL056OTB6MThmNFJTcWJPVllqT2RGc2NONVRkeUFUZUJMVWZ1?=
 =?utf-8?B?WWpJWlVRcWJOSEtYdUE1MXJXOFV5dTBia2xabVk4SmVld2pPa0hZRkRSQXdY?=
 =?utf-8?B?d2p0UGpCOUZxQmRZM21oNmFaemEwczEzRG5UNFBzZ1czNUdTOGRrSlYwSEhZ?=
 =?utf-8?B?OVNnRkVBdW9MRndPL1pTRU4xWmZQOTZYMm1NZG8rcGU0ZkI0bWk4S25XSUlL?=
 =?utf-8?B?YVRwTG5BWlNMOXlhc2RJNmZvTlNraFJCVnFDbXQvMlY2TWtRWVhndXoyZ1ZY?=
 =?utf-8?B?NVRLOHJDa0gwNXhxbVlzU3RhdWI3ZXlNTDd5T1BmVWpDdm1VeXV1dm1oOUZ5?=
 =?utf-8?B?eUdGWGNCdEtydE44RzJDMVpFYkk5K1ZYdGNnU21Hc2swWjNBUkRjU3VrYzBW?=
 =?utf-8?B?am5GUGV6aER3Si9meVg1MTVXQkJxM1E0djdIbkUxM0RKcmtEOGNEK2IzTlk5?=
 =?utf-8?B?QkM0eVZuUzZxQThqcUtDMCs3MlZ5RTV3VWhFNnFnNHhpODE2YTJyYXVwTC8y?=
 =?utf-8?B?SWFvK0djckdlem5LcThWV2tlUGIzbldQYjFhVVkxeWRKWUFqOVJRZzFhQTlL?=
 =?utf-8?B?M0ZraHY5V2g2bWhVNVcyWFg5cGN0ek9teEVGTmpWdEFOeERjN084T3BwT1V2?=
 =?utf-8?B?NUVmbXcwU2Q3Njk2ZGE0SVhYU3cydC9SYUt0aTg5anYyNkd1TjJSakVld2sx?=
 =?utf-8?B?aUd0cFVKYyt3NUdIV1lCWllnMjQwbnh2bENhVkx3dUQyT01oc2M2WlFhTzV1?=
 =?utf-8?B?WGUxWElLSVhYUm5KWTc1aUFqbTlRVm5OblZubVZZTVZ3ZnJkUU85ZlhMR0p6?=
 =?utf-8?B?SGE1S0NrT0JQdmtRZk5XMFZwTkdySHRRQzZWSGN1N2JqcUd4bWs2dmIzalNN?=
 =?utf-8?B?T04ycXEyQ2xvTy8vMndEd3pQMGsvei9QdUxFMlVORGt5OGNpWHIwbUhYVEY5?=
 =?utf-8?Q?YiX4p5blwjwEYRJU4vijG2y5q?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2ac5c47-9637-4e20-fad7-08da6fe716e5
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5549.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2022 15:45:54.0364 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OQfgjrXDTApxdLG0CBxE42TXjf+mud3vmgpNam4pLKrCwJYnc6WgbBWYFfKkPFiFjrOPROb0SgIk6koExXFNzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3151
Received-SPF: softfail client-ip=2a01:111:f400:7e88::62a;
 envelope-from=avihaih@nvidia.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
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


On 7/18/2022 6:12 PM, Jason Gunthorpe wrote:
> On Mon, May 30, 2022 at 08:07:35PM +0300, Avihai Horon wrote:
>
>> +/* Returns 1 if end-of-stream is reached, 0 if more data and -1 if error */
>> +static int vfio_save_block(QEMUFile *f, VFIOMigration *migration)
>> +{
>> +    ssize_t data_size;
>> +
>> +    data_size = read(migration->data_fd, migration->data_buffer,
>> +                     migration->data_buffer_size);
>> +    if (data_size < 0) {
>> +        return -1;
>> +    }
>> +    if (data_size == 0) {
>> +        return 1;
>> +    }
>> +
>> +    qemu_put_be64(f, VFIO_MIG_FLAG_DEV_DATA_STATE);
>> +    qemu_put_be64(f, data_size);
>> +    qemu_put_buffer_async(f, migration->data_buffer, data_size, false);
>> +    qemu_fflush(f);
>> +    bytes_transferred += data_size;
>> +
>> +    trace_vfio_save_block(migration->vbasedev->name, data_size);
>> +
>> +    return qemu_file_get_error(f);
>> +}
> We looked at this from an eye to "how much data is transfered" per
> callback.
>
> The above function is the basic data mover, and
> 'migration->data_buffer_size' is set to 1MB at the moment.
>
> So, we product up to 1MB VFIO_MIG_FLAG_DEV_DATA_STATE sections.
>
> This series does not include the precopy support, but that will
> include a precopy 'save_live_iterate' function like this:
>
> static int vfio_save_iterate(QEMUFile *f, void *opaque)
> {
>      VFIODevice *vbasedev = opaque;
>      VFIOMigration *migration = vbasedev->migration;
>      int ret;
>
>      ret = vfio_save_block(f, migration);
>      if (ret < 0) {
>          return ret;
>      }
>      if (ret == 1) {
>          return 1;
>      }
>      qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
>      return 0;
> }
>
> Thus, during precopy this will never do more than 1MB per callback.
>
>> +static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
>> +{
>> +    VFIODevice *vbasedev = opaque;
>> +    enum vfio_device_mig_state recover_state;
>> +    int ret;
>> +
>> +    /* We reach here with device state STOP or STOP_COPY only */
>> +    recover_state = VFIO_DEVICE_STATE_STOP;
>> +    ret = vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_STOP_COPY,
>> +                                   recover_state);
>> +    if (ret) {
>> +        return ret;
>> +    }
>> +
>> +    do {
>> +        ret = vfio_save_block(f, vbasedev->migration);
>> +        if (ret < 0) {
>> +            return ret;
>> +        }
>> +    } while (!ret);
> This seems to be the main problem where we chain together 1MB blocks
> until the entire completed precopy data is completed. The above is
> hooked to 'save_live_complete_precopy'
>
> So, if we want to break the above up into some 'save_iterate' like
> function, do you have some advice how to do it? The above do/while
> must happen after the VFIO_DEVICE_STATE_STOP_COPY.

Ping.

Juan, AFAIU (and correct me if I am wrong) the problem on source side is 
that save_live_complete_precopy handlers are called with iothread 
locked, so during this time QEMU is non-responsive.
On destination side, we don't yield every now and then like RAM code 
does, so QEMU is non-responsive there as well.

Is it possible to solve this problem by letting the VFIO 
save_live_complete_precopy handler run outside the iothread lock?

For example, add a function to SaveVMHandlers that indicates whether 
this specific save_live_complete_precopy handler should run 
inside/outside iothread lock?
Or add a save_live_complete_precopy_nonblocking handler that runs 
outside the iothread lock?

On destination side, since VFIO data is sent in chunks of 1MB, we can 
yield every now and then.

What do you think?

Thanks.

> For mlx5 the above loop will often be ~10MB's for small VMs and
> 100MB's for big VMs (big meaning making extensive use of RDMA
> functionality), and this will not change with pre-copy support or not.
>
> Is it still a problem?
>
> For other devices, like a GPU, I would imagine pre-copy support is
> implemented and this will be a smaller post-precopy residual.
>
> Jason

