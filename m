Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F51638CCB
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 15:57:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oya7M-0001nb-Gv; Fri, 25 Nov 2022 09:55:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukes@xsightlabs.com>)
 id 1oya7K-0001n7-Ce; Fri, 25 Nov 2022 09:55:50 -0500
Received: from mail-db8eur05on20631.outbound.protection.outlook.com
 ([2a01:111:f400:7e1a::631]
 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukes@xsightlabs.com>)
 id 1oya7H-0001Yf-Ri; Fri, 25 Nov 2022 09:55:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oTwNczcxfSbEns0B5wmcKlW4zNX9fWcSCc23A6cSCVqa0NbVwJ8FALuo576OfVTYm3WZZbGWJRYZBkeIYFTToC6QqMSZ/RoAVF/6xcGLAmHv04CQUI1AlF//swGJybUHTyNs5yUgZsLcASuyFW101OT/5OSuBsDp+DeQIfagdv9o6PuGkor8yx+2Lw3+1B/8yo9YZnHX8QB61h9F3BzOokW1SGEA0R0H42rOd8Y+6ZNfvWyhhBduHoypXxbYtJcECr4dusrEeNAQZNwo+KDjpM2m0EiXoOjQeQm4pM8hlkdMEkB+1uoX2wNgP+vi8YusyaWZix9g0hmNfdK5qlqbnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uI93oIedCU6n+eszP54KdVl9KqA2fZ0hWzkghb9zN98=;
 b=F654cWmSbDlsj1+72LcjZ9Zh6Wjp24ybsWMRxMbpFWtirxdOzsi0kX03OiJm/ZHEt4ryHXG0ckRbK3/lTzdjnWTR4RMpsHCukSXKDP7LZnu4hZonoRU2ZtcYulUqGjL2F7oKUmdx/2wIy60r8lxxhbPDS4aR5LfsuAnJWJiPlagJ7iKx33QNgkkfkw5y3FxfAGqYVHE/HjtvFYMoJQZTKvmPD6xOZTz9c/sHUGqYRRR7Tbs0ijFJfJUHdDwn0V3ZqFHqu+iYY123XXyi+l/L8FB2DvNivBVoQRiP+0Jg8GtXoXny8WZ9CFzhCyVkEja00P4My5N9UVyVy+Iau8jZFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xsightlabs.com; dmarc=pass action=none
 header.from=xsightlabs.com; dkim=pass header.d=xsightlabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xsightlabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uI93oIedCU6n+eszP54KdVl9KqA2fZ0hWzkghb9zN98=;
 b=WMwSydZXyaePPXfQ84ibm7bwfn5Tred5tPcIHNAZxSJKBK7X933V945AlYLzwnuWc308RUvcZ1GE04o3OJ1N4Zn0R4Psx0/nb97FfEMRnHlqkM4tlhuRq2VcLqhksLrI9D1ij5/6qFlwTYNA6P0HLFZZ7SbLR0d/ISOg/EE3onU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xsightlabs.com;
Received: from AM9P193MB1684.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:3eb::9)
 by DB8P193MB0504.EURP193.PROD.OUTLOOK.COM (2603:10a6:10:154::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.20; Fri, 25 Nov
 2022 14:55:40 +0000
Received: from AM9P193MB1684.EURP193.PROD.OUTLOOK.COM
 ([fe80::4250:f814:d3d6:53fc]) by AM9P193MB1684.EURP193.PROD.OUTLOOK.COM
 ([fe80::4250:f814:d3d6:53fc%5]) with mapi id 15.20.5857.020; Fri, 25 Nov 2022
 14:55:39 +0000
Message-ID: <e769a16e-5934-186c-b14b-4579f3622b10@xsightlabs.com>
Date: Fri, 25 Nov 2022 09:55:34 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] hw/intc/arm_gicv3: Fix GICD_TYPER ITLinesNumber
 advertisement
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <AM9P193MB168473D99B761E204E032095D40D9@AM9P193MB1684.EURP193.PROD.OUTLOOK.COM>
 <CAFEAcA_BN2EwTQwb2F8YxN0sz8t_D-o5cUQKacS5QoHuYB0TSQ@mail.gmail.com>
From: Luke Starrett <lukes@xsightlabs.com>
In-Reply-To: <CAFEAcA_BN2EwTQwb2F8YxN0sz8t_D-o5cUQKacS5QoHuYB0TSQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0316.namprd13.prod.outlook.com
 (2603:10b6:208:2c1::21) To AM9P193MB1684.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:3eb::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9P193MB1684:EE_|DB8P193MB0504:EE_
X-MS-Office365-Filtering-Correlation-Id: 0edad2be-e881-4f6b-b7bc-08dacef51e0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YXBIFsj+66ezMYGC5AmzCikssk9n0B4/+TRkd7kGqW+dPLYFpPczQj+x0UCuz2RnK02wAlQeXnMpjFRvRPaeL9X1QSDvgkREXIbnEcM17/P7KiI7Ti8vLUJMYJVG8yjZF95lQ/h/7lgHfou58xLKLv52KGBALNCVA1UUB/7MDgyxluOn6gqrO//UpGGZOCxXrXvZhr63cIAp+HdlJokHM1YiN36lwPyprKL+kXL3RI3i3/elU8F7MlGOBn4zBvNzIAb3NhCEsMkclLhtUf15AdKzc1zIjF6FF0Lg/h+ZpSOA5KCdIBwQ3Q+zwkd3+lTMUDgpra3HtyKsukmE3SqPLWz8kf5TYTvURbPpcNiXRWuFjUUmAjTJqQXdGmq6zJCUhB86WHk3knZGbUC7DNqD4eoFLYOtri6IB0g7UX6pRdKp+DqsX0otULaGyprhwfieCo6RrjnNI5tfRFZ2r2Ofq/hDvSr/D2WX6AIkP8/MnWSyqggzOx+8T80MAIBhteYFtNfEvmsT4vYLwYdCg0iOAsepohHTGG0dqJrZ2zc4AdnPDxqDO6GZWAswa0gzfCI7AZlrTYu8ze16AWlnpxKvsKfPox0OE4DzeNN10ApvYetszvZnKZjly/jnDBM6+1RwDWz5VcHJLgNaGCbbdpY7iHNZgfoJxCwfOSw7OXzxFrsRHvo1lFMZirkW4IZMxG2JSp2+GCAtNPWsp6FgyjCy193HBwpNUU15/RN1saG6adE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9P193MB1684.EURP193.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(366004)(396003)(376002)(39830400003)(136003)(451199015)(41300700001)(31686004)(5660300002)(2906002)(8936002)(66476007)(66556008)(8676002)(66946007)(4326008)(316002)(186003)(2616005)(38100700002)(36756003)(83380400001)(6916009)(54906003)(6486002)(26005)(53546011)(6506007)(6512007)(478600001)(31696002)(86362001)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFVjM3o5WWR6TE5NOHQ2SHFBRnlraTN6WGsrZGpiL0h2VG5CakNSTDYzbm1l?=
 =?utf-8?B?QUxsWVFEVFVrSHk5TkU5U1RLd0xUaE9TZGdvbDB3Q2VuMGtTZHVMZXNQcHNZ?=
 =?utf-8?B?SlVqQTdZWGVCWnZGZjRoVkQyUDY2L09qaGZCUkJ4WUx6dlRzQnQrczJjdzly?=
 =?utf-8?B?WGk0amdxUk0rMlV5akFnd2R1RDdnVkJEalVtZEdXZC8wblhpUnZIUzBCV2N5?=
 =?utf-8?B?WmhzL1ByRXloY3RSWEUvSEdrZkszL0lXdGd3dmdjT3h0a1pQamtNWVlSTy8v?=
 =?utf-8?B?NWw1Wk1FelRhZVQ4M1dFbVg2YzhJay9yOENtOEl0L0s2ZFFIKytTdGMvdU9P?=
 =?utf-8?B?MlR4YUNOMG11SVN6eGxRSlBkL2JDOVBhWkxzTXo4dkVuYlZ0MVNUNExvUG4r?=
 =?utf-8?B?Y3FDMjdJMmZZbnc1b3hZSElqeVpGTERwZ2Q5V3kveG1XRUhwRTY3Wk1zR0JC?=
 =?utf-8?B?Z0hJdlh1SlJoYTFIZzBFeXF1bDFtbFdGYjFPMlZvTlc2KytMcDN5TW5EcEgx?=
 =?utf-8?B?NG1iek44LzgrNVIxUGgvVWRDeFJCSFZRdXA2V0ZuK3N6SmY2KzR4bmxhSE5l?=
 =?utf-8?B?T0NNUytMOFg3UDFZYms3VUlCa0R5U1BxMUZoZFdCRlYxNXVZRUk2dFh3a01E?=
 =?utf-8?B?VTdvT0xjTW1jMXRsUWRyY1BQM0xjOXpzMi9sc050dzhFaHF3WEZjZjdMbVZN?=
 =?utf-8?B?QXZ2VTNhUjRha0V2UmtaMXQwYXFpVUNyY085aXpNSVVXV0VkalJRS0FLUkNQ?=
 =?utf-8?B?bHlqWDJab2Z1cjI5bWI4WThUZ0RhcENtR29LbUdDTi9aU042bThJT1hUNTNt?=
 =?utf-8?B?YjE2bHJSL0N3Qk9JMTdwM3NDaG1EbkJNOThXZkxKcTVpZ2NzRVp4a0puK01u?=
 =?utf-8?B?YWNZVFZrVDZzUzB1d0hYOWUvaEZ0d0xVRjBRSm9laTdSVTdXVDgrV0JxQU5y?=
 =?utf-8?B?RWZjT0N1cnF5ai9YNE1KSDNoS3lRUXo5SU9zRkxDNFhiV01UTkxyS0tHVTdv?=
 =?utf-8?B?eHJkSkZPUFhxMGM5S0NRcHg5V1NadkpqajU4bWt1dmdEQzUwTFhvNXU5QTQ2?=
 =?utf-8?B?clF6Q2RlcEtFSzluSHVxRXZ4TmZBSjhBOXUwcmlQMjlMNUxwajFlMkQyRnJh?=
 =?utf-8?B?V1Y1anFNa2t1OTBlWEUyYmU5QWtBWVY3TDh6ZTYyMFovSHUrVEZSM1F1ZFlO?=
 =?utf-8?B?Nm92S0J4Z0tWOFBlc2ErWEV3clVnZ2tLbFhKSDRlS3Raa0hxdHpLTmFlSDhB?=
 =?utf-8?B?SG5aZCtZOUVBS0cwdlNDNlQxVHZFb01PTkdEZXRIckdIWUxJNjV6WHBXdFN5?=
 =?utf-8?B?aVFVYjhmSjY0dUpGSER5TGREcUZLSGMwR0J3TWw3OGFoZHFGaXpCV3pUcVdL?=
 =?utf-8?B?dnRpZks1ZEk3cTdMWlJhbzgzK28vYWdKdVo2ZnJrWVZWRlYrQW9RSHV3QWYw?=
 =?utf-8?B?SzdkSjBBKy9sNzQ4cTFjaVBmeEplMFVpVHkzRDI5TmFnNnZNeHZhWXZobFFK?=
 =?utf-8?B?S1lQdGZzT0lBZUdHVXFib2JHMzRwYzd6SDVpZTF5ak0zdk5jbUZiWXAvOTJR?=
 =?utf-8?B?dGdjU1dzc0FGWUNERjM5d21ISmJtQmpITUVGcU5tQWxwZC9peFkxMHFEZUc0?=
 =?utf-8?B?bGVBRW9zdkhqcExqVWRXODZ0dFRIY1p4UHJxaGp4cE90QlBRdWt5VEVlSWw1?=
 =?utf-8?B?UVJnQUhtWGZtZFZXbVN0dHBXa3VhR0dHbWh6bHBtVzRuelNGbzE0dFhvRDd0?=
 =?utf-8?B?VU1vdVMxZEVTRG1pUUEwWkhYdDVLZjB1WEs1Und4ZmRlU0p2Y0RxcUlpL3A3?=
 =?utf-8?B?T0FWK0REZDZ5SzlycHBtMG01cEw4L3J5YVJvMStoU2w3MWs1SzZLSlZzWnJo?=
 =?utf-8?B?cnFFb2JGM1YwSUxCcm9HSHI5eW1KUFZtdjg0UE5mMkdMRUZHS0F4VHN1NEg3?=
 =?utf-8?B?c28wYmZjbDlnR2s0MUJLUDh1ODFFenVjMWk3djhtdHgvQkNPa1ZUZnIwWGVs?=
 =?utf-8?B?OSs0VElZeDAxek1rM2ZqbXQ2KzJ2VDhkajY5NElFbTdLRnl0bTIwbjkreUdR?=
 =?utf-8?B?Q3RRa3dqRW4zZnpSQU1HMzJBSDk5d3hMV2VkTjNDc0ZuT1FsTDFFMkkvcllQ?=
 =?utf-8?Q?a/xCMmqTNzbqgByZCwkJTPToN?=
X-OriginatorOrg: xsightlabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0edad2be-e881-4f6b-b7bc-08dacef51e0a
X-MS-Exchange-CrossTenant-AuthSource: AM9P193MB1684.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2022 14:55:39.7829 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 646a3e34-83ea-4273-9177-ab01923abaa9
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EBKy1vcjsutzOOyDwdcU0ivGO9yV5/nRtaO82x4x/d+ZZx8VU2haZb6j3WvaPr+frrMwpRnc/jbdY6FOgQ7ang==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P193MB0504
Received-SPF: permerror client-ip=2a01:111:f400:7e1a::631;
 envelope-from=lukes@xsightlabs.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FORGED_SPF_HELO=1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 T_SPF_PERMERROR=0.01 autolearn=no autolearn_force=no
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


On 11/25/2022 8:34 AM, Peter Maydell wrote:
> On Tue, 22 Nov 2022 at 18:31, Luke Starrett <lukes@xsightlabs.com> wrote:
>> The ARM GICv3 TRM describes that the ITLinesNumber field of GICD_TYPER
>> register:
>>
>> "indicates the maximum SPI INTID that the GIC implementation supports"
>>
>> As SPI #0 is absolute IRQ #32, the max SPI INTID should have accounted
>> for the internal 16x SGI's and 16x PPI's.  However, the original GICv3
>> model subtracted off the SGI/PPI.  Cosmetically this can be seen at OS
>> boot (Linux) showing 32 shy of what should be there, i.e.:
>>
>>      [    0.000000] GICv3: 224 SPIs implemented
>>
>> Though in hw/arm/virt.c, the machine is configured for 256 SPI's.  ARM
>> virt machine likely doesn't have a problem with this because the upper
>> 32 IRQ's don't actually have anything meaningful wired. But, this does
>> become a functional issue on a custom use case which wants to make use
>> of these IRQ's.  Additionally, boot code (i.e. TF-A) will only init up
>> to the number (blocks of 32) that it believes to actually be there.
> Nice bricktext commit message :-)
>
>> Signed-off-by: Luke Starrett <lukes@xsightlabs.com>
>> ---
>>   hw/intc/arm_gicv3_dist.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/intc/arm_gicv3_dist.c b/hw/intc/arm_gicv3_dist.c
>> index eea0368118..d599fefcbc 100644
>> --- a/hw/intc/arm_gicv3_dist.c
>> +++ b/hw/intc/arm_gicv3_dist.c
>> @@ -390,9 +390,9 @@ static bool gicd_readl(GICv3State *s, hwaddr offset,
>>            * MBIS == 0 (message-based SPIs not supported)
>>            * SecurityExtn == 1 if security extns supported
>>            * CPUNumber == 0 since for us ARE is always 1
>> -         * ITLinesNumber == (num external irqs / 32) - 1
>> +         * ITLinesNumber == (((max SPI IntID + 1) / 32) - 1)
>>            */
>> -        int itlinesnumber = ((s->num_irq - GIC_INTERNAL) / 32) - 1;
>> +        int itlinesnumber = (s->num_irq / 32) - 1;
>>           /*
>>            * SecurityExtn must be RAZ if GICD_CTLR.DS == 1, and
>>            * "security extensions not supported" always implies DS == 1,
> I always find interrupt number counting confusing because
> there are multiple ways to do it...
>
> In QEMU's GICv3 model, s->num_irq is the total number of interrupts,
> including both PPIs and SPIs. So if s->num_irq is 256 that means
> "the maximum SPI INTID is 255". The virt board code agrees with this:
> it defines NUM_IRQS as 256 and sets the GIC num-irq property to
> NUM_IRQS + 32.
>
> The GICv3 spec says that if this GICR_TYPER.ITLinesNumber field
> is N, then the maximum SPI INTID is 32(N+1)-1. Rearranging:
>     max SPI intid == num_irq - 1 = 32 * (N+1) - 1
>     num_irq = 32 * (N+1)
>     num_irq / 32 = N + 1
>     N = num_irq / 32 - 1
>
> (We enforce that num_irq is a multiple of 32 in
> arm_gicv3_common_realize(), so the division is fine.)
>
> So yes, the setting of this field is wrong and the patch is correct.
> I've applied the patch to my target-arm-for-8.0 branch and it
> will go in once 7.2 is out in a few weeks' time. (This doesn't
> seem to me like a release-critical bug because we've behaved this
> way forever.)

Thanks.  And yes, you're correct.  This is not urgent at all. Most 
likely the only way someone would expose this is by creating some custom 
platform/machine, that needed to use the upper (last) 32 SPI/interrupts 
(which we did).

> Interestingly, we got this right in GICv2:
>
>          if (offset == 4) {
>              /* GICD_TYPER byte 0 */
>              return ((s->num_irq / 32) - 1) | ((s->num_cpu - 1) << 5);
>          }
>
> but obviously got confused when doing GICv3...

Right. I noticed this as well and it kind of surprised me.  But the 
numbering convention is really what created this confusion in the first 
place.

Luke

>
> thanks
> -- PMM

