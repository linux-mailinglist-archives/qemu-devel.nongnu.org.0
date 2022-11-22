Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E3B634038
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 16:33:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxVGA-0005XX-88; Tue, 22 Nov 2022 10:32:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1oxVG4-0005WS-Ej
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 10:32:24 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1oxVG0-000281-RD
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 10:32:24 -0500
Received: from pps.filterd (m0127837.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AM8FQop018433; Tue, 22 Nov 2022 07:32:17 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=proofpoint20171006;
 bh=p4MkJhe+P4xVpOiUhZSqEyXlN1pJKy0tDXazJOrn/zk=;
 b=uaUF7fGXEcy7tWEBOo1mietn/hWAP0T8OXpRhF8j84q3qoLRY3OGfdESKik0cvHn/gfD
 Svp7mlO//+dsTVk3IfiaCGuheDafw6BQ6UUVv4pmRbipWdOJBkop7iWJP0u1wDliYiML
 kPqDuH37d7tQCMrMTBa31hH1k8TnvKb72xdYhCDTfM2yjQGocDUippQf2fR74IpwYZg8
 aLQLKO6LGRijq8uy9LPt6n8leIhy7iuEqlnlHWb+aeY3n8H/qlhlMrUsBAWn32twvOCD
 HB5lFDYnwWac9tPEMxvnhJO8OxNCdYVh/fST/YxWCi4Bsxmx2c/4fB3xuMd9lu35AKd0 LQ== 
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam04lp2043.outbound.protection.outlook.com [104.47.73.43])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3kxuxcqy8m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Nov 2022 07:32:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U/VhXV5uWK5Py+fUeZ29Nny4WylGNyQ3wunzw7gb67vepFDWHdJ5wzJRPgSZLf8vfpGT78fN7oanvfXQ6a09/Fjx5PeTt1H+Fs3iPKTNaIAg7KNHSJPSVJR4DSV10EnRCVlcFPybB4R5Vr2lAA1wRs/k2odbZlW+gaF3mAk2qSDUSNEUojSlAnYgq63QjhWCEenueCAHbCuCkfObk6ZDclARuhjVeitpR4qNPZUJLs7rXAJIqD/xmHJGEft2Q+sNIjTbV0PXEiIg2z6QJXtfH5oz+ZA/rXqtqzC5e5PKWI1uUq0HLlEaHjcmw5t5WH2lD0Og49DTL81s77U83QtCOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p4MkJhe+P4xVpOiUhZSqEyXlN1pJKy0tDXazJOrn/zk=;
 b=PmEsBPzuxN8Hgdg0cR+Fom2mLxaZNGqwRe8HD9GAn3Ct0OOiLxcMIRTSwpvLmm14YQE1npF47lve7AR5YqKLdUdsqKCoYM8kvRLxSJ5vHZ/FBFzg4b8OTLymEyQCupP1Nf6jfQyC3J35BPI1kVtTZ2HGCZfVg+OSa1XJ/ZplNiz82q9WJ/hUqD7INYBnGHSqzVaN3fi22Eo3GSvftkdaJthWLCQ23D9lPeom6930WNhmuh9eRbGdqvNQGYoWvnz1aktpEHwMLlaynFg90u4lVys356BM87IiJhw4HE448zti4PXyqtRPpP3Iav/E3DWZ0qWA4IM+0RE3d7nfYnNjnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p4MkJhe+P4xVpOiUhZSqEyXlN1pJKy0tDXazJOrn/zk=;
 b=qQS0mm8B9E3+9oTilZ39Qn3f5G5cNHgHhN8tkCI7PLGw2SIunhT0t4FDLf8v1PznZk8HG6xSoOfpGNeUSSp5km8mk9zPmszb5bQnr0ORoEb8XjH7YNCPmf767/0tZVc5/qyhWQp8McN5SpQ6ga375aUtwfl6I+wshMzPLWwDwp9RvEO54X2cJoXDACgvvlE57RSbbcn6n86Qq5MMLhPDZfXZOEsfxmcCn1u8xSuMEPDSUnAhf2Z+qw/blB7lCBvsLIlERdxgNm3yIDoFHonCgJ7uQs47lT0ra0X1HKMh5LOOJFfDAibjoBpUAmr9vBmh1Jr3WYUffXGVJMkXcbUWJw==
Received: from PH0PR02MB7384.namprd02.prod.outlook.com (2603:10b6:510:12::12)
 by CH3PR02MB9140.namprd02.prod.outlook.com (2603:10b6:610:144::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Tue, 22 Nov
 2022 15:32:08 +0000
Received: from PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::dff2:2d3c:e182:fb66]) by PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::dff2:2d3c:e182:fb66%3]) with mapi id 15.20.5834.015; Tue, 22 Nov 2022
 15:32:07 +0000
Content-Type: multipart/alternative;
 boundary="------------b0aITGKC3JIQsT1059W7z0tx"
Message-ID: <12383abd-0495-a202-fee2-cce64c3d54b2@nutanix.com>
Date: Tue, 22 Nov 2022 21:01:59 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH v3 1/2] io: Add support for MSG_PEEK for socket channel
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, prerna.saxena@nutanix.com, quintela@redhat.com,
 dgilbert@redhat.com, lsoaresp@redhat.com
References: <20221119093615.158072-1-manish.mishra@nutanix.com>
 <20221119093615.158072-4-manish.mishra@nutanix.com>
 <Y3yPoFAo5l/vmB/y@redhat.com>
 <d240734d-8301-ac4f-63de-89e9d2c2174c@nutanix.com> <Y3zffev6eOCl6JBy@x1n>
 <Y3zhcCCf49scoi9u@redhat.com>
From: "manish.mishra" <manish.mishra@nutanix.com>
In-Reply-To: <Y3zhcCCf49scoi9u@redhat.com>
X-ClientProxiedBy: BY5PR17CA0034.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::47) To PH0PR02MB7384.namprd02.prod.outlook.com
 (2603:10b6:510:12::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR02MB7384:EE_|CH3PR02MB9140:EE_
X-MS-Office365-Filtering-Correlation-Id: 72ca3b92-a626-4aa3-05c4-08dacc9eb729
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wc2yBL/7GxfEh+YpG21hDloc3rhcCRAbyZu+O2UcDhkOZWpDvZbpgLLMUK/77CfO3/v6Y3GZd3qGiFujnaGdZ7KC84fpAcv788JIyRzxRcqZCpsoUUCRijo6ZdhjAxl+D7HghTD+DMHvZKiTXhEOUIoHcV/Sps31hJICRKXCUH6tPsS2eXvxlMyLe5GGL0Y2bjDpDdobT7NwwxHU2pCdMfzyHbabmTFEr0QhEavcl5Dk0APHxPh9dxTfSZpin0CNw9IPTyYFf5OEDjlUZUhEKwS4CK+3xT3/YnTnM22lpKFvQH8Sclc+JFU88M1PZNnGFNfg3YX36JKSj/P+BT7xku0dGHEN/X4z0uW8bLvYowchSUw5URr1F7JbA59wXetrAMIo/EeVT1RLAvzAdmZ7x7zp6kiZQrzEExVMkTFMu2y9F1eGWlE2kh37yb09Fb8U6dHztw+kbM6oWIZ1M/y/zTTDYiOoCVvPjtaFmllcWSXcLm2mBvds8kePUf2xR0YKuGi/70WnUScbAAVyUJoAtLGeHZ223aiACbcbZvcUgQO16VRV1fJfn0x7sgon6xz1NfziRpk1NocpBSP/jXMksBW4siam/XP9auoTEmphR5XCcA/i4JAgb76dpLR4TGMwpZy2au33gVv0CkC4r2CdeYe4jSV7LuVW3ye8FiVTvyqsMWFkmFwBiBTB+xdlgKvCakmj7Et/gIQWkUpj9GsR4lhjJwe3+4YuYWycUn1EsAs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7384.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(396003)(136003)(346002)(376002)(366004)(451199015)(31696002)(66556008)(36756003)(86362001)(2616005)(53546011)(41300700001)(66946007)(55236004)(5660300002)(33964004)(66476007)(186003)(6486002)(8936002)(8676002)(6666004)(26005)(478600001)(6512007)(316002)(6506007)(110136005)(4326008)(38100700002)(66899015)(2906002)(31686004)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bkEwUHFKcHg5ek9ZOVU0eEFkMC8zMS9MdFpabjlTRE8xRlZyRUZLazM1WGhn?=
 =?utf-8?B?bVdYYWcyNXlSTU5panhPK0lpQnZtY1BxazBoYTB1SDdIVjh5eHVoTlRvcDZv?=
 =?utf-8?B?emZoVXlHREhKU3JSU09Kd0Y3bmFjSXhuaUJYRUduZnpnL2NQSGx2bGZHZDlu?=
 =?utf-8?B?Mkh4eUx2bUtRT2pwOFd3NlZ6ZkZwc2xLamo4dE5iK3R6amt6ZWNXSkxtY0xx?=
 =?utf-8?B?MDRXMHF5VkJUbCtsOWMyblgrV0NkbzhZa21HVzd5ZjF0OGdzZk8wSm1jMk56?=
 =?utf-8?B?V2tNNGw2UnNzdm84a3UyZXB4T0dqdjl6UlRNM3VraWN3MSsxODFsQk51ZnRm?=
 =?utf-8?B?ZnYxai9aS3pRbEpheHYwcHZERmdVMnQwYklOMlM4RVIyN1QrUFpDbklldnlm?=
 =?utf-8?B?NHB2eTQxSUtkR0l2WHZkRzE3aEdIZE9OUTg1bzJBNElOWG4vamtNRW9Sa0ln?=
 =?utf-8?B?bXE3b3JaMGZDOTFRSVlaNmp5YURXU1dKNk5SUTlOemZTVUVYdHEzT3F6UWVV?=
 =?utf-8?B?TExLVC84N2FTMVpOUnBmbmI3dHZXcHMybWZBUitYU3RSa0RYc2NPeWo0NEZm?=
 =?utf-8?B?VGFHVTV4VHJqSVBzaFo3ajIxTVhWakNIQlFjYnA3eXp5ZmpHUDEyU0xHMXFu?=
 =?utf-8?B?c2ZxZHdzT0JONFpLckdXcGkyMEkvMjhFbXBhRnZDY0NuQy9WUmhLV1BJcFZS?=
 =?utf-8?B?Q1Z5RzBxS0oweVEvVlRNQm4rRXJ2dXBJaktDbi8wS1QySmswV2RuejUvWnNK?=
 =?utf-8?B?MGg2bHI2MEJKYWFzMVk3czBtT1Z6R3BjSWxpdU5RRTYwNFliWmVvUmNzWEkx?=
 =?utf-8?B?WlA1ZmpkVWg3NnFaUytLeFRycjBtR3hyZHF5Q09KWThSTEYrTzRSRFowWTVY?=
 =?utf-8?B?NGF3MmJ6WmYwQmhlWWYyTjhQbEN6alkyNlVNNVdacURaRlBLKzg5ejg4UTZl?=
 =?utf-8?B?ZldXL2ZSU093SjRPN2FnSGw2dVI2UEw3YVJDOW5XZ29TVlEyWlpTREc4NGtu?=
 =?utf-8?B?dUtrMWRVeldxaUxRU2RBSjlHUFB3UG02ZUtObTl1R29FS2VlcFZsY0E1aU96?=
 =?utf-8?B?d1ZhVTlTd3pWOFhsUUFEMjArK1o5K3RnV3Zjc1dDcTlwZDJNby85V0RpSmxJ?=
 =?utf-8?B?K3lmZGFPY1cyOERJdk9KS1lNRDhmWXZtbDd0eDhsR01OS1BEQ3ZkYW1OTTZ3?=
 =?utf-8?B?Rko3L2ltbmNiN3NGenJGQTdZVjd2emg2cUhNSG5hS3ZEZ05JMlBFU1pHOSsz?=
 =?utf-8?B?N0V1dkdlanZXaVRndlI4VTlqZ25KMlQ0N0EvUDVwdlBjVkxTejQ1alZ1N09C?=
 =?utf-8?B?KzY3SmRvY285MTBMSDN4WkVwYXFpZWlzK0EwY0NxTllxVk9XSjNMcWtzWUVu?=
 =?utf-8?B?QUJmaDd1MHl2NEVVc3BFanp4SzBzM09lNmNWUnJOd013Sk5KMU1YSkJOeXVn?=
 =?utf-8?B?SFcxdWVpQS9tUEl4U2VXRGZ6YXdnSW1vZUcycjV5Y0FyWkk5TFZadGR2OUdm?=
 =?utf-8?B?WFFGQTlpbVRZQmNZQjRtTW96eC95cGNRamYwYjNrbC9wcWFETHBRVHBkWERj?=
 =?utf-8?B?YVlIL1lBamYwNnBDMjQ3Nzk1Z3g0Ym53YlBZNTl6S3pySndVSStXc3VDOVph?=
 =?utf-8?B?Q3IwNGxVWUdmUDBaYWpWdnpTL1F4RnFLUCtvdFRHSVBvNkFpa296Q2F2WjFI?=
 =?utf-8?B?MzhFUUlPTmV0eUJSd1IweVB4SDlGYitlbVp0UG55Ym9XWTRCVktDaEtGRlRx?=
 =?utf-8?B?SVFsbkZraHdaVC9HK2w4M0lQa2lYNFJNWDE0TmVlTzJIbEpVTmh5WlBvT2w4?=
 =?utf-8?B?MG92UGFHOS9idWV0TkdiWHA1QXBnamYwNHRCTTk4T1BTak9SUDNKYWdGZTB6?=
 =?utf-8?B?L2tCODlJMnpLOG43TG4vcXpyOWZwaWFlWlpYRGh3WlloNGhmRWp6YThvTnVw?=
 =?utf-8?B?L2ZYRmo0Skt1cVA0SUNLRm92eGRCUDJUeVlYZHlhZm5PODREVGlWOHZNZzk0?=
 =?utf-8?B?S0xGdi8zQzlWSFBQNE1pMTVRVHZsL1ZtLzZyT2F2V1hoUUVmRFdyUjllQXRK?=
 =?utf-8?B?eGtpRXJQY3JUelNUb3ozODNleExFWG1xak1ZOEEvK2pTQnNWc3Njekg4akRa?=
 =?utf-8?B?a2xRTkZxMXFWc2lJRXJBRzFSZk1HeTJsQkhDTWwzKys4RkRCRFUwd05lTG83?=
 =?utf-8?B?d0E9PQ==?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72ca3b92-a626-4aa3-05c4-08dacc9eb729
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7384.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2022 15:32:07.7570 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WrONAxHEQrobMUcO1l4pEl9FP03SEYlF4U5x3ATJOnrqNBKwdMUxU1b+Z75BGQGoaCQnjD/OnENoK2GVUBtPg0BRIUGrG0w0Ts9Q6gacYYg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR02MB9140
X-Proofpoint-ORIG-GUID: NttByMiqcvOdVPG430I-obwlAonXQJX9
X-Proofpoint-GUID: NttByMiqcvOdVPG430I-obwlAonXQJX9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-22_09,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=manish.mishra@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
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

--------------b0aITGKC3JIQsT1059W7z0tx
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 22/11/22 8:19 pm, Daniel P. Berrangé wrote:
> On Tue, Nov 22, 2022 at 09:41:01AM -0500, Peter Xu wrote:
>> On Tue, Nov 22, 2022 at 02:38:53PM +0530, manish.mishra wrote:
>>> On 22/11/22 2:30 pm, Daniel P. Berrangé wrote:
>>>> On Sat, Nov 19, 2022 at 09:36:14AM +0000, manish.mishra wrote:
>>>>> MSG_PEEK reads from the peek of channel, The data is treated as
>>>>> unread and the next read shall still return this data. This
>>>>> support is currently added only for socket class. Extra parameter
>>>>> 'flags' is added to io_readv calls to pass extra read flags like
>>>>> MSG_PEEK.
>>>>>
>>>>> Suggested-by: Daniel P. Berrangé <berrange@redhat.com
>>>>> Signed-off-by: manish.mishra<manish.mishra@nutanix.com>
>>>>> ---
>>>>>    chardev/char-socket.c               |  4 +-
>>>>>    include/io/channel.h                | 83 +++++++++++++++++++++++++++++
>>>>>    io/channel-buffer.c                 |  1 +
>>>>>    io/channel-command.c                |  1 +
>>>>>    io/channel-file.c                   |  1 +
>>>>>    io/channel-null.c                   |  1 +
>>>>>    io/channel-socket.c                 | 16 +++++-
>>>>>    io/channel-tls.c                    |  1 +
>>>>>    io/channel-websock.c                |  1 +
>>>>>    io/channel.c                        | 73 +++++++++++++++++++++++--
>>>>>    migration/channel-block.c           |  1 +
>>>>>    scsi/qemu-pr-helper.c               |  2 +-
>>>>>    tests/qtest/tpm-emu.c               |  2 +-
>>>>>    tests/unit/test-io-channel-socket.c |  1 +
>>>>>    util/vhost-user-server.c            |  2 +-
>>>>>    15 files changed, 179 insertions(+), 11 deletions(-)
>>>>
>>>>> diff --git a/io/channel-socket.c b/io/channel-socket.c
>>>>> index b76dca9cc1..a06b24766d 100644
>>>>> --- a/io/channel-socket.c
>>>>> +++ b/io/channel-socket.c
>>>>> @@ -406,6 +406,8 @@ qio_channel_socket_accept(QIOChannelSocket *ioc,
>>>>>        }
>>>>>    #endif /* WIN32 */
>>>>> +    qio_channel_set_feature(QIO_CHANNEL(cioc), QIO_CHANNEL_FEATURE_READ_MSG_PEEK);
>>>>> +
>>>> This covers the incoming server side socket.
>>>>
>>>> This also needs to be set in outgoing client side socket in
>>>> qio_channel_socket_connect_async
>>>
>>> Yes sorry, i considered only current use-case, but as it is generic one both should be there. Thanks will update it.
>>>
>>>>> @@ -705,7 +718,6 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
>>>>>    }
>>>>>    #endif /* WIN32 */
>>>>> -
>>>>>    #ifdef QEMU_MSG_ZEROCOPY
>>>>>    static int qio_channel_socket_flush(QIOChannel *ioc,
>>>>>                                        Error **errp)
>>>> Please remove this unrelated whitespace change.
>>>>
>>>>
>>>>> @@ -109,6 +117,37 @@ int qio_channel_readv_all_eof(QIOChannel *ioc,
>>>>>        return qio_channel_readv_full_all_eof(ioc, iov, niov, NULL, NULL, errp);
>>>>>    }
>>>>> +int qio_channel_readv_peek_all_eof(QIOChannel *ioc,
>>>>> +                                   const struct iovec *iov,
>>>>> +                                   size_t niov,
>>>>> +                                   Error **errp)
>>>>> +{
>>>>> +   ssize_t len = 0;
>>>>> +   ssize_t total = iov_size(iov, niov);
>>>>> +
>>>>> +   while (len < total) {
>>>>> +       len = qio_channel_readv_full(ioc, iov, niov, NULL,
>>>>> +                                    NULL, QIO_CHANNEL_READ_FLAG_MSG_PEEK, errp);
>>>>> +
>>>>> +       if (len == QIO_CHANNEL_ERR_BLOCK) {
>>>>> +            if (qemu_in_coroutine()) {
>>>>> +                qio_channel_yield(ioc, G_IO_IN);
>>>>> +            } else {
>>>>> +                qio_channel_wait(ioc, G_IO_IN);
>>>>> +            }
>>>>> +            continue;
>>>>> +       }
>>>>> +       if (len == 0) {
>>>>> +           return 0;
>>>>> +       }
>>>>> +       if (len < 0) {
>>>>> +           return -1;
>>>>> +       }
>>>>> +   }
>>>> This will busy wait burning CPU where there is a read > 0 and < total.
>>>>
>>> Daniel, i could use MSG_WAITALL too if that works but then we will lose opportunity to yield. Or if you have some other idea.
>> How easy would this happen?
>>
>> Another alternative is we could just return the partial len to caller then
>> we fallback to the original channel orders if it happens.  And then if it
>> mostly will never happen it'll behave merely the same as what we want.
> Well we're trying to deal with a bug where the slow and/or unreliable
> network causes channels to arrive in unexpected order. Given we know
> we're having network trouble, I wouldn't want to make more assumptions
> about things happening correctly.
>
>
> With regards,
> Daniel


Peter, I have seen MSG_PEEK used in combination with MSG_WAITALL, but looks like even though chances are less it can still return partial data even with multiple retries for signal case, so is not full proof.

*MSG_WAITALL *(since Linux 2.2)
               This flag requests that the operation block until the full
               request is satisfied.  However, the call may still return
               less data than requested if a signal is caught, an error
               or disconnect occurs, or the next data to be received is
               of a different type than that returned.  This flag has no
               effect for datagram sockets.

Actual read ahead will be little hackish, so just confirming we all are in agreement to do actual read ahead and i can send patch? :)

Thanks
Manish Mishra

--------------b0aITGKC3JIQsT1059W7z0tx
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 22/11/22 8:19 pm, Daniel P. Berrangé
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:Y3zhcCCf49scoi9u@redhat.com">
      <pre class="moz-quote-pre" wrap="">On Tue, Nov 22, 2022 at 09:41:01AM -0500, Peter Xu wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On Tue, Nov 22, 2022 at 02:38:53PM +0530, manish.mishra wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
On 22/11/22 2:30 pm, Daniel P. Berrangé wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">On Sat, Nov 19, 2022 at 09:36:14AM +0000, manish.mishra wrote:
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">MSG_PEEK reads from the peek of channel, The data is treated as
unread and the next read shall still return this data. This
support is currently added only for socket class. Extra parameter
'flags' is added to io_readv calls to pass extra read flags like
MSG_PEEK.

Suggested-by: Daniel P. Berrangé &lt;<a class="moz-txt-link-abbreviated" href="mailto:berrange@redhat.com">berrange@redhat.com</a>
Signed-off-by: manish.mishra <a class="moz-txt-link-rfc2396E" href="mailto:manish.mishra@nutanix.com">&lt;manish.mishra@nutanix.com&gt;</a>
---
  chardev/char-socket.c               |  4 +-
  include/io/channel.h                | 83 +++++++++++++++++++++++++++++
  io/channel-buffer.c                 |  1 +
  io/channel-command.c                |  1 +
  io/channel-file.c                   |  1 +
  io/channel-null.c                   |  1 +
  io/channel-socket.c                 | 16 +++++-
  io/channel-tls.c                    |  1 +
  io/channel-websock.c                |  1 +
  io/channel.c                        | 73 +++++++++++++++++++++++--
  migration/channel-block.c           |  1 +
  scsi/qemu-pr-helper.c               |  2 +-
  tests/qtest/tpm-emu.c               |  2 +-
  tests/unit/test-io-channel-socket.c |  1 +
  util/vhost-user-server.c            |  2 +-
  15 files changed, 179 insertions(+), 11 deletions(-)
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">

</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">diff --git a/io/channel-socket.c b/io/channel-socket.c
index b76dca9cc1..a06b24766d 100644
--- a/io/channel-socket.c
+++ b/io/channel-socket.c
@@ -406,6 +406,8 @@ qio_channel_socket_accept(QIOChannelSocket *ioc,
      }
  #endif /* WIN32 */
+    qio_channel_set_feature(QIO_CHANNEL(cioc), QIO_CHANNEL_FEATURE_READ_MSG_PEEK);
+
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">This covers the incoming server side socket.

This also needs to be set in outgoing client side socket in
qio_channel_socket_connect_async
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">

Yes sorry, i considered only current use-case, but as it is generic one both should be there. Thanks will update it.

</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">@@ -705,7 +718,6 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
  }
  #endif /* WIN32 */
-
  #ifdef QEMU_MSG_ZEROCOPY
  static int qio_channel_socket_flush(QIOChannel *ioc,
                                      Error **errp)
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">Please remove this unrelated whitespace change.


</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">@@ -109,6 +117,37 @@ int qio_channel_readv_all_eof(QIOChannel *ioc,
      return qio_channel_readv_full_all_eof(ioc, iov, niov, NULL, NULL, errp);
  }
+int qio_channel_readv_peek_all_eof(QIOChannel *ioc,
+                                   const struct iovec *iov,
+                                   size_t niov,
+                                   Error **errp)
+{
+   ssize_t len = 0;
+   ssize_t total = iov_size(iov, niov);
+
+   while (len &lt; total) {
+       len = qio_channel_readv_full(ioc, iov, niov, NULL,
+                                    NULL, QIO_CHANNEL_READ_FLAG_MSG_PEEK, errp);
+
+       if (len == QIO_CHANNEL_ERR_BLOCK) {
+            if (qemu_in_coroutine()) {
+                qio_channel_yield(ioc, G_IO_IN);
+            } else {
+                qio_channel_wait(ioc, G_IO_IN);
+            }
+            continue;
+       }
+       if (len == 0) {
+           return 0;
+       }
+       if (len &lt; 0) {
+           return -1;
+       }
+   }
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">This will busy wait burning CPU where there is a read &gt; 0 and &lt; total.

</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
Daniel, i could use MSG_WAITALL too if that works but then we will lose opportunity to yield. Or if you have some other idea.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
How easy would this happen?

Another alternative is we could just return the partial len to caller then
we fallback to the original channel orders if it happens.  And then if it
mostly will never happen it'll behave merely the same as what we want.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Well we're trying to deal with a bug where the slow and/or unreliable
network causes channels to arrive in unexpected order. Given we know
we're having network trouble, I wouldn't want to make more assumptions
about things happening correctly.


With regards,
Daniel
</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Peter, I have seen MSG_PEEK used in combination with MSG_WAITALL,
      but looks like even though chances are less it can still return
      partial data even with multiple retries for signal case, so is not
      full proof.<br>
    </p>
    <pre><b>MSG_WAITALL </b>(since Linux 2.2)
              This flag requests that the operation block until the full
              request is satisfied.  However, the call may still return
              less data than requested if a signal is caught, an error
              or disconnect occurs, or the next data to be received is
              of a different type than that returned.  This flag has no
              effect for datagram sockets.

Actual read ahead will be little hackish, so just confirming we all are in agreement to do actual read ahead and i can send patch? :)

Thanks
Manish Mishra
</pre>
  </body>
</html>

--------------b0aITGKC3JIQsT1059W7z0tx--

