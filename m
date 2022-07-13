Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 679E25730DA
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 10:21:36 +0200 (CEST)
Received: from localhost ([::1]:58608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBXcl-0001RC-CT
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 04:21:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1oBXQd-0006DQ-Ek
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 04:09:05 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:62116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1oBXQY-0007gj-4n
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 04:09:01 -0400
Received: from pps.filterd (m0127837.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26D1DMAn005728;
 Wed, 13 Jul 2022 01:08:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=NoBzsEulpgKmWOjJM+Bjw7BDDD7Xg6nORoAG+nSZ700=;
 b=HHhZ3oSX02dEPQUXe42lVD8su83YFaVpsPu7T0jf6aDaEPC7igaR8e8xF1+oOvwNwTUa
 SQwlToUiGXyqI54bqUlotrQkHTYhPK96O8gRZXIgCXkpP/pLG1THPFAGvivUDWYdp5XZ
 zSp4FirjR5K7iC06qO+DVisPTy+NH2/Yzn4uvO5mcG9CNwH+E5Qo79oATKMzk0yLWQRr
 bAGawsrGjWtjzTwR9Idmk3vFluS9+Sf2VJyfQKXFbLeqOG8D3afvrcuMS7V2XdIzuuYH
 WfsyqgU+cB94nJlHKeCm5ecIfO4uVakj0qVGpRNbTA71tNrK21xgZbYKXKlPo27ZFKVg aw== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3h75k9g0ag-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Jul 2022 01:08:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SFHC8E591n3iJDVEmeJfV1+kP5zRMCWqJ+mhOKUJ6x0IPratwQ/J+lmZOlki/BCus7EPDUsWJkcfJpXyIzWJeyOe4qEymrxqtVh+e5B3TI5rBrcaVsKCnoLTtsYi8yqazRvxH5o2mVtC9M65zKw9+xxHXJxLMC1TShpwaW86KBaD2xy/R54d3GYXDuCOFZqeaZAOMZfNrDb+2OWJKHTLC5Eb4/WaxHNpVpb+eUG6P5vlTqXBWHB72QSRMvAN3uKaxtFIAf2Q/xTYlRCZdbPZbqXR+tti5wIWYOoFnu/AMGKGyARO+kmmLkqXQmIlvh8BAyjfMpf3NTxWKZ7aORAj/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NoBzsEulpgKmWOjJM+Bjw7BDDD7Xg6nORoAG+nSZ700=;
 b=i+eweBrSRKHt+0sVOqC3zeUx1ajZ0iMAtp8Eq/ocsfbR6sH0Z6PcKJ3kuS1r9OBzVJNeDLYbOWzbGueyBkNlpP0Q0yb7yqCNVKoRcgDGfAq3t4TKsh0x/m5opQeOeovty7E8W0mBRxO85iZl6mctxZSDEJ1AVz6Dac1WsV1YJGtfI6zHNb1MFswXIFppiep349rSS4UsVqzDiUHRq/7uL6W2VK6ILU0DkBVVJFSglNTBeBXIJA7rwp41o98Dv9qq68ocU2pf4UI4Wa6ToNjP3mfTU2xUZA5eQCvgnOQV0O3/btNQiezCL+upq0MiKbSeiaYPcEx8RZP3f8uIFgMIPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by BYAPR02MB5333.namprd02.prod.outlook.com (2603:10b6:a03:63::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.25; Wed, 13 Jul
 2022 08:08:48 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::1493:404b:3242:8e0f]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::1493:404b:3242:8e0f%5]) with mapi id 15.20.5417.026; Wed, 13 Jul 2022
 08:08:47 +0000
Message-ID: <56453bef-6b73-4493-f3bf-d2d2315be723@nutanix.com>
Date: Wed, 13 Jul 2022 13:38:01 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: =?UTF-8?B?UmU6IFtQQVRDSCAxLzRdIE1vZGlmeWluZyDigJhtaWdyYXRl4oCZIHFt?=
 =?UTF-8?Q?p_command_to_add_multi-FD_socket_on_particular_source_and_destina?=
 =?UTF-8?Q?tion_pair?=
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, cfontana@suse.de
Cc: qemu-devel@nongnu.org, quintela@redhat.com, pbonzini@redhat.com,
 berrange@redhat.com, armbru@redhat.com, eblake@redhat.com,
 Manish Mishra <manish.mishra@nutanix.com>
References: <20220609073305.142515-1-het.gala@nutanix.com>
 <20220609073305.142515-2-het.gala@nutanix.com> <Yqtn1Q5Dkd2fe0G2@work-vm>
From: Het Gala <het.gala@nutanix.com>
In-Reply-To: <Yqtn1Q5Dkd2fe0G2@work-vm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0022.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::7) To BYAPR02MB4343.namprd02.prod.outlook.com
 (2603:10b6:a03:57::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 02238d94-f167-40dd-9452-08da64a6e9cf
X-MS-TrafficTypeDiagnostic: BYAPR02MB5333:EE_
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fRJCcXJ3g2rvBu6a3Ae6/vMq0QwAHFhKGFMPBg+PzAXRltkIHGgyswF3jKEJlWq4yIzGhUWQ5dPF0AYmEI04E2NadbECrjMSsSl7mGwsHkjWw5Qcd0lwUKv6qHhkPNuelbAu6TN3lNek6vtI7mO11eLaERcFcVdEPX42rPgOxlpokE2LGJoTY4MzUycRSTLB8qVvGLvvNblTYzkgpTK8kjiVLPVwCxe2C8fU9a1IN0cPqYx1sVViVulL1sr5B9In5syr6ZMsHvrK3kPUsaT5wI+xoPYExQbbsMlMZa4WmyA2KlyWIns2ajcqJpg8d9KDxMVhtsc0gYwookpNDkkBMIOQmaJEoXrH3FFtzq4PSwbNM3GcL7t3WLGDfZozTuZ0uzSbAtkfmlbDCdyBU5MaXdGzSwU6dquFAW53x8IzdTdgzH9U6x0bKasY/NQnI5qonYweM3fZnWVp1a74JK0Jz45LFsRnR8J/wBMuDzRpjvTnE9epKQdxSJ5RBVIEDLyN7wLj/H8HFcglVzrF12KeJepKxwvVOyMq6Hv+gH3Bv7OJ8CSuSHVl9nZCmA37xEI09HyTLEvCKz6GccP4kkAnWZ8X6nQBZYODpCgje4NXizX+8h5kGhwBPiYgbeIdSPxK2v5JdphoOMBFYNWZiJ4z8qZ3rIQH9zif4wSCNyphHV5il9Anr6557STwnFAtljZA4ax7m0OtbEtKCKsUVPtb2BZwt6/98CFT+UgTG9TV7DyNXvcmCUbOTtXK1GVn3IfwoV2Qn868zJDIVPp9+UH4h8MpFh8ywxh0ROCY+3qVc6R8cvBP+e9OB9JC9WS5B2aEjqhflzsXxCTWqz1N7KXp9xyJaraxp/Df/qWiBfE+L21Q4/1NFh7lrZn3Umjj6VghIyOcLYc7Ix8PQlxIjK94mw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(39860400002)(346002)(366004)(136003)(396003)(31696002)(26005)(4326008)(6506007)(52116002)(478600001)(66476007)(2616005)(107886003)(186003)(6666004)(6486002)(86362001)(6512007)(41300700001)(66556008)(53546011)(5660300002)(30864003)(2906002)(31686004)(83380400001)(8936002)(38100700002)(36756003)(44832011)(316002)(66946007)(38350700002)(43740500002)(45980500001)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWhRajNLZWY3M1NSV0hLNW51c1lkL3ZYMEZwc2kzYkwrZ2NlWmtYdlNVNmJ2?=
 =?utf-8?B?WExkNERyaHZzTnhuVk01K2lQdEFjNnRHcTlINnFXUnI0RjJzdzVGYXFjZWRC?=
 =?utf-8?B?VkZGTkR5K1RQWWlBOW1wSStRVTgvbURlQ3prUHBMTmh1cXJjL1VOKytKSHNG?=
 =?utf-8?B?WWRDN2FkZmJoOUp6bmhYOG9ENGZaS2pHMzg1UWpOY1Jya2JMMzllZUN3bmpD?=
 =?utf-8?B?SVN5cWQ3WlZMVHBUS1MrZ0VOOXNvb25IRTR1YWJWY1ZhU0xRNk5iTnpOam1t?=
 =?utf-8?B?cGQvZGhlVzRUS0R0bG9YUDRITi9IdmpLZ3pVbWlJMjdjbTl1eEx3MVJDYk5s?=
 =?utf-8?B?a3lWN1ZVaG1uNGRiSC9oYUlVcGdwdThyS0FvaTJFSFJTUlJWQVZzVDhiSld0?=
 =?utf-8?B?LzBYVDl1VnNBN3NNVUU3OU9HdTcxK2NkdnlLRlFpWWtMSEJNR3FFanltRlpr?=
 =?utf-8?B?NkcybklkOWNUS045eVRnR3h4aUJza2RUb3dPWDZWME4rdW1KbGhpdEh0bWJw?=
 =?utf-8?B?VVNyWTd5cDNSVW5XN01PS05NOWJjZm40MGMycXY1TDgweEZmV1pDNHh1N0Ix?=
 =?utf-8?B?L0VWdEtacTBDb3JGbDhoeU1NRmRscmlZakJwRGRVTzlDcG1vRXB0WGxBM1A4?=
 =?utf-8?B?MytFQk00czlpeGRxZmtnekFUK2NMaGlsSytYUk5hV0E3MmxvM1BGMDJidm56?=
 =?utf-8?B?aUtCR2RGbG5rdDBvNTA4MUV2Z09EN0hKV2UxakZrUmNqODd2VmNXdjRIMUJP?=
 =?utf-8?B?a2NpS0pXUWNwWVZNdXd1aG1RaytUaHlqYlBtTWlIYWpVUFJMYllyOFFDWTNa?=
 =?utf-8?B?Y1FRUHZNMktyK1hzY3Z4TkNsYUN2MThVK0RlcEhnOGEzQmw1N1FRZUErZ0ky?=
 =?utf-8?B?c2MreUwxb1d5aGpsK2R0QjlzbEozcTI4aXJhVUpwbDIzN25oY3NMbjFzMW9a?=
 =?utf-8?B?QWYxQVpKSDFjditScWV6bEVBeDdFV3RYNFIrTGNXRmd0N3BYQnJxTHNZL0Yv?=
 =?utf-8?B?b3pnUHN5QjBIaEpoZEVtMkxyaUtqY3p4TjlVUWNzRzlsVjc2T0x1R3YrR3kx?=
 =?utf-8?B?dGI5ZE9HWmhjanByTmgvT3lBK1FPa0ppSHZ1eERvTVc4bFo1ZGM1L3kvZXFo?=
 =?utf-8?B?ejJTK2ZyUTZITEtJSXliSEdhaVNrV2J4cGJEUURIY3pYTkpldkNVcStGUllt?=
 =?utf-8?B?SXljd3FrbGJZdG5Kbko5dVdaS2lkU2tjb2NEU3lnNXFsaENEKzJGWVZUYW9m?=
 =?utf-8?B?akpHejl1Q0dQYUhSU0dTMmV0OGV5YTJvelZzR0hSQytPWE5XeDRmZldsd3dW?=
 =?utf-8?B?QWkvNkdodlphN0hGbnM0VkFkajNpMUdNK3FDN0N3emZ2U1RhdUFXR2dBUjhw?=
 =?utf-8?B?TUh5UFV5S21lYjlTaExYZG1kSVE3SVBSYlU2M3JRTnRkWVlRUVFoRHdBT1Jl?=
 =?utf-8?B?Z3huNzF4S2NhQ01WVEgzci95blVoVmd3VWV5Z2FORnJ3L2IzaTNlOVB6THVL?=
 =?utf-8?B?OW9nUFRQbWNMeTFpTmhhejVTUU1FbHNPRkM2cWxwYlUzZFJZR1JqQnVSRytK?=
 =?utf-8?B?eVE0UXhkSTZmaFVxTkVwSTY2aVRSK3c5RVlSbFpZNXJ3d3ZKU2l5ZnZxZUJS?=
 =?utf-8?B?VFAwZXZkQVhubjIwNmVqak9tbUdyakxtVTE2bnZqVHpLVTRnc3VabzhzdUlH?=
 =?utf-8?B?OVBwRklzdFRaNjJpRUtKZXlxTDk0d1BnL3VGLzdKS1FHMHZnMnVmTXRrN2hr?=
 =?utf-8?B?b290dFRwWmJSdzdvcmowRlN4ZC93NHA3WTZka01TZGRrWHlRR1NLNXdxcklD?=
 =?utf-8?B?REhJeUV1cTg0bFNpc2lzQVlUaGVXRHYycERvUHh5N3dNMnBVdW42aTJDd0ds?=
 =?utf-8?B?ancvZk90ZEsrRStpdzIrMG9SMHlwSFJPaHJOVWo2dGo0eUp0S3RmY2tVdk52?=
 =?utf-8?B?bnVXRCs3SGU2UGF2U0Z6N1VzOWVibjFrTTVMRjYwd1IyU081RTBobCsxZnc0?=
 =?utf-8?B?RGMxQkNsaCtSTHBXUzByUGNtZlJuUDNFSFU3UndvbnlUK2o2a1B6NHk0Q2Jq?=
 =?utf-8?B?WXg0c2xYK1Y3bENvcnU1cVpXZThGTUFyWFdQQ2JvLzZKY205VXZ4S2VrODE5?=
 =?utf-8?Q?h40Ged++JJktvhch0BACkQ1je?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02238d94-f167-40dd-9452-08da64a6e9cf
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2022 08:08:47.8265 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H7oEOY6aHdOa1fJraRgLnlxGzqFbq1us3/OC0xgz1Oyo2z8xDFFkFKVAYlf1u+mDdwv2i2zA07K/BK8O+EP9PQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5333
X-Proofpoint-GUID: zHguSUI4mupKaDpdmz_I-aCrIa58eosi
X-Proofpoint-ORIG-GUID: zHguSUI4mupKaDpdmz_I-aCrIa58eosi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-12_14,2022-07-13_01,2022-06-22_01
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


On 16/06/22 10:56 pm, Dr. David Alan Gilbert wrote:
> * Het Gala (het.gala@nutanix.com) wrote:

 > First of all, I apologise for the late reply. I was on a leave after 
internship ended

at Nutanix. Hope to learn a lot from you all in the process of 
upstreaming multifd

patches.

>> i) Modified the format of the qemu monitor command : 'migrate' by adding a list,
>>     each element in the list consists of multi-FD connection parameters: source
>>     and destination uris and of the number of multi-fd channels between each pair.
>>
>> ii) Information of all multi-FD connection parameters’ list, length of the list
>>      and total number of multi-fd channels for all the connections together is
>>      stored in ‘OutgoingArgs’ struct.
>>
>> Suggested-by: Manish Mishra <manish.mishra@nutanix.com>
>> Signed-off-by: Het Gala <het.gala@nutanix.com>
>> ---
>>   include/qapi/util.h   |  9 ++++++++
>>   migration/migration.c | 47 ++++++++++++++++++++++++++++++--------
>>   migration/socket.c    | 53 ++++++++++++++++++++++++++++++++++++++++---
>>   migration/socket.h    | 17 +++++++++++++-
>>   monitor/hmp-cmds.c    | 22 ++++++++++++++++--
>>   qapi/migration.json   | 43 +++++++++++++++++++++++++++++++----
>>   6 files changed, 170 insertions(+), 21 deletions(-)
>>
>> diff --git a/include/qapi/util.h b/include/qapi/util.h
>> index 81a2b13a33..3041feb3d9 100644
>> --- a/include/qapi/util.h
>> +++ b/include/qapi/util.h
>> @@ -56,4 +56,13 @@ int parse_qapi_name(const char *name, bool complete);
>>       (tail) = &(*(tail))->next; \
>>   } while (0)
>>   
>> +#define QAPI_LIST_LENGTH(list) ({ \
>> +    int _len = 0; \
>> +    typeof(list) _elem; \
>> +    for (_elem = list; _elem != NULL; _elem = _elem->next) { \
>> +        _len++; \
>> +    } \
>> +    _len; \
>> +})
>> +
>>   #endif
> This looks like it should be a separate patch to me (and perhaps size_t
> for len?)

 > Sure, will try to make a seperate patch for QAPI_LIST_LENGTH, and other

such utility functions from the other patches.

>
>> diff --git a/migration/migration.c b/migration/migration.c
>> index 31739b2af9..c408175aeb 100644
>> --- a/migration/migration.c
>> +++ b/migration/migration.c
>> @@ -2328,13 +2328,14 @@ static bool migrate_prepare(MigrationState *s, bool blk, bool blk_inc,
>>       return true;
>>   }
>>   
>> -void qmp_migrate(const char *uri, bool has_blk, bool blk,
>> +void qmp_migrate(const char *uri, bool has_multi_fd_uri_list,
>> +                 MigrateUriParameterList *cap, bool has_blk, bool blk,
>>                    bool has_inc, bool inc, bool has_detach, bool detach,
>>                    bool has_resume, bool resume, Error **errp)
>>   {
>>       Error *local_err = NULL;
>>       MigrationState *s = migrate_get_current();
>> -    const char *p = NULL;
>> +    const char *dst_ptr = NULL;
>>   
>>       if (!migrate_prepare(s, has_blk && blk, has_inc && inc,
>>                            has_resume && resume, errp)) {
>> @@ -2348,20 +2349,46 @@ void qmp_migrate(const char *uri, bool has_blk, bool blk,
>>           }
>>       }
>>   
>> +    /*
>> +     * In case of Multi-FD migration parameters, if uri is provided,
> I think you mean 'if uri list is provided'
 > Acknowledged.
>
>> +     * supports only tcp network protocol.
>> +     */
>> +    if (has_multi_fd_uri_list) {
>> +        int length = QAPI_LIST_LENGTH(cap);
>> +        init_multifd_array(length);
>> +        for (int i = 0; i < length; i++) {
>> +            const char *p1 = NULL, *p2 = NULL;
> Keep these as ps/pd  to make it clear which is source and dest.
 > Acknowledged. Will change in the upcoming patchset.
>
>> +            const char *multifd_dst_uri = cap->value->destination_uri;
>> +            const char *multifd_src_uri = cap->value->source_uri;
>> +            uint8_t multifd_channels = cap->value->multifd_channels;
>> +            if (!strstart(multifd_dst_uri, "tcp:", &p1) ||
>> +                !strstart(multifd_src_uri, "tcp:", &p2)) {
> I've copied in Claudio Fontana; Claudio is fighting to make snapshots
> faster and has been playing with various multithread schemes for multifd
> with files and fd's;  perhaps the syntax you're proposing doesn't need
> to be limited to tcp.

 > For now, we are just aiming to include multifd for existing tcp 
protocol.

We would be happy to take any suggestions from Claudio Fontana and try to

include them in the upcoming patchset series.

>
>> +                error_setg(errp, "multi-fd destination and multi-fd source "
>> +                "uri, both should be present and follows tcp protocol only");
>> +                break;
>> +            } else {
>> +                store_multifd_migration_params(p1 ? p1 : multifd_dst_uri,
>> +                                            p2 ? p2 : multifd_src_uri,
>> +                                            multifd_channels, i, &local_err);
>> +            }
>> +            cap = cap->next;
>> +        }
>> +    }
>> +
>>       migrate_protocol_allow_multi_channels(false);
>> -    if (strstart(uri, "tcp:", &p) ||
>> +    if (strstart(uri, "tcp:", &dst_ptr) ||
>>           strstart(uri, "unix:", NULL) ||
>>           strstart(uri, "vsock:", NULL)) {
>>           migrate_protocol_allow_multi_channels(true);
>> -        socket_start_outgoing_migration(s, p ? p : uri, &local_err);
>> +        socket_start_outgoing_migration(s, dst_ptr ? dst_ptr : uri, &local_err);
>>   #ifdef CONFIG_RDMA
>> -    } else if (strstart(uri, "rdma:", &p)) {
>> -        rdma_start_outgoing_migration(s, p, &local_err);
>> +    } else if (strstart(uri, "rdma:", &dst_ptr)) {
>> +        rdma_start_outgoing_migration(s, dst_ptr, &local_err);
>>   #endif
>> -    } else if (strstart(uri, "exec:", &p)) {
>> -        exec_start_outgoing_migration(s, p, &local_err);
>> -    } else if (strstart(uri, "fd:", &p)) {
>> -        fd_start_outgoing_migration(s, p, &local_err);
>> +    } else if (strstart(uri, "exec:", &dst_ptr)) {
>> +        exec_start_outgoing_migration(s, dst_ptr, &local_err);
>> +    } else if (strstart(uri, "fd:", &dst_ptr)) {
>> +        fd_start_outgoing_migration(s, dst_ptr, &local_err);
>>       } else {
>>           if (!(has_resume && resume)) {
>>               yank_unregister_instance(MIGRATION_YANK_INSTANCE);
>> diff --git a/migration/socket.c b/migration/socket.c
>> index 4fd5e85f50..7ca6af8cca 100644
>> --- a/migration/socket.c
>> +++ b/migration/socket.c
>> @@ -32,6 +32,17 @@ struct SocketOutgoingArgs {
>>       SocketAddress *saddr;
>>   } outgoing_args;
>>   
>> +struct SocketArgs {
>> +    struct SrcDestAddr data;
> 'data' is an odd name; 'addresses' perhaps?
 > Sure, Acknowledged.
>
>> +    uint8_t multifd_channels;
>> +};
>> +
>> +struct OutgoingMigrateParams {
>> +    struct SocketArgs *socket_args;
>> +    size_t length;
>> +    uint64_t total_multifd_channel;
>> +} outgoing_migrate_params;
>> +
>>   void socket_send_channel_create(QIOTaskFunc f, void *data)
>>   {
>>       QIOChannelSocket *sioc = qio_channel_socket_new();
>> @@ -47,6 +58,14 @@ int socket_send_channel_destroy(QIOChannel *send)
>>           qapi_free_SocketAddress(outgoing_args.saddr);
>>           outgoing_args.saddr = NULL;
>>       }
>> +
>> +    if (outgoing_migrate_params.socket_args != NULL) {
>> +        g_free(outgoing_migrate_params.socket_args);
>> +        outgoing_migrate_params.socket_args = NULL;
> I think g_free is safe on NULL; so I think you can just do this without
> the if.
 > Okay, thanks for the suggestion there David.
>
>> +    }
>> +    if (outgoing_migrate_params.length) {
> Does that ever differ from the != NULL test ?
> I think you can always just set this to 0 without the test.
 > Sure.
>
>> +        outgoing_migrate_params.length = 0;
>> +    }
>>       return 0;
>>   }
>>   
>> @@ -117,13 +136,41 @@ socket_start_outgoing_migration_internal(MigrationState *s,
>>   }
>>   
>>   void socket_start_outgoing_migration(MigrationState *s,
>> -                                     const char *str,
>> +                                     const char *dst_str,
>>                                        Error **errp)
>>   {
>>       Error *err = NULL;
>> -    SocketAddress *saddr = socket_parse(str, &err);
>> +    SocketAddress *dst_saddr = socket_parse(dst_str, &err);
>> +    if (!err) {
>> +        socket_start_outgoing_migration_internal(s, dst_saddr, &err);
>> +    }
>> +    error_propagate(errp, err);
>> +}
>> +
>> +void init_multifd_array(int length)
>> +{
>> +    outgoing_migrate_params.socket_args = g_new0(struct SocketArgs, length);
>> +    outgoing_migrate_params.length = length;
>> +    outgoing_migrate_params.total_multifd_channel = 0;
>> +}
>> +
>> +void store_multifd_migration_params(const char *dst_uri,
>> +                                    const char *src_uri,
>> +                                    uint8_t multifd_channels,
>> +                                    int idx, Error **errp)
>> +{
>> +    Error *err = NULL;
>> +    SocketAddress *src_addr = NULL;
>> +    SocketAddress *dst_addr = socket_parse(dst_uri, &err);
>> +    if (src_uri) {
>> +        src_addr = socket_parse(src_uri, &err);
>> +    }
>>       if (!err) {
>> -        socket_start_outgoing_migration_internal(s, saddr, &err);
>> +        outgoing_migrate_params.socket_args[idx].data.dst_addr = dst_addr;
>> +        outgoing_migrate_params.socket_args[idx].data.src_addr = src_addr;
>> +        outgoing_migrate_params.socket_args[idx].multifd_channels
>> +                                                         = multifd_channels;
>> +        outgoing_migrate_params.total_multifd_channel += multifd_channels;
>>       }
>>       error_propagate(errp, err);
>>   }
>> diff --git a/migration/socket.h b/migration/socket.h
>> index 891dbccceb..bba7f177fe 100644
>> --- a/migration/socket.h
>> +++ b/migration/socket.h
>> @@ -19,12 +19,27 @@
>>   
>>   #include "io/channel.h"
>>   #include "io/task.h"
>> +#include "migration.h"
>> +
>> +/* info regarding destination and source uri */
>> +struct SrcDestAddr {
>> +    SocketAddress *dst_addr;
>> +    SocketAddress *src_addr;
>> +};
>>   
>>   void socket_send_channel_create(QIOTaskFunc f, void *data);
>>   int socket_send_channel_destroy(QIOChannel *send);
>>   
>>   void socket_start_incoming_migration(const char *str, Error **errp);
>>   
>> -void socket_start_outgoing_migration(MigrationState *s, const char *str,
>> +void socket_start_outgoing_migration(MigrationState *s, const char *dst_str,
>>                                        Error **errp);
>> +
>> +int multifd_list_length(MigrateUriParameterList *list);
>> +
>> +void init_multifd_array(int length);
>> +
>> +void store_multifd_migration_params(const char *dst_uri, const char *src_uri,
>> +                                    uint8_t multifd_channels, int idx,
>> +                                    Error **erp);
>>   #endif
>> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
>> index 622c783c32..2db539016a 100644
>> --- a/monitor/hmp-cmds.c
>> +++ b/monitor/hmp-cmds.c
>> @@ -56,6 +56,9 @@
>>   #include "migration/snapshot.h"
>>   #include "migration/misc.h"
>>   
>> +/* Default number of multi-fd channels */
>> +#define DEFAULT_MIGRATE_MULTIFD_CHANNELS 2
>> +
>>   #ifdef CONFIG_SPICE
>>   #include <spice/enums.h>
>>   #endif
>> @@ -1574,10 +1577,25 @@ void hmp_migrate(Monitor *mon, const QDict *qdict)
>>       bool inc = qdict_get_try_bool(qdict, "inc", false);
>>       bool resume = qdict_get_try_bool(qdict, "resume", false);
>>       const char *uri = qdict_get_str(qdict, "uri");
>> +
>> +    const char *src_uri = qdict_get_str(qdict, "source-uri");
>> +    const char *dst_uri = qdict_get_str(qdict, "destination-uri");
>> +    uint8_t multifd_channels = qdict_get_try_int(qdict, "multifd-channels",
>> +                                        DEFAULT_MIGRATE_MULTIFD_CHANNELS);
>>       Error *err = NULL;
>> +    MigrateUriParameterList *caps = NULL;
>> +    MigrateUriParameter *value;
>> +
>> +    value = g_malloc0(sizeof(*value));
>> +    value->source_uri = (char *)src_uri;
>> +    value->destination_uri = (char *)dst_uri;
>> +    value->multifd_channels = multifd_channels;
>> +    QAPI_LIST_PREPEND(caps, value);
>> +
>> +    qmp_migrate(uri, !!caps, caps, !!blk, blk, !!inc,
>> +                inc, false, false, true, resume, &err);
>> +    qapi_free_MigrateUriParameterList(caps);
>>   
>> -    qmp_migrate(uri, !!blk, blk, !!inc, inc,
>> -                false, false, true, resume, &err);
>>       if (hmp_handle_error(mon, err)) {
>>           return;
>>       }
> Please split the HMP changes into a separate patch.

 > Okay sure. Will include both on destination and source side HMP changes

into a seperate patch.

>
>> diff --git a/qapi/migration.json b/qapi/migration.json
>> index 6130cd9fae..fb259d626b 100644
>> --- a/qapi/migration.json
>> +++ b/qapi/migration.json
>> @@ -1454,12 +1454,38 @@
>>   ##
>>   { 'command': 'migrate-continue', 'data': {'state': 'MigrationStatus'} }
>>   
>> +##
>> +# @MigrateUriParameter:
>> +#
>> +# Information regarding which source interface is connected to which
>> +# destination interface and number of multifd channels over each interface.
>> +#
>> +# @source-uri: the Uniform Resource Identifier of the source VM.
>> +#              Default port number is 0.
>> +#
>> +# @destination-uri: the Uniform Resource Identifier of the destination VM
> I would just say 'uri' rather than spelling it out.
 > Okay, acknowledged.
>
>> +# @multifd-channels: number of parallel multifd channels used to migrate data
>> +#                    for specific source-uri and destination-uri. Default value
>> +#                    in this case is 2 (Since 4.0)
> 7.1 at the moment.
 > Thanks for pointing it out.
>
>> +#
>> +##
>> +{ 'struct' : 'MigrateUriParameter',
>> +  'data' : { 'source-uri' : 'str',
>> +             'destination-uri' : 'str',
>> +             '*multifd-channels' : 'uint8'} }
> OK, so much higher level question - why do we specify both URIs on
> each end?  Is it just the source that is used on the source side to say
> which NIC to route down?  On the destination side I guess there's no
> need?
>
> Do we have some rule about needing to specify enough channels for all
> the multifd channels we specify (i.e. if we specify 4 multifd channels
> in the migration parameter do we have to supply 4 channels here?)
> What happens with say Peter's preemption channel?
>
> Is there some logical ordering rule; i.e. if we were to start ordering
> particular multifd threads, then can we say that we allocate these
> channels in the same order as this list?

 > I certainly did not get your first point here David. On the 
destination side,

I think we certainly need both, destination and source uri's for making 
a connection

but on the source side, we do not require source uri, which I have not 
included

if you look at the 'Adding multi-interface support for multi-FD on 
destination

side' patch.

 > Yes, I agree with you. I will inlcude this feature in the next 
version of patchset,

where it will check the number of multifd channels coming from API and 
total

multifd channel number from qmp monitor command, and should be equal.

 > Yes David, multifd threads will be allocated in the same order, the 
user will

specify in the qmp monitor command.

>>   ##
>>   # @migrate:
>>   #
>>   # Migrates the current running guest to another Virtual Machine.
>>   #
>>   # @uri: the Uniform Resource Identifier of the destination VM
>> +#       for migration thread
>> +#
>> +# @multi-fd-uri-list: list of pair of source and destination VM Uniform
>> +#                     Resource Identifiers with number of multifd-channels
>> +#                     for each pair
>>   #
>>   # @blk: do block migration (full disk copy)
>>   #
>> @@ -1479,20 +1505,27 @@
>>   # 1. The 'query-migrate' command should be used to check migration's progress
>>   #    and final result (this information is provided by the 'status' member)
>>   #
>> -# 2. All boolean arguments default to false
>> +# 2. The uri argument should have the Uniform Resource Identifier of default
>> +#    destination VM. This connection will be bound to default network
>> +#
>> +# 3. All boolean arguments default to false
>>   #
>> -# 3. The user Monitor's "detach" argument is invalid in QMP and should not
>> +# 4. The user Monitor's "detach" argument is invalid in QMP and should not
>>   #    be used
>>   #
>>   # Example:
>>   #
>> -# -> { "execute": "migrate", "arguments": { "uri": "tcp:0:4446" } }
>> +# -> { "execute": "migrate",
>> +#                 "arguments": { "uri": "tcp:0:4446", "multi-fd-uri-list": [ {
>> +#                                "source-uri": "tcp::6900", "destination-uri": "tcp:0:4480",
>> +#                                "multifd-channels": 4}, { "source-uri": "tcp:10.0.0.0: ",
>> +#                                "destination-uri": "tcp:11.0.0.0:7789", "multifd-channels": 5} ] } }
>>   # <- { "return": {} }
>>   #
>>   ##
>>   { 'command': 'migrate',
>> -  'data': {'uri': 'str', '*blk': 'bool', '*inc': 'bool',
>> -           '*detach': 'bool', '*resume': 'bool' } }
>> +  'data': {'uri': 'str', '*multi-fd-uri-list': ['MigrateUriParameter'], '*blk': 'bool',
>> +           '*inc': 'bool', '*detach': 'bool', '*resume': 'bool' } }
>>   
>>   ##
>>   # @migrate-incoming:
>> -- 
>> 2.22.3
>>
Regards

Het Gala


