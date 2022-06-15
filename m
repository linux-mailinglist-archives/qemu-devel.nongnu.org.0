Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4D154CF3D
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 19:00:13 +0200 (CEST)
Received: from localhost ([::1]:34232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1WNI-0005vR-Nl
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 13:00:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Thomas.Lendacky@amd.com>)
 id 1o1WK7-0003gA-0W
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 12:56:56 -0400
Received: from mail-dm6nam12on2063.outbound.protection.outlook.com
 ([40.107.243.63]:61152 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Thomas.Lendacky@amd.com>)
 id 1o1WK3-0003OS-T5
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 12:56:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AK4OvKa0BnNd78DW/8dRgF/3kMRhzL9TPm911+s5vrKhVCp4uaexRDbuoVH7OVg3kC3NoE13ENfFOM+nlV/c8s8kDLEkZhv4rwlgxY5kOD/JSzZYbA83ZrKq4C0kE8Alho1+ONXEZPShU3r2jJ+s58aDFVDky0lrxmotiyNRThtmAOseG3OlCz1+RF110S5zWad5eHwyMZRwk8J84VezWU51p3aci53rg2cla2k5ST/5skpTwH2MdXMNDIn09deTMECQAiTOODV0VA99LIVFx2rFgAgocRINGwIftQyVMbWIqgaZb/Uaw7S3KZRzxep/0uW5KtQfz4n48fjjwoEW0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J1TJ/5o+deMhvfQxCpnNJ/tpb6pJOUdpF/iZGPo2CFQ=;
 b=QIAGxKoSJW7OrH9t8Ml4aDcLE1cN/xfWge+sVFjZa19YDL+Job/LVAyuxICQhjFruvzRJmlTY2IC8f+Hy3E6DdcNEEdvIwLWj9dTT6oMMgVB+QYN7KR9+3v3XbZWnaqDNgOUzmbQ7RVFSBzAOXEVKupH+0mf99oePCXwGBcVRviDLgdHRfY/XRrff4ONG0KSmHX8gjJPglRaFsHFHLfLmUBZsAsU8gOr2ghrZADtdHoM9EWludbV2cKHdzcCj9IJ0yMI/b26oRTKcV9rGskhd+qerKjdbfs7KUCsZQtq7tlmF7sf1K42Xifd4kV8M2XN+5BLaUMGygcEB9hwlXzNLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J1TJ/5o+deMhvfQxCpnNJ/tpb6pJOUdpF/iZGPo2CFQ=;
 b=fymhDwlIRxxUX/a7P0/UyLg2XRbk9BlALISLi2fYaxlRqhxuk6GG0UlR5zz6y3JKwho+WOK/9+9BwWnpg6eJzRGb1yycZV8t3Hj2Q7UKWrktfqbgfuV5JabOSar+7JAk8zJHpwMhE4fDFxHmFezUqh2PprYe2fuGxLIlGCZpiOo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5229.namprd12.prod.outlook.com (2603:10b6:5:398::12)
 by CH0PR12MB5313.namprd12.prod.outlook.com (2603:10b6:610:d4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Wed, 15 Jun
 2022 16:51:47 +0000
Received: from DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::db8:5b23:acf0:6f9a]) by DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::db8:5b23:acf0:6f9a%4]) with mapi id 15.20.5332.023; Wed, 15 Jun 2022
 16:51:47 +0000
Message-ID: <366bdc5b-8ade-69f5-892b-469eeef3ad9d@amd.com>
Date: Wed, 15 Jun 2022 11:51:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: New "IndustryStandard" fw_cfg?
Content-Language: en-US
To: Xiaoyao Li <xiaoyao.li@intel.com>, "Xu, Min M" <min.m.xu@intel.com>,
 Dionna Amalie Glaze <dionnaglaze@google.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "Yao, Jiewen" <jiewen.yao@intel.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Aktas, Erdem" <erdemaktas@google.com>,
 "Yamahata, Isaku" <isaku.yamahata@intel.com>
References: <CAAH4kHYyXv3x+89Ybnj7GXms2Bz2CNn5JK0+d6DzVtMz5owTrw@mail.gmail.com>
 <PH0PR11MB50643B5AEE5A399EB8AFB000C5AD9@PH0PR11MB5064.namprd11.prod.outlook.com>
 <843cb055-d28e-1753-5dd5-9d4565171084@intel.com>
From: Tom Lendacky <thomas.lendacky@amd.com>
In-Reply-To: <843cb055-d28e-1753-5dd5-9d4565171084@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR08CA0020.namprd08.prod.outlook.com
 (2603:10b6:610:5a::30) To DM4PR12MB5229.namprd12.prod.outlook.com
 (2603:10b6:5:398::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b68cce8a-6758-462c-a4f2-08da4eef55b6
X-MS-TrafficTypeDiagnostic: CH0PR12MB5313:EE_
X-Microsoft-Antispam-PRVS: <CH0PR12MB5313353C640DFC8DD7409ACEECAD9@CH0PR12MB5313.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VeFAx2JzkLSu6r2vY9nCk7gjx5j437+BM9fFXQu8b7KCDukZHVgkwE8dD2CQtOeIGu94DCZ9/fe9N8HORwA67dE6TEZRf2OjZKmaGjn5UFEpu+NDLTKcR/iQNjZqDb8yuJRSkvphld9GgKqixK84iZDb4ck0LBHwCY3o+R55/NeF+n12girPd3JSEXNcHAbB3oqC4iHlvOJzJl2t6S2QP8jbkQCpSATgDVKjcW3FWlGLTEXnebX5UKr04p7d0mMFRKxJSQ/IlwpU+g8fPFOpSKiOE+t9KDzVRjOGgdutO8Tnqk3E9Ylidv/6TfSRC6lt47EGTkCD3qFHyEIsmUFRbi9eMadQpmt6SopLT+mmXRXM+bbp9aoplsu1XP7sDKtHgfTcsUz5HMSOzBU8jjv+ojpPV/giNKgT5/7gjItTEYMPRLhdA6pIBWfEGB1nONKyO7j1srxHD9lEi5wCNfCBjmxneIhhaS7cGaZGxvC/shoK1y7bGw8yx9JPXRXaPzuEeETeJT7oQuWi1XytXTBCX/T7l77yKIBS/LzgSaiGhD0NrLQ95A54zCUwHSvAEohGysP5rkxY6PQvKQCdYwBibmuPmpve20YiHPCh67A2xjDehSpp2kjo+1m5r7TA5Z9b2OKGGleXS8giSBNgwVMdTrJt177RGlIKKqp0jvsz/ae3iZzReVyb3CR10jcLvMturnDjJONlgu9XwmLQUp8FExcRJZqbztro0Q64XSFRndgGX5JCCkF8HQbw5pN4ek4j
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5229.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(6512007)(26005)(316002)(5660300002)(53546011)(86362001)(66946007)(8676002)(66556008)(6506007)(54906003)(4326008)(8936002)(110136005)(31696002)(6486002)(508600001)(186003)(83380400001)(36756003)(38100700002)(2616005)(2906002)(31686004)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cGwyVm4yK0Vwd2hueGw1QmRNNXE1M3dpTGF0VmQzbkdZc3M5bk9GQ3pIUXZ2?=
 =?utf-8?B?RjBLOE9rTDIxcU13SDdlMnhTTlU2SUdVeUlrYm9SMmNsMTRtQjJxbEJ5OXI0?=
 =?utf-8?B?MkVyam9LRXBoc0pMRjRpeXJNS1VMUDlqUnAxUVRqMEI1eGRob055Vyt3UjIv?=
 =?utf-8?B?Ykd6RFRjc05KcTdlYWwrcXQxR21kQ0hDNTluOXd0VUk0MDZGOVMrcjZzTk1E?=
 =?utf-8?B?ZzZVUTRFZTlJSnJxSFZLRkZUNDlWd0xucnd0ZzIrSHU4NkRCWXU2bSt1TEMy?=
 =?utf-8?B?WDBFdlFEelRlNDI2NEp1V0VEVEt6L1NweThSZzBJdUMxS0ZVVnV6bWo5dlNp?=
 =?utf-8?B?eG5CU1NUTjFEZ3lzbGJkdzcrbkUyNWhSVkkrbU5TRmtvZDRnNzdXVEpGUUJD?=
 =?utf-8?B?czlqZGlXYndGYUpDcTB3Z0prL0gvanpOZXJ6YS9jQ2NrWVNjZlI3VHlHZ2FK?=
 =?utf-8?B?UDJIeS94anFRUVE4d0FhYmVRb0N5TDFqalowdFZDUXdmbzVGTllqNFQ2WXVB?=
 =?utf-8?B?L2NYWTB1UmF2YXZrR2FQam0xdlN2TlRBSjhaZW9IVkV4TDVhamVnS2E3SnI0?=
 =?utf-8?B?K3ZBYmJVRDZzRS8xbFNnZTd6UklMUks5c2V5OWc5aHVEZ3RmUUFQYXJDeU5n?=
 =?utf-8?B?aUlrRTVRZ0VHR1ZPWUF6Z05OcTh5TURDVUJIR3RpTG90bGoxODViMjNZOEQr?=
 =?utf-8?B?dllWTlJqMDN1QWQ4bmp2RUVacUUzbTY2NFRLanl0MCtwdFZqQXpMV29IOC8z?=
 =?utf-8?B?ellERE05ejl4UXpTWGMycXljM1BMalJsQTRGRy9ySGlGWWNMTmp3MEZRaGJi?=
 =?utf-8?B?K2tpTDRKVTJTNkdmNUF6VEpycUE4dDRLUitGK1h1KzI5aFBMcmNwSUhvWHky?=
 =?utf-8?B?dndaWDBNckd2ZW1oblQ4Q3l2MlN2cENOdEdPUWlsS1FvbGNuVktuUDFpSGFk?=
 =?utf-8?B?SEhsOTVObldOMjNUUnZIR1diL1Z3ZmxlRlVIcldzSmRsVUM2aE9KeVF6eHFv?=
 =?utf-8?B?cE1hM1pzbUJNNDBkZSttcGttc1FMU1p6aFJMd013N3ZkdGMvR2ladU1DQ0sw?=
 =?utf-8?B?RWJXVU1zSWdUU29oV2g2SkxvQitJVlZMOTNSc1hNM0F6R1ZvcU5iNEpyaTA2?=
 =?utf-8?B?SmMyaFVMdkhXUFlQZ1RNdW10VE8wb2ptRFc2d1UyUDlGaTNFVEVLeXVITy9N?=
 =?utf-8?B?WmNXZG1HdVRrSzcrZ1crYmdVdUlTMFpnYmQ0UVpraUY3L0dpNGd3eGxJN0ds?=
 =?utf-8?B?UHB0TDZtTmJIV3JEd0RHaU80VDVtYUM3VHBXL3JROVYwRjZoM2VaUmRHR2l4?=
 =?utf-8?B?TS9kVFloa25DN0RvUk1lL0s0c2hadWRHT2Vtb1VLWGFRMEtRRGhrRzZiS1Mr?=
 =?utf-8?B?MFBJTUdHNktxMzUyeWlkd0d3NW9QODFLSVpzQnVHd01qdm5UYyt4N3ZXYm5D?=
 =?utf-8?B?cmlnTmVZTHVsdzh3Q093R29WOFVvS1R4L1Y4STQzdHhwSVBpQXd5YkpJOHI0?=
 =?utf-8?B?K3V5QnduQzg0ait1a2FlNkNtNC9HNytmZ1pjUklhT1BoMnZpRnVhRFQ0ejht?=
 =?utf-8?B?a3c2ZE9TZ01sdmlWeGRFUC9zT1d6cXgweVBHeXlzYjhuZE9ISnRGeUgwcmEr?=
 =?utf-8?B?ZU0xbWFySkZ1YThxM2p6M1RxeWd3Sk5UZTVpYVVlRnU2bmoyRERzYUI4dHVn?=
 =?utf-8?B?V29XcTFUcG9PWGJHVWxNQ0ErL2ZoR1lCQkRQSjRGcUNDMU9QdVFzNlZWaWRh?=
 =?utf-8?B?ZzBGUkhrZnczdDE3SXJrS0Z2em5YZy9SR28xSlVwUTBybm02Ulg3RG4xTzY2?=
 =?utf-8?B?by9kV25lUWRZSVFKNE1wUXY5TkdJVUlsSUUyU0lXV0tJVmZ0YnNXYmdSbGEw?=
 =?utf-8?B?VThUQmZVV2RVcW5JTDJJVUdKdjNUQTRHMHcxQ2J6QVZOTVg1eGY0TnNHNWx0?=
 =?utf-8?B?c3cwWjBFSU5rcWRSQnR4UHlqWDhXM1hYdEZUYlFkdkQ5dmNTK2h4V1ZTZUVH?=
 =?utf-8?B?OFJJME80cUp5bmpSM2R2b0JMUlVIMHRPWTRXakJWUUZod3JsU2pFaUtkRDNa?=
 =?utf-8?B?NFhqL2M5bVpWdEx3L205cmhEdStkZmdIRUw5VnhWa2QyRUdTUEFPVjgvMS9s?=
 =?utf-8?B?aFNrdVZibmJBWk1PMTBtUk52VkNoVE5saDdEN2tkZ3dvRzVHbGU3VnlVcVJG?=
 =?utf-8?B?UUZuY3VhaWlKYmRZa21nc3NtVDZmc1lXQ1RtYXdmcE5lOFE2ZDliaG9Tb0ZF?=
 =?utf-8?B?Y2VrOXdGZzZLdHRwVkZpWFpRSDR3TWlZeWlvVEtSUXFOeUFGd0l4YllwMnhI?=
 =?utf-8?B?NkRNd3pOeWc2L2JUUDZxYzVZbFljNDhjM1MxOWZyM013RFFEazN5dz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b68cce8a-6758-462c-a4f2-08da4eef55b6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5229.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2022 16:51:46.9935 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mbWKbGXlsbqmIm2NIu9lHdL9n+jm+fR5HhSzmU6V0IewVfIWER5HfbBWA0trv8Q8BfQcmKKbDYc2FX21Y66fLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5313
Received-SPF: softfail client-ip=40.107.243.63;
 envelope-from=Thomas.Lendacky@amd.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
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

On 6/15/22 10:19, Xiaoyao Li wrote:
> On 6/15/2022 8:46 AM, Xu, Min M wrote:
>> I would like to add more engineers (Confidential Computing Reviewers in 
>> EDK2 community and Intel's QEMU engineers) in this mail thread.
>>
>>> -----Original Message-----
>>> From: Dionna Amalie Glaze <dionnaglaze@google.com>
>>> Sent: Wednesday, June 15, 2022 2:09 AM
>>> To: qemu-devel@nongnu.org
>>> Cc: Xu, Min M <min.m.xu@intel.com>; Lendacky, Thomas
>>> <Thomas.Lendacky@amd.com>
>>> Subject: New "IndustryStandard" fw_cfg?
>>>
>>> Hi y'all, I'm Dionna. I work on Confidential VMs at Google Cloud. I've 
>>> been
>>> keeping up with the TDX and SEV-SNP developments in OVMF and Linux,
>>> and some in Qemu.
>>>
>>> There's a new UEFI feature in v2.9 of the specification (March 2021) that
>>> allows for memory ranges to be classified as "unaccepted", since both TDX
>>> and SEV-SNP require that the guest VM accept any host-made changes to
>>> page state. We should expect newer technologies on non-x86 architectures
>>> to require memory acceptance as well. Operating systems are not
>>> necessarily going to support this memory type, however.
>>>
>>> This leads to a problem: how does the UEFI know that the OS it's going to
>>> boot will support unaccepted memory? 
> 
> Why does UEFI need to know it?
> 
> Per my understanding, Unaccepted Memory in UEFI is introduced for 
> confidential VMs, i.e., for Intel TDX and AMD SEV-SNP. The only reason 
> UEFI/OVMF reports "Unaccepted Memory" to OS, is a confidential VM is 
> desired. Thus, the (guset) OS has to be enlightened to know how to handle 
> unaccepted memory. And of course, the non-confidential enlightened OS, 
> e.g., old linux kernel, fails boot/hits issue if it doesn't support 
> unaccepted memory.

As of today, SNP guest support is part of current OVMF and Linux 5.19-rcX, 
but support for unaccepted memory is not. The current OVMF SNP guest 
support will accept all the guest memory and the Linux SNP guest support 
will terminate the SNP guest if a page is accessed that has not been accepted.

Thanks,
Tom

> 

