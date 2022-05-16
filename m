Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BF6528975
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 18:04:49 +0200 (CEST)
Received: from localhost ([::1]:40828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqdDE-0002Sp-LM
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 12:04:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1nqcbs-0002gQ-LC
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:26:12 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:55546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1nqcbp-0006Bt-OD
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:26:11 -0400
Received: from pps.filterd (m0127842.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24GAAPCn003698;
 Mon, 16 May 2022 08:26:06 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=+goQYtp0jVnohXJ6fq+uMr/tPwN5fhBqD1SQAqycIrY=;
 b=OxZu5fcu+QrdUWfQq8MqbLpybhFV1Gt9SG+PEyrxeDGiwnkSBoNnzpCTTQXcX4Zo+2oT
 lB0CNsShClgW9XEwQMmPmx3NLM2tqVLoGx2QUvR8XfwcEbBtzInt7EjDRY9I0zbOIP/2
 5y/WM16gbDChPnnszvM4Vmz/Kv2cg4FUvWA05Fdiudeg8Q+CHTV2xy6ZouvMkyYj1q7G
 B4QMJDJbOt34vpNZGNI0srhp4Fw5fMzPDCOumzD2ckZydKnSkb6nlhdY8Yqtx7D2YHle
 Micl//mrLLSeitz//GmoT5igNi+O4u7DrY2eAOD2nAbCy8d4f3JgfqoVJYgfQ8nBa97r Tw== 
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2040.outbound.protection.outlook.com [104.47.57.40])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3g2brhkkb5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 May 2022 08:26:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n+SQKzrb/uKocUTkNSp5+fhNdIrJxqDtLj+VamqARqgQAZ7BvTwIoMXbxBLCf1ewkYcfeH9wAZNCf+A+i0688xUQeZuM4dlW11BVDJo5YTrMWypbQW8+kU9fbwqo15D0e2dNb46I7CdWLw+Rulhn784e+4ZU2vvJG0Z1Z4g3HjhX7SRrsGi6cmHikCXf668B5ZKJCmRh9UNQYxLwu0WlNcD1BQgLSu2HscqWNJpbppxPi4gZygOxH69fbmgPf3PcWb1mN90is53GPY7f49hVxQ5y9LFzKaY2zdJJZjb+s379ZbmpwLBlM7+zmxpXt4t9Qn9jGwRXHO3Zd8EHYgzwAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+goQYtp0jVnohXJ6fq+uMr/tPwN5fhBqD1SQAqycIrY=;
 b=V5aYC0O+19uvPiaJeA0Ear/U834n0r8NIJmULj6ySId4+FfeX7NTMzA5/JQlRSF82zi2GNTTUQ5ees5uFG6OiePrlFfG7VUXtJyfdkCd2XWPDKBJ7VBCdZsxLfThFYp9BH7a4n3Upn88grFeQ3vt9xFfNFk+eg6/0NPLLl4CjiVjA9PVeDsSWlnfTEfTIEbmkkGy0MP2Ywr+lMobN3Q2Ala1oXqisiE7WABlyYzzpDFLTxvnnEWy3EMMnlenGgKSLzwpoZUZwqRgSn4twcmFUtGZ5HSCW50Llei0EOc1mFGbFGgUVIvVLEPcmA7a+O3B8503wioQukDqAmoKLJutSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from PH0PR02MB7384.namprd02.prod.outlook.com (2603:10b6:510:12::12)
 by DM6PR02MB5163.namprd02.prod.outlook.com (2603:10b6:5:46::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Mon, 16 May
 2022 15:26:02 +0000
Received: from PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::7ded:77cd:1553:412b]) by PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::7ded:77cd:1553:412b%5]) with mapi id 15.20.5250.018; Mon, 16 May 2022
 15:26:02 +0000
Message-ID: <aba2c7dc-2266-f594-45f4-15f8559cb370@nutanix.com>
Date: Mon, 16 May 2022 20:55:50 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v5 00/21] migration: Postcopy Preemption
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
References: <20220425233847.10393-1-peterx@redhat.com>
From: "manish.mishra" <manish.mishra@nutanix.com>
In-Reply-To: <20220425233847.10393-1-peterx@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0012.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::11) To PH0PR02MB7384.namprd02.prod.outlook.com
 (2603:10b6:510:12::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1e2c3a64-4d31-4f14-27d2-08da375062c2
X-MS-TrafficTypeDiagnostic: DM6PR02MB5163:EE_
X-Microsoft-Antispam-PRVS: <DM6PR02MB5163CC3374BFC159FD833436F6CF9@DM6PR02MB5163.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7kpvQrrAGWPpDEYoFlMWSPw4hGZdL16A39LF+PzCgs/ewdsEE0J3A7+hKwiU26kN0YpMmVoopKMeFRHAW25iYugGJ+pcdiCI4HD4t6Pf5yxHh+EYf3PLBcFf8h4qTwKdkOrgko5/vGNCu2BecZJXLmKKWz3WIibEHfMiNaQ7509w9M8MydV2gRv1Nx5jG8NchNHlPLDmLDMcgDkOTf7rw+jsgUh0SBe3NoTVBQTgy5J3vvdeyTgtsoQroI5kmj5q58zt6yKfXDy1uQ4Jdg03PruzyEeuDkmxhI20RQUXsKcm5E18JANS7ax2iBjvzB10PHxTfIHfQ3w9IrsX59RNhaCRwDj1b3l17UHZYLOLG8A4fQ72GvfISi4ldunRAd5Ld+1QlE2fNNzeQyfc9dJlFjijyr2440aYMveOmFOk4z34gl3LdfydpYhGTB+apsqSSJBoxBl2ydTsV9b3l/bGRwy3k642W/7EftGQfmwl8fCMs0+B0Z+au72FyND8DvRv6e5GFW4RmBken/aOZIRgBFJfGl3nj9ncNHSbHu/m4XF+f1OebHJ0U9f5NJmXmyylu4+K8HVri0VbW0s5BW+ly/gcYnFh5ia9KK+GW715E+Sh7cCG5b9/DAuORWxVECOLYyiG0oBP0cN25o8XwFtkAYQgeR6KSPKJUSqs9G/eMDCfTQfElMVKxYbYYB0ZvNGjaCeLGJtOkFxGw2Z1M1Z0F/3vdIyLGxJneNGoPoXlF8Fw0STKoAv+ltdtEOau4rZV5XCLCa+OzJJJjv+f6oea7kD2taRkC/b4lJUONfzDlsiO/ITDw20EsgYBhYH4LcXvse1DebnwlGChxwW/bAskbbKBXeoJVyhR+iL8aNX4/TY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7384.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(8676002)(66476007)(66556008)(66946007)(4326008)(2616005)(966005)(86362001)(31696002)(6486002)(6506007)(8936002)(53546011)(508600001)(36756003)(83380400001)(5660300002)(186003)(31686004)(54906003)(6666004)(2906002)(6512007)(316002)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bEYvdUpCdWFHV1FYRjhGQXVlS0oyRjZ3RitSeUJYcHo2L1BlUHM4NDg1dzF6?=
 =?utf-8?B?blpWRlFnUjNIam5ZZVYvY1RpcTlGSGhYSGExNC9QVWRlY29jdllNc21zbC9P?=
 =?utf-8?B?RXU1R0VGS25ndDdjWFFwejVmQ3Jiakc5UUxPeEtBY2s5M2dIQTZ0ZHdSL2NP?=
 =?utf-8?B?VjA2eHZiYk9tTGE3YVEydGFnS2Y3cU5GdEJzQVRiL29NM2VFSytJazBNSXZD?=
 =?utf-8?B?cE92U3JXYitLVDd3NWl4WFY2RG1MVUIwMW14clBsQUVHbllYMFZISXpzTVU5?=
 =?utf-8?B?cGlMcnkzV2NwWG9kTE9iVWNvWjNNS1YzcjVlQUt4ZStzeWhWZGJURzVlWnE1?=
 =?utf-8?B?ME1PRkNxSWc4aXhKZGROOUdHeWN6RDB1NllFZ3Jnc3VjTU1zZ3Z0YnVEbElr?=
 =?utf-8?B?eHZlSG1tbEgvRGd6NjJ2dTlGL1c3cFFydE9sZkRIaEFoSE5qTEFDMlNsS3p5?=
 =?utf-8?B?eEV4aEd4MEdnZWUvQzdEdE5hTUNOTHFhaWZmOEk4VFRMcm4rOFZnb0hWWmVv?=
 =?utf-8?B?emJHTUJjY1V1RTFLaDRuU3FXamxuNldjNHpReFdrNEtlcTdybWpPdXk3blBJ?=
 =?utf-8?B?bDF0aGlUbGhhbUdScVRuSnhUZmt4eHRzaHlwWENhZTBCemc3cFE1TkRLR1ZT?=
 =?utf-8?B?MnlGRVJPMUJRTFVOSUhUUFQ2eVdkRFV1eFIwT0M2a0Qwd2s3aTg4NmR1YlJ1?=
 =?utf-8?B?cy9Oejh4bkM5ODY2S1VxVkRmNjZjWVdRWnQvbTR3Q1UvTWNUYnJLNlRQbWZT?=
 =?utf-8?B?RURDNzZWV0tKdXI4N25oN0h1cGlybHVtQWRZbmVqV0V5QnlzWnZIY0dmS1Jy?=
 =?utf-8?B?U0FEM25wbFUxOHRKdUlFUWt6bG5OeFdOL0tGbU1ocnZWWEExRWZPdmZvb1pw?=
 =?utf-8?B?N1RJbEsyWHpqMXhOY3BER3Y2VVN0akFjdzhaWElPcDEvOFJ1Mml5a3dpbC9U?=
 =?utf-8?B?SWtvRGJRUUlFSFJJekd5VEs1QllPREZ2YVhNUHhsM2IrQTVNZjFIbm91S0RH?=
 =?utf-8?B?RHduY1JhRzhWcE5lNXdMOTZHN3ZubE1OSEpXWjRJclBQRDNnQTZtVllTTXg1?=
 =?utf-8?B?aHFQRTVtRlM2RHFZY1lRUmt1dVpGM1Avdm15MEJXSnFEaDBzZ0VFQWJGOHk4?=
 =?utf-8?B?T051T3RLWUYwa1UzRk1zcCtwaldwUGhJYmt3WW8xNkZlcWN0SzR4VGU2bGht?=
 =?utf-8?B?ME9NdkhUbDV1VEw2N0lLSEc0bVZoQVdHUWJtWk9hRGR1ZWQzd2dhK2o3V2hx?=
 =?utf-8?B?S1oydy94NjJtZ2RsUEZ0UGV5anJJalN0LzBTRnBtaUh3ZTFSVFE4dmtyYkJi?=
 =?utf-8?B?MFFvdENZUGZuVW0wdG5vUzRuS2FsWWxTWE9oNlFWOVMyMDJPUjBaNHJpeU1J?=
 =?utf-8?B?R1NjcGxCMGhMb0dZNFgxQVNrOHU5bWZITGsyekhNSUw0eUYyL2kyd0E2b3ZE?=
 =?utf-8?B?ZnRDWDBWV3JVQ3FEME11eWpVamd2eXhRV2diaW1FODJMSm0razBhdiszWnRz?=
 =?utf-8?B?WkxJdXB3Z2hHOEFpeDNtcVo4VVBVZytaZlhKMHptOERnSzNrNGNoRW9GZy9j?=
 =?utf-8?B?c2hEa09NaUJ3dHVCb0M0a0hUT3BCdDNVekpoY1JXRTZncXdUeVA0OTV1d3E4?=
 =?utf-8?B?OS9TR3hqVlJkQWVib2NrL3lBS1V2cmZSRDBpNmNuL3dKUnE2YVNmajFMOEZP?=
 =?utf-8?B?SUFEQ2dyRGlkelpqQTZsR1hEY1F0dXJFQzZUeHBCR0FOSmtJK0JoeUFvYXhH?=
 =?utf-8?B?WkhBVmtsYVdFNHdzdXZ2TFd5ZTdueDFWclh0eHJlL1ZpSXhidUsrL2FsNG54?=
 =?utf-8?B?REhtbys0ZTJXUDJKYnNrVE5oTzR5ZTRQWUJIZTRxODZ6VTRzd01LZWJmYWNI?=
 =?utf-8?B?cU5pZlV2VWJKaHNTOUxxb0dCdS92ekczb2VoOUhjanZ3Zy91Vi9UM2RMaysr?=
 =?utf-8?B?Z2JOR0ZrNVhhTUpPakk5QzZOWE80cE9OME1pejFtWXFWTnc0NkFVb054b3E1?=
 =?utf-8?B?T2xhbCszU1VsL1N3WW0xNlNZV0FWZ1JrNWVvSGhBWEJSUEJ1MDc0bWk5L3NY?=
 =?utf-8?B?U1lnVDUxMlozSUg2YUx0eTI5TWtld28wa3N4MTUwQkZReDVRZTIyOHFsb29q?=
 =?utf-8?B?VlY3ZVB5bS9tV2hOTzJ2cFhIbFlJWVVzdHlmQ0ttU1JxK0I2Nkw3TVA0U1FP?=
 =?utf-8?B?cjZ5TnFid1dpcHRlUTBhWU03aG82UjRDVUN4TkVZc0lNMnNpOG5scm9lVnRj?=
 =?utf-8?B?KzVCTzN6cFcxci8vbU0yNWo0Wk5aYkl6ejhhbGgrYmEwOGFVakRhZnhjbURU?=
 =?utf-8?B?T1lDS2MzVVB2RjJpbWNpNkRFa3cxMjcxanJLdVR3TjRLYi9UL05nbnJlQWtj?=
 =?utf-8?Q?8ukuj9iBd7+KIV7kYpAiM9E5HZlNg4wI3Pe8yQoxaPIsz?=
X-MS-Exchange-AntiSpam-MessageData-1: Fe/YeB5720Yhz9WaSAoUrmEENZJlPq1LY5A=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e2c3a64-4d31-4f14-27d2-08da375062c2
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7384.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2022 15:26:02.3129 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uS1zUlkXPEpFQLNgpeQXF7N+O934MszKLUNpR9T8UOV9QVlv7OwgALb6kn1flt/jndF+KoMNdErFxPg+ITk+mP6wlxEOWIfF8twWFuFy2i0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB5163
X-Proofpoint-ORIG-GUID: cgoP2l4T9Z2Ltdf2TiAakO1Rt6-gfsUi
X-Proofpoint-GUID: cgoP2l4T9Z2Ltdf2TiAakO1Rt6-gfsUi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-16_14,2022-05-16_02,2022-02-23_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=manish.mishra@nutanix.com; helo=mx0b-002c1b01.pphosted.com
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


On 26/04/22 5:08 am, Peter Xu wrote:
> This is v5 of postcopy preempt series.  It can also be found here:
>
>    https://github.com/xzpeter/qemu/tree/postcopy-preempt
>
> RFC: https://lore.kernel.org/qemu-devel/20220119080929.39485-1-peterx@redhat.com
> V1:  https://lore.kernel.org/qemu-devel/20220216062809.57179-1-peterx@redhat.com
> V2:  https://lore.kernel.org/qemu-devel/20220301083925.33483-1-peterx@redhat.com
> V3:  https://lore.kernel.org/qemu-devel/20220330213908.26608-1-peterx@redhat.com
> V4:  https://lore.kernel.org/qemu-devel/20220331150857.74406-1-peterx@redhat.com
>
> v4->v5 changelog:
> - Fixed all checkpatch.pl warnings
> - Picked up leftover patches from Dan's tls test case series:
>    https://lore.kernel.org/qemu-devel/20220310171821.3724080-1-berrange@redhat.com/
> - Rebased to v7.0.0 tag, collected more R-bs from Dave/Dan
> - In migrate_fd_cleanup(), use g_clear_pointer() for s->hostname [Dan]
> - Mark postcopy-preempt capability for 7.1 not 7.0 [Dan]
> - Moved migrate_channel_requires_tls() into tls.[ch] [Dan]
> - Mention the bug-fixing side effect of patch "migration: Export
>    tls-[creds|hostname|authz] params to cmdline too" on tls_authz [Dan]
> - Use g_autoptr where proper [Dan]
> - Drop a few (probably over-cautious) asserts on local_err being set [Dan]
> - Quite a few renamings in the qtest in the last few test patches [Dan]
>
> Abstract
> ========
>
> This series contains two parts now:
>
>    (1) Leftover patches from Dan's tls unit tests v2, which is first half
>    (2) Leftover patches from my postcopy preempt v4, which is second half
>
> This series added a new migration capability called "postcopy-preempt".  It can
> be enabled when postcopy is enabled, and it'll simply (but greatly) speed up
> postcopy page requests handling process.
>
> Below are some initial postcopy page request latency measurements after the
> new series applied.
>
> For each page size, I measured page request latency for three cases:
>
>    (a) Vanilla:                the old postcopy
>    (b) Preempt no-break-huge:  preempt enabled, x-postcopy-preempt-break-huge=off
>    (c) Preempt full:           preempt enabled, x-postcopy-preempt-break-huge=on
>                                (this is the default option when preempt enabled)
>
> Here x-postcopy-preempt-break-huge parameter is just added in v2 so as to
> conditionally disable the behavior to break sending a precopy huge page for
> debugging purpose.  So when it's off, postcopy will not preempt precopy
> sending a huge page, but still postcopy will use its own channel.
>
> I tested it separately to give a rough idea on which part of the change
> helped how much of it.  The overall benefit should be the comparison
> between case (a) and (c).
>
>    |-----------+---------+-----------------------+--------------|
>    | Page size | Vanilla | Preempt no-break-huge | Preempt full |
>    |-----------+---------+-----------------------+--------------|
>    | 4K        |   10.68 |               N/A [*] |         0.57 |
>    | 2M        |   10.58 |                  5.49 |         5.02 |
>    | 1G        | 2046.65 |               933.185 |      649.445 |
>    |-----------+---------+-----------------------+--------------|
>    [*]: This case is N/A because 4K page does not contain huge page at all
>
> [1] https://github.com/xzpeter/small-stuffs/blob/master/tools/huge_vm/uffd-latency.bpf

Hi Peter, Just wanted understand what setup was used for these experiments like

number of vcpu, workload, network bandwidth so that i can make sense of these

numbers. Also i could not understand reason for so much difference between preempt

full and Preempt no-break-huge especially for 1G case, so if you please share little more

details on this.

>
> TODO List
> =========
>
> Avoid precopy write() blocks postcopy
> -------------------------------------
>
> I didn't prove this, but I always think the write() syscalls being blocked
> for precopy pages can affect postcopy services.  If we can solve this
> problem then my wild guess is we can further reduce the average page
> latency.
>
> Two solutions at least in mind: (1) we could have made the write side of
> the migration channel NON_BLOCK too, or (2) multi-threads on send side,
> just like multifd, but we may use lock to protect which page to send too
> (e.g., the core idea is we should _never_ rely anything on the main thread,
> multifd has that dependency on queuing pages only on main thread).
>
> That can definitely be done and thought about later.
>
> Multi-channel for preemption threads
> ------------------------------------
>
> Currently the postcopy preempt feature use only one extra channel and one
> extra thread on dest (no new thread on src QEMU).  It should be mostly good
> enough for major use cases, but when the postcopy queue is long enough
> (e.g. hundreds of vCPUs faulted on different pages) logically we could
> still observe more delays in average.  Whether growing threads/channels can
> solve it is debatable, but sounds worthwhile a try.  That's yet another
> thing we can think about after this patchset lands.
>
> Logically the design provides space for that - the receiving postcopy
> preempt thread can understand all ram-layer migration protocol, and for
> multi channel and multi threads we could simply grow that into multile
> threads handling the same protocol (with multiple PostcopyTmpPage).  The
> source needs more thoughts on synchronizations, though, but it shouldn't
> affect the whole protocol layer, so should be easy to keep compatible.
>
> Please review, thanks.
>
> Daniel P. Berrangé (9):
>    tests: fix encoding of IP addresses in x509 certs
>    tests: add more helper macros for creating TLS x509 certs
>    tests: add migration tests of TLS with PSK credentials
>    tests: add migration tests of TLS with x509 credentials
>    tests: convert XBZRLE migration test to use common helper
>    tests: convert multifd migration tests to use common helper
>    tests: add multifd migration tests of TLS with PSK credentials
>    tests: add multifd migration tests of TLS with x509 credentials
>    tests: ensure migration status isn't reported as failed
>
> Peter Xu (12):
>    migration: Add postcopy-preempt capability
>    migration: Postcopy preemption preparation on channel creation
>    migration: Postcopy preemption enablement
>    migration: Postcopy recover with preempt enabled
>    migration: Create the postcopy preempt channel asynchronously
>    migration: Parameter x-postcopy-preempt-break-huge
>    migration: Add helpers to detect TLS capability
>    migration: Export tls-[creds|hostname|authz] params to cmdline too
>    migration: Enable TLS for preempt channel
>    tests: Add postcopy tls migration test
>    tests: Add postcopy tls recovery migration test
>    tests: Add postcopy preempt tests
>
>   meson.build                          |   1 +
>   migration/channel.c                  |  10 +-
>   migration/migration.c                | 146 +++-
>   migration/migration.h                |  46 +-
>   migration/multifd.c                  |   7 +-
>   migration/postcopy-ram.c             | 186 ++++-
>   migration/postcopy-ram.h             |  11 +
>   migration/qemu-file.c                |  27 +
>   migration/qemu-file.h                |   1 +
>   migration/ram.c                      | 283 +++++++-
>   migration/ram.h                      |   4 +-
>   migration/savevm.c                   |  46 +-
>   migration/socket.c                   |  22 +-
>   migration/socket.h                   |   1 +
>   migration/tls.c                      |   9 +
>   migration/tls.h                      |   4 +
>   migration/trace-events               |  15 +-
>   qapi/migration.json                  |   8 +-
>   tests/qtest/meson.build              |  12 +-
>   tests/qtest/migration-helpers.c      |  13 +
>   tests/qtest/migration-helpers.h      |   1 +
>   tests/qtest/migration-test.c         | 997 ++++++++++++++++++++++++---
>   tests/unit/crypto-tls-psk-helpers.c  |  18 +-
>   tests/unit/crypto-tls-psk-helpers.h  |   1 +
>   tests/unit/crypto-tls-x509-helpers.c |  16 +-
>   tests/unit/crypto-tls-x509-helpers.h |  53 ++
>   tests/unit/test-crypto-tlssession.c  |  11 +-
>   27 files changed, 1779 insertions(+), 170 deletions(-)
>

