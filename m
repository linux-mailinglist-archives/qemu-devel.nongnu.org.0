Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A1465116A
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 18:56:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7KMk-0006pF-BX; Mon, 19 Dec 2022 12:55:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gregory.price@memverge.com>)
 id 1p7KMh-0006p0-S2
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 12:55:51 -0500
Received: from mail-bn8nam12on2046.outbound.protection.outlook.com
 ([40.107.237.46] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gregory.price@memverge.com>)
 id 1p7KMf-0002DQ-Q7
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 12:55:51 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TBoB5lwVoZLIyIAXEInvK/TjalbKMMm34xYpNNc+jh1a8sRqE39SlCshhYbHCQJ1zVGW3UNLZCGoRBke2Db7DKmLzQQ7KbxJjZ0HLl1DVP/zfXFQJauUWnEHcibnvZf39fBsF4clVMaCGf2XXajG7gS2I8GD1TwtJSJNfpLQRMXooL626vXtA+UNWIbx99Kqi5GLQ3UboOILXUCpJWOZb/AE9FPzum1RH8yZWlH3FlWF3s/zwHTVPJ1EvDIKJR9bTS3qatXSe6WW6xUPo9XDHSY/wilkY9fnLJFFZXCSZ2Jr/Bwlz/KVOdZfU8R4k6Xl4WbIU3miw87XZPyZmUf1/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ydvMM7ue9jj1FPbyDoIu88XHQsLSu9iE8hO+Rpqb/AM=;
 b=VfmdVhFT/FbFEKOOefwlB8VsrmYRSLJg6JW2dRSq1OC9LKhRP/TfrRmeoBigKuqCpPMxHJnYMkgW9bn69ApQntfrR/nctHMaFbLdhRkFRTjnYKxMQFcXNAUOXXp7+tjGsSYwY1CIKILVEjpjHxhLw0qOYJ2GaQU9//Ibyr2XxQNrEg4yh40IyOfrC/sfAbU1sdhdsxpeFMgiTPnS/adezhqBmTsOaXIaUR/ODkYX15ZurTA0VdHI4ynn5LqZE/jO74wLKT0EB3e6RfHuHzjDP2q2kIe8hNCJdmyX6SqinhiDl+ze0PINwbuWf/KE9YvRV+ArxLayxvU6xOGVxdZVrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=memverge.com; dmarc=pass action=none header.from=memverge.com;
 dkim=pass header.d=memverge.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=memverge.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ydvMM7ue9jj1FPbyDoIu88XHQsLSu9iE8hO+Rpqb/AM=;
 b=A7dlpyFUSA0VcApY26RCXJNcN3+y9ekXx/GjkfukkjF8fxTKIxl1at97rPMjAMq2LYQp/hkvOAS+/qFE7fd1YHHyUlAP1U9bXRJYBHUyE5nEYu7dezdHJtj+el9Z7OtGCnuxRx2xECDpL70GoeOmguFuhvGBxsi0jINHK9RN2dI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=memverge.com;
Received: from BN6PR17MB3121.namprd17.prod.outlook.com (2603:10b6:405:7c::19)
 by MW4PR17MB4778.namprd17.prod.outlook.com (2603:10b6:303:10b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Mon, 19 Dec
 2022 17:55:47 +0000
Received: from BN6PR17MB3121.namprd17.prod.outlook.com
 ([fe80::3299:1f35:894f:69df]) by BN6PR17MB3121.namprd17.prod.outlook.com
 ([fe80::3299:1f35:894f:69df%6]) with mapi id 15.20.5924.016; Mon, 19 Dec 2022
 17:55:46 +0000
Date: Mon, 19 Dec 2022 12:55:44 -0500
From: Gregory Price <gregory.price@memverge.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Gregory Price <gourry.memverge@gmail.com>, qemu-devel@nongnu.org,
 linux-cxl@vger.kernel.org, alison.schofield@intel.com,
 dave@stgolabs.net, a.manzanares@samsung.com, bwidawsk@kernel.org,
 hchkuo@avery-design.com.tw, cbrowy@avery-design.com, ira.weiny@intel.com
Subject: Re: [RFC v4 3/3] hw/cxl: Multi-Region CXL Type-3 Devices (Volatile
 and Persistent)
Message-ID: <Y6CloIiuruB/h7qp@memverge.com>
References: <20221128150157.97724-1-gregory.price@memverge.com>
 <20221128150157.97724-4-gregory.price@memverge.com>
 <20221219124211.000032b7@Huawei.com>
 <Y6CNcuIzUVmKL0SM@memverge.com>
 <20221219172502.00001338@Huawei.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221219172502.00001338@Huawei.com>
X-ClientProxiedBy: BL0PR02CA0061.namprd02.prod.outlook.com
 (2603:10b6:207:3d::38) To BN6PR17MB3121.namprd17.prod.outlook.com
 (2603:10b6:405:7c::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN6PR17MB3121:EE_|MW4PR17MB4778:EE_
X-MS-Office365-Filtering-Correlation-Id: f5ee2101-5dbe-41e1-bae6-08dae1ea41a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +5KAhbXRCZvbxPGyOvzfiUJSFJdT9P4ML9sYl5CC6v8yXlwlAirigdoyTDhZ25g86JUqe7rQfNDSEx77NO3oC7+0jIhZOtcG6FziULBg2ueEUByS7yGwEusZ25qW0GXqCgzY7+2kNJvUV/m5uJJyEsuA8caLYeIyiRO6CmiUFCpmPf/bYt8L1htzYySusYIkKKiUdP+jfX4vM5b8sueaCV2N0pRTcjTpTEqHCPQ59rJ0CjdgA/bClnjOIe5KH2HhubOuOIvpxnTnLk3HnGqTuuwnt8oytWdt8Bud8K8JOijroIesyIrOrjGMsrYZq1AM/NhEyxx+8I9ytLi16bReSMG/vLWnfR6U+a24s/aOBFZnHWOnr/j3FfuPAwwZyLnqpHxnQdxKHrG4O+POXTY6HT/ES1HL/xZEtCFnehdSK11wpMgTN3We/EO1qD4w0ABp7oh/7dhHX+rq5GPDo9EJixWe3cMILuwFb174yJz+wkdVtgM4czWuQgY2rvEHSJMIwTs44llBUBFC6uI7ZVAIDGZnAfvrD6d6yilixIOZQfzASwzKt/cT3Lz6/isfmiuW+rjyzqdGU110DXXYjvpXtMxySImZ7aJTlxRyPFWY6lGKaOQcYQuathzbUXrPEprzjdL4a2+XsyGeaKD5JxfvzHnPylcGeZ/sb+kD6DI7yKhSmkEKNZGyLOeZp0qF7kPI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR17MB3121.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39840400004)(366004)(376002)(396003)(346002)(136003)(451199015)(2906002)(86362001)(478600001)(186003)(26005)(66946007)(66476007)(4326008)(41300700001)(8676002)(2616005)(966005)(6916009)(316002)(6506007)(83380400001)(38100700002)(7416002)(8936002)(5660300002)(6486002)(44832011)(66556008)(6512007)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FXGK3LLLP4anFACnbT7Mkk4PMfehZw0AV+esPOF0TatEb3IQOhSxvEA9oRDM?=
 =?us-ascii?Q?wfCI66oFJUxhGCEsEhsgBEn7Lbv+aXLgxiIk1g1XeKTwG0yf2O4jvPwoBFMy?=
 =?us-ascii?Q?SMNXKB18fIJd5VHFGPgSA1W+Xe/GHwDaUyqJJRP58BLyFpTD4k+5IkjRoAaI?=
 =?us-ascii?Q?tyH/5GMqmLxHh10cXCo7lxo5wvc8QOkwSPIHMrsIjvlRYnF9XSrB2hUnVy04?=
 =?us-ascii?Q?wUt77gQQbtCOfxzzbpTb8kVnRN3smJA5TgyvaVou1oxscMe4Esxe4qSFvrI+?=
 =?us-ascii?Q?aPapCjklq7u8CLXketAR3P8xiVFd+hxdHVWUFHQFesq4CqfmQlPGSlXho1tV?=
 =?us-ascii?Q?EhaZsGAcx2LL+GsYiZrL+KBaCz2SXKt5VM2IbwNVdJ5Lc6mIoNwStX243dBA?=
 =?us-ascii?Q?qcjkgzmicia9afho3GkdY1LczRdQSRAvgAo732DxQ7eTG3d/NViUHcM4ZzOy?=
 =?us-ascii?Q?HsRupoeK/jyVQmWjRBAzf0LYDNx19EdzzieChMshkP3si3QHWgb1KWjb99Up?=
 =?us-ascii?Q?IEX7ZwfEM9bZObrQI1N03BnnHdMJaGlTbeLmfq981ziWdmYIjOfjtLYhYiw/?=
 =?us-ascii?Q?dTb2yCDNfIHVE5bcxBLV51Ji3pb06rgta6xizenJJ6lbOrOnjnUQCjvMv2xj?=
 =?us-ascii?Q?TTl2jyt1QQfGEaLL6mfr8IRMhdAyV33MC8Fg8GXmu1EZ5IPNjnEZSc8IlfJq?=
 =?us-ascii?Q?PPn2J7GIsVeNEc9TlFwirXTq7tWev+GLql39Vl3nohxoQCiIBJa7V+Kwf0Ch?=
 =?us-ascii?Q?qQ0OYKZ89l2B8qX9ru0ILwT+Fy1Qri7Y8zJxw5v69lSw3/1W8sXtlDtwlSuW?=
 =?us-ascii?Q?ePpoqTQAuylspRShP1OSrDlp3d4Nu5YCKfstdJ5zYMB4JP2xBrFca/UGwltD?=
 =?us-ascii?Q?KwO0sEZ0C0jyXYNiaWcjaR39BL1lB6CZ0ygKYBkRS3iasZOwbTAGl5dcWwUb?=
 =?us-ascii?Q?yw7r2ulzRrC3MXXtQjbCwxVow2kLgWuESJ/iv/Yc0O5IhXgIqH/qrb1RJiZM?=
 =?us-ascii?Q?9ACWxdodrG5UGtEMTRyYRFbNyfaJToaz6Ah88FXQexXRPN6o/vxNraDRdKqX?=
 =?us-ascii?Q?acpNA46ivldfXqMAKagA/R6jMvlFacZKCu+178Ok6/W89OmIFo8vkGa8Y7C6?=
 =?us-ascii?Q?oaVafJSvozeJpGM3L76PGWYxoCi3vg75949qMaHvPVtaAAbtsQ80UFP39Ysc?=
 =?us-ascii?Q?Mdvl3nj6FChuMYnGOUHMAZ3SNI5oT/7eRGAOqKrDPF3XE57ZrlWJpDE4HVbd?=
 =?us-ascii?Q?1JLGD+uBXXiTlSrO2Lhk/StiSJAd05kSy9azAP4PjSKJQtn5lvZ/vYrWpbS+?=
 =?us-ascii?Q?xgsIBoeyy/hiKvzTeHSL+QbYkVzEuD6dT1bOSt0UMo4k9IH2vmJ7o1O4l0Gt?=
 =?us-ascii?Q?62ecsN21zeloFC/J+QbFvwCYPg/WO9jITueYa1A99YlBtp86dvwkCSOKXXLZ?=
 =?us-ascii?Q?b46Qy01D2f41/VwM3LZiYEJhnQ1u5HFKaNq/t1ssWfaQPRiMRLMZF/fuQhiS?=
 =?us-ascii?Q?zpyxpPobPzCkjXv/VDc0GyCwcKjW3FCyzpOMV556AkOLwSPHpIAU4GnYavrS?=
 =?us-ascii?Q?4deNWcSrWaQrgd5dJR7qDDUitr517SnaXwXoJMw0Qo7Na+DUWgrrr2AYsY2d?=
 =?us-ascii?Q?zQ=3D=3D?=
X-OriginatorOrg: memverge.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5ee2101-5dbe-41e1-bae6-08dae1ea41a8
X-MS-Exchange-CrossTenant-AuthSource: BN6PR17MB3121.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2022 17:55:46.7613 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5c90cb59-37e7-4c81-9c07-00473d5fb682
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FioReu0E+qHx5qQjL1DKA7fFuVvKbQ5xuS006D0n3CrRLlrk51FYu8abj0GnfetMG1Q6KOUYkJeqxdcaVqiJUY2hQkrkpuuYfpMplB4A21g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR17MB4778
Received-SPF: none client-ip=40.107.237.46;
 envelope-from=gregory.price@memverge.com;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FORGED_SPF_HELO=1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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

> I think an address space needs a memory region, not a memdev.
> Initialize a container region with memory_region_init()
> We could then add the two memdev associated regions (with different 
> attributes) as subregions using memory_region_add_subregion()
> 
> Similar is done for the system memory
> https://elixir.bootlin.com/qemu/latest/source/softmmu/physmem.c#L2675
> creates it.  Then it's mostly accessed by get_system_memory()
> 
> Memory is then added to that at particular base addresses via for example
> https://elixir.bootlin.com/qemu/latest/source/hw/arm/virt.c#L2210
> and similar.
> I think we can do the same here.
>

Ah, I'm just confused then, this seems reasonable

> Curious question on this lot. How are you testing it?  Some exciting scripts
> to bring the hdm decoders up etc for the volatile region? Or some prototype
> driver code?

Unfortunately I got pulled off this work for a bit to handle something
more pressing.  I have only tested that the existing functionality
(persistent mode) works as intended, and that at least the ndctl/cxl
tools report capacity as expected.

As of right now there is no code in the driver to actually touch these
regions in a way that works to be able to online these volatile regions
- at least so far as I know.

I don't remember where I left off, but some pmem-to-ram tutorials online
suggest you could online pmem regions like this

cxl create-region -d decoder0.0 -m mem0
echo offline > /sys/devices/system/memory/auto_online_blocks
ndctl create-namespace -f --mode devdax --continue
daxctl enable-device [device name]
daxctl reconfigure-device --mode=system-ram all

However I don't think this is successful in creating the dax devices,
and therefore the reconfiguring into ram.

