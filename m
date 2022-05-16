Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7B0528ABC
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 18:41:23 +0200 (CEST)
Received: from localhost ([::1]:48260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqdmd-0007I4-1P
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 12:41:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1nqci4-0006nz-RK
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:32:36 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:6876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1nqci1-0007Mw-HT
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:32:35 -0400
Received: from pps.filterd (m0127840.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24GA9tKp023318;
 Mon, 16 May 2022 08:32:31 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=content-type :
 message-id : date : subject : from : to : cc : references : in-reply-to :
 mime-version; s=proofpoint20171006;
 bh=4WRRsr6rNTTp0lsFTK3LMS2sG6hD883/6pg73ELyirQ=;
 b=DrHCceTN3JIDm/BE2AliZq+1l+Lwh0upUurQABLcyigAbTL8NnafiLRGn/QtCK957Pnz
 fRPZUEKO8sdmVI8a8e/WtgjKD2CH1doKzqhbkap7c2CF9m2hEwf/LoHqhen8tCY8b84i
 esWbLOoIDyyhRc8Bwoj6eplId5fLepDcwsKiNAms4mIIJr/qSOzqqGmXTRi/smlDFTj0
 j1mRiFkbPM2vlf3cupZBNnSP+7H14WZZtmfoz3DqfzGo9Uzqcmq5cNwgeRM1b9N2tNRn
 LZRk+lhLeKx5wLHBJ+RbByTmY0r/N41vYz4cIyTzsIF4cyW7hci/aZ36KX+FzkmEt752 +g== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3g28ruksr5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 May 2022 08:32:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=huESr+8HgY+XgOut8VKZ3gri/KlYkXsDezw6RSpui35WiB/Wpjm81Ea4UOp32NCZCcudKl96aSu0pcAGNsL+A+LWY4L53I2wJUfEXiQ40lbpxfaMDJP+UIhj3YoSAM+v4xu3gNt/sLYcWsp1yR/2DVLsIOpCm0/fFiGICUWj8rLvqDd+1g7WQ88OcrZk3tZXehnFcsurIj9ZBLzeAwZlZMpWnZF+gzxuBFqSoS9WdDC6N0Nas1JmcSkFoDIyT62ZOWgYqapwbGccpTpp9WIdlCxVDG+3xxp48wBl3DZuVVsxFUQ8m6boGmnMYs/pdGzPXOUQSnc8GmwEYvzhVbjgDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4WRRsr6rNTTp0lsFTK3LMS2sG6hD883/6pg73ELyirQ=;
 b=JVxG4DGjtmEIKOQx+xRocmoBcgQ3q5L0DZhpUJR5397re9RF1P1yQe2r3SCu3l6SiJKFerZZFVN/LqDK5qbZfAXvO8c+XV3r30nXbRgGl8yK1II2zv1n9w7Tc5t2c9p3orRcskwB3EOcWKyZOgNCHFpW3Nb2cl8IOYQ6fIjxUekQhI4iqRlhKg2pC4DfWiQ7WSton2cMj/hxoQIAllnqTlW36BlZbBwHGm4BfADOXe4O8/2W9LbMj88NwV0rgb8nZg1sZAmGAIKU/Trq0dK12YeWlMEG9lbK7xqQNEdWVTkTZtAEtAAm7eej+o7F9bF3KFMarpy6l4TQ7BpTV65vwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from PH0PR02MB7384.namprd02.prod.outlook.com (2603:10b6:510:12::12)
 by SN6PR02MB5664.namprd02.prod.outlook.com (2603:10b6:805:e7::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.16; Mon, 16 May
 2022 15:32:28 +0000
Received: from PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::7ded:77cd:1553:412b]) by PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::7ded:77cd:1553:412b%5]) with mapi id 15.20.5250.018; Mon, 16 May 2022
 15:32:27 +0000
Content-Type: multipart/alternative;
 boundary="------------3CURzpLvasBtWD3iCk4wkPMM"
Message-ID: <a2853510-bf69-a415-31f5-fd54c68fbf57@nutanix.com>
Date: Mon, 16 May 2022 21:02:16 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v5 13/21] migration: Postcopy recover with preempt enabled
From: "manish.mishra" <manish.mishra@nutanix.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Leonardo Bras Soares Passos <lsoaresp@redhat.com>, 
 "Daniel P . Berrange" <berrange@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
References: <20220425233847.10393-1-peterx@redhat.com>
 <20220425233847.10393-14-peterx@redhat.com>
 <922cf9fc-e15d-ad86-ba95-05aabbb00f5f@nutanix.com>
 <YoJboZoJdPwWpeFe@xz-m1.local>
 <85b85303-e4e8-77be-c65d-76018ac7704c@nutanix.com>
In-Reply-To: <85b85303-e4e8-77be-c65d-76018ac7704c@nutanix.com>
X-ClientProxiedBy: MA0PR01CA0029.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::11) To PH0PR02MB7384.namprd02.prod.outlook.com
 (2603:10b6:510:12::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 64d9fc68-6689-41a7-7a04-08da375148b7
X-MS-TrafficTypeDiagnostic: SN6PR02MB5664:EE_
X-Microsoft-Antispam-PRVS: <SN6PR02MB5664A74766DE72913F35FB0EF6CF9@SN6PR02MB5664.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yBClr5Eaa0KJKtCNfaue4/6KY8igeP/Jx1jb+6rFcXz7Hk0BxJbX055oBlGqy6RR2y3lB5lCzY6ucuv/vPzoUN6QXdSp2aNsKtRGygjyiwlaXp2kvfwCv+xUE6rYoZa3067tvMAPFCLG5CHWODvxIBFeavvSbMlSLdXukAntCmalYJfQR+7hXCbZwyprt+c+j76Tjb+yDlCULi+HWwLQp/j/2Kk/VNqaDQNoP5t//tx5yWdc/R4K0ni0uK5lfHli/B7/RpeAlLHXoOHx0UTlmxAMhp7c5sGwo3iV6mHqils12n24SbBDuL9miElLitvOzdaaZlda4SCDmruFXTECrubm9zLhtBLnfB6RcpuD95GpJ2p+y93b4L2p1tafLAxA+irktjcxvXZb/4Glbij0J7x+u+xSSPIZoZfCAy7d2WrDkoafAJ1twf2zYTV4rDP1Er+M3qGzlWCGW1WUglkFAWVqqxbHNA3Pn1eWYEgVRn/fAS0RfihiEaRcRGkyzUjDWYIQVA0vGd/PZE3qdfvFZbAhg8cQKZyKAKLtR9vFm3BcDlHH7tn6qcb7qd5KPuqAqF4ySXfOi1YnQtOIsmaRw5MxJ/ZAepU9nTw1LGobuAXLPFR6t75oqGnaya5qDSEq2CBp0iH+nop1ZUJf5A/x0PvhWWMuRXuxtqmw8M6YiLQiubiSGMh/kExPuftyBs8qPW5CXN/s7Qk8kvCI56R72HwgvT2m+g7zl2BrujkUcB4U5TqRkL8JgX3ffl/XewJguUog4ti2BTPY1ts8k4NbJC5yHW5VVmBGHkhrIjm9ok2YAMt02vVuTuyI2cUhUamg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7384.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(166002)(2616005)(8676002)(4326008)(38100700002)(5660300002)(186003)(66476007)(66946007)(66556008)(31686004)(2906002)(36756003)(6486002)(6916009)(31696002)(6506007)(53546011)(33964004)(966005)(508600001)(6512007)(316002)(86362001)(83380400001)(6666004)(54906003)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGRNWEg2cFVkY1BNVUhWMnU0anB5WHdBcm41T2ZhQ2ZpeVFPMEJ0M3Mzem5m?=
 =?utf-8?B?MEZMNFdKY2RhTDdqR2MvcVdqTXlITmVQUWlBNDVDcElQdXYrZWY2WXJsTUwx?=
 =?utf-8?B?SUg4RDRhTVZEN3ducVFLb2p6eCtYYWUzak9kUU1uSFluMEt3LzBtaWx0d2l0?=
 =?utf-8?B?MExkRktPY3lCYVVDUnQrV1QyN2FYVGtuTzExeDZhMms4Y0JpR0laak1EWC9k?=
 =?utf-8?B?T25oSXhPMHNXUTFJeEZadWRMV0dnR01sazBadTdEM3p1ajA0cGN3elFqVFha?=
 =?utf-8?B?N3VodjFBbEh0NS81UEVwWDJEVTVWNDM0UnhZRHJ5T2p0ZW9vYkQwd3orbHFX?=
 =?utf-8?B?TzF2OU9nYi8ya0lhZXFURUJmMUpWRXBBcFNEUGRRMW1TNzhENW5rdE1STEd6?=
 =?utf-8?B?NHo0RlpQM01JcnluaG8vdCt3bS9Tb05wc3llUzhacjBGbXZmS0dXWmNHRGcv?=
 =?utf-8?B?VWxTc1hQMUlXNWp2U2x4WUdzK2ZsMzVxRUFOTGhsYkpMMEhUWU9OdWRoOVR6?=
 =?utf-8?B?SVhEV3U3U1V2eG5wUyt0YnNUUUsyVi91bVFWcUMzRzVQSkkzRGtnWXRWc3lU?=
 =?utf-8?B?bncxdUFzNndWbGZKTi90c251UWJsc1o4VkVxSFNncGdTbWt2T1VZSUZLR21U?=
 =?utf-8?B?bkF0MUpiV1ZaeVRkWXRvM29kalBrZTgvc3dmcTBxbGIzNkdoQUNZajlOYk1m?=
 =?utf-8?B?MXZxSDAvYzNSaHZQMDJBem1nU1BESE83R3oxby80VHFCUGV5bnU3Ukt1REpl?=
 =?utf-8?B?TFVBMys0eEVoclNJZWxWQUhBVVkzZFppVG1Nd2YwZG9hRFdiVEF1V0UxcTNO?=
 =?utf-8?B?M3IvSEFYZVg3cEJidzZTcVQrV015WHlmdjlNaFh0b05pd2UyUHRGY3Z2aENm?=
 =?utf-8?B?SytyQ2VnblNRTXc1RDY3eUZZeDJGM2Zyb1lLaU5FOVRtR0dlVFY0UGcxOVJj?=
 =?utf-8?B?eVNmd2ZiU0J0TnFHWXpKQzV4cU91elUxMDJ0RjViYWNXemMzV29UbE90N1FB?=
 =?utf-8?B?cWI5L2hWMzhyUXZReWNhZ3liR0dna2MzM29vUVNScGtKeTlncGw1VUVocG5D?=
 =?utf-8?B?bHprOU1yRllNMmJKL1FWRmJ0bmRYdGsveGRjMzkyLzJuUy9ETytkalFKU3dM?=
 =?utf-8?B?clhZUndhU3YwOWRBc0dZZlJxL0xFRFVpbnpPazljY2lnV1RCbFBsVmxBSGFQ?=
 =?utf-8?B?M1pyek1qSmNPN3UreGNKNDFHQmdnS3l1OVdIRUdTWWpRRUkrc3NxcEY0ajFZ?=
 =?utf-8?B?MDVBMVoxWHArQmNIdnRvNmRjaTljOGhCNW5rZVZ4YktsK2RXNW9FVW5xeDRT?=
 =?utf-8?B?c0h2blpzT3c0YUwzSDNHbEpBYWo4a3ViWWNOcjF5bklaYStQZTR1amF5cE5K?=
 =?utf-8?B?bThRWGpGMXNMRmVCeU1tVjhvc2lYbXVUS1BzNnk3VWxzLzZsRjMzVHJxYU9w?=
 =?utf-8?B?RHhUSzF6OGpjUWY2M3hQREFCRlFoMHlOdFhYaVdRanN3L1JNTjdtMk5oaFdw?=
 =?utf-8?B?cWwyQmIyRENBTE5vVHB3QVk1VU1yZlBJamRobUNRdXZSbnlTaVJTamd6M3Qz?=
 =?utf-8?B?S3dIUUhZWkZtRm5GMVVETHZ6aVZTQXEyOEppL3JFM3hENEJhNkVwdko5Mi85?=
 =?utf-8?B?NGc1S3RxamNzaFVGNi9icER5Vi9ZbVJYZ1FKSEdFTmJuZUlsUTJ6bmd3YWNs?=
 =?utf-8?B?ekt0ckZndTR2STVuL2kvTXU1NnFJWmc0U2lzamUxYkpRQ0I3bzVYdWRONHYx?=
 =?utf-8?B?dm5nMEEvdnlBc3hLOGo5VGJxZmp2azhVelo5dnM4MzVWbU9jUmlFT3JMMzY0?=
 =?utf-8?B?V0Z4SHQ2MTQ0d2lrcnA4UmRydjF2VVd6N0xhY1dYaVV5clNyNmRLdEkybTJK?=
 =?utf-8?B?R0c5T21NL29kTk1zMU50ODZwazFONGxmTVdBRGc1d0Y1bTduSVlSTGhMRVo0?=
 =?utf-8?B?L2MxSU9ldTZaNXA2a3hNRUxqcXBvSG4rOGhlaHpEa2lGUUJnNVFoRTZHb2tp?=
 =?utf-8?B?RzJVTEs4YnJZcENPU3c4RlRaam01OUtuL1lQYTBqNk9pSVZuQ3VPeHFFblF3?=
 =?utf-8?B?RWJoSmFtSmtNQ2JvcVpBVzlqS3RBV0taZjdJWkkrRmlQUC81WEZWbHR0YmhZ?=
 =?utf-8?B?ZzhLb0RadW9mUXcrdkVDek5mdFRaeG5YOUhYVWJmSmNadFJLSHgxRTQvNzVK?=
 =?utf-8?B?TEpJbVNsZUFBNlMwdzJNWWltNEd6USttY2tZTFJISDJTVjVLYjRCWEUyazBj?=
 =?utf-8?B?YXBhV2pvUEVaaEQvK1BhMDBQcDNUYjh1UnI0UVhHY1N4WGNJSmJWQkJFZVRS?=
 =?utf-8?B?SWQrVzhuY2o0MGJlUlloV3dTc1ZuTEFrYjlycm1lTWMzMXEwSTJVNXBCcGZy?=
 =?utf-8?Q?rYoe2DERu3NOX88JpPdR5Po8UETF8rfWNDxzGSZUX53aB?=
X-MS-Exchange-AntiSpam-MessageData-1: 0uAkqjCSb5KeaizmBevSoOGO8mCDjAB17/M=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64d9fc68-6689-41a7-7a04-08da375148b7
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7384.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2022 15:32:27.8990 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Trlw0V4bZRkBB+ppLQ1lFAf2pxkHUXYXXlxTGS7m8bGdbmr7+TEJAES7PH40sWi89ScFy3o9f0oDlww+luH40Vx0/KKDp8cgm8MZK9yAR7w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB5664
X-Proofpoint-GUID: VkqfBK_bre6KooFjxUYkcZ374SO7NogB
X-Proofpoint-ORIG-GUID: VkqfBK_bre6KooFjxUYkcZ374SO7NogB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-16_14,2022-05-16_02,2022-02-23_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=manish.mishra@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

--------------3CURzpLvasBtWD3iCk4wkPMM
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 16/05/22 8:21 pm, manish.mishra wrote:
>
>
> On 16/05/22 7:41 pm, Peter Xu wrote:
>> Hi, Manish,
>>
>> On Mon, May 16, 2022 at 07:01:35PM +0530, manish.mishra wrote:
>>> On 26/04/22 5:08 am, Peter Xu wrote:
>>> LGTM,
>>> Peter, I wanted to give review-tag for this and ealier patch too. I am new
>>> to qemu
>>> review process so not sure how give review-tag, did not find any reference
>>> on
>>> google too. So if you please let me know how to do it.
>> It's here:
>>
>> https://urldefense.proofpoint.com/v2/url?u=https-3A__git.qemu.org_-3Fp-3Dqemu.git-3Ba-3Dblob-3Bf-3Ddocs_devel_submitting-2Da-2Dpatch.rst-3Bhb-3DHEAD-23l492&d=DwIBaQ&c=s883GpUCOChKOHiocYtGcg&r=c4KON2DiMd-szjwjggQcuUvTsPWblztAL0gVzaHnNmc&m=8LU6rphEJ5GMSXEpSxe8JZ_hpn6TQDUXfjWM6Vt7DdShxnU3X5zYXbAMBLPYchdK&s=TUNUCtdl7LWhrdlfnIx1F08kC0d9IMvArl6cNMpfXkc&e=  
>>
>> Since afaict QEMU is mostly following what Linux does, you can also
>> reference to this one with more context:
>>
>> https://urldefense.proofpoint.com/v2/url?u=https-3A__www.kernel.org_doc_html_v4.17_process_submitting-2Dpatches.html-23using-2Dreported-2Dby-2Dtested-2Dby-2Dreviewed-2Dby-2Dsuggested-2Dby-2Dand-2Dfixes&d=DwIBaQ&c=s883GpUCOChKOHiocYtGcg&r=c4KON2DiMd-szjwjggQcuUvTsPWblztAL0gVzaHnNmc&m=8LU6rphEJ5GMSXEpSxe8JZ_hpn6TQDUXfjWM6Vt7DdShxnU3X5zYXbAMBLPYchdK&s=TJmr_eC4LAccVY1EqgkLleXfJhUgtIjTJmLc3cedYr0&e=  
>>
>> But since you're still having question regarding this patch, no rush on
>> providing your R-bs; let's finish the discussion first.
>>
>> [...]
>>
>>>> +static void postcopy_pause_ram_fast_load(MigrationIncomingState *mis)
>>>> +{
>>>> +    trace_postcopy_pause_fast_load();
>>>> +    qemu_mutex_unlock(&mis->postcopy_prio_thread_mutex);
>>> I may have misunderstood synchronisation here but very very rare chance,
>>>
>>> as both threads are working independently is it possible qemu_sem_post on
>>>
>>> postcopy_pause_sem_fast_load is called by main thread even before we go
>>>
>>> to qemu_sem_wait in next line, causing some kind of deadlock. That's should
>>>
>>> not be possible as i understand it requires manually calling
>>> qmp_migration_recover
>>>
>>> so chances are almost impossible. Just wanted to confirm it.
>> Sorry I don't quite get the question, could you elaborate?  E.g., when the
>> described deadlock happened, what is both main thread and preempt load
>> thread doing?  What are they waiting at?
>>
>> Note: we have already released mutex before waiting on sem.
>
> What i meant here is deadlock could be due the reason that we infinately wait
>
> on qemu_sem_wait(&mis->postcopy_pause_sem_fast_load), because main
>
> thread already called post on postcopy_pause_sem_fast_load after recovery
>
> even before we moved to qemu_sem_wait(&mis->postcopy_pause_sem_fast_load)
>
> in next line. Basically if we miss a post on postcopy_pause_sem_fast_load.
>
> This is nearly impossibily case becuase it requires full recovery path to be completed
>
> before this thread executes just next line. Also as recovery needs to be called manually,
>
> So please ignore this.
>
> Basically i wanted to check if we should use something like
>
> int pthread_cond_wait(pthread_cond_t *restrict cond,
>                     pthread_mutex_t *restrict mutex);
>
> so that there is no race between releasing mutex and calling wait.
>
Really sorry, please ignore this it is sem_post and sem_wait so that is not possible.
>
>>>> +    qemu_sem_wait(&mis->postcopy_pause_sem_fast_load);
>>> Just wanted to confirm why postcopy_pause_incoming is not called here
>>> itself.
>> postcopy_pause_incoming() is only used in the main ram load thread, while
>> this function (postcopy_pause_ram_fast_load) is only called by the preempt
>> load thread.
>>
> ok got it, thanks Peter, i meant if we should close both the channels as soon
>
> as we relise there is some failure instead of main thread waiting for error event
>
> and then closing and pausing post-copy. But agree current approach is good.
>
>>> Is it based on assumption that if there is error in any of the channel it
>>> will
>>>
>>> eventually be paused on source side, closing both channels, resulting
>>>
>>> postcopy_pause_incoming will be called from main thread on destination?
>> Yes.
>>
>>> Usually it should be good to call as early as possible. It is left to main
>>>
>>> thread default path so that we do not have any synchronisation overhead?
>> What's the sync overhead you mentioned? What we want to do here is simply
>> to put all the dest QEMU migration threads into a halted state rather than
>> quitting, so that they can be continued when necessary.
>>
>>> Also Peter, i was trying to understand postcopy recovery model so is use
>>> case
>>>
>>> of qmp_migrate_pause just for debugging purpose?
>> Yes.  It's also a way to cleanly stop using the network (comparing to force
>> unplug the nic ports?) for whatever reason with a shutdown() syscall upon
>> the socket.  I just don't know whether there's any real use case of that in
>> reality.
>>
>> Thanks,
>>
--------------3CURzpLvasBtWD3iCk4wkPMM
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 16/05/22 8:21 pm, manish.mishra
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:85b85303-e4e8-77be-c65d-76018ac7704c@nutanix.com">
      
      <p><br>
      </p>
      <div class="moz-cite-prefix">On 16/05/22 7:41 pm, Peter Xu wrote:<br>
      </div>
      <blockquote type="cite" cite="mid:YoJboZoJdPwWpeFe@xz-m1.local">
        <pre class="moz-quote-pre" wrap="">Hi, Manish,

On Mon, May 16, 2022 at 07:01:35PM +0530, manish.mishra wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">On 26/04/22 5:08 am, Peter Xu wrote:
LGTM,
Peter, I wanted to give review-tag for this and ealier patch too. I am new
to qemu
review process so not sure how give review-tag, did not find any reference
on
google too. So if you please let me know how to do it.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">It's here:

<a class="moz-txt-link-freetext" href="https://urldefense.proofpoint.com/v2/url?u=https-3A__git.qemu.org_-3Fp-3Dqemu.git-3Ba-3Dblob-3Bf-3Ddocs_devel_submitting-2Da-2Dpatch.rst-3Bhb-3DHEAD-23l492&amp;d=DwIBaQ&amp;c=s883GpUCOChKOHiocYtGcg&amp;r=c4KON2DiMd-szjwjggQcuUvTsPWblztAL0gVzaHnNmc&amp;m=8LU6rphEJ5GMSXEpSxe8JZ_hpn6TQDUXfjWM6Vt7DdShxnU3X5zYXbAMBLPYchdK&amp;s=TUNUCtdl7LWhrdlfnIx1F08kC0d9IMvArl6cNMpfXkc&amp;e=" moz-do-not-send="true">https://urldefense.proofpoint.com/v2/url?u=https-3A__git.qemu.org_-3Fp-3Dqemu.git-3Ba-3Dblob-3Bf-3Ddocs_devel_submitting-2Da-2Dpatch.rst-3Bhb-3DHEAD-23l492&amp;d=DwIBaQ&amp;c=s883GpUCOChKOHiocYtGcg&amp;r=c4KON2DiMd-szjwjggQcuUvTsPWblztAL0gVzaHnNmc&amp;m=8LU6rphEJ5GMSXEpSxe8JZ_hpn6TQDUXfjWM6Vt7DdShxnU3X5zYXbAMBLPYchdK&amp;s=TUNUCtdl7LWhrdlfnIx1F08kC0d9IMvArl6cNMpfXkc&amp;e=</a> 

Since afaict QEMU is mostly following what Linux does, you can also
reference to this one with more context:

<a class="moz-txt-link-freetext" href="https://urldefense.proofpoint.com/v2/url?u=https-3A__www.kernel.org_doc_html_v4.17_process_submitting-2Dpatches.html-23using-2Dreported-2Dby-2Dtested-2Dby-2Dreviewed-2Dby-2Dsuggested-2Dby-2Dand-2Dfixes&amp;d=DwIBaQ&amp;c=s883GpUCOChKOHiocYtGcg&amp;r=c4KON2DiMd-szjwjggQcuUvTsPWblztAL0gVzaHnNmc&amp;m=8LU6rphEJ5GMSXEpSxe8JZ_hpn6TQDUXfjWM6Vt7DdShxnU3X5zYXbAMBLPYchdK&amp;s=TJmr_eC4LAccVY1EqgkLleXfJhUgtIjTJmLc3cedYr0&amp;e=" moz-do-not-send="true">https://urldefense.proofpoint.com/v2/url?u=https-3A__www.kernel.org_doc_html_v4.17_process_submitting-2Dpatches.html-23using-2Dreported-2Dby-2Dtested-2Dby-2Dreviewed-2Dby-2Dsuggested-2Dby-2Dand-2Dfixes&amp;d=DwIBaQ&amp;c=s883GpUCOChKOHiocYtGcg&amp;r=c4KON2DiMd-szjwjggQcuUvTsPWblztAL0gVzaHnNmc&amp;m=8LU6rphEJ5GMSXEpSxe8JZ_hpn6TQDUXfjWM6Vt7DdShxnU3X5zYXbAMBLPYchdK&amp;s=TJmr_eC4LAccVY1EqgkLleXfJhUgtIjTJmLc3cedYr0&amp;e=</a> 

But since you're still having question regarding this patch, no rush on
providing your R-bs; let's finish the discussion first.

[...]

</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">+static void postcopy_pause_ram_fast_load(MigrationIncomingState *mis)
+{
+    trace_postcopy_pause_fast_load();
+    qemu_mutex_unlock(&amp;mis-&gt;postcopy_prio_thread_mutex);
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">I may have misunderstood synchronisation here but very very rare chance,

as both threads are working independently is it possible qemu_sem_post on

postcopy_pause_sem_fast_load is called by main thread even before we go

to qemu_sem_wait in next line, causing some kind of deadlock. That's should

not be possible as i understand it requires manually calling
qmp_migration_recover

so chances are almost impossible. Just wanted to confirm it.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Sorry I don't quite get the question, could you elaborate?  E.g., when the
described deadlock happened, what is both main thread and preempt load
thread doing?  What are they waiting at?

Note: we have already released mutex before waiting on sem.</pre>
      </blockquote>
      <p>What i meant here is deadlock could be due the reason that we
        infinately wait</p>
      <p>on qemu_sem_wait(&amp;mis-&gt;postcopy_pause_sem_fast_load),
        because main</p>
      <p>thread already called post on postcopy_pause_sem_fast_load
        after recovery</p>
      <p>even before we moved to
        qemu_sem_wait(&amp;mis-&gt;postcopy_pause_sem_fast_load)</p>
      <p>in next line. Basically if we miss a post on
        postcopy_pause_sem_fast_load.</p>
      <p>This is nearly impossibily case becuase it requires full
        recovery path to be completed</p>
      <p>before this thread executes just next line. Also as recovery
        needs to be called manually,</p>
      <p> So please ignore this.</p>
      <p>Basically i wanted to check if we should use something like</p>
      <pre style="box-sizing: border-box; margin: 0px 0px 10px; padding: 20px; border: 0px; font-size: 12pt; vertical-align: baseline; background-color: var(--gfg-grey-bg); border-radius: 10px; color: rgb(39, 50, 57); font-family: Consolas, monospace; overflow: auto; white-space: pre; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: 0.162px; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">int pthread_cond_wait(pthread_cond_t *restrict cond, 
                   pthread_mutex_t *restrict mutex);
</pre>
      <p>so that there is no race between releasing mutex and calling
        wait.<br>
      </p>
    </blockquote>
    Really sorry, please ignore this it is sem_post and sem_wait so that
    is not possible.<br>
    <blockquote type="cite" cite="mid:85b85303-e4e8-77be-c65d-76018ac7704c@nutanix.com">
      <p> </p>
      <blockquote type="cite" cite="mid:YoJboZoJdPwWpeFe@xz-m1.local">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">+    qemu_sem_wait(&amp;mis-&gt;postcopy_pause_sem_fast_load);
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">Just wanted to confirm why postcopy_pause_incoming is not called here
itself.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">postcopy_pause_incoming() is only used in the main ram load thread, while
this function (postcopy_pause_ram_fast_load) is only called by the preempt
load thread.

</pre>
      </blockquote>
      <p>ok got it, thanks Peter, i meant if we should close both the
        channels as soon</p>
      <p>as we relise there is some failure instead of main thread
        waiting for error event</p>
      <p>and then closing and pausing post-copy. But agree current
        approach is good.<br>
      </p>
      <blockquote type="cite" cite="mid:YoJboZoJdPwWpeFe@xz-m1.local">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Is it based on assumption that if there is error in any of the channel it
will

eventually be paused on source side, closing both channels, resulting

postcopy_pause_incoming will be called from main thread on destination?
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Yes.

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Usually it should be good to call as early as possible. It is left to main

thread default path so that we do not have any synchronisation overhead?
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">What's the sync overhead you mentioned? What we want to do here is simply
to put all the dest QEMU migration threads into a halted state rather than
quitting, so that they can be continued when necessary.

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Also Peter, i was trying to understand postcopy recovery model so is use
case

of qmp_migrate_pause just for debugging purpose?
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Yes.  It's also a way to cleanly stop using the network (comparing to force
unplug the nic ports?) for whatever reason with a shutdown() syscall upon
the socket.  I just don't know whether there's any real use case of that in
reality.

Thanks,

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------3CURzpLvasBtWD3iCk4wkPMM--

