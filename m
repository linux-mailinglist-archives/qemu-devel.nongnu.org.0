Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2365A41FC
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 06:38:30 +0200 (CEST)
Received: from localhost ([::1]:60668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSWXd-0001aI-A7
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 00:38:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1oSWUD-0008V1-Kv
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 00:34:58 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:24766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1oSWUA-0004el-HV
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 00:34:56 -0400
Received: from pps.filterd (m0127843.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27T0jPxH019015;
 Sun, 28 Aug 2022 21:34:51 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=content-type :
 message-id : date : subject : from : to : cc : references : in-reply-to :
 mime-version; s=proofpoint20171006;
 bh=0+n7sWu+RgdApVsxky/ntenbcUBOquRvZxPhYnK/bi4=;
 b=0A6Nmurvg7s02xFriRyJVaHqdjcbHEjGTsQnUvnVUEz7ZzgnkGvlIsvTp6A/RYpRR16V
 sa8PxVAMnvqNfFhX/FqDX4+K2TKeWwQ+sNxC91mMonZVHl2WYzmHih+6tmGMuZoHoBIx
 r21samzl/ZoZ565KMjui/0DO7buATBiSiCDZvpsrspO6WZUaoIpBdINQAsBDjQjjOUVL
 zCmw2Ihg3A5dZd7WpTJhytMkbvdNvi+Nj6lwMLcQiWjSu1S8pmec1xdw8KlAZWRSCnAT
 vMbCPJlbPwGP4vK0M/Qx3S1BIiRq3syurAotNBIGvGjBl5SKwdeLrmFTo5uAo6Sy7oG+ ng== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3j7hckaydw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 28 Aug 2022 21:34:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vbni8JwFb34rKYhy//eMS7qdBjfF8bIO8DCDFr0gDeN3xMYLNRPc6vLBdqvpZ9k6a3bMSJKMrdAyggnvEMsFB9NBj57VwyOJU325M1MGwh6aVcaLVlUPbka+4lWRlpvLLaRU/SSoKIK1Txor9pPiCt8mJs8VqkXpJRZ0PPRJWtefrXjy7qsSXU0/4+qggMoev7I7ZWlB83kmm8FsxLyfmpUIAFTCHtYt+6FOpvUG8x76fUJ4JWguxpJJFpT+lKIGHo3O+cm+0sppYlBExvq3wEC+9ucc48TelywI5oNaSYaK7/ovJeb0lQSecU9osXs7x529c1k+mtf36H2I+1nuRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0+n7sWu+RgdApVsxky/ntenbcUBOquRvZxPhYnK/bi4=;
 b=EOUzTeaLqI3IE+YpqR3YL3G6f8x/9G9RHL0+uYmoGjkjWR0WVek5MiLof7llzkFyCaWqrDHFPyZocU0Av3s0Da27oV8dvtU6r3Wu4QQOKw7SxU0wIbBU5LFPR8iGiLczVIfK2rhTECJ4lUiy0lL06dkKc1b5r6VvNaf18XVMyCdZnRsm0mooPHaXxc3B38QX6x9Q2e/1H4QGBWr0sitn/10HXN+YiZrLNrnk5RH2lIgLu84BF9J0c0BHD+yWhJDbehRdLiuWKfmgicEo8DZBDZxRPkHajfnOXw5CZXE663EHuOp6N8t6ZZamyXO+1P9D37DOVR3/TDXO0ixnOWMSsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by DM6PR02MB6187.namprd02.prod.outlook.com (2603:10b6:5:1f5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Mon, 29 Aug
 2022 04:34:48 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::7495:8fc1:bdad:5cd1]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::7495:8fc1:bdad:5cd1%5]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 04:34:47 +0000
Content-Type: multipart/alternative;
 boundary="------------WsVuDUhJItc40TSPsEs05076"
Message-ID: <04f9afe5-0793-1037-057e-dc73cad4fb4e@nutanix.com>
Date: Mon, 29 Aug 2022 10:04:34 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v2 2/7] multifd: modifying 'migrate' qmp command to add
 multifd socket on particular src and dest pair
From: Het Gala <het.gala@nutanix.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, quintela@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, eblake@redhat.com, prerna.saxena@nutanix.com,
 Manish Mishra <manish.mishra@nutanix.com>
References: <20220721195620.123837-1-het.gala@nutanix.com>
 <20220721195620.123837-3-het.gala@nutanix.com> <Yt/MZiK3OuvQMRfF@redhat.com>
 <fb5528cf-ccf1-2c21-6899-cb503950d432@nutanix.com>
 <87sfmf84iy.fsf@pond.sub.org>
 <b20eec2e-1e33-15e3-ae84-346ceb05b673@nutanix.com>
In-Reply-To: <b20eec2e-1e33-15e3-ae84-346ceb05b673@nutanix.com>
X-ClientProxiedBy: PN3PR01CA0139.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::9) To BYAPR02MB4343.namprd02.prod.outlook.com
 (2603:10b6:a03:57::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1aa9f77f-6a17-46f5-231e-08da8977cdda
X-MS-TrafficTypeDiagnostic: DM6PR02MB6187:EE_
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A60AK5wnj442sqQU/Pk8CMHudBj2zfeDWBtEbdNdDCj+Vn5DYfQ0jN9M9/7IPs5wwk1hMzH2lrdbgnHvkFabeVeHKKUt3QxqoOweiA48vF/bdHcLS5GEtV3VDJtlTCMoCXFJxaXDBB3IvwVw1Bv4Q7+nd+gfMbe98RvsCpNmiVQtbZWL9HzPip2grkSYBuujBNjieSO5OfvQ9MtEYPEABO1hGCtXWpRsCLd7bh1wSaDS2lBlmoIWdG4IyQAQlpRnrx5zlOJpBSLG6y4CnuX9rUQX/qAbfDPj9Lf7I3Zd8QkA1iYVWKmAyZ1xymkAfUngxN0Aw7/LWCYWjgDL+HFOPCoH5UeMm0t4PVfBjJ1SBvm4YA5cE7WkzMCwsCOc3lHSHR2DACzLinc3c9Qe6bUqDw5OFbtfX+7csy/NwLclmUVWjyL7Qb8mGGWeaMajdda0oPXMPOOiDlv8ZX1dm5Hs0nZdfHWWnPcVH/UAc9N01jdSobJSh/shCuymWXkV0wmawaa8/yExX01U+Hse20issRvzLwbkLMZTAfZ7bMzvBcrD3lHAhW5UWwJPbhEnnBOzWmUxKrCaSCsBQus2BNGBZRL5xq8grHl5qG8LVCRx3ZN8aSnwCT4Qcri89Oar5BwatQ0kbU8QcB8SCJJTfsdODUwBV+XZs6ID3Qi/JBn1JoT3LbJrnTui2G8lF4RtqXhXyc/YNbYiICn3NDnP+Cj3+pr8iq6wFqTs0/ynZCRM9F1jTFUmVjT9ePZWj55fNSrIYDMw8r236HJUvd83HzrYFqLAH9NxPfMuiCW5Yw7aze9LWKkEv5lmsq6dcUew1Ngl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(376002)(39850400004)(396003)(346002)(366004)(316002)(6916009)(54906003)(8676002)(6486002)(4326008)(86362001)(31686004)(66946007)(66556008)(66476007)(31696002)(5660300002)(478600001)(36756003)(8936002)(41300700001)(30864003)(52116002)(107886003)(38350700002)(44832011)(6666004)(2616005)(38100700002)(33964004)(6506007)(2906002)(53546011)(83380400001)(26005)(6512007)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b1RoWGM0aUxIWnJEeTNZTUhDVmxwZVlCWHdxZk5yUUpFWnZaSXlyMHBXcVhE?=
 =?utf-8?B?WG1LS0Nqbi9wbThpUjM2OTM1SzRyalRobWZDRUt2S1RZenhMcEhjdHpkcW0x?=
 =?utf-8?B?eTFEcFRGQ2RSTGRVWDBkcHM4ck9GTS9ELzVHb1RyWEQ2TDAzbEEydDBHYlNC?=
 =?utf-8?B?LzBMZ1VCdXhHbVFhQ1VpcWlWSG1LUmVqQVlVNDFFSzJvaXlqMm5zQ0l3WWdF?=
 =?utf-8?B?eVY5MWJFR2t0bk1QeFgyUlYrd2Nramx3Q24vL0ZKdTZINElRdklkdkNORmhm?=
 =?utf-8?B?NlZ5dnpLaklpOTkwMWp4dVlOdnFFRkZBd3JkRGpwTGcyMFArL1F5Y1RrUkdH?=
 =?utf-8?B?eHB2cU1Remx4M1dUZ2RJNEFEYjFibENKSno2ay9ydVNrUm5Na3A0WGVLQmtX?=
 =?utf-8?B?VDFpVWk0UC9TVFZvOHlaUWVmZjZmN25GSmREQWJZUE5DSjhTb1ZBWVBhMTc5?=
 =?utf-8?B?NjY0dzJZWC9QS29sWFBNS21sV1pVY0w2dDRjelhiK2tBOUwzUXNzYzZ6NEND?=
 =?utf-8?B?R25iY2k1Qzd2N1dQbWd2UWtVUkM2NDBRWG1kM3FzOUp3bVMxeXdVVmMyWmV1?=
 =?utf-8?B?UUVTMWpzREFIS2wwL1hGZXRQdGZHZnNMTW12M1FETStmQnpkcWxKTFk2VmlD?=
 =?utf-8?B?aW02OXNWWnNpdUVHMGxzUEdkWE52RUtJMXhWVEtwci9Nd3FlU3ZBZUJPekJ0?=
 =?utf-8?B?N2hnd0N2TXB3azEzZ0VqWnFMRUppc0hMNlN3bDIwb000emhLQmJPM1NHYXhy?=
 =?utf-8?B?bzNGUXMyaVFxM3hqenRxTEhwN05WR09TM083aDRWakQ3ZWNVTm0zU05EdFFq?=
 =?utf-8?B?aGFpOUN4TnErUjB2dHdNVEJ3V3AwN0lkYTh4MGZXNUtBaGhXSmlhL3JQQmYv?=
 =?utf-8?B?QkpHSGd3MjFER2lDQisyOG0zbVJocjNoMnFGWHNuYkN5ZS9qeFltd2l4cTg1?=
 =?utf-8?B?ajlpRTRSSEpwK2RHblZpbGUva3R3MFRxY3YxUktta01DVUV1YkFJbFRlbnR3?=
 =?utf-8?B?SXlFM3ZtRmJIKzB2Y1J1SG8yb1ZEU3A5aFh2WG8xRHlYWUlneEhWVW92OGNB?=
 =?utf-8?B?dHFSWmJwZVFLSUsxcHIvbS9PQkJiV0lVbkRFSjdRWDEraGFEVmE3SVRQYWw5?=
 =?utf-8?B?Z3J6QlRRRXd5UGxLSGl2aDk3d3VvTGRldkgxKytGNG8vRVlxVTBUVGZlREZq?=
 =?utf-8?B?U0cxMXV0UG5iejNRN1dvR3VraDJkOWREVEtMTkxqNGNuU2dIOWVUdVRhZTJM?=
 =?utf-8?B?ZG45MnNPR2dFcE16Q3RmOFhvaUhDaks0SEJMVDFERFFndVk4YkxIQlZxdlJs?=
 =?utf-8?B?VXJzVlJlT1dvcHYzeDFta3YrNjFOOE9EYXF5d1JOU0diRExhTWFwSVdKMUNq?=
 =?utf-8?B?MGpReGE2MEMzU3k0S0FKek9LTTV2Rkppc0VCUnlVcFYvK0RuQ2dYYkpROFRU?=
 =?utf-8?B?WU5EWUJKVXM5Yk5wVEFNNktYNEcwc2tSTGtJRm5ndjZqemxwWnFSV0xRdHI3?=
 =?utf-8?B?V2FmOTJrejJ5TDg5TDIva2hPL0toV0FFY2QrbWt4NmZEV2U4eEIxN3dPQlFV?=
 =?utf-8?B?L3BxQ0g5bTZYanBQV2RuWFNtMkl4MDNCcml4Sk83ZFlOd0dHd2kydDJqYXcz?=
 =?utf-8?B?RmxBMGNwdXRPK2N5YytQL3Bsc1Z2VUZwOHVGZnRiWHNQNHZwYXh6SThkeTNn?=
 =?utf-8?B?eU1mdURmaWFXVlNIVXNVUlVvTDJyek9XKzJ4U0dqOXRPVHZqOUlxSXo1c1lu?=
 =?utf-8?B?Z1JTdDc5NjkxZ1BnU1VPQ1VZTTkrcGhvZW1pZzR2bm5aREF1ODc0cEcrQTVx?=
 =?utf-8?B?ZUNIK0d0RUIwKzl4aVNidWY5cVlYdHgvRHVqUGZSUmxPL0FCNXlObFR4VklH?=
 =?utf-8?B?NldFMlNyN3pOT2I0S1k3RWY3YU5xN3lUT1NCa0hPSmVrVXpabmFDdmlHYjhO?=
 =?utf-8?B?akVTcEtmaXI2WTJNcjdZRGx3S3BtYllBWGFZQ3p4S2dpS3BYdmVLeEZHbHgw?=
 =?utf-8?B?RTZpd0FyVHZENWkzaXlyQ1dtRFBNY2QrMWxkVUkzdjhaNUxTcU5UU01EOVMr?=
 =?utf-8?B?RlB5YzBHQWJhS3FOZUQwUzYwRmtJY1pTMkF5dm5Rd0dxT3h4RkxPLy9wYmRC?=
 =?utf-8?Q?zT4Bd63HENFEYIyBENjU2RdwO?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1aa9f77f-6a17-46f5-231e-08da8977cdda
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2022 04:34:47.7366 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mwIqlqt46VsHuVWRMOWOpuTHdSA3HliRHT6/yEhWuwrjpNO6zZpmlbK6P1L+6joCLHWnCe1vCtDXEG9mRmO1eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6187
X-Proofpoint-ORIG-GUID: eNEgnejqa_-1x3hzIoUjPP7OPto5nTUQ
X-Proofpoint-GUID: eNEgnejqa_-1x3hzIoUjPP7OPto5nTUQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-29_02,2022-08-25_01,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12; envelope-from=het.gala@nutanix.com;
 helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

--------------WsVuDUhJItc40TSPsEs05076
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 08/08/22 11:41 am, Het Gala wrote:
>
>
> On 02/08/22 1:23 pm, Markus Armbruster wrote:
>> Het Gala<het.gala@nutanix.com>  writes:
>>
>>> On 26/07/22 4:43 pm, Daniel P. Berrangé wrote:
>>>> On Thu, Jul 21, 2022 at 07:56:15PM +0000, Het Gala wrote:
>>>>> i) Modified the format of the qemu monitor command : 'migrate' by adding a list,
>>>>>      each element in the list consisting of multifd connection parameters: source
>>>>>      uri, destination uri and of the number of multifd channels between each pair.
>>>>>
>>>>> ii) Information of all multifd connection parameters' list and length of the
>>>>>       list is stored in 'OutgoingMigrateParams' struct.
>>>>>
>>>>> Suggested-by: Manish Mishra<manish.mishra@nutanix.com>
>>>>> Signed-off-by: Het Gala<het.gala@nutanix.com>
>>>>> ---
>>>>>    migration/migration.c | 52 +++++++++++++++++++++++++++++--------
>>>>>    migration/socket.c    | 60 ++++++++++++++++++++++++++++++++++++++++---
>>>>>    migration/socket.h    | 19 +++++++++++++-
>>>>>    monitor/hmp-cmds.c    |  1 +
>>>>>    qapi/migration.json   | 47 +++++++++++++++++++++++++++++----
>>>>>    5 files changed, 160 insertions(+), 19 deletions(-)
>>>>>
>>>>> diff --git a/qapi/migration.json b/qapi/migration.json
>>>>> index 81185d4311..456247af8f 100644
>>>>> --- a/qapi/migration.json
>>>>> +++ b/qapi/migration.json
>>>>> @@ -1449,12 +1449,37 @@
>>>>>    ##
>>>>>    { 'command': 'migrate-continue', 'data': {'state': 'MigrationStatus'} }
>>>>>    +##
>>>>> +# @MigrateUriParameter:
>>>>> +#
>>>>> +# Information regarding which source interface is connected to which
>>>>> +# destination interface and number of multifd channels over each interface.
>>>>> +#
>>>>> +# @source-uri: uri of the source VM. Default port number is 0.
>>>>> +#
>>>>> +# @destination-uri: uri of the destination VM
>>>>> +#
>>>>> +# @multifd-channels: number of parallel multifd channels used to migrate data
>>>>> +#                    for specific source-uri and destination-uri. Default value
>>>>> +#                    in this case is 2 (Since 7.1)
>>>>> +#
>>>>> +##
>>>>> +{ 'struct' : 'MigrateUriParameter',
>>>>> +  'data' : { 'source-uri' : 'str',
>>>>> +             'destination-uri' : 'str',
>>>>> +             '*multifd-channels' : 'uint8'} }
>>>>> +
>>>>>    ##
>>>>>    # @migrate:
>>>>>    #
>>>>>    # Migrates the current running guest to another Virtual Machine.
>>>>>    #
>>>>>    # @uri: the Uniform Resource Identifier of the destination VM
>>>>> +#       for migration thread
>>>>> +#
>>>>> +# @multi-fd-uri-list: list of pair of source and destination VM Uniform
>>>>> +#                     Resource Identifiers with number of multifd-channels
>>>>> +#                     for each pair
>>>>>    #
>>>>>    # @blk: do block migration (full disk copy)
>>>>>    #
>>>>> @@ -1474,20 +1499,32 @@
>>>>>    # 1. The 'query-migrate' command should be used to check migration's progress
>>>>>    #    and final result (this information is provided by the 'status' member)
>>>>>    #
>>>>> -# 2. All boolean arguments default to false
>>>>> +# 2. The uri argument should have the Uniform Resource Identifier of default
>>>>> +#    destination VM. This connection will be bound to default network
>>>>>    #
>>>>> -# 3. The user Monitor's "detach" argument is invalid in QMP and should not
>>>>> +# 3. All boolean arguments default to false
>>>>> +#
>>>>> +# 4. The user Monitor's "detach" argument is invalid in QMP and should not
>>>>>    #    be used
>>>>>    #
>>>>>    # Example:
>>>>>    #
>>>>> -# -> { "execute": "migrate", "arguments": { "uri": "tcp:0:4446" } }
>>>>> +# -> { "execute": "migrate",
>>>>> +#      "arguments": {
>>>>> +#          "uri": "tcp:0:4446",
>>>>> +#          "multi-fd-uri-list": [ { "source-uri": "tcp::6900",
>>>>> +#                                   "destination-uri": "tcp:0:4480",
>>>>> +#                                   "multifd-channels": 4},
>>>>> +#                                 { "source-uri": "tcp:10.0.0.0: ",
>>>>> +#                                   "destination-uri": "tcp:11.0.0.0:7789",
>>>>> +#                                   "multifd-channels": 5} ] } }
>>>>>    # <- { "return": {} }
>>>>>    #
>>>>>    ##
>>>>>    { 'command': 'migrate',
>>>>> -  'data': {'uri': 'str', '*blk': 'bool', '*inc': 'bool',
>>>>> -           '*detach': 'bool', '*resume': 'bool' } }
>>>>> +  'data': {'uri': 'str', '*multi-fd-uri-list': ['MigrateUriParameter'],
>>>>> +           '*blk': 'bool', '*inc': 'bool', '*detach': 'bool',
>>>>> +           '*resume': 'bool' } }
>>>> Considering the existing migrate API from a QAPI design POV, I
>>>> think there are several significant flaws with it
>>>>
>>>> The use of URIs is the big red flag. It is basically a data encoding
>>>> scheme within a data encoding scheme.  QEMU code should be able to
>>>> directly work with the results from QAPI, without having todo a
>>>> second level of parsing.
>> Concur.
>>
>>>> URIs made sense in the context of HMP or the QemuOpts CLI, but do not
>>>> make sense in QMP. We made a mistake in this respect when we first
>>>> introduced QMP and implemented 'migrate'.
>>>>
>>>> If we going to extend the migrate API I think we should stop using URIs
>>>> for the new fields, and instead define a QAPI discriminated union for
>>>> the different data transport backends we offer.
>>>>
>>>>        { 'enum': 'MigrateTransport',
>>>>          'data': ['socket', 'exec'] }
>>>>
>>>>        { 'union': 'MigrateAddress',
>>>>          'base': { 'transport': 'MigrateTransport'},
>>>>          'discriminator': 'transport',
>>>>          'data': {
>>>>              'socket': 'SocketAddress',
>>>> 	   'exec': ['str'],
>>>>          }
>>>>
>>>> NB, 'socket' should be able to cover all of  'tcp', 'unix', 'vsock'
>>>> and 'fd' already. I'm fuzzy on best way to represent RDMA.
>>>>
>>>>
>>>> IIUC, the desire of migration maintainers is that we can ultimately
>>>> have multifd as the preferred, or even only, mechanism. Aside from
>>>> the main outbound migration control channel, and the multifd
>>>> data channels, IIUC we have a potential desire to have more channels
>>>> for post-copy async requests.
>>>>
>>>> This all suggests to me a more general representation along the
>>>> lines of:
>>>>
>>>>     { 'enum': 'MigrateChannelType',
>>>>       'data': ['control', 'data', 'async'] }
>>>>
>>>>     { 'struct': 'MigrateChannel',
>>>>       'data': {
>>>>          'type': 'MigrateChannelType',
>>>>          'src-addr': 'MigrateAddress',
>>>>          'dst-addr': 'MigrateAddress',
>>>>          'count': 'int',
>>>>       } }
>>>>
>>>>     { 'comand': 'migrate',
>>>>       'data': {
>>>>         '*uri': 'str'
>>>>         '*channels': ['MigrateChannel']
>>>>       }
>>>>     }
>>>>
>>>> With 'uri' and 'channels' being mutually exclusive here.
>>>>
>>>> This whole scheme brings in redundancy wrt to the 'migrate-set-parameters'
>>>> API wrt multifd - essentally the same data is now being set in two
>>>> different places. IMHO, we should declare the 'multifd' capability
>>>> and the 'multifd-chanels' parameter deprecated, since the information
>>>> they provide is totally redundant, if you're giving an explicit list
>>>> of channels to 'migrate'.
>>> Hi Daniel. Initially while brainstorming this idea for the first time, we also came up with the same thought of depricating the migrate
>>> API. But how will we achieve this now and how is it going to work. Is it like we will be making migate V2 APIs initially, integrate it and then
>>> depricate the old one? would be happy to get some pointers from your end.
>> Migration maintainers, please advise.
> Hi Daniel and other migraton maintainers: Dr. David and Juan, what is your opinion on this. And how can we go forward implementing this. Some pointers and ideas from your end would be helpful too.
> Regards,
> Het Gala

Just a gentle reminder Dr. David and Juan. Daniel already expressed his 
opinion to refactor the QAPI design for multifd. Your inputs and advice 
will also be very valuable to us. Thankyou.

Regards,
Het Gala
--------------WsVuDUhJItc40TSPsEs05076
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 08/08/22 11:41 am, Het Gala wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:b20eec2e-1e33-15e3-ae84-346ceb05b673@nutanix.com">
      
      <p><br>
      </p>
      <div class="moz-cite-prefix">On 02/08/22 1:23 pm, Markus
        Armbruster wrote:<br>
      </div>
      <blockquote type="cite" cite="mid:87sfmf84iy.fsf@pond.sub.org">
        <pre class="moz-quote-pre" wrap="">Het Gala <a class="moz-txt-link-rfc2396E" href="mailto:het.gala@nutanix.com" moz-do-not-send="true">&lt;het.gala@nutanix.com&gt;</a> writes:

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">On 26/07/22 4:43 pm, Daniel P. Berrangé wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">On Thu, Jul 21, 2022 at 07:56:15PM +0000, Het Gala wrote:
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">i) Modified the format of the qemu monitor command : 'migrate' by adding a list,
    each element in the list consisting of multifd connection parameters: source
    uri, destination uri and of the number of multifd channels between each pair.

ii) Information of all multifd connection parameters' list and length of the
     list is stored in 'OutgoingMigrateParams' struct.

Suggested-by: Manish Mishra <a class="moz-txt-link-rfc2396E" href="mailto:manish.mishra@nutanix.com" moz-do-not-send="true">&lt;manish.mishra@nutanix.com&gt;</a>
Signed-off-by: Het Gala <a class="moz-txt-link-rfc2396E" href="mailto:het.gala@nutanix.com" moz-do-not-send="true">&lt;het.gala@nutanix.com&gt;</a>
---
  migration/migration.c | 52 +++++++++++++++++++++++++++++--------
  migration/socket.c    | 60 ++++++++++++++++++++++++++++++++++++++++---
  migration/socket.h    | 19 +++++++++++++-
  monitor/hmp-cmds.c    |  1 +
  qapi/migration.json   | 47 +++++++++++++++++++++++++++++----
  5 files changed, 160 insertions(+), 19 deletions(-)

diff --git a/qapi/migration.json b/qapi/migration.json
index 81185d4311..456247af8f 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -1449,12 +1449,37 @@
  ##
  { 'command': 'migrate-continue', 'data': {'state': 'MigrationStatus'} }
  +##
+# @MigrateUriParameter:
+#
+# Information regarding which source interface is connected to which
+# destination interface and number of multifd channels over each interface.
+#
+# @source-uri: uri of the source VM. Default port number is 0.
+#
+# @destination-uri: uri of the destination VM
+#
+# @multifd-channels: number of parallel multifd channels used to migrate data
+#                    for specific source-uri and destination-uri. Default value
+#                    in this case is 2 (Since 7.1)
+#
+##
+{ 'struct' : 'MigrateUriParameter',
+  'data' : { 'source-uri' : 'str',
+             'destination-uri' : 'str',
+             '*multifd-channels' : 'uint8'} }
+
  ##
  # @migrate:
  #
  # Migrates the current running guest to another Virtual Machine.
  #
  # @uri: the Uniform Resource Identifier of the destination VM
+#       for migration thread
+#
+# @multi-fd-uri-list: list of pair of source and destination VM Uniform
+#                     Resource Identifiers with number of multifd-channels
+#                     for each pair
  #
  # @blk: do block migration (full disk copy)
  #
@@ -1474,20 +1499,32 @@
  # 1. The 'query-migrate' command should be used to check migration's progress
  #    and final result (this information is provided by the 'status' member)
  #
-# 2. All boolean arguments default to false
+# 2. The uri argument should have the Uniform Resource Identifier of default
+#    destination VM. This connection will be bound to default network
  #
-# 3. The user Monitor's &quot;detach&quot; argument is invalid in QMP and should not
+# 3. All boolean arguments default to false
+#
+# 4. The user Monitor's &quot;detach&quot; argument is invalid in QMP and should not
  #    be used
  #
  # Example:
  #
-# -&gt; { &quot;execute&quot;: &quot;migrate&quot;, &quot;arguments&quot;: { &quot;uri&quot;: &quot;tcp:0:4446&quot; } }
+# -&gt; { &quot;execute&quot;: &quot;migrate&quot;,
+#      &quot;arguments&quot;: {
+#          &quot;uri&quot;: &quot;tcp:0:4446&quot;,
+#          &quot;multi-fd-uri-list&quot;: [ { &quot;source-uri&quot;: &quot;tcp::6900&quot;,
+#                                   &quot;destination-uri&quot;: &quot;tcp:0:4480&quot;,
+#                                   &quot;multifd-channels&quot;: 4},
+#                                 { &quot;source-uri&quot;: &quot;tcp:10.0.0.0: &quot;,
+#                                   &quot;destination-uri&quot;: &quot;tcp:11.0.0.0:7789&quot;,
+#                                   &quot;multifd-channels&quot;: 5} ] } }
  # &lt;- { &quot;return&quot;: {} }
  #
  ##
  { 'command': 'migrate',
-  'data': {'uri': 'str', '*blk': 'bool', '*inc': 'bool',
-           '*detach': 'bool', '*resume': 'bool' } }
+  'data': {'uri': 'str', '*multi-fd-uri-list': ['MigrateUriParameter'],
+           '*blk': 'bool', '*inc': 'bool', '*detach': 'bool',
+           '*resume': 'bool' } }
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">Considering the existing migrate API from a QAPI design POV, I
think there are several significant flaws with it

The use of URIs is the big red flag. It is basically a data encoding
scheme within a data encoding scheme.  QEMU code should be able to
directly work with the results from QAPI, without having todo a
second level of parsing.
</pre>
          </blockquote>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Concur.

</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">URIs made sense in the context of HMP or the QemuOpts CLI, but do not
make sense in QMP. We made a mistake in this respect when we first
introduced QMP and implemented 'migrate'.

If we going to extend the migrate API I think we should stop using URIs
for the new fields, and instead define a QAPI discriminated union for
the different data transport backends we offer.

      { 'enum': 'MigrateTransport',
        'data': ['socket', 'exec'] }

      { 'union': 'MigrateAddress',
        'base': { 'transport': 'MigrateTransport'},
        'discriminator': 'transport',
        'data': {
            'socket': 'SocketAddress',
	   'exec': ['str'],
        }

NB, 'socket' should be able to cover all of  'tcp', 'unix', 'vsock'
and 'fd' already. I'm fuzzy on best way to represent RDMA.


IIUC, the desire of migration maintainers is that we can ultimately
have multifd as the preferred, or even only, mechanism. Aside from
the main outbound migration control channel, and the multifd
data channels, IIUC we have a potential desire to have more channels
for post-copy async requests.

This all suggests to me a more general representation along the
lines of:

   { 'enum': 'MigrateChannelType',
     'data': ['control', 'data', 'async'] }

   { 'struct': 'MigrateChannel',
     'data': {
        'type': 'MigrateChannelType',
        'src-addr': 'MigrateAddress',
        'dst-addr': 'MigrateAddress',
        'count': 'int',
     } }

   { 'comand': 'migrate',
     'data': {
       '*uri': 'str'
       '*channels': ['MigrateChannel']
     }
   }

With 'uri' and 'channels' being mutually exclusive here.

This whole scheme brings in redundancy wrt to the 'migrate-set-parameters'
API wrt multifd - essentally the same data is now being set in two
different places. IMHO, we should declare the 'multifd' capability
and the 'multifd-chanels' parameter deprecated, since the information
they provide is totally redundant, if you're giving an explicit list
of channels to 'migrate'.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">Hi Daniel. Initially while brainstorming this idea for the first time, we also came up with the same thought of depricating the migrate 
API. But how will we achieve this now and how is it going to work. Is it like we will be making migate V2 APIs initially, integrate it and then 
depricate the old one? would be happy to get some pointers from your end.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Migration maintainers, please advise.
</pre>
      </blockquote>
      <pre>Hi Daniel and other migraton maintainers: Dr. David and Juan, what is your opinion on this. And how can we go forward implementing this. Some pointers and ideas from your end would be helpful too. </pre>
      <pre class="moz-quote-pre" wrap="">Regards,
Het Gala
</pre>
    </blockquote>
    <p>Just a gentle reminder Dr. David and Juan. Daniel already
      expressed his opinion to refactor the QAPI design for multifd.
      Your inputs and advice will also be very valuable to us. Thankyou.</p>
    Regards,<br>
    Het Gala<br>
  </body>
</html>

--------------WsVuDUhJItc40TSPsEs05076--

