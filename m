Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B39BA6A32E9
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Feb 2023 17:51:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWKD7-0001ou-LW; Sun, 26 Feb 2023 11:49:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pWKD2-0001oc-Sr
 for qemu-devel@nongnu.org; Sun, 26 Feb 2023 11:49:12 -0500
Received: from mail-dm6nam04on2054.outbound.protection.outlook.com
 ([40.107.102.54] helo=NAM04-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pWKCw-0006iF-7h
 for qemu-devel@nongnu.org; Sun, 26 Feb 2023 11:49:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W/5RZgA8JXxCrNLrRVwGFw3jAoVmHDmAIn8079XAlGyrkPysCl6iaHQYsleCiTPEt3Mnd895b5tDEcBgIxEE/wp4YEX7Cbgd+Ip84AS0vU8D/ZT8VDAFFdVR0peZXgoPx2Mk3TLQZqTiA00TRymmrpjE0A8M19pSQegdwA42HLuuesjUhuGMChMKzVa/aiqvQX/7r7qUIzU9pbsTG6OGh9DMmSd4xL1BL8leCrTYsW+YbhU8jEAI31xWAEE7gxhnpEp8MujSnNyVpjOndJOCK3ryu96kQ4JTLNg+x+in9ROQsvLg9B9A6da2Jyjpxii38/SH0k49Q+tD7Jebk3O0oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MTX7VL59e1JJwBmOqaFKo+3i9r6XqiQbJ/FHFV3EZ6M=;
 b=RScp80e05+8C+cOfqmKKjo/gsC2n+xrB9Go7o2LCSBHOVzvM7pAEZ4ZyQKJMhDZqb2WWjBHvXawAHLqcTgKAMvPcmXJRV8q/3VmZVGOeHdBwd2q/5fQ++VouvNQs9RsodgePXh8zghN+cVLnZIVVmo5GU8kobgq6HSyb90q4DSXSj9MfyF2QabPNsop2gHimMqb2rqXRudzbUJNUUcnu+PJEmzN49yty8/PQ8zE1IfCBipobTNdXJ2BQbaxuGV3fZKN/tNf3VzW+91mgfC7KhaSDLPltV5r5PpVJgBaMf0SlJliZ8yJZTnu3cWRXFZ+BWwfkraOQEireDBARM9PzIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MTX7VL59e1JJwBmOqaFKo+3i9r6XqiQbJ/FHFV3EZ6M=;
 b=E9xiQ7VDYyU9Glo0DcG+pifaoiF1Kgehkay2HEhAAMJHsCDaYvjfel7zrckjvtvmv8ftLSPlbSkFQh96k7YGpJczGEPsye8Xf+sFgRQErxhDsRnzpJhHaZAbOSCn45CUJoTL85OYbdjxvCK1f+uBDwuS76+87wJU8lq3KrASUbx8vlF38G9/pnXYRxnorAtMEspZlSscAA+0Kv3brjojMVrZEK6ROcKiMa6rz39v2LggR2fRdYcMvWci8K+0kN7dbggxiKMhx+2OZwTAQPxNhBv9MHtGL/XBFL60fHhyLKv5TNB0COK5tpTmmmJ74epA8WvgU7wWB3fOsj6APDPEsQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB5549.namprd12.prod.outlook.com (2603:10b6:5:209::13)
 by DM6PR12MB4356.namprd12.prod.outlook.com (2603:10b6:5:2aa::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.21; Sun, 26 Feb
 2023 16:44:00 +0000
Received: from DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::b980:cd87:77f2:3fbb]) by DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::b980:cd87:77f2:3fbb%3]) with mapi id 15.20.6134.025; Sun, 26 Feb 2023
 16:44:00 +0000
Message-ID: <a875f6e5-951b-8f39-7867-313eabe54363@nvidia.com>
Date: Sun, 26 Feb 2023 18:43:50 +0200
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
 <38bdb26f-08d7-fe11-9a97-ebcc95c82254@nvidia.com>
 <20230223141637.67870a03.alex.williamson@redhat.com>
From: Avihai Horon <avihaih@nvidia.com>
In-Reply-To: <20230223141637.67870a03.alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0049.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::22) To DM6PR12MB5549.namprd12.prod.outlook.com
 (2603:10b6:5:209::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB5549:EE_|DM6PR12MB4356:EE_
X-MS-Office365-Filtering-Correlation-Id: 036b7fa5-ed55-4b86-1e97-08db1818a917
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iqIhL8XC81vhwn/qbfd5h205oDmvE+7o6vi1n/1ue51IwVOXlmH0mW8ThRl7RVY0wHLwXOl8sXyBISIH9KGvbCMFI7JuDIjqkCwaeYohxLiQofluc7AReLm3OjYN+98ppwq4CYrDwFHwmwml1624Q9ZYXc1e+k3KAVMI5ch0WRomgeTrUOey1tR/F/0c/Q8s+I8kqglfm6IA3Oq/AAOdr8ZAQavrwxK3BD/cy/RRCCwd05FeOjjx0x+ODhthD0ydWRzS9/KBPDhbi6Vgc5WiqzkqKu5EmOJwqTiY4d8VNVe0CTzZJLmIhjd09V3Tx67zQ5qZGe1VPwQj6e2Rr7CWI3PFCwAhbOXvtEaEG5xozTHhkDGNPmzw3gEqUXwSslsh+NwFP6tuqUIXl5Q5jhQ+QgeEWwfx8OT666rdX+X1Rqx6tJaV9NzlbatXOAwnZH/6Mzjb90vYCB/DaJuSzPdbtzvaRvuhanJOPShfDzL0Lk+AebkRzopc8YsWOvGytLVTU3xSL85G+/nhWrVh5qgUI81EnQ6z+i1G7MFeeB2BfyV0C4+FGhXC7PmDP2GmoSJXekhf3B3Nm2IlnZtcUBYU6IzAbZAlHXIMyT8t8md2iH7SLATvN+dA0sgPWC4RDtLQZ6czcd8rgAGEH3gykoblWnYWJCszgi3DvlgTClMJ8fjl/2eWq33MdElcwhj9E9IkMgdOB1ZFF+feHENtWWfb0W8yjH75NqhCgoL7/MwhBZY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5549.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(136003)(376002)(39860400002)(346002)(366004)(451199018)(38100700002)(2906002)(7416002)(2616005)(31686004)(86362001)(966005)(478600001)(6486002)(186003)(26005)(6512007)(53546011)(31696002)(36756003)(6506007)(83380400001)(66946007)(54906003)(66476007)(6916009)(41300700001)(66556008)(8676002)(4326008)(6666004)(8936002)(316002)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEx5OXpuVmNRUjlaSmxEK2VOSjFCeFhSQmtxbHZtQW1XQ0ozR3B4U3JuZVdB?=
 =?utf-8?B?U0o5N2cxQjZWSTlGMEt6VmVqcDBPYkp2QzZNSG5HOVo5ZWhkdHFuNXlIZ2hM?=
 =?utf-8?B?elQ3VXdNang2SmljL3Y2eS9sdEZvbU5aUTJtZFpUUWgwN3A0WmVrZ2I1Y1ZP?=
 =?utf-8?B?LzNWMlBTWW5NK0xOdW41VjF4OTJGbUFILzlveXZNSUxlYmRTUHUyd3dkaUtP?=
 =?utf-8?B?citRYytlVlZpUU1vSTVLOVA4SHBSc29wZDZ1OHNxOWxpYlEzSXE4MFd2Ym01?=
 =?utf-8?B?Q1J4RU83SVIvZWJINTZmanNaU09GdEV1d1pLOUhidlNIajNWb3l4dlZCcUxI?=
 =?utf-8?B?OGlnQlowS1R3SGo5QlJoTk5kNml1TlIrSjYwSTh1aEF4SytydGE4YnlNM2lo?=
 =?utf-8?B?Z3ZUMXZUcmljWnFCVm5FNnQ0Rll3QUYyenpEZ25EMU9tcDBvYm1PVzFNaFV0?=
 =?utf-8?B?REVFS2pPRE9uVXNBOS9acUdHNjlhQ1g0aUpaamk0YXBNdGxzREovck1Ebzhq?=
 =?utf-8?B?VnA2bFVVbjF0TFRJZEVxYWQwbTVBUDhsNjlzL2h2SjhzVG44bURWSGxJSU1y?=
 =?utf-8?B?MldpZDhDQnFyRjJnZFJ5Tlk0aGw1Wk00TmlzTjZlMUZuSVZJbjU5anRZcmZw?=
 =?utf-8?B?QzF6Ym5TazZhQXRYdlZWdmJCWUMzQzZFd2F6L1F6VnlTSnJzeS8rNHZZM3l2?=
 =?utf-8?B?b25PSUVXZ0IrTnFQb25meVB6djlWTXg0eXhHalg2c1Vpcml2OHhmdGRiUHdk?=
 =?utf-8?B?bjg2YWllRWU4VWJxZDFQMmVzSmEyL3pUNlcreTR0aU9YN2FLdWozb0g3ZlF3?=
 =?utf-8?B?SVBaWWM3Slp4YnllbG8rUWxuUkNjVTRnNG93eEtHSmFZcWxWcUhuaTVBT0F6?=
 =?utf-8?B?VDBZSmp6NVEyS1ByNHpubGRZTk9oZzRCS2k4VTVjSEMwQmtCNWRtOHZVOGdG?=
 =?utf-8?B?WU8xTVpITndvQ3hHclRIRGtSenJaL2RJRjMzWHdqaXhNdVB0S3M3T1ppZ2dQ?=
 =?utf-8?B?ZnNDc3ZMa3h5WXIvSFRrS2JqeVhlZit4ZDVwNm84eGdsdG5CUFlkR3Y4WXZG?=
 =?utf-8?B?VVQ0aXo0a0ExRGVPNlhoVEFKWEhmNDVmTmh3aXQ4NjZlVnBMRnphZEJkc1dj?=
 =?utf-8?B?a1YreVc2REQ4eU9OSDZMSWJpV1l4dGwzWEJoT2F2dWtlWUpmd2VGYVhrZXhx?=
 =?utf-8?B?am1HZVdFdzNkdkJ2bnFWcjduYmJYR3NVVk5XN0dTUDV2MGs4ZTBIT1I1S0hY?=
 =?utf-8?B?VTl6c1pHM0pFK0FnbFdEYmtJQmJCMjVWblJaeUJOQk1rOERoTHlLOHl5eG03?=
 =?utf-8?B?YXdWWFQ1TTlGeHFKUDJUcytYVFZzQm5PbTdyK0UrQkFyWkY3Z1h0UEEzTVNW?=
 =?utf-8?B?Nk90NGw4NmdjZEU3WncyVHRnSEtVNERINjFMQUc3K3c3a1dHVytHejNsSk11?=
 =?utf-8?B?ZWJYK2hMNGNXU3pHNnJCOVYzQmd0bFpFK1U2ZmZKOGFFZlZJTnVLbXg3cXNS?=
 =?utf-8?B?V3lrUUk5K2k3dmVuYy9jb2JndE5DanNFVGNuRDEvYlgwK1B4bnBOZXdiZGJK?=
 =?utf-8?B?cE91TUhzSWc0bmNaTHY3ckF3RGJ6UmxVeWgvUnhtNUY3NXhDbFI4cnlsVjRF?=
 =?utf-8?B?M1VyRGFzTmtFOFFYaENNSHF1cWk1bmJNdkVFOEhnNEFSZWZxMUdZU05qY01u?=
 =?utf-8?B?MkpGR09DUDRJdURkSlZRRmJTUXIya1JDQW40TTZPb3p6cnFzbkI0M0pHQkto?=
 =?utf-8?B?WmZnMGZyUjlPaVREVVVKeTc3MjYyQlRPVjJ5N2JzSXR1VEhzUUZRdkpIRkY2?=
 =?utf-8?B?eEZGWjk2WDUxM0RMZkNHbURRK0l2SUVyMU5mTjlLWHVrVWJLUDYrV1ZSUjFp?=
 =?utf-8?B?K25CY01YWERyWFhCdGI4QXlqQm9SNFBaKzFRZUdaTG9ZU0RHV29vOU0xdzdn?=
 =?utf-8?B?aG16eTFJakNZYmR2UCs5L1RCSjFJcDFMOWRaMDRTSXFBZ0J3TzFVdnlhaGs3?=
 =?utf-8?B?L1J4Nkh0VVhDblVPSVBjYllqSkVZY2xKNmw4Y3ZIVFlvdGxUV1Rlc0RkZkVy?=
 =?utf-8?B?L0J4WVlWQjhvNDBXSlgzRTRlMW91eGprWFVUOGx1ZXR5OTd4RXZPV0hjK282?=
 =?utf-8?Q?oHqick52w+PW5ltpMrb6P74a2?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 036b7fa5-ed55-4b86-1e97-08db1818a917
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5549.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2023 16:44:00.0234 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9VbFYaW6M420geuSNbZhQ+AT1W8VNxQo3MFEQREGIxHPJWSTVLz2J49GAalpZLU97Id3WcHCNppiFEf/Vz0ikg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4356
Received-SPF: softfail client-ip=40.107.102.54;
 envelope-from=avihaih@nvidia.com;
 helo=NAM04-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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


On 23/02/2023 23:16, Alex Williamson wrote:
> External email: Use caution opening links or attachments
>
>
> On Thu, 23 Feb 2023 17:25:12 +0200
> Avihai Horon <avihaih@nvidia.com> wrote:
>
>> On 22/02/2023 22:58, Alex Williamson wrote:
>>> External email: Use caution opening links or attachments
>>>
>>>
>>> On Wed, 22 Feb 2023 19:48:58 +0200
>>> Avihai Horon <avihaih@nvidia.com> wrote:
>>>
>>>> @@ -302,23 +380,44 @@ static void vfio_save_cleanup(void *opaque)
>>>>        trace_vfio_save_cleanup(vbasedev->name);
>>>>    }
>>>>
>>>> +static void vfio_state_pending_estimate(void *opaque, uint64_t threshold_size,
>>>> +                                        uint64_t *must_precopy,
>>>> +                                        uint64_t *can_postcopy)
>>>> +{
>>>> +    VFIODevice *vbasedev = opaque;
>>>> +    VFIOMigration *migration = vbasedev->migration;
>>>> +
>>>> +    if (migration->device_state != VFIO_DEVICE_STATE_PRE_COPY) {
>>>> +        return;
>>>> +    }
>>>> +
>>>> +    /*
>>>> +     * Initial size should be transferred during pre-copy phase so stop-copy
>>>> +     * phase will not be slowed down. Report threshold_size to force another
>>>> +     * pre-copy iteration.
>>>> +     */
>>>> +    *must_precopy += migration->precopy_init_size ?
>>>> +                         threshold_size :
>>>> +                         migration->precopy_dirty_size;
>>> This sure feels like we're feeding false data back to the iterator to
>>> spoof it to run another iteration, when the vfio migration protocol
>>> only recommends that initial_bytes reaches zero before proceeding to
>>> stop-copy, it's not a requirement.  What benefit is actually observed
>>> from this?  Why is this required for initial pre-copy support?  It
>>> seems devious.
>> As previously discussed in the thread that added the pre-copy uAPI [1],
>> the init_bytes can be used by drivers to reduce the downtime.
>> For example, mlx5 transfers some metadata to the target so it will be
>> able to pre-allocate resources etc.
>>
>> [1]
>> https://lore.kernel.org/kvm/ae4a6259-349d-0131-896c-7a6ea775cc9e@nvidia.com/
> Yes, but how does that become a requirement to QEMU that it must
> iterate until the initial segment is complete?  Especially when we need
> to trigger that behavior via such nefarious means.  AIUI, QEMU should
> be allowed to move to stop-copy at any point.  We should make efforts
> that QEMU would never decide on its own to move from pre-copy to
> stop-copy without completing the init_bytes (which sounds suspiciously
> like the purpose of @must_precopy),

@must_precopy represents the pending bytes that must be transferred 
during pre-copy or stop-copy. If it's under the threshold, then 
migration will move to stop-copy and be completed.
So simply adding init_bytes to @must_precopy will not guarantee that we 
send all init_bytes before moving to stop-copy, since the transition to 
stop-copy can happen when @must_precopy != 0.

>   but if, for instance a user forces a
> transition to stop-copy, I don't see that we have any business to
> impose a policy to delay that until the init_bytes is complete.

Is there a way a user can force the migration to move to stop-copy?
Looking at migration code, it seems that the only way to move to 
stop-copy is if @must_precopy is below the threshold.
If so, then this is our effort to make QEMU send all init_bytes before 
moving to stop_copy and we can only benefit from it.

Regarding how to do it -- maybe instead of spoofing @must_precopy we can 
introduce a new parameter in upper migration layer (e.g., @init_precopy) 
and add another condition in migration layer that it must be zero to 
move to stop-copy.

Thanks.


