Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B93565BFC0E
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 12:12:19 +0200 (CEST)
Received: from localhost ([::1]:33142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oawiI-0000Zh-UI
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 06:12:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1oawf5-0005IR-7i
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 06:09:02 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:62624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1oawf1-0007lD-Un
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 06:08:58 -0400
Received: from pps.filterd (m0127843.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28L73lUF003613;
 Wed, 21 Sep 2022 03:08:51 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=content-type :
 message-id : date : subject : from : to : cc : references : in-reply-to :
 mime-version; s=proofpoint20171006;
 bh=AcAmi2ibYA27T9oYK36xcSeE9orNcfzUoIDQYup9hXk=;
 b=IjD5TrkcjSqTPzGNxlTXBuBZtaFYgLOtZf6PSlY8fBOsDBVI7IcBMsy7MAVIrffv//z4
 pK24RGFL5B9sXePO9efG88ac4dCjrBcmJjts96Mr28CcYhDsQ7kn3K6xwcm9X8pRP5Gt
 AEFC0M/EuCXfDJ41MvsbGj5ES8xujky+ymqMHesEnFaPOtg8J7x31BCzwiHDNpb96Zzx
 ME3SCDmUHxS6NCjaDDAMpbM+ucMcFJa8wnb97bCsQkEMYt2HMelIn1V/26wBR5ty9xrD
 TiTQHGp14hSeZ348AJbaDhEJroBwXcElr6DV7L5lqSGsCb8/QfvO2khU8NNtBQ2Y4bZu 5w== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2106.outbound.protection.outlook.com [104.47.70.106])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3jncbka4xx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Sep 2022 03:08:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NIz1pH4yB3olLWUsc3Q6yQo5lpd/6xLnsXnssfB+x8E25VYuQOfpEDsaZ2U3quW460K/F+XzkBQSy+bMz+a1TgP2NTmo/MhweEis6YLTqwpu6Kl0BQIIloYYMabfz6N9XdHTjw1KtviHOisB+vXwfuxKri2gtl3jalhLZXKZt5XNkUq+1qTDqHQva/SvJ47aiT2lkqRqTefloXrF63QXTdlqsPqSYmb94nJymMqkmmHz+BMVI8F1GBFjnd5vQXhkLQ9/c+B4n+3Bb+Xt+yI6QNk4Z3Vzz8fW0Zogb28Ao9+JUPauiDf0L0IiDzcA+M8mOAWG6cILNjE+w9yuhXWzHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AcAmi2ibYA27T9oYK36xcSeE9orNcfzUoIDQYup9hXk=;
 b=T1hmLZgRAIEwFK9PbZEe7ZqK5q/KpgnC/koowb/ZExEFVndg1x4G+aDWCnFqCGDkWAkBcnkEiZyWZ/vCvSFl7cHfJajci3j2Y24NzF96BW4Q0L2m1lD77/of6yPBNoNrrLQsrlDuE8dEtF5/SEUZZWtKkYT9cNeOV5L1mx04jvg/tzSzE7s12NlU/cOGW74ml6yCJcoUyUNfptNdcMb6eas5Mr/Kgy7aCzH4oOly9ubsjwGp5AzgmjXzppu15T1g0w1yDoqX2skluXqVJW9j/JKdDrtjIy/WF52LzwXCmpGSrrA0OF0BftwxVgtgcIm69LRxQQKmJActvTkLjw+qZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from SN6PR02MB4350.namprd02.prod.outlook.com (2603:10b6:805:a5::32)
 by SJ0PR02MB7391.namprd02.prod.outlook.com (2603:10b6:a03:2a1::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.17; Wed, 21 Sep
 2022 10:08:49 +0000
Received: from SN6PR02MB4350.namprd02.prod.outlook.com
 ([fe80::6045:45c9:3357:91ef]) by SN6PR02MB4350.namprd02.prod.outlook.com
 ([fe80::6045:45c9:3357:91ef%7]) with mapi id 15.20.5654.016; Wed, 21 Sep 2022
 10:08:48 +0000
Content-Type: multipart/alternative;
 boundary="------------mV7TxXb78o6F1c1Ejg9ahYMj"
Message-ID: <567b907d-c467-9d2d-bd89-cb15926506b2@nutanix.com>
Date: Wed, 21 Sep 2022 15:38:36 +0530
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
 <04f9afe5-0793-1037-057e-dc73cad4fb4e@nutanix.com>
In-Reply-To: <04f9afe5-0793-1037-057e-dc73cad4fb4e@nutanix.com>
X-ClientProxiedBy: MAXPR01CA0095.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::13) To SN6PR02MB4350.namprd02.prod.outlook.com
 (2603:10b6:805:a5::32)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR02MB4350:EE_|SJ0PR02MB7391:EE_
X-MS-Office365-Filtering-Correlation-Id: 876ee882-490f-453c-820b-08da9bb946b2
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 33/lGjZWZOfEn07y5Nw9bGec71V9rUSm0VjqbzBeye7YnkB0gZ0ujsiB2U1JdEGoUZYnH7VGM96lLx8C4Km4wowcF8V6wjsnUKDwJ7B/5oXwQ37vTVFlqUkS95+er81jd7c30VUG79XUfz6FnA80Q2XMAwjakPqFKBH+7ncHKEMn4zPiTg03XixQhtEHYGMzzy9b199ODWDiXUrmeWrFOFM01htA3j6zgwoPjb1L2RuDkkXVdFpkHXxXQYs6QjYaLHvYIQFLdAExSzMMSuTKHqGAZVedz/gRvLd/PnjhSw6vG5ajba932cA39PlRBX/xeV3RAAPCDhIY+xOITWNalBO1c0OG1xcqyXe9mGaJ/HjCrFq8TwjVK+l9ZfK2j6bf5wS2Sbje+4kYhtB9pIaS6mmkU/Ug3KRdXZ6WxHLcYqcyGClH8nqNOWqCDHyYZwmYZB5Bk1zW24nU1YMdckAS6gHF6MyJLytawXCGyNWzqScgTPWoU6bDaMt1O70VQDlVX835GVAJ7IeDEE/Yhf2gi7MLh6qirLo9QaNGJKcwnAJaXKaDKrfdxPLVSiaeyRZlbiXMrf+ftqV8ZQfXWFltCDDql5JW2SqkS6WkLxL4FT+12SHWyH1fxm15XFK/6LRQSVrWxsLK/B4ulDvRvpaBOtzBlD3wVsSZedjhmspX4IJmj7osdKD7Q9pypHh1rFVasDSi8gsW6AKpS3lqDJ1v0g69g+yJKMk8YnOvkua8L4s1U+GoGTKhDdnzszSlnMLGHQSkNoTaUWPG4oPwTZnk1MuxCg+ERzUofmXIUnSrDc96x8fGjbFjt2Ho+rF7qnFN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR02MB4350.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(39860400002)(396003)(346002)(366004)(376002)(451199015)(38350700002)(6666004)(107886003)(38100700002)(66476007)(52116002)(53546011)(6506007)(33964004)(6512007)(26005)(8676002)(66556008)(4326008)(6916009)(54906003)(30864003)(8936002)(86362001)(31696002)(6486002)(186003)(478600001)(36756003)(2616005)(2906002)(41300700001)(44832011)(316002)(31686004)(66946007)(5660300002)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OE5TYXVzbkNRVk5nMmp5QmRBa1R5eTN5TG0xUFQ1b0hnMWZUREFpeGhTYzlY?=
 =?utf-8?B?bkdpUnAvZGNMTUxJV25IZG1Kd2QxZlZWUGtTbSt5UmNVd216TmR6VTViRENz?=
 =?utf-8?B?NmJvdEI4QlJ4OEZNQjRtb0lWVllGT044MUhDMlJ1Q0hnYjJJK1JFZkRGcThs?=
 =?utf-8?B?VGY5NnFvS3JscStkU0twTHZKRnJXSGNQOWlRL3VmVUNnSTBDSVJCK1AyeXk5?=
 =?utf-8?B?emJEMUpEWk1sekdiYWE4OHg4NkFYeUMyVk8yL0U0M1FCVktIeHdKL1p2YzI5?=
 =?utf-8?B?MU45ZkJDaURGeXI0RFhOb2VFTUV6SURrWjVMcjUrZTMwSzVrMWVRYmI3ZXll?=
 =?utf-8?B?TDJEMWMzMWFKcDNrWkpvblYxTDJPQXY2RjV1V2l0MHYxcEJmcTZxNGRiZTNS?=
 =?utf-8?B?MXdBMjRKaS9GRmJPY3RjYVNHQytDNVVGK0VFaXVMUjRuSTYxbEpOejljUWx6?=
 =?utf-8?B?Y0JHRDRkZXRhY050TkVuaFNsMzQzSml1N0Fjd0hLbTdmMitib1cvR3BJaXQ1?=
 =?utf-8?B?aVp3SzhQeVA1UlhCaUtaVHFlb1kwTWtrTlRkUXZOWE1SRzNxZlUvc0d0YlZl?=
 =?utf-8?B?K2lMMG9sRlBkUW02NGJlWjkxNnRmeXQ1ay9ZdnIxZDdXem5DTThWUUNwRmk3?=
 =?utf-8?B?Ykc0UFRkenc4Unp1c0VsR3ppeURHNmZ3eUZzQXN6TkVXejBIdThsNXpYcVFN?=
 =?utf-8?B?R0NjNUlkOElXbUdFbnk0R2M2NDN5QWdUSzJPQWt3dXdhdVh0Z2pMNjNqUGRF?=
 =?utf-8?B?TDJkSTUxRXl4U0xxcHY4VDJuS2dwWnlDVVhjV0NWUkE4VjlDemFiVEYzQjNq?=
 =?utf-8?B?VGpBTy9IeS9NekJXQnp0anh5NkorOFZ3eURJRTY0RnM5N0EyRWgvRjdWZ0U5?=
 =?utf-8?B?cVBvWm9uKzlEWGlBdkpuUzhnNUtDUXpJc3pFZGxweXhEVFo1MmRNMkc1aitN?=
 =?utf-8?B?alN4dXNvYXB6Uit3VUhCVnF2cEIvRXNsTUtQSVhoeXN1bjNZV2R6QS9Wby9E?=
 =?utf-8?B?aEs2bHlCRmtoT0QwQnoyMmR4YTFuTWxQSkVZS3VQQi9yMVlTM1pWdkFETXd3?=
 =?utf-8?B?RVZCQ043R0Yxa05aejdCUnA1ell1bGQzeEdUOWVlRWF3RmRhcS9IK2dzVUt4?=
 =?utf-8?B?eG02bS9EQy9tbzlwVldaMWx0UGg5eW5RcGdMZEF0Zm9XMGo4NnFSalhOd2Rp?=
 =?utf-8?B?cWtDVEdkeEIyRy9pZ3M1Qk43amdHT2pnYmpQMi9OeWZpeWVobitQZzVDaG9t?=
 =?utf-8?B?eUZYV3ZTWERKbkRpdG9FRVM4cEp1M2pEQkt5M3ZBNE00aWh2MEh5cmtlZCtq?=
 =?utf-8?B?KytubGpmbmUxS0ZWYXdMSWwvd0xHQ25QT1dlcjJvM2hKOEphMW81QU9JSGg3?=
 =?utf-8?B?ZzYzenhxN0NMaml1TW1LSnJoa0M0aHhJaW82Z1ZHbjFwWVp5MFlNdm1zd2h0?=
 =?utf-8?B?azJReEY1Zk1JYjNROHhhWlE4ZE9BU24yRGVGU3NYcExzOU4weFg0TlhtN0lT?=
 =?utf-8?B?anlUZFRYTVZyWUNJTGJIRUtIVTgwVDc1eWs0aWFGYkQ5N25HZ05hZVk2Z2FI?=
 =?utf-8?B?KzJGUU85U0RkdnRxQjJjUVlBNFpzMXdNVkxWT2h1aTFXbGFRbjF5TUhhWFN4?=
 =?utf-8?B?L2ttbGJ2bHJJdytVWWhrcEpiMzhDVkxyTmtHb1hxQ0N1SWlXYUw5ZlFPVW5a?=
 =?utf-8?B?MFdnbk9BQjRtSTk0K3NxbTlJVmdKNUpocC9MRzhYK21uTDBQWjNrUWJHakdT?=
 =?utf-8?B?TTkzMUFKWnlrUm16b2pwdGVtTGlZWkJQZ0QxZFhuKzJVdUhqZnoxODZzQTEz?=
 =?utf-8?B?enh2bGRlWWpxbjBhdlVqR29URmZGUHc2ZFNyQ1JMcUtta3B0QVJ5UjVxZFd6?=
 =?utf-8?B?MDJKUDN4M3Q4OS8ySkdsYVRhWFRsVFpHNE5GNTFhZUNvME12Z1ZYU1A0L24r?=
 =?utf-8?B?WGV2azlqRkNreFp2SzJCVGNVS3g3UHE5YnZNWjlYZDRUWk5LWXY1UGJlcnlD?=
 =?utf-8?B?c3VXYVAvUFptVVphSTNGaEg2WklKdWVUcytaOUtxTUpZc0tIOVMrbXdCdFNI?=
 =?utf-8?B?WkNZQVBMSUZUYW1XRTg4bXVJRGRtbU5KMGFzUkduODc0cFhENGxobkNicE9X?=
 =?utf-8?Q?pKAuYhMhxgoEMys1ChbL6Uu6T?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 876ee882-490f-453c-820b-08da9bb946b2
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4350.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2022 10:08:48.7298 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R7w91khYQz2tlezpGnKynLFzgioemS+TV+pvGUuWlh6lP2FPJRIaZyJM3+I+kouYZRzOOV9nMumZH5wFf2jPlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7391
X-Proofpoint-ORIG-GUID: cHAb29_fJC4QWjS6jrvMg9uKXN0trCJ7
X-Proofpoint-GUID: cHAb29_fJC4QWjS6jrvMg9uKXN0trCJ7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-21_05,2022-09-20_02,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12; envelope-from=het.gala@nutanix.com;
 helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, NICE_REPLY_A=-2.182, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--------------mV7TxXb78o6F1c1Ejg9ahYMj
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 29/08/22 10:04 am, Het Gala wrote:
>
>
> On 08/08/22 11:41 am, Het Gala wrote:
>>
>>
>> On 02/08/22 1:23 pm, Markus Armbruster wrote:
>>> Het Gala<het.gala@nutanix.com>  writes:
>>>
>>>> On 26/07/22 4:43 pm, Daniel P. Berrangé wrote:
>>>>> On Thu, Jul 21, 2022 at 07:56:15PM +0000, Het Gala wrote:
>>>>>> i) Modified the format of the qemu monitor command : 'migrate' by adding a list,
>>>>>>      each element in the list consisting of multifd connection parameters: source
>>>>>>      uri, destination uri and of the number of multifd channels between each pair.
>>>>>>
>>>>>> ii) Information of all multifd connection parameters' list and length of the
>>>>>>       list is stored in 'OutgoingMigrateParams' struct.
>>>>>>
>>>>>> Suggested-by: Manish Mishra<manish.mishra@nutanix.com>
>>>>>> Signed-off-by: Het Gala<het.gala@nutanix.com>
>>>>>> ---
>>>>>>    migration/migration.c | 52 +++++++++++++++++++++++++++++--------
>>>>>>    migration/socket.c    | 60 ++++++++++++++++++++++++++++++++++++++++---
>>>>>>    migration/socket.h    | 19 +++++++++++++-
>>>>>>    monitor/hmp-cmds.c    |  1 +
>>>>>>    qapi/migration.json   | 47 +++++++++++++++++++++++++++++----
>>>>>>    5 files changed, 160 insertions(+), 19 deletions(-)
>>>>>>
>>>>>> diff --git a/qapi/migration.json b/qapi/migration.json
>>>>>> index 81185d4311..456247af8f 100644
>>>>>> --- a/qapi/migration.json
>>>>>> +++ b/qapi/migration.json
>>>>>> @@ -1449,12 +1449,37 @@
>>>>>>    ##
>>>>>>    { 'command': 'migrate-continue', 'data': {'state': 'MigrationStatus'} }
>>>>>>    +##
>>>>>> +# @MigrateUriParameter:
>>>>>> +#
>>>>>> +# Information regarding which source interface is connected to which
>>>>>> +# destination interface and number of multifd channels over each interface.
>>>>>> +#
>>>>>> +# @source-uri: uri of the source VM. Default port number is 0.
>>>>>> +#
>>>>>> +# @destination-uri: uri of the destination VM
>>>>>> +#
>>>>>> +# @multifd-channels: number of parallel multifd channels used to migrate data
>>>>>> +#                    for specific source-uri and destination-uri. Default value
>>>>>> +#                    in this case is 2 (Since 7.1)
>>>>>> +#
>>>>>> +##
>>>>>> +{ 'struct' : 'MigrateUriParameter',
>>>>>> +  'data' : { 'source-uri' : 'str',
>>>>>> +             'destination-uri' : 'str',
>>>>>> +             '*multifd-channels' : 'uint8'} }
>>>>>> +
>>>>>>    ##
>>>>>>    # @migrate:
>>>>>>    #
>>>>>>    # Migrates the current running guest to another Virtual Machine.
>>>>>>    #
>>>>>>    # @uri: the Uniform Resource Identifier of the destination VM
>>>>>> +#       for migration thread
>>>>>> +#
>>>>>> +# @multi-fd-uri-list: list of pair of source and destination VM Uniform
>>>>>> +#                     Resource Identifiers with number of multifd-channels
>>>>>> +#                     for each pair
>>>>>>    #
>>>>>>    # @blk: do block migration (full disk copy)
>>>>>>    #
>>>>>> @@ -1474,20 +1499,32 @@
>>>>>>    # 1. The 'query-migrate' command should be used to check migration's progress
>>>>>>    #    and final result (this information is provided by the 'status' member)
>>>>>>    #
>>>>>> -# 2. All boolean arguments default to false
>>>>>> +# 2. The uri argument should have the Uniform Resource Identifier of default
>>>>>> +#    destination VM. This connection will be bound to default network
>>>>>>    #
>>>>>> -# 3. The user Monitor's "detach" argument is invalid in QMP and should not
>>>>>> +# 3. All boolean arguments default to false
>>>>>> +#
>>>>>> +# 4. The user Monitor's "detach" argument is invalid in QMP and should not
>>>>>>    #    be used
>>>>>>    #
>>>>>>    # Example:
>>>>>>    #
>>>>>> -# -> { "execute": "migrate", "arguments": { "uri": "tcp:0:4446" } }
>>>>>> +# -> { "execute": "migrate",
>>>>>> +#      "arguments": {
>>>>>> +#          "uri": "tcp:0:4446",
>>>>>> +#          "multi-fd-uri-list": [ { "source-uri": "tcp::6900",
>>>>>> +#                                   "destination-uri": "tcp:0:4480",
>>>>>> +#                                   "multifd-channels": 4},
>>>>>> +#                                 { "source-uri": "tcp:10.0.0.0: ",
>>>>>> +#                                   "destination-uri": "tcp:11.0.0.0:7789",
>>>>>> +#                                   "multifd-channels": 5} ] } }
>>>>>>    # <- { "return": {} }
>>>>>>    #
>>>>>>    ##
>>>>>>    { 'command': 'migrate',
>>>>>> -  'data': {'uri': 'str', '*blk': 'bool', '*inc': 'bool',
>>>>>> -           '*detach': 'bool', '*resume': 'bool' } }
>>>>>> +  'data': {'uri': 'str', '*multi-fd-uri-list': ['MigrateUriParameter'],
>>>>>> +           '*blk': 'bool', '*inc': 'bool', '*detach': 'bool',
>>>>>> +           '*resume': 'bool' } }
>>>>> Considering the existing migrate API from a QAPI design POV, I
>>>>> think there are several significant flaws with it
>>>>>
>>>>> The use of URIs is the big red flag. It is basically a data encoding
>>>>> scheme within a data encoding scheme.  QEMU code should be able to
>>>>> directly work with the results from QAPI, without having todo a
>>>>> second level of parsing.
>>> Concur.
>>>
>>>>> URIs made sense in the context of HMP or the QemuOpts CLI, but do not
>>>>> make sense in QMP. We made a mistake in this respect when we first
>>>>> introduced QMP and implemented 'migrate'.
>>>>>
>>>>> If we going to extend the migrate API I think we should stop using URIs
>>>>> for the new fields, and instead define a QAPI discriminated union for
>>>>> the different data transport backends we offer.
>>>>>
>>>>>        { 'enum': 'MigrateTransport',
>>>>>          'data': ['socket', 'exec'] }
>>>>>
>>>>>        { 'union': 'MigrateAddress',
>>>>>          'base': { 'transport': 'MigrateTransport'},
>>>>>          'discriminator': 'transport',
>>>>>          'data': {
>>>>>              'socket': 'SocketAddress',
>>>>> 	   'exec': ['str'],
>>>>>          }
>>>>>
>>>>> NB, 'socket' should be able to cover all of  'tcp', 'unix', 'vsock'
>>>>> and 'fd' already. I'm fuzzy on best way to represent RDMA.
>>>>>
>>>>>
>>>>> IIUC, the desire of migration maintainers is that we can ultimately
>>>>> have multifd as the preferred, or even only, mechanism. Aside from
>>>>> the main outbound migration control channel, and the multifd
>>>>> data channels, IIUC we have a potential desire to have more channels
>>>>> for post-copy async requests.
>>>>>
>>>>> This all suggests to me a more general representation along the
>>>>> lines of:
>>>>>
>>>>>     { 'enum': 'MigrateChannelType',
>>>>>       'data': ['control', 'data', 'async'] }
>>>>>
>>>>>     { 'struct': 'MigrateChannel',
>>>>>       'data': {
>>>>>          'type': 'MigrateChannelType',
>>>>>          'src-addr': 'MigrateAddress',
>>>>>          'dst-addr': 'MigrateAddress',
>>>>>          'count': 'int',
>>>>>       } }
>>>>>
>>>>>     { 'comand': 'migrate',
>>>>>       'data': {
>>>>>         '*uri': 'str'
>>>>>         '*channels': ['MigrateChannel']
>>>>>       }
>>>>>     }
>>>>>
>>>>> With 'uri' and 'channels' being mutually exclusive here.
>>>>>
>>>>> This whole scheme brings in redundancy wrt to the 'migrate-set-parameters'
>>>>> API wrt multifd - essentally the same data is now being set in two
>>>>> different places. IMHO, we should declare the 'multifd' capability
>>>>> and the 'multifd-chanels' parameter deprecated, since the information
>>>>> they provide is totally redundant, if you're giving an explicit list
>>>>> of channels to 'migrate'.
>>>> Hi Daniel. Initially while brainstorming this idea for the first time, we also came up with the same thought of depricating the migrate
>>>> API. But how will we achieve this now and how is it going to work. Is it like we will be making migate V2 APIs initially, integrate it and then
>>>> depricate the old one? would be happy to get some pointers from your end.
>>> Migration maintainers, please advise.
>> Hi Daniel and other migraton maintainers: Dr. David and Juan, what is your opinion on this. And how can we go forward implementing this. Some pointers and ideas from your end would be helpful too.
>> Regards,
>> Het Gala
>
> Just a gentle reminder Dr. David and Juan. Daniel already expressed 
> his opinion to refactor the QAPI design for multifd. Your inputs and 
> advice will also be very valuable to us. Thankyou.
>
> Regards,
> Het Gala

Hi all, I think the maintainers were occupied for quite sometime by KVM 
forum work. This is again a gentle reminder mail for the migration 
maintainers - Dr. David and Juan to share some ideas and inputs on 
refactorisation of QAPI design for multifd suggested by Daniel, and how 
this idea will pan out in the migration workflow. Looking forward for a 
positive discussion on this topic :)

Regards,
Het Gala
--------------mV7TxXb78o6F1c1Ejg9ahYMj
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 29/08/22 10:04 am, Het Gala wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:04f9afe5-0793-1037-057e-dc73cad4fb4e@nutanix.com">
      
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
        Your inputs and advice will also be very valuable to us.
        Thankyou.</p>
      Regards,<br>
      Het Gala<br>
    </blockquote>
    <p>Hi all, I think the maintainers were occupied for quite sometime
      by KVM forum work. This is again a gentle reminder mail for the
      migration maintainers - Dr. David and Juan to share some ideas and
      inputs on refactorisation of QAPI design for multifd suggested by
      Daniel, and how this idea will pan out in the migration workflow.
      Looking forward for a positive discussion on this topic :)</p>
    Regards,<br>
    Het Gala<br>
  </body>
</html>

--------------mV7TxXb78o6F1c1Ejg9ahYMj--

