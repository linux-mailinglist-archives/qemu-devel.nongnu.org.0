Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E55164982CC
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 16:01:36 +0100 (CET)
Received: from localhost ([::1]:56740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC0qd-00006o-F6
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 10:01:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rohit.kumar3@nutanix.com>)
 id 1nC0oj-0007r0-CX
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 09:59:37 -0500
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:29404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rohit.kumar3@nutanix.com>)
 id 1nC0og-0003Jx-5t
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 09:59:37 -0500
Received: from pps.filterd (m0127841.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20OEYElZ018905;
 Mon, 24 Jan 2022 06:59:31 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=0YgFafY7yCytDlN/zCAdFDq+q3GsLyfF5z4kGy13XrY=;
 b=qu7N9KSzwaW/sx57kixULG4Ao8gmqJoVMpd+tNSgUzMJvqD1Cjs7OkPxzfZ5Rmg9yciB
 vMfxp7RgrFRoGMs/DtkQTTRmy30uHwtcxG1eJHBqODzislZiMFsUMRnibn9ljPgC6Wuh
 PVvqDY+15K2VRcAkSFeeHHGnfK+BwAYTqTtSACm7ahOahkjX6l8foh6NMP1dTPOsvVg7
 BTscFlFXmTvxcMUE6xkXvS1hwRZTphPq4gSRcKI+H3wbC5JfAvONngw26galRzqiBGQ+
 1H/ne2JWnralvPvOHk5CEnF8U2uRV8M/ZYOrYMm9k9NfmmwD+6YCAmtfPPCqZzfdZM/q zQ== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2107.outbound.protection.outlook.com [104.47.58.107])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3dspvmgvdg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Jan 2022 06:59:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IfIncC3CiA2CWrApst7PuYWMOljEY4eETTvXUUWQ91jP79tEHFjyGt5hKBi26YGqLHV/+sIm7L31T2naNeVW8KKm0laXlWIOTfNRU+w2ueN2SIPxRIIknLG6slClckRLWGnoMjMNwf2xqj/pNkAW0uE/0ES42J7I/YySgYH6yk+LMSJSp8fgJqjWDDUAgvdWKMJb1Co21zY0pjggWiohOQpLrpeORNJgfgv2Pxook0RZwtsNH0SPnOhz53qcqN+7OXeHPUlZO3+QijedIad0tNB24QanZrfHnzWAMPP+foaTgLt3Cj+ZtMl8rMmyA27BVRTN09atY0RL9ZZvygy5hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0YgFafY7yCytDlN/zCAdFDq+q3GsLyfF5z4kGy13XrY=;
 b=Vu4ipHpsi/qmTRd+MwJuc3QXe9mQjtEEbExClWQ3zrmsFEV+CYwddaIqejqTCughQqQUyL635HCuB3hg5MNmYq+Ebz4Vtojyr3UOKlnEsYWGSlS+8EGI2RZtGS71pCgTc9wemdXq7XfDS532v8X/MCSfmjJY59jf62V5oAigSQ0N8dxxWOxRMTFja8k+qdFQieX0z3IjvI2lvKQmEhLdbb2VGGEzEpkxEDisWClZea6dvRHaSZYoaSlGM2b2r7sC3qnhQ9+EuIjfZ/4C23uLW8bi5K6qcOGV9aihMqBD//zRnoSndb1B6GE9nTZZNWIV8VITFIxo4dlk6iatfC38WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from SJ0PR02MB8564.namprd02.prod.outlook.com (2603:10b6:a03:3f6::16)
 by BN0PR02MB8158.namprd02.prod.outlook.com (2603:10b6:408:16a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Mon, 24 Jan
 2022 14:59:29 +0000
Received: from SJ0PR02MB8564.namprd02.prod.outlook.com
 ([fe80::d481:55f4:159e:d210]) by SJ0PR02MB8564.namprd02.prod.outlook.com
 ([fe80::d481:55f4:159e:d210%3]) with mapi id 15.20.4909.017; Mon, 24 Jan 2022
 14:59:29 +0000
Message-ID: <aef97cd1-0d7c-4920-476d-3352352ea3a7@nutanix.com>
Date: Mon, 24 Jan 2022 20:29:16 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH v1] Check and report for incomplete 'global' option format
To: qemu-devel@nongnu.org
References: <20220104134102.1080890-1-rohit.kumar3@nutanix.com>
From: Rohit Kumar <rohit.kumar3@nutanix.com>
In-Reply-To: <20220104134102.1080890-1-rohit.kumar3@nutanix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0018.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::18) To SJ0PR02MB8564.namprd02.prod.outlook.com
 (2603:10b6:a03:3f6::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4ab7e78d-f6c9-4da0-f913-08d9df4a1eff
X-MS-TrafficTypeDiagnostic: BN0PR02MB8158:EE_
X-Microsoft-Antispam-PRVS: <BN0PR02MB81580760D15881E2FB2A6F25D15E9@BN0PR02MB8158.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Oob-TLC-OOBClassifiers: OLM:826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NZaJCLkLkBBPYoSi6AADCgPErZ9ZQsvCCErc5ShCvCX9eZM/BspgDUDZ9Q0Vc71bkl9cu0b0USyc3khoH583TmQDVWaNVO5S9MZNIj/LjUEOV7cb3r2nGT0ByXDUN2VDt6T871NAsfkdOtYpxAMps6+Poclx1pzo5hErUgFuLT1/tJuryJRtc4rS3ysa0fUvo8aF7cqAYPlfyByhkM8wvLeXWDkehBX1zRdm59pGl2GNhYefVPVvLHbT9LvGDDE+hr/d27V2+INbiCeOfK4aBtSQgT8/Zw81PSqWe57LPvOxxEAFZzht6y2eeo2GTxm+q6lYDwW4yXQQfaSFrzDNKa+LwAtZ6p1n+pj2II/Q1aMuY/gYbsEL+rtP4OfrklxAdI2r7+9qmndoTac0hEMQ2Vq03Qmn3rEu2XItNdD7DTMF0nxpKBwvl7Aftrp5rQVy3pt5X+bKwsDRNDyod77a1OIUCMUwwx5umpFI31KCaqJLt7uBwpt5bhRWq+cTkUdxc/QM2x8JWtxdADHPp91PMcIiCk6qizLbcoW61unxJa+llMPrV73NtbI1xM65msMagEtjtePizqha4hA6ZhBctYIDjRQDe3vRy95Yn1r03Qri3/1BfxPz2VEqzKlfZwUuApb/lefsyZ7HeNUsF6vpN6ImQhnU7ICIEWfhHgDUlAzIcAaXw4ePrMJkoo0VP9VpQjhG7Jt+ErwuolQnoaN3KDYbPelAdLgof+udXdPpybx5xFK5AXjbw75R+1aDQRAtTLPW7fo+vA198VCezfHHVbkUF4HNCsRVmNgPEYj61KTAitF7GNOXNfZrVpjIe37eI7Yvg9lE6LlM9nqqisp0WAnA029E6H50FE/jKXymyENcgBNFzE+DyRmAcM6lWol2q/W7p/wjtqYIWTbXsbRxEQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB8564.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(8936002)(2906002)(83380400001)(5660300002)(36756003)(86362001)(6916009)(66946007)(66476007)(66556008)(52116002)(6512007)(6666004)(966005)(8676002)(316002)(6486002)(6506007)(54906003)(38100700002)(31686004)(38350700002)(186003)(53546011)(508600001)(26005)(31696002)(4326008)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WHpoVW1iWXk1SnA5cGNZK2c1QWNtWUNlSGZydUNIMDQxbU05Q1VhbUNQeUNh?=
 =?utf-8?B?NXhtek9sVHhsRWhJZk5HQjdTbjFpZ3pETTJHcm1PbjBRdUc1Ry9kR2xwYitw?=
 =?utf-8?B?S1dxdk1LelZDcVlrYWFCaUpKVUVKQnN6QzJhRVdhZHRCem1ZZGZHZEtvYlJM?=
 =?utf-8?B?Z0g3RU8zaTROelVTQm5NTGtZYU0zOFM5UTYyRWI0WmZlQ2lUT0dTVEVoSEx6?=
 =?utf-8?B?a3dJUVdxbEt2VTB1bGdtaGdMQkhpNU5oUDhGZVZBaVNkcHFRS3dlMnBOK0Nu?=
 =?utf-8?B?WWJhdHNCb3RRRHpqMmczYlNWY3BBaTV4QjVjSE5tbGZsUlJKNVhTanppdTBS?=
 =?utf-8?B?QXJrQVJCeGhYaCszN1VBT1NXaTM4SkF2dnYxV29ocHZPMFRYNzNaMTdNbC8v?=
 =?utf-8?B?NWdTS2tXcVpqVnlnSi9jd204dHZoQ1QrWFoyeWovNWZNU1ljY0NYNGdUVXlJ?=
 =?utf-8?B?QXVnanFLeUplLzBLQXc4SlBWUHFaRUxZb2Z2Ly9mQmZzSkpvYnNaUGpzMTk3?=
 =?utf-8?B?UmV1Ky9iYmNsb3JQaHlFcGhSaGRVL3M1NTROdDlnUDNXU1JpeFFjcko4UW9S?=
 =?utf-8?B?c2ZWY2ViSVF0N2VON3YxYy9HdHh2UkdHQVk4dHordDBuK2lhZHVsUGVLbXRl?=
 =?utf-8?B?MXBvS1RXMVNTWUtIczh5cU5jL2ZrVTd4K1hNMGYxVFVFYnI4dSt0WlJSdjBJ?=
 =?utf-8?B?MVJrQXZDLzhmclhkc3VXTUZPOE9Rd2U4WU1ITkMwc3Uza3pJT3pxNGl0eXZw?=
 =?utf-8?B?QUxGeEFFK3RVYkhoa214OGFjaUgyeHBockg5YUl6MkxjM1ppbVE1RTM5Q0lQ?=
 =?utf-8?B?ZVA1WGhKSWdYN2dZRmptREFPYk5CODN0U3lQU1M2aFNVS1pyRnNiMVFveVo3?=
 =?utf-8?B?ZHprYkNlL1BTU2VmaXN2bE9ad3pETEFOWXlnazJQVXpDQjRvbEVHVjBMVnJP?=
 =?utf-8?B?VzJXWVN1eUJZTGhhYW9vV3dkUmtKTkRPZDJFaHVDRlE5WE9JaGIzdEowRUFL?=
 =?utf-8?B?Y0dNTkEzcHJwc0hzZ1pQRWV2bkw0U1BUQUo5Z1JibGVMcklGdkk5aUJvQVpx?=
 =?utf-8?B?YTJpVEZKcThBOWxURUprK1dscVN4Umt5Q0drTUxhT1JrRk5xT0grTCs0Umdi?=
 =?utf-8?B?RktqdU91QUthNjM5Nk00bFVhWWUvTmJrRkUxeGdSTmM1cEM3QkpiMitBcjlI?=
 =?utf-8?B?cDJCSTIxVXVTRnA3djlWblpBSkVXZFR3b3hMREh0YkFhWHlHcHp1ZGp3VVhC?=
 =?utf-8?B?VnpGZWN3U1gwY2huWFB2OUlrUS9MaXlPWm5DSW5EeDVUeXhJbXhOdDNvb0JT?=
 =?utf-8?B?TnBWdHFHNXRrcUpOK2FGbTdxMGxxN3lPSXluL1FZbnUvZTdPbndVb1BiUyta?=
 =?utf-8?B?Vjh1Vm5qaVUrbGdzdmJXQVFKYTBEWkxSVmg3a2Q3YVNCZXg5RU9hL01LQUIx?=
 =?utf-8?B?MmRRVHJ4d0VnTTIzdVdoN1lHbU03MHNlcE41ZWNvclVXY2NrSisrVnMyd0pQ?=
 =?utf-8?B?TitvZTZIL0lScVFUSmlhaGRpT3VVUTMwMkwxNDAxSmFScXNHQzFybjArYkdy?=
 =?utf-8?B?ZmcxM0FZcG5FaHdEMEFZUE1PUlR4bkdZMlRSeUhXd0Rkc3NJbkNITGV0eE5s?=
 =?utf-8?B?b2JIY0JlYmFVNVNvbWhScVBxNkpCU3VCZ3dWcm5MM2pRR2c4Wm5idkNNSFoy?=
 =?utf-8?B?RzFPTmRKUnczQTVLMEZmNTVTV0ZwSUE5emtxOVpOckRzbTk4ZCtSRnlWMm5V?=
 =?utf-8?B?U212SmE0UDlQT0NpRHREYlZiSFRUUWR1cXl0Qm9FTStVYzY1MnJWVXNQcHMr?=
 =?utf-8?B?dmw1OUJPTUFVT3AydWNmMk5JcFZ2VU1kT2FQc2ZPVEFIcU93c2tURDd4YTFV?=
 =?utf-8?B?ZFRlUm84TDR3Umc3bEkxdkV4OGRLNENiVm5OYmlydDRsNGNWbGJZUmxCRU9t?=
 =?utf-8?B?MWs0ZWRTbXZpcVNVcFNMRlVVQnMrV1dZem9aSXFHNnc1Z3NYUFg0Nk9zWkZD?=
 =?utf-8?B?SWp3MDltam9HYVEwMDBkR091VWE1c0EyWFFyT2N2Z0E3eTBVckVPTHppRmRU?=
 =?utf-8?B?OG9pUktkRklWcXE1dERyWFRkWkFTQzMxcFZoN1pCNXVNWm9CbWc1dUc5dllP?=
 =?utf-8?B?cFRLWitHb1RncVhPS0pBb2pDVGEya0hUZ1l4KzBCNjRtWFRURVorR24ra3VP?=
 =?utf-8?B?ZCt5R1l6c01VZVU1Mjl4MnZiVHF3NEpKeWs0YlJKK1FLMlJ4dFBTL1JyeGhV?=
 =?utf-8?Q?mRfZy33wn5ruwMzSMxaV17JQ1vn65iFOgBUfOijhr8=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ab7e78d-f6c9-4da0-f913-08d9df4a1eff
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB8564.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2022 14:59:29.5156 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vIraSFU8WArD2qysnuavmZQ+yFY9ipAKPdXoESaErOrJI1dEGFoQQLqSZfhnu8sgQIZ+wH2w9Ip1P8Mw/H45yn30OFCyftKtBenbQoNs4eo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR02MB8158
X-Proofpoint-ORIG-GUID: WB_2xvqM3TuvSHleCY330cm_22nYr_6J
X-Proofpoint-GUID: WB_2xvqM3TuvSHleCY330cm_22nYr_6J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-24_08,2022-01-24_02,2021-12-02_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=rohit.kumar3@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
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
Cc: prachatos.mitra@nutanix.com, Thomas Huth <thuth@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, prerna.saxena@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping.

Hi, please review this patch.
Link: https://lists.nongnu.org/archive/html/qemu-devel/2022-01/msg00296.html

Thanks !

On 04/01/22 7:11 pm, Rohit Kumar wrote:
> Qemu might crash when provided incomplete '-global' option.
> For example:
> 	qemu-system-x86_64 -global driver=isa-fdc
> 	qemu-system-x86_64: ../../devel/qemu/qapi/string-input-visitor.c:394:
>    	string_input_visitor_new: Assertion `str' failed.
>   	Aborted (core dumped)
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/604
> Signed-off-by: Rohit Kumar <rohit.kumar3@nutanix.com>
> ---
>   softmmu/qdev-monitor.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
> index 01f3834db5..7aee7b9882 100644
> --- a/softmmu/qdev-monitor.c
> +++ b/softmmu/qdev-monitor.c
> @@ -1020,6 +1020,7 @@ int qemu_global_option(const char *str)
>       char driver[64], property[64];
>       QemuOpts *opts;
>       int rc, offset;
> +    Error *err = NULL;
>   
>       rc = sscanf(str, "%63[^.=].%63[^=]%n", driver, property, &offset);
>       if (rc == 2 && str[offset] == '=') {
> @@ -1031,7 +1032,13 @@ int qemu_global_option(const char *str)
>       }
>   
>       opts = qemu_opts_parse_noisily(&qemu_global_opts, str, false);
> -    if (!opts) {
> +    if (!opts || !qemu_opt_get(opts, "driver") || !qemu_opt_get(opts, "property") ||
> +        !qemu_opt_get(opts, "value")) {
> +        error_setg(&err, "Invalid 'global' option format\n"
> +                   "Expected: -global <driver>.<property>=<value> or "
> +                   "-global driver=driver,property=property,value=value\n"
> +                   "Received: -global %s", str);
> +        error_report_err(err);
>           return -1;
>       }
>   

