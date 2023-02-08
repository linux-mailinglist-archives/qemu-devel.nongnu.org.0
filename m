Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C23CB68F571
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 18:36:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPoMe-0001HK-Qo; Wed, 08 Feb 2023 12:36:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pPoMb-0001FT-Ni; Wed, 08 Feb 2023 12:36:09 -0500
Received: from mail-dm6nam12on2060d.outbound.protection.outlook.com
 ([2a01:111:f400:fe59::60d]
 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pPoMY-0001hD-Tz; Wed, 08 Feb 2023 12:36:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AwWjeCEoC5U82A6tb0qK9GYd6Ed2qMOBuiKG0XbZu9b4Vhvw6fNSoT0kveGKpjP3du5/s1vZt9n45lKZAnebh4Sih/DomlHnqzNjYYJeLlw2Gpt2UwLIU88nKvHG1PsRkAMPdszM7TK3BW4zyFsLKgONfw72RTGR3ZIolqs9oHAWyimGBfBw3ZJGaqpEcBnNyp7AKGic4keAB/gZmIxR+upOoeY1gC7loplel5tnzDQPSUUId6EtXGzOZvyW0ERllvzC7PniQHuibtDxi+smE6bmm9AASFcJwl1rw+ZcO4JLI9vImTfxxfdeR9iFx4nH6sfXreFjhHr0f8Qgb7zDxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ujw5RY0teA4KcdielWVVtAfoHMwEODN7GsAxN4HYkgs=;
 b=cxNTXQm3fECXK7benP5auuHzPHCRFLg4bgmohhVSXrgIRNbofvK+NVl9BqaRj6skMtVyALDYl94pGN5gcMYKIimY0y2IRKYqDejsUqW7CE3rmT0zugeELEs2NtkvFy09Br9NqYt4ABFMrBt0UPWaCfNGtOVbK92OAH3+/tmfPbgpX735BZhVLXlgx7qrqfeGJwiFauRwXJnrOpjmHka1da9LYGzl5D1gy3z/sohCUVWE3hLkv+f/DZVOf7AfHTzLrPe6hUj/JO8YqxK3ZWvdUcrJWBUiimELOFWZHElcHFCl4oJOGDME5wX2p9UxRN47EI1gELwxyNWGFuwYs8EvJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ujw5RY0teA4KcdielWVVtAfoHMwEODN7GsAxN4HYkgs=;
 b=UyU4LupHp+2LaYwb92jgNSXmWF+ctSf8xOzIRRl7Xqg8rMXPQhawowTR6Z81AU+wGjnfdnLm7vh11g6iD6eIRmr4PRqhuUnNJa1vzXw32tQNwgSLtrTvPhigyNRTDpxhPFWkE7RtdqPPU+2eie2NLJ+Veq78+490nbDvCFJLbrFwyl65SCrVTsHY93XBHGXtXI18s9Ug5PR5OftcseQuxEEYG9OmG8WLyHeK01qA67evrntfxT88UQWCtbHwTYEYZixgDZluLhu9ZlpVIa1mOyQM/xkIpNOPPLu3dNG0et2sZaL7FBbnNkrEha1TmGmreyXovz0+DjFWQoR6GDbTrA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB5549.namprd12.prod.outlook.com (2603:10b6:5:209::13)
 by MN0PR12MB6127.namprd12.prod.outlook.com (2603:10b6:208:3c5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Wed, 8 Feb
 2023 17:35:58 +0000
Received: from DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::451d:1f37:aa83:f425]) by DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::451d:1f37:aa83:f425%5]) with mapi id 15.20.6086.017; Wed, 8 Feb 2023
 17:35:58 +0000
Message-ID: <53b88d63-aad3-bd84-1f8c-b4724e01c1b8@nvidia.com>
Date: Wed, 8 Feb 2023 19:35:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v9 07/14] vfio/migration: Block multiple devices migration
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
 John Snow <jsnow@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@redhat.com>, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
References: <20230206123137.31149-1-avihaih@nvidia.com>
 <20230206123137.31149-8-avihaih@nvidia.com>
 <20230207153454.4e1a0c51.alex.williamson@redhat.com>
 <238b17d1-17a3-e5d1-2973-4bda83928d6e@nvidia.com>
 <20230208102242.5d028021.alex.williamson@redhat.com>
From: Avihai Horon <avihaih@nvidia.com>
In-Reply-To: <20230208102242.5d028021.alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0178.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::7) To DM6PR12MB5549.namprd12.prod.outlook.com
 (2603:10b6:5:209::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB5549:EE_|MN0PR12MB6127:EE_
X-MS-Office365-Filtering-Correlation-Id: 797cb1d6-3e72-40e2-5a67-08db09faf053
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t5L6bRdJw8/eN7HE8I9g/TZV4ITgE0fCYxltc0MRvLtZx2HCXsvMjJm1eogX+cJKN4aCxjqUmNLvo1eXXRtb1gBg45olGjitik+qAtVNs6T+PmcuzKoXEpdhnk9k837xP9vhwD2fnLzX+E+LwTmxCYRfT8ggCafFsuvEnxHZKYKhVknthglG/PLbP7f3u2BMEu752kBbokyYhWs3WfczC/6tKXcGMY9Bvf3K36KMgFTgqc0W9X2xSrxe7DstdURe4P9+Lhp0J0upig8e66rouVl/soI1ob+jCoKPNVAjtFwEgAVLfImp4h0rOrq8njcXNcg2ll30NcrV7sVv5lBIr61To9QGZIx3LkeY2yih8zuxxI545NxHIDsSxEif741v8PBZc9Sbo3bje/9dhNRlUxGHG3iUO9llsL8M/INURg8ldz0vFkUmcqj9kJ8UsoXRDSBSovixqwGMWu0Vsd0x/0vOhb5oDBIoogtugI9PoFHQavYVWvbOydGl3+7hqsBtgrXdLKs2hMsPhVhSQ0HoLPDnHS0AOhm/jlHVeu7g7ep+uT83lNzoqixY/X/yl78l9fOlNKVh2EWxwUAakpoCoV29Un0wMhy8vG+QcY4kO1uxCgN2WZcqUpXQ2exsHReJuLQt78jfoXCBY+jEs4z+863kC49BaQ4Xpuml0YD3r1yucx6hMR/77EGzWnoM91/2I9WqZ0eBr3jX0JWZXnK2ISNfQO1AEmTSUDZ9hMU2RLQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5549.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(396003)(376002)(346002)(366004)(39860400002)(451199018)(316002)(54906003)(83380400001)(186003)(6512007)(26005)(36756003)(6506007)(53546011)(6486002)(6666004)(2616005)(478600001)(8936002)(38100700002)(2906002)(7416002)(86362001)(5660300002)(31696002)(31686004)(66946007)(66556008)(66476007)(41300700001)(8676002)(4326008)(6916009)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVNEUXVoL0xJRHZCQU9JcUJxU0lwcW9qT05QK1hsOXhJZVU3YjBiQUowZ3VH?=
 =?utf-8?B?djdkMU9xbzBpeGU0bkxNUjkwOVN6cGp6WVRNWGtxYy9wdExJWjF6L3NLSU8v?=
 =?utf-8?B?QnlHSzZRcVRwWk5rd2VpZmFpQ3NiTXRFSkpid3o5SjRQZ1BJY2l0UGppRnN1?=
 =?utf-8?B?U2RYK3pja0dId0JiTW0yUThMU3hNRkJwTGRDaVBtVkR3ZnROWk1nSVJ6Tzcw?=
 =?utf-8?B?a1B2bG5PcTloMFMzVDRRM0ZISjJuaUUxcnhXK01vSFA5U0VaMEZObnBrdi8v?=
 =?utf-8?B?b1lrbG16OXZ4SVREN1liMnpnL3VmWVJTd0RWU3RJWTlwd1lYazJDaWhZUEpk?=
 =?utf-8?B?KzdlVWx0dVAvVEdkQmdIUlFpNTZJY1dxZ3V6bnhBZlBGQXBXaEFQRGVGZy8y?=
 =?utf-8?B?TmZPVGZxY0Z1OEh1R1l6b2dXeTZjck4xUkZLN292anVRRk5mbjIyV0VsUmNX?=
 =?utf-8?B?emR2ZHFRemcxQ1JzVjhsVTAzQzZ3aWFFd3U1SHBnTXNEQkVsTEY4Q0JvZmEv?=
 =?utf-8?B?ZmV6U2FSbEoyajM3b0FsK2NuOUh5YVlyVkc1dE5CamNCMit5NjRyQnRwTFpn?=
 =?utf-8?B?WVdrSnVDbWtmNndQK3NoZkFsYVRkNDM3L05Bbng3WlVuS1pxaVlWQzVvSm5V?=
 =?utf-8?B?OWFvcy92K21sdjFKbXNYRTkyZ04weitQdngxeXFwTitaYjR6ODllUXhVQXdC?=
 =?utf-8?B?ZDNrSDFSQzhocFBRY0MwM0xZOFNpVVNpV0pFT3UvK0JCZXVRMTdMRnBHbTdm?=
 =?utf-8?B?MVl4enV6bTlVbzdyN1QxQUgrVVgvNzRuZjR0dzVlc2JFQmp5azZQMlArY2NL?=
 =?utf-8?B?RlFuNkkzUHprM1R3TUxDKzRIRzBhNXhRbEsxblRuTU5uaEp4bDhWL0MzK0Qz?=
 =?utf-8?B?NU13elRxSVdycGROcjJPTTBEWXVSNlpkckszQXk0Z1VncUdlU0s1aDM5S1BK?=
 =?utf-8?B?STZQTjFwMjRCRFNBKzM0ajVxQS9pQWp3MCt5aG9qbDZQM05aczRDdVBiKzFM?=
 =?utf-8?B?VS94c1BvMDNjY0RXZndoV3gzWnpZazlnRUM5b2Q3OEVKanluWWUzVmFVQlZw?=
 =?utf-8?B?ZEtqUnc5MGVQOE9vQ0psa1kvR2NqOGxVdXBla0pVVEcrNzZuc25VTGh0VG8v?=
 =?utf-8?B?U0dnem1MWmNGcEUxTkFZNm12NXB6Sk85NXROc2hhRGp0SE8wRElvZng3QzZr?=
 =?utf-8?B?Y2hJcFhMbE0xc0RsWkMwUlJGWStGME5JVDBrLzRoK21xQUpIVWZCZFJFV2VV?=
 =?utf-8?B?Wmx6OGtsSWNlR255NVEzR3c5WkNSNzdtQ3ZtcGhSamtKaVJxcGdaWEJ0VFNn?=
 =?utf-8?B?R2hYL2JhdXd4L20xZElPUVAvQTBTZnJmaHQwTzQybXhrdUxYYWRLRldmb1VO?=
 =?utf-8?B?RzNnaTNuOEY2VFdTNVFpYjFuM2xzZFBTZ0F1bi9pc0hQN0M1NXpWNS9xY1pL?=
 =?utf-8?B?Qjc4QXI2a2FZV2dJdC9kR1NSTGp0SktCWkRUd0Z0OEtnQnczeG5MRDM1RGM4?=
 =?utf-8?B?Ti9EdjZQUWpGTTBVRTViMEM2eE1pN0xacFU3QmxRVHBQdlEzUDk2bVUxaFBh?=
 =?utf-8?B?RzhEN2labXNCQWJNNXppOHpLcXdXTDIvOGNBZ3o0dnQ3djYrcyt4L0c2SnNi?=
 =?utf-8?B?RmlSSHdJTkJpMkw1bzFIcUpDNm40VWxha3dwL1VSTS8vbTZvbzZyNk5uMWxi?=
 =?utf-8?B?bXBzbUlLRmhJdFhDQ29mMVl3Z0t1RTFSVzQ1aVcyMGpRM0JTQTQrMXdpUE1j?=
 =?utf-8?B?NjRMZmZJYjVFU21oR1ZDTng2Smp5ejVIbHlpNmNrQnIxR3EvTmdHWWhvQ0xU?=
 =?utf-8?B?Q0hzbU94YWlPcWxsTUpBZHcyM1RROGtsVDl5VWVaV0ZwMGJqN3Q5aWVhd3g3?=
 =?utf-8?B?cGFiVHczUGdKWnNTbHJuaXFzc05aTWpObk1PakU5S1ZQeW16QjVHanhUNGpq?=
 =?utf-8?B?aWxqbkl0QnRqMFNxWWJRbkdMU3lLWmN0c2NsZUlxSERjdnl4YzNqc203T0wr?=
 =?utf-8?B?Z04yQWVJbW9CQUZrVEtkUXJVclZTaHRJWTVBb3ZQWGNHRXlVNUNOaGxkVTE4?=
 =?utf-8?B?WFo4T3Q1L1dFcFJVSHBHYmo0RFFURldjQVdrbXpwcHhxcXZhWWNPZW1RTXIy?=
 =?utf-8?Q?QhY+p5L+It+gCAkgKhICfe/il?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 797cb1d6-3e72-40e2-5a67-08db09faf053
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5549.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 17:35:58.3868 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pe4OXrGfivD19OjzM6e86U7sM4kszLSGmf+m4Z3+J9z12ayIrCJ0d0IARQ+YFFI/LxQkDglWM5mijICDUaKVMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6127
Received-SPF: softfail client-ip=2a01:111:f400:fe59::60d;
 envelope-from=avihaih@nvidia.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.146, SPF_HELO_PASS=-0.001,
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


On 08/02/2023 19:22, Alex Williamson wrote:
> External email: Use caution opening links or attachments
>
>
> On Wed, 8 Feb 2023 15:08:15 +0200
> Avihai Horon <avihaih@nvidia.com> wrote:
>
>> On 08/02/2023 0:34, Alex Williamson wrote:
>>> External email: Use caution opening links or attachments
>>>
>>>
>>> On Mon, 6 Feb 2023 14:31:30 +0200
>>> Avihai Horon <avihaih@nvidia.com> wrote:
>>>
>>>> Currently VFIO migration doesn't implement some kind of intermediate
>>>> quiescent state in which P2P DMAs are quiesced before stopping or
>>>> running the device. This can cause problems in multi-device migration
>>>> where the devices are doing P2P DMAs, since the devices are not stopped
>>>> together at the same time.
>>>>
>>>> Until such support is added, block migration of multiple devices.
>>>>
>>>> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
>>>> ---
>>>>    include/hw/vfio/vfio-common.h |  2 ++
>>>>    hw/vfio/common.c              | 51 +++++++++++++++++++++++++++++++++++
>>>>    hw/vfio/migration.c           |  6 +++++
>>>>    3 files changed, 59 insertions(+)
>>>>
>>>> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
>>>> index e573f5a9f1..56b1683824 100644
>>>> --- a/include/hw/vfio/vfio-common.h
>>>> +++ b/include/hw/vfio/vfio-common.h
>>>> @@ -218,6 +218,8 @@ typedef QLIST_HEAD(VFIOGroupList, VFIOGroup) VFIOGroupList;
>>>>    extern VFIOGroupList vfio_group_list;
>>>>
>>>>    bool vfio_mig_active(void);
>>>> +int vfio_block_multiple_devices_migration(Error **errp);
>>>> +void vfio_unblock_multiple_devices_migration(void);
>>>>    int64_t vfio_mig_bytes_transferred(void);
>>>>
>>>>    #ifdef CONFIG_LINUX
>>>> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
>>>> index 3a35f4afad..01db41b735 100644
>>>> --- a/hw/vfio/common.c
>>>> +++ b/hw/vfio/common.c
>>>> @@ -41,6 +41,7 @@
>>>>    #include "qapi/error.h"
>>>>    #include "migration/migration.h"
>>>>    #include "migration/misc.h"
>>>> +#include "migration/blocker.h"
>>>>    #include "sysemu/tpm.h"
>>>>
>>>>    VFIOGroupList vfio_group_list =
>>>> @@ -337,6 +338,56 @@ bool vfio_mig_active(void)
>>>>        return true;
>>>>    }
>>>>
>>>> +Error *multiple_devices_migration_blocker;
>>>> +
>>>> +static unsigned int vfio_migratable_device_num(void)
>>>> +{
>>>> +    VFIOGroup *group;
>>>> +    VFIODevice *vbasedev;
>>>> +    unsigned int device_num = 0;
>>>> +
>>>> +    QLIST_FOREACH(group, &vfio_group_list, next) {
>>>> +        QLIST_FOREACH(vbasedev, &group->device_list, next) {
>>>> +            if (vbasedev->migration) {
>>>> +                device_num++;
>>>> +            }
>>>> +        }
>>>> +    }
>>>> +
>>>> +    return device_num;
>>>> +}
>>>> +
>>>> +int vfio_block_multiple_devices_migration(Error **errp)
>>>> +{
>>>> +    int ret;
>>>> +
>>>> +    if (vfio_migratable_device_num() != 2) {
>>>> +        return 0;
>>>> +    }
>>>> +
>>>> +    error_setg(&multiple_devices_migration_blocker,
>>>> +               "Migration is currently not supported with multiple "
>>>> +               "VFIO devices");
>>>> +    ret = migrate_add_blocker(multiple_devices_migration_blocker, errp);
>>>> +    if (ret < 0) {
>>>> +        error_free(multiple_devices_migration_blocker);
>>>> +        multiple_devices_migration_blocker = NULL;
>>>> +    }
>>>> +
>>>> +    return ret;
>>>> +}
>>>> +
>>>> +void vfio_unblock_multiple_devices_migration(void)
>>>> +{
>>>> +    if (vfio_migratable_device_num() != 2) {
>>>> +        return;
>>>> +    }
>>>> +
>>>> +    migrate_del_blocker(multiple_devices_migration_blocker);
>>>> +    error_free(multiple_devices_migration_blocker);
>>>> +    multiple_devices_migration_blocker = NULL;
>>>> +}
>>> A couple awkward things here.  First I wish we could do something
>>> cleaner or more intuitive than the != 2 test.  I get that we're trying
>>> to do this on the addition of the 2nd device supporting migration, or
>>> the removal of the next to last device independent of all other devices,
>>> but I wonder if it wouldn't be better to remove the multiple-device
>>> blocker after migration is torn down for the device so we can test
>>> device >1 or ==1 in combination with whether
>>> multiple_devices_migration_blocker is NULL.
>>>
>>> Which comes to the second awkwardness, if we fail to add the blocker we
>>> free and clear the blocker, but when we tear down the device due to that
>>> failure we'll remove the blocker that doesn't exist, free NULL, and
>>> clear it again.  Thanks to the glib slist the migration blocker is
>>> using, I think that all works, but I'd rather not be dependent on that
>>> implementation to avoid a segfault here.  Incorporating a test of
>>> multiple_devices_migration_blocker as above would avoid this too.
>> You mean something like this?
>>
>> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
>> index 3a35f4afad..f3e08eff58 100644
>> --- a/hw/vfio/common.c
>> +++ b/hw/vfio/common.c
>>
>> [...]
>>
>> +int vfio_block_multiple_devices_migration(Error **errp)
>> +{
>> +    int ret;
>> +
>> +    if (vfio_migratable_device_num() <= 1 ||
>> +        multiple_devices_migration_blocker) {
>> +        return 0;
>> +    }
> Nit, I'd reverse the order of the test here and below, otherwise yes,
> this is what I was thinking of.

Sure, I will reverse the order.

>> +
>> +    error_setg(&multiple_devices_migration_blocker,
>> +               "Migration is currently not supported with multiple "
>> +               "VFIO devices");
>> +    ret = migrate_add_blocker(multiple_devices_migration_blocker, errp);
>> +    if (ret < 0) {
>> +        error_free(multiple_devices_migration_blocker);
>> +        multiple_devices_migration_blocker = NULL;
>> +    }
>> +
>> +    return ret;
>> +}
>> +
>> +void vfio_unblock_multiple_devices_migration(void)
>> +{
>> +    if (vfio_migratable_device_num() > 1 ||
>> +        !multiple_devices_migration_blocker) {
>> +        return;
>> +    }
>> +
>> +    migrate_del_blocker(multiple_devices_migration_blocker);
>> +    error_free(multiple_devices_migration_blocker);
>> +    multiple_devices_migration_blocker = NULL;
>> +}
>> +
>>    static bool vfio_devices_all_dirty_tracking(VFIOContainer *container)
>>    {
>>        VFIOGroup *group;
>> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
>> index 552c2313b2..15b446c0ec 100644
>> --- a/hw/vfio/migration.c
>> +++ b/hw/vfio/migration.c
>> @@ -880,6 +880,11 @@ int vfio_migration_probe(VFIODevice *vbasedev,
>> Error **errp)
>>            goto add_blocker;
>>        }
>>
>> +    ret = vfio_block_multiple_devices_migration(errp);
>> +    if (ret) {
>> +        return ret;
>> +    }
>> +
>>        trace_vfio_migration_probe(vbasedev->name, info->index);
>>        g_free(info);
>>        return 0;
>> @@ -906,6 +911,7 @@ void vfio_migration_finalize(VFIODevice *vbasedev)
>>            qemu_del_vm_change_state_handler(migration->vm_state);
>>            unregister_savevm(VMSTATE_IF(vbasedev->dev), "vfio", vbasedev);
>>            vfio_migration_exit(vbasedev);
>> +        vfio_unblock_multiple_devices_migration();
>>        }
>>
>>        if (vbasedev->migration_blocker) {
>>
>>
>> Maybe also negate the if conditions and put the add/remove blocker code
>> inside it? Is it more readable this way?
> I think the previous aligns more with the success oriented flow that
> Jason like to promote.

OK, I will keep the previous then.

Thanks.

>
>> E.g.:
>>
>> +int vfio_block_multiple_devices_migration(Error **errp)
>> +{
>> +    int ret = 0;
>> +
>> +    if (vfio_migratable_device_num() > 1 &&
>> +        !multiple_devices_migration_blocker) {
>> +        error_setg(&multiple_devices_migration_blocker,
>> +                   "Migration is currently not supported with multiple "
>> +                   "VFIO devices");
>> +        ret = migrate_add_blocker(multiple_devices_migration_blocker,
>> errp);
>> +        if (ret < 0) {
>> +            error_free(multiple_devices_migration_blocker);
>> +            multiple_devices_migration_blocker = NULL;
>> +        }
>> +    }
>> +
>> +    return ret;
>> +}
>> +
>> +void vfio_unblock_multiple_devices_migration(void)
>> +{
>> +    if (vfio_migratable_device_num() <= 1 &&
>> +        multiple_devices_migration_blocker) {
>> +        migrate_del_blocker(multiple_devices_migration_blocker);
>> +        error_free(multiple_devices_migration_blocker);
>> +        multiple_devices_migration_blocker = NULL;
>> +    }
>> +}
>>
>> Thanks.
>>

