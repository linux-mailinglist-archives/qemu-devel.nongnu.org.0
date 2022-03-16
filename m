Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 891C54DB7D5
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 19:17:33 +0100 (CET)
Received: from localhost ([::1]:53462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUYDE-0007yI-Lh
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 14:17:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nUYB5-0006NZ-1U
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 14:15:19 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:51072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nUYB2-0003Ib-Ew
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 14:15:18 -0400
Received: from pps.filterd (m0127843.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22GF64P2021396;
 Wed, 16 Mar 2022 11:15:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=ktlAn6h/oKmCQ+PdefDvdWrs8lRTVKKH3D2p98ZfZqA=;
 b=F/T+vzfjYQN8IMBcmdGuo5+y0yUjwWB5COHnBmRkBzNv9ev6QxnUouHX6P1o2AXANGO6
 jJTaXqMAPmNMrYI6hI+GpzoandM17+sNWmuDcmdcRgAatBBDMAFs8W1TB6nJrZsIUJ9b
 OC9UcroB+T/NZNs9FhF0QtOdx/wqKczYnIJdbsS3C6gu18VkElgi1Hv1atZ0xFIXByWl
 rbJWxRW3m1mwoOknctsojar95UsrFx1+93s2Js8yAOaCMaOu9SNtm9FCQtap/4TFwWUg
 B3RIjO3n3nsSeEh7zMf4f/8QtVbWqLBsQT1dP9diz9IimonzMbSoABNYr4jC3d/+M/Mi 1A== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2170.outbound.protection.outlook.com [104.47.58.170])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3et64mdvr7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Mar 2022 11:15:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YY0vRs+YU4UZZb5FrADv0yzlZdtPZCCk1u5TNtPfvSqTQqPeNS8I/DZmT83N3Dy9fV/jzh+xaeeRXMzrfMBPBfRgOYkBzpEK+8tCmF1SfQ2avb+dL4DePSg5QElc671uPZCvGMsdNky+L1iTN9qjaJh2De2SJVLetjm+aK47Xg5Hb/A/RrsZ2wtuGBuqYXCJ3bez1aKQqusKDyl49j2JOfpCW72pFDKmeJsd7/zcDIbbBg1bBbXVpquSBIKALJVR7ZG0oOGf1i+Jh/lzLJdaxH9RWUR7b7IavOdD40bTtg9KN3p6qWk2P8zATnUnROJ0jSf1i6ZNQz5mkGon+4y+ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ktlAn6h/oKmCQ+PdefDvdWrs8lRTVKKH3D2p98ZfZqA=;
 b=bSpUine11yz4GX32etUB2GeEa+f74fNkx2nrDk6h3JPvrBaeGFF2U8vveC5uEdb/Q3LSWGZbSKHsnB5lZMABEtd9HKorysjmxsih6cdUHQKd4UPWDZnnPVhgAxpiNjkurR6iov6UpVzYK/yGasef4bwPFIkT9hiCPPQc6fZXBKxleW11Df8n+x9SkcvyaRwbfOMe64oSd55kLJ2vfHYbUgNAPIDnTXyizquo2NpYsnm0YMGO/snQID5WQfwKWFDgwuLBiBv/FwlLOohEusODgBkkxbQlfcUX2Q37BCFrBR/50XfQZmGSGKkAJKvAMrEDlGh03CnuhgpzQDtIvYBJaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BN7PR02MB4033.namprd02.prod.outlook.com (2603:10b6:406:f9::16)
 by BYAPR02MB4711.namprd02.prod.outlook.com (2603:10b6:a03:49::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.26; Wed, 16 Mar
 2022 18:15:12 +0000
Received: from BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::5d3d:384c:d914:b12d]) by BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::5d3d:384c:d914:b12d%6]) with mapi id 15.20.5081.016; Wed, 16 Mar 2022
 18:15:12 +0000
Message-ID: <98a777da-4ff5-784f-78ca-790dd3064a7b@nutanix.com>
Date: Wed, 16 Mar 2022 23:45:03 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v2 2/2] Added parameter to take screenshot with screendump
 as
To: Markus Armbruster <armbru@redhat.com>
References: <20220315044740.155268-1-kshitij.suri@nutanix.com>
 <20220315044740.155268-2-kshitij.suri@nutanix.com>
 <87sfrivxk3.fsf@pond.sub.org>
From: Kshitij Suri <kshitij.suri@nutanix.com>
In-Reply-To: <87sfrivxk3.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM3PR05CA0150.eurprd05.prod.outlook.com
 (2603:10a6:207:3::28) To BN7PR02MB4033.namprd02.prod.outlook.com
 (2603:10b6:406:f9::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2bc53671-7cd7-47aa-3a4b-08da0778e95a
X-MS-TrafficTypeDiagnostic: BYAPR02MB4711:EE_
X-Microsoft-Antispam-PRVS: <BYAPR02MB4711694CDA94BB34E14D4F6599119@BYAPR02MB4711.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w6VYEwkxywIsEzZ/Szmi53QaDBlGtLPCUf54LjkN0y/35OFfHeFM3Z5vXvkoWBPjVsJwAJ1l4RvLNpAgUGZGs177U9LcEKh1zKKYkVfPcATE2uQNqCZ6IJr+k1U2KCMSfc2ml4ZSBIvNPESfyoh+E1zJuWBccrGKRaaFq3qMJfqDDl8w7aMcuy5g0lEj07Vtk7BSJ9pk/a3aB1URtt9uYCUbSqI8tVzjuAu4zk7Y+Ughu2gV2a7NWPq6XU+AH7QZxo8bYs18+c6tl2kMoQLiNPtISLG9KqdUKBaKeKZuGzhyil1YYrNPj939AafioO0+g/lZgXi/1IvbkWDZrZHL4EPE9sERNzSQdAlkGJWvAqiR3qbxx7sOoeRTNsgGEwcflqnXUw2rHlI36OO/8C08kElUX6wXdAMCeW7nzXHvijuD72odg9PiEgTsTiVlVDO673Yqok4fYmG6iL1jB3x8m8zVSBT9wkATflRdlU7PflbISw5VG+l/5IANeS+cftpptpP+as3lexrNy99clNF/eVYAtsCnvcT/RAkfNHIrcpu1Q0fV1gUFksGXtvnIfwcf2tr8BXKByN6PQJR8bcT5Bnh/KuMeG7Yas2dVGWHoEou914965YBdjQHZ4vvwVSFhl/gxfvmKhDTsNM52n3TrC87eYWtrjWJinxfEG3VzU+tpsa3+FFayJcOQfglWUvsr8ZA3VMaW7Qw2EF6KZkDpbPtm8E9QpPDfzB8DknnQNlBemEcSu0bj3F0aj2HHzg87VPsvXnDKzacNJlo5OIlGTGOZ/09pVReI4VPkd/QE7kWk7RmgiTMxWBMatYnpAdj0hbDRgqoxMMAd+gAPNTbnz+jRujNfVd/xkeFPh9ApoBD4pYnbI7ZYE1Bbe1tg4Xwr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR02MB4033.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(8936002)(2906002)(316002)(4326008)(8676002)(5660300002)(6666004)(6916009)(66556008)(52116002)(2616005)(66476007)(53546011)(66946007)(86362001)(508600001)(38100700002)(38350700002)(31696002)(44832011)(6512007)(66574015)(36756003)(6506007)(186003)(966005)(6486002)(26005)(31686004)(83380400001)(461764006)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?KzJ5cXJsUXZZVkZHOFFmRzk5TjBwbEhIa0hKTEdhR2JZTHIxSE9XeDJhLzh6?=
 =?utf-8?B?SUhZRDNlN1BNNTZWeHY2OFd4TlpjYUQ0cXIvRFltbG9SRlkySGFvYThraTNY?=
 =?utf-8?B?UGlJYUJzaXRvZGw0VjVXUzF4VWxydGF6QStBZ1JEYXVDS0hUVXNvMWo2cm5G?=
 =?utf-8?B?eDg1ZjN5dlM2cHR0dFBRWHVCNWZHeVlnWUtacFZ0L2E4T3JKRUNoaDZZeEo0?=
 =?utf-8?B?VXIzbFZxQnZEUVllQzBTYm93MERid3lmYndWenBEbjFGYzYwUEZyMktJZ2pq?=
 =?utf-8?B?dm00Z29CQUd6QWl2NkVyMkRnWFNZbFBmbkhRaW9wcDVrUmN6ZHU4M3hmRHZ4?=
 =?utf-8?B?MHJ6WWZOUjl4UHJnTFAwZlM4anlabWdEQnBPYlNJaWtnZGRQbHNpLzUzb09n?=
 =?utf-8?B?aklDYzdMRVdRd1B6M0FoRXVBZEpMNFhhWjAvblpmMU81c1d4dU1nQXppMGND?=
 =?utf-8?B?NlVrVlFmTWlaRVNLQTZOUElqa0R5REpxclZzMklaWGlHMTdlbkFJSVo5SldH?=
 =?utf-8?B?UEswb213WlFoM016amtQMTlkaHZWZXQ2KzRWTXJLQ2tYZW41YzZ5Vitrdm43?=
 =?utf-8?B?dDFGOTJUZlVmR0tVSlB4dGN3Q2tEanZSNGVmYjJtcGdNU0hPM1lTM0R4czln?=
 =?utf-8?B?cFc2bDVXZm9iYWJMMEZVNlVqQzI4emxUQkF6VmZicHI2UmZFQWNQRkFVOE43?=
 =?utf-8?B?NitWMUdiOXFSVmI3RXVXNExDbGJvSTlTQzgxT0I2OWM2OUFxdjFOYkVuM0po?=
 =?utf-8?B?czcwQjh0ajc5SXlNdDhyWTcyTWV0SkJKb3FUUnkxdEp4SXNIaXk0dVNkaUNZ?=
 =?utf-8?B?TllWRTFpWDJjc0REUVBqN0xyRS9pVDJCbWtnV0RGZDBnWTVZcjVUcVQ1bFhx?=
 =?utf-8?B?bjJydmR2V2d3MEVLcjUvUFhRc3lTa2xsMTlPSUp6TEVXaFdscDJhaVNHYnds?=
 =?utf-8?B?OGpYdmpSTGx4YXY4VUluOGp1ZFZPemhOUnd6cDgxMFdLT2luWDRHN3c1aHpn?=
 =?utf-8?B?NTJiQ25YbGljdXpWbmdaM1A5UUFaY05XT293L214d1RxM2k5ZWxHM2FYd3kx?=
 =?utf-8?B?dWxFUUE3Umt4aVlDQzNRWDV3WFQ0TG00UlloT1E1WlB2d1R6Y1l6WEczaWtx?=
 =?utf-8?B?M09NcCtQS1ZkMTBxdllNZnREakkwelkyU3lkaksvWmxQQ1RoWTBZWGtILzNi?=
 =?utf-8?B?SVlkV3o4MGgvZDhRUDFZcWtRVWdzUVZiTzhlYmJ3b1RwZTVGTE9xMzZyVDZW?=
 =?utf-8?B?NWk1UGRPZ1NQcStMR3VXcy9lUFoyeDVhd093eGxJeWlzUEF1czd6WXN4OGFO?=
 =?utf-8?B?TGlqaWd0dDJQQUVaQlFHOGw3SElWQ0RVNmF6ZWxnWk5iRExSbXV0SXp4c0ls?=
 =?utf-8?B?MEp6T3MvM01MTXpJei81Wnd6RHB1Sk93Z3JMV1A2SWFUV0RsakhkU3JQaEc4?=
 =?utf-8?B?MGFKWWNUNGg4WCtpSTlwWFBnQWlKT2ZPMkl3UjFrbncxUlM0aE9DdzVDZDVo?=
 =?utf-8?B?eEovMmtnRTYzeHNNRDdYYlJPY2VMOVVxRmEvNUFtSmRUUUpDNWNvbVFvRUtv?=
 =?utf-8?B?VjhYeUIxMXZocHZyL1YrSm4vcFlPS1EwTmt4Z3JaOFJwbkNLVVhXK3BrdEJm?=
 =?utf-8?B?eWxUWTNjRWRDYXVoRnlmQ2pFT1N0K2pnaUJoTWU1TXNOcG9Bdkd2a0tHK0pP?=
 =?utf-8?B?Q0VlRzNRcVJ6S2o5VG8xRTZiSkJ6UE4vL1NlQzRrbFVZTjl6aTlIQkVMS2tQ?=
 =?utf-8?B?QXZubkRMSmtyN1BENFlFRHdsKzlSdWlyTWx3dlczelNwUzNQZjNpY0FISGRX?=
 =?utf-8?B?Q3hEOEJGT1dZOEdyR3dwZUo1RStBSnNMTmxLcWUzckJmQXlwTWZjeUFkZmpt?=
 =?utf-8?B?Z3N1KzBLdGR6ejU1YVVVUzRGRXEyeTROMHNJQThMSWpkWnMvOWl4eDh3cFBY?=
 =?utf-8?B?SmZtZjhDZ2QxUU9vZTh4VjVYek9kaWhmU2thS1RiaURjNjJla2ZIK21VY05T?=
 =?utf-8?B?UStybGIydGpRPT0=?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bc53671-7cd7-47aa-3a4b-08da0778e95a
X-MS-Exchange-CrossTenant-AuthSource: BN7PR02MB4033.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2022 18:15:12.0227 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HMePu7wcdaNJ7XoHR6z6ZZHFzAqDpsn1j57BIVAgTbRHl+MpM4QAo0XnDcegmxJ+BIr/m78iCgAIp8YcEc4QbGegYOotVJGVA2ud0BCmiQ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4711
X-Proofpoint-ORIG-GUID: Mtle2kT7YBM2JVu74XF7OgPN__MFHx9o
X-Proofpoint-GUID: Mtle2kT7YBM2JVu74XF7OgPN__MFHx9o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-16_07,2022-03-15_01,2022-02-23_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=kshitij.suri@nutanix.com; helo=mx0b-002c1b01.pphosted.com
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
Cc: soham.ghosh@nutanix.com, thuth@redhat.com, berrange@redhat.com,
 prerna.saxena@nutanix.com, qemu-devel@nongnu.org, dgilbert@redhat.com,
 philippe.mathieu.daude@gmail.com, kraxel@redhat.com,
 prachatos.mitra@nutanix.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 16/03/22 6:55 pm, Markus Armbruster wrote:
> Kshitij Suri <kshitij.suri@nutanix.com> writes:
>
>> From: "kshitij.suri" <kshitij.suri@nutanix.com>
>>
>> Currently screendump only supports PPM format, which is un-compressed and not
>> standard. Added a "format" parameter to qemu monitor screendump capabilites
>> to support PNG image capture using libpng. The param was added in QAPI schema
>> of screendump present in ui.json along with png_save() function which converts
>> pixman_image to PNG. HMP command equivalent was also modified to support the
>> feature.
>>
>> Example usage:
>> { "execute": "screendump", "arguments": { "filename": "/tmp/image",
>> "format":"png" } }
>>
>> Resolves: https://urldefense.proofpoint.com/v2/url?u=https-3A__gitlab.com_qemu-2Dproject_qemu_-2D_issues_718&d=DwIBAg&c=s883GpUCOChKOHiocYtGcg&r=utjv19Ej9Fb0TB7_DX0o3faQ-OAm2ypPniPyqVSoj_w&m=UZZDywEeidD1LndEhKddMf_0v-jePIgMYErGImjYyvjYRJFdnv6LAHgRmZ0IpvIL&s=jc09kdvD1ULKCC9RgwWcsK6eweue3ZkyD8F9kCx5yUs&e=
>>
>> Signed-off-by: Kshitij Suri <kshitij.suri@nutanix.com>
>> ---
>> diff to v1:
>>    - Removed repeated alpha conversion operation.
>>    - Modified logic to mirror png conversion in vnc-enc-tight.c file.
>>    - Added a new CONFIG_PNG parameter for libpng support.
>>    - Changed input format to enum instead of string.
>>    - Improved error handling.
>>   hmp-commands.hx    |  11 ++---
>>   monitor/hmp-cmds.c |  19 ++++++++-
>>   qapi/ui.json       |  24 +++++++++--
>>   ui/console.c       | 102 +++++++++++++++++++++++++++++++++++++++++++--
>>   4 files changed, 144 insertions(+), 12 deletions(-)
>>
>> diff --git a/hmp-commands.hx b/hmp-commands.hx
>> index 70a9136ac2..5eda4eeb24 100644
>> --- a/hmp-commands.hx
>> +++ b/hmp-commands.hx
>> @@ -244,17 +244,18 @@ ERST
>>   
>>       {
>>           .name       = "screendump",
>> -        .args_type  = "filename:F,device:s?,head:i?",
>> -        .params     = "filename [device [head]]",
>> -        .help       = "save screen from head 'head' of display device 'device' "
>> -                      "into PPM image 'filename'",
>> +        .args_type  = "filename:F,device:s?,head:i?,format:f?",
>> +        .params     = "filename [device [head]] [format]",
>> +        .help       = "save screen from head 'head' of display device 'device'"
>> +                      "in specified format 'format' as image 'filename'."
>> +                      "Currently only 'png' and 'ppm' formats are supported.",
>>           .cmd        = hmp_screendump,
>>           .coroutine  = true,
>>       },
>>   
>>   SRST
>>   ``screendump`` *filename*
>> -  Save screen into PPM image *filename*.
>> +  Save screen as an image *filename*, with default format of PPM.
>>   ERST
>>   
>>       {
>> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
>> index 8c384dc1b2..9a640146eb 100644
>> --- a/monitor/hmp-cmds.c
>> +++ b/monitor/hmp-cmds.c
>> @@ -1677,9 +1677,26 @@ hmp_screendump(Monitor *mon, const QDict *qdict)
>>       const char *filename = qdict_get_str(qdict, "filename");
>>       const char *id = qdict_get_try_str(qdict, "device");
>>       int64_t head = qdict_get_try_int(qdict, "head", 0);
>> +    const char *input_format  = qdict_get_str(qdict, "format");
>>       Error *err = NULL;
>> +    ImageFormat format;
>>   
>> -    qmp_screendump(filename, id != NULL, id, id != NULL, head, &err);
> The second id != NULL looks wrong.  Shouldn't it be head != NULL?
> Not your patch's fault, of course.

As per hmp-commands.hx input is of format [device [head]] so maybe

works as a pair. Is it alright if I investigate and send in another patch

after this?

>
>> +    int val = qapi_enum_parse(&ImageFormat_lookup, input_format, -1, &err);
>> +    if (val < 0) {
>> +        goto end;
>> +    }
>> +
>> +    switch (val) {
>> +    case IMAGE_FORMAT_PNG:
>> +        format = IMAGE_FORMAT_PNG;
>> +        break;
>> +    default:
>> +        format = IMAGE_FORMAT_PPM;
>> +    }
>> +
>> +    qmp_screendump(filename, id != NULL, id, id != NULL, head,
>> +                   input_format != NULL, format, &err);
>> +end:
>>       hmp_handle_error(mon, err);
>>   }
> This isn't quite right.
>
> qapi_enum_parse() is awkward to use.
>
> If its second argument @input_format is null, it returns its third
> argument -1.
>
> Else, it @input_format is a valid enum string, it returns the
> enumeration value, i.e. either IMAGE_FORMAT_PPM or IMAGE_FORMAT_PNG.
>
> Else, it sets an error and returns its third argument -1.
>
> If @input_format is null, I suspect your code jumps to
> hmp_handle_error() with a null @err.  Silently does nothing.
>
> It should default to IMAGE_FORMAT_PPM instead.
>
> I think you want something like this (completely untested):
>
>      val = qapi_enum_parse(&ImageFormat_lookup, input_format,
>                            IMAGE_FORMAT_PPM, &err);
>      if (err) {
>          goto end;
>      }
>
>      qmp_screendump(filename, id != NULL, id, head != NULL, head,
>                     input_format != NULL, val, &err);
Oh okay. Will add it in the updated patch.
>
>>   
>> diff --git a/qapi/ui.json b/qapi/ui.json
>> index 9354f4c467..a6d994ba2c 100644
>> --- a/qapi/ui.json
>> +++ b/qapi/ui.json
>> @@ -73,12 +73,27 @@
>>   ##
>>   { 'command': 'expire_password', 'data': {'protocol': 'str', 'time': 'str'} }
>>   
>> +##
>> +# @ImageFormat:
>> +#
>> +# Supported image format types.
>> +#
>> +# @png: PNG format
>> +#
>> +# @ppm: PPM format
>> +#
>> +# Since: 7.0
>> +#
>> +##
>> +{ 'enum': 'ImageFormat',
>> +  'data': ['ppm', 'png'] }
>> +
>>   ##
>>   # @screendump:
>>   #
>> -# Write a PPM of the VGA screen to a file.
>> +# Write a screenshot of the VGA screen to a file.
> Let's improve this to
>
>     # Capture the contents of a screen and write it to a file.
Yes will send it in the updated patch.
>
>>   #
>> -# @filename: the path of a new PPM file to store the image
>> +# @filename: the path of a new file to store the image
>>   #
>>   # @device: ID of the display device that should be dumped. If this parameter
>>   #          is missing, the primary display will be used. (Since 2.12)
>> @@ -87,6 +102,8 @@
>>   #        parameter is missing, head #0 will be used. Also note that the head
>>   #        can only be specified in conjunction with the device ID. (Since 2.12)
>>   #
>> +# @format: image format for screendump is specified. (default: ppm) (Since 7.0)
>> +#
>>   # Returns: Nothing on success
>>   #
>>   # Since: 0.14
>> @@ -99,7 +116,8 @@
>>   #
>>   ##
>>   { 'command': 'screendump',
>> -  'data': {'filename': 'str', '*device': 'str', '*head': 'int'},
>> +  'data': {'filename': 'str', '*device': 'str', '*head': 'int',
>> +           '*format': 'ImageFormat'},
>>     'coroutine': true }
>>   
>>   ##
> [...]
>
>> @@ -327,7 +413,8 @@ static void graphic_hw_update_bh(void *con)
>>   /* Safety: coroutine-only, concurrent-coroutine safe, main thread only */
>>   void coroutine_fn
>>   qmp_screendump(const char *filename, bool has_device, const char *device,
>> -               bool has_head, int64_t head, Error **errp)
>> +               bool has_head, int64_t head, bool has_format,
>> +               ImageFormat format, Error **errp)
> Please break the line like
>
>                    bool has_head, int64_t head,
>                    bool has_format, ImageFormat format, Error **errp)
This does look better. Will update it thank you!
>
>>   {
>>       g_autoptr(pixman_image_t) image = NULL;
>>       QemuConsole *con;
>> @@ -383,8 +470,17 @@ qmp_screendump(const char *filename, bool has_device, const char *device,
>>        * yields and releases the BQL. It could produce corrupted dump, but
>>        * it should be otherwise safe.
>>        */
>> -    if (!ppm_save(fd, image, errp)) {
>> -        qemu_unlink(filename);
>> +
>> +    if (has_format && format == IMAGE_FORMAT_PNG) {
>> +        /* PNG format specified for screendump */
>> +        if (!png_save(fd, image, errp)) {
>> +            qemu_unlink(filename);
>> +        }
>> +    } else {
>> +        /* PPM format specified/default for screendump */
>> +        if (!ppm_save(fd, image, errp)) {
>> +            qemu_unlink(filename);
>> +        }
>>       }
>>   }

Thank you for your review!

Regards,
Kshitij Suri


