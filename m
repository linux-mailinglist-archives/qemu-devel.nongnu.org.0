Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBF467EC37
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 18:14:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLSIM-0001bW-Vd; Fri, 27 Jan 2023 12:13:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gautam.dawar@amd.com>)
 id 1pLSDK-0007Yx-Vq
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 12:08:35 -0500
Received: from mail-co1nam11on2062d.outbound.protection.outlook.com
 ([2a01:111:f400:7eab::62d]
 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gautam.dawar@amd.com>)
 id 1pLSDI-0002SM-PQ
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 12:08:34 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hjkjhq2P0gY6x498pGculUePQUQaLJ8u9rj8eC3Oaq0QzTeXKBQtyg3Evh1YFWlqlEp/HgO6LUYfrzvJkW7PMdGDM+C8rn4wJZKt4qKU3rL2cGkNYsAXM4E0jVDVBmhlYFek4gNafxTH6hgFCrKrijP82TDrpNsy/uei3xptAzLsXLYQN3yEfTeVuiBUwnHcG87qLWb8611A5l/4uiuOYVKT2/M1ZYBFYE/q37kkQg14FGYd3O6QOZ+yPtqRBQfWY0pgU1TZifgFTeF503GVD5xGe711wWQvQrxLkt/uTHHJIOveUGjaTxGCjgKc0R5bN0pZad67atIId54H+N7lzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HfZ6kyJ8TNJoD6aAFWdeugq58kwqNpABNq6o7JYGPf4=;
 b=DGEUUMbBp4RRGzqCHE0h1CWhYOxSrsUjqr6YM8WoUGQKgHDNZQ+64Ju6qCp+XjONjR2QcILdKfauTZW1C0DSn7YyfQJqa1u1atu6U8CW+2czUvl9bz5m/l4w02hSsd1036eC2/EmbqnRN0DAEQBlfELkCp1d0J6H3lqspO1QyiH0k7/VGZ3dsizEe77P0HkV7wI+tatkbbldcS03WGnUSvJF8AsLZ+XvZpjGUT5i1qT5dX8EwenXOpNlDsl1IcaG+E9Rg96kZcBeVQIIe8nMsVktI9MP2GaOCX9SGennKO3oW6UDfHOhPcP3p4N3IZHi8S3yPANWxMh4CpDNp2MyCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HfZ6kyJ8TNJoD6aAFWdeugq58kwqNpABNq6o7JYGPf4=;
 b=wt2MQEtdJJXxzl4zXehtmrEexxwd86Kt1MmVVpRS0GH/Lp8LQN5cW+3gVzH2B+UyCT2npKmNIwIQ9ySL5p9vUI36f+4MvmitpNyu0jS9E/soPk7RciXp2gIFRfvRkhiEpgbNTu27bPiAxqeYNov8MCxuMiSUlSjBfZdEmT4wFNI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5825.namprd12.prod.outlook.com (2603:10b6:208:394::20)
 by DS7PR12MB5863.namprd12.prod.outlook.com (2603:10b6:8:7a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Fri, 27 Jan
 2023 17:03:24 +0000
Received: from BL1PR12MB5825.namprd12.prod.outlook.com
 ([fe80::e36e:5151:6912:18e]) by BL1PR12MB5825.namprd12.prod.outlook.com
 ([fe80::e36e:5151:6912:18e%6]) with mapi id 15.20.6043.025; Fri, 27 Jan 2023
 17:03:24 +0000
Message-ID: <73a65f25-855a-aa98-5c77-076ae483d8be@amd.com>
Date: Fri, 27 Jan 2023 22:33:14 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] virtio-net: clear guest_announce feature if no cvq backend
Content-Language: en-US
To: Eugenio Perez Martin <eperezma@redhat.com>,
 David Edmondson <david.edmondson@oracle.com>
Cc: qemu-devel@nongnu.org, leiyang@redhat.com,
 "Michael S. Tsirkin" <mst@redhat.com>, gautam.dawar@amd.com,
 Jason Wang <jasowang@redhat.com>, Laurent Vivier <lvivier@redhat.com>
References: <20230124161159.2182117-1-eperezma@redhat.com>
 <m2y1pq1xy9.fsf@oracle.com>
 <CAJaqyWfcftb69Hh5O7gQqUZ6aK+wKsP3p3rquSjbr8avnR-prQ@mail.gmail.com>
From: Gautam Dawar <gdawar@amd.com>
In-Reply-To: <CAJaqyWfcftb69Hh5O7gQqUZ6aK+wKsP3p3rquSjbr8avnR-prQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0015.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:95::19) To BL1PR12MB5825.namprd12.prod.outlook.com
 (2603:10b6:208:394::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5825:EE_|DS7PR12MB5863:EE_
X-MS-Office365-Filtering-Correlation-Id: a9dc1c6d-bfdf-4ab9-d2f3-08db008866b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SEUMY315zGdhQnANjeNWl7VkW0av5Fm2R3gneJRFE4Eqd2KzRHNCqN4TTJC5p45hKQn8oqNYtdLTAaWwHanuzkq0Ul5SQB/NSpkn635YKOBTmV4kpvo849CNBa8dQjoMwvezRwEhIYbBXzanecwb6AkVlIyzfLWpavsnlBAULNmdPiIqIDFrRh6VBsaqxXX+p/k2HHFvSqv0bX+RRj4RYCCaFlow01pX3DbIxcAobolVa+z6uRCN0NL/q0UFp7datzjGPQekSur4h9FiKM51y2o1kgGFmON7XUlHM0UmMlra/0XndJy1cWO25GMvYJXLcgtP1+urNt8szdGAAPeKE9gHCa5FzaYGxgcCMskdxScvxqqgYLH5p1G/IWB83QRsieFkYQ9iiYCLvl3mhdjRj4eH+fzqhowV2Gj41iV04O7SYFDYaze/2n3JNN3QE2lpm/sfC1ALVDhc+AkSxTUyOpZeXOjpRF1KOfIIKbzqqdg3mr8WXUWEnRyrbK/FeI/GzpsT9bgApyEq4urnG8kA5IijA3DtxYY63Mb2/ghOzHMO5R6wPeRmwaZpcMfyU28tnzPFGwk/boNa6OuqvKA9BLrwEaAp6XAVjBiBxbxgIMgA+wYPLznVD2bq73/jLsBlmNV+j++uD+3OZQnR69cdc4LXfTPOKx6KZI8ADo/dswR7/jQLNGtgstyAfbofYDKY3yFkyzAOtRXOmNUnNiT/hhBNXw6R3rlbnmheRI6B/MQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5825.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(376002)(366004)(396003)(39860400002)(346002)(451199018)(38100700002)(2616005)(8936002)(2906002)(110136005)(54906003)(31686004)(316002)(6486002)(41300700001)(478600001)(83380400001)(26005)(186003)(6512007)(31696002)(6666004)(6506007)(53546011)(66946007)(8676002)(36756003)(5660300002)(66476007)(66574015)(66556008)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M1lwbjQ1NmNzcHdsUTFrNkFadnlmWTR3WTlKV2I3d3pZR0pxYkVKUTliUFYy?=
 =?utf-8?B?WUdBZGwzeDRYbEJ4dXlMSUdmeHVmb29YNk1CeEsxQjdtYXVPcWhIS25Kc3pY?=
 =?utf-8?B?MnAyaHdCd1VnUDhLUFZpZlN6TmlJYTRTdmxaVTAwSlZjQ2VFVGpYSVM4OG52?=
 =?utf-8?B?UWloc3VQanFmUTVDS2k2Q1VUMWk4eFZteEZwVjRQVzV6NmJYS1VVdHBkemVs?=
 =?utf-8?B?RkFiOEw0YVU0NzZUWmtubU01ZGE5QVZrRXpQbEFrU0hDZ1VVRVkxS1dtbVJL?=
 =?utf-8?B?SkZtYnNsZndLM3N4b1V5ZHphQUJ0ZW1FTk1nN2d3bEdlOHZvSXFyc0phdGw5?=
 =?utf-8?B?bXBFNW5waTN6cVZkUWtRd0ZHcHZrU1F4VStFeUM1ZEFpSFp0dmJiN2J0V3hV?=
 =?utf-8?B?NU95RmdkcjczaEZMcTE0NXR3NmF6cENTOHhKWDMweHQ2NTJLeDZQc2ZidENP?=
 =?utf-8?B?MVBhcUJSdGkyeHhSMWR4cmZWV0YxUHIwMExwUjZGLzdMSEQxaHJhZlhkR3J6?=
 =?utf-8?B?RVQ1UDEwSHVadTcrQWZ4ekE1OW5HblRPY1haWWp2UnBFZDFmcmRIci9SbUZO?=
 =?utf-8?B?V2ZVeDY2TFR3MmwycEVoODJneCtaVHlkYm40aUREQ3cvU2xtbHpadmZnK1dD?=
 =?utf-8?B?RUM0NlduMDBWSFBnelBCNDdGMWtqVWZ3ZjcvR1J5VXhXWjJxRjBaaUl5ZjdJ?=
 =?utf-8?B?dEltcFdOekVtczREUlFIbUdibTdJR3IwOUoyZjJhbnk4U2h2bUN4SW45U1pl?=
 =?utf-8?B?RHRwekc2SzU1b3V6MkhadE1GbDdGSzNKYXlWbEZKVmk2eWR5VHBQdWFMLzFs?=
 =?utf-8?B?WElmVUdUa0E5dllzMHkzdHBhTkJJcjJQZmhJMGM4VHNNZ2h1Ty9XVHhSY2ZF?=
 =?utf-8?B?SVlaV1EwVkh0T1EzME53SnNGUHJ6eHFjd1pkTVUreTg0Y1N1dkRRN2JiRmtQ?=
 =?utf-8?B?TUwraFJMeHlmS3M3amk5M1dqb1RBUVhQbUowWlVFRmladEdPTEJGRi9iL3pm?=
 =?utf-8?B?Wno5ZEVDcm9VZUpkZlJYQitFYVJEeHJVbDBqbUFQeDlaSmpvb1dvY1JDWjIw?=
 =?utf-8?B?dWdNSWQrc2lQVm54MlY0YUJVbVMyV3liNXNtWmJTY3lQZDYwcW9wVmxzcXVI?=
 =?utf-8?B?Q3M1OFRwaVoxOVhaR01PR0NRL3Q0bGtaanNlcFRjUnZWY3grSnFITURPaXdj?=
 =?utf-8?B?S28rYU96My9GL3FOOGNsRzBEL0d0QWd3WmZ1L0lHc0cwMjZtMUo4L2xlKzRI?=
 =?utf-8?B?N1FhV1pNcjVFTk5oZk8zdXBYK01jTi9aK09OcjJMd01BSWhOZ2NZMU81RHpK?=
 =?utf-8?B?eFQ4UmZJOURTUExLYXN0anVaQ2ZVTEhyOFA1MW05bjBmbHRpRmlaKzZXTjdH?=
 =?utf-8?B?ZGp4Uk1lS3VpZHYxOXlUWVBCTTlWMW9KQXJuK05yYnY1K0JXRjFaMHZCS0t1?=
 =?utf-8?B?WUsxdXVLclY2Y2VGV0R0Y1hzcE5nVEIrRE51MlhhTmZpOVRLQW0xT0lnYnZW?=
 =?utf-8?B?VFhSaURDbmxoVE5FNksxMnpLUW9WcmozaWxITHVocXcvN2tzNENFUFhQamhv?=
 =?utf-8?B?R0FtbEVLRDI1WHl6RCtCc2FLeVdUT3FadXJhMks2VElmMmtSYnN1V095UjBE?=
 =?utf-8?B?Z2xwWXJvalVFUTFqWHlaZ2JGbkJHcDE0bHZUSldGbVMwakl2NUlXa3N3Y1B5?=
 =?utf-8?B?d1NEYU1zWWV0Ty85VCtFdzBhRUx4L2tyYlFDMEo4a0dlZ0VXOFBQYVZWQllv?=
 =?utf-8?B?YzdaRitsSXh6dHdFeU9oRzRzM3ZJTzRRWm1XUG40OHdEUHZFZU8yajJNeTIz?=
 =?utf-8?B?TnFWZS8welVSS05nL1RobTJjNEpQbDVuVTkvVWt0b3hsUVpBakE1R1REUDBp?=
 =?utf-8?B?Y3NWZ1pYblRBWVM3cFBBeVJyYWZOZmVuSlF6UTJNOWdNdGEwVEtoak9ubG45?=
 =?utf-8?B?MGk0Y3FJZ3dCRlpVR0UwTUpvT2lEU2Q4ciszZGFvR0tqM3p6dy81WGZLeTZ6?=
 =?utf-8?B?emtUMHVWeTVUMlYzdUpvWENYRGg5bzhuRm5VWVhhSklIdDA2aDk4MmlaY2Rv?=
 =?utf-8?B?dHlpYVRQcWhqN29BL1JJUFVmNndscFkraG96K0ZCY1NRRjlkY2Q0VHUrUW5U?=
 =?utf-8?Q?BsNimm1ILyLJNEBhMVjsyshqz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9dc1c6d-bfdf-4ab9-d2f3-08db008866b2
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5825.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2023 17:03:24.5979 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GmySVsVq7wHyEp7X2xTLpql1CYGEb0oljCaElPp4GLcesU2S7MfHbsSLVVTQhiS1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5863
Received-SPF: softfail client-ip=2a01:111:f400:7eab::62d;
 envelope-from=gautam.dawar@amd.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 27 Jan 2023 12:13:44 -0500
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


On 1/25/23 21:22, Eugenio Perez Martin wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
> On Wed, Jan 25, 2023 at 4:20 PM David Edmondson
> <david.edmondson@oracle.com> wrote:
>> On Tuesday, 2023-01-24 at 17:11:59 +01, Eugenio Pérez wrote:
>>> Since GUEST_ANNOUNCE is emulated the feature bit could be set without
>>> backend support.  This happens in the vDPA case.
>>>
>>> However, backend vDPA parent may not have CVQ support.  This causes an
>>> incoherent feature set, and the driver may refuse to start.  This
>>> happens in virtio-net Linux driver.
>> Could you now simplify the tests in virtio_net_announce() and
>> virtio_net_post_load_device() to look only for the presence of
>> GUEST_ANNOUNCE, given that you can now presume that it implies CTRL_VQ?
>>
> That's a good question. As far as I know qemu emits an error if only
> GUEST_ANNOUNCE is given in a purely emulated device.
>
> At this moment vhost-kernel and vhost-vdpa do not handle it, but
> vhost-user do. Would it be beneficial to preserve previous behavior
> and passthrough the features? I guess not, so I think we could
> simplify those functions on top of this series.
>
>> But anyway:
>>
>> Reviewed-by: David Edmondson <david.edmondson@oracle.com>
>>
> Thanks for the review!
>
>>> This may be solved differently in the future.  Qemu is able to emulate a
>>> CVQ just for guest_announce purposes, helping guest to notify the new
>>> location with vDPA devices that does not support it.  However, this is
>>> left as a TODO as it is way more complex to backport.
>>>
>>> Tested with vdpa_net_sim, toggling manually VIRTIO_NET_F_CTRL_VQ in the
>>> driver and migrating it with x-svq=on.
>>>
>>> Fixes: 980003debddd ("vdpa: do not handle VIRTIO_NET_F_GUEST_ANNOUNCE in vhost-vdpa")
>>> Reported-by: Dawar, Gautam <gautam.dawar@amd.com>
>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>>> ---
>>>   hw/net/virtio-net.c | 15 +++++++++++++++
>>>   1 file changed, 15 insertions(+)
>>>
>>> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
>>> index 3ae909041a..09d5c7a664 100644
>>> --- a/hw/net/virtio-net.c
>>> +++ b/hw/net/virtio-net.c
>>> @@ -820,6 +820,21 @@ static uint64_t virtio_net_get_features(VirtIODevice *vdev, uint64_t features,
>>>           features |= (1ULL << VIRTIO_NET_F_MTU);
>>>       }
>>>
>>> +    /*
>>> +     * Since GUEST_ANNOUNCE is emulated the feature bit could be set without
>>> +     * enabled. This happens in the vDPA case.
>>> +     *
>>> +     * Make sure the feature set is not incoherent, as the driver could refuse
>>> +     * to start.
>>> +     *
>>> +     * TODO: QEMU is able to emulate a CVQ just for guest_announce purposes,
>>> +     * helping guest to notify the new location with vDPA devices that does not
>>> +     * support it.
>>> +     */
>>> +    if (!virtio_has_feature(vdev->backend_features, VIRTIO_NET_F_CTRL_VQ)) {
>>> +        virtio_clear_feature(&features, VIRTIO_NET_F_GUEST_ANNOUNCE);
>>> +    }
>>> +
>>>       return features;
>>>   }
>> --
>> Why stay in college? Why go to night school?
Reviewed-by: Gautam Dawar <gautam.dawar@amd.com>
Tested-by: Gautam Dawar <gautam.dawar@amd.com>

