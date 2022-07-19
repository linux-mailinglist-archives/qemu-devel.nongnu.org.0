Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA22579499
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 09:53:06 +0200 (CEST)
Received: from localhost ([::1]:58178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDi2T-0007mO-5c
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 03:53:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1oDi1L-0006Hk-RQ
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 03:51:55 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:55922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1oDi1I-0001fX-Ir
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 03:51:55 -0400
Received: from pps.filterd (m0127838.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26J1tpcA017464;
 Tue, 19 Jul 2022 00:51:48 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=woO0OZWvLmnGo2LXvD7/B4s38RYvxzAQaW27gQQglzg=;
 b=GeaZ+WmSXPTZRo3vfAJ+X2A5mSLDo+e8rC0WPzt5iDNd0+RHOz0gcyhqO1MTRJNwpdSM
 H1PcWbhBvQ6MsqqFeT9+bZDCrKUctU83dGyR8ZMsQYxuzkNkxD84mIsa8I0joxBf9fvh
 Q1a3ep5ctDV6hPSijN4vLqT8L7XwotVsYNHlkw5fcyewn4kd7h1dEyMYznpdxIRL92ly
 uRr73WSNOTlNYsed9RM+5KCvTSLZBMjfoP3n/Iv9C6Ztx45Drj0fAaN+qW0mFzEFX9DD
 l/5OPQIcKyG+zMOspaSNnXtYOF3xfSDNz+zKxkCcO/195hxDJYLLrEmdhBtD4un+BP/x Pw== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2109.outbound.protection.outlook.com [104.47.55.109])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3hbvw05cty-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Jul 2022 00:51:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wx96DHVCTXTbsg8QgFXMQ0SGenGzha2H7JPJkLgobLJhCmoUOjERc81Q7V81DPVh6rJUCqgy90tWBIEYGJz03k0e9mDhz8EcLFxXrJlBY25iNbckmtiEC4JQ054G5IKOWfeyGHgfmN1KozYlOs8ukkmBHW/Wzp/B74uYH4g8Rz0cDmJmR/5n5g8kU0fdE893wgRkh/noq5PTbCo83cO5ymaGzS449cZajnmAT7imzp/uZPMU+cvBXFvxCL021mTplpI4v4ckPXaKyG88zoI4wsbfKyrHuOLx032D8zxDlkI69nXPBUQm/aYGLfZN57Z7kV6oqp6TgZWWRKI4/SVQPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=woO0OZWvLmnGo2LXvD7/B4s38RYvxzAQaW27gQQglzg=;
 b=Vu1eGCtxDvimn2o4bNtUKnA6uyT0EDOecqoO5P9NjbCfLA6ZIh8hlStrgLFlma2DLtCX2qbxJR6ix1P3B1PfnrHYgtVSXwCW97nyl2ERP/YQ6giT+dqrKWruWZ9tBXIiJ9LdN3dpW8vcEV0Vko2oZXZxcSdSjvohK1FL3ctY7SpLizqoZ3iMJuxDelcEfJ2fSixafN2NwVNlEUqsn1fYZAB9jTwfiWxj4yg/FNIpoBQbAc4cYWvNHnn165BsWyGrAsugJ5XfreNSkRqhHnKMbPOmGZKJS62gFR+0qY8amxUmYCA6GRrXZQ/AGU4IF3JB3vO/ilj/kUeytqKTWsO2wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by BL3PR02MB8186.namprd02.prod.outlook.com (2603:10b6:208:339::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Tue, 19 Jul
 2022 07:51:46 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::1493:404b:3242:8e0f]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::1493:404b:3242:8e0f%5]) with mapi id 15.20.5438.023; Tue, 19 Jul 2022
 07:51:45 +0000
Message-ID: <57b8de99-fcf9-e015-eeb5-cdc14544d721@nutanix.com>
Date: Tue, 19 Jul 2022 13:21:34 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: =?UTF-8?B?UmU6IFtQQVRDSCAxLzRdIE1vZGlmeWluZyDigJhtaWdyYXRl4oCZIHFt?=
 =?UTF-8?Q?p_command_to_add_multi-FD_socket_on_particular_source_and_destina?=
 =?UTF-8?Q?tion_pair?=
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, quintela@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, berrange@redhat.com, eblake@redhat.com,
 Manish Mishra <manish.mishra@nutanix.com>
References: <20220609073305.142515-1-het.gala@nutanix.com>
 <20220609073305.142515-2-het.gala@nutanix.com> <87h73ees2r.fsf@pond.sub.org>
 <06e02954-f94d-0508-90f1-a8610e1a09cf@nutanix.com>
 <877d4a7ang.fsf@pond.sub.org>
 <c3792d65-b24c-be02-f988-fa1c0e27d490@nutanix.com>
 <8735ex1t01.fsf@pond.sub.org>
From: Het Gala <het.gala@nutanix.com>
In-Reply-To: <8735ex1t01.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0060.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::14) To BYAPR02MB4343.namprd02.prod.outlook.com
 (2603:10b6:a03:57::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d10146a9-ad63-491b-13ca-08da695b8704
X-MS-TrafficTypeDiagnostic: BL3PR02MB8186:EE_
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yuI5cUlQi07s73MjQ09ozaUpuBDvEQR69IgBEarqyxMIaY/3srGZrXsxxcPrAWtIJebrAejfNCvHwOGnbQP0huAJK+o+hrs/5w+cbHZoQwD3YITOmRe2H0T+RBb11EXEeTjvfeeXXYPSEcVMOEgod05o5jgNWAwb7O2n38+GeAvU3I0dhpbjLAH+mj75tkVD9mGEACQCbvzlZ7F4+MsKlNlokfJkA7PwLtMWYvTe4hmUKINS//Bj46lbZI0d4ovxMxV3ZCj8HLZ08Ph0b+pa3zN8Gw8V0oJQv1RvBy6uAsCscOGRGQrNRmiOz8FQimmb9Fj799QK6NVRVq7fDhDrTm+/nvq+iNzWqyZmQoRbReRyMR0d+/fwCh44D2yeCsaO6gXHvkNvUocTFawlGqgQ7ZCeWqPFUcvSZetGFcjVbPpz0hT9QbXL61Fiv/WgFXyipS470UWVekSzjBUbJOPqoMjY6l8dX0rfK4D47bGtNrzIqiAcIVOQRWkvU6mYqMjzl1HSM6XkBrXyaOkUsmOfmvHx7f+wSajlvhT1SbrXAxijzn1bltQlCsFjf0zJ+s23d2lKd9C5VGzRAim0w/ofrd7g5PEaglYj0nHKVKPtzysb50HqPGjqiyYkOq7212NT81uxNdxqpZ7zECdn9RVv6NsMUKclhycbwQeJV+oj0er56kNFNzkjZ0/pjOJOgx90aRMbH3BKielWs8JTvO3RyuhezNygsnKUgtJ0qUL1QrcNZvoruB+ScZUeJ5tmjJb296/nOYZ8dh6MfyPWwrS9GFsvE+8BdR/XL2N7Pkrp/jrlbLsqj9H1JZ8k4xdF4tuyKzbw2WqH7G65+baFXCocbNQJnDMWLPV+QJQ2TAgs7lpTPfkiE9tJW+U3JE2Jq3gR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(376002)(366004)(396003)(346002)(39860400002)(6486002)(31686004)(478600001)(6666004)(41300700001)(86362001)(186003)(52116002)(53546011)(6506007)(26005)(6916009)(83380400001)(107886003)(6512007)(316002)(66946007)(5660300002)(4326008)(44832011)(36756003)(66476007)(30864003)(8936002)(66556008)(2906002)(38100700002)(31696002)(2616005)(38350700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L0ZELzhpcHdxVEh6SDJqeUlWY1hUYVJjRy9mWVY2VGhmUngxZXFhTkFiWGsy?=
 =?utf-8?B?dW5aVGtQdWlzS0Jhb2w5RE5LY1VyVjI2bUpGUXIxTHdLY2RsanZDRGo3V2lT?=
 =?utf-8?B?QlBsdzJ0N3ZYVTBWa1lsWHhlVjNud0VnRmVrb0hweVc5VUd0cFJBOXdhbjdK?=
 =?utf-8?B?S0tPRW9waXFHLzA2NlN4Z0VpZCtSOUM3OVo5R1NUUm1MeEZ2WmMvK2NaWXkw?=
 =?utf-8?B?dlBnM2p3SjNBYmZiUjF0NE1BVDlQTmgrTHpublYrK1d3WGJVeW5LeDVTMG5H?=
 =?utf-8?B?QWZHWUY0MC9BWGdwZHQ2aWhWTngwL0FFZENzYS85UDV1SnQ3NFhhWXFwbDRM?=
 =?utf-8?B?YngydnE2RFpEN29xQUM3eHRrd1dwNUllNDFMNi9sV3V0OTl4dW9XWlJXY2tr?=
 =?utf-8?B?SUpNbk1DdlBSN1VlSUNRRGRUOVdDQ3JnWE1sZElvWHBUOFRuWHZ1ZDg0SzdI?=
 =?utf-8?B?bFdiTHkwNGZybUVhcjFOUG5iODZVU08wNmpHa3VWNTB3ZW0rOTc5S3lONWl2?=
 =?utf-8?B?eDFlSlI0TklReWUrQ3ZRcTJCd24xTHgrWDV1VnhOZnJvamFtWGF1clNwTUVB?=
 =?utf-8?B?ajg1UUpZMFJrMUUxNllwR1NmNzd1d1RxbGZWMkVBcUdRcjhESGtORmo4UVV1?=
 =?utf-8?B?M29NZHZmRGdNRXFYTDQzWWl4QkRNMisyRVFNS1JKUDBBU05XVStYVVMzVUd3?=
 =?utf-8?B?V2dlZmZ2UHk4KzBCUkdQQW14Nit2d3kxWTdleEN4TytiZWt6dkRueUtCVVBi?=
 =?utf-8?B?OHFscTg2T1BQWEVpOTZGRnJxS1VWd0JURnlEY2V6YTJsVjdUL3FSbGdIUmZR?=
 =?utf-8?B?TkxBOWRjQlRCTU1qWUJCRkdHcVJtMnlSTVc0QXg1Vnp3dy9weDQ4ZnBydE1H?=
 =?utf-8?B?Rms4RjBFMFJ1Tk1FSmVGbjhZOEppOEZ5TlF6SU5CUHZlQVJLdEQ0TUV1RldG?=
 =?utf-8?B?cFZ2RkdMSS9PZmxZb2pMTHh0NktrSFJyclZJakRZZG0xS09EeS9xVmluSW10?=
 =?utf-8?B?dU9VcVZMNE5nOWwxbm1uc3hEV2sxQkJLblY4ZEFPeWYyV3huQ1YrMDNMcDE2?=
 =?utf-8?B?VWt0QmJWcncwRHcvNzZsSE9xWnRlQll2bFNYMHBHOUJCZHpuR2pSa2FSNlds?=
 =?utf-8?B?M2ZYa1BGZzU4eUxtNmhnMUJIc1NrMktsMGYzTUhUOGdDT3hVT2xrWEpFSzd1?=
 =?utf-8?B?SlVoczR3U296Q3cwNWY4UmNOSUsxNWRPNkZRbUozMUYrb0YzV1ZCWEc4SlZZ?=
 =?utf-8?B?aFlaWWZNVEZEZTBmOFQzYzBhd0pNR0t0S1ljczNGV1dPbzBzejhJWmE2U1pp?=
 =?utf-8?B?SFZBVnhtZ2pNcEFIWGdnVTViVCtOdTc5YUlYR2gxa3NKWEpKd2MvWERsNkRX?=
 =?utf-8?B?ekVGZlhvMW5OaU5XY3g3Q0Z1UUxnUE1jMHEwYTdyMEJoRld6RjFrQVJpY0tT?=
 =?utf-8?B?L0Y1bzhpMzkrc3Blb0dqL3VSOHo0VCt0SEUvRVhialNkY0pBcHJ1QWZocVEv?=
 =?utf-8?B?T2UvRml6OEhrWThrSkJobzRQRzMzekczOHlNUm10eWhSQnU2U3lhNkZrc0Rt?=
 =?utf-8?B?elJ1ckNEaEFhbnJYUlkrMWZxUVYrZ2VoVVFGUStKKzVQempKM3UrdmJST082?=
 =?utf-8?B?MEdNVGZIVjdiZmxXeU9jOUdVQUN0cHRJU3NpNWpZTEx6cDd0T0pYMkgrQzZw?=
 =?utf-8?B?cjNEOWZpZ3oyTFRhMHdNKzduMDYrZVNMUlF5MFowNkFMcThCWS93Nnd5aWps?=
 =?utf-8?B?eEZGYTBmVHYzRTRmNWYvcHdYcWVWT3FwWjBKNWtKemZpKzFjaFdCbkVNeXJY?=
 =?utf-8?B?V216K0F1ZWg3d2VuNE9RMjBCcWVRa0RxaDlvbTZXQlJ4L1Z0VFJTb0VNdlVF?=
 =?utf-8?B?d0dEaDN6ZGh3VCs0R2pCT2sxUDNpKys2a0R0MWhNTU00eDJ4cWUrZUQ4Rms2?=
 =?utf-8?B?WmE0c2Z4TlZvZEdZMWQxQmJ5cllMQWdnRHJsNEFYQ1RmaDJuNklwOXlkSkZu?=
 =?utf-8?B?QmZvUXlUaGd6eVBZUlE0aDl2MnFGNHFPakNidDFlclFQaTc4bTVTMkJYNlF2?=
 =?utf-8?B?MHp3cjV4dDg3WTZNRlVjS2RBVk1EUUFFd2xZSUZnL0lnUEplM0tlOTNaeHdT?=
 =?utf-8?B?L291aVpnUEJpdDN2NGpvcXltZXA5R3k0VmMybHNheTc4NWZ0WGhrWDMzdFpk?=
 =?utf-8?B?WHc9PQ==?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d10146a9-ad63-491b-13ca-08da695b8704
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2022 07:51:45.6821 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rNMYivDVVBIvlg4lkxZcAYptlDTuKAJCzgugjBBO0CY36BlUv0S52cMEnUX9jw5AVnX9l8thsoYh/2SjilOXHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR02MB8186
X-Proofpoint-ORIG-GUID: iUKc7ytr3COejq1Mzt_Qb0fU9fgqek9Y
X-Proofpoint-GUID: iUKc7ytr3COejq1Mzt_Qb0fU9fgqek9Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-18_22,2022-07-18_01,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68; envelope-from=het.gala@nutanix.com;
 helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 19/07/22 12:36 pm, Markus Armbruster wrote:
> Het Gala <het.gala@nutanix.com> writes:
>
>> On 18/07/22 8:03 pm, Markus Armbruster wrote:
>>> Het Gala <het.gala@nutanix.com> writes:
>>>
>>>> On 18/07/22 2:05 pm, Markus Armbruster wrote:
>>>>> Het Gala <het.gala@nutanix.com> writes:
>>>>>
>>>>>> i) Modified the format of the qemu monitor command : 'migrate' by adding a list,
>>>>>>       each element in the list consists of multi-FD connection parameters: source
>>>>>>       and destination uris and of the number of multi-fd channels between each pair.
>>>>>>
>>>>>> ii) Information of all multi-FD connection parameters’ list, length of the list
>>>>>>        and total number of multi-fd channels for all the connections together is
>>>>>>        stored in ‘OutgoingArgs’ struct.
>>>>>>
>>>>>> Suggested-by: Manish Mishra <manish.mishra@nutanix.com>
>>>>>> Signed-off-by: Het Gala <het.gala@nutanix.com>
>>>>>> ---
> [...]
>
>>>>>> diff --git a/migration/socket.c b/migration/socket.c
>>>>>> index 4fd5e85f50..7ca6af8cca 100644
>>>>>> --- a/migration/socket.c
>>>>>> +++ b/migration/socket.c
>>>>>> @@ -32,6 +32,17 @@ struct SocketOutgoingArgs {
>>>>>>         SocketAddress *saddr;
>>>>>>     } outgoing_args;
>>>>>>
>>>>>> +struct SocketArgs {
>>>>>> +    struct SrcDestAddr data;
>>>>>> +    uint8_t multifd_channels;
>>>>>> +};
>>>>>> +
>>>>>> +struct OutgoingMigrateParams {
>>>>>> +    struct SocketArgs *socket_args;
>>>>>> +    size_t length;
>>>>> Length of what?
>>>> length of the socket_args[] array. Thanks for pointing it out. I will
>>>> be more specific for this variable in the v2 patchset series.
>>>>
>>>>>> +    uint64_t total_multifd_channel;
>>>>> @total_multifd_channels appears to be the sum of the
>>>>> socket_args[*].multifd_channels.  Correct?
>>>> Yes Markus, you are correct.
>>> Sure you need to keep the sum separately?
>> So earlier, the idea behind this was that, we had this intention to depreciate the migrate_multifd_channels() API from the live migration
>> process. We made total_multifd_channels() function, where it used to calculate total number of multifd channels every time, for whichever
>> function called was computation internsive so we replaced it by returning sum of socket_args[*].multifd_channels i.e.
>> total_multifd_channel in the later patches.
>>
>>   But now in the v2 patchset onwards, Thanks to inputs from Dr. David and Daniel, we are not depricating migrate_multifd_channels() API but
>> the value from the API will be cross-referenced with sum of socket_args[*].multifd_channels i.e. total_multifd_channel, and error if
>> they are not equal.
> I'm afraid I don't understand.  I'm not sure I have to.  Let me loop
> back to my question.
>
> If @total_multifd_channel is always the sum of the
> socket_args[*].multifd_channels, then you can always compute it on the
> fly.
>
> I.e. you can replace @total_multifd_channel by a function that returns
> the sum.
>
> Precomputing it instead is more complex, because then you need to
> document that the two are the same.  Also, bug oppertunity: letting them
> deviate somehow.  I figure that's worthwhile only if computing on the
> fly is too expensive.
 > Okay, I understand your concern. I am okay with your approach too, 
but these things are not expected to change out of qmp command context. 
So is keeping @total_multifd_channel variable should be fine? or making 
a function is better?
>>>>>> +} outgoing_migrate_params;
>>>>>> +
>>>>>>     void socket_send_channel_create(QIOTaskFunc f, void *data)
>>>>>>     {
>>>>>>         QIOChannelSocket *sioc = qio_channel_socket_new();
>>>>>> @@ -47,6 +58,14 @@ int socket_send_channel_destroy(QIOChannel *send)
>>>>>>             qapi_free_SocketAddress(outgoing_args.saddr);
>>>>>>             outgoing_args.saddr = NULL;
>>>>>>         }
>>>>>> +
>>>>>> +    if (outgoing_migrate_params.socket_args != NULL) {
>>>>>> +        g_free(outgoing_migrate_params.socket_args);
>>>>>> +        outgoing_migrate_params.socket_args = NULL;
>>>>>> +    }
>>>>>> +    if (outgoing_migrate_params.length) {
>>>>>> +        outgoing_migrate_params.length = 0;
>>>>>> +    }
>>>>>>         return 0;
>>>>>>     }
>>>>>>
>>>>>> @@ -117,13 +136,41 @@ socket_start_outgoing_migration_internal(MigrationState *s,
>>>>>>     }
>>>>>>
>>>>>>     void socket_start_outgoing_migration(MigrationState *s,
>>>>>> -                                     const char *str,
>>>>>> +                                     const char *dst_str,
>>>>>>                                          Error **errp)
>>>>>>     {
>>>>>>         Error *err = NULL;
>>>>>> -    SocketAddress *saddr = socket_parse(str, &err);
>>>>>> +    SocketAddress *dst_saddr = socket_parse(dst_str, &err);
>>>>>> +    if (!err) {
>>>>>> +        socket_start_outgoing_migration_internal(s, dst_saddr, &err);
>>>>>> +    }
>>>>>> +    error_propagate(errp, err);
>>>>>> +}
>>>>>> +
>>>>>> +void init_multifd_array(int length)
>>>>>> +{
>>>>>> +    outgoing_migrate_params.socket_args = g_new0(struct SocketArgs, length);
>>>>>> +    outgoing_migrate_params.length = length;
>>>>>> +    outgoing_migrate_params.total_multifd_channel = 0;
>>>>>> +}
>>>>>> +
>>>>>> +void store_multifd_migration_params(const char *dst_uri,
>>>>>> +                                    const char *src_uri,
>>>>>> +                                    uint8_t multifd_channels,
>>>>>> +                                    int idx, Error **errp)
>>>>>> +{
>>>>>> +    Error *err = NULL;
>>>>>> +    SocketAddress *src_addr = NULL;
>>>>>> +    SocketAddress *dst_addr = socket_parse(dst_uri, &err);
>>>>>> +    if (src_uri) {
>>>>>> +        src_addr = socket_parse(src_uri, &err);
>>>>>> +    }
>>>>> Incorrect use of &err.  error.h's big comment:
>>>>>
>>>>>     * Receive and accumulate multiple errors (first one wins):
>>>>>     *     Error *err = NULL, *local_err = NULL;
>>>>>     *     foo(arg, &err);
>>>>>     *     bar(arg, &local_err);
>>>>>     *     error_propagate(&err, local_err);
>>>>>     *     if (err) {
>>>>>     *         handle the error...
>>>>>     *     }
>>>>>     *
>>>>>     * Do *not* "optimize" this to
>>>>>     *     Error *err = NULL;
>>>>>     *     foo(arg, &err);
>>>>>     *     bar(arg, &err); // WRONG!
>>>>>     *     if (err) {
>>>>>     *         handle the error...
>>>>>     *     }
>>>>>     * because this may pass a non-null err to bar().
>>>>>
>>>> Thankyou Markus for sharing this knowledge. I was unaware of the
>>>> dont's with &err.
>>> The big comment should help you along.  If it doesn't, just ask.
>>> I read the comment, and it is pretty well explained out there.
>>>
>>>>>>         if (!err) {
>>>>>> -        socket_start_outgoing_migration_internal(s, saddr, &err);
>>>>>> +        outgoing_migrate_params.socket_args[idx].data.dst_addr = dst_addr;
>>>>>> +        outgoing_migrate_params.socket_args[idx].data.src_addr = src_addr;
>>>>>> +        outgoing_migrate_params.socket_args[idx].multifd_channels
>>>>>> +                                                         = multifd_channels;
>>>>>> +        outgoing_migrate_params.total_multifd_channel += multifd_channels;
>>>>>>         }
>>>>>>         error_propagate(errp, err);
>>>>> Consider
>>>>>
>>>>>           struct SocketArgs *sa = &outgoing_migrate_params.socket_args[idx];
>>>>>           SocketAddress *src_addr, *dst_addr;
>>>>>
>>>>>           src_addr = socketaddress(src_uri, errp);
>>>>>           if (!src_addr) {
>>>>>               return;
>>>>>           }
>>>>>
>>>>>           dst_addr = socketaddress(dst_uri, errp);
>>>>>           if (!dst_addr) {
>>>>>               return;
>>>>>           }
>>>>>
>>>>>           sa->data.dst_addr = dst_addr;
>>>>>           sa->data.src_addr = src_addr;
>>>>>           sa->multifd_channels = multifd_channels;
>>>>>           outgoing_migrate_params.total_multifd_channel += multifd_channels;
>>>> Thanks Markus for this amazing suggestion. Your approach looks
>>>> simpler to understand and also resolves the error it had with &err. I
>>>> will surely implement this in the upcoming v2 patchset.
>>> You're welcome :)
>> I just wanted to have a double check on the solution you gave above Markus. The suggestion you have given there has been deliberately
>> written in that way right, because
>>
>> src_addr = socketaddress(src_uri, errp);
>> dst_addr = socketaddress(dst_uri, errp);
>> if (!src_addr) {
>>      return;
>> }
>> if (!dst_addr) {
>>      return;
>> }
>>
>> would still be an error right according to the &err guidelines from error.h file.
> Correct.
 > Thankyou Markus.
>>>>>>     }
> [...]
>
>>>>>> diff --git a/qapi/migration.json b/qapi/migration.json
>>>>>> index 6130cd9fae..fb259d626b 100644
>>>>>> --- a/qapi/migration.json
>>>>>> +++ b/qapi/migration.json
>>>>>> @@ -1454,12 +1454,38 @@
>>>>>>     ##
>>>>>>     { 'command': 'migrate-continue', 'data': {'state': 'MigrationStatus'} }
>>>>>>
>>>>>> +##
>>>>>> +# @MigrateUriParameter:
>>>>>> +#
>>>>>> +# Information regarding which source interface is connected to which
>>>>>> +# destination interface and number of multifd channels over each interface.
>>>>>> +#
>>>>>> +# @source-uri: the Uniform Resource Identifier of the source VM.
>>>>>> +#              Default port number is 0.
>>>>>> +#
>>>>>> +# @destination-uri: the Uniform Resource Identifier of the destination VM
>>>>>> +#
>>>>>> +# @multifd-channels: number of parallel multifd channels used to migrate data
>>>>>> +#                    for specific source-uri and destination-uri. Default value
>>>>>> +#                    in this case is 2 (Since 4.0)
>>>>> You mean "(Since 7.1)", I guess.
>>>> Yes yes. Also David pointed this thing out. I will update the version
>>>> in the v2 patchset.
>>>>
>>>>>> +#
>>>>>> +##
>>>>>> +{ 'struct' : 'MigrateUriParameter',
>>>>>> +  'data' : { 'source-uri' : 'str',
>>>>>> +             'destination-uri' : 'str',
>>>>>> +             '*multifd-channels' : 'uint8'} }
>>>>>> +
>>>>>>     ##
>>>>>>     # @migrate:
>>>>>>     #
>>>>>>     # Migrates the current running guest to another Virtual Machine.
>>>>>>     #
>>>>>>     # @uri: the Uniform Resource Identifier of the destination VM
>>>>>> +#       for migration thread
>>>>>> +#
>>>>>> +# @multi-fd-uri-list: list of pair of source and destination VM Uniform
>>>>>> +#                     Resource Identifiers with number of multifd-channels
>>>>>> +#                     for each pair
>>>>>>     #
>>>>>>     # @blk: do block migration (full disk copy)
>>>>>>     #
>>>>>> @@ -1479,20 +1505,27 @@
>>>>>>     # 1. The 'query-migrate' command should be used to check migration's progress
>>>>>>     #    and final result (this information is provided by the 'status' member)
>>>>>>     #
>>>>>> -# 2. All boolean arguments default to false
>>>>>> +# 2. The uri argument should have the Uniform Resource Identifier of default
>>>>>> +#    destination VM. This connection will be bound to default network
>>>>>> +#
>>>>>> +# 3. All boolean arguments default to false
>>>>>>     #
>>>>>> -# 3. The user Monitor's "detach" argument is invalid in QMP and should not
>>>>>> +# 4. The user Monitor's "detach" argument is invalid in QMP and should not
>>>>>>     #    be used
>>>>>>     #
>>>>>>     # Example:
>>>>>>     #
>>>>>> -# -> { "execute": "migrate", "arguments": { "uri": "tcp:0:4446" } }
>>>>>> +# -> { "execute": "migrate",
>>>>>> +#                 "arguments": { "uri": "tcp:0:4446", "multi-fd-uri-list": [ {
>>>>>> +#                                "source-uri": "tcp::6900", "destination-uri": "tcp:0:4480",
>>>>>> +#                                "multifd-channels": 4}, { "source-uri": "tcp:10.0.0.0: ",
>>>>>> +#                                "destination-uri": "tcp:11.0.0.0:7789", "multifd-channels": 5} ] } }
>>>>>>     # <- { "return": {} }
>>>>>>     #
>>>>>>     ##
>>>>>>     { 'command': 'migrate',
>>>>>> -  'data': {'uri': 'str', '*blk': 'bool', '*inc': 'bool',
>>>>>> -           '*detach': 'bool', '*resume': 'bool' } }
>>>>>> +  'data': {'uri': 'str', '*multi-fd-uri-list': ['MigrateUriParameter'], '*blk': 'bool',
>> ??
>>
>> Sorry Markus, I think the statement I wrote did not make sense, I apologise for that. I meant to say example in the sense:
>>
>>    # Example:
>>    #
>> # -> { "execute": "migrate", "arguments": { "uri": "tcp:0:4446" } }
>> # -> { "execute": "migrate",
>> #                 "arguments": { "uri": "tcp:0:4446", "multi-fd-uri-list": [ {
>> #                                "source-uri": "tcp::6900", "destination-uri": "tcp:0:4480",
>> #                                "multifd-channels": 4}, { "source-uri": "tcp:10.0.0.0: ",
>> #                                "destination-uri": "tcp:11.0.0.0:7789", "multifd-channels": 5} ] } }
>>
>> even this we should try to wrap within 80 character column right? or is that okay to go beyond 80.
> I'd format it like
>
>    # -> { "execute": "migrate",
>    #      "arguments": {
>    #          "uri": "tcp:0:4446",
>    #          "multi-fd-uri-list": [
>    #              { "source-uri": "tcp::6900",
>    #                "destination-uri": "tcp:0:4480",
>    #                "multifd-channels": 4 },
>    #              { "source-uri": "tcp:10.0.0.0: ",
>    #                "destination-uri": "tcp:11.0.0.0:7789",
>    #                 "multifd-channels": 5} ] } }
 > Yeah sure Markus.
>>>>> Long line.
>>>> Okay, acknowledged. Even for example, should it be under 80
>>>> characters per line, or that is fine?
>>> docs/devel/style.rst:
>>>
>>>       Line width
>>>       ==========
>>>
>>>       Lines should be 80 characters; try not to make them longer.
>>>
>>>       Sometimes it is hard to do, especially when dealing with QEMU subsystems
>>>       that use long function or symbol names. If wrapping the line at 80 columns
>>>       is obviously less readable and more awkward, prefer not to wrap it; better
>>>       to have an 85 character line than one which is awkwardly wrapped.
>>>
>>>       Even in that case, try not to make lines much longer than 80 characters.
>>>       (The checkpatch script will warn at 100 characters, but this is intended
>>>       as a guard against obviously-overlength lines, not a target.)
>>>
>>> Personally, I very much prefer to wrap between 70 and 75 except where it
>>> impairs legibility.
>> Okay thanks again Markus for your valuable suggestion. I will try to wrap within 75 in almost all the cases.
>>>>>> +           '*inc': 'bool', '*detach': 'bool', '*resume': 'bool' } }
>>>>>>       ##
>>>>>>     # @migrate-incoming:
>>>> Regards,
>>>>
>>>> Het Gala
>> Regards,
>>
>> Het Gala

Regards,

Het Gala


