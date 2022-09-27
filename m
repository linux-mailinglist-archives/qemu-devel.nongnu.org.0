Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A3A5ECF10
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 23:03:44 +0200 (CEST)
Received: from localhost ([::1]:35612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odHjr-0003D7-3j
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 17:03:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vikram.garhwal@amd.com>)
 id 1odEbw-0000Sn-LF
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 13:43:13 -0400
Received: from mail-dm3nam02on2061e.outbound.protection.outlook.com
 ([2a01:111:f400:7e83::61e]:3969
 helo=NAM02-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vikram.garhwal@amd.com>)
 id 1odEbq-0003T5-BV
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 13:43:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RTtNZNIjh3awxp+RsjVW60GuCWkNWN6pi3kMmZAHp36Y69ix8h+T26qKmXAXWFGnRTrmuDWSgdpVUFzq6zopIgMrAWHD4iZ+djITOqiH0kHwn3Iqly4yVvpTXJva1fj9+2c7MGFsAVrTcV+nJp9d5yI/O9bHIQLZL2JBVxWdhvVfphTlGOaZL/VWZoMrsY60/vGFZroGm27X5uIXF8u2jRymBzhUR7y/IjP9YzRNfb4CbLbNK1VGMhQitAk2wHTkTl6EugFJJnN4Ra2SOFDSxSBEZXnXdZqylOg2YAWIALB1ZFgXow1mEAldjM0N4S0/Tth0K10eVpgbGRs88fOJrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i63kC0G/DvB3AXoT/2j5yEab1TAkpReYGEGQNtwo/w0=;
 b=ZGOxG8opU6pyU6WU24u5cfxyafUPU4rOYby/1n9iaROMZ+SE4DS5qE8UfNgdz+Vi/pldJd6tR5+F8m604g3mNERoHkZr9leBtW/50zF9hJgzAMvruuLsk9D/12IGlQhziLr00RRdyaN12uZunGq+PkXv5hB9zzmTvkHfJa6+h/Tn40pCsmiy/P3g1MPlaj/qOt3KAzgyBAaP+abpfwcjxFkfKNvDiuaAcdLiuwQjq4AUPuAz37DJAeWZCT+VKrXWf92AS4L9nXt6PrXNZOohxH6G+tZdIEjumVU4LOc04uonk4S3nhOrnjQ8FY8TgRVdeeJKl1WnxZCQJJeM/Xemxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i63kC0G/DvB3AXoT/2j5yEab1TAkpReYGEGQNtwo/w0=;
 b=A1txewjEeFKPbGYfz97aOspU2Me0SS5VDDnAs27U6W2Z1LfPhacnvkYjodhWAHVfKbudoL2bv6UDKQNJQsSMMUEO+dxwIORpgm0CQN8/vm7UGwLqLCoYGxIZVCpuoh+C32itVBT+kdAUAndGFoiAJJ5TV1PAO/XSpyHN+G4XiBU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4409.namprd12.prod.outlook.com (2603:10b6:303:2d::23)
 by MN2PR12MB4470.namprd12.prod.outlook.com (2603:10b6:208:260::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26; Tue, 27 Sep
 2022 17:37:58 +0000
Received: from MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::e10a:b0fb:7adc:dbd1]) by MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::e10a:b0fb:7adc:dbd1%7]) with mapi id 15.20.5676.015; Tue, 27 Sep 2022
 17:37:58 +0000
Message-ID: <3b19176c-dc35-c772-ed94-a588ede8ed09@amd.com>
Date: Tue, 27 Sep 2022 10:37:55 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [QEMU][PATCH 0/5] Introduce Xilinx Versal CANFD
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, edgar.iglesias@amd.com, francisco.iglesias@amd.com
References: <20220910061209.2559-1-vikram.garhwal@amd.com>
 <CAFEAcA-KKNwCn0aJqZgXLM5XMH0WFYqC3i-Eyqomda=m2KfqCw@mail.gmail.com>
From: Vikram Garhwal <vikram.garhwal@amd.com>
In-Reply-To: <CAFEAcA-KKNwCn0aJqZgXLM5XMH0WFYqC3i-Eyqomda=m2KfqCw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR04CA0005.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::15) To MW3PR12MB4409.namprd12.prod.outlook.com
 (2603:10b6:303:2d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4409:EE_|MN2PR12MB4470:EE_
X-MS-Office365-Filtering-Correlation-Id: 217dc36f-89d2-4ddd-a567-08daa0af0450
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rl3+hEOUMJPhHylBd9tbSDBIZvPjUVaAQzIElzpjW+2i20eE28z/ZiNLeSwK9damyTNpYOGqXdVdW9j53fUsevZe57sS0jnHyXEMV+nc736vm3jRFQs1QBVpiUqq+3grUqDfIpueNkco4UZpXp/s+pNFg9UYwqZE+SS438oYMV73cM65xlJC5AO+eh7iYun0xZqn2eT+1Es5Ox7WQrVosgf3dZKbeSpKAlL/EcPMmlCEQwogQ5d8GEbEApS5UaoUo8TSOJ986KEnrDA60drLezhdZI1GaBsJQ9ZuXrWSbE3O/PcBkanoTpRwKd6cGkUSe7zmZkCUyRJ0HqHkCTA4B9sVh/AMdytt1cu+/KAj9jdbljNSTQt4nvauHqPqriOYSqyZrJhVDNTF8BP3mQSgHFuiJe36BxAlsi18aTSZQF0ZAUl/mX7chEqspF9X7iy3TsTuBoYpky5a3DS6/YposgLd71o5hR6bsr/zkhtNQyh2qeMFQn/zGzZRFQxw8LtJNY4G6fZgVhySeny68+oTd+LkuyzYk2+NhDN4o5oyVmHv6b9YyoUK8DkGbw2Z0tnF3uhrrtap05ov9pIjR/QVk0Ksi2ShLZYZqHUMlM1wFxfngXDt2S2L5baVIg748hoCY5umzamqJ3FXfJydaunCiTjBivlFtGkEkFvN031CGvghTBQhDmEYbnDZrjOlUSUhUjIPf41naj10QGW07lUu0ZIiC+jI7tMC63eCOPAWEBdxrdGk/wSQF6/xI7QbMVvp+B2vVO689BYTtoCbrSwiAyucAqJimOoYsmLXaHfl+EsXHG0dISKFakQamTVsv8tK3pK/uLhu7AGNKL2H4aydCmKyxzOvrf2SlvWo8NVFMjg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR12MB4409.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(346002)(366004)(396003)(39860400002)(451199015)(316002)(31686004)(6916009)(8676002)(478600001)(6486002)(966005)(66476007)(66556008)(66946007)(4326008)(5660300002)(6666004)(44832011)(38100700002)(53546011)(26005)(6512007)(2616005)(36756003)(2906002)(8936002)(6506007)(186003)(41300700001)(83380400001)(31696002)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MTJvdi9mM1FBQ203cjFjT0ZudXFDQ0QvUXJyVWpWZEY3bzV5c2Y3WmNFTmox?=
 =?utf-8?B?UWRNUWJQTmxRNklhdFVORlNPejJrSWsxL0NkS2ZFc0hhdktNVjhOZ09ZVDJz?=
 =?utf-8?B?aURzZnZCOC9mYTlkN3hkL3d2VlNnSm44K3dCVG5yV2xuRnJEZ1FyVDN3Vlov?=
 =?utf-8?B?Mml3bkE0SnlvNEpDZ2lUc1QvdWdxUVd3SEFXd1c5K1FOQWxhelNmdk9SRHN3?=
 =?utf-8?B?aTFqZFRnL3lxTzVvK3d0Z2kzWml0Z3daTmQ0eTdPZXZhdThmdC9JLzVSZFRz?=
 =?utf-8?B?bWpwdllHQXlmTk5NY21BYXViUEM3THNkSkZmTjdYV0Z2V1NweUNrN1RFL3N0?=
 =?utf-8?B?UGNha3ZDTVBYUllTV2dPRVFoY2Y2TzhHS21JbXhoWEZCemRySnE5L0E1VUVF?=
 =?utf-8?B?WjJmallwa2FqVi9SaEovYU1tWGc0czdOb3hYejgxYjJrbUFVeDVBQVZadUI3?=
 =?utf-8?B?cjNJSkpUdHJEUFhoQXo0dHFXTEVobnNaRVAvU1FpZzI0OUJ0L3JOdXdlZDBH?=
 =?utf-8?B?YTRueFcrV3VrdmdBVWpSVXJaUzU3aWg0aldxWUVseFhia1oxYS83cDc4UHhv?=
 =?utf-8?B?MmhFMFU0UTRCTFBvWlpBeE9ISUNNY0VQbEp4UEsvT2RhaS9iNzhaS0pvUGlO?=
 =?utf-8?B?Y3ZzNWlPalNvWHFNYzJHSllVQzludU5UMFVERDZscWJRbDA5K1d4R2dXLzN0?=
 =?utf-8?B?NFo5MlFnZzVmTG5QWVRhZUZtQnNIL2FFdnFkNW1haU83QUpKRTdLdmVvVGxt?=
 =?utf-8?B?Y2F1cXU2OGRVTjhBWU9SZmdoTmFFVzhoejZNb2I5Y09EVkRIWjZYQUYvclpR?=
 =?utf-8?B?bTNUSEQydk1UdWpaM1JXOUNaK3ZEQ2Y4NzhOUEFnQ01KMUdJTUFKMEtvSnlj?=
 =?utf-8?B?c2FGRzBtcG94NGVqUlNkWGtYSlRVZXFHcWxyZ3dXV2VPdE5wNndURjVZTGYy?=
 =?utf-8?B?L0lwWHRkV1RIRnd0Y3h4RmNRYnduVXhPdExUcEdhMld0cXQ0VlYvKzQ5c3pw?=
 =?utf-8?B?LzViUytiZVlwM1RMSW9mai9BWU13eFlVY2tSRHg2dGZBVjk3R2xMSEhFOWh6?=
 =?utf-8?B?VkNPL3ZXQ0d5aHU2M2RwbXkzUFdZN0dYVHdnV1J1T0JReUhMMFZYT0xZM0NW?=
 =?utf-8?B?S1IvMjBrZnhQSzlhV0NaU3Y2MFd4NEw4Z2p6TFo1WmVuUEFoOENxQnRJNith?=
 =?utf-8?B?Rkl4TkRQODlQeVVuRHUyWWh5VHFHaUxkcU9lUlZSV2lMZ3VzWlhQQ3A5YUZi?=
 =?utf-8?B?L29yRTJnOEdTZHFaRy84akZZTDBFVlU0a1dFZE9Vckp1RSsxNTBqUmc5b3F4?=
 =?utf-8?B?dlI0dDh0MEthUlFZZy9mYTltcWF3enNucEdWYXUwdVdUaXp6eW9SVEtSYXF3?=
 =?utf-8?B?MmhSVGplOGIxTTZmVTNJcEtLUGVDR08wNFlERkhNRWsrU2NETkpZQ0w1bVlv?=
 =?utf-8?B?L2JkWG5DTWR3ZHZGa0s2ZGVuYWJvZHpMSC95TDNVTkJsNnZWeXhQVG9oZDFu?=
 =?utf-8?B?c0RpZG9nem0rZHg5d0RFVjZ4KzhTUDlDbndienRva0VOSkZ6ZnQxbllwa3JU?=
 =?utf-8?B?TDJHNVFwSWEvR3VaYVZxSjFocVV0czgvei9HSkV5MzRqYjlOQmEzTG52RmJF?=
 =?utf-8?B?UnUyNlFQR1M1Q3NSRVRESEJyQ0RNZi96T0x2QkpPM3ZBL1hNWklyV21DR0cv?=
 =?utf-8?B?Y0hHYk5aRHdGV0tkcEp4RmJuTjFZcHE3TU1pNzEwTGJ3TXIvajg1c3EyN0lW?=
 =?utf-8?B?T0NhZDdON095Q09seTJ6WGMxOFdvcVVPNVhqYk8yYjhzZEQvamZ3b3lpMDRi?=
 =?utf-8?B?a001L1BzUW80cEVrV21Bd3lzeWQvNUJaMnMyWTBvcHQxeXdoMFpGYWNJSVlO?=
 =?utf-8?B?U001Ui90MkU3WVdlSWNtUXhoZjltNGpseEFhTWZFMjUrNGJ1b1FDRjV2cndx?=
 =?utf-8?B?OHJ0QUhzeERUQmZ1cnlQQll2YlVHNnZKUFdTcm1NOGcvcHZrTFUvYkR0VTZT?=
 =?utf-8?B?YUErYXZtTmFzZ1dyUUhldHlrR2Vvdm1QNDU4empsYkVCQ3JrSS91VWM1WCt3?=
 =?utf-8?B?MUtzQXhkTkZzS0tNZXRGWUorYkRNWlV1bHg0cTRlYUJiWnRnZjc3bDgwcHA0?=
 =?utf-8?Q?x8DpfQ6bs8RYoL435yYAKasSe?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 217dc36f-89d2-4ddd-a567-08daa0af0450
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4409.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 17:37:57.9867 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q8MrBBTliZt7oM2Xk9z+RD+gHLcsKmwb5dUaX49J4bEdWf7K4hWTV4iwYyNVHuKlu2fCZd69qW4Ie3+VLfhrig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4470
Received-SPF: softfail client-ip=2a01:111:f400:7e83::61e;
 envelope-from=vikram.garhwal@amd.com;
 helo=NAM02-DM3-obe.outbound.protection.outlook.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.319,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 27 Sep 2022 16:29:24 -0400
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

Thanks for pointing this. Looks like my configs are outdated. Will take 
care of this for v2.

Regards,

Vikram

On 9/22/22 7:20 AM, Peter Maydell wrote:
> On Sat, 10 Sept 2022 at 09:15, Vikram Garhwal <vikram.garhwal@amd.com> wrote:
>> Hi,
>> This patch implements CANFD controller for xlnx-versal-virt machine. There are
>> two controllers CANFD0@0xFF06_0000 and CANFD1@0xFF07_0000 are connected to the
>> machine.
>>
>> Also, added basic qtests for data exchange between both the controllers in
>> various supported configs.
>>
>> Regards,
>> Vikram
>>
>> Vikram Garhwal (5):
>>    MAINTAINERS: Update maintainer's email for Xilinx CAN
>>    hw/net/can: Introduce Xilinx Versal CANFD controller
>>    xlnx-zynqmp: Connect Xilinx VERSAL CANFD controllers
>>    tests/qtest: Introduce tests for Xilinx VERSAL CANFD controller
>>    MAINTAINERS: Include canfd tests under Xilinx CAN
> Hi -- something odd seems to have happened with the cover letter for this
> series: the patches haven't ended up as followups to the cover letter.
> You can see this in the lore archive where the cover letter ends up
> here on its own:
> https://lore.kernel.org/qemu-devel/20220910061209.2559-1-vikram.garhwal@amd.com/
> but the actual patches are here, with 2,3,4,5 showing up as replies to 1:
> https://lore.kernel.org/qemu-devel/20220910061252.2614-1-vikram.garhwal@amd.com/
> This means that patchew couldn't find the patches:
> https://patchew.org/QEMU/20220910061209.2559-1-vikram.garhwal@amd.com/
>
> If you could look at what went wrong in your config for next time it
> will make the tooling happier.
>
> thanks
> -- PMM

