Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 646325344B0
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 22:07:26 +0200 (CEST)
Received: from localhost ([::1]:33444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntxHx-0000hD-6O
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 16:07:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Babu.Moger@amd.com>)
 id 1ntxF3-0007Zc-Ns
 for qemu-devel@nongnu.org; Wed, 25 May 2022 16:04:26 -0400
Received: from mail-mw2nam08on20615.outbound.protection.outlook.com
 ([2a01:111:f400:7e8c::615]:32192
 helo=NAM04-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Babu.Moger@amd.com>)
 id 1ntxEy-0000eB-Gx
 for qemu-devel@nongnu.org; Wed, 25 May 2022 16:04:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lit/XOAwQk10tCXHWcBaF2wDhtC2fkZP1n5VcfERNUatYa1uXs3D7Tr/ZL8zzGmRGsIL412xkLNJBl+rSX3sgCf7Vypqix3rlfnBqpb1llVeO4h2tQ0JhL2gvi6XVtcC6dGygyqEo1MB7na2nrLcsXVSPsx896cE+KCV6xP87Bcr9M/a+xP5dBrmo5XOWq/SAbmWVjc1Gw0Q9ne+4MCdG6Io34NuAQevxEUqE8CCQkOW02lpg8HW/548xbgv+gUzQqFl6uk0RokAkTiUJSpsHUADhfxerQuYjU1mtincnD0NkNHCM2wpv3pBj+860donKmDpY3fXI13XM8XSxwsofw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OszbGhfXhhRpvohqtCiqvE4Vs0O4wru//CwnLmoJ4Cc=;
 b=fDBoG7mwlE3Osi2XJX3ncf202IHMa3uRsYwOrJwyyfkM0PtzE8jxji3Ci70wZCqHcZlIW/d5uzvxEM8MQlxFC+qHCknAfc/3inNR74wKp/eU5qks6bTkw0twGfghnYknPRUelS2c+4ecRAAyH90m0uPD3yNE//UyeJ6DkVcnDv3LnhYISmw5K5tokAWgsoTXlQbOmmrLAtTWsn2LLUUv20jh/Yo5/wwXEYMxHmcpjUgmqXUZ9XB7GkOS34s+OP5Bo9e9hF8o8mzevya4SbVZ8K4J7rdjYJnJavTd8yqJNSkZoJd/KLcX5syFp8vmlCxz7LNRuYhwCbfDScvp14YIJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OszbGhfXhhRpvohqtCiqvE4Vs0O4wru//CwnLmoJ4Cc=;
 b=K/2fOVqEpOjbDuSBmU7eyWXznzgT4r+4RQVNU4d/V9NdhnFSVhSs+vEOg8qhcE5ZAp/SIad/UcyKWrF14Y1AL8OB4Exdnc27NVs2qcTW7fZ/qf4cUG46utayYcFzyZguyO+dV/YHn6apHEmGYkYtYSruafTHyIBrYPZalfBwFmY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by MWHPR12MB1230.namprd12.prod.outlook.com (2603:10b6:300:f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Wed, 25 May
 2022 20:04:16 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::6866:3634:77ac:4e87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::6866:3634:77ac:4e87%7]) with mapi id 15.20.5293.013; Wed, 25 May 2022
 20:04:16 +0000
Message-ID: <4b8a1367-0ce1-0b75-a6cb-6fe5f91a5273@amd.com>
Date: Wed, 25 May 2022 15:04:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 0/2] i386: fixup number of logical CPUs when
 host-cache-info=on
Content-Language: en-US
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org
References: <20220524151020.2541698-1-imammedo@redhat.com>
 <20220524171949.47508d9b@redhat.com>
 <e4df1ba6-1a11-21e8-e344-f5e24fa49ce8@amd.com>
 <20220525090506.63f55b4c@redhat.com>
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <20220525090506.63f55b4c@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0086.namprd13.prod.outlook.com
 (2603:10b6:208:2b8::31) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c502589f-f0a5-4ce9-ae8a-08da3e89bf27
X-MS-TrafficTypeDiagnostic: MWHPR12MB1230:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB1230FFABAA774C06A290771F95D69@MWHPR12MB1230.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5dE19+nnTOH8VsCOud+2ZJUoizr30C9Ek+mje/E9yL3RgkXIznzAXNG6EAW20rCge5raSwCsnMgYuzcTKnBqpR7v0Y8cPPRrU7vBZuqabNJzuLhj6+bvhQSDTq3QDtpqCRQ5bIE6Vv9jO/CnYp4ZXlhCYlPXAUa1SJ1K9u62U8JKSNfa+JrzwVFLn0IBOijWnQORzo4rPosqneX+rlxVA+OAmiubTIKQbJPtzlyhPd1KZeuONIjhL2jcDAAyCge79AOQXB+HgUH3YIkm831zUI4SRR8pZsCVEsDPkOUfaxXcD1QGgc5sCB7rjkAau6Zzd/bDa4B8JHQK9YQc8I2T2NxM97KT8R0QKPCTfJ0EOtYBXBgzcYRY2lKR69lGkG4j4dvXSyXRh/9wbmy0DnAY79SHFb/ZI53Dm40bEk2LEf2DwUYN2J73V4gkVeYlVS1k7nR01VD5Dvvr3CmV7er5gHmGjo4ApWZQq3bmIk4SaJO+0LMMiUYYyx1IkhSrH78REOHKQyKpqw2horI3CEGAtpQGQ9EG2AkNeb0BExWrFSjc+/V6SNC95shBX2zaq5JVRDoU7HNI5AWgBlJoQIremfAvtSZ7KX26/MYs5Vg7EBhyxwKc8lTR5VsCKX19n8Y5UgGZ3upr6nlsuPXYQGicvx969Et3G8KoJXYZTIX86P2wWjs09+Anb8xA8anctiJfNjcAyaG7UHfgvyJmRkmT4jk2+Sc/s1mxIfLCdEYjKSQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR12MB4553.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(86362001)(26005)(31696002)(6512007)(186003)(6666004)(508600001)(2616005)(5660300002)(8936002)(3450700001)(2906002)(4326008)(38100700002)(83380400001)(66556008)(8676002)(66946007)(66476007)(53546011)(6486002)(6506007)(36756003)(31686004)(6916009)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cUQ2bGxiQ3NoSndQK09LZ3AxM2pEUW5iVkxsMnQycFRraXdDL2daODhNcEMz?=
 =?utf-8?B?bU9QYW1vQnJ3ZTBBN1UyczhxbE1GbkRIaXgvUVJKOGExb0hXSU40VEJMSlJ2?=
 =?utf-8?B?VXhqdVVsRGR3U1B1UU01Q1JzM2ZTZ3MvRDR6bllXc2Q3d0ZZVm1jekxma3lK?=
 =?utf-8?B?WmkxdVd2Lzg1aU1PZnhxVWJIeThJOVFGeS9LMzVReXVmc1hkWFRJbkJJdFNN?=
 =?utf-8?B?QnB6em5vbGdvb2VibFB3UEZ4YUVxbERmc1NHNVliMHFrWnpmQkQ4ZWVLeXU0?=
 =?utf-8?B?aGNsRndUWlNKc1pGNVBrSHhGZVdJU3dFWnF2czJHTWFwcWk3bi9BUGpLdGFq?=
 =?utf-8?B?c2ptTzhkU1A0OXUwcElKcWd1QWN5Ny9jcTBNZ01PWjdUbW5VVkhFRnJsSzQ3?=
 =?utf-8?B?VnBXWWVWanFEWGsxam82M2gvUDBCL0todEl6YlpKaWNjQWxPdm5Wa2FrMVB1?=
 =?utf-8?B?OHcwRFRhRk14UEQ0NTQzT3AvY3Exam0xaUd5c3U4SCt2VW1sL05SbnR6bUc3?=
 =?utf-8?B?dFBZZWExdG5ZZW9oR1pZVUZjUkgyVmdkWm84TC9Xcmp1aG15ZlZJeVBTenMy?=
 =?utf-8?B?Yk53dUQ5ZUZJc3BIdWN1aFh5V1lGeWZWNEd4T1VSeXNMQ3FBcHZOQXp4cENO?=
 =?utf-8?B?NjEzdVU4Z1B3NTh4QmM0enltN1NiYUZrM1NxU3FUZUd4N0JOSHpReGNjS2Ra?=
 =?utf-8?B?Y3ltUC83VENENjZsYVlSSmNpMDNUU2tCVjdxMFRaUXVBbE55VW9RZkJJa2Y1?=
 =?utf-8?B?UUE2N0VoWkxJeXZzMjd2blBoU2ZzTnBmQTNmTUsycWR3UEROWjJFVjRPeEY5?=
 =?utf-8?B?aGNUYzhsYit3SXBuQXdmdDE2USsxOVpqTmJCU0V5Y3NWQ0V1MHpzV1plZU1L?=
 =?utf-8?B?T0tPVExQem1EQmJlNVYzd3dwMFBDbG1WV3JQRHA3Nm9BQWFuV3RKK2tEVnJs?=
 =?utf-8?B?RHZXL0pCME1UczZoS2lydklSS1ZJSTN0dk14M0svODdtU2dxd0JJQ0Jsb1Zp?=
 =?utf-8?B?TExVc2VVMnhBTnN3bDQ0cE55QzBlSGVYRmZteGhxRlpIL3ptOEVZblpwUFpS?=
 =?utf-8?B?NGxiZUVFcmRGVEpZVDlDUUV3RGd2QWlHbTNQZi9HaWptVmdSSUt2Z0YzdmY0?=
 =?utf-8?B?MjQzUFEzYm1PekRYVlltM0c5V2F4b2dQOG9heUErWjlQL1F6S3VWbFh1QWpT?=
 =?utf-8?B?N3pFZVJLSGlZUm5GU3hneE8wQm5iUU55Mzh2ZFNRUnZhSEZ2TjltQVFlRnB1?=
 =?utf-8?B?RkRMQlhsM01MdmY3RnViZnczbFZ5ZHREemlHSk5TaUd4ZkJSVFB5TjJWcUlx?=
 =?utf-8?B?NjdWR0NpL2YyQVpKWFhEelVaa0ZuZlFTUGxGNlUxYlhYWVdzbW9URUxYTUU0?=
 =?utf-8?B?SCt1N2d6Q1hjSWtOU1hkY0dEVXAyenVIWi90KzcvVVRFNFRjQWNLSzkrc0hu?=
 =?utf-8?B?dDcxRDBwT09pMysyVTUxY0xYUXdWVVFMYWdYQ2UxODF3SjU4TllieTVFZ0tw?=
 =?utf-8?B?Y0cxeDVzclo4dllpMThMOVVSaUZsV1RaYURMQzlvS2YrdGhlQ3h6bWZvTEVS?=
 =?utf-8?B?TVRpVjU3RHJ2QWUrYmN4bFlwZzFCbkNWSDJ5a3pmMU9nOW9CODZFQ2NSK01H?=
 =?utf-8?B?WUpRaHNKSXBMeXRsdHNqcDdGSWxCVUdYOE92dmJsR2lOT3pVaDgwMFFNbzZl?=
 =?utf-8?B?OUQvdXp3YmdXYTl6R1hJRXlTb2hCWXJrQlBTMXVodU9rVGtXeVVTWTBPK1pO?=
 =?utf-8?B?MFIvK0dqc29xTUhwMG5UNTlmTmlMM2ZDL1JZS0xuNG5xNjFuNVRwUnRwcjYv?=
 =?utf-8?B?UDRyWkRVaVJobE1uVURZNVNMTHhFRFBRQUlCeGMzVzBpVW9wZjBGYmdZdnVp?=
 =?utf-8?B?dTNVLzdKeXppTXk0TWI2V0I2SEU0NGpCSjcvdGxBMXlqdCs2SHRJYkR6RVRh?=
 =?utf-8?B?VHdnVGZPSUI5Mk8vSTk2RWdrdVNyQ0lPejVaTSttWElDN0JmTWY0bjh2cnFD?=
 =?utf-8?B?TmVSQzJMSmJlc2c5QzdMV2FWeGRMSW5PYmx2YzJHWDE1RHI1THJrVUhpV0Y1?=
 =?utf-8?B?ZENnWkJ1K1hYb0RBQVNyWHd4MTMxYVFneVo5NG5ua1ArWnhITGsvcWovVGlG?=
 =?utf-8?B?a2ZNQ0RMdnVlS2JxV0JxOGZqZy9IT200UHl5bjRrWFJka0JZaG1FK0hmeVdM?=
 =?utf-8?B?OXRRbW5SZksvQ1dnV2hScVhQcXlBcWVWSkpnLzZjNkFJTkg0cFhPWXRFVklT?=
 =?utf-8?B?cm9ESEcva3pheHFLR3lQMnNtZU5MNDBlM0l5YW8zVnZkR0pvcUJiVVJYV01n?=
 =?utf-8?Q?D+q96TrzW7iD3cpzWf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c502589f-f0a5-4ce9-ae8a-08da3e89bf27
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2022 20:04:16.6867 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: INZzHjMe+2YwZNUrxuju1GPREdDXL/S+t0yOEP0rq8kTHxAkIBLvxNrVm4xiusrQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1230
Received-SPF: softfail client-ip=2a01:111:f400:7e8c::615;
 envelope-from=Babu.Moger@amd.com;
 helo=NAM04-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Reply-To: babu.moger@amd.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 5/25/22 02:05, Igor Mammedov wrote:
> On Tue, 24 May 2022 14:48:29 -0500
> "Moger, Babu" <babu.moger@amd.com> wrote:
>
>> On 5/24/22 10:19, Igor Mammedov wrote:
>>> On Tue, 24 May 2022 11:10:18 -0400
>>> Igor Mammedov <imammedo@redhat.com> wrote:
>>>
>>> CCing AMD folks as that might be of interest to them  
>> I am trying to recreate the bug on my AMD system here.. Seeing this message..
>>
>> qemu-system-x86_64: -numa node,nodeid=0,memdev=ram-node0: memdev=ram-node0
>> is ambiguous
>>
>> Here is my command line..
>>
>> #qemu-system-x86_64 -name rhel8 -m 4096 -hda vdisk.qcow2 -enable-kvm -net
>> nic  -nographic -machine q35,accel=kvm -cpu
>> host,host-cache-info=on,l3-cache=off -smp
>> 20,sockets=2,dies=1,cores=10,threads=1 -numa
>> node,nodeid=0,memdev=ram-node0 -numa node,nodeid=1,memdev=ram-node1 -numa
>> cpu,socket-id=0,node-id=0 -numa cpu,socket-id=1,node-id=1
>>
>> Am I missing something?
> Yep, sorry I've omitted -object memory-backend-foo definitions for
> ram-node0 and ram-node1
>
> one can use any memory backend, it doesn't really matter in this case,
> for example following should do:
>   -object memory-backend-ram,id=ram-node0,size=2G \
>   -object memory-backend-ram,id=ram-node1,size=2G 

Thanks Igor. However these changes(patch 1 and 2) does not affect AMD
systems as far i can see.

Thanks

Babu

>
>>
>>>  
>>>> Igor Mammedov (2):
>>>>   x86: cpu: make sure number of addressable IDs for processor cores
>>>>     meets the spec
>>>>   x86: cpu: fixup number of addressable IDs for logical processors
>>>>     sharing cache
>>>>
>>>>  target/i386/cpu.c | 20 ++++++++++++++++----
>>>>  1 file changed, 16 insertions(+), 4 deletions(-)
>>>>  

-- 
Thanks
Babu Moger


