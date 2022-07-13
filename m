Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E72573901
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 16:38:43 +0200 (CEST)
Received: from localhost ([::1]:44452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBdVi-0004t6-9R
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 10:38:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1oBdTm-0002KD-Kn
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 10:36:42 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:40134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1oBdTg-0004oI-5c
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 10:36:41 -0400
Received: from pps.filterd (m0127844.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26D76ul6023422;
 Wed, 13 Jul 2022 07:36:31 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=lrnwZKSjGR1PZyt+ZaQG5iDORTuk2rHyuRD+zaNcPoY=;
 b=MVSXfUtWl4nUMkCYjLpE4YajyPert8HKpgnExxxIhTmYDSUD0GbauYRTjaj7iR5jvzF3
 BGt/DsRhStI90xDHqp7arEncQEf6wL02V5nOM3jTovCgPT12IQfAqyGUrWfa+eMpmKdj
 WQNxzNhJzEXxtC6oBadhTUnkpToslQQ/TLU43wynU/7AQ5uhYXsHLUq6DUQRYtmE++Fr
 cPGP10YZs3utk6AUmkYcPKRyvFXnOconejP9qQxECeS1IkErW+iRZQs54GGqXRTIMmLH
 nU09tSQwCuf3aqlHyGjLfhOmh3WZM1jv07iA3oe0nhi/cUKbjTI18DHP7d9W4i0uXg7k Zw== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3h79778fnp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Jul 2022 07:36:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WolhZDMd8GzQ8F7jp1YZ9XwCxh4UTYmk1UuxgiDntXXUBrR2qKaB2otIC0HWJ0Ftqps5//lktIs1uOPso0pykCH7t4px78/8d4odc8410lGIX86v9Lg2mdzgecCPnG/inpvwYAu7ZSCmdpllNicWhK7b0A7rXWnFOm2fG2aAjJtnIkFg9a4J5jZNDwLiAowqyyLQ2KU4hsxI7VPCa1QlyfmCKCHKwNH/1QKpVunvOSgVUMjxKjzHz2iu8Hz99ZFJujl41Joo847wGzzMQZggA1+n4x1FOKRoXbpEaz1DP2+kOtJt3v0Vbx5L8E0teE259ZkDHuo8arTtLtzLZ8hlGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lrnwZKSjGR1PZyt+ZaQG5iDORTuk2rHyuRD+zaNcPoY=;
 b=kTkvGp9kNF0u0IxMk74rIa2dlaYIubJXF08yqhimXtaZ9M7vgGSaEhqNlKuSe0cFLYU2HLIixxvNWIs0I5DcxmutgjyJT0VXWyTvEHJYMh7+Cx/G8dJYmaRGvuW8BeLTZ8UQZU+8fen6Cl1vkADlh3ZUugpNeVvh6XEx6KUdqPdhDOSUo3utJzkw+I2ULVN5j5Abo7QDELh9i3buIUJLac3B8L1LJmfv4cCj/lPX/TNaxZVxWRobNf/+rdpljlznr2/bWnq8eKS3EbI1GsVvu4+L025X39m7YNBxqafaSre2LQZb4jgVEKeMg8y7G4DACbPryml8e37NnDL3PiZ8pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by BL0PR02MB4450.namprd02.prod.outlook.com (2603:10b6:208:44::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12; Wed, 13 Jul
 2022 14:36:28 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::1493:404b:3242:8e0f]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::1493:404b:3242:8e0f%5]) with mapi id 15.20.5417.026; Wed, 13 Jul 2022
 14:36:28 +0000
Message-ID: <0237886b-b7b0-65a4-8431-c9ed62018b8a@nutanix.com>
Date: Wed, 13 Jul 2022 20:06:17 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH 2/4] Adding multi-interface support for multi-FD on
 destination side
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, quintela@redhat.com, pbonzini@redhat.com,
 berrange@redhat.com, armbru@redhat.com, eblake@redhat.com,
 Manish Mishra <manish.mishra@nutanix.com>
References: <20220609073305.142515-1-het.gala@nutanix.com>
 <20220609073305.142515-3-het.gala@nutanix.com> <Yqt5I1sP7YxcU3TK@work-vm>
From: Het Gala <het.gala@nutanix.com>
In-Reply-To: <Yqt5I1sP7YxcU3TK@work-vm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXPR0101CA0048.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:d::34) To BYAPR02MB4343.namprd02.prod.outlook.com
 (2603:10b6:a03:57::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2e2a0aff-1711-4ce8-a56b-08da64dd1211
X-MS-TrafficTypeDiagnostic: BL0PR02MB4450:EE_
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DppoKe8b8YJuqvW3ExE4L9lH4AIQjk/wcgLA3VvPcgaUy/eJSs3UR/xIz58bd+CUNSjyGInKjHiy4djSHxqUP5+QJbnlG0ge6HEgh5NEvjYI6Ukwm6h+2eg9wY5S++yTSsbNSXm8TTjMFVz8Ppgg3T++YEJWY6/k3VVEERbPc6BFhKUL+KzntV0ivV0E/FVqVTsgPWIHUjjedQHDdoxH4kY0cHWIilxAiARBLYFeuMpu37+2dn/ciuhRZ6q11pmm/KGkZTQHIY7gJpTnWd/4BSSNxaM/LjL6MjFWQ1mV1fQvB2oPLoPowBZ1O3VdHKczJbWWTY0Y/Wg7ZAHEirkL+d97AW0+xedQfWfR6cwpc3lgIWvfyDALMuchFU7Zm3WxJYUpwCcZeSJBoyUa/VdNJMShECXUKilie4l0zPB3gNSwmWH1k9rygg5sv6pTBK2/VQMhYtpBn9nANQUpL1wYe5Mn4fD5LExi7QKZA5IgeMlVXK1aqxAIjp5cSVWv426vgfiS/9KWNGvplVeVsVzw+/CvvxLwEOOYMGkTALlCkVJGmE1rpygf6iK5qPMCHDzkeeRQb6xhffY6ycouw12ujFmhyIQmnZJ0ZdNmlrb4F/NzyWHqMHzKaE+HMlFPfYcmCBrWFu+a220LydNfWEayAm+AfJEHblGvrFcIU7jYV3z1A0Kv+Cqg4XqH5KQVe452WRN1QjNiTYVzYFXKyCGcW1VitgCz8ThUz6GW4aRQ8lbD2Z5KEHeOjPTiMXm3i7nb+MhYuW6daGb6AvnRh/ez6mh7QDhfqdDgsp0fNtgVmedNyDSEEez1v+q5ZBulA5NNCzbHq+COZYkbmkuYajKTMrp9GOdWLeR90BoPnuaVzzv06jy8Tu50zSHLFVSFXxrYBcV/QXZRbeGKdXHut28nHg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(396003)(346002)(376002)(39860400002)(366004)(83380400001)(31696002)(86362001)(38350700002)(38100700002)(8936002)(5660300002)(478600001)(6486002)(2906002)(41300700001)(30864003)(6916009)(44832011)(6666004)(316002)(4326008)(8676002)(52116002)(66476007)(31686004)(66946007)(107886003)(186003)(66556008)(53546011)(6512007)(36756003)(26005)(2616005)(6506007)(43740500002)(45980500001)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a2t4Y0g5OEpBTDEweUNHZWM4QjVBbEN4UW5EMFNTZTk3SUlYQnFOMDZ6OEcw?=
 =?utf-8?B?M000M09sNElHb2k1bWVXTHBVM0paZGhuQXk2VHNKOTlFZnRQZ0ZhQXE1K1No?=
 =?utf-8?B?a29QaThQUktOTU1pTEFsSjEzK2VFekJoVDBtYVZHeXdwTjM3UU1YK3dhekxD?=
 =?utf-8?B?cG12OVBhR1VoREc4VHduNXVqVjNZZ1RHVGp4UEs2TTg4ZmVybVZkZVdDQmFR?=
 =?utf-8?B?eWIvWU51RmN4TStLU21kNk9hclZOeDBGOEFBUHhXSFJ5cm5HMmsyc1lMZHda?=
 =?utf-8?B?K1NNemU5S0NhSWdiblF6Qy9PZ3FMZ21ocG9PY2o0WTdrenhlNGNLeUZncGh1?=
 =?utf-8?B?dmpBWXl0SDUybzd6c1lPTTcwNUdzTnI3V3pSQTFRcmMwWWRPOEJZM1Joalo1?=
 =?utf-8?B?aWNIQm85WGttVTViVTJIay9JQlpGWUc1VmIyMXg3dWhUOUJFdWRBS0k0STZw?=
 =?utf-8?B?STZnVTRUaXlOLzRzMUpNS0s4Wi9wTXpaSi8vNkczU1d1dTRUQit5UUdvWTVS?=
 =?utf-8?B?eFpTOXBQS2IvbThkQklmVGxQVktWWk8vaktYTE1VdkJFdG0vRWNPSXJxVmV3?=
 =?utf-8?B?cjJTZU93UHVwbmVMUGdqN1RMNVMwWnpJa3A4U2QxLzhTWUFHd293S3J4QlhK?=
 =?utf-8?B?Vk9CNjQ2VTV4TVJ4QkVBWFdsRGdxblYvd21DdVFGZ0xNMDJrUWd6ZDdUdXF0?=
 =?utf-8?B?QUlvdTIwOHRwU0srSEpwZG9USTR0am04TFl6OUxSdFVOM0ZMRnpmbHY5dVlX?=
 =?utf-8?B?U2UvTStwUWNYdi96WDI5NW5IM2M4VG1VSEtYZkVPSnNEWG13V2QxTkNZNTY0?=
 =?utf-8?B?enFrbmg5WW9mNVVxWHd1MHRiUGtUTjBFcnhxWmpibVo5ZlYwQUswakZaVDJr?=
 =?utf-8?B?Qk1oRE5NT0ZNYzR6SmhLRWFMTjQ4aWdXUGhwODNRNllLdVpVaW4zbnRWN01H?=
 =?utf-8?B?MWoxMHRxTUd2aWUyeElOYkovTExRMDJZb1d5MDVoZ3NVbTJZU0Fqak5mU0c4?=
 =?utf-8?B?Q1RJa25meUhqRnhrTXV6TVNtUXRUdEhIWjYvVmc3RFNLaWtPZVN0T08yamY5?=
 =?utf-8?B?SDViM3BMckhkUUNOcE5jdlNPMFF4WStTbzNhbFI3T1ZFRXpoWkl0SFhjZ0p4?=
 =?utf-8?B?eWpWWi9ydkZ4TWZrcnlwcHFMbzd5UVRJV2V0Q3Q3K1NkRS9XVjYwZzJCdTQ2?=
 =?utf-8?B?TGtFMW9nMzB3WU9uVm9lZUFsL213WXAvaCtMMjFvekF6V0RZRVlSUnRGdWJR?=
 =?utf-8?B?OHJ2ZXNrSExMZVJYQitaR0ltdTJwNVA3U1g1aXk1N0N2cUphQktjYm9ZdkxK?=
 =?utf-8?B?NTZiWkFKSk5BNTBoS2xDUU55Z0tZMjhUL0E5TUYyWGdScW90Z2VLVnNvK29J?=
 =?utf-8?B?Qmg5WWFHc1FzY0FrK1l5L3NKSWlQM2dsL3BHMy9jaHliQ3JFUmxydVZkQ1hF?=
 =?utf-8?B?cGtqc2VabWpHSFpFQXFManp6T2VLV3BXY0F2TzBtY3I3SFhNRDlHbFNOV05p?=
 =?utf-8?B?YTR3T1JMS2lpbk83akEyN1Jwc0xxVWdKZzRUWVdjdUJ5OWlEUFhGdmRPczZz?=
 =?utf-8?B?aU5Sc2U3cWI2bzA2N0hRcnVqamNhVFlIbURrUzZhNTVDUDFvNmw3OSs2amxV?=
 =?utf-8?B?eXplQmlMYlU1NFJMaVFtQTBGdmJkY281MXppRUdHNkFLbFlaSDE5VHZkVE04?=
 =?utf-8?B?MG9VRlFtK2VEbEh2M2J3NHFpSEdIa1BGdGdBTG9TNWhmekJHUmdLWGtCcnkz?=
 =?utf-8?B?Q1BaSndVWit0RDErc1g4QWRLdHllMXUyN0lEdllmTjlYVllSVHRheGRDOWhi?=
 =?utf-8?B?Tld1bTJ0b2ZwREplSkRsMjhYc1huNDEyVURINldadytqUVV6enI4VmNQS0hJ?=
 =?utf-8?B?VXd6YmVLWUErTFRhODJFMnFwb3lzQWVQWEQ3TlJDc0h4ZjJzdXB5QWJYRlpk?=
 =?utf-8?B?ZVR3NlJteitiend2TUtkVEYzd09pYWNWWmJYWDQrMThZRzQ5bTdoS0R1QzJH?=
 =?utf-8?B?YmFKYXpjeDBQTXI1bTlaSk5xS2FMQ0NsZWgxTUVySVVhMVZ2VGRSWTJtWlIz?=
 =?utf-8?B?OVRaNTFwczF1Rms4MnR5S1NEOE1Na25MVUhudVI3Y1hXc1dZb2xac0NBbEh2?=
 =?utf-8?Q?G1dZTsqOujmLLHFCGbGlG4f3w?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e2a0aff-1711-4ce8-a56b-08da64dd1211
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2022 14:36:28.3636 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xxJHnhG9LqhzrXUtaM9KmVqrVqXDaC3g+QFZMNT9nWmL0y07KTAebEYL4bmrgcAhRKCT35Vy+iQrPUvUoOERbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB4450
X-Proofpoint-ORIG-GUID: Hu0DiqwZt1_V2N13QC3HGrO5UnMQ5y2_
X-Proofpoint-GUID: Hu0DiqwZt1_V2N13QC3HGrO5UnMQ5y2_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-13_03,2022-07-13_03,2022-06-22_01
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


On 17/06/22 12:10 am, Dr. David Alan Gilbert wrote:
> * Het Gala (het.gala@nutanix.com) wrote:
>> i) Modified the format of qemu monitor command: ‘migrate-incoming’ by adding
>>     a list, each element in the list is to open listeners with a given number
>>     of multiFD channels.
>>
>> ii) Qemu starts with -incoming flag defer and -multi-fd-incoming defer to
>>      allow the modified 'migrate-incoming' command to be used.
>>
>> iii) Format for -multi-fd-incoming flag as a comma separated string has been
>>       added with each substring containing listener socket address and number
>>       of sockets to open.
>>
>> Suggested-by: Manish Mishra <manish.mishra@nutanix.com>
>> Signed-off-by: Het Gala <het.gala@nutanix.com>
>> ---
>>   include/qapi/util.h   |   1 +
>>   migration/migration.c | 149 ++++++++++++++++++++++++++++++++++++------
>>   migration/migration.h |   2 +
>>   migration/socket.c    |  11 ++--
>>   migration/socket.h    |   3 +-
>>   monitor/hmp-cmds.c    |  42 ++++--------
>>   qapi/migration.json   |  43 ++++++++++--
>>   qapi/qapi-util.c      |  27 ++++++++
>>   qemu-options.hx       |  18 +++++
>>   softmmu/vl.c          |  30 ++++++++-
>>   10 files changed, 265 insertions(+), 61 deletions(-)
>>
>> diff --git a/include/qapi/util.h b/include/qapi/util.h
>> index 3041feb3d9..88fb2270db 100644
>> --- a/include/qapi/util.h
>> +++ b/include/qapi/util.h
>> @@ -29,6 +29,7 @@ bool qapi_bool_parse(const char *name, const char *value, bool *obj,
>>                        Error **errp);
>>   
>>   int parse_qapi_name(const char *name, bool complete);
>> +struct strList *strList_from_string(const char *in, char c);
>>   
>>   /*
>>    * For any GenericList @list, insert @element at the front.
>> diff --git a/migration/migration.c b/migration/migration.c
>> index c408175aeb..9b0ad732e7 100644
>> --- a/migration/migration.c
>> +++ b/migration/migration.c
>> @@ -477,28 +477,39 @@ void migrate_add_address(SocketAddress *address)
>>                         QAPI_CLONE(SocketAddress, address));
>>   }
>>   
>> -static void qemu_start_incoming_migration(const char *uri, Error **errp)
>> +static void qemu_start_incoming_migration(const char *uri, uint8_t number,
>> +                                          int idx, Error **errp)
>>   {
>>       const char *p = NULL;
>>   
>> -    migrate_protocol_allow_multi_channels(false); /* reset it anyway */
>> -    qapi_event_send_migration(MIGRATION_STATUS_SETUP);
>> -    if (strstart(uri, "tcp:", &p) ||
>> -        strstart(uri, "unix:", NULL) ||
>> -        strstart(uri, "vsock:", NULL)) {
>> -        migrate_protocol_allow_multi_channels(true);
>> -        socket_start_incoming_migration(p ? p : uri, errp);
>> -#ifdef CONFIG_RDMA
>> -    } else if (strstart(uri, "rdma:", &p)) {
>> -        rdma_start_incoming_migration(p, errp);
>> -#endif
>> -    } else if (strstart(uri, "exec:", &p)) {
>> -        exec_start_incoming_migration(p, errp);
>> -    } else if (strstart(uri, "fd:", &p)) {
>> -        fd_start_incoming_migration(p, errp);
>> +    if (number ==  0) {
>> +        migrate_protocol_allow_multi_channels(false); /* reset it anyway */
>> +        qapi_event_send_migration(MIGRATION_STATUS_SETUP);
>> +        if (strstart(uri, "tcp:", &p) ||
>> +            strstart(uri, "unix:", NULL) ||
>> +            strstart(uri, "vsock:", NULL)) {
>> +            migrate_protocol_allow_multi_channels(true);
>> +    #ifdef CONFIG_RDMA
>> +        } else if (strstart(uri, "rdma:", &p)) {
>> +            rdma_start_incoming_migration(p, errp);
>> +    #endif
>> +        } else if (strstart(uri, "exec:", &p)) {
>> +            exec_start_incoming_migration(p, errp);
>> +        } else if (strstart(uri, "fd:", &p)) {
>> +            fd_start_incoming_migration(p, errp);
>> +        } else {
>> +            error_setg(errp, "unknown migration protocol: %s", uri);
>> +        }
>>       } else {
>> -        error_setg(errp, "unknown migration protocol: %s", uri);
>> +        /* multi-FD parameters only support tcp network protocols */
>> +        if (!strstart(uri, "tcp:", &p)) {
>> +            error_setg(errp, "multifd-destination uri supports "
>> +                                "tcp protocol only");
>> +            return;
>> +        }
>> +        store_multifd_migration_params(p ? p : uri, NULL, number, idx, errp);
>>       }
>> +    socket_start_incoming_migration(p ? p : uri, number, errp);
>>   }
>>   
>>   static void process_incoming_migration_bh(void *opaque)
>> @@ -2140,7 +2151,17 @@ void migrate_del_blocker(Error *reason)
>>       migration_blockers = g_slist_remove(migration_blockers, reason);
>>   }
>>   
>> -void qmp_migrate_incoming(const char *uri, Error **errp)
>> +static inline int incoming_multi_fd_uri_parse(const char *str, char delim)
>> +{
>> +    int count = 0;
>> +    for (int i = 0; i < strlen(str); i++) {
>> +        count += (str[i] == delim);
>> +    }
>> +    return count;
>> +}
> That's a bit more general little helper function; I guess it could go in
> util/ somewhere (something like qemu_string_count_delim ???)

 > Yes David, I will include this helper function in util folder, in the 
same patch

with all other helper functions I am trying to include.

>
>> +/* migrate_incoming comes from -incoming flag in qemu process */
>> +void migrate_incoming(const char *uri, Error **errp)
>>   {
>>       Error *local_err = NULL;
>>       static bool once = true;
>> @@ -2154,11 +2175,99 @@ void qmp_migrate_incoming(const char *uri, Error **errp)
>>           return;
>>       }
>>   
>> +    qemu_start_incoming_migration(uri, 0, 0, &local_err);
>> +
>>       if (!yank_register_instance(MIGRATION_YANK_INSTANCE, errp)) {
>>           return;
>>       }
>>   
>> -    qemu_start_incoming_migration(uri, &local_err);
>> +    if (local_err) {
>> +        yank_unregister_instance(MIGRATION_YANK_INSTANCE);
>> +        error_propagate(errp, local_err);
>> +        return;
>> +    }
>> +
>> +    once = false;
> Can you explain what this change is for?

 > Sorry David, its just small confusion here. the upstream function 
migrate_incoming

was divided into 3 different functions, because of which it has created 
this confusion.

I will definitely clear this out in the v2 version of patches.

>> +}
>> +
>> +/* multi_fd_migrate_incoming comes from -multi-fd-migrate-incoming flag in qemu process */
>> +void multi_fd_migrate_incoming(const char *uri, Error **errp)
>> +{
>> +    Error *local_err = NULL;
>> +    static bool once = true;
>> +
>> +    if (!once) {
>> +        error_setg(errp, "The incoming migration has already been started");
>> +        return;
>> +    }
>> +    if (!runstate_check(RUN_STATE_INMIGRATE)) {
>> +        error_setg(errp, "'-multi-fd-incoming' was not specified on the command line");
>> +        return;
>> +    }
>> +
>> +    strList *st = strList_from_string(uri, ',');
>> +    strList *r = st;
>> +    int length = QAPI_LIST_LENGTH(st);
>> +    init_multifd_array(length);
>> +
>> +    for (int i = 0; i < length; i++) {
>> +        const char *uri = NULL, *ret = NULL;
>> +        const char *str = r->value;
>> +        uint8_t multifd_channels = DEFAULT_MIGRATE_MULTIFD_CHANNELS;
>> +        int parse_count = incoming_multi_fd_uri_parse(str, ':');
>> +        if (parse_count < 2 || parse_count > 3) {
>> +            error_setg(errp, "Invalid format of string-id %d in "
>> +                             "'-multi-fd-incoming' flag", i);
>> +            return;
>> +        }
>> +        if (parse_count == 3) {
>> +            ret = strrchr(str, ':');
>> +            uri = g_strndup(str, strlen(str) - strlen(ret));
>> +            multifd_channels = atoi(ret + 1);
>> +        }
>> +        qemu_start_incoming_migration(parse_count == 2 ? str : uri,
>> +                                      multifd_channels, i, &local_err);
>> +        r = r->next;
>> +    }
>> +
>> +    if (local_err) {
>> +        yank_unregister_instance(MIGRATION_YANK_INSTANCE);
>> +        error_propagate(errp, local_err);
>> +        return;
>> +    }
>> +
>> +    once = false;
>> +}
>> +
>> +/* qmp_migrate_incoming comes from qemu qmp monitor command */
>> +void qmp_migrate_incoming(const char *uri, bool has_multi_fd_uri_list,
>> +                          MigrateIncomingUriList *cap, Error **errp)
>> +{
>> +    Error *local_err = NULL;
>> +    static bool once = true;
>> +
>> +    if (!once) {
>> +        error_setg(errp, "The incoming migration has already been started");
>> +        return;
>> +    }
>> +
>> +    if (!yank_register_instance(MIGRATION_YANK_INSTANCE, errp)) {
>> +        return;
>> +    }
>> +
>> +    /* For migration thread */
>> +    qemu_start_incoming_migration(uri, 0, 0, &local_err);
>> +
>> +    /* For Multi-FD */
>> +    int length = QAPI_LIST_LENGTH(cap);
>> +    init_multifd_array(length);
>> +    for (int i = 0; i < length; i++) {
>> +        const char *multifd_dst_uri = cap->value->destination_uri;
>> +        uint8_t multifd_channels = cap->value->multifd_channels;
>> +        qemu_start_incoming_migration(multifd_dst_uri, multifd_channels,
>> +                                      i, &local_err);
>> +        cap = cap->next;
>> +    }
>>   
>>       if (local_err) {
>>           yank_unregister_instance(MIGRATION_YANK_INSTANCE);
>> @@ -2194,7 +2303,7 @@ void qmp_migrate_recover(const char *uri, Error **errp)
>>        * only re-setup the migration stream and poke existing migration
>>        * to continue using that newly established channel.
>>        */
>> -    qemu_start_incoming_migration(uri, errp);
>> +    qemu_start_incoming_migration(uri, 0, 0, errp);
>>   }
>>   
>>   void qmp_migrate_pause(Error **errp)
>> diff --git a/migration/migration.h b/migration/migration.h
>> index 485d58b95f..fa8717ec9e 100644
>> --- a/migration/migration.h
>> +++ b/migration/migration.h
>> @@ -353,6 +353,8 @@ bool migration_is_setup_or_active(int state);
>>   bool migration_is_running(int state);
>>   
>>   void migrate_init(MigrationState *s);
>> +void migrate_incoming(const char *uri, Error **errp);
>> +void multi_fd_migrate_incoming(const char *uri_str, Error **errp);
>>   bool migration_is_blocked(Error **errp);
>>   /* True if outgoing migration has entered postcopy phase */
>>   bool migration_in_postcopy(void);
>> diff --git a/migration/socket.c b/migration/socket.c
>> index 7ca6af8cca..21e0983df2 100644
>> --- a/migration/socket.c
>> +++ b/migration/socket.c
>> @@ -202,17 +202,17 @@ socket_incoming_migration_end(void *opaque)
>>   
>>   static void
>>   socket_start_incoming_migration_internal(SocketAddress *saddr,
>> -                                         Error **errp)
>> +                                         uint8_t number, Error **errp)
>>   {
>>       QIONetListener *listener = qio_net_listener_new();
>>       MigrationIncomingState *mis = migration_incoming_get_current();
>>       size_t i;
>> -    int num = 1;
>> +    uint8_t num = 1;
>>   
>>       qio_net_listener_set_name(listener, "migration-socket-listener");
>>   
>>       if (migrate_use_multifd()) {
>> -        num = migrate_multifd_channels();
>> +        num = number;
> That's a strange line - it suggests you need a better name for both
> parameters!
 > Sure David. will change the parameter names for both.
>
>>       }
>>   
>>       if (qio_net_listener_open_sync(listener, saddr, num, errp) < 0) {
>> @@ -239,12 +239,13 @@ socket_start_incoming_migration_internal(SocketAddress *saddr,
>>       }
>>   }
>>   
>> -void socket_start_incoming_migration(const char *str, Error **errp)
>> +void socket_start_incoming_migration(const char *str,
>> +                                     uint8_t number, Error **errp)
>>   {
>>       Error *err = NULL;
>>       SocketAddress *saddr = socket_parse(str, &err);
>>       if (!err) {
>> -        socket_start_incoming_migration_internal(saddr, &err);
>> +        socket_start_incoming_migration_internal(saddr, number, &err);
>>       }
>>       qapi_free_SocketAddress(saddr);
>>       error_propagate(errp, err);
>> diff --git a/migration/socket.h b/migration/socket.h
>> index bba7f177fe..b9e3699167 100644
>> --- a/migration/socket.h
>> +++ b/migration/socket.h
>> @@ -30,7 +30,8 @@ struct SrcDestAddr {
>>   void socket_send_channel_create(QIOTaskFunc f, void *data);
>>   int socket_send_channel_destroy(QIOChannel *send);
>>   
>> -void socket_start_incoming_migration(const char *str, Error **errp);
>> +void socket_start_incoming_migration(const char *str, uint8_t number,
>> +                                     Error **errp);
>>   
>>   void socket_start_outgoing_migration(MigrationState *s, const char *dst_str,
>>                                        Error **errp);
>> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
>> index 2db539016a..32a6b67d5f 100644
>> --- a/monitor/hmp-cmds.c
>> +++ b/monitor/hmp-cmds.c
>> @@ -42,6 +42,7 @@
>>   #include "qapi/qapi-commands-run-state.h"
>>   #include "qapi/qapi-commands-tpm.h"
>>   #include "qapi/qapi-commands-ui.h"
>> +#include "qapi/util.h"
>>   #include "qapi/qapi-visit-net.h"
>>   #include "qapi/qapi-visit-migration.h"
>>   #include "qapi/qmp/qdict.h"
>> @@ -72,32 +73,6 @@ bool hmp_handle_error(Monitor *mon, Error *err)
>>       return false;
>>   }
>>   
>> -/*
>> - * Produce a strList from a comma separated list.
>> - * A NULL or empty input string return NULL.
>> - */
>> -static strList *strList_from_comma_list(const char *in)
>> -{
>> -    strList *res = NULL;
>> -    strList **tail = &res;
>> -
>> -    while (in && in[0]) {
>> -        char *comma = strchr(in, ',');
>> -        char *value;
>> -
>> -        if (comma) {
>> -            value = g_strndup(in, comma - in);
>> -            in = comma + 1; /* skip the , */
>> -        } else {
>> -            value = g_strdup(in);
>> -            in = NULL;
>> -        }
>> -        QAPI_LIST_APPEND(tail, value);
>> -    }
>> -
>> -    return res;
>> -}
>> -
>>   void hmp_info_name(Monitor *mon, const QDict *qdict)
>>   {
>>       NameInfo *info;
>> @@ -1117,7 +1092,7 @@ void hmp_announce_self(Monitor *mon, const QDict *qdict)
>>                                               migrate_announce_params());
>>   
>>       qapi_free_strList(params->interfaces);
>> -    params->interfaces = strList_from_comma_list(interfaces_str);
>> +    params->interfaces = strList_from_string(interfaces_str, ',');
>>       params->has_interfaces = params->interfaces != NULL;
>>       params->id = g_strdup(id);
>>       params->has_id = !!params->id;
>> @@ -1147,8 +1122,19 @@ void hmp_migrate_incoming(Monitor *mon, const QDict *qdict)
>>   {
>>       Error *err = NULL;
>>       const char *uri = qdict_get_str(qdict, "uri");
>> +    const char *dst_uri = qdict_get_str(qdict, "destination-uri");
>> +    uint8_t multifd_channels = qdict_get_try_int(qdict, "multifd-channels",
>> +                                        DEFAULT_MIGRATE_MULTIFD_CHANNELS);
>> +    MigrateIncomingUriList *caps = NULL;
>> +    MigrateIncomingUri *value;
>> +
>> +    value = g_malloc0(sizeof(*value));
>> +    value->destination_uri = (char *)dst_uri;
>> +    value->multifd_channels = multifd_channels;
>> +    QAPI_LIST_PREPEND(caps, value);
>>   
>> -    qmp_migrate_incoming(uri, &err);
>> +    qmp_migrate_incoming(uri, !!caps, caps, &err);
>> +    qapi_free_MigrateIncomingUriList(caps);
>>   
>>       hmp_handle_error(mon, err);
>>   }
>> diff --git a/qapi/migration.json b/qapi/migration.json
>> index fb259d626b..62a7b22d19 100644
>> --- a/qapi/migration.json
>> +++ b/qapi/migration.json
>> @@ -1527,15 +1527,37 @@
>>     'data': {'uri': 'str', '*multi-fd-uri-list': ['MigrateUriParameter'], '*blk': 'bool',
>>              '*inc': 'bool', '*detach': 'bool', '*resume': 'bool' } }
>>   
>> +##
>> +# @MigrateIncomingUri:
>> +#
>> +# Information regarding which destination listening interface to be connected
>> +# and number of multifd channels over that interface.
>> +#
>> +# @destination-uri: the Uniform Resource Identifier of the destination VM
>> +#
>> +# @multifd-channels: number of channels used to migrate data in parallel for
>> +#                    for specific source-uri and destination-uri.
>> +#                    Default value in this case is 2 (Since 4.0)
>> +#
>> +##
>> +{ 'struct' : 'MigrateIncomingUri',
>> +  'data' : { 'destination-uri' : 'str',
>> +           '*multifd-channels' : 'uint8'} }
>> +
>>   ##
>>   # @migrate-incoming:
>>   #
>>   # Start an incoming migration, the qemu must have been started
>> -# with -incoming defer
>> +# with -incoming defer. qemu can also be started with optional
>> +# -multi-fd-incoming defer for opening multifd listening sockets
>>   #
>>   # @uri: The Uniform Resource Identifier identifying the source or
>>   #       address to listen on
>>   #
>> +# @multi-fd-uri-list: list of pair of source and destination VM Uniform
>> +#                     Resource Identifiers with number of multifd-channels
>> +#                     for each pair
>> +#
>>   # Returns: nothing on success
>>   #
>>   # Since: 2.3
>> @@ -1546,19 +1568,30 @@
>>   #    compatible with -incoming and the format of the uri is already exposed
>>   #    above libvirt.
>>   #
>> -# 2. QEMU must be started with -incoming defer to allow migrate-incoming to
>> +# 2. multi-fd-uri-list will have list of destination uri as listening sockets
>> +#    and multi-fd number of channels on each listening socket.
>> +#
>> +# 3. QEMU must be started with -incoming defer to allow migrate-incoming to
>>   #    be used.
>>   #
>> -# 3. The uri format is the same as for -incoming
>> +# 4. multi-fd-uri-list format is not the same as for -multi-fd-incoming flag.
>> +#    For -multi-fd-incoming flag, it is a comma separated list of listener
>> +#    sockets with multifd channels.
>> +#    Example: -multi-fd-incoming "tcp::6900:4,tcp:11.0.0.0:7789:5".
> Why bother with -multi-fd-incoming ?  Just insist on people using
> -incoming defer    - I think we'd like to do away with the other forms
> of -incoming, it simplifies stuff a lot that way rather than having two
> schemes.

 > Our idea here behind introducing -multi-fd-incoming was just that if

some user wanted to open the multifd listening sockets before migration

process starts, he could able todo it, just like -incoming flag. But if you

think, it should only be via qmp monitor command, we could discard this

change.

>
>
>>   # Example:
>>   #
>>   # -> { "execute": "migrate-incoming",
>> -#      "arguments": { "uri": "tcp::4446" } }
>> +#      "arguments": {"uri": "tcp::6789",
>> +#                    "multi-fd-uri-list" : [ {"destination-uri" : "tcp::6900",
>> +#                                             "multifd-channels": 4},
>> +#                                            {"destination-uri" : "tcp:11.0.0.0:7789",
>> +#                                             "multifd-channels": 5} ] } }
>>   # <- { "return": {} }
>>   #
>>   ##
>> -{ 'command': 'migrate-incoming', 'data': {'uri': 'str' } }
>> +{ 'command': 'migrate-incoming',
>> +  'data': {'uri': 'str', '*multi-fd-uri-list': ['MigrateIncomingUri'] } }
>>   
>>   ##
>>   # @xen-save-devices-state:
>> diff --git a/qapi/qapi-util.c b/qapi/qapi-util.c
>> index 63596e11c5..9cc43ebcd3 100644
>> --- a/qapi/qapi-util.c
>> +++ b/qapi/qapi-util.c
>> @@ -15,6 +15,7 @@
>>   #include "qapi/error.h"
>>   #include "qemu/ctype.h"
>>   #include "qapi/qmp/qerror.h"
>> +#include "qapi/qapi-builtin-types.h"
>>   
>>   CompatPolicy compat_policy;
>>   
>> @@ -152,3 +153,29 @@ int parse_qapi_name(const char *str, bool complete)
>>       }
>>       return p - str;
>>   }
>> +
>> +/*
>> + * Produce a strList from a delimiter separated list.
>> + * A NULL or empty input string return NULL.
>> + */
>> +strList *strList_from_string(const char *in, char c)
>> +{
>> +    strList *res = NULL;
>> +    strList **tail = &res;
>> +
>> +    while (in && in[0]) {
>> +        char *ch = strchr(in, c);
>> +        char *value;
>> +
>> +        if (ch) {
>> +            value = g_strndup(in, ch - in);
>> +            in = ch + 1; /* skip the , */
>> +        } else {
>> +            value = g_strdup(in);
>> +            in = NULL;
>> +        }
>> +        QAPI_LIST_APPEND(tail, value);
>> +    }
>> +
>> +    return res;
>> +}
>> diff --git a/qemu-options.hx b/qemu-options.hx
>> index 60cf188da4..2e82e41dd5 100644
>> --- a/qemu-options.hx
>> +++ b/qemu-options.hx
>> @@ -4480,6 +4480,24 @@ SRST
>>       to issuing the migrate\_incoming to allow the migration to begin.
>>   ERST
>>   
>> +DEF("multi-fd-incoming", HAS_ARG, QEMU_OPTION_multi_fd_incoming, \
>> +    "-multi-fd-incoming tcp:[host]:port[:channel][,to=maxport][,ipv4=on|off][,ipv6=on|off]\n" \
>> +    "-multi-fd-incoming defer\n" \
>> +    "                wait for the URI to be specified via\n" \
>> +    "                multi_fd_migrate_incoming\n",
>> +    QEMU_ARCH_ALL)
>> +SRST
>> +``-multi-fd-incoming tcp:[host]:port[:channel][,to=maxport][,ipv4=on|off][,ipv6=on|off]``
>> +    Prepare for multi-fd incoming migration, with multi-fd listening sockets
>> +    on that connection. Default number of multi-fd channels is 2.
>> +
>> +``-multi-fd-incoming defer``
>> +    Wait for the URI to be specified via multi_fd_migrate\_incoming. The
>> +    monitor can be used to change settings (such as migration parameters)
>> +    prior to issuing the multi_fd_migrate\_incoming to allow the migration
>> +    to begin.
>> +ERST
>> +
>>   DEF("only-migratable", 0, QEMU_OPTION_only_migratable, \
>>       "-only-migratable     allow only migratable devices\n", QEMU_ARCH_ALL)
>>   SRST
>> diff --git a/softmmu/vl.c b/softmmu/vl.c
>> index 4c1e94b00e..2f5cf18eff 100644
>> --- a/softmmu/vl.c
>> +++ b/softmmu/vl.c
>> @@ -45,7 +45,7 @@
>>   #include "sysemu/seccomp.h"
>>   #include "sysemu/tcg.h"
>>   #include "sysemu/xen.h"
>> -
>> +#include "migration/migration.h"
>>   #include "qemu/error-report.h"
>>   #include "qemu/sockets.h"
>>   #include "qemu/accel.h"
>> @@ -167,6 +167,7 @@ typedef struct DeviceOption {
>>   static const char *cpu_option;
>>   static const char *mem_path;
>>   static const char *incoming;
>> +static const char *multi_fd_incoming;
>>   static const char *loadvm;
>>   static const char *accelerators;
>>   static bool have_custom_ram_size;
>> @@ -2349,6 +2350,11 @@ static void qemu_validate_options(const QDict *machine_opts)
>>           error_report("'preconfig' supports '-incoming defer' only");
>>           exit(EXIT_FAILURE);
>>       }
>> +    if (multi_fd_incoming && preconfig_requested &&
>> +        strcmp(multi_fd_incoming, "defer") != 0) {
>> +        error_report("'preconfig' supports '-multi-fd-incoming defer' only");
>> +        exit(EXIT_FAILURE);
>> +    }
>>   
>>   #ifdef CONFIG_CURSES
>>       if (is_daemonized() && dpy.type == DISPLAY_TYPE_CURSES) {
>> @@ -2621,7 +2627,7 @@ void qmp_x_exit_preconfig(Error **errp)
>>       if (incoming) {
>>           Error *local_err = NULL;
>>           if (strcmp(incoming, "defer") != 0) {
>> -            qmp_migrate_incoming(incoming, &local_err);
>> +            migrate_incoming(incoming, &local_err);
>>               if (local_err) {
>>                   error_reportf_err(local_err, "-incoming %s: ", incoming);
>>                   exit(1);
>> @@ -2630,6 +2636,20 @@ void qmp_x_exit_preconfig(Error **errp)
>>       } else if (autostart) {
>>           qmp_cont(NULL);
>>       }
>> +
>> +    if (multi_fd_incoming) {
>> +        Error *local_err = NULL;
>> +        if (strcmp(multi_fd_incoming, "defer") != 0) {
>> +            multi_fd_migrate_incoming(multi_fd_incoming, &local_err);
>> +            if (local_err) {
>> +                error_reportf_err(local_err, "-multi-fd-incoming %s: ",
>> +                                multi_fd_incoming);
>> +                exit(1);
>> +            }
>> +        }
>> +    } else if (autostart) {
>> +        qmp_cont(NULL);
>> +    }
>>   }
>>   
>>   void qemu_init(int argc, char **argv, char **envp)
>> @@ -3355,6 +3375,12 @@ void qemu_init(int argc, char **argv, char **envp)
>>                   }
>>                   incoming = optarg;
>>                   break;
>> +            case QEMU_OPTION_multi_fd_incoming:
>> +                if (!multi_fd_incoming) {
>> +                    runstate_set(RUN_STATE_INMIGRATE);
>> +                }
>> +                multi_fd_incoming = optarg;
>> +                break;
>>               case QEMU_OPTION_only_migratable:
>>                   only_migratable = 1;
>>                   break;
>> -- 
>> 2.22.3
>>

