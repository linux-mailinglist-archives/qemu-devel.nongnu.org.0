Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3D74176A0
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 16:11:20 +0200 (CEST)
Received: from localhost ([::1]:57566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTlv5-0000de-9M
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 10:11:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mTlmQ-0005La-89; Fri, 24 Sep 2021 10:02:22 -0400
Received: from mail-db8eur05on2092.outbound.protection.outlook.com
 ([40.107.20.92]:60815 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mTlmN-0000QJ-PN; Fri, 24 Sep 2021 10:02:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IkSkyWCw1tC76m6/9PvnEoGMrKm3HQEvvLlGBcNbebqY+pC+PKLOcDkth7AWxs87XUb+qgwnDZSYq2BlOydAR21a3E3IxKkrR5TbyoTIpRN9fw3m8c88QvjZmmv0w6CnfOn+vUmmCnqPe4Ogi1cbzmdQz2zu64FXABT4JZGiM8LHBGFPZ/sFEy5Etq1srs7Og4gNZUrvUCzD69nNYyew8jhNewi8zOFBCyD5/OdEcWD/2IgZxZhjuYXuvVegH7t+QupoXTkb8smiH7S5KTqUB9SuefHDz22Wc7vsKod84u6arf3w/TTmz51DCHpXqSlgVQhCgMVTDQJvUXWRv1PIfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=RrfKQLlCvbqEzuQCPsOr/QRUk9Ameoo3cvcQwAYfHvM=;
 b=UJQ8R6Hq1TyCVwZe7ZduWVl3kmfTe9GHY1cm5GzFBsKu2+kuV1wXiu6/u86dhpddpjzz3vCmzYYIjXt1efw2ENjTQj2QLIwu7pikILzCZ2WAavg7lU8/UyMF46lzcODpSkyUe/wKh95t4WE0zXlc3YDhJuqQAw4lAWLf4yAVkZV7wX01zLgvcBRNvBdcZxgc/UFJIyKdtrTm5UJCbIbCf+kCtkorExj8kElwVzs1OQlXwLt7QSFpez8SK6zGoKfmK4C56CBoZYHXAuUMkeslqmkNO2beTvqym5wzx4MyS8VrhUReNh+0Wh8zCZaQVsCKTU0N9hUpABHQbjUuRPElLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RrfKQLlCvbqEzuQCPsOr/QRUk9Ameoo3cvcQwAYfHvM=;
 b=Ene1BJgZp4AZGbNsdlBbmdSHLWfDjYnprxUIEdoNio+g222zX9jlNvMG0Ob8iMyGcCuneNj5+rT21FrmHvtbtf+mbrCAzLc3Nq3lem4mGQnClYVoVQI5Jz/7s/QO3ViLMsU4ZbMy7HXUg3XZKpjZOf5pad/Oxvm2BwMt8v9Ot1U=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4471.eurprd08.prod.outlook.com (2603:10a6:20b:b9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.18; Fri, 24 Sep
 2021 14:02:15 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 14:02:15 +0000
Subject: Re: [PATCH 05/11] qdev: Make DeviceState.id independent of QemuOpts
To: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Cc: pkrempa@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
 qemu-block@nongnu.org, libvir-list@redhat.com, armbru@redhat.com,
 its@irrelevant.dk, pbonzini@redhat.com
References: <20210924090427.9218-1-kwolf@redhat.com>
 <20210924090427.9218-6-kwolf@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <ee35074e-b4aa-7566-4ae8-57cee895cd72@virtuozzo.com>
Date: Fri, 24 Sep 2021 17:02:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210924090427.9218-6-kwolf@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0164.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1b::32) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from [192.168.100.5] (185.215.60.205) by
 PR0P264CA0164.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1b::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.15 via Frontend Transport; Fri, 24 Sep 2021 14:02:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c7497144-566a-4916-2c5e-08d97f63e9e5
X-MS-TrafficTypeDiagnostic: AM6PR08MB4471:
X-Microsoft-Antispam-PRVS: <AM6PR08MB44715D0DF974A0187FE5DF0CC1A49@AM6PR08MB4471.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2B7oALDJp5n8+cIqcYOYzX0c8w6FCFek7ajk/evGaACvXszWHV16kUR4NYgoEEHU+vEU2B7hLXxTlB3Ky9STjg0VJ/RLzzrrHampdIlJHz18RWlOb5Pzz3neRboEjUBnbx5nQLk589tPBDopi6M0ys19zSwo2mAJFH0UAXa4wtAN3VCz8p74OKjqWRFCE/eD6DAloTYieR/7FLxAKID/Wfb5JWvS9gSzC9YYcBticOX9OmlerAB6hsXvXkbbKTcjWMXIbQDUWKdCoTUjSfuzCitYZrEeXG0gvxgFwHpLxQwV6pX9Nk/2i6we6idXHGUZoILTerzQeulOgX1y17o0ZvKuJyievRa/intIRG57TWlWz2jVuA0TDJAqJPz6x9YDsuLLn8YS7BLza8iv83/JpCaeq2XBTNieK/f5Mv1R9TXXdNBmRBzuNpCsh1GzQd4I1/k2apC7AJN/hgni1dg8mkxWUoRdzyi6CyPUmE5rcxlK6dIDxuxOJocg2STJZAA7Dtl6LHWbWZHzfttTKF4D3oZaNoClLWbjwubHEECT+V//f8ooEQ7/bQzFbR15x7Co8r7lhp/FzK8wUKybq4zO5U8C0qJmASnFDa+CE9JJwPkheB6qeb6CUZ3IKu/G2YQgymz5Aa5HhWiHQPor+kKnpVJoPISStXnuQ3rynd2gtHfgoieeIPciojdG+v0rVlR6O08jT//zhpZVpXBBOUZYciYIULsK+jWxBPkxyT3TwF9Sx1fh7NqeeWXfALYtK09V+/ycDO8gq83s5UIgdwKN3Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66946007)(7416002)(38350700002)(8676002)(5660300002)(38100700002)(66476007)(2616005)(8936002)(6666004)(66556008)(6486002)(16576012)(52116002)(31686004)(508600001)(36756003)(26005)(4326008)(186003)(956004)(83380400001)(2906002)(31696002)(86362001)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWl4VjRpSWFGVjB2U1FOWEs0M2s5ZHZYY0RHQ0IvU3RMTUo1eGpSWTJzMGo4?=
 =?utf-8?B?dWQ3YXRtcGFTMUd4TW94TFNxTS9LRXNueWwzbHVuT3JrNi9IVEhmTlhOSlVH?=
 =?utf-8?B?TjRsWEExZlYrRU42eXl4M1U5cmFVZXpoT1JuQzMzVmVLeGpneExKYjNLN3RI?=
 =?utf-8?B?OVJ6c01SR3lNeExjUG9mZlp6MFZ5MU1hNG9hZm82UXB5Z3VCd25jeWQ0SVB3?=
 =?utf-8?B?Z3BmNE02enFXNm1Jc05aNHZVU0dXajUvbDlHdjJ6RENGN2RCNjVFNStQRStB?=
 =?utf-8?B?dGs0L0w3OXVWYXVWdzZtNS9YNmlWSWJIbHN2cjlHQ08rMVFVdHNWQXk0Umlx?=
 =?utf-8?B?aUhXUHZXK0Z3TWRENWhzNER4ZS9MOHVQeTBSVVJuVmY3aDdZN1VHblgrNlhu?=
 =?utf-8?B?UC84cVNMa0xZSFo2T0hMRkZoZUJFTllIVWVBMDRQTVhqNDdOVzBMYUFMSGUw?=
 =?utf-8?B?UkpUMVhsN0gxYzNuYlJ3eUpPc3VVWWIwQlNOd1NHcFN2cVdLN1haWFNmd3F0?=
 =?utf-8?B?aHNGd24xRmRCVXBpNnE5WVpDTllxTmhRYlFkbVYxT3duRTRERjJubjFTRmZH?=
 =?utf-8?B?a0x3NXhOQWlaQS9pSFBFL1RhZ29BK2t0MkRpaTkwTGdOTlgyelh1TkJNNDBQ?=
 =?utf-8?B?TUZmdWQxUlorMkZHa1A2VEcwdVhFU0ZnbktnaWEzUmFVQ3NTSUhLODdleTM0?=
 =?utf-8?B?MXVDTEI4ci9wd2JHRmxVZXZtQU5UbityM0Q4b2M1SXdyOTBPajY1QUlQZG5Y?=
 =?utf-8?B?MEhtY1VRQ3ZGQWdzaUNwWTBnWFh3TGkwRzhQRFBOVTE5SVNtMzJWRlBWMGc1?=
 =?utf-8?B?dWlqM3loY2ZQcW4wZ2NweWNnelVhU3VPVFhFdWdUWlVtZndQTEJjV1N0c2pP?=
 =?utf-8?B?aTZ2TW5vVjFvSlM2blZOQkFyNmpHU3VvRjNsbzl0a254cWtMN2JaRUplLzhv?=
 =?utf-8?B?TDEyS1ZZbjcySlg0ajVzZnpLTFhjMFhkZmNzR2lvelg2bHkvajl3VTlvQlM2?=
 =?utf-8?B?M0RDakRkcTROMGdySFFmL0VZTC8rSFhGT2dKLzhSRWE0OGp4SmxLTHNBbDdl?=
 =?utf-8?B?d0pYczRISHNkeWRvcmI1WXJrMUtkTVBHdldWdWdycG5TMVJrTVBqTllZbStN?=
 =?utf-8?B?S1VoSDdUZTRyWXZkZi9yTyt6Z21WZE5mc1V0bzI3dWtDNjFwZDNYanp3RThT?=
 =?utf-8?B?Mm5VRjBLZEZYY2pkY3VxWlZtNUJmWm9LNlVsSFFuV0ZOOTRyZitLODJCcWJC?=
 =?utf-8?B?dFptRnhJcXZ5dFNXZ0dQMEx2b0NOT2dlbFhieGh4UXNOTEZrK3RDc0kraHpX?=
 =?utf-8?B?MTlxRHUzd1hBU0NFRjl5ZEF4TzN4b2VkenRWcFd5MjE0b3Jnd0FaUFpaTU5R?=
 =?utf-8?B?N3VnTWdiR1N0YmJ2bGV5YTlHQjJ5Ukx1WUxGeXd2Mk10R0txVnpVeCtjTGlT?=
 =?utf-8?B?T1U1dDF0eko1L01MbnBlMXBGUUVIaFhVRTVXTXdOaWtWWUpRSll3Q2FuYnpi?=
 =?utf-8?B?eUxURi92T1FOUUpFVmhKTFRVZGtWTlhLZ1h4VHZodEU1ZEdxaG9QNFF0WmRw?=
 =?utf-8?B?QS8zcHl2SWlHNjQ0YXFJd1BPbFk0VkdESDFiUTg1c1A0Kzh2clgwWVhERFM4?=
 =?utf-8?B?YW5MOUh5N0g4TUMxQzR2ckVNYkNnU1BLaVdLNHZUbHRCbGg0aGZNQjBocjhm?=
 =?utf-8?B?dXkvT3Vnc0ZaMTRWOHM3Z2hMZFFJRytEMngzalpnZjhlMTlUODNrZXE1cFFl?=
 =?utf-8?Q?yRKqnGzrkmdEe5bI10HzZYtjWCRaW/qHaJYSpiY?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7497144-566a-4916-2c5e-08d97f63e9e5
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 14:02:15.3918 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O+nsz+uauLGGWupZpt/g75WEf/+6eN1TBsekNn6uGlY6Zs9uYLASJwys6xhKJnbNzQ2GiEo3qVzXIRsSmivXb6VJHm1bsKmuFfGIsbUS9bQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4471
Received-SPF: pass client-ip=40.107.20.92;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

24.09.2021 12:04, Kevin Wolf wrote:
> DeviceState.id is a pointer to a string that is stored in the QemuOpts
> object DeviceState.opts and freed together with it. We want to create
> devices without going through QemuOpts in the future, so make this a
> separately allocated string.
> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>

Interesting that in hw/xen/xen-legacy-backend.c g_strdup_printf-allocated id is passed to qdev_set_id prior this patch. So, the patch seems to fix that small leak. Worth to mention?

> ---
>   include/hw/qdev-core.h              | 2 +-
>   include/monitor/qdev.h              | 2 +-
>   hw/arm/virt.c                       | 2 +-
>   hw/core/qdev.c                      | 1 +
>   hw/pci-bridge/pci_expander_bridge.c | 2 +-
>   hw/ppc/e500.c                       | 2 +-
>   softmmu/qdev-monitor.c              | 5 +++--
>   7 files changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> index 34c8a7506a..1857d9698e 100644
> --- a/include/hw/qdev-core.h
> +++ b/include/hw/qdev-core.h
> @@ -176,7 +176,7 @@ struct DeviceState {
>       Object parent_obj;
>       /*< public >*/
>   
> -    const char *id;
> +    char *id;
>       char *canonical_path;
>       bool realized;
>       bool pending_deleted_event;
> diff --git a/include/monitor/qdev.h b/include/monitor/qdev.h
> index eaa947d73a..389287eb44 100644
> --- a/include/monitor/qdev.h
> +++ b/include/monitor/qdev.h
> @@ -9,6 +9,6 @@ void qmp_device_add(QDict *qdict, QObject **ret_data, Error **errp);
>   
>   int qdev_device_help(QemuOpts *opts);
>   DeviceState *qdev_device_add(QemuOpts *opts, Error **errp);
> -void qdev_set_id(DeviceState *dev, const char *id);
> +void qdev_set_id(DeviceState *dev, char *id);
>   
>   #endif
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 1d59f0e59f..f933d48d3b 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1459,7 +1459,7 @@ static void create_platform_bus(VirtMachineState *vms)
>       MemoryRegion *sysmem = get_system_memory();
>   
>       dev = qdev_new(TYPE_PLATFORM_BUS_DEVICE);
> -    dev->id = TYPE_PLATFORM_BUS_DEVICE;
> +    dev->id = g_strdup(TYPE_PLATFORM_BUS_DEVICE);
>       qdev_prop_set_uint32(dev, "num_irqs", PLATFORM_BUS_NUM_IRQS);
>       qdev_prop_set_uint32(dev, "mmio_size", vms->memmap[VIRT_PLATFORM_BUS].size);
>       sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> diff --git a/hw/core/qdev.c b/hw/core/qdev.c
> index cefc5eaa0a..d918b50a1d 100644
> --- a/hw/core/qdev.c
> +++ b/hw/core/qdev.c
> @@ -956,6 +956,7 @@ static void device_finalize(Object *obj)
>       }
>   
>       qemu_opts_del(dev->opts);
> +    g_free(dev->id);
>   }
>   
>   static void device_class_base_init(ObjectClass *class, void *data)
> diff --git a/hw/pci-bridge/pci_expander_bridge.c b/hw/pci-bridge/pci_expander_bridge.c
> index 7112dc3062..10e6e7c2ab 100644
> --- a/hw/pci-bridge/pci_expander_bridge.c
> +++ b/hw/pci-bridge/pci_expander_bridge.c
> @@ -245,7 +245,7 @@ static void pxb_dev_realize_common(PCIDevice *dev, bool pcie, Error **errp)
>       } else {
>           bus = pci_root_bus_new(ds, "pxb-internal", NULL, NULL, 0, TYPE_PXB_BUS);
>           bds = qdev_new("pci-bridge");
> -        bds->id = dev_name;
> +        bds->id = g_strdup(dev_name);
>           qdev_prop_set_uint8(bds, PCI_BRIDGE_DEV_PROP_CHASSIS_NR, pxb->bus_nr);
>           qdev_prop_set_bit(bds, PCI_BRIDGE_DEV_PROP_SHPC, false);
>       }
> diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
> index 95451414dd..960e7efcd3 100644
> --- a/hw/ppc/e500.c
> +++ b/hw/ppc/e500.c
> @@ -1006,7 +1006,7 @@ void ppce500_init(MachineState *machine)
>       /* Platform Bus Device */
>       if (pmc->has_platform_bus) {
>           dev = qdev_new(TYPE_PLATFORM_BUS_DEVICE);
> -        dev->id = TYPE_PLATFORM_BUS_DEVICE;
> +        dev->id = g_strdup(TYPE_PLATFORM_BUS_DEVICE);
>           qdev_prop_set_uint32(dev, "num_irqs", pmc->platform_bus_num_irqs);
>           qdev_prop_set_uint32(dev, "mmio_size", pmc->platform_bus_size);
>           sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
> index 034b999401..1207e57a46 100644
> --- a/softmmu/qdev-monitor.c
> +++ b/softmmu/qdev-monitor.c
> @@ -592,7 +592,8 @@ static BusState *qbus_find(const char *path, Error **errp)
>       return bus;
>   }
>   
> -void qdev_set_id(DeviceState *dev, const char *id)
> +/* Takes ownership of @id, will be freed when deleting the device */
> +void qdev_set_id(DeviceState *dev, char *id)
>   {
>       if (id) {
>           dev->id = id;
> @@ -690,7 +691,7 @@ DeviceState *qdev_device_add(QemuOpts *opts, Error **errp)
>           }
>       }
>   
> -    qdev_set_id(dev, qemu_opts_id(opts));
> +    qdev_set_id(dev, g_strdup(qemu_opts_id(opts)));
>   
>       /* set properties */
>       if (qemu_opt_foreach(opts, set_property, dev, errp)) {
> 

In hw/pci/pci_bridge.c

we do

    br->bus_name = dev->qdev.id

It seems bad, as we now stole dynamic pointer, that may be freed later.

-- 
Best regards,
Vladimir

