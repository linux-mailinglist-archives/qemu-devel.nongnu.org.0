Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEE76179B8
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 10:21:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqWP4-0004gk-BA; Thu, 03 Nov 2022 05:20:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1oqWOz-0004dD-0l
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 05:20:45 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1oqWOw-00025O-T4
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 05:20:44 -0400
Received: from pps.filterd (m0127844.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2A37PxnP020821; Thu, 3 Nov 2022 02:20:39 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=NEnxerPOO288cJfvF56zEMFCdpCB1NYIcrL+JUhU9SI=;
 b=g/PA3RHcr/SspIqUEd+W4ZZBDjEO9UmNuM3IeBAlBoosMxWfjMeUzu8kKAAuP9dWKlKY
 uj2uk0tr8eI8pbDSYTG5D1TDM4Yi1Mnf2vyZ1qp6IQizBpPrseUxYexKVJSpJYeMzHvR
 qxtoil4wigVoJjza4yjKptwVAkzPv/5aH89QurXtShk6cyxbK5TJF2dpBlM5/UKv1ALg
 tGSk6jCiTlqLLtEn2RhO09bemnMM/4zR93jGSsj/YQIItA4h5goS+0r8pBmO+ffx+/Em
 HYXqyJYJbjNeUlcAIFNKnuLr1XRIfC+2A+mVOHkW4dMuX6/Mhl62kT+7Y2BtkmHcouL+ zA== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3km03k97us-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Nov 2022 02:20:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RxpzgnJnstIrsYFV+ZP8O605n/i8ym2iDtV6hTObX3pRyD8IXFJuB+n6iwZ7f1LYpFSzbeU0vgqc6rQ/Lv7+SL9S5whovxHvUELSy349FqtTwugh5Qgcij4oox1ufGfH0eWmXe7rJ+/jwGz9xUoZIyadiG6/T6fTCbcWD7XR939YmGUlfjOKOWk4zp8l8YJpsHwCGlMoA5bTwME17x16hpwZ0zOV7fV06UsJceTiFWBwT4ibjWRzpI41qZyaveSovmdepgaiN6WBSdX52XY1RNbjtU7yGQL8Qps3Hy9hQMMUrHNKiRX+Yj82rG2NFJeunPRMskxs43Ilkgsd9vb88w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NEnxerPOO288cJfvF56zEMFCdpCB1NYIcrL+JUhU9SI=;
 b=gl56bHjXYi7hrrdvksmrIcKWgjiGpPa+lvbKy92p/wOVq3Xb7j1s8kthMs+94sD4+5/wEPm/z/HZcGYh787dPgvetPBTk/hxBB5AFgkCPjw+c3VlB7uMuD1JxZAyxagcn0ElUTuNt+moABfpHAVxfi9OzoQRsWSOi0ljGjxUlu/7LG23IXazwANmzJ4QEsDrMN86KSf/jlNZ9Pd751qDs1AsAZJCp0FeZavL6A4ugvTO4j1S6EgSw1fvz8uli4Lc96Y8zyl1S7Qyay8VhEYgrSlW2C090G8Zu8NsV/jsaRr2Ys23YI023c3tXxevFOexcuDx8lsW1wv2itAYIzkH2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NEnxerPOO288cJfvF56zEMFCdpCB1NYIcrL+JUhU9SI=;
 b=d1CZES76DNrrZyexI92ktrGYjwDUcqAhDTp+vz6/mQw9cPvSUVy3jiTphjDkD2Tu69qEF3sB83n6QW/KtaT35MyAjb05KTblRwAKPUSmhETXA1+lPmTo1nrUmNlXQBmTLSdQKS6mjqHARq4JRUiEFWC/2sJLqrSrFlga3vhNNQY82Ewe7AZHDcEf5P1IKc9CjMeVdXK+bYRfm4Manr+3i/YA6NLNQsjgScXGtlpwQeAltq59b7mx+sAHFj/e7/XWNrWK5u082DCNTFFlBCSk/5kyxvbBryUBn/9g43EoLQOBS8nIWrXYeEBxTDLUVr/n+D/ZW+QDZYVPJTn5pjU1/Q==
Received: from PH0PR02MB7384.namprd02.prod.outlook.com (2603:10b6:510:12::12)
 by PH0PR02MB7669.namprd02.prod.outlook.com (2603:10b6:510:5d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Thu, 3 Nov
 2022 09:20:36 +0000
Received: from PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::c63:8c2:93a6:8f82]) by PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::c63:8c2:93a6:8f82%5]) with mapi id 15.20.5791.022; Thu, 3 Nov 2022
 09:20:36 +0000
Message-ID: <e5f69a86-f625-3cdb-4a25-065a0612548e@nutanix.com>
Date: Thu, 3 Nov 2022 14:50:25 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH] migration: check magic value for deciding the mapping of
 channels
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, peterx@redhat.com,
 Prerna Saxena <prerna.saxena@nutanix.com>
References: <20221101143029.14246-1-manish.mishra@nutanix.com>
 <Y2EyVkdLMln7CX15@redhat.com>
 <9faf2604-f0b9-f3c3-5ac8-e4deeeebc424@nutanix.com>
 <Y2E+/WZgWXQQgdY5@redhat.com>
From: "manish.mishra" <manish.mishra@nutanix.com>
In-Reply-To: <Y2E+/WZgWXQQgdY5@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0065.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::9) To PH0PR02MB7384.namprd02.prod.outlook.com
 (2603:10b6:510:12::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR02MB7384:EE_|PH0PR02MB7669:EE_
X-MS-Office365-Filtering-Correlation-Id: e99c25bf-5d0f-4093-ca77-08dabd7caa61
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YrTTj7ibPJVB4h7jYvW8ueLsyIpjc4IS731CIDNR26Y8G4r3aPD+xBHzpIK94sGtCuopUKzQ+uomQsFTqBfMc5mIEGgpj/Fo+5ZkjqtMcqZTyM7mGTQ1KoxZwPt/l0uUUeYW5MRn6up2MkPdJ910H7RXNPLV+nw0qErZmXUvjYolonSvgo/88CrtRP23uS46LTNulPtafZpPkO6UOyBObWSLoOB2C+68b6dC/aJB4jGgBiqwN+FLtDRSTJWS70hLFQJlRpxhGCCDch5LG/BzXx3kEHJCEuAqwmD3jP7lMy6CadHnGkRXt2OozJrZHSTMLScpFGkfxUu8lNLR50zDExgGd8q4MTWUmWtVtkAuUJeG51LXgIJHu0C7URSyxiNp3ESEmkqgbl0wu9HigrbB7aOCwi6HHR96rOdcrcItWv7MDh4fVnRqpuiJDZsZ9mH0qTyNOAl0gR+b4ca9NeEsFPX6ZRI34Skb7HpdlrOjLt3uI4XqxmhcAItskFZV2oxdxtY4pQyjDO/Iv8KpujHydfQecfxfW2QMY+319toPEie/v1PhsIig2qHIT9jrKKo81qZblgnxm35pNWdRWeYn/03TRNcZttLqsxck70BWgisiCCO/0zzYby8SbzraM/0IsLdzwnnvRAwJybpZ6JUU8iIWpq0zzOKWu7843bBjunvRIWRD/0a7hkveUBptHo3CElJ+dhKbK9y+98H13PvYMdCwKSZnUVK5u3Ff4Vf8UAPuzwsv2aj+KR5BLwOL7Nk89Uy4+TN9UzESA5FwTujwgDFEiGYxrpJ8blRTHHaQmtY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7384.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(366004)(39860400002)(346002)(136003)(396003)(451199015)(2906002)(31686004)(36756003)(83380400001)(31696002)(5660300002)(478600001)(8936002)(8676002)(186003)(41300700001)(66556008)(86362001)(4326008)(66946007)(2616005)(66476007)(38100700002)(316002)(6506007)(26005)(6512007)(55236004)(107886003)(53546011)(6916009)(6486002)(6666004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bVE0OEJGb2tnVmp6ZUtUeFBJS1dPTU40SjRnM0tFWjNZUS9FemQ4aWRNbUlo?=
 =?utf-8?B?eE5Lb1lVcitpOExCZ2Zud0lwby9Vc2tpVlVCbnhpT1QwcFpFaWxVZndOWk5C?=
 =?utf-8?B?UVcyK3M3cUpZd3NFazEra1BjTHZhOTRra1lXczdKS2xFV0NTa3ZmVU9jZTYw?=
 =?utf-8?B?MWVEUHFGeTUvWUdFSnA2L1U5N2ZDbmlib3dyQUVMcjRTNDU5R1RpMWhmWkJj?=
 =?utf-8?B?UHcvZytvZXpXSDNuaVFuaGFVVTRuOVBlaEZNN2p0ZkdqV1lOVElNbUlMTm00?=
 =?utf-8?B?RzFWU1ptV2thSzFQM3U3WVNxSytPNVg2blI0cWd6K2MwRDdqSW9weERGTTMz?=
 =?utf-8?B?MHJ3S1FSdThWZzV1NlNlalkrRDlUbnR0U3NyZjBDRXpjMHdmMStHNUtPTHU3?=
 =?utf-8?B?NG1ERGk1Q0JtS0g4QlNId0xwcVJzbGp5ejRFeUcwbnpaUm0rZ050V01GZDlN?=
 =?utf-8?B?T3I1S3RoOFlKS2VhVFdVZ0VONThEaVVGb2RnVmFrelo1MThlVTM0bnNzNFNy?=
 =?utf-8?B?MEc5UzNiaTZ4TlJuTDArVmdKNFRYQTdBTjZ3OFRzU2Y4UDJhdHFsdHZsOFR0?=
 =?utf-8?B?VWt0KzhvbTJuWitvVmN2TFQ4dkZkOER3VVY1SzRpNXdaZ1dRUUluaUR1Q1NJ?=
 =?utf-8?B?cEY3QnFseUQyM1IzeWxvcWFsWTJBa2duQ0tYL0dBN05XOURVUWl4ZlB1d3I0?=
 =?utf-8?B?MVRGenhNd0QrVWJJZ1BqWVRvYW8zODN5Uno4S21Wb1lWTFFUYmgzVnhRLytK?=
 =?utf-8?B?eGl2SThORlB1bEFDUFhza0l2Nit2a3lMbCs0aGpEWGV4ZU5YY3lnZ242djNy?=
 =?utf-8?B?cHB3YmRGSzNKTFZ2bkZsVlkrRjRSR0phalhySGt1d2JWZEdONWliemZnZ3NT?=
 =?utf-8?B?NGdNTzVlZjRXWGZBdzRJZXh4OU9vOTVPWVN3NzF5YjYzdjRMSEdhRUlSYkl2?=
 =?utf-8?B?V0VhV1dFOWNrM1pjaWNsb2Yza3FlVExZWEpXTXdMazZycHg1QkZabXBBSGlH?=
 =?utf-8?B?cWVFdTRjbEYrZG1DcGVZRFBwcHZROXk2amZnTkYvTjRCNXBUMFVCdG1HZ0pG?=
 =?utf-8?B?Z2ZmMmRuN3AyK0x1blVkVldkRzBhOUxLdXQzS2RwQXdyVCsrZnU4ak1nb3ZZ?=
 =?utf-8?B?dFdEc3pzQ215YkNYSEV5cXRlb3R0SFN3cVZkU2xjODNIR0MyRkxNTENCNERQ?=
 =?utf-8?B?aXl4TkFEOGp5SGZBaWVoQmhWdDBzVTNMMkluMXVoL2FBMkZQOFM2Snd6aTl2?=
 =?utf-8?B?R0wra2pQUVlibDNGajJPRFNaK0NhTHgzUFpQYW11Mm1hbFg3Mys5N1V4VVpM?=
 =?utf-8?B?YWluUUMyQWJjQ1JjbW50Zm9aVVdpU2RJM05PNXVjVEE2bnAvR0QvUWxBUWh3?=
 =?utf-8?B?ZUV5Ujh1bGdnK2lXQkNjd25hUmQvYTA5SHhaYlYwN0dlelFKR09UVituOWRz?=
 =?utf-8?B?MjdDZEliLys1dWJqMTNBdmlsNE03KzJ6dTc1WlB4OCtndTJ4c2Z6TStUQ29Z?=
 =?utf-8?B?bkVpS0QrV0lBUFBJc0VSTW5GWXlpMDlXMUhUczdWY2xNc25Yc0g0SDdJOW8z?=
 =?utf-8?B?TEFCYWZIdnBqUXVhTytDRkFzMDRXR293TTF5VndPcDZtbnhzWDRJSUlWaFBl?=
 =?utf-8?B?TUUrRS82SFJXaTJtRXczVFpGMDdxUmFBZ1pBU0twZjBoNEtFVkxMVUpDVm5J?=
 =?utf-8?B?UnBNdnZmOTZRY2dSV0NtQUZzc2wwWUF4RlhHZ3U1Nkx2K09CeEhCRXpJN0Q3?=
 =?utf-8?B?WDZ0TWt6dzFlWXhycm9MTE1hWERCVUk0U3J2VXBLMzNDOWJnelUzaFAzODBw?=
 =?utf-8?B?eG5pWmovR1NFNFFyMlVlN0o1cU5tTktwV2d4RVJ3L1ZzVFlrRlNOOFBYWTM3?=
 =?utf-8?B?ZEdqaTVtK1FOOXl3V2lRcjBDdzc2bVY2Z1Q1RmcxRTM0RVJOazhsRXA0UGdh?=
 =?utf-8?B?L1VJZWhlM1FlNjQzcU5PZGlQem9SQi9qMlpEUjQxV0NuekE4NlkxRzRRZkVM?=
 =?utf-8?B?dll0S0pDelI2eVFyYWk5MXg3OGtSTjVTWjhSL0phS0drdEZlRlNBWmtJYjFE?=
 =?utf-8?B?S1ptd1haUnFTUEMvQ0srRzExcTNlN0lmdmNzVE4xRG44VnJRTFE5ajVFTGFl?=
 =?utf-8?B?ZVJreWRJQnljYlpyekREV3dWd0RrZUwrQVFTZER4emNnQm9ZZ3BTdXJ5TExI?=
 =?utf-8?B?OEE9PQ==?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e99c25bf-5d0f-4093-ca77-08dabd7caa61
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7384.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2022 09:20:36.0662 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5zMXjz4o2DALdkxcS5VUiFmhvE4YjmMPB5ohmkaVVX29mtXwZx83QS7N+mkETAyoGWOwngKWREps2N5hTblbvJPK1ZHdnnjrup1RZKno9BY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7669
X-Proofpoint-ORIG-GUID: JltU-xH63__fXEmz58LxyMZKlV-Xf1Aa
X-Proofpoint-GUID: JltU-xH63__fXEmz58LxyMZKlV-Xf1Aa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-02_15,2022-11-02_01,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=manish.mishra@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


On 01/11/22 9:15 pm, Daniel P. Berrangé wrote:
> On Tue, Nov 01, 2022 at 09:10:14PM +0530, manish.mishra wrote:
>> On 01/11/22 8:21 pm, Daniel P. Berrangé wrote:
>>> On Tue, Nov 01, 2022 at 02:30:29PM +0000, manish.mishra wrote:
>>>> Current logic assumes that channel connections on the destination side are
>>>> always established in the same order as the source and the first one will
>>>> always be the default channel followed by the multifid or post-copy
>>>> preemption channel. This may not be always true, as even if a channel has a
>>>> connection established on the source side it can be in the pending state on
>>>> the destination side and a newer connection can be established first.
>>>> Basically causing out of order mapping of channels on the destination side.
>>>> Currently, all channels except post-copy preempt send a magic number, this
>>>> patch uses that magic number to decide the type of channel. This logic is
>>>> applicable only for precopy(multifd) live migration, as mentioned, the
>>>> post-copy preempt channel does not send any magic number. Also, this patch
>>>> uses MSG_PEEK to check the magic number of channels so that current
>>>> data/control stream management remains un-effected.
>>>>
>>>> Signed-off-by: manish.mishra <manish.mishra@nutanix.com>
>>>> ---
>>>>    include/io/channel.h     | 25 +++++++++++++++++++++++++
>>>>    io/channel-socket.c      | 27 +++++++++++++++++++++++++++
>>>>    io/channel.c             | 39 +++++++++++++++++++++++++++++++++++++++
>>>>    migration/migration.c    | 33 +++++++++++++++++++++------------
>>>>    migration/multifd.c      | 12 ++++--------
>>>>    migration/multifd.h      |  2 +-
>>>>    migration/postcopy-ram.c |  5 +----
>>>>    migration/postcopy-ram.h |  2 +-
>>>>    8 files changed, 119 insertions(+), 26 deletions(-)
>>>>
>>>> diff --git a/include/io/channel.h b/include/io/channel.h
>>>> index c680ee7480..74177aeeea 100644
>>>> --- a/include/io/channel.h
>>>> +++ b/include/io/channel.h
>>>> @@ -115,6 +115,10 @@ struct QIOChannelClass {
>>>>                            int **fds,
>>>>                            size_t *nfds,
>>>>                            Error **errp);
>>>> +    ssize_t (*io_read_peek)(QIOChannel *ioc,
>>>> +                            void *buf,
>>>> +                            size_t nbytes,
>>>> +                            Error **errp);
>>>>        int (*io_close)(QIOChannel *ioc,
>>>>                        Error **errp);
>>>>        GSource * (*io_create_watch)(QIOChannel *ioc,
>>>> @@ -475,6 +479,27 @@ int qio_channel_write_all(QIOChannel *ioc,
>>>>                              size_t buflen,
>>>>                              Error **errp);
>>>> +/**
>>>> + * qio_channel_read_peek_all:
>>>> + * @ioc: the channel object
>>>> + * @buf: the memory region to read in data
>>>> + * @nbytes: the number of bytes to read
>>>> + * @errp: pointer to a NULL-initialized error object
>>>> + *
>>>> + * Read given @nbytes data from peek of channel into
>>>> + * memory region @buf.
>>>> + *
>>>> + * The function will be blocked until read size is
>>>> + * equal to requested size.
>>>> + *
>>>> + * Returns: 1 if all bytes were read, 0 if end-of-file
>>>> + *          occurs without data, or -1 on error
>>>> + */
>>>> +int qio_channel_read_peek_all(QIOChannel *ioc,
>>>> +                              void* buf,
>>>> +                              size_t nbytes,
>>>> +                              Error **errp);
>>>> +
>>>>    /**
>>>>     * qio_channel_set_blocking:
>>>>     * @ioc: the channel object
>>>> diff --git a/io/channel-socket.c b/io/channel-socket.c
>>>> index b76dca9cc1..b99f5dfda6 100644
>>>> --- a/io/channel-socket.c
>>>> +++ b/io/channel-socket.c
>>>> @@ -705,6 +705,32 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
>>>>    }
>>>>    #endif /* WIN32 */
>>>> +static ssize_t qio_channel_socket_read_peek(QIOChannel *ioc,
>>>> +                                            void *buf,
>>>> +                                            size_t nbytes,
>>>> +                                            Error **errp)
>>>> +{
>>>> +    QIOChannelSocket *sioc = QIO_CHANNEL_SOCKET(ioc);
>>>> +    ssize_t bytes = 0;
>>>> +
>>>> +retry:
>>>> +    bytes = recv(sioc->fd, buf, nbytes, MSG_PEEK);
>>>> +
>>>> +    if (bytes < 0) {
>>>> +        if (errno == EINTR) {
>>>> +            goto retry;
>>>> +        }
>>>> +        if (errno == EAGAIN) {
>>>> +            return QIO_CHANNEL_ERR_BLOCK;
>>>> +        }
>>>> +
>>>> +        error_setg_errno(errp, errno,
>>>> +                         "Unable to read from peek of socket");
>>>> +        return -1;
>>>> +    }
>>>> +
>>>> +    return bytes;
>>>> +}
>>>>    #ifdef QEMU_MSG_ZEROCOPY
>>>>    static int qio_channel_socket_flush(QIOChannel *ioc,
>>>> @@ -902,6 +928,7 @@ static void qio_channel_socket_class_init(ObjectClass *klass,
>>>>        ioc_klass->io_writev = qio_channel_socket_writev;
>>>>        ioc_klass->io_readv = qio_channel_socket_readv;
>>>> +    ioc_klass->io_read_peek = qio_channel_socket_read_peek;
>>>>        ioc_klass->io_set_blocking = qio_channel_socket_set_blocking;
>>>>        ioc_klass->io_close = qio_channel_socket_close;
>>>>        ioc_klass->io_shutdown = qio_channel_socket_shutdown;
>>>> diff --git a/io/channel.c b/io/channel.c
>>>> index 0640941ac5..a2d9b96f3f 100644
>>>> --- a/io/channel.c
>>>> +++ b/io/channel.c
>>>> @@ -346,6 +346,45 @@ int qio_channel_write_all(QIOChannel *ioc,
>>>>        return qio_channel_writev_all(ioc, &iov, 1, errp);
>>>>    }
>>>> +int qio_channel_read_peek_all(QIOChannel *ioc,
>>>> +                              void* buf,
>>>> +                              size_t nbytes,
>>>> +                              Error **errp)
>>>> +{
>>>> +   QIOChannelClass *klass = QIO_CHANNEL_GET_CLASS(ioc);
>>>> +   ssize_t bytes = 0;
>>>> +
>>>> +   if (!klass->io_read_peek) {
>>>> +       error_setg(errp, "Channel does not support read peek");
>>>> +       return -1;
>>>> +   }
>>> There's no io_read_peek for  QIOChannelTLS, so we'll hit this
>>> error...
>>>
>>>
>>>> diff --git a/migration/migration.c b/migration/migration.c
>>>> index 739bb683f3..f4b6f278a9 100644
>>>> --- a/migration/migration.c
>>>> +++ b/migration/migration.c
>>>> @@ -733,31 +733,40 @@ void migration_ioc_process_incoming(QIOChannel *ioc, Error **errp)
>>>>    {
>>>>        MigrationIncomingState *mis = migration_incoming_get_current();
>>>>        Error *local_err = NULL;
>>>> -    bool start_migration;
>>>>        QEMUFile *f;
>>>> +    bool default_channel = true;
>>>> +    uint32_t channel_magic = 0;
>>>> +    int ret = 0;
>>>> -    if (!mis->from_src_file) {
>>>> -        /* The first connection (multifd may have multiple) */
>>>> +    if (migrate_use_multifd() && !migration_in_postcopy()) {
>>>> +        ret = qio_channel_read_peek_all(ioc, (void *)&channel_magic,
>>>> +                                        sizeof(channel_magic), &local_err);
>>>> +
>>>> +        if (ret != 1) {
>>>> +            error_propagate(errp, local_err);
>>>> +            return;
>>>> +        }
>>> ....and thus this will fail for TLS channels AFAICT.
>> Yes, thanks for quick review Daniel. You pointed this earlier too, sorry missed it, will put another check !migrate_use_tls() in V2.
> But we need this problem fixed with TLS too, so just excluding it
> isn't right. IMHO we need to modify the migration code so we can
> read the magic earlier, instead of peeking.
>
>
> With regards,
> Daniel

Hi Daniel, I was trying tls migrations. What i see is that tls session creation does handshake. So if we read ahead in ioc_process_incoming for default channel. Because client sends magic only after multiFD channels are setup, which too requires tls handshake. So basically on destination side we can not recieve default channel magic until multiFD tls handshake is done, so it kind of creates a dead lock. I can not think of anyway to re-arrange it. Also if in tls we do this handshake is this bug even possible for tls case? If not will just !migrate_use_tls() check be fine. I do not have much understanding of tls, if you think this bug is possible even with tls handshakes, I will check for another way.

Thanks

Manish Mishra


