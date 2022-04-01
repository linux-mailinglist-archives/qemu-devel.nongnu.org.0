Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 658A24EF864
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 18:52:47 +0200 (CEST)
Received: from localhost ([::1]:34418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naKVy-0000Z0-1N
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 12:52:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Wei.Huang2@amd.com>)
 id 1naKTB-00072S-Dy
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 12:49:55 -0400
Received: from mail-mw2nam10on2089.outbound.protection.outlook.com
 ([40.107.94.89]:6177 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Wei.Huang2@amd.com>)
 id 1naKT8-0005sU-Ps
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 12:49:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XqygkhPbEn0oQ7HQp8HkZbsbOU4pG4L7LCc/ZLucUR+hh27qqAT9w08BaegfoAEtY6NHWnb1wprZdXO9Ts1aBzrMBfKzHmXLUjkcgROj13i4ZHA8M6SYNF+YkGqbBgD6A86Vf68N8iYsuZLGjpIf9Zr4c/r8ljWMGmr+yy/0H9crwvh1wEJS9BnpHAdI806qcbwFjNVrBHH3OyBqI8CRCZVAz5/K+eROjdLhg8TCN5bAtwCIZHBlo6Q+tz4tpnU32V+Eea+1zL0ifMguCw6/W+M1jZlXYMJ8VRvEcFzVzHq0mFEOoHMmGe4OQ2bN9mqxZq23qFh2o2ieJA5MmPQPVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QJ/ybyPGq8+0ma0r8GPYeAOh/ypAOiUzCjZwXs8pswE=;
 b=RhAHy8VjfIVgb34bzKu8kQBGDdpYBO3GTo3wCOjRNPtNOR6nSu/sEFR9ILMih/fQNzykS4vaMal+5BwQvd5fzXQtj83VjjcOgtuJcqpTrxnAkXzB0D45uyhOuZeSLsk5pL61pPuUuZGKZ6Ee+0sxSqvVn5CKUq5Gos71fOkvEd7QM4KY9ltmZ6AwUf41yERdYDNh2b6/MK8f8DyKIRuX7WtXlezgBN9ghdEJwwBQ5z0shzUYpS1MG9zWScm/HsoPpJ/OB2NcJWunI7P9ykLVtd0epyNG/dlAtqt5MaeMznZFyqf+H/JD1N0AW0F/w5Qamvvru28Ben+IlnvK50w+dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QJ/ybyPGq8+0ma0r8GPYeAOh/ypAOiUzCjZwXs8pswE=;
 b=2+nA8R+eoq+WJztLDlKX2DdudaLWjci3PKXd1JCgF/Hl6UD0vc3G2rK+cPn2T/DdsvIYOWRcVvTiOqtvwIyrpHw39DhFmqBYLT/1XLqaF4uGWZdHIIFHALVoKasYsEGlCPnGWH+iTwexyjAO5AZZ2Z7DHfjBIPyrAr8Vy6HE+M4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR1201MB0201.namprd12.prod.outlook.com (2603:10b6:4:5b::21)
 by CH2PR12MB4907.namprd12.prod.outlook.com (2603:10b6:610:68::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.28; Fri, 1 Apr
 2022 16:11:05 +0000
Received: from DM5PR1201MB0201.namprd12.prod.outlook.com
 ([fe80::f1c0:2437:714c:f92e]) by DM5PR1201MB0201.namprd12.prod.outlook.com
 ([fe80::f1c0:2437:714c:f92e%11]) with mapi id 15.20.5123.025; Fri, 1 Apr 2022
 16:11:05 +0000
Message-ID: <633f66f9-2a86-6d52-15de-d0c557412bf7@amd.com>
Date: Fri, 1 Apr 2022 11:11:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: who's maintaining amd_iommu.c these days?
Content-Language: en-US
To: Jason Wang <jasowang@redhat.com>, Peter Xu <peterx@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin"
 <mst@redhat.com>, Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>
References: <CAFEAcA_17Mzz7AiQd+1z50Jp-wWhfChCVi=8kjWCU6daUVqV_Q@mail.gmail.com>
 <YkXzToltd73X4WgY@xz-m1.local>
 <CACGkMEs41rX5FqtKst4qZc1QXyY1VvMK_GMo_4NRD45zh9VSHg@mail.gmail.com>
From: Wei Huang <wei.huang2@amd.com>
In-Reply-To: <CACGkMEs41rX5FqtKst4qZc1QXyY1VvMK_GMo_4NRD45zh9VSHg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR12CA0016.namprd12.prod.outlook.com
 (2603:10b6:208:a8::29) To DM5PR1201MB0201.namprd12.prod.outlook.com
 (2603:10b6:4:5b::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dafe2f2d-a0ff-44bf-dea8-08da13fa3939
X-MS-TrafficTypeDiagnostic: CH2PR12MB4907:EE_
X-Microsoft-Antispam-PRVS: <CH2PR12MB4907D294319B1A73D089422ECFE09@CH2PR12MB4907.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vX1f6EROF0NFp11tqIvLiANAgSp2B3gCsvjCB1+orR+HeT72o6dDc2noTt9bbqy1S6nSi+UEzdVWNu22cbR8s59gyXud1QgoetN5RYh2O8aya12n8jjpTLVGjKY5CNO788ZDWdQJVXL8FCd1DVef2FTw/OfwnZcIncIQIdorWLUn/uUKJGCUDI/5hktmqqkZ/0aVb+iLY+dB5zq4qYxyXXgmZI8RmbrcUANzKrxWVSCz3nJGUE9dtGq3h+2SfSt8HBOsbKczS/hk0PF2RscqelvYR+O3lSLy9mXZrEP+YKO7S5JEFklLLSX6G6c0PcdgNYCLmguhf1JmgDykGOwljBkSqFGUjmp2aYeKeVOxyUbsiDGwEP9Ytla0A2Exni3Xju9nKw65LdP6SVrmVUfEU5BfWsPDHKakSDi19O5hni+0S0b/Hc6F5kKdctbFPQ3fDIHlA3mcCR9NpmdUo/DmRwX3Jvnsnf5GEaCuQdZZt4Jx4jZ02w1TJObE4TPzs+QNbVm7ng8G1JoEOagof0owKLKfbffqG35bmGpe6gjym21D8oR7Llgsf3Vk+eLCMnloIDSd0o7O1GKJcQCGqg5J6VnDsln24WL1y7GJ8XDxsyfAdsKXW7ybZK/ND3eSIwKPLWMSc95UgYAZcuxet3pL8wWn/x1bWaKkRtiyjMg0wy5773YNkCEQeNo2bzqAlz1US1gAR25ZzdiE7VxxDflhoikDb6KRPKeR76t7tGfABFE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR1201MB0201.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6506007)(53546011)(2906002)(6512007)(6486002)(66556008)(38100700002)(8676002)(4326008)(66476007)(66946007)(8936002)(6666004)(5660300002)(508600001)(83380400001)(110136005)(26005)(186003)(31686004)(316002)(36756003)(54906003)(2616005)(31696002)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHl5OXdhYUhGWFZsNUR5Ynd5MU9BK1ZjZklma05OdFVsRHZxRkZVWDNXK1FV?=
 =?utf-8?B?VGpGb0I3eWdEaGhhU01EYjZySjh1SGdMQVlYUkhLa3ZCZW13dTJ3b0hNdGlR?=
 =?utf-8?B?VkFLQVVseCtqRTk3R0NaaTN2d0NqVHBhMzg3OXVobTV4YXBtOEFrZEs1TFh5?=
 =?utf-8?B?VXV5ZVRKL3EvVzVTeUdjZ2dFZnU2cldHYkpyK2lQOEJTcUJkWWJGYWloamZU?=
 =?utf-8?B?SGl2ckdVMmhrdWRDdHlIREZwazdjOXl3c01PbElhUTFUcXh4U1FsUGlCdWFq?=
 =?utf-8?B?ZEMzREVFQm5MUmJGako2TVpyMFhJZGNabHZxN3JSMEhLY3pSUWNVV0dyd0dQ?=
 =?utf-8?B?c2dqbDdxT04zZG0zbjBXMy9iUTh4VDBvMWtyWURKOVRWV3NmS1kreFhHUWxl?=
 =?utf-8?B?SkxPVWNzVVFGMW1xWlFrVHdOUGxVSWlCZ3o1a2piaDA0NUtZNE5zSGtON1Iz?=
 =?utf-8?B?ZTlXUVh0RWJnbXFscnhmL1NYcnJSS05iNDBqaHM2WjlqUWlQbXorcGxMZnZ3?=
 =?utf-8?B?K01BaXBwQ21FT3Q1TERmNTArMDNSRHN4UXVmaHAydEFVdzcvUFpVaGQrb2c1?=
 =?utf-8?B?Q0FYSDU1UzN6YzZTUEo4TjZFNkoxRzh0czVNVUVIdkdCRWpWYkZ1d3lxZjBB?=
 =?utf-8?B?V1lETVR1NkRISGZjTmx1QWo4SG5MUXdOYVBiK2MxK3JBdnlDMk9rMFBBRkhh?=
 =?utf-8?B?L01vS0NLMUZCdFdrWjdvNlhsRHRKN0UwVTU0VEdwNTRxazJpakJSZFVYVjd6?=
 =?utf-8?B?L1gxb0xPRHVBS3RZWWpXcnVPSlN6U0J0RStFMEpVOGdQZVVDSWdJenNKSmdi?=
 =?utf-8?B?ZVU0TVdzYU5kTUZPcC82Ung0UTNvbkJmcXlQL2Jya0NTVDZzNjRRQ0Y5WDNR?=
 =?utf-8?B?N09sTFNXdlNxVHVqd21XamJ4bFlDVkpIQzkvMmh1VDNOaXNXekxWZ1pUR2NP?=
 =?utf-8?B?dkNNQlR6SC9IdkFWeWVicVRBdHR4Zm8zc2hiN2lua1hjeEVEdlNIbENnTWNq?=
 =?utf-8?B?cWVWdnJKdXI4d2hQazFISDhhcUM0MFRkbDNmZXNmMEtkNTc1R0J5YVdVR29l?=
 =?utf-8?B?VVUxRURqZjA4NkhwV3FtaVYrY2RDaVBDUkNHRHJIV0krV2hVSyt6eHc2MTZM?=
 =?utf-8?B?NGVUczZKem52aVFmcmY2cFJyVmZzUUMxOUtmbEQ3RFJFV1hLbXJsUGNnMlBU?=
 =?utf-8?B?d1NLUGc0ZnhuZGl2VW1MQWZ1aExlYzhuaTBjQWJvdXBaK0pab1c5bm9jME9p?=
 =?utf-8?B?QVhVVkRFRklLMnZRcDBJUkxhZTRyY3ZKSFAzQkFiVTVIcTZMRUloVnpIWGxi?=
 =?utf-8?B?M0FVUTI4UlVMZ2JubjZFRnBzRDdjMHhQdS9tY0FFNmRLWWRwQSswVW04QmMw?=
 =?utf-8?B?bExEN1YzWTR3T2pxUlUvbjQvd01NVTlhUTB0SHpVcm12V3BzbHBxZ3BScmNR?=
 =?utf-8?B?VDJORHVXTitUR3U3cTg1eGtUNXRmNGYzcGxjd0o4WEJFeTI1S3J5R0cvMUlX?=
 =?utf-8?B?d1EyNGFuV0xQYXBHSTZ2UlZBOGttRXhsMXQ0c3NXM05ITFMwRlNOQVZKTEVj?=
 =?utf-8?B?UDZtaHZKL3M4bVZaY052dlFWMlBsdHZlcTlYSFNDcVFkdmdYQ1RMZjJZS2Yx?=
 =?utf-8?B?OUxlcWxWbGxTZzlpbi9uSE1IMlRvN2M1MUROMU9SNXZlZzd6NWRaOVgxZkZL?=
 =?utf-8?B?djJyZWpaR2U3NUozT3d3dGdzYmxSNFpaSzVhdS9sYmxEZGI3c2s1NnE1ajBq?=
 =?utf-8?B?UGcyclJVTGZwdHBWVlk1WVBkYTAyaU42Z2hwc0xoaUJZS3Fzamp1TmhKWmxF?=
 =?utf-8?B?YmlPMXVMOFdTdnFCWEpDOUR3VHFyNmhTZ1k0eHFZb0g3MnVyc1doYnQxNG05?=
 =?utf-8?B?ZHFoUEtVd2lLQnI0REZaRHpXTFV0VFlXeEdRc05DZG5sY3RsWUtaWnYxQnZF?=
 =?utf-8?B?VnZHN1lPblBQVEtnWjNIQnBoMkRvcHNiQk45cTVRVE5XZ1Y5aFcxWHZDOU9q?=
 =?utf-8?B?eWpheVZKYzdwWDVjU2NuMTJRcit3VkViUXZDWm9OUDVBLzBmSXUvYnNRYVlF?=
 =?utf-8?B?ak1pMFFveTEvcnk1MmhUZ28zQVJVdlZkZTdEdXNnbGZSOWZrZDNxcVpRcnpl?=
 =?utf-8?B?RDV5NmpFS1lXYTZGek5OWmdSckNTSm8zaFZ3WmtMNisrdjZIZFJuUXh6aktL?=
 =?utf-8?B?dkVVUUNReVRrdkFMYks2NFQrQ2c2ejdrM1ZnN255bkRVRDRSbThEU3l5azB0?=
 =?utf-8?B?NXhnaEhjcy9UQzFJRkFka25FMElWSzMrYTR0SHA4MDVtNngrTHp5QVdLZEhi?=
 =?utf-8?B?MXlHRGFpeC9OYll5dXhZejF3bFk3dFhleHdzRFZKaU55cjU5ZVI0Zz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dafe2f2d-a0ff-44bf-dea8-08da13fa3939
X-MS-Exchange-CrossTenant-AuthSource: DM5PR1201MB0201.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2022 16:11:05.0754 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NJz2R/FS9fNGn9Iz+E8KgnIC2fM+9EU3bjEus13cLmsaSnaprUjRfNzDoCnTMGBk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4907
Received-SPF: softfail client-ip=40.107.94.89; envelope-from=Wei.Huang2@amd.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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



On 3/31/22 21:09, Jason Wang wrote:
> On Fri, Apr 1, 2022 at 2:30 AM Peter Xu <peterx@redhat.com> wrote:
>>
>> On Thu, Mar 31, 2022 at 05:01:52PM +0100, Peter Maydell wrote:
>>> Coverity points out some problems with hw/i386/amd_iommu.c's event
>>> logging code -- specifically, CID 1487115 1487116 1487190 1487200
>>> 1487232 1487258 are all the same basic problem, which is that various
>>> functions declare a local "uint64_t evt[4]", populate only some
>>> bits of it and then write it to guest memory, so we end up using
>>> uninitialized host data and leaking it to the guest. I was going to
>>> write a fix for this, but in looking at the code I noticed that
>>> it has more extensive problems:
>>>
>>> (1) these functions allocate an array of 4 64-bit values,
>>> but we only copy 2 to the guest, because AMDVI_EVENT_LEN is 16.
>>> Looking at the spec, I think that the length is right and it's
>>> really 4 32-bit values (or 2 64-bit values, if you like).

Yes, amd event log entry size is 16 bytes. This should be easy to fixed.

>>>
>>> (2) There are host-endianness bugs, because we assemble the
>>> event as a set of host-endianness values but then write them
>>> to guest memory as a bag-of-bytes with dma_memory_write()

I doubt people will enable AMD IOMMUs in QEMU on non-x86 host. 
Nevertheless this can be problematic and should be addressed.

>>>
>>> (3) amdvi_encode_event() is throwing away most of its
>>> "addr" argument, because it calls
>>>    amdvi_setevent_bits(evt, addr, 63, 64) apparently intending
>>> that to write 64 bits starting at 63 bits into the packet, but
>>> the amdvi_setevent_bits() function only ever updates one
>>> uint64_t in the array, so it will in fact write bit 63 and
>>> nothing else.

Agreed

>>>
>>> (4) The claimed bit layout of the event structure doesn't
>>> match up with the one in the spec document I found. This
>>> could be because I found a document for some other bit
>>> of hardware, of course.
Could you elaborate? Are you referring to amdvi_setevent_bits(evt, info, 
55, 8)?

>>>
>>> Anyway, adding all these up, the event logging probably
>>> needs a bit of a restructuring, and that should ideally be
>>> done by somebody who (a) knows the hardware we're emulating
>>> here and (b) is in a position to test things. Any volunteers?
>>
>> Copying some AMD developers (from where I saw the last patches from)...
> 
> Btw, the AMD IOMMU seems not to work for a while (just boot it with
> virtio-blk and it still doesn't work).
> 

This can be related to address space notifier problem I encountered. We 
will take care of these issues mentioned in this email thread.

> Thanks
> 
>>
>> --
>> Peter Xu
>>
> 

