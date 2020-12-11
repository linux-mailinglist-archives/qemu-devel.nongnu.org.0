Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B88FF2D82A9
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Dec 2020 00:22:19 +0100 (CET)
Received: from localhost ([::1]:46994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knrju-0006fd-Ap
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 18:22:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Thomas.Lendacky@amd.com>)
 id 1knrJc-0004UK-JA
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 17:55:08 -0500
Received: from mail-eopbgr760079.outbound.protection.outlook.com
 ([40.107.76.79]:18150 helo=NAM02-CY1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Thomas.Lendacky@amd.com>)
 id 1knrJa-0004hQ-4h
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 17:55:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hfoUPUP+7gk+3prNgAL52FHpjjJdbgk3fTUcd8G9R0kpTKsrlIFx0KyyTCkJ69fkGXkKzn/WyhDZvB3RqauRJBgKdghVYbu6rGg7mqvW3HM/I6FM2vlraTg7jWz+weUv+Cx2O+qJMu98XIUAWCbZePwTtXcmmsncKVPFMRLLSaywloL2Rzzlrn8IXhP8X1XG5XdtXxSnsVpNJUM3+LXDWs8PcbGm5AwzbFqGvb7aqFi8EzPU5yPQfzycp4QpVe9yBYhb188XLiIpWPwsV2ySBAjh6yHBNI+71PWNKeOCt2+IotFQefN+KOLWaLmUcM0Qfnzmftu3K3YjS91bSdM8lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GPmQBOjtRqUhXiknSAICrpMIiY59bTrtBE3zGS+tyNg=;
 b=WlKBxRT7MpvjqVOfwCvIigl+73IP8jamAjuK/jWC5AqNaLkWV/hJbShyDvBztAR6Q3PIEe7ZpTTNUc5gxTH491zYYmA6YHXR3kcfchiCQN0CQlnnIJySkqoqQzOOVCblJntO91YZ/K62dnSosjx+bxw9pfMqCtgXZ1CRrL91gz5OmhyvtCooPITRFUQk4OYfCIAJ4XXsnDt+4bDt0Py50nucQOsjbEgEdukSLqmtmAWj8RwBvzxAhkcfkC5fbZNOqZ4s/DW2T4vu1DLDbg7rrs7DVsfjeXNkpOUZC87lEs7HPPrjjKu8ZQTpdk5lKzxWJbgBhwUshfG8I0S6OeCQgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GPmQBOjtRqUhXiknSAICrpMIiY59bTrtBE3zGS+tyNg=;
 b=w184XpnJX/bzgiG8FzfPCbmtEM6UrtN+wSizlcLWgrJZehvqJwy4IVs+momap1DmVVN1GMveGPSsnTF/e9XSMjfKd/atthOQcExdG+QLYRwCapsdofaNj5uFp0NMwHy2yZfrQ1sLQElV9X3gYCEdIbVEIN2SWBuu/YeCh6w4yHU=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1355.namprd12.prod.outlook.com (2603:10b6:3:6e::7) by
 DM6PR12MB4220.namprd12.prod.outlook.com (2603:10b6:5:21d::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.13; Fri, 11 Dec 2020 22:55:02 +0000
Received: from DM5PR12MB1355.namprd12.prod.outlook.com
 ([fe80::d95e:b9d:1d6a:e845]) by DM5PR12MB1355.namprd12.prod.outlook.com
 ([fe80::d95e:b9d:1d6a:e845%12]) with mapi id 15.20.3654.017; Fri, 11 Dec 2020
 22:55:02 +0000
Subject: Re: [PATCH 3/3] sev: update sev-inject-launch-secret to make gpa
 optional
To: jejb@linux.ibm.com, qemu-devel@nongnu.org
References: <20201209172334.14100-1-jejb@linux.ibm.com>
 <20201209172334.14100-4-jejb@linux.ibm.com>
 <afe66ae1-a1d9-c017-b05d-12247350338b@amd.com>
 <aa8ebbb5b14821bcaf1d599511f75060d9dcc460.camel@linux.ibm.com>
From: Tom Lendacky <thomas.lendacky@amd.com>
Message-ID: <0ef7d374-e284-4b11-3b10-301609f3495e@amd.com>
Date: Fri, 11 Dec 2020 16:54:59 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <aa8ebbb5b14821bcaf1d599511f75060d9dcc460.camel@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [67.79.209.213]
X-ClientProxiedBy: SA9PR13CA0200.namprd13.prod.outlook.com
 (2603:10b6:806:26::25) To DM5PR12MB1355.namprd12.prod.outlook.com
 (2603:10b6:3:6e::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from office-linux.texastahm.com (67.79.209.213) by
 SA9PR13CA0200.namprd13.prod.outlook.com (2603:10b6:806:26::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3676.12 via Frontend Transport; Fri, 11 Dec 2020 22:55:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3081e101-a5b5-4ba5-4c6c-08d89e27cb3e
X-MS-TrafficTypeDiagnostic: DM6PR12MB4220:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB4220C627D03F2E0D550A7CBFECCA0@DM6PR12MB4220.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2mfDZCeq7wgTPAcU2WA2z058f2TB6WMQnpSzFqqYQpILL84G59JGzIsFl8d19SRhdYDBXSRYbZIzMT8ikKFntOg/M05NKE3jHcWL1ed1QhutNoTpPyQDY/D704UaJ99OtnRQx1tx964n87MYJkTWNZDl8OnO5uRYU3IiR0CkYahJ3FcMyPDVTg9jB1W0MJsHHp0mEShm+f5I+Z0tU4/dmdM+MrO3Xq2cnvCXBfRLvy942zNKTCdKJwnSea6ax5H+t80Xbp3UScpqT6ClLOEkYmsbp0Dh4r6tw8FUAEc+/95U7M5zUy5lHNac6dCylgBX5z1URCiBVSfCobhmEdJCJLXjd7tHpqF7LuMlAWsT713RuDko+n3pmUIR0XmlHObFrX8n03YpJaGKI2Oh619M/VG0C89MMd33+xyzxTRCHsTROsYez8BHw6keEN7lK4BMvLCsvqvIgzzCWMdOTWzZmPMCrys6oT7XaoCHSUV+7ki6tV/gaktIi4gr4s+kZZ/x
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1355.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(376002)(346002)(31686004)(31696002)(508600001)(6486002)(4001150100001)(53546011)(6512007)(66946007)(52116002)(956004)(2616005)(8676002)(8936002)(66556008)(86362001)(16526019)(54906003)(7416002)(186003)(6506007)(4326008)(66476007)(4744005)(26005)(5660300002)(2906002)(34490700003)(36756003)(14743001)(219293001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QmJ3WTZDNHhOWlRac1plRXVOUmlGZ2t0ckd3T2tEcEdrUUl4UDRpZlA0K05C?=
 =?utf-8?B?alp5ZVhlZVBLTVJCd1Yxbnh6dVp1a09Sd3dqaStqWmZTbFZzNjN6Q1lrNk5S?=
 =?utf-8?B?RjNYc3BzNGNTV3ZqOVBHVzJlREtOS2NBcjNaRjJNdVJmSkJWL0s4amRlWE5S?=
 =?utf-8?B?bmFENkpENk1kZW1zMFZWNFFMS0FwY1Mya0xVbzFOZUI3YW4vTGhNOUZLYWp0?=
 =?utf-8?B?Z1VzdXZaS3FaanRmdUlZcUNIbzkwcXlTSWtrWWdydk1DQkxncks2b2IvcWpk?=
 =?utf-8?B?Ukc5V2hxNUIybDBBS0ZpOE9MdDNndlBVaTVyMVg5eTJvL21KbmtvU2tJMEhP?=
 =?utf-8?B?VjRaZm5LczZHdklZVVBWaVRTWWlmNS9KakN3REFGTHVFSm1waFV2bmlJR3Ez?=
 =?utf-8?B?UFNCTG5DRWpXTzVTNXdTZFo0WEdlZUFMcTNTTWptT0h0WTVoMjR2Q2pXYU00?=
 =?utf-8?B?MTI3UmZmVUJrTGRYRms3WXlkZWJ4aEg4U2hyVmdNYzhFdVdobVRiTldnQkd3?=
 =?utf-8?B?cG9pMUR4RlJNdUZtTVpacVM2RHBYK25yaVNJYmpOK3p2SmlIeHJzdXF5UlZw?=
 =?utf-8?B?dFNpNEJxYWNHVXNiMXowYU5mT2ovU1dUaVJFYis1Qnk4Njg1VnVjZzBUL3ZB?=
 =?utf-8?B?MFJjdG5XSUgrZjc4dnlUSXl5MFQvMzNMWXN6K3dxM2pzZGJkTExkVCs3bnFz?=
 =?utf-8?B?cUFrNi9rU0ZSR1BmQnRtdmZOT3U4SmVDT3JRbHFsWXhaRTRTWUZYeHM4UWl3?=
 =?utf-8?B?bHp4cGZac2xqY3VLb3V5MThuSXIvT2FCSTU1WkIvU3ZzZTFCbWFSWWVsZ0xO?=
 =?utf-8?B?aEtaNEN4YUFMOGlBaCtvWWJWejJDUllTZ1BPU2tOMlNLRmdmeEpTS2c0WWRW?=
 =?utf-8?B?UUJrbDcyYVFjaDVzVkUvN2FkMHJnY1VLOFk4VGRabzlsOElSakNKNDQyMW53?=
 =?utf-8?B?bm1tZS9aMTZTaitNWVZvZDFEOUJ4VTRFbHJEc2pNYzhzV1NRVTFFQUh3ZTU0?=
 =?utf-8?B?MzRBNXVxQVRxMCtKSUthRWtnSnBpWmI0QTYxeEJoWVBUZlhkTUdtbEUyVnF0?=
 =?utf-8?B?ZysyTWdXbmZHVDd6VGZwMWVQT3ErVUhsVFREbUtib3JjeFVwa09mY3BkTEpF?=
 =?utf-8?B?MHBxb0tzR3RCWkIvbDlBTUN3WjlCS0pHa2QzaVZJdHVxRWk2YW5WY09iYmo0?=
 =?utf-8?B?QkRlYllqYk5sdTF3aU12WlBjVTIyamdIZGVYekFDakx3NmxtQ29URzB3RHVv?=
 =?utf-8?B?SHh4bll6YUViQmVVZk8zejRON3VyeEo5c2gxUXc5SmpBY3VxMG1YUE9nVysx?=
 =?utf-8?Q?MGZBwa19s7v/wZvTpd5Qo4J5IQ7QJ4sPBG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1355.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2020 22:55:02.2836 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 3081e101-a5b5-4ba5-4c6c-08d89e27cb3e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: re/z+dO/9XNgKg1mElcmY7ozZDYx0tNTv9Or3L5xNtNIMQ/Hpx0aZ3UTD1ztYm7ADO9wX35AYT2OwTsOdYhIQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4220
Received-SPF: softfail client-ip=40.107.76.79;
 envelope-from=Thomas.Lendacky@amd.com;
 helo=NAM02-CY1-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: ashish.kalra@amd.com, brijesh.singh@amd.com, david.kaplan@amd.com,
 jon.grimm@amd.com, tobin@ibm.com, frankeh@us.ibm.com,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, dovmurik@linux.vnet.ibm.com,
 Dov.Murik1@il.ibm.com, pbonzini@redhat.com, berrange@redhat.com,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/20 4:45 PM, James Bottomley wrote:
> On Fri, 2020-12-11 at 16:00 -0600, Tom Lendacky wrote:
>> On 12/9/20 11:23 AM, James Bottomley wrote:
> 
> So for this one I'm not checking the length, which argues it wouldn't
> be subject to the added length new data rule and I'd have to use a new
> guid for new information.  However, I could also see situations where
> you would check the length and thus would have the ability to add
> fields (either at the beginning or the end).

I think this paragraph explains it nicely and a slightly expanded comment 
with this information would be enough.

Thanks,
Tom


> 
>> Whatever we decide should probably be documented in both the OVMF
>> patches and the Qemu patches.
> 
> OK, I can add a comment about my use case and you can add one
> documenting your length based use case.
> 
> James
> 
> 

