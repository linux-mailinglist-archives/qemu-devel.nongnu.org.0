Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9BE764E99A
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 11:41:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6894-0006yu-Qd; Fri, 16 Dec 2022 05:40:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1p6892-0006yl-SR
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 05:40:48 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1p688y-0002yX-V4
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 05:40:48 -0500
Received: from pps.filterd (m0127838.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BG2G2ek027771; Fri, 16 Dec 2022 02:40:39 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=+Wh925Y4pvKLnu0Dkw37GKMhl9010oU3s96i12j8qTo=;
 b=U33tRQfycMgpMfX+RK1M0AKSIqUKHJ4NofLArh1o1IYyQ1jH2FlhQBjgjz9zswPEEast
 VfSlrFP2FYelfPxpDe/mKjgEQHavJCVov6XzZ2aNZr0dJzcofRa2184sPBXL+vHcZtc1
 0TXXaVL83GMn2RWhYQLpChD4g+19cFzOjKanvncrKndZ4XKHWYBwGPt7uN56kivMatl4
 6KsO86mcumhms4ABZStkZ/hGekxNT1cKMZDwxApO/yhuly3m/Zl2gkXT0J96zPGfKDbT
 bAEnMNVOL2iusuvBobcxPPKusBWaF/6omeNDvFcwpQ8jYEHA6VZAHmVD3Ase+GqbzmgC hA== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3mf6tu6cmg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Dec 2022 02:40:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DR+IZ+Fejy8+Tp4Zf5DcsuWFkZDDRdAp5X6RCelywH9y8/YkJUY9uu7XjLY5X/afk8/S6Zb1CE1aEBriL6bsIIgDj1f06/dnlmQn0cGiQajnURmNi1kqVi6ag6smgpd4BCBRmpVIGEUezzMXctcYRUZczf79EevMZN9blBUAZz7F/pNcJFZnmxJaoxSe1B0UYnTogwl61eT15GrxHFHrWZYqUE6aGZgoADy2hz56+x1TWAZXv4IOP6oH9uFAm9eZBWICWqk6KBHYYGbBeuQgIWTu8kkMx82MxyoZOS8vcVNcrNRdhMo2gDLcqQbTyT3znDBTmwj92W9YjdDKxRAbDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Wh925Y4pvKLnu0Dkw37GKMhl9010oU3s96i12j8qTo=;
 b=PmjMS4nU4TIZ/lfHVMS5bWdW6GOo+SzVtNZjHRrNbYrqugasMRnuVOIB7GbGsp2oPmrubQk7QVz6jYrXtHXzkE1xqqHfe3iX0x5QfooHMEsxIYvjspaLwfCwihyxE2j0IVqGpr1GfVxiEZQjlN3BVMcoXc3QaeblduQO7gvTCeCgTBCAACgWF2YLBJEk9N3hKdx8/cUPH4/Jxt2b5ZRYDwdPGc1fTnSCnmekJARGCPurni97UyYtgW42vv3s7xoa0JyGwIpt0VCx2oUC1SMjHYRuJkdz0iKwT2WI+pM4ezL2Qi1n4+EkhxvgA8yPW6RvBuWpGl8qMehA9HGgprupMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Wh925Y4pvKLnu0Dkw37GKMhl9010oU3s96i12j8qTo=;
 b=hGqIfvmbU8Wk8jfyCpU9EGoCFt9Gc8UT6mLmOgBLVD1mVdbYDdTjbvJ5FHTn1gJ1ng7Sb37vkfNk7az/48uvD0CIiA4PcVuDBeFA7Zf8sBH83PhBtVeG+CH6k5evRrZMUkWdgYlkeCToY4v/QMs4tSdkj7CMpkx4U1GVMmq8N/8T+OCrbwC1/u2UIba++3S9GMe3RXlZZTelB5fuY7H0+MqA0VdwpPIHJJeo9BSxwEEE6EoBpqP/zkHgLLiGP1l8bqMXBcjCKcxnhOSJizIBe4noJfnVKo2SesCH0PO2ZwHCRWMkdvCaroNow0wpPXNLUBvNwQmi7WEfXT1MXiCEiw==
Received: from PH0PR02MB7384.namprd02.prod.outlook.com (2603:10b6:510:12::12)
 by PH0PR02MB8488.namprd02.prod.outlook.com (2603:10b6:510:105::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Fri, 16 Dec
 2022 10:40:35 +0000
Received: from PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::dff2:2d3c:e182:fb66]) by PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::dff2:2d3c:e182:fb66%3]) with mapi id 15.20.5924.016; Fri, 16 Dec 2022
 10:40:34 +0000
Message-ID: <400814c5-f179-2566-e513-543ae4ae34e4@nutanix.com>
Date: Fri, 16 Dec 2022 16:10:22 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 1/5] io: Add support for MSG_PEEK for socket channel
To: Peter Xu <peterx@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
References: <20221213213850.1481858-1-peterx@redhat.com>
 <20221213213850.1481858-2-peterx@redhat.com> <Y5mT4V3iYlcH56/H@redhat.com>
 <Y5pAiFv/JHQvgxha@x1n> <Y5rrmRyhRjEiHtAe@redhat.com> <Y5ta3jGHhN0nrIf6@x1n>
From: "manish.mishra" <manish.mishra@nutanix.com>
In-Reply-To: <Y5ta3jGHhN0nrIf6@x1n>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0039.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::10) To PH0PR02MB7384.namprd02.prod.outlook.com
 (2603:10b6:510:12::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR02MB7384:EE_|PH0PR02MB8488:EE_
X-MS-Office365-Filtering-Correlation-Id: bdefa026-699b-4a32-d9b0-08dadf51f642
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f8q83dDmiWk7ZcSsNXGJJLlNC7bUn+5tLwM91fp9bVMJdrBQBF5Cpuz7uGXbyj0NcCUevYyBvPprC679CpMHwrOtJw9OK6/21huzCW9kwavPICYEuHCTyUAYo1Eh4bIIiaBzs/E/KRiAfayt1bS6JEalbuW0/2Xi02pqlWtJdQRdrwafBgpw+4HH1H5C+HNEAiEZBmAXntSD5042bTlGBZM2MKhm8esOHB1Q9lQ7xe8Oqt8k9xJESchnkTdXPH+hovxlZeVBJjyV5OhgOsrB7KrU+QiQ5xZnL1/cX7hBUx5fsSislCAM6R7OPSJvQJvfDwuxsbosH5meVb8CS/9wwgsi6WPZ4r6gdvl9wOiwEelMInr87L//tuC0iXYGVXwtCbwWi05LiL7gFSikL4iHoI8Y+zKJkaurrLnEJzjLXREsa/YWsiE5qR8JYIbrWIL1vJvJwDo7R7AXAVb2QKigZdH71F8UgLa/ETC3kBRuiqUc0k+KkKA6T0JFZ2WWcFteoA0i4Bgzc/jK8vkyrIcUDfe8xDPd4dQP578RfQgOuVKrZ2EBpjpTsm+esAnAaJQq0DEvkIT0kXAQ00scwejuYWGWZGdRczIpibyeI38azf4La1/l3UwM1MTBmlg1GuZvRtOzBStsWjvSzpG2AoKSO0r+cTqDE6BlKDEB6T8lX8HLTvYaPL/kEOkD8sL5gTnfhHlj9kUZxXQZVodKBx/xQ4lDyY2L4jtzO0qKyhu/anVGVA6rerR4vhwPFMzPVOMd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7384.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(366004)(396003)(39860400002)(136003)(346002)(451199015)(110136005)(31686004)(31696002)(36756003)(86362001)(6512007)(478600001)(26005)(2616005)(186003)(83380400001)(6666004)(6506007)(6486002)(55236004)(53546011)(38100700002)(41300700001)(966005)(316002)(4326008)(5660300002)(54906003)(8936002)(2906002)(66946007)(66476007)(8676002)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MGdjNkI3TFBtL0dpZ3cwZlhJay9ESHBUNEl0R3NNOHJlMmN3L2hxSGlsUXFW?=
 =?utf-8?B?NnNTVHJZZ3ErV2xaSnBUOUZoakZ3NlN6MTlxQVNHSU9TbHVhdDd4S1phT0c4?=
 =?utf-8?B?Tld2clhjUTN6TFIzVmNDVTFOWER3dTFGNlVNMVZneFJqVGsrdFlvOHo0cE0w?=
 =?utf-8?B?THc0cHJvYU5zNVUyMXZjUnNPUlJoSnpJWGE2ZFE3NVRXWGRjaTJVUzRlZTRa?=
 =?utf-8?B?VG8ycDRpekNjcUI3UGNKcEhJRUVLbFdHY2VEaTRjbTR6a0lXRDVFamxiNVdS?=
 =?utf-8?B?YWN3dm42NlN6T01pcnBqaURFTktoRE5GUUwwNXF6UkdLOEE2Q3lyU1FTNWdt?=
 =?utf-8?B?VkorbGRSd01kNlg4S0dONFdjb2JnbmZHZzJyam5vTWVZaFE1Q2o3aXhVY08z?=
 =?utf-8?B?NWRPWXoya1dnM3Uxbk5kS0kwTFV6TjVyY3U4RFZWVFJYY1NmREYvWUVhREFy?=
 =?utf-8?B?dGNyaGNvbTJ5aHBiODRFSWZyMmZEbW9hM0NNY3JLWlc2QXd3QnVHcStnTWZi?=
 =?utf-8?B?UnNhaDlWcFJzMktBa3ZpVlBoeDB1Q3VoWDI3Y0VVbDNUc1kvTTBZYkRUNDRU?=
 =?utf-8?B?VUMzQ2NwS0E1eXBSUThsQ1M2RTVrRHNtUXdTR1MyYlV1NDhqWVRlaUI4TVR6?=
 =?utf-8?B?OHVHbXhqUm9PZ24rTURqRjdBVkEwajRoSi9ZUnFxcUxjM3ZTeHpvRjJXbWRh?=
 =?utf-8?B?TThhazNqQWRBakNRWXdGWGlscmxOTkhDa2NaTG80ZG5PWlVwakp6YTV0L1Fh?=
 =?utf-8?B?alJvUUFxcDJ2b283dUFRK1JiZnBCSmV0My9naTF0bExTTGpBRmZoUHB5aTZT?=
 =?utf-8?B?WTc4VXBqRzdvNk5Tb1dxYkN5VDR1ZkxJM0ZTeEVtZnpVdnM4RDhlMXhJUEN0?=
 =?utf-8?B?bXZLK0J6d2hicnd2UlRJeWgxYlRrL0VhaE1wdURXb2Z5UmJVSDlkZWxwMW9K?=
 =?utf-8?B?SGZ2ZFNEOU5vVGhZOUJCbFY3QUx5RDJGVnJNVkVtM1RjK0xmVDZiTGpYNm1H?=
 =?utf-8?B?d1J2TFYvSzdFdm9yeUZqc0JUbVBrTzBldU95K2pyVjF0WmRBOHlEaEQ1RXRG?=
 =?utf-8?B?SnlsRGRLVDF5ZTRRZnNOWjJjbHVZSXZJZ2NjWXY4VFkzTmlCNGVPRWVWQ0JV?=
 =?utf-8?B?Tk1rQmFWT05LU1IrVTdnMFBHV1JTakRiQ2IyYVVxdEI4NkVEZWNrOXp4Uml1?=
 =?utf-8?B?QnRKc08wVERJelo4MHFVRDRtQ0JvWWVZSUV1WEFIVitJSkJ1L2VxVGVCbG9y?=
 =?utf-8?B?QWovbzBoT0ZzWFVSOVp6dmNDWmFSWFltVnJYbG1LeEkvU2Foa3pzYi9kelRY?=
 =?utf-8?B?QUpFajFNSlg4Q0VwanZOMzNZTjlKRkIybVFqZjlkRTBHZDVocEtPMDdIZkcv?=
 =?utf-8?B?TDBxNitUWGN1WDdUbnJXUnZwd1oxV0ExZHpwNTAvY29RbFhWL04yQU5ISFMw?=
 =?utf-8?B?anBjL1h1YmdwWTk3U3kvL1BIMkRqQzAyZktvRnRUbFRVczlFenBHRU5oZ0k4?=
 =?utf-8?B?UVYzeXd1MS82czliUDZTQWJwRk55RmZDQ25LMndKbDZnTXZkT3RKRG9mcW5m?=
 =?utf-8?B?UXZWOWpSaUtoU0NvS0dBUWFmUXlPeFRWUDNPMGkwbWtTTWlyR3lwblR1VDds?=
 =?utf-8?B?K2F4WHJWVXFySzUzbTVScE04ZTlubGdob25nYmhKc1dtNldFdW1XVGQyTHlx?=
 =?utf-8?B?T1pnSzlLRUx0d2M1OUVoekpIWlpjRkRCanllaE94eWFyNDdqeU5JcjdIRUxC?=
 =?utf-8?B?ZDlqZGVJVytOdk5PT09IYkprM1I5TjRuRHlUeE9rODZkUWFrWnoyc1dUR25K?=
 =?utf-8?B?Vkc5cGFJbEJUV04yK0lEcytyK2N3T1VZOS9BSHZyZkxBaHpnM1NMczVubEJv?=
 =?utf-8?B?OXBJdmlrWGc5RHpHN2VpWmZuTTk2U2ZNekdQeUFVRWtEcGozaUNvRkREQ1VJ?=
 =?utf-8?B?MjRHMlZ2endySERydElxWWt4VHp2N2NxWGtUd0VyWDhLYXZtL3g2M2dhUE9V?=
 =?utf-8?B?MlpJeVo1TWNNTzZVVU1mRFpOV0hvZFFnVGQvclQyeUV0V29wc3l2dzJ6TCti?=
 =?utf-8?B?eUJKVUE5N3FEUzkyaVl1L1RGbDkwSHp4VjlQdHB1Tk45SE5qUldMSjA4NTJ4?=
 =?utf-8?B?R0NpcVczbUM3VzBVcjUyU0VRNjJDY0hnNEkzRlhFNFRTVHZvaFVnNkU5SzNy?=
 =?utf-8?B?elE9PQ==?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdefa026-699b-4a32-d9b0-08dadf51f642
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7384.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2022 10:40:34.6872 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nhsVjOQ+fVM8/P4rBJvUosRR5BVir3pZVPL7egNJE8rg4BlkpNOkkpX227NsHDAuU/DJVbjmhYC7rxbjkKmin3ql0Xrix2f5HNL4d+vmmNc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB8488
X-Proofpoint-ORIG-GUID: tEgflQgjj2jv42cVN3AEI2is4UdubJx6
X-Proofpoint-GUID: tEgflQgjj2jv42cVN3AEI2is4UdubJx6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-16_06,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=manish.mishra@nutanix.com; helo=mx0a-002c1b01.pphosted.com
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


On 15/12/22 11:05 pm, Peter Xu wrote:
> On Thu, Dec 15, 2022 at 09:40:41AM +0000, Daniel P. Berrangé wrote:
>> On Wed, Dec 14, 2022 at 04:30:48PM -0500, Peter Xu wrote:
>>> On Wed, Dec 14, 2022 at 09:14:09AM +0000, Daniel P. Berrangé wrote:
>>>> On Tue, Dec 13, 2022 at 04:38:46PM -0500, Peter Xu wrote:
>>>>> From: "manish.mishra" <manish.mishra@nutanix.com>
>>>>>
>>>>> MSG_PEEK reads from the peek of channel, The data is treated as
>>>>> unread and the next read shall still return this data. This
>>>>> support is currently added only for socket class. Extra parameter
>>>>> 'flags' is added to io_readv calls to pass extra read flags like
>>>>> MSG_PEEK.
>>>>>
>>>>> Reviewed-by: Daniel P. Berrang?? <berrange@redhat.co
>>>>> Suggested-by: Daniel P. Berrang?? <berrange@redhat.com
>>>> The last letter of my name has been mangled - whatever tools used
>>>> to pull in manish's patches seem to not be UTF-8 clean.
>>>>
>>>> Also the email addr isn't terminated, but that was pre-existing
>>>> in manish's previous posting.


Yes sorry, noticed it now, should i send another patch to update it. Also in our internal testing we noticed multifd_init was skipped for 1 case, so if this patch series is not yet submitted should i send another version of it early morning monday?

Thanks

Manish Mishra

>>> I'll fix at least the latter in my next post, sorry.
>>>
>>> For the 1st one - I am still looking at what went wrong.
>>>
>>> Here from the web interfaces it all looks good (besides the wrong
>>> ending..), e.g. on lore or patchew:
>>>
>>> https://urldefense.proofpoint.com/v2/url?u=https-3A__lore.kernel.org_all_20221213213850.1481858-2D2-2Dpeterx-40redhat.com_&d=DwIDaQ&c=s883GpUCOChKOHiocYtGcg&r=c4KON2DiMd-szjwjggQcuUvTsPWblztAL0gVzaHnNmc&m=UYXwYmi1YA2mdAgHNDIkmgh-Xbem8hmqgCedCRNaj-32GKMVK8X30wH3nnXE9VF9&s=_9G0TGvGLvwCdB7vumPEboQqcrX5RoaxZ_4aZTnMDzY&e=
>>> https://urldefense.proofpoint.com/v2/url?u=https-3A__patchew.org_QEMU_20221213213850.1481858-2D1-2Dpeterx-40redhat.com_20221213213850.1481858-2D2-2Dpeterx-40redhat.com_&d=DwIDaQ&c=s883GpUCOChKOHiocYtGcg&r=c4KON2DiMd-szjwjggQcuUvTsPWblztAL0gVzaHnNmc&m=UYXwYmi1YA2mdAgHNDIkmgh-Xbem8hmqgCedCRNaj-32GKMVK8X30wH3nnXE9VF9&s=Nv0ek8VsMHEDFdQ--vwCOrwxT_u1KqbV9014SQzI1kQ&e=
>>>
>>> It also looks good with e.g. Gmail webclient.
>>>
>>> Then I digged into the email headers and I found that comparing to Manish's
>>> original message, the patches I posted has one more line of "Content-type":
>>>
>>>    Content-Type: text/plain; charset="utf-8"
>>>    Content-type: text/plain
>>>    https://urldefense.proofpoint.com/v2/url?u=https-3A__patchew.org_QEMU_20221213213850.1481858-2D2-2Dpeterx-40redhat.com_mbox&d=DwIDaQ&c=s883GpUCOChKOHiocYtGcg&r=c4KON2DiMd-szjwjggQcuUvTsPWblztAL0gVzaHnNmc&m=UYXwYmi1YA2mdAgHNDIkmgh-Xbem8hmqgCedCRNaj-32GKMVK8X30wH3nnXE9VF9&s=wD5Y-ZvvyUOVKpYHJkM7M8znJ3BjjpkbRIE1NVlMloI&e=
>>>
>>> While Manish's patch only has one line:
>>>
>>>    Content-Type: text/plain; charset="utf-8"
>>>    https://urldefense.proofpoint.com/v2/url?u=https-3A__patchew.org_QEMU_20221123172735.25181-2D2-2Dmanish.mishra-40nutanix.com_mbox&d=DwIDaQ&c=s883GpUCOChKOHiocYtGcg&r=c4KON2DiMd-szjwjggQcuUvTsPWblztAL0gVzaHnNmc&m=UYXwYmi1YA2mdAgHNDIkmgh-Xbem8hmqgCedCRNaj-32GKMVK8X30wH3nnXE9VF9&s=eQ3eyB3GvzUzyHdjTlWTt14dw4x0PL2xSbmXWPfN104&e=
>> Don't trust what is shown by patchew, as that's been through many
>> hops.
>>
>> The copy I receieved came directly to me via CC, so didn't hit mailman,
>> nor patchew, and that *only* has  "Content-type: text/plain".  So the
>> extra Content-type line with utf8 must have been added either by
>> mailman or patchew.
>>
>> So it probably looks like a config problem in the tool you use to send
>> the patches originally.
> Ouch... for misterious reasons I had one line in .gitconfig:
>
> 177 [format]
> 178         headers = "Content-type: text/plain"
>
> And that'll also affect git-publish too...  I have it dropped now.
>
> Thanks,
>

