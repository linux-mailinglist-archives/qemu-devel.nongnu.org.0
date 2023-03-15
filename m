Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DE56BBB0B
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 18:38:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcV3j-0008FT-Pc; Wed, 15 Mar 2023 13:37:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gautam.dawar@amd.com>)
 id 1pcV3h-0008F6-1G
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 13:37:05 -0400
Received: from mail-mw2nam10on2081.outbound.protection.outlook.com
 ([40.107.94.81] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gautam.dawar@amd.com>)
 id 1pcV3e-0007jt-LJ
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 13:37:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kRGS2RJRPdfR/NB20bOx+RTp9M5aFWrMeSmhmGI6+EekapZIVSksru833U0575xUZ3gWlHbkoWUDkEmwPl4lAjgsxdP4X5jN/hfCeRiZSKSst32J0bu+/WCqfTy6hw3TId47659yf83KBjDzholUHnKraSJiqadz3bvEypHpSTnSjXu8BZyWR73soZDUbAkWKYdgr4dr/Edkf4xJHIdaka6EfmiaymxVSUIcAUe6jvIre3CMMzy5+jYVYD7nh/XKNhxIE3VG6UEBIUsDPY72JfNZwqcWeb2/a8E2WKN+7xORBWlM/s3iGgFbBwoz+Ty2gHXuoW0WNKj3CgSMH3h8iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jZyry81cG+b811PzECBd1alP/qyBPaZv7X4FmMDUovc=;
 b=L8DV6oY2eFEXIgI6qdaMtErh2hHeU0pyQJFDptpph8DYWf0dL/f/Z2tzLCqCXlZecoZyhPQLY7fKrFYjmYsVmuFVGC1rZNKCr4dZMVBSXnfok0tuLs9sgWXsJ2Vg//h1LHPKVcpdJgDIfyCn1C88aK5vLo04Sz1bT+wCnS6sYLNTVa+Izr8bxkAVBxGahDt0IdnAo+x3SKiUWj16WLRohbwRP0RbMNLGrmHwTbITam5OzBJuvCUXQNnRNz2w6lZeW8eUaIo+IPHHz0T6fBQr2h2sZWhUoRtX54qdTC/j5EYHBzfgnvDsuecM48rIe3pLp2jBA334WPTewP/E4q84Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jZyry81cG+b811PzECBd1alP/qyBPaZv7X4FmMDUovc=;
 b=L2vI0+Rp2EWz3aLh2tfOZGNnUjEJDQ8eewJV6WmUE5f2xS5HUVLU0O1U+PaldpLX6+xtcazYSVTuFIFF588eNYVS+xwGjhY3mDVVh72bHU2oid1BBoxyJSWDc0gzEiajXKa/fCxAQl6rH1nPRENpvQKc6WEzZpr+9QjIVvhEXBk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5825.namprd12.prod.outlook.com (2603:10b6:208:394::20)
 by PH7PR12MB6441.namprd12.prod.outlook.com (2603:10b6:510:1fb::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.29; Wed, 15 Mar
 2023 17:31:51 +0000
Received: from BL1PR12MB5825.namprd12.prod.outlook.com
 ([fe80::7222:fe4b:effd:b732]) by BL1PR12MB5825.namprd12.prod.outlook.com
 ([fe80::7222:fe4b:effd:b732%5]) with mapi id 15.20.6178.024; Wed, 15 Mar 2023
 17:31:51 +0000
Message-ID: <4eb0278e-cccd-4cca-cdf4-c16c6abe0309@amd.com>
Date: Wed, 15 Mar 2023 23:01:38 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] vdpa: fix emulated guest announce feature status handling
Content-Language: en-US
To: Eugenio Perez Martin <eperezma@redhat.com>,
 Gautam Dawar <gautam.dawar@amd.com>
Cc: mst@redhat.com, jasowang@redhat.com, qemu-devel@nongnu.org,
 linux-net-drivers@amd.com, harpreet.anand@amd.com, tanuj.kamde@amd.com,
 koushik.dutta@amd.com
References: <20230303115810.7482-1-gautam.dawar@amd.com>
 <CAJaqyWcK8CPmrVckC+29QEfmAWNZpSNBmptOfGs=qvGnOiUjJg@mail.gmail.com>
From: Gautam Dawar <gdawar@amd.com>
In-Reply-To: <CAJaqyWcK8CPmrVckC+29QEfmAWNZpSNBmptOfGs=qvGnOiUjJg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0067.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::7) To BL1PR12MB5825.namprd12.prod.outlook.com
 (2603:10b6:208:394::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5825:EE_|PH7PR12MB6441:EE_
X-MS-Office365-Filtering-Correlation-Id: 0164ba36-d999-47b1-9e14-08db257b2992
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: blo3o27evVkB5qF3E8qBbk1C1daeb21t6ZVDXghqHDwbewqouFHb3nWlOh/AR9ISxih/y5dWU1aWBYeDf1uaP2yjanD3rTFSdKk90hYr7fQ6xUWOYDO3v0HxWT1ky2w2G6nCZB7O+t1EzXpu+xEgxcu7qGF6962xkbUyL3hIna5rAF9WulckGlQ/ZHp9jgLMITv4QyY0gTeIxlB/q0YuGoVkwo0Q2UJ/1DCiOWI85D+H1sPoE1jM2ok+O9qBtnoTNdAzCEFlISMqBKCGTC/dw0w3DCBoCjs3DE9ycx1QX3731a6dk7jnmSJjuESNeLPwvVJBGhnlBh88OAqgzWD0YPWHhKKClj4R+mJdRH5EMlr++ZMrzk0PVK48d4qHLHyu16CLAo/9SiDTTYGPhnFmJZl1wdSCEBSaSrH2b43ouxqnR+Jpk7gK/0WjgH+8L/0Wj3MSvUhPg6c7w4Zv+CvHYyH5DLZq13AXGs23mx4fOhDBiZB+acvhn8b5UkzpSVR90bVPgZ4dVmLIGft56cczAUR9BoMKqK/oW9d42i1RsAcvzrATTrp2U4FwgDZSHrUAetgfzg1uiXbhRQBdFutdS9qnUREDR5VgHqlDh19lSMw89o5JRv8RLGjCbHQoTHTd7JZuXXxBujR65ORvT+3pKaWx/B8L/NRtcH1PBivcauZhGPmr9LskVdfCokoxr6mNLXFO8GpABXzBy7/BFtBBROayjzH5lWIM/dX1Rt7PgKw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5825.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(346002)(396003)(366004)(136003)(376002)(451199018)(5660300002)(2906002)(36756003)(186003)(53546011)(6636002)(478600001)(83380400001)(2616005)(26005)(6666004)(6512007)(6486002)(6506007)(66476007)(66946007)(66556008)(31696002)(8936002)(41300700001)(110136005)(8676002)(4326008)(316002)(38100700002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mk1LbHpRS3RuSXRqQVFpUFZGTzdhWUVKSFNjRFltdUNTb3lXSzVqcmluSnZV?=
 =?utf-8?B?K0xaY0hBa2l6WEsyU3JLMG9pMHJ3bXFTUUpKcnhrMkZDc0VKcWVaSi9seTVw?=
 =?utf-8?B?U0NGbC9RRDRWbUNRekdqUFowODRTZEcvU0tneTVLaXQ3NmRQTVJTUm9VQ1RK?=
 =?utf-8?B?b0FObDhwT054TG5IWHc3VnE0TDBUOFBpYVF3NnpnRDFMcTE1TkFjL283a1Zi?=
 =?utf-8?B?Zjc2N01ob1B5RGtJbXF4cU1seUdmVTN4NEw1ZkRQRTh4M0ZWZnFMY0w2Z0NP?=
 =?utf-8?B?amE3ZmhVckFVY285UU9pTHdkUkpMMWxsM01CSDJJbndKMTdpMk93QnEydU11?=
 =?utf-8?B?Z2VOemZ1M0dpZjR2aVJ6eVluSm5jcWQxL041eDVMU3NtMEhtQ3pJbmNjNVhu?=
 =?utf-8?B?TUJWWTdxZjdpNEJ4SUxqN3hGK3cwbE1uTXl0RlRpYWtWRzFpSFNUUmF6ajFE?=
 =?utf-8?B?OVVseUZrZUZaREtQWHZqQ2tuV3c3SW02ZnE1SmkvbGs0T1dFcEhaMFRnVnU2?=
 =?utf-8?B?dU9aZUhYckR0TDhETm15SXA3aHkxR2ZtWXBlVVJTN1p1NzBQR3pOcGpEMUVw?=
 =?utf-8?B?VlpWelk0NnowNk41YTRpVG1xYTVubW5ZMWpaZWNhZ2VESnZBcGNIY0FDZ0pt?=
 =?utf-8?B?UDNJL0FPdkxQYXNFMU9sQTJGUDBpODBGTHJDaGZ6S3A2MVJscExCeVhjZDNy?=
 =?utf-8?B?V0xJb1BvRkZSM2dkeXFyV0o2Z3ZjUkpUYVRhbGF4YlNUbTBiellPUFdHYmdY?=
 =?utf-8?B?ZHpud0NMcTlMR2YrTXVDYXJnd29WSDlXb2k1K1dHNkNzZzF5NzEwZW9uRG4r?=
 =?utf-8?B?WXgxb0V2S1ZMcG9JcWNyVC96dUxiOEpPbDAvNkJOeTlpSnp5c2NLenZqM2Vk?=
 =?utf-8?B?Q1drME5BUDdka21CSG9wVFlMbnlLb2RIVlllTkdqS3Nrd0RFYTVabUg5U3gy?=
 =?utf-8?B?ZENjUk8xckhRNjJOTzR1OUNFbTNWdnN2eWxUNEswdzc5b1pHK1QwRE4vOFhp?=
 =?utf-8?B?UVQyeFo0dnJ6SXhiSkRVSzZwMmhDdzEybzBYdXk2VXZjWS9hTVhEN2h6L0cv?=
 =?utf-8?B?ajMwR05pVUdFZ0RXV2gzZHBzR0xWT1ZYTnhUVVZNZjgya1pNeHFiZkNOQmRq?=
 =?utf-8?B?L25HT24wa0QySnB3cS9ndUVVLzBSU2ZyaVl6MEdoWmJNRFpuaEJqblRrZXJr?=
 =?utf-8?B?YzlxaTdXR1Nmdnl4dWY2MVR2ZHA4ek9GWGdUQWpmUDBhNDVUbnJIeTQ1NjVW?=
 =?utf-8?B?Mm1ZYTE4aXJGVlNzK0w0SG9qMWI5R2YvTHRwZnpWR3hBYmlaTXdMNzVJajdV?=
 =?utf-8?B?ODNlNGlzM1BPR2lUTTJTQ00zN2gzdldYUUtpRlVPOEVGTjRWTWt5a2drQ2NI?=
 =?utf-8?B?dEIzaFZtZkFCbFJTRUpKQWlpV2libXdwcktyWnJpVEpOTTFDaHJ0M3NJZStX?=
 =?utf-8?B?cGQ1cUJ4Um1KM3FiNEpMOXRZUWo2T3FYWk12OFNGeHU5UGR0OEpWbTV6N2FK?=
 =?utf-8?B?SXVnVDduaUxsMlIrdHpGVFdnNFpTMW8reE0zQy9USDFscUxyVE5NNWRGRk9M?=
 =?utf-8?B?R3d5Si9tR1RUVEtWbVpISTVaYVdzM1ozVzZscVIrSzByVXFQc0E5V0ZxRGdq?=
 =?utf-8?B?Si8wWG05UEozb2ZOQ0VyZy9RUk82cmpuUTZ6bDFtRjdRbnZKcGhBQlZwYWV2?=
 =?utf-8?B?d0t0UVhXRFI4dTM4U2l3Qml4R2xQRW1sakx0Y3hlVVNZdmlibkZEbEVGWmJS?=
 =?utf-8?B?ZmV6bkFGOUtqUUVsOGVTWHpJODNFY05mWXdKY0tiVmNqUVdDejZsY0p4WWxw?=
 =?utf-8?B?cHV5eWxCT0lzeHNmNDdtTWNZelpLWjA3QVptTzU0Wk9jT294TFB6cVIzZlM3?=
 =?utf-8?B?em1KTGlIbHNScEZKck5hR1p2eGZiNlFwL0pzZHorUFlNNlhDTU1neHdmOWxa?=
 =?utf-8?B?VG9LOE4yRzdaV3l2eHZ1TldCdXdscERNSE1laS9NN0thWWlOVVJvSzM3V2ZX?=
 =?utf-8?B?K2piOUJyZys4Ly8rS2tBTnFacnpmTjJYSGs4dEhwaHlqVzkrWGNkSTgzWDZx?=
 =?utf-8?B?OE1zYVlLZFF4MDVIRnM2TnErYS9INHA2WkxMV2FaWk1Kc0Jud0dORnliVHRR?=
 =?utf-8?Q?DtMbgJ+6rkJ92H30bhcqJeiM8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0164ba36-d999-47b1-9e14-08db257b2992
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5825.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2023 17:31:51.5187 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XjcQntDjX8UdqeZXjmpRrJs3ZJuf2+2GGkosteWBXwzXRuNXsXmM09lMbA2SxRKW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6441
Received-SPF: softfail client-ip=40.107.94.81;
 envelope-from=gautam.dawar@amd.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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


On 3/3/23 20:28, Eugenio Perez Martin wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
> On Fri, Mar 3, 2023 at 12:58 PM Gautam Dawar <gautam.dawar@amd.com> wrote:
>> Guest announce capability is emulated by qemu in the .avail_handler
>> shadow virtqueue operation. It updates the status to success in
>> `*s->status` but incorrectly fetches the command execution
>> status from local variable `status` later in call to iov_from_buf().
>> As `status` is initialized to VIRTIO_NET_ERR, it results in a
>> warning "Failed to ack link announce" in virtio_net driver's
>> virtnet_ack_link_announce() function after VM Live Migration.
>> Also, I noticed an invalid check in vhost_vdpa_net_handle_ctrl_avail()
>> that reports an error because status is not updated in call to
>> virtio_net_handle_ctrl_iov():
>>
> status should be updated through &in. It is declared as:
> const struct iovec in = {
>          .iov_base = &status,
>          .iov_len = sizeof(status),
>      };
>
> And it should be filled at the end of virtio_net_handle_ctrl_iov with a call to:
>      s = iov_from_buf(in_sg, in_num, 0, &status, sizeof(status));

Apologies for a delayed response. This totally makes sense and I've not 
been able to reproduce this issue.


> How do you obtain different values? Maybe const optimizations is
> invalid and the compiler thinks virtio_net_handle_ctrl_iov will never
> change status?
>
> Thanks!

I think the issue might have been a result of incorrectly returning 
VIRTIO_NET_F_GUEST_ANNOUNCE in the device features without handling of 
VIRTIO_NET_CTRL_ANNOUNCE_ACK in the parent vdpa driver.

We can drop this patch.

Gautam

>>      virtio_net_handle_ctrl_iov(svq->vdev, &in, 1, &out, 1);
>>      if (status != VIRTIO_NET_OK) {
>>          error_report("Bad CVQ processing in model");
>>      }
>> Adding an optional OUT status parameter to virtio_net_handle_ctrl_iov()
>> would help resolving this issue and also send the correct status
>> value to the virtio-net driver.
>>
>> Signed-off-by: Gautam Dawar <gautam.dawar@amd.com>
>> ---
>>   hw/net/virtio-net.c            | 9 +++++++--
>>   include/hw/virtio/virtio-net.h | 3 ++-
>>   net/vhost-vdpa.c               | 3 +--
>>   3 files changed, 10 insertions(+), 5 deletions(-)
>>
>> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
>> index 3ae909041a..36a75592da 100644
>> --- a/hw/net/virtio-net.c
>> +++ b/hw/net/virtio-net.c
>> @@ -1503,7 +1503,8 @@ static int virtio_net_handle_mq(VirtIONet *n, uint8_t cmd,
>>   size_t virtio_net_handle_ctrl_iov(VirtIODevice *vdev,
>>                                     const struct iovec *in_sg, unsigned in_num,
>>                                     const struct iovec *out_sg,
>> -                                  unsigned out_num)
>> +                                  unsigned out_num,
>> +                                 virtio_net_ctrl_ack *status_out)
>>   {
>>       VirtIONet *n = VIRTIO_NET(vdev);
>>       struct virtio_net_ctrl_hdr ctrl;
>> @@ -1514,6 +1515,8 @@ size_t virtio_net_handle_ctrl_iov(VirtIODevice *vdev,
>>       if (iov_size(in_sg, in_num) < sizeof(status) ||
>>           iov_size(out_sg, out_num) < sizeof(ctrl)) {
>>           virtio_error(vdev, "virtio-net ctrl missing headers");
>> +       if (status_out)
>> +               *status_out = status;
>>           return 0;
>>       }
>>
>> @@ -1540,6 +1543,8 @@ size_t virtio_net_handle_ctrl_iov(VirtIODevice *vdev,
>>       assert(s == sizeof(status));
>>
>>       g_free(iov2);
>> +    if (status_out)
>> +           *status_out = status;
>>       return sizeof(status);
>>   }
>>
>> @@ -1555,7 +1560,7 @@ static void virtio_net_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
>>           }
>>
>>           written = virtio_net_handle_ctrl_iov(vdev, elem->in_sg, elem->in_num,
>> -                                             elem->out_sg, elem->out_num);
>> +                                             elem->out_sg, elem->out_num, NULL);
>>           if (written > 0) {
>>               virtqueue_push(vq, elem, written);
>>               virtio_notify(vdev, vq);
>> diff --git a/include/hw/virtio/virtio-net.h b/include/hw/virtio/virtio-net.h
>> index ef234ffe7e..da76cc414d 100644
>> --- a/include/hw/virtio/virtio-net.h
>> +++ b/include/hw/virtio/virtio-net.h
>> @@ -224,7 +224,8 @@ struct VirtIONet {
>>   size_t virtio_net_handle_ctrl_iov(VirtIODevice *vdev,
>>                                     const struct iovec *in_sg, unsigned in_num,
>>                                     const struct iovec *out_sg,
>> -                                  unsigned out_num);
>> +                                  unsigned out_num,
>> +                                 virtio_net_ctrl_ack *status);
>>   void virtio_net_set_netclient_name(VirtIONet *n, const char *name,
>>                                      const char *type);
>>
>> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
>> index de5ed8ff22..c72b338633 100644
>> --- a/net/vhost-vdpa.c
>> +++ b/net/vhost-vdpa.c
>> @@ -638,8 +638,7 @@ static int vhost_vdpa_net_handle_ctrl_avail(VhostShadowVirtqueue *svq,
>>           return VIRTIO_NET_ERR;
>>       }
>>
>> -    status = VIRTIO_NET_ERR;
>> -    virtio_net_handle_ctrl_iov(svq->vdev, &in, 1, &out, 1);
>> +    virtio_net_handle_ctrl_iov(svq->vdev, &in, 1, &out, 1, &status);
>>       if (status != VIRTIO_NET_OK) {
>>           error_report("Bad CVQ processing in model");
>>       }
>> --
>> 2.30.1
>>

