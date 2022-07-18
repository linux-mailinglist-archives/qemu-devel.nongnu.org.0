Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFED257837D
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 15:17:49 +0200 (CEST)
Received: from localhost ([::1]:58272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDQdB-0007am-2i
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 09:17:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <NikunjAmritlal.Dadhania@amd.com>)
 id 1oDQWJ-0003Sv-82
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 09:10:43 -0400
Received: from mail-bn7nam10on2078.outbound.protection.outlook.com
 ([40.107.92.78]:14336 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <NikunjAmritlal.Dadhania@amd.com>)
 id 1oDQWG-00035h-J6
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 09:10:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jCBLeaNSBlLcdmPuuMRpvZDYfdfvEkSHcu8lXtl70lgIWdLe8Dp57yj8g1R7apWl0YFYJGR5KaFz0mZyOEXLf9irGM0LCnmZrv79Zeomh4G/sbhdgdG2km/xB+5mulpiwRSV0TQ0Ko62ntN9DFrBULVRI2V7/eLnhw3WE4bSQ3Mez08F6su+oQjJ71FM71Hf+CzGjaHrqXhg2aU67tQzZTVeV/nqDc+2DyIJK2+IIutk2lA+h6GMZlSo7gdZGMemLxxBtwIgP2an5Bs1YrKn9i2FS8jJqw+eIUWZbWqEDlhSNj85GVY3Z5maqip0/zNQF7Q+sdWyrgdETvJPkbrUgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V5byKFZnY12D1pY2cEK+jqpG9Lz+DC4qYtQIFkXZ3fc=;
 b=l5iOGKZKMv8VFHatayf/h508rZnk1ZazOutvVK9sdnMFPCgz1gqzXIBIXBGtomIgU9SC8mfp/4h58c+gPfLee+S5G4zwz7/Fj7cJ1JRdWqui3lI/tfcnVdSOI6t04fJBJ/2euVDDIcb5Rht9WqGHr+l6tfJQM7ZF78ru8WLVfVMTgz9IXKaYTMSlTxOiHFPYcmo5Z1W4/lk3jPhGTvBl+RE74PZueHKhUHxH9T5YgleTR5ldYhsgUaRMZ7VUaVb+fRZEpzqBpw+0IIQFMjHtOD+Rx+/KBKbG5qOkqoDiYx+LMNixSgjMsVq/wNPgcxjQM+uEKw9PNT7EtYw5qNSY4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V5byKFZnY12D1pY2cEK+jqpG9Lz+DC4qYtQIFkXZ3fc=;
 b=ElqLCmQYQ8iHJka1I/wImI8zS3ArpeE9D+wyRs1IPmtoBwjLiYwAfx/+kjjC+KTWHqz9MImtZ8kO+k5rwfvwaTMQvBTPpjK2QZAFLHYaknGl7IXVIEsR5WbOQqE1KUFPlpn8VdyDLRFdfDRD/YrDbzTEOC3yr9Sxuq8ZrDFnzTU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS7PR12MB6309.namprd12.prod.outlook.com (2603:10b6:8:96::19) by
 BN7PR12MB2834.namprd12.prod.outlook.com (2603:10b6:408:31::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5438.21; Mon, 18 Jul 2022 13:10:35 +0000
Received: from DS7PR12MB6309.namprd12.prod.outlook.com
 ([fe80::d9f4:5879:843b:55da]) by DS7PR12MB6309.namprd12.prod.outlook.com
 ([fe80::d9f4:5879:843b:55da%9]) with mapi id 15.20.5417.026; Mon, 18 Jul 2022
 13:10:35 +0000
Message-ID: <e4cd8e81-a8a0-a898-e61b-3e0250dc4995@amd.com>
Date: Mon, 18 Jul 2022 18:40:24 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] x86: cpu: Error out if memory exceeds addressable range
Content-Language: en-US
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, f4bug@amsat.org,
 Abraham.Shaju@amd.com, bharata@amd.com,
 Joao Martins <joao.m.martins@oracle.com>,
 Sean Christopherson <seanjc@google.com>
References: <20220718081734.135598-1-nikunj@amd.com>
 <20220718144210.4ef95c53@redhat.com>
From: "Nikunj A. Dadhania" <nikunj@amd.com>
In-Reply-To: <20220718144210.4ef95c53@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0016.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25::21) To DS7PR12MB6309.namprd12.prod.outlook.com
 (2603:10b6:8:96::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5b83b344-c8aa-4cb1-d3e3-08da68bee6e5
X-MS-TrafficTypeDiagnostic: BN7PR12MB2834:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Is1Ub5RXpzfW4SZAiM0ZDbQv03ItWKrog1WvjHcGMBWTmNtYLAS7sW6plcz9gWnsWNGnccB0dT3/T0oebUVRv14jpZb5wWlLrbFfUdXKGX5U/JDDnxuHtOMofxRyUbsiHi36VhuS6H4+u33OyqI73SBHyrB34PC1Z7M4M5sC7fHBdR1R4bdjJV5RPGyrT3Em5yj5wsT/vRIz8jnkHjH+4GntSl62UT/TwC5HZ+/3z8DCxKZs9JyuEXTWJqqdGYDFVMTvwJ5gxoDKRsH7BN0Ymk0/3KxC8WrAMNhZBHsPgy6x7ZtEUFPOj99aoECep4pmhmGhZ8UN0AUI6Av9aXtztUEWc1S4SVKORIAdCuYgmRJT9dSRbVfErPwIRj1krLMXhcMdLFZfoYfGV5uJBLuxKIcQov2+b9dwaUsDTB2kyzC3NXdkZqvw2oQp4R7kAS3u1wiZ1vdichOg39sM/2TZcgZzsmuLQZTSfnY66bjS7A/19uPI4nEFaN9/j1B9DRu6O0HIm4i7/OicABxmBk1Itoj7zTHD/5Mk1NCjlbxyfMfDku72Uqw/zwqjqpcD3y4SGJw+WlaZQ2Gc/FD3fYdYQs2qI6VVGZ+FljoxY9AuHREuOivJGo7NBZ9Kwh+7nxFeCIah9BBFW8dL3Ca1cmaKrTd9bcp7nbH8h3brrN1n6u3XEhmIXwIbmCqvxdPhm660tpNI9wd7kzdYLTnYsrzyhXVIeCCTs6z+PwmjPXoPsqBvIWoxei36YC6+8QK8CgVm4Rlgz6RjUqWVPFP+j4bjsFtzRciU7RcSLfbCnHjdCdI+MzhpIQgUh/SK4IpYF0s5F+3Hjoyjp6PFGSH3a0Tsw+IBjZRzfWsx2Sc4FgWCuLXQqlp2gVc4ebqpTHR9lKWd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB6309.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(396003)(366004)(346002)(376002)(39860400002)(2906002)(31696002)(5660300002)(8936002)(26005)(6512007)(53546011)(6506007)(38100700002)(478600001)(2616005)(6486002)(966005)(41300700001)(6666004)(66946007)(6916009)(8676002)(4326008)(54906003)(316002)(66476007)(186003)(83380400001)(36756003)(66556008)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGh5UmdDNitPQ0hjb3JTZWVqZFhHUVFvMzd5SzJHMUlIUEJuaDJwY1NtYW1T?=
 =?utf-8?B?OXFVRWxzMDExanJLcHpwcE8rbFltQ1E1dGFVcEoyZkg1SVBYT1lRNUMzeEs4?=
 =?utf-8?B?REFNSHBzRmpGWXI5a1JMNExuS1BtYXpFNnMycHlERC83NUJtVmxyNEZEcTVl?=
 =?utf-8?B?c1N1WXVJZWFSV0ZHZkVvRVdZV0g4VTh4T0Q4cis5M2c0Zmc4STRyQnpJZmNm?=
 =?utf-8?B?RytVcmV1aHc5RllzRXZSSnNqTDFZZ1dpbUZYV05WelBISnBldTRUWjJuOVhF?=
 =?utf-8?B?NkpONVlDR3NxMGdnK0J1R2dNdTdEbTFLVTVRbU00NlZnWWlVUzQzQTg5S3Nh?=
 =?utf-8?B?TzdlR3IySFRTY3l0MFFiemJGRVJXSVNEMWxuSVBSYXQwZHVzTTBmUlNZVTR0?=
 =?utf-8?B?ZWlwUmVFc1VKRXdHYi8yVE9iZmdJV0xsZGFWMVRURlRFOTZXVHcxRXZXTE45?=
 =?utf-8?B?VWd6ZFNDalF1T3gvRHhhSmk1bnRHZEpMRnppNFJCNEdoc0VZdUZkcUM1WXdt?=
 =?utf-8?B?bEoraXFLamw2YmNxcFJtZzdQS3NqSjZJVFdXdmEwVVEydWh6WGV6U3dOVVN5?=
 =?utf-8?B?TVhidjNobVN2TlJVTW1GYmY2L0dsVmVqYzBDcG9jbmQrRi9SNGYrNzdlWTEr?=
 =?utf-8?B?ODUrU2RCazBKWTNIYzM0SjAvSWRLN0Z0cmROZHR4cGJoejlZSXpIMmxteFM4?=
 =?utf-8?B?TitjN0Y2VE9keG9YRzVKdEprUGMwT2NwYWY4ZEYwWG9nbDVkZ1NyblNGMG5E?=
 =?utf-8?B?bGFnaVVsMjlEejZ6RUlGVXM0dEZ6bk8xWFFQMTdvRDAwM2o0ZWtKdVZjWnhQ?=
 =?utf-8?B?VU1uUWluSDg1T081UGRBbnZ1NnhwS1J3RndkTE9SQm5ZdG9PeGgxN2NtMVU0?=
 =?utf-8?B?L2U5Z3hJVk1BSW1IbGpFSW91d2E0RE9mR1FxSW1tQ1VpQVlFdXhEWjkyN0My?=
 =?utf-8?B?T3NUc3luaW8yeUNiMDY3T0lnMXZIT2UycFlTWE9uTnNHa1R5cjg3Z1FFV21t?=
 =?utf-8?B?M1VqYzdQYU9wMHUxdUJJQWliS1hKYWR1T3NUNllheXFKMG11QnJ4ZWJkeGZU?=
 =?utf-8?B?R1FvT1NxekF6TEFRZlg3SDRiTGZWOHBuSW45M2V1d0FMdC95TWZnY1VWWDA4?=
 =?utf-8?B?VTRtNFIrblVlU1NtOHo1TWt2RTBMcjJ5Rk51NWkveVozbUF6QzlYV2lQTTY0?=
 =?utf-8?B?R2U5b0VQSXRJR2JaVEdWS0IwYjR0Q3EwVFNMZThjZDI4bnRMQVg5UnlNV2JT?=
 =?utf-8?B?Z0t1bk9lMVFSNExjR1lWWk4rdXYvaWFremMra2lobFp5RkhMWXhMNWxMQUM1?=
 =?utf-8?B?VUFRYVdhclVPTm0xQngyaTRXYXNib0o3N0dWS0JicWtGN3JzaXpBNWEwSTVO?=
 =?utf-8?B?UEduU2VhQXh6ektGR2xnd0NvOTlXZ3MyS0huME8wbFl1VWltTUREb2Q1R1Yv?=
 =?utf-8?B?NHZVME95YWxlZys1Yjk2bUJ5ME1zVE14S09BOXdCdE4zcTZ3eXBGOHEyUnhp?=
 =?utf-8?B?ZnF0cWtlNnU4WjlsdzlCVFZOa0ZwSTlWbFlTNE1pSnNlM1RNYnZDNVovUkFs?=
 =?utf-8?B?QUJPQ0Q1MHVyY0xHa0xmVXZJZE9aUzdGZ29naGU5UHZ1ZFMxMk1xaExsRTFD?=
 =?utf-8?B?ckNQRVpoSVk2MHJHT3FqR3JHWXB4Tm50WW82MlBvTVNnaWR6L1dRSG1sL3RH?=
 =?utf-8?B?dUg4ME9mRTNTUkxsNmxpcUc1VHJMUXduMmRPcGxEMTRzZjRBcXExSmEzRVpY?=
 =?utf-8?B?MlRldkdsSGZyazdrejF4WjNBSUk2Yk5TemgxM3crNUxxSDdUU3Z2cjFBQkk4?=
 =?utf-8?B?YjJSdkpGaFBmOU1QK21Ld05ieHlWM2RhTXJQNTBkWlZOR0VMQksyV0VDQ2Zx?=
 =?utf-8?B?enR6N2VmckhvaWIxMlh0WUptRVlkSE11c05UcVAvTHQzQjVoTGE0bGR4VVk4?=
 =?utf-8?B?K1JTdk9penNZaHFpazlQMnJpR2pkOXBXSm9Zb3NyRmk4dWZXWTIvZmVzcDAw?=
 =?utf-8?B?aGhvbGZsMVM2YTg4b2tCV3JwQ0VOb016U2hZckppSHJqRFZDNUNWZEFRWG9L?=
 =?utf-8?B?ZW9IdTBwaE1YKytEQ3pjcGl6RmY2ejhHYWlYZ3UxU0ZsL0Z3N1dFbjBzTGJE?=
 =?utf-8?Q?uOLwqM/bhzjzq25hRvBRCTaxG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b83b344-c8aa-4cb1-d3e3-08da68bee6e5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB6309.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 13:10:35.6211 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TUVGxUQcmbigfO/DKhjNmGiCr4F+1uJe5w2+0z2VA8JUb4neQXV578ULkwhU2DHCjJmUW3MegZs1tQFPdTtX6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2834
Received-SPF: softfail client-ip=40.107.92.78;
 envelope-from=NikunjAmritlal.Dadhania@amd.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 7/18/2022 6:12 PM, Igor Mammedov wrote:
> On Mon, 18 Jul 2022 13:47:34 +0530
> Nikunj A Dadhania <nikunj@amd.com> wrote:
> 
>> Currently it is possible to start a guest with memory that is beyond
>> the addressable range of CPU and QEMU does not even warn about it.
>> The default phys_bits is 40 and can address 1TB. However it allows to
>> start a guest with greater than 1TB memory.
>>
>> Prevent this by erroring out in such a scenario.
>>
>> Reported-by: Shaju Abraham <Abraham.Shaju@amd.com>
>> Signed-off-by: Nikunj A Dadhania <nikunj@amd.com>
> 
> 
> Following shall care of your issue:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg900136.html

Thanks, I tried out the patch series, I could start guest till 978G (not sure 
why this magic number yet) and after that I start getting errors:

$ ./build/qemu-system-x86_64 -enable-kvm  -machine q35 -m 979G  -kernel bzImage -initrd initramfs.cpio -vga none -nographic -append "console=ttyS0,115200n8 earlyprintk=serial,ttyS0,115200 debug=1 " -nodefaults -serial stdio
qemu-system-x86_64: Address space limit 0xffffffffff < 0x1fc3fffffff phys-bits too low (40)

Regards
Nikunj

