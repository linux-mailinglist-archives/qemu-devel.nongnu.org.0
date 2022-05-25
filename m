Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 797F15344A2
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 22:04:09 +0200 (CEST)
Received: from localhost ([::1]:59334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntxEm-0006rO-An
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 16:04:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Babu.Moger@amd.com>)
 id 1ntxCL-0005ES-QY
 for qemu-devel@nongnu.org; Wed, 25 May 2022 16:01:37 -0400
Received: from mail-dm6nam08on2047.outbound.protection.outlook.com
 ([40.107.102.47]:19040 helo=NAM04-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Babu.Moger@amd.com>)
 id 1ntxCH-0000XU-GR
 for qemu-devel@nongnu.org; Wed, 25 May 2022 16:01:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JQvtp+UWmDsANfJ1hrJkAPM+k4oZx8NmRCaBcXiUUsajGiaOc6qR0wdc3jHS8zjLF7bNwltw0EUD6Z/LzowlUcrTkFpHA+AjcXAN0xAAd2F+/JLGRj7L1xPHPK+xKk6k0XuEEnjwcHHTwSkpdzr1nz918Dg2fcDcm5W/wBFmY0P0nKVmlAU0y6b3kEekHQvVHv2bUj3kZRWzYhK1yudEBBWgBNcpNytNQ2kSxdgy7ff9nW4dsv+fX6ngKeiNm1n67aDj4YQtMUrzCmq84H2LMlhppn363PBN2jnNqJRoFq/Ae+H/90WoE11WMHyAfYV3rO6JiGFCDhHkIGTlbZ8qlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nb6E3h+M8ofXQV1v7IU3vJdrixlQomqO3zmK7l3nmIY=;
 b=LlzYK8r7OeINOoB9HNcvceff2Eru6PCgEjxtxbOYIetTUHM7u8g3JT4FLK8qQgbxAQNHDT2lg1AMqK1qErBdotm9QUUKn47tpmbX/veD49fISZVk09iEbzB1KsggKCC+1MX4wJgywYsymvb666yj7FvdZJqN/g6dINimjUtc/BwxZXBb0JabIXOV0enphUnPeo8RpvuIUhFH3pT6umy8ovm4qJoBOXnF3CB5youKZDWOE0PtDLvDtmsKBJ5seqHBBkwV++EFWr7TO0jJME2lwIhDWk/yJmhYxP//LdkpRLkhDQ4wnCa3qopdf8w2gG0EuK7Z/Q4k2ZQmXDldzja5JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nb6E3h+M8ofXQV1v7IU3vJdrixlQomqO3zmK7l3nmIY=;
 b=htWiQndBqAABXRNKl7J7GTci8ErDF+iuxshPq/uYjByy8a3fiXjOvjXUlIUu7DuYdoYaBIVRmRreNUteLM2SrhTES6B7WTI52w9dKWPNqegYf3i0vcwNJHYr1UAPzLqO6M/LaDE2URi27doBqDjRRVn/aU+e0vVgcaNC+gRaY8c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by BN9PR12MB5035.namprd12.prod.outlook.com (2603:10b6:408:134::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Wed, 25 May
 2022 19:56:28 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::6866:3634:77ac:4e87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::6866:3634:77ac:4e87%7]) with mapi id 15.20.5293.013; Wed, 25 May 2022
 19:56:28 +0000
Message-ID: <0159d16e-b789-25fc-9ea6-adbf5e3218ad@amd.com>
Date: Wed, 25 May 2022 14:56:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 0/2] i386: fixup number of logical CPUs when
 host-cache-info=on
Content-Language: en-US
To: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>
Cc: Joao Martins <joao.m.martins@oracle.com>,
 Igor Mammedov <imammedo@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
References: <20220524151020.2541698-1-imammedo@redhat.com>
 <20220524171949.47508d9b@redhat.com>
 <e4df1ba6-1a11-21e8-e344-f5e24fa49ce8@amd.com>
 <eba71ba0-1a38-0878-46a0-b10886d4447a@oracle.com>
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <eba71ba0-1a38-0878-46a0-b10886d4447a@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BLAPR03CA0037.namprd03.prod.outlook.com
 (2603:10b6:208:32d::12) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e63527a3-f79d-47e4-35cc-08da3e88a835
X-MS-TrafficTypeDiagnostic: BN9PR12MB5035:EE_
X-Microsoft-Antispam-PRVS: <BN9PR12MB50353705A31FCE82B706732395D69@BN9PR12MB5035.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pdfDNL9F0L/Mej7w8UOZaS+L27y7M9oX4b76i/DWB8uaJz0tJTq59N9fZ2YuttbUPPFjm4ze+gvTj4tZh2pcrX+Yf8qT0sRV+p3C9EsW/v4CzZdOWMJSG3m0sF8yhZxkXPEbFh+Abg9M0wltD2jhJhLfCxjckY9wEBiCZAqH8QyFMzoRKbi//zeqJ0ymXk5ZTHF7kvitIDn4WzrVlbSgJf1CT0S/bcvc/jOpAAIBVd5DJLTUaGHxhgcRV02iAvtO4DcCVKtDrS4GrY1HsnqhTaDO62lWS/WDklQxvWI9Wt+hKDEbk6UL2cl+5+LJxT9cNaDYImNsQmLlqwtwa1tzFG15Fn6KUTkweWIOFvEXEHKQA4w5yXNt5E2OXuvK8a1fyF9VOwl87AxJot8ffyLrf/RSfCiZC1nMGGR1pVQzGeydBOzE3wZlCzRTmgZJY4gvLjZUQxQJ8WWV0lLFUh9xMXPlT4CTFa3OyblQ3dV0t1cag6um6LjP8obV8krS2ArLgHmB/S7wvHBs8A2WlDlI4D2ETMgCgHGz36i3u1SLIG4hEpPe+yJNUAoo4AciIi6CcWmxRVFbk7n3IzWomh0r5xMmPu6x3nYBQnAmUkre1iwmErXZ71q+Itc8suyE9muNE01Zrjai90GPo7g+eq4A0HsqNcRWpR/BIcfkHA6F3l/+xpzR7aPzCvs6nnddUMdTF6P6n0rxOppXu6I6jy/IHjA5W6Q5GTod1Dw+wsq9U1g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR12MB4553.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(54906003)(6512007)(5660300002)(6916009)(26005)(8936002)(31686004)(6666004)(6506007)(53546011)(66946007)(66556008)(66476007)(83380400001)(4326008)(8676002)(86362001)(2616005)(36756003)(316002)(186003)(6486002)(31696002)(3450700001)(38100700002)(508600001)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFdFV29nMGJjdzI5UDUvUUM0OHRmTDJvc3Y1elZYQ3NUckRWYkpKTmFpQ1Ry?=
 =?utf-8?B?VGtBWFZxZnJ3QUN0N1Y2eG9QOCtaWmRubjAvVWZNUTZrMVNBV09XN1hDMnVW?=
 =?utf-8?B?R2tWWFV1VDBZT0N6VUNjcmp1cEpHeE90NWM0cXJJMzBtR1VQYVJRS21IQzhx?=
 =?utf-8?B?MVFRVVNiSllWOHd6Z0k1aXYvc1dmWEhZVTNzME9QYXhpR0Z5Sm12WUpXNkF0?=
 =?utf-8?B?QXkxSUp5ai9MUnhJQmc5aTFUWWhDMTBRTnZKWWJBL0tETHpTamE5NkN4VXdt?=
 =?utf-8?B?Wjk1ZDR6bllvUVUzQXFsL1U1ZjdHSzhHd213TkZFRXNpNzloYmZzUkhSWitj?=
 =?utf-8?B?S0V5NDVkMHVHL09lRFArVG9KSUhTZTJ6dTJzZnNhRnBTd005SnpOanJHaCsx?=
 =?utf-8?B?NXo4SEFITEVjVnE2SmU3R20rUjFEWTZMQTFYS1pOMlpoTFltOHZhSmU1SDZF?=
 =?utf-8?B?dCtBWWpWMmhvVVdySHJNUzhKMFpJREw4YkIvYVVONzFOaDcwL3dTZ0d6RTJ6?=
 =?utf-8?B?VFF5N01vTEhXV1BHWmZuU2VIdU5hMmVnTUJBRkhnZFFIbFFQRkp2cTJxdUFP?=
 =?utf-8?B?UlZVWDhSYW54L3gwOExjQklCVjJDamZNL1NZbk1MTUkxSUlKQXl0TXF0b0hN?=
 =?utf-8?B?SiswUzA3MUJmdlByUnh0NWdscFJBSWtPdEZQckI4RXFlNkVCWGVwekxDNHJI?=
 =?utf-8?B?dGtEak9uTTBZV0xMakdua0Y4MkRlNjJVdHZuTDZERSt0eCtndnhyMk1RRzlo?=
 =?utf-8?B?cVdQV3ozZWZLdHhXcXlsQ3JLeitOaXcyTjRGZ2ZmOWlmbklydTFRb0ZsNkor?=
 =?utf-8?B?OFBkUytKUVlMQXJWU2hTbk5BU2dJUllqaWFCRUd2Zzlpai8reUVSVGZ4ZmR5?=
 =?utf-8?B?QkxuTHI5UjlJdWJQaU9VbzEyWXBnSlRwYmhDWG9ENENGQ3JBalA1NDRCUFE4?=
 =?utf-8?B?OUZhR2lHUDVWdGd3TjVJejNIbnB1RlpDbWprZWJLQmN0YjhEa3lPSTVoZTF4?=
 =?utf-8?B?OFN4dWtKcWJDbG5pNWp6VmQxN1ZiVHJHVTJUcXRWSkNpWlpNNjErcXdtRkFU?=
 =?utf-8?B?bksvd1BSdHIzdlZyRU1naVZETVdTZy95ZmRza0oyUlFtd0xJSjg2V1V0d3hy?=
 =?utf-8?B?a2lCZ0djTlBndjRlV1QvM1VEOWtYcUg3SE12MnlhUTN5VDEycEdvOG1raUdB?=
 =?utf-8?B?V3VuaVB0KyszR0orT3F3TGlzYVlndjMzeXlIaXJ1cWIvOU9jdS9NZnoxNkF6?=
 =?utf-8?B?VlhqMGthVVE5MFlwdmtvWkJPSTVnK0oxMmVlVVVlZHdUNkNyK2MzeXA2eHZQ?=
 =?utf-8?B?VjJUcWkzUkdxVVYvaWZtT01nd2taMTJOZ1dyMC94U2liUGlNZzM4d0MyK0or?=
 =?utf-8?B?UHEzZUJFZUxXU1JGRDZZSlJERGhQSGdHY0hHNmRiajl6amJHTUZGM1cyeGlJ?=
 =?utf-8?B?WkVERmpLSXp6MC9oaUtaQlE3eUZJa0VRV054M2Yyekg4dW5jUnJqdVJ5TGZ4?=
 =?utf-8?B?bS9qZmppdGhQSGxmS09ncFRuZmszUXBoSGdnV3VpTFU0WFQ1UUkxd3NSeUtp?=
 =?utf-8?B?SHZTc202bS8yMnhHS2NKQ1lhUGFwRXFGdTVIbW5SOHpZaUFOVmNVcGlYbUVo?=
 =?utf-8?B?R0ZkRzJ1VWoyVGx1bEEvazBxYkVDbnJUZW9kMkRCVmliQjhxWHorZzI5V1U1?=
 =?utf-8?B?WVY0UUZXckZ4ZDdLbU82d3dQMGY4cWVjYVFLclV5U29uRjZicmpPRW5qb2hI?=
 =?utf-8?B?MnQ1Z2s5R2FxQXErSGJZeG1yeHg2OWtrYnQyVEtqQWtiKy9rRzZvV3RUWFhx?=
 =?utf-8?B?WWEyTmhGbHJ0MXVaeG4zekRpaG54dk1vYmxsZzR3NkhuSUtMTnE3RGpUV2xX?=
 =?utf-8?B?ZDFJNzhoNFVBMnVid3NuWml3U1lqc3lra09FY1Nma2Q2clJ4VCtrT2dDME8x?=
 =?utf-8?B?WU5ISW4rWlBuOVRSckRmVWtacG92dmhXdUg5WW91RzNNTWluY2hUM05yKy9S?=
 =?utf-8?B?ZHVoQXZYaEg1NXV6b0xpcDFwQVZlU2VLOG54Zk4wd2dvY1dnVkRLYjNRK2Rh?=
 =?utf-8?B?cEF3UUE1bkxreE1qN0J2a1ZhN1pXeXU0blV0MnNIUWRUWGc4WGJTNVZianps?=
 =?utf-8?B?NnBDeTUyMVBtSkFmRTJ3TVBBQ3AxRUlUS05jUDIxUnBZcnd1dlZHdUk3UWpv?=
 =?utf-8?B?a0NuYWd0em5iTmdya2NrRWEzUFFqcGV6R2tzcjEzdjhSUEs1V29TRmlNNlBm?=
 =?utf-8?B?WlpvOHMvR2xzRW40a2ZTaEFHZEFBSHdnQS8xN0M4WVJJMkJYYjZDRndwL1hh?=
 =?utf-8?Q?zgWFmYE+ZPePFfkycN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e63527a3-f79d-47e4-35cc-08da3e88a835
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2022 19:56:28.7379 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dOns9AX4smK/2CggfdmWKyJs2dLU8ZY3irmB9OA0AZb71wrJKtCftL9laOGXAEiS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5035
Received-SPF: softfail client-ip=40.107.102.47;
 envelope-from=Babu.Moger@amd.com;
 helo=NAM04-DM6-obe.outbound.protection.outlook.com
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
Reply-To: babu.moger@amd.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 5/24/22 18:23, Alejandro Jimenez wrote:
> On 5/24/2022 3:48 PM, Moger, Babu wrote:
>>
>> On 5/24/22 10:19, Igor Mammedov wrote:
>>> On Tue, 24 May 2022 11:10:18 -0400
>>> Igor Mammedov <imammedo@redhat.com> wrote:
>>>
>>> CCing AMD folks as that might be of interest to them
>>
>> I am trying to recreate the bug on my AMD system here.. Seeing this
>> message..
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
> Hi Babu,
>
> Hopefully this will help you reproduce the issue if you are testing on
> Milan/Genoa. Joao (CC'd) pointed out this warning to me late last year,
> while I was working on patches for encoding the topology CPUID leaf in
> different Zen platforms.
>
> What I found from my experiments on Milan, is that the warning will
> appear whenever the NUMA topology requested in QEMU cmdline assigns a
> number of CPUs to each node that is smaller than the default # of CPUs
> sharing a LLC on the host platform. In short, on a Milan host where we
> have 16 CPUs sharing a CCX:

Yes. I recreated the issue with this following command line.

#qemu-system-x86_64 -name rhel8 -m 4096 -hda vdisk.qcow2 -enable-kvm -net
nic  -nographic -machine q35,accel=kvm -cpu host,+topoext -smp
16,sockets=1,dies=1,cores=16,threads=1 -object
memory-backend-ram,id=ram-node0,size=2G -object
memory-backend-ram,id=ram-node1,size=2G  -numa
node,nodeid=0,cpus=0-7,memdev=ram-node0 -numa
node,nodeid=1,cpus=8-15,memdev=ram-node1

But solving this will be bit complicated. For AMD, this information comes
from CPUID 0x8000001d. But, when this cpuid is being populated we don't
have all the information about numa nodes etc..

But you can work-around it by modifying the command line by including
dies(dies=2 in this case) information.  Something like this.

#qemu-system-x86_64 -name rhel8 -m 4096 -hda vdisk.qcow2 -enable-kvm -net
nic  -nographic -machine q35,accel=kvm -cpu
host,+topoext,host-cache-info=on -smp
16,sockets=1,dies=2,cores=8,threads=1 -object
memory-backend-ram,id=ram-node0,size=2G -object
memory-backend-ram,id=ram-node1,size=2G  -numa
node,nodeid=0,cpus=0-7,memdev=ram-node0 -numa
node,nodeid=1,cpus=8-15,memdev=ram-node1

But this may not be acceptable solution in all the cases.

>
> # cat /sys/devices/system/cpu/cpu0/cache/index3/shared_cpu_list
> 0-7,128-135
>
> If a guest is launched with the following arguments:
>
> -cpu host,+topoext \
> -smp cpus=64,cores=32,threads=2,sockets=1 \
> -numa node,nodeid=0,cpus=0-7 -numa node,nodeid=1,cpus=8-15 \
> -numa node,nodeid=2,cpus=16-23 -numa node,nodeid=3,cpus=24-31 \
> -numa node,nodeid=4,cpus=32-39 -numa node,nodeid=5,cpus=40-47 \
> -numa node,nodeid=6,cpus=48-55 -numa node,nodeid=7,cpus=56-63 \
>
> it assigns 8 cpus to each NUMA node, causing the error above to be
> displayed.
>
> Note that ultimately the guest topology is built based on the NUMA
> information, so the LLC domains on the guest only end up spanning a
> single NUMA node. e.g.:
>
> # cat /sys/devices/system/cpu/cpu0/cache/index3/shared_cpu_list
> 0-7
>
> Hope that helps,
> Alejandro
>>
>>
>>>
>>>> Igor Mammedov (2):
>>>>    x86: cpu: make sure number of addressable IDs for processor cores
>>>>      meets the spec
>>>>    x86: cpu: fixup number of addressable IDs for logical processors
>>>>      sharing cache
>>>>
>>>>   target/i386/cpu.c | 20 ++++++++++++++++----
>>>>   1 file changed, 16 insertions(+), 4 deletions(-)
>>>>
>
-- 
Thanks
Babu Moger


