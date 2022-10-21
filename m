Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 296516082DA
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Oct 2022 02:28:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1om0dM-0007jW-5n; Fri, 21 Oct 2022 18:36:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vikram.garhwal@amd.com>)
 id 1om0d7-0007jF-OJ; Fri, 21 Oct 2022 18:36:45 -0400
Received: from mail-dm6nam11on2080.outbound.protection.outlook.com
 ([40.107.223.80] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vikram.garhwal@amd.com>)
 id 1om0d4-0006DY-L1; Fri, 21 Oct 2022 18:36:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FK6ay/oMBrYyp2ebE8paQpQpZnIs1n0O/GWHX1NvEig0ETho1HACkji6KiW1lenpmvJL8Jj1l/AsIRo4OSqZslhMFgR76qC9YW0gJBOBpeliylpx/1l7DeZZIZXUsxeElsijvPSfi7jO25UGj4bI01ihRVazr3Smwz6sxDFoBCLbj9CfFNNWcsyyJN3RHpDNcyNjme6GY8BxiJtWc+zqRFDSA5QcAVjOZTK6CUCFnUu/qF/0qFKWwIeRy6SRQLvlDFxcAeW0p82zQnzbUBB155FifB2Vt7wTOmqqWYRadFGyakqKv6dnGJPnqBFUjjHx1/8s9rBqdS7LYtbGQtTdmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rImdF1CF7QIE8aNF875NMdQNd8AMj6rMreXTT91hLUs=;
 b=d+teaQ5Y8uHMIE0J2bPMn+PLS6C/Ds8MeoYwz9XQHNLjx3ACYO8WYupEpDpUer5I7VXX/9YAzw7vdADbxFLrvBk/ystn4ShPO2XlEJOTX4kBaeUVAkGBYSC5i5Il9mvAptCTK6srZCvyU61ktrYyeaatwh/JQVOSfAmYEkW9aF+yTkJBpoQLsuLXxh32Ff7c1brpkzg6LcumzJixbXqA4oDfHd8eGWha1TJyyIKnx8PfOo1ymM6F5m4WeAX856OBMSvlqLwOM6xYadh+Ytd+N/SOFABzq22Rc0du66r9z2lS4WQ/6tFqLmA63Ox1p/WH+z3chbX/bbpuKl04351IMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rImdF1CF7QIE8aNF875NMdQNd8AMj6rMreXTT91hLUs=;
 b=yIm0LwSiT3Zm2dxZqHhPzz/xgw//7f7sTjg+2t1CSulbVyffdzTZi5KwCpnRy2DYRJwb9FScQd6sG1HeqcVLk7/CD7jMDMPpBetahNUqYRVLvIlT1UDHSNgqyLnkqV9SrkbhJZcpdDdpbrZDrInHbIDMhQeCnZJjt4zhVUeqUXM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4409.namprd12.prod.outlook.com (2603:10b6:303:2d::23)
 by IA1PR12MB6185.namprd12.prod.outlook.com (2603:10b6:208:3e7::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.35; Fri, 21 Oct
 2022 22:36:31 +0000
Received: from MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::45b:5f00:6991:c7e]) by MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::45b:5f00:6991:c7e%3]) with mapi id 15.20.5723.034; Fri, 21 Oct 2022
 22:36:31 +0000
Message-ID: <8fce71a6-0e0d-0e25-7c09-38bc3ccf6522@amd.com>
Date: Fri, 21 Oct 2022 15:36:28 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
Subject: Re: [QEMU][PATCH 2/5] hw/net/can: Introduce Xilinx Versal CANFD
 controller
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, edgar.iglesias@amd.com,
 francisco.iglesias@amd.com, Pavel Pisa <pisa@cmp.felk.cvut.cz>,
 Vikram Garhwal <fnu.vikram@xilinx.com>, Jason Wang <jasowang@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 "open list:Xilinx ZynqMP and..." <qemu-arm@nongnu.org>
References: <20220910061252.2614-1-vikram.garhwal@amd.com>
 <20220910061252.2614-2-vikram.garhwal@amd.com>
 <CAFEAcA9=O6yPo9RdFWgq6eJZ=7vX4bQFuaoV6y+JCoM-=+TSTg@mail.gmail.com>
Content-Language: en-US
From: Vikram Garhwal <vikram.garhwal@amd.com>
In-Reply-To: <CAFEAcA9=O6yPo9RdFWgq6eJZ=7vX4bQFuaoV6y+JCoM-=+TSTg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0351.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::26) To MW3PR12MB4409.namprd12.prod.outlook.com
 (2603:10b6:303:2d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4409:EE_|IA1PR12MB6185:EE_
X-MS-Office365-Filtering-Correlation-Id: 3758b55b-1431-4873-e688-08dab3b4b352
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XjqdifNAAKxAJMBZbGjTGHS3DthNNwGJESqfPuO5Qy7ZrHq4uWrzTE5EFFdtlTN1JIjPI4cu14PXi90KiXEHORpQnIVf/1/jrPO7FXDGIG5AeaV7LxOAn9QSl/jf5yjLo7GdiBKw4HiBzBMVzk+vFHvKyYsc4q630EoHdey9CyPHVhUmvaYRaDvYX6/CWc+d5tvCtrQq+zLXkY7YfkmLI2kDY7TZJk6c4pIJx6PbI5+2GPtkbmvojma+d/SjAqPVo1RSy7NVPhzPuLqPEtYtlVEvwJDab8Zgbj5NgH4FSAgwZIeYJEmtjzoqrnFfUcFtrbtRcMbb7iOwZfmD01H9YgUkoo/Hk3Gatr8QyjOmHwiHTS0UBf9tIFHJp7LhdKs4JoIvyP0vnLt+4lMk9W+GKwH2YUTxlaKtfHgt+TCH4Z4U21/+jm8kykSa3IEgzBFyvthMB3ftWQ6NFnVArjRNKXpo1roL4kP7lM80Dt+FaAq2yrpmPS9jWIlfRBnkS+9IAq+rcMFDv3ofYfbcgdz1jPhHEPxe+w8jvN9DPW2iWlFnInJPX5gA/Q7XqM/iOGL1Y3d0FeRKSkUYmdq6/gyE3xzg4wD3HizIOfBL9OZemn840TBdYNlGK/pT+GzKI1Dnik2F8uliPXchjYhgvXE3+0ze7/uN40KFnxgcABkn2UXgv6vYj6In8Ffo3ZGjeS8SaCHXeb/AcdLMtqvWllTHQdTlDIWeMU2uKCRtUj5m4RXHANXHTQ6U0rDwWilKmADUW3HMZDi3kOMp0OkcuCcLPmWHeoYUa2J5XcUGVJ419hvUAhySCQVUeLORzLtxiwwG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR12MB4409.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(376002)(396003)(136003)(346002)(366004)(451199015)(66476007)(8676002)(6666004)(66946007)(4326008)(66556008)(54906003)(316002)(53546011)(6506007)(38100700002)(6916009)(83380400001)(26005)(31696002)(8936002)(36756003)(41300700001)(5660300002)(6512007)(186003)(2616005)(6486002)(44832011)(966005)(31686004)(478600001)(2906002)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cTVvMEpZSWtpc01wbllyMmVrVlp2aDFwQ2lkbGVZV1JkMWJHYkdGam1RTThy?=
 =?utf-8?B?NjlqZkFINlBSRk9tU3pHWGJJNzZsMlVPcmxYVHBvNHcxWmVVeElaSTh4YS9J?=
 =?utf-8?B?bjJEeUx4Tmp1Mk5RV053RkJJZWNjbmpuSHdiR1RacEszSnNuUG1wU2VMOHJo?=
 =?utf-8?B?T2NCM3Q5TlZ0V3ZzSnBwUzl0UlJwcWg3dE51REE5L08xdlMvdzhzcjFuOEVZ?=
 =?utf-8?B?YmRSQ3NIT0ladEF5L29QTlpGVnRHNjlPb1Byd1JzN0FVRVFuR2E2Ky9qRnE3?=
 =?utf-8?B?K1NYeUE3NVhocGVaR1BDTWtSNDNrendtZ2x0UEhFcGpXcWMwcjNKRmRZeStI?=
 =?utf-8?B?QkJ5YmZ1aGU2ZXl2L2V5MUNTZFRDK2g1cVJGdkVueEpFdG1ZdjdVY3RaanR2?=
 =?utf-8?B?bDlqUGttS3NUM0tTNkhtT2hRUTR3ck8wRUhVcHlRZlY1Vkl6YzhyZklkMzJU?=
 =?utf-8?B?OGJFMDJTUG9CR3dDbXpVVU1heUxIbjhnNXhNdWkydkNuWDRXSGRwQWt2OHRx?=
 =?utf-8?B?YkNKZWltdHBFRWw4b2hHNk9NcXJMOXhpR053Sy8wdTZYOWVHSVBraTYzU2gv?=
 =?utf-8?B?WWc3d2hoR0N3clJwMlg4ZkFaaERwMS9YckhWQnNYWnJGNURvNUZWbGw5d3R3?=
 =?utf-8?B?TzZFOWtRdFdJTi9TZzJtWWxZcWhGVGZhRnhIdTEvSllBa24wMThvQWwrU29Q?=
 =?utf-8?B?Vk85bndteitBTDZ2K2FiQ1N0a2gwMEZrZ1ZqRElveUt2bmdKRTNUaWhlK3Aw?=
 =?utf-8?B?TldQalNxa1g1bE80RmYrSUREQlAwRDYwc21JVVRtMnFZRXZTMFFUSVZaVldl?=
 =?utf-8?B?UEVxMGlOK1lsUGNiQkdtSXJWUDVMUUZhditaSnlQaS81Q3I2OGNmMjBGcUox?=
 =?utf-8?B?NjdOeDZhWUZVenZlZXFwKzRUNTdyU3pNTkVRZm0vd3U2TlN1UEJJRjVmMDVl?=
 =?utf-8?B?c3hNUldmeXdZTTh6ZHBoejhWNWRhUHdpemFCckJnODBPZmtEY3BhelY4cGNP?=
 =?utf-8?B?cFBuSDg1Rnl2cTBqTkFvSjlaWXpoazg3Z0hzOCt5TW5BZFRKUGN1QitjM1F1?=
 =?utf-8?B?aHdMakszd2JkOXhmMVorWUZsWDY2UTBOa1lUbjF0TWM3NG1zRGhCN3djdUJp?=
 =?utf-8?B?elI3Zm4zTEw1cGVhUkZML1REYkEwZGRMZ0Fla0FyR0FtODBac1IzdFphWVNQ?=
 =?utf-8?B?aXlYTnFDcHkyYWVGQmhCRWs4NUJsYUg2ZG1kdUZGSkFFSGJBN1I4bWhuWE5t?=
 =?utf-8?B?QkxDc0pNcUt0OUJFOHdrbGE4OGVpZG5MTzUyUXdUQWpQV0N4azZ0TnUyRVZZ?=
 =?utf-8?B?RFdPWlRBRUFsTHJUeVJESERSVjU1MFM2RDhmY0tNUzdVQzRWd0VZQ3ZDcmJz?=
 =?utf-8?B?MDhUQm8yZDF3bTZUYU83V0hra09YcGswdlV6VHVBN3RicHowNHVIalF2dXk3?=
 =?utf-8?B?VFBVR3JOZ0RsekxoMVJTaExVN1YzMUZvMk5HQlZDZnloVHRzZkFjR2xZWEpK?=
 =?utf-8?B?dUdIRnQvZGJRbmpNTVRlSlEvUyt5cWhkZFlhNDZiSmltTWtJa2NkYkEvSmV1?=
 =?utf-8?B?U3NyemxxQXZ0T1IzNEZKVTlmVXduSkNXVDlFQ1JZalJvMlFKT1VrWmVsc0pF?=
 =?utf-8?B?dlFoMHVPS0czMUJIT1pGdUNMNXZWYVRCc000V2UxWDJIK1Y4N2thTmRtbDVn?=
 =?utf-8?B?MkhZQTQ1OEJSSlhhaGhBclMyU3NPNnB0V0ZWZzZhbmZMcDl5ajFpcG4yaGZX?=
 =?utf-8?B?aHhzU21jUU5NdEV1YkJCbzIxbkUvY3gwOUY5STlpTEpJcVBWWnJrZ3BMc045?=
 =?utf-8?B?UmV5dXl2dGtaQndoN0pwQ0djbUJGcVNxMDZML0I4MjNrWndhc2E1WFp5Y0dk?=
 =?utf-8?B?bnpybkliZ1NZTld5UlRra0FTOGR0VVJWQldQdzJRcFZXTk5CYWxoR3VveDdR?=
 =?utf-8?B?NEJndU4wSWVSUEp6S1A3SEtjaE1nUmszN0xpK1RKWk5LZm92MmIvUkFkZWdy?=
 =?utf-8?B?YTdaYjdSd1RiK3AxR2R0bmoybHJicXBPMjU1aHEwR2FyTWdKdG1JcWZObis1?=
 =?utf-8?B?NWFBM3ZBRWJwcWl1ZmNFK3pTZGlZMStvTzlwZEFoWlZKZDkyVnNrazZjc1Mw?=
 =?utf-8?Q?D9/F8PRcrB286lU/p6sKVS9hg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3758b55b-1431-4873-e688-08dab3b4b352
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4409.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2022 22:36:31.2585 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LrVt1q0d5iJyZUwpBcPFnjGdOOJ9EHWMpX+y4jvaisLr8PAaPvQbfGufvbdwOLgq2+jh7cLk28pbJ1polTHONQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6185
Received-SPF: permerror client-ip=40.107.223.80;
 envelope-from=vikram.garhwal@amd.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Peter,

On 9/22/22 7:46 AM, Peter Maydell wrote:
> On Sat, 10 Sept 2022 at 07:13, Vikram Garhwal <vikram.garhwal@amd.com> wrote:
>> The Xilinx Versal CANFD controller is developed based on SocketCAN, QEMU CAN bus
>> implementation. Bus connection and socketCAN connection for each CAN module
>> can be set through command lines.
>>
>> Example for using connecting CANFD0 and CANFD1 to same bus:
>>      -machine xlnx-versal-virt
>>      -object can-bus,id=canbus
>>      -machine canbus0=canbus
>>      -machine canbus1=canbus
>>
>> To create virtual CAN on the host machine, please check the QEMU CAN docs:
>> https://github.com/qemu/qemu/blob/master/docs/can.txt
> That link is a 404. You could just give the relative path to the
> docs in the repo, which is docs/system/devices/can.rst
>
> For the machine specifics, you should include (either in the patch 4
> where you add this to the xlnx-versal-virt board, or in a separate patch
> if it seems too big) updates to docs/system/arm/xlnx-versal-virt.rst
> which document the new functionality, including, if it's useful to users,
> some documentation of how to use it.

Sorry for delay in reply. I was waiting for other to review before 
sending v2. But it's been a few weeks so I will send v2 today EoD or 
tomorrow.

I will move the documentation part in xlnx-versal-virt.rst file.

>
>
>> +/* To avoid the build issues on Windows machines. */
>> +#undef ERROR
> What ?

The ERROR field of the INTERRUPT_STATUS_REGISTER colides with a macro in 
the Windows build enviorment. Build fails due to incorrect size of ERROR 
on Windows systems.

>
>> +static void canfd_config_mode(XlnxVersalCANFDState *s)
>> +{
>> +    register_reset(&s->reg_info[R_ERROR_COUNTER_REGISTER]);
>> +    register_reset(&s->reg_info[R_ERROR_STATUS_REGISTER]);
>> +    register_reset(&s->reg_info[R_STATUS_REGISTER]);
>> +
>> +    /* Put XlnxVersalCANFDState in configuration mode. */
>> +    ARRAY_FIELD_DP32(s->regs, STATUS_REGISTER, CONFIG, 1);
>> +    ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, WKUP, 0);
>> +    ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, SLP, 0);
>> +    ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, BSOFF, 0);
>> +    ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, ERROR, 0);
>> +    ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, RXFOFLW, 0);
>> +    ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, RXFOFLW_1, 0);
>> +    ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, RXOK, 0);
>> +    ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, TXOK, 0);
>> +    ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, ARBLST, 0);
>> +
>> +    /* Clear the time stamp. */
>> +    ptimer_transaction_begin(s->canfd_timer);
>> +    ptimer_set_count(s->canfd_timer, 0);
>> +    ptimer_transaction_commit(s->canfd_timer);
>> +
>> +    canfd_update_irq(s);
>> +}
>> +
> A lot of this looks like it's just copy-and-pasted code from
> the existing hw/net/can/xlnx-zynqmp-can.c. Is this just an
> updated/extra-features version of that device? Is there some
> way we can share the code rather than duplicating 2000-odd lines ?
No, both are very different controllers. Versal SoCs CANFD has lot more 
registers, RX/TX FIFOs compare to ZynqMP CAN device. Interrupt handling, 
overflow conditions are also different. I will recheck if can find some 
common function and can use for both with making the code more complex.
>
>> +#ifndef HW_CANFD_XILINX_H
>> +#define HW_CANFD_XILINX_H
>> +
>> +#include "hw/register.h"
>> +#include "hw/ptimer.h"
>> +#include "net/can_emu.h"
>> +#include "hw/qdev-clock.h"
>> +
>> +#define TYPE_XILINX_CANFD "xlnx.versal-canfd"
> Should this be a dot or a comma? The codebase has examples of
> both for xlnx devices :-(

You are right about dot or comma comment. We need to harmonize these 
across all Xilinx devices.
For Versal board, recently introduced machine has all dots, so I am 
following that.
Let me check with team here and perhaps we can send another series to 
address the dot/comma variations.

>
>> +
>> +#define XILINX_CANFD(obj) \
>> +     OBJECT_CHECK(XlnxVersalCANFDState, (obj), TYPE_XILINX_CANFD)
> Please use OBJECT_DECLARE_SIMPLE_TYPE() rather than defining the
> cast macro by hand.
>
>> +
>> +#define NUM_REGS_PER_MSG_SPACE 18
>> +#define MAX_NUM_RX             64
>> +#define CANFD_TIMER_MAX        0XFFFFUL
> Don't use capital X in the 0x hex prefix, please.
>
>> +#define CANFD_DEFAULT_CLOCK    (24 * 1000 * 1000)
>> +
>> +/* 0x4144/4 + 1 + (64 - 1) * 18 + 1. */
> This comment isn't very informative. The #define itself is much
> better because it uses symbolic constants.
>
> What is the magic number 0x4144. It should either be defined via
> some kind of symbolic constant, or if that's not possible at least
> explained in a comment.
Rest of the comments will be resolved in v2.
>> +#define XLNX_VERSAL_CANFD_R_MAX (0x4144 / 4  + \
>> +                    ((MAX_NUM_RX - 1) * NUM_REGS_PER_MSG_SPACE) + 1)
> thanks
> -- PMM

