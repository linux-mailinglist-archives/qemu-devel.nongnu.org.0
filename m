Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBBD6D1F71
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 13:51:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piDGF-0008Uw-VO; Fri, 31 Mar 2023 07:49:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1piDG8-0008Ui-Rg
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 07:49:33 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1piDG6-0007XV-UP
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 07:49:32 -0400
Received: from pps.filterd (m0127837.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32V6Z2hh018497; Fri, 31 Mar 2023 04:49:25 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=8dB6ub0AIUWmRxWVOsUThkSZhnICbIbbha4+aZA/DV0=;
 b=Wey0Lfpv5txUEonvYoX6c/jEUepm54l8Z95h0LEjzow+z8CJovK60Io4wn0E0niIQGvt
 YtlpHFTCNnXgP1uwoTxcr+Wbi9UgkGLktkfQvOioZbQE3wfZJyCZiMomWRC9mR39mBqh
 xUr6YJPmlVzsiaNcpXOCCkFi7ihEZSm5XU5PP45jVScx/lvi8GtzAHjOW5sZbRmtsgD5
 rvZW9tsz/KRF983yTAS8fNk9OmRm6JtHa5DeL1DzHFoObL6kDrv0l28NT2F6EwsfX143
 888VqDQ2EyCLazBGD4wRINCwvdnfPJtYJUF5bBJ/4dESwan4PuM3mBgCuguFxl3KD9yD cw== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3phvv9mvfn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Mar 2023 04:49:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DajhvK+MkRsVXuftsueO1l9l7NGj4gBXVgG4h3QyEm8i7PEZrfzXXv3RqE/wbcuH3GAdrhAPjdrBIRz0+5lZn6W13y0bUQtcJM+NWSu8E+sfibIF2o5vc154ClPwJKsTMqaPoS/P76k4nmYKnzLoW4qavbAYhAJPtWWsEgxQZ/z9+yyk13LyctRnEV4DcqwTQ9ozMy+0ENoRIzVLO3V3MQp0e7DdXBx9/qIoHrWdYfucCXA1iJhFaav5d8EdzPuscagxubnhMAL/FW/tlqbEDaWNW1DKVY0BE5ykZdtEF/40DRkJY5zAp85IeJDmtpli4irq2eWvb81otR2BI3LUQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8dB6ub0AIUWmRxWVOsUThkSZhnICbIbbha4+aZA/DV0=;
 b=Qc+AYVsuWBeOYOHC9fcTV4x+G87pR9RCneAmBGkzcjzE9zI0IXZ8pmb/e0eQRVuusVZW3nxJILpcM0WIt8/fvN9SO2z9bUEbGaZGh25VDXQXqCdP9Kx6dGzdCZS+UYroGcapdRdcYDTwOocYnCltShzwrE4Xy58N+0gqX2bnPz9Rv0P/NRyyUdarmfE43KoYsd/gx7ankndTHRDTYeAw9+eP+4OnRzHIrjpUtshPsW95sCWPgYKAHKZnvtIERbsabdSSumF/bmXgenPvdDl9VAuQvn/aRbJx/kC1/IenZKCEqazsQIUzCMdWWDkEvbxlWjQUQxk+yRYE2q49ge9IoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8dB6ub0AIUWmRxWVOsUThkSZhnICbIbbha4+aZA/DV0=;
 b=EaC0sqtUbyetr5izlugqftmqip7g3eS41ic9GonYEZV/BhXJe43VID36qj8/5sSwp8iSFlfbpFWXpNoniGUXfwVxWMQxCJ+RHLS9NpETYUT7zdnJYy20GkbrDRFYYTsk+XyUCkNmuFRu0X7LUKKchtg1FTMloypapCCuxDeMBsSdqRPzsguCTsD2WGyyoKzaA63ccaHYRhKjEBzJYD1xTdEfapNqZJ13pmeNx6u05iujbLodJIK3tR+thdUht0dGcdz7Gmm44fDREv7vZKkAY5gSpjvTtOPGy4mCM+92YnJwMYL+bilUeemMilICsp36kMZgJWy/lwUOI630s2vJBw==
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by CH0PR02MB8089.namprd02.prod.outlook.com (2603:10b6:610:109::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Fri, 31 Mar
 2023 11:49:21 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::70fd:8d15:bab8:29d6]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::70fd:8d15:bab8:29d6%6]) with mapi id 15.20.6254.024; Fri, 31 Mar 2023
 11:49:20 +0000
Message-ID: <deee0bde-86a7-5264-550b-a8650aaec88d@nutanix.com>
Date: Fri, 31 Mar 2023 17:19:09 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH v2 0/3] qapi: allow unions to contain further unions
To: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 Michael Roth <michael.roth@amd.com>
References: <20230223134027.2294640-1-berrange@redhat.com>
 <87v8ize5j3.fsf@pond.sub.org>
From: Het Gala <het.gala@nutanix.com>
In-Reply-To: <87v8ize5j3.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0168.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::23) To BYAPR02MB4343.namprd02.prod.outlook.com
 (2603:10b6:a03:57::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR02MB4343:EE_|CH0PR02MB8089:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b7ec04d-b7e4-4f99-9f4c-08db31ddf677
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E39UIl62QFVBCdG7dLsfYmJlcdWM4ZACGNOFyG/8VNnATJ+IbJx7o1RqlaLDtY0VznDykWxSbGcvHOT2JGwvFYsk41clNOrIL0WoSqugcTKCYxYuZHFWEkyFIKWTWbHx5Hr2ItyXbGcy9IyTnNnjO2dpaKb1bLhj7zQC1wnUZPqdg8xKtf2XaZNfeV9UntJ+kffwADYxji7lsCT4DWAiZ1k1HCC3OaJkm5zeC0iBjgRi8P4/s27b5ek3zxD5spVqbbQSC0zcC73BOH+FU8gu5BiRLzGcp8RHTafmiX35RNWgKLQplMAJjpHoI7dnhH3GqSebzhYnnG5wZXBwnFRPxXlz7vyS7tcZyVmDPqFeIvAT25n/RZ0J9vJnd8s+Df2yzKFeX9gYG5xj5q0uAngHGMHOoQQXg/0YbluvYkIYpCAelh1aFshFbBsMVlcz8yUaQZgk5i4yihNEuU76KxXOL9nE9V8SCCWeMXiIV21zCVaF3HzrZ7/XMzR4/bllI2u3X8nducNUlC9ErvazCo1p3IwPEABWjdSsjB+YD/UwHZ5zCdXMKSC4EmmOEjP1JH7VTVKex9YhO7DXaGtI1sBizLAOVRZ95mlRntLpC/FDPjly/XlHds3ZkXrDCPfQVQQhIscKx6700vZbxo7aoCRC/Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(136003)(366004)(346002)(39860400002)(376002)(451199021)(41300700001)(4326008)(66946007)(8676002)(66476007)(8936002)(66556008)(36756003)(2906002)(44832011)(4744005)(86362001)(83380400001)(38100700002)(31696002)(186003)(5660300002)(2616005)(6666004)(53546011)(478600001)(316002)(6486002)(54906003)(31686004)(6506007)(6512007)(26005)(110136005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ejJXbDRUeUs5a3BQMmpzODl2bnRkNzVPT1ladEFEeXRjckYzTUJSSy9SYUFJ?=
 =?utf-8?B?ZW9udjdleUV1dmM1M1NFUHdlbHJmUXhhODRtaThHYTRiN1I2OU5rekhaOG9T?=
 =?utf-8?B?bWhyaEVodHhkMDZUWkFicnJJL2JjWDc1NHRFd20yRHNSdnhDQjh5RG9XUERQ?=
 =?utf-8?B?VWdidm5jVUlkSDJMajkwR3RmTmIyeTNIWWNkYkZ0dG1lamJ3UHRhcW05dmZN?=
 =?utf-8?B?bG1kRmlPWm03ZGlKY21CT0xGRkUySHMweDA5eW8ramZpSGFjTnZyZElDREpT?=
 =?utf-8?B?NnVuZlppR1phamhEc1RrYmxFNFNMc0pwYWRnYXRtSUcyYmhKZWtnNnhFUjRE?=
 =?utf-8?B?dzcvZlZ1ZVNmNUpuV3NPUzkwMnBMakI0ZHhvak1wS28zYUYyang4VTIrV0Fv?=
 =?utf-8?B?SzhPeTZLUVBjaUIzcGQ1UHVaeEV1Yi9rRVI1cllxaXRSUmE2dVlhT3dhSHR5?=
 =?utf-8?B?dklUVXp3c0xKcGpBUVBhTzNxeDdkYzBVNlZ3VjNaMldQSjluMXVSbTlEMThr?=
 =?utf-8?B?MTZaRWtNOVRhVDZ2VVBUYmkwblNQTzFHZVZ6R1Q5VGt0QkVYanlqazNUTVNa?=
 =?utf-8?B?a1RLOGdwdWhDK1RJS213UXlhaFBEdTRRU2RtanN1bm01RUJZQzZKTHpWMkpN?=
 =?utf-8?B?M3JZbFAyVStDZDhJVC9tM0tETXFaL1VzZ0FHbnpxMlBEMUhsb1pEbnZzMEVm?=
 =?utf-8?B?Z2RtWklvSXlEYVd5U3NZRCtWUVpwT0Z2TTVNcGI5VlNLb2M1UCthaXgzZUpy?=
 =?utf-8?B?NVpyb2dlM2daTnl5c0FuNWJNTEtrVzQ1dFF1SUdad3dsNUE4cHk3TmpMRlkw?=
 =?utf-8?B?K3BzVjljajk3UnVZMlFCZENvenZKNU1iQkh2YXJ4MkJ4ODBHZVp2K2lIdlUr?=
 =?utf-8?B?QUtwNXplZEo5Z0c5MWlBTjB2WHJjTlArTjhISTVOVHJtNFB3Z212OHQwb05L?=
 =?utf-8?B?bjhRR2FONWFUMjZ2dllCUDBZaGJGZjRpc29WSlAzVEZTL21MYVVzMmJJMVJV?=
 =?utf-8?B?R1VXNEZvWGIyeXN0TklvalpEMHZXSzhmZWlMZ3g4djluUU1jR1h4a3dJRndS?=
 =?utf-8?B?aE1FdnBPL2p1b3JSR2hESE1xVFRuNHJSdDEzYmgzRFBvYTJDUnFYbVIvdVBL?=
 =?utf-8?B?Y3BHRXJFWENzNEs3aDYvQVdyTVZXNG5VSWgwOHNwa01ueFluZ05zWWpRRzR5?=
 =?utf-8?B?OWRzWDVOOHBPMTJNMUN4clExTHhaVWpidmIwK2IyMWN3RUhtSEpvNU1ob3lH?=
 =?utf-8?B?ZjhoeVpidVZoMm9zMDg4NmxYc1Y4MFBQb3UzTXBZc3JIRUpQY2l1YW9XOGRi?=
 =?utf-8?B?SmVCWkFIbCtZYUtOTXVGa1UxNlZ0dTAyMkV1V3h2bzJHaUxHVFVJRUJWa3BN?=
 =?utf-8?B?Zkh4NUtRQ0JYcmplUVhFTWRkVkk0aktuRHM0aTduSnlZVmQzRGlJMzZzK0dw?=
 =?utf-8?B?VVlqTXNZUld2bG1oMSt4T3BpS200WWxNL05CbWVCUjFqemF4NmV6M1ZqQ0tQ?=
 =?utf-8?B?eUxKVFcvMFZMcU4yK0pycFc4dlZlOXBSZVh2dkpUbGc2L00zWXQyM0cyQ1I2?=
 =?utf-8?B?S2c0VHJQMnZpc242blJUV2ptejRJUUMxQ0xsaVd2a2ZwUlg2emVlSE1TZ2Fa?=
 =?utf-8?B?Z0NPb2FSbWNDNXVGOGRqMExiRHNCY1gxem5pQ3NrV1czKzhEeVJTREFZVzdT?=
 =?utf-8?B?RytySS9EYzFJZ3VEY0pBSytmdFFralduREovSFcwakh0TklZMU9zd0FOSEN4?=
 =?utf-8?B?OEd4T3Vsd29OQXZIajFGc0FWbHZBNFFlc2prSEM2RkF3YkNhVVU4VjF6ZFk1?=
 =?utf-8?B?TklKMzZwdG9LZmU3ZFpzeERPdlo3elEydTRjSlJ2bWNueUNxTlkybEJ2Smpj?=
 =?utf-8?B?OXIvTUhyODNqazNDTHBJMkg5dWFFNHh1QUZmNk9HUitibFFWS0RxTXFnNVBP?=
 =?utf-8?B?cmQ3SWVnSTN5dVZNTnl6NTZMUXhPdlZGaTIwUGsxSEdFSEZJNXpJNHdBTXRO?=
 =?utf-8?B?R2tLWVR1NWpDelhnKzBucUQzZVJ5amVLSTQyY2ZXNVZjU0dGRUkyQno4UEF0?=
 =?utf-8?B?TzlzWjYyUS9jbkhuOEZBckM5TDBDWVdDbElOQ3c4TkFsVXh5R1pmMkpYQmNp?=
 =?utf-8?Q?ecBDsd0a1iwqEW7tbUoT4h7Ld?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b7ec04d-b7e4-4f99-9f4c-08db31ddf677
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2023 11:49:20.3122 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h1DF/2rIKxAEOF4GjKJrRiNuzKdH2AXmJwwf+S3JG7zGFemsbLeYLiYZ4YJEeSjjW0y2xbJRCUXeyqM3VYbcUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR02MB8089
X-Proofpoint-ORIG-GUID: lgCOpiCAth0Kn3AQQC4tV1r8OUyP1K_r
X-Proofpoint-GUID: lgCOpiCAth0Kn3AQQC4tV1r8OUyP1K_r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-31_06,2023-03-30_04,2023-02-09_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68; envelope-from=het.gala@nutanix.com;
 helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi all,

On 17/03/23 9:25 pm, Markus Armbruster wrote:
> Daniel P. Berrangé <berrange@redhat.com> writes:
>
>> Currently it is not possible for a union type to contain a
>> further union as one (or more) of its branches. This relaxes
>> that restriction and adds the calls needed to validate field
>> name uniqueness as unions are flattened.
> I apologize for the long delay.  Sick child, sick me, much snot, little
> sleep.
>
> PATCH 1 is wrong, but I was able to figure out what's going on there,
> and suggested a patch that hopefully works.
>
> PATCH 2 is okay.  I suggested a few tweaks.  I'd put it first, but
> that's up to you.
>
> PATCH 3 looks good.
>
> Looking forward to v3.

Thankyou Markus for your suggestions and I hope everyone is in good 
health now. This is just a friendly reminder if Daniel is ready with v3 
patches for the same :)

Regards,
Het Gala

