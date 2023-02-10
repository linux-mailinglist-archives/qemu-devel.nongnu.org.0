Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49413691F6E
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 14:03:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQT3O-0006no-WE; Fri, 10 Feb 2023 08:03:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gautam.dawar@amd.com>)
 id 1pQT3L-0006lp-8U
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 08:03:00 -0500
Received: from mail-dm3nam02on2061.outbound.protection.outlook.com
 ([40.107.95.61] helo=NAM02-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gautam.dawar@amd.com>)
 id 1pQT3I-0000wr-H1
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 08:02:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cOGlZhsO9MEEK8M6mwKtyH7y7RaJ5gHJL5jaGtD9FYRbINQJtu/hzAHnah2WkADC74ihyBFCk+WvU4+vZoUMWPbHAeT/kX/70zBXm8nruKpzsOlhF4+F62LBqTPo3/QdFOE4naycpOjZILeT1shFdZ+QWx/1RUaynQvuTPfg2lKzaZDLOrMmCuLxHpi99+3RUM1vesSODrHgyd52jSagfc5wBNdE7hRu9j73xqqiZDsnLNHZq4jyvtY/FyH6lAg6aRR9igh4z3u+gkhdObSp/UhzSG/UBJ8TkI1QWVnda4xmC3B+Q3kO36onHySbTfx4TAtT7K4OoC1olUdKMcHcsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z1F6SJpqeWx4Wg32OqU8EOUn/c9We6byZrKLcMT5SRA=;
 b=nMhyDEwRhNgPYMoIsK/vTuYHhEWbOZhzx9vnE/RovJFzKS5pp64uGNyMYTv4ZCrEjcD4OQw6dizi9baqWVAUXmUOLtRl5sbExhxCNx4lpYVqWfJnDRxD3NZKU7YirYexDlC/YS2937+zCm84gACYd1MsOftBM9W4wx/lgzwOqcdZIne6U0/zndj1hBOue/1a8s/POxeiT8jXxR2UAaKDeMToWOUNAliHyblRMHgrorZaURYkFwBM5OjLYGZ3I0m3N1qIh7G4vBXUgf8uQ3uRE0eqceBvonO5TbAfScSZNyvlmw6xyzg4/TPmDOO5vztEkri1kJ2AuMvl/89OcM0ypA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z1F6SJpqeWx4Wg32OqU8EOUn/c9We6byZrKLcMT5SRA=;
 b=XdKPI6ipbOiH+ioPZV43OL/F3VptdYx4Q+oK09Pxlrj9MMQI9BsgWuHCBi0FWg9k1xoql8bM0gneAaV0vaMo7R5OUXa03ocJMPwsNmI/ENzijbV9FrFKKUBujTTMEbgzDt4PXBH6kcl0I7QmatIXij+GiNy+gUndNNFxdbUhNk0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5825.namprd12.prod.outlook.com (2603:10b6:208:394::20)
 by BY5PR12MB4936.namprd12.prod.outlook.com (2603:10b6:a03:1d4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.19; Fri, 10 Feb
 2023 12:57:42 +0000
Received: from BL1PR12MB5825.namprd12.prod.outlook.com
 ([fe80::e36e:5151:6912:18e]) by BL1PR12MB5825.namprd12.prod.outlook.com
 ([fe80::e36e:5151:6912:18e%5]) with mapi id 15.20.6086.019; Fri, 10 Feb 2023
 12:57:42 +0000
Message-ID: <a316e830-3bd8-0127-688e-ca1d9a460f90@amd.com>
Date: Fri, 10 Feb 2023 18:27:28 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 00/13] Dynamycally switch to vhost shadow virtqueues at
 vdpa net migration
Content-Language: en-US
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
Cc: Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Cindy Lu <lulu@redhat.com>, alvaro.karsz@solid-run.com,
 Zhu Lingshan <lingshan.zhu@intel.com>, Lei Yang <leiyang@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Shannon Nelson
 <snelson@pensando.io>, Parav Pandit <parav@mellanox.com>,
 Gautam Dawar <gdawar@xilinx.com>, Eli Cohen <eli@mellanox.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 longpeng2@huawei.com, virtualization@lists.linux-foundation.org,
 Stefano Garzarella <sgarzare@redhat.com>, si-wei.liu@oracle.com
References: <20230208094253.702672-1-eperezma@redhat.com>
From: Gautam Dawar <gdawar@amd.com>
In-Reply-To: <20230208094253.702672-1-eperezma@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0223.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:ea::16) To BL1PR12MB5825.namprd12.prod.outlook.com
 (2603:10b6:208:394::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5825:EE_|BY5PR12MB4936:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bf7a99e-8aca-4a39-5104-08db0b66657b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 41IBlIqfDKOJAIpxICUj2T1UrHeg2G5MRPrHIrE5ZMBKG/v7EmUDPOw6jW6VRWvQ/ldPhc2pQBzwXPCSiK9cuJnxQlJm9pJWnxClkFvYBZNiPXo7SlzhLh6yYPt9/qGTBdJ6X579Ygqudfbfe3nSqmyf44bbfJL29qaMM3NorN5wL7yIYN7d0PxRx3/i+z6G+6BFbClVfbCBIn2jLi7RnwrPAIpO66daDX4HuyjVZ6laUFWRe9ECKi1eNc1A9XR8ChqQzEcAwCM4UjMzTYQaSEsutMjvCbmuy3FHaGCm1ZwvhPypTa//tFALIyj8le/T7dwKxP0ur8gBhd5lXgVyqt4HnA+Tm7R1h2+ja3+bZCubXVBz3ti1+5ZCW5vWoBnzpmdWXNCUt0s5vQlfB31DEgM5rUEcH4Gio3MMhfHkVG+R3EMnWPaFauWxAmgEqEB4B2nx96kjeaEPkiHWWxu3hr1xyxd9XadzNTqy5gJ2b+OvVqJrqklL7tjHr7iLG9bUbKCPmejhM4bYL8Ixa/t/WpGq1dTaBW1u+U3tjCewTKYyBmHt08X2QlzRKRnbKowoIT5+POTNJmo0aAs+m0uS0EFBLCpqxHU0vXLaR7oM9nLTo1Xwruo3peEL76/AKVVrOdrchCsFAMs/CqGBwU/0HdCHC59lHcTNCRlPWM40oYysUzFB2AmHf9UUym5ZP/TYl6uCGzH1O5f6EnGSBbxhnWFdQnMt+hXVBPhLMmZSdsORm+xxzDPPwEqIi1cJLYedSyt/OzkwWPKkzowbnAWDWw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5825.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(136003)(346002)(376002)(396003)(366004)(451199018)(66899018)(2906002)(31696002)(186003)(7416002)(2616005)(66574015)(8936002)(5660300002)(26005)(6486002)(966005)(6506007)(6666004)(478600001)(53546011)(31686004)(36756003)(83380400001)(6512007)(38100700002)(66946007)(4326008)(316002)(66556008)(8676002)(66476007)(41300700001)(54906003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M0FSRzFDWjhsNDd5VHY2VnNSQnVHOWYya0YyOHhzbWRhSUdyVlNMaUdBYUtV?=
 =?utf-8?B?c2pzTlVDS0JCZVFTOTdWS2s3OGVncVA3MUZvakVPV1RpSnpEVlNHdHdsMUhC?=
 =?utf-8?B?V2VTSFJOK3ZjUE9IK0cxOWlwa3RCR09RdFFYWGNXTGlMRDNPM3VBRmFzNFlH?=
 =?utf-8?B?YWVqUGFSU1JzQmUvQkFCTnZJRWM5d3VoZ1ZLVnlxNG5Ud3F0a1Y1aVZlNStE?=
 =?utf-8?B?YzZzcDhZNG5YN0Z0ZmM3ZmlGbCttTEZuWnBuckRTRWNpUjBUZjFsZXZFbjhV?=
 =?utf-8?B?dDhiOEsrL1hMdVE1eWNCNEN4V1NiZUR2TU9ON0pxeTIwcjZjeVR1NldQSnZO?=
 =?utf-8?B?Rm90c1FwRXk0QUR2ZVBCNnJrOTRwUTdPNXRua3dvbnh5WjZ5THlwRFFMTEVx?=
 =?utf-8?B?YVZqbHdwY2cvcVVJZjZRQ2JGN2J4dGxpYmxvaGFoWUtrcmlTZEgzRlA1Uzdu?=
 =?utf-8?B?WlFEbTZlRVNpTkhKQ0pWVWxzLzJVNFNMTXEvTWd4Z0NnNUNqS1V5bG1BSkg5?=
 =?utf-8?B?MExoeEwrc1NvRWRTVTVvRkJJNzlzemRhQVEyUGs1RFdsaTBEczJ1OG1xSzRS?=
 =?utf-8?B?d0pWRDJjYXhMUHN6OE5RWmhIT1N6SjAxSnljc3ljN2MyanhiNU5ta25YMmtY?=
 =?utf-8?B?bEMyUHZaNmV1bXdlbXdlYytWRUdSN1FDZFRlUmtRT0U1KzE3bTRsSThocE8z?=
 =?utf-8?B?OWNqVzFYNXZOdlV3UWMwaUpvbE5DMGl1TWRURnFNMG9LMDQ2b0V1QWhCUmdk?=
 =?utf-8?B?YkR4b205ckRnNld2bkhxeWN1NlZkNncyWDVpMjBrUGE0OWRpVE1RYzg3c2dE?=
 =?utf-8?B?NUZIN2lCQ2FuRXd6czgwZG5ka0h0ZlUwc3JneCtQYWt1cmcvZlNFWTRlekhp?=
 =?utf-8?B?ZTJ5TlZ0eGw1Y21EbGxNSkFzTzJjUnNxUVVpMTl0NWZlaWhKellFKzhCMHRE?=
 =?utf-8?B?MkFhQmU3YTRtZ0xtTzBWTDhtSTJ1UDF5eE5JRUs2MDQ4WWFaZzRYVUpZNmt2?=
 =?utf-8?B?Y2RSUU8reTMwd2d0VnFJMEJUMEh4WFpadHhQSEd6anJXaS9iUmwxWmc0cUg0?=
 =?utf-8?B?RnFEVWxVZ2dQV3VTMWN6eXU2RDdOUnhNRURzcS94Rm9KWUM2ZjVPeTgrdEM5?=
 =?utf-8?B?ZUxWWXQvdjBNWTRTbEVGWVFjWC95MnhtVGxMWWhFWG9Oa3NaeHlWOFArNHlj?=
 =?utf-8?B?QmNHTkVSVmx4RXJOcTdTY2tsSzRaRGRIdFQxVWN2K010R2d4RW8rSmhXK0Qx?=
 =?utf-8?B?eTBFWDVIaGN1c09pa2t0cVQ4R1NTZUROVFhUQTBMZGt6RHUvM2ZBcVltSzhN?=
 =?utf-8?B?L2FJeGlUVk1TdFNZbkxqUi8zeHIxR3RVMDQ0bTlGOFRiMWZDV0Z0UUp0d2hh?=
 =?utf-8?B?cFRyL2JOU1BDYTE3YU9zNWg4dnNmVjYyWVZiRllrK2oyTHdWRGdMTlo2Y1Vp?=
 =?utf-8?B?NXk1UXM3MlVUQmVPYkZ6cnFjUHRBcmtma1REU3NUVSt1K1RTUTRKTmtQdHJh?=
 =?utf-8?B?QXlocWM0eHBNcXVoV0VydkpmdW11UmsvbEx4d0t3UEJpWHQ4RFFJQnJHaWFK?=
 =?utf-8?B?Wk9hanB0RUh1aDduSVZuUVRPRFFoeWUzRE5YN25MRTBRVVltMHF6QURlQ0Yw?=
 =?utf-8?B?STloN3Z0M2p6V0NwUUIvZjI0b0hsbHJJWDN3a3pSODFXaW5XckU0cTRFQTJv?=
 =?utf-8?B?WmxyOFRYYWxtWE9jQjNCdkVLUWgrTEJMY0JYTEtGL0IzZ2JRQ2FXcnU5OXpa?=
 =?utf-8?B?T1JCVVdEUmNWZjRVS24zOFQ2cysxaitFSW5OcWZtelZGdWUxWnNhTVB5TjV5?=
 =?utf-8?B?OGJra1kvZnU0NElRNDY4WXQ5MXVvNzFJR2x0UGRNWExwbTg0VFBWSHRhOURa?=
 =?utf-8?B?MFYzSGlpWEJZK2JqVWUwVWcvUCtRWGY5bGZ4RjE1dnN5aXo1NjNnSUhsTHFu?=
 =?utf-8?B?ZzNmSVRZazVMeXBONXkwRzZRUjJFMkx2QkJsbGZnaFdlcXpDOGs4NjZOR1U3?=
 =?utf-8?B?Z2hMUkREZjRtZ2lnQ1d4dSsyKzk0d3NNT0lva3pWMEdSMVZaTjRCK2VIclVM?=
 =?utf-8?B?ZUtWeEJISnpTWmxKMCsrUDVHTzE4VVllaWs2Rjh3K0ZIT1NYSEhudHptME12?=
 =?utf-8?Q?BDHsOXr+EiGGfkKxRyl4sPsxC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bf7a99e-8aca-4a39-5104-08db0b66657b
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5825.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2023 12:57:42.4437 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: muW+BbjSYioyC4/QzxOvf6i8OR+PaOi57WtVP7UVuKlXROcPtikJ+LrEdYa7jV4J
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4936
Received-SPF: softfail client-ip=40.107.95.61;
 envelope-from=gautam.dawar@amd.com;
 helo=NAM02-DM3-obe.outbound.protection.outlook.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
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

Hi Eugenio,

I've tested this patch series on Xilinx/AMD SN1022 device without 
control vq and VM Live Migration between two hosts worked fine.

Tested-by: Gautam Dawar <gautam.dawar@amd.com>


Here is some minor feedback:

Pls fix the typo (Dynamycally -> Dynamically) in the Subject.

On 2/8/23 15:12, Eugenio Pérez wrote:
> CAUTION: This message has originated from an External Source. Please use proper judgment and caution when opening attachments, clicking links, or responding to this email.
>
>
> It's possible to migrate vdpa net devices if they are shadowed from the
>
> start.  But to always shadow the dataplane is to effectively break its host
>
> passthrough, so its not convenient in vDPA scenarios.
I believe you meant efficient instead of convenient.
>
>
>
> This series enables dynamically switching to shadow mode only at
>
> migration time.  This allows full data virtqueues passthrough all the
>
> time qemu is not migrating.
>
>
>
> In this series only net devices with no CVQ are migratable.  CVQ adds
>
> additional state that would make the series bigger and still had some
>
> controversy on previous RFC, so let's split it.
>
>
>
> The first patch delays the creation of the iova tree until it is really needed,
>
> and makes it easier to dynamically move from and to SVQ mode.
It would help adding some detail on the iova tree being referred to here.
>
>
>
> Next patches from 02 to 05 handle the suspending and getting of vq state (base)
>
> of the device at the switch to SVQ mode.  The new _F_SUSPEND feature is
>
> negotiated and stop device flow is changed so the state can be fetched trusting
>
> the device will not modify it.
>
>
>
> Since vhost backend must offer VHOST_F_LOG_ALL to be migratable, last patches
>
> but the last one add the needed migration blockers so vhost-vdpa can offer it

"last patches but the last one"?

Thanks.

>
> safely.  They also add the handling of this feature.
>
>
>
> Finally, the last patch makes virtio vhost-vdpa backend to offer
>
> VHOST_F_LOG_ALL so qemu migrate the device as long as no other blocker has been
>
> added.
>
>
>
> Successfully tested with vdpa_sim_net with patch [1] applied and with the qemu
>
> emulated device with vp_vdpa with some restrictions:
>
> * No CVQ. No feature that didn't work with SVQ previously (packed, ...)
>
> * VIRTIO_RING_F_STATE patches implementing [2].
>
> * Expose _F_SUSPEND, but ignore it and suspend on ring state fetch like
>
>    DPDK.
>
>
>
> Comments are welcome.
>
>
>
> v2:
>
> - Check for SUSPEND in vhost_dev.backend_cap, as .backend_features is empty at
>
>    the check moment.
>
>
>
> v1:
>
> - Omit all code working with CVQ and block migration if the device supports
>
>    CVQ.
>
> - Remove spurious kick.
Even with the spurious kick, datapath didn't resume at destination VM 
after LM as kick happened before DRIVER_OK. So IMO, it will be required 
that the vdpa parent driver simulates a kick after creating/starting HW 
rings.
>
> - Move all possible checks for migration to vhost-vdpa instead of the net
>
>    backend. Move them to init code from start code.
>
> - Suspend on vhost_vdpa_dev_start(false) instead of in vhost-vdpa net backend.
>
> - Properly split suspend after geting base and adding of status_reset patches.
>
> - Add possible TODOs to points where this series can improve in the future.
>
> - Check the state of migration using migration_in_setup and
>
>    migration_has_failed instead of checking all the possible migration status in
>
>    a switch.
>
> - Add TODO with possible low hand fruit using RESUME ops.
>
> - Always offer _F_LOG from virtio/vhost-vdpa and let migration blockers do
>
>    their thing instead of adding a variable.
>
> - RFC v2 at https://lists.gnu.org/archive/html/qemu-devel/2023-01/msg02574.html
>
>
>
> RFC v2:
>
> - Use a migration listener instead of a memory listener to know when
>
>    the migration starts.
>
> - Add stuff not picked with ASID patches, like enable rings after
>
>    driver_ok
>
> - Add rewinding on the migration src, not in dst
>
> - RFC v1 at https://lists.gnu.org/archive/html/qemu-devel/2022-08/msg01664.html
>
>
>
> [1] https://lore.kernel.org/lkml/20230203142501.300125-1-eperezma@redhat.com/T/
>
> [2] https://lists.oasis-open.org/archives/virtio-comment/202103/msg00036.html
>
>
>
> Eugenio Pérez (13):
>
>    vdpa net: move iova tree creation from init to start
>
>    vdpa: Negotiate _F_SUSPEND feature
>
>    vdpa: add vhost_vdpa_suspend
>
>    vdpa: move vhost reset after get vring base
>
>    vdpa: rewind at get_base, not set_base
>
>    vdpa net: allow VHOST_F_LOG_ALL
>
>    vdpa: add vdpa net migration state notifier
>
>    vdpa: disable RAM block discard only for the first device
>
>    vdpa net: block migration if the device has CVQ
>
>    vdpa: block migration if device has unsupported features
>
>    vdpa: block migration if dev does not have _F_SUSPEND
>
>    vdpa: block migration if SVQ does not admit a feature
>
>    vdpa: return VHOST_F_LOG_ALL in vhost-vdpa devices
>
>
>
>   include/hw/virtio/vhost-backend.h |   4 +
>
>   hw/virtio/vhost-vdpa.c            | 126 +++++++++++++++-----
>
>   hw/virtio/vhost.c                 |   3 +
>
>   net/vhost-vdpa.c                  | 192 +++++++++++++++++++++++++-----
>
>   hw/virtio/trace-events            |   1 +
>
>   5 files changed, 267 insertions(+), 59 deletions(-)
>
>
>
> --
>
> 2.31.1
>
>
>
>

