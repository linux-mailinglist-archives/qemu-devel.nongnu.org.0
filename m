Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE05B65DC03
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 19:20:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD8Lo-0002AO-Vy; Wed, 04 Jan 2023 13:18:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Thomas.Lendacky@amd.com>)
 id 1pD8LF-00027i-H9
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 13:18:29 -0500
Received: from mail-bn8nam12on20626.outbound.protection.outlook.com
 ([2a01:111:f400:fe5b::626]
 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Thomas.Lendacky@amd.com>)
 id 1pD8LC-0005KB-Uc
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 13:18:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aVUyx36uQ4FWGrSZhv7aVEAymrjseYWu1bGS4+DZReYbvPEg3uGT0ofWZN4vAfwuhMYtV3tiv9Ei0LzXv+DxDanqrP6LBwuvS6ERX/IrfzELXzN7dVn+Jae6x0KUXAB/ENybWdDhk8fdyz0wsxExhYvu0fUmX/DMJVu7rDKNoXx8Qi5/u9aX0I8/LftN/oLBec0e791bRHeNKzRgSqfJwWohWsTzQXaLxYY2VOt1xPxCPOiiYmtyoCfq5Ep8WuuddOI3UMoIUP2IxLoEv61wtQKXN40+K81U9hn187FBIBbsaOZsNPEzM0s75XX/DC+6bd1k0aIfY1oMhkRLhH1qtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8vvhZZqCLKxeWCM6/Z8Mxafq/lAaAJilH9DCbQ/O31g=;
 b=No+LbzG67lKM0fLdGOJbNFJDQ5g8r2hjuYK50oDtuBhEJVWT5ul7qxpnl8n5GPDEMATFrzK6yJjMosn9P+MFJlL4KPOeEF3Kc9vKIpsMQmJ+3/nIdWQTj82c3LFc7WU7CAGPADUzMki2p6LnmW27nmIkwaRnCLotUS0C/tHvJz9tefx4ZC1IZpb2D5I/ODULJhtOqRuDZEnDGW//P9AxvN0a0FWv+YqzaRVOwqmXeuCjGE78mst2YygqjyXQfS2sHAX/hIYHOiPrEpE+HlVmiRR2H0Z/z3fKGJwVCZ3+SuJyL5FIj4yH5Wkae4xOtI3gHcHYPlU39hAlgOhbNSXnBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8vvhZZqCLKxeWCM6/Z8Mxafq/lAaAJilH9DCbQ/O31g=;
 b=DXbfyfcDtDLP+7JykCK+l64rEF0Y8psL+KJ/ezF01MQFb5N2wMz1vqdhlc11kdyxIRmZnToCgCytKTe2pBwhumhnobZKgwgdT+K2VUBEtXg2KXfbr1bjVDfkcGj7SJUSIjWqosNFAdlN+Zkcx3KG4ecrL3G8tbzO4r6vXRBabuI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5229.namprd12.prod.outlook.com (2603:10b6:5:398::12)
 by CO6PR12MB5412.namprd12.prod.outlook.com (2603:10b6:5:35e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 18:13:11 +0000
Received: from DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::8200:4042:8db4:63d7]) by DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::8200:4042:8db4:63d7%3]) with mapi id 15.20.5944.019; Wed, 4 Jan 2023
 18:13:11 +0000
Message-ID: <82c766a6-fe48-fe01-a3ec-5adb320fed75@amd.com>
Date: Wed, 4 Jan 2023 12:13:09 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 0/4] Qemu SEV reduced-phys-bits fixes
Content-Language: en-US
From: Tom Lendacky <thomas.lendacky@amd.com>
To: qemu-devel@nongnu.org, kvm@vger.kernel.org
Cc: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Michael Roth <michael.roth@amd.com>
References: <cover.1664550870.git.thomas.lendacky@amd.com>
In-Reply-To: <cover.1664550870.git.thomas.lendacky@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0102.namprd13.prod.outlook.com
 (2603:10b6:208:2b9::17) To DM4PR12MB5229.namprd12.prod.outlook.com
 (2603:10b6:5:398::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5229:EE_|CO6PR12MB5412:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a9df9f1-af12-4efa-46ad-08daee7f5729
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jvnPUqeZw69vbcfcXOMGbaUSuV4Fc4d1exbdng36d4aX78/iGQC65+K/ryezPLCbHPDk2o6q1Q105tRAMdPqFq3aPzbj7ra34zpI5GJeG3oUof+hawgx2kw2/dFnidOL7pju7u+oUPSYCA5/w0pwoH7IpPGIDxX2UvHoiX5KvVLluNcZRNQuLRe6oPplil7fxp5Njki30zp7d7CfL/po8uJ5mfMQew/cgIpBhlWgBCoNs6/Qx9nMR9HhMziS9PlXk7MtJKLImVIWbkbyHg+tfje0YaRjvHqeXIARFuxyALkik/54zmlxo5JMJuDpZECMvD7AkeDnmyAu/GLHxHX69BMO6yMVofsBFkviuAmX89wXj9CNma86aFtAxyS3gqo1Wn/bTGCETyBCf/O9AnSH1Qc1aX9kDdqpko74KS1dI/lX/PVqXuLa0dvR8EXX1DVNaRcuvLt/AqfK8/3PhDUvPu7krLvH2g9d/wsjt0qE8UpOcKALT0Jps3Q9WMHyzdcWw2XAUNeGb+HQPzCUb6PEJ/ZM8IcsjhyHga6ncZksT3dnop0kOVFYVI8IYyGsuYNOn8KeANncXdnt3eW02oV1wzLkRzgi9NWHl0f3tEKkL6U/Lxr4TdZB9I2HvzBXic/irov3IlFXiG8Cu/cOhLKmob0c6LQ2Tf2XhCLjmyr755eWMexduLd/KmWaHimqRKKv04rpxMrF9N63xnbDGhY67aJjcQ9r2AAgP6OfZyfq6SfwJ8bvkG9fcHxa0O0EjwbSM8gTQTfu1H33jL7DxDiiOA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5229.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(396003)(346002)(39860400002)(136003)(366004)(451199015)(83380400001)(6512007)(26005)(6506007)(86362001)(36756003)(31696002)(53546011)(2616005)(38100700002)(186003)(316002)(478600001)(4326008)(41300700001)(8676002)(2906002)(5660300002)(8936002)(66556008)(31686004)(966005)(6486002)(66946007)(66476007)(54906003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cS9sYkxzVnl2THdMUVFjSW9DUERiVVhSdnlzMjVhSytkYkVLam5OWHNOQzl5?=
 =?utf-8?B?RTQ2Y2FDa081TDNySlVlYXEwSG1BUWxyZlRqbmNSNnJhZUVTMVFNdDlRZURG?=
 =?utf-8?B?RS9mZ21KdDRqTXdaZFVEN0xhczZTUUR6OFJNTVEzNDJGYkxUb0NsL2dqTzZW?=
 =?utf-8?B?VHZ5WCsyQ0hnb3BWU3FZbHY1QUxzd2tOOG9aNkJqOWlBeVFNa052SXFPckNQ?=
 =?utf-8?B?SUVaZDlNZFNWTUZmTm5RenVqb1FQMExGejJFandVMGdnSkhJbDZEMnZBSTlF?=
 =?utf-8?B?RGkvUHZmdzBlZGE3Q2V5N21HbzlJcFIwNTVDaFR4SkxsVHFxc2x2TW9hOFpt?=
 =?utf-8?B?Nm9BRE0yWVk0c2NaS1M3bEZyc2ZwVEYrWmppNEM5aTdnTm9MV3hEbnRDYzR5?=
 =?utf-8?B?cVNsQVZPbklVaysvakFPeWJ5M2oyWEptN0VPcVpqNTBrQ3hiYVR4cFpUUDRt?=
 =?utf-8?B?dzU0eG5MSUlTQ3FDZkppbFVsaDlRM0pjUldtOFJsT20xYkV1QTN3R1ZUZHNx?=
 =?utf-8?B?aXgwTHU3dFZOdzlxam5DaktWaWdBV0FPNzVFVTR2N3p2SnNLVmhkVnUyUEpo?=
 =?utf-8?B?aGRYeFM0aDJtM2lWMktCYTBjTjZUYy82ZXAzSjRYZFdKb3ZhaDhQbkdUWWJ6?=
 =?utf-8?B?M29SS1A0RlozNlR5ZGtXaENiUit3OEo3eC82WnRjWGgzdlh1SHpZbEdLcHhL?=
 =?utf-8?B?WmpDWEVUSFBwSllGNFZsOUQ0RzNndC9sVXY0Ly9ZcmFXdlVBSDRXeGd1d2Rt?=
 =?utf-8?B?SmpncXA5N3pBRytqRHpuQ1pXdHZYOGlTZFBJYXdNbEFTOHUzcWk1OWk2SDQx?=
 =?utf-8?B?ZjhETW4zaG5LdkZHSVozdUdMdkVaYXZPZHFvVmNxR0xpNCtRNS9JRXo1Vm9m?=
 =?utf-8?B?Tit3cGQ1cWgrV0oxK1VRcWNpQ0E4SjlpRUhQdHYyeDRESncxQ0E3dm5CT3lj?=
 =?utf-8?B?N1FiQTB1TGtTYWkwSUI0STUxdy9jM1J0Sjd4L3dCU29tZEZzeXNydkFpaEJD?=
 =?utf-8?B?dDF1bi9ONnRWSEdSaUVqdk90N2gzNkhNcEpEZTNVd3VjU1ZTK1lBOElyeS9U?=
 =?utf-8?B?aG81d29GYllxdmVaQWhuMWlya1lXWUpIdXRwbHBuUVFxVGlQU3pRZURvU2Ex?=
 =?utf-8?B?QVUrZXVlQ2lyT1lUZ2xyRXVDYldRdUZ3V2VtaWY1SG9VK0tmalpLRWN4cHRW?=
 =?utf-8?B?U05pZExPZDFDT0lmdCttR2RvM2RaUFZlWGV6K2pSKy9sdCtxMGoyZXFtTHhG?=
 =?utf-8?B?cGx0YTBLTVNhUUpBUVc4MWpLWlhPVHFXS0Q4cFpkWE00L0xLVmprTVhVTnNO?=
 =?utf-8?B?MGh1b3dFV2owWmNrZkdBOCs5amdGOWVuNFBVT3BiNStpak4vU1N3UXBtT1J1?=
 =?utf-8?B?OXdlNktsMUxoM2pYa2hXRCtodWl1djVIWXAvbXFEWFoxVzd4TnJTSHVqU3FQ?=
 =?utf-8?B?MWYxRTVJOURKVkhWRnMrSlgxTzJkeGYzcS9zbS8wVEU3QTlLcDlKbUpBMmJt?=
 =?utf-8?B?R3hDcmduRm9meWhxTkg3dU94TDRnaklSanRzbWR0QkEwNHJlZ0tXSnI3Wit6?=
 =?utf-8?B?M1VqVDY5clRZRW1TZmFFNU9IS1JydzFwRlFLaXl0ZEdlY1RBNHlTZHRZTlE1?=
 =?utf-8?B?R2NiVWQraUVSZUk5ZENlMlgrMnVXeXpjSC9JTEtDYTAzTDFvRTJmdlNWdUhv?=
 =?utf-8?B?RHllVzhON0RvZ2JWM1FmeDJtRGdrOWE2VDFGYVRveUM3ckJwMTV0VzdIUUM1?=
 =?utf-8?B?VmNRcW1DMzZtSXExdHFxRjVNQnNtTVM0SGpjMWlqN0Q2eFlJQVUzMjczWnBO?=
 =?utf-8?B?dXBBMGZNazREMVYwS0NGVzZjTWxYb0FYakFsV3Z3OHFzbkJKd25MaHNnWnVl?=
 =?utf-8?B?cmU4SHVxalI4dEVabnhZK0E2YU5EcnJVR2dhRUZXUC9XbXZEZ1BKRXFVaHBj?=
 =?utf-8?B?Wmtwb0JTaGU0VDgzRkJOV0FqS2U4MWVZTkd1dTE1SXZleUhDYnBLaGhGRWtu?=
 =?utf-8?B?RGNFc0NSMXRZalhsSnJiVjM0cnl1TnVoUHByNU1ib3A2aytaay9pVnhkUUp4?=
 =?utf-8?B?WDVxd1hCUWE2elJSaWdLL0Z2Y0VRemZKVkhzdUxpdGJ5UWM2WUZYaE9Jc0lI?=
 =?utf-8?Q?jxcPnjKYxhD78FvVTUpeeYj+s?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a9df9f1-af12-4efa-46ad-08daee7f5729
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5229.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 18:13:11.8020 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jOXHgg6Jieu4isOkK8WGGjVNQEXTLtvWmoXrXKubiYbCXV9IYPGAA/183n849dJ6A1P/IfwPb/XbvnOR9o+rVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5412
Received-SPF: softfail client-ip=2a01:111:f400:fe5b::626;
 envelope-from=Thomas.Lendacky@amd.com;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.708,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 9/30/22 10:14, Tom Lendacky wrote:
> This patch series fixes up and tries to remove some confusion around the
> SEV reduced-phys-bits parameter.
> 
> Based on the "AMD64 Architecture Programmer's Manual Volume 2: System
> Programming", section "15.34.6 Page Table Support" [1], a guest should
> only ever see a maximum of 1 bit of physical address space reduction.
> 
> - Update the documentation, to change the default value from 5 to 1.
> - Update the validation of the parameter to ensure the parameter value
>    is within the range of the CPUID field that it is reported in. To allow
>    for backwards compatibility, especially to support the previously
>    documented value of 5, allow the full range of values from 1 to 63
>    (0 was never allowed).
> - Update the setting of CPUID 0x8000001F_EBX to limit the values to the
>    field width that they are setting as an additional safeguard.
> 
> [1] https://www.amd.com/system/files/TechDocs/24593.pdf

Ping, any concerns with this series?

Thanks,
Tom

> 
> Tom Lendacky (4):
>    qapi, i386/sev: Change the reduced-phys-bits value from 5 to 1
>    qemu-options.hx: Update the reduced-phys-bits documentation
>    i386/sev: Update checks and information related to reduced-phys-bits
>    i386/cpu: Update how the EBX register of CPUID 0x8000001F is set
> 
>   qapi/misc-target.json |  2 +-
>   qemu-options.hx       |  4 ++--
>   target/i386/cpu.c     |  4 ++--
>   target/i386/sev.c     | 17 ++++++++++++++---
>   4 files changed, 19 insertions(+), 8 deletions(-)
> 

