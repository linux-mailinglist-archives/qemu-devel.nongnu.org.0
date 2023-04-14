Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCCC06E2A59
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 20:58:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnObl-0004YB-9Q; Fri, 14 Apr 2023 14:57:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vikram.garhwal@amd.com>)
 id 1pnObd-0004XQ-VM; Fri, 14 Apr 2023 14:57:10 -0400
Received: from mail-bn7nam10on20620.outbound.protection.outlook.com
 ([2a01:111:f400:7e8a::620]
 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vikram.garhwal@amd.com>)
 id 1pnObY-0007qY-NK; Fri, 14 Apr 2023 14:57:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UdfrrNo+o+N5/e4JzNIRyFr7+YEkVXhkVqsWWISgrIdleEOz7fAimDZ1FNJ1NunW8uM01PqCuQ6g/Uyy8YxDivQqqIXOPpIeLKvK+BWA4e+l5ycrydshjv3geUUcf4xU8auBOZ4q+ovEY2v4gJk/j0IL+KE/JhNpPNIHy8PkC6ZUCwemLBQpXvx5lOBVmavNuESmmNV904d1sL3cHSX0dqo6JL1O6MoM6f6Np+zWB7D7JgLAKSSPJ0JlQhr2u/OXj0WDDLU6DZVhSsmbe1eBGwrMwEr5LNrOtYa+l5964j459M06q5BfV2wwj7CwZOwd7caeuXeeWhkXHgo1xXn6Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x+ev8Ix7AeWSaPF4Fme6w7oy1p/wvTXvbRnA9ra92q0=;
 b=Co9bQ2QBpTEr8yNM3//VWg5zg5i262vmdTIx/Cjjxetr8AL+xTP8uqtPoJKx+j8CN46E7TzEF+EZHpudHb3OtTVaYR9x/HjHOOJEH1mWQMr2hu1cjBo/nRwf22AjSE3Pb/CuYP2MEJ+270F8+nP1AWM3xu4haLKQqI3GjTmgnrpJl0iXgPZCG+ua3Vy8Rp/O8XmKe92O6t6nKg3jp+Bj0D/pDh5Vvt8Bv0YP/zqOkET2ISVDumRwv20/vcAgGH9ZX0IhPPdqBsr/BDpyBEUP0T+pOxIyWt8rklMEE/JvDS/8QRB3AO4XSbEtVOJVtelmTT06OrleTJ2FAWqFumxRqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x+ev8Ix7AeWSaPF4Fme6w7oy1p/wvTXvbRnA9ra92q0=;
 b=2qbFyPR2EGDVNAN+MS1DfD7tIcfH92CTJr7r5vyQEVAyOo0blD0dair/aeCKX7WbNkd8YsLgmN07dyeUpRZvKbumxJybVPmj9kwduHw5Y0WVT5DogdwI9rJhNQ3twMD4uzujBhJ4hbkmDsCI6Vg9aewwet083xU6wEeXkYJMGG8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4409.namprd12.prod.outlook.com (2603:10b6:303:2d::23)
 by IA1PR12MB8311.namprd12.prod.outlook.com (2603:10b6:208:3fa::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Fri, 14 Apr
 2023 18:56:58 +0000
Received: from MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::f6c3:91ae:9bd8:edea]) by MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::f6c3:91ae:9bd8:edea%6]) with mapi id 15.20.6298.030; Fri, 14 Apr 2023
 18:56:58 +0000
Message-ID: <f2736108-c281-d671-84a8-4723e819e941@amd.com>
Date: Fri, 14 Apr 2023 11:56:55 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
From: Vikram Garhwal <vikram.garhwal@amd.com>
Subject: Re: [QEMU][PATCH v3 2/4] hw/net/can: Introduce Xilinx Versal CANFD
 controller
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, francisco.iglesias@amd.com,
 Pavel Pisa <pisa@cmp.felk.cvut.cz>, Vikram Garhwal <fnu.vikram@xilinx.com>,
 Jason Wang <jasowang@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 "open list:Xilinx ZynqMP and..." <qemu-arm@nongnu.org>
References: <20221207021322.16165-1-vikram.garhwal@amd.com>
 <20221207021322.16165-3-vikram.garhwal@amd.com>
 <CAFEAcA_9DX24u4-C_5RcL4ZqHpdCDg3Spd4Ksp9vJQHXSqBRcw@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAFEAcA_9DX24u4-C_5RcL4ZqHpdCDg3Spd4Ksp9vJQHXSqBRcw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR11CA0065.namprd11.prod.outlook.com
 (2603:10b6:a03:80::42) To MW3PR12MB4409.namprd12.prod.outlook.com
 (2603:10b6:303:2d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4409:EE_|IA1PR12MB8311:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d1f1fca-1c01-4d54-11ca-08db3d1a05cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NotHgiu4YpHC3I+1eb6B+2T7ji8j6JdLfd7Dv5euFrGpGpNzQEMJhZp38cgnlUUE2aKr8x4AFIuQ9Gu3mcrDrB9QFrX1HSZKbewCaL7GPEeWjcLBqCo4GkI/6tp8dvyF5o9/bu8HofTVBxH6LPHeYYLgcI/OfPApvI19O97HbVnj60pvTCrt93PNJKgtKgwhkeQ5cvIYme4mr1QMYEyBc49KKxesvQK719BD1X3ljM4bdVR2WTWj2PKqQLdpFPSF1nS5ploEI8HC1o/BaocctCZfiYuUjIOHhzx88hVvGLpfCbMeC6e67tsPdx/2HOtiOHA5rerPhVdVQVLA2J+VIiFBpL8NB1oFDHkNemv7p0g5Q7aMVA1/DSmL0yBoR1xkDB2sw/fhl0NjyKwCgCLGg9K392CPRF2WJKqnL+ousC7rLw4c611PlsQ+ECa1X/4/BGv1STjCv96jeDv+qI8RIPjodAfIyUViRD2gwQhZ6XAjm3gt0DlIYLBI2WFcel95csXzDdtDnjRhWfHCA+HpxkAN7NO7cJcfz2vVQbvtfsU4KCDL4yu112bh8MNU4vNrnpw8dazqkbRTz1LDG52PYaytUML1ODwfyqlEmcTHxjKPizWQdtr4f1MPuKqGiLevlquzQF/mdYGV8l46w8Wjow==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR12MB4409.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(346002)(366004)(136003)(376002)(396003)(451199021)(31686004)(8676002)(54906003)(66476007)(6916009)(86362001)(31696002)(478600001)(66556008)(38100700002)(66946007)(4326008)(186003)(2616005)(26005)(83380400001)(316002)(41300700001)(36756003)(6512007)(2906002)(53546011)(6506007)(30864003)(44832011)(66899021)(8936002)(6666004)(5660300002)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b3FhZkNxTnY2b3dxODNRQmVQbTV3bG1MSk93ekhoQWtUNUkwZjdIWWNxYVZ0?=
 =?utf-8?B?Yk5nK3VRdWZBQ3JMVFVUSW5WMW9Vcjg4emFRUGhiR2wrdmI1QnJGZkJqaXcz?=
 =?utf-8?B?N0hqQmVMdXRXWlY1eUFEN3JDMVlMcVk2U1A5T0YxKzNnV3NJdkl6RjMwMjd5?=
 =?utf-8?B?MEMwMWxUR3pLWWIwdjdGcHhUbW5FeHJaN2kxaFJPM0ZremRpK2dmNXdndUE1?=
 =?utf-8?B?bkVHaVV4a0wwalNmU2gvTVdVWmNNaGFxVUlqTXYySHhEbFBRRmhFRm9IazM5?=
 =?utf-8?B?UGRJNmN3cko4WnFOaDdQQTRsdHcxWm5ldndpYk9XQVNtVzkwS3JUUHhpcnZE?=
 =?utf-8?B?RFJHN2xWV291NnRCYmpaSld6aUxOY1V2Q05GY01FN0xZcXlHd1prRG9YeXFL?=
 =?utf-8?B?WjZWMVBCejJrYVFjVzQ1dHVra3VVSStOS2YxeG9kbFRreU1iR2FzUlE1ZjNM?=
 =?utf-8?B?TlVxY3JGNU1KWGZ5UjQzL1ZJNHlPcS95aW0rZDZ3cjg0azFYYU9wcTRJQVFr?=
 =?utf-8?B?UzJhaDdrUS9acTl5VlUzZ2pOSENPa05YT2tEbUduWlVkWVpWUStMMTd6eWtw?=
 =?utf-8?B?OXJFem4rNThWUUtyOHFOWVNFRTNPcmJSYzNxc0dqZzJ1RmNQSkVyUUdoOVF0?=
 =?utf-8?B?T283QUxvckF1ZnNYVlVoVy9idWZnVTJ6ZmM3RVFrTExmUVFmV0lGSDZpWlBS?=
 =?utf-8?B?cmVlQ0hZQnV3K3pHUDRnV2JVZGwzRDg2UUk5MUdTVUo5eCs2Q1g2elNTZDhy?=
 =?utf-8?B?NGE0WDN3TnpPM0toRTNvMlNLWkdPdnMwT29jNWQyL21aOGRPMGQwUVB2enJv?=
 =?utf-8?B?N1g2L2puRFhDWm56WnB3T1Y1c2c3VkM2Ylh6dWNlTVlOcU8wV3ZiMW9OdFRC?=
 =?utf-8?B?YmYySXJwa0tkRWQrWU54c1Q2a2tySnZDSDVWbGEyVHNhS3lYMTRrZ1JYZWIx?=
 =?utf-8?B?dHRjT1pxK095WDZEUHdPbXRzRU9UeHEwMXcxZlE5OW92ZXluamdMQy9BZkZP?=
 =?utf-8?B?ZHRtZisreHdRU0tBbkw5RHZQcjdkRHlCWWJiOWN3Nm1uczRrU0RoVllnSzJQ?=
 =?utf-8?B?cUZaWHg3OEEvV2FZZzVGc1UwYmhMcjNkUys0R091ZFllSlZlNWFiUUI0SVY4?=
 =?utf-8?B?RG5acnRRTXR0cVZWVnJNeUx4YkJOcWU4bW5hY3lCVGQyRjdIVFRyV2JrVWhr?=
 =?utf-8?B?SkRKejRDZktCK0x2eGxmd0ZwVXpUczJ2OGhiUS9HczQ5bUNvRU14RjhhZ2Qz?=
 =?utf-8?B?Z3o3bU9UNHZWSWhPcUhkcU4vd25LdlFVdXdKSHBWRlYvWjJMUGxkQ0JQL2Y3?=
 =?utf-8?B?YzF1MVlUZ0QzMHk2ZmJGYUJRODc2SVBFOGEyMDhWREd2YmMwWFFXRENmbUZr?=
 =?utf-8?B?NTc5eDNwQkp6Y2RQbUxsOWVNYyt5QkNGUFhJd0krZUYyVjd1cHJvV0ZvTTN2?=
 =?utf-8?B?NGFKRmdsZzZ1ZDBuZ08vakl3TjZRQzVWYVN4eFFhR2w5UXh1V2ExN0owbXpC?=
 =?utf-8?B?UEVMMFBCZ25rWEtoNE1ydmVaZkVwK1VHSzlkeE1BdWlkK2JWbnlVdG1Cc3k2?=
 =?utf-8?B?VmRZT0xLMllEdVZHeDRtNXNJM1JvMFlRNkJyU3hMbUZoR0FiM2VzbFZMckpQ?=
 =?utf-8?B?Z3hmcTdlM3lVeDdyZkF2eTdIMjNYQXRKdHVHVklkZWEyUUVCQ0MwSG4yK0Jl?=
 =?utf-8?B?eE1uWmpWMmQ5NXdlcG4ybTJlSnRQcERFUlprc3BoYXFuY1ZPNjVaUnFjSmRj?=
 =?utf-8?B?Z0xkWkxxaDVpUnJDWnZyZzJGelVxeUQ5bW1yWm1DZzVIMGtWS1MwdjZwaTh0?=
 =?utf-8?B?TUxHWG1SSG5yQnpyeTFYUHlUbzRLdE5zb2Q5Q2dUc2l5ankvRWJkS2RyK1Js?=
 =?utf-8?B?NVhod3RCQXNEYmlzU2lNQUYwOGdyeXpEKyt6OWxHNTNUckJNREh0bFYxZWR1?=
 =?utf-8?B?V1hvdlBPSCtSRXFkMUdvVTFLZzBUbFMzdFdLYW5aK21oNUFoYUo0NFNoWUpo?=
 =?utf-8?B?ZkFOMGdGcXVnT0YydVBST2JOUXRMdUNZZUJEMlIvUmhMb0JidjFwQVFPNktY?=
 =?utf-8?B?aFFSdW5ndVg4TjJtaTEzdkNaZE9QQisxZk5oaTF5cnJuZXpsWDBhV0xTMy9n?=
 =?utf-8?Q?IdqhiDBHqIRNvL7nJawxTg4UP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d1f1fca-1c01-4d54-11ca-08db3d1a05cc
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4409.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2023 18:56:58.0131 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4PPyDEiTEXO0uL/vAn8xEAe4GWZM9a3+eX+WUEnPTL0f+YeDDASGMUzM3s2r0yrGlGV7mKmptG20JkRwLqXwWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8311
Received-SPF: softfail client-ip=2a01:111:f400:7e8a::620;
 envelope-from=vikram.garhwal@amd.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.282,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Peter & Francisco,

Apologies for long delay with next version i.e. v4. I was on family 
leave and resumed work two weeks back.

Please see my comments below.

On 12/19/22 8:11 AM, Peter Maydell wrote:
> On Wed, 7 Dec 2022 at 02:13, Vikram Garhwal<vikram.garhwal@amd.com>  wrote:
>> The Xilinx Versal CANFD controller is developed based on SocketCAN, QEMU CAN bus
>> implementation. Bus connection and socketCAN connection for each CAN module
>> can be set through command lines.
>>
>> Signed-off-by: Vikram Garhwal<vikram.garhwal@amd.com>
>> ---
>>   hw/net/can/meson.build             |    1 +
>>   hw/net/can/trace-events            |    7 +
>>   hw/net/can/xlnx-versal-canfd.c     | 2121 ++++++++++++++++++++++++++++
>>   include/hw/net/xlnx-versal-canfd.h |   90 ++
>>   4 files changed, 2219 insertions(+)
>>   create mode 100644 hw/net/can/xlnx-versal-canfd.c
>>   create mode 100644 include/hw/net/xlnx-versal-canfd.h
>>
>
>> @@ -0,0 +1,2121 @@
>> +/*
>> + * QEMU model of the Xilinx Versal CANFD device.
>> + *
>> + * This implementation is based on the following datasheet:
>> + *https://docs.xilinx.com/v/u/2.0-English/pg223-canfd
>> + *
>> + * Copyright (c) 2022 AMD Inc.
>> + *
>> + * Written-by: Vikram Garhwal<vikram.garhwal@amd.com>
> Missing space before '<'.
>
>> +static void canfd_config_reset(XlnxVersalCANFDState *s)
>> +{
>> +
>> +    unsigned int i;
>> +
>> +    /* Reset all the configuration register. */
> "registers"
>
>> +    for (i = 0; i < R_RX_FIFO_WATERMARK_REGISTER; ++i) {
>> +        register_reset(&s->reg_info[i]);
>> +    }
>> +
>> +    canfd_update_irq(s);
>> +}
>> +static void store_rx_sequential(XlnxVersalCANFDState *s,
>> +                                const qemu_can_frame *frame,
>> +                                uint32_t fill_level, uint32_t read_index,
>> +                                uint32_t store_location, uint8_t rx_fifo,
>> +                                bool rx_fifo_id, uint8_t filter_index)
>> +{
>> +    int i;
>> +    bool is_canfd_frame;
>> +    uint8_t dlc = frame->can_dlc;
>> +    uint32_t dlc_reg_val = 0;
>> +    uint32_t data_reg_val = 0;
>> +
>> +    /* Getting RX0/1 fill level */
>> +    if ((fill_level) > rx_fifo - 1) {
>> +        g_autofree char *path = object_get_canonical_path(OBJECT(s));
>> +
>> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: RX%d Buffer is full. Discarding the"
>> +                      " message\n", path, rx_fifo_id);
>> +
>> +        /* Set the corresponding RF buffer overflow interrupt. */
>> +        if (rx_fifo_id == 0) {
>> +            ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, RXFOFLW, 1);
>> +        } else {
>> +            ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, RXFOFLW_1, 1);
>> +        }
>> +    } else {
>> +        uint16_t rx_timestamp = CANFD_TIMER_MAX -
>> +                                    ptimer_get_count(s->canfd_timer);
>> +
>> +        if (rx_timestamp == 0xFFFF) {
>> +            ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, TSCNT_OFLW, 1);
>> +        } else {
>> +            ARRAY_FIELD_DP32(s->regs, TIMESTAMP_REGISTER, TIMESTAMP_CNT,
>> +                             rx_timestamp);
>> +        }
>> +
>> +        if (rx_fifo_id == 0) {
>> +            ARRAY_FIELD_DP32(s->regs, RX_FIFO_STATUS_REGISTER, FL,
>> +                             fill_level + 1);
>> +            assert(store_location <=
>> +                              R_RB_ID_REGISTER + (s->cfg.rx0_fifo *
>> +                                                  NUM_REGS_PER_MSG_SPACE));
>> +        } else {
>> +            ARRAY_FIELD_DP32(s->regs, RX_FIFO_STATUS_REGISTER, FL_1,
>> +                             fill_level + 1);
>> +            assert(store_location <=
>> +                              R_RB_ID_REGISTER_1 + (s->cfg.rx1_fifo *
>> +                                                    NUM_REGS_PER_MSG_SPACE));
>> +        }
>> +
>> +        s->regs[store_location] = frame->can_id;
>> +
>> +        if (frame->flags == QEMU_CAN_FRMF_TYPE_FD) {
>> +            is_canfd_frame = true;
>> +
>> +            for (i = 0; i < ARRAY_SIZE(canfd_dlc_array); i++) {
>> +                if (canfd_dlc_array[i] == frame->can_dlc) {
>> +                    dlc = 8 + i;
>> +                }
>> +
>> +            dlc_reg_val = FIELD_DP32(0, RB_DLC_REGISTER, DLC, dlc);
>> +            }
>> +        } else {
>> +            is_canfd_frame = false;
>> +            if (frame->can_dlc > 8) {
>> +                dlc = 8;
>> +            }
>> +
>> +            dlc_reg_val = FIELD_DP32(0, RB_DLC_REGISTER, DLC, frame->can_dlc);
>> +        }
>> +
>> +        dlc_reg_val |= FIELD_DP32(0, RB_DLC_REGISTER, FDF, is_canfd_frame);
>> +        dlc_reg_val |= FIELD_DP32(0, RB_DLC_REGISTER, TIMESTAMP, rx_timestamp);
>> +        dlc_reg_val |= FIELD_DP32(0, RB_DLC_REGISTER, MATCHED_FILTER_INDEX,
>> +                                  filter_index);
>> +        s->regs[store_location + 1] = dlc_reg_val;
>> +
>> +        for (i = 0; i <= dlc; i++) {
>> +            data_reg_val = FIELD_DP32(0, RB_DW0_REGISTER, DATA_BYTES3,
>> +                                      frame->data[4 * i]);
>> +            data_reg_val |= FIELD_DP32(0, RB_DW0_REGISTER, DATA_BYTES2,
>> +                                       frame->data[4 * i + 1]);
>> +            data_reg_val |= FIELD_DP32(0, RB_DW0_REGISTER, DATA_BYTES1,
>> +                                       frame->data[4 * i + 2]);
>> +            data_reg_val |= FIELD_DP32(0, RB_DW0_REGISTER, DATA_BYTES0,
>> +                                       frame->data[4 * i + 3]);
>> +            s->regs[store_location + i + 2] = data_reg_val;
>> +        }
> This loop will read more than dlc bytes of data out of the frame
> if dlc happens not to be a multiple of 4.
Will change this in v4.
>> +        /* set the interrupt as RXOK. */
>> +        ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, RXOK, 1);
>> +    }
>> +}
>> +static gint g_cmp_ids(gconstpointer data1, gconstpointer data2)
>> +{
>> +    tx_ready_reg_info *tx_reg_1 = (tx_ready_reg_info *) data1;
>> +    tx_ready_reg_info *tx_reg_2 = (tx_ready_reg_info *) data2;
>> +
>> +    return tx_reg_1->can_id - tx_reg_2->can_id;
>> +}
>> +
>> +static void free_list(GSList *list)
>> +{
>> +    GSList *iterator = NULL;
>> +
>> +    for (iterator = list; iterator != NULL; iterator = iterator->next) {
>> +        g_free((tx_ready_reg_info *)iterator->data);
>> +    }
>> +
>> +    g_slist_free(list);
>> +
>> +    return;
>> +}
>> +
>> +static GSList *prepare_tx_data(XlnxVersalCANFDState *s)
>> +{
>> +    uint8_t i = 0;
>> +    GSList *list = NULL;
>> +    uint32_t reg_num = 0;
>> +    uint32_t reg_ready = s->regs[R_TX_BUFFER_READY_REQUEST_REGISTER];
>> +
>> +    /* First find the messages which are ready for transaction. */
>> +    for (i = 0; i < s->cfg.tx_fifo; i++) {
>> +        if (reg_ready) {
>> +            reg_num = R_TB_ID_REGISTER + (NUM_REGS_PER_MSG_SPACE * i);
>> +            tx_ready_reg_info *temp = g_new(tx_ready_reg_info, 1);
>> +            if (temp == NULL) {
> g_new always succeeds, so you never need to check its return value.
>
>> +                qemu_log_mask(LOG_GUEST_ERROR, "%s: Couldn't allocate memory\n",
>> +                               __func__);
>> +                free_list(list);
>> +                return NULL;
>> +            }
>> +
>> +            temp->can_id = s->regs[reg_num];
>> +            temp->reg_num = reg_num;
>> +            list = g_slist_append(list, temp);
> The glib documentation points out that g_slist_append() has to traverse
> the whole list in order to put an element on the end, which makes
> this algorithm accidentally quadratic. If you need to use append,
> use a different data structure than a singly linked list.
> Since we're sorting the list anyway, you could use g_slist_prepend()
> instead, which is fast because it doesn't need to walk the list.
I changed it to g_slist_prepend().
> Overall, though, looking at what we do here (create the list of
> tx_ready_reg_info structs, sort it, walk through it processing them,
> free the list) I think this would be better done with a GArray.
> That provides all the operations we need here, and it will make
> much better use of memory because it just allocates (and re-allocates
> as necessary) one block of memory for the array, rather than two
> separate allocations for each list element and pointer-walking.

IIUC, array won't work here. Apart from sorting can_id, we also needs to 
retain the corresponding reg_num(offset) of the can_id in order to get 
the rest of the data i.e. dlc_regs and tx_data _register for the 
transmission packet. If we know the reg_num, it's less complex to get 
dlc_register and tx_data_register info as dlc_register is next register 
after id and next 16 regs after dlc_register are tx_data_register.

If we skip this, then we have search for each ID again in 64 TX FIFO to 
find the relevant dlc_register and TX Data regs.

>> +        }
>> +
>> +        list = g_slist_sort(list, g_cmp_ids);
>> +        reg_ready >>= 1;
>> +        s->regs[R_TX_BUFFER_READY_REQUEST_REGISTER] &= ~(1 << i);
>> +        s->regs[R_TX_BUFFER_CANCEL_REQUEST_REGISTER] &= ~(1 << i);
>> +    }
>> +
>> +    return list;
>> +}
>> +
>> +static void transfer_data(XlnxVersalCANFDState *s)
>> +{
>> +    bool canfd_tx = tx_ready_check(s);
>> +    GSList *list, *iterator = NULL;
>> +
>> +    if (canfd_tx) {
>> +        qemu_can_frame frame;
>> +
>> +        list = prepare_tx_data(s);
>> +        if (list == NULL) {
>> +            return;
>> +        }
>> +
>> +        for (iterator = list; iterator != NULL; iterator = iterator->next) {
>> +            regs2frame(s, &frame,
>> +                       ((tx_ready_reg_info *)iterator->data)->reg_num);
>> +
>> +            if (ARRAY_FIELD_EX32(s->regs, STATUS_REGISTER, LBACK)) {
>> +                update_rx_sequential(s, &frame);
>> +                tx_fifo_stamp(s,
>> +                              ((tx_ready_reg_info *)iterator->data)->reg_num);
>> +
>> +                ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, RXOK, 1);
>> +            } else {
>> +                g_autofree char *path = object_get_canonical_path(OBJECT(s));
>> +
>> +                trace_xlnx_canfd_tx_data(path, frame.can_id, frame.can_dlc,
>> +                                         frame.flags);
>> +                can_bus_client_send(&s->bus_client, &frame, 1);
>> +                tx_fifo_stamp(s,
>> +                              ((tx_ready_reg_info *)iterator->data)->reg_num);
>> +
>> +                ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, TXRRS, 1);
>> +
>> +                if (ARRAY_FIELD_EX32(s->regs, STATUS_REGISTER, SLEEP)) {
>> +                    canfd_exit_sleep_mode(s);
>> +                }
>> +            }
>> +        }
>> +
>> +        s->tx_busy_bit = 0;
>> +
>> +        ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, TXOK, 1);
>> +        free_list(list);
>> +    } else {
>> +          g_autofree char *path = object_get_canonical_path(OBJECT(s));
>> +
>> +          qemu_log_mask(LOG_GUEST_ERROR, "%s: Controller not enabled for"
>> +                        " data transfer\n", path);
>> +    }
> This sort of code reads more easily if you structure it as
>    if (early-exit-condition) {
>        error handling;
>        return;
>    }
>    big lump of code that does the work;
>
> rather than
>    if (!early-exit-condition) {
>        big lump of code that does the work;
>    } else {
>        error handling;
>    }
Will change this in v4.
>> +
>> +    canfd_update_irq(s);
>> +}
>> +static ssize_t canfd_xilinx_receive(CanBusClientState *client,
>> +                                    const qemu_can_frame *buf,
>> +                                    size_t buf_size)
>> +{
>> +    XlnxVersalCANFDState *s = container_of(client, XlnxVersalCANFDState,
>> +                                           bus_client);
>> +    const qemu_can_frame *frame = buf;
>> +
>> +    /* Update the status register that we are receiving message. */
>> +    ARRAY_FIELD_DP32(s->regs, STATUS_REGISTER, BBSY, 1);
>> +
>> +    if (buf_size <= 0) {
>> +        g_autofree char *path = object_get_canonical_path(OBJECT(s));
>> +
>> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: Error in the data received.\n",
>> +                      path);
> This isn't a guest error; this function is called by other parts of
> QEMU. Also, buf_size is an unsigned type, so it can never be less
> than zero. Either the CanBusClientInfo::can_receive API says that you
> might be passed zero, in which case you have to handle it; or else
> it doesn't, in which case it would be an error in the caller, and
> you can assert if you like.
Done
>> +        return 0;
>> +    }
>> +
>> +    if (ARRAY_FIELD_EX32(s->regs, STATUS_REGISTER, LBACK)) {
>> +        /*
>> +         * XlnxVersalCANFDState will not participate in normal bus communication
>> +         * and does not receive any messages transmitted by other CAN nodes.
>> +         */
>> +        g_autofree char *path = object_get_canonical_path(OBJECT(s));
>> +
>> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: Controller  is in loopback mode."
>> +                      " It will not receive data.\n", path);
> This doesn't seem like an error ?
>> +    } else if (ARRAY_FIELD_EX32(s->regs, STATUS_REGISTER, SNOOP)) {
>> +        /* Snoop Mode: Just keep the data. no response back. */
>> +        update_rx_sequential(s, frame);
>> +    } else {
>> +        if ((ARRAY_FIELD_EX32(s->regs, STATUS_REGISTER, SLEEP))) {
>> +            /*
>> +             * XlnxVersalCANFDState is in sleep mode. Any data on bus will bring
>> +             * it to the wake up state.
>> +             */
>> +            canfd_exit_sleep_mode(s);
>> +        }
>> +
>> +        update_rx_sequential(s, frame);
>> +    }
>> +
>> +    /* Message processing done. Update the status back to !busy */
>> +    ARRAY_FIELD_DP32(s->regs, STATUS_REGISTER, BBSY, 0);
>> +    return 1;
>> +}
>> +
>> +static CanBusClientInfo canfd_xilinx_bus_client_info = {
>> +    .can_receive = can_xilinx_canfd_receive,
>> +    .receive = canfd_xilinx_receive,
>> +};
>> +
>> +static int xlnx_canfd_connect_to_bus(XlnxVersalCANFDState *s,
>> +                                     CanBusState *bus)
>> +{
>> +    s->bus_client.info = &canfd_xilinx_bus_client_info;
>> +
>> +    if (can_bus_insert_client(bus, &s->bus_client) < 0) {
>> +        return -1;
>> +    }
>> +    return 0;
> We call this only once and that callsite only cares about
> "< 0 means error", so you could make this simply
>
>      return can_bus_insert_client(bus, &s->bus_client);
>
>
>> +}
>> +
>> +#define NUM_REG_PER_AF      ARRAY_SIZE(canfd_af_regs)
>> +#define NUM_AF              32
>> +#define NUM_REG_PER_TXE     ARRAY_SIZE(canfd_txe_regs)
>> +#define NUM_TXE             32
>> +
>> +static int canfd_populate_regarray(XlnxVersalCANFDState *s,
>> +                                  RegisterInfoArray *r_array, int pos,
>> +                                  const RegisterAccessInfo *rae,
>> +                                  int num_rae)
>> +{
>> +    int i;
>> +
>> +    for (i = 0; i < num_rae; i++) {
>> +        int index = rae[i].addr / 4;
>> +        RegisterInfo *r = &s->reg_info[index];
>> +
>> +        object_initialize((void *)r, sizeof(*r), TYPE_REGISTER);
> You don't need to cast r to void*, because object_initialize()
> already takes a void* and that cast is implicit. But calling
> object_initialize() directly looks weird -- almost no other
> device needs to do that, and nobody else is creating TYPE_REGISTER
> objects directly. What's going on here ?
In generic device case, we have all the register are defined with 
REG32() but in canfd there are 128 TX regions(each contains 18(Id + dlc 
+ 16 data_regs) numbers of 32 bit regs and then there are 64 RX regs 
regions too. Given that these register are exactly same(bit fields and 
length) except their name. So, here and below two functions, I am 
creating these regs here in a loop and populating the regarray. Else it 
will add lot of thousands lines of code where we just define registers 
via REG32() and all the registers are same as others.
>> +
>> +        *r = (RegisterInfo) {
>> +            .data = &s->regs[index],
>> +            .data_size = sizeof(uint32_t),
>> +            .access = &rae[i],
>> +            .opaque = OBJECT(s),
>> +        };
>> +
>> +        r_array->r[i + pos] = r;
>> +    }
>> +    return i + pos;
>> +}
>> +
>> +static void canfd_create_rai(RegisterAccessInfo *rai_array,
>> +                                const RegisterAccessInfo *canfd_regs,
>> +                                int template_rai_array_sz,
>> +                                int num_template_to_copy)
>> +{
>> +    int i;
>> +    int reg_num;
>> +
>> +    for (reg_num = 0; reg_num < num_template_to_copy; reg_num++) {
>> +        int pos = reg_num * template_rai_array_sz;
>> +
>> +        memcpy(rai_array + pos, canfd_regs,
>> +               template_rai_array_sz * sizeof(RegisterAccessInfo));
>> +
>> +        for (i = 0; i < template_rai_array_sz; i++) {
>> +            const char *name = canfd_regs[i].name;
>> +            uint64_t addr = canfd_regs[i].addr;
>> +            rai_array[i + pos].name = g_strdup_printf("%s%d", name, reg_num);
>> +            rai_array[i + pos].addr = addr + pos * 4;
>> +        }
>> +    }
>> +}
>> +
>> +static void canfd_finalize(Object *obj)
>> +{
>> +    XlnxVersalCANFDState *s = XILINX_CANFD(obj);
>> +    g_free(s->tx_regs);
>> +    g_free(s->rx0_regs);
>> +    g_free(s->af_regs);
>> +    g_free(s->txe_regs);
>> +    g_free(s->rx1_regs);
> instance_finalize is the opposite of instance_init, so you only
> need to clean up things you allocated there (which in this device
> is nothing, because memory regions are refcounted). All these
> arrays are only allocated in realize. (The opposite of realize
> is unrealize, but we don't need to try to implement it for
> this device, because this device will be created once and
> exist for the lifetime of the simulation; unrealize only really
> matters for hot-unpluggable devices.)
Will re-check and change it.
>
>> +}
>> +static void canfd_realize(DeviceState *dev, Error **errp)
>> +{
>> +    XlnxVersalCANFDState *s = XILINX_CANFD(dev);
>> +    RegisterInfoArray *reg_array;
>> +
>> +    reg_array = canfd_create_regarray(s);
>> +    memory_region_add_subregion(&s->iomem, 0x00, &reg_array->mem);
>> +    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->iomem);
>> +    sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq_canfd_int);
>> +
>> +    if (s->canfdbus) {
>> +        if (xlnx_canfd_connect_to_bus(s, s->canfdbus) < 0) {
>> +            g_autofree char *path = object_get_canonical_path(OBJECT(s));
>> +
>> +            error_setg(errp, "%s: xlnx_canfd_connect_to_bus failed", path);
>> +            return;
>> +        }
>> +
>> +    } else {
>> +        /* If no bus is set. */
>> +        g_autofree char *path = object_get_canonical_path(OBJECT(s));
>> +
>> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: canfdbus property not set\n", path);
> This can't be a guest error, because it's the board/SoC that's
> responsible for wiring up the device properties. Either
>   * not setting the bus is an OK config, in which case we should
>     just accept it and create the device
>   * or it's an error not to set the property, in which case we
>     should return an error and not realize the device
>
>> +    }
>> +
>> +    /* Allocate a new timer. */
>> +    s->canfd_timer = ptimer_init(xlnx_versal_canfd_ptimer_cb, s,
>> +                                 PTIMER_POLICY_WRAP_AFTER_ONE_PERIOD |
>> +                                 PTIMER_POLICY_TRIGGER_ONLY_ON_DECREMENT |
>> +                                 PTIMER_POLICY_NO_IMMEDIATE_RELOAD);
>> +
>> +    ptimer_transaction_begin(s->canfd_timer);
>> +
>> +    ptimer_set_freq(s->canfd_timer, s->cfg.ext_clk_freq);
>> +    ptimer_set_limit(s->canfd_timer, CANFD_TIMER_MAX, 1);
>> +    ptimer_run(s->canfd_timer, 0);
>> +    ptimer_transaction_commit(s->canfd_timer);
>> +}
>> +
>> +    SysBusDevice            parent_obj;
>> +    MemoryRegion            iomem;
>> +
>> +    qemu_irq                irq_canfd_int;
>> +    qemu_irq                irq_addr_err;
>> +
>> +    RegisterInfo            reg_info[XLNX_VERSAL_CANFD_R_MAX];
>> +    RegisterAccessInfo      *tx_regs;
>> +    RegisterAccessInfo      *rx0_regs;
>> +    RegisterAccessInfo      *rx1_regs;
>> +    RegisterAccessInfo      *af_regs;
>> +    RegisterAccessInfo      *txe_regs;
>> +    RegisterAccessInfo      *rx_mailbox_regs;
>> +    RegisterAccessInfo      *af_mask_regs_mailbox;
>> +
>> +    uint32_t                regs[XLNX_VERSAL_CANFD_R_MAX];
>> +    uint8_t                 tx_busy_bit;
> tx_busy_bit is only touched once, to clear it; it
> is never set. Is there some missing code, or can it
> simply be deleted? (If there's real state here, it needs
> to go in the vmstate.)
This was added for a new feature. But given that it's not done yet. I am 
removing the def here.
>> +    uint8_t                 modes;
> This field seems to never be used.
>
>> +    ptimer_state            *canfd_timer;
>> +
>> +    CanBusClientState       bus_client;
>> +    CanBusState             *canfdbus;
>> +
>> +    struct {
>> +        uint8_t             ctrl_idx;
> ctrl_idx seems to be unused.
>
>> +        uint8_t             rx0_fifo;
>> +        uint8_t             rx1_fifo;
>> +        uint8_t             tx_fifo;
>> +        bool                enable_rx_fifo1;
>> +        uint32_t            ext_clk_freq;
> Ideally this would use a Clock, rather than an integer property.
> But updating the SoC model to use Clocks is probably best
> done as a separate patchset.
>
>> +   } cfg;
>> +
>> +} XlnxVersalCANFDState;
>> +
>> +typedef struct tx_ready_reg_info {
>> +    uint32_t can_id;
>> +    uint32_t reg_num;
>> +} tx_ready_reg_info;
>> +
>> +#endif
>> --
> thanks
> -- PMM

Rest of  the comments looks good to me. I will make changes in v4.
Thanks,
Vikram

