Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 640B65842BB
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 17:13:49 +0200 (CEST)
Received: from localhost ([::1]:44958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH5Ct-0004bK-R2
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 11:13:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1oH52c-000348-Lr
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 11:03:22 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:3652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1oH52V-0003QW-Nh
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 11:03:10 -0400
Received: from pps.filterd (m0127843.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26SCvlPW013663;
 Thu, 28 Jul 2022 08:02:56 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=Hs7KVxTMaMnmfKuLnNKVL8ch8RE4mC2GFSd3NAKwQQg=;
 b=NgJXll4TLYhi1Aei4GOYv7aKIJCVMe2IWR15AwrQ332XHM5vAh3uYjbroT+A+ABHd8YF
 bvmr7D5KioV4m2DJMYsrXYrt7AilV5sywuKIScYQFGdzZrotfEA0hufvqjYyF0KLGWQg
 +uyIwSpO/PBg9ahmTWeYvmgYjpdcAxIboHafqJU1i5Wa1szX6XTL69RwbbxKojZ8tlqB
 122t2xTFW3X6X3kFWYcb/4pQIXvpyDkEOGaYnWk2MI5SL7JGF3Ar/1xj/ctyO6Uzi9Ne
 QyK/Yw/ZHjC04bLqJaz99KDgn5vi8zH04Fr/TtQoTUtTJ/9evCtEqlL9v2MAjWMZg7Ap qQ== 
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam04lp2044.outbound.protection.outlook.com [104.47.73.44])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3hgf3j4k63-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Jul 2022 08:02:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WFmuG2+Tj4U0zc6XFDMccCIoqXVL+v9X1SPRdbadbRjcU9j8Uqbu4Bo/aWfLemuOZIh2mKXeahrE/a+4BFsUCaozjiOZxF6P5oI8Q2PoNogD1x3+09kyG3++aLxK3ujnzo1FjJ3sXwLeQpeZcVbSnWQbGpa9SZHvpYAsiUvlLlTbhAMYvSk2xXbmddWwetqPss26WmJ5ip6km7U3cEBLwRwmomAdZJrwGJbuFwQTEcnSOobKZPgMlzFM2sUONAW5czZviFcPj30Q91kHLIBEQU9xNnZXsWLuon9Xyy7nhMykNRa1lbPs9RBZEOWL4lkT60hueWc6nPlZ1lF98cF8Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hs7KVxTMaMnmfKuLnNKVL8ch8RE4mC2GFSd3NAKwQQg=;
 b=Hi+peXBF0phyVHTmpDUuYkEzF9glqlTkedqqcd939u5g2zC6Qxmdvn42AQaiPGkrjUQa8nucWw8XAlmh5J00SFNjVOTkYAbOTEcW3ry1fUltujNHg72PrtvUCrig67YePN8Yj4UH1zgH+QROo74K39J7rV9rsLyefrZ4Zw2hDDc5XYhXmVWbNnC2o+FL1c+6xy/wTnkplrtHvH3we+rOTYn9mjPV37vOW5MF5gdtnlWaz1MJ0I/nK3gYYV1pwn1jIWk2FS5QZ+MSzxicTNWdcV8dobW3GAViFljAqJen57xVxUej+6cznK11JxTikwK9c2RU8yRiNBcvVtkQ9o7CmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by DM5PR02MB2428.namprd02.prod.outlook.com (2603:10b6:3:3d::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.21; Thu, 28 Jul 2022 15:02:52 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::1493:404b:3242:8e0f]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::1493:404b:3242:8e0f%5]) with mapi id 15.20.5458.025; Thu, 28 Jul 2022
 15:02:52 +0000
Message-ID: <fb5528cf-ccf1-2c21-6899-cb503950d432@nutanix.com>
Date: Thu, 28 Jul 2022 20:32:39 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v2 2/7] multifd: modifying 'migrate' qmp command to add
 multifd socket on particular src and dest pair
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, quintela@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, armbru@redhat.com, eblake@redhat.com,
 prerna.saxena@nutanix.com, Manish Mishra <manish.mishra@nutanix.com>
References: <20220721195620.123837-1-het.gala@nutanix.com>
 <20220721195620.123837-3-het.gala@nutanix.com> <Yt/MZiK3OuvQMRfF@redhat.com>
From: Het Gala <het.gala@nutanix.com>
In-Reply-To: <Yt/MZiK3OuvQMRfF@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0073.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00::13)
 To BYAPR02MB4343.namprd02.prod.outlook.com
 (2603:10b6:a03:57::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b99a5d8a-5a64-472a-6e04-08da70aa3e34
X-MS-TrafficTypeDiagnostic: DM5PR02MB2428:EE_
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zctlvfl5iza/PxdVom8kBRk7/FxLGALpUTZAxPnjshUd6rmK/a4+Xi/TaR2NuAFoygZUt9ANKscNH9qitedyqiyfnJ2+UtKW0lVW0U3xjCMMI6weOZawBM+vv+EwXvCO2NRLKLUZzoGAzXTN3znCNO7O5oCQQ5/tS87L5EWjM6W7Z5qLtpZIYCfbzOGh//8Mi11NoKYZs37uu0N3FNhjI04ahQsFUAONWLINHLuJkHJmCwZmbL/iSMDZxZhXwoeyQNbxkhGVgfY8Ty/WWwWFSDbQzp4ub4erYagVI618cj3nxmtc6VD8GZNwS4iEJ7yaSiJjmuoaz79r5GVO9HvF3mUyCzwrBv/AEIPNhkiOgnNJk2om64Ccyc27F2h/9Va820voI12+7BX57lzZycfufxZxvJjqCBFUqgckJWuHNviUo7mmc5aN1aRD+qJxloX7R2tGpr3E3k/N8W6wyhUK6OywJyyauoALsOY7wsAD6TAyiUkj05N3GBWqJ/B1qH6hA/2hyndhPaZcLHIX/sa2CmM+uSfTyCX7Dnqo0/Kw5et6eSOE6q3trBYdaNp5GbL/O22lqvCLsQIUJWW4uuVDhpzzRdW0LLgt20Xz0DjaSM/SuHNVZtU6AHubcLiDRNSr7NEr195iep91zPiQpPSu2Rh9ZIHpivVLuSSk43dBIS68EhVVWOonx3O+U4rA3ilAxxPSfnxR0tudqy+p/rBdzv7gfr+iRZaANHNU7wiqd2tNXsM0phQiAk6mRK93o/FsbXmigrjLD/qmzGkuV8bKNy+dF3iNGFa0l8DDmb4w7h1wsZcLjEioisCtUD/dTJ4lZvbbrnelOYcGasP2YNHja+lwlyIYPIXBKG2t0/rzN80=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(396003)(376002)(366004)(136003)(346002)(66476007)(6916009)(107886003)(8936002)(53546011)(6486002)(4326008)(66946007)(52116002)(26005)(316002)(478600001)(8676002)(2616005)(6506007)(66556008)(2906002)(44832011)(38350700002)(5660300002)(6512007)(186003)(6666004)(36756003)(83380400001)(86362001)(31696002)(31686004)(41300700001)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUFUdVVZMVQ5Yjh0a2U0cDdpKzUzZlBWVG9HcDlZM3NNa2hkc3hCbzJLOThR?=
 =?utf-8?B?Q3FMT1hQZlNlakEzbjl0RzVMV05YM2I1S25HK1I0VGlZMnEvMUtBUzRQbWd3?=
 =?utf-8?B?TFErVmR4bFlBQ1lpaG9OVG5HclRlcy9yem84d0ZHSGh3d0hVVXBHU2VPMDZW?=
 =?utf-8?B?QVhkUEdCU0YrUGpqWG9PMHJsU25ZcnBINFRiMk9NQWp3V25nQVZmVktCWlI1?=
 =?utf-8?B?eG5Pc3BGRitjUDgvdmp6MXZiL2lvZVRieUJrNmE0ekRPWlpsT016WEt6djJP?=
 =?utf-8?B?c25XQ1BDa0NtVGNZR3NuUlArbkR6aThQeUVQbmtrN2JFaDdNd1l4WDlkWVUy?=
 =?utf-8?B?dWxqOGtBSjJQR0s4bU9WUDlzYWRocEYya0JRVy9UWXFzQUR3QnRBa0YvNGd6?=
 =?utf-8?B?VGEvQ2pKRjQwY2gzSzdNd1RVajEzN3dvTFY0aFhvZEoyVkQzQVQxeGdxUlJE?=
 =?utf-8?B?MTRaR3UwQTZFSFNhQUN5aFRmOTRRZnl3bWxYWFlTdTdWRUNLWVFITFZNQ3cx?=
 =?utf-8?B?a1IrZGNiWFFTTDRvdU1JdXpWZ0tUa3d3OHdNaUREWUorMkZXWCtnczZyN01T?=
 =?utf-8?B?cUhhUGtGOTN2OTVBRkd3aXA0bTlXOUU2Z0RIZHZaRk5JS2w4Mi9PenVrSU1q?=
 =?utf-8?B?Uk05cXFPTFRBZnp2dTBjcUNPMEJIWG8vSUFYOUhaRWxBd01ZQUJYWDhKQmt4?=
 =?utf-8?B?RjEyby9PaTNUcS9TSVUvNjYxREViS0Zjdlo1dmdVSlh6RGRyZUZGb3dmSitq?=
 =?utf-8?B?eDdJbndCcGE5T25OY0NBdVdzajZaME12UU5GZmVESU42d1BlU0ptZ3NpRWhp?=
 =?utf-8?B?MXUrUjdGRWVHTXY2NE9JSWRkcE1NK1hBSVdhNFV3R0wxRGtGMk1EWXp2dUNt?=
 =?utf-8?B?ZC9oK0xVTDZVT0cwc2RvVnVKUEpReUk5aDRQallRVmxaRHVMcndYQURDRU1U?=
 =?utf-8?B?c2ZsRW9jNktUdnB6TUw4ckZFL29ML0xZdjREYnpnNmJoZnR3WlNreGU3YnpC?=
 =?utf-8?B?OTI3cktmMTljdXpIem0wZ2NzazZBN0V6M2ZxZHEyWkNFSGY3Z0xjb3JBQU5t?=
 =?utf-8?B?bnhkMmgyRkg4ZGZVeG93K04waE1CRmhYcE5vZTJsZHNObmZXL080RlBucnF2?=
 =?utf-8?B?K1ZlYmtqTEw5SDg3MzIxZmYxZm9wZGpEN1dEZ0lvVkIzdTZkZlg0anJJQWhP?=
 =?utf-8?B?RnBzeXZDZmJjNUo0MkJUalh4cjFoSmdkenBRZ04zMk56TDNjNXNKclFKaHBG?=
 =?utf-8?B?REFTQWhHd3E5UGovSDlKY1gyREU1VjQzSk52VTliWW0yRHNlOVFkK3BGY2th?=
 =?utf-8?B?RFJMdzRVdlg0RTFMNUlVcGRvTXA1UmtBL3l0bkZSNTVzRmcyMlMrcjBvMzN6?=
 =?utf-8?B?Z3ZabngrVU1kYXZlWmVHUkdDeFB6WWc5NWtUWEp1S3RFZnN6Uy9kSk9TRElX?=
 =?utf-8?B?SEp4ZllyNnlIS3FKb0oyamYvOHZ5eXNVMGlFMzkrWDdIVFZvQnNSYmg1ZC9G?=
 =?utf-8?B?U2NVUHNhbGNnRmhRdytsWGt1Z25UU1F1Y2tmYXZzaEt0a3hLakltWWJJalQ0?=
 =?utf-8?B?YnBheFprcE1yWGM3OG4wMTNaZk5TVlBNVHZUSXppWmFHOWJsR1dvVVluUDdj?=
 =?utf-8?B?R2FBdExaQkhieXIrMGVyaitudkV3cnlQS3c0Mit3YnpQczJOcDNxWU1nUHpI?=
 =?utf-8?B?emE0RUh6N3ZTMWhKSXoyNHFuS1BzWVhMbU1jWUNxMkVjM21hSXpnS2xSckpF?=
 =?utf-8?B?QmNGUUhDaVZERXBVcVFWSUE0SG9MTnFSQSs5WnlTRlBoZy9lekxqM01GU0Y3?=
 =?utf-8?B?RUNGWEJOZno1WHk3ZHVVd1h1eFF1MWgxNTJQY2MwTC9TaHZHZm0wby8yVEhH?=
 =?utf-8?B?Y1VNTnF6OTlrclFXZWJ2NndBT0RNSG0vL0FjYkN2Ym82bGNEZlIyWEJtSThn?=
 =?utf-8?B?ODBUcFRRQ1pPUU5zYWxpaVQ3OGx5LzU1eDhoZ0duRVZzRzZINFpKcXFuVzRt?=
 =?utf-8?B?OWJOYS9kZXdxL2o0R0kvcUxmYStLdkprcVAzREpnNDk0QmV4ckowRjhTakVD?=
 =?utf-8?B?cXByWDN2NUNmeGJtZkI0UnRUN0lXbHhTN0l5TmZvSDVwYTcyMXVWWVdQa3lX?=
 =?utf-8?Q?gWQZSoBBQ6kEJeY6pBXR/GEvA?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b99a5d8a-5a64-472a-6e04-08da70aa3e34
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2022 15:02:52.0314 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BK5iApDmY4+WK9Ze8pmzGKyJbUfeoSvzKSjWkPMD1Fobe+u/KNznt38Jv+glZKyu7koWeQ5+WNjsCr2LjkuGkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB2428
X-Proofpoint-ORIG-GUID: SfZBdGk7Xcy0jBrg_TFaD1kj1365kFOp
X-Proofpoint-GUID: SfZBdGk7Xcy0jBrg_TFaD1kj1365kFOp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-28_06,2022-07-28_02,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12; envelope-from=het.gala@nutanix.com;
 helo=mx0b-002c1b01.pphosted.com
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


On 26/07/22 4:43 pm, Daniel P. Berrangé wrote:
> On Thu, Jul 21, 2022 at 07:56:15PM +0000, Het Gala wrote:
>> i) Modified the format of the qemu monitor command : 'migrate' by adding a list,
>>     each element in the list consisting of multifd connection parameters: source
>>     uri, destination uri and of the number of multifd channels between each pair.
>>
>> ii) Information of all multifd connection parameters' list and length of the
>>      list is stored in 'OutgoingMigrateParams' struct.
>>
>> Suggested-by: Manish Mishra <manish.mishra@nutanix.com>
>> Signed-off-by: Het Gala <het.gala@nutanix.com>
>> ---
>>   migration/migration.c | 52 +++++++++++++++++++++++++++++--------
>>   migration/socket.c    | 60 ++++++++++++++++++++++++++++++++++++++++---
>>   migration/socket.h    | 19 +++++++++++++-
>>   monitor/hmp-cmds.c    |  1 +
>>   qapi/migration.json   | 47 +++++++++++++++++++++++++++++----
>>   5 files changed, 160 insertions(+), 19 deletions(-)
>>
>> diff --git a/qapi/migration.json b/qapi/migration.json
>> index 81185d4311..456247af8f 100644
>> --- a/qapi/migration.json
>> +++ b/qapi/migration.json
>> @@ -1449,12 +1449,37 @@
>>   ##
>>   { 'command': 'migrate-continue', 'data': {'state': 'MigrationStatus'} }
>>   
>> +##
>> +# @MigrateUriParameter:
>> +#
>> +# Information regarding which source interface is connected to which
>> +# destination interface and number of multifd channels over each interface.
>> +#
>> +# @source-uri: uri of the source VM. Default port number is 0.
>> +#
>> +# @destination-uri: uri of the destination VM
>> +#
>> +# @multifd-channels: number of parallel multifd channels used to migrate data
>> +#                    for specific source-uri and destination-uri. Default value
>> +#                    in this case is 2 (Since 7.1)
>> +#
>> +##
>> +{ 'struct' : 'MigrateUriParameter',
>> +  'data' : { 'source-uri' : 'str',
>> +             'destination-uri' : 'str',
>> +             '*multifd-channels' : 'uint8'} }
>> +
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
>> @@ -1474,20 +1499,32 @@
>>   # 1. The 'query-migrate' command should be used to check migration's progress
>>   #    and final result (this information is provided by the 'status' member)
>>   #
>> -# 2. All boolean arguments default to false
>> +# 2. The uri argument should have the Uniform Resource Identifier of default
>> +#    destination VM. This connection will be bound to default network
>>   #
>> -# 3. The user Monitor's "detach" argument is invalid in QMP and should not
>> +# 3. All boolean arguments default to false
>> +#
>> +# 4. The user Monitor's "detach" argument is invalid in QMP and should not
>>   #    be used
>>   #
>>   # Example:
>>   #
>> -# -> { "execute": "migrate", "arguments": { "uri": "tcp:0:4446" } }
>> +# -> { "execute": "migrate",
>> +#      "arguments": {
>> +#          "uri": "tcp:0:4446",
>> +#          "multi-fd-uri-list": [ { "source-uri": "tcp::6900",
>> +#                                   "destination-uri": "tcp:0:4480",
>> +#                                   "multifd-channels": 4},
>> +#                                 { "source-uri": "tcp:10.0.0.0: ",
>> +#                                   "destination-uri": "tcp:11.0.0.0:7789",
>> +#                                   "multifd-channels": 5} ] } }
>>   # <- { "return": {} }
>>   #
>>   ##
>>   { 'command': 'migrate',
>> -  'data': {'uri': 'str', '*blk': 'bool', '*inc': 'bool',
>> -           '*detach': 'bool', '*resume': 'bool' } }
>> +  'data': {'uri': 'str', '*multi-fd-uri-list': ['MigrateUriParameter'],
>> +           '*blk': 'bool', '*inc': 'bool', '*detach': 'bool',
>> +           '*resume': 'bool' } }
> Considering the existing migrate API from a QAPI design POV, I
> think there are several significant flaws with it
>
> The use of URIs is the big red flag. It is basically a data encoding
> scheme within a data encoding scheme.  QEMU code should be able to
> directly work with the results from QAPI, without having todo a
> second level of parsing.
>
> URIs made sense in the context of HMP or the QemuOpts CLI, but do not
> make sense in QMP. We made a mistake in this respect when we first
> introduced QMP and implemented 'migrate'.
>
> If we going to extend the migrate API I think we should stop using URIs
> for the new fields, and instead define a QAPI discriminated union for
> the different data transport backends we offer.
>
>       { 'enum': 'MigrateTransport',
>         'data': ['socket', 'exec'] }
>
>       { 'union': 'MigrateAddress',
>         'base': { 'transport': 'MigrateTransport'},
>         'discriminator': 'transport',
>         'data': {
>             'socket': 'SocketAddress',
> 	   'exec': ['str'],
>         }
>
> NB, 'socket' should be able to cover all of  'tcp', 'unix', 'vsock'
> and 'fd' already. I'm fuzzy on best way to represent RDMA.
>
>
> IIUC, the desire of migration maintainers is that we can ultimately
> have multifd as the preferred, or even only, mechanism. Aside from
> the main outbound migration control channel, and the multifd
> data channels, IIUC we have a potential desire to have more channels
> for post-copy async requests.
>
> This all suggests to me a more general representation along the
> lines of:
>
>    { 'enum': 'MigrateChannelType',
>      'data': ['control', 'data', 'async'] }
>
>    { 'struct': 'MigrateChannel',
>      'data': {
>         'type': 'MigrateChannelType',
>         'src-addr': 'MigrateAddress',
>         'dst-addr': 'MigrateAddress',
>         'count': 'int',
>      } }
>
>    { 'comand': 'migrate',
>      'data': {
>        '*uri': 'str'
>        '*channels': ['MigrateChannel']
>      }
>    }
>
> With 'uri' and 'channels' being mutually exclusive here.
>
> This whole scheme brings in redundancy wrt to the 'migrate-set-parameters'
> API wrt multifd - essentally the same data is now being set in two
> different places. IMHO, we should declare the 'multifd' capability
> and the 'multifd-chanels' parameter deprecated, since the information
> they provide is totally redundant, if you're giving an explicit list
> of channels to 'migrate'.
 > Hi Daniel. Initially while brainstorming this idea for the first 
time, we also came up with the same thought of depricating the migrate 
API. But how will we achieve this now and how is it going to work. Is it 
like we will be making migate V2 APIs initially, integrate it and then 
depricate the old one? would be happy to get some pointers from your end.
> With regards,
> Daniel
With Regards,
Het Gala

