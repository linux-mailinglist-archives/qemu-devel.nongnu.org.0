Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B98A4417755
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 17:16:58 +0200 (CEST)
Received: from localhost ([::1]:35434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTmwb-0004TP-Qt
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 11:16:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mTmuR-0003b2-AJ; Fri, 24 Sep 2021 11:14:43 -0400
Received: from mail-db8eur05on2106.outbound.protection.outlook.com
 ([40.107.20.106]:35393 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mTmuO-0000KJ-O5; Fri, 24 Sep 2021 11:14:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JVOiam390FcApJAxQOQ/lheZxcXNmp5jz5A3Zj+6Hd0Gz73j1cnR2w3XN/OvTynqlmFfqYLlzkx72PwGPyGjnwnYtRi2INT/W0HR/cTIzNGukvuD4d+AHBhhJSznNIGerdp9AlLo15zZGgEr1BuDNXe8BBvE9khjUcwiCu5hNLouBabkdMZKB6HIWReorCDXZvsLr72PvTE9tQA5w1Cxa8trw7I/3of/l05OlX2EojcWCwW8htfg5L2Vc1FdyeTDr0I5A0UIMwmMl2xJJvLp5gKYGVomPR0ZvyiMcRcsCYQvT2JgyK5a/GYAjeSCPMA5XNZcyS+TrbyYseEiQTsxrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=1XVJQXvrLvwxu6oaaLvB/LGBblIbF3uolxOuBOCitIM=;
 b=KOHgCk9Z4R7Tz6DfiBiuFVBjouLnQEtLzOA0TVwoY0XO9wcUJT9ypWo/4p1dgn3T8g/y0FN4Vfgc1IEHP5NJBcrK1fFFyjx6GfujYhtOSXLiloyN08zyiROvHtYF+FwARL8To9hq6vt24gRBSC5ZjTq/cJ66iJq9ozLT1sA4UDo9+oBqtlhHaPsU1kc7lDr+wDD9Jhk2SjDOIetrzgjrI7DnDBQD8uhqdllQpqXjg4Yml2QQyocmdUc+2MT//2zl8WUzb95tHUvnjiXGlAS3LfMSJQZf4aa+/NwS9A0Gy88qak2fg34N1FXpaVKVq9o7BYRmOs08SJaQzp096jHk2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1XVJQXvrLvwxu6oaaLvB/LGBblIbF3uolxOuBOCitIM=;
 b=wPXq+AeF7Nnoz3fOWp4U4JXCBoD0+IQZ+cJ+rcxRbLuLHuFkOUkoHYm0fDzlNQLqMIEl/lg49QPoApg/MtpiaJ0wni4uvgH/gSImcvw8h+d3uH6N3s5ob2bqOwu+zzl5X4qSAIycTmPCdNeWfG68FlmvW1hNB3qGbNot5rlOxTE=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5493.eurprd08.prod.outlook.com (2603:10a6:20b:102::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Fri, 24 Sep
 2021 15:14:37 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 15:14:37 +0000
Subject: Re: [PATCH 05/11] qdev: Make DeviceState.id independent of QemuOpts
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-devel@nongnu.org, pkrempa@redhat.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, libvir-list@redhat.com,
 armbru@redhat.com, its@irrelevant.dk, pbonzini@redhat.com
References: <20210924090427.9218-1-kwolf@redhat.com>
 <20210924090427.9218-6-kwolf@redhat.com>
 <ee35074e-b4aa-7566-4ae8-57cee895cd72@virtuozzo.com>
 <YU3qaUd4jDdcdOrB@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <6f39b6ae-b517-e7db-cfc6-7b341c430161@virtuozzo.com>
Date: Fri, 24 Sep 2021 18:14:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YU3qaUd4jDdcdOrB@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0042.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::13) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from [192.168.100.5] (185.215.60.205) by
 FR3P281CA0042.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.9 via Frontend Transport; Fri, 24 Sep 2021 15:14:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 745d83c9-224f-427f-8fbf-08d97f6e05af
X-MS-TrafficTypeDiagnostic: AM7PR08MB5493:
X-Microsoft-Antispam-PRVS: <AM7PR08MB54930EDEDD7FDA61470BD567C1A49@AM7PR08MB5493.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S7Eoy16rsZFKp+bX0KnpfsgKdFY0XThIYyE4hnRVDKAGx78LOJFD8EPziYbfNn0tUf3TMJG8z5awSFHB1c1u7Yi4/YiWmVK3cgn0nL40XA1mTYP8jcHxgEKuuxmwMq2NSDvNU8eTpB4eWZ4b3XtMkbUk3jHjLNnBbsi/6d8438qm5gvyk4HvTWT7YMYMFDGhpgaPnfwh2WqvT8gKZjKJRs01QM+AdvjOkCh2/GGMseCJtA9nHq+onkszsLQ9x0t8hsUBnCGI02/u5Y4m/EZasnN4OXvCxnQSbdixvy7W10FBAeHwh9GobbRS3hKntWoYdVk1KO5olhdAdLxqb7/B4fdqMznORnxKzyRAdpG/n3RmN6eJA8Tc640LoMcbNrlbyXeitTAZcEELhHjwS/rQa+LtEkQs0DUGIoKpeRQpRFX/uBCqJxT01IwpOfcJ7XDGdhJnGN493SxphIFZ+Wv0TZjSkwTCgKbcxdKdBpH8m+YObQu7x7NTpycjZdhZV99igj3GnRIkN1+wH7zIYQZS4Y+A0M3GXqVmC6Dl3NeWNPS/XxrU5veijdaGS4aiACL6XivLSK/IeHsnjWmc2K3t4dmVc3yhVEZ66Jz7jksvOGfCOF+WoJ9aINKYvb+9uTvegPhdi7Tu4+7hiFxReQBgYqgyse0xlfZiI/3IAY7wtJD5W/668leAwra/hKmMvpSotbS5kC9ZuUq6iB7tMXUxpjS3psnK+fn6LQKaAt3WlwYgezT7DtWuOAaZmwArOYY9DO8WYgePHo6fJEo7WrUSkA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(31686004)(6916009)(508600001)(52116002)(7416002)(956004)(31696002)(36756003)(316002)(8936002)(5660300002)(8676002)(16576012)(2616005)(6486002)(83380400001)(66556008)(26005)(4326008)(186003)(66946007)(38100700002)(86362001)(66476007)(38350700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dklpazIrNWwvekxCTHJES3hIUWdwYXJUa2tJMTBSTUh4WHlGSC9jZXQxZjFN?=
 =?utf-8?B?ODFEdmJXc0Z5b2g2NmpRQ1l5eDJ3bFd5aThzSWRsN3E4bXNRV25HUXNrUlRl?=
 =?utf-8?B?S00ya2RBc2xmMWRpSkNOSHcyaEpXZjI2Vlc5VXVOSmtqcUxUYmNOSmFkV3ho?=
 =?utf-8?B?VkpldE9FMTBoT3hablhVbFU2SGVXQkNPMEtHYWx6NUlRM3JTSVZvQVpyU1Yy?=
 =?utf-8?B?QXJ1Z2FPbXAzL2ZkMEJHc3VXaTFXUGFBQXlsZ3RuRG5vYWc4YlU1SkkyMjNH?=
 =?utf-8?B?ekhobFVLK0VhalV0ZmpvMHl0aFN2UTZ1WGt4QXhzSnB0aStyMjEvVnhXNktr?=
 =?utf-8?B?Umc0ek1uUDJkNGxQcVFhSnJqRjdUZUJRbXR5cytpa1g1WjBSZUlqQW4vQ3N4?=
 =?utf-8?B?YzIwQTh3MGJDMHpLWDFEd1pkeHJIOUY0TWI0WmdXV2ppbDRidHVZeGU0V290?=
 =?utf-8?B?MEhJeVI5c01LL2tjcGdSTVp5NmkwV1puZWRUTmhDZEE4VTU3YkxlcnMxUHFM?=
 =?utf-8?B?d2loUDJhUmpJazVBMXFuOGFXOWpuTGJ6N2JSRzlwNUlPc0s0Zmw5T3FSZmJs?=
 =?utf-8?B?c1FWczJ2SkZjMXR6UC90UDV6QitBQ29FME5STmxQODc5Mktkd243dXN3MFVk?=
 =?utf-8?B?WFRGRlJ6VjNEQkpua1h4T3VSRU1SSGFHTzBKdFNZTGNNeDF3bTVKQ1JzaU1u?=
 =?utf-8?B?N2tXMnpIK0dNWVFYZTRqK3duY2RPajMyWFB6Qm5TOEdBTElZWXQzMFZpdngx?=
 =?utf-8?B?ZFNMVlBuQUlHbUlwSTZrZHQzeWNNRkpVRmVkM3ZtRDFINnJOMThFdTFJS1k2?=
 =?utf-8?B?U1Y2RGxDQ1dMSkZUajRLVTMvU0trWk5IVTdlTDh1QU01b0RRd2R6UFBBVmNt?=
 =?utf-8?B?YWV0Rmo3MlU3WnY1QnV0MGlSbW5vQ0s2aDQ4T3grUngyUGo0Vm1GUzZwcllm?=
 =?utf-8?B?RFRsZHBYaE1KMEZjSjF6NjZRbzZxWHhJVUFyM2sxYWp5a09TcHBmdWhqeGtw?=
 =?utf-8?B?UkYwcFhHMXB2Qy9OeVpQczgydm9JSGJ0ZFk0RU5lYStuYlNEbWp6d21mR1Mr?=
 =?utf-8?B?bXQ2SU1ZQ1pkWGxhc3BiQmN5VW5wZHMzTzk1WTd6R3hUUTlVMWMwb2xYSERu?=
 =?utf-8?B?RmJCQ0NXYUp5K3FIK2JwL0wrRzNGdnlwdUVsV25wWUh4TjU2ZklFRDh4Z3R0?=
 =?utf-8?B?bklyZGdJSXFjUDJsdnZjUjlrZWZvdmw4eGc3ZVJ6UFNVcWVZZUc2UTJldDQx?=
 =?utf-8?B?WkFUbFdwVEY5OWdQQmQ4Ynk3Tm1qNU1obnR3Uy8zYVdvaVRMblhUSnBzRk5w?=
 =?utf-8?B?ek9iZmFuQ0dkd0lHSU9KeHNFRWJoZ1RoMkNWM2RHYmFtazFPOUVhcDlIUWJ6?=
 =?utf-8?B?VTRBT2hUWUJTSEVqRDk3VER1MnliQjQ4Ym1id3JZUkx4RFphdFdIMUtGK0dh?=
 =?utf-8?B?MHlWa2JRZHRZTmhKYUM0UWhlZDdHdlhjamZYMWI5SmlKM3l4Y21WOG9ScXVy?=
 =?utf-8?B?WlY4T2kxS0htdDBrTVRuaFByQWxSdFFhbXR3YWVGUzhLWSthQ1N5UDE3ZXZJ?=
 =?utf-8?B?RGpLR0tRNTZkdHZaRGQyWDYzTWZKZDI3K2lBLzFPaDdMSzBWbCthTlE2UnVx?=
 =?utf-8?B?aDEyd3JyWkRubjJ1Tk9qdCtRa0FKS0s3M1pVU3lvbGRYaWpUK3VzUzUrMWFC?=
 =?utf-8?B?NmZRQXgrcm1RazJRMmNxRXVybDZJTTNLTVRLWHRtNjl5UmRaN2RkYXRhWkRW?=
 =?utf-8?Q?7FMJ8idic2pdoPrxgMuyz8YVfz7lOm3mj+grMzl?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 745d83c9-224f-427f-8fbf-08d97f6e05af
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 15:14:36.9422 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KKp2MFlnjXwcvjh5/Q4bWqsYOw8ctATzy/iBvWVEFnzi8FD23vRv9s3rHpKtXGnCtsV3tikLtDpgk9PeCF7FJYp2zkB3cQVbfyLj74ltoxE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5493
Received-SPF: pass client-ip=40.107.20.106;
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

24.09.2021 18:10, Kevin Wolf wrote:
> Am 24.09.2021 um 16:02 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> 24.09.2021 12:04, Kevin Wolf wrote:
>>> DeviceState.id is a pointer to a string that is stored in the QemuOpts
>>> object DeviceState.opts and freed together with it. We want to create
>>> devices without going through QemuOpts in the future, so make this a
>>> separately allocated string.
>>>
>>> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
>>
>> Interesting that in hw/xen/xen-legacy-backend.c
>> g_strdup_printf-allocated id is passed to qdev_set_id prior this
>> patch. So, the patch seems to fix that small leak. Worth to mention?
> 
> Ok, I can mention it explicitly.
> 
>>> ---
>>>    include/hw/qdev-core.h              | 2 +-
>>>    include/monitor/qdev.h              | 2 +-
>>>    hw/arm/virt.c                       | 2 +-
>>>    hw/core/qdev.c                      | 1 +
>>>    hw/pci-bridge/pci_expander_bridge.c | 2 +-
>>>    hw/ppc/e500.c                       | 2 +-
>>>    softmmu/qdev-monitor.c              | 5 +++--
>>>    7 files changed, 9 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
>>> index 34c8a7506a..1857d9698e 100644
>>> --- a/include/hw/qdev-core.h
>>> +++ b/include/hw/qdev-core.h
>>> @@ -176,7 +176,7 @@ struct DeviceState {
>>>        Object parent_obj;
>>>        /*< public >*/
>>> -    const char *id;
>>> +    char *id;
>>>        char *canonical_path;
>>>        bool realized;
>>>        bool pending_deleted_event;
>>> diff --git a/include/monitor/qdev.h b/include/monitor/qdev.h
>>> index eaa947d73a..389287eb44 100644
>>> --- a/include/monitor/qdev.h
>>> +++ b/include/monitor/qdev.h
>>> @@ -9,6 +9,6 @@ void qmp_device_add(QDict *qdict, QObject **ret_data, Error **errp);
>>>    int qdev_device_help(QemuOpts *opts);
>>>    DeviceState *qdev_device_add(QemuOpts *opts, Error **errp);
>>> -void qdev_set_id(DeviceState *dev, const char *id);
>>> +void qdev_set_id(DeviceState *dev, char *id);
>>>    #endif
>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>> index 1d59f0e59f..f933d48d3b 100644
>>> --- a/hw/arm/virt.c
>>> +++ b/hw/arm/virt.c
>>> @@ -1459,7 +1459,7 @@ static void create_platform_bus(VirtMachineState *vms)
>>>        MemoryRegion *sysmem = get_system_memory();
>>>        dev = qdev_new(TYPE_PLATFORM_BUS_DEVICE);
>>> -    dev->id = TYPE_PLATFORM_BUS_DEVICE;
>>> +    dev->id = g_strdup(TYPE_PLATFORM_BUS_DEVICE);
>>>        qdev_prop_set_uint32(dev, "num_irqs", PLATFORM_BUS_NUM_IRQS);
>>>        qdev_prop_set_uint32(dev, "mmio_size", vms->memmap[VIRT_PLATFORM_BUS].size);
>>>        sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>>> diff --git a/hw/core/qdev.c b/hw/core/qdev.c
>>> index cefc5eaa0a..d918b50a1d 100644
>>> --- a/hw/core/qdev.c
>>> +++ b/hw/core/qdev.c
>>> @@ -956,6 +956,7 @@ static void device_finalize(Object *obj)
>>>        }
>>>        qemu_opts_del(dev->opts);
>>> +    g_free(dev->id);
>>>    }
>>>    static void device_class_base_init(ObjectClass *class, void *data)
>>> diff --git a/hw/pci-bridge/pci_expander_bridge.c b/hw/pci-bridge/pci_expander_bridge.c
>>> index 7112dc3062..10e6e7c2ab 100644
>>> --- a/hw/pci-bridge/pci_expander_bridge.c
>>> +++ b/hw/pci-bridge/pci_expander_bridge.c
>>> @@ -245,7 +245,7 @@ static void pxb_dev_realize_common(PCIDevice *dev, bool pcie, Error **errp)
>>>        } else {
>>>            bus = pci_root_bus_new(ds, "pxb-internal", NULL, NULL, 0, TYPE_PXB_BUS);
>>>            bds = qdev_new("pci-bridge");
>>> -        bds->id = dev_name;
>>> +        bds->id = g_strdup(dev_name);
>>>            qdev_prop_set_uint8(bds, PCI_BRIDGE_DEV_PROP_CHASSIS_NR, pxb->bus_nr);
>>>            qdev_prop_set_bit(bds, PCI_BRIDGE_DEV_PROP_SHPC, false);
>>>        }
>>> diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
>>> index 95451414dd..960e7efcd3 100644
>>> --- a/hw/ppc/e500.c
>>> +++ b/hw/ppc/e500.c
>>> @@ -1006,7 +1006,7 @@ void ppce500_init(MachineState *machine)
>>>        /* Platform Bus Device */
>>>        if (pmc->has_platform_bus) {
>>>            dev = qdev_new(TYPE_PLATFORM_BUS_DEVICE);
>>> -        dev->id = TYPE_PLATFORM_BUS_DEVICE;
>>> +        dev->id = g_strdup(TYPE_PLATFORM_BUS_DEVICE);
>>>            qdev_prop_set_uint32(dev, "num_irqs", pmc->platform_bus_num_irqs);
>>>            qdev_prop_set_uint32(dev, "mmio_size", pmc->platform_bus_size);
>>>            sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>>> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
>>> index 034b999401..1207e57a46 100644
>>> --- a/softmmu/qdev-monitor.c
>>> +++ b/softmmu/qdev-monitor.c
>>> @@ -592,7 +592,8 @@ static BusState *qbus_find(const char *path, Error **errp)
>>>        return bus;
>>>    }
>>> -void qdev_set_id(DeviceState *dev, const char *id)
>>> +/* Takes ownership of @id, will be freed when deleting the device */
>>> +void qdev_set_id(DeviceState *dev, char *id)
>>>    {
>>>        if (id) {
>>>            dev->id = id;
>>> @@ -690,7 +691,7 @@ DeviceState *qdev_device_add(QemuOpts *opts, Error **errp)
>>>            }
>>>        }
>>> -    qdev_set_id(dev, qemu_opts_id(opts));
>>> +    qdev_set_id(dev, g_strdup(qemu_opts_id(opts)));
>>>        /* set properties */
>>>        if (qemu_opt_foreach(opts, set_property, dev, errp)) {
>>>
>>
>> In hw/pci/pci_bridge.c
>>
>> we do
>>
>>     br->bus_name = dev->qdev.id
>>
>> It seems bad, as we now stole dynamic pointer, that may be freed later.
> 
> If it's bad now, it was as bad before because previously it was just a
> pointer stolen from the QemuOpts that is freed in the same function as
> dev->id after this patch.
> 

Ah, right, OK.

> I think the code is correct (it's just another field of the same device,
> the real bus name is just a copy of it, and the bus can't outlive the
> device that owns it anyway), but it might be bad style.
> 


Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>


-- 
Best regards,
Vladimir

